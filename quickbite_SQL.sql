CREATE DATABASE quickbite_oltp;

USE quickbite_oltp;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    gender VARCHAR(20),
    phone VARCHAR(30),
    email VARCHAR(100),
    city VARCHAR(50),
    state_name VARCHAR(50),
    pincode VARCHAR(10),
    date_of_birth DATE,
    registration_date DATE
);

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    state_name VARCHAR(50),
    cuisine_type VARCHAR(50),
    rating DECIMAL(3,2),
    opening_year INT
);

CREATE TABLE delivery_partners (
    partner_id INT PRIMARY KEY,
    partner_name VARCHAR(100),
    city VARCHAR(50),
    vehicle_type VARCHAR(50),
    joining_date DATE,
    rating DECIMAL(3,2)
);

CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    partner_id INT,
    order_date DATETIME,
    order_status VARCHAR(50),
    payment_method VARCHAR(50),
    delivery_fee DECIMAL(10,2),
    discount_amount DECIMAL(10,2),
    tax_amount DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    delivery_time_mins INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (partner_id) REFERENCES delivery_partners(partner_id)
);

CREATE TABLE order_items (
    item_id BIGINT PRIMARY KEY,
    order_id BIGINT,
    item_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    item_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers VALUES
(1001,'Rahul Sharma','Male','9876543210','rahul.sharma@gmail.com','Hyderabad','Telangana','500081','1998-04-10','2023-01-15'),
(1002,'Priya Verma','Female','9988776655','priya.verma@gmail.com','Mumbai','Maharashtra','400001','1997-05-12','2023-02-18'),
(1003,'Arjun Rao','Male','9001122334','arjun.rao@gmail.com','Bangalore','Karnataka','560001','1995-07-20','2023-03-10'),
(1004,'Sneha Reddy','Female','9876501234','sneha.reddy@gmail.com','Chennai','Tamil Nadu','600001','1999-11-22','2023-04-11'),
(1005,'Kiran Kumar','Male','8887766554','kiran.kumar@gmail.com','Delhi','Delhi','110001','2000-06-15','2023-05-09'),
(1006,'Ananya Das','Female','7776655443','ananya.das@gmail.com','Kolkata','West Bengal','700001','1996-03-08','2023-06-01'),
(1007,'Vikram Singh','Male','9998887776','vikram.singh@gmail.com','Pune','Maharashtra','411001','1994-01-16','2023-06-21'),
(1008,'Pooja Mehta','Female','9871234560','pooja.mehta@gmail.com','Ahmedabad','Gujarat','380001','1998-09-09','2023-07-14'),
(1009,'Rohit Yadav','Male','98765432123456','rohit.yadav@gmail.com','Hyderabad','Telangana','500032','1993-12-12','2023-08-12'),
(1010,'Neha Kapoor','FEMALE','abcdefghij','neha.kapoor@gmail.com','Mumbai','Maharashtra','400045','2001-02-19','2023-08-20'),
(1011,'Amit Joshi','M','9123456789','amit.joshi@gmail.com','Jaipur','Rajasthan','302001','1997-10-05','2023-09-05'),
(1012,'Lavanya Iyer',NULL,'9988123456','lavanya.iyer@gmail.com','Chennai','Tamil Nadu','600028','1998-08-18','2023-09-22'),
(1013,'Sai Teja','Male','12345','saiteja@gmail.com','Visakhapatnam','Andhra Pradesh','530001','2000-07-11','2023-10-02'),
(1014,'Divya Nair','Female','9090909090','divya.nair@gmail.com','Kochi','Kerala','682001','1996-04-14','2023-10-17'),
(1015,'Harsha Vardhan','Male','9390614019','harsha@gmail.com','Hyderabad','Telangana','500090','2001-07-13','2023-11-01');

INSERT INTO restaurants VALUES
(201,'Paradise Biryani','Hyderabad','Telangana','Indian',4.50,1995),
(202,'Mehfil','Hyderabad','Telangana','Indian',4.20,2002),
(203,'Burger Kingdom','Mumbai','Maharashtra','Fast Food',4.00,2015),
(204,'Pizza Delight','Bangalore','Karnataka','Italian',4.30,2018),
(205,'Spice Route','Delhi','Delhi','North Indian',4.60,2010),
(206,'Dosa Plaza','Chennai','Tamil Nadu','South Indian',4.10,2012),
(207,'Sushi Zen','Bangalore','Karnataka','Japanese',4.70,2020),
(208,'Tandoori Nights','Pune','Maharashtra','Indian',4.40,2011),
(209,'Chinese Wok','Kolkata','West Bengal','Chinese',4.00,2016),
(210,'Cafe Mocha','Ahmedabad','Gujarat','Cafe',4.20,2017);

INSERT INTO delivery_partners VALUES
(301,'Ravi Kumar','Hyderabad','Bike','2023-01-10',4.50),
(302,'Aman Verma','Mumbai','Scooter','2023-02-12',4.20),
(303,'Suresh Patel','Bangalore','Bike','2023-03-15',4.70),
(304,'Imran Khan','Delhi','Electric Bike','2023-04-01',4.10),
(305,'Karthik','Chennai','Scooter','2023-05-05',4.00),
(306,'Ramesh Yadav','Pune','Bike','2023-06-08',4.60),
(307,'Ajay Singh','Kolkata','Cycle','2023-07-11',3.90),
(308,'Naveen','Ahmedabad','Bike','2023-08-19',4.30),
(309,'Vikas Sharma','Hyderabad','Electric Bike','2023-09-20',4.80),
(310,'Pradeep','Bangalore','Scooter','2023-10-25',4.10);

INSERT INTO orders VALUES
(500001,1001,201,301,'2025-01-01 12:30:00','Delivered','UPI',35,50,18,450,28),
(500002,1002,203,302,'2025-01-01 13:10:00','Delivered','Card',40,20,25,620,32),
(500003,1003,204,303,'2025-01-02 19:20:00','Cancelled','Wallet',30,0,12,300,0),
(500004,1004,206,305,'2025-01-03 08:45:00','Delivered','Cash',25,10,8,220,18),
(500005,1005,205,304,'2025-01-03 20:15:00','Delivered','UPI',45,60,30,850,40),
(500006,1006,209,307,'2025-01-04 14:10:00','Delivered','Card',30,25,15,540,29),
(500007,1007,208,306,'2025-01-05 21:00:00','Delivered','UPI',40,35,24,760,36),
(500008,1008,210,308,'2025-01-06 17:35:00','Delivered','Wallet',20,15,10,280,22),
(500009,1009,201,309,'2025-01-07 12:50:00','Refunded','UPI',35,0,18,420,0),
(500010,1010,203,302,'2025-01-08 13:15:00','Delivered','Card',25,20,14,350,31),
(500011,1011,207,303,'2025-01-09 20:40:00','Delivered','UPI',50,40,35,1200,42),
(500012,1012,206,305,'2025-01-10 09:15:00','Delivered','Cash',20,5,9,180,17),
(500013,1013,202,301,'2025-01-11 22:00:00','Delivered','Wallet',45,60,28,900,39),
(500014,1014,209,307,'2025-01-12 15:45:00','Delivered','Card',30,15,16,430,25),
(500015,1015,201,309,'2025-01-13 19:10:00','Delivered','UPI',35,30,20,670,27),
(500016,1001,205,304,'2025-01-14 20:30:00','Delivered','UPI',40,50,26,780,33),
(500017,1002,210,308,'2025-01-15 11:45:00','Cancelled','Wallet',20,0,5,150,0),
(500018,1003,204,310,'2025-01-16 18:20:00','Delivered','Card',25,18,12,390,24),
(500019,1004,202,301,'2025-01-17 21:50:00','Delivered','Cash',30,20,14,520,35),
(500020,1005,207,303,'2025-01-18 13:40:00','Delivered','UPI',55,45,32,1350,44);

INSERT INTO order_items VALUES
(700001,500001,'Chicken Biryani','Main Course',2,180),
(700002,500001,'Coke','Beverages',2,45),
(700003,500002,'Cheese Burger','Fast Food',2,220),
(700004,500002,'French Fries','Snacks',1,120),
(700005,500003,'Farmhouse Pizza','Pizza',1,300),
(700006,500004,'Masala Dosa','South Indian',2,90),
(700007,500005,'Butter Chicken','Main Course',2,350),
(700008,500005,'Naan','Breads',4,30),
(700009,500006,'Hakka Noodles','Chinese',2,180),
(700010,500006,'Spring Rolls','Snacks',1,120),
(700011,500007,'Paneer Tikka','Starters',2,250),
(700012,500007,'Butter Naan','Breads',4,40),
(700013,500008,'Cold Coffee','Beverages',2,120),
(700014,500008,'Brownie','Desserts',1,140),
(700015,500009,'Mutton Biryani','Main Course',1,420),
(700016,500010,'Veg Burger','Fast Food',2,150),
(700017,500011,'Sushi Platter','Japanese',2,500),
(700018,500011,'Miso Soup','Soups',2,100),
(700019,500012,'Idli','South Indian',3,50),
(700020,500013,'Special Biryani','Main Course',3,260),
(700021,500014,'Fried Rice','Chinese',2,180),
(700022,500015,'Chicken 65','Starters',2,220),
(700023,500016,'Paneer Butter Masala','Main Course',2,300),
(700024,500017,'Cafe Latte','Beverages',1,150),
(700025,500018,'Veg Pizza','Pizza',1,350),
(700026,500019,'Double Ka Meetha','Desserts',2,120),
(700027,500020,'Dragon Roll Sushi','Japanese',2,550);

SELECT * FROM customers;

SELECT * FROM restaurants;

SELECT * FROM delivery_partners;

SELECT * FROM orders;

SELECT * FROM order_items;

SELECT COUNT(*) AS total_customers FROM customers;

SELECT COUNT(*) AS total_orders FROM orders;

SELECT SUM(total_amount) AS total_revenue
FROM orders;

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

SELECT payment_method,
       COUNT(*) AS total_transactions
FROM orders
GROUP BY payment_method
ORDER BY total_transactions DESC;

SELECT order_status,
       COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

SELECT r.restaurant_name,
       SUM(o.total_amount) AS revenue
FROM orders o
JOIN restaurants r
ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY revenue DESC;

SELECT MONTH(order_date) AS order_month,
       SUM(total_amount) AS monthly_revenue
FROM orders
GROUP BY MONTH(order_date)
ORDER BY order_month;

SELECT c.city,
       AVG(o.delivery_time_mins) AS avg_delivery_time
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city
ORDER BY avg_delivery_time;

SELECT category,
       SUM(quantity) AS total_quantity
FROM order_items
GROUP BY category
ORDER BY total_quantity DESC;

SELECT c.full_name,
       COUNT(o.order_id) AS total_orders,
       SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.full_name
ORDER BY total_spent DESC;

DELETE FROM order_items;

DELETE FROM orders;
show errors;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE order_items;

TRUNCATE TABLE orders;

SET FOREIGN_KEY_CHECKS = 1;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM order_items;

DELETE FROM orders;

SET SQL_SAFE_UPDATES = 1;

SELECT COUNT(*) FROM orders;

SELECT COUNT(*) FROM order_items;

INSERT INTO orders VALUES
(500001,1001,201,301,'2025-01-01 12:30:00','Delivered','UPI',35,50,18,450,28),
(500002,1002,203,302,'2025-01-03 13:10:00','Delivered','Card',40,20,25,620,32),
(500003,1003,204,303,'2025-01-05 19:20:00','Cancelled','Wallet',30,0,12,300,0),
(500004,1004,206,305,'2025-01-07 08:45:00','Delivered','Cash',25,10,8,220,18),
(500005,1005,205,304,'2025-01-09 20:15:00','Delivered','UPI',45,60,30,850,40),
(500006,1006,209,307,'2025-01-11 14:10:00','Delivered','Card',30,25,15,540,29),
(500007,1007,208,306,'2025-01-13 21:00:00','Delivered','UPI',40,35,24,760,36),
(500008,1008,210,308,'2025-01-15 17:35:00','Delivered','Wallet',20,15,10,280,22),

(500009,1009,201,309,'2025-02-01 12:50:00','Delivered','UPI',35,0,18,720,26),
(500010,1010,203,302,'2025-02-03 13:15:00','Delivered','Card',25,20,14,350,31),
(500011,1011,207,303,'2025-02-05 20:40:00','Delivered','UPI',50,40,35,1200,42),
(500012,1012,206,305,'2025-02-07 09:15:00','Delivered','Cash',20,5,9,180,17),
(500013,1013,202,301,'2025-02-09 22:00:00','Delivered','Wallet',45,60,28,900,39),
(500014,1014,209,307,'2025-02-11 15:45:00','Delivered','Card',30,15,16,430,25),
(500015,1015,201,309,'2025-02-13 19:10:00','Delivered','UPI',35,30,20,670,27),
(500016,1001,205,304,'2025-02-15 20:30:00','Delivered','UPI',40,50,26,980,33),

(500017,1002,210,308,'2025-03-01 11:45:00','Cancelled','Wallet',20,0,5,150,0),
(500018,1003,204,310,'2025-03-03 18:20:00','Delivered','Card',25,18,12,390,24),
(500019,1004,202,301,'2025-03-05 21:50:00','Delivered','Cash',30,20,14,520,35),
(500020,1005,207,303,'2025-03-07 13:40:00','Delivered','UPI',55,45,32,1350,44),
(500021,1006,201,301,'2025-03-09 12:30:00','Delivered','UPI',35,50,18,840,28),
(500022,1007,205,304,'2025-03-11 20:15:00','Delivered','Card',40,30,20,960,36),
(500023,1008,208,306,'2025-03-13 19:00:00','Delivered','UPI',45,35,25,780,31),
(500024,1009,210,308,'2025-03-15 17:35:00','Delivered','Wallet',20,15,10,340,22),

(500025,1010,201,309,'2025-04-01 12:50:00','Delivered','UPI',35,0,18,920,26),
(500026,1011,207,303,'2025-04-03 20:40:00','Delivered','UPI',50,40,35,1450,42),
(500027,1012,206,305,'2025-04-05 09:15:00','Delivered','Cash',20,5,9,280,17),
(500028,1013,202,301,'2025-04-07 22:00:00','Delivered','Wallet',45,60,28,980,39),
(500029,1014,209,307,'2025-04-09 15:45:00','Delivered','Card',30,15,16,540,25),
(500030,1015,201,309,'2025-04-11 19:10:00','Delivered','UPI',35,30,20,870,27),
(500031,1001,205,304,'2025-04-13 20:30:00','Delivered','UPI',40,50,26,1250,33),
(500032,1002,210,308,'2025-04-15 11:45:00','Refunded','Wallet',20,0,5,150,0),

(500033,1003,204,310,'2025-05-01 18:20:00','Delivered','Card',25,18,12,690,24),
(500034,1004,202,301,'2025-05-03 21:50:00','Delivered','Cash',30,20,14,720,35),
(500035,1005,207,303,'2025-05-05 13:40:00','Delivered','UPI',55,45,32,1650,44),
(500036,1006,201,301,'2025-05-07 12:30:00','Delivered','UPI',35,50,18,1140,28),
(500037,1007,205,304,'2025-05-09 20:15:00','Delivered','Card',40,30,20,1260,36),
(500038,1008,208,306,'2025-05-11 19:00:00','Delivered','UPI',45,35,25,980,31),
(500039,1009,210,308,'2025-05-13 17:35:00','Delivered','Wallet',20,15,10,540,22),
(500040,1010,201,309,'2025-05-15 12:50:00','Delivered','UPI',35,0,18,1320,26);

INSERT INTO order_items VALUES
(700001,500001,'Chicken Biryani','Main Course',2,180),
(700002,500002,'Burger Combo','Fast Food',2,250),
(700003,500003,'Veg Pizza','Pizza',1,300),
(700004,500004,'Masala Dosa','South Indian',2,90),
(700005,500005,'Butter Chicken','Main Course',2,350),
(700006,500006,'Hakka Noodles','Chinese',2,180),
(700007,500007,'Paneer Tikka','Starters',2,250),
(700008,500008,'Cold Coffee','Beverages',2,120),
(700009,500009,'Mutton Biryani','Main Course',2,320),
(700010,500010,'Veg Burger','Fast Food',2,150),
(700011,500011,'Sushi Platter','Japanese',2,500),
(700012,500012,'Idli','South Indian',3,50),
(700013,500013,'Special Biryani','Main Course',3,260),
(700014,500014,'Fried Rice','Chinese',2,180),
(700015,500015,'Chicken 65','Starters',2,220),
(700016,500016,'Paneer Butter Masala','Main Course',2,300);

-- =====================================================
-- E1 — WHICH CITY HAS THE MOST ORDERS?
-- =====================================================

SELECT
    c.city,
    COUNT(o.order_id) AS total_orders
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_orders DESC;

-- =====================================================
-- E2 — WHAT IS THE MOST POPULAR CUISINE?
-- =====================================================

SELECT
    r.cuisine_type,
    COUNT(o.order_id) AS total_orders
FROM orders o
JOIN restaurants r
ON o.restaurant_id = r.restaurant_id
GROUP BY r.cuisine_type
ORDER BY total_orders DESC;

-- =====================================================
-- E3 — WHAT PERCENTAGE OF ORDERS USE OFFERS/COUPONS?
-- =====================================================

SELECT
    ROUND(
        (
            COUNT(
                CASE
                    WHEN discount_amount > 0 THEN 1
                END
            ) * 100.0
        ) / COUNT(*),
        2
    ) AS coupon_usage_percentage
FROM orders;

-- =====================================================
-- E4 — WHAT IS THE AVERAGE RESTAURANT RATING?
-- =====================================================

SELECT
    ROUND(AVG(rating), 2) AS average_restaurant_rating
FROM restaurants;

-- =====================================================
-- E5 — HOW MANY DELIVERY PARTNERS USE EACH VEHICLE TYPE?
-- =====================================================

SELECT
    vehicle_type,
    COUNT(*) AS total_delivery_partners
FROM delivery_partners
GROUP BY vehicle_type
ORDER BY total_delivery_partners DESC;

-- =====================================================
-- E6 — WHICH PAYMENT METHOD IS MOST POPULAR?
-- =====================================================

SELECT
    payment_method,
    COUNT(*) AS total_transactions
FROM orders
GROUP BY payment_method
ORDER BY total_transactions DESC;

-- =====================================================
-- E7 — HOW MANY CUSTOMERS REGISTERED IN EACH YEAR?
-- =====================================================

SELECT
    YEAR(registration_date) AS registration_year,
    COUNT(*) AS total_customers
FROM customers
GROUP BY YEAR(registration_date)
ORDER BY registration_year;

-- =====================================================
-- BONUS INSIGHT 1 — MONTHLY REVENUE TREND
-- =====================================================

SELECT
    MONTH(order_date) AS month_no,
    MONTHNAME(order_date) AS month_name,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY month_no;

-- =====================================================
-- BONUS INSIGHT 2 — TOP RESTAURANTS BY REVENUE
-- =====================================================

SELECT
    r.restaurant_name,
    SUM(o.total_amount) AS revenue
FROM orders o
JOIN restaurants r
ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY revenue DESC;

-- =====================================================
-- BONUS INSIGHT 3 — ORDER STATUS ANALYSIS
-- =====================================================

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- =====================================================
-- BONUS INSIGHT 4 — AVERAGE DELIVERY TIME BY CITY
-- =====================================================

SELECT
    c.city,
    ROUND(AVG(o.delivery_time_mins),2) AS avg_delivery_time
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city
ORDER BY avg_delivery_time;

-- =====================================================
-- BONUS INSIGHT 5 — TOP SPENDING CUSTOMERS
-- =====================================================

SELECT
    c.full_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.full_name
ORDER BY total_spent DESC;

-- =====================================================
-- BONUS INSIGHT 6 — MOST ORDERED FOOD CATEGORY
-- =====================================================

SELECT
    category,
    SUM(quantity) AS total_quantity
FROM order_items
GROUP BY category
ORDER BY total_quantity DESC;

-- =====================================================
-- BONUS INSIGHT 7 — REVENUE BY PAYMENT METHOD
-- =====================================================

SELECT
    payment_method,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY payment_method
ORDER BY total_revenue DESC;