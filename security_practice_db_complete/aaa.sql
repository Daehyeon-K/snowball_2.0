select * from mem ORDER BY mem_id;
DELETE FROM mem where mem_id = '20220009';

select * from APPROVAL;

-- 메모 값 삽입
insert into memo
values(concat('메모',memo_seq.nextval),'20220010','hello');

select * from memo;


delete from mem where mem_id='admin';


-- 결재 종류 값 삽입
insert into approval_type values( 'BP', '비품신청' );
insert into approval_type values( 'HG', '휴가신청' );

select * from msg where receiver_id='20220012';

SELECT * FROM ATT;

-- 근태 값 삽입
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

select * from commute;

-- 출퇴근관리
insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT1', sysdate, sysdate);

insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT1', sysdate, sysdate);

insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT2', sysdate, sysdate);

insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT2', sysdate, sysdate);

insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT3', sysdate, sysdate);

insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT3', sysdate, sysdate);

insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT4', sysdate, sysdate);

insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT4', sysdate, sysdate);

insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT5', sysdate, sysdate);

insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT5', sysdate, sysdate);

insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT6', sysdate, sysdate);

insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT6', sysdate, sysdate);

insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT7', sysdate, sysdate);

insert into commute (commute_id, att_id, commute_in, commute_out)
values(concat('COMM',commute_seq.nextval), 'ATT7', sysdate, sysdate);



select approval_id,mem_id,approval_type_id,approval_commit_id,approval_inter_id,approval_final_id,approval_reject,approval_content
from (select /*+INDEX_DESC(approval pk_approval)*/ rownum rn, approval_id,mem_id,approval_type_id,approval_commit_id,approval_inter_id,approval_final_id,approval_reject,approval_content 
    from (select approval_id,mem_id,approval_type_id,approval_commit_id,approval_inter_id,approval_final_id,approval_reject,approval_content from approval order by TO_NUMBER(REGEXP_SUBSTR(approval_id, '[0-9]+',1,1)))
    where approval_id >= 'APPR1' and rownum <= 30)
where rn > 0;

select * from msg;

select * from approval;


insert into approval(approval_id, mem_id,approval_type_id, approval_commit_id, approval_inter_id, approval_final_id, approval_reject, approval_content)
(select concat('APPR', approval_seq.nextval),mem_id,approval_type_id, approval_commit_id, approval_inter_id, approval_final_id, approval_reject, approval_content from approval);


-- 사용자 더미값
insert into mem(mem_id, grade_id, company_id, dept_id, mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start,mem_con_end, mem_dcon_start, mem_dcon_end,enable) 
(select concat('2022', mem_seq.nextval),grade_id, company_id, dept_id, mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start,mem_con_end, mem_dcon_start, mem_dcon_end,enable from mem);


select * from AUTHORITY;

select * from mem;

-- 쪽지
insert into msg
values(concat('NO',msg_seq.nextval),'20220008','20220011','안녕하세요',sysdate);

delete from approval_file where mem_id='20220013';

-- 메모
insert into memo
values(concat('MEMO',memo_seq.nextval),'admin','관리자');




select * from msg;











-- 댓글이 있어도 게시물 삭제 시 연쇄적으로 삭제하기
ALTER TABLE reply
MODIFY CONSTRAINT FK_REPLY_BOARD_ID
ON DELETE CASCADE;