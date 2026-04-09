# Exposure of sensitive files - /robots.txt & /admin panel

## Why is it dangerous ?
The path listed in robots.txt are pointing directly to what the attacker wants. In this example, we can easily download htpasswd file and then connect as a root/admin. The impact is critical because if the attacker succeed to be admin you can do whatever you want. For example, change other user passwords, modify datas, deplay backdoors, download all sensitive data,...<br>
Secondly, it is important to not display admin panel page in the webroot. Attackers could brute force it in order to access to the admin account.

## 1 - How to get the flag ?

1. Go to: `http://DarklyIPaddress/robots.txt`
2. You can see that there are two interesting folders. For this flag, `/whatever` interests us. So go to: `http://DarklyIPaddress/whatever/`
3. Click on `htpasswd` -> it should directly download a file called `htpasswd`
4. Inside of this file, you can see the content: `root:437394baff5aa33daa618be47b75cb49`
	This means that `root` is the username, and everything at the right of the `:` is the encrypted password.
5. then use the [MD5 cracker tool](https://crackstation.net/) to decrypt hashed string. The password should be: `qwerty123@`
6. Now that you have the user and password, and you guess that the user has high privileges, go to `http://DarklyIPaddress/admin`
7. In login put `root` and in password put `qwerty123@`
8. click on `login` button

## 2 - Result

You should be redirected on the page that contains the flag.
<p align="center">
  <img src="flag02.png" width="800">
</p>

## How to prevent it ? 

- Never expose configuration file or identification file in the webroot
- Deactivate repertory listing
- Don't put sensitive information on path shown in robots.txt file

## References:
[Review_Webserver_Metafiles_for_Information_Leakage](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/03-Review_Webserver_Metafiles_for_Information_Leakage)

[Insecure_Direct_Object_References](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/05-Authorization_Testing/04-Testing_for_Insecure_Direct_Object_References)
