--Question 1: Enforce referential integrity by adding foreign key constraints
ALTER TABLE ORDERS
ADD CONSTRAINT FK_ORDERS_USER
FOREIGN KEY (USERID)
REFERENCES USERBASE(USERID);

ALTER TABLE ORDERS
ADD CONSTRAINT FK_ORDERS_PRODUCT
FOREIGN KEY (PRODUCTCODE)
REFERENCES PRODUCTLIST(PRODUCTCODE);

ALTER TABLE REVIEWS
ADD CONSTRAINT FK_REVIEWS_USER
FOREIGN KEY (USERID)
REFERENCES USERBASE(USERID);

ALTER TABLE REVIEWS
ADD CONSTRAINT FK_REVIEWS_PRODUCT
FOREIGN KEY (PRODUCTCODE)
REFERENCES PRODUCTLIST(PRODUCTCODE);

ALTER TABLE USERLIBRARY
ADD CONSTRAINT FK_USERLIBRARY_USER
FOREIGN KEY (USERID)
REFERENCES USERBASE(USERID);

ALTER TABLE USERLIBRARY
ADD CONSTRAINT FK_USERLIBRARY_PRODUCT
FOREIGN KEY (PRODUCTCODE)
REFERENCES PRODUCTLIST(PRODUCTCODE);

-- Question 2: Display the full name and username of users who are at least 18 years old

SELECT FIRSTNAME, LASTNAME, USERNAME
FROM USERBASE
WHERE ADD_MONTHS(BIRTHDAY, 12 * 18) <= SYSDATE;

-- Question 3: Display the maximum and average length of usernames in the userbase table
SELECT MAX(LENGTH(USERNAME)) AS MAX_USERNAME_LENGTH,
AVG(LENGTH(USERNAME)) AS AVG_USERNAME_LENGTH
FROM USERBASE;

--Question 4: Display weak security questions
SELECT QUESTION
FROM SECURITYQUESTION
WHERE QUESTION LIKE 'What is%'
OR QUESTION LIKE 'What was%';

--Question 5: Display product code, lowest rating, and number of reviews for each product in the reviews table.
SELECT PRODUCTCODE, MIN(RATING) AS LOWEST_RATING,
COUNT (*) AS REVIEW_COUNT
FROM REVIEWS
GROUP BY PRODUCTCODE
ORDER BY REVIEW_COUNT DESC;

--Question 6: Display product code at Position 1 as well as users that have the product ranked there in the wishlist table
SELECT COUNT (*) AS USERCOUNT, PRODUCTCODE
FROM WISHLIST
WHERE POSITION = 1
GROUP BY PRODUCTCODE;


--Question 7: UserID and amount spent by users in the orders table
SELECT USERID, SUM(PRICE) AS TOTAL_SPENT
FROM ORDERS
GROUP BY USERID;

--Question 8: Display the most profitable days by showing gross profits by purchase date
SELECT PURCHASEDATE, SUM(PRICE) AS TOTAL_SPENT
FROM ORDERS
GROUP BY PURCHASEDATE
ORDER BY TOTAL_SPENT DESC;

--Question 9: Display product code and hours played from user library, and limit the results to the top 5 games
SELECT PRODUCTCODE, SUM(HOURSPLAYED) AS TOTAL_PLAYED
FROM USERLIBRARY
GROUP BY PRODUCTCODE
ORDER BY TOTAL_PLAYED DESC;

--Question 10: Create view showing list of userids and the count of infractions
CREATE VIEW BAN_NEEDED AS
SELECT USERID, COUNT (*) AS NUMOFINF
FROM INFRACTIONS
GROUP BY USERID;

SELECT *
FROM BAN_NEEDED
ORDER BY NUMOFINF DESC;

--Question 11: Create a view displaying each userid, the rulenum, and the number of times the rulenum was broken by the user
CREATE VIEW RULE_BREAKS AS
SELECT USERID, RULENUM, COUNT(RULENUM) AS TOTAL_INFRAC
FROM INFRACTIONS
GROUP BY RULENUM, USERID
ORDER BY USERID ASC;

SELECT *
FROM RULE_BREAKS
ORDER BY USERID ASC;

--Question 12: Display every rulenum, every penalty assigned to that rulenum, and the number of times that penalty was assigned
SELECT RULENUM, PENALTY, COUNT(*) AS NUM_OF_PENALTIES
FROM INFRACTIONS
GROUP BY RULENUM, PENALTY;

--Question 13: Display the average, maximum, and minimum time between the dateupdated and datesubmitted for all tickets with a status of closed
SELECT AVG(DATEUPDATED - DATESUBMITTED) AS AVG_TIME,
MAX(DATEUPDATED - DATESUBMITTED) AS MAX_TIME,
MIN(DATEUPDATED - DATESUBMITTED) AS MIN_TIME
FROM USERSUPPORT
WHERE STATUS = 'CLOSED';

--Question 14: Display the email, issue, and count of times the issue was submitted for all tickets with a status of new
SELECT EMAIL, ISSUE, COUNT(ISSUE) AS SUBMITTED_ISSUES
FROM USERSUPPORT
WHERE STATUS = 'NEW'
GROUP BY DATESUBMITTED, EMAIL, ISSUE
ORDER BY SUBMITTED_ISSUES;

--Question 15: Display users whose firstname or lastname appears in their password
SELECT USERID, FIRSTNAME, LASTNAME, PASSWORD
FROM USERBASE
WHERE PASSWORD LIKE '%' || FIRSTNAME || '%'
OR PASSWORD LIKE '%' || LASTNAME || '%';

--Question 16: Display every publisher and average price of their products
SELECT PUBLISHER, AVG(PRICE) AS AVG_PRICE
FROM PRODUCTLIST
GROUP BY PRICE, PUBLISHER
ORDER BY PUBLISHER ASC;

--Question 17: Create a view that displays the product name and price for all products with a release date over 5 years ago
-- Also, apply a 25% discount to the price
CREATE VIEW DISCOUNT_GAMES AS
SELECT PRODUCTNAME, PRICE * 0.75 AS DISC_PRICE
FROM PRODUCTLIST
WHERE RELEASEDATE < ADD_MONTHS(SYSDATE, -60);

SELECT PRODUCTNAME, DISC_PRICE
FROM DISCOUNT_GAMES;

--Question 18: Calculate the maximum and minimum price of all products based on genre
SELECT GENRE, MAX(PRICE) AS MAX_PRICE, MIN(PRICE) AS MIN_PRICE
FROM PRODUCTLIST
GROUP BY GENRE;

--Question 19: Create a view that displays everything in the chatlog table that were sent between now and last week
CREATE VIEW LAST_WEEKS_MESSAGES AS
SELECT *
FROM CHATLOG
WHERE DATESENT < ADD_MONTHS(SYSDATE, -0.23);

SELECT *
FROM LAST_WEEKS_MESSAGES;

--Question 20: Create a view that displays the userid, dateassigned, and penalty for any user whose penalty is not null
--and the infraction was assigned within the last month
CREATE VIEW LAST_MONTHS_PENALTIES AS
SELECT USERID, DATEASSIGNED, PENALTY
FROM INFRACTIONS
WHERE (PENALTY != NULL)
AND DATEASSIGNED < ADD_MONTHS (SYSDATE, -1);

SELECT *
FROM LAST_MONTHS_PENALTIES;