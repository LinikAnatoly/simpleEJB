
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENGiveCounterDAOGen;
import com.ksoe.energynet.valueobject.ENGiveCounter;
import com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.brief.ENGiveCounterShort;
import com.ksoe.energynet.valueobject.filter.ENGiveCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENGiveCounterShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENGiveCounter;
  *
  */

public class ENGiveCounterDAO extends ENGiveCounterDAOGen {

  public ENGiveCounterDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENGiveCounterDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


	@Override
	public ENGiveCounterShortList getScrollableFilteredList(ENGiveCounter aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {

    ENGiveCounterShortList result = new ENGiveCounterShortList();
    ENGiveCounterShort anObject;
    result.list = new Vector<ENGiveCounterShort>();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENGIVECOUNTER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENGIVECOUNTER.CODE"+
     ",ENGIVECOUNTER.COUNTERTYPE"+
     ",ENGIVECOUNTER.SERIALNUMBER"+
     ",ENGIVECOUNTER.COMMENTGEN"+

      ", ENPLANWORK2CLASSFCTNTP.CODE " +
      ", ENPLANWORK2CLASSFCTNTP.COUNTGEN " +
      ", ENPLANWORK2CLASSFCTNTP.USERGEN " +
      ", ENPLANWORK2CLASSFCTNTP.DATEEDIT " +
      ", ENPLANWORK2CLASSFCTNTP.MACHINEHOURS " +
      ", ENPLANWORK2CLASSFCTNTP.RELOCATIONKM " +
      ", ENPLANWORK2CLASSFCTNTP.TRANSPORTATIONLOAD " +
      ", ENPLANWORK2CLASSFCTNTP.ISPRINTONKMORMH " +
      ", ENPLANWORK2CLASSFCTNTP.COSTWORKSCONTRACTOR " +
      ", ENPLANWORK2CLASSFCTNTP.DATEGEN " +
      ", ENPLANWORK2CLASSFCTNTP.TIMESTART " +
      ", ENPLANWORK2CLASSFCTNTP.TIMEFINAL " +
      ", ENPLANWORK2CLASSFCTNTP.CODEVIRTUALBRIGADE " +
      ", ENPLANWORK2CLASSFCTNTP.ISJOBSBYTIME " +
      ", ENPLANWORK2CLASSFCTNTP.ISVISITCLIENT " +
      ", ENSERVICESOBJECT.CODE " +
      ", ENSERVICESOBJECT.CONTRACTNUMBER " +
      ", ENSERVICESOBJECT.CONTRACTDATE " +
      ", ENSERVICESOBJECT.NAME " +
      ", ENSERVICESOBJECT.PARTNERCODE " +
      ", ENSERVICESOBJECT.FINDOCCODE " +
      ", ENSERVICESOBJECT.FINDOCID " +
      ", ENSERVICESOBJECT.COMMENTGEN " +
      ", ENSERVICESOBJECT.CONTRACTNUMBERSERVICES " +
      ", ENSERVICESOBJECT.CONTRACTDATESERVICES " +
      ", ENSERVICESOBJECT.CONTRAGENTNAME " +
      ", ENSERVICESOBJECT.CONTRAGENTADDRESS " +
      ", ENSERVICESOBJECT.CONTRAGENTADDRESSWORK " +
      ", ENSERVICESOBJECT.CONTRAGENTOKPO " +
      ", ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT " +
      ", ENSERVICESOBJECT.CONTRAGENTBANKNAME " +
      ", ENSERVICESOBJECT.CONTRAGENTBANKMFO " +
      ", ENSERVICESOBJECT.CONTRAGENTBOSSNAME " +
      ", ENSERVICESOBJECT.CONTRAGENTPASSPORT " +
      ", ENSERVICESOBJECT.CONTRACTSERVICESSUMMA " +
      ", ENSERVICESOBJECT.CONTRACTSERVICESPOWER " +
      ", ENSERVICESOBJECT.COMMENTSERVICESGEN " +
      ", ENSERVICESOBJECT.CONTRACTSERVICESDISTNC " +
      ", ENSERVICESOBJECT.CONTRACTSERVICESDAY " +
      ", ENSERVICESOBJECT.USERGEN " +
      ", ENSERVICESOBJECT.DATEEDIT " +
      ", ENSERVICESOBJECT.WARRANTDATE " +
      ", ENSERVICESOBJECT.WARRANTNUMBER " +
      ", ENSERVICESOBJECT.WARRANTFIO " +
      ", ENSERVICESOBJECT.REGIONALTYPE " +
      ", ENSERVICESOBJECT.BASISTYPE " +
      ", ENSERVICESOBJECT.CONTRAGENTPOSITION " +
      ", ENSERVICESOBJECT.EXECUTEWORKDATE " +
      ", ENSERVICESOBJECT.TIMESTART " +
      ", ENSERVICESOBJECT.TIMEFINAL " +
      ", ENSERVICESOBJECT.CONTRAGENTPHONENUMBER " +
      ", ENSERVICESOBJECT.EXECUTORPHONENUMBER " +
      ", ENSERVICESOBJECT.CONTRAGENTOBJECTWORK " +
      ", ENSERVICESOBJECT.ISNOPAY " +
      ", ENSERVICESOBJECT.ISCUSTOMERMATERIALS " +
      ", ENSERVICESOBJECT.PAYDATE " +
      ", ENSERVICESOBJECT.FINPAYFORMCODE " +
      ", ENSERVICESOBJECT.FINPAYFORMNAME " +
      ", ENSERVICESOBJECT.PARTNERID " +
      ", ENSERVICESOBJECT.PAYDETAIL " +
      ", ENSERVICESOBJECT.ACTTRANSFERNUMBER " +
      ", ENSERVICESOBJECT.ACTTRANSFERDATE " +
      ", ENSERVICESOBJECT.RESPOSIBLE " +
      ", ENSERVICESOBJECT.RESPOSIBLEPOSITION " +
      ", ENSERVICESOBJECT.RESPOSIBLETABNUMBER " +
	", ENGIVECOUNTER.COST " +
	", ENGIVECOUNTER.VAT " +
	", ENGIVECOUNTER.MOLCODE " +
	", ENGIVECOUNTER.MOLNAME " +
	", ENGIVECOUNTER.DATEBUILD " +
	", ENGIVECOUNTER.PHASITY "+

      " FROM ENGIVECOUNTER " +
      ", ENPLANWORK2CLASSFCTNTP " +
      ", ENSERVICESOBJECT " +

  	  "";
      whereStr = " ENPLANWORK2CLASSFCTNTP.CODE = ENGIVECOUNTER.PLAN2CLTYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENSERVICESOBJECT.CODE = ENGIVECOUNTER.SERVICESOBJECTREFCODE" ; //+
		//selectStr = selectStr + " ${s} ENGIVECOUNTER.CODE IN ( SELECT ENGIVECOUNTER.CODE FROM ENGIVECOUNTER ";

		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);

// + " WHERE" +  сделано выше ????
     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE " + whereStr;

    // selectStr = selectStr + ") ";

    selectStr = selectStr + " ORDER BY " + orderBy;

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = setParameters(aFilterObject, statement);

      if(condition.length() > 0 && aBindObjects != null)
       _bindObjectsToPreparedStatement(statement,aBindObjects,number);

      set = statement.executeQuery();
      int i;
      for(i = 0;set.next();i++)
       {
        if(i < fromPosition)
         continue;
        else if(i >= fromPosition + quantity)
         {
          i++;
          break;
         }

        anObject = new ENGiveCounterShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.counterType = set.getString(2);
        anObject.serialNumber = set.getString(3);
        anObject.commentGen = set.getString(4);

        anObject.plan2ClTypeRefCode = set.getInt(5);
		if(set.wasNull())
		   anObject.plan2ClTypeRefCode = Integer.MIN_VALUE;
        anObject.plan2ClTypeRefCountGen = set.getBigDecimal(6);
        if(anObject.plan2ClTypeRefCountGen != null)
          anObject.plan2ClTypeRefCountGen = anObject.plan2ClTypeRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.plan2ClTypeRefUserGen = set.getString(7);
        anObject.plan2ClTypeRefDateEdit = set.getDate(8);
        anObject.plan2ClTypeRefMachineHours = set.getBigDecimal(9);
        if(anObject.plan2ClTypeRefMachineHours != null)
          anObject.plan2ClTypeRefMachineHours = anObject.plan2ClTypeRefMachineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.plan2ClTypeRefRelocationKm = set.getBigDecimal(10);
        if(anObject.plan2ClTypeRefRelocationKm != null)
          anObject.plan2ClTypeRefRelocationKm = anObject.plan2ClTypeRefRelocationKm.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.plan2ClTypeRefTransportationLoad = set.getBigDecimal(11);
        if(anObject.plan2ClTypeRefTransportationLoad != null)
          anObject.plan2ClTypeRefTransportationLoad = anObject.plan2ClTypeRefTransportationLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.plan2ClTypeRefIsPrintOnKmOrMH = set.getInt(12);
		if(set.wasNull())
		   anObject.plan2ClTypeRefIsPrintOnKmOrMH = Integer.MIN_VALUE;
        anObject.plan2ClTypeRefCostWorksContractor = set.getBigDecimal(13);
        if(anObject.plan2ClTypeRefCostWorksContractor != null)
          anObject.plan2ClTypeRefCostWorksContractor = anObject.plan2ClTypeRefCostWorksContractor.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.plan2ClTypeRefDateGen = set.getDate(14);
        anObject.plan2ClTypeRefTimeStart = set.getTimestamp(15);
        anObject.plan2ClTypeRefTimeFinal = set.getTimestamp(16);
        anObject.plan2ClTypeRefCodeVirtualBrigade = set.getInt(17);
		if(set.wasNull())
		   anObject.plan2ClTypeRefCodeVirtualBrigade = Integer.MIN_VALUE;
        anObject.plan2ClTypeRefIsJobsByTime = set.getInt(18);
		if(set.wasNull())
		   anObject.plan2ClTypeRefIsJobsByTime = Integer.MIN_VALUE;
        anObject.plan2ClTypeRefIsVisitClient = set.getInt(19);
		if(set.wasNull())
		   anObject.plan2ClTypeRefIsVisitClient = Integer.MIN_VALUE;
        anObject.servicesObjectRefCode = set.getInt(20);
		if(set.wasNull())
		   anObject.servicesObjectRefCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefContractNumber = set.getString(21);
        anObject.servicesObjectRefContractDate = set.getDate(22);
        anObject.servicesObjectRefName = set.getString(23);
        anObject.servicesObjectRefPartnerCode = set.getString(24);
        anObject.servicesObjectRefFinDocCode = set.getString(25);
        anObject.servicesObjectRefFinDocID = set.getInt(26);
		if(set.wasNull())
		   anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
        anObject.servicesObjectRefCommentGen = set.getString(27);
        anObject.servicesObjectRefContractNumberServices = set.getString(28);
        anObject.servicesObjectRefContractDateServices = set.getDate(29);
        anObject.servicesObjectRefContragentName = set.getString(30);
        anObject.servicesObjectRefContragentAddress = set.getString(31);
        anObject.servicesObjectRefContragentAddressWork = set.getString(32);
        anObject.servicesObjectRefContragentOkpo = set.getString(33);
        anObject.servicesObjectRefContragentBankAccount = set.getString(34);
        anObject.servicesObjectRefContragentBankName = set.getString(35);
        anObject.servicesObjectRefContragentBankMfo = set.getString(36);
        anObject.servicesObjectRefContragentBossName = set.getString(37);
        anObject.servicesObjectRefContragentPassport = set.getString(38);
        anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(39);
        if(anObject.servicesObjectRefContractServicesSumma != null)
          anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(40);
        if(anObject.servicesObjectRefContractServicesPower != null)
          anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefCommentServicesGen = set.getString(41);
        anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(42);
        if(anObject.servicesObjectRefContractServicesDistance != null)
          anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(43);
        if(anObject.servicesObjectRefContractServicesDay != null)
          anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefUserGen = set.getString(44);
        anObject.servicesObjectRefDateEdit = set.getDate(45);
        anObject.servicesObjectRefWarrantDate = set.getDate(46);
        anObject.servicesObjectRefWarrantNumber = set.getString(47);
        anObject.servicesObjectRefWarrantFIO = set.getString(48);
        anObject.servicesObjectRefRegionalType = set.getInt(49);
		if(set.wasNull())
		   anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
        anObject.servicesObjectRefBasisType = set.getBigDecimal(50);
        if(anObject.servicesObjectRefBasisType != null)
          anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContragentPosition = set.getString(51);
        anObject.servicesObjectRefExecuteWorkDate = set.getDate(52);
        anObject.servicesObjectRefTimeStart = set.getTimestamp(53);
        anObject.servicesObjectRefTimeFinal = set.getTimestamp(54);
        anObject.servicesObjectRefContragentPhoneNumber = set.getString(55);
        anObject.servicesObjectRefExecutorPhoneNumber = set.getString(56);
        anObject.servicesObjectRefContragentObjectWork = set.getString(57);
        anObject.servicesObjectRefIsNoPay = set.getInt(58);
		if(set.wasNull())
		   anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
        anObject.servicesObjectRefIsCustomerMaterials = set.getInt(59);
		if(set.wasNull())
		   anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDate = set.getDate(60);
        anObject.servicesObjectRefFinPayFormCode = set.getInt(61);
		if(set.wasNull())
		   anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefFinPayFormName = set.getString(62);
        anObject.servicesObjectRefPartnerId = set.getInt(63);
		if(set.wasNull())
		   anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDetail = set.getString(64);
        anObject.servicesObjectRefActTransferNumber = set.getString(65);
        anObject.servicesObjectRefActTransferDate = set.getDate(66);
        anObject.servicesObjectRefResposible = set.getString(67);
        anObject.servicesObjectRefResposiblePosition = set.getString(68);
        anObject.servicesObjectRefResposibleTabNumber = set.getString(69);
	anObject.cost = set.getBigDecimal(70);
	anObject.vat = set.getBigDecimal(71);
	anObject.molCode = set.getString(72);
	anObject.molName = set.getString(73);
	anObject.dateBuild = set.getDate(74);
	anObject.phasity = set.getInt(75);
	if(set.wasNull()) {
		anObject.phasity = Integer.MIN_VALUE;
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


  /**
   *
   * Возвращает счетчик введенный на договоре по серийному и договору
   *
   * @param serialNumber заводской (серийный номер счетчика)
   * @param soCode код договора {@link ENServicesObject}
   * @return {@link ENGiveCounter} счетчик введенный в договоре
   * @throws PersistenceException
   */
  public ENGiveCounter getGiveCounterBySerialNumberAndServicesObject(String serialNumber, int soCode) throws PersistenceException {
	  if(soCode == Integer.MIN_VALUE || serialNumber == null) throw new java.lang.NullPointerException();

	  ENGiveCounterFilter filter = new ENGiveCounterFilter();
	  filter.servicesObjectRef.code = soCode;
	  filter.serialNumber = serialNumber;

	  int[] codes = this.getFilteredCodeArray(filter, 0, -1);

	  if(codes.length != 1) {
		  throw new SystemException(String.format(" Помилка у кількості лічильників для договору %d всього лічильників із серійним № %s - %d"
				  , soCode, serialNumber, codes.length));
	  }

	  return this.getObject(codes[0]);
  }
  
  /**
   * 
   * Возвращает лист переданных счетчиков по коду объекта {@link ENPlanWork2ClassificationType}
   * 
   * @param plan2ClassificationTypeCode код объекта {@link ENPlanWork2ClassificationType}
   * @return лист переданных счетчиков
   * @throws PersistenceException
   */
  public ENGiveCounterShortList getCountersByPlan2ClassificationTypeCode(int plan2ClassificationTypeCode) throws PersistenceException {
	  if(plan2ClassificationTypeCode == Integer.MIN_VALUE) throw new java.lang.NullPointerException("Не заданий код калькуляції!");
	  ENGiveCounterFilter filter = new ENGiveCounterFilter();
	  filter.plan2ClTypeRef.code = plan2ClassificationTypeCode;
	  return this.getScrollableFilteredList(filter, 0, -1);
  }



} // end of ENGiveCounterDAO

