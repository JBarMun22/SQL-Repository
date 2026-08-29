--Question 1: Display the userid of any user that has not made an order
select userid
from userbase
minus
select userid
from orders;

--Question 2: Display the productcode of any products that have no reviews
select productcode
from productlist
minus
select productcode
from reviews;

--Question 3: Display all data in the userbase table.
--Show another column that states 'adult' for any user that is at least 18,
--and 'minor' for all other users
select ub.*,
case
    when ub.birthday <= add_months(sysdate, -216)
    then 'Adult'
    else 'Minor'
    end as Age
from userbase ub;

--Question 4: Display all data in the productlist table.
--Show another column that states 'On Sale' for any product
--that is priced at $20 or less, and 'Base Price' for anything else
select pl.*,
case
    when pl.price < 20
    then 'On Sale'
    else 'Base Price'
    end as Sale_Or_Not
from productlist pl;

--Question 5: Display the userid of any user who has played the product with
--a productcode of GAME6 and has a user profile image
select ul.userid
from userlibrary ul
join userprofile up on ul.userid = up.userid
where ul.productcode = 'GAME6' and up.imagefile is not null;

--Question 6: Display any productcode from the intersect of the wishlist and
--reviews table, where the product is in position 1 or 2, and has a review
--rating of 3 or higher
select w.productcode
from wishlist w
where w.position = 1 or w.position = 2
intersect
select r.productcode
from reviews r
where r.rating >= 3;

--Question 7: Display both user's username and birthday for any users who share the same birthday
select u1.username as user1, u1.birthday as birthday1, u2.username as user2, u2.birthday as birthday2
from userbase u1
join userbase u2
    on u1.birthday = u2.birthday
    and u1.userid < u2.userid;

--Question 8: Display the cartesian product of the userlibrary table cross joined with the wishlist table
select *
from userlibrary
cross join wishlist;

--Question 9: Perform a union all on the userbase and productlist tables to generate
--data on all users and products
select to_char(userid) as id,
    username as name,
    'User' as type
from userbase
union all
select productcode,
    productname,
    'Product'
from productlist;

--Question 10: Perform a union all on the chatlog and userprofile tables to generate data on user activity
select senderid as userid,
       content as activity,
       'Chat' as type
from chatlog

union all

select userid,
       description,
       'Profile'
from userprofile;

--Question 11: Display the username of all users who have not received an infraction
select username
from userbase
minus
select ub.username
from userbase ub
join infractions i
    on i.userid = ub.userid;

--Question 12: Display the title and description of any communityrules that have not
--been broken
select title, description
from communityrules
minus
select cr.title, cr.description
from communityrules cr
join infractions i
    on i.rulenum = cr.rulenum;

--Question 13: Display the username and email of all users who have received a penalty for
--their infraction
select username, email
from userbase
intersect
select ub.username, ub.email
from userbase ub
join infractions i
    on ub.userid = i.userid
where i.penalty is not null;

--Question 14: Display the dates where an infraction was assigned and a usersupport ticket
--was submitted on the same day
select dateassigned
from infractions
intersect
select datesubmitted
from usersupport;

--Question 15: Display every communityrules title and penalty
select cr.title, i.penalty
from infractions i
join communityrules cr
    on i.rulenum = cr.rulenum;

--Question 16: Display all data in the communityrules table.
--show another column that states 'bannable' for any rule
--with a 10 or higher severity point and 'appealable' for all others.
select cr.*,
    case
    when severitypoint >= 10
    then 'Bannable'
    else 'Appealable'
    end as Broken_Appeasement
from communityrules cr;

--Question 17: Display all data in the usersupport table. Show another
--column that states 'high priority' for any ticket that is not closed
--and has not been updated in the past week.
select us.*,
    case
    when us.status <> 'Closed'
    and us.dateupdated < sysdate - 7
    then 'High Priority'
    else 'Normal Priority'
    end as Priority
from usersupport us;

--Question 18: Display the cartesian product of the usersupport table
--cross joined with the infractions table
select *
from usersupport
cross join infractions;

--Question 19: Display both ticketids and dateupdated for any support tickets that are 'closed'
-- and the last dateupdated was on the same day
select u1.ticketid as ticket1, u1.dateupdated as update1, u2.ticketid as ticket2, u2.dateupdated as update2
from usersupport u1
join usersupport u2
    on u1.dateupdated = u2.dateupdated
    and u1.ticketid < u2.ticketid
where u1.status = 'CLOSED'
    and u2.status = 'CLOSED';

--Question 20: Perform a union all on the userbase and infractions
--tables to generate data on user activity
select userid,
       username as activity,
       'User' as type
from userbase

union all

select userid,
       penalty,
       'Infraction'
from infractions;