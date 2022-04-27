
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENAverageCountPersonalDAOGen;
import com.ksoe.energynet.valueobject.ENAverageCountPersonal;
import com.ksoe.energynet.valueobject.brief.ENAverageCountPersonalShort;
import com.ksoe.energynet.valueobject.lists.ENAverageCountPersonalShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;

  /**
  *  DAO Object for ENAverageCountPersonal;  
  * 	
  */

public class ENAverageCountPersonalDAO extends ENAverageCountPersonalDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENAverageCountPersonalDAO() {super();}
  //public ENAverageCountPersonalDAO(Connection aConnection) {super(aConnection);}
  //public ENAverageCountPersonalDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENAverageCountPersonalDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAverageCountPersonalDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  
  public ENAverageCountPersonalShortList getGroupListAveragePersonal(String tabstring , String datestr ) throws PersistenceException
  {   
   ENAverageCountPersonalShortList result = new ENAverageCountPersonalShortList();
   ENAverageCountPersonalShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
   selectStr =  " /*2*/ select \n\n" +
			" ceh_id , \n\n" +
			" Ceh_Nazv , \n\n" +
			" personal_vid_id , \n\n" +
			" personal_vid_nazv , \n" +
			" sum(result)  result \n" +
			" from ( \n" +
			" select \n" +
			" ceh_id , \n" +
			" Ceh_Nazv , \n" + 
			" TabN, \n" +
			" personal_vid_id , \n" +
			" personal_vid_nazv , \n" + 
			" s, \n" +
			" po , \n" +
			" countDayInCurMonth ,  \n" +
			" countWorkerDay , \n" +
			" cast (countWorkerDay/countDayInCurMonth as number(15,2)) result \n" +
			
			" from \n" +
			" (		\n" +		
			" select \n" +
			" ceh_id ,  \n" +
			" Ceh_Nazv ,  \n" +
			" TabN, \n" +
			" personal_vid_id , \n" + 
			" personal_vid_nazv , \n" +
			" s, \n" +
			" po , \n" +
			" countDayInCurMonth ,  \n" +
			" case when  /*если дата с и дата по пересекаются с заданой датой расчета */ \n" +
			"          to_char(to_date('"+datestr+"','dd.mm.yyyy'),'mm.yyyy') = to_char(s,'mm.yyyy')  \n" +
			"          and \n" +
			"		  to_char(to_date('"+datestr+"','dd.mm.yyyy'),'mm.yyyy') = to_char(po,'mm.yyyy')  \n" + 
			"		  then \n" +
		
			"		  ( countDayInCurMonth - cast(to_char(S,'dd') as numeric(10)) + 1 ) /*отнимаем кол-во дней когда работник пришел + 1*/ \n" +
			"		  - \n" +
			"		  ( countDayInCurMonth - cast(to_char(PO,'dd') as numeric(10) )) /*отнимаем кол-во дней когда работник ушел */ \n" +
			"	 when /*если дата с пересекается а дата по не пересекается с заданой датой расчета */ \n" +
			"		  to_char(to_date('"+datestr+"','dd.mm.yyyy'),'mm.yyyy') = to_char(s,'mm.yyyy')  \n" +
			"          and \n" +
			"		  ( to_char(to_date('"+datestr+"','dd.mm.yyyy'),'mm.yyyy') <> to_char(po,'mm.yyyy') \n" +
			"		   or PO is null \n" +
			"		   )   \n" +
			"		  then \n" +
			"		  ( countDayInCurMonth - to_number(to_char(S,'dd')) + 1 ) /*отнимаем кол-во дней когда работник пришел + 1*/ \n" +
			"	  when /*если дата C не пересекается а дата ПО пересекается с заданой датой расчета */ \n" +
			"		  (to_char(to_date('"+datestr+"','dd.mm.yyyy'),'mm.yyyy') <> to_char(s,'mm.yyyy')  \n" +
			"		  or S is null ) \n" +
			"         and \n" +
			"		   to_char(to_date('"+datestr+"','dd.mm.yyyy'),'mm.yyyy') = to_char(PO,'mm.yyyy') \n" +		    
			"		  then	  \n" + 
			"		  to_number(to_char(PO,'dd')) /*кол-во дней которое работник проработал до ухода */ \n" +
			"	  when /*если дата C не пересекается и дата ПО не пересекается с заданой датой расчета */ \n" +
			"		  (to_char(to_date('"+datestr+"','dd.mm.yyyy'),'mm.yyyy') <> to_char(S,'mm.yyyy')  \n" +
			"		  or S is null ) \n" +
			"          and ( \n" +
			"		   to_char(to_date('"+datestr+"','dd.mm.yyyy'),'mm.yyyy') <> to_char(PO,'mm.yyyy') 	\n" +	    
			"		   or PO is null ) \n" + 
			"		  then	  \n" +
			"		  countDayInCurMonth /*кол-во дней принимается такое как кол-во дней в месяце */ \n" +	  
			"         else 0  \n" +
			"		   end  countWorkerDay  \n" +

			" from  \n" +
			" (			 \n" +
		    " SELECT	 \n" +			
			" d.ceh_id ,  \n" +
			" d.Ceh_Nazv ,  \n" +
			" s.TabN ,  \n" +			
			" DECODE(nd.Post_Id, NULL, pr.personal_vid_id, \n" +
			"                           pr1.personal_vid_id ) personal_vid_id, \n" +			
			"  DECODE(nd.Post_Id, NULL, ( select  pv.nazv from kadry.personal_vid pv where pv.id = pr.personal_vid_id), \n" +
			"                           ( select  pv.nazv from kadry.personal_vid pv where pv.id = pr1.personal_vid_id) ) personal_vid_nazv \n" +
			"  ,   \n" +
			"  cast (to_number(to_char(last_day(to_date('"+datestr+"','dd.mm.yyyy')),'dd')) as numeric(10) )  countDayInCurMonth  ,  \n" +
			"  s.Karta_Id,  \n" +
			"  s.IdKod, \n" +
			"  s.Nomer NomKart, \n" +
			"  s.Chel_Id, \n" +
			"  s.FIO_Id, \n" +
			"  s.F, \n" +
			"  s.I, \n" +
			"  s.O, \n" +
			"  s.F||' '||s.I||' '||s.O FIO, \n" +
			"  DECODE(s.S, TO_DATE('01.01.1900','DD.MM.YYYY'), TO_DATE(NULL), TO_DATE('01.01.3000','DD.MM.YYYY'), TO_DATE(NULL), s.S) S, \n" +				 
			"  DECODE(s.Po, TO_DATE('01.01.1900','DD.MM.YYYY'), TO_DATE(NULL), TO_DATE('01.01.3000','DD.MM.YYYY'), TO_DATE(NULL), s.Po) Po, \n" +				 
			"  DECODE(s.Data_Rogd, TO_DATE('01.01.3000','DD.MM.YYYY'), TO_DATE(NULL), s.Data_Rogd) Data_Rogd, \n" +
			"  DECODE(s.PenSrok, TO_DATE('01.01.3000','DD.MM.YYYY'), TO_DATE(NULL), s.PenSrok) PenSrok, \n" +
			"  kadry.pkg_Pensioner_Utils.Get_Tip(s.Chel_Id, last_day(to_date('"+datestr+"','dd.mm.yyyy'))) Tip, \n" +
			"  s.Sovm, \n" +
			"  s.Pol, \n" +
			"  s.Prim, \n" +
			"  s.Data_Zapoln, \n" +
			"  DECODE(TO_CHAR(s.start_pricaz_id), '-1', '', TO_CHAR(s.start_pricaz_id)) start_pricaz_id, \n" +
			"  DECODE(TO_CHAR(s.finish_pricaz_id), '-1', '', TO_CHAR(s.finish_pricaz_id)) finish_pricaz_id, \n" +
			"  to_number(null) as RAB_TB_GRAFIK_ID, \n" +
			"  to_char(null) as RAB_TB_GRAFIK_NAZV, \n" +
			"  0 BDejst_Id, 0 VBDejst_Id, '' VBDejst_Nazv_Sum, \n" +
		    "  d.Ceh_Kod,  \n" +
			"  d.Podr_Id, d.Podr_Kod, d.Podr_Nazv, \n" +
			"  NVL(nd.Post_Id, d.Post_Id) Post_Id, \n" +
			"  DECODE(nd.Post_Id, NULL, rtrim(pr.Nazv||rtrim(' '||ps.Prof_Dopoln)||' '||rz.Nazv), \n" +
			"                           rtrim(pr1.Nazv||rtrim(' '||ps1.Prof_Dopoln)||' '||rz1.Nazv)) Post_Nazv, \n" +
			" dd.Kod Doljnost_Kod, \n" +
			"  d.Pos  Doljnost_Pos, \n" +
			"  kadry.pkg_Podr_Utils.Concat_Pos_Buf(NVL(d.Podr_Id,1), last_day(to_date('"+datestr+"','dd.mm.yyyy'))) Sum_Pos, \n" +
			"  kadry.pkg_Podr_Utils.Get_Level_Buf(NVL(d.Podr_Id,1), last_day(to_date('"+datestr+"','dd.mm.yyyy'))) Podr_Level, \n" +
			"  prom.Sokr_Nazv  Prom, \n" +
			"  nd.IO, \n" +				
			"  to_char(null) as Start_Pricaz_Nomer, \n" +
			"  to_date(null) as Start_Pricaz_Data, \n" +				
			"  to_char(null) as Finish_Pricaz_Nomer, \n" +
			"  to_date(null) as Finish_Pricaz_Data, \n" +				
			"  '' User_Kto, '' User_Komu \n" +
			" FROM  \n" +
			" kadry.Prom            prom, \n" +
		    " kadry.Post        ps, \n" +
			" kadry.Prof        pr, \n" +
			" kadry.Razr        rz, \n" +
			" kadry.Post        ps1, \n" +
			" kadry.Prof        pr1, \n" +
			" kadry.Razr        rz1, \n" +
			" kadry.Doljnost_Day    dd, \n" +
			" (SELECT d.*, pd.Ceh_Kod, pd.Ceh_Nazv, \n" +
			"        pd.Podr_Kod, pd.Podr_Nazv, Podr_Prom_Id   , pd.ceh_id \n" +
			"  FROM kadry.v_Podr_All_Rep  pd, \n" +
			"       kadry.Doljnost        d \n" +
			" WHERE d.Podr_id = pd.Podr_id(+)) d, \n" +
		    " kadry.Nazn_Day        nd, \n" +
			" kadry.Nazn            n,	 \n" +
			" kadry.v_Karta   s \n" +
			" WHERE ((1=1	\n" +	
			"  AND n.Karta_Id(+) = s.Karta_Id \n" +
			"  AND d.Id(+) = n.Doljnost_Id \n" +
			"  AND prom.Id(+) = d.Podr_Prom_Id \n" +
			"  AND ps.Id(+) = d.Post_Id \n" +
			"  AND pr.Id(+) = ps.Prof_Id \n" +
			"  AND rz.Id(+) = ps.Razr_Id \n" +
			"  AND ps1.Id(+) = nd.Post_Id \n" +
			"  AND pr1.Id(+) = ps1.Prof_Id \n" +
			"  AND rz1.Id(+) = ps1.Razr_Id \n" +
			"  AND n.Date_Start(+) <= last_day(to_date('"+datestr+"','dd.mm.yyyy')) \n" +
			"  AND (   (n.Id IS NULL)  \n" + 
			"       OR (NOT EXISTS( \n" +
			"             SELECT NULL \n" +
			"               FROM kadry.Nazn n3 \n" +
			"               WHERE n3.Karta_Id = n.Karta_Id \n" +
			"                 AND n3.date_start <= last_day(to_date('"+datestr+"','dd.mm.yyyy')) \n" +
			"                 AND n3.date_finish > n.Date_Finish)) \n" +
			"      )   \n" +
			"  AND nd.Nazn_Id(+) = n.Id \n" +
			"  AND (nd.Nazn_Id IS NULL \n" +
			"    OR nd.ROWID = (SELECT SUBSTR(MAX(TO_CHAR(nd2.Date_Start,'J')||ROWID),8) \n" +
			"                    FROM kadry.Nazn_Day nd2 \n" +
			"                    WHERE nd2.Nazn_Id = nd.Nazn_Id \n" +
			"                      AND nd2.Date_Start <= last_day(to_date('"+datestr+"','dd.mm.yyyy')))) \n" +
			"  AND dd.Doljnost_Id(+) = d.Id \n" +
			"  AND (dd.Doljnost_Id IS NULL \n" +
			"    OR dd.ROWID = (SELECT SUBSTR(MAX(TO_CHAR(dd2.Date_Start,'J')||ROWID),8) \n" +
			"                    FROM kadry.Doljnost_Day dd2 \n" +
			"                    WHERE dd2.Doljnost_Id = dd.Doljnost_Id \n" +
			"                      AND dd2.Date_Start <= last_day(to_date('"+datestr+"','dd.mm.yyyy')))) \n" +
			" ) AND 1=1) \n" +
			" AND s.prim like ('НВЗ%') \n" +
		//	" and s.tabn in (301,302,320,322,324,325,335,383,398,476,485,583,633,2374,2544,2585,2636,2834,9307,9370,9379,9451,9456,9513) \n" +
		// 	" AND s.tabn in (\n" + tabstring + ") \n" +
			" AND s.tabn in (SELECT nvl(a.tabn,0) FROM energynet.entemptabn a) \n" + 
			" AND not exists( \n" +
			"			Select null \n" +
			"			from kadry.s_karta k1 \n" +
			"			where k1.chel_id = s.chel_id \n" +
			"			and ((k1.po > s.po) or (k1.po = s.po and k1.id > s.karta_id)) \n" +
			" )  \n" +
			" and d.ceh_id is not null \n" + 
			"  ORDER BY d.ceh_id \n" +   
			" )	\n" +			
			" )	\n" +			
			" ) \n" +
			" group by ceh_id , Ceh_Nazv , personal_vid_id , personal_vid_nazv \n" + 
			" order by ceh_id , personal_vid_id " ;


       
  // selectStr = " select 123 , 'name', 1 , 'namea' , 120 from dual ";
   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;    

          set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {


       anObject = new ENAverageCountPersonalShort();

       anObject.code = Integer.MIN_VALUE ;       
       anObject.codeCeh = set.getInt(1)+"";
       
       anObject.nameCeh = set.getString(2); 
       anObject.personalVidId = set.getString(3);
       anObject.personalVidName = set.getString(4);
       anObject.countGen = set.getBigDecimal(5);
       if(anObject.countGen != null)
           anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       result.list.add(anObject);
      }

     result.setTotalCount(i);
     return result;
    }
   catch(SQLException e) 
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return null;
    }
   finally
    {
     try {if (set != null) set.close();}             catch (SQLException e) {}
     try {if (statement != null) statement.close();} catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }


  // перечень расчитаных периодов по средней численности персонала 
  public ENAverageCountPersonalShortList getListCalculatedPeriod() throws PersistenceException
  {   
   ENAverageCountPersonalShortList result = new ENAverageCountPersonalShortList();
   ENAverageCountPersonalShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
   selectStr =  " select  distinct monthyear , calculatedate from ( " +
			" select  case when (to_char( p.calculatedate , 'mm')::varchar)::numeric = 1 then  'Січень' " + 
	        " 			when (to_char( p.calculatedate , 'mm')::varchar)::numeric = 2 then  'Лютий'  " +
			"            when (to_char( p.calculatedate , 'mm')::varchar)::numeric = 3 then  'Березень' " +
			"            when (to_char( p.calculatedate , 'mm')::varchar)::numeric = 4 then  'Квітень'  " +
			"            when (to_char( p.calculatedate , 'mm')::varchar)::numeric = 5 then  'Травень' " +
			"            when (to_char( p.calculatedate , 'mm')::varchar)::numeric = 6 then  'Червень'  " +
			"            when (to_char( p.calculatedate , 'mm')::varchar)::numeric = 7 then  'Липень' " +
			"            when (to_char( p.calculatedate , 'mm')::varchar)::numeric = 8 then  'Серпень' " +
			"            when (to_char( p.calculatedate , 'mm')::varchar)::numeric = 9 then  'Вересень' " +
			"            when (to_char( p.calculatedate , 'mm')::varchar)::numeric = 10 then 'Жовтень' " +
			"            when (to_char( p.calculatedate , 'mm')::varchar)::numeric = 11 then 'Листопад' " +
			"            when (to_char( p.calculatedate , 'mm')::varchar)::numeric = 12 then 'Грудень'     " +      
			"	       end ||' ' || to_char( p.calculatedate , 'yyyy') || 'р.' as monthyear " +
			"         , p.calculatedate " +
			" from ENAverageCountPersonal p " +
			" ) aaaa " +
			" order by calculatedate desc  " ;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;    

     
     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {


       anObject = new ENAverageCountPersonalShort();

       
       anObject.nameCeh = set.getString(1); 
       
       result.list.add(anObject);
      }

     result.setTotalCount(i);
     return result;
    }
   catch(SQLException e) 
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return null;
    }
   finally
    {
     try {if (set != null) set.close();}             catch (SQLException e) {}
     try {if (statement != null) statement.close();} catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }




} // end of ENAverageCountPersonalDAO

