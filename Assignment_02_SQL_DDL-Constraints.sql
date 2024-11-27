# 2-DDL Constraints
# ==================
#
# Create a database called “Sales” and create a new table named “Orders” in the Sales database with columns: 
# Order_Id, 
# Customer_name, 
# Product_Category, 
# Ordered_item, 
# Contact_No
#
# Use constraints: Primary Key Unique Not Null 
#
# 1. Add a new column named “order_quantity” to the orders table. 
# 2. Rename the orders table to the sales_orders table. 
# 3. Insert 10 rows into the sales_orders table. 
# 4. Retrieve customer_name and Ordered_Item from the sales_orders table. 
# 5. Use the update command to change the name of the product for any row. 
# 6. Delete the sales_orders table from the database.
#
# ===========================================================================================================

# Create a Database Named Sales

create database Sales;

# Use the database Sales for further commands

use Sales;


# Create a table named Orders with fields Order_ID, Customer_Name, Product_Category, Ordered_Item, Contact_No

create table Orders (
Order_ID int auto_increment primary key,
Customer_Name varchar(50) not null,
Product_Category varchar(100),
Ordered_Item varchar(100) not null,
Contact_No varchar(15) unique
);
desc Orders;

# 1. Add a new column named “order_quantity” to the orders table.
alter table Orders add Order_QTY int check (Order_QTY >0);
desc Orders;

# 2. Rename the orders table to the sales_orders table. 
rename table Orders to Sales_Orders;
desc Sales_Orders;

# 3. Insert 10 rows into the sales_orders table. 
insert into Sales_Orders (Order_Id, Customer_Name, Product_Category, Ordered_Item, Contact_No, Order_QTY) values
(001,'Robert','White_Goods','Washing_Machine','987654321','5'),
(002,'Downey','Furniture','Table','987654322','4'),
(003,'Steve','Textile','Suit','987654323','8'),
(004,'Roger','Electronics','Mobile','987654324','2'),
(005,'Bruce','White_Goods','Dish_Washer','987654325','9'),
(006,'Banner','White_Goods','Oven','987654326','3'),
(007,'Peter','Electronics','Laptop','987654327','1'),
(008,'Parker','Electronics','Tablet','987654328','1'),
(009,'Hawkeye','Furniture','Sofa','987654329','10'),
(010,'Wayne','Textile','Sherwani','987654320','25');

select * from Sales_Orders;

# 4. Retrieve customer_name and Ordered_Item from the sales_orders table. 
Select Customer_Name, Ordered_item from Sales_Orders;

# 5. Use the update command to change the name of the product for any row. 
update Sales_Orders
set Ordered_Item = 'MicrowaveOven'
where Customer_Name = 'Banner' and Product_Category = 'White_Goods';
update Sales_Orders
set Ordered_Item = 'Tracksuit'
where Customer_Name = 'Steve';

select * from Sales_Orders;

# 6. Delete the sales_orders table from the database.
drop table Sales_Orders;

desc Sales_Orders;