select
depname,
Names.TotalCode,
Names.name,
Names.periodinspect ,
ExaminationData.m1 as mm1,
ExaminationData.m2 as mm2,
ExaminationData.m3 as mm3,
ExaminationData.m4 as mm4,
ExaminationData.m5 as mm5,
ExaminationData.m6 as mm6,
ExaminationData.m7 as mm7,
ExaminationData.m8 as mm8,
ExaminationData.m9 as mm9,
ExaminationData.m10 as mm10,
ExaminationData.m11 as mm11,
ExaminationData.m12 as mm12,

substr(TechService.Months,2,length(TechService.Months)-2) as TechServiceMonths,
substr(MajorOverhaul.Months,2,length(MajorOverhaul.Months)-2) as MajorOverhaulMonths,
substr(EngineeringManpowerExam.Months,2,length(EngineeringManpowerExam.Months)-2) as EngineeringManpowerExamMonths,

ExaminationData.planwork_month_executors


from

((((select distinct LI.code as TotalCode, de1.name as depname, LI.periodinspect ,
(coalesce(LI.name,'') || ' № ' || coalesce(LI.invnumber,'')) as name
from
ensubstation04 as LI left join
(enelement as el left join
(epren as ep left join
(endepartment2epren as de
inner join endepartment as de1
on de.departmentrefcode = de1.code)
on de.renrefcode = ep.code)
on ep.code = el.renrefcode)
on LI.elementcode = el.code
where
(case when $P{BelongingCode} > 0 then LI.belongingrefcode = $P{BelongingCode} else coalesce(LI.belongingrefcode, 0) > -1 end)
and
(case when $P{DepartmentCode} <> 0 then DE.departmentrefcode = $P{DepartmentCode} /* підрозділ */ when $P{DepartmentCode} = 0 then DE.departmentrefcode = DE.departmentrefcode end)
) as Names

left join

(select LI.code as TotalCode,
sum((select PI1.countgen
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 1)) as m1,
sum((select PI1.countgen
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 2)) as m2,
sum((select PI1.countgen
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 3)) as m3,
sum((select PI1.countgen
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 4)) as m4,
sum((select PI1.countgen
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 5)) as m5,
sum((select PI1.countgen
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 6)) as m6,
sum((select PI1.countgen
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 7)) as m7,
sum((select PI1.countgen
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 8)) as m8,
sum((select PI1.countgen
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 9)) as m9,
sum((select PI1.countgen
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 10)) as m10,
sum((select PI1.countgen
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 11)) as m11,
sum((select PI1.countgen
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 12)) as m12,
group_concat((select fex.name from net.finexecutor fex where fex.code = PW.finexecutorcode), '; 
') as planwork_month_executors

from
((enplanwork as PW inner join
(enelement as EL inner join
ensubstation04 as LI
on EL.code=LI.elementcode)
on PW.elementrefcode=EL.code) inner join
enplanworkitem as PI on
PW.code=PI.planrefcode) inner join
tktechcard as TC
on PI.kartarefcode=TC.code
where
(case when $P{BelongingCode} > 0 then LI.belongingrefcode = $P{BelongingCode} else coalesce(LI.belongingrefcode, 0) > -1 end)
and PW.yeargen = $P{YearGen} /* год */
and (case when $P{DepartmentCode} <> 0 then PW.departmentrefcode = $P{DepartmentCode} /* підрозділ */ when $P{DepartmentCode} = 0 then PW.departmentrefcode = PW.departmentrefcode end)
and TC.code in (select tc1.code
		from tktechcard as tc1
                inner join
                tkreportitem2techcard as ritc1
                on tc1.code = ritc1.techcardcode
                where ritc1.reportitemcode = 500000200)
and PW.kindcode in (1) /* річні */
and PW.typerefcode in (1) /* планові */
and PW.statuscode in (1,3,4,5,7) /* затверджені і чорнові */
and PW.budgetrefcode = 75000001 /* СРС */
and EL.typerefcode = 3 /* ТП 0.4 кВ */

group by LI.code

) as ExaminationData

on Names.TotalCode = ExaminationData.TotalCode)

left join

(
select LI.code as TotalCode,
(
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 1)) = 0 then '' else ' 1;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 2)) = 0 then '' else ' 2;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 3)) = 0 then '' else ' 3;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 4)) = 0 then '' else ' 4;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 5)) = 0 then '' else ' 5;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 6)) = 0 then '' else ' 6;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 7)) = 0 then '' else ' 7;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 8)) = 0 then '' else ' 8;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 9)) = 0 then '' else ' 9;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 10)) = 0 then '' else ' 10;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 11)) = 0 then '' else ' 11;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 12)) = 0 then '' else ' 12;' end)
) as Months
from
((enplanwork as PW inner join
(enelement as EL inner join
ensubstation04 as LI
on EL.code=LI.elementcode)
on PW.elementrefcode=EL.code) inner join
enplanworkitem as PI on
PW.code=PI.planrefcode) inner join
tktechcard as TC
on PI.kartarefcode=TC.code
where
(case when $P{BelongingCode} > 0 then LI.belongingrefcode = $P{BelongingCode} else coalesce(LI.belongingrefcode, 0) > -1 end)
and PW.yeargen = $P{YearGen} /* год */
and (case when $P{DepartmentCode} <> 0 then PW.departmentrefcode = $P{DepartmentCode} /* підрозділ */ when $P{DepartmentCode} = 0 then PW.departmentrefcode = PW.departmentrefcode end)
and TC.code in (select tc1.code
		from tktechcard as tc1
                inner join
                tkreportitem2techcard as ritc1
                on tc1.code = ritc1.techcardcode
                where ritc1.reportitemcode = 500000203)
and PW.kindcode in (1) /* річні */
and PW.typerefcode in (1) /* планові */
and PW.statuscode in (1,3,4,5,7) /* затверджені і чорнові */
and PW.budgetrefcode = 75000001 /* СРС */
and PW.staterefcode = 3 /* ТО */
and EL.typerefcode = 3 /* ТП 0.4 кВ */

group by LI.code

) as TechService

on TechService.TotalCode = Names.TotalCode)

left join

(
select LI.code as TotalCode,
(
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 1)) = 0 then '' else ' 1;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 2)) = 0 then '' else ' 2;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 3)) = 0 then '' else ' 3;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 4)) = 0 then '' else ' 4;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 5)) = 0 then '' else ' 5;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 6)) = 0 then '' else ' 6;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 7)) = 0 then '' else ' 7;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 8)) = 0 then '' else ' 8;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 9)) = 0 then '' else ' 9;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 10)) = 0 then '' else ' 10;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 11)) = 0 then '' else ' 11;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 12)) = 0 then '' else ' 12;' end)
) as Months
from
((enplanwork as PW inner join
(enelement as EL inner join
ensubstation04 as LI
on EL.code=LI.elementcode)
on PW.elementrefcode=EL.code) inner join
enplanworkitem as PI on
PW.code=PI.planrefcode) inner join
tktechcard as TC
on PI.kartarefcode=TC.code
where
(case when $P{BelongingCode} > 0 then LI.belongingrefcode = $P{BelongingCode} else coalesce(LI.belongingrefcode, 0) > -1 end)
and PW.yeargen = $P{YearGen} /* год */
and (case when $P{DepartmentCode} <> 0 then PW.departmentrefcode = $P{DepartmentCode} /* підрозділ */ when $P{DepartmentCode} = 0 then PW.departmentrefcode = PW.departmentrefcode end)
and TC.code in (select tc1.code
		from tktechcard as tc1
                inner join
                tkreportitem2techcard as ritc1
                on tc1.code = ritc1.techcardcode
                where ritc1.reportitemcode = 500000202)
and PW.kindcode in (1) /* річні */
and PW.typerefcode in (1) /* планові */
and PW.statuscode in (1,3,4,5,7) /* затверджені і чорнові */
and PW.budgetrefcode = 75000001 /* СРС */
and PW.staterefcode = 1 /* КР */
and EL.typerefcode = 3 /* ТП 0.4 кВ */

group by LI.code

) as MajorOverhaul

on Names.TotalCode = MajorOverhaul.TotalCode)

left join

(select LI.code as TotalCode,
(
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 1)) = 0 then '' else ' 1;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 2)) = 0 then '' else ' 2;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 3)) = 0 then '' else ' 3;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 4)) = 0 then '' else ' 4;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 5)) = 0 then '' else ' 5;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 6)) = 0 then '' else ' 6;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 7)) = 0 then '' else ' 7;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 8)) = 0 then '' else ' 8;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 9)) = 0 then '' else ' 9;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 10)) = 0 then '' else ' 10;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 11)) = 0 then '' else ' 11;' end)
||
(case when count((select PI1.code
from
enplanworkitem as PI1
where
PI1.code = PI.code and
PW.monthgen = 12)) = 0 then '' else ' 12;' end)
) as Months
from
((enplanwork as PW inner join
(enelement as EL inner join
ensubstation04 as LI
on EL.code=LI.elementcode)
on PW.elementrefcode=EL.code) inner join
enplanworkitem as PI on
PW.code=PI.planrefcode) inner join
tktechcard as TC
on PI.kartarefcode=TC.code
where
(case when $P{BelongingCode} > 0 then LI.belongingrefcode = $P{BelongingCode} else coalesce(LI.belongingrefcode, 0) > -1 end)
and
PW.yeargen = $P{YearGen} /* год */
and (case when $P{DepartmentCode} <> 0 then PW.departmentrefcode = $P{DepartmentCode} /* підрозділ */ when $P{DepartmentCode} = 0 then PW.departmentrefcode = PW.departmentrefcode end)
and TC.code in (select tc1.code
		from tktechcard as tc1
                inner join
                tkreportitem2techcard as ritc1
                on tc1.code = ritc1.techcardcode
                where ritc1.reportitemcode = 500000201)
and PW.kindcode in ($P{planKindCode}) /* річні та місячні */
and PW.typerefcode in (1) /* планові */
and PW.statuscode in (1,3,4,5,7) /* затверджені і чорнові */
and PW.budgetrefcode = 75000001 /* СРС */
and EL.typerefcode = 3 /* ТП 0.4 кВ */

group by LI.code) as EngineeringManpowerExam

on Names.TotalCode = EngineeringManpowerExam.TotalCode