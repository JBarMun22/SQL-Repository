-- Question 1: Add PRICE and DESCRIPTION columns to PRODUCTLIST

ALTER TABLE PRODUCTLIST
ADD (
    PRICE NUMBER(6,2),
    DESCRIPTION VARCHAR2(250)
);
```sql
-- Question 1: Move STOREFRONT price and description data into PRODUCTLIST

-- GAME1
UPDATE PRODUCTLIST
SET PRICE = 22.22
WHERE PRODUCTCODE = 'GAME1';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'The next big indie game of the year!'
WHERE PRODUCTCODE = 'GAME1';


-- GAME2
UPDATE PRODUCTLIST
SET PRICE = 65.43
WHERE PRODUCTCODE = 'GAME2';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'One of these things is NOT like the other…'
WHERE PRODUCTCODE = 'GAME2';


-- GAME3
UPDATE PRODUCTLIST
SET PRICE = 18.92
WHERE PRODUCTCODE = 'GAME3';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'Do you like building? Resource Collecting? Civilization Management? This is the game for you!'
WHERE PRODUCTCODE = 'GAME3';


-- GAME4
UPDATE PRODUCTLIST
SET PRICE = 27.25
WHERE PRODUCTCODE = 'GAME4';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'The greatest follow-up to Heist Auto III.'
WHERE PRODUCTCODE = 'GAME4';


-- GAME5
UPDATE PRODUCTLIST
SET PRICE = 55.99
WHERE PRODUCTCODE = 'GAME5';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'A little bit of puzzle, a lot of momentum. Don''t be left behind and make your way through the Doorway.'
WHERE PRODUCTCODE = 'GAME5';


-- GAME6
UPDATE PRODUCTLIST
SET PRICE = 75.00
WHERE PRODUCTCODE = 'GAME6';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'Gather a group of friends and secure the strongest bunker on the server.'
WHERE PRODUCTCODE = 'GAME6';


-- GAME7
UPDATE PRODUCTLIST
SET PRICE = 5.98
WHERE PRODUCTCODE = 'GAME7';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'There can only be one lord. Will it be you?'
WHERE PRODUCTCODE = 'GAME7';


-- GAME8
UPDATE PRODUCTLIST
SET PRICE = 118.56
WHERE PRODUCTCODE = 'GAME8';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'Take the table to the internet! Now experience a virtual playspace for you and your buddies.'
WHERE PRODUCTCODE = 'GAME8';


-- GAME9
UPDATE PRODUCTLIST
SET PRICE = 33.48
WHERE PRODUCTCODE = 'GAME9';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'Will this series ever end? Of course not! Play the next big town management game here!'
WHERE PRODUCTCODE = 'GAME9';


-- RPG10
UPDATE PRODUCTLIST
SET PRICE = 12.25
WHERE PRODUCTCODE = 'RPG10';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'The greatest musical composers came together to make this not only visually appealing, but an auditory masterpiece.'
WHERE PRODUCTCODE = 'RPG10';


-- PZL11
UPDATE PRODUCTLIST
SET PRICE = 190.11
WHERE PRODUCTCODE = 'PZL11';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'Platformers? No Way! Puzzles are the way to go.'
WHERE PRODUCTCODE = 'PZL11';


-- GME12
UPDATE PRODUCTLIST
SET PRICE = 35.27
WHERE PRODUCTCODE = 'GME12';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'A beautiful stylized game that takes you on through a mysterious adventure.'
WHERE PRODUCTCODE = 'GME12';


-- GME13
UPDATE PRODUCTLIST
SET PRICE = 49.97
WHERE PRODUCTCODE = 'GME13';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'Take turns between you and the enemy! Fight offline and online in Loudest World!'
WHERE PRODUCTCODE = 'GME13';


-- VNL14
UPDATE PRODUCTLIST
SET PRICE = 72.26
WHERE PRODUCTCODE = 'VNL14';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'Click your way through this visual novel where your choice ultimately matter!'
WHERE PRODUCTCODE = 'VNL14';


-- GME15
UPDATE PRODUCTLIST
SET PRICE = 50.01
WHERE PRODUCTCODE = 'GME15';

UPDATE PRODUCTLIST
SET DESCRIPTION = 'A solid choice every time. Every game is like stepping into a whole new world.'
WHERE PRODUCTCODE = 'GME15';

COMMIT;
```
-- Question 2: Create the CHATLOG table

CREATE TABLE CHATLOG
(
    CHATID NUMBER(3),
    RECEIVERID NUMBER(3),
    SENDERID NUMBER(3),
    DATESENT DATE,
    CONTENT VARCHAR2(250),

    CONSTRAINT PK_CHATLOG
        PRIMARY KEY (CHATID),

    CONSTRAINT FK_CHATLOG_RECEIVER
        FOREIGN KEY (RECEIVERID)
        REFERENCES USERBASE(USERID),

    CONSTRAINT FK_CHATLOG_SENDER
        FOREIGN KEY (SENDERID)
        REFERENCES USERBASE(USERID)
);
-- Question 2: Insert sample data into CHATLOG

INSERT INTO CHATLOG VALUES
(1, 101, 102, TO_DATE('01-AUG-2026','DD-MON-YYYY'), 'Hey! Are you playing anything good lately?');

INSERT INTO CHATLOG VALUES
(2, 102, 101, TO_DATE('02-AUG-2026','DD-MON-YYYY'), 'Yeah! I have been playing Understory.');

INSERT INTO CHATLOG VALUES
(3, 103, 104, TO_DATE('03-AUG-2026','DD-MON-YYYY'), 'Want to play together sometime?');

INSERT INTO CHATLOG VALUES
(4, 104, 103, TO_DATE('03-AUG-2026','DD-MON-YYYY'), 'Sure! Let me know when you are available.');

INSERT INTO CHATLOG VALUES
(5, 105, 106, TO_DATE('04-AUG-2026','DD-MON-YYYY'), 'Have you seen the new games in the store?');

INSERT INTO CHATLOG VALUES
(6, 106, 105, TO_DATE('04-AUG-2026','DD-MON-YYYY'), 'Not yet. I will check them out.');

INSERT INTO CHATLOG VALUES
(7, 107, 108, TO_DATE('05-AUG-2026','DD-MON-YYYY'), 'Do you want to join my game later?');

INSERT INTO CHATLOG VALUES
(8, 108, 107, TO_DATE('05-AUG-2026','DD-MON-YYYY'), 'Absolutely! Send me an invite.');

INSERT INTO CHATLOG VALUES
(9, 109, 110, TO_DATE('06-AUG-2026','DD-MON-YYYY'), 'I just finished a new game.');

INSERT INTO CHATLOG VALUES
(10, 110, 109, TO_DATE('06-AUG-2026','DD-MON-YYYY'), 'Nice! Was it worth playing?');

COMMIT;

-- Question 3: Create the FRIENDSLIST table

CREATE TABLE FRIENDSLIST
(
    USERID NUMBER(3),
    FRIENDID NUMBER(3),

    CONSTRAINT PK_FRIENDSLIST
        PRIMARY KEY (USERID, FRIENDID),

    CONSTRAINT FK_FRIENDSLIST_USER
        FOREIGN KEY (USERID)
        REFERENCES USERBASE(USERID),

    CONSTRAINT FK_FRIENDSLIST_FRIEND
        FOREIGN KEY (FRIENDID)
        REFERENCES USERBASE(USERID)
);

-- Question 3: Insert sample data into FRIENDSLIST

INSERT INTO FRIENDSLIST VALUES (101, 102);
INSERT INTO FRIENDSLIST VALUES (101, 103);
INSERT INTO FRIENDSLIST VALUES (102, 104);
INSERT INTO FRIENDSLIST VALUES (102, 105);
INSERT INTO FRIENDSLIST VALUES (103, 106);
INSERT INTO FRIENDSLIST VALUES (104, 107);
INSERT INTO FRIENDSLIST VALUES (105, 108);
INSERT INTO FRIENDSLIST VALUES (106, 109);
INSERT INTO FRIENDSLIST VALUES (107, 110);
INSERT INTO FRIENDSLIST VALUES (108, 111);

COMMIT;

-- Question 4: Create the WISHLIST table

CREATE TABLE WISHLIST
(
    USERID NUMBER(3),
    PRODUCTCODE VARCHAR2(5),
    POSITION NUMBER(3),

    CONSTRAINT PK_WISHLIST
        PRIMARY KEY (USERID, PRODUCTCODE),

    CONSTRAINT FK_WISHLIST_USER
        FOREIGN KEY (USERID)
        REFERENCES USERBASE(USERID),

    CONSTRAINT FK_WISHLIST_PRODUCT
        FOREIGN KEY (PRODUCTCODE)
        REFERENCES PRODUCTLIST(PRODUCTCODE)
);

-- Question 4: Insert sample data into WISHLIST

INSERT INTO WISHLIST VALUES (101, 'GAME7', 1);
INSERT INTO WISHLIST VALUES (101, 'GAME3', 2);
INSERT INTO WISHLIST VALUES (101, 'GAME9', 3);

INSERT INTO WISHLIST VALUES (102, 'GAME6', 1);
INSERT INTO WISHLIST VALUES (102, 'GME15', 2);

INSERT INTO WISHLIST VALUES (103, 'GAME4', 1);
INSERT INTO WISHLIST VALUES (103, 'GAME8', 2);

INSERT INTO WISHLIST VALUES (104, 'RPG10', 1);
INSERT INTO WISHLIST VALUES (105, 'GAME2', 1);
INSERT INTO WISHLIST VALUES (106, 'PZL11', 1);

COMMIT;

-- Question 5: Create the USERPROFILE table

CREATE TABLE USERPROFILE
(
    USERID NUMBER(3),
    IMAGEFILE VARCHAR2(250),
    DESCRIPTION VARCHAR2(250),

    CONSTRAINT PK_USERPROFILE
        PRIMARY KEY (USERID),

    CONSTRAINT FK_USERPROFILE_USER
        FOREIGN KEY (USERID)
        REFERENCES USERBASE(USERID)
);

-- Question 5: Insert sample data into USERPROFILE

INSERT INTO USERPROFILE VALUES
(101, '/profiles/ashley/profile.jpg', 'I enjoy playing indie and adventure games.');

INSERT INTO USERPROFILE VALUES
(102, '/profiles/isabel/profile.jpg', 'I love discovering new games and meeting other players.');

INSERT INTO USERPROFILE VALUES
(103, '/profiles/gavin/profile.jpg', 'Simulation games are my favorite.');

INSERT INTO USERPROFILE VALUES
(104, '/profiles/carey/profile.jpg', 'I enjoy RPGs and exploring new worlds.');

INSERT INTO USERPROFILE VALUES
(105, '/profiles/matthew/profile.jpg', 'Strategy games are my specialty.');

INSERT INTO USERPROFILE VALUES
(106, '/profiles/alex/profile.jpg', 'I like playing games with friends.');

INSERT INTO USERPROFILE VALUES
(107, '/profiles/michael/profile.jpg', 'I enjoy action and adventure games.');

INSERT INTO USERPROFILE VALUES
(108, '/profiles/sean/profile.jpg', 'Always looking for something new to play.');

INSERT INTO USERPROFILE VALUES
(109, '/profiles/ellie/profile.jpg', 'I enjoy trying different genres of games.');

INSERT INTO USERPROFILE VALUES
(110, '/profiles/marcus/profile.jpg', 'Gaming is one of my favorite hobbies.');

COMMIT;

-- Question 6: Create the SECURITYQUESTION table
CREATE TABLE SECURITYQUESTION
(
    QUESTIONID NUMBER,
    USERID NUMBER(3),
    QUESTION VARCHAR2(250),
    ANSWER VARCHAR2(250),

    CONSTRAINT PK_SECURITYQUESTION
        PRIMARY KEY (QUESTIONID),

    CONSTRAINT FK_SECURITYQUESTION_USER
        FOREIGN KEY (USERID)
        REFERENCES USERBASE(USERID)
);

-- Question 6: Insert sample data into SECURITYQUESTION

INSERT INTO SECURITYQUESTION VALUES
(1, 101, 'What is your favorite game?', 'Understory');

INSERT INTO SECURITYQUESTION VALUES
(2, 102, 'What was your first video game?', 'Adventure Quest');

INSERT INTO SECURITYQUESTION VALUES
(3, 103, 'What is your favorite genre?', 'Simulation');

INSERT INTO SECURITYQUESTION VALUES
(4, 104, 'What is your favorite gaming platform?', 'PC');

INSERT INTO SECURITYQUESTION VALUES
(5, 105, 'What is your favorite game character?', 'Link');

INSERT INTO SECURITYQUESTION VALUES
(6, 106, 'What game do you play the most?', 'Understory');

INSERT INTO SECURITYQUESTION VALUES
(7, 107, 'What is your favorite game developer?', 'Nintendo');

INSERT INTO SECURITYQUESTION VALUES
(8, 108, 'What was your first console?', 'PlayStation');

INSERT INTO SECURITYQUESTION VALUES
(9, 109, 'What is your favorite game series?', 'Elder Scrolls');

INSERT INTO SECURITYQUESTION VALUES
(10, 110, 'What is your favorite game soundtrack?', 'Final Fantasy');

COMMIT;

-- Question 7: Create the COMMUNITYRULES table

CREATE TABLE COMMUNITYRULES
(
    RULENUM NUMBER(3),
    TITLE VARCHAR2(250),
    DESCRIPTION VARCHAR2(250),
    SEVERITYPOINT NUMBER(4),

    CONSTRAINT PK_COMMUNITYRULES
        PRIMARY KEY (RULENUM)
);

-- Question 7: Insert sample data into COMMUNITYRULES

INSERT INTO COMMUNITYRULES VALUES
(1, 'Respect Other Players', 'Treat all players with respect and avoid harassment.', 10);

INSERT INTO COMMUNITYRULES VALUES
(2, 'No Hate Speech', 'Do not use hateful or discriminatory language toward other users.', 20);

INSERT INTO COMMUNITYRULES VALUES
(3, 'No Spamming', 'Do not repeatedly send unwanted messages or advertisements.', 8);

INSERT INTO COMMUNITYRULES VALUES
(4, 'No Cheating', 'Do not use unauthorized software or exploits to gain an unfair advantage.', 15);

INSERT INTO COMMUNITYRULES VALUES
(5, 'Protect Personal Information', 'Do not share another user''s personal information without permission.', 20);

INSERT INTO COMMUNITYRULES VALUES
(6, 'Appropriate Content', 'Do not post inappropriate or offensive content on the platform.', 15);

INSERT INTO COMMUNITYRULES VALUES
(7, 'No Impersonation', 'Do not pretend to be another user or VaporGames employee.', 12);

INSERT INTO COMMUNITYRULES VALUES
(8, 'No Threats', 'Do not threaten or encourage harm toward another user.', 25);

INSERT INTO COMMUNITYRULES VALUES
(9, 'Respect Intellectual Property', 'Do not distribute copyrighted material without authorization.', 10);

INSERT INTO COMMUNITYRULES VALUES
(10, 'Follow Platform Policies', 'Follow all other VaporGames policies and guidelines.', 5);

COMMIT;

-- Question 8: Create the INFRACTIONS table

CREATE TABLE INFRACTIONS
(
    INFRACTIONID NUMBER,
    USERID NUMBER(3),
    RULENUM NUMBER(3),
    DATEASSIGNED DATE,
    PENALTY VARCHAR2(250),

    CONSTRAINT PK_INFRACTIONS
        PRIMARY KEY (INFRACTIONID),

    CONSTRAINT FK_INFRACTIONS_USER
        FOREIGN KEY (USERID)
        REFERENCES USERBASE(USERID),

    CONSTRAINT FK_INFRACTIONS_RULE
        FOREIGN KEY (RULENUM)
        REFERENCES COMMUNITYRULES(RULENUM)
);

-- Question 8: Insert sample data into INFRACTIONS

INSERT INTO INFRACTIONS VALUES
(1, 101, 3, TO_DATE('01-AUG-2026','DD-MON-YYYY'), 'Warning issued for spamming.');

INSERT INTO INFRACTIONS VALUES
(2, 102, 1, TO_DATE('02-AUG-2026','DD-MON-YYYY'), 'Warning issued for disrespectful behavior.');

INSERT INTO INFRACTIONS VALUES
(3, 103, 4, TO_DATE('03-AUG-2026','DD-MON-YYYY'), 'Temporary suspension for cheating.');

INSERT INTO INFRACTIONS VALUES
(4, 104, 6, TO_DATE('03-AUG-2026','DD-MON-YYYY'), 'Content removed and warning issued.');

INSERT INTO INFRACTIONS VALUES
(5, 105, 7, TO_DATE('04-AUG-2026','DD-MON-YYYY'), 'Warning issued for impersonation.');

INSERT INTO INFRACTIONS VALUES
(6, 106, 5, TO_DATE('04-AUG-2026','DD-MON-YYYY'), 'Warning issued for sharing personal information.');

INSERT INTO INFRACTIONS VALUES
(7, 107, 9, TO_DATE('05-AUG-2026','DD-MON-YYYY'), 'Content removed for copyright violation.');

INSERT INTO INFRACTIONS VALUES
(8, 108, 3, TO_DATE('05-AUG-2026','DD-MON-YYYY'), 'Warning issued for repeated spam.');

INSERT INTO INFRACTIONS VALUES
(9, 109, 2, TO_DATE('06-AUG-2026','DD-MON-YYYY'), 'Temporary suspension for hate speech.');

INSERT INTO INFRACTIONS VALUES
(10, 110, 8, TO_DATE('06-AUG-2026','DD-MON-YYYY'), 'Account suspended for issuing threats.');

COMMIT;

-- Question 9: Create the USERSUPPORT table

CREATE TABLE USERSUPPORT
(
    TICKETID NUMBER,
    EMAIL VARCHAR2(250),
    ISSUE VARCHAR2(250),
    DATESUBMITTED DATE,
    DATEUPDATED DATE,
    STATUS VARCHAR2(250),

    CONSTRAINT PK_USERSUPPORT
        PRIMARY KEY (TICKETID)
);

-- Question 9: Insert sample data into USERSUPPORT

INSERT INTO USERSUPPORT VALUES
(1, 'user101@example.com', 'Unable to access my game library.', TO_DATE('01-AUG-2026','DD-MON-YYYY'), TO_DATE('01-AUG-2026','DD-MON-YYYY'), 'NEW');

INSERT INTO USERSUPPORT VALUES
(2, 'user102@example.com', 'I cannot update my account information.', TO_DATE('01-AUG-2026','DD-MON-YYYY'), TO_DATE('02-AUG-2026','DD-MON-YYYY'), 'IN PROGRESS');

INSERT INTO USERSUPPORT VALUES
(3, 'user103@example.com', 'A game purchase is missing from my library.', TO_DATE('02-AUG-2026','DD-MON-YYYY'), TO_DATE('03-AUG-2026','DD-MON-YYYY'), 'CLOSED');

INSERT INTO USERSUPPORT VALUES
(4, 'user104@example.com', 'I need help resetting my password.', TO_DATE('02-AUG-2026','DD-MON-YYYY'), TO_DATE('02-AUG-2026','DD-MON-YYYY'), 'NEW');

INSERT INTO USERSUPPORT VALUES
(5, 'user105@example.com', 'My game is not launching correctly.', TO_DATE('03-AUG-2026','DD-MON-YYYY'), TO_DATE('04-AUG-2026','DD-MON-YYYY'), 'IN PROGRESS');

INSERT INTO USERSUPPORT VALUES
(6, 'user106@example.com', 'I was charged incorrectly for a purchase.', TO_DATE('03-AUG-2026','DD-MON-YYYY'), TO_DATE('05-AUG-2026','DD-MON-YYYY'), 'CLOSED');

INSERT INTO USERSUPPORT VALUES
(7, 'user107@example.com', 'I cannot send messages to another user.', TO_DATE('04-AUG-2026','DD-MON-YYYY'), TO_DATE('04-AUG-2026','DD-MON-YYYY'), 'NEW');

INSERT INTO USERSUPPORT VALUES
(8, 'user108@example.com', 'My wishlist is not displaying correctly.', TO_DATE('05-AUG-2026','DD-MON-YYYY'), TO_DATE('06-AUG-2026','DD-MON-YYYY'), 'IN PROGRESS');

INSERT INTO USERSUPPORT VALUES
(9, 'user109@example.com', 'I need assistance with a missing purchase.', TO_DATE('06-AUG-2026','DD-MON-YYYY'), TO_DATE('07-AUG-2026','DD-MON-YYYY'), 'CLOSED');

INSERT INTO USERSUPPORT VALUES
(10, 'user110@example.com', 'I cannot access my profile page.', TO_DATE('07-AUG-2026','DD-MON-YYYY'), TO_DATE('07-AUG-2026','DD-MON-YYYY'), 'NEW');

COMMIT;

-- Question 10: Create a view displaying unique security questions

CREATE VIEW UNIQUEQUESTIONS AS
SELECT DISTINCT QUESTION
FROM SECURITYQUESTION;

-- Question 10: Create a view displaying open support tickets

CREATE VIEW OPENSUPPORTTICKETS AS
SELECT TICKETID,
       EMAIL,
       ISSUE,
       DATEUPDATED
FROM USERSUPPORT
WHERE STATUS = 'NEW'
   OR STATUS = 'IN PROGRESS'
ORDER BY DATEUPDATED ASC;