---Create schema
CREATE schema practica_sarasuadi_vargas authorization ejdvdslu;

---------
---DDL---
---------

---ER Model Tables---

---Colors:

create table practica_sarasuadi_vargas.colors(
id_color varchar(20) not null, --PK
color_name varchar(50) not null,
description varchar(512) null
);

alter table practica_sarasuadi_vargas.colors
add constraint id_color_PK primary key (id_color);

---Insurances:

create table practica_sarasuadi_vargas.insurances(
id_insurance varchar(20) not null, --PK
company_name varchar(50) not null,
policy_number varchar(50) not null,
description varchar(512) null
);

alter table practica_sarasuadi_vargas.insurances
add constraint id_insurance_PK primary key (id_insurance);

---Vehicles:

create table practica_sarasuadi_vargas.vehicles(
id_vehicle varchar(20) not null, --PK
car_plate varchar(50) not null,
car_year varchar(50) not null,
id_color varchar(20) not null, --FK, colors, id_color
km varchar(50) not null,
purchase_date date not null,
id_insurance varchar(20) not null, --FK, insurances, id_insurance
description varchar(512) null
);

alter table practica_sarasuadi_vargas.vehicles
add constraint id_vehicle_PK primary key (id_vehicle);

alter table practica_sarasuadi_vargas.vehicles
add constraint vehicle_colors_FK foreign key (id_color)
references practica_sarasuadi_vargas.colors(id_color);

alter table practica_sarasuadi_vargas.vehicles
add constraint vehicles_insurances_FK foreign key (id_insurance)
references practica_sarasuadi_vargas.insurances(id_insurance);

---Inspections:

create table practica_sarasuadi_vargas.inspections(
id_inspection varchar(20) not null, --PK
inspection_name varchar(50) not null,
description varchar(512) null
);

alter table practica_sarasuadi_vargas.inspections
add constraint id_inspection_PK primary key (id_inspection);

---Currency:

create table practica_sarasuadi_vargas.currencies(
id_currency varchar(20) not null, --PK
currency_name varchar(50) not null,
description varchar(512) null
);

alter table practica_sarasuadi_vargas.currencies
add constraint id_currency_PK primary key (id_currency);

---Brand_groups:

create table practica_sarasuadi_vargas.brand_groups(
id_group varchar(20) not null, --PK
group_name varchar(50) not null,
description varchar(512) null
);

alter table practica_sarasuadi_vargas.brand_groups
add constraint id_group_PK primary key (id_group);

---Brands:
create table practica_sarasuadi_vargas.brands(
id_vehicle varchar(20) not null, --PK, FK
id_brand varchar(50) not null, --PK
brand_name varchar (50),
model varchar(50),
id_group varchar(20) not null, --FK, brand_groups, id_group
description varchar(512) null
);

alter table practica_sarasuadi_vargas.brands
add constraint id_brand_PK primary key (id_vehicle, id_brand);

alter table practica_sarasuadi_vargas.brands
add constraint vehicle_brands_FK1 foreign key (id_vehicle)
references practica_sarasuadi_vargas.vehicles (id_vehicle);

alter table practica_sarasuadi_vargas.brands
add constraint brands_group_brands_FK foreign key (id_group)
references practica_sarasuadi_vargas.brand_groups(id_group);

---Hist_inspections:
create table practica_sarasuadi_vargas.hist_inspections(
id_vehicle varchar(20) not null, --PK, FK1
id_inspection varchar(50) not null, --FK inspections, id_inspection
inspection_date date not null default '4000-01-01', --PK
inspection_km varchar(50),
inspection_amount varchar(20) not null,
id_currency varchar(20) not null, --FK currencies, id_currency
description varchar(512) null
);

alter table practica_sarasuadi_vargas.hist_inspections
add constraint hist_inspections_PK primary key (id_vehicle, inspection_date);

alter table practica_sarasuadi_vargas.hist_inspections
add constraint vehicle_hist_inspections_FK1 foreign key (id_vehicle)
references practica_sarasuadi_vargas.vehicles (id_vehicle);

alter table practica_sarasuadi_vargas.hist_inspections
add constraint hist_inspections_insp_FK foreign key (id_inspection)
references practica_sarasuadi_vargas.inspections (id_inspection);

alter table practica_sarasuadi_vargas.hist_inspections
add constraint hist_inspections_currencies_FK foreign key (id_currency)
references practica_sarasuadi_vargas.currencies (id_currency);


---------
---DML---
---------

---colors---

insert into practica_sarasuadi_vargas.colors
(id_color, color_name, description) values
('1','Red',''),
('2','Black',''),
('3','White',''),
('4','Blue',''),
('5','Grey','');

---insurances---

insert into practica_sarasuadi_vargas.insurances
(id_insurance, company_name, policy_number, description) values
('01','Mapfre','09877898',''),
('02','AXA','09877768',''),
('03','ING','06577748',''),
('04','ING','05567483',''),
('05','Mapfre','05567483',''),
('06','MMT','04467422',''),
('07','MMT','03267976',''),
('08','AXA','03878600',''),
('09','Mapfre','02867499',''),
('010','ING','06227766','')
;

---vehicles---

insert into  practica_sarasuadi_vargas.vehicles
(id_vehicle, car_plate, car_year, id_color, km, purchase_date, id_insurance, description) values
('1A','G90546M','1998','1','90000','2018-01-22','01',''),
('2B','F90549G','1997','2','120000','2016-03-21','02',''),
('3C','I90944R','2000','2','60000','2014-03-21','03',''),
('4D','P00946V','2019','3','10000','2019-01-09','04',''),
('5E','L20988B','2020','4','12000','2020-02-01','05',''),
('6F','S70981X','2004','1','70000','2006-04-13','06',''),
('7G','Y00984H','1995','5','150000','1999-05-09','07',''),
('8H','J30906L','2001','2','180000','2003-09-09','08',''),
('9I','M50904Z','2008','1','40000','2012-11-24','09',''),
('10J','T40988K','2012','5','130000','2015-06-17','010','')
;

---inspections---
insert into  practica_sarasuadi_vargas.inspections
(id_inspection,inspection_name, description) values
('FL','Fluid Levels',''),
('PI','12 point inspection',''),
('TRB','Tire Rotation and Balance',''),
('L','Lights',''),
('B','Battery','')
;

---currencies---
insert into  practica_sarasuadi_vargas.currencies
(id_currency,currency_name, description) values
('EUR','Euro',''),
('USD','Dollar','')
;

---brand_groups---
insert into  practica_sarasuadi_vargas.brand_groups
(id_group, group_name, description) values
('RNM','Renault-Nissan-Mitsubishi',''),
('TMC','Toyota Motor Corporation',''),
('GM','General Motors',''),
('BMW','BMW Group','')
;

---brands---
insert into  practica_sarasuadi_vargas.brands
(id_vehicle, id_brand, brand_name, model, id_group, description) values
('1A','001','Mini','Mini Cooper', 'BMW',''),
('2B','002','Rolls-Royce','Phantom', 'BMW',''),
('3C','003','Buick','Envision', 'GM',''),
('4D','004','Cadillac','Escalade', 'GM',''),
('5E','005','Chevrolet','Spark', 'GM',''),
('6F','006','Nissan','Micra', 'RNM',''),
('7G','007','Nissan','Juke', 'RNM',''),
('8H','008','Renault','Kangoo', 'RNM',''),
('9I','009','Mazda','Mazda 3', 'TMC',''),
('10J','0010','Subaru','Forester', 'TMC','')
;

---hist_inspections---
insert into  practica_sarasuadi_vargas.hist_inspections
(id_vehicle, id_inspection, inspection_date, inspection_km, inspection_amount, id_currency, description) values
('1A','FL','2022-01-09','80000', '300','EUR',''),
('2B','PI','2019-09-08','110000', '500','EUR',''),
('3C','FL','2020-01-01','55000', '200','EUR',''),
('4D','L','2021-06-04','9000', '100','USD',''),
('5E','B','2019-07-02','10000', '650','USD',''),
('6F','TRB','2022-07-19','65000', '700','USD',''),
('7G','TRB','2021-12-22','140000', '1200','EUR',''),
('8H','L','2019-07-18','170000', '1500','USD',''),
('9I','B','2022-11-09','35000','500', 'USD',''),
('10J','FL','2021-12-22','125000','200', 'EUR','')
;