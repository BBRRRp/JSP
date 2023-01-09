create sequence notice_id_seq

create table notice(

	  num    	number primary key
	, title  	varchar2(100) not null
	, writer 	varchar2(50)  not null
	, regdate  	datetime default sysdate
	, content 	varchar2(1000)
	, hit     	number default 0
	, files   	varchar2(100)
);

begin 
	for i in 1.. 1001 loop
		insert into notice values(notice_id_seq.nextval, '제목_'||i, 'hong_'||i, sysdate, '글내용_'||i, 0, null);
	end loop;
end;


select count(*) from notice;

select * from notice order by num desc;

select *
  from (select rownum rn, n.* from notice n order by num desc)
 where rn between 991 and 1001;

