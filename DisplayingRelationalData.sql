--Question 1: Display every username and the lowest rating they left
select us.username, min(r.rating) as lowest_rating
from userbase us
inner join reviews r on us.userid = r.userid
group by us.username;

--Question 2: Display every user's email, question, and answer
select ub.email, sq.question, sq.answer
from securityquestion sq
inner join userbase ub on ub.userid = sq.userid
group by ub.email, sq.question, sq.answer;

--Question 3: Display the firstname, email, and walletfunds of every user that does not have a wishlist
select ub.firstname, ub.email, ub.walletfunds
from userbase ub
left join wishlist w on ub.userid = w.userid
where w.userid IS NULL;

--Question 4: Display every username and number of products they have ordered
select ub.username, count(o.productcode) as productcount
from userbase ub
left join orders o on ub.userid = o.userid
group by ub.username;

--Question 5: Display the age of any user that has ordered a product within the last 6 months
select ub.firstname, months_between(sysdate, ub.birthday) / 12 as age
from userbase ub
inner join orders o on ub.userid = o.userid
where o.purchasedate >= add_months(sysdate, -6);

--Question 6: Display the username and birthday of the user who has the highest friend count
select ub.username, ub.birthday
from userbase ub
inner join friendslist fl on ub.userid = fl.userid
group by ub.username, ub.userid, ub.birthday
having count(fl.friendid) = (
    select max(friend_count)
    from (
        select count(friendid) as friend_count
        from friendslist
        group by userid
    )
);

--Question 7: Display the productname, releasedate, price, and description
--of any product found in the wishlist table
select pl.productname, pl.releasedate, pl.price, pl.description
from productlist pl
inner join wishlist w on pl.productcode = w.productcode
where w.productcode IS NOT NULL;

--Question 8: Display the productname, highest rating, and number of reviews
--for each product in the reviews table.
select pl.productname, max(r.rating) as highestrating, count(r.review) as numberofreviews
from productlist pl
right join reviews r on pl.productcode = r.productcode
group by pl.productname
order by highestrating desc;

--Question 9: Create a view that displays the productname, genre, and rating for every product
--with a 5 or a 1 rating
create view MIN_MAX_RATING as
select pl.productname, pl.genre, r.rating
from productlist pl
right join reviews r on pl.productcode = r.productcode
where r.rating = 5 or r.rating = 1
order by r.rating asc;

--Question 10: Display the count of products ordered, grouped by genre
select count(o.orderid) as numberofproductsordered, pl.genre
from orders o
full outer join productlist pl on pl.productcode = o.productcode
group by pl.genre
order by pl.genre asc;

--Question 11: Create a view that displays each publisher, the average price, and the
--sum of hours played for their products
create view PRODUCT_DATA as
select pl.publisher, avg(pl.price) as average_price, sum(ul.hoursplayed) as total_hoursplayed
from productlist pl
inner join userlibrary ul on pl.productcode = ul.productcode
group by pl.publisher;

--Question 12: Display the sum of money spent on products and their corresponding publisher
--from the orders table
select sum(o.price) as sum_of_money, pl.publisher
from orders o
inner join productlist pl on pl.productcode = o.productcode
group by pl.publisher
order by sum_of_money desc;

--Question 13: Display the ticketid, username, email, and issue only for tickets with a status
--of 'new' or 'in progress', sorted by the latest dateupdated
select us.ticketid, ub.username, us.email, us.issue
from usersupport us
join userbase ub on ub.email = us.email
where status = 'NEW' or status = 'IN PROGRESS'
order by dateupdated desc;

--Question 14: Display the username and count of ticketid that users have submitted for user support.
select ub.username, count(us.ticketid) as number_of_tickets
from usersupport us
inner join userbase ub on ub.email = us.email
group by ub.username;

--Question 15: Display the userid and email of any user who has submitted a support ticket that
--used their firstname, lastname, or combination of the two in their email address
select ub.userid, ub.email
from userbase ub
join usersupport us on ub.email = us.email
where ub.email like '%' || firstname || '%'
or ub.email like '%' || lastname || '%';

--Question 16: Display the email address of any user who has a 'NEW' or 'IN PROGRESS' support
--ticket status, where the email is not currently saved in the userbase table
select us.email
from usersupport us
inner join userbase ub on ub.email = us.email
where ub.email != us.email
AND (status = 'NEW'
OR status = 'IN PROGRESS');

--Question 17: Display the ticketid, firstname, lastname, and username of any user whose
--username is mentioned in the issue of a support ticket
select us.ticketid, ub.firstname, ub.lastname, ub.username
from usersupport us
inner join userbase ub on us.email = ub.email
where us.issue like ub.username;

--Question 18: Display the username and password associated with the email address
--provided in the support tickets
select ub.username, ub.password
from userbase ub
inner join usersupport us on ub.email = us.email
where ub.email = us.email;

--Question 19: Create a view that displays the username, dateassigned, and penalty for any user whose
--penalty is not null and the infraction was assigned within the last month
create view RECENT_INFRACTIONS as
select ub.username, i.dateassigned, i.penalty
from infractions i
inner join userbase ub on ub.userid = i.userid
where penalty is not null
AND dateassigned >= add_months(sysdate, -1);

--Question 20: Display the username and email of any user who is at least 18 years old
--and has not received an infraction within the last 4 months
select ub.username, ub.email, i.penalty, months_between(sysdate, ub.birthday) / 12 as age
from userbase ub
inner join infractions i on ub.userid = i.userid
where months_between(sysdate, ub.birthday) / 12 >= 18
AND i.dateassigned >= add_months(sysdate, -4);

--Question 21: Display the username, dateassigned and full guideline name (rulenum and title
--with a blank space inbetween) for any user who has violated the rules
select ub.username, i.dateassigned, cr.rulenum || '. ' || cr.title as guideline_name
from userbase ub
join infractions i on ub.userid = i.userid
join communityrules cr on i.rulenum = cr.rulenum;

--Question 22: Display the userid, username, email, and sum of all severity points
--each user has received
select ub.userid, ub.username, ub.email, sum(cr.severitypoint) as total_points
from userbase ub
join infractions i on ub.userid = i.userid
join communityrules cr on i.rulenum = cr.rulenum
group by ub.userid, ub.username, ub.email;

--Question 23: Display the title, description, and penalty
--for all infractions assigned
select cr.title, cr.description, i.penalty
from communityrules cr
join infractions i on cr.rulenum = i.rulenum
where dateassigned is not null;

--Question 24: Display the username and count of infractions for users who
--have violated the community rules at least 15 times
select ub.username, count(i.rulenum) as count_of_infractions
from userbase ub
join infractions i on ub.userid = i.userid
group by ub.username
having count(i.rulenum) >= 15;