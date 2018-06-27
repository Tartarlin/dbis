-- LABORATORY WORK 1
-- BY Babych_Denys
/*3.a*/
SELECT CUST_NAME
FROM CUSTOMERS
WHERE CUST_ID IN (
SELECT CUST_ID
FROM ORDERS
WHERE ORDER_NUM IN (
SELECT ORDER_NUM
FROM ORDERITEMS
WHERE PROD_ID IN (
SELECT PROD_ID
FROM PRODUCTS
WHERE PROD_PRICE IN (
SELECT MAX(PROD_PRICE)
FROM PRODUCTS))));
/*3.b*/
PROJECT CUST_COUNTRY {Customers}
WHERE LEN(CUST_COUNTRY) = MIN(
PROJECT LEN(CUST_COUNTRY) {Customers});
/*3.c*/
PROJECT CUST_COUNTRY,CUST_EMAIL {Customers}
WHERE CUST_ID IN(
(PROJECT CUST_ID {Orders TIMES Orderitems}
WHERE Orders.O
/*2*/
Create Table Book(
book_name VARCHAR2(30) NOT NULL
);
Alter Table Book
ADD CONSTRAINT book_pk PRIMARY KEY (book_name) ;

Create Table Page(
page_num VARCHAR2(30) NOT NULL
);
Alter Table Page
ADD CONSTRAINT page_pk PRIMARY KEY (page_num) ;

Create Table Book_Page(
book_name_fk VARCHAR2(30) NOT NULL,
page_num_fk VARCHAR2(30) NOT NULL,
);
Alter Table Book_Page
 ADD CONSTRAINT book_page_pk PRIMARY KEY (book_name_fk,page_num_fk);

Alter Table Book_Page
ADD CONSTRAINT book_fk FOREIGN KEY (book_name_fk) REFERENCES Book (book_name);

Alter Table Book_Page
ADD CONSTRAINT page_fk FOREIGN KEY (page_num_fk) REFERENCES Page (page_num);
