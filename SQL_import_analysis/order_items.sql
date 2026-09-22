SELECT * FROM olist.order_items;
alter table order_items
add primary key (order_id,order_item_id);
alter table order_items 
add foreign key (product_id) references products(product_id),
add foreign key (seller_id) references sellers(seller_id),
add foreign key (order_id) references orders(order_id);