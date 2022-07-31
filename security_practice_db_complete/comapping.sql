-- 사용자 더미값
insert into mem(mem_id, grade_id, company_id, dept_id, mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start,mem_con_end, mem_dcon_start, mem_dcon_end) 
(select concat('2022', mem_seq.nextval),grade_id, company_id, dept_id, mem_name, mem_phone, mem_mail, mem_gender, mem_birth, mem_addr, mem_sal, mem_pwd, mem_con_start,mem_con_end, mem_dcon_start, mem_dcon_end from mem);


select * from mem order by mem_id desc;

select * from msg;

select * from approval_commit;


select mem_seq.nextval from dual;