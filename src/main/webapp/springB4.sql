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

create table lecture_reservation(
	seq_num number,
	rsv_cls varchar2(100),
	rsv_id varchar2(100),
	rsv_name varchar2(100),
	checkout varchar2(100),
	rsv_date date
)

select * from LECTURE_RESERVATION