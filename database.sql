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
    info varchar(500),
    index category_id(category_id),
    foreign key(category_id) references category(id)
    on delete restrict
);

create table customer (
    id int primary key,
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
    amount double(10, 2) not null,
    final_sum double(10, 2) not null,
    foreign key (product_id) references product(id)
    on delete restrict,
    foreign key (order_id) references `order`(id)
    on delete restrict
);

create table kayttaja(
    id int primary key auto_increment,
    firstname varchar(64),
    lastname varchar(64),
    username varchar(64),
    password varchar(64)
);

insert into category(name) value ('Tietokoneet');
insert into category(name) value ('Puhelimet');
insert into category(name) value ('Kodinkoneet');
insert into category(name) value ('Oheislaitteet');
insert into category(name) value ('Viihde');
INSERT INTO category(name) VALUES("Virvokkeet");

insert into product(name, price, image, category_id, info) values ('Läppäri 15.6"', 999, 'lappari1.png', 1, 'Tehokkaalla suorittimella varustettua tyylikästä kannettavaa voi käyttää sujuvasti koko päivän ajan - se sopii siis erinomaisesti liikkuville ammattilaisille');
insert into product(name, price, image, category_id, info) values ('Läppäri 17.3"', 1999, 'lappari2.png', 1, 'Huikea kannettava RTX 3060 -näytönohjaimella ja Ryzen 9 5900HS -prosessorilla');
insert into product(name, price, image, category_id, info) values ('Pelitietokone', 3500, 'pelitietokone.png', 1, 'Ensiluokkaisesta suorituskyvystä vastaa AMD:n Ryzen 5 5600X -suoritin, NVIDIAn GeForce RTX 3090 -näytönohjain, 16 Gt nopeaa DDR4-muistia sekä Windows 10 Pro. Malli on varustettu huippunopealla 1 Tt:n NVMe SSD -kovalevyllä.');
insert into product(name, price, image, category_id, info) values ('Peliläppäri', 2999, 'pelilappari.png', 1,  'Mahtavaa suorituskykyä vaativampaankin pelaamiseen.');
insert into product(name, price, image, category_id, info) values ('Toimistokone', 500, 'toimistokone.png', 1, 'Kone on varustettu tehokkaalla Intel i5 -suorittimella, 8GB keskusmuistilla ja nopealla SSD kiintolevyllä');
insert into product(name, price, image, category_id, info) values ('Pöytäkone', 899, 'poytakone.png', 1, 'Tehokas pöytäkone kaikkiin arjen perustarpeisiin. Tehokas AMD Ryzen -suoritin sekä nopea SSD-levy. Kattavat liitännät.');
insert into product(name, price, image, category_id, info) values ('Miniläppäri', 300, 'minilappari.png', 1, 'Pienikokoinen ja kauniisti alumiiniseen runkoon muotoiltu kannettava, ja se on kaikin puolin suunniteltu vastaamaan vaativimpienkin käyttäjien tarpeisiin.');
insert into product(name, price, image, category_id, info) values ('iPhone', 1999, 'iphone.png', 2, 'Uusin iPhone tarjoaa 120Hz OLED-kosketusnäytön sekä todella edistyneen kolmoiskamerajärjestelmän');
insert into product(name, price, image, category_id, info) values ('Samsung', 499, 'samsung.png', 2, 'Kauniissa Samsung älypuhelimessa on 6,5” Infinity-O-kosketusnäyttö sekä takaosassa sijaitseva 48+8+2+2 megapikselin neloiskamera');
insert into product(name, price, image, category_id, info) values ('Oneplus', 700, 'oneplus.png', 2, 'OnePlus älypuhelimessa on 48+50+8+2 megapikselin Hasselblad-kamera, 120 Hz virkistystaajuudella toimiva 6,7” Fluid AMOLED -kosketusnäyttö ja IP68-luokitus.');
insert into product(name, price, image, category_id, info) values ('Xiaomi', 200, 'xiaomi.png', 2, 'Xiaomi älypuhelin tarjoaa reipasta tehoa ja käyttömukavuutta. Siinä on 108 megapikselin kolmoiskamera, huippuluokan Mediatek Dimensity 1200-Ultra -piirisarja, 120-hertsinen näyttö ja turbonopea 67W pikalataus.');
insert into product(name, price, image, category_id, info) values ('Doro', 99, 'doro.png', 2, 'Helppokäyttöinen, leveä näyttö, hyvä akunkesto sekä suuret painikkeet tekevät puhelimesta helppokäyttöisen');
insert into product(name, price, image, category_id, info) values ('Mikroaaltouuni', 99, 'mikro1.png', 3, 'Mikroaaltouunilla aterioiden valmistus on helppoa ja nopeaa. Siinä on suuri 17 litran tilavuus ja viisi tehoasetusta');
insert into product(name, price, image, category_id, info) values ('Astianpesukone', 299, 'astianpesukone.png', 3, 'Laitteen ominaisuuksiin lukeutuu kuusi ohjelmaa, tehokas iQdrive-moottori sekä kätevä Home Connect -ominaisuus.');
insert into product(name, price, image, category_id, info) values ('Pyykinpesukone', 400, 'pyykinpesukone.png', 3, 'Kuivaava pyykinpesukone pesee 8,5 kg ja kuivaa 5 kg pyykkiä nopeasti. Siinä on myös nopea 1200 rpm linkousnopeus, kompakti muotoilu ja integroitu wifi-yhteys.');
insert into product(name, price, image, category_id, info) values ('Kuivausrumpu', 499, 'kuivausrumpu.png', 3, 'Tässä lämpöpumppukuivausrummussa on mm. rypystymissuoja, EasyClean-suodatin sekä AutoDry-kosteudentunnistin.');
insert into product(name, price, image, category_id, info) values ('Pelinäppäimistö', 99, 'keyboard1.png', 4, 'Mekaanisen näppäimistön kytkinten aktivoitumispiste voidaan säätää näppäinkohtaisesti. Lisäksi siinä on RGB-valaistus, 100 miljoonan klikkauksen kestävyys ja sisäinen muisti.');
insert into product(name, price, image, category_id, info) values ('Pelihiiri', 79, 'pelihiiri.png', 4, 'Pelihiiressä on tarkka sensori, säädettävä 25,600 DPI resoluutio ja langaton yhteys.');
insert into product(name, price, image, category_id, info) values ('Pelinäyttö 24"', 249, 'pelinaytto24.png', 4, '24 tuumainen pelinäyttö luo sulavaliikkeisen ja tarkan Full HD -resoluution kuvan 144 Hz ruudunpäivitysnopeudella sekä 1 ms vasteajalla.');
insert into product(name, price, image, category_id, info) values ('Hiirimatto 90x40cm', 49, 'hiirimatto.png', 4, 'Nauti vapaasta liikkuvuudesta pelaamiseen tarkoitetun hiirimaton ansiosta. Vähäisen kitkan ansiosta hiirimatto on erinomainen hiirelle, jossa on matalat DPI-asetukset.');
insert into product(name, price, image, category_id, info) values ('Kuulokkeet', 199, 'kuulokkeet.png', 4, 'Äänenlaatu on ammattilaistasoa niin puhuessa kuin kuunnellessakin. Mukana 7.1-tilaääni ja 50mm:n kaiutinelementit');
insert into product(name, price, image, category_id, info) values ('Pelikonsoli', 499, 'ps2.png', 5, 'Nauti salamannopeasta latauksesta, erittäin nopeasta SSD-asemasta ja mukaansatempaavista toiminnoista, kuten kosketuspalautteesta, mukautuvista liipaisimista, 3D-äänestä ja upouudesta pelien sukupolvesta.');
insert into product(name, price, image, category_id, info) values ('TV 42"', 500, 'tv42.png', 5, 'Nauti terävästä kuvanlaadusta elävillä väreillä ja rikkailla äänillä 42-tuumaisen Full HD -älytelevision avulla, jossa on Android TV 8.0 -tuki');
insert into product(name, price, image, category_id, info) values ('TV 65"', 700, 'tv65.png', 5, 'Älykäs Crystal UHD -televisio, jossa on aito 4K-resoluutio, elävät värit, syvät mustat ja terävä kontrasti.');
insert into product(name, price, image, category_id, info) values ('Videotykki', 499, 'videotykki.png', 5, 'Projektori sopii erityisesti yrityskäyttöön. Sen kristallilasiset linssit takaavat selkeän ja terävän kuvan vivahteikkailla väreillä');
insert into product(name, price, image, category_id, info) values ('24 x 0,33l Lappari', 29, 'lappari24.png', 6, 'Jokaisen suomalaisen kestosuosikki suoraan omalta pienpanimolta');
insert into product(name, price, image, category_id, info) values ('12 x 0.5l Santtu', 35, 'santtu.png', 6, 'Saunaillan  sankari');


/* AUTO_INCREMENT pois: ALTER TABLE customer CHANGE id id int; */

/* infotekstiboksin lisäys: ALTER TABLE product ADD info VARCHAR(500); */

/*
UPDATET testituotteille:
UPDATE product SET image = "mikro1.png" WHERE name = "Mikroaaltouuni";
UPDATE product SET image = "ps2.png" WHERE name = "Pelikonsoli";

ORDER_ROW TUOTTEIDEN MÄÄRÄ:
ALTER TABLE order_row ADD amount DOUBLE(10,2) NOT NULL
ALTER TABLE order_row ADD final_sum DOUBLE(10,2) NOT NULL
*/
