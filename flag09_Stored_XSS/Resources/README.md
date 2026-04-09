# Stored XSS - Leave a feedback

## Why is it dangerous ?
In order for an XSS attack to be successful, an attacker must be able to insert and execute malicious content in a webpage. Thus, all variables in a web application needs to be protected. 
XSS attacks are serious and can lead to account impersonation, observing user behaviour, loading external content, stealing sensitive data, and more.

This vulnerability can be used to conduct a number of browser-based attacks including:

- Hijacking another user’s browser
- Capturing sensitive information viewed by application users
- Pseudo defacement of the application
- Port scanning of internal hosts (“internal” in relation to the users of the web application)
- Directed delivery of browser-based exploits
- Other malicious activities

## 1 - Find the flag

1. In the homepage, click on `Leave a Feedback` button
2. On name input, put anything you want
3. On Message, write: `script`
4. Press 'SIGN GUESTBOOK' button

> [!NOTE]
> 
> Before, in the message input, we tried:
> ```html
> <script>alert("whatever")</script>
> ```
> 
> to see how it behaved. By writing `<script>`, we saw that it erased it as if it was not there, to avoid XSS, but not `script` itself.
> 
> So if we find a way to create a script without writing exactly `<script>`, then it is XSS hackable.

## 2 - Result

You should be redirected on the page that contains the flag.
<p align="center">
  <img src="flag09.png" width="800">
</p>

## How to prevent it ? 

- Encode everything on a server-side. Never trust what the client is sending. Filter as strictly as possible based on what is expected or valid input.
-  Use appropriate response headers. To prevent XSS in HTTP responses that aren't intended to contain any HTML or JavaScript, you can use the Content-Type and X-Content-Type-Options headers to ensure that browsers interpret the responses in the way you intend. 
-  Content Security Policy. As a last line of defense, you can use Content Security Policy (CSP) to reduce the severity of any XSS vulnerabilities that still occur. 

## References:
[02-Testing_for_Stored_Cross_Site_Scripting](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/02-Testing_for_Stored_Cross_Site_Scripting)

[cross-site-scripting](https://portswigger.net/web-security/cross-site-scripting)

## Other (long) refs:
[Cross_Site_Scripting_Prevention_Cheat_Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html)

[XSS_Filter_Evasion_Cheat_Sheet](https://cheatsheetseries.owasp.org/cheatsheets/XSS_Filter_Evasion_Cheat_Sheet.html)