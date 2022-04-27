select line610.name , line610.linelength , line610.elementcode
,sum(oglyad_elektromonteri.countgen_m1) as countgene_lmonteri_m1
,sum(oglyad_elektromonteri.countgen_m2) as countgene_lmonteri_m2
,sum(oglyad_elektromonteri.countgen_m3) as countgene_lmonteri_m3
,sum(oglyad_elektromonteri.countgen_m4) as countgene_lmonteri_m4
,sum(oglyad_elektromonteri.countgen_m5) as countgene_lmonteri_m5
,sum(oglyad_elektromonteri.countgen_m6) as countgene_lmonteri_m6
,sum(oglyad_elektromonteri.countgen_m7) as countgene_lmonteri_m7
,sum(oglyad_elektromonteri.countgen_m8) as countgene_lmonteri_m8
,sum(oglyad_elektromonteri.countgen_m9) as countgene_lmonteri_m9
,sum(oglyad_elektromonteri.countgen_m10) as countgene_lmonteri_m10
,sum(oglyad_elektromonteri.countgen_m11) as countgene_lmonteri_m11
,sum(oglyad_elektromonteri.countgen_m12) as countgene_lmonteri_m12
---
,sum(oglyad_injener.countgen) as countgen_injener
,oglyad_injener.monthgen as monthgen_injener
---
,sum(oglyad_kr.countgen) as countgen_kr
,oglyad_kr.monthgen as monthgen_kr
---
,sum(oglyad_to.countgen) as countgen_to
,oglyad_to.monthgen as monthgen_to
,coalesce('ОЕМ: ' || group_concat(planwork_month_executors1, ';
'), '') as planwork_month_executors1 /* Огляд електромонтерами */
,coalesce('ОІТП: ' || group_concat(planwork_month_executors2, ';
'), '') as planwork_month_executors2 /* Огляд інженерно-технічними працівниками */
,coalesce('КР: ' || group_concat(planwork_month_executors3, ';
'), '') as planwork_month_executors3 /* Капітальний ремонт */
,coalesce('ТО: ' || group_concat(planwork_month_executors4, ';
'), '') as planwork_month_executors4 /* Технічне обслуговування */

 from
(
select (coalesce(l10.name,'') || ' № ' || coalesce(l10.invnumber,'')) as name ,
l10.linelength   ,
l10.elementcode from enline10 l10 , enelement el
where (case when $P{BelongingCode} > 0 then l10.belongingrefcode = $P{BelongingCode} else coalesce(l10.belongingrefcode, 0) > -1 end)
and l10.elementcode = el.code
and case when $P{DepartmentCode} <> 0 then
                      el.renrefcode = (select d2r.renrefcode from endepartment2epren d2r
                      where d2r.departmentrefcode = $P{DepartmentCode}
                      order by d2r.renrefcode limit 1)
         else 1 = 1 end
) as line610

/* Огляд електромонтерами */

left join
(
Select
sum(countgen_m1) as countgen_m1,
sum(countgen_m2) as countgen_m2,
sum(countgen_m3) as countgen_m3,
sum(countgen_m4) as countgen_m4,
sum(countgen_m5) as countgen_m5,
sum(countgen_m6) as countgen_m6,
sum(countgen_m7) as countgen_m7,
sum(countgen_m8) as countgen_m8,
sum(countgen_m9) as countgen_m9,
sum(countgen_m10) as countgen_m10,
sum(countgen_m11) as countgen_m11,
sum(countgen_m12) as countgen_m12,
elementcode,
group_concat(planwork_month_executors, ';
') as planwork_month_executors1

from (
Select
case when p.monthgen = 1 then sum(pi.countgen) else 0 end as countgen_m1,
case when p.monthgen = 2 then sum(pi.countgen) else 0 end as countgen_m2,
case when p.monthgen = 3 then sum(pi.countgen) else 0 end as countgen_m3,
case when p.monthgen = 4 then sum(pi.countgen) else 0 end as countgen_m4,
case when p.monthgen = 5 then sum(pi.countgen) else 0 end as countgen_m5,
case when p.monthgen = 6 then sum(pi.countgen) else 0 end as countgen_m6,
case when p.monthgen = 7 then sum(pi.countgen) else 0 end as countgen_m7,
case when p.monthgen = 8 then sum(pi.countgen) else 0 end as countgen_m8,
case when p.monthgen = 9 then sum(pi.countgen) else 0 end as countgen_m9,
case when p.monthgen = 10 then sum(pi.countgen) else 0 end as countgen_m10,
case when p.monthgen = 11 then sum(pi.countgen) else 0 end as countgen_m11,
case when p.monthgen = 12 then sum(pi.countgen) else 0 end as countgen_m12,
p.monthgen,
l10.elementcode,
group_concat((select fex.name from net.finexecutor fex where fex.code = p.finexecutorcode), ';
') as planwork_month_executors

from enline10 l10 , enplanwork p  , enplanworkitem pi
where l10.elementcode = p.elementrefcode
and p.code = pi.planrefcode
and p.kindcode = $P{planKindCode} /* річні місячні */
and p.typerefcode in (1) /* планові */
and p.statuscode in (1,3,4,5,7) /* затверджені і чорнові */
and p.budgetrefcode = 75000001 /* СРС */
and p.yeargen = $P{YearGen} /* год */
and (case when $P{DepartmentCode} <> 0 then p.departmentrefcode = $P{DepartmentCode} /* підрозділ */ when $P{DepartmentCode} = 0 then p.departmentrefcode = p.departmentrefcode end)

and pi.kartarefcode in (select tc1.code
		from tktechcard as tc1
                inner join
                tkreportitem2techcard as ritc1
                on tc1.code = ritc1.techcardcode
                where ritc1.reportitemcode = 500000214)


group by p.monthgen  , l10.elementcode
) as elektromonteri
group by elektromonteri.elementcode

) as oglyad_elektromonteri on line610.elementcode = oglyad_elektromonteri.elementcode

/* Огляд інженерно-технічними працівниками */
left join
(

Select
sum(pi.countgen) as countgen ,
group_concat( cast(p.monthgen  as varchar) , ',' ) as monthgen  ,
l10.elementcode,
group_concat((select fex.name from net.finexecutor fex where fex.code = p.finexecutorcode), ';
') as planwork_month_executors2
from enline10 l10 , enplanwork p  , enplanworkitem pi
where l10.elementcode = p.elementrefcode
and p.code = pi.planrefcode
and p.kindcode = $P{planKindCode} /* річні місячні */
and p.typerefcode in (1) /* планові */
and p.statuscode in (1,3,4,5,7) /* затверджені і чорнові */
and p.budgetrefcode = 75000001 /* СРС */
and p.yeargen = $P{YearGen} /* год */
and (case when $P{DepartmentCode} <> 0 then p.departmentrefcode = $P{DepartmentCode} /* підрозділ */ when $P{DepartmentCode} = 0 then p.departmentrefcode = p.departmentrefcode end)
and pi.kartarefcode in (select tc1.code
		from tktechcard as tc1
                inner join
                tkreportitem2techcard as ritc1
                on tc1.code = ritc1.techcardcode
                where ritc1.reportitemcode = 500000215)


group by  l10.elementcode

) as oglyad_injener on line610.elementcode = oglyad_injener.elementcode

/* Капітальний ремонт */
left join
(

Select
sum(pi.countgen) as countgen ,
group_concat( cast(p.monthgen  as varchar) , ',' ) as monthgen  ,
l10.elementcode,
group_concat((select fex.name from net.finexecutor fex where fex.code = p.finexecutorcode), ';
') as planwork_month_executors3
from enline10 l10 , enplanwork p, enplanworkitem pi
where l10.elementcode = p.elementrefcode
and p.code = pi.planrefcode
and p.kindcode = $P{planKindCode} /* річні місячні */
and p.typerefcode in (1) /* планові */
and p.statuscode in (1,3,4,5,7) /* затверджені і чорнові */
and p.budgetrefcode = 75000001 /* СРС */
and p.staterefcode = 1 /* КР  */
and p.yeargen = $P{YearGen} /* год */
and (case when $P{DepartmentCode} <> 0 then p.departmentrefcode = $P{DepartmentCode} /* підрозділ */ when $P{DepartmentCode} = 0 then p.departmentrefcode = p.departmentrefcode end)
and pi.kartarefcode in (select tc1.code
		from tktechcard as tc1
                inner join
                tkreportitem2techcard as ritc1
                on tc1.code = ritc1.techcardcode
                where ritc1.reportitemcode = 500000216)

group by  l10.elementcode

) as oglyad_kr on line610.elementcode = oglyad_kr.elementcode


/* Технічне обслуговування */
left join
(

Select
sum(pi.countgen) as countgen ,
group_concat( cast(p.monthgen  as varchar) , ',' ) as monthgen,
l10.elementcode,
group_concat((select fex.name from net.finexecutor fex where fex.code = p.finexecutorcode), ';
') as planwork_month_executors4
from enline10 l10 , enplanwork p  , enplanworkitem pi
where l10.elementcode = p.elementrefcode
and p.code = pi.planrefcode
and p.kindcode = $P{planKindCode} /* річні місячні */
and p.typerefcode in (1) /* планові */
and p.statuscode in (1,3,4,5,7) /* затверджені і чорнові */
and p.budgetrefcode = 75000001 /* СРС */
and p.yeargen = $P{YearGen} /* год */
and p.staterefcode = 3 /* ТО */
and (case when $P{DepartmentCode} <> 0 then p.departmentrefcode = $P{DepartmentCode} /* підрозділ */ when $P{DepartmentCode} = 0 then p.departmentrefcode = p.departmentrefcode end)
and pi.kartarefcode in (select tc1.code
		from tktechcard as tc1
                inner join
                tkreportitem2techcard as ritc1
                on tc1.code = ritc1.techcardcode
                where ritc1.reportitemcode = 500000217)

group by  l10.elementcode

) as oglyad_to on line610.elementcode = oglyad_to.elementcode

group by line610.name, line610.linelength, oglyad_injener.monthgen, line610.elementcode, oglyad_kr.monthgen, oglyad_to.monthgen
order by line610.name;