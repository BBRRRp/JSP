drop database board;

create database board default character set utf8;

drop table member;

create table member (
	  id  		varchar(50) primary key
	, name  	varchar(50) not null
	, password	varchar(20) not null
	, regnumber varchar(20) not null
	, mileage   int(10)     default 0
	, regdate   datetime    not null default curdate() on update current_timestamp()
);