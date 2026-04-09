# Darkly

Darkly is an educational exercise in the 42 curriculum aimed at understanding common vulnerabilities in web applications. By auditing a deliberately vulnerable application, this project aims to teach how to recognize and exploit flaws (XSS, injections, poor authentication management, etc.), understand OWASP recommendations, and propose corrective measures. This repository contains my notes, testing methods, and write-ups of the flags collected during the project.

## Darkly VM Setup Guide

### Goal

Download the Darkly ISO, create a VirtualBox VM, attach the ISO, and configure a bridged network so the VM and your host appear on the same LAN (same subnet) and can reach each other directly.

To download Darkly iso: https://cdn.intra.42.fr/isos/Darkly_i386.iso

### Configuring a Bridged Network (VirtualBox) — Quick Instructions

Follow these steps to place the VM and host on the same LAN/subnet.

#### Configuration Steps

1. **Open VirtualBox → Settings** (for your VM where you installed darkly.iso image) → **Network**

2. **Adapter 1** → Enable Network Adapter
   - **Attached to:** Bridged Adapter
   - **Name:** Select your host's physical interface (e.g., eth0, enp3s0, Wi-Fi)
   - **Promiscuous Mode:** Deny (or Allow VMs if needed)
   - **Cable Connected:** Checked

3. **Click OK/Save**

4. **Start the VM**

5. **Access the darkly_IP_Adress in your web browser**

<p align="center">
  <img src="prerequisites/darkly_img.png" width="800">
</p>

#### Network Configuration

- If the VM uses DHCP, it should obtain an IP from the same network as the host.
- If necessary, configure a static IP in the VM (gateway and netmask must match the host network).

> [!TIP]
> Use the exact same network for the local machine and the VM. Don't use a VPN. <br>
> Access the site in **HTTP**.

> [!TIP]
> Check inside each folder vulnerability to see the full documentation.

## Final score
<div align=center>
<img src="https://github.com/SimonIsCoding/utils_and_random/blob/main/ft_irc_grade.png"/>
</div>

## Flag 01 - Parameter Tampering - I forgot my password
Refs:<br>
[Web_Parameter_Tampering](https://owasp.org/www-community/attacks/Web_Parameter_Tampering)

[Test_Integrity_Checks](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/03-Test_Integrity_Checks)

## Flag 02 - Exposure of sensitive files - /robots.txt & /admin panel
Refs:<br>
[Review_Webserver_Metafiles_for_Information_Leakage](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/03-Review_Webserver_Metafiles_for_Information_Leakage)

[Insecure_Direct_Object_References](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/05-Authorization_Testing/04-Testing_for_Insecure_Direct_Object_References)

## Flag 03 - Cookie Tampering - I_am_admin
Refs:<br>
[Session_Management_Cheat_Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#cookies)

[Cookie_Theft_Mitigation_Cheat_Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cookie_Theft_Mitigation_Cheat_Sheet.html)

## Flag 04 - UNION-based SQL Injection - Image number
Refs:<br>
[examining-the-database](https://portswigger.net/web-security/sql-injection/examining-the-database)

[union-based-injection](https://hackviser.com/tactics/pentesting/web/sql-injection#union-based-injection)

[SQL_Injection_Prevention_Cheat_Sheet](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)

## Flag 05 - UNION-based SQL Injection - Search Member by ID
Refs:<br>
[examining-the-database](https://portswigger.net/web-security/sql-injection/examining-the-database)

[union-based-injection](https://hackviser.com/tactics/pentesting/web/sql-injection#union-based-injection)

[SQL_Injection_Prevention_Cheat_Sheet](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)

## Flag 06 - Directory Traversal - URL Route http://darklyIPaddress/../../
Refs:<br>
[Path_Traversal](https://owasp.org/www-community/attacks/Path_Traversal)

[file-path-traversal](https://portswigger.net/web-security/file-path-traversal)

[01-Testing_Directory_Traversal_File_Include](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/05-Authorization_Testing/01-Testing_Directory_Traversal_File_Include)

## Flag 07 - Unrestricted file upload - Submit Image with php code integrated
Refs:<br>
[File_Upload_Cheat_Sheet](https://cheatsheetseries.owasp.org/cheatsheets/File_Upload_Cheat_Sheet.html)

[file-upload](https://portswigger.net/web-security/file-upload)

[Unrestricted_File_Upload](https://owasp.org/www-community/vulnerabilities/Unrestricted_File_Upload)

## Flag 08 - BruteForce - Login page 
> [!TIP]
> Use the most famous password's dictionnary 

Refs:<br>
[Brute_force_attack](https://owasp.org/www-community/attacks/Brute_force_attack)

[Intruder_getting_started](https://portswigger.net/burp/documentation/desktop/tools/intruder/getting-started) - Useful only if you want to use [Burp Suite Tool](https://portswigger.net/burp/releases/community/latest)

## Flag 09 - Stored XSS - Leave a feedback
Refs:<br>
[02-Testing_for_Stored_Cross_Site_Scripting](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/02-Testing_for_Stored_Cross_Site_Scripting)

[cross-site-scripting](https://portswigger.net/web-security/cross-site-scripting)

## Flag 10 - Open Redirect - Check Homepage source Code
Refs:<br>
[Testing_for_Client_Side_URL_Redirect](https://owasp.org/www-project-web-security-testing-guide/v41/4-Web_Application_Security_Testing/Client_Side_Testing/04-Testing_for_Client_Side_URL_Redirect)

[Unvalidated_Redirects_and_Forwards_Cheat_Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html)

## Flag 11 - Directory Enumeration - /.hidden
Refs:<br>
[Forced_browsing](https://owasp.org/www-community/attacks/Forced_browsing)

[information-disclosure](https://portswigger.net/web-security/information-disclosure)

## Flag 12 - HTTP header spoofing - Copyright Icon
Refs:<br>
[HTTP_Headers_Cheat_Sheet](https://cheatsheetseries.owasp.org/cheatsheets/HTTP_Headers_Cheat_Sheet.html)

[bypassing-referer-based-defenses](https://portswigger.net/web-security/csrf/bypassing-referer-based-defenses)

## Flag 13 - XSS - NSA image
Refs:<br>
[Preventing_cross-site-scripting](https://portswigger.net/web-security/cross-site-scripting/preventing)

[DOM_based_XSS_Prevention_Cheat_Sheet](https://cheatsheetseries.owasp.org/cheatsheets/DOM_based_XSS_Prevention_Cheat_Sheet.html)

## Flag 14 - Parameter Tampering - Survey
Refs:<br>
[Web_Parameter_Tampering](https://owasp.org/www-community/attacks/Web_Parameter_Tampering)

[Test_Integrity_Checks](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/03-Test_Integrity_Checks)

## Tools I used:
[SHA256 Encoder](https://emn178.github.io/online-tools/sha256.html)

[Password Hash Cracker](https://crackstation.net/)

[hash identifier](https://hashes.com/en/tools/hash_identifier)

[Burp Suite Community Edition](https://portswigger.net/burp/releases/community/latest)

[base64 encoder](https://www.base64encode.org/)

[MD5 encryptor tool](https://www.md5hashgenerator.com/)
