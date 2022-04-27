
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENSO2NodeDAOGen;
import com.ksoe.energynet.valueobject.ENSO2Node;
import com.ksoe.energynet.valueobject.brief.ENSO2NodeShort;
import com.ksoe.energynet.valueobject.lists.ENSO2NodeShortList;

/**
 * DAO Object for ENSO2Node;
 *
 */

public class ENSO2NodeDAO extends ENSO2NodeDAOGen {

    public ENSO2NodeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSO2NodeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public ENSO2NodeShortList getScrollableFilteredList(ENSO2Node aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENSO2NodeShortList result = new ENSO2NodeShortList();
		ENSO2NodeShort anObject;
		result.list = new Vector<ENSO2NodeShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSO2NODE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSO2NODE.CODE"+
			",ENSO2NODE.CCNODECODE"+
			",ENSO2NODE.POWER"+
			",ENSO2NODE.DESCRIPTION"+
			",ENSO2NODE.ISCALC"+
			",ENSO2NODE.USERGEN"+
			",ENSO2NODE.DATEEDIT"+
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
			", ENSERVICESOBJECT.CONTRACTSERVICESSUMMVT " +
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
			", ENSERVICESOBJECT.PREVCONTRACTSTATUS " +
			", ENSERVICESOBJECT.RECONNECTIONTU " +
			", ENSERVICESOBJECT.PERSONALACCOUNTCODE " +
			", ENSERVICESOBJECT.PERSONALACCOUNTNUMBER " +
			", ENSERVICESOBJECT.TABNUMBER " +
			", ENSERVICESOBJECT.CITIESLIST " +
			", ENSERVICESOBJECT.LINELENGTH " +
			", ENSERVICESOBJECT.PROJECTCODE " +
			", ENSERVICESOBJECT.CNPACKCODE " +
			", ENSERVICESOBJECT.DFPACKCODE " +
			", ENSERVICESOBJECT.COUNTERSZONETYPE " +
			", ENSERVICESOBJECT.AXPARTNERCODE " +
			", ENSERVICESOBJECT.AXPARTNERNAME " +
			", ENSERVICESOBJECT.AXCONTRACTNUMBER " +
			", ENSERVICESOBJECT.AXCONTRACTDATE " +
			", ENSERVICESOBJECT.AXCONTRACTCODE " +
			", ENSERVICESOBJECT.AXCONTRACTID " +
			", ENSERVICESOBJECT.AXCONTRACTCOMMENTGEN " +
			", ENSERVICESOBJECT.PROJAGREESUMMA " +
			", ENSERVICESOBJECT.TOPOGRAPHYSUMMA " +
			", ENSERVICESOBJECT.CREATEDFROMSITE " +
			", ENSERVICESOBJECT.TERM " +
			", ENSERVICESOBJECT.REGULATION " +
			", ENSERVICESOBJECT.BOUNDARYDATEWORK " +
			", ENSERVICESOBJECT.COUNTDAYDELAY " +
			", ENSERVICESOBJECT.FACTDATEWORK " +
			", ENSERVICESOBJECT.CODEEIC " +
			", ENSERVICESOBJECT.PERSONALACCOUNTUID " +
			", ENSO2NODETYPE.CODE " +
			", ENSO2NODETYPE.NAME " +
			", nodes_plainlist_normal.name as nodename " + 
            ", nodes_plainlist_normal.f150 " + 
            ", nodes_plainlist_normal.s150 " +  
            ", nodes_plainlist_normal.f35 " + 
            ", nodes_plainlist_normal.s35 " +  
            ", nodes_plainlist_normal.f10 " + 
            ", nodes_plainlist_normal.s10 " + 
            ", nodes_plainlist_normal.f04 " + 
            ", entechconditionsobjcts.address as tc_address " + 
            ", entechconditionsobjcts.building as tc_building " + 
            ", entechconditionsobjcts.tycurrentpower as tc_currpower " + 
            ", entechconditionsobjcts.tyservicespower as tc_servpower " +
            ", entechconditionsobjcts.voltagecurrent as tc_currvoltage " + 
            ", entechconditionsobjcts.voltageservices as tc_servvoltage " +
            ", endepartment.name as dep_name " + 
            ", entechconditionsobjcts.numbergen as tc_number " +
            ", entechconditionsobjcts.dategen as tc_dategen " +
            ", enconnectionkind.name as connectionkindname " + 
            ", (select ss.dateval from ensovalues ss where ss.sovaluestypecode = 3 and ss.servicesobjectcode = ENSERVICESOBJECT.code) as fact_conn_date " + 
            ", entechconditionsobjcts.connectionpowerpoint || ' ' || entechconditionsobjcts.connectionpowerpointnm as tc_conpowpoint " + 
            ", entechconditionsobjcts.connectionpowerplaces || ' ' || entechconditionsobjcts.connectionpowerplacsnm as tc_conpowplaces " + 
            ", (select ss.strval from ensovalues ss where ss.sovaluestypecode = 9 and ss.servicesobjectcode = ENSERVICESOBJECT.code) as work_directly_on_joining " + 
            ",(SELECT ENSERVICESCONTRACTSTTS.name FROM ENSERVICESCONTRACTSTTS WHERE ENSERVICESCONTRACTSTTS.CODE = ENSERVICESOBJECT.CONTRACTSTATUSREFCODE) as contractStatusRefName"+
			",ENSO2NODE.CCTOWERCODE "+
			",case when ENSO2NODE.cctowercode is not null then (select ccTowerName " +
            " from dblink(  'dbname=callcenter port=5432 host=10.77.11.180 user=read password=read', " +
            " format('  select t.name from cctower t where t.code = %s', ENSO2NODE.cctowercode)) " +
            " as  (ccTowerName VARCHAR) ) else null end as towername " +
		             
    		" FROM ENSO2NODE " + 
            " LEFT JOIN nodes_plainlist_normal on (nodes_plainlist_normal.code = ENSO2NODE.ccnodecode) " +
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENSO2NODE.SERVICESOBJECTCODE " +
			" LEFT JOIN ENSO2NODETYPE on ENSO2NODETYPE.CODE = ENSO2NODE.SO2NODETYPECODE " +
            " left join enservicesobject2techcondtnsservices on (enservicesobject2techcondtnsservices.servicesobjectrefcode = ENSERVICESOBJECT.code) " +
            " left join entechconditionsservcs on (entechconditionsservcs.code = enservicesobject2techcondtnsservices.techcondservrefcode) " +
            " left join encontragent on (encontragent.techcondservicesrefcod = entechconditionsservcs.code) " +
            " left join entechconditionsobjcts on (encontragent.techconobjectscode = entechconditionsobjcts.code) " +
            " left join endepartment on ( entechconditionsobjcts.departmentcode = endepartment.code) " +
            " left join enconnectionkind on (entechconditionsservcs.connectionkindrefcode = enconnectionkind.code) " +
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);
		if(whereStr.length() != 0) {
			selectStr += " WHERE " + whereStr;
		}
		selectStr = selectStr + " ORDER BY " + orderBy;

		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;
		int number = 0;
		try {
			statement = connection.prepareStatement(selectStr);
			number = setParameters(aFilterObject, statement);
			
			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);
			}

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENSO2NodeShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.ccNodeCode = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.ccNodeCode = Integer.MIN_VALUE;
				}
				anObject.power = set.getBigDecimal(3);
				if(anObject.power != null) {
					anObject.power = anObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.description = set.getString(4);
				anObject.isCalc = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.isCalc = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(6);
				anObject.dateEdit = set.getTimestamp(7);

				anObject.servicesobjectCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.servicesobjectCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectContractNumber = set.getString(9);
				anObject.servicesobjectContractDate = set.getDate(10);
				anObject.servicesobjectName = set.getString(11);
				anObject.servicesobjectPartnerCode = set.getString(12);
				anObject.servicesobjectFinDocCode = set.getString(13);
				anObject.servicesobjectFinDocID = set.getInt(14);
				if(set.wasNull()) {
					anObject.servicesobjectFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCommentGen = set.getString(15);
				anObject.servicesobjectContractNumberServices = set.getString(16);
				anObject.servicesobjectContractDateServices = set.getDate(17);
				anObject.servicesobjectContragentName = set.getString(18);
				anObject.servicesobjectContragentAddress = set.getString(19);
				anObject.servicesobjectContragentAddressWork = set.getString(20);
				anObject.servicesobjectContragentOkpo = set.getString(21);
				anObject.servicesobjectContragentBankAccount = set.getString(22);
				anObject.servicesobjectContragentBankName = set.getString(23);
				anObject.servicesobjectContragentBankMfo = set.getString(24);
				anObject.servicesobjectContragentBossName = set.getString(25);
				anObject.servicesobjectContragentPassport = set.getString(26);
				anObject.servicesobjectContractServicesSumma = set.getBigDecimal(27);
				if(anObject.servicesobjectContractServicesSumma != null) {
					anObject.servicesobjectContractServicesSumma = anObject.servicesobjectContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesSummaVAT = set.getBigDecimal(28);
				if(anObject.servicesobjectContractServicesSummaVAT != null) {
					anObject.servicesobjectContractServicesSummaVAT = anObject.servicesobjectContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesPower = set.getBigDecimal(29);
				if(anObject.servicesobjectContractServicesPower != null) {
					anObject.servicesobjectContractServicesPower = anObject.servicesobjectContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCommentServicesGen = set.getString(30);
				anObject.servicesobjectContractServicesDistance = set.getBigDecimal(31);
				if(anObject.servicesobjectContractServicesDistance != null) {
					anObject.servicesobjectContractServicesDistance = anObject.servicesobjectContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesDay = set.getBigDecimal(32);
				if(anObject.servicesobjectContractServicesDay != null) {
					anObject.servicesobjectContractServicesDay = anObject.servicesobjectContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectUserGen = set.getString(33);
				anObject.servicesobjectDateEdit = set.getDate(34);
				anObject.servicesobjectWarrantDate = set.getDate(35);
				anObject.servicesobjectWarrantNumber = set.getString(36);
				anObject.servicesobjectWarrantFIO = set.getString(37);
				anObject.servicesobjectRegionalType = set.getInt(38);
				if(set.wasNull()) {
					anObject.servicesobjectRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBasisType = set.getBigDecimal(39);
				if(anObject.servicesobjectBasisType != null) {
					anObject.servicesobjectBasisType = anObject.servicesobjectBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContragentPosition = set.getString(40);
				anObject.servicesobjectExecuteWorkDate = set.getDate(41);
				anObject.servicesobjectTimeStart = set.getTimestamp(42);
				anObject.servicesobjectTimeFinal = set.getTimestamp(43);
				anObject.servicesobjectContragentPhoneNumber = set.getString(44);
				anObject.servicesobjectExecutorPhoneNumber = set.getString(45);
				anObject.servicesobjectContragentObjectWork = set.getString(46);
				anObject.servicesobjectIsNoPay = set.getInt(47);
				if(set.wasNull()) {
					anObject.servicesobjectIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectIsCustomerMaterials = set.getInt(48);
				if(set.wasNull()) {
					anObject.servicesobjectIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDate = set.getDate(49);
				anObject.servicesobjectFinPayFormCode = set.getInt(50);
				if(set.wasNull()) {
					anObject.servicesobjectFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFinPayFormName = set.getString(51);
				anObject.servicesobjectPartnerId = set.getInt(52);
				if(set.wasNull()) {
					anObject.servicesobjectPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDetail = set.getString(53);
				anObject.servicesobjectActTransferNumber = set.getString(54);
				anObject.servicesobjectActTransferDate = set.getDate(55);
				anObject.servicesobjectResposible = set.getString(56);
				anObject.servicesobjectResposiblePosition = set.getString(57);
				anObject.servicesobjectResposibleTabNumber = set.getString(58);
				anObject.servicesobjectPrevContractStatus = set.getInt(59);
				if(set.wasNull()) {
					anObject.servicesobjectPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesobjectReconnectionTU = set.getInt(60);
				if(set.wasNull()) {
					anObject.servicesobjectReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountCode = set.getInt(61);
				if(set.wasNull()) {
					anObject.servicesobjectPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountNumber = set.getString(62);
				anObject.servicesobjectTabNumber = set.getString(63);
				anObject.servicesobjectCitiesList = set.getString(64);
				anObject.servicesobjectLineLength = set.getBigDecimal(65);
				if(anObject.servicesobjectLineLength != null) {
					anObject.servicesobjectLineLength = anObject.servicesobjectLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectProjectCode = set.getString(66);
				anObject.servicesobjectCnPackCode = set.getInt(67);
				if(set.wasNull()) {
					anObject.servicesobjectCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectDfPackCode = set.getInt(68);
				if(set.wasNull()) {
					anObject.servicesobjectDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCountersZoneType = set.getInt(69);
				if(set.wasNull()) {
					anObject.servicesobjectCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectAxPartnerCode = set.getString(70);
				anObject.servicesobjectAxPartnerName = set.getString(71);
				anObject.servicesobjectAxContractNumber = set.getString(72);
				anObject.servicesobjectAxContractDate = set.getDate(73);
				anObject.servicesobjectAxContractCode = set.getString(74);
				anObject.servicesobjectAxContractId = set.getString(75);
				anObject.servicesobjectAxContractCommentGen = set.getString(76);
				anObject.servicesobjectProjAgreeSumma = set.getBigDecimal(77);
				if(anObject.servicesobjectProjAgreeSumma != null) {
					anObject.servicesobjectProjAgreeSumma = anObject.servicesobjectProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectTopographySumma = set.getBigDecimal(78);
				if(anObject.servicesobjectTopographySumma != null) {
					anObject.servicesobjectTopographySumma = anObject.servicesobjectTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCreatedFromSite = set.getInt(79);
				if(set.wasNull()) {
					anObject.servicesobjectCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesobjectTerm = set.getInt(80);
				if(set.wasNull()) {
					anObject.servicesobjectTerm = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRegulation = set.getInt(81);
				if(set.wasNull()) {
					anObject.servicesobjectRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBoundaryDateWork = set.getDate(82);
				anObject.servicesobjectCountDayDelay = set.getInt(83);
				if(set.wasNull()) {
					anObject.servicesobjectCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFactDateWork = set.getDate(84);
				anObject.servicesobjectCodeEIC = set.getString(85);
				anObject.servicesobjectPersonalAccountUid = set.getString(86);
				anObject.so2nodeTypeCode = set.getInt(87);
				if(set.wasNull()) {
					anObject.so2nodeTypeCode = Integer.MIN_VALUE;
				}
				anObject.so2nodeTypeName = set.getString(88);
				anObject.ccelementdataname = set.getString(89);
				anObject.f150 = set.getString(90);
				anObject.s150 = set.getString(91);
				anObject.f35 = set.getString(92);
				anObject.s35 = set.getString(93);
				anObject.f10 = set.getString(94);
				anObject.s10 = set.getString(95);
				anObject.f04 = set.getString(96);
				
				anObject.tc_address = set.getString(97); 
				anObject.tc_building = set.getString(98);
				anObject.tc_currpower = set.getBigDecimal(99); 
				if(anObject.tc_currpower != null) {
					anObject.tc_currpower = anObject.tc_currpower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tc_servpower = set.getBigDecimal(100); 
				if(anObject.tc_servpower != null) {
					anObject.tc_servpower = anObject.tc_servpower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tc_currvoltage = set.getBigDecimal(101); 
				if(anObject.tc_currvoltage != null) {
					anObject.tc_currvoltage = anObject.tc_currvoltage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tc_servvoltage = set.getBigDecimal(102); 
				if(anObject.tc_servvoltage != null) {
					anObject.tc_servvoltage = anObject.tc_servvoltage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.dep_name = set.getString(103);
				anObject.tc_number = set.getString(104);
			    anObject.tc_dategen = set.getDate(105);
				anObject.connectionkindname = set.getString(106);
			    anObject.fact_conn_date = set.getDate(107); 
			    anObject.tc_conpowpoint = set.getString(108) ;
			    anObject.tc_conpowplaces = set.getString(109); 
			    anObject.work_directly_on_joining = set.getString(110); 
			    anObject.servicesobjectContractStatusRefName = set.getString(111);//contractStatusRefName
				
			    anObject.ccTowerCode = set.getInt(112);
				if ( set.wasNull() ) {
					anObject.ccTowerCode = Integer.MIN_VALUE;
				}
				
			    anObject.towerName = set.getString(113); 
			    
				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();}             catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	


} // end of ENSO2NodeDAO
