create table school_member(
	cls varchar2(100),
	id varchar2(100),
	pw varchar2(100),
	email varchar2(100),
	name varchar2(100),
	birth varchar2(100),
	tel varchar2(100),
	indate date
)

desc school_member;

select * from school_member

create sequence seq increment by 1 start with 1 minvalue 1 maxvalue 9999;
---------------------------------------------------------------------------------------------------
create table lecture_reservation(
	seq_num number,
	rsv_cls varchar2(100),
	rsv_id varchar2(100),
	rsv_name varchar2(100),
	checkout varchar2(100),
	rsv_date date
)

select * from LECTURE_RESERVATION

create table freeboard(
    post_id number primary key,
    title varchar2(50),
    writer varchar2(50),
    content varchar2(1000),
    post_date date,
    views number
)

create sequence post_id increment by 1 start with 1 minvalue 1 maxvalue 9999;

desc freeboard

create sequence comment_id increment by 1 start with 1 minvalue 1 maxvalue 9999;

create table comments(
    comment_id number primary key,
    post_id number,
    content varchar2(1000),
    comment_writer varchar2(50),
    comment_date date,
    constraint comments_fk foreign key(post_id) references freeboard(post_id)
)

desc comments




