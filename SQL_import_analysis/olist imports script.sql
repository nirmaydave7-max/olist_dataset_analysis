create database olist;
use olist;
CREATE TABLE customers(
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);
set global local_infile=1;
load data local infile 'C:/Users/ADMIN/Documents/olist_customers_dataset.csv/olist_customers_dataset_cleaned.csv'
into table customers
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
show variables like 'local_infile';
load data local infile 'C:/Users/ADMIN/Documents/olist_customers_dataset.csv/olist_customers_dataset_cleaned.csv'
into table customers
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
select*from customers;
CREATE TABLE geolocation_2 (
    geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(10,7),
    geolocation_lng DECIMAL(10,7),
    geolocation_state CHAR(2),
    geolocation_city VARCHAR(100)
);
load data local infile 'C:/Users/ADMIN/Documents/olist_customers_dataset.csv/olist_geolocation_dataset_cleaned.csv'
into table geolocation_2
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
select*from geolocation_2;
select count(geolocation_city)from geolocation_2;
drop table geolocation;
create table order_items(order_id varchar(50),
order_item_id int,
product_id varchar(50),
seller_id varchar(50),
shipping_limit_date date,
shipping_limit_time varchar(20),
price decimal(5,3),
freight_value decimal(4,3));
load data local infile 'C:/Users/ADMIN/Documents/olist_customers_dataset.csv/olist_order_items_dataset_cleaned.csv'
into table order_items
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
select count(product_id) from order_items;
create table reviews_2(review_id varchar(50),order_id varchar(50),review_score int,review_comment_title varchar(10),
review_comment_message varchar(100),review_creation_date date,review_date	date,review_time varchar(20));
drop table reviews;
load data local infile 'C:/Users/ADMIN/Documents/olist_customers_dataset.csv/olist_order_reviews_dataset_cleaned.csv'
into table reviews_2
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
select count(review_id) from reviews_2;
drop table reviews_2;
show variables like 'local_infile';
set global local_infile=1;
drop table reviews;
drop table reviews_2;
create table reviews(review_id varchar(50),order_id varchar(50),review_score int,review_comment_title text,
review_comment_message text,review_creation_date date,review_date date,review_time varchar(20));
load data local infile 'C:/Users/ADMIN/Downloads/olist_customers_dataset.csv/olist_order_reviews_dataset_cleaned.csv'
into table reviews
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
create table sellers(seller_id varchar(100),seller_zip_code_prefix int,seller_city text,seller_state varchar(5));
load data local infile 'C:/Users/ADMIN/Downloads/olist_customers_dataset.csv/olist_sellers_dataset_cleaned.csv'
into table sellers 
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
create table products_1(product_id varchar(50),product_category_name varchar(100),product_name_length varchar(20),
product_description_length varchar(20),
product_photos_qty varchar(20),product_weight_g varchar(20),product_length_cm varchar(20),
product_height_cm varchar(20),product_width_cm varchar(20));
load data local infile 'C:/Users/ADMIN/Downloads/olist_customers_dataset.csv/olist_products_dataset_cleaned.csv'
into table products_1 
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
drop table order_items;
drop table order_items_1;
create table order_items(order_id varchar(100),order_item_id int,product_id varchar(100),seller_id varchar(100),shipping_limit_date date,
shipping_limit_time varchar(50),price varchar(20),freight_value varchar(25));
load data local infile 'C:/Users/ADMIN/Documents/olist_customers_dataset.csv/olist_order_items_dataset_cleaned.csv'
into table order_items
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
create table orders(order_id varchar(50),customer_id varchar(50),order_status text,order_purchase_date date,order_purchase_time varchar(30)
,order_approved_date varchar(20),order_approved_time varchar(20),order_delivery_carrier_date varchar(20),order_delivery_carrier_time varchar(20),
order_delivered_customer_date varchar(20),order_delivery_customer_time varchar(20),order_estimate_delivery_date varchar(20));
load data local infile 'C:/Users/ADMIN/Downloads/olist_customers_dataset.csv/olist_orders_dataset_cleaned.csv'
into table orders
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
create table payments(order_id varchar(50),payment_sequential int,payment_type varchar(20),
payment_installments int,payment_value varchar(20));
load data local infile 'C:/Users/ADMIN/Downloads/olist_customers_dataset.csv/olist_order_payments_dataset_cleaned.csv'
into table payments
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;



