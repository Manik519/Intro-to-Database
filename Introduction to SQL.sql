/*create the online store database*/
create database onlinestore; 

-- use the newly created data base
use onlinestore;

-- Create the customers table to store customer information
create table customers(
customer_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(100) unique not null,
phone_no varchar(15)  not null
);

-- Insert sample data into the customers table
insert into customers (first_name, last_name, email, phone_no)
values
('roshan', 'kumar', 'roshankumar@gmail.com', '9912345678'),
('rohan', 'yadav', 'rohan@gmail.com', '7798765432'),
('chirag', 'goyal', 'chiragoyal@gmail.com', '1234567890'),
('vipul', 'garg', 'vipulgarg@gmail.com', '9876544321'),
('sachin', 'kumar', 'sachin@gmail.com', '9807678987');


-- Retrieve and display all records from the customers table
select* from customers;


-- Create the products table to store product information
create table products(
product_id int auto_increment primary key,
product_name varchar(100) not null,
price decimal(10,2) not null check(price>0),
stock_quantity int not null check(stock_quantity>0)
);



-- Insert sample data into the products table
insert into products (product_name, price, stock_quantity)
values
('books',500.00, 200),
('pens', 50.00, 1000),
('Headphones', 10000.99, 2200),
('Keyboard', 2999.99, 1150),
('Mouse', 1999.99, 1300);



-- Retrieve and display all records from the products table
select* from products;



-- Create the orders table to store order information
create table orders(
order_id int auto_increment primary key,
customer_id int not null, 
customer_date date not null,
total_amount decimal(10,2) not null check(total_amount>=0),
foreign key (customer_id) references customers(customer_id)
);


-- Insert sample data into the orders table
insert into orders (customer_id, customer_date, total_amount)
values
(1, '2024-08-15', 10049.18),
(2, '2024-08-16', 5529.38),
(3, '2024-08-17', 969.48),
(4, '2024-08-18', 2009.99),
(5, '2024-08-19', 1999.89);


-- Retrieve and display all records from the orders table
select* from orders;



-- Create the order_items table to store order information
create table order_items(
order_item_id int auto_increment primary key,
order_id int not null,
product_id int not null,
quantity int not null check( quantity>0),
price decimal(10,2) not null check( price>0),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);


-- Insert sample data into the order_items table
insert into order_items (order_id, product_id , quantity, price)
values
(1, 1, 1, 9999.99),
(1, 3, 1, 4999.99),
(2, 2, 5, 4998.99),
(2, 3, 4, 2999.99),
(5, 5, 1, 1989.99);


-- Retrieve and display all records from the order_items table
select* from order_items;



/*Primary Key: Ensures each record in a table is uniquely identifiable.
Foreign Key: Creates a relationship between tables.*/