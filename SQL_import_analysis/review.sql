SELECT * FROM olist.reviews;
alter table reviews
add primary key (review_id);
alter table reviews 
add foreign key (order_id) references orders(order_id);