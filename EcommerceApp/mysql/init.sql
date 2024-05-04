USE ecommerce_app;

CREATE TABLE brand (
    bid INT DEFAULT NULL,
    bname VARCHAR(50) DEFAULT NULL
);

INSERT INTO brand VALUES 
(1,'samsung'),
(2,'sony'),
(3,'lenovo'),
(4,'acer'),
(5,'onida');

CREATE TABLE cart (
    Name VARCHAR(100) DEFAULT NULL,
    bname VARCHAR(50) DEFAULT NULL,
    cname VARCHAR(50) DEFAULT NULL,
    pname VARCHAR(50) DEFAULT NULL,
    pprice INT DEFAULT NULL,
    pquantity INT DEFAULT NULL,
    pimage VARCHAR(200) DEFAULT NULL
);

CREATE TABLE category (
    cid INT DEFAULT NULL,
    cname VARCHAR(50) DEFAULT NULL
);

INSERT INTO category VALUES 
(1,'laptop'),
(2,'tv'),
(3,'mobile'),
(4,'watch');

CREATE TABLE contactus (
    id INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100) DEFAULT NULL,
    Email_Id VARCHAR(100) DEFAULT NULL,
    Contact_No INT DEFAULT NULL,
    Message VARCHAR(8000) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE customer (
    Name VARCHAR(100) DEFAULT NULL,
    Password VARCHAR(20) DEFAULT NULL,
    Email_Id VARCHAR(100) DEFAULT NULL,
    Contact_No INT DEFAULT NULL
);

CREATE TABLE login (
    username VARCHAR(100) DEFAULT NULL,
    password VARCHAR(100) DEFAULT NULL
);

INSERT INTO login VALUES ('admin','admin');

CREATE TABLE order_details (
    Date VARCHAR(100) DEFAULT NULL,
    Name VARCHAR(100) DEFAULT NULL,
    bname VARCHAR(50) DEFAULT NULL,
    cname VARCHAR(50) DEFAULT NULL,
    pname VARCHAR(50) DEFAULT NULL,
    pprice INT DEFAULT NULL,
    pquantity INT DEFAULT NULL,
    pimage VARCHAR(200) DEFAULT NULL
);

CREATE TABLE orders (
    Order_Id INT NOT NULL AUTO_INCREMENT,
    Customer_Name VARCHAR(100) DEFAULT NULL,
    Customer_City VARCHAR(45) DEFAULT NULL,
    Date VARCHAR(100) DEFAULT NULL,
    Total_Price INT DEFAULT NULL,
    Status VARCHAR(45) DEFAULT NULL,
    PRIMARY KEY (Order_Id)
);

CREATE TABLE product (
    pid INT NOT NULL AUTO_INCREMENT,
    pname VARCHAR(50) DEFAULT NULL,
    pprice INT DEFAULT NULL,
    pquantity INT DEFAULT NULL,
    pimage VARCHAR(200) DEFAULT NULL,
    bid INT DEFAULT NULL,
    cid INT DEFAULT NULL,
    PRIMARY KEY (pid)
);

INSERT INTO product VALUES 
(5,'sonysmart',50000,1,'sonywatch.webp',2,4),
(6,'GalaxyBook',45000,1,'samsunglaptop.jpg',1,1),
(7,'smarttv',28000,1,'onidatv.jpg',5,2),
(8,'smartphone',15000,1,'lenovomobile.webp',3,3),
(9,'aspire',52000,1,'acerlaptop.jpg',4,1),
(10,'Braviass',52,1,'sonytv.jpg',2,2),
(11,'GalaxyWatch',22000,1,'galaxywatch.webp',1,4),
(14,'kdl',45000,1,'sony kdl.jpg',2,2),
(15,'series a7',21000,1,'acer series a7.jpg',4,2),
(17,'leo',31000,1,'onida leo.jpg',5,2),
(18,'crystal',42000,1,'samsung crystal.webp',1,2),
(19,'Aspire 7',55000,1,'acer aspire7.jpg',4,1),
(20,'ideapad',37000,1,'lenovo ideapad.jpg',3,1),
(21,'legion',51000,1,'lenovo legion.jpg',3,1),
(22,'Galaxy Z Fold3',66000,1,'Galaxy z fold3.jpg',1,3),
(23,'Galaxy S22',55000,1,'Samsung galaxy s22.webp',1,3),
(24,'Xperia 1v',56000,1,'sony xperia 1v.jpg',2,3),
(26,'A850',14500,1,'lenovo a850.jpg',3,3),
(27,'Galaxy watch1',8000,1,'galaxy watch.jpg',1,4),
(28,'Galaxy Watch2',95000,1,'galaxy watch4.jpg',1,4),
(29,'Smart Fit',11000,1,'smart fit.jpg',3,4),
(30,'Sony Smart2',12000,1,'sony smart2.webp',2,4),
(31,'Gaming Predator',120000,1,'Acer Predator.jpg',4,1),
(32,'Liquid',16000,1,'Acer liquid.jpg',4,3),
(33,'Neo QLED',46000,1,'Samsung neo Qled.webp',1,2),
(34,'VAIO',53000,1,'Sony Vaio.jpg',2,1),
(35,'Xperia Z',32000,1,'sonyxperiaz.png',2,3);

CREATE VIEW viewlist AS 
SELECT brand.bname AS bname, category.cname AS cname, product.pname AS pname, product.pprice AS pprice, product.pquantity AS pquantity, product.pimage AS pimage 
FROM brand 
JOIN product ON brand.bid = product.bid
JOIN category ON product.cid = category.cid;

CREATE VIEW mobile AS 
SELECT brand.bname AS bname, category.cname AS cname, product.pname AS pname, product.pprice AS pprice, product.pquantity AS pquantity, product.pimage AS pimage 
FROM brand 
JOIN product ON brand.bid = product.bid
JOIN category ON product.cid = category.cid
WHERE category.cid = 3;

CREATE VIEW laptop AS 
SELECT brand.bname AS bname, category.cname AS cname, product.pname AS pname, product.pprice AS pprice, product.pquantity AS pquantity, product.pimage AS pimage 
FROM brand 
JOIN product ON brand.bid = product.bid
JOIN category ON product.cid = category.cid
WHERE category.cid = 1;

CREATE VIEW tv AS 
SELECT brand.bname AS bname, category.cname AS cname, product.pname AS pname, product.pprice AS pprice, product.pquantity AS pquantity, product.pimage AS pimage 
FROM brand 
JOIN product ON brand.bid = product.bid
JOIN category ON product.cid = category.cid
WHERE category.cid = 2;

CREATE VIEW watch AS 
SELECT brand.bname AS bname, category.cname AS cname, product.pname AS pname, product.pprice AS pprice, product.pquantity AS pquantity, product.pimage AS pimage 
FROM brand 
JOIN product ON brand.bid = product.bid
JOIN category ON product.cid = category.cid
WHERE category.cid = 4;

CREATE TABLE usermaster (
    Name VARCHAR(100) DEFAULT NULL,
    Password VARCHAR(20) DEFAULT NULL
);

INSERT INTO usermaster VALUES ('admin','admin');

CREATE USER 'exporter'@'%' IDENTIFIED BY 'password' WITH MAX_USER_CONNECTIONS 3;
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'%';
GRANT SELECT ON ecommerce_app.* TO 'exporter'@'%';

