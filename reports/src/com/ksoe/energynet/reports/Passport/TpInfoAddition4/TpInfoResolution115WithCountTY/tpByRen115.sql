select * from (

select ss.s04code, ss.s04name, ss.s04typecode,
  ss.s04type, ss.s04nominalpower, ss.maxadmispower,
  (ss.maxadmispower - ss.gauge_s04_power) as power_admis_reserv,
  coalesce(ss.gauge_s04_power, 0) as gauge_power,
  ss.geographiccode, ss.pvtu, ss.countty, ss.blsum, ss.tr_cnt,
  ss.counttybyt::numeric, ss.counttyprom::numeric,
  ss.powerbyt, ss.powerprom
 from (
select ss.subs150code as s04code,
       ss.name as s04name,
       case
         when (ss.name like '% 35/%') and (ss.name not like '%15%/%') then 2
         when (ss.name like '%15%/%') then 1
         else 3
       end as s04typecode,
       '' as s04type,
       ss.nominalpower as s04nominalpower,
       ss.maxadmispower as maxadmispower,
       ss.gauge_s04_power as gauge_s04_power,

       (select c.geographiccode from encoordinates c where c.elementcode = ss.elementcode) as geographiccode,
       0 as pvtu,

        (select sum(coalesce(bl.countcustomer, 0))
           from enpricondatabilling bl
          where bl.elementrefcode in (select s150.elementcode from ensubstation150 s150,ad2substation ad2s
           where ad2s.substationcode=s150.code and ad2s.adcode=ss.code)
            and bl.renrefcode = ss.rencode) as countty,

        (select sum(coalesce(bl.powercontracttotal, 0))
           from enpricondatabilling bl
           where bl.elementrefcode in (select s150.elementcode from ensubstation150 s150,ad2substation ad2s
           where ad2s.substationcode=s150.code and ad2s.adcode=ss.code)
            and bl.renrefcode = ss.rencode) as blsum,

        (select count(code) from ad4subst150 where subs150code = ss.subs150code) as tr_cnt,

        (select sum(coalesce(bl.countcustomerbyt, 0))
           from enpricondatabilling bl
          where bl.elementrefcode in (select s150.elementcode from ensubstation150 s150,ad2substation ad2s
           where ad2s.substationcode=s150.code and ad2s.adcode=ss.code)
            and bl.renrefcode = ss.rencode) as counttybyt,

        (select sum(coalesce(bl.countcustomerprom, 0))
           from enpricondatabilling bl
           where bl.elementrefcode in (select s150.elementcode from ensubstation150 s150,ad2substation ad2s
           where ad2s.substationcode=s150.code and ad2s.adcode=ss.code)
            and bl.renrefcode = ss.rencode) as counttyprom,

        (select sum(coalesce(bl.powercontractbyt, 0))
           from enpricondatabilling bl
          where bl.elementrefcode in (select s150.elementcode from ensubstation150 s150,ad2substation ad2s
           where ad2s.substationcode=s150.code and ad2s.adcode=ss.code)
            and bl.renrefcode = ss.rencode) as powerbyt,

        (select sum(coalesce(bl.powercontractprom, 0))
           from enpricondatabilling bl
           where bl.elementrefcode in (select s150.elementcode from ensubstation150 s150,ad2substation ad2s
           where ad2s.substationcode=s150.code and ad2s.adcode=ss.code)
            and bl.renrefcode = ss.rencode) as powerprom

from ad4subst150 ss
where ss.rencode = $P{rencode}
) ss


union all

select s04.s04code, s04.s04name, s04.s04typecode,
  s04.s04type, s04.s04nominalpower, s04.maxadmispower,
  (s04.maxadmispower - s04.gauge_s04_power) as power_admis_reserv,
  coalesce(s04.gauge_s04_power, 0) as gauge_power,
  s04.geographiccode, s04.pvtu, s04.countty, s04.blsum, s04.tr_cnt,
  s04.counttybyt, s04.counttyprom, s04.powerbyt, s04.powerprom
from (
select
   ensubstation04.code as s04code,
   (ensubstation04.name ||
     case
       when exists(select entransformer.code from entransformer
           where entransformer.substation04refcode = ensubstation04.code)
         then
           ', ' || (select coalesce(/*t.name || '/' ||*/
             cast(t.highvoltage/1000 as numeric(10,1)) || '/' ||
             cast(t.lowvoltage/1000 as numeric(10,1)),'')
           from entransformer t
           where t.substation04refcode = ensubstation04.code
	   order by t.lowvoltage, t.highvoltage limit 1)
       else ''
     end
   ) as s04name,
   (ensubstation04.substationtypecode+2) /* 1,2-й - 150 и 35 */ as s04typecode,
   ensubstationtype.name as s04type,

   (select coalesce(min(nominalpower), 0) from entransformer
    where substation04refcode = ensubstation04.code) as s04nominalpower,

   case
     when (select count(code) from entransformer
         where entransformer.substation04refcode = ensubstation04.code) < 2
       then
         0.92 * coalesce(ensubstation04.nominalpower, 0)
     else
       (select 0.92 * 1.4 * coalesce(sum(entransformer.nominalpower) -
         max(entransformer.nominalpower), 0)
       from entransformer
       where entransformer.substation04refcode = ensubstation04.code)
   end as maxadmispower,
   round
   (cast
     (0.38 * sqrt(3) * 0.92 *
       (
         select coalesce(max(fg.gauge_sum_cur), 0) from
           (
             select sum(

               case /*Проверка перекоса фаз 20%*/
                 when /*Если есть перекос фаз 20%*/
                     /*Ток жёлтой фазы A больше остальных*/
                     (
                       coalesce(enfiderguage.currentphaseyellow, 0) >
                         coalesce(enfiderguage.currentphasegreen, 0)
                       and coalesce(enfiderguage.currentphasegreen, 0) >=
                         coalesce(enfiderguage.currentphasered, 0)
                       and
                         (coalesce(enfiderguage.currentphaseyellow, 0) -
                         coalesce(enfiderguage.currentphasered, 0)) /
                         coalesce(enfiderguage.currentphaseyellow, -1) >= 0.2
                     )
                     or
                     (
                       coalesce(enfiderguage.currentphaseyellow, 0) >
                         coalesce(enfiderguage.currentphasered, 0)
                       and coalesce(enfiderguage.currentphasered, 0) >
                         coalesce(enfiderguage.currentphasegreen, 0)
                       and
                         (coalesce(enfiderguage.currentphaseyellow, 0) -
                         coalesce(enfiderguage.currentphasegreen, 0)) /
                         coalesce(enfiderguage.currentphaseyellow, -1) >= 0.2
                     )
                     or
                     /*Ток зелёной фазы B больше остальных*/
                     (
                       coalesce(enfiderguage.currentphasegreen, 0) >
                         coalesce(enfiderguage.currentphaseyellow, 0)
                       and coalesce(enfiderguage.currentphaseyellow, 0) >=
                         coalesce(enfiderguage.currentphasered, 0)
                       and
                         (coalesce(enfiderguage.currentphasegreen, 0) -
                         coalesce(enfiderguage.currentphasered, 0)) /
                         coalesce(enfiderguage.currentphasegreen, -1) >= 0.2
                     )
                     or
                     (
                       coalesce(enfiderguage.currentphasegreen, 0) >
                         coalesce(enfiderguage.currentphasered, 0)
                       and coalesce(enfiderguage.currentphasered, 0) >
                         coalesce(enfiderguage.currentphaseyellow, 0)
                       and
                         (coalesce(enfiderguage.currentphasegreen, 0) -
                         coalesce(enfiderguage.currentphaseyellow, 0)) /
                         coalesce(enfiderguage.currentphasegreen, -1) >= 0.2
                     )
                     or
                     /*Ток красной фазы C больше остальных*/
                     (
                       coalesce(enfiderguage.currentphasered, 0) >
                         coalesce(enfiderguage.currentphaseyellow, 0)
                       and coalesce(enfiderguage.currentphaseyellow, 0) >=
                         coalesce(enfiderguage.currentphasegreen, 0)
                       and
                         (coalesce(enfiderguage.currentphasered, 0) -
                         coalesce(enfiderguage.currentphasegreen, 0)) /
                         coalesce(enfiderguage.currentphasered, -1) >= 0.2
                     )
                     or
                     (
                       coalesce(enfiderguage.currentphasered, 0) >
                         coalesce(enfiderguage.currentphasegreen, 0)
                       and coalesce(enfiderguage.currentphasegreen, 0) >
                         coalesce(enfiderguage.currentphaseyellow, 0)
                       and
                         (coalesce(enfiderguage.currentphasered, 0) -
                         coalesce(enfiderguage.currentphaseyellow, 0)) /
                         coalesce(enfiderguage.currentphasered, -1) >= 0.2
                     )
                   then
                     ( /*Среднее арифметическое токов фаз на дату*/
                       coalesce(enfiderguage.currentphaseyellow, 0) +
                       coalesce(enfiderguage.currentphasegreen, 0) +
                       coalesce(enfiderguage.currentphasered, 0)
                     ) / 3
                 else /*Если нет перекоса фаз 20%*/
                   case /*Сравнение токов фаз на дату*/
                     when (coalesce(enfiderguage.currentphaseyellow, 0) >=
                         coalesce(enfiderguage.currentphasegreen, 0))
                     and (coalesce(enfiderguage.currentphaseyellow, 0) >=
                         coalesce(enfiderguage.currentphasered, 0))
                       then /*Ток жёлтой фазы*/
                         coalesce(enfiderguage.currentphaseyellow, 0)
                     when (coalesce(enfiderguage.currentphasegreen, 0) >=
                         coalesce(enfiderguage.currentphaseyellow, 0))
                     and (coalesce(enfiderguage.currentphasegreen, 0) >=
                         coalesce(enfiderguage.currentphasered, 0))
                       then /*Ток зелёной фазы*/
                         coalesce(enfiderguage.currentphasegreen, 0)
                     else   /*Ток красной фазы*/
                         coalesce(enfiderguage.currentphasered, 0)
                   end
               end

             ) as gauge_sum_cur
             from enfiderguage
             where enfiderguage.substation04code = ensubstation04.code
             and enfiderguage.isgenswitchdev = 1

             /* режимные замеры за период */
             and enfiderguage.dateguage
               between cast($P{gauge_date_start} as date)
                 and cast($P{gauge_date} as date)
             group by enfiderguage.substation04code, enfiderguage.dateguage

           ) fg
       )
      as numeric
     ), 2
   ) as gauge_s04_power,

   case
     when exists (select encoordinates.code from encoordinates where
         encoordinates.elementcode = enelement.code)
       then
         (select cast(coalesce(encoordinates.geographiccode, '') as varchar) from encoordinates
          where encoordinates.elementcode = enelement.code)
       else ''
   end as geographiccode,
   0 as pvtu,

   (select coalesce(sum(coalesce(b.countcustomer,0)),0)
   from enpricondatabilling b
   where b.elementrefcode = ensubstation04.elementcode
   ) as countty,

   (select coalesce(sum(coalesce(b.powercontracttotal,0)),0)
   from enpricondatabilling b
   where b.elementrefcode = ensubstation04.elementcode
   ) as blsum,

   (select count(code) from entransformer where substation04refcode = ensubstation04.code
   ) as tr_cnt,


   (select coalesce(sum(coalesce(b.countcustomerbyt, 0)),0)
   from enpricondatabilling b
   where b.elementrefcode = ensubstation04.elementcode
   ) as counttybyt,

   (select coalesce(sum(coalesce(b.countcustomerprom, 0)),0)
   from enpricondatabilling b
   where b.elementrefcode = ensubstation04.elementcode
   ) as counttyprom,

   (select coalesce(sum(coalesce(b.powercontractbyt, 0)),0)
   from enpricondatabilling b
   where b.elementrefcode = ensubstation04.elementcode
   ) as powerbyt,

   (select coalesce(sum(coalesce(b.powercontractprom, 0)),0)
   from enpricondatabilling b
   where b.elementrefcode = ensubstation04.elementcode
   ) as powerprom


 from enelement, epren, ensubstationtype, ensubstation04

 where ensubstation04.elementcode = enelement.code
 and epren.code = enelement.renrefcode
 and ensubstationtype.code = ensubstation04.substationtypecode
 and ensubstation04.dontuse = 0 /* 1 - не юзать в отчете */
 /* кроме абонентских */
 and ensubstation04.ownerrefcode <> 2
 and ensubstation04.belongingrefcode <> 2
 /* исключаем без инвентарных номеров */
 and ensubstation04.invnumber is not null

 and enelement.renrefcode = $P{rencode}
 ) s04) w
order by 3, 2