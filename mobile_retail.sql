CREATE DATABASE mobile_retail;


CREATE TABLE depot
(
	depot_no INT,
	depot_name VARCHAR(30) NOT NULL,
	PRIMARY KEY(depot_no));

INSERT INTO depot VALUES(101,'RR NAGAR-1'); 
INSERT INTO depot VALUES(102,'COSMO RETAILS'); 
INSERT INTO depot VALUES(103,'IMPERIAL STOCKS'); 
INSERT INTO depot VALUES(104,'SHANTHI TRADERS');
	
CREATE TABLE workman
(
	workman_id INT,
	workman_name VARCHAR(20) NOT NULL,
	contact_no VARCHAR(11) NOT NULL,
	email VARCHAR(30) NOT NULL,
	gender VARCHAR(1) NOT NULL CHECK(gender='M' OR gender='F' OR gender='O'),
	address VARCHAR(40) NOT NULL,
	salary FLOAT NOT NULL,
	PRIMARY KEY(workman_id));

INSERT INTO workman VALUES(1011,'Ramesh','9545341211','ramesh121@gmail.com','M','#201,Rajajinagar, Bangalore-87',12500);
INSERT INTO workman VALUES(1012,'Shruti','9545341211','shruti101@gmail.com','F','#234,Vijayanagr, Bangalore- 78',22500);
INSERT INTO workman VALUES(1013,'Ramya','9545341211','ramya_321@gmail.com','F','#45, RR Nagar, Bangalore-98',13500);
INSERT INTO workman VALUES(1014,'Harish','9545341211','harish.ak@gmail.com','M','#32,Deepanjali Nagar,Bangalore-84',8500);
INSERT INTO workman VALUES(1015,'Mary','9545341211','maryjoseph@gmail.com','F','#49, Rajajinagar,Bangalore-87',11500);
INSERT INTO workman VALUES(1016,'Sumanth','9545341211','sumath_ar@gmail.com','M','#21,Rajajinagar,Bangal ore-87',12500);
INSERT INTO workman VALUES(1017,'Amar','9545341211','amarrnatheshwar@gmail.com','M','#76,Chandra Layout,Bangalore-47',21500);
INSERT INTO workman VALUES(1018,'Dhanush','9545341211','dhanush_k@gmail.com','M','#28, KR Palya,Bangalore-81',23500);
INSERT INTO workman VALUES(1019,'Aishwarya','9545341211','aishu121@gmail.com','F','#286, Rajajinagar,Bangalore-87',12500);
INSERT INTO workman VALUES(1020,'Deepak','9545341211','deepakrao@gmail.com','M','#34,RR Nagar,Bangalore-98',20500);
	
CREATE TABLE customer
(
	customer_id INT,
	customer_name VARCHAR(20) NOT NULL,
	contact_no VARCHAR(11) NOT NULL,
	email VARCHAR(30) ,
	address VARCHAR(40),
	PRIMARY KEY(customer_id));

INSERT INTO customer VALUES(2003,'Chethan R','9876543210','cheth@gmx.com','Aarohi, 6th main, Vijaynagar');
INSERT INTO customer VALUES(2004,'Ragahvendra M','9686263452','raghs34@gmail.com','Avani, 7th block, Rajajinagar');
INSERT INTO customer VALUES(2007,'Yash Purohit','7656453478',NULL);


CREATE TABLE department
(
	department_id VARCHAR(5),
	department_name VARCHAR(30) NOT NULL,
	incharge_id INT,
	PRIMARY KEY(department_id),
	FOREIGN KEY(incharge_id) REFERENCES workman(workman_id) ON DELETE SET NULL ON UPDATE CASCADE);

INSERT INTO department VALUES('PH000','Mobile Phones',1012);
INSERT INTO department VALUES('AC000','Mobile Accessories',1018); 
INSERT INTO department VALUES('PR000','Mobile Protection',1020);

CREATE TABLE category
(
	category_id VARCHAR(6),
	category_name VARCHAR(30) NOT NULL,
	department_id VARCHAR(5),
	depot_no INT NOT NULL,
	PRIMARY KEY(category_id),
	FOREIGN KEY(department_id) REFERENCES department(department_id) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY(depot_no) REFERENCES depot(depot_no) ON DELETE SET NULL ON UPDATE CASCADE);

INSERT INTO category VALUES('PH101','Flip Phones','PH000',101); 
INSERT INTO category VALUES('PH102','Full Screen Phones','PH000',103); 
INSERT INTO category VALUES('PH103','Keypad Phones','PH000',103);

INSERT INTO category VALUES('AC101','Earphones','AC000',102); 
INSERT INTO category VALUES('AC102','Headphones','AC000',102); 
INSERT INTO category VALUES('AC103','Chargers','AC000',102);

INSERT INTO category VALUES('PR101','tempered glass','PR000',103);
INSERT INTO category VALUES('PR102','protection covers','PR000',103); 
INSERT INTO category VALUES('PR103','warranty extension','PR000',103);


CREATE TABLE item
(
	item_id VARCHAR(6),
	category_id VARCHAR(6),
	item_name VARCHAR(30) NOT NULL,
	brand VARCHAR(20),
	--weight VARCHAR(10)  NOT NULL,
	selling_price FLOAT NOT NULL,
	cost_price FLOAT NOT NULL,
	department_count FLOAT NOT NULL,
	depot_count FLOAT NOT NULL,
	PRIMARY KEY(item_id),
	FOREIGN KEY(category_id) REFERENCES category(category_id) ON DELETE SET NULL ON UPDATE CASCADE);

INSERT INTO item VALUES('PT101','PH101','blackberry flip','Blackberry',50000,43000,100,250);
INSERT INTO item VALUES('PT102','PH101','samsung fold','Samsung',140000,110000,100,250);

INSERT INTO item VALUES('PT105','PH102','iphone 11','Apple',70000,64000,40,100);
INSERT INTO item VALUES('PT106','PH102','iphone 11 pro','Apple',118000,106000,40,100);
INSERT INTO item VALUES('PT107','PH102','one plus 8','Oneplus',50000,44000,50,150);
INSERT INTO item VALUES('PT108','PH102','samsung s20','Samsung',90000,81000,50,150); 
INSERT INTO item VALUES('PT109','PH102','huawei p30','Huawei',45000,30000,60,100); 

INSERT INTO item VALUES('PT110','PH103','nokia 7630','Nokia',2000,1800,45,100);
INSERT INTO item VALUES('PT111','PH103','nokia keypad pro','Nokia',4000,3600,45,100);
INSERT INTO item VALUES('PT112','PH103','samsung s2101 keypad','Samsung',2500,2400,50,100);
INSERT INTO item VALUES('PT113','PH103','blackberry ultra keypad','Blackberry',10000,8500,50,150);



INSERT INTO item VALUES('PT138','AC101','philips lite bass','Philips',1200,1100,30,400); 
INSERT INTO item VALUES('PT139','AC101','Airpods 2','Apple',14500,13000,5,20);
INSERT INTO item VALUES('PT140','AC101','sony mdr extra bass','Sony',2200,1950,3,3); 
INSERT INTO item VALUES('PT141','AC101','oneplus shots','Oneplus',6000,5500,5,10); 

INSERT INTO item VALUES('PT142','AC102','Bose soundtrue','Bose',20000,18000,10,120);
INSERT INTO item VALUES('PT143','AC102','marshaal wireless3','Marshaal',7500,5400,10,100); 

INSERT INTO item VALUES('PT144','AC103','Apple fast C-type','Apple',3500,3200,3,70); 
INSERT INTO item VALUES('PT145','AC103','samsung d-type','Samsung',1450,1100,10,100); 
INSERT INTO item VALUES('PT146','AC103','14w travel charger','Onplus',3200,3000,5,90);
INSERT INTO item VALUES('PT147','AC103','multiple ex charger','Blackberry',900,850,10,80); 



INSERT INTO item VALUES('PT152','PR101','A1 quality t-glass','Spigen',1000,800,20,100);
INSERT INTO item VALUES('PT153','PR101','A2 quality t-glass','T-glass company',800,600,20,200); 
INSERT INTO item VALUES('PT154','PR101','A3 quality t-glass','Phone Warrior',500,400,50,150); 
INSERT INTO item VALUES('PT155','PR101','A4 quality t-glass','Sheild',200,150,15,100); 

INSERT INTO item VALUES('PT156','PR102','apple protection cover','Apple',3500,3000,30,400);
INSERT INTO item VALUES('PT157','PR102','samsung protection cover','Samsung',2500,2200,40,350);
INSERT INTO item VALUES('PT158','PR102','oneplus protection cover','Oneplus',1500,1000,15,300);
INSERT INTO item VALUES('PT159','PR102','huawei protection cover','Huawei',500,460,10,80); 

INSERT INTO item VALUES('PT164','PR103','Apple warranty extension plan','Apple',8000,7900,50,500); 
INSERT INTO item VALUES('PT165','PR103','samsung warranty ext plan','Samsung',6000,5800,80,600); 
INSERT INTO item VALUES('PT166','PR103','oneplus warranty ext plan','Oneplus',4000,3900,50,400); 
INSERT INTO item VALUES('PT167','PR103','blackberry warranty ext plan','Blackberry',3500,3400,30,550);
INSERT INTO item VALUES('PT168','PR103','huawei warranty ext plan','Huawei',3300,3200,10,50);
	
CREATE TABLE payment
(
	payment_id INT,
	customer_id INT,
	amount FLOAT NOT NULL,
	payment_date DATE NOT NULL,
	cashier_id INT,
	PRIMARY KEY(payment_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY(cashier_id) REFERENCES workman(workman_id) ON DELETE SET NULL ON UPDATE CASCADE);

INSERT INTO payment VALUES(1011,2003,93650,'2020-05-16',1013); 
INSERT INTO payment VALUES(1012,2004,21000,'2020-05-18',1019);
INSERT INTO payment VALUES(1013,2007,53000,'2020-05-19',1019); 
	
CREATE TABLE orders
(
	payment_id INT,
	item_id VARCHAR(6),
	quantity FLOAT,
	cost FLOAT,
	PRIMARY KEY(payment_id,item_id),
	FOREIGN KEY(payment_id) REFERENCES payment(payment_id) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY(item_id) REFERENCES item(item_id) ON DELETE SET NULL ON UPDATE CASCADE);


INSERT INTO orders VALUES(1011,'PT108',1,90000);
INSERT INTO orders VALUES(1011,'PT140',1,2200);
INSERT INTO orders VALUES(1011,'PT145',1,1450);

 INSERT INTO orders VALUES(1012,'PT164',1,8000);
INSERT INTO orders VALUES(1012,'PT156',4,14000);

INSERT INTO orders VALUES(1013,'PT167',1,3500);
INSERT INTO orders VALUES(1013,'PT101',1,50000);







-----------------

-- INSERT INTO item VALUES('PT101','PH101','Apple','Organic Farm','1kg',230,190,100,250);
-- INSERT INTO item VALUES('PT102','PH101','Orange','Organic Farm','1kg',85,55,100,250);
-- INSERT INTO item VALUES('PT105','PH102','Mustard Oil','Nature Fresh','1 ltr',180,150,40,100);
-- INSERT INTO item VALUES('PT106','PH102','Sunflower Oil','Nature Fresh','1 ltr',200,175,40,100);
-- INSERT INTO item VALUES('PT107','PH102','Turmeric Powder','Aachi masala','500g',65,50,50,150);
-- INSERT INTO item VALUES('PT108','PH102','Salt','Tata','500g',55,45,50,150); 
-- INSERT INTO item VALUES('PT109','PH102','Sugar','BigSugar','500g',45,30,60,100); 
-- INSERT INTO item VALUES('PT110','PH103','Almond','UAE Indus','1kg',1250,1000,45,100);
-- INSERT INTO item VALUES('PT111','PH103','Cashew','UAE Indus','1kg',890,680,45,100);
-- INSERT INTO item VALUES('PT112','PH103','Dry grapes','Arab Goals','1kg',785,615,50,100);
-- INSERT INTO item VALUES('PT113','PH103','Apricot','Arab fruits','1kg',800,670,50,150);

-- INSERT INTO item VALUES('PT138','AC101','Bulb','Philips','1',20,15,30,400); 
-- INSERT INTO item VALUES('PT139','AC101','Lantern Light','Havells','1',1900,1500,5,20);
-- INSERT INTO item VALUES('PT140','AC101','Bed Lamp','Philips','1',1150,950,3,3); 
-- INSERT INTO item VALUES('PT141','AC101','Fan','Crompton','1',1200,1000,5,10); 
-- INSERT INTO item VALUES('PT142','AC102','Beard Trimmer','Philips','1',1100,900,10,120);
-- INSERT INTO item VALUES('PT143','AC102','Shaver','Panasonic','1',1500,1400,10,100); 
-- INSERT INTO item VALUES('PT144','AC103','Analogue','Titan','1',3500,3200,3,70); 
-- INSERT INTO item VALUES('PT145','AC103','Digital','Fastrack','1',450,400,10,100); 
-- INSERT INTO item VALUES('PT146','AC103','Mens Training watch','Fitbit','1',3200,3000,5,90);
-- INSERT INTO item VALUES('PT147','AC103','SOS Watch','Excelmer','1',900,850,10,80); 

-- INSERT INTO item VALUES('PT152','PR101','A4 sheets','JK copies','1',600,560,20,100);
-- INSERT INTO item VALUES('PT153','PR101','Highlighter','Camlin','1',30,27,20,200); 
-- INSERT INTO item VALUES('PT154','PR101','Stick Notes','Flair','1',10,8,50,150); 
-- INSERT INTO item VALUES('PT155','PR101','Stapler','Cimic','1',80,75,15,100); 
-- INSERT INTO item VALUES('PT156','PR102','Long notebook- 200pgs','PaperGrid','1',40,36,30,400);
-- INSERT INTO item VALUES('PT157','PR102','King notebook- 100pgs','Classmate','1',25,22,40,350);
-- INSERT INTO item VALUES('PT158','PR102','Writing board','Ethnics','1',250,215,15,300);
-- INSERT INTO item VALUES('PT159','PR102','Sketch book','Rober','1',50,46,10,80); 
-- INSERT INTO item VALUES('PT164','PR103','Gel Pen','Reynolds','1',20,17,50,500); 
-- INSERT INTO item VALUES('PT165','PR103','Ball point pen','Rorito','1',10,8,80,600); 
-- INSERT INTO item VALUES('PT166','PR103','Microtip Pencil','Camlin','1',30,26,50,400); 
-- INSERT INTO item VALUES('PT167','PR103','Eraser','Apsara','1',10,8,30,550);
-- INSERT INTO item VALUES('PT168','PR103','Fountain Pen','Parker','1',150,145,10,50);