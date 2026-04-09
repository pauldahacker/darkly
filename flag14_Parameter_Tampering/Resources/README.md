# Parameter Tampering - Survey

## Why is it dangerous ?

Each time a client is sending information to the server, the server has to check it. Never trust what's the client is sending. Because if it is modifying a field, like we did, then he could send SQL or XSS injection, for example. The data client-side are controllable by the client itself.<br>
Imagine a e-commerce online shop that doesn't verify on the server-side what data the client is sending. Then the client could modify the prices, create big discounts, ... 

## 1 - Survey

1. Go on the survey page and check the code by opening the WebDev Tools (CTRL + SHIFT + I).
2. Check the `<select>` tag. Modify any value sent by a `value` greater than 10.
3. Select this value.

## 2 - Result

You should be redirected on the page that contains the flag.
<p align="center">
  <img src="flag14.png" width="800">
</p>

---

## How to prevent it ? 

- Never trust what the client is sending. Always check what are the value received by the server. And reject values that are not the desired ones.

## References:
[Web_Parameter_Tampering](https://owasp.org/www-community/attacks/Web_Parameter_Tampering)

[Test_Integrity_Checks](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/03-Test_Integrity_Checks)