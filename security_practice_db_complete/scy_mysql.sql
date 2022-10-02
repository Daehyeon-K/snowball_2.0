select * from mem where mem_id='mysql';
select msg_seq.nextval from dual;
SELECT * FROM USER_SEQUENCES


create seqeunce 
msg increment 
by 1 start with 1 
minvalue 1 
maxvalue  999999 
nocycle 
cache;         



select * from approval_commit;


select *from (select max(msg_id)+1 from msg) next;

select case count(*) when 0 then 1 else max(msg_id) + 1 end;

insert into dept select case count(*) when 0 then 1 else max(dept_id) + 1 end,'bb' from dept;

insert into dept(dept_name) values('bb');

select max(APPROVAL_COMMIT_SEQ)+1 from APPROVAL_COMMIT;
select * from dept;

insert into mail values()

select LAST_INSERT_ID(mail_file_seq) from mail_file;

-- mysql 시퀀스 생성
--CREATE SEQUENCE my_seq START WITH 1 INCREMENT BY 1;
-- 시퀀스 다음 번호 조회
--SELECT NEXTVAL(my_seq);
-- 시퀀스 마지막 번호 조회 => nextval 실행 안하면 NULL
--SELECT LASTVAL(my_seq);
-- 시퀀스 1부터 초기화
--ALTER SEQUENCE board_seq RESTART 1;
-- 시퀀스 삭제
--DROP SEQUENCE my_seq;

-- 값 단일 테이블 삽입

SELECT * FROM DEPT;
--1 ) 부서 테이블 
insert into dept values( 'IS','인사부');
insert into dept values( 'GB','개발부');
insert into dept values( 'GH','기획부');
insert into dept values( 'CM','총무부');
insert into dept values('ADMIN','관리자');

--2 ) 직급 테이블
insert into grade values( '1SW','사원' );
insert into grade values( '2DL','대리' );
insert into grade values( '3GZ','과장' );
insert into grade values( '4BZ','부장' );
insert into grade values( '5SZ','사장' );
insert into grade values( 'ADMIN','관리자' );
select * from approval;
-- 3) 원청 값 삽입
insert into company values( 'WON1', '원청1', '주소1', '02-1234-1234', ' 김원청', '2015-05-06', '2017-11-02');
insert into company values( 'WON2', '원청2', '주소2', '02-4567-4567', ' 박원청', '2020-07-26', '2021-09-14');
insert into company values( 'WON3', '원청3', '주소3', '02-9876-9876', ' 이원청', '2018-05-06', '2023-01-12');

-- 4) 사용자 테이블
insert into mem(mem_id, grade_id, company_id, dept_id, mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start, mem_dcon_start, mem_dcon_end) 
values( '20220001', '3GZ' ,'WON1', 'IS' , '최지수', '010-3546-7453', 'jisu@navr.com', '여', '950407', '삼송', 30000000, 'jisu123', '2021-06-24', '2021-09-30', '2022-03-05'  );
insert into mem(mem_id, grade_id, company_id, dept_id, mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start, mem_con_end, mem_dcon_start, mem_dcon_end) 
values( '20220002', '2DL' ,'WON3', 'GB' , '정성원', '010-8943-2631', 'sungwon@daum.net', '남', '931204', '창동', 35000000, 'sung123', '2018-02-03', '2018-12-27' , '2018-03-21', '2018-08-18'  );
insert into mem(mem_id, grade_id, company_id, dept_id, mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start, mem_dcon_start, mem_dcon_end) 
values( '20220003', '4BZ' ,'WON2', 'GH' , '이결순', '010-7594-2834', 'lee@navr.com', '여', '030526', '잠실', 40000000, 'lee123', '2022-10-04', '2022-12-10', '2023-07-25'  );
insert into mem(mem_id, grade_id, company_id, dept_id, mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start, mem_dcon_start, mem_dcon_end) 
values( '20220004', '2DL' ,'WON1', 'CM' , '김태희', '010-2549-1876', 'kim@navr.com', '여', '950417', '노량진', 37000000, 'kim123', '2015-04-29', '2020-02-13', '2020-06-12'  );
insert into mem(mem_id, grade_id, company_id, dept_id, mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start, mem_con_end, mem_dcon_start, mem_dcon_end) 
values( '20220005', '1SW' ,'WON2', 'CM' , '한가온', '010-1423-7764', 'han@daum.net', '남', '870315', '마포', 26000000, 'han123', '2013-07-06', '2015-12-01' , '2014-01-24', '2015-05-20'  );
insert into mem(mem_id, grade_id, company_id, dept_id, mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start, mem_dcon_start, mem_dcon_end) 
values( '20220006', '1SW' ,'WON3', 'IS' , '황광희', '010-8869-3745', 'hwang@gmail.com', '남', '000305', '부산', 70000000, 'hwang123', '2021-05-30', '2023-02-03', '2024-11-16'  );
insert into mem(mem_id, grade_id,  mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start) 
values( '20220007', '5SZ' ,  '정우성', '010-8869-3745', 'jung@gmail.com', '남', '780315', '구로', '100000000', 'jung123', '2005-05-30' );
insert into mem(mem_id, grade_id, company_id, dept_id, mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start, mem_dcon_start, mem_dcon_end) 
values( '20220008', '4BZ' ,'WON3', 'GB' , '곽도원', '010-9934-1523', 'do@gmail.com', '남', '741205', '인천', 80000000, 'do123', '2008-04-14', '2012-09-06', '2020-04-23'  );

select * from approval_type;
-- 6) 결재 종류 테이블
insert into approval_type values( 'BP', '비품신청' );
insert into approval_type values( 'HG', '휴가신청' );

-- 7) 근태 테이블
insert into att(att_id, mem_id, att_in_out, att_vac, att_nos, att_late) 
values( 'ATT1', '20220001', 'in' , 13, 0 , 0);
insert into att(att_id, mem_id, att_in_out, att_vac, att_nos, att_late) 
values( 'ATT2', '20220002', 'out', 14,  0 , 0 );
insert into att(att_id, mem_id, att_in_out, att_vac, att_nos, att_late) 
values( 'ATT3', '20220003', 'out', 4, 0 , 7 );
insert into att(att_id, mem_id, att_in_out, att_vac, att_nos, att_late) 
values( 'ATT4', '20220004', 'in' , 11, 0 , 2 );
insert into att(att_id, mem_id, att_in_out, att_vac, att_nos, att_late) 
values( 'ATT5', '20220005', 'in' , 15, 0 , 0 );
insert into att(att_id, mem_id, att_in_out, att_vac, att_nos, att_late) 
values( 'ATT6', '20220006', 'out', 12, 0 , 0 );
insert into att(att_id, mem_id, att_in_out, att_vac, att_nos, att_late) 
values( 'ATT7', '20220007', 'in' , 100, 0 , 0 );

-- 출퇴근관리 테이블
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT1', now(), now());
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT1', now(), now());
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT2', now(), now());
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT2', now(), now());
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT3', now(), now());
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT3', now(), now());
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT4', now(), now());
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT4', now(), now());
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT5', now(), now());
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT5', now(), now());
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT6', now(), now());
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT6', now(), now());
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT7', now(), now());
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',nextval(commute_seq)), 'ATT7', now(), now());


select cast(REGEXP_SUBSTR(commute_id, '[0-9]+') as integer)
from commute;

select commute_id, att_id, commute_in, commute_out  
from commute 
order by cast(REGEXP_SUBSTR(commute_id, '[0-9]+') as integer) desc;

select @rownum;
select /*+INDEX_DESC(approval pk_mem)*/ @rownum:=@rownum+1 rn, mem_id, grade_id, company_id, dept_id, mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start,mem_con_end, mem_dcon_start, mem_dcon_end 
from (
		select mem_id, grade_id, company_id, dept_id, mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start,mem_con_end, mem_dcon_start, mem_dcon_end 
		from mem 
		order by cast(REGEXP_SUBSTR(mem_id, '[0-9]+') as integer)  desc
 	 ) mem_1, (select @rownum:=0) mem2
;

select nextval(approval_seq);

select * from mem;

SELECT MAX(approval_commit_seq)+1;








