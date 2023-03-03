 -- Q1, Which region the most sales reps come from
 select r.name, count(s.name) as "amount"
 from "sales_reps" as s
 join "Region" as r
 on s.region_id = r.id
 group by r.name
 order by "amount" desc
 
 --Q2 which company made the lowest sales,what is the chanel they use for the sales
 select a.name, sum(o.total_amt_usd) as "company_sales",w.channel
 from "Accounts" as a
 join "web_events" as w
 on a.id = w.account_id
 join "Orders" o
 on a.id = o.account_id
 group by a.name,w.channel
 Order by "company_sales" asc

--Q3 company with highest final total with the sales reps responsiable of the sales
select a.name, sum (o.total_amt_usd) as "total_sales" ,s.name
from "Accounts" as a
join "sales_reps" as s
on a.sales_rep_id = s.id
join "Orders" as o
on a.id = o.account_id
group by a.name,s.name
order by "total_sales" desc;

--Q4 which company has the higest reach using facebook
select a.name, w.channel, count(channel) as channel_acc
from "Accounts" as a
join "web_events" as w
on a.id = w.account_id
where w.channel =  'facebook'
group by a.name,w.channel
order by "channel_acc" desc;

-- assigment

--Q1 company that has the highest sales through facebook
select a.name, w.channel, sum(o.total_amt_usd) as "facebook_sales"
from "Accounts" as a
join "web_events" as w
on a.id = w.account_id
join "Orders" as o
on a.id = o.account_id
where channel ='facebook'
group by a.name,w.channel
order by "facebook_sales" desc;


--Q2 companies that has the highest sales across all the sales channel
select a.name, w.channel, count(o.total_amt_usd) as "channel_highest_sales"
from "Accounts" as a
join "web_events" as w
on a.id =w.account_id
join "Orders" as o
on a.id = o.account_id
group by a.name,w.channel
order by "channel_highest_sales" desc;

--Q3 on Average for the sales channel which company had the total amount in usd
select w.channel, a.name, avg(o.total_amt_usd) as avg_values
from "Accounts" as a 
join "web_events" as w
on a.id = w.account_id
join "Orders" as o
on a.id = o.account_id
group by w.channel,a.name
order by "avg_values" desc;









 
 
 
 
 