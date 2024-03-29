CREATE OR REPLACE FUNCTION net.func_for_rprt_statematerials (
  pdatestart varchar,
  pdateend varchar,
  elementcode double precision,
  budgcode varchar,
  rencode double precision,
  elementtypecode double precision,
  plancode double precision,
  formplancode double precision,
  komplekt double precision,
  strgroupmaterials varchar,
  grmatoronlymat double precision,
  ordercode double precision,
  p_worktypecode double precision
)
RETURNS varchar AS
$body$
/* - 2011_10_27 - �������� ������ �� ��������� (4) ��� �� ��������� ����������� �������� �� �����
� �� ����� ������ ������� ������ ��� �� ���������
*/
declare
jj record;
countsel1 numeric;
countsel2 numeric;
strgroupmat varchar;
elemcode numeric;
strbudgetrefcodes varchar;
BEGIN
-- BEGIN
-- drop table IF EXISTS data_for_report_statematerials_sel1 , data_for_report_statematerials_sel2;
-- END;

strgroupmat = replace(strgroupmaterials, ' ', '');
elemcode = elementcode;
 strbudgetrefcodes = replace(budgcode, ' ', '');

select count(*) into countsel1 from information_schema.tables where table_name = 'data_for_report_statematerials_sel1';
if countsel1 = 0 then
create TEMPORARY table data_for_report_statematerials_sel1(kindname VARCHAR ,
kindcode numeric ,
eicode numeric,
eistatus varchar,
countfact double PRECISION ,
materialrefcode numeric,
materialname varchar,
namemeasure varchar,
code numeric,
workname varchar,
techkartnumber varchar,
ordernumber varchar,
orderperiod date,
aaaa numeric,
departmentrefcode numeric ,
departmentname varchar,
budgetrefcode numeric,
budgetname varchar,
staterefcode numeric ,
elementrefcode numeric,
object varchar,
timegen double PRECISION ,
enplanworkcode numeric
) ;
ELSE truncate table data_for_report_statematerials_sel1;
End if;

INSERT INTO data_for_report_statematerials_sel1
select kindname ,
kindcode ,
eicode ,
eistatus ,
countfact ,
materialrefcode ,
materialname ,
namemeasure ,
code ,
workname ,
techkartnumber ,
ordernumber ,
orderperiod ,
aaaa ,
departmentrefcode ,
(select (Select coalesce(r.name,'') From enestimateitem i , enplanwork p , enelement e , epren r
Where i.planrefcode = p.code
and p.elementrefcode = e.code
and e.renrefcode = r.code
and i.code = eicode
limit 1 )
|| ' (' || coalesce(name,'') ||')' from endepartment where code = departmentrefcode ) as departmentname ,
budgetrefcode ,
(select name from endepartment where code = budgetrefcode ) as budgetname ,
staterefcode ,
elementrefcode ,
object ,

(
Select sum(enplanworkitem.timegen) from /*enplanwork ,*/ enact2enplanwork , enact , enplanworkitem
Where /*enplanwork.code*/ enplanworkitem.planrefcode in (
Select h1.plannewrefcode from enplancorrecthistory h1
where h1.reasoncode = 5 /* ������� � ���� */
and h1.planoldrefcode in (
Select h.plannewrefcode from enplancorrecthistory h
where h.planoldrefcode in ( select pi.planrefcode from enplanworkitem pi where pi.code = selall.code )
and h.reasoncode = 4 /* ������� � ���� */ )
/*�������� ��� ����� ���� ���� ������ � ������� ���� */
UNION

Select h.plannewrefcode from enplancorrecthistory h
where h.planoldrefcode in ( select pi.planrefcode from enplanworkitem pi where pi.code = selall.code )
and h.reasoncode = 5 /* ������� � ���� */
/*�������� ��� ����� ���� ���� ����������� ������*/
UNION
select pi.planrefcode as plannewrefcode from enplanworkitem pi where pi.code = selall.code and selall.kindcode = 4
)
/*and enplanwork.code = enact2enplanwork.plancode */
and enplanworkitem.planrefcode = enact2enplanwork.plancode
and enact.code = enact2enplanwork.actrefcode
and enact.statusrefcode <> 2 /*�� ����� ���������� ����� */
/* and enplanworkitem.planrefcode = enplanwork.code*/
and enplanworkitem.kartarefcode = (select pk.kartarefcode from enplanworkitem pk where pk.code = selall.code )
) as timegen
, enplanworkcode
from (
select case when kindcode = 2 then '�'
when kindcode = 3 then '���'
when kindcode = 4 then '���-�' else ' ' end as kindname ,
kindcode ,
eicode ,
eistatus ,
countfact ,
materialrefcode ,
materialname ,
namemeasure ,
code ,
coalesce(workname,' ') as workname ,
techkartnumber ,
departmentrefcode ,
budgetrefcode ,
staterefcode ,
elementrefcode ,
object

/*����� ������ ������ */
, (select distinct rq.numberdoc from rqorderitem2enestimttm rqq2en , rqorderitem rqo , rqorder rq
where rqq2en.estimateitemcode = eicode
and rqq2en.orderitemcode = rqo.code
and rqo.orderrefcode = rq.code
and rq.kindrefcode in (4,5,7,8) limit 1  ) as ordernumber
/*����� ���� ������ */
, (select distinct rq.orderperiod from rqorderitem2enestimttm rqq2en , rqorderitem rqo , rqorder rq
where rqq2en.estimateitemcode = eicode
and rqq2en.orderitemcode = rqo.code
and rqo.orderrefcode = rq.code
and rq.kindrefcode in (4,5,7,8) limit 1  ) as orderperiod
,
/**/
( select coalesce(sum(countfact),0) from (
select countfact , prizn
from (
select estimateitemcode , sum(countfact) as countfact , nomenclaturename , nomenclatureunitname , partycode ,
kindcode , statusname , max(modify_time) as modify_time ,
moloutcode , moloutname
, f_analyse_motion(estimateitemcode , sum(countfact) ,
nomenclaturename , nomenclatureunitname ,
partycode , kindcode , max(modify_time) , kindcode ) as prizn , factstat
from (
/* << ��� ������ �� ������� �������� ���� ���������� �� � �������� ���� ��� �� � ������� ������� .*/
Select fi2ei.modify_time , fi2ei.estimateitemcode , fi2ei.countgen as countfact , rqfkor.moloutcode ,
rqfkor.moloutname , rqfkit.nomenclaturename , rqfkit.nomenclatureunitname
, rqfk2part.partycode , rqfkor.kindcode ,rqfkorstatu.name as statusname ,
case when rqfkor.kindcode = 1 and upper(rqfkorstatu.name) = '���������' then ' '

when rqfkor.kindcode = 1 and upper(rqfkorstatu.name) = '����������'
then rqfkor.moloutcode||' '||rqfkor.moloutname
when rqfkor.kindcode = 1 and upper(rqfkorstatu.name) = '���������� �� ��'
then rqfkor.moloutcode||' '||rqfkor.moloutname
else ' ' end as factstat

From rqfkorderitem2enstmttm fi2ei , rqfkorderitem rqfkit , rqfkorder rqfkor
, rqfkorderdata2fkparty rqfk2part , rqfkorderstatus rqfkorstatu
where fi2ei.estimateitemcode = selsprizn.eicode
and rqfkit.code = fi2ei.fkorderitemrefcode
and rqfkor.code = rqfkit.fkorderrefcode
and rqfkor.kindcode = 1 /*��������� �����*/
and rqfk2part.fkorderitemrefcode = rqfkit.code
and rqfk2part.estimateitemrefcode = fi2ei.estimateitemcode
and rqfkorstatu.code = rqfkor.statuscode
and rqfkorstatu.code in (5,4,3) /*��� ����������� �������� */
and fi2ei.countgen <> 0 /* �� ��������� ������� ������� ��� ��� �� ���� ��� ���� ������ �������� */
/* 22.04.2014 �� ��������� ������� ���� �� ��������� ��� �������� �� ����������� ������ */
and not exists ( select * from rqfkorderitem2enstmttm fi2ei2 , rqfkorderitem fi2 , rqfkorder f2
                      where fi2ei2.estimateitemcode =  selsprizn.eicode
                      and fi2ei2.fkorderitemrefcode = fi2.code
                      and fi2.fkorderrefcode=f2.code
                      and f2.dategen <= rqfkor.dategen
                      and f2.kindcode in (2,4,5,6,13 , 28 , 29)
                                   )
UNION
Select fi2ei.modify_time , selsprizn.eicode as estimateitemcode /*fi2ei.estimateitemcode*/ , fi2ei.countgen as countfact , rqfkor.moloutcode ,
rqfkor.moloutname , rqfkit.nomenclaturename , rqfkit.nomenclatureunitname
, 0 as partycode , rqfkor.kindcode ,rqfkorstatu.name as statusname ,
case when rqfkor.kindcode = 1 and upper(rqfkorstatu.name) = '���������' then ' '

when rqfkor.kindcode = 1 and upper(rqfkorstatu.name) = '����������'
then rqfkor.moloutcode||' '||rqfkor.moloutname
when rqfkor.kindcode = 1 and upper(rqfkorstatu.name) = '���������� �� ��'
then rqfkor.moloutcode||' '||rqfkor.moloutname
else ' ' end as factstat


From rqfkorderitem2enstmttm fi2ei , rqfkorderitem rqfkit , rqfkorder rqfkor
, rqfkorderstatus rqfkorstatu
where fi2ei.estimateitemcode in /*selsprizn.eicode*/
( Select case /* ���� � �������� enestimateitem2nstmttm ���� ������
� ����� �������� ����� ������� �� ���������� ���������� ��������
��� ������ ��� ������ �� ���� �������� ���� ������ � ����������� ��� ����������
����� ���������� ��� �� �������� */
When ( coalesce(enist2enist.code,0) <> 0 )
then enist2enist.estimateiteminrefcode
else enist.code end
From enestimateitem enist Left Join enestimateitem2nstmttm enist2enist
on (enist.code = enist2enist.estimateitemoutrefcode and enist2enist.typerefcode in (4,5))
Where enist.code = selsprizn.eicode /*500592327*/
)
and rqfkit.code = fi2ei.fkorderitemrefcode
and rqfkor.code = rqfkit.fkorderrefcode
and rqfkor.kindcode = 1 /*��������� �����*/
and rqfkorstatu.code = rqfkor.statuscode
and rqfkorstatu.code in (1,2,4) /*��� �������� ��������� ��� ��������� ����������� ��� �� */
and fi2ei.countgen <> 0 /* �� ��������� ������� ������� ��� ��� �� ���� ��� ���� ������ �������� */
/* 22.04.2014 �� ��������� ������� ���� �� ��������� ��� �������� �� ����������� ������ */
and not exists ( select * from rqfkorderitem2enstmttm fi2ei2 , rqfkorderitem fi2 , rqfkorder f2
                      where fi2ei2.estimateitemcode =  selsprizn.eicode
                      and fi2ei2.fkorderitemrefcode = fi2.code
                      and fi2.fkorderrefcode=f2.code
                      and f2.dategen <= rqfkor.dategen
                      and f2.kindcode in (2,4,5,6,13 , 28 , 29)
                                   )

UNION ALL

Select fi2ei.modify_time , fi2ei.estimateitemcode ,
case when fin.statusrefcode = 3 then /*���� ������ ��������� �� ������ ���� */
(select coalesce(sum(fin1.quantity), 0)
from finmaterials fin1
where fin1.estimateitemrefcode = selsprizn.eicode
and fin1.parentrefcode in
(select fin.code from finmaterials fin where
fin.estimateitemrefcode = selsprizn.eicode and fin.statusrefcode = 3)
and fin1.modify_time = (select max(fin3.modify_time)
from finmaterials fin3
where fin3.estimateitemrefcode = selsprizn.eicode
and fin3.parentrefcode in
(select fin4.code from finmaterials fin4
where fin4.estimateitemrefcode = selsprizn.eicode
and fin4.statusrefcode = 3)
)
)
else fin.quantity end as countfact ,
rqfkor.moloutcode ,
rqfkor.moloutname , rqfkit.nomenclaturename , rqfkit.nomenclatureunitname
, fin.party_id as partycode , rqfkor.kindcode ,rqfkorstatu.name as statusname ,

/* ��� ���������� ������ */
case
when kindcode = 2 and rqfkorstatu.code = 1 /*��������*/
then rqfkor.molincode||' '||rqfkor.molinname
when kindcode = 2 and upper(rqfkorstatu.name) = '���������'
then rqfkor.molincode||' '||rqfkor.molinname
when kindcode = 2 and upper(rqfkorstatu.name) = '����������'
then rqfkor.moloutcode||' '||rqfkor.moloutname
when kindcode = 2 and upper(rqfkorstatu.name) = '���������� �� ��'
then rqfkor.moloutcode||' '||rqfkor.moloutname
else ' ' end as factstat


from
rqfkorderitem2enstmttm fi2ei, rqfkorderitem rqfkit , rqfkorder rqfkor
, finmaterials fin , rqfkorderstatus rqfkorstatu
where fi2ei.estimateitemcode = selsprizn.eicode
and rqfkit.code = fi2ei.fkorderitemrefcode
and rqfkor.code = rqfkit.fkorderrefcode
and rqfkor.kindcode /*= 2 */ in (2,4,5,6,13 , 28 , 29) /*���������� ����� ��� ����������� ����������*/
and fin.estimateitemrefcode = fi2ei.estimateitemcode
and fin.code = fi2ei.finmaterialsrefcode
and rqfkorstatu.code = rqfkor.statuscode
-- NET-1472 and rqfkor.statuscode <> 1
and fin.statusrefcode = 1

/*���� �������� ���� �������� */
UNION ALL
Select fi2ei.modify_time , fi2ei.estimateitemcode ,
fi2ei.countgen as countfact ,
rqfkor.moloutcode ,
rqfkor.moloutname , rqfkit.nomenclaturename , rqfkit.nomenclatureunitname
, 0 as partycode , rqfkor.kindcode ,rqfkorstatu.name as statusname ,

/* ��� ���������� ������ */
case
when kindcode = 2 and rqfkorstatu.code = 1 /*��������*/
then rqfkor.molincode||' '||rqfkor.molinname
when kindcode = 2 and upper(rqfkorstatu.name) = '���������'
then rqfkor.molincode||' '||rqfkor.molinname
when kindcode = 2 and upper(rqfkorstatu.name) = '����������'
then rqfkor.moloutcode||' '||rqfkor.moloutname
when kindcode = 2 and upper(rqfkorstatu.name) = '���������� �� ��'
then rqfkor.moloutcode||' '||rqfkor.moloutname
when kindcode = 2 and rqfkorstatu.code = 5
then rqfkor.moloutcode||' '||rqfkor.moloutname

else ' ' end as factstat

from
rqfkorderitem2enstmttm fi2ei, rqfkorderitem rqfkit , rqfkorder rqfkor
, sccounter scc , rqfkorderstatus rqfkorstatu
where fi2ei.estimateitemcode = selsprizn.eicode
and rqfkit.code = fi2ei.fkorderitemrefcode
and rqfkor.code = rqfkit.fkorderrefcode
and rqfkor.kindcode in (2,5,6,13 , 28 , 29) /*���������� ����� */
and scc.estimateitemrefcode = fi2ei.estimateitemcode
and rqfkorstatu.code = rqfkor.statuscode
-- NET-1472 and rqfkor.statuscode <> 1



UNION ALL
/*���� �������� �� �������� ���������� */

Select fin.modify_time as modify_time , selsprizn.eicode as estimateitemcode , fin.quantity as countfact ,
act.numbergen as moloutcode , to_char(act.dategen ,'dd.mm.yyyy') as moloutname ,
fin.mat_name as nomenclaturename , fin.mu_name as nomenclatureunitname ,
fin.party_id as partycode , 10 as kindcode , actstatu.name as statusname ,
case when act.statusrefcode = 3 then /* �� ���������� ����������� ��������� ��������� ���� ��� �������� */
' '
else
fin.div_code ||' '|| fin.div_name end as factstat
from enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
, finmaterials fin , enestimateitem ene , /*enplanwork enp ,*/ enact2enplanwork act2wor ,
enact act , enactstatus actstatu
Where

fin.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
/*������ �������� � ������ ������� */
and fin.estimateitemrefcode = ene.code
/*and ene.planrefcode = enp.code
and act2wor.plancode = enp.code ���� */
and act2wor.plancode = ene.planrefcode /* ����� */
and act2wor.actrefcode = act.code
and fin.statusrefcode = 1 /*��������������*/
/*and act.statusrefcode = 3 ����������� � ����������� */
and actstatu.code = act.statusrefcode
and enit2enit2.estimateiteminrefcode /*=*/ in (
Select enit2enit1.estimateitemoutrefcode from enestimateitem2nstmttm enit2enit1 /*������� ��������� �� �����*/
Where enit2enit1.estimateiteminrefcode = selsprizn.eicode
and enit2enit1.typerefcode = 1 )
and (SELECT selsprizn.kindcode) = 2 /*���� ������� �������� ���� */
and enit2enit2.typerefcode = 1

UNION ALL

/*���� �������� �� ���������� ���� */

Select fin.modify_time as modify_time , selsprizn.eicode as estimateitemcode , fin.quantity as countfact ,
act.numbergen as moloutcode , to_char(act.dategen ,'dd.mm.yyyy') as moloutname ,
fin.mat_name as nomenclaturename , fin.mu_name as nomenclatureunitname ,
fin.party_id as partycode , 10 as kindcode , actstatu.name as statusname ,
case when act.statusrefcode = 3 then /*�� ���������� ����������� ��������� ��������� ���� ��� ��������*/
' '
else
fin.div_code ||' '|| fin.div_name end as factstat
from enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
, finmaterials fin , enestimateitem ene , /*enplanwork enp ,*/ enact2enplanwork act2wor ,
enact act , enactstatus actstatu
Where

fin.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
/*������ �������� � ������ ������� */
and fin.estimateitemrefcode = ene.code
/*and ene.planrefcode = enp.code
and act2wor.plancode = enp.code ���� */
and act2wor.plancode = ene.planrefcode /* ����� */
and act2wor.actrefcode = act.code
and fin.statusrefcode = 1 /*��������������*/
/* and act.statusrefcode = 3 ����������� � �����������*/
and actstatu.code = act.statusrefcode

and enit2enit2.estimateiteminrefcode = selsprizn.eicode
and enit2enit2.typerefcode = 1
and (SELECT selsprizn.kindcode) = 3 /*���� ������� ������� ���� */

UNION ALL

/*���� �������� �� ���������� ���� */

Select fin.modify_time as modify_time , selsprizn.eicode as estimateitemcode , fin.quantity as countfact ,
act.numbergen as moloutcode , to_char(act.dategen ,'dd.mm.yyyy') as moloutname ,
fin.mat_name as nomenclaturename , fin.mu_name as nomenclatureunitname ,
fin.party_id as partycode , 10 as kindcode , actstatu.name as statusname ,
case when act.statusrefcode = 3 then /*�� ���������� ����������� ��������� ��������� ���� ��� �������� */
' '
else
fin.div_code ||' '|| fin.div_name end as factstat
from /*enestimateitem2nstmttm enit2enit2*/ /*������� ��������� �� �����*/
/*, */ finmaterials fin , enestimateitem ene , /*enplanwork enp ,*/ enact2enplanwork act2wor ,
enact act , enactstatus actstatu
Where

/* fin.estimateitemrefcode = enit2enit2.estimateitemoutrefcode */
/*������ �������� � ������ ������� */
/*and */ fin.estimateitemrefcode = ene.code
/*and ene.planrefcode = enp.code
and act2wor.plancode = enp.code ���� */
and act2wor.plancode = ene.planrefcode /* ����� */
and act2wor.actrefcode = act.code
and fin.statusrefcode = 1 /*��������������*/
/*and act.statusrefcode = 3 ����������� � �����������*/
and actstatu.code = act.statusrefcode

/*and ( enit2enit2.estimateitemoutrefcode = selsprizn.eicode ) */
and ene.code = selsprizn.eicode
and (SELECT selsprizn.kindcode) = 4 /*���� ������� ������� ���� */


UNION ALL

/*���� �� ��������� ��� ��������� �� �������� ���������� */
Select scc.modify_time as modify_time , selsprizn.eicode as estimateitemcode , 1 as countfact ,
scoz.numberdoc as moloutcode , to_char(scut.dategen ,'dd.mm.yyyy') as moloutname ,
scc.name as nomenclaturename , '��' as nomenclatureunitname ,
0 as partycode , 10 as kindcode , scuts.name as statusname ,
case when act.statusrefcode = 3 then /* �� ���������� ����������� ��������� ��������� ���� ��� �������� */
' ' else scc.molcode end as factstat
from
enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
inner join
(Select distinct estimateitemoutrefcode from enestimateitem2nstmttm /*������� ��������� �� �����*/
Where estimateiteminrefcode = selsprizn.eicode
and typerefcode = 1) enit2enit1
on enit2enit2.estimateiteminrefcode = enit2enit1.estimateitemoutrefcode
inner join sccounter scc on scc.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
inner join enestimateitem ene on scc.estimateitemrefcode = ene.code
/*enplanwork enp ,*/
inner join enact2enplanwork act2wor on act2wor.plancode = ene.planrefcode /* ����� */
inner join enact act on act2wor.actrefcode = act.code
inner join scusageinputtmz2sccntr scu2scc on scu2scc.sccounterrefcode = scc.code
inner join scusageinputitemoz scoz on scu2scc.ozrefcode = scoz.code
inner join scusageinputitem scuit on scoz.usageinputitemrefcode = scuit.code
inner join scusageinput scut on scuit.usageinputrefcode = scut.code
inner join scusageinputstatus scuts on scut.statusrefcode = scuts.code
Where
scc.statusrefcode = 2 /*� ��� (��-1 � ���.)*/
and scuts.code = 3 /*���������� */ /* ������� ������� ������������ �� ��� ��� ���� ��������� � ������� ����� �� �� ���������� */
and (SELECT selsprizn.kindcode ) = 2 /*���� ������� �������� ���� */
and enit2enit2.typerefcode = 1

UNION ALL

/*���� �� ��������� ��� ��������� �� ���������� ���� */

Select scc.modify_time as modify_time , selsprizn.eicode as estimateitemcode , 1 as countfact ,
scoz.numberdoc as moloutcode , to_char(scut.dategen ,'dd.mm.yyyy') as moloutname ,
scc.name as nomenclaturename , '��' as nomenclatureunitname ,
0 as partycode , 10 as kindcode , scuts.name as statusname ,
case when act.statusrefcode = 3 then /* �� ���������� ����������� ��������� ��������� ���� ��� �������� */
' ' else scc.molcode end as factstat
from
enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
inner join sccounter scc on scc.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
inner join enestimateitem ene on scc.estimateitemrefcode = ene.code
/*enplanwork enp ,*/
inner join enact2enplanwork act2wor on act2wor.plancode = ene.planrefcode
inner join enact act on act2wor.actrefcode = act.code
inner join scusageinputtmz2sccntr scu2scc on scu2scc.sccounterrefcode = scc.code
inner join scusageinputitemoz scoz on scu2scc.ozrefcode = scoz.code
inner join scusageinputitem scuit on scoz.usageinputitemrefcode = scuit.code
inner join scusageinput scut on scuit.usageinputrefcode = scut.code
inner join scusageinputstatus scuts on scut.statusrefcode = scuts.code
Where
scc.statusrefcode = 2 /*� ��� (��-1 � ���.)*/
and scuts.code = 3 /*���������� */ /* ������� ������� ������������ �� ��� ��� ���� ��������� � ������� ����� �� �� ���������� */
and enit2enit2.estimateiteminrefcode = selsprizn.eicode
and enit2enit2.typerefcode = 1
and (SELECT selsprizn.kindcode ) = 3 /*���� ������� ������� ���� */

UNION ALL

/*���� �� ��������� ��� ��������� �� ���������� ���� */

Select scc.modify_time as modify_time , selsprizn.eicode as estimateitemcode , 1 as countfact ,
scoz.numberdoc as moloutcode , to_char(scut.dategen ,'dd.mm.yyyy') as moloutname ,
scc.name as nomenclaturename , '��' as nomenclatureunitname ,
0 as partycode , 10 as kindcode , scuts.name as statusname ,
case when act.statusrefcode = 3 then /* �� ���������� ����������� ��������� ��������� ���� ��� �������� */
' ' else scc.molcode end as factstat
from
enestimateitem ene
/*enplanwork enp ,*/
inner join enact2enplanwork act2wor on act2wor.plancode = ene.planrefcode
inner join enact act on act2wor.actrefcode = act.code
inner join sccounter scc on scc.estimateitemrefcode = ene.code
inner join scusageinputtmz2sccntr scu2scc on scu2scc.sccounterrefcode = scc.code
inner join scusageinputitemoz scoz on scu2scc.ozrefcode = scoz.code
inner join scusageinputitem scuit on scoz.usageinputitemrefcode = scuit.code
inner join scusageinput scut on scuit.usageinputrefcode = scut.code
inner join scusageinputstatus scuts on scut.statusrefcode = scuts.code
Where
scc.statusrefcode = 2 /*� ��� (��-1 � ���.)*/
and scuts.code = 3 /*���������� */ /* ������� ������� ������������ �� ��� ��� ���� ��������� � ������� ����� �� �� ���������� */
and ene.code = selsprizn.eicode
and (SELECT selsprizn.kindcode ) = 4 /*���� ������� ������� ���� */






) www


Group by estimateitemcode , /*countfact ,*/ nomenclaturename , nomenclatureunitname , partycode ,
kindcode ,statusname , moloutcode , moloutname , factstat


) wwww
where ( prizn = 0 or kindcode = 10 )

UNION /*======================================================================================*/
select f.quantity as countfact , 0 as prizn
from finmaterials f
where f.statusrefcode = 1
and f.code in (select fi.code from finmaterials fi
where fi.modify_time in (
select max(modify_time) from finmaterials f where f.statusrefcode = 1
and f.estimateitemrefcode in ( /*���� � ��������� ������� �� ���������� ��������� �� ����� � �� ����� */

select estimatecode from (
Select en2en.estimateitemoutrefcode as estimatecode
from enestimateitem2nstmttm en2en
where en2en.estimateiteminrefcode = selsprizn.eicode
and (SELECT selsprizn.kindcode) = 2
and en2en.typerefcode = 1
UNION
Select en2en.estimateitemoutrefcode as estimatecode
from enestimateitem2nstmttm en2en
where en2en.estimateiteminrefcode in ( Select en2en.estimateitemoutrefcode as estimatecode
from enestimateitem2nstmttm en2en
where en2en.estimateiteminrefcode = selsprizn.eicode
and en2en.typerefcode = 1 )
and (SELECT selsprizn.kindcode) = 2
and en2en.typerefcode = 1
) sel_if_month
UNION
/* ���� � ������� ���� �� ���������� ��������� �� ����� � �� ����� */
select estimatecode from (
Select selsprizn.eicode as estimatecode
where (SELECT selsprizn.kindcode) = 3
UNION
Select en2en.estimateitemoutrefcode as estimatecode
from enestimateitem2nstmttm en2en
where en2en.estimateiteminrefcode = selsprizn.eicode
and (SELECT selsprizn.kindcode) = 3
and en2en.typerefcode = 1
) sel_if_plan
UNION
/* ���� � ������� ���� �� ���������� ��������� �� ����� � �� ����� */
select estimatecode from (
Select selsprizn.eicode as estimatecode
where (SELECT selsprizn.kindcode) = 4
UNION
Select en2en.estimateiteminrefcode as estimatecode
from enestimateitem2nstmttm en2en
where en2en.estimateitemoutrefcode = selsprizn.eicode
and (SELECT selsprizn.kindcode) = 4
and en2en.typerefcode = 1
) sel_if_plan
)

group by f.mat_id


) )
and ( /* ���� � ������� */
coalesce((
Select coalesce(sum(countgen),0) from (
Select coalesce(sum(fi2ei.countgen),0) as countgen
From rqfkorderitem2enstmttm fi2ei
where fi2ei.estimateitemcode in /*selsprizn.eicode*/
( Select case /* ���� � �������� enestimateitem2nstmttm ���� ������
� ����� �������� ����� ������� �� ���������� ���������� ��������
��� ������ ��� ������ �� ���� �������� ���� ������ � ����������� ��� ����������
����� ���������� ��� �� �������� */
When ( coalesce(enist2enist.code,0) <> 0 )
then enist2enist.estimateiteminrefcode
else enist.code end
From enestimateitem enist Left Join enestimateitem2nstmttm enist2enist
on (enist.code = enist2enist.estimateitemoutrefcode and enist2enist.typerefcode in (4,5))
Where enist.code = selsprizn.eicode /*500592327*/ )
and (SELECT selsprizn.kindcode) = 2 /*���*/
UNION
Select coalesce(sum(fi2ei.countgen),0) as countgen
From rqfkorderitem2enstmttm fi2ei
where fi2ei.estimateitemcode in (select en2en.estimateiteminrefcode from enestimateitem2nstmttm en2en
where en2en.estimateitemoutrefcode = selsprizn.eicode
and en2en.typerefcode = 1 )
and (SELECT selsprizn.kindcode) = 3 /*����*/

UNION
Select coalesce(sum(fi2ei.countgen),0) as countgen
From rqfkorderitem2enstmttm fi2ei
where fi2ei.estimateitemcode in (select en2en.estimateiteminrefcode from enestimateitem2nstmttm en2en
where en2en.estimateitemoutrefcode in
(select estimateiteminrefcode from enestimateitem2nstmttm en2en
where en2en.estimateitemoutrefcode = selsprizn.eicode
and en2en.typerefcode = 1
)
and en2en.typerefcode = 1
)
and (SELECT selsprizn.kindcode) = 4 /*����*/
) selord

),0) = 0

And /* ���� � ����� */
( select coalesce(sum(countfact),0) from (
/*���� �������� �� �������� ���������� */
Select fin.modify_time as modify_time , selsprizn.eicode as estimateitemcode , coalesce(fin.quantity,0) as countfact ,
act.numbergen as moloutcode , to_char(act.dategen ,'dd.mm.yyyy') as moloutname ,
fin.mat_name as nomenclaturename , fin.mu_name as nomenclatureunitname ,
fin.party_id as partycode , 10 as kindcode , actstatu.name as statusname
from enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
, finmaterials fin , enestimateitem ene , /*enplanwork enp ,*/ enact2enplanwork act2wor ,
enact act , enactstatus actstatu
Where

fin.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
and fin.estimateitemrefcode = ene.code
/*and ene.planrefcode = enp.code
and act2wor.plancode = enp.code ���� */
and act2wor.plancode = ene.planrefcode /* ����� */
and act2wor.actrefcode = act.code
and fin.statusrefcode = 1 /*��������������*/
and actstatu.code = act.statusrefcode
and enit2enit2.estimateiteminrefcode /*=*/ in (
Select enit2enit1.estimateitemoutrefcode from enestimateitem2nstmttm enit2enit1 /*������� ��������� �� �����*/
Where enit2enit1.estimateiteminrefcode = selsprizn.eicode
and enit2enit1.typerefcode = 1 )
and (SELECT selsprizn.kindcode) = 2 /*���� ������� �������� ���� */
and enit2enit2.typerefcode = 1

UNION

/*���� �������� �� ���������� ���� */

Select fin.modify_time as modify_time , selsprizn.eicode as estimateitemcode , coalesce(fin.quantity,0) as countfact ,
act.numbergen as moloutcode , to_char(act.dategen ,'dd.mm.yyyy') as moloutname ,
fin.mat_name as nomenclaturename , fin.mu_name as nomenclatureunitname ,
fin.party_id as partycode , 10 as kindcode , actstatu.name as statusname
from enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
, finmaterials fin , enestimateitem ene , /*enplanwork enp ,*/ enact2enplanwork act2wor ,
enact act , enactstatus actstatu
Where

fin.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
and fin.estimateitemrefcode = ene.code
/*and ene.planrefcode = enp.code
and act2wor.plancode = enp.code ���� */
and act2wor.plancode = ene.planrefcode /* ����� */
and act2wor.actrefcode = act.code
and fin.statusrefcode = 1 /*��������������*/
and actstatu.code = act.statusrefcode

and enit2enit2.estimateiteminrefcode = selsprizn.eicode
and enit2enit2. typerefcode = 1
and (SELECT selsprizn.kindcode) = 3 /*���� ������� ������� ���� */

UNION

/*���� �������� �� ���������� ���� */

Select fin.modify_time as modify_time , selsprizn.eicode as estimateitemcode , coalesce(fin.quantity,0) as countfact ,
act.numbergen as moloutcode , to_char(act.dategen ,'dd.mm.yyyy') as moloutname ,
fin.mat_name as nomenclaturename , fin.mu_name as nomenclatureunitname ,
fin.party_id as partycode , 10 as kindcode , actstatu.name as statusname
from /*enestimateitem2nstmttm enit2enit2*/ /*������� ��������� �� �����*/
/*,*/ finmaterials fin , enestimateitem ene , /*enplanwork enp ,*/ enact2enplanwork act2wor ,
enact act , enactstatus actstatu
Where

/*fin.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
and*/ fin.estimateitemrefcode = ene.code
/*and ene.planrefcode = enp.code
and act2wor.plancode = enp.code ���� */
and act2wor.plancode = ene.planrefcode /* ����� */
and act2wor.actrefcode = act.code
and fin.statusrefcode = 1 /*��������������*/
and actstatu.code = act.statusrefcode
and ene.code = selsprizn.eicode
/*and ( enit2enit2.estimateitemoutrefcode = selsprizn.eicode ) */
and (SELECT selsprizn.kindcode) = 4 /*���� ������� ������� ���� */

) selact
) = 0

)


UNION /*===========������� ��������� ���������������� ��� ����===========*/
/* ����������������� ��������� �� ������� � ���� enestimateitem kind = 1 - ��������� �
� ���� sccounterstatus = �� �������� 1 - ��������������
������ ����� ������ ����������� ����� ��������� */
Select enisc.countfact as countfact , 0 as prizn
From enestimateitem enisc , sccounter scc , enworkorder2enplanwork w2p , enworkorder w ,
finmoldata fmd
Where enisc.code = scc.estimateitemrefcode
and enisc.kindrefcode = 1
and enisc.planrefcode = w2p.plancode
and w2p.workordercode = w.code
and fmd.workordercode = w.code
and fmd.moltyperefcode = 1 /*������ */
/*�������� �� ������������� �������� ���� 0 �� ���� �� �������� ��� � �� ��� ������� ������������*/

and coalesce((select sum(coalesce(enisc1.code,0)) from enestimateitem enisc1 , sccounter scc1 , scusageinputtmz2sccntr scu2scc1 ,
scusageinputitemoz scoz1 , scusageinputitem scuit1 , scusageinput scut1 ,
scusageinputstatus scuts1
where scu2scc1.sccounterrefcode = scc1.code
and scu2scc1.ozrefcode = scoz1.code
and scoz1.usageinputitemrefcode = scuit1.code
and scuit1.usageinputrefcode = scut1.code
and scut1.statusrefcode = scuts1.code
and scuts1.code = 3 /*���������� */ /* ������� ������� ������������ �� ��� ��� ���� ��������� � ������� ����� �� �� ���������� */
and enisc1.code = enisc.code
and enisc1.code = scc1.estimateitemrefcode
),0) = 0
and enisc.code IN ( /* ���� �������� �������� � ��������� �����*/
Select enit2enit2.estimateitemoutrefcode from enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
Where /*enit2enit2. countgen <> 0
and */ enit2enit2.typerefcode = 1 /*������� �� �������(�����-�������-���-����)*/
and enit2enit2.estimateiteminrefcode in (
Select enit2enit1.estimateitemoutrefcode from enestimateitem2nstmttm enit2enit1 /*������� ��������� �� �����*/
Where enit2enit1.typerefcode = 1 /*������� �� �������(�����-�������-���-����)*/
and enit2enit1.estimateiteminrefcode = selsprizn.eicode
)
and (SELECT selsprizn.kindcode ) = 2

/*���� �������� �������� � ������� ���� */
UNION
Select enit2enit1.estimateitemoutrefcode from enestimateitem2nstmttm enit2enit1 /*������� ��������� �� �����*/
Where enit2enit1.typerefcode = 1 /*������� �� �������(�����-�������-���-����)*/
and enit2enit1.estimateiteminrefcode = selsprizn.eicode
/*���� �������� �������� � ������� ���� */
and (SELECT selsprizn.kindcode ) = 3
UNION
Select selsprizn.eicode
WHERE (SELECT selsprizn.kindcode ) = 4
)

) selcountfact) as aaaa
/**/
, enplanworkcode
from (
select enpl.kindcode ,
enit.code as eicode ,
case when enit.statusrefcode = 3 then '� ��������'
when enit.statusrefcode = 4 then '�����������'
else cast( null as varchar ) end as eistatus ,
case when enit.kindrefcode = 6 then null else enit.countfact end as countfact ,
enit.materialrefcode ,
case when enit.kindrefcode = 6 then '' else tkm.name end as materialname ,
enpi.code ,
tk.name as workname ,
tk.techkartnumber ,
case when enit.kindrefcode = 6 then '' else tkmesu.name end as namemeasure ,
enpl.departmentrefcode ,
enpl.budgetrefcode ,
enpl.staterefcode ,
enpl.elementrefcode ,
( select eld.ename ||' ���.�'|| coalesce(eld.invnumber,'') || ' / (' ||eplstate.shortname || ')' ) as object


, case when enpl.kindcode = 2 then 1
when enpl.kindcode = 3 then
case
/*���� ���� � �������� �� �� ����� ���� */
when coalesce(( select case when sum(en2en.countgen) > 0 then 999999
when sum(en2en.countgen) is null then -1 else 0 end
from enestimateitem2nstmttm en2en , enestimateitem eniin , enplanwork enpin
where en2en.estimateitemoutrefcode = enit.code
and en2en.typerefcode = 1
and en2en.estimateiteminrefcode = eniin.code
and eniin.planrefcode = enpin.code
and enpin.datestart between to_date(pdatestart,'dd.mm.yyyy') and to_date(pdateend,'dd.mm.yyyy') )
,0) > 0 then 0
/* ���� ���� � �������� ����� ���� */
when coalesce(( select case when sum(en2en.countgen) > 0 then 999999
when sum(en2en.countgen) is null then -1 else 0 end
from enestimateitem2nstmttm en2en , enestimateitem eniin , enplanwork enpin
where en2en.estimateitemoutrefcode = enit.code
and en2en.typerefcode = 1
and en2en.estimateiteminrefcode = eniin.code
and eniin.planrefcode = enpin.code
and enpin.datestart between to_date(pdatestart,'dd.mm.yyyy') and to_date(pdateend,'dd.mm.yyyy'))
,0) in ( -1 , 0 ) then 1
end

when enpl.kindcode = 4 then
/* ���� ���� �� �������� ��� �� ����� �� �� ����� */
case when ( coalesce(( select case when sum(en2en.countgen) > 0 then 999999
when sum(en2en.countgen) is null then -1 else 0 end
from enestimateitem2nstmttm en2en , enestimateitem eniin , enplanwork enpin
where en2en.estimateitemoutrefcode = enit.code
and en2en.typerefcode = 1
and en2en.estimateiteminrefcode = eniin.code
and eniin.planrefcode = enpin.code
and enpin.datestart between to_date(pdatestart,'dd.mm.yyyy') and to_date(pdateend,'dd.mm.yyyy'))
,0) > 0

or
coalesce(( select case when sum(en2en.countgen) > 0 then 999999
when sum(en2en.countgen) is null then -1 else 0 end
from enestimateitem2nstmttm en2en , enestimateitem eniin , enplanwork enpin
where en2en.estimateitemoutrefcode /*=*/ in (select en2en.estimateiteminrefcode from enestimateitem2nstmttm en2en where en2en.estimateitemoutrefcode = enit.code)
and en2en.typerefcode = 1
and en2en.estimateiteminrefcode = eniin.code
and eniin.planrefcode = enpin.code
and enpin.datestart between to_date(pdatestart,'dd.mm.yyyy') and to_date(pdateend,'dd.mm.yyyy'))
,0) > 0
) then 0 else 1
end

end

as prizn
, enpl.code as enplanworkcode

From enestimateitem enit left join enplanworkitem enpi on (enit.planitemrefcode = enpi.code) left join tktechcard tk on (enpi.kartarefcode = tk.code )
,/*
( select * from enplanwork
where enplanwork.datestart between pdatestart and pdateend) enpl ,
*/ enplanwork enpl ,
enelementdata eld ,
tkmaterials tkm ,
tkmeasurement tkmesu ,
enplanworkstate eplstate

where enit.planrefcode = enpl.code
and enit.kindrefcode in ( 1 , 6 ) /*��������� � ������ */
and enit.statusrefcode in (1,2,3,4) /*�������� ������ ��� �� ��������� �����������*/
and enit.countfact <> 0
and enpl.kindcode <> 1 /*�� ��������� ������� ����� */
and eld.ecode = enpl.elementrefcode
and tkm.code = enit.materialrefcode
and tkmesu.code = tkm.measurementcode
and eplstate.code::numeric = enpl.staterefcode::numeric
and case when ordercode <> -1 then enit.code in (select estimateitemcode from rqorderitem2enestimttm as oies inner join rqorderitem as oi on oi.code = oies.orderitemcode where oi.orderrefcode = ordercode) else 1 = 1 end
and ( (enpl.kindcode = 2)

or
( enpl.kindcode in ( 3 , 4 ) and (
select count(*) from (
select ff.code from finmaterials ff where ff.estimateitemrefcode = enit.code
and ff.statusrefcode = 1
UNION
select ff.code from finmaterials ff , enestimateitem2nstmttm e2e
where ff.estimateitemrefcode = e2e.estimateitemoutrefcode
and e2e.estimateiteminrefcode = enit.code
and ff.statusrefcode = 1

UNION
select sc.code from sccounter sc where sc.estimateitemrefcode = enit.code
and sc.statusrefcode <> 100
UNION
select sc.code from sccounter sc , enestimateitem2nstmttm e2e
where sc.estimateitemrefcode = e2e.estimateitemoutrefcode
and e2e.estimateiteminrefcode = enit.code
and sc.statusrefcode <> 100
) checknpzplan
)
<> 0 )
)
/* ������ ���������� ��� ���������� �������� */

and
tkm.code in
(select tm.code from tkmaterials tm
where case
-- when grmatoronlymat=1 then cast(tm.rootgrouprefcode as text) = any(string_to_array(strgroupmat,','))
-- when grmatoronlymat=2 then cast(tm.code as text) = any(string_to_array(strgroupmat,',')) end

 when grmatoronlymat =1 then tm.rootgrouprefcode in  (select array2items(string_to_array(strgroupmat,','))::double precision)
when grmatoronlymat =2 then tm.code in  (select array2items(string_to_array(strgroupmat,','))::double precision) end
)
-- y  and (eld.ecode = elemcode or 0 = elemcode )
and case when elemcode = 0 then 1 = 1 else eld.ecode = elemcode end
and enpl.datestart between to_date(pdatestart,'dd.mm.yyyy') and to_date(pdateend,'dd.mm.yyyy')

 -- and ( enpl.budgetrefcode = budgcode or 0 = budgcode ) NET-2566
-- and cast(enpl.budgetrefcode as text) = any(string_to_array(strbudgetrefcodes,','))
and enpl.budgetrefcode  in (select array2items(string_to_array(strbudgetrefcodes,','))::double precision)
-- y and ( enpl.departmentrefcode = rencode or 0 = rencode )
and case when rencode = 0 then 1 = 1 else  enpl.departmentrefcode = rencode end
-- y and ( enpl.code = plancode or 0 = plancode )
and case when  plancode = 0 then 1 = 1 else     enpl.code = plancode end
-- and ( 0 = plancode ) /*!!!�������� ������������ ������� � ������� ���� �������� ���������� ���� ��� �� �������� ���� */
-- and ( eld.etype = elementtypecode or 0 = elementtypecode )
and case when elementtypecode = 0 then 1 = 1 else eld.etype = elementtypecode end
-- y and ( enpl.formrefcode = formplancode or 0 = formplancode )
and case when formplancode = 0 then 1 = 1 else enpl.formrefcode = formplancode end
and case when p_worktypecode = 0 then 1 = 1 else enpl.typerefcode = p_worktypecode end  /*add 27.01.2014*/
-- 2013.03.04    and enpl.typerefcode <> 11 -- ����� ����������� �� �����
  and (  ( enit.planitemrefcode is null )
     or
     -- �� ����� ���� �������� ��������� "�����������"
      ( 500000024 <> ( select tkd.techcardsourcecode from enplanworkitem pi , tktechcard tkd
                                                     where pi.kartarefcode = tkd.code
                                                       and pi.code = enit.planitemrefcode limit 1  )
      )
   )
  --

group by enit.code , enit.materialrefcode , enpl.kindcode , tkm.name , enpi.code , tk.name , enit.countfact ,tk.techkartnumber , tkmesu.name , enit.statusrefcode
, enpl.departmentrefcode , enpl.budgetrefcode , enpl.staterefcode , enpl.elementrefcode ,
eld.ename , eld.invnumber , eplstate.shortname , enit.kindrefcode , enpl.code

) selsprizn

where prizn = 1

) selall

/*�������� ������������������ ��� ������������������� ����������*/
Where
(
( komplekt = 0 ) /*��� ��������� */
or
( ( komplekt = 1 ) and (countfact > aaaa) ) /*�������������������*/
or
( ( komplekt = 2 ) and (countfact < aaaa) ) /*������������������� */
or
( ( komplekt = 3 ) and (countfact = aaaa) ) /*�������������� ��������� = ���������*/
)
-- order by departmentname , budgetname , object , workname , materialname
;

-- ���� �� estimate
--  ����� ���� ��� ������ ������ � data_for_report_statematerials_sel1 ������ �������


/*CREATE INDEX  ON data_for_report_statematerials_sel1
 USING btree ("departmentrefcode");

CREATE INDEX  ON data_for_report_statematerials_sel1
 USING btree ("budgetrefcode");  CREATE INDEX  ON data_for_report_statematerials_sel1
 USING btree ("staterefcode");

CREATE INDEX  ON data_for_report_statematerials_sel1
 USING btree ("elementrefcode");  CREATE INDEX  ON data_for_report_statematerials_sel1
 USING btree ("enplanworkcode"); */
/*select count(*) into countsel1 from data_for_report_statematerials_sel1;
EXCEPTION when OTHERS then
begin
countsel1 = 0;
RAISE NOTICE 'xxxx';
RETURN '2';
end;*/
if /*countsel1*/ 1 > 0 then

select count(*) into countsel2 from information_schema.tables where table_name = 'data_for_report_statematerials_sel2';
if countsel2 = 0 then
create temporary table data_for_report_statematerials_sel2(slujfield VARCHAR ,
estimateitemcode numeric ,
countfact DOUBLE PRECISION ,
nomenclaturename Varchar ,
nomenclatureunitname varchar ,
partycode varchar ,
kindcode NUMERIC ,
statusname Varchar ,
modify_time numeric ,
moloutcode varchar ,
moloutname varchar ,
prizn numeric ,
objfactname varchar ,
factstatt varchar ,
numberdoc varchar ,
datedoc varchar ,
movedateplan varchar
) ;
ELSE truncate table data_for_report_statematerials_sel2;
End if;
for jj in select distinct eicode , kindcode from data_for_report_statematerials_sel1
LOOP

insert into data_for_report_statematerials_sel2
select cast(jj.eicode /*||' | '|| jj.kindcode*/ as varchar) as slujfield ,
estimateitemcode , countfact , nomenclaturename , nomenclatureunitname , partycode ,
kindcode , statusname , modify_time ,
' '||moloutcode as moloutcode , moloutname , prizn
/* ����� ��������� �� kind (1 - ���� ����� , 2- ��������� ����� , 10 - ��� ) */

,

' '
as objfactname
/*����� ������������ ��������� ��������� */
,
wwww.factstat as factstatt
,
' '||cast(numberdoc as varchar) as numberdoc , to_char( datedoc ,'dd.mm.yyyy' ) as datedoc
,

( select min(em1.monthgen)|| ' ' || min(em1.yeargen) from enplanworkmovehistory em1
where em1.modify_time = (
select min(em.modify_time) from enplanworkmovehistory em where em.planrefcode in (
select e.planrefcode from enestimateitem e
where e.code = estimateitemcode )
limit 1
)
) as movedateplan
from (
select estimateitemcode , sum(countfact) as countfact , nomenclaturename , nomenclatureunitname , partycode ,
kindcode , statusname , max(modify_time) as modify_time ,
moloutcode , moloutname
, f_analyse_motion(estimateitemcode , sum(countfact) ,
nomenclaturename , nomenclatureunitname ,
partycode , kindcode , max(modify_time) , jj.kindcode ) as prizn , factstat
, numberdoc , datedoc

from (
/* << ��� ������ �� ������� �������� ���� ���������� �� � �������� ���� ��� �� � ������� ������� .*/
Select fi2ei.modify_time , fi2ei.estimateitemcode , fi2ei.countgen as countfact , rqfkor.moloutcode ,
rqfkor.moloutname , rqfkit.nomenclaturename , rqfkit.nomenclatureunitname
, rqfk2part.partycode , rqfkor.kindcode , substr(rqfkorstatu.name,1,10) as statusname ,
case when rqfkor.kindcode = 1 and upper(rqfkorstatu.name) = '���������' then ' '

when rqfkor.kindcode = 1 and upper(rqfkorstatu.name) = '����������'
then rqfkor.moloutcode||' '||rqfkor.moloutname
when rqfkor.kindcode = 1 and upper(rqfkorstatu.name) = '���������� �� ��'
then rqfkor.moloutcode||' '||rqfkor.moloutname
else ' ' end as factstat
, rqfkor.numberdoc
, rqfkor.dategen as datedoc

From rqfkorderitem2enstmttm fi2ei , rqfkorderitem rqfkit , rqfkorder rqfkor
, rqfkorderdata2fkparty rqfk2part , rqfkorderstatus rqfkorstatu
where fi2ei.estimateitemcode = jj.eicode
and rqfkit.code = fi2ei.fkorderitemrefcode
and rqfkor.code = rqfkit.fkorderrefcode
and rqfkor.kindcode = 1 /*��������� �����*/
and rqfk2part.fkorderitemrefcode = rqfkit.code
and rqfk2part.estimateitemrefcode = fi2ei.estimateitemcode
and rqfkorstatu.code = rqfkor.statuscode
and rqfkorstatu.code in (5,4,3) /*��� ����������� �������� */
and fi2ei.countgen <> 0 /* �� ��������� ������� ������� ��� ��� �� ���� ��� ���� ������ �������� */
/* 22.04.2014 �� ��������� ������� ���� �� ��������� ��� �������� �� ����������� ������ */
and not exists ( select * from rqfkorderitem2enstmttm fi2ei2 , rqfkorderitem fi2 , rqfkorder f2
                      where fi2ei2.estimateitemcode =  jj.eicode
                      and fi2ei2.fkorderitemrefcode = fi2.code
                      and fi2.fkorderrefcode=f2.code
                      and f2.dategen <= rqfkor.dategen
                      and f2.kindcode in (2,4,5,6,13 , 28 , 29)
                                   )
UNION
Select fi2ei.modify_time , jj.eicode as estimateitemcode /*fi2ei.estimateitemcode*/ , fi2ei.countgen as countfact , rqfkor.moloutcode ,
rqfkor.moloutname , rqfkit.nomenclaturename , rqfkit.nomenclatureunitname
, 0 as partycode , rqfkor.kindcode ,substr(rqfkorstatu.name,1,10) as statusname ,
case when rqfkor.kindcode = 1 and upper(rqfkorstatu.name) = '���������' then ' '

when rqfkor.kindcode = 1 and upper(rqfkorstatu.name) = '����������'
then rqfkor.moloutcode||' '||rqfkor.moloutname
when rqfkor.kindcode = 1 and upper(rqfkorstatu.name) = '���������� �� ��'
then rqfkor.moloutcode||' '||rqfkor.moloutname
else ' ' end as factstat
, rqfkor.numberdoc
, rqfkor.dategen as datedoc


From rqfkorderitem2enstmttm fi2ei , rqfkorderitem rqfkit , rqfkorder rqfkor
, rqfkorderstatus rqfkorstatu
where fi2ei.estimateitemcode in
( Select case /* ���� � �������� enestimateitem2nstmttm ���� ������
� ����� �������� ����� ������� �� ���������� ���������� ��������
��� ������ ��� ������ �� ���� �������� ���� ������ � ����������� ��� ����������
����� ���������� ��� �� �������� */
When ( coalesce(enist2enist.code,0) <> 0 )
then enist2enist.estimateiteminrefcode
else enist.code end
From enestimateitem enist Left Join enestimateitem2nstmttm enist2enist
on (enist.code = enist2enist.estimateitemoutrefcode and enist2enist.typerefcode in (4,5))
Where enist.code = jj.eicode /*500592327*/
)
and rqfkit.code = fi2ei.fkorderitemrefcode
and rqfkor.code = rqfkit.fkorderrefcode
and rqfkor.kindcode = 1 /*��������� �����*/
and rqfkorstatu.code = rqfkor.statuscode
and rqfkorstatu.code in (1,2,4) /*��� �������� ��������� ��� ��������� ����������� ��� �� */
and fi2ei.countgen <> 0 /* �� ��������� ������� ������� ��� ��� �� ���� ��� ���� ������ �������� */
/* 22.04.2014 �� ��������� ������� ���� �� ��������� ��� �������� �� ����������� ������ */
and not exists ( select * from rqfkorderitem2enstmttm fi2ei2 , rqfkorderitem fi2 , rqfkorder f2
                      where fi2ei2.estimateitemcode =  jj.eicode
                      and fi2ei2.fkorderitemrefcode = fi2.code
                      and fi2.fkorderrefcode=f2.code
                      and f2.dategen <= rqfkor.dategen
                      and f2.kindcode in (2,4,5,6,13 , 28 , 29)
                                   )

UNION ALL

Select fi2ei.modify_time , fi2ei.estimateitemcode ,
case when fin.statusrefcode = 3 then /*���� ������ ��������� �� ������ ���� */
(select coalesce(sum(fin1.quantity), 0)
from finmaterials fin1
where fin1.estimateitemrefcode = jj.eicode
and fin1.parentrefcode in
(select fin.code from finmaterials fin where
fin.estimateitemrefcode = jj.eicode and fin.statusrefcode = 3)
and fin1.modify_time = (select max(fin3.modify_time)
from finmaterials fin3
where fin3.estimateitemrefcode = jj.eicode
and fin3.parentrefcode in
(select fin4.code from finmaterials fin4
where fin4.estimateitemrefcode = jj.eicode
and fin4.statusrefcode = 3)
)
)
else fin.quantity end as countfact ,
rqfkor.moloutcode ,
rqfkor.moloutname , rqfkit.nomenclaturename , rqfkit.nomenclatureunitname
, fin.party_id as partycode , rqfkor.kindcode ,substr(rqfkorstatu.name,1,10) as statusname ,

/* ��� ���������� ������ */
case
when kindcode in (2,4,5,6,13 , 28 , 29) and rqfkorstatu.code = 1 /*��������*/
then rqfkor.molincode||' '||rqfkor.molinname
when kindcode in (2,4,5,6,13  , 28 , 29) and upper(rqfkorstatu.name) = '���������'
then rqfkor.molincode||' '||rqfkor.molinname
when kindcode in (2,4,5,6,13 , 28 , 29 ) and upper(rqfkorstatu.name) = '����������'
then rqfkor.moloutcode||' '||rqfkor.moloutname
when kindcode in (2,4,5,6,13 , 28 , 29) and upper(rqfkorstatu.name) = '���������� �� ��'
then rqfkor.moloutcode||' '||rqfkor.moloutname
else ' ' end as factstat
, rqfkor.numberdoc
, rqfkor.dategen as datedoc


from
rqfkorderitem2enstmttm fi2ei, rqfkorderitem rqfkit , rqfkorder rqfkor
, finmaterials fin , rqfkorderstatus rqfkorstatu
where fi2ei.estimateitemcode = jj.eicode
and rqfkit.code = fi2ei.fkorderitemrefcode
and rqfkor.code = rqfkit.fkorderrefcode
and rqfkor.kindcode /*= 2 */ in (2,4,5,6,13 ,28 , 29) /*���������� ����� ��� ����������� ����������*/
and fin.estimateitemrefcode = fi2ei.estimateitemcode
and fin.code = fi2ei.finmaterialsrefcode
and rqfkorstatu.code = rqfkor.statuscode
-- NET-1472 and rqfkor.statuscode <> 1
and fin.statusrefcode = 1

/*���� ������� ���� �������� */
UNION ALL
Select fi2ei.modify_time , fi2ei.estimateitemcode ,
fi2ei.countgen as countfact ,
rqfkor.moloutcode ,
rqfkor.moloutname , rqfkit.nomenclaturename || ' ���.� ' || coalesce(scc.invnumber,'') as nomenclaturename , rqfkit.nomenclatureunitname
, 0 as partycode , rqfkor.kindcode ,substr(rqfkorstatu.name,1,10) as statusname ,

/* ��� ���������� ������ */
case
when kindcode = 2 and upper(rqfkorstatu.name) = '���������'
then rqfkor.molincode||' '||rqfkor.molinname
when kindcode = 2 and upper(rqfkorstatu.name) = '����������'
then rqfkor.moloutcode||' '||rqfkor.moloutname
when kindcode = 2 and upper(rqfkorstatu.name) = '���������� �� ��'
then rqfkor.moloutcode||' '||rqfkor.moloutname
when kindcode = 2 and rqfkorstatu.code = 5
then rqfkor.moloutcode||' '||rqfkor.moloutname
when kindcode = 2 and scc.molcode is null
then '˳������� ��������'
else ' ' end as factstat
, rqfkor.numberdoc
, rqfkor.dategen as datedoc

from
rqfkorderitem2enstmttm fi2ei, rqfkorderitem rqfkit , rqfkorder rqfkor
, sccounter scc , rqfkorderstatus rqfkorstatu
where fi2ei.estimateitemcode = jj.eicode
and rqfkit.code = fi2ei.fkorderitemrefcode
and rqfkor.code = rqfkit.fkorderrefcode
and rqfkor.kindcode in (2,5,6,13 , 28 , 29) /*���������� ����� */
and scc.estimateitemrefcode = fi2ei.estimateitemcode
and rqfkorstatu.code = rqfkor.statuscode
-- NET-1472 and rqfkor.statuscode <> 1



UNION ALL
/*���� �������� �� �������� ���������� */

Select fin.modify_time as modify_time , jj.eicode as estimateitemcode , fin.quantity as countfact ,
act.numbergen as moloutcode , to_char(act.dategen ,'dd.mm.yyyy') as moloutname ,
fin.mat_name as nomenclaturename , fin.mu_name as nomenclatureunitname ,
fin.party_id as partycode , 10 as kindcode , actstatu.name as statusname ,
case when act.statusrefcode = 3 then /* �� ���������� ����������� ��������� ��������� ���� ��� �������� */
' '
else
fin.div_code ||' '|| fin.div_name end as factstat
, act.numbergen as numberdoc
, act.dategen as datedoc
from enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
, finmaterials fin , enestimateitem ene , /*enplanwork enp ,*/ enact2enplanwork act2wor ,
enact act , enactstatus actstatu
Where

fin.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
/*������ �������� � ������ ������� */
and fin.estimateitemrefcode = ene.code
/*and ene.planrefcode = enp.code
and act2wor.plancode = enp.code ���� */
and ene.planrefcode = act2wor.plancode /* ����� */
and act2wor.actrefcode = act.code
and fin.statusrefcode = 1 /*��������������*/
/*and act.statusrefcode = 3 ����������� � ����������� */
and actstatu.code = act.statusrefcode
and enit2enit2.estimateiteminrefcode /*=*/ in (
Select enit2enit1.estimateitemoutrefcode from enestimateitem2nstmttm enit2enit1 /*������� ��������� �� �����*/
Where enit2enit1.estimateiteminrefcode = jj.eicode
and enit2enit1.typerefcode = 1 )
and enit2enit2.typerefcode = 1
and (SELECT jj.kindcode ) = 2 /*���� ������� �������� ���� */

UNION ALL

/*���� �������� �� ���������� ���� */

Select fin.modify_time as modify_time , jj.eicode as estimateitemcode , fin.quantity as countfact ,
act.numbergen as moloutcode , to_char(act.dategen ,'dd.mm.yyyy') as moloutname ,
fin.mat_name as nomenclaturename , fin.mu_name as nomenclatureunitname ,
fin.party_id as partycode , 10 as kindcode , actstatu.name as statusname ,
case when act.statusrefcode = 3 then /*�� ���������� ����������� ��������� ��������� ���� ��� ��������*/
' '
else
fin.div_code ||' '|| fin.div_name end as factstat
, act.numbergen as numberdoc
, act.dategen as datedoc
from enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
, finmaterials fin , enestimateitem ene , /*enplanwork enp ,*/ enact2enplanwork act2wor ,
enact act , enactstatus actstatu
Where

fin.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
/*������ �������� � ������ ������� */
and fin.estimateitemrefcode = ene.code
/*and ene.planrefcode = enp.code
and act2wor.plancode = enp.code ���� ��� */
and ene.planrefcode = act2wor.plancode /* ����� ��� */
and act2wor.actrefcode = act.code
and fin.statusrefcode = 1 /*��������������*/
/* and act.statusrefcode = 3 ����������� � �����������*/
and actstatu.code = act.statusrefcode

and enit2enit2.estimateiteminrefcode = jj.eicode
and enit2enit2.typerefcode = 1
and (SELECT jj.kindcode ) = 3 /*���� ������� ������� ���� */

UNION ALL

/*���� �������� �� ���������� ���� */

Select fin.modify_time as modify_time , jj.eicode as estimateitemcode , fin.quantity as countfact ,
act.numbergen as moloutcode , to_char(act.dategen ,'dd.mm.yyyy') as moloutname ,
fin.mat_name as nomenclaturename , fin.mu_name as nomenclatureunitname ,
fin.party_id as partycode , 10 as kindcode , actstatu.name as statusname ,
case when act.statusrefcode = 3 then /*�� ���������� ����������� ��������� ��������� ���� ��� �������� */
' '
else
fin.div_code ||' '|| fin.div_name end as factstat
, act.numbergen as numberdoc
, act.dategen as datedoc
from /*enestimateitem2nstmttm enit2enit2*/ /*������� ��������� �� �����*/
/*,*/ finmaterials fin , enestimateitem ene , /*enplanwork enp ,*/ enact2enplanwork act2wor ,
enact act , enactstatus actstatu
Where

/*fin.estimateitemrefcode = enit2enit2.estimateitemoutrefcode */
/*������ �������� � ������ ������� */
/*and*/ fin.estimateitemrefcode = ene.code
/*and ene.planrefcode = enp.code
and act2wor.plancode = enp.code ���� ��� */
and ene.planrefcode = act2wor.plancode /* ����� ��� */
and act2wor.actrefcode = act.code
and fin.statusrefcode = 1 /*��������������*/
/*and act.statusrefcode = 3 ����������� � �����������*/
and actstatu.code = act.statusrefcode

/*and ( enit2enit2.estimateitemoutrefcode = {eicode} ) */
and ene.code = jj.eicode
and (SELECT jj.kindcode ) = 4 /*���� ������� ������� ���� */

UNION ALL

/*���� �� ��������� ��� ��������� �� �������� ���������� */
Select scc.modify_time as modify_time , jj.eicode as estimateitemcode , 1 as countfact ,
scoz.numberdoc as moloutcode , to_char(scut.dategen ,'dd.mm.yyyy') as moloutname ,
scc.name || ' ���.� ' || coalesce(scc.invnumber,'') as nomenclaturename , '��' as nomenclatureunitname ,
0 as partycode , 10 as kindcode , scuts.name as statusname ,
case when act.statusrefcode = 3 then /* �� ���������� ����������� ��������� ��������� ���� ��� �������� */
' ' else coalesce(scc.molcode,'˳������� �������� ') end as factstat
, scoz.numberdoc as numberdoc
, scut.dategen as datedoc
from enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
inner join
(Select distinct estimateitemoutrefcode from enestimateitem2nstmttm /*������� ��������� �� �����*/
Where estimateiteminrefcode = jj.eicode
and typerefcode = 1 ) enit2enit1
on enit2enit2.estimateiteminrefcode = enit2enit1.estimateitemoutrefcode
inner join sccounter scc on scc.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
inner join enestimateitem ene on scc.estimateitemrefcode = ene.code
/*enplanwork enp ,*/
inner join enact2enplanwork act2wor on ene.planrefcode = act2wor.plancode
inner join enact act on act2wor.actrefcode = act.code
inner join scusageinputtmz2sccntr scu2scc on scu2scc.sccounterrefcode = scc.code
inner join scusageinputitemoz scoz on scu2scc.ozrefcode = scoz.code
inner join scusageinputitem scuit on scoz.usageinputitemrefcode = scuit.code
inner join scusageinput scut on scuit.usageinputrefcode = scut.code
inner join scusageinputstatus scuts on scut.statusrefcode = scuts.code
Where
scc.statusrefcode = 2 /*� ��� (��-1 � ���.)*/
and scuts.code = 3 /*���������� */ /* ������� ������� ������������ �� ��� ��� ���� ��������� � ������� ����� �� �� ���������� */
and enit2enit2.typerefcode = 1
and (SELECT jj.kindcode ) = 2 /*���� ������� �������� ���� */

UNION ALL

/*���� �� ��������� ��� ��������� �� ���������� ���� */

Select scc.modify_time as modify_time , jj.eicode as estimateitemcode , 1 as countfact ,
scoz.numberdoc as moloutcode , to_char(scut.dategen ,'dd.mm.yyyy') as moloutname ,
scc.name || ' ���.� ' || coalesce(scc.invnumber,'') as nomenclaturename , '��' as nomenclatureunitname ,
0 as partycode , 10 as kindcode , scuts.name as statusname ,
case when act.statusrefcode = 3 then /* �� ���������� ����������� ��������� ��������� ���� ��� �������� */
' ' else coalesce(scc.molcode,'˳������� �������� ') end as factstat
, scoz.numberdoc as numberdoc
, scut.dategen as datedoc
from enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
inner join sccounter scc on scc.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
inner join enestimateitem ene on scc.estimateitemrefcode = ene.code
/*enplanwork enp ,*/
inner join enact2enplanwork act2wor on ene.planrefcode = act2wor.plancode
inner join enact act on act2wor.actrefcode = act.code
inner join scusageinputtmz2sccntr scu2scc on scu2scc.sccounterrefcode = scc.code
inner join scusageinputitemoz scoz on scu2scc.ozrefcode = scoz.code
inner join scusageinputitem scuit on scoz.usageinputitemrefcode = scuit.code
inner join scusageinput scut on scuit.usageinputrefcode = scut.code
inner join scusageinputstatus scuts on scut.statusrefcode = scuts.code
Where
scc.statusrefcode = 2 /*� ��� (��-1 � ���.)*/
and scuts.code = 3 /*���������� */ /* ������� ������� ������������ �� ��� ��� ���� ��������� � ������� ����� �� �� ���������� */
and enit2enit2.estimateiteminrefcode = jj.eicode
and enit2enit2.typerefcode = 1
and (SELECT jj.kindcode ) = 3 /*���� ������� ������� ���� */

UNION ALL

/*���� �� ��������� ��� ��������� �� ���������� ���� */

Select scc.modify_time as modify_time , jj.eicode as estimateitemcode , 1 as countfact ,
scoz.numberdoc as moloutcode , to_char(scut.dategen ,'dd.mm.yyyy') as moloutname ,
scc.name || ' ���.� ' || coalesce(scc.invnumber,'') as nomenclaturename , '��' as nomenclatureunitname ,
0 as partycode , 10 as kindcode , scuts.name as statusname ,
case when act.statusrefcode = 3 then /* �� ���������� ����������� ��������� ��������� ���� ��� �������� */
' ' else coalesce(scc.molcode,'˳������� �������� ') end as factstat
, scoz.numberdoc as numberdoc
, scut.dategen as datedoc
from
enestimateitem ene
/*enplanwork enp ,*/
inner join enact2enplanwork act2wor on ene.planrefcode = act2wor.plancode
inner join enact act on act2wor.actrefcode = act.code
inner join sccounter scc on scc.estimateitemrefcode = ene.code
inner join scusageinputtmz2sccntr scu2scc on scu2scc.sccounterrefcode = scc.code
inner join scusageinputitemoz scoz on scu2scc.ozrefcode = scoz.code
inner join scusageinputitem scuit on scoz.usageinputitemrefcode = scuit.code
inner join scusageinput scut on scuit.usageinputrefcode = scut.code
inner join scusageinputstatus scuts on scut.statusrefcode = scuts.code
Where
scc.statusrefcode = 2 /*� ��� (��-1 � ���.)*/
and scuts.code = 3 /*���������� */ /* ������� ������� ������������ �� ��� ��� ���� ��������� � ������� ����� �� �� ���������� */
and ene.code = jj.eicode
and (SELECT jj.kindcode ) = 4 /*���� ������� ������� ���� */




) www


Group by estimateitemcode , /*countfact ,*/ nomenclaturename , nomenclatureunitname , partycode ,
kindcode ,statusname , moloutcode , moloutname , factstat , numberdoc , datedoc


) wwww
where ( prizn = 0 or kindcode = 10 )

UNION /*======================================================================================*/
select slujfield ,
estimateitemcode , countfact ,
nomenclaturename , nomenclatureunitname ,
partycode , kindcode , statusname , modify_time , moloutcode , moloutname , prizn , objfactname  ,factstatt ,
numberdoc  , datedoc ,movedateplan
       From (
       /*������� ��� ���� ���� � ������ */
       select cast( jj.eicode  as varchar) as slujfield ,
        f.estimateitemrefcode as estimateitemcode , f.quantity as countfact ,
        f.mat_name as nomenclaturename , f.mu_name as nomenclatureunitname ,
        coalesce(f.party_id,0) as partycode , 0 as kindcode , ' ' as statusname , 0 as modify_time ,
        ' ' as moloutcode , '��������. �� ����' as moloutname , 0 as prizn , ' ' as objfactname
                , f.div_code ||' '|| f.div_name as factstatt
        , cast('' as varchar) as numberdoc
        , cast('' as varchar) as datedoc
        , ( select min(em1.monthgen)|| ' ' || min(em1.yeargen) from enplanworkmovehistory em1
       where em1.modify_time = (
        select min(em.modify_time) from enplanworkmovehistory em where em.planrefcode in (
        select e.planrefcode from enestimateitem e
        where e.code = estimateitemrefcode )
        )
        ) as movedateplan
       from finmaterials f  , enestimateitem ei , enplanwork p
       where f.statusrefcode = 1
       and f.estimateitemrefcode=ei.code
       and ei.planrefcode=p.code
       and p.kindcode=4
       and f.estimateitemrefcode in (

               /*�� �������� ����� �� ������� ����*/
               Select en2en.estimateitemoutrefcode as estimatecode
                from enestimateitem2nstmttm en2en
                where en2en.estimateiteminrefcode in ( Select en2en.estimateitemoutrefcode as estimatecode
                from enestimateitem2nstmttm en2en
                where en2en.estimateiteminrefcode = jj.eicode
                and en2en.typerefcode =1 )
               -- and (SELECT jj.kindcode ) = 2
                and en2en.typerefcode = 1
                UNION
                /*�� ������� ���� �� ������� ����*/
                Select en2en.estimateitemoutrefcode as estimatecode
                from enestimateitem2nstmttm en2en
                where en2en.estimateiteminrefcode = jj.eicode
               -- and (SELECT jj.kindcode ) = 3
                and en2en.typerefcode = 1
                UNION
                /*���� �������� � ����� */
                Select jj.eicode
               -- Where (SELECT jj.kindcode ) = 4
                )
       UNION
       /*����� ��� ����� �� ���� ������� �������� ������� �� ����� � �������� ��� ����� */
       select cast( jj.eicode  as varchar) as slujfield ,
        f.estimateitemrefcode as estimateitemcode , f.quantity as countfact ,
        f.mat_name as nomenclaturename , f.mu_name as nomenclatureunitname ,
        coalesce(f.party_id,0) as partycode , 0 as kindcode , ' ' as statusname , 0 as modify_time ,
        ' ' as moloutcode , '��������. �� ����' as moloutname , 0 as prizn , ' ' as objfactname
                , f.div_code ||' '|| f.div_name as factstatt
        , cast('' as varchar) as numberdoc
        , cast('' as varchar) as datedoc
        , ( select min(em1.monthgen)|| ' ' || min(em1.yeargen) from enplanworkmovehistory em1
       where em1.modify_time = (
        select min(em.modify_time) from enplanworkmovehistory em where em.planrefcode in (
        select e.planrefcode from enestimateitem e
        where e.code = estimateitemrefcode )
        )
        ) as movedateplan
       from finmaterials f  , enestimateitem ei , enplanwork p
       where f.statusrefcode = 1
       and f.estimateitemrefcode=ei.code
       and ei.planrefcode=p.code
       and p.kindcode=3 /*������� ����*/
       /*and (select ph.plannewrefcode from enplancorrecthistory ph where ph.planoldrefcode = p.code ) is null */
       and p.statuscode = 1 /*���� �������� ������� ���� �� ������ ����� ���� */
       and f.estimateitemrefcode in (

               /*�� ��������� ����� �� ������� ����*/
                Select en2en.estimateitemoutrefcode as estimatecode                  from enestimateitem2nstmttm en2en
                where en2en.estimateiteminrefcode = jj.eicode
               -- and (SELECT jj.kindcode ) = 2
                and en2en.typerefcode = 1
                UNION
                /*���� �������� � ������� ���� */
                Select jj.eicode::double precision
               -- Where (SELECT jj.kindcode ) = 3
                )                                                 ) as sel_rezervi
Where ( /* ���� � ������� */
coalesce((
Select coalesce(sum(countgen),0) from (
Select coalesce(sum(fi2ei.countgen),0) as countgen
From rqfkorderitem2enstmttm fi2ei
where fi2ei.estimateitemcode in
( Select case /* ���� � �������� enestimateitem2nstmttm ���� ������
� ����� �������� ����� ������� �� ���������� ���������� ��������
��� ������ ��� ������ �� ���� �������� ���� ������ � ����������� ��� ����������
����� ���������� ��� �� �������� */
When ( coalesce(enist2enist.code,0) <> 0 )
then enist2enist.estimateiteminrefcode
else enist.code end
From enestimateitem enist Left Join enestimateitem2nstmttm enist2enist
on (enist.code = enist2enist.estimateitemoutrefcode and enist2enist.typerefcode in (4,5))
Where enist.code = jj.eicode )
and (SELECT jj.kindcode ) = 2 /*���*/
UNION
Select coalesce(sum(fi2ei.countgen),0) as countgen
From rqfkorderitem2enstmttm fi2ei
where fi2ei.estimateitemcode in (select en2en.estimateiteminrefcode from enestimateitem2nstmttm en2en
where en2en.estimateitemoutrefcode = jj.eicode
and en2en.typerefcode = 1 )
and (SELECT jj.kindcode ) = 3 /*����*/
UNION
Select coalesce(sum(fi2ei.countgen),0) as countgen
From rqfkorderitem2enstmttm fi2ei
where fi2ei.estimateitemcode in (select en2en.estimateiteminrefcode from enestimateitem2nstmttm en2en
where en2en.estimateitemoutrefcode in
(select estimateiteminrefcode from enestimateitem2nstmttm en2en
where en2en.estimateitemoutrefcode = jj.eicode
and en2en.typerefcode = 1
)
and en2en.typerefcode = 1
)
and (SELECT jj.kindcode ) = 4 /*����*/
) selord

),0) = 0

And /* ���� � ����� */
( select coalesce(sum(countfact),0) from (
/*���� �������� �� �������� ���������� */
Select fin.modify_time as modify_time , jj.eicode as estimateitemcode , coalesce(fin.quantity,0) as countfact ,
act.numbergen as moloutcode , to_char(act.dategen ,'dd.mm.yyyy') as moloutname ,
fin.mat_name as nomenclaturename , fin.mu_name as nomenclatureunitname ,
fin.party_id as partycode , 10 as kindcode , actstatu.name as statusname
from enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
, finmaterials fin , enestimateitem ene , /*enplanwork enp ,*/ enact2enplanwork act2wor ,
enact act , enactstatus actstatu
Where

fin.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
and fin.estimateitemrefcode = ene.code
/*and ene.planrefcode = enp.code
and act2wor.plancode = enp.code ���� */
and act2wor.plancode = ene.planrefcode /* ����� */
and act2wor.actrefcode = act.code
and fin.statusrefcode = 1 /*��������������*/
and actstatu.code = act.statusrefcode
and enit2enit2.estimateiteminrefcode /*=*/ in (
Select enit2enit1.estimateitemoutrefcode from enestimateitem2nstmttm enit2enit1 /*������� ��������� �� �����*/
Where enit2enit1.estimateiteminrefcode = jj.eicode
and enit2enit1.typerefcode = 1 )
and enit2enit2.typerefcode = 1
and (SELECT jj.kindcode ) = 2 /*���� ������� �������� ���� */

UNION

/*���� �������� �� ���������� ���� */

Select fin.modify_time as modify_time , jj.eicode as estimateitemcode , coalesce(fin.quantity,0) as countfact ,
act.numbergen as moloutcode , to_char(act.dategen ,'dd.mm.yyyy') as moloutname ,
fin.mat_name as nomenclaturename , fin.mu_name as nomenclatureunitname ,
fin.party_id as partycode , 10 as kindcode , actstatu.name as statusname
from enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
, finmaterials fin , enestimateitem ene , /*enplanwork enp ,*/ enact2enplanwork act2wor ,
enact act , enactstatus actstatu
Where

fin.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
and fin.estimateitemrefcode = ene.code
/*and ene.planrefcode = enp.code
and act2wor.plancode = enp.code ���� */
and act2wor.plancode = ene.planrefcode /* ����� */
and act2wor.actrefcode = act.code
and fin.statusrefcode = 1 /*��������������*/
and actstatu.code = act.statusrefcode

and enit2enit2.estimateiteminrefcode = jj.eicode
and enit2enit2.typerefcode = 1
and (SELECT jj.kindcode ) = 3 /*���� ������� ������� ���� */

UNION

/*���� �������� �� ���������� ���� */

Select fin.modify_time as modify_time , jj.eicode as estimateitemcode , coalesce(fin.quantity,0) as countfact ,
act.numbergen as moloutcode , to_char(act.dategen ,'dd.mm.yyyy') as moloutname ,
fin.mat_name as nomenclaturename , fin.mu_name as nomenclatureunitname ,
fin.party_id as partycode , 10 as kindcode , actstatu.name as statusname
from /*enestimateitem2nstmttm enit2enit2*/ /*������� ��������� �� �����*/
/*,*/ finmaterials fin , enestimateitem ene , /*enplanwork enp ,*/ enact2enplanwork act2wor ,
enact act , enactstatus actstatu
Where

/*fin.estimateitemrefcode = enit2enit2.estimateitemoutrefcode
and*/ fin.estimateitemrefcode = ene.code
/*and ene.planrefcode = enp.code
and act2wor.plancode = enp.code ���� */
and act2wor.plancode = ene.planrefcode /* ����� */
and act2wor.actrefcode = act.code
and fin.statusrefcode = 1 /*��������������*/
and actstatu.code = act.statusrefcode
and ene.code = jj.eicode
/*and ( enit2enit2.estimateitemoutrefcode = {eicode} ) */
and (SELECT jj.kindcode ) = 4 /*���� ������� ������� ���� */

) selact
) = 0

)

UNION /*===========������� ��������� ���������������� ��� ����===========*/
/* ����������������� ��������� �� ������� � ���� enestimateitem kind = 1 - ��������� �
� ���� sccounterstatus = �� �������� 1 - ��������������
������ ����� ������ ����������� ����� ��������� */
Select cast( jj.eicode /*||' | '|| jj.kindcode*/ as varchar) as slujfield ,
enisc.code as estimateitemcode , enisc.countfact as countfact ,
scc.name || ' ���.� ' || coalesce(scc.invnumber,'') as nomenclaturename , '��' as nomenclatureunitname ,
0 as partycode , 0 as kindcode , ' ' as statusname , 0 as modify_time ,
' ' as moloutcode , '�����������' as moloutname , 0 as prizn , ' ' as objfactname

, case when scc.molcode is null then '˳������� �������� ' else fmd.finmolcode|| ' ' || fmd.finmolname end as factstatt
, cast('' as varchar) as numberdoc
, cast('' as varchar) as datedoc
,( select min(em1.monthgen)|| ' ' || min(em1.yeargen) from enplanworkmovehistory em1
where em1.modify_time = (
select min(em.modify_time) from enplanworkmovehistory em where em.planrefcode in (
select e.planrefcode from enestimateitem e
where e.code = estimateitemrefcode )
)
) as movedateplan
From enestimateitem enisc , sccounter scc , enworkorder2enplanwork w2p , enworkorder w ,
finmoldata fmd
Where enisc.code = scc.estimateitemrefcode
and enisc.kindrefcode = 1
and enisc.planrefcode = w2p.plancode
and w2p.workordercode = w.code
and fmd.workordercode = w.code
and fmd.moltyperefcode = 1 /*������ */
/*�������� �� ������������� �������� ���� 0 �� ���� �� �������� ��� � �� ��� ������� ������������*/

and coalesce((select sum(coalesce(enisc1.code,0)) from enestimateitem enisc1 , sccounter scc1 , scusageinputtmz2sccntr scu2scc1 ,
scusageinputitemoz scoz1 , scusageinputitem scuit1 , scusageinput scut1 ,
scusageinputstatus scuts1
where scu2scc1.sccounterrefcode = scc1.code
and scu2scc1.ozrefcode = scoz1.code
and scoz1.usageinputitemrefcode = scuit1.code
and scuit1.usageinputrefcode = scut1.code
and scut1.statusrefcode = scuts1.code
and scuts1.code = 3 /*���������� */ /* ������� ������� ������������ �� ��� ��� ���� ��������� � ������� ����� �� �� ���������� */
and enisc1.code = enisc.code
and enisc1.code = scc1.estimateitemrefcode
),0) = 0
and enisc.code IN ( /* ���� �������� �������� � ��������� �����*/
Select enit2enit2.estimateitemoutrefcode from enestimateitem2nstmttm enit2enit2 /*������� ��������� �� �����*/
Where /*enit2enit2.countgen <> 0
and*/ enit2enit2.typerefcode = 1 /*������� �� �������(�����-�������-���-����)*/
and enit2enit2.estimateiteminrefcode in (
Select enit2enit1.estimateitemoutrefcode from enestimateitem2nstmttm enit2enit1 /*������� ��������� �� �����*/
Where enit2enit1.typerefcode = 1 /*������� �� �������(�����-�������-���-����)*/
and enit2enit1.estimateiteminrefcode = jj.eicode
)
and (SELECT jj.kindcode ) = 2

/*���� �������� �������� � ������� ���� */
UNION
Select enit2enit1.estimateitemoutrefcode from enestimateitem2nstmttm enit2enit1 /*������� ��������� �� �����*/
Where enit2enit1.typerefcode = 1 /*������� �� �������(�����-�������-���-����)*/
and enit2enit1.estimateiteminrefcode = jj.eicode
/*���� �������� �������� � ������� ���� */
and (SELECT jj.kindcode ) = 3
UNION
Select jj.eicode
WHERE (SELECT jj.kindcode ) = 4
)
Order by nomenclaturename , kindcode;
END LOOP;

End if;


--  ����� ���� ��� ������ ������ � data_for_report_statematerials_sel2 ������ �������
/*CREATE INDEX  ON data_for_report_statematerials_sel2
 USING btree ("slujfield");*/

return '1';
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;