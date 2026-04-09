# Directory Enumeration - /.hidden

## Why is it dangerous ?

In this example, we could read and found the flag that was inside the /.hidden folder. Meaning the attacker can read file that are not referenced in the website. We can imagine that in a real scenario, this folder could contain logs, configs files, README, sensitive keys,... which can lead to other more serious attacks. Which leads to another attack called Broken Access Control.<br>
In any case, a website will always have a robots.txt file. It is public. But providing sensitive path to real folders is a security breach.

## 1 - /.hidden

1. Go to http://DarklyIPaddress/robots.txt
2. We udnerstand that there is a hidden folder. Go inside by entering: http://DarklyIPaddress/.hidden/ in the URL 
3. Create a python script that will look recursively through each directories to extract the content for each README files. If the README contains the word 'Flag' you won.
> [!TIP]
> there are a maximum of 3 depth layers for each directories and there is 28 directories inside of each subdirectories
> Python script are quite faster than shell ones for loops, like in this scenario.

## 2 - Result

The script should download a file containing exactly this:
```
Flag contents: Hey, here is your flag : d5eec3ec36cf80dce44a896f961c1831a05526ec215693c8f2c39543497d4466
```
> [!NOTE]
> This flag was found through this url: http://DarklyAPaddress/.hidden/whtccjokayshttvxycsvykxcfm/igeemtxnvexvxezqwntmzjltkt/lmpanswobhwcozdqixbowvbrhw/README
---

## How to prevent it ? 

- Never expose configuration file or identification file in the webroot
- Deactivate repertory listing
- Don't put sensitive information on path shown in robots.txt file
- Control the access of the sensitive folders, with authentication for example.
- Minimise exposured files by encrypting paths
- Make sure that everyone involved in producing the website is fully aware of what information is considered sensitive. Sometimes seemingly harmless information can be much more useful to an attacker than people realize. Highlighting these dangers can help make sure that sensitive information is handled more securely in general by your organization.
-  Use generic error messages as much as possible. Don't provide attackers with clues about application behavior unnecessarily. 

## References:
[Forced_browsing](https://owasp.org/www-community/attacks/Forced_browsing)

[information-disclosure](https://portswigger.net/web-security/information-disclosure)

[Broken_Access_Control](- https://owasp.org/Top10/A01_2021-Broken_Access_Control/)