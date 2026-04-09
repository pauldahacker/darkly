# UNION-based SQL Injection - Image number

## Why is it dangerous ?

This let the attacker execute random query in the database. He can then read/write/modify/erase data in the database. If the attacker can execute it with an admin privilege, then the impact is fully damageable — potential takeover of application storage or even the server

## 1 - How to get the flag ?

1. In the homepage, click on Search Image button
	- By searching: 1, then 2, then ... until 5 -> you get an indication that the flag can be hidden in the number 5 image
2. In the input box, write `5 union select user(), database()`, then press submit button. By doing this you want to get the info of the database, to know how it is structured
	- it can be potentially SQL injected. Let's dive deeper to know it
	- Then you can also see that the title is `Member_images` for image number 5. This will help us for the future.
3. In the input box, write '5 union select table_name, table_schema FROM information_schema.tables'
	- WHY this input ? This is written in the PHP manual
	- It will give all the information about how are structured the tables in the database 
		- look for `Member_images` section
	- It gives you another information which is the URL called `list_images`
4. Now we want to know how is specific list_images table is structured:
	- In the input box, write `5 union select COLUMN_NAME, table_name FROM information_schema.columns`
	- It will give you how every `COLUMN_NAME` are structured 
	- Find the list_images one, because this is the one that interests us
	You can see that it is divided in 4 parts: `id`, `url`, `title`, `comment`
5. Then try to look for the information for each component of list_images. For example, in the input box, write `5 union select title, comment FROM list_images`
	- then read all the info and you should get the flag

## 2 - Result

You should be able to read this to get the flag.
<p align="center">
  <img src="flag04.png" width="800">
</p>

> [!NOTE]
> the flag is `f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188`

## How to prevent it ? 

- parameterized queries. 
- Validate and standardize input

## References:
[examining-the-database](https://portswigger.net/web-security/sql-injection/examining-the-database)

[union-based-injection](https://hackviser.com/tactics/pentesting/web/sql-injection#union-based-injection)

[SQL_Injection_Prevention_Cheat_Sheet](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)