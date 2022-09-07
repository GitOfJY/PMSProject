--스프링 프로젝트

delete from tblwork where workseq = 66;

rollback;
commit;

select
		    s.name as stagename,
		    w.stageseq as stageseq,
		    e.name as employeename,
		    t.projectseq as projectseq,
		    t.name as teamname,
		    e.employeeseq as employeeseq,
            w.name as workname,
            w.workseq as workseq,
            w.statenum as statenum
		from tblwork w
		    inner join tblstage s on s.stageseq = w.stageseq
		    inner join tblteam t on w.teamseq = t.teamseq
		    inner join tblemployee e on t.employeeseq = e.employeeseq;
            
update tblwork set statenum = '0' where workseq = 68;
select * from tblwork;           
select * from tblemployee;
delete tblwork where workseq = 68;
rollback;
commit;            
            
            
            
            
            
            
            
            
            
---------------- 일정
drop table tblschedule CASCADE CONSTRAINTS;
drop sequence scheduleSeq;

create table tblSchedule (
     scheduleSeq number primary key,      
     startDate date not null,
     endDate date not null,
     sTitle varchar2(200) not null,
     sMemo varchar2(500),
     employeeSeq number not null references tblEmployee(employeeSeq)
);
create sequence scheduleSeq;

INSERT INTO tblSchedule (scheduleSeq, startdate, enddate, sTitle, sMemo, employeeSeq) VALUES (scheduleSeq.nextval, '22-07-14', '22-07-15', '회의', '세미나 회의', 1);
INSERT INTO tblSchedule (scheduleSeq, startdate, enddate, sTitle, sMemo, employeeSeq) VALUES (scheduleSeq.nextval, '22-07-14', '22-07-16', '회의', null, 2);
INSERT INTO tblSchedule (scheduleSeq, startdate, enddate, sTitle, sMemo, employeeSeq) VALUES (scheduleSeq.nextval, '22-07-14', '22-07-17', '출장', '부산 출장', 3);
INSERT INTO tblSchedule (scheduleSeq, startdate, enddate, sTitle, sMemo, employeeSeq) VALUES (scheduleSeq.nextval, '22-07-14', '22-07-18', '휴가', null, 4);
INSERT INTO tblSchedule (scheduleSeq, startdate, enddate, sTitle, sMemo, employeeSeq) VALUES (scheduleSeq.nextval, '22-07-14', '22-07-19', '교육', 'API 교육', 5);
INSERT INTO tblSchedule (scheduleSeq, startdate, enddate, sTitle, sMemo, employeeSeq) VALUES (scheduleSeq.nextval, '22-07-14', '22-07-20', '회의', null, 6);
INSERT INTO tblSchedule (scheduleSeq, startdate, enddate, sTitle, sMemo, employeeSeq) VALUES (scheduleSeq.nextval, '22-08-23', '22-08-23', '프로젝트 회의', null, 6);

INSERT INTO tblSchedule (scheduleSeq, startdate, enddate, sTitle, sMemo, employeeSeq) VALUES (scheduleSeq.nextval, '22-08-23', '22-08-23', '테스트', null, 6);
commit;            
            
            
create or replace view vdashissue
as
(
select 
    count(*) as issucnt,
    t.name
from tblissue i
    inner join tblwork w
    on i.workseq = w.workseq
    inner join tblteam t
    on t.teamseq = w.teamseq
    group by t.name
);

create or replace view vdashoutput
as
(
select
    t.name,
    count(*) as outputcnt
from tbloutput op
    inner join tblwork w
    on w.workseq = op.workseq
    inner join tblteam t
    on t.teamseq = w.teamseq
    group by t.name
);            
            
            
create or replace view voutputcount
as
(select
    t.name,
    count(*) as outputcnt
from tbloutput op
    inner join tblwork w
    on w.workseq = op.workseq
    inner join tblteam t
    on t.teamseq = w.teamseq
    where op.oTypeSeq in (1, 2, 3, 4, 6)
    group by t.name
);            
commit;            
            
            
select 
w.workseq as workseq,
w.stageseq as stageseq,
w.teamseq as teamseq,
w.name as workname,
w.startdate as worksdate,
w.finishdate as workfdate,
w.statenum as wstatenum,
ws.state as wstate,
t.employeeseq as employeeseq,
p.projectseq as project,
p.name as projectname,
s.stageseq as staegeseq,
s.name as stagename
from tblwork w
    inner join tblwstate ws on w.wstateseq = ws.wstateseq
    inner join tblteam t on t.teamseq = w.teamseq
    inner join tblproject p on p.projectseq = t.projectseq
    inner join tblstage s on s.projectseq = p.projectseq 
    where employeeseq = '6';
    
select * from tblstage;


select * from tblproject;
select * from tblwstate;
            
select * from tblwstate;
select * from tblwork;            
            
            
select * from tblstage;            


    
select * from tblstage where stageseq = 22;

select 
    w.workseq as workseq,
    w.name as workname,
    w.startdate as worksdate,
    w.finishdate as workfdate,
    w.memo as workmemo,
    w.statenum as workstatenum,
    ws.state as workstate
from tblwork w
    inner join tblwstate ws on w.wstateseq = ws.wstateseq
    where workseq = 71;

--stageseq=선택, teamseq, wsateseq=4, name=입력, startdate=입력, finishdate=입력, statenum=0, memo=null

select * from tblwork;

insert into tblwork(wstateseq, name, startdate, finishdate, statenum, memo) values (workseq.nextVal, 1, (select teamseq from tblteam where employeeseq = 6), 4, '하둘셋넷다여일여아열 열두셋넷다여일열아열 하둘셋넷다엿일여아열 하둘셋', '22-09-06', '22-09-08', 0, '메모');           
update tblwork set wstateseq = 2, startdate = '22/09/06', finishdate = '22/09/06', statenum = '50', memo = '업데이트 테스트' where workseq = '72';        
--update문 수정해서 넣기
delete tblwork where workseq = 72;
commit;

rollback;         
            