
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

import com.ksoe.energynet.dataminer.generated.ENCalcTransportUsageHourDAOGen;
import com.ksoe.energynet.valueobject.brief.ENCalcTransportUsageHourShort;
import com.ksoe.energynet.valueobject.filter.ENCalcTransportUsageHourFilter;
import com.ksoe.energynet.valueobject.lists.ENCalcTransportUsageHourShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENCalcTransportUsageHour;
  *
  */

public class ENCalcTransportUsageHourDAO extends ENCalcTransportUsageHourDAOGen {

//  public ENCalcTransportUsageHourDAO() {super();}
//  public ENCalcTransportUsageHourDAO(Connection aConnection) {super(aConnection);}
//  public ENCalcTransportUsageHourDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENCalcTransportUsageHourDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENCalcTransportUsageHourDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}
  
  /**
   * 
   * Получить лист объектов типа {@link ENCalcTransportUsageHourShort} по коду плана и транспорта
   * 
   * @param planCode код плана
   * @param transportCode код транспорта, может быть {@code null} или {@code Integer.MIN_VALUE} тогда выбируться
   * все объекты по коду плана
   * @return лист объектов {@link ENCalcTransportUsageHourShortList}
   * @throws PersistenceException
   */
  public ENCalcTransportUsageHourShortList getListByPlanAndTransportCode(int planCode, Integer transportCode) throws PersistenceException {
	  if(planCode == Integer.MIN_VALUE) {
		  throw new SystemException("Не заданий код плану!");
	  }
	  
	  ENCalcTransportUsageHourFilter filter = new ENCalcTransportUsageHourFilter();
	  filter.planRef.code = planCode;
	  if(transportCode != null) {
		  filter.tkTransportRef.code = transportCode;
	  }
	  return this.getScrollableFilteredList(filter, 0, -1);
  }
  
  public ENCalcTransportUsageHourShortList getList4Calculation(int planCode) throws PersistenceException
  {
	  ENCalcTransportUsageHourShortList result = new ENCalcTransportUsageHourShortList();
	  ENCalcTransportUsageHourShort anObject;
   result.list = new Vector<ENCalcTransportUsageHourShort>();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = " Select distinct " +
           " trpt.code as transpcode , " +
           " trpt.name as transpname , " +
           " coalesce(thist.TKSALARYDRIVER,0) as TKSALARYDRIVER  " +  /*Заработная плата водителя грн.мес*/
           " , thist.TKNORMHOURSMONTH as  TKNORMHOURSMONTH " + /*Норма тривалості  робочого часу за місяць*/
           " , coalesce(thist.TKTRANSPORTCOST,0) as TKTRANSPORTCOST " +  /*Вартість  машини (механізму)*/
           " , coalesce(thist.TKTRANSPORTYEARAMORT,0) as TKTRANSPORTYEARAMORT " +  /*Годовые амортизационные отчисления грн/год*/
           ", ( Select coalesce(coalesce(mark.rashodwork,0) * coalesce(m.costnkre,0),0) " +
           "      From tktransportmark mark , tkfueltype ft , tkmaterials m " +
           "     Where mark.code = trpt.transportmarkcode " +
           "      and mark.fueltypecode = ft.code " +
           "       and ft.materialrefcode = m.code " +
           "   ) as  TKTRANSPORTFUELCHARGE " + /* Витрати на паливо (для спеціальних  машин)*/
           " , ( select coalesce(tktransportmark.basicspeed,0)  from tktransportmark " +
           " where  tktransportmark.code = trpt.transportmarkcode  ) as basicspeedfrommark " +
           ",  ( Select case when (select tcc.isnotlicensedactivity " +
           " from enplanworkitem pi , tktechcard td , tkclassificationtype tcc " +
           " where pi.planrefcode = ? " +
           " and pi.kartarefcode = td.code " +
           " and td.classificationtypecode = tcc.code " +
           " order by  tcc.isnotlicensedactivity " +
           " limit 1) = 0 " +  /*если лецензированная работа тогда берем стоимость топлива нкре иначе альтернативну стоимость*/
           " THEN coalesce(m.costnkre,0) else coalesce(m.costalternative,0) end  " +
           " From tktransportmark mark , tkfueltype ft , tkmaterials m  " +
           " Where mark.code = trpt.transportmarkcode  " +
           " and mark.fueltypecode = ft.code  " +
           " and ft.materialrefcode = m.code  " +
           " )  as  fuelcostnkre " + /* стоимость топлива НКРЭ */
           ", ( select coalesce(tktransportmark.rashodprobeg,0) from tktransportmark " +
           " where  tktransportmark.code = trpt.transportmarkcode ) as rashodprobeg " +
           ", ( select coalesce(tktransportmark.transporttypecode,0) from tktransportmark " +
           " where  tktransportmark.code = trpt.transportmarkcode ) as transporttypecode " +
           " , coalesce(thist.annualrepaircostsprcnt,0) as annualrepaircostsprcnt " +
           " From tktransport trpt  , entransportitem tri , enplanworkitem pi ,  tktechcard tkd, " +
           " tktransporthistory thist , enplanwork p    " +
           " where trpt.code = tri.transportcode  " +
           " and tri.planrefcode = ?  " +
           " and pi.code = tri.planitemrefcode " +
           " and pi.kartarefcode = tkd.code " +
           " and thist.tktransportcode = trpt.code " +
           " and p.code = pi.planrefcode " +
           " and p.datestart::date between thist.datefrom and coalesce(thist.dateto,'31.12.9999')";

//   selectStr =   " Select distinct  \n" +
//   "        trpt.code as transpcode ,  \n" +
//   "        trpt.name as transpname ,  \n" +
//   "        coalesce(trpt.TKSALARYDRIVER,0) as TKSALARYDRIVER /*Заработная плата  \n" +
//   " водителя грн.мес*/  \n" +
//   "        , trpt.TKNORMHOURSMONTH as  TKNORMHOURSMONTH /*Норма тривалості  \n" +
//   " робочого часу за місяць*/				 \n" +
//   "        , coalesce(trpt.TKTRANSPORTCOST,0) as TKTRANSPORTCOST  /*Вартість  \n" +
//   " машини (механізму)*/				 \n" +
//   "        , coalesce(TKTRANSPORTYEARAMORT,0) as TKTRANSPORTYEARAMORT  \n" +
//   " /*Годовые амортизационные отчисления грн/год*/ \n" +
//   "        , ( Select coalesce(coalesce(mark.rashodwork,0) * coalesce(m.costnkre,0),0) \n" +
//   "              From tktransportmark mark , tkfueltype ft , tkmaterials m              \n" +
//   "             Where mark.code = trpt.transportmarkcode  \n" +
//   "               and mark.fueltypecode = ft.code  \n" +
//   "               and ft.materialrefcode = m.code             \n" +
//   "           ) as  TKTRANSPORTFUELCHARGE /* Витрати на паливо (для спеціальних  машин)*/  \n" +
//   "  \n" +
//   "  , ( select coalesce(tktransportmark.basicspeed,0)  from tktransportmark where  tktransportmark.code = trpt.transportmarkcode  ) as basicspeedfrommark \n" +
//   " ,  ( Select case when (select tcc.isnotlicensedactivity from enplanworkitem pi , tktechcard td , tkclassificationtype tcc \n" +
//   "        where pi.planrefcode = ? \n" +
//   "        and pi.kartarefcode = td.code  \n" +
//   "        and td.classificationtypecode = tcc.code \n" +
//   "        order by  tcc.isnotlicensedactivity \n" +
//   "        limit 1) = 0 /*если лецензированная работа тогда берем стоимость топлива нкре иначе альтернативну стоимость*/  \n" +
//   "       THEN coalesce(m.costnkre,0) else coalesce(m.costalternative,0) end  \n" +
//   "       From tktransportmark mark , tkfueltype ft , tkmaterials m              \n" +
//   "      Where mark.code = trpt.transportmarkcode  \n" +
//   "        and mark.fueltypecode = ft.code  \n" +
//   "        and ft.materialrefcode = m.code       \n" +
//   " )  as  fuelcostnkre /* стоимость топлива НКРЭ */ \n" +
//   "  , ( select coalesce(tktransportmark.rashodprobeg,0) from tktransportmark where  tktransportmark.code = trpt.transportmarkcode ) as rashodprobeg  \n" +
//   "  , ( select coalesce(tktransportmark.transporttypecode,0) from tktransportmark where  tktransportmark.code = trpt.transportmarkcode ) as transporttypecode  \n" +
//   "  From tktransport trpt  , entransportitem tri , enplanworkitem pi ,  tktechcard tkd   \n" +
////   " tkclassificationtype tcl   \n" +
//   "  where trpt.code = tri.transportcode  \n" +
//   "    and tri.planrefcode = ? /*500134699*/  \n" +
//   "    and pi.code = tri.planitemrefcode  \n" +
//   "    and pi.kartarefcode = tkd.code  \n" ;
   //"    and tkd.classificationtypecode = tcl.code  \n" ;
;

   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1, planCode);
     statement.setInt(2, planCode);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       anObject = new ENCalcTransportUsageHourShort();

       anObject.tkTransportRefCode = set.getInt(1);
       if (set.wasNull()){
    	   anObject.tkTransportRefCode = Integer.MIN_VALUE;
       }

       anObject.tkTransportRefName = set.getString(2);

       anObject.salaryMonthDriver = set.getBigDecimal(3);
       if (anObject.salaryMonthDriver != null){
    	   anObject.salaryMonthDriver = anObject.salaryMonthDriver.setScale(2, BigDecimal.ROUND_HALF_UP);
       }
       anObject.normWorkTimeMonth = set.getBigDecimal(4);
       if (anObject.normWorkTimeMonth != null){
    	   anObject.normWorkTimeMonth = anObject.normWorkTimeMonth.setScale(2, BigDecimal.ROUND_HALF_UP);
       }
       anObject.costMachine = set.getBigDecimal(5);
       if (anObject.costMachine != null){
    	   anObject.costMachine = anObject.costMachine.setScale(2, BigDecimal.ROUND_HALF_UP);
       }
       anObject.amortizationYearMachine = set.getBigDecimal(6);
       if (anObject.amortizationYearMachine != null){
    	   anObject.amortizationYearMachine = anObject.amortizationYearMachine.setScale(2, BigDecimal.ROUND_HALF_UP);
       }
       anObject.fuelExpensesMachine = set.getBigDecimal(7);
       if (anObject.fuelExpensesMachine != null){
    	   anObject.fuelExpensesMachine = anObject.fuelExpensesMachine.setScale(2, BigDecimal.ROUND_HALF_UP);
       }
       // productionCosts - левое обозначение , на самом деле имели ввиду basicspeed c марки машины
       anObject.productionCosts = set.getBigDecimal(8);
       if (anObject.productionCosts != null){
    	   anObject.productionCosts = anObject.productionCosts.setScale(2, BigDecimal.ROUND_HALF_UP);
       }
//     costPerKilometer - левое обозначение , на самом деле имели ввиду costnkre c материалов (бензин)
       anObject.costPerKilometer  = set.getBigDecimal(9);
       if (anObject.costPerKilometer != null){
    	   anObject.costPerKilometer = anObject.costPerKilometer.setScale(2, BigDecimal.ROUND_HALF_UP);
       }

//     salaryTotalHourDriver - левое обозначение , на самом деле имели ввиду costnkre c материалов (бензин)
       anObject.salaryTotalHourDriver  = set.getBigDecimal(10);
       if (anObject.salaryTotalHourDriver != null){
    	   anObject.salaryTotalHourDriver = anObject.salaryTotalHourDriver.setScale(2, BigDecimal.ROUND_HALF_UP);
       }
//     planRefMonthGen - левое обозначение , на самом деле имели ввиду тип транспорта
       anObject.planRefMonthGen  = set.getInt(11);
       if (set.wasNull()){
    	   anObject.planRefMonthGen = Integer.MIN_VALUE;
       }
       anObject.annualRepairCostsPercent = set.getBigDecimal(12);
       if(anObject.annualRepairCostsPercent != null) {
    	   anObject.annualRepairCostsPercent = anObject.annualRepairCostsPercent.setScale(2, BigDecimal.ROUND_HALF_UP);
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





} // end of ENCalcTransportUsageHourDAO

