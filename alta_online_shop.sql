show databases;
create database alta_online_shop;
use alta_online_shop;

create table user (
	id int not null auto_increment,
	username varchar(255) not null,
	gender enum('Male', 'Female'),
    age int not null,
	created_at datetime default now(),
	updated_at datetime default now(),
	primary key (id)
);

create table operator (
	id int not null auto_increment,
	name_operator varchar(255) not null,
	created_at datetime default now(),
	updated_at datetime default now(),
	primary key (id)
);

create table product_type (
	id int not null auto_increment,
	name varchar(255) not null,
	created_at datetime default now(),
	updated_at datetime default now(),
	primary key (id)
);

create table product (
	id int not null auto_increment,
	name varchar(255) not null,
	price int not null,
	product_type_id int not null,
	operator_id int not null,
	created_at datetime default now(),
	updated_at datetime default now(),
	primary key (id),
	foreign key (product_type_id) references product_type(id),
	foreign key (operator_id) references operator(id)
);

create table product_description (
	id int not null auto_increment,
	description mediumtext not null,
	product_id int not null,
	created_at datetime default now(),
	updated_at datetime default now(),
	primary key (id),
	foreign key (product_id) references product(id)
);

create table payment_method(
	id int not null auto_increment,
	name varchar(255) not null,
	created_at datetime default now(),
	updated_at datetime default now(),
	primary key (id)
);

create table transaction (
	id int not null auto_increment,
	id_user int not null,
	id_payment_method int not null,
	status enum('PENDING', 'SUCCESS', 'FAILED'),
	created_at datetime default now(),
	updated_at datetime default now(),
	primary key (id),
	foreign key (id_user) references user(id),
	foreign key (id_payment_method) references payment_method(id)
);

create table transaction_detail (
	id int not null auto_increment,
	id_product int not null,
	qty int not null,
	price int not null,
	id_transaction int not null,
	created_at datetime default now(),
	updated_at datetime default now(),
	primary key (id),
	foreign key (id_transaction) references transaction(id),
	foreign key (id_product) references product(id)
);

show tables;

-- Insert 5 operators pada table operators.
-- PART 3 Release 1 (1.a)
describe operator;
insert into operator (name_operator)
		values('Telkomsel'),('Indosat'),('XL'),('Three'),('By.u');
select * from operator;

-- Insert 3 product type.
-- PART 3 Release 1 (1.b)
describe product_type;
insert into product_type (name)
		values('Prabayar'),('Pascabayar'),('Paket Data');
select * from product_type;

-- Insert 2 product dengan product type id = 1, dan operators id = 3.
-- PART 3 Release 1 (1.c)
describe product;
insert into product (name, price, product_type_id, operator_id) 
		values ('XL Internet 1 GB/3 Hari', 25000, 1, 3), ('XL Bicara 100 Menit/7 Hari', 10000, 1, 3);
select * from product;

-- Insert 3 product dengan product type id = 2, dan operators id = 1.
-- PART 3 Release 1 (1.d)
insert into product (name, price, product_type_id, operator_id) 
		values ('Telkomsel 3 GB/3 Hari', 45000, 2, 1), ('Telkomsel Bicara 100 Menit/3 Hari', 15000, 2, 1),
			   ('Telkomsel 100 SMS/3 Hari', 10000, 2, 1);
select * from product;

-- Insert 3 product dengan product type id = 3, dan operators id = 4.
-- PART 3 Release 1 (1.e)
insert into product (name, price, product_type_id, operator_id) 
		values ('Three 3 GB/3 Hari', 9000, 3, 4), ('Three Bicara 100 Menit/7 Hari', 10000, 3, 4),
			   ('Three Bicara Sesama Operator 200 Menit/30 Hari', 15000, 3, 4);
select * from product;

-- Insert product description pada setiap product.
-- PART 3 Release 1 (1.f)
describe product_description;
insert into product_description (description, product_id) 
		values ('Kuota utama 1GB berlaku 3 hari', 1),('7 Hari (Seluruh Operator)', 2),
			   ('Kuota utuh tanpa dibagi aplikasi (FREE Disney+ Hotstar)', 3),
               ('3 Hari (Sesama Operator)', 4),('3 Hari kirim pesan (Seluruh Operator)', 5),
               ('Kuota utama 3GB berlaku 3 hari tanpa dibagi aplikasi', 6),('7 Hari (Seluruh Operator)', 7),
               ('Berlaku 30 hari (Sesama Operator)', 8);
select * from product_description;

-- Insert 3 payment methods.
-- PART 3 Release 1 (1.g)
describe payment_method;
insert into payment_method (name)
		values('Virtual Account'),('Transfer Bank'),('E Money');
select * from payment_method;

-- Insert 5 user pada tabel user.
-- PART 3 Release 1 (1.h)
describe user;
insert into user (username, gender, age) 
	values('Royal20', 'Male', 44),('Isabel.Bode4', 'Female', 23),('Demario8', 'Male', 31),('Orland_Von20', 'Male', 34),
		  ('Lessie.Wilderman', 'Female', 19),('Fiona96', 'Female', 15),('Abdul.Corwin81', 'Male', 20),('Jaquelin29', 'Female', 19),
          ('Rosendo62', 'Female', 46),('Skye_Bosco', 'Male', 51),('Hollis_Spinka', 'Male', 54),('Luisa.Robel31', 'Male', 35),
          ('Marley_Reichert', 'Female', 28),('Alejandra84', 'Male', 30),('Zechariah_Gibson', 'Male', 35),('Phoebe.Toy86', 'Male', 37),
          ('Margarete91', 'Female', 25),('Craig94', 'Male', 34),('Ophelia83', 'Male', 42),('Zoey.Deckow', 'Female', 76),
          ('Rafaela78', 'Male', 43),('Jaylin_Schumm25', 'Male', 55),('Deontae87', 'Male', 53),('Lina_Grimes', 'Female', 13),
          ('Jayda.Hansen25', 'Male', 21),('Fredrick15', 'Male', 12),('Merle.Wunsch', 'Female', 18);
select * from user;

show tables;
-- Insert 3 transaksi di masing-masing user (min 3 user). (soal berlanjut ke soal 1.j)
-- PART 3 Release 1 (1.i)
describe transaction;
insert into transaction (id_user, id_payment_method, status)
		values(1, 2, 'SUCCESS'),(2, 1, 'PENDING'),(3,2, 'SUCCESS'),
			  (4, 3, 'FAILED'),(5, 3, 'PENDING');
select * from transaction;

-- Insert 3 product di masing-masing transaksi.
-- PART 3 Release 1 (1.j)
describe transaction_detail;
insert into transaction_detail (id_product, qty, price, id_transaction)
		values(1, 2, 54000, 1),(3, 1, 47000, 2),(3,2, 94000, 3),
			  (4, 1, 17000, 4),(6, 3, 33000, 5);
select * from transaction_detail;

-- PART 3 Release 1 (2.a)
-- Tampilkan nama user / pelanggan dengan gender Laki-laki / M.
select username from user where gender like 'Male%';

-- PART 3 Release 1 (2.b)
-- Tampilkan product dengan id = 3.
select * from product where id='3';

-- PART 3 Release 1 (2.c)
-- Tampilkan data pelanggan yang created_at dalam range 7 hari kebelakang dan mempunyai nama mengandung kata ‘a’.
select * from user where created_at > date_sub(now(), interval 7 day) and username like 'a%';

-- PART 3 Release 1 (2.d)
-- Hitung jumlah user / pelanggan dengan status gender Perempuan.
select
	count(*) as jumlah_user
    from user where gender like 'Female%';

-- PART 3 Release 1 (2.e)    
-- Tampilkan data pelanggan dengan urutan sesuai nama abjad
select * from user order by username asc;

-- PART 3 Release 1 (2.f)   
-- Tampilkan 5 data transaksi dengan product id = 3
select * from transaction_detail where id_product='3' limit 5;
show tables;

-- PART 3 Release 1 (3.a) 
-- Ubah data product id 1 dengan nama ‘product dummy’.
update product_description set description = 'product dummy' where product_id = 1;
select * from product_description;

-- PART 3 Release 1 (3.b)  
-- Update qty = 3 pada transaction detail dengan product id 1. 
update transaction_detail set qty = '3' where id_product = 1;
select * from transaction_detail;

-- PART 3 Release 1 (4.a)  
delete from user where id = 26;

select * from transaction;
select * from transaction_detail;
select * from user;
show tables;

-- PART 3 Release 2 No. 1 
-- Gabungkan data transaksi dari user id 1 dan user id 2.
select id_payment_method, status 
	from transaction where id_user=1
	union select id_payment_method, status
    from transaction where id=2;
    
select * from user;    
select * from product;
select * from transaction_detail;
select * from transaction;

-- PART 3 Release 2 No. 2 
-- Tampilkan jumlah harga transaksi user id 1.
select u.username,
	count(*),
	sum(td.qty * p.price)
	from transaction_detail td
	left join product p on p.id = td.id_product
	left join user u on u.id = td.id_transaction
	where u.id = 1;

-- PART 3 Release 2 No. 3
-- Tampilkan total transaksi dengan product type 2. 
select product_type_id,
	count(*),
    sum(td.qty * p.price)
    from transaction_detail td
    left join product p on p.id = td.id_product
    left join user u on u.id=td.id_transaction
    where product_type_id = 2;
    
-- PART 3 Release 2 No. 4
-- Tampilkan semua field table product dan field name table product type yang saling berhubungan.
select * from product;
select * from product_type;
select p.*, pt.name
	from product p
	left join product_type pt on p.product_type_id= pt.id;

-- PART 3 Release 2 No. 5    
-- Tampilkan semua field table transaction, field name table product dan field name table user.
select * from transaction;
select t.*, p.name, u.username
	from transaction t
	left join product p on p.name= p.name
    left join user u on u.username= u.username;

-- PART 3 Release 2 No. 8    
-- Tampilkan data products yang tidak pernah ada di tabel transaction_details dengan sub-query.    
select * from transaction_detail;
select * from product;
select td.*, p.id as 'id product', p.name as 'product name'
	from transaction_detail td
    right join product p on td.id_product = p.id
    where p.id
    in (select id from product where id !=  0 and 2 and 5 and 7 and 8);