#!/bin/bash

BASE_URL="$1"
DEST_DIR="$2"

if [[ -z "$BASE_URL" || -z "$DEST_DIR" ]]; then
  echo "Usage: $0 <base_url> <destination_directory>"
  exit 1
fi

mkdir -p "$DEST_DIR"

# Temporary file to hold URLs to process
URLS_TO_PROCESS="urls_to_process.txt"
> "$URLS_TO_PROCESS"

# Start with base URL
echo "$BASE_URL" > "$URLS_TO_PROCESS"

# Temporary file to hold already processed URLs
PROCESSED_URLS="processed_urls.txt"
> "$PROCESSED_URLS"

count=1

while [[ -s "$URLS_TO_PROCESS" ]]; do
  # Read and remove first URL from the list
  current_url=$(head -n 1 "$URLS_TO_PROCESS")
  sed -i '1d' "$URLS_TO_PROCESS"

  # Skip if already processed
  if grep -Fxq "$current_url" "$PROCESSED_URLS"; then
    continue
  fi

  echo "Processing $current_url"
  
  # Download the page listing (HTML)
  page_html=$(mktemp)
  wget -q -O "$page_html" "$current_url"

  # Mark this URL as processed
  echo "$current_url" >> "$PROCESSED_URLS"

  # Extract href links from page_html
  # This regex looks for href="something" (basic and might not cover all edge cases)
  links=$(grep -oP '(?<=href=")[^"]+' "$page_html")

  # Look for README files to download
  for link in $links; do
    # Normalize URL if relative
    if [[ "$link" != http* ]]; then
      # Handle relative paths carefully
      # Remove trailing slash from current_url if exists
      base="${current_url%/}"
      full_url="$base/$link"
    else
      full_url="$link"
    fi

    # Remove URL parameters or anchors for safety
    full_url="${full_url%%[\?#]*}"

    # If link is README file (case sensitive)
    if [[ $(basename "$full_url") == "README" ]]; then
      echo "Downloading README: $full_url"

      # Download README content to a file named uniquely
      # Build a safe filename from URL path parts:
      # Remove base URL prefix from full_url
      relpath="${full_url#"$BASE_URL"}"
      relpath="${relpath#/}"  # remove leading slash if any
      safe_filename=$(echo "$relpath" | tr '/ ' '__')

      # Add count suffix to ensure unique filename
      filename="README_${safe_filename}_$count"

      wget -q -O "$DEST_DIR/$filename" "$full_url" && echo "Saved to $DEST_DIR/$filename"

      ((count++))
    fi

    # If link ends with a slash, consider it a directory and add to URLs to process
    if [[ "$link" == */ ]]; then
      # Normalize directory URL
      if [[ "$link" != http* ]]; then
        dir_url="$base/$link"
      else
        dir_url="$link"
      fi

      # Avoid duplicates in URLs to process and processed
      if ! grep -Fxq "$dir_url" "$URLS_TO_PROCESS" && ! grep -Fxq "$dir_url" "$PROCESSED_URLS"; then
        echo "$dir_url" >> "$URLS_TO_PROCESS"
      fi
    fi
  done

  rm "$page_html"
done

rm "$URLS_TO_PROCESS" "$PROCESSED_URLS"

echo "Done downloading all README files."

