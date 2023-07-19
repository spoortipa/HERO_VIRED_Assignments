create table SALES_REP(
ID int,
NAME varchar(255),
REGION_ID int,
primary key(ID),
foreign key(REGION_ID)
references region(ID));

create table ACCOUNTS(
id int,
name varchar(255),
website varchar(255),
lat numeric,
long numeric,
primary_poc varchar(255),
sales_rep_id int,
primary key(id),
foreign key(sales_rep_id)
references SALES_REP(ID));

create table WEB_EVENTS(
id int primary key,
account_id int,
occured_at timestamp,
channel varchar(255));

drop table web_events;

create table WEB_EVENTS(
id int,
account_id int,
occured_at timestamp,
channel varchar(255),
primary key(id),
foreign key(account_id)
references ACCOUNTS(id));

create table ORDERS(
id int,
account_id int,
occured_at timestamp,
standard_qty int ,
gloss_qty int,
poster_qty int,
total int,
standard_amount_usd numeric,
gloss_amt_usd numeric,
poster_amt_usd numeric,
total_amt_usd numeric,
primary key(id),
foreign key(account_id)
references ACCOUNTS(id)
);


#  COMMANDS FOR BULK LOADING 
----------------------------------
dwh=# \copy region from 'E:/Hero Vired/00_SQL_Mini_Project/Dataset/region.csv' WITH DELIMITER ',' CSV HEADER;
COPY 4
dwh=# \copy sales_rep from 'E:/Hero Vired/00_SQL_Mini_Project/Dataset/sales_rep.csv' WITH DELIMITER ',' CSV HEADER;
COPY 50
dwh=# \copy accounts from 'E:/Hero Vired/00_SQL_Mini_Project/Dataset/accounts.csv' WITH DELIMITER ',' CSV HEADER;
COPY 351
dwh=# \copy web_events from 'E:/Hero Vired/00_SQL_Mini_Project/Dataset/web_events.csv' WITH DELIMITER ',' CSV HEADER;
COPY 9073
dwh=# \copy orders from 'E:/Hero Vired/00_SQL_Mini_Project/Dataset/orders.csv' WITH DELIMITER ',' CSV HEADER;
COPY 6912
-------------------------------------

select * from region;

select * from sales_rep;

select * from accounts limit 5;

select * from web_events limit 5;

select * from orders limit 5;




