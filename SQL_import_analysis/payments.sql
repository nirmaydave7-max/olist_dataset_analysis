SELECT * FROM olist.payments;
alter table payments
add primary key (order_id,payment_sequential);
alter table payments
add foreign key(order_id) references orders(order_id);