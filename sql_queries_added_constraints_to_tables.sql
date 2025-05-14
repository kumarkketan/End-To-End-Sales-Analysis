Use analysis;

-- working  on customer table
Select * from customers;

-- Renaming the column
Alter table customers
Rename column customer_id to customer_session_id;

Alter table customers
Rename column customer_session_id to customer_id;

-- Adding Serial no. auto increment column 
ALTER TABLE customers
ADD COLUMN SNo INT AUTO_INCREMENT UNIQUE FIRST;

-- converting customer_session_id to primary key
ALTER TABLE customers
ADD PRIMARY KEY (customer_id(100));

desc customers;

-- working on location table
Select * from location;

-- Adding Serial no. auto increment column 
ALTER TABLE location
ADD COLUMN SNo INT AUTO_INCREMENT UNIQUE FIRST;

-- working on order table
-- Renaming table
RENAME TABLE `order` TO orders;
Select * from orders;

-- Adding Serial no. auto increment column 
ALTER TABLE orders
ADD COLUMN SNo INT AUTO_INCREMENT UNIQUE FIRST;

-- converting order_id to primary key
ALTER TABLE orders
ADD PRIMARY KEY (order_id(100));

ALTER TABLE orders
MODIFY order_id VARCHAR(255) NOT NULL,
DROP PRIMARY KEY,
ADD PRIMARY KEY (order_id);

desc orders;

-- working on order_items table
Select * from order_items;

-- Adding Serial no. auto increment column 
ALTER TABLE order_items
ADD COLUMN SNo INT AUTO_INCREMENT UNIQUE FIRST;

-- Making order_id foreign key
ALTER TABLE order_items
MODIFY order_id VARCHAR(255) NOT NULL;

ALTER TABLE order_items
ADD CONSTRAINT fk_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Making product_id foreign key
ALTER TABLE order_items
MODIFY product_id VARCHAR(255) NOT NULL;

-- not able to add foreign key as 610 product_id is not present in primary olumn of product table
ALTER TABLE order_items
ADD CONSTRAINT fk_pro_id
FOREIGN KEY (product_id)
REFERENCES product(product_id);

-- these are the product_id which are not present in primary column of product table
SELECT DISTINCT product_id
FROM order_items
WHERE product_id NOT IN (
  SELECT product_id FROM product
);

-- Making seller_id foreign key
ALTER TABLE order_items
MODIFY seller_id VARCHAR(255) NOT NULL;

ALTER TABLE order_items
ADD CONSTRAINT fk_seller_ids
FOREIGN KEY (seller_id)
REFERENCES seller(seller_id);

desc order_items;

-- working on payment table
Select * from payment;

-- Adding Serial no. auto increment column 
ALTER TABLE payment
ADD COLUMN SNo INT AUTO_INCREMENT UNIQUE FIRST;

ALTER TABLE payment
MODIFY order_id VARCHAR(255) NOT NULL;

-- Making order_id foreign key
ALTER TABLE payment
ADD CONSTRAINT fk_orders_payment
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- working on prod_category table
Select * from prod_category;

-- Adding Serial no. auto increment column 
ALTER TABLE prod_category
ADD COLUMN SNo INT AUTO_INCREMENT UNIQUE FIRST;

-- converting prod_category to primary key
ALTER TABLE prod_category
ADD PRIMARY KEY (product_category_name(100));

ALTER TABLE prod_category
MODIFY product_category_name VARCHAR(100) NOT NULL,
DROP PRIMARY KEY,
ADD PRIMARY KEY (product_category_name);

-- not able to create foreign key for product table because 2 categories are not persent in 
-- primary column  of prod_category table so firstly adding that so foreign key can be created
INSERT INTO prod_category(product_category_name)
SELECT DISTINCT product_category_name
FROM product
WHERE product_category_name NOT IN (
  SELECT product_category_name FROM prod_category
);

desc prod_category;

-- working on product table
Select * from product;

-- Adding Serial no. auto increment column 
ALTER TABLE product
ADD COLUMN SNo INT AUTO_INCREMENT UNIQUE FIRST;

-- converting product_id to primary key
ALTER TABLE product
ADD PRIMARY KEY (product_id(100));

ALTER TABLE product
MODIFY product_id VARCHAR(255) NOT NULL,
DROP PRIMARY KEY,
ADD PRIMARY KEY (product_id);

-- converting product_category_name in foreign key
ALTER TABLE product
MODIFY product_category_name VARCHAR(100) NOT NULL;

ALTER TABLE product
ADD CONSTRAINT fk_prod_categ
FOREIGN KEY (product_category_name)
REFERENCES prod_category(product_category_name);

desc product;

-- working on review table
Select * from review;

-- Adding Serial no. auto increment column 
ALTER TABLE review
ADD COLUMN SNo INT AUTO_INCREMENT UNIQUE FIRST;

ALTER TABLE review
MODIFY order_id VARCHAR(255) NOT NULL;

-- Making order_id foreign key
ALTER TABLE review
ADD CONSTRAINT fk_orders_review
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- working on seller table
Select * from seller;

-- Adding Serial no. auto increment column 
ALTER TABLE seller
ADD COLUMN SNo INT AUTO_INCREMENT UNIQUE FIRST;

-- converting product_id to primary key
ALTER TABLE seller
ADD PRIMARY KEY (seller_id(100));

ALTER TABLE seller
MODIFY seller_id VARCHAR(255) NOT NULL,
DROP PRIMARY KEY,
ADD PRIMARY KEY (seller_id);

