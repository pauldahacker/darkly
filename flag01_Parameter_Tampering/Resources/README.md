# Parameter Tampering - I forgot my password

## Why is it dangerous ?

Each time a client is sending information to the server, the server has to check it. Never trust what's the client is sending. Because if it is modifying a field, like we did, then he could send SQL or XSS injection, for example. The data client-side are controllable by the client itself.
Imagine a e-commerce online shop that doesn't verify on the server-side what data the client is sending. Then the client could modify the prices, create big discounts, ... 

## 1 - I forgot my password

1. Go to the recover password page, by clicking on 'I forgot my password', after having clicked on 'Sign In' button in the homepage
2. Open the web developer tools with CTRL + SHIFT + I
3. Pick the 'Submit' button to inspect 
	You can see that the code is written like this: `<input type="hidden" name="mail" value="webmaster@borntosec.com" maxlength="15">`
4. Remove `hidden` to let `type=""`, then make sure there is no more than 15 caracters in the input box
5. Click on Submit button

## 2 - Result

You should be redirected on the page that contains the flag.
<p align="center">
  <img src="flag01.png" width="800">
</p>

---

## How to prevent it ? 

- Never trust what the client is sending. Always check what are the value received by the server. And reject values that are not the desired ones.
- Never store sensitive data on the client-side

## References:
[Web_Parameter_Tampering](https://owasp.org/www-community/attacks/Web_Parameter_Tampering)

[Test_Integrity_Checks](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/03-Test_Integrity_Checks)