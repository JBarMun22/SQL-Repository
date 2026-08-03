-- Question 1: Display database user information
SELECT USER_ID, USERNAME, CREATED, PASSWORD_CHANGE_DATE
FROM USER_USERS;

-- Question 2: Display all tables
SELECT *
FROM USER_TABLES;

-- Question 3: Describe Commands
--A. Orders
DESCRIBE ORDERS;
--B. Product list
DESCRIBE PRODUCTLIST;
--C. Reviews
DESCRIBE REVIEWS;
--D. Storefront
DESCRIBE STOREFRONT;
--E. Userbase
DESCRIBE USERBASE;
--F. User Library
DESCRIBE USERLIBRARY;

-- Question 4: Display all data present in the database
--A. Orders
SELECT *
FROM ORDERS;
--B. Product List
SELECT *
FROM PRODUCTLIST;
--C. Reviews
SELECT *
FROM REVIEWS;
--D. Storefront
SELECT *
FROM STOREFRONT;
--E. Userbase
SELECT *
FROM USERBASE;
--F. User Library
SELECT *
FROM USERLIBRARY;

-- Question 5: What constraints are present in database?
SELECT TABLE_NAME, CONSTRAINT_NAME,
CONSTRAINT_TYPE, STATUS
FROM USER_CONSTRAINTS;

-- Question 6: What views are present in database?
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS;

--Question 7: Display every username in alphabetical order
SELECT USERNAME
FROM USERBASE
ORDER BY USERNAME;

--Question 8: Display the information of every user with a YAHOO email
SELECT FIRSTNAME,
LASTNAME,
USERNAME,
PASSWORD,
EMAIL
FROM USERBASE
WHERE EMAIL LIKE '%yahoo.com';

--Question 9: Display information of user who has less than $25
SELECT USERNAME, BIRTHDAY, WALLETFUNDS
FROM USERBASE
WHERE WALLETFUNDS < 25;

-- Question 10: Display userid and product code of users with more than 100 hours played
SELECT USERID, PRODUCTCODE
FROM USERLIBRARY
WHERE HOURSPLAYED > 100;

-- Question 11: Display product code of any game with less than 10 hours played
SELECT PRODUCTCODE
FROM USERLIBRARY
WHERE HOURSPLAYED < 10;

--Question 12: Display every unique publisher
SELECT PUBLISHER
FROM PRODUCTLIST;

--Question 13: Display the information of all products sorted by genre
SELECT PRODUCTNAME, RELEASEDATE,
PUBLISHER, GENRE
FROM PRODUCTLIST
ORDER BY GENRE;

--Question 14: Display the product code and publisher of any product in the strategy genre
SELECT PRODUCTCODE, PUBLISHER
FROM PRODUCTLIST
WHERE GENRE = 'Strategy';

--Question 15: Display product code, description, and price for any product that costs more than $25 and sorted by descending price.
SELECT PRODUCTCODE, DESCRIPTION, PRICE
FROM STOREFRONT
WHERE PRICE > 25
ORDER BY PRICE DESC;

--Question 16: Display the inventory id and price of all products in the storefront table, sorted by ascending price
SELECT INVENTORYID, PRICE
FROM STOREFRONT
ORDER BY PRICE ASC;

--Question 17: Display the product code and review of any product with a rating of 1.
SELECT PRODUCTCODE, REVIEW
FROM REVIEWS
WHERE RATING = 1;

--Question 18: Display the product code and review of any product with a rating of 4 or higher
SELECT PRODUCTCODE, REVIEW
FROM REVIEWS
WHERE RATING >= 4;

--Question 19: Display every unique USERID from users who have placed an order
SELECT DISTINCT USERID
FROM ORDERS;

--Question 20: Display all order data, sorted by the earliest purchase date
SELECT *
FROM ORDERS
ORDER BY PURCHASEDATE ASC;