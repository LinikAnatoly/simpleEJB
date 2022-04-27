
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.AbstractMap;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.xml.ws.BindingProvider;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.valueobject.Config;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.ContractLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENActIncomeCreatMetod;
import com.ksoe.energynet.valueobject.ENAgreementKind;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENServicesContractKind;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObject2TechCondtnsServices;
import com.ksoe.energynet.valueobject.ENServicesObjectCalcType;
import com.ksoe.energynet.valueobject.ENServicesObjectStatus;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.SCCounterStatus;
import com.ksoe.energynet.valueobject.brief.ENMetrologyCounterShort;
import com.ksoe.energynet.valueobject.brief.ENServicesObjectShort;
import com.ksoe.energynet.valueobject.brief.ENWarrant4DepartmentShort;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2TechCondtnsServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENWarrant4DepartmentFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectShortList;
import com.ksoe.energynet.valueobject.lists.ENWarrant4DepartmentShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;
import com.ksoe.mdax.services.rcontracttableksservice.AXContractFinder;
import com.ksoe.mdax.util.WebServicesConsts;
import com.ksoe.techcard.logic.TKConsts;
import com.ksoe.techcard.valueobject.TKReplaceCounterKind;
import com.microsoft.schemas.dynamics._2006._02.documents.querycriteria.Operator;
import com.microsoft.schemas.dynamics._2008._01.services.RContractTableKSService;
import com.microsoft.schemas.dynamics._2008._01.services.RContractTableKSService_Service;

  /**
  *  DAO Object for ENServicesObject;
  *
  */

public class ENServicesObjectDAO extends ENServicesObjectDAOGen {

	public ENServicesObjectDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENServicesObjectDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}



	public ENServicesObjectShortList getContractList(
			ENServicesObjectFilter aFilterObject, int fromPosition, int quantity)
			throws PersistenceException {

		return getContractList(aFilterObject, fromPosition, quantity, false, false);
	}

	public ENServicesObjectShortList getContractList(
			ENServicesObjectFilter aFilterObject, int fromPosition, int quantity, boolean useMDaxData)
			throws PersistenceException {

		return getContractList(aFilterObject, fromPosition, quantity, useMDaxData, false);
	}

	public ENServicesObjectShortList getContractList(
			ENServicesObjectFilter aFilterObject, int fromPosition, int quantity, boolean useMDaxData, boolean isFromFK)
			throws PersistenceException {
		return getContractList( aFilterObject, fromPosition, quantity, useMDaxData, isFromFK, false);
	}

	/**
	 *
	 * @param aFilterObject
	 * @param fromPosition
	 * @param quantity
	 * @param useMDaxData
	 * @param isFromFK
	 * @param isShowChild - если true, то отобразить дополнительные договора (SUPP-82846)
	 * @return
	 * @throws PersistenceException
	 */
	public ENServicesObjectShortList getContractList(
			ENServicesObjectFilter aFilterObject, int fromPosition, int quantity, boolean useMDaxData, boolean isFromFK, boolean isShowChild)
			throws PersistenceException {

		ENServicesObjectShortList result = new ENServicesObjectShortList();
		ENServicesObjectShort anObject;
		result.list = new Vector<ENServicesObjectShort>();

        String     selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet  set = null;
        String     whereStr;
        //String     whereStr = " a.id = l.agree_id and l.partner_id = p.id and a.status = 'A' and a.io_flag = 'S' and a.agree_group_id in (205, 342, 319, 88) "; // чуть шо добавть группы если не будут нужных договоров


        if(getUserProfile() == null)
        	throw new PersistenceException("Internal Error (User Profile Is Undefined)");

        //SUPP-82846 - isShowChild (Отображение дополнительных договоров)
        if(getUserProfile().userName.equals("energynet") || aFilterObject.isActive == 1 ) {
        	whereStr = " a.id = l.agree_id and l.partner_id = p.id " + (isShowChild ? "" : " and a.parent_id is null ");
        } else {
        	whereStr = " a.id = l.agree_id and l.partner_id = p.id and a.status = 'A' " + (isShowChild ? "" : " and a.parent_id is null ");
        }


        String     condition = (aFilterObject.conditionSQL == null  ? "" : aFilterObject.conditionSQL);


        String     orderBy = (aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL );

        if(quantity < 0)
            quantity = Integer.MAX_VALUE/2;

        if(orderBy.length() == 0)
        orderBy = "a.in_date desc, a.in_num, p.name";


		AuthLogic netAuth = new AuthLogic(getConnection(), getUserProfile());
		boolean useMDAXSelectContract = (netAuth.checkUsesMDAXData(Config.CONFIG_USES_MDAX_CONTRACT));

    	if ((useMDAXSelectContract || useMDaxData) && !isFromFK) {

	        RContractTableKSService_Service rContractService = new RContractTableKSService_Service();
	        RContractTableKSService rContractProxy = rContractService.getBasicHttpBindingRContractTableKSService();
	        ((BindingProvider) rContractProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, WebServicesConsts.userName);
	        ((BindingProvider) rContractProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, WebServicesConsts.userPass);

	        /**  обработка servicesFilter  */
	        AXContractFinder contractFinder = new AXContractFinder(rContractProxy);

			if (aFilterObject != null
					&& aFilterObject.contractNumber != null) {
				contractFinder.parmCriteria("RContractTable", "RContractNumber", Operator.EQUAL, aFilterObject.contractNumber, "");
			}

			if (aFilterObject != null
					&& aFilterObject.axContractAccount != null) {
				contractFinder.parmCriteria("RContractTable", "RCONTRACTACCOUNT", Operator.EQUAL, aFilterObject.axContractAccount, "");
			}

			if (aFilterObject != null
					&& aFilterObject.partnerCode != null) {
				contractFinder.parmCriteria("RContractTable", "RContractPartnerCode", Operator.EQUAL, aFilterObject.partnerCode, "");
			}

			if (aFilterObject != null
					&& aFilterObject.finDocCode != null) {
				contractFinder.parmCriteria("RContractTable", "ExtCode_UA", Operator.EQUAL, aFilterObject.finDocCode, "");
			}

			/** не выбираем закрытые договора */
			// contractFinder.parmCriteria("RContractTable", "Stage_UA", Operator.EQUAL, "ACTIVE", "");

    		return contractFinder.getAXContractList();
    	}


        // select a.id, a.code "Код_договора", a.in_num "Номер_договора", a.in_date "Дата_договора",  a.description "Описание", p.code "Код_партнера", p.name "Наименование_партнера"
        /// 04.11.11
        /*
        selectStr = " select a.id, a.code , a.in_num , a.in_date , a.description , p.code , p.name " +
                    "from sprav.agree a, sprav.agree_partner_link l, sprav.partner p " +
                    " " ;
        */
        selectStr = " select a.id, a.code , a.in_num , a.in_date , a.description , p.code , p.name, " +
                    " a.reg_date, a.start_date " + // Дата регистрации договора и Дата начала действия договора
                    ", p.id as partnerid " + // id партнера
                    ", a.end_date " + // дата окончания договора
                    ", a.SUMMA "+	//Сумма договора: Собственная
                    " from sprav.agree a, sprav.agree_partner_link l, sprav.partner p ";
        ///

        if(aFilterObject != null)
        {

            ///// 21.09.11
            if(aFilterObject.finDocID != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  a.id = ?";
            }
            if (aFilterObject.finDocCode != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
                    whereStr = whereStr + "  UPPER(a.code) = UPPER(?)";
                else
                    whereStr = whereStr + " UPPER(a.code) LIKE UPPER(?)";
            }
            /////

            if (aFilterObject.contractNumber != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
                    whereStr = whereStr + "  UPPER(a.in_num) = UPPER(?)";
                else
                    whereStr = whereStr + " UPPER(a.in_num) LIKE UPPER(?)";
            }

            if(aFilterObject.contractDate != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  a.in_date = ?";
            }

            if (aFilterObject.name != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                    whereStr = whereStr + "  UPPER(p.name) = UPPER(?)";
                else
                    whereStr = whereStr + " UPPER(p.name) LIKE UPPER(?)";
            }


            if (aFilterObject.commentGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                    whereStr = whereStr + "  UPPER(a.description) = UPPER(?)";
                else
                    whereStr = whereStr + " UPPER(a.description) LIKE UPPER(?)";
            }

            if (aFilterObject.partnerCode != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
                    whereStr = whereStr + "  UPPER(p.code) = UPPER(?)";
                else
                    whereStr = whereStr + " UPPER(p.code) LIKE UPPER(?)";
            }
        }



        if(condition.length() != 0)
        {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";

            whereStr = whereStr + " (" + condition + ")";
        }
//     + " WHERE" +  сделано выше ????
        if(whereStr.length() != 0)
            selectStr = selectStr + " WHERE" + whereStr;

        // selectStr = selectStr + ") ";

        selectStr = selectStr + " ORDER BY " + orderBy;

        try
        {
        statement = connection.prepareStatement(selectStr);
        int number = 0;
        if(aFilterObject != null){

            ///// 21.09.11
            if(aFilterObject.finDocID != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.finDocID);
            }
            if(aFilterObject.finDocCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.finDocCode);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            /////

            if(aFilterObject.contractNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.contractNumber);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            if(aFilterObject.contractDate != null){
                number++;
                statement.setDate(number,new java.sql.Date(aFilterObject.contractDate.getTime()));
            }

            if(aFilterObject.name != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.name);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.commentGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.commentGen);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.partnerCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.partnerCode);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }


        }



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

            //  select a.id, a.code "Код_договора", a.in_num "Номер_договора",
            //  a.in_date "Дата_договора",  a.description "Описание",
            //  p.code "Код_партнера", p.name "Наименование_партнера"


            anObject = new ENServicesObjectShort();

            anObject.finDocID = set.getInt(1);
            anObject.finDocCode = set.getString(2);

            anObject.contractNumber = set.getString(3);
            anObject.contractDate = set.getDate(4);
            anObject.commentGen = set.getString(5);
            anObject.partnerCode = set.getString(6);
            anObject.name = set.getString(7);

            /// 04.11.11
            anObject.contractRegDate = set.getDate(8);
            anObject.contractStartDate = set.getDate(9);
            ///

            anObject.partnerId = set.getInt(10);

            // дата окончания договора
            anObject.dateEdit = set.getDate(11);
            //Сумма договора: Собственная
            anObject.contractSumma = set.getBigDecimal(12);


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
  * Возвращает сумму по договору
  *
  * @param int findocid - код договора из ФК
  * @param int orgid - код поставщика из ФК
  */
  public BigDecimal getSummaByContract(int findocid , int orgid ) throws PersistenceException
  {
      Connection connection = getConnection();

     String sql = " select sum(a.summa) as sumgrn from  sprav.agree a , sprav.agree_partner_link apl  ,  sprav.partner p \n" +
          " where a.id = apl.agree_id \n" +
          " and p.id = apl.partner_id \n" +
          " and a.id = " + findocid + " \n" +
          " and p.id = " + orgid ;


     PreparedStatement statement = null;
     ResultSet  resultSet = null;

     BigDecimal out = new BigDecimal(100);

     try {



         statement = connection.prepareStatement(sql);

         resultSet = statement.executeQuery();

         while(resultSet.next())
         {
             out = resultSet.getBigDecimal(1);
         }


         return out;
     }

         catch (SQLException e) {
             throw new PersistenceException(e.getMessage());

     }
         catch (Exception e) {
             throw new PersistenceException("Error in method getSummaByContract()", e);

     }
         finally {
         try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
         try {if (statement != null) statement.close();} catch (SQLException e) {}

     }

  }

  @Override
public void remove(int uid)  throws PersistenceException
  {

    ENServicesObject obj = getObject(uid);
    super.remove(uid);

    ENElementDAO eDao = new ENElementDAO(super.getConnection(), super.getUserProfile() );
    eDao.remove(obj.element.code);
  }


	@Override
	public ENServicesObjectShortList getScrollableFilteredList(
	ENServicesObject aFilterObject, String anCondition, String anOrderBy,
			int fromPosition, int quantity, Vector<? extends Object> aBindObjects)
			throws PersistenceException {
		ENServicesObjectShortList result = new ENServicesObjectShortList();
		ENServicesObjectShort anObject;
		result.list = new Vector<ENServicesObjectShort>();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSERVICESOBJECT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENSERVICESOBJECT.CODE"+
     ",ENSERVICESOBJECT.CONTRACTNUMBER"+
     ",ENSERVICESOBJECT.CONTRACTDATE"+
     ",ENSERVICESOBJECT.NAME"+
     ",ENSERVICESOBJECT.PARTNERCODE"+
     ",ENSERVICESOBJECT.FINDOCCODE"+
     ",ENSERVICESOBJECT.FINDOCID"+
     ",ENSERVICESOBJECT.COMMENTGEN"+
     ",ENSERVICESOBJECT.CONTRACTNUMBERSERVICES"+
     ",ENSERVICESOBJECT.CONTRACTDATESERVICES"+      // 10
     ",ENSERVICESOBJECT.CONTRAGENTNAME"+
     ",ENSERVICESOBJECT.CONTRAGENTADDRESS"+
     ",ENSERVICESOBJECT.CONTRAGENTADDRESSWORK"+
     ",ENSERVICESOBJECT.CONTRAGENTOKPO"+
     ",ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT"+
     ",ENSERVICESOBJECT.CONTRAGENTBANKNAME"+
     ",ENSERVICESOBJECT.CONTRAGENTBANKMFO"+
     ",ENSERVICESOBJECT.CONTRAGENTBOSSNAME"+
     ",ENSERVICESOBJECT.CONTRAGENTPASSPORT"+
     ",ENSERVICESOBJECT.CONTRACTSERVICESSUMMA"+     // 20
     ",ENSERVICESOBJECT.CONTRACTSERVICESPOWER"+
     ",ENSERVICESOBJECT.COMMENTSERVICESGEN"+
     ",ENSERVICESOBJECT.CONTRACTSERVICESDISTNC"+
     ",ENSERVICESOBJECT.CONTRACTSERVICESDAY"+
     ",ENSERVICESOBJECT.USERGEN"+
     ",ENSERVICESOBJECT.DATEEDIT"+                  // 26

      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENSERVICESOBJECT.ELEMENTCODE " +
      // ", ENELEMENT.CODE " +                         // 31

      ", (SELECT ENSERVICESCONTRACTSTTS.CODE FROM ENSERVICESCONTRACTSTTS WHERE ENSERVICESCONTRACTSTTS.CODE = ENSERVICESOBJECT.CONTRACTSTATUSREFCODE)" +

      ", (SELECT case when(enservicescontractstts.code = " + ENServicesContractStatus.BUDGETAPPROVED +
      "            and enservicesobject.contractkindrefcode = " + ENServicesContractKind.SALE + ") " +
      "      then 'Специфікацію затверджено' else ENSERVICESCONTRACTSTTS.NAME end " +
      "    FROM ENSERVICESCONTRACTSTTS WHERE ENSERVICESCONTRACTSTTS.CODE = ENSERVICESOBJECT.CONTRACTSTATUSREFCODE)" +

      ", (SELECT ENSERVICESCONTRACTTYPE.CODE FROM ENSERVICESCONTRACTTYPE WHERE ENSERVICESCONTRACTTYPE.CODE = ENSERVICESOBJECT.CONTRACTTYPEREFCODE)" +

      //", (SELECT ENSERVICESCONTRACTTYPE.NAME FROM ENSERVICESCONTRACTTYPE WHERE ENSERVICESCONTRACTTYPE.CODE = ENSERVICESOBJECT.CONTRACTTYPEREFCODE)" +

      ", (select case when enservicescontracttype.code = " + ENServicesContractType.CONNECTION + " then " +
      "   enservicescontracttype.name||' - '||(select k.name " +
      "      from enservicesobject2techcondtnsservices s2t, entechconditionsservcs ts, enconnectionkind k " +
      "     where ts.code = s2t.techcondservrefcode and ts.connectionkindrefcode = k.code " +
      "       and s2t.servicesobjectrefcode = enservicesobject.code) " +
      "      else enservicescontracttype.name end " +
      "   from enservicescontracttype " +
      "  where enservicescontracttype.code = enservicesobject.contracttyperefcode) " +


      ", (SELECT ENSERVICESCONTRAGENTTP.CODE FROM ENSERVICESCONTRAGENTTP WHERE ENSERVICESCONTRAGENTTP.CODE = ENSERVICESOBJECT.CONTRAGENTTYPEREFCODE)" +
      ", (SELECT ENSERVICESCONTRAGENTTP.NAME FROM ENSERVICESCONTRAGENTTP WHERE ENSERVICESCONTRAGENTTP.CODE = ENSERVICESOBJECT.CONTRAGENTTYPEREFCODE)" +
      ", (SELECT ENSERVICESBILLSTATUS.CODE FROM ENSERVICESBILLSTATUS WHERE ENSERVICESBILLSTATUS.CODE = ENSERVICESOBJECT.BILLSTATUSREFCODE)" +
      ", (SELECT ENSERVICESBILLSTATUS.NAME FROM ENSERVICESBILLSTATUS WHERE ENSERVICESBILLSTATUS.CODE = ENSERVICESOBJECT.BILLSTATUSREFCODE)" +              // 39

      ", (SELECT ENWARRANT.CODE FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +
      ", (SELECT ENWARRANT.NUMBERGEN FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE) " +
      ", (SELECT ENWARRANT.NAME FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE) " +
      ", (SELECT ENWARRANT.WARRANTFIO FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE) " +
      ", (SELECT ENWARRANT.WARRANTPOSITION FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +
      ", (SELECT ENWARRANT.PASSPORT FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +
      ", (SELECT ENWARRANT.ADDRESS FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +
      ", (SELECT ENWARRANT.POWER FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +
      ", (SELECT ENWARRANT.MAXSUM FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +                       // 48

      ", ENSERVICESOBJECT.WARRANTDATE " +
      ", ENSERVICESOBJECT.WARRANTNUMBER " +
      ", ENSERVICESOBJECT.WARRANTFIO " +
      ", (SELECT ENWARRANT.WARRANTSHORTFIO FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +
      ", ENSERVICESOBJECT.REGIONALTYPE " +          // 53

      ", ENSERVICESOBJECTSTATUS.CODE " +
      ", ENSERVICESOBJECTSTATUS.NAME " +
      ", ENSERVICESOBJECT.CONTRAGENTPOSITION "+
      ",ENSERVICESOBJECT.EXECUTEWORKDATE"+
      ",ENSERVICESOBJECT.TIMESTART"+
      ",ENSERVICESOBJECT.TIMEFINAL"+
      ",ENSERVICESOBJECT.CONTRAGENTPHONENUMBER"+
      ",ENSERVICESOBJECT.EXECUTORPHONENUMBER"+
      ",ENSERVICESOBJECT.CONTRAGENTOBJECTWORK"+
      // тех условия
      ", ENTECHCONDITIONSOBJCTS.CODE " +
      ", ENTECHCONDITIONSOBJCTS.NUMBERGEN " +
      ", ENTECHCONDITIONSOBJCTS.DATEGEN " +
      ", ENTECHCONDITIONSOBJCTS.CUSTOMER " +
      ", ENTECHCONDITIONSOBJCTS.BUILDING " +
      ", ENTECHCONDITIONSOBJCTS.ADDRESS " +
      ", ENTECHCONDITIONSOBJCTS.TYCURRENTPOWER " +
      ", ENTECHCONDITIONSOBJCTS.TYSERVICESPOWER " +
      ", ENTECHCONDITIONSOBJCTS.USERGEN " +
      ", ENTECHCONDITIONSOBJCTS.DATEEDIT " +

      ", ENSERVICESCONTRACTKIND.CODE " +
      ", ENSERVICESCONTRACTKIND.NAME " +      // 74

      ", ENSERVICESOBJECT.PAYDATE " +
      ", ENSERVICESOBJECT.FINPAYFORMCODE " +
      ", ENSERVICESOBJECT.FINPAYFORMNAME " +
      ", ENSERVICESOBJECT.PAYDETAIL " +       // 78
      ", ENSERVICESOBJECT.ISCUSTOMERMATERIALS " +
      ", ENSERVICESOBJECT.CNPACKCODE " +
      ", ENSERVICESOBJECT.CNSUBSYSTEMTYPEREFCODE " +
      ", (select CNSUBSYSTEMTYPE.NAME from CNSUBSYSTEMTYPE " +
      "    where CNSUBSYSTEMTYPE.code = ENSERVICESOBJECT.CNSUBSYSTEMTYPEREFCODE " +
      "  ) as CNSUBSYSTEMTYPEREFNAME" +

      ", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACES " +
      ", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINT " +

      ", ENSERVICESOBJECTCALCTP.CODE " +
      ", ENSERVICESOBJECTCALCTP.NAME " +


      ////// сумма факт оплат по договору
     " ,( select coalesce(sum(selSumPay.sumtotal)) from ( " +
     " Select coalesce(sum(enpayment2so.sumtotal)) as sumtotal from enpayment2so where enpayment2so.servicesobjectrefcode = ENSERVICESOBJECT.CODE " +
     " and enpayment2so.paymenttyperefcode in (1,2) " +
     " union all " +
     " Select -coalesce(sum(enpayment2so.sumtotal)) as sumtotal from enpayment2so where enpayment2so.servicesobjectrefcode = ENSERVICESOBJECT.CODE " +
     " and enpayment2so.paymenttyperefcode in (3) " +
     "  ) as selSumPay ) as selSumPay  " +

     /////// сумма с доходного акта
     ",(select sum(" +
     " case when enservicesobject.calctyperefcode = 1 then " +
     "      case " +
     "        when enservicesobject.contracttyperefcode = 5 " +
     "          then " +
     "            case " +
     "              when enservicesobject.code in (select servicesobjectrefcode " +
     "                from enservicesobject2techcondtnsservices where techcondservrefcode in ( " +
     "                  select code from entechconditionsservcs " +
     "                    where coalesce(buildersarea, 0) = 0 " +
     "                    and coalesce(basestation, 0) = 0 " +
     "                    and coalesce(smallarchfrm, 0) = 0)) " +
     "              then " +
     "                cast(coalesce(cct.totalcost,0) as numeric(10,2)) " +
     "              else cast (0 as numeric(10,2)) " +
     "            end " +
     "        else " +
     "          cast(coalesce(cct.totalcost,0) as numeric(10,2)) " +
     "      end " +
     " else " +
     " sofc.totalsum " +
     " end) " +
     " as summa " +
     " from encalccontracttotal cct, enplanwork pw " +
     //" enservicesobject so " +
     " left join enservicesfactcalc sofc on sofc.servicesobjectrefcode = enservicesobject.code " +
     " where enservicesobject.elementcode = pw.elementrefcode " +
     " and cct.planrefcode = pw.code " +
     " and pw.kindcode = 5 " +
     " ) as seldohodsum " +

     ", ENSERVICESOBJECT.PERSONALACCOUNTCODE " +
     ", ENSERVICESOBJECT.PERSONALACCOUNTNUMBER " +  // 90


     /*", case when enservicesobject.contractstatusrefcode = 10 then 0 else   " + //не считаем просрочку если отказ от услуг
     " case when enservicesobject.contragenttyperefcode <> 2  then " +
     " case when " +
     " coalesce((case coalesce(enservicesobject.regionaltype,0) when 2" +
     " then 9 + (select min(dategen) from enpayment2so " +
     " where enpayment2so.servicesobjectrefcode = enservicesobject.code)" +
     " else 5 +  (select min(dategen) from enpayment2so " +
     " where enpayment2so.servicesobjectrefcode = enservicesobject.code) " +
     " end),current_date) < current_date " +
     " then " +
     "   case when (select count(code) from enact " +
     "   where enact.elementcode = enservicesobject.elementcode) > 0 " +
     "   then 0 else 1 end " +
     " else 0 end " +
     " else  " +
     " case when " +
     " coalesce((case coalesce(enservicesobject.regionaltype,0) when 2 " +
     " then 9 + enservicesobject.executeworkdate "+
     " else 5 + enservicesobject.executeworkdate " +
     " end),current_date) < current_date " +
     " then " +
     "   case when (select count(code) from enact " +
     "   where enact.elementcode = enservicesobject.elementcode) > 0 "+
     "   then 0 else 1 end" +
     " else 0 end " +
     " END " +
     " end  " +
     " as is_red " + // 91 */

     ", ( select * from get_number_day_delay_services_red(ENSERVICESOBJECT.CODE ) ) as is_red " + // 91


     /*" , case when enservicesobject.contractstatusrefcode = 10 then 0 else   " + // не считаем просрочку если отказ от услуг
     " case when " +
     " coalesce((case coalesce(enservicesobject.regionaltype,0) when 2" +
     "  then 9 + enservicesobject.executeworkdate " +
     "  else 5 + enservicesobject.executeworkdate " +
     " end),current_date) < current_date "+
     " then "+
     "   case when (select count(code) from enact "+
     "   where enact.elementcode = enservicesobject.elementcode) > 0 "+
     "   then 0 else 1 end " +
     " else 0 end end as is_yellow " +  // 92 */
     ", ( select * from get_number_day_delay_services_yellow(ENSERVICESOBJECT.CODE ) ) as is_yellow " + // 92

     ", ENSERVICESOBJECT.ISNOPAY" +

	",ENSERVICESOBJECT.AXPARTNERCODE"+
	",ENSERVICESOBJECT.AXPARTNERNAME"+
	",ENSERVICESOBJECT.AXCONTRACTNUMBER"+
	",ENSERVICESOBJECT.AXCONTRACTDATE"+
	",ENSERVICESOBJECT.AXCONTRACTCODE"+
	",ENSERVICESOBJECT.AXCONTRACTID"+
	",ENSERVICESOBJECT.AXCONTRACTCOMMENTGEN"+
	",ENGENERALCONTRACTS.CODE as ENGENERALCONTRACTSCODE  ,  "+

     "ENSERVICESOBJECT.TERM, "
    + "ENSERVICESOBJECT.REGULATION, "
    + "ENSERVICESOBJECT.BOUNDARYDATEWORK, "
    + "ENSERVICESOBJECT.COUNTDAYDELAY, "
    + "ENSERVICESOBJECT.FACTDATEWORK, "
    + " ENSERVICESOBJECT.ACTINCOMECREATMETDRFCD " +
    " , ENSERVICESOBJECT.CODEEIC " +
    " , ENSERVICESOBJECT.PERSONALACCOUNTUID " +
    " , ENSERVICESOBJECT.CUSTOMERMAILINGADDRESS " +  // 110
	" , ENSERVICESOBJECT.POWERGENERATION " +         // 111
	" , ENSERVICESOBJECT.POSTCODE " +

      " FROM ENSERVICESOBJECT LEFT JOIN  ENTECHCONDITIONSOBJCTS ON (ENTECHCONDITIONSOBJCTS.CODE = ENSERVICESOBJECT.TECHCONOBJECTSCODE)  " +
      "                       LEFT JOIN  ENGENERALCONTRACTS ON (ENGENERALCONTRACTS.CODE = ENSERVICESOBJECT.GENERALCONTRACTREFCODE ) " +
      ", ENDEPARTMENT " +
      // ", ENELEMENT " +
      ", ENSERVICESOBJECTSTATUS" +
      ", ENSERVICESCONTRACTKIND " +
      ", ENSERVICESOBJECTCALCTP " +

             //" WHERE "
      "";
      whereStr = " ENDEPARTMENT.CODE = ENSERVICESOBJECT.DEPARTMENTCODE";
      // whereStr = whereStr + " AND ENELEMENT.CODE = ENSERVICESOBJECT.ELEMENTCODE";
      whereStr = whereStr + " AND ENSERVICESOBJECTSTATUS.CODE = ENSERVICESOBJECT.STATUSREFCODE";
      whereStr = whereStr + " AND ENSERVICESCONTRACTKIND.CODE = ENSERVICESOBJECT.CONTRACTKINDREFCODE";
      whereStr = whereStr +" AND ENSERVICESOBJECTCALCTP.CODE = ENSERVICESOBJECT.CALCTYPEREFCODE" ; //+

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.CODE = ?";
        }
         if (aFilterObject.contractNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRACTNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRACTNUMBER) LIKE UPPER(?)";
         }
        if(aFilterObject.contractDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTDATE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.partnerCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.PARTNERCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.PARTNERCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.finDocCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.FINDOCCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.FINDOCCODE) LIKE UPPER(?)";
         }
        if(aFilterObject.finDocID != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.FINDOCID = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.COMMENTGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.contractNumberServices != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contractNumberServices.indexOf('*',0) < 0 && aFilterObject.contractNumberServices.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRACTNUMBERSERVICES) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRACTNUMBERSERVICES) LIKE UPPER(?)";
         }
        if(aFilterObject.contractDateServices != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTDATESERVICES = ?";
        }
         if (aFilterObject.contragentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTADDRESS) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTADDRESS) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentAddressWork != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentAddressWork.indexOf('*',0) < 0 && aFilterObject.contragentAddressWork.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTADDRESSWORK) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTADDRESSWORK) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentOkpo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentOkpo.indexOf('*',0) < 0 && aFilterObject.contragentOkpo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTOKPO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTOKPO) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentBankAccount != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankAccount.indexOf('*',0) < 0 && aFilterObject.contragentBankAccount.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentBankName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankName.indexOf('*',0) < 0 && aFilterObject.contragentBankName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTBANKNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTBANKNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentBankMfo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankMfo.indexOf('*',0) < 0 && aFilterObject.contragentBankMfo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTBANKMFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTBANKMFO) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentBossName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBossName.indexOf('*',0) < 0 && aFilterObject.contragentBossName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTBOSSNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTBOSSNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTPASSPORT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTPASSPORT) LIKE UPPER(?)";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.DATEEDIT = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESOBJECT.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESOBJECT.ELEMENTCODE = ? ";
        }
        if(aFilterObject.contractStatusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESOBJECT.CONTRACTSTATUSREFCODE = ? ";
        }
        if(aFilterObject.contractTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESOBJECT.CONTRACTTYPEREFCODE = ? ";
        }
        if(aFilterObject.contragentTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESOBJECT.CONTRAGENTTYPEREFCODE = ? ";
        }
        if(aFilterObject.billStatusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESOBJECT.BILLSTATUSREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESOBJECT.STATUSREFCODE = ? ";
        }
        if (aFilterObject.contragentPosition != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentPosition.indexOf('*',0) < 0 && aFilterObject.contragentPosition.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTPOSITION) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTPOSITION) LIKE UPPER(?)";
         }
        if(aFilterObject.executeWorkDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.EXECUTEWORKDATE = ?";
        }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.TIMEFINAL = ?";
        }
        if (aFilterObject.contragentPhoneNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contragentPhoneNumber.indexOf('*',0) < 0 && aFilterObject.contragentPhoneNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTPHONENUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTPHONENUMBER) LIKE UPPER(?)";
        }
        if (aFilterObject.executorPhoneNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.executorPhoneNumber.indexOf('*',0) < 0 && aFilterObject.executorPhoneNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.EXECUTORPHONENUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.EXECUTORPHONENUMBER) LIKE UPPER(?)";
        }
        if (aFilterObject.contragentObjectWork != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contragentObjectWork.indexOf('*',0) < 0 && aFilterObject.contragentObjectWork.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTOBJECTWORK) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTOBJECTWORK) LIKE UPPER(?)";
        }

        if(aFilterObject.contractKindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESOBJECT.CONTRACTKINDREFCODE = ? ";
        }

        if(aFilterObject.payDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.PAYDATE = ?";
        }

        if(aFilterObject.finPayFormCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.FINPAYFORMCODE = ?";
        }
        if (aFilterObject.finPayFormName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finPayFormName.indexOf('*',0) < 0 && aFilterObject.finPayFormName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.FINPAYFORMNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.FINPAYFORMNAME) LIKE UPPER(?)";
        }

        if(aFilterObject.isCustomerMaterials != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.ISCUSTOMERMATERIALS = ?";
        }

        if(aFilterObject.cnPackCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.CNPACKCODE = ?";
        }

        if(aFilterObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESOBJECT.CNSUBSYSTEMTYPEREFCODE = ? ";
        }

        if(aFilterObject.calcTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESOBJECT.CALCTYPEREFCODE = ? ";
        }

        if(aFilterObject.personalAccountCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT.PERSONALACCOUNTCODE = ?";
        }
         if (aFilterObject.personalAccountNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.personalAccountNumber.indexOf('*',0) < 0 && aFilterObject.personalAccountNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.PERSONALACCOUNTNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.PERSONALACCOUNTNUMBER) LIKE UPPER(?)";
         }

         if(aFilterObject.isNoPay != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENSERVICESOBJECT.ISNOPAY = ? ";
         }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENServicesObject.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENSERVICESOBJECT",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENSERVICESOBJECT.DOMAIN_INFO IS NOT NULL";
    //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
    }


      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";

         whereStr = whereStr + " (" + condition + ")";
      }
// + " WHERE" +  сделано выше ????
     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE " + whereStr;

    // selectStr = selectStr + ") ";

    selectStr = selectStr + " ORDER BY " + orderBy;

    selectStr = selectStr + " OFFSET " + fromPosition;
    if (quantity > -1)
        selectStr = selectStr + " LIMIT " + quantity;

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;
      if(aFilterObject != null){
         if(aFilterObject.code != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.code);
         }

           if(aFilterObject.contractNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contractNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.contractDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.contractDate.getTime()));
        }

           if(aFilterObject.name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.partnerCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.partnerCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.finDocCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finDocCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.finDocID != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finDocID);
         }

           if(aFilterObject.commentGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.commentGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contractNumberServices != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contractNumberServices);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.contractDateServices != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.contractDateServices.getTime()));
        }

           if(aFilterObject.contragentName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentAddress != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentAddress);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentAddressWork != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentAddressWork);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }


           if(aFilterObject.contragentOkpo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentOkpo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentBankAccount != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankAccount);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentBankName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentBankMfo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankMfo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentBossName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBossName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentPassport != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentPassport);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.userGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.element.code);
       }
       if(aFilterObject.contractStatusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.contractStatusRef.code);
       }
       if(aFilterObject.contractTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.contractTypeRef.code);
       }
       if(aFilterObject.contragentTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.contragentTypeRef.code);
       }
       if(aFilterObject.billStatusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.billStatusRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
       }
       if(aFilterObject.contragentPosition != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentPosition);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
       if(aFilterObject.executeWorkDate != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.executeWorkDate.getTime()));
       }
       if(aFilterObject.timeStart != null){
           number++;
           statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
       }
       if(aFilterObject.timeFinal != null){
           number++;
           statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
       }
       if(aFilterObject.contragentPhoneNumber != null){
           number++;
           StringBuffer likeStr = new StringBuffer();
           likeStr.append(aFilterObject.contragentPhoneNumber);
           for(int i = 0;i < likeStr.length();i++){
                if(likeStr.charAt(i) == '*')
                     likeStr.setCharAt(i,'%');
                if(likeStr.charAt(i) == '?')
                     likeStr.setCharAt(i,'_');
           }
           statement.setString(number,likeStr.toString());
       }
       if(aFilterObject.executorPhoneNumber != null){
           number++;
           StringBuffer likeStr = new StringBuffer();
           likeStr.append(aFilterObject.executorPhoneNumber);
           for(int i = 0;i < likeStr.length();i++){
                if(likeStr.charAt(i) == '*')
                     likeStr.setCharAt(i,'%');
                if(likeStr.charAt(i) == '?')
                     likeStr.setCharAt(i,'_');
           }
           statement.setString(number,likeStr.toString());
       }
       if(aFilterObject.contragentObjectWork != null){
           number++;
           StringBuffer likeStr = new StringBuffer();
           likeStr.append(aFilterObject.contragentObjectWork);
           for(int i = 0;i < likeStr.length();i++){
                if(likeStr.charAt(i) == '*')
                     likeStr.setCharAt(i,'%');
                if(likeStr.charAt(i) == '?')
                     likeStr.setCharAt(i,'_');
           }
           statement.setString(number,likeStr.toString());
       }

       if(aFilterObject.contractKindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.contractKindRef.code);
       }

       if(aFilterObject.payDate != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.payDate.getTime()));
       }

       if(aFilterObject.finPayFormCode != Integer.MIN_VALUE){
           number++;
           statement.setInt(number,aFilterObject.finPayFormCode);
       }

       if(aFilterObject.finPayFormName != null){
           number++;
           StringBuffer likeStr = new StringBuffer();
           likeStr.append(aFilterObject.finPayFormName);
           for(int i = 0;i < likeStr.length();i++){
                if(likeStr.charAt(i) == '*')
                     likeStr.setCharAt(i,'%');
                if(likeStr.charAt(i) == '?')
                     likeStr.setCharAt(i,'_');
           }
           statement.setString(number,likeStr.toString());
       }

       if(aFilterObject.isCustomerMaterials != Integer.MIN_VALUE){
           number++;
           statement.setInt(number,aFilterObject.isCustomerMaterials);
       }

    if(aFilterObject.cnPackCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.cnPackCode);
         }

    if(aFilterObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cnSubsystemTypeRef.code);
       }

    if(aFilterObject.calcTypeRef.code != Integer.MIN_VALUE) {
        number++;
        statement.setInt(number,aFilterObject.calcTypeRef.code);
    }

    if(aFilterObject.personalAccountCode != Integer.MIN_VALUE){
        number++;
        statement.setInt(number,aFilterObject.personalAccountCode);
    }

      if(aFilterObject.personalAccountNumber != null){
          number++;
          StringBuffer likeStr = new StringBuffer();
          likeStr.append(aFilterObject.personalAccountNumber);
          for(int i = 0;i < likeStr.length();i++){
               if(likeStr.charAt(i) == '*')
                    likeStr.setCharAt(i,'%');
               if(likeStr.charAt(i) == '?')
                    likeStr.setCharAt(i,'_');
          }
          statement.setString(number,likeStr.toString());
      }

      if(aFilterObject.isNoPay != Integer.MIN_VALUE){
          number++;
          statement.setInt(number,aFilterObject.isNoPay);
      }

   }

      if(condition.length() > 0 && aBindObjects != null)
       _bindObjectsToPreparedStatement(statement,aBindObjects,number);

      set = statement.executeQuery();
      int i;
      for(i = 0;set.next();i++)
       {
        /*
        if(i < fromPosition)
         continue;
        else if(i >= fromPosition + quantity)
         {
          i++;
          break;
         }
         */

        anObject = new ENServicesObjectShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.contractNumber = set.getString(2);
        anObject.contractDate = set.getDate(3);
        anObject.name = set.getString(4);
        anObject.partnerCode = set.getString(5);
        anObject.finDocCode = set.getString(6);
        anObject.finDocID = set.getInt(7);
        if ( set.wasNull() )
            anObject.finDocID = Integer.MIN_VALUE;
        anObject.commentGen = set.getString(8);
        anObject.contractNumberServices = set.getString(9);
        anObject.contractDateServices = set.getDate(10);
        anObject.contragentName = set.getString(11);
        anObject.contragentAddress = set.getString(12);
        anObject.contragentAddressWork = set.getString(13);
        anObject.contragentOkpo = set.getString(14);
        anObject.contragentBankAccount = set.getString(15);
        anObject.contragentBankName = set.getString(16);
        anObject.contragentBankMfo = set.getString(17);
        anObject.contragentBossName = set.getString(18);
        anObject.contragentPassport = set.getString(19);
        anObject.contractServicesSumma = set.getBigDecimal(20);

        if(anObject.contractServicesSumma != null)
            anObject.contractServicesSumma = anObject.contractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.contractServicesPower = set.getBigDecimal(21);
        if(anObject.contractServicesPower != null)
            anObject.contractServicesPower = anObject.contractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.commentServicesGen = set.getString(22);
        anObject.contractServicesDistance = set.getBigDecimal(23);
        if(anObject.contractServicesDistance != null)
            anObject.contractServicesDistance = anObject.contractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.contractServicesDay = set.getBigDecimal(24);
        if(anObject.contractServicesDay != null)
            anObject.contractServicesDay = anObject.contractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(25);
        anObject.dateEdit = set.getDate(26);

        anObject.departmentCode = set.getInt(27);
        if(set.wasNull())
            anObject.departmentCode = Integer.MIN_VALUE;
        anObject.departmentShortName = set.getString(28);
        anObject.departmentDateStart = set.getDate(29);
        anObject.departmentDateFinal = set.getDate(30);
        anObject.elementCode = set.getInt(31);
        if(set.wasNull())
            anObject.elementCode = Integer.MIN_VALUE;
        anObject.contractStatusRefCode = set.getInt(32);

        if(set.wasNull())
            anObject.contractStatusRefCode = Integer.MIN_VALUE;
        anObject.contractStatusRefName = set.getString(33);
        anObject.contractTypeRefCode = set.getInt(34);

        if(set.wasNull())
            anObject.contractTypeRefCode = Integer.MIN_VALUE;
        anObject.contractTypeRefName = set.getString(35);

        anObject.contragentTypeRefCode = set.getInt(36);
        if(set.wasNull())
            anObject.contragentTypeRefCode = Integer.MIN_VALUE;
        anObject.contragentTypeRefName = set.getString(37);
        anObject.billStatusRefCode = set.getInt(38);
        if(set.wasNull())
            anObject.billStatusRefCode = Integer.MIN_VALUE;
        anObject.billStatusRefName = set.getString(39);

        anObject.warrantRefCode = set.getInt(40);
        if(set.wasNull())
        anObject.warrantRefCode = Integer.MIN_VALUE;
        anObject.warrantRefNumbergen = set.getString(41);
        anObject.warrantRefName = set.getString(42);
        anObject.warrantRefWarrantFIO = set.getString(43);
        anObject.warrantRefWarrantPosition = set.getString(44);
        anObject.warrantRefPassport = set.getString(45);
        anObject.warrantRefAddress = set.getString(46);
        anObject.warrantRefPower = set.getInt(47);
        if ( set.wasNull() )
            anObject.warrantRefPower = Integer.MIN_VALUE;
        anObject.warrantRefMaxSum = set.getBigDecimal(48);
        if(anObject.warrantRefMaxSum != null)
          anObject.warrantRefMaxSum = anObject.warrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.warrantDate = set.getDate(49);
        anObject.warrantNumber = set.getString(50);
        anObject.warrantFIO = set.getString(51);
        anObject.warrantRefWarrantShortFIO = set.getString(52);
        anObject.regionalType = set.getInt(53);
        if ( set.wasNull() )
            anObject.regionalType = Integer.MIN_VALUE;

        anObject.statusRefCode = set.getInt(54);
        if(set.wasNull())
        anObject.statusRefCode = Integer.MIN_VALUE;
        anObject.statusRefName = set.getString(55);
        anObject.contragentPosition = set.getString(56);
        anObject.executeWorkDate = set.getDate(57);
        anObject.timeStart = set.getTimestamp(58);
        anObject.timeFinal = set.getTimestamp(59);
        anObject.contragentPhoneNumber = set.getString(60);
        anObject.executorPhoneNumber = set.getString(61);
        anObject.contragentObjectWork = set.getString(62);
       // ТЕХ УСЛОВИЯ
        anObject.techConObjectsCode = set.getInt(63);
        if(set.wasNull())
            anObject.techConObjectsCode = Integer.MIN_VALUE;
        anObject.techConObjectsNumberGen = set.getString(64);

        anObject.techConObjectsDateGen = set.getDate(65);
        anObject.techConObjectsCustomer = set.getString(66);
        anObject.techConObjectsBuilding = set.getString(67);
        anObject.techConObjectsAddress = set.getString(68);

        anObject.techConObjectsTyCurrentPower = set.getBigDecimal(69);
        if(anObject.techConObjectsTyCurrentPower != null)
        anObject.techConObjectsTyCurrentPower = anObject.techConObjectsTyCurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techConObjectsTyServicesPower = set.getBigDecimal(70);
        if(anObject.techConObjectsTyServicesPower != null)
        anObject.techConObjectsTyServicesPower = anObject.techConObjectsTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.techConObjectsUserGen = set.getString(71);
        anObject.techConObjectsDateEdit = set.getDate(72);

        anObject.contractKindRefCode = set.getInt(73);
        if(set.wasNull())
        anObject.contractKindRefCode = Integer.MIN_VALUE;
        anObject.contractKindRefName = set.getString(74);

        anObject.payDate = set.getDate(75);
        anObject.finPayFormCode = set.getInt(76);
        if ( set.wasNull() )
            anObject.finPayFormCode = Integer.MIN_VALUE;
        anObject.finPayFormName = set.getString(77);

        anObject.payDetail = set.getString(78);

        anObject.isCustomerMaterials = set.getInt(79);
        if ( set.wasNull() )
            anObject.isCustomerMaterials = Integer.MIN_VALUE;

        anObject.cnPackCode = set.getInt(80);
        if ( set.wasNull() )
            anObject.cnPackCode = Integer.MIN_VALUE;
        anObject.cnSubsystemTypeRefCode = set.getInt(81);
        if(set.wasNull())
        anObject.cnSubsystemTypeRefCode = Integer.MIN_VALUE;
        anObject.cnSubsystemTypeRefName = set.getString(82);
        anObject.techConObjectsConnectionPowerPlaces = set.getString(83);
        anObject.techConObjectsConnectionPowerPoint = set.getString(84);

        anObject.calcTypeRefCode = set.getInt(85);
        if(set.wasNull())
        anObject.calcTypeRefCode = Integer.MIN_VALUE;
        anObject.calcTypeRefName = set.getString(86);
        anObject.paySum = set.getBigDecimal(87);
        if(anObject.paySum != null)
            anObject.paySum = anObject.paySum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.dohodSum = set.getBigDecimal(88);
        if(anObject.dohodSum != null)
            anObject.dohodSum = anObject.dohodSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.personalAccountCode = set.getInt(89);
        if ( set.wasNull() )
            anObject.personalAccountCode = Integer.MIN_VALUE;
        anObject.personalAccountNumber = set.getString(90);

        anObject.isRed = set.getInt(91);
        if ( set.wasNull() )
            anObject.isRed = Integer.MIN_VALUE;

        anObject.isYellow = set.getInt(92);
        if ( set.wasNull() )
            anObject.isYellow = Integer.MIN_VALUE;

        anObject.isNoPay = set.getInt(93);
        if (set.wasNull())
            anObject.isNoPay = Integer.MIN_VALUE;


        anObject.axPartnerCode = set.getString(94);
		anObject.axPartnerName = set.getString(95);
		anObject.axContractNumber = set.getString(96);
		anObject.axContractDate = set.getDate(97);
		anObject.axContractCode = set.getString(98);
		anObject.axContractId = set.getString(99);
		anObject.axContractCommentGen = set.getString(100);

		anObject.generalContractRefCode = set.getInt("ENGENERALCONTRACTSCODE");
		if (set.wasNull())
            anObject.generalContractRefCode = Integer.MIN_VALUE;


		anObject.term = set.getInt(102);
		if ( set.wasNull() ) {
			anObject.term = Integer.MIN_VALUE;
		}
		anObject.regulation = set.getInt(103);
		if ( set.wasNull() ) {
			anObject.regulation = Integer.MIN_VALUE;
		}
		anObject.boundaryDateWork = set.getDate(104);
		anObject.countDayDelay = set.getInt(105);
		if ( set.wasNull() ) {
			anObject.countDayDelay = Integer.MIN_VALUE;
		}
		anObject.factDateWork = set.getDate(106);

		if (set.wasNull()) {
			anObject.actIncomeCreatMetodRefCode = Integer.MIN_VALUE;
		}
		anObject.actIncomeCreatMetodRefName = set.getString(107);
		anObject.codeEIC = set.getString(108);
		anObject.personalAccountUid = set.getString(109);


		anObject.customerMailingAddress = set.getString(110);

		anObject.powerGeneration = set.getBigDecimal(111);
		if(anObject.powerGeneration != null) {
			anObject.powerGeneration = anObject.powerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
		}

		anObject.postCode = set.getString(112);


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


  public ENServicesObjectShortList getScrollableFilteredListNOSEGR(ENServicesObject aFilterObject,int fromPosition,int quantity) throws PersistenceException
  {
   return getScrollableFilteredListNOSEGR(aFilterObject,null,fromPosition,quantity);
  }

  public ENServicesObjectShortList getScrollableFilteredListNOSEGR(ENServicesObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
  {
   return getScrollableFilteredListNOSEGR(aFilterObject,anCondition,null,fromPosition,quantity,null);
  }

  public ENServicesObjectShortList getScrollableFilteredListNOSEGR(ENServicesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector<? extends Object> aBindObjects) throws PersistenceException
  {
   ENServicesObjectShortList result = new ENServicesObjectShortList();
   ENServicesObjectShort anObject;
   result.list = new Vector<ENServicesObjectShort>();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENSERVICESOBJECT.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENSERVICESOBJECT.CODE"+
    ",ENSERVICESOBJECT.CONTRACTNUMBER"+
    ",ENSERVICESOBJECT.CONTRACTDATE"+
    ",ENSERVICESOBJECT.NAME"+
    ",ENSERVICESOBJECT.PARTNERCODE"+
    ",ENSERVICESOBJECT.FINDOCCODE"+
    ",ENSERVICESOBJECT.FINDOCID"+
    ",ENSERVICESOBJECT.COMMENTGEN"+
    ",ENSERVICESOBJECT.CONTRACTNUMBERSERVICES"+
    ",ENSERVICESOBJECT.CONTRACTDATESERVICES"+      // 10
    ",ENSERVICESOBJECT.CONTRAGENTNAME"+
    ",ENSERVICESOBJECT.CONTRAGENTADDRESS"+
    ",ENSERVICESOBJECT.CONTRAGENTADDRESSWORK"+
    ",ENSERVICESOBJECT.CONTRAGENTOKPO"+
    ",ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT"+
    ",ENSERVICESOBJECT.CONTRAGENTBANKNAME"+
    ",ENSERVICESOBJECT.CONTRAGENTBANKMFO"+
    ",ENSERVICESOBJECT.CONTRAGENTBOSSNAME"+
    ",ENSERVICESOBJECT.CONTRAGENTPASSPORT"+
    ",ENSERVICESOBJECT.CONTRACTSERVICESSUMMA"+     // 20
    ",ENSERVICESOBJECT.CONTRACTSERVICESPOWER"+
    ",ENSERVICESOBJECT.COMMENTSERVICESGEN"+
    ",ENSERVICESOBJECT.CONTRACTSERVICESDISTNC"+
    ",ENSERVICESOBJECT.CONTRACTSERVICESDAY"+
    ",ENSERVICESOBJECT.USERGEN"+
    ",ENSERVICESOBJECT.DATEEDIT"+                  // 26

     ", ENDEPARTMENT.CODE " +
     ", ENDEPARTMENT.SHORTNAME " +
     ", ENDEPARTMENT.DATESTART " +
     ", ENDEPARTMENT.DATEFINAL " +
     ", ENELEMENT.CODE " +                         // 31

     ", (SELECT ENSERVICESCONTRACTSTTS.CODE FROM ENSERVICESCONTRACTSTTS WHERE ENSERVICESCONTRACTSTTS.CODE = ENSERVICESOBJECT.CONTRACTSTATUSREFCODE)" +

     ", (SELECT case when(enservicescontractstts.code = " + ENServicesContractStatus.BUDGETAPPROVED +
     "            and enservicesobject.contractkindrefcode = " + ENServicesContractKind.SALE + ") " +
     "      then 'Специфікацію затверджено' else ENSERVICESCONTRACTSTTS.NAME end " +
     "    FROM ENSERVICESCONTRACTSTTS WHERE ENSERVICESCONTRACTSTTS.CODE = ENSERVICESOBJECT.CONTRACTSTATUSREFCODE)" +

     ", (SELECT ENSERVICESCONTRACTTYPE.CODE FROM ENSERVICESCONTRACTTYPE WHERE ENSERVICESCONTRACTTYPE.CODE = ENSERVICESOBJECT.CONTRACTTYPEREFCODE)" +

     //", (SELECT ENSERVICESCONTRACTTYPE.NAME FROM ENSERVICESCONTRACTTYPE WHERE ENSERVICESCONTRACTTYPE.CODE = ENSERVICESOBJECT.CONTRACTTYPEREFCODE)" +

     ", (select case when enservicescontracttype.code = " + ENServicesContractType.CONNECTION + " then " +
     "   enservicescontracttype.name||' - '||(select k.name " +
     "      from enservicesobject2techcondtnsservices s2t, entechconditionsservcs ts, enconnectionkind k " +
     "     where ts.code = s2t.techcondservrefcode and ts.connectionkindrefcode = k.code " +
     "       and s2t.servicesobjectrefcode = enservicesobject.code) " +
     "      else enservicescontracttype.name end " +
     "   from enservicescontracttype " +
     "  where enservicescontracttype.code = enservicesobject.contracttyperefcode) " +


     ", (SELECT ENSERVICESCONTRAGENTTP.CODE FROM ENSERVICESCONTRAGENTTP WHERE ENSERVICESCONTRAGENTTP.CODE = ENSERVICESOBJECT.CONTRAGENTTYPEREFCODE)" +
     ", (SELECT ENSERVICESCONTRAGENTTP.NAME FROM ENSERVICESCONTRAGENTTP WHERE ENSERVICESCONTRAGENTTP.CODE = ENSERVICESOBJECT.CONTRAGENTTYPEREFCODE)" +
     ", (SELECT ENSERVICESBILLSTATUS.CODE FROM ENSERVICESBILLSTATUS WHERE ENSERVICESBILLSTATUS.CODE = ENSERVICESOBJECT.BILLSTATUSREFCODE)" +
     ", (SELECT ENSERVICESBILLSTATUS.NAME FROM ENSERVICESBILLSTATUS WHERE ENSERVICESBILLSTATUS.CODE = ENSERVICESOBJECT.BILLSTATUSREFCODE)" +              // 39

     ", (SELECT ENWARRANT.CODE FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +
     ", (SELECT ENWARRANT.NUMBERGEN FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE) " +
     ", (SELECT ENWARRANT.NAME FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE) " +
     ", (SELECT ENWARRANT.WARRANTFIO FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE) " +
     ", (SELECT ENWARRANT.WARRANTPOSITION FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +
     ", (SELECT ENWARRANT.PASSPORT FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +
     ", (SELECT ENWARRANT.ADDRESS FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +
     ", (SELECT ENWARRANT.POWER FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +
     ", (SELECT ENWARRANT.MAXSUM FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +                       // 48

     ", ENSERVICESOBJECT.WARRANTDATE " +
     ", ENSERVICESOBJECT.WARRANTNUMBER " +
     ", ENSERVICESOBJECT.WARRANTFIO " +
     ", (SELECT ENWARRANT.WARRANTSHORTFIO FROM ENWARRANT WHERE ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE)" +
     ", ENSERVICESOBJECT.REGIONALTYPE " +          // 53

     ", ENSERVICESOBJECTSTATUS.CODE " +
     ", ENSERVICESOBJECTSTATUS.NAME " +
     ", ENSERVICESOBJECT.CONTRAGENTPOSITION "+
     ",ENSERVICESOBJECT.EXECUTEWORKDATE"+
     ",ENSERVICESOBJECT.TIMESTART"+
     ",ENSERVICESOBJECT.TIMEFINAL"+
     ",ENSERVICESOBJECT.CONTRAGENTPHONENUMBER"+
     ",ENSERVICESOBJECT.EXECUTORPHONENUMBER"+
     ",ENSERVICESOBJECT.CONTRAGENTOBJECTWORK"+
     // тех условия
     ", ENTECHCONDITIONSOBJCTS.CODE " +
     ", ENTECHCONDITIONSOBJCTS.NUMBERGEN " +
     ", ENTECHCONDITIONSOBJCTS.DATEGEN " +
     ", ENTECHCONDITIONSOBJCTS.CUSTOMER " +
     ", ENTECHCONDITIONSOBJCTS.BUILDING " +
     ", ENTECHCONDITIONSOBJCTS.ADDRESS " +
     ", ENTECHCONDITIONSOBJCTS.TYCURRENTPOWER " +
     ", ENTECHCONDITIONSOBJCTS.TYSERVICESPOWER " +
     ", ENTECHCONDITIONSOBJCTS.USERGEN " +
     ", ENTECHCONDITIONSOBJCTS.DATEEDIT " +

     ", ENSERVICESCONTRACTKIND.CODE " +
     ", ENSERVICESCONTRACTKIND.NAME " +      // 74

     ", ENSERVICESOBJECT.PAYDATE " +
     ", ENSERVICESOBJECT.FINPAYFORMCODE " +
     ", ENSERVICESOBJECT.FINPAYFORMNAME " +
     ", ENSERVICESOBJECT.PAYDETAIL " +       // 78
     ", ENSERVICESOBJECT.ISCUSTOMERMATERIALS " +
     ", ENSERVICESOBJECT.CNPACKCODE " +
     ", ENSERVICESOBJECT.CNSUBSYSTEMTYPEREFCODE " +
     ", (select CNSUBSYSTEMTYPE.NAME from CNSUBSYSTEMTYPE " +
     "    where CNSUBSYSTEMTYPE.code = ENSERVICESOBJECT.CNSUBSYSTEMTYPEREFCODE " +
     "  ) as CNSUBSYSTEMTYPEREFNAME" +

     ", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACES " +
     ", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINT " +

     ", ENSERVICESOBJECTCALCTP.CODE " +
     ", ENSERVICESOBJECTCALCTP.NAME " +

     ", ENSERVICESOBJECT.PERSONALACCOUNTCODE " +
     ", ENSERVICESOBJECT.PERSONALACCOUNTNUMBER " +  // 88

	",ENSERVICESOBJECT.AXPARTNERCODE"+ // 89
	",ENSERVICESOBJECT.AXPARTNERNAME"+
	",ENSERVICESOBJECT.AXCONTRACTNUMBER"+
	",ENSERVICESOBJECT.AXCONTRACTDATE"+
	",ENSERVICESOBJECT.AXCONTRACTCODE"+
	",ENSERVICESOBJECT.AXCONTRACTID"+
	",ENSERVICESOBJECT.AXCONTRACTCOMMENTGEN"+
	",ENGENERALCONTRACTS.CODE as ENGENERALCONTRACTSCODE "+

	",ENSERVICESOBJECT.TERM"+ // 97
	",ENSERVICESOBJECT.REGULATION"+ // 98
	",ENSERVICESOBJECT.BOUNDARYDATEWORK"+ // 99
	",ENSERVICESOBJECT.COUNTDAYDELAY"+ // 100
	",ENSERVICESOBJECT.FACTDATEWORK"+ // 101
	", ENSERVICESOBJECT.ACTINCOMECREATMETDRFCD " +
	", ENSERVICESOBJECT.CODEEIC"+
	", ENSERVICESOBJECT.PERSONALACCOUNTUID " +
	", ENSERVICESOBJECT.CUSTOMERMAILINGADDRESS " + // 105
	", ENSERVICESOBJECT.POWERGENERATION " +        // 106
	", ENSERVICESOBJECT.POSTCODE " +


     " FROM ENSERVICESOBJECT LEFT JOIN  ENTECHCONDITIONSOBJCTS ON (ENTECHCONDITIONSOBJCTS.CODE = ENSERVICESOBJECT.TECHCONOBJECTSCODE)  " +
     "                       LEFT JOIN  ENGENERALCONTRACTS ON (ENGENERALCONTRACTS.CODE = ENSERVICESOBJECT.GENERALCONTRACTREFCODE ) " +
     ", ENDEPARTMENT " +
     ", ENELEMENT " +
     ", ENSERVICESOBJECTSTATUS" +
     ", ENSERVICESCONTRACTKIND " +
     ", ENSERVICESOBJECTCALCTP " +


            //" WHERE "
   "";
     whereStr = " ENDEPARTMENT.CODE = ENSERVICESOBJECT.DEPARTMENTCODE";
     whereStr = whereStr + " AND ENELEMENT.CODE = ENSERVICESOBJECT.ELEMENTCODE";
     whereStr = whereStr + " AND ENSERVICESOBJECTSTATUS.CODE = ENSERVICESOBJECT.STATUSREFCODE";
     whereStr = whereStr + " AND ENSERVICESCONTRACTKIND.CODE = ENSERVICESOBJECT.CONTRACTKINDREFCODE";
     whereStr = whereStr +" AND ENSERVICESOBJECTCALCTP.CODE = ENSERVICESOBJECT.CALCTYPEREFCODE" ; //+

     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.CODE = ?";
       }
        if (aFilterObject.contractNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRACTNUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRACTNUMBER) LIKE UPPER(?)";
        }
       if(aFilterObject.contractDate != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTDATE = ?";
       }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.NAME) LIKE UPPER(?)";
        }
        if (aFilterObject.partnerCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.PARTNERCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.PARTNERCODE) LIKE UPPER(?)";
        }
        if (aFilterObject.finDocCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.FINDOCCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.FINDOCCODE) LIKE UPPER(?)";
        }
       if(aFilterObject.finDocID != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.FINDOCID = ?";
       }
        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.COMMENTGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.COMMENTGEN) LIKE UPPER(?)";
        }
        if (aFilterObject.contractNumberServices != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contractNumberServices.indexOf('*',0) < 0 && aFilterObject.contractNumberServices.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRACTNUMBERSERVICES) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRACTNUMBERSERVICES) LIKE UPPER(?)";
        }
       if(aFilterObject.contractDateServices != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTDATESERVICES = ?";
       }
        if (aFilterObject.contragentName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.contragentAddress != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTADDRESS) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTADDRESS) LIKE UPPER(?)";
        }
        if (aFilterObject.contragentAddressWork != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contragentAddressWork.indexOf('*',0) < 0 && aFilterObject.contragentAddressWork.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTADDRESSWORK) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTADDRESSWORK) LIKE UPPER(?)";
        }
        if (aFilterObject.contragentOkpo != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contragentOkpo.indexOf('*',0) < 0 && aFilterObject.contragentOkpo.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTOKPO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTOKPO) LIKE UPPER(?)";
        }
        if (aFilterObject.contragentBankAccount != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contragentBankAccount.indexOf('*',0) < 0 && aFilterObject.contragentBankAccount.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT) LIKE UPPER(?)";
        }
        if (aFilterObject.contragentBankName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contragentBankName.indexOf('*',0) < 0 && aFilterObject.contragentBankName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTBANKNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTBANKNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.contragentBankMfo != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contragentBankMfo.indexOf('*',0) < 0 && aFilterObject.contragentBankMfo.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTBANKMFO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTBANKMFO) LIKE UPPER(?)";
        }
        if (aFilterObject.contragentBossName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contragentBossName.indexOf('*',0) < 0 && aFilterObject.contragentBossName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTBOSSNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTBOSSNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.contragentPassport != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTPASSPORT) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTPASSPORT) LIKE UPPER(?)";
        }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.USERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.USERGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.DATEEDIT = ?";
       }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.DOMAIN_INFO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.DOMAIN_INFO) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.MODIFY_TIME = ?";
       }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENSERVICESOBJECT.DEPARTMENTCODE = ? ";
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENSERVICESOBJECT.ELEMENTCODE = ? ";
       }
       if(aFilterObject.contractStatusRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENSERVICESOBJECT.CONTRACTSTATUSREFCODE = ? ";
       }
       if(aFilterObject.contractTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENSERVICESOBJECT.CONTRACTTYPEREFCODE = ? ";
       }
       if(aFilterObject.contragentTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENSERVICESOBJECT.CONTRAGENTTYPEREFCODE = ? ";
       }
       if(aFilterObject.billStatusRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENSERVICESOBJECT.BILLSTATUSREFCODE = ? ";
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENSERVICESOBJECT.STATUSREFCODE = ? ";
       }
       if (aFilterObject.contragentPosition != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contragentPosition.indexOf('*',0) < 0 && aFilterObject.contragentPosition.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTPOSITION) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTPOSITION) LIKE UPPER(?)";
        }
       if(aFilterObject.executeWorkDate != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.EXECUTEWORKDATE = ?";
       }
       if(aFilterObject.timeStart != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.TIMESTART = ?";
       }
       if(aFilterObject.timeFinal != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.TIMEFINAL = ?";
       }
       if (aFilterObject.contragentPhoneNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentPhoneNumber.indexOf('*',0) < 0 && aFilterObject.contragentPhoneNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTPHONENUMBER) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTPHONENUMBER) LIKE UPPER(?)";
       }
       if (aFilterObject.executorPhoneNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.executorPhoneNumber.indexOf('*',0) < 0 && aFilterObject.executorPhoneNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.EXECUTORPHONENUMBER) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(ENSERVICESOBJECT.EXECUTORPHONENUMBER) LIKE UPPER(?)";
       }
       if (aFilterObject.contragentObjectWork != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentObjectWork.indexOf('*',0) < 0 && aFilterObject.contragentObjectWork.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTOBJECTWORK) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTOBJECTWORK) LIKE UPPER(?)";
       }

       if(aFilterObject.contractKindRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENSERVICESOBJECT.CONTRACTKINDREFCODE = ? ";
       }

       if(aFilterObject.payDate != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.PAYDATE = ?";
       }

       if(aFilterObject.finPayFormCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.FINPAYFORMCODE = ?";
       }
       if (aFilterObject.finPayFormName != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.finPayFormName.indexOf('*',0) < 0 && aFilterObject.finPayFormName.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.FINPAYFORMNAME) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(ENSERVICESOBJECT.FINPAYFORMNAME) LIKE UPPER(?)";
       }

       if(aFilterObject.isCustomerMaterials != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.ISCUSTOMERMATERIALS = ?";
       }

       if(aFilterObject.cnPackCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.CNPACKCODE = ?";
       }

       if(aFilterObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENSERVICESOBJECT.CNSUBSYSTEMTYPEREFCODE = ? ";
       }

       if(aFilterObject.calcTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENSERVICESOBJECT.CALCTYPEREFCODE = ? ";
       }

       if(aFilterObject.personalAccountCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENSERVICESOBJECT.PERSONALACCOUNTCODE = ?";
       }
        if (aFilterObject.personalAccountNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.personalAccountNumber.indexOf('*',0) < 0 && aFilterObject.personalAccountNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.PERSONALACCOUNTNUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.PERSONALACCOUNTNUMBER) LIKE UPPER(?)";
        }

     }


   /*
   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENServicesObject.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("ENSERVICESOBJECT",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND ENSERVICESOBJECT.DOMAIN_INFO IS NOT NULL";
   //else
   if (whereStr.length() == 0)
       whereStr = domainWhereStr;
   else
       whereStr = " "+whereStr + " AND " +domainWhereStr;
   }
   */

     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE " + whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   selectStr = selectStr + " OFFSET " + fromPosition;
   if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }

          if(aFilterObject.contractNumber != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contractNumber);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.contractDate != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.contractDate.getTime()));
       }

          if(aFilterObject.name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.partnerCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.partnerCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.finDocCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.finDocCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.finDocID != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.finDocID);
        }

          if(aFilterObject.commentGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.commentGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.contractNumberServices != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contractNumberServices);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.contractDateServices != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.contractDateServices.getTime()));
       }

          if(aFilterObject.contragentName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contragentName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.contragentAddress != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contragentAddress);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.contragentAddressWork != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contragentAddressWork);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }


          if(aFilterObject.contragentOkpo != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contragentOkpo);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.contragentBankAccount != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contragentBankAccount);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.contragentBankName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contragentBankName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.contragentBankMfo != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contragentBankMfo);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.contragentBossName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contragentBossName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.contragentPassport != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contragentPassport);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.userGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.userGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
       }

          if(aFilterObject.domain_info != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.domain_info);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.department.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.department.code);
      }
      if(aFilterObject.element.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.element.code);
      }
      if(aFilterObject.contractStatusRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.contractStatusRef.code);
      }
      if(aFilterObject.contractTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.contractTypeRef.code);
      }
      if(aFilterObject.contragentTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.contragentTypeRef.code);
      }
      if(aFilterObject.billStatusRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.billStatusRef.code);
      }
      if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.statusRef.code);
      }
      if(aFilterObject.contragentPosition != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contragentPosition);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
      if(aFilterObject.executeWorkDate != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.executeWorkDate.getTime()));
      }
      if(aFilterObject.timeStart != null){
          number++;
          statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
      }
      if(aFilterObject.timeFinal != null){
          number++;
          statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
      }
      if(aFilterObject.contragentPhoneNumber != null){
          number++;
          StringBuffer likeStr = new StringBuffer();
          likeStr.append(aFilterObject.contragentPhoneNumber);
          for(int i = 0;i < likeStr.length();i++){
               if(likeStr.charAt(i) == '*')
                    likeStr.setCharAt(i,'%');
               if(likeStr.charAt(i) == '?')
                    likeStr.setCharAt(i,'_');
          }
          statement.setString(number,likeStr.toString());
      }
      if(aFilterObject.executorPhoneNumber != null){
          number++;
          StringBuffer likeStr = new StringBuffer();
          likeStr.append(aFilterObject.executorPhoneNumber);
          for(int i = 0;i < likeStr.length();i++){
               if(likeStr.charAt(i) == '*')
                    likeStr.setCharAt(i,'%');
               if(likeStr.charAt(i) == '?')
                    likeStr.setCharAt(i,'_');
          }
          statement.setString(number,likeStr.toString());
      }
      if(aFilterObject.contragentObjectWork != null){
          number++;
          StringBuffer likeStr = new StringBuffer();
          likeStr.append(aFilterObject.contragentObjectWork);
          for(int i = 0;i < likeStr.length();i++){
               if(likeStr.charAt(i) == '*')
                    likeStr.setCharAt(i,'%');
               if(likeStr.charAt(i) == '?')
                    likeStr.setCharAt(i,'_');
          }
          statement.setString(number,likeStr.toString());
      }

      if(aFilterObject.contractKindRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.contractKindRef.code);
      }

      if(aFilterObject.payDate != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.payDate.getTime()));
      }

      if(aFilterObject.finPayFormCode != Integer.MIN_VALUE){
          number++;
          statement.setInt(number,aFilterObject.finPayFormCode);
      }

      if(aFilterObject.finPayFormName != null){
          number++;
          StringBuffer likeStr = new StringBuffer();
          likeStr.append(aFilterObject.finPayFormName);
          for(int i = 0;i < likeStr.length();i++){
               if(likeStr.charAt(i) == '*')
                    likeStr.setCharAt(i,'%');
               if(likeStr.charAt(i) == '?')
                    likeStr.setCharAt(i,'_');
          }
          statement.setString(number,likeStr.toString());
      }

      if(aFilterObject.isCustomerMaterials != Integer.MIN_VALUE){
          number++;
          statement.setInt(number,aFilterObject.isCustomerMaterials);
      }

   if(aFilterObject.cnPackCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.cnPackCode);
        }

   if(aFilterObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.cnSubsystemTypeRef.code);
      }

   if(aFilterObject.calcTypeRef.code != Integer.MIN_VALUE) {
       number++;
       statement.setInt(number,aFilterObject.calcTypeRef.code);
   }

   if(aFilterObject.personalAccountCode != Integer.MIN_VALUE){
       number++;
       statement.setInt(number,aFilterObject.personalAccountCode);
   }

     if(aFilterObject.personalAccountNumber != null){
         number++;
         StringBuffer likeStr = new StringBuffer();
         likeStr.append(aFilterObject.personalAccountNumber);
         for(int i = 0;i < likeStr.length();i++){
              if(likeStr.charAt(i) == '*')
                   likeStr.setCharAt(i,'%');
              if(likeStr.charAt(i) == '?')
                   likeStr.setCharAt(i,'_');
         }
         statement.setString(number,likeStr.toString());
     }

    }

     if(condition.length() > 0 && aBindObjects != null)
      _bindObjectsToPreparedStatement(statement,aBindObjects,number);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
        /*
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }
        */

       anObject = new ENServicesObjectShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.contractNumber = set.getString(2);
       anObject.contractDate = set.getDate(3);
       anObject.name = set.getString(4);
       anObject.partnerCode = set.getString(5);
       anObject.finDocCode = set.getString(6);
       anObject.finDocID = set.getInt(7);
       if ( set.wasNull() )
           anObject.finDocID = Integer.MIN_VALUE;
       anObject.commentGen = set.getString(8);
       anObject.contractNumberServices = set.getString(9);
       anObject.contractDateServices = set.getDate(10);
       anObject.contragentName = set.getString(11);
       anObject.contragentAddress = set.getString(12);
       anObject.contragentAddressWork = set.getString(13);
       anObject.contragentOkpo = set.getString(14);
       anObject.contragentBankAccount = set.getString(15);
       anObject.contragentBankName = set.getString(16);
       anObject.contragentBankMfo = set.getString(17);
       anObject.contragentBossName = set.getString(18);
       anObject.contragentPassport = set.getString(19);
       anObject.contractServicesSumma = set.getBigDecimal(20);

       if(anObject.contractServicesSumma != null)
           anObject.contractServicesSumma = anObject.contractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.contractServicesPower = set.getBigDecimal(21);
       if(anObject.contractServicesPower != null)
           anObject.contractServicesPower = anObject.contractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.commentServicesGen = set.getString(22);
       anObject.contractServicesDistance = set.getBigDecimal(23);
       if(anObject.contractServicesDistance != null)
           anObject.contractServicesDistance = anObject.contractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.contractServicesDay = set.getBigDecimal(24);
       if(anObject.contractServicesDay != null)
           anObject.contractServicesDay = anObject.contractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.userGen = set.getString(25);
       anObject.dateEdit = set.getDate(26);

       anObject.departmentCode = set.getInt(27);
       if(set.wasNull())
           anObject.departmentCode = Integer.MIN_VALUE;
       anObject.departmentShortName = set.getString(28);
       anObject.departmentDateStart = set.getDate(29);
       anObject.departmentDateFinal = set.getDate(30);
       anObject.elementCode = set.getInt(31);
       if(set.wasNull())
           anObject.elementCode = Integer.MIN_VALUE;
       anObject.contractStatusRefCode = set.getInt(32);

       if(set.wasNull())
           anObject.contractStatusRefCode = Integer.MIN_VALUE;
       anObject.contractStatusRefName = set.getString(33);
       anObject.contractTypeRefCode = set.getInt(34);

       if(set.wasNull())
           anObject.contractTypeRefCode = Integer.MIN_VALUE;
       anObject.contractTypeRefName = set.getString(35);

       anObject.contragentTypeRefCode = set.getInt(36);
       if(set.wasNull())
           anObject.contragentTypeRefCode = Integer.MIN_VALUE;
       anObject.contragentTypeRefName = set.getString(37);
       anObject.billStatusRefCode = set.getInt(38);
       if(set.wasNull())
           anObject.billStatusRefCode = Integer.MIN_VALUE;
       anObject.billStatusRefName = set.getString(39);

       anObject.warrantRefCode = set.getInt(40);
       if(set.wasNull())
       anObject.warrantRefCode = Integer.MIN_VALUE;
       anObject.warrantRefNumbergen = set.getString(41);
       anObject.warrantRefName = set.getString(42);
       anObject.warrantRefWarrantFIO = set.getString(43);
       anObject.warrantRefWarrantPosition = set.getString(44);
       anObject.warrantRefPassport = set.getString(45);
       anObject.warrantRefAddress = set.getString(46);
       anObject.warrantRefPower = set.getInt(47);
       if ( set.wasNull() )
           anObject.warrantRefPower = Integer.MIN_VALUE;
       anObject.warrantRefMaxSum = set.getBigDecimal(48);
       if(anObject.warrantRefMaxSum != null)
         anObject.warrantRefMaxSum = anObject.warrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.warrantDate = set.getDate(49);
       anObject.warrantNumber = set.getString(50);
       anObject.warrantFIO = set.getString(51);
       anObject.warrantRefWarrantShortFIO = set.getString(52);
       anObject.regionalType = set.getInt(53);
       if ( set.wasNull() )
           anObject.regionalType = Integer.MIN_VALUE;

       anObject.statusRefCode = set.getInt(54);
       if(set.wasNull())
       anObject.statusRefCode = Integer.MIN_VALUE;
       anObject.statusRefName = set.getString(55);
       anObject.contragentPosition = set.getString(56);
       anObject.executeWorkDate = set.getDate(57);
       anObject.timeStart = set.getTimestamp(58);
       anObject.timeFinal = set.getTimestamp(59);
       anObject.contragentPhoneNumber = set.getString(60);
       anObject.executorPhoneNumber = set.getString(61);
       anObject.contragentObjectWork = set.getString(62);
      // ТЕХ УСЛОВИЯ
       anObject.techConObjectsCode = set.getInt(63);
       if(set.wasNull())
           anObject.techConObjectsCode = Integer.MIN_VALUE;
       anObject.techConObjectsNumberGen = set.getString(64);

       anObject.techConObjectsDateGen = set.getDate(65);
       anObject.techConObjectsCustomer = set.getString(66);
       anObject.techConObjectsBuilding = set.getString(67);
       anObject.techConObjectsAddress = set.getString(68);

       anObject.techConObjectsTyCurrentPower = set.getBigDecimal(69);
       if(anObject.techConObjectsTyCurrentPower != null)
       anObject.techConObjectsTyCurrentPower = anObject.techConObjectsTyCurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.techConObjectsTyServicesPower = set.getBigDecimal(70);
       if(anObject.techConObjectsTyServicesPower != null)
       anObject.techConObjectsTyServicesPower = anObject.techConObjectsTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.techConObjectsUserGen = set.getString(71);
       anObject.techConObjectsDateEdit = set.getDate(72);

       anObject.contractKindRefCode = set.getInt(73);
       if(set.wasNull())
       anObject.contractKindRefCode = Integer.MIN_VALUE;
       anObject.contractKindRefName = set.getString(74);

       anObject.payDate = set.getDate(75);
       anObject.finPayFormCode = set.getInt(76);
       if ( set.wasNull() )
           anObject.finPayFormCode = Integer.MIN_VALUE;
       anObject.finPayFormName = set.getString(77);

       anObject.payDetail = set.getString(78);

       anObject.isCustomerMaterials = set.getInt(79);
       if ( set.wasNull() )
           anObject.isCustomerMaterials = Integer.MIN_VALUE;

       anObject.cnPackCode = set.getInt(80);
       if ( set.wasNull() )
           anObject.cnPackCode = Integer.MIN_VALUE;
       anObject.cnSubsystemTypeRefCode = set.getInt(81);
       if(set.wasNull())
       anObject.cnSubsystemTypeRefCode = Integer.MIN_VALUE;
       anObject.cnSubsystemTypeRefName = set.getString(82);
       anObject.techConObjectsConnectionPowerPlaces = set.getString(83);
       anObject.techConObjectsConnectionPowerPoint = set.getString(84);

       anObject.calcTypeRefCode = set.getInt(85);
       if(set.wasNull())
       anObject.calcTypeRefCode = Integer.MIN_VALUE;
       anObject.calcTypeRefName = set.getString(86);

       if ( set.wasNull() )
           anObject.prevContractStatus = Integer.MIN_VALUE;
       anObject.personalAccountCode = set.getInt(87);
       if ( set.wasNull() )
           anObject.personalAccountCode = Integer.MIN_VALUE;
       anObject.personalAccountNumber = set.getString(88);


        anObject.axPartnerCode = set.getString(89);
		anObject.axPartnerName = set.getString(90);
		anObject.axContractNumber = set.getString(91);
		anObject.axContractDate = set.getDate(92);
		anObject.axContractCode = set.getString(93);
		anObject.axContractId = set.getString(94);
		anObject.axContractCommentGen = set.getString(95);

		anObject.generalContractRefCode = set.getInt("ENGENERALCONTRACTSCODE");
		if(set.wasNull() )
			anObject.generalContractRefCode = Integer.MIN_VALUE;
		//
		anObject.term = set.getInt(97);
		if ( set.wasNull() ) {
			anObject.term = Integer.MIN_VALUE;
		}
		anObject.regulation = set.getInt(98);
		if ( set.wasNull() ) {
			anObject.regulation = Integer.MIN_VALUE;
		}
		anObject.boundaryDateWork = set.getDate(99);
		anObject.countDayDelay = set.getInt(100);
		if ( set.wasNull() ) {
			anObject.countDayDelay = Integer.MIN_VALUE;
		}
		anObject.factDateWork = set.getDate(101);
		//

		if(set.wasNull()) {
			anObject.actIncomeCreatMetodRefCode = Integer.MIN_VALUE;
		}
		anObject.actIncomeCreatMetodRefName = set.getString(102);

		anObject.codeEIC = set.getString(103);
		anObject.personalAccountUid = set.getString(104);


		anObject.customerMailingAddress = set.getString(105);

		anObject.powerGeneration = set.getBigDecimal(106);
		if(anObject.powerGeneration != null) {
			anObject.powerGeneration = anObject.powerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
		}

		anObject.postCode = set.getString(107);


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



  public int[] getFilteredCodeArrayNOSEGR(ENServicesObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
  {
    return getFilteredCodeArrayNOSEGR(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
  }


public int[] getFilteredCodeArrayNOSEGR(ENServicesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector<? extends Object> aBindObjects) throws PersistenceException
 {
  Vector<Integer> result = new Vector<>();

  Connection connection = getConnection();
  PreparedStatement statement = null;
  ResultSet  set = null;
  String     selectStr = "SELECT ENSERVICESOBJECT.CODE FROM ENSERVICESOBJECT";
  String     whereStr = "";
  String     condition = processCondition(anCondition);
  String     orderBy = processCondition(anOrderBy);

  if(orderBy.length() == 0)
   orderBy = "ENSERVICESOBJECT.CODE";

  if(quantity < 0)
   quantity = Integer.MAX_VALUE/2;

  if(getUserProfile() == null)
   throw new PersistenceException("Internal Error (User Profile Is Undefined)");

  /*
  SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
  if(segregationInfo.isAccessDenied())
    throw new PersistenceException("{%ENServicesObject.getList%} access denied");

  whereStr = SegregationQueryBuilder.addWhere("ENSERVICESOBJECT",segregationInfo,getUserProfile().getDomainInfo());


  if(whereStr.length() == 0)
   whereStr = " (ENSERVICESOBJECT.DOMAIN_INFO IS NOT NULL) ";
  else
   whereStr = " "+whereStr;
  */

    if(aFilterObject != null)
    {
      if(aFilterObject.code != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.CODE = ?";
      }
       if (aFilterObject.contractNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTNUMBER = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTNUMBER LIKE ?";
       }
      if(aFilterObject.contractDate != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTDATE = ?";
      }
       if (aFilterObject.name != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.NAME = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.NAME LIKE ?";
       }
       if (aFilterObject.partnerCode != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.PARTNERCODE = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.PARTNERCODE LIKE ?";
       }
       if (aFilterObject.finDocCode != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.FINDOCCODE = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.FINDOCCODE LIKE ?";
       }
      if(aFilterObject.finDocID != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.FINDOCID = ?";
      }
       if (aFilterObject.commentGen != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.COMMENTGEN = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.COMMENTGEN LIKE ?";
       }
       if (aFilterObject.contractNumberServices != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contractNumberServices.indexOf('*',0) < 0 && aFilterObject.contractNumberServices.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTNUMBERSERVICES = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTNUMBERSERVICES LIKE ?";
       }
      if(aFilterObject.contractDateServices != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTDATESERVICES = ?";
      }
       if (aFilterObject.contragentName != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTNAME = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTNAME LIKE ?";
       }
       if (aFilterObject.contragentAddress != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTADDRESS = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTADDRESS LIKE ?";
       }
       if (aFilterObject.contragentAddressWork != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentAddressWork.indexOf('*',0) < 0 && aFilterObject.contragentAddressWork.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTADDRESSWORK = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTADDRESSWORK LIKE ?";
       }
       if (aFilterObject.contragentOkpo != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentOkpo.indexOf('*',0) < 0 && aFilterObject.contragentOkpo.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTOKPO = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTOKPO LIKE ?";
       }
       if (aFilterObject.contragentBankAccount != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentBankAccount.indexOf('*',0) < 0 && aFilterObject.contragentBankAccount.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT LIKE ?";
       }
       if (aFilterObject.contragentBankName != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentBankName.indexOf('*',0) < 0 && aFilterObject.contragentBankName.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTBANKNAME = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTBANKNAME LIKE ?";
       }
       if (aFilterObject.contragentBankMfo != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentBankMfo.indexOf('*',0) < 0 && aFilterObject.contragentBankMfo.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTBANKMFO = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTBANKMFO LIKE ?";
       }
       if (aFilterObject.contragentBossName != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentBossName.indexOf('*',0) < 0 && aFilterObject.contragentBossName.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTBOSSNAME = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTBOSSNAME LIKE ?";
       }
       if (aFilterObject.contragentPassport != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTPASSPORT = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTPASSPORT LIKE ?";
       }
      if(aFilterObject.contractServicesSumma != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTSERVICESSUMMA = ?";
      }
      if(aFilterObject.contractServicesPower != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTSERVICESPOWER = ?";
      }
       if (aFilterObject.commentServicesGen != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.commentServicesGen.indexOf('*',0) < 0 && aFilterObject.commentServicesGen.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.COMMENTSERVICESGEN = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.COMMENTSERVICESGEN LIKE ?";
       }
      if(aFilterObject.contractServicesDistance != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTSERVICESDISTNC = ?";
      }
      if(aFilterObject.contractServicesDay != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTSERVICESDAY = ?";
      }
       if (aFilterObject.userGen != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.USERGEN = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.USERGEN LIKE ?";
       }
      if(aFilterObject.dateEdit != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.DATEEDIT = ?";
      }
      if(aFilterObject.warrantDate != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.WARRANTDATE = ?";
      }
       if (aFilterObject.warrantNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.warrantNumber.indexOf('*',0) < 0 && aFilterObject.warrantNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.WARRANTNUMBER = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.WARRANTNUMBER LIKE ?";
       }
       if (aFilterObject.warrantFIO != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.warrantFIO.indexOf('*',0) < 0 && aFilterObject.warrantFIO.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.WARRANTFIO = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.WARRANTFIO LIKE ?";
       }
      if(aFilterObject.regionalType != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.REGIONALTYPE = ?";
      }
      if(aFilterObject.basisType != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.BASISTYPE = ?";
      }
       if (aFilterObject.contragentPosition != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentPosition.indexOf('*',0) < 0 && aFilterObject.contragentPosition.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTPOSITION = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTPOSITION LIKE ?";
       }
      if(aFilterObject.executeWorkDate != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.EXECUTEWORKDATE = ?";
      }
      if(aFilterObject.timeStart != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.TIMESTART = ?";
      }
      if(aFilterObject.timeFinal != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.TIMEFINAL = ?";
      }
       if (aFilterObject.contragentPhoneNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentPhoneNumber.indexOf('*',0) < 0 && aFilterObject.contragentPhoneNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTPHONENUMBER = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTPHONENUMBER LIKE ?";
       }
       if (aFilterObject.executorPhoneNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.executorPhoneNumber.indexOf('*',0) < 0 && aFilterObject.executorPhoneNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.EXECUTORPHONENUMBER = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.EXECUTORPHONENUMBER LIKE ?";
       }
       if (aFilterObject.contragentObjectWork != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.contragentObjectWork.indexOf('*',0) < 0 && aFilterObject.contragentObjectWork.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTOBJECTWORK = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.CONTRAGENTOBJECTWORK LIKE ?";
       }
      if(aFilterObject.isNoPay != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.ISNOPAY = ?";
      }
      if(aFilterObject.isCustomerMaterials != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.ISCUSTOMERMATERIALS = ?";
      }
      if(aFilterObject.payDate != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.PAYDATE = ?";
      }
      if(aFilterObject.finPayFormCode != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.FINPAYFORMCODE = ?";
      }
       if (aFilterObject.finPayFormName != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.finPayFormName.indexOf('*',0) < 0 && aFilterObject.finPayFormName.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.FINPAYFORMNAME = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.FINPAYFORMNAME LIKE ?";
       }
      if(aFilterObject.partnerId != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.PARTNERID = ?";
      }
       if (aFilterObject.payDetail != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.payDetail.indexOf('*',0) < 0 && aFilterObject.payDetail.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.PAYDETAIL = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.PAYDETAIL LIKE ?";
       }
       if (aFilterObject.actTransferNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.actTransferNumber.indexOf('*',0) < 0 && aFilterObject.actTransferNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.ACTTRANSFERNUMBER = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.ACTTRANSFERNUMBER LIKE ?";
       }
      if(aFilterObject.actTransferDate != null) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.ACTTRANSFERDATE = ?";
      }
       if (aFilterObject.resposible != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.resposible.indexOf('*',0) < 0 && aFilterObject.resposible.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.RESPOSIBLE = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.RESPOSIBLE LIKE ?";
       }
       if (aFilterObject.resposiblePosition != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.resposiblePosition.indexOf('*',0) < 0 && aFilterObject.resposiblePosition.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.RESPOSIBLEPOSITION = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.RESPOSIBLEPOSITION LIKE ?";
       }
       if (aFilterObject.resposibleTabNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.resposibleTabNumber.indexOf('*',0) < 0 && aFilterObject.resposibleTabNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.RESPOSIBLETABNUMBER = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.RESPOSIBLETABNUMBER LIKE ?";
       }
       if (aFilterObject.domain_info != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
               whereStr = whereStr + "  ENSERVICESOBJECT.DOMAIN_INFO = ?";
           else
               whereStr = whereStr + "  ENSERVICESOBJECT.DOMAIN_INFO LIKE ?";
       }
      if(aFilterObject.modify_time != Long.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.MODIFY_TIME = ?";
      }
      if(aFilterObject.cnPackCode != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  ENSERVICESOBJECT.CNPACKCODE = ?";
      }
      if(aFilterObject.department.code != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + " ENSERVICESOBJECT.DEPARTMENTCODE = ? ";
      }
      if(aFilterObject.element.code != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + " ENSERVICESOBJECT.ELEMENTCODE = ? ";
      }
      if(aFilterObject.contractStatusRef.code != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + " ENSERVICESOBJECT.CONTRACTSTATUSREFCODE = ? ";
      }
      if(aFilterObject.contractTypeRef.code != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + " ENSERVICESOBJECT.CONTRACTTYPEREFCODE = ? ";
      }
      if(aFilterObject.contragentTypeRef.code != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTTYPEREFCODE = ? ";
      }
      if(aFilterObject.billStatusRef.code != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + " ENSERVICESOBJECT.BILLSTATUSREFCODE = ? ";
      }
      if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + " ENSERVICESOBJECT.WARRANTREFCODE = ? ";
      }
      if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + " ENSERVICESOBJECT.STATUSREFCODE = ? ";
      }
      if(aFilterObject.techConObjects.code != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + " ENSERVICESOBJECT.TECHCONOBJECTSCODE = ? ";
      }
      if(aFilterObject.contractKindRef.code != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + " ENSERVICESOBJECT.CONTRACTKINDREFCODE = ? ";
      }
      if(aFilterObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + " ENSERVICESOBJECT.CNSUBSYSTEMTYPEREFCODE = ? ";
      }
      if(aFilterObject.calcTypeRef.code != Integer.MIN_VALUE) {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + " ENSERVICESOBJECT.CALCTYPEREFCODE = ? ";
      }

    }

    if(condition.length() != 0)
    {
       if(whereStr.length() != 0)
          whereStr = whereStr + " AND ";
       whereStr = whereStr + " (" + condition + ")";
    }

   if(whereStr.length() != 0)
       selectStr = selectStr + " WHERE " + whereStr;

  selectStr = selectStr + " ORDER BY " + orderBy;

  try
   {
    statement = connection.prepareStatement(selectStr);
    int number = 0;
    if(aFilterObject != null){
       if(aFilterObject.code != Integer.MIN_VALUE){
           number++;
           statement.setInt(number,aFilterObject.code);
       }
       if (aFilterObject.contractNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRACTNUMBER = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRACTNUMBER LIKE ?";

         if(aFilterObject.contractNumber != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contractNumber);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
      if(aFilterObject.contractDate != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.contractDate.getTime()));
      }
       if (aFilterObject.name != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.NAME = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.NAME LIKE ?";

         if(aFilterObject.name != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.name);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.partnerCode != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.PARTNERCODE = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.PARTNERCODE LIKE ?";

         if(aFilterObject.partnerCode != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.partnerCode);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.finDocCode != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.FINDOCCODE = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.FINDOCCODE LIKE ?";

         if(aFilterObject.finDocCode != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.finDocCode);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if(aFilterObject.finDocID != Integer.MIN_VALUE){
           number++;
           statement.setInt(number,aFilterObject.finDocID);
       }
       if (aFilterObject.commentGen != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.COMMENTGEN = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.COMMENTGEN LIKE ?";

         if(aFilterObject.commentGen != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.commentGen);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.contractNumberServices != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contractNumberServices.indexOf('*',0) < 0 && aFilterObject.contractNumberServices.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRACTNUMBERSERVICES = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRACTNUMBERSERVICES LIKE ?";

         if(aFilterObject.contractNumberServices != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contractNumberServices);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
      if(aFilterObject.contractDateServices != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.contractDateServices.getTime()));
      }
       if (aFilterObject.contragentName != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTNAME = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTNAME LIKE ?";

         if(aFilterObject.contragentName != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contragentName);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.contragentAddress != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTADDRESS = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTADDRESS LIKE ?";

         if(aFilterObject.contragentAddress != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contragentAddress);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.contragentAddressWork != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contragentAddressWork.indexOf('*',0) < 0 && aFilterObject.contragentAddressWork.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTADDRESSWORK = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTADDRESSWORK LIKE ?";

         if(aFilterObject.contragentAddressWork != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contragentAddressWork);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.contragentOkpo != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contragentOkpo.indexOf('*',0) < 0 && aFilterObject.contragentOkpo.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTOKPO = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTOKPO LIKE ?";

         if(aFilterObject.contragentOkpo != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contragentOkpo);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.contragentBankAccount != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contragentBankAccount.indexOf('*',0) < 0 && aFilterObject.contragentBankAccount.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT LIKE ?";

         if(aFilterObject.contragentBankAccount != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contragentBankAccount);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.contragentBankName != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contragentBankName.indexOf('*',0) < 0 && aFilterObject.contragentBankName.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTBANKNAME = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTBANKNAME LIKE ?";

         if(aFilterObject.contragentBankName != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contragentBankName);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.contragentBankMfo != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contragentBankMfo.indexOf('*',0) < 0 && aFilterObject.contragentBankMfo.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTBANKMFO = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTBANKMFO LIKE ?";

         if(aFilterObject.contragentBankMfo != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contragentBankMfo);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.contragentBossName != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contragentBossName.indexOf('*',0) < 0 && aFilterObject.contragentBossName.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTBOSSNAME = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTBOSSNAME LIKE ?";

         if(aFilterObject.contragentBossName != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contragentBossName);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.contragentPassport != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTPASSPORT = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTPASSPORT LIKE ?";

         if(aFilterObject.contragentPassport != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contragentPassport);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
      if(aFilterObject.contractServicesSumma != null){
          number++;
          aFilterObject.contractServicesSumma = aFilterObject.contractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
          statement.setBigDecimal(number,aFilterObject.contractServicesSumma);
      }
      if(aFilterObject.contractServicesPower != null){
          number++;
          aFilterObject.contractServicesPower = aFilterObject.contractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          statement.setBigDecimal(number,aFilterObject.contractServicesPower);
      }
       if (aFilterObject.commentServicesGen != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.commentServicesGen.indexOf('*',0) < 0 && aFilterObject.commentServicesGen.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.COMMENTSERVICESGEN = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.COMMENTSERVICESGEN LIKE ?";

         if(aFilterObject.commentServicesGen != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.commentServicesGen);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
      if(aFilterObject.contractServicesDistance != null){
          number++;
          aFilterObject.contractServicesDistance = aFilterObject.contractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          statement.setBigDecimal(number,aFilterObject.contractServicesDistance);
      }
      if(aFilterObject.contractServicesDay != null){
          number++;
          aFilterObject.contractServicesDay = aFilterObject.contractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
          statement.setBigDecimal(number,aFilterObject.contractServicesDay);
      }
       if (aFilterObject.userGen != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.USERGEN = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.USERGEN LIKE ?";

         if(aFilterObject.userGen != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.userGen);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
      if(aFilterObject.dateEdit != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
      }
      if(aFilterObject.warrantDate != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.warrantDate.getTime()));
      }
       if (aFilterObject.warrantNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.warrantNumber.indexOf('*',0) < 0 && aFilterObject.warrantNumber.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.WARRANTNUMBER = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.WARRANTNUMBER LIKE ?";

         if(aFilterObject.warrantNumber != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.warrantNumber);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.warrantFIO != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.warrantFIO.indexOf('*',0) < 0 && aFilterObject.warrantFIO.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.WARRANTFIO = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.WARRANTFIO LIKE ?";

         if(aFilterObject.warrantFIO != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.warrantFIO);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if(aFilterObject.regionalType != Integer.MIN_VALUE){
           number++;
           statement.setInt(number,aFilterObject.regionalType);
       }
      if(aFilterObject.basisType != null){
          number++;
          aFilterObject.basisType = aFilterObject.basisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
          statement.setBigDecimal(number,aFilterObject.basisType);
      }
       if (aFilterObject.contragentPosition != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contragentPosition.indexOf('*',0) < 0 && aFilterObject.contragentPosition.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTPOSITION = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTPOSITION LIKE ?";

         if(aFilterObject.contragentPosition != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contragentPosition);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
      if(aFilterObject.executeWorkDate != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.executeWorkDate.getTime()));
      }
      if(aFilterObject.timeStart != null){
          number++;
          statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
      }
      if(aFilterObject.timeFinal != null){
          number++;
          statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
      }
       if (aFilterObject.contragentPhoneNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contragentPhoneNumber.indexOf('*',0) < 0 && aFilterObject.contragentPhoneNumber.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTPHONENUMBER = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTPHONENUMBER LIKE ?";

         if(aFilterObject.contragentPhoneNumber != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contragentPhoneNumber);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.executorPhoneNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.executorPhoneNumber.indexOf('*',0) < 0 && aFilterObject.executorPhoneNumber.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.EXECUTORPHONENUMBER = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.EXECUTORPHONENUMBER LIKE ?";

         if(aFilterObject.executorPhoneNumber != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.executorPhoneNumber);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.contragentObjectWork != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.contragentObjectWork.indexOf('*',0) < 0 && aFilterObject.contragentObjectWork.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTOBJECTWORK = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.CONTRAGENTOBJECTWORK LIKE ?";

         if(aFilterObject.contragentObjectWork != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.contragentObjectWork);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if(aFilterObject.isNoPay != Integer.MIN_VALUE){
           number++;
           statement.setInt(number,aFilterObject.isNoPay);
       }
       if(aFilterObject.isCustomerMaterials != Integer.MIN_VALUE){
           number++;
           statement.setInt(number,aFilterObject.isCustomerMaterials);
       }
      if(aFilterObject.payDate != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.payDate.getTime()));
      }
       if(aFilterObject.finPayFormCode != Integer.MIN_VALUE){
           number++;
           statement.setInt(number,aFilterObject.finPayFormCode);
       }
       if (aFilterObject.finPayFormName != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.finPayFormName.indexOf('*',0) < 0 && aFilterObject.finPayFormName.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.FINPAYFORMNAME = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.FINPAYFORMNAME LIKE ?";

         if(aFilterObject.finPayFormName != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.finPayFormName);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if(aFilterObject.partnerId != Integer.MIN_VALUE){
           number++;
           statement.setInt(number,aFilterObject.partnerId);
       }
       if (aFilterObject.payDetail != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.payDetail.indexOf('*',0) < 0 && aFilterObject.payDetail.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.PAYDETAIL = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.PAYDETAIL LIKE ?";

         if(aFilterObject.payDetail != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.payDetail);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.actTransferNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.actTransferNumber.indexOf('*',0) < 0 && aFilterObject.actTransferNumber.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.ACTTRANSFERNUMBER = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.ACTTRANSFERNUMBER LIKE ?";

         if(aFilterObject.actTransferNumber != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.actTransferNumber);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
      if(aFilterObject.actTransferDate != null){
          number++;
          statement.setDate(number,new java.sql.Date(aFilterObject.actTransferDate.getTime()));
      }
       if (aFilterObject.resposible != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.resposible.indexOf('*',0) < 0 && aFilterObject.resposible.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.RESPOSIBLE = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.RESPOSIBLE LIKE ?";

         if(aFilterObject.resposible != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.resposible);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.resposiblePosition != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.resposiblePosition.indexOf('*',0) < 0 && aFilterObject.resposiblePosition.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.RESPOSIBLEPOSITION = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.RESPOSIBLEPOSITION LIKE ?";

         if(aFilterObject.resposiblePosition != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.resposiblePosition);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.resposibleTabNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.resposibleTabNumber.indexOf('*',0) < 0 && aFilterObject.resposibleTabNumber.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.RESPOSIBLETABNUMBER = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.RESPOSIBLETABNUMBER LIKE ?";

         if(aFilterObject.resposibleTabNumber != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.resposibleTabNumber);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
       if (aFilterObject.domain_info != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND";
           if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
               whereStr = whereStr + " ENSERVICESOBJECT.DOMAIN_INFO = ?";
           else
               whereStr = whereStr + " ENSERVICESOBJECT.DOMAIN_INFO LIKE ?";

         if(aFilterObject.domain_info != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.domain_info);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
       }
      if(aFilterObject.modify_time != Long.MIN_VALUE){
          number++;
          if(aFilterObject.modify_time == Long.MIN_VALUE)
              statement.setBigDecimal(number,null);
          else
              statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
      }
       if(aFilterObject.cnPackCode != Integer.MIN_VALUE){
           number++;
           statement.setInt(number,aFilterObject.cnPackCode);
       }
     if(aFilterObject.department.code != Integer.MIN_VALUE) {
         number++;
         statement.setInt(number,aFilterObject.department.code);
     }
     if(aFilterObject.element.code != Integer.MIN_VALUE) {
         number++;
         statement.setInt(number,aFilterObject.element.code);
     }
     if(aFilterObject.contractStatusRef.code != Integer.MIN_VALUE) {
         number++;
         statement.setInt(number,aFilterObject.contractStatusRef.code);
     }
     if(aFilterObject.contractTypeRef.code != Integer.MIN_VALUE) {
         number++;
         statement.setInt(number,aFilterObject.contractTypeRef.code);
     }
     if(aFilterObject.contragentTypeRef.code != Integer.MIN_VALUE) {
         number++;
         statement.setInt(number,aFilterObject.contragentTypeRef.code);
     }
     if(aFilterObject.billStatusRef.code != Integer.MIN_VALUE) {
         number++;
         statement.setInt(number,aFilterObject.billStatusRef.code);
     }
     if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
         number++;
         statement.setInt(number,aFilterObject.warrantRef.code);
     }
     if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
         number++;
         statement.setInt(number,aFilterObject.statusRef.code);
     }
     if(aFilterObject.techConObjects.code != Integer.MIN_VALUE) {
         number++;
         statement.setInt(number,aFilterObject.techConObjects.code);
     }
     if(aFilterObject.contractKindRef.code != Integer.MIN_VALUE) {
         number++;
         statement.setInt(number,aFilterObject.contractKindRef.code);
     }
     if(aFilterObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
         number++;
         statement.setInt(number,aFilterObject.cnSubsystemTypeRef.code);
     }
     if(aFilterObject.calcTypeRef.code != Integer.MIN_VALUE) {
         number++;
         statement.setInt(number,aFilterObject.calcTypeRef.code);
     }
    }

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

      result.add(new Integer(set.getInt(1)));
     }

    int[] array;

    array = new int[result.size()];
    for(int j = 0;j < result.size();j++)
     array[j] = ((Integer)result.get(j)).intValue();

    return array;
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


  } // end of getFilteredCodeArray


	public ENServicesObject getObjectNoRef(int uid) throws PersistenceException {

		boolean noSegregation = true;
		boolean noReferences = true;

		ENServicesObject result = new ENServicesObject();
		result.code = uid;
		loadObject(result, noSegregation, noReferences);
		if (result.code == Integer.MIN_VALUE)
			return null;
		return result;
	}

	public ENServicesObject getObjectNoSegr(int uid) throws PersistenceException {

		boolean noSegregation = true;

		ENServicesObject result = new ENServicesObject();
		result.code = uid;
		loadObject(result, noSegregation);
		if (result.code == Integer.MIN_VALUE)
			return null;
		return result;
	}

  public void updateDateStartDateFinalWorkingByService(ENServicesObject anObject) throws PersistenceException
  {
    Connection connection = getConnection();

    SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");

        String updServices =
            "UPDATE enservicesobject SET executeworkdate = ? , " +

        ((anObject.timeStart == null) ? " timestart = null , timefinal = null " :
                " timestart = '" + sdf.format(anObject.timeStart) + "' , timefinal = '" + sdf.format(anObject.timeFinal) + "' " ) +


            " WHERE CODE = ?";

        PreparedStatement statement = null;

        try
        {
            statement = connection.prepareStatement(updServices);

            if (anObject.executeWorkDate == null)
                statement.setDate(1,null);
            else
                statement.setDate(1,new java.sql.Date(anObject.executeWorkDate.getTime()));

        /* if (anObject.timeStart == null)
                statement.setDate(2,null);
            else
                statement.setTimestamp(2,new java.sql.Timestamp(anObject.timeStart.getTime()));

            if (anObject.timeFinal == null)
                statement.setDate(3,null);
            else
                statement.setTimestamp(3,new java.sql.Timestamp(anObject.timeFinal.getTime()));

            */

            statement.setInt(2,anObject.code);

            //statement.execute();

            statement.executeUpdate();

        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + updServices + "\n servicesCode = " + anObject.code);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
  }


  public void updateContractServicesSum(int servicesObjectCode, BigDecimal contractServicesSumma) throws PersistenceException
  {
        if (servicesObjectCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("Не задан код договора по услугам на сторону!");
        }

        Connection connection = getConnection();

        String updServices =
            "UPDATE enservicesobject SET contractservicessumma = ? " +
            " WHERE CODE = ?";

        PreparedStatement statement = null;

        try
        {
            statement = connection.prepareStatement(updServices);

            if (contractServicesSumma != null)
            contractServicesSumma = contractServicesSumma.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(1, contractServicesSumma);
            statement.setInt(2, servicesObjectCode);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + updServices + "\n servicesCode = " + servicesObjectCode);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
  }

  public void updateActTransfer(int servicesObjectCode, String actTransferNumber, Date actTransferDate) throws PersistenceException
  {
        if (servicesObjectCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("\n \n NET-3079 Не задано код договору з послуг на сторону!");
        }

        Connection connection = getConnection();

        String updServices =
            "UPDATE enservicesobject SET acttransfernumber = ?, acttransferdate = ? " +
            " WHERE CODE = ?";

        PreparedStatement statement = null;

        try
        {
            statement = connection.prepareStatement(updServices);

            statement.setString(1, actTransferNumber);
            if (actTransferDate == null)
                statement.setDate(2,null);
            else
                statement.setDate(2,new java.sql.Date(actTransferDate.getTime()));
            statement.setInt(3, servicesObjectCode);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + updServices + "\n servicesCode = " + servicesObjectCode);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
  }


	@Override
	public int add(ENServicesObject anObject) throws PersistenceException {

		if (anObject.createdFromSite == Integer.MIN_VALUE) {
			anObject.createdFromSite = ENConsts.CREATED_FROM_SITE_NO;
		}

		if (anObject.isCustomerMaterials == Integer.MIN_VALUE) {
			anObject.isCustomerMaterials = 0;
		}

	    //SUPP-50044. Враховуючи роз'яснення НКРЕ КП стосовно необхідності відшкодування
		//замовником витрат електропередавальної організації на розробку Технічних Умов
		//та договору приєднання до електричних мереж будівельних струмоприймачів,
		//тимчасових (сезонних) або віддалених географічно об'єктів, в EnergyNet та
		//EnergyWorkflow передбачено можливість формування договору підготовки ТУ
		// +++ 01.06.2016 р. знято заборону створення договорів підготовки ТУ від 17.04.2013 р.

		//if (anObject.contractTypeRef.code == ENServicesContractType.TY) {
	    //	throw new EnergyproSystemException("\n \n " +
	    //			" Заборонено укладання договорів на підготовку ТУ!!!");}


	    ///// 21.05.13 Пока всем договорам ставим старый метод. /////////////////////////////////////////
	    //    Для запуска нового функционала - присваивать ENServicesObjectCalcType.BY_FACT !!!!!

	    ///// 16.05.13 NET-4235
	    // 21.05.13 Для запуска нового функционала вернуть этот кусок!
	    // Для всех новых договоров - новый метод расчета
	    // Для нелицензионных услуг сделаем вид расчета согласно калькуляции
        if (anObject.calcTypeRef.code == Integer.MIN_VALUE || anObject.calcTypeRef == null)
        {
            if (anObject.contractTypeRef.code == Integer.MIN_VALUE || anObject.contractTypeRef == null)
               {anObject.calcTypeRef.code = ENServicesObjectCalcType.BY_FACT;}
            else
            	anObject.calcTypeRef.code = ENServicesObjectCalcType.BY_CALCULATION;
        }
        /////
        /////////////////////////////////////////////////////////////////////////////////////////////////

        /** SUPP-5137... 11.07.2013 +++ тип договора по умолчанию... */
		if (anObject.contractTypeRef.code == Integer.MIN_VALUE || anObject.contractTypeRef == null) {
			anObject.contractTypeRef.code = ENServicesContractType.OTHERS;
		}

		/** 05.09.2017... +++ по умолчанию - платный.... */
		if (anObject.isNoPay == Integer.MIN_VALUE || anObject.isCustomerMaterials == -1) {
			anObject.isNoPay = ENConsts.ENSERVICES_OBJECT_ISPAY;
		}

		/**
		 *	NET-4567... +++ метод формирования доходгого акта предполагает
		 *	закрытие работ по договору одним или несколькими доходными актами....
		 *  по умолчанию - одним...
		 *
		 */
		if (anObject.actIncomeCreatMetodRef == null
				|| anObject.actIncomeCreatMetodRef.code == Integer.MIN_VALUE) {

			anObject.actIncomeCreatMetodRef.code = ENActIncomeCreatMetod.SINGLE;
		}


		return super.add(anObject);
	}



	@Override
	public void save(ENServicesObject servicesObject)
			throws PersistenceException {

		this.save(servicesObject, false);
	}

	public void save(ENServicesObject anObject, boolean saveTU)
			throws PersistenceException {


		anObject.userGen = getUserProfile().userName;
		anObject.dateEdit = new Date();


		if (anObject.createdFromSite == Integer.MIN_VALUE) {
			anObject.createdFromSite = ENConsts.CREATED_FROM_SITE_NO;
		}

		if (anObject.isCustomerMaterials == Integer.MIN_VALUE) {
			anObject.isCustomerMaterials = 0;
		}

	    /** 12.04.2013 +++ старые договора пусть редактируют */
	    ENServicesObject oldObject = getObject(anObject.code);
	    if (!saveTU) {
		    if (oldObject.contractTypeRef.code != ENServicesContractType.TY
		            && anObject.contractTypeRef.code == ENServicesContractType.TY) {
		        throw new EnergyproSystemException("\n \n " +
		                " Заборонено укладання договорів на підготовку ТУ!!!");
		    }
	    }


	    ///// 16.05.13 NET-4235
	    int oldObjCalcTypeCode = Integer.MIN_VALUE;

	    if (oldObject.calcTypeRef != null)
	    {
	        oldObjCalcTypeCode = oldObject.calcTypeRef.code;
	    }

	    if (oldObjCalcTypeCode == Integer.MIN_VALUE)
	    {
	        throw new EnergyproSystemException("\n\nNET-4235 Невизначено тип розрахунку для договору! Код договору: " + anObject.code);
	    }

    if (anObject.calcTypeRef == null)
    {
        //anObject.calcTypeRef.code = oldObjCalcTypeCode;
        throw new EnergyproSystemException("\n\nNET-4235 Ви використовуєте застарілу версію програми! Перезайдіть, будь ласка, у програму!");
    }

    if (anObject.calcTypeRef.code == Integer.MIN_VALUE)
    {
        //anObject.calcTypeRef.code = oldObjCalcTypeCode;
        throw new EnergyproSystemException("\n\nNET-4235 Ви використовуєте застарілу версію програми! Перезайдіть, будь ласка, у програму!");
    }
    /////


    /** добавление и проверка договора на наличие в АХ и ФК */
    //// DEBUG !!!!!


	    if (anObject.finDocCode != null && !anObject.finDocCode.equals("")) {

	    	if (anObject.contractNumber != null && !anObject.contractNumber.equals("")) {

	    		boolean isCustomer = true;
	    		boolean isException = true;
	        	ContractLogic contractLogic = new ContractLogic(getConnection(), getUserProfile());
					anObject.generalContractRef.code = contractLogic
							.addByContractNumber(anObject.contractNumber, anObject.partnerCode, anObject.finDocCode, isCustomer, isException);

	        }
	    }



	    if (anObject.warrantRef.code == Integer.MIN_VALUE) {

			/** доверенность по умолчанию */
			if (anObject.department != null
					&& anObject.department.code != Integer.MIN_VALUE) {

				/** услуги на сторону */
				if (anObject.contractKindRef.code == ENServicesContractKind.SERVICES
						&& anObject.contractTypeRef.code == ENServicesContractType.OTHERS) {

					ENWarrant4DepartmentDAO warrant4DepartmentDao = new ENWarrant4DepartmentDAO(getConnection(), getUserProfile());

					ENWarrant4DepartmentFilter warrant4DepartmentFilter = new ENWarrant4DepartmentFilter();
					warrant4DepartmentFilter.departmentRef.code = anObject.department.code;
					warrant4DepartmentFilter.agreementKindRef.code = ENAgreementKind.SERVICES;

					ENWarrant4DepartmentShortList warrant4DepartmentShortList = warrant4DepartmentDao.getScrollableFilteredList(warrant4DepartmentFilter, 0, -1);
					for (ENWarrant4DepartmentShort warrant4DepartmentShort : warrant4DepartmentShortList.list) {

						if (anObject.contractServicesSumma != null && warrant4DepartmentShort.warrantRefMaxSum != null) {

							if (anObject.contractServicesSumma.doubleValue() <= warrant4DepartmentShort.warrantRefMaxSum.doubleValue()) {
								anObject.warrantRef.code = warrant4DepartmentShort.warrantRefCode;

								break;
							}
						}
					}

				}
			}
		}




		super.save(anObject);
		/* NET-3264 */ this.updateDateStartDateFinalWorkingByService(anObject);

		ServicesLogic sLogic = new ServicesLogic(getConnection(), getUserProfile());
		sLogic.setServicesConsumerInfo(anObject.code);
	}


  /**
   *  Получить дату проведения по коду договора
   *
   *  @param soCodes - код договора
   *  @return datePostings - дата проведения
   */
    public Date getDatePostingsByServicesCode(int soCodes)
            throws PersistenceException {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        Date datePostings = null;
        String SQL = "select p.dateposting from enservicesobject2prov p " +
                " where p.servicesobjectrefcode = " + soCodes;

        try {
            statement = connection.prepareStatement(SQL);

            set = statement.executeQuery();
            if (set.next()) {
                datePostings = set.getDate(1);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + SQL);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
        return datePostings;
    }


	public void updateContractServicesStatus(int servicesObjectCode)
			throws PersistenceException {

		Connection connection = getConnection();

		ENServicesObject servicesObject = getObjectNoRef(servicesObjectCode);


		String updServices = "update enservicesobject set contractstatusrefcode = "
				+ ENServicesContractStatus.TERMINATED
				+ ", commentservicesgen = coalesce(commentservicesgen,'') || ' Втрачено чинність після спливу терміну сплати суми.' "
				+ " where code = ?";

		PreparedStatement statement = null;

		try {

			System.out.println("####### updServices = " + updServices + " " + servicesObjectCode);
			System.out.println("####### updReturnSql = update enservicesobject set contractstatusrefcode = " + servicesObject.contractStatusRef.code + " where code = " + servicesObjectCode + ";");

			statement = connection.prepareStatement(updServices);
			statement.setInt(1, servicesObjectCode);
			statement.execute();

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + updServices + "\n servicesCode = " + servicesObjectCode);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
		} finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			statement = null;
		}
	}


	public ENServicesObjectShortList getEasyShortList(
			ENServicesObjectFilter aFilterObject, int fromPosition,
			int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getEasyShortList(
				aFilterObject,
				(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL),
				(aFilterObject == null) ? (null) : (aFilterObject.orderBySQL),
				fromPosition, quantity, aBindObjects);
	}

	public ENServicesObjectShortList getEasyShortList(
			ENServicesObject aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity,
			Vector<? extends Object> aBindObjects) throws PersistenceException {

		ENServicesObjectShortList result = new ENServicesObjectShortList();
		ENServicesObjectShort anObject;
		result.list = new Vector<ENServicesObjectShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

	    if(orderBy.length() == 0)
	     orderBy = "ENSERVICESOBJECT.CODE";

	    if(quantity < 0)
	     quantity = Integer.MAX_VALUE/2;

	    if(getUserProfile() == null)
	     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	    selectStr = "select w.*,  "
	    		+ " (get_number_day_delay_services_redterm(w.socode)) as is_red, "
	    		+ " (get_number_day_delay_services_yellow(w.socode)) as is_yellow "

	    		+ " from ( SELECT " +
	     " ENSERVICESOBJECT.CODE as socode " +
	     ", ENSERVICESOBJECT.CONTRACTNUMBERSERVICES " +
	     ", ENSERVICESOBJECT.CONTRACTDATESERVICES " +
	     ", ENSERVICESOBJECT.CONTRACTNUMBER " +
	     ", ENSERVICESOBJECT.CONTRACTDATE " +
	     ", ENSERVICESOBJECT.FINDOCID " +

		 ", ENSERVICESOBJECT.CONTRAGENTNAME " +
		 ", ENSERVICESOBJECT.CONTRAGENTOKPO " +
		 ", (SELECT ENSERVICESCONTRAGENTTP.NAME FROM ENSERVICESCONTRAGENTTP WHERE ENSERVICESCONTRAGENTTP.CODE = ENSERVICESOBJECT.CONTRAGENTTYPEREFCODE) " +
		 ", ENDEPARTMENT.SHORTNAME " +

	     ", (select case when enservicescontracttype.code = " + ENServicesContractType.CONNECTION + " then " +
	     "   enservicescontracttype.name||' - '||(select k.name " +
	     "      from enservicesobject2techcondtnsservices s2t, entechconditionsservcs ts, enconnectionkind k " +
	     "     where ts.code = s2t.techcondservrefcode and ts.connectionkindrefcode = k.code " +
	     "       and s2t.servicesobjectrefcode = enservicesobject.code) " +
	     "      else enservicescontracttype.name end " +
	     "   from enservicescontracttype " +
	     "  where enservicescontracttype.code = enservicesobject.contracttyperefcode) " +

		 ", (SELECT ENSERVICESCONTRACTSTTS.CODE FROM ENSERVICESCONTRACTSTTS WHERE ENSERVICESCONTRACTSTTS.CODE = ENSERVICESOBJECT.CONTRACTSTATUSREFCODE) " +

	     ", (SELECT case when(enservicescontractstts.code = " + ENServicesContractStatus.BUDGETAPPROVED +
	     "            and enservicesobject.contractkindrefcode = " + ENServicesContractKind.SALE + ") " +
	     "      then 'Специфікацію затверджено' else ENSERVICESCONTRACTSTTS.NAME end " +
	     "    FROM ENSERVICESCONTRACTSTTS WHERE ENSERVICESCONTRACTSTTS.CODE = ENSERVICESOBJECT.CONTRACTSTATUSREFCODE) " +

		 ", ENSERVICESOBJECTSTATUS.NAME " +

		 ", case when enservicesobject.createdfromsite = 1 then 'online з сайту' " +
		 "    else enservicesobject.commentgen end as commentgen " +
		 // ", ENSERVICESOBJECT.COMMENTGEN " +

		 ", ENSERVICESOBJECT.CONTRAGENTADDRESS " +

         ", ENSERVICESCONTRACTKIND.CODE " +
         ", ENSERVICESCONTRACTKIND.NAME " +

	     ////// сумма факт оплат по договору
	     " ,( select coalesce(sum(selSumPay.sumtotal)) from ( " +
	     " Select coalesce(sum(enpayment2so.sumtotal)) as sumtotal from enpayment2so where enpayment2so.servicesobjectrefcode = ENSERVICESOBJECT.CODE " +
	     " and enpayment2so.paymenttyperefcode in (1,2) " +
	     " union all " +
	     " Select -coalesce(sum(enpayment2so.sumtotal)) as sumtotal from enpayment2so where enpayment2so.servicesobjectrefcode = ENSERVICESOBJECT.CODE " +
	     " and enpayment2so.paymenttyperefcode in (3) " +
	     "  ) as selSumPay ) as selSumPay  " +

	     /////// сумма с доходного акта
	     ",(select sum(" +
	     " case when enservicesobject.calctyperefcode = 1 then " +
	     "      case " +
	     "        when enservicesobject.contracttyperefcode = 5 " +
	     "          then " +
	     "            case " +
	     "              when enservicesobject.code in (select servicesobjectrefcode " +
	     "                from enservicesobject2techcondtnsservices where techcondservrefcode in ( " +
	     "                  select code from entechconditionsservcs " +
	     "                    where coalesce(buildersarea, 0) = 0 " +
	     "                    and coalesce(basestation, 0) = 0 " +
	     "                    and coalesce(smallarchfrm, 0) = 0)) " +
	     "              then " +
	     "                cast(coalesce(cct.totalcost,0) as numeric(10,2)) " +
	     "              else cast (0 as numeric(10,2)) " +
	     "            end " +
	     "        else " +
	     "          cast(coalesce(cct.totalcost,0) as numeric(10,2)) " +
	     "      end " +
	     " else " +
	     " sofc.totalsum " +
	     " end) " +
	     " as summa " +
	     " from encalccontracttotal cct, enplanwork pw " +
	     //" enservicesobject so " +
	     " left join enservicesfactcalc sofc on sofc.servicesobjectrefcode = enservicesobject.code " +
	     " where enservicesobject.elementcode = pw.elementrefcode " +
	     " and cct.planrefcode = pw.code " +
	     " and pw.kindcode = 5 " +
	     " ) as seldohodsum " +    //  20


	     /*", case when enservicesobject.contractstatusrefcode = 10 then 0 else   " + //не считаем просрочку если отказ от услуг
	     " case when enservicesobject.contragenttyperefcode <> 2  then " +
	     " case when " +
	     " coalesce((case coalesce(enservicesobject.regionaltype,0) when 2" +
	     " then 9 + (select min(dategen) from enpayment2so " +
	     " where enpayment2so.servicesobjectrefcode = enservicesobject.code)" +
	     " else 5 +  (select min(dategen) from enpayment2so " +
	     " where enpayment2so.servicesobjectrefcode = enservicesobject.code) " +
	     " end),current_date) < current_date " +
	     " then " +
	     "   case when (select count(code) from enact " +
	     "   where enact.elementcode = enservicesobject.elementcode) > 0 " +
	     "   then 0 else 1 end " +
	     " else 0 end " +
	     " else  " +
	     " case when " +
	     " coalesce((case coalesce(enservicesobject.regionaltype,0) when 2 " +
	     " then 9 + enservicesobject.executeworkdate "+
	     " else 5 + enservicesobject.executeworkdate " +
	     " end),current_date) < current_date " +
	     " then " +
	     "   case when (select count(code) from enact " +
	     "   where enact.elementcode = enservicesobject.elementcode) > 0 "+
	     "   then 0 else 1 end" +
	     " else 0 end " +
	     " END " +
	     " end  " +
	     " as is_red " + // 91 */

	     //", ( select * from get_number_day_delay_services_red(ENSERVICESOBJECT.CODE ) ) as is_red " + // 21


	     /*" , case when enservicesobject.contractstatusrefcode = 10 then 0 else   " + // не считаем просрочку если отказ от услуг
	     " case when " +
	     " coalesce((case coalesce(enservicesobject.regionaltype,0) when 2" +
	     "  then 9 + enservicesobject.executeworkdate " +
	     "  else 5 + enservicesobject.executeworkdate " +
	     " end),current_date) < current_date "+
	     " then "+
	     "   case when (select count(code) from enact "+
	     "   where enact.elementcode = enservicesobject.elementcode) > 0 "+
	     "   then 0 else 1 end " +
	     " else 0 end end as is_yellow " +  // 92 */

	     //", ( select * from get_number_day_delay_services_yellow(ENSERVICESOBJECT.CODE ) ) as is_yellow " + // 22

		 ", ENSERVICESOBJECT.ISNOPAY " +

    ",ENSERVICESOBJECT.AXPARTNERCODE"+
	",ENSERVICESOBJECT.AXPARTNERNAME"+
	",ENSERVICESOBJECT.AXCONTRACTNUMBER"+
	",ENSERVICESOBJECT.AXCONTRACTDATE"+
	",ENSERVICESOBJECT.AXCONTRACTCODE"+
	",ENSERVICESOBJECT.AXCONTRACTID"+
	",ENSERVICESOBJECT.AXCONTRACTCOMMENTGEN"+

    ",ENGENERALCONTRACTS.CODE as ENGENERALCONTRACTSCODE "+

    // поля для договоров аренды
     ", ENSERVICESOBJECT.CITIESLIST " +
     ", (select string_agg(enact.numbergen::text,',') from enact  where enact.elementcode = ENSERVICESOBJECT.elementcode) as actnames" +
     ", (select  case when count(ensopaybillprov.code) > 0 then 'да' else 'нет' end from ensopaybillprov  where ensopaybillprov.sorefcode = ENSERVICESOBJECT.code) as prov_exist" +

	", ENSERVICESOBJECT.TERM " +
	", ENSERVICESOBJECT.REGULATION " +
	", ENSERVICESOBJECT.BOUNDARYDATEWORK " +
	", ENSERVICESOBJECT.COUNTDAYDELAY " +
	", ENSERVICESOBJECT.FACTDATEWORK " +

	", ENSERVICESOBJECT.CREATEDFROMSITE " +
	", ENSERVICESOBJECT.CODEEIC"+
	", ENSERVICESOBJECT.PERSONALACCOUNTUID"+
	", ( select case when count(enso2node.code) > 0 then 'да' else 'нет' end  from enso2node where enso2node.servicesobjectcode = ENSERVICESOBJECT.code ) as node_exist" +
	 //адреса місця виконання робіт
	 ", ENSERVICESOBJECT.CONTRAGENTADDRESSWORK " +
	 ", ENTECHCONDITIONSOBJCTS.NUMBERGEN as TUNUMBERGEN " +
	 ", ENTECHCONDITIONSOBJCTS.DATEGEN as TUDATEGEN " +
	 ", ( select count(enso2node.code) from enso2node where enso2node.servicesobjectcode = ENSERVICESOBJECT.code ) as nodecount" +
	 ", ENSERVICESOBJECT.POSTCODE as postcode " +

	 // сумма расходных актов по договору
	 ", COALESCE(( select sum(net.get_sum_by_act(a.code)) " +
     " from enact a left join rqfkorder2planfact ff on (ff.actcode = a.code) " +
     " where a.code in ( " +
     " select a2pl.actrefcode from enact2enplanwork a2pl " +
     " where a2pl.plancode in (" +
     " select ct2pl.planrefcode from entechcond2planwork ct2pl, " +
     " enservicesobject2techcondtnsservices so2tcs " +
     " where ct2pl.techconservicesrefcode = so2tcs.techcondservrefcode " +
     " and so2tcs.servicesobjectrefcode = ENSERVICESOBJECT.code) ) " +
     " and ff.actcode is null),0)  + " +
     " coalesce((select sum(get_sum_by_act_services(act.code)) " +
     " from enact act " +
     " where act.elementcode = ENSERVICESOBJECT.elementcode),0)    as sum_by_act   " +
                " , ENSERVICESOBJECT.elementcode " +

	      " FROM ENSERVICESOBJECT LEFT JOIN  ENGENERALCONTRACTS ON (ENGENERALCONTRACTS.CODE = ENSERVICESOBJECT.GENERALCONTRACTREFCODE ) " +
	      " LEFT JOIN  ENTECHCONDITIONSOBJCTS ON (ENTECHCONDITIONSOBJCTS.CODE = ENSERVICESOBJECT.TECHCONOBJECTSCODE ) " +
	      ", ENDEPARTMENT " +
	      ", ENSERVICESOBJECTSTATUS " +
	      ", ENSERVICESCONTRACTKIND " +
	      ", ENSERVICESOBJECTCALCTP " +

	      "";
	      whereStr = " ENDEPARTMENT.CODE = ENSERVICESOBJECT.DEPARTMENTCODE";
	      whereStr = whereStr + " AND ENSERVICESOBJECTSTATUS.CODE = ENSERVICESOBJECT.STATUSREFCODE";
	      whereStr = whereStr + " AND ENSERVICESCONTRACTKIND.CODE = ENSERVICESOBJECT.CONTRACTKINDREFCODE";
	      whereStr = whereStr + " AND ENSERVICESOBJECTCALCTP.CODE = ENSERVICESOBJECT.CALCTYPEREFCODE";

	      if(aFilterObject != null)
	      {
	        if(aFilterObject.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.CODE = ?";
	        }
	         if (aFilterObject.contractNumber != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRACTNUMBER) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRACTNUMBER) LIKE UPPER(?)";
	         }
	        if(aFilterObject.contractDate != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTDATE = ?";
	        }
	         if (aFilterObject.name != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.NAME) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.NAME) LIKE UPPER(?)";
	         }
	         if (aFilterObject.partnerCode != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.PARTNERCODE) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.PARTNERCODE) LIKE UPPER(?)";
	         }
	         if (aFilterObject.finDocCode != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.FINDOCCODE) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.FINDOCCODE) LIKE UPPER(?)";
	         }
	        if(aFilterObject.finDocID != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.FINDOCID = ?";
	        }
	         if (aFilterObject.commentGen != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.COMMENTGEN) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.COMMENTGEN) LIKE UPPER(?)";
	         }
	         if (aFilterObject.contractNumberServices != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contractNumberServices.indexOf('*',0) < 0 && aFilterObject.contractNumberServices.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRACTNUMBERSERVICES) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRACTNUMBERSERVICES) LIKE UPPER(?)";
	         }
	        if(aFilterObject.contractDateServices != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.CONTRACTDATESERVICES = ?";
	        }
	         if (aFilterObject.contragentName != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTNAME) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTNAME) LIKE UPPER(?)";
	         }
	         if (aFilterObject.contragentAddress != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTADDRESS) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTADDRESS) LIKE UPPER(?)";
	         }
	         if (aFilterObject.contragentAddressWork != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contragentAddressWork.indexOf('*',0) < 0 && aFilterObject.contragentAddressWork.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTADDRESSWORK) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTADDRESSWORK) LIKE UPPER(?)";
	         }
	         if (aFilterObject.contragentOkpo != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contragentOkpo.indexOf('*',0) < 0 && aFilterObject.contragentOkpo.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTOKPO) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTOKPO) LIKE UPPER(?)";
	         }
	         if (aFilterObject.contragentBankAccount != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contragentBankAccount.indexOf('*',0) < 0 && aFilterObject.contragentBankAccount.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT) LIKE UPPER(?)";
	         }
	         if (aFilterObject.contragentBankName != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contragentBankName.indexOf('*',0) < 0 && aFilterObject.contragentBankName.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTBANKNAME) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTBANKNAME) LIKE UPPER(?)";
	         }
	         if (aFilterObject.contragentBankMfo != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contragentBankMfo.indexOf('*',0) < 0 && aFilterObject.contragentBankMfo.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTBANKMFO) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTBANKMFO) LIKE UPPER(?)";
	         }
	         if (aFilterObject.contragentBossName != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contragentBossName.indexOf('*',0) < 0 && aFilterObject.contragentBossName.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTBOSSNAME) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTBOSSNAME) LIKE UPPER(?)";
	         }
	         if (aFilterObject.contragentPassport != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTPASSPORT) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTPASSPORT) LIKE UPPER(?)";
	         }
	         if (aFilterObject.userGen != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.USERGEN) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.USERGEN) LIKE UPPER(?)";
	         }
	        if(aFilterObject.dateEdit != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.DATEEDIT = ?";
	        }
	         if (aFilterObject.domain_info != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.DOMAIN_INFO) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.DOMAIN_INFO) LIKE UPPER(?)";
	         }
	        if(aFilterObject.modify_time != Long.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.MODIFY_TIME = ?";
	        }
	        if(aFilterObject.department.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENSERVICESOBJECT.DEPARTMENTCODE = ? ";
	        }
	        if(aFilterObject.element.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENSERVICESOBJECT.ELEMENTCODE = ? ";
	        }
	        if(aFilterObject.contractStatusRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENSERVICESOBJECT.CONTRACTSTATUSREFCODE = ? ";
	        }
	        if(aFilterObject.contractTypeRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENSERVICESOBJECT.CONTRACTTYPEREFCODE = ? ";
	        }
	        if(aFilterObject.contragentTypeRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENSERVICESOBJECT.CONTRAGENTTYPEREFCODE = ? ";
	        }
	        if(aFilterObject.billStatusRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENSERVICESOBJECT.BILLSTATUSREFCODE = ? ";
	        }
	        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENSERVICESOBJECT.STATUSREFCODE = ? ";
	        }
	        if (aFilterObject.contragentPosition != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.contragentPosition.indexOf('*',0) < 0 && aFilterObject.contragentPosition.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTPOSITION) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTPOSITION) LIKE UPPER(?)";
	         }
	        if(aFilterObject.executeWorkDate != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.EXECUTEWORKDATE = ?";
	        }
	        if(aFilterObject.timeStart != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.TIMESTART = ?";
	        }
	        if(aFilterObject.timeFinal != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.TIMEFINAL = ?";
	        }
	        if (aFilterObject.contragentPhoneNumber != null) {
	            if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";
	            if (aFilterObject.contragentPhoneNumber.indexOf('*',0) < 0 && aFilterObject.contragentPhoneNumber.indexOf('?',0) < 0)
	                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTPHONENUMBER) = UPPER(?)";
	            else
	                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTPHONENUMBER) LIKE UPPER(?)";
	        }
	        if (aFilterObject.executorPhoneNumber != null) {
	            if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";
	            if (aFilterObject.executorPhoneNumber.indexOf('*',0) < 0 && aFilterObject.executorPhoneNumber.indexOf('?',0) < 0)
	                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.EXECUTORPHONENUMBER) = UPPER(?)";
	            else
	                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.EXECUTORPHONENUMBER) LIKE UPPER(?)";
	        }
	        if (aFilterObject.contragentObjectWork != null) {
	            if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";
	            if (aFilterObject.contragentObjectWork.indexOf('*',0) < 0 && aFilterObject.contragentObjectWork.indexOf('?',0) < 0)
	                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.CONTRAGENTOBJECTWORK) = UPPER(?)";
	            else
	                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.CONTRAGENTOBJECTWORK) LIKE UPPER(?)";
	        }

	        if(aFilterObject.contractKindRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENSERVICESOBJECT.CONTRACTKINDREFCODE = ? ";
	        }

	        if(aFilterObject.payDate != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.PAYDATE = ?";
	        }

	        if(aFilterObject.finPayFormCode != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.FINPAYFORMCODE = ?";
	        }
	        if (aFilterObject.finPayFormName != null) {
	            if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";
	            if (aFilterObject.finPayFormName.indexOf('*',0) < 0 && aFilterObject.finPayFormName.indexOf('?',0) < 0)
	                whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.FINPAYFORMNAME) = UPPER(?)";
	            else
	                whereStr = whereStr + " UPPER(ENSERVICESOBJECT.FINPAYFORMNAME) LIKE UPPER(?)";
	        }

	        if(aFilterObject.isCustomerMaterials != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.ISCUSTOMERMATERIALS = ?";
	        }

	        if(aFilterObject.cnPackCode != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.CNPACKCODE = ?";
	        }

	        if(aFilterObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENSERVICESOBJECT.CNSUBSYSTEMTYPEREFCODE = ? ";
	        }

	        if(aFilterObject.calcTypeRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENSERVICESOBJECT.CALCTYPEREFCODE = ? ";
	        }

	        if(aFilterObject.personalAccountCode != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENSERVICESOBJECT.PERSONALACCOUNTCODE = ?";
	        }
	         if (aFilterObject.personalAccountNumber != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.personalAccountNumber.indexOf('*',0) < 0 && aFilterObject.personalAccountNumber.indexOf('?',0) < 0)
	                 whereStr = whereStr + "  UPPER(ENSERVICESOBJECT.PERSONALACCOUNTNUMBER) = UPPER(?)";
	             else
	                 whereStr = whereStr + " UPPER(ENSERVICESOBJECT.PERSONALACCOUNTNUMBER) LIKE UPPER(?)";
	         }
	         if(aFilterObject.isNoPay != Integer.MIN_VALUE) {
	             if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";
	             whereStr = whereStr + "ENSERVICESOBJECT.ISNOPAY = ? ";
	         }

			if (aFilterObject.createdFromSite != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENSERVICESOBJECT.CREATEDFROMSITE = ? ";
			}

	      }


	    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
	    if(segregationInfo.isAccessDenied())
	      throw new PersistenceException("{%ENServicesObject.getList%} access denied");

	    String domainWhereStr = SegregationQueryBuilder.addWhere("ENSERVICESOBJECT",segregationInfo,getUserProfile().getDomainInfo());

	    if (domainWhereStr.length() != 0){
	    if (whereStr.length() == 0)
	        whereStr = domainWhereStr;
	    else
	        whereStr = " "+whereStr + " AND " +domainWhereStr;
	    }


	      if(condition.length() != 0)
	      {
	         if(whereStr.length() != 0)
	            whereStr = whereStr + " AND ";

	         whereStr = whereStr + " (" + condition + ")";
	      }

	     if(whereStr.length() != 0)
	         selectStr = selectStr + " WHERE " + whereStr;

	    selectStr = selectStr + " ORDER BY " + orderBy;
	    selectStr = selectStr + " OFFSET " + fromPosition;

	    if (quantity > -1)
	        selectStr = selectStr + " LIMIT " + quantity;

		try {
			/**    ***********************************************    */
			statement = connection.prepareStatement(selectStr + ") w ");

			int number = 0;
			if (aFilterObject != null) {
				if (aFilterObject.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.code);
				}

				if (aFilterObject.contractNumber != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contractNumber);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
				if (aFilterObject.contractDate != null) {
					number++;
					statement.setDate(number, new java.sql.Date(
							aFilterObject.contractDate.getTime()));
				}

				if (aFilterObject.name != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.name);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.partnerCode != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.partnerCode);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.finDocCode != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.finDocCode);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
				if (aFilterObject.finDocID != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.finDocID);
				}

				if (aFilterObject.commentGen != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.commentGen);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.contractNumberServices != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contractNumberServices);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
				if (aFilterObject.contractDateServices != null) {
					number++;
					statement.setDate(number, new java.sql.Date(
							aFilterObject.contractDateServices.getTime()));
				}

				if (aFilterObject.contragentName != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contragentName);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.contragentAddress != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contragentAddress);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.contragentAddressWork != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contragentAddressWork);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.contragentOkpo != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contragentOkpo);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.contragentBankAccount != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contragentBankAccount);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.contragentBankName != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contragentBankName);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.contragentBankMfo != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contragentBankMfo);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.contragentBossName != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contragentBossName);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.contragentPassport != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contragentPassport);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.userGen != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.userGen);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
				if (aFilterObject.dateEdit != null) {
					number++;
					statement.setDate(number, new java.sql.Date(
							aFilterObject.dateEdit.getTime()));
				}

				if (aFilterObject.domain_info != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.domain_info);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
				if (aFilterObject.modify_time != Long.MIN_VALUE) {
					number++;
					if (aFilterObject.modify_time == Long.MIN_VALUE)
						statement.setBigDecimal(number, null);
					else
						statement.setBigDecimal(number,
								new java.math.BigDecimal(
										aFilterObject.modify_time));
				}
				if (aFilterObject.department.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.department.code);
				}
				if (aFilterObject.element.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.element.code);
				}
				if (aFilterObject.contractStatusRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number,
							aFilterObject.contractStatusRef.code);
				}
				if (aFilterObject.contractTypeRef.code != Integer.MIN_VALUE) {
					number++;
					statement
							.setInt(number, aFilterObject.contractTypeRef.code);
				}
				if (aFilterObject.contragentTypeRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number,
							aFilterObject.contragentTypeRef.code);
				}
				if (aFilterObject.billStatusRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.billStatusRef.code);
				}
				if (aFilterObject.statusRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.statusRef.code);
				}
				if (aFilterObject.contragentPosition != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contragentPosition);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
				if (aFilterObject.executeWorkDate != null) {
					number++;
					statement.setDate(number, new java.sql.Date(
							aFilterObject.executeWorkDate.getTime()));
				}
				if (aFilterObject.timeStart != null) {
					number++;
					statement.setTimestamp(number, new java.sql.Timestamp(
							aFilterObject.timeStart.getTime()));
				}
				if (aFilterObject.timeFinal != null) {
					number++;
					statement.setTimestamp(number, new java.sql.Timestamp(
							aFilterObject.timeFinal.getTime()));
				}
				if (aFilterObject.contragentPhoneNumber != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contragentPhoneNumber);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
				if (aFilterObject.executorPhoneNumber != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.executorPhoneNumber);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
				if (aFilterObject.contragentObjectWork != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contragentObjectWork);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.contractKindRef.code != Integer.MIN_VALUE) {
					number++;
					statement
							.setInt(number, aFilterObject.contractKindRef.code);
				}

				if (aFilterObject.payDate != null) {
					number++;
					statement.setDate(number, new java.sql.Date(
							aFilterObject.payDate.getTime()));
				}

				if (aFilterObject.finPayFormCode != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.finPayFormCode);
				}

				if (aFilterObject.finPayFormName != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.finPayFormName);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.isCustomerMaterials != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.isCustomerMaterials);
				}

				if (aFilterObject.cnPackCode != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.cnPackCode);
				}

				if (aFilterObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number,
							aFilterObject.cnSubsystemTypeRef.code);
				}

				if (aFilterObject.calcTypeRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.calcTypeRef.code);
				}

				if (aFilterObject.personalAccountCode != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.personalAccountCode);
				}

				if (aFilterObject.personalAccountNumber != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.personalAccountNumber);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.isNoPay != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.isNoPay);
				}


				if (aFilterObject.createdFromSite != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.createdFromSite);
				}

			}

			if (condition.length() > 0 && aBindObjects != null)
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENServicesObjectShort();

				anObject.code = set.getInt(1);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;

				anObject.contractNumberServices = set.getString(2);
				anObject.contractDateServices = set.getDate(3);
				anObject.contractNumber = set.getString(4);
				anObject.contractDate = set.getDate(5);

				anObject.finDocID = set.getInt(6);
				if (set.wasNull())
					anObject.finDocID = Integer.MIN_VALUE;

				anObject.contragentName = set.getString(7);
				anObject.contragentOkpo = set.getString(8);
				anObject.contragentTypeRefName = set.getString(9);
				anObject.departmentShortName = set.getString(10);
				anObject.contractTypeRefName = set.getString(11);

				anObject.contractStatusRefCode = set.getInt(12);
				if (set.wasNull())
					anObject.contractStatusRefCode = Integer.MIN_VALUE;

				anObject.contractStatusRefName = set.getString(13);

				anObject.statusRefName = set.getString(14);
				anObject.commentGen = set.getString(15);
				anObject.contragentAddress = set.getString(16);

				anObject.contractKindRefCode = set.getInt(17);
				if (set.wasNull())
					anObject.contractKindRefCode = Integer.MIN_VALUE;

				anObject.contractKindRefName = set.getString(18);

				anObject.paySum = set.getBigDecimal(19);
				if (anObject.paySum != null)
					anObject.paySum = anObject.paySum.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.dohodSum = set.getBigDecimal(20);
				if (anObject.dohodSum != null)
					anObject.dohodSum = anObject.dohodSum.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);


		        anObject.isNoPay = set.getInt(21);
		        if (set.wasNull())
		            anObject.isNoPay = Integer.MIN_VALUE;


				anObject.axPartnerCode = set.getString(22);
				anObject.axPartnerName = set.getString(23);
				anObject.axContractNumber = set.getString(24);
				anObject.axContractDate = set.getDate(25);
				anObject.axContractCode = set.getString(26);
				anObject.axContractId = set.getString(27);
				anObject.axContractCommentGen = set.getString(28);

				anObject.generalContractRefCode = set.getInt("ENGENERALCONTRACTSCODE");
				if (set.wasNull())
					anObject.generalContractRefCode = Integer.MIN_VALUE;

				anObject.citiesList = set.getString("citieslist");
				anObject.actnames = set.getString("actnames");
				anObject.prov_exist = set.getString("prov_exist");

				///
				anObject.term = set.getInt("term");
				if (set.wasNull()) {
					anObject.term = Integer.MIN_VALUE;
				}
				anObject.regulation = set.getInt("regulation");
				if (set.wasNull()) {
					anObject.regulation = Integer.MIN_VALUE;
				}
				anObject.boundaryDateWork = set.getDate("boundaryDateWork");
				anObject.countDayDelay = set.getInt("countDayDelay");
				if (set.wasNull()) {
					anObject.countDayDelay = Integer.MIN_VALUE;
				}
				anObject.factDateWork = set.getDate("factDateWork");


				anObject.createdFromSite = set.getInt("createdFromSite");
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;


				anObject.codeEIC = set.getString("codeEIC");

				anObject.personalAccountUid = set.getString("personalAccountUid");

				anObject.node_exist = set.getString("node_exist");

				anObject.contragentAddressWork = set.getString("CONTRAGENTADDRESSWORK");
				//Номер ТУ
				anObject.techConObjectsNumberGen = set.getString("TUNUMBERGEN");
				anObject.techConObjectsDateGen = set.getDate("TUDATEGEN");
				//количество связок с деревом СС
				anObject.nodeCount = set.getInt("nodecount");

				anObject.postCode = set.getString("postcode");

				anObject.sum_by_act = set.getBigDecimal("sum_by_act");
				if (anObject.sum_by_act != null)
					anObject.sum_by_act = anObject.sum_by_act.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);

                anObject.elementCode = set.getInt("elementcode");



		        /**
		         *   ЭТИ ДВА ПОЛЯ ДОЖНЫ БЫТЬ ВСЕГДА В КОНЦЕ!!!!!!
		         *   ВЫБИРАЮТСЯ ФУНКЦИЕЙ СВЕРХУ ОСНОВНОГО ЗАПРОСА...
		         */
		        /**    ****************************        */
				anObject.isRed = set.getInt("is_red");
				if (set.wasNull())
					anObject.isRed = Integer.MIN_VALUE;

				anObject.isYellow = set.getInt("is_yellow");
				if (set.wasNull())
					anObject.isYellow = Integer.MIN_VALUE;
				/**    ****************************        */




				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
			return null;
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}


	public void updatePersonalAccount(int servicesObjectCode, int personalAccountCode, String personalAccountNumber,
			String eic, String personalAccountUid) throws PersistenceException {

    	if (servicesObjectCode == Integer.MIN_VALUE)
    	{
    		throw new SystemException("\n\nНе заданий код Послуги на сторону!");
    	}

    	if (personalAccountCode == Integer.MIN_VALUE) {
    		throw new SystemException("\n\nНе заданий код особового рахунку!");
    	}

    	if (personalAccountNumber == null || personalAccountNumber.trim().length() == 0) {
    		throw new SystemException("\n\nНе заданий особовий рахунок!");
    	}

    	if (personalAccountUid == null || personalAccountUid.trim().length() == 0) {
    		throw new SystemException("\n\nНе заданий особовий рахунок!");
    	}

    	Connection connection = getConnection();

    	ServicesLogic servicesLogic = new ServicesLogic(connection, getUserProfile());
    	boolean isEICRequired = servicesLogic.isEICRequired(servicesObjectCode);

    	if (isEICRequired) {
	    	if (eic == null || eic.trim().length() == 0) {
	    		throw new SystemException("\n\nНе заданий особовий рахунок (EIC)!");
	    	}
    	}

    	String sql =
        		" update enservicesobject " +
                "    set personalaccountcode = ?, personalaccountnumber = ?, codeeic = ?, personalAccountUid = ? " +
        		"  where code = ? ";

        PreparedStatement statement = null;
        ResultSet  set = null;
        try
        {
	        statement = connection.prepareStatement(sql);

	        statement.setInt(1, personalAccountCode);
	        statement.setString(2, personalAccountNumber);
	        statement.setString(3, eic);
	        statement.setString(4, personalAccountUid);

	        statement.setInt(5, servicesObjectCode);

	        statement.execute();
        }
        catch(SQLException e)
        {
        	System.out.println(e.getMessage()+"\nstatement - "+ sql);
        	EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
	        try {if (set != null) set.close();}             catch (SQLException e) {}
	        try {if (statement != null) statement.close();} catch (SQLException e) {}
	        //if(connection != super.getConnection())
	        if (connection != null)
	        {
	            try{connection.close();} catch(SQLException e){}
	        }
        }
    }



	public void updateContractStatus(int servicesObjectCode, int statusCode)
			throws PersistenceException {
		Connection connection = getConnection();

		String updServices = "update enservicesobject set contractstatusrefcode = ?  where code = ?";
		PreparedStatement statement = null;

		try {
			statement = connection.prepareStatement(updServices);
			statement.setInt(1, statusCode);
			statement.setInt(2, servicesObjectCode);
			statement.execute();

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + updServices
					+ "\n servicesCode = " + servicesObjectCode);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		} finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			statement = null;
		}
	}


	public void updateContractCode(int servicesObjectCode, int contractCode)
			throws PersistenceException {

		if (servicesObjectCode == Integer.MIN_VALUE) {
			throw new EnergyproSystemException(
					"Не задан код договора по услугам на сторону!");
		}

		Connection connection = getConnection();

		// String updServices = " update enservicesobject set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update enservicesfromsidebjct set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update rqfkorderitem set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update fincontracts set generalcontractrefcode = ? where code = ? ";
		String updServices = " update entechconditionsservcs set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update enactincome set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update encontract set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update enestimateitem2contrct set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update entechagrmnt2srvcsbjct set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update rqorderitem set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update rqbillitem set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update rqbill set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update rqcontract2typepay set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update tkmaterials2rqcontrcts set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update enoperativeobject set generalcontractrefcode = ? where code = ? ";
		// String updServices = " update enipitem2contract set generalcontractrefcode = ? where code = ? ";



		PreparedStatement statement = null;

		try {
			statement = connection.prepareStatement(updServices);

			statement.setInt(1, contractCode);
			statement.setInt(2, servicesObjectCode);

			statement.execute();
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + updServices
					+ "\n servicesCode = " + servicesObjectCode);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		} finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}

			statement = null;

			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public List<AbstractMap.SimpleImmutableEntry<ENServicesObject, Integer>>  getListOfServicesWithEstimateCodeBySCCounter(
			ENMetrologyCounterShort counter, int soCode
			, BigDecimal price, int fromPosition, int quantity) throws PersistenceException {

		if (counter.phasity == Integer.MIN_VALUE) {
			throw new SystemException(
					String.format("У лічильника № %s не встановлено фазність", counter.invNumber));
		}
		if (counter.phasity != 1 && counter.phasity != 3) {
			throw new SystemException(String.format("Невідома фазність у лічильника інв. № %s: %d ",
					counter.invNumber, counter.phasity));
		}
		if (counter.zones == Integer.MIN_VALUE) {
			throw new SystemException(String.format("Невідома зоність у лічильника інв. № %s",
					counter.invNumber));
		}
		if (counter.materialcode == Integer.MIN_VALUE) {
			throw new SystemException(String.format("Невідомий матеріал лічильника інв. № %s",
					counter.invNumber));
		}
		int materialCode = (counter.phasity == 1) ? TKConsts.TKMATERIALS_COUNTER_1FService
				: TKConsts.TKMATERIALS_COUNTER_3FService;

		List<AbstractMap.SimpleImmutableEntry<ENServicesObject, Integer>> result =
				new Vector<>();

		Vector<Object> vec = new Vector<>();
		vec.add(materialCode);

		if(price != null) {
			vec.add(price);
		} else {
			vec.add(new BigDecimal(0));
		}
		vec.add(ENEstimateItemKind.MATERIALS);
		vec.add(0);
		vec.add(0);

		vec.add(counter.zones);
		vec.add(ENServicesContractStatus.SIGNED);
		vec.add(ENServicesContractStatus.PAID);
		vec.add(ENServicesContractStatus.PREPAID);
		vec.add(ENServicesObjectStatus.GOOD);
		vec.add(ENPlanWorkKind.CURRENT);

		vec.add(counter.materialcode);

		vec.add(ENConsts.ENSERVICES_OBJECT_ISPAY);
		vec.add(ENConsts.ENSERVICES_OBJECT_ISNOPAY);

		vec.add(ENServicesContractStatus.PAID);
		vec.add(ENServicesContractStatus.PREPAID);

		vec.add(1);
		vec.add(1);

		vec.add(-1);
		vec.add(TKReplaceCounterKind.REPLACE_COUNTER);

		vec.add(0);
		vec.add(0);

		vec.add(ENPlanWorkKind.NPW);
		vec.add(ENPlanWorkKind.FACT);
		/*SUPP-60984 нельзя брать счетчики которые были перерезервированы */
		vec.add(ENPlanWorkKind.CALCULATION);
		vec.add(ENEstimateItemKind.MATERIALS);
		vec.add(SCCounterStatus.GOOD);
		vec.add(SCCounterStatus.IN_ACT);

		vec.add(TKConsts.TKMATERIALS_COUNTER_1FService);
		vec.add(TKConsts.TKMATERIALS_COUNTER_3FService);

		if(soCode != Integer.MIN_VALUE) {
			vec.add(soCode);
		}

		if(quantity != Integer.MIN_VALUE) {
			vec.add(quantity);
		}

		if(fromPosition != Integer.MIN_VALUE) {
			vec.add(fromPosition);
		}


		String sql = "select distinct so.code::integer, es.code::integer, so.contractdateservices from enservicesobject as so \n "
				+ "inner join enplanwork as pw on so.elementcode = pw.elementrefcode \n "
				+ "inner join enplanworkitem as pi on pw.code = pi.planrefcode \n "
				+ "inner join enestimateitem as es on (pw.code = es.planrefcode and es.planitemrefcode = pi.code)  \n "
				+ "inner join tkmaterials2tkmaterils as matma on es.materialrefcode = matma.tkmaterialsinrefcode \n "
				+ "where es.materialrefcode = ? \n "
				+ " and coalesce(es.price, 0) >= ? "
				+ " and es.kindrefcode = ? \n "
				+ " and coalesce(es.countfact, 0) > ? \n "
				+ " and coalesce(pi.countgen, 0) > ? \n "
				+ " and so.counterszonetype = ? \n "
				+ " and so.contractstatusrefcode in (?,?,?) \n "
				+ " and so.statusrefcode = ? \n "
				+ " and pw.kindcode = ? \n "
				+ " and matma.tkmaterialsoutrefcode = ? \n "
				+ " and case when coalesce(so.ISNOPAY, ?) <> ? then so.CONTRACTSTATUSREFCODE in (?, ?) else ? = ? end \n "
				+ " and exists (select from enplanwork as pw1 \n "
				+ "	inner join enplanwork2classfctntp as pwcl1 on pw1.code = pwcl1.planrefcode \n "
				+ "	inner join tkclassificationtype as cl1 on pwcl1.classificationtyperfcd = cl1.code \n "
				+ " inner join tkmaterls2tkclssfctntp as matk1 on cl1.code = matk1.classificationtyperfcd "
				+ "	where coalesce(cl1.replacecounterkindcode, ?) = ? \n "
				+ "	and coalesce(cl1.isgivecounter, ?) = ? \n "
				+ " and matk1.materialrefcode = matma.tkmaterialsoutrefcode "
				+ "	and pw1.elementrefcode = so.elementcode) \n "
				/*SUPP-60984 нельзя брать счетчики которые были перерезервированы */
				+ " and not exists ( select from enplanwork as pw1 \n "
				+ " 			inner join enestimateitem as ei1 on pw1.code = ei1.planrefcode \n "
				+ " 			inner join sccounter as sc1 on ei1.code = sc1.estimateitemrefcode \n "
				+ "                      where pw1.elementrefcode = so.elementcode   \n "
				+ "                      and pw1.kindcode in (?,?, ?) \n "
				+ "                      and ei1.kindrefcode = ? \n "
				+ "                      and sc1.statusrefcode in (?,?) \n "
				+ "                      and ei1.materialrefcode in (?,?)) \n "
				+ " and not exists (select from rqfkorderitem2enstmttm as fies1 where fies1.estimateitemcode = es.code)"
				+ ((soCode == Integer.MIN_VALUE) ? "" : " and so.code = ? ")
				+ " order by so.contractdateservices asc"
				+ ((quantity != Integer.MIN_VALUE) ? " limit ?" : "")
				+ ((fromPosition != Integer.MIN_VALUE) ? " offset ?" : "");

		List<Object[]> list = BaseDAOUtils.executeStatementAndReadObjects(this.getConnection(), sql, vec,
				new BaseDAOUtils.ObjectArrayFromResultSetTransformator(), false);

		for(Object[] arr : list) {
			int index = 0;
			int servicesObjectCode = (Integer)arr[index++];
			int codeEstimateCurrentPlan = (Integer)arr[index++];

			ENServicesObject so = this.getObject(servicesObjectCode);

			AbstractMap.SimpleImmutableEntry<ENServicesObject, Integer> entry =
					new AbstractMap.SimpleImmutableEntry<>(so, codeEstimateCurrentPlan);

			result.add(entry);
		}

		return result;
	}

	/**
	 *
	 * Возвращает объект договора услуг на сторону {@link ENServicesObject} услуг на сторону
	 * по номеру договога {@link ENServicesObject#contractNumberServices}
	 *
	 * @param contractNumberServices номер договора {@link ENServicesObject#contractNumberServices}
	 * @return объект договора услуг на сторону {@link ENServicesObject}
	 * @throws PersistenceException
	 */
	public ENServicesObject getObjectByContractNumberServices(String contractNumberServices) throws PersistenceException {
		if(contractNumberServices == null || contractNumberServices.length() == 0) throw new java.lang.NullPointerException();
		ENServicesObjectFilter filter = new ENServicesObjectFilter();
		filter.contractNumberServices = contractNumberServices;
		int[] codes = this.getFilteredCodeArray(filter, 0, -1);
		if(codes.length == 0) {
			return null;
		} else {
			return this.getObject(codes[0]);
		}
	}

	/**
	 *
	 * Возвращает объект договора услуг на сторону {@link ENServicesObject} услуг на сторону
	 * по объекту тех. условий {@link ENTechConditionsServices}
	 *
	 * @param techCondServices объект тех. условий {@link ENTechConditionsServices}
	 * @return объект договора услуг на сторону {@link ENServicesObject}
	 * @throws PersistenceException
	 */
	public ENServicesObject getObjectByTechConditionsServices(ENTechConditionsServices techCondServices) throws PersistenceException {
		if(techCondServices == null || techCondServices.code == Integer.MIN_VALUE) throw new java.lang.NullPointerException();
		ENServicesObject2TechCondtnsServicesDAO dao = new ENServicesObject2TechCondtnsServicesDAO(this.getConnection(), this.getUserProfile());
		ENServicesObject2TechCondtnsServicesFilter filter = new ENServicesObject2TechCondtnsServicesFilter();
		filter.techCondServRef.code = techCondServices.code;
		int[] codes = dao.getFilteredCodeArray(filter, 0, -1);
		if(codes.length == 0) {
			return null;
		} else {
			ENServicesObject2TechCondtnsServices servicesObject2TechCondServices = dao.getObject(codes[0]);
			return this.getObject(servicesObject2TechCondServices.servicesObjectRef.code);
		}

	}

	/**
	 *
	 * Получить объект договора {@link ENServicesObject} по акту {@link ENAct}
	 *
	 * @param act {@link ENAct}
	 * @return объект договора или {@code null} если акт не связан с договором
	 * @throws PersistenceException
	 */
	public ENServicesObject getObjectByENAct(ENAct act) throws PersistenceException {
		if(act == null || act.code == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException("Не заданий акт для вибору договору");
		}
		ENServicesObjectFilter filter = new ENServicesObjectFilter();
		filter.element.code = act.element.code;
		int[] codes = this.getFilteredCodeArrayNOSEGR(filter, 0, -1);
		if(codes.length == 0) {
			return null;
		} else {
			return this.getObjectNoSegr(codes[0]);
		}
	}
	
	/**
	 * 
	 * Получить список договоров по акту через связку планов включенных в тех.условия
	 * 
	 * @param act {@link ENAct}
	 * @return {@link ENServicesObjectShortList}
	 * @throws PersistenceException 
	 */
	public ENServicesObjectShortList getListByENActThroughTechConditions(ENAct act) throws PersistenceException {
		if(act == null || act.code == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException("Не заданий акт для вибору договору");
		}
		
		ENServicesObjectFilter filter = new ENServicesObjectFilter();
		filter.conditionSQL =  "EXISTS (SELECT FROM enact AS ac1 " +
				 "INNER JOIN enact2enplanwork AS acpw1 ON ac1.code = acpw1.actrefcode " +
				 "INNER JOIN enplanwork AS pw1 ON acpw1.plancode = pw1.code " +
				 "INNER JOIN entechcond2planwork AS tcpw1 ON pw1.code = tcpw1.planrefcode " +
				 "INNER JOIN enservicesobject2techcondtnsservices AS sots1 ON tcpw1.techconservicesrefcode = sots1.techcondservrefcode " +
				 "INNER JOIN enservicesobject AS so1 ON sots1.servicesobjectrefcode = so1.code"
				 + " WHERE so1.code = ENSERVICESOBJECT.CODE"
				 + " AND ac1.code = ?)";

		Vector<Integer> params = new Vector<>(Arrays.asList(act.code));
		return this.getScrollableFilteredList(filter, 0, -1, params);
	}
	
    public String _collectAutoIncrementNumber() throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENSERVICESOBJECT",
                "CONTRACTNUMBERSERVICES");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) {
            sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENSERVICESOBJECT",
                        "CONTRACTNUMBERSERVICES");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENSERVICESOBJECT",
                        "CONTRACTNUMBERSERVICES");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENSERVICESOBJECT");
        } else {

            return nextSeqValue.toString();
        }
    }


} // end of ENServicesObjectDAO

