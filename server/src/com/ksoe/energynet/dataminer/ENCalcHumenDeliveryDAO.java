
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENCalcHumenDeliveryDAOGen;
import com.ksoe.energynet.valueobject.brief.ENCalcHumenDeliveryShort;
import com.ksoe.energynet.valueobject.lists.ENCalcHumenDeliveryShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.valueobject.TKTransportType;

  /**
  *  DAO Object for ENCalcHumenDelivery;
  *
  */

public class ENCalcHumenDeliveryDAO extends ENCalcHumenDeliveryDAOGen {


  public ENCalcHumenDeliveryDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENCalcHumenDeliveryDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public BigDecimal getCostDeliveryByPlan2ClassificationType(int plan2classificationCode) throws PersistenceException
  {

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   BigDecimal out = new BigDecimal(0);

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr =   "select coalesce(sum(ss.costtotal),0) from encalchumendelivery ss where ss.plan2ctyperefcode = ? " ;


   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1, plan2classificationCode);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
        out = set.getBigDecimal(1);
        if (out != null){
            out = out.setScale(2, BigDecimal.ROUND_HALF_UP);
        }
        else{
            out = new BigDecimal(0);
        }
      }
     return out;
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



  public ENCalcHumenDeliveryShortList getList4Calculation(int plan2classificationCode) throws PersistenceException
  {
   ENCalcHumenDeliveryShortList result = new ENCalcHumenDeliveryShortList();
   ENCalcHumenDeliveryShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

/*  selectStr = "  select ct.kod, coalesce(so.contractservicesdistnc, 0),  max(coalesce(tc.middlesallaryway,0)) " +
                " from enplanwork2classfctntp p2c, tkclassificationtype ct, tktechcard tc, enplanwork p, enservicesobject so where " +
                " p2c.code = ? and p2c.classificationtyperfcd = ct.code and tc.classificationtypecode = ct.code and p.elementrefcode = so.elementcode " +
                " and p.code = p2c.planrefcode group by ct.kod, so.contractservicesdistnc order by ct.kod";
 */

   selectStr = "  select ct.kod, coalesce(so.contractservicesdistnc, 0),  coalesce(sum(tc.middlesallaryway),0)   \n" +
   "                    from enplanwork2classfctntp p2c,  \n" +
   "                 tkclassificationtype ct, tktechcard tc,  \n" +
   "                enplanwork p, enservicesobject so , entransportitem tri ,  enplanworkitem pi , tktransport tr \n" +
   "                where  p2c.code = ?  \n" +
   " and p2c.classificationtyperfcd = ct.code  \n" +
   " and tc.classificationtypecode = ct.code  \n" +
   " and p.elementrefcode = so.elementcode  \n" +
   " and p.code = p2c.planrefcode  \n" +
   " and p.code = tri.planrefcode \n" +
   " and tri.planrefcode = p2c.planrefcode \n" +
   " and tri.planitemrefcode = pi.code  \n" +
   " and pi.planrefcode = p.code  \n" +
   " and pi.countgen > 0 " +
   " and pi.kartarefcode = tc.code \n" +
   " and tri.transportcode = tr.code  \n" +
   " and (tr.transporttypecode = " + TKTransportType.BRIGADE  + " \n" + // только бригадные
   " or (tr.transporttypecode = " + TKTransportType.AUTOTOWER + "\n" +
   /*SUPP-47423 Будет также рассчитываться и для вышки (только в случае если на работе нет бригадного)*/
   " and not exists (select 1 from entransportitem as tri1 inner join tktransport as tr1 on tri1.transportcode = tr1.code \n" +
   " where tri1.planitemrefcode = pi.code and tr1.transporttypecode = " + TKTransportType.BRIGADE + "))) \n" + 
   " and tri.code in ( select dist.transportitemrefcode from endistance dist where dist.transportitemrefcode = tri.code ) \n" + // только те строки на которых есть дистанс
   " and pi.code in ( select distinct pp.code from enplanworkitem pp , tktechcard tt , enplanwork2classfctntp pp2cc ,  \n" +
   "                                              entransportitem aa , endistance dd , enplanwork ppp \n" +
   "                  where pp.kartarefcode = tt.code \n" +
   "                    and tt.classificationtypecode = pp2cc.classificationtyperfcd  \n" +
   "                    and aa.planitemrefcode = pp.code  \n" +
   "                    and aa.code = dd.transportitemrefcode \n" +
   "                    and pp.planrefcode = ppp.code  \n" +
   "                    and ppp.code = pp2cc.planrefcode                    \n" +
   "                    and pp2cc.code = ?   ) \n" +
   " group by ct.kod, so.contractservicesdistnc  \n" +
   " order by ct.kod \n" +
   "  \n" ;



   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1, plan2classificationCode);
     statement.setInt(2, plan2classificationCode);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       anObject = new ENCalcHumenDeliveryShort();
       anObject.numberGen = i + 1;
       anObject.classificationTypeNumber = set.getString(1);

       anObject.distance = set.getBigDecimal(2);
       if (anObject.distance != null){
        anObject.distance = anObject.distance.setScale(3, BigDecimal.ROUND_HALF_UP);
       }

       anObject.priceHour = set.getBigDecimal(3);
       if (anObject.priceHour != null){
        anObject.priceHour = anObject.priceHour.setScale(3, BigDecimal.ROUND_HALF_UP);
       }

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




} // end of ENCalcHumenDeliveryDAO

