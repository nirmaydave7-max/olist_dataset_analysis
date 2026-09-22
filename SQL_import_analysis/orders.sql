SELECT*FROM olist.orders;
alter table orders
add primary key (order_id);
alter table orders
add foreign key (customer_id) references customers(customer_id);
update orders
set order_purchase_time=time_format(str_to_date(replace(order_purchase_time,'.',':'),'%h:%i:%s %p'),'%H:%i:%s');
update orders
set order_approved_time=time_format(str_to_date(replace(order_approved_time,'.',':'),'%h:%i:%s %p'),'%H:%i:%s');
update orders
set order_deliverycarrier_time=time_format(str_to_date(replace(order_deliverycarrier_time,'.',':'),'%h:%i:%s %p'),'%H:%i:%s') where order_deliverycarrier_time <>'-';
desc orders;
update orders
set order_delivery_customer_time=time_format(str_to_date(replace(order_delivery_customer_time,'.',':'),'%h:%i:%s %p'),'%H:%i:%s') where order_delivery_customer_time <>'-';