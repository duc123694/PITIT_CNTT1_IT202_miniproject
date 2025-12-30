create database miniproject;
use miniproject;
create table Reader (
	reader_id int auto_increment primary key,
    reader_name varchar(100) not null,
    phone varchar(15) not null,
    register_date date default (current_date)
);
create table Book(
	book_id int primary key,
    book_title varchar(150) not null,
    author varchar(100),
    publish_year int check(publish_year >= 1900)
);
create table Borrow (
	reader_id int not null,
    book_id int not null,
    borrow_date date default (current_date),
    return_date date,
    primary key (reader_id,book_id),
    constraint fk_reader 
    foreign key (reader_id) references Reader(reader_id),
    constraint fk_book
    foreign key (book_id) references Book(book_id)
);

-- Bai2
alter table Reader add email varchar(100) unique;
alter table Book modify author varchar(150);
alter table Borrow add constraint chk_return_date check (return_date >= borrow_date);

-- Bai3
insert into Reader(reader_id,reader_name,phone,email,register_date) values
 ('1','Nguyễn Văn An','0901234567','an.nguyen@gmail.com','2024-09-01'),
 ('2','Trần Thị Bình','090167889','binh.tran@gmail.com','2024-09-05'),
 ('3','Lê Minh Châu','092345557','chau.le@gmail.com','2024-09-10');
 insert into Book(book_id,book_title,author,publish_year) values 
 ('101','Lập trình C căn bản','Nguyễn Văn A','2018'),
 ('102','Cơ sở dữ liệu','Trần Thị B','2020');
 insert into Borrow(reader_id,book_id,borrow_date,return_date) values
 ('1','101','2024-09-15',''),
 ('1','102','2024-09-15','2021-09-25');
 update Borrow set return_date = '2024-10-01' where reader_id ='1';
 update Book set publish_year = '2023' where publish_year >= '2021';
 delete from Borrow where borrow_date < '2024-09-18';
select * from Reader;
select * from Book;
select * from Borrow;