drop database if exists webshop;
create database webshop;
use webshop;

create table category (
    id int primary key auto_increment,
    name varchar(64) not null
);

create table product (
    id int primary key auto_increment,
    name varchar(64) not null,
    price double (10, 2) not null,
    image varchar(64),
    category_id int not null,
    index category_id(category_id),
    foreign key(category_id) references category(id)
    on delete restrict
);

create table customer (
    id int primary key auto_increment,
    firstname varchar(64) not null,
    lastname varchar(64) not null,
    address varchar(100) not null,
    zipcode varchar(10) not null,
    city varchar(32) not null
);

create table `order` (
    id int primary key auto_increment,
    order_date timestamp default current_timestamp,
    customer_id int not null,
    index customer_id(customer_id),
    foreign key (customer_id) references customer(id)
    on delete restrict
);

create table order_row (
    order_id int not null,
    index order_id(order_id),
    product_id int not null,
    index product_id(product_id),
    foreign key (product_id) references product(id)
    on delete restrict,
    foreign key (order_id) references `order`(id)
    on delete restrict
);

<<<<<<< HEAD
insert into category(name) value ('Tietokoneet');
insert into category(name) value ('Puhelimet');
insert into category(name) value ('Kodinkoneet');

insert into product(name, price, image, category_id) values ('Läppäri', 999, 'placeholder.png', 1);
insert into product(name, price, image, category_id) values ('Läppäri', 1999, 'placeholder.png', 1);
insert into product(name, price, image, category_id) values ('iPhone', 1999, 'placeholder.png', 2);
insert into product(name, price, image, category_id) values ('Mikroaaltouuni', 99, 'placeholder.png', 3);
=======

insert into category(name) value ('Tietokoneet');
insert into category(name) value ('Puhelimet');
insert into category(name) value ('Kodinkoneet');
insert into category(name) value ('Oheislaitteet');
insert into category(name) value ('Viihde');

insert into product(name, price, image, category_id) values ('Läppäri', 999, 'lappari1.png', 1);
insert into product(name, price, image, category_id) values ('Läppäri', 1999, 'lappari2.png', 1);
insert into product(name, price, image, category_id) values ('iPhone', 1999, 'iphone.png', 2);
insert into product(name, price, image, category_id) values ('Mikroaaltouuni', 99, 'placeholder.png', 3);
insert into product(name, price, image, category_id) values ('Pelinäppäimistö', 99, 'keyboard1.png', 4);
insert into product(name, price, image, category_id) values ('Pelikonsoli', 499, 'placeholder.png', 5);
>>>>>>> a1191a2a184054f78773957e97d442a5901b9453