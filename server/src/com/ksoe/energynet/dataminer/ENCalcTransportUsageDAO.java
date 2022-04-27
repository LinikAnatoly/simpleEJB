
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

import com.ksoe.energynet.dataminer.generated.ENCalcTransportUsageDAOGen;
import com.ksoe.energynet.valueobject.brief.ENCalcTransportUsageShort;
import com.ksoe.energynet.valueobject.filter.ENCalcTransportUsageFilter;
import com.ksoe.energynet.valueobject.lists.ENCalcTransportUsageShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENCalcTransportUsage;
  *
  */

public class ENCalcTransportUsageDAO extends ENCalcTransportUsageDAOGen {


  public ENCalcTransportUsageDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENCalcTransportUsageDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  /**
   * 
   * Получить лист сущностей {@link ENCalcTransportUsageShort} по коду плана
   * 
   * @param planCode код плана
   * @return лист объектов {@link ENCalcTransportUsageShortList}
   * @throws PersistenceException
   */
  public ENCalcTransportUsageShortList getListByPlanCode(int planCode) throws PersistenceException {
	  if(planCode == Integer.MIN_VALUE) {
		  throw new SystemException("Не заданий код плану!");
	  }
	  ENCalcTransportUsageFilter filter = new ENCalcTransportUsageFilter();
	  filter.planRef.code = planCode;
	  return this.getScrollableFilteredList(filter, 0, -1);
  }
  
  /**
   * 
   * Получить лист объектов типа {@link ENCalcTransportUsageShort} 
   * по коду сущности {@link com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType}
   * 
   * @param plan2ClassificationCode код сущности {@link com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType}
   * @return лист объектов {@link ENCalcTransportUsageShortList}
   * @throws PersistenceException
   */
  public ENCalcTransportUsageShortList getListByPlan2ClassificationType(int plan2ClassificationCode) throws PersistenceException {
	  if(plan2ClassificationCode == Integer.MIN_VALUE) {
		  throw new SystemException("Не заданий код плану!");
	  }
	  ENCalcTransportUsageFilter filter = new ENCalcTransportUsageFilter();
	  filter.plan2CTypeRef.code = plan2ClassificationCode;
	  return this.getScrollableFilteredList(filter, 0, -1);
  }
  
  public BigDecimal getCostTransportByPlan2ClassificationType(int plan2classificationCode) throws PersistenceException
  {

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   BigDecimal out = new BigDecimal(0);

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr =   "select coalesce(sum(ss.costtotal),0) from encalctransportusage ss where ss.plan2ctyperefcode = ? " ;


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



  public ENCalcTransportUsageShortList getList4Calculation(int planCode) throws PersistenceException
  {
    ENCalcTransportUsageShortList result = new ENCalcTransportUsageShortList();
    ENCalcTransportUsageShort anObject;

   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
/*
   selectStr = " select \n" +
   " tcl.kod, tr.name, tr.code \n" +
   " , qq.costtotalhourmachine   \n" +
   "   , sum(dist.distance) as distance \n" +
   "   ,sum(t.countworkfact) as hours \n" +
   " , tr.transportmarkcode  " +
   " , m.costnkre, tm.rashodprobeg , p2c.code " +
   "  From enplanwork p , enplanworkitem pi,  entransportitem t  \n" +
   "  left join endistance dist on dist.transportitemrefcode = t.code \n" +
   "   , tktransport tr , tktechcard tkd ,  tkclassificationtype tcl , \n" +
   "   ENCALCTRANSPORTUSAGEHR qq  \n" +
   "  , tktransportmark tm , tkfueltype ft , tkmaterials m , enplanwork2classfctntp p2c    " +

   " Where p.code = ? \n" +
   "   and p.code = t.planrefcode  \n" +
   "   and p.code = pi.planrefcode \n" +
   "   and tr.code = t.transportcode  \n" +
   "   and pi.countgen <> 0  \n" +
   "   and t.planitemrefcode = pi.code  \n" +
   "   and tkd.code = pi.kartarefcode  \n" +
   "   and tkd.classificationtypecode = tcl.code \n" +
   "   and qq.planrefcode = p.code \n" +
   "   and tm.code = tr.transportmarkcode  \n" +
   " and p2c.planrefcode = p.code and p2c.classificationtyperfcd = tcl.code " +
   "  and tm.fueltypecode = ft.code and m.code = ft.materialrefcode " +
   "   group by tcl.kod, tr.name, tr.code \n" +
   " , qq.costtotalhourmachine , tr.tktransporttypecode, m.costnkre , tm.rashodprobeg , p2c.code , tr.transportmarkcode \n";
*/

   selectStr = " select \n" +
   "     kod, name, trcode \n" +
   "     , costtotalhourmachine    \n" +
   "     , sum(distance) as distance \n" +
   "     , sum(hours) as hours \n" +
   "     , transportmarkcode    \n" +
   "     , costnkre, rashodprobeg , p2ccode , profitrate , costperkilometer , fuelexpensesmachine , commentperkilometer \n" +
   " from  \n" +
   " ( \n" +
   "  select  \n" +
   "     tcl.kod, tr.name, tr.code as trcode \n" +
   "     , qq.costtotalhourmachine    \n" +
   " , (select sum(coalesce(dist.distance, 0)) from endistance dist where dist.transportitemrefcode = t.code ) as distance  \n" +
   "  \n" +
   "       , t.countworkfact as hours  \n" +
   "     , tr.transportmarkcode    \n" +
   "     , m.costnkre, tm.rashodprobeg , p2c.code  as p2ccode , qq.profitrate , qq.costperkilometer , qq.fuelexpensesmachine  , qq.commentperkilometer \n" +
   "      From enplanwork p , enplanworkitem pi,  entransportitem t   \n" +
   "       , tktransport tr , tktechcard tkd ,  tkclassificationtype tcl ,  \n" +
   "       ENCALCTRANSPORTUSAGEHR qq   \n" +
   "      , tktransportmark tm , tkfueltype ft , tkmaterials m , enplanwork2classfctntp p2c      \n" +
   "     \n" +
   "     Where p.code = ?  \n" +
   "       and p.code = t.planrefcode   \n" +
   "       and p.code = pi.planrefcode  \n" +
   "       and tr.code = t.transportcode   \n" +
   "       and pi.countgen <> 0   \n" +
   "       and t.planitemrefcode = pi.code   \n" +
   "       and tkd.code = pi.kartarefcode   \n" +
   "       and tkd.classificationtypecode = tcl.code  \n" +
   "       and qq.planrefcode = p.code  \n" +
   "       and qq.planrefcode = pi.planrefcode \n" +
   "       and qq.tktransportrefcode = tr.code \n" +
   "       and tm.code = tr.transportmarkcode   \n" +
   "       and p2c.planrefcode = p.code and p2c.classificationtyperfcd = tcl.code  \n" +
   "       and tm.fueltypecode = ft.code and m.code = ft.materialrefcode   \n" +
   "  \n" +
   " /*      group by tcl.kod, tr.name, tr.code  \n" +
   "     , qq.costtotalhourmachine , tr.transporttypecode, m.costnkre , tm.rashodprobeg , p2c.code , tr.transportmarkcode*/      \n" +
   " ) q \n" +
   " group by  \n" +
   "     kod, name, trcode  \n" +
   "     , costtotalhourmachine    \n" +
   "     , transportmarkcode    \n" +
   "     , costnkre, rashodprobeg , p2ccode , profitrate  , costperkilometer , fuelexpensesmachine  , commentperkilometer\n" +
   "      \n" +
   "      \n" +
   "      \n" +
   "  \n";

   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1, planCode);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       anObject = new ENCalcTransportUsageShort();
       anObject.numberGen = i + 1;
       anObject.classificationTypeNumber = set.getString(1);
       anObject.transportName = set.getString(2);
       anObject.tkTransportRefCode = set.getInt(3);

       anObject.priceMachineHours = set.getBigDecimal(4);
       if (anObject.priceMachineHours != null){
        anObject.priceMachineHours = anObject.priceMachineHours.setScale(2, BigDecimal.ROUND_HALF_UP);
       }

       anObject.normDistance = set.getBigDecimal(5);
       if (anObject.normDistance != null){
        anObject.normDistance = anObject.normDistance.setScale(3, BigDecimal.ROUND_HALF_UP);
       }

       anObject.normMachineHours = set.getBigDecimal(6);
       if (anObject.normMachineHours != null){
        anObject.normMachineHours = anObject.normMachineHours.setScale(2, BigDecimal.ROUND_HALF_UP);
       }

       anObject.tkTransportTypeRefCode = set.getInt(7);
       if (set.wasNull()){
        anObject.tkTransportTypeRefCode = Integer.MIN_VALUE;
       }

       anObject.fuelPrice = set.getBigDecimal(8);
       if (anObject.fuelPrice != null){
        anObject.fuelPrice = anObject.fuelPrice.setScale(2, BigDecimal.ROUND_HALF_UP);
       }

       anObject.fuelByDistance = set.getBigDecimal(9);
       if (anObject.fuelByDistance != null){
        anObject.fuelByDistance = anObject.fuelByDistance.setScale(2, BigDecimal.ROUND_HALF_UP);
       }

       anObject.plan2CTypeRefCode = set.getInt(10);
       if (set.wasNull()){
        anObject.plan2CTypeRefCode = Integer.MIN_VALUE;
       }
       // plan2CTypeRefCountGen - левое обозначение реально вытягиваем поле profitrate (норма прибутку (10% от суммы затрат))
       anObject.plan2CTypeRefCountGen = set.getBigDecimal(11);
       if (anObject.plan2CTypeRefCountGen != null){
        anObject.plan2CTypeRefCountGen = anObject.plan2CTypeRefCountGen.setScale(2, BigDecimal.ROUND_HALF_UP);
       }
       // costTotal - левое обозначение реально вытягиваем поле costperkilometer (Вартість 1 км пробігу)
       anObject.costTotal = set.getBigDecimal(12);
       if (anObject.costTotal != null){
        anObject.costTotal = anObject.costTotal.setScale(2, BigDecimal.ROUND_HALF_UP);
       }

//     costDistance - левое обозначение реально вытягиваем поле fuelexpensesmachine (витрати на паливо для спец машин)
       anObject.costDistance = set.getBigDecimal(13);
       if (anObject.costDistance != null){
        anObject.costDistance = anObject.costDistance.setScale(2, BigDecimal.ROUND_HALF_UP);
       }
       anObject.commentPriceDistance = set.getString(14);



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



} // end of ENCalcTransportUsageDAO

