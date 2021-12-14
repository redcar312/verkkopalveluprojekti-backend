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

insert into category(name) value ('Tietokoneet');
insert into category(name) value ('Puhelimet');
insert into category(name) value ('Kodinkoneet');
insert into category(name) value ('Oheislaitteet');
insert into category(name) value ('Viihde');

insert into product(name, price, image, category_id) values ('Läppäri', 999, 'lappari1.png', 1);
insert into product(name, price, image, category_id) values ('Läppäri', 1999, 'lappari2.png', 1);
insert into product(name, price, image, category_id) values ('Pelitietokone', 3500, 'pelitietokone.png', 1);
insert into product(name, price, image, category_id) values ('Peliläppäri', 2999, 'pelilappari.png', 1);
insert into product(name, price, image, category_id) values ('Toimistokone', 500, 'toimistokone.png', 1);
insert into product(name, price, image, category_id) values ('Pöytäkone', 899, 'poytakone.png', 1);
insert into product(name, price, image, category_id) values ('Miniläppäri', 300, 'minilappari.png', 1);
insert into product(name, price, image, category_id) values ('iPhone', 1999, 'iphone.png', 2);
insert into product(name, price, image, category_id) values ('Samsung', 499, 'samsung.png', 2);
insert into product(name, price, image, category_id) values ('Oneplus', 700, 'oneplus.png', 2);
insert into product(name, price, image, category_id) values ('Xiaomi', 200, 'xiaomi.png', 2);
insert into product(name, price, image, category_id) values ('Doro', 99, 'doro.png', 2);
insert into product(name, price, image, category_id) values ('Mikroaaltouuni', 99, 'placeholder.png', 3);
insert into product(name, price, image, category_id) values ('Astianpesukone', 299, 'astianpesukone.png', 3);
insert into product(name, price, image, category_id) values ('Pyykinpesukone', 400, 'pyykinpesukone.png', 3);
insert into product(name, price, image, category_id) values ('Kuivausrumpu', 499, 'kuivausrumpu.png', 3);
insert into product(name, price, image, category_id) values ('Pelinäppäimistö', 99, 'keyboard1.png', 4);
insert into product(name, price, image, category_id) values ('Pelihiiri', 79, 'pelihiiri.png', 4);
insert into product(name, price, image, category_id) values ('Pelinäyttö 24"', 249, 'pelinaytto24.png', 4);
insert into product(name, price, image, category_id) values ('Hiirimatto 90x40cm', 49, 'hiirimatto.png', 4);
insert into product(name, price, image, category_id) values ('Kuulokkeet', 199, 'kuulokkeet.png', 4);
insert into product(name, price, image, category_id) values ('Pelikonsoli', 499, 'placeholder.png', 5);
insert into product(name, price, image, category_id) values ('TV 42"', 500, 'tv42.png', 5);
insert into product(name, price, image, category_id) values ('TV 65"', 700, 'tv65.png', 5);
insert into product(name, price, image, category_id) values ('Videotykki', 499, 'videotykki.png', 5);
