#CUSTOMER  COUNT BY CITY
select customer_city,count(customer_id) as "customer_count" 
from customers group by customer_city order by count(customer_id) desc;
#CUSTOMER COUNT BY STATE
select customer_state,count(customer_id) as "customer_count" 
from customers group by customer_state order by count(customer_id) desc;
#CURRENT STATUS OF ORDERS
select order_status,count(order_id) as current_statistics from orders
group by order_status order by count(order_id) desc;
#YEAR WISE ORDERS
select year(order_purchase_date) as year,count(order_id) as total_orders from orders
group by year(order_purchase_date) order by count(order_id) desc;
#MONTH WISE ORDERS(HIGHEST TO LOWEST)
select month(order_purchase_date) as month,count(order_id) as total_orders from orders
group by month(order_purchase_date) order by count(order_id) desc;
#QUARTERLY ORDERS ANALYSIS
select quarter(order_purchase_date) as quarter,count(order_id) as orders from orders
group by quarter(order_purchase_date) order by count(order_id) desc;
#HIGHEST ORDER PURCHASE TIME SLOT OF DAY
select concat(hour(order_purchase_time),':00 -',hour(order_purchase_time),':59')as time_slot,count(order_id) as orders from orders
group by time_slot order by count(order_id) desc;
#HIGHEST ORDER APPPROVED TIME SLOT OF DAY
select concat(hour(order_approved_time),':00 -',hour(order_approved_time),':59')as time_slot,count(order_id) as orders from orders
group by time_slot order by count(order_id) desc;
#HIGHEST ORDER DELIVERY CARRIER TIME OF DAY
select concat(hour(order_deliverycarrier_time),':00 -',hour(order_deliverycarrier_time),':59')as time_slot,count(order_id) as orders from orders
group by time_slot order by count(order_id) desc;
#HIGHEST ORDER DELIVERY TIME OF THE DAY
select concat(hour(order_delivery_customer_time),':00 -',hour(order_delivery_customer_time),':59')as time_slot,count(order_id) as orders from orders
group by time_slot order by count(order_id) desc;
#PAYMENT TYPES USED FOR PAYMENT IN ORDERS
select count(*) from (select order_id,count(*) as payment_count from payments group by order_id having count(*)>1)as multiple_payment_orders;
select payment_type,count(order_id) as orders from payments group by payment_type order by orders desc;
#HIGHEST AMOUNT OF ORDERS PLACED BY ORDERID
select payment_installments,count(order_id) as orders from payments group by payment_installments order by orders desc;
select order_id,sum(payment_value) as total_amount from payments group by order_id order by total_amount desc;
#CATEGORY WISE CLASSIFICATION OF ORDERS
#[BUG FIX] Changed 'products' -> 'products_1' (actual table name in DB)
select product_category_name,count(product_id) as total_products from products_1 group by product_category_name order by total_products desc;
#TOTAL VALUES OF PAYMENT BY NUMBER OF INSTALLMENTS
select payment_installments,sum(payment_value) as payment_due from payments group by payment_installments order by payment_due desc;
#TOTAL NUMBER OF CUSTOMERS WITH NUMBER OF INSTALLMENTS
select payment_installments,count(order_id) as no_of_customers from payments group by payment_installments order by no_of_customers desc;
#REVIEWS SCORE DISTRIBUTION
select review_score,count(review_id) as reviews_count from reviews group by review_score order by reviews_count desc;
#YEARLY REVIEWS COUNT
select year(review_date) as YEAR,count(review_id) as review_count from reviews group by YEAR order by review_count desc;
#SELLER COUNT BY CITY
select seller_city,count(seller_id) as seller_count from sellers group by seller_city order by seller_count desc;
#CUSTOMER REPEAT ORDERS
select c.customer_unique_id,count(o.order_id) as total_orders from customers c join orders o on c.customer_id=o.customer_id
group by c.customer_unique_id order by total_orders desc;
#EACH CUSTOMER SPENT
with agg_payments as (
    select order_id, sum(cast(payment_value as decimal(10,2))) as order_total
    from payments group by order_id
)
select c.customer_unique_id,
       count(distinct o.order_id)  as total_orders,
       sum(ap.order_total)         as total_amount
from customers c
join orders       o  on c.customer_id = o.customer_id
join agg_payments ap on o.order_id    = ap.order_id
group by c.customer_unique_id order by total_amount desc;
#MOST SOLD PRODUCT CATEGORIEs
select p.product_category_name,
       count(distinct o.order_id)                                        as total_orders,
       count(oi.order_item_id)                                           as total_units_sold,
       sum(cast(replace(oi.price,'?','') as decimal(10,2)))              as total_revenue
from orders o
join order_items oi on o.order_id    = oi.order_id
join products_1  p  on oi.product_id = p.product_id
group by p.product_category_name order by total_orders desc;

#ITEMS AND TOTAL VALUE PER ORDER
select o.order_id,
       o.order_status,
       count(oi.order_item_id)                                           as item_count,
       sum(cast(replace(oi.price,'?','') as decimal(10,2)))              as merchandise_total,
       sum(cast(oi.freight_value as decimal(10,2)))                      as freight_total,
       sum(cast(replace(oi.price,'?','') as decimal(10,2)))
         + sum(cast(oi.freight_value as decimal(10,2)))                  as order_value
from orders      o
join order_items oi on o.order_id = oi.order_id
group by o.order_id, o.order_status
order by order_value desc;

#PRODUCT SALES AND REVENUE
select oi.product_id,
       p.product_category_name,
       count(oi.order_item_id)                                           as units_sold,
       sum(cast(replace(oi.price,'?','') as decimal(10,2)))              as total_revenue
from order_items oi
join products_1  p  on oi.product_id = p.product_id
group by oi.product_id, p.product_category_name
order by total_revenue desc;

#SELLER SALES PERFORMANCE
select s.seller_id,
       s.seller_city,
       s.seller_state,
       count(oi.order_item_id)                                           as total_items_sold,
       sum(cast(oi.freight_value as decimal(10,2)))                      as total_freight_collected
from order_items oi
join sellers     s  on oi.seller_id = s.seller_id
group by s.seller_id, s.seller_city, s.seller_state
order by total_items_sold desc;

#REVIEW SCORE BY ORDER STATUS
with agg_reviews as (
    select order_id, avg(review_score) as avg_score
    from reviews group by order_id
)
select o.order_status,
       count(distinct o.order_id)                                        as order_count,
       round(avg(ar.avg_score),2)                                        as avg_review_score,
       sum(case when ar.avg_score = 5 then 1 else 0 end)                 as score_5_count,
       sum(case when ar.avg_score >= 4 then 1 else 0 end)                as score_4plus_count,
       sum(case when ar.avg_score <= 2 then 1 else 0 end)                as score_2minus_count
from orders      o
join agg_reviews ar on o.order_id = ar.order_id
group by o.order_status
order by avg_review_score desc;

#REPEAT VS ONE-TIME CUSTOMER REVIEWS
with customer_order_count as (
    select c.customer_unique_id, c.customer_id,
           count(o.order_id) as order_count,
           case when count(o.order_id) > 1 then 'Repeat Customer'
                else 'One-Time Customer' end as customer_type
    from customers c
    join orders    o on c.customer_id = o.customer_id
    group by c.customer_unique_id, c.customer_id
),
agg_reviews as (
    select order_id, avg(review_score) as avg_score
    from reviews group by order_id
)
select coc.customer_type,
       count(distinct coc.customer_unique_id)  as customer_count,
       count(distinct o.order_id)              as total_orders,
       round(avg(ar.avg_score),2)              as avg_review_score
from customer_order_count coc
join orders      o  on coc.customer_id = o.customer_id
join agg_reviews ar on o.order_id      = ar.order_id
group by coc.customer_type
order by avg_review_score desc;

#CUSTOMER-STATE VS SELLER-STATE SALES FLOW

with order_item_agg as (
    select oi.order_id, s.seller_state,
           count(oi.order_item_id)                                       as item_count,
           sum(cast(replace(oi.price,'?','') as decimal(10,2)))          as revenue
    from order_items oi
    join sellers     s  on oi.seller_id = s.seller_id
    group by oi.order_id, s.seller_state
)
select c.customer_state,
       oia.seller_state,
       count(distinct o.order_id)   as total_orders,
       sum(oia.item_count)          as total_items
from customers      c
join orders         o   on c.customer_id = o.customer_id
join order_item_agg oia on o.order_id    = oia.order_id
group by c.customer_state, oia.seller_state
order by total_items desc;

#LATE DELIVERY VS REVIEW SCORE
with agg_reviews as (
    select order_id, avg(review_score) as avg_score
    from reviews group by order_id
),
delivery_flag as (
    select order_id,
           case
               when order_delivered_customer_date = '-'
                 or order_estimate_delivery_date = '-' then 'Unknown'
               when order_delivered_customer_date > order_estimate_delivery_date
               then 'Late'
               else 'On Time'
           end as delivery_status
    from orders
)
select df.delivery_status,
       count(distinct df.order_id)   as order_count,
       round(avg(ar.avg_score),2)    as avg_review_score,
       min(ar.avg_score)             as min_score,
       max(ar.avg_score)             as max_score
from delivery_flag df
join agg_reviews   ar on df.order_id = ar.order_id
group by df.delivery_status
order by avg_review_score desc;

#REVENUE BY CUSTOMER STATE
with agg_payments as (
    select order_id,
           sum(cast(payment_value as decimal(10,2))) as total_payment
    from payments group by order_id
)
select c.customer_state,
       count(distinct c.customer_unique_id)  as total_customers,
       count(distinct o.order_id)            as total_orders,
       sum(ap.total_payment)                 as total_revenue,
       round(avg(ap.total_payment),2)        as avg_order_value
from customers    c
join orders       o  on c.customer_id = o.customer_id
join agg_payments ap on o.order_id    = ap.order_id
group by c.customer_state
order by total_revenue desc;

