
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENSOProj2SOConnDAOGen;
import com.ksoe.energynet.valueobject.ENSOProj2SOConn;
import com.ksoe.energynet.valueobject.brief.ENSOProj2SOConnShort;
import com.ksoe.energynet.valueobject.lists.ENSOProj2SOConnShortList;

/**
 * DAO Object for ENSOProj2SOConn;
 *
 */

public class ENSOProj2SOConnDAO extends ENSOProj2SOConnDAOGen {

    public ENSOProj2SOConnDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSOProj2SOConnDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
	public ENSOProj2SOConnShortList getScrollableFilteredList(ENSOProj2SOConn aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENSOProj2SOConnShortList result = new ENSOProj2SOConnShortList();
		ENSOProj2SOConnShort anObject;
		result.list = new Vector<ENSOProj2SOConnShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSOPROJ2SOCONN.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSOPROJ2SOCONN.CODE"+
			", soProj.CODE " +
			", soProj.CONTRACTNUMBER " +
			", soProj.CONTRACTDATE " +
			", soProj.NAME " +
			", soProj.PARTNERCODE " +
			", soProj.FINDOCCODE " +
			", soProj.FINDOCID " +
			", soProj.COMMENTGEN " +
			", soProj.CONTRACTNUMBERSERVICES " +
			", soProj.CONTRACTDATESERVICES " +
			", soProj.CONTRAGENTNAME " +
			", soProj.CONTRAGENTADDRESS " +
			", soProj.CONTRAGENTADDRESSWORK " +
			", soProj.CONTRAGENTOKPO " +
			", soProj.CONTRAGENTBANKACCOUNT " +
			", soProj.CONTRAGENTBANKNAME " +
			", soProj.CONTRAGENTBANKMFO " +
			", soProj.CONTRAGENTBOSSNAME " +
			", soProj.CONTRAGENTPASSPORT " +
			", soProj.CONTRACTSERVICESSUMMA " +
			", soProj.CONTRACTSERVICESPOWER " +
			", soProj.COMMENTSERVICESGEN " +
			", soProj.CONTRACTSERVICESDISTNC " +
			", soProj.CONTRACTSERVICESDAY " +
			", soProj.USERGEN " +
			", soProj.DATEEDIT " +
			", soProj.WARRANTDATE " +
			", soProj.WARRANTNUMBER " +
			", soProj.WARRANTFIO " +
			", soProj.REGIONALTYPE " +
			", soProj.BASISTYPE " +
			", soProj.CONTRAGENTPOSITION " +
			", soProj.EXECUTEWORKDATE " +
			", soProj.TIMESTART " +
			", soProj.TIMEFINAL " +
			", soProj.CONTRAGENTPHONENUMBER " +
			", soProj.EXECUTORPHONENUMBER " +
			", soProj.CONTRAGENTOBJECTWORK " +
			", soProj.ISNOPAY " +
			", soProj.ISCUSTOMERMATERIALS " +
			", soProj.PAYDATE " +
			", soProj.FINPAYFORMCODE " +
			", soProj.FINPAYFORMNAME " +
			", soProj.PARTNERID " +
			", soProj.PAYDETAIL " +
			", soProj.ACTTRANSFERNUMBER " +
			", soProj.ACTTRANSFERDATE " +
			", soProj.RESPOSIBLE " +
			", soProj.RESPOSIBLEPOSITION " +
			", soProj.RESPOSIBLETABNUMBER " +
			", soProj.PREVCONTRACTSTATUS " +
			", soProj.RECONNECTIONTU " +
			", soProj.PERSONALACCOUNTCODE " +
			", soProj.PERSONALACCOUNTNUMBER " +
			", soProj.TABNUMBER " +
			", soProj.CITIESLIST " +
			", soProj.LINELENGTH " +
			", soProj.PROJECTCODE " +
			", soProj.CNPACKCODE " +
			", soProj.DFPACKCODE " +
			", soProj.COUNTERSZONETYPE " +
			", soProj.AXPARTNERCODE " +
			", soProj.AXPARTNERNAME " +
			", soProj.AXCONTRACTNUMBER " +
			", soProj.AXCONTRACTDATE " +
			", soProj.AXCONTRACTCODE " +
			", soProj.AXCONTRACTID " +
			", soProj.AXCONTRACTCOMMENTGEN " +
			", soConn.CODE " +
			", soConn.CONTRACTNUMBER " +
			", soConn.CONTRACTDATE " +
			", soConn.NAME " +
			", soConn.PARTNERCODE " +
			", soConn.FINDOCCODE " +
			", soConn.FINDOCID " +
			", soConn.COMMENTGEN " +
			", soConn.CONTRACTNUMBERSERVICES " +
			", soConn.CONTRACTDATESERVICES " +
			", soConn.CONTRAGENTNAME " +
			", soConn.CONTRAGENTADDRESS " +
			", soConn.CONTRAGENTADDRESSWORK " +
			", soConn.CONTRAGENTOKPO " +
			", soConn.CONTRAGENTBANKACCOUNT " +
			", soConn.CONTRAGENTBANKNAME " +
			", soConn.CONTRAGENTBANKMFO " +
			", soConn.CONTRAGENTBOSSNAME " +
			", soConn.CONTRAGENTPASSPORT " +
			", soConn.CONTRACTSERVICESSUMMA " +
			", soConn.CONTRACTSERVICESPOWER " +
			", soConn.COMMENTSERVICESGEN " +
			", soConn.CONTRACTSERVICESDISTNC " +
			", soConn.CONTRACTSERVICESDAY " +
			", soConn.USERGEN " +
			", soConn.DATEEDIT " +
			", soConn.WARRANTDATE " +
			", soConn.WARRANTNUMBER " +
			", soConn.WARRANTFIO " +
			", soConn.REGIONALTYPE " +
			", soConn.BASISTYPE " +
			", soConn.CONTRAGENTPOSITION " +
			", soConn.EXECUTEWORKDATE " +
			", soConn.TIMESTART " +
			", soConn.TIMEFINAL " +
			", soConn.CONTRAGENTPHONENUMBER " +
			", soConn.EXECUTORPHONENUMBER " +
			", soConn.CONTRAGENTOBJECTWORK " +
			", soConn.ISNOPAY " +
			", soConn.ISCUSTOMERMATERIALS " +
			", soConn.PAYDATE " +
			", soConn.FINPAYFORMCODE " +
			", soConn.FINPAYFORMNAME " +
			", soConn.PARTNERID " +
			", soConn.PAYDETAIL " +
			", soConn.ACTTRANSFERNUMBER " +
			", soConn.ACTTRANSFERDATE " +
			", soConn.RESPOSIBLE " +
			", soConn.RESPOSIBLEPOSITION " +
			", soConn.RESPOSIBLETABNUMBER " +
			", soConn.PREVCONTRACTSTATUS " +
			", soConn.RECONNECTIONTU " +
			", soConn.PERSONALACCOUNTCODE " +
			", soConn.PERSONALACCOUNTNUMBER " +
			", soConn.TABNUMBER " +
			", soConn.CITIESLIST " +
			", soConn.LINELENGTH " +
			", soConn.PROJECTCODE " +
			", soConn.CNPACKCODE " +
			", soConn.DFPACKCODE " +
			", soConn.COUNTERSZONETYPE " +
			", soConn.AXPARTNERCODE " +
			", soConn.AXPARTNERNAME " +
			", soConn.AXCONTRACTNUMBER " +
			", soConn.AXCONTRACTDATE " +
			", soConn.AXCONTRACTCODE " +
			", soConn.AXCONTRACTID " +
			", soConn.AXCONTRACTCOMMENTGEN " +
		" FROM ENSOPROJ2SOCONN " +
			", ENSERVICESOBJECT soProj" +
			", ENSERVICESOBJECT soConn" +
		"";
		whereStr = " soProj.CODE = ENSOPROJ2SOCONN.SOPROJREFCODE" ; //+
		whereStr += " AND soConn.CODE = ENSOPROJ2SOCONN.SOCONNREFCODE" ; //+

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);
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
				anObject = new ENSOProj2SOConnShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.SOProjRefCode = set.getInt(2);
				if(set.wasNull()) {
					anObject.SOProjRefCode = Integer.MIN_VALUE;
				}
				anObject.SOProjRefContractNumber = set.getString(3);
				anObject.SOProjRefContractDate = set.getDate(4);
				anObject.SOProjRefName = set.getString(5);
				anObject.SOProjRefPartnerCode = set.getString(6);
				anObject.SOProjRefFinDocCode = set.getString(7);
				anObject.SOProjRefFinDocID = set.getInt(8);
				if(set.wasNull()) {
					anObject.SOProjRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.SOProjRefCommentGen = set.getString(9);
				anObject.SOProjRefContractNumberServices = set.getString(10);
				anObject.SOProjRefContractDateServices = set.getDate(11);
				anObject.SOProjRefContragentName = set.getString(12);
				anObject.SOProjRefContragentAddress = set.getString(13);
				anObject.SOProjRefContragentAddressWork = set.getString(14);
				anObject.SOProjRefContragentOkpo = set.getString(15);
				anObject.SOProjRefContragentBankAccount = set.getString(16);
				anObject.SOProjRefContragentBankName = set.getString(17);
				anObject.SOProjRefContragentBankMfo = set.getString(18);
				anObject.SOProjRefContragentBossName = set.getString(19);
				anObject.SOProjRefContragentPassport = set.getString(20);
				anObject.SOProjRefContractServicesSumma = set.getBigDecimal(21);
				if(anObject.SOProjRefContractServicesSumma != null) {
					anObject.SOProjRefContractServicesSumma = anObject.SOProjRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOProjRefContractServicesPower = set.getBigDecimal(22);
				if(anObject.SOProjRefContractServicesPower != null) {
					anObject.SOProjRefContractServicesPower = anObject.SOProjRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOProjRefCommentServicesGen = set.getString(23);
				anObject.SOProjRefContractServicesDistance = set.getBigDecimal(24);
				if(anObject.SOProjRefContractServicesDistance != null) {
					anObject.SOProjRefContractServicesDistance = anObject.SOProjRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOProjRefContractServicesDay = set.getBigDecimal(25);
				if(anObject.SOProjRefContractServicesDay != null) {
					anObject.SOProjRefContractServicesDay = anObject.SOProjRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOProjRefUserGen = set.getString(26);
				anObject.SOProjRefDateEdit = set.getDate(27);
				anObject.SOProjRefWarrantDate = set.getDate(28);
				anObject.SOProjRefWarrantNumber = set.getString(29);
				anObject.SOProjRefWarrantFIO = set.getString(30);
				anObject.SOProjRefRegionalType = set.getInt(31);
				if(set.wasNull()) {
					anObject.SOProjRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.SOProjRefBasisType = set.getBigDecimal(32);
				if(anObject.SOProjRefBasisType != null) {
					anObject.SOProjRefBasisType = anObject.SOProjRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOProjRefContragentPosition = set.getString(33);
				anObject.SOProjRefExecuteWorkDate = set.getDate(34);
				anObject.SOProjRefTimeStart = set.getTimestamp(35);
				anObject.SOProjRefTimeFinal = set.getTimestamp(36);
				anObject.SOProjRefContragentPhoneNumber = set.getString(37);
				anObject.SOProjRefExecutorPhoneNumber = set.getString(38);
				anObject.SOProjRefContragentObjectWork = set.getString(39);
				anObject.SOProjRefIsNoPay = set.getInt(40);
				if(set.wasNull()) {
					anObject.SOProjRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.SOProjRefIsCustomerMaterials = set.getInt(41);
				if(set.wasNull()) {
					anObject.SOProjRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.SOProjRefPayDate = set.getDate(42);
				anObject.SOProjRefFinPayFormCode = set.getInt(43);
				if(set.wasNull()) {
					anObject.SOProjRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.SOProjRefFinPayFormName = set.getString(44);
				anObject.SOProjRefPartnerId = set.getInt(45);
				if(set.wasNull()) {
					anObject.SOProjRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.SOProjRefPayDetail = set.getString(46);
				anObject.SOProjRefActTransferNumber = set.getString(47);
				anObject.SOProjRefActTransferDate = set.getDate(48);
				anObject.SOProjRefResposible = set.getString(49);
				anObject.SOProjRefResposiblePosition = set.getString(50);
				anObject.SOProjRefResposibleTabNumber = set.getString(51);
				anObject.SOProjRefPrevContractStatus = set.getInt(52);
				if(set.wasNull()) {
					anObject.SOProjRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.SOProjRefReconnectionTU = set.getInt(53);
				if(set.wasNull()) {
					anObject.SOProjRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.SOProjRefPersonalAccountCode = set.getInt(54);
				if(set.wasNull()) {
					anObject.SOProjRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.SOProjRefPersonalAccountNumber = set.getString(55);
				anObject.SOProjRefTabNumber = set.getString(56);
				anObject.SOProjRefCitiesList = set.getString(57);
				anObject.SOProjRefLineLength = set.getBigDecimal(58);
				if(anObject.SOProjRefLineLength != null) {
					anObject.SOProjRefLineLength = anObject.SOProjRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOProjRefProjectCode = set.getString(59);
				anObject.SOProjRefCnPackCode = set.getInt(60);
				if(set.wasNull()) {
					anObject.SOProjRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.SOProjRefDfPackCode = set.getInt(61);
				if(set.wasNull()) {
					anObject.SOProjRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.SOProjRefCountersZoneType = set.getInt(62);
				if(set.wasNull()) {
					anObject.SOProjRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.SOProjRefAxPartnerCode = set.getString(63);
				anObject.SOProjRefAxPartnerName = set.getString(64);
				anObject.SOProjRefAxContractNumber = set.getString(65);
				anObject.SOProjRefAxContractDate = set.getDate(66);
				anObject.SOProjRefAxContractCode = set.getString(67);
				anObject.SOProjRefAxContractId = set.getString(68);
				anObject.SOProjRefAxContractCommentGen = set.getString(69);
				anObject.SOConnRefCode = set.getInt(70);
				if(set.wasNull()) {
					anObject.SOConnRefCode = Integer.MIN_VALUE;
				}
				anObject.SOConnRefContractNumber = set.getString(71);
				anObject.SOConnRefContractDate = set.getDate(72);
				anObject.SOConnRefName = set.getString(73);
				anObject.SOConnRefPartnerCode = set.getString(74);
				anObject.SOConnRefFinDocCode = set.getString(75);
				anObject.SOConnRefFinDocID = set.getInt(76);
				if(set.wasNull()) {
					anObject.SOConnRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.SOConnRefCommentGen = set.getString(77);
				anObject.SOConnRefContractNumberServices = set.getString(78);
				anObject.SOConnRefContractDateServices = set.getDate(79);
				anObject.SOConnRefContragentName = set.getString(80);
				anObject.SOConnRefContragentAddress = set.getString(81);
				anObject.SOConnRefContragentAddressWork = set.getString(82);
				anObject.SOConnRefContragentOkpo = set.getString(83);
				anObject.SOConnRefContragentBankAccount = set.getString(84);
				anObject.SOConnRefContragentBankName = set.getString(85);
				anObject.SOConnRefContragentBankMfo = set.getString(86);
				anObject.SOConnRefContragentBossName = set.getString(87);
				anObject.SOConnRefContragentPassport = set.getString(88);
				anObject.SOConnRefContractServicesSumma = set.getBigDecimal(89);
				if(anObject.SOConnRefContractServicesSumma != null) {
					anObject.SOConnRefContractServicesSumma = anObject.SOConnRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOConnRefContractServicesPower = set.getBigDecimal(90);
				if(anObject.SOConnRefContractServicesPower != null) {
					anObject.SOConnRefContractServicesPower = anObject.SOConnRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOConnRefCommentServicesGen = set.getString(91);
				anObject.SOConnRefContractServicesDistance = set.getBigDecimal(92);
				if(anObject.SOConnRefContractServicesDistance != null) {
					anObject.SOConnRefContractServicesDistance = anObject.SOConnRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOConnRefContractServicesDay = set.getBigDecimal(93);
				if(anObject.SOConnRefContractServicesDay != null) {
					anObject.SOConnRefContractServicesDay = anObject.SOConnRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOConnRefUserGen = set.getString(94);
				anObject.SOConnRefDateEdit = set.getDate(95);
				anObject.SOConnRefWarrantDate = set.getDate(96);
				anObject.SOConnRefWarrantNumber = set.getString(97);
				anObject.SOConnRefWarrantFIO = set.getString(98);
				anObject.SOConnRefRegionalType = set.getInt(99);
				if(set.wasNull()) {
					anObject.SOConnRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.SOConnRefBasisType = set.getBigDecimal(100);
				if(anObject.SOConnRefBasisType != null) {
					anObject.SOConnRefBasisType = anObject.SOConnRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOConnRefContragentPosition = set.getString(101);
				anObject.SOConnRefExecuteWorkDate = set.getDate(102);
				anObject.SOConnRefTimeStart = set.getTimestamp(103);
				anObject.SOConnRefTimeFinal = set.getTimestamp(104);
				anObject.SOConnRefContragentPhoneNumber = set.getString(105);
				anObject.SOConnRefExecutorPhoneNumber = set.getString(106);
				anObject.SOConnRefContragentObjectWork = set.getString(107);
				anObject.SOConnRefIsNoPay = set.getInt(108);
				if(set.wasNull()) {
					anObject.SOConnRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.SOConnRefIsCustomerMaterials = set.getInt(109);
				if(set.wasNull()) {
					anObject.SOConnRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.SOConnRefPayDate = set.getDate(110);
				anObject.SOConnRefFinPayFormCode = set.getInt(111);
				if(set.wasNull()) {
					anObject.SOConnRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.SOConnRefFinPayFormName = set.getString(112);
				anObject.SOConnRefPartnerId = set.getInt(113);
				if(set.wasNull()) {
					anObject.SOConnRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.SOConnRefPayDetail = set.getString(114);
				anObject.SOConnRefActTransferNumber = set.getString(115);
				anObject.SOConnRefActTransferDate = set.getDate(116);
				anObject.SOConnRefResposible = set.getString(117);
				anObject.SOConnRefResposiblePosition = set.getString(118);
				anObject.SOConnRefResposibleTabNumber = set.getString(119);
				anObject.SOConnRefPrevContractStatus = set.getInt(120);
				if(set.wasNull()) {
					anObject.SOConnRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.SOConnRefReconnectionTU = set.getInt(121);
				if(set.wasNull()) {
					anObject.SOConnRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.SOConnRefPersonalAccountCode = set.getInt(122);
				if(set.wasNull()) {
					anObject.SOConnRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.SOConnRefPersonalAccountNumber = set.getString(123);
				anObject.SOConnRefTabNumber = set.getString(124);
				anObject.SOConnRefCitiesList = set.getString(125);
				anObject.SOConnRefLineLength = set.getBigDecimal(126);
				if(anObject.SOConnRefLineLength != null) {
					anObject.SOConnRefLineLength = anObject.SOConnRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOConnRefProjectCode = set.getString(127);
				anObject.SOConnRefCnPackCode = set.getInt(128);
				if(set.wasNull()) {
					anObject.SOConnRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.SOConnRefDfPackCode = set.getInt(129);
				if(set.wasNull()) {
					anObject.SOConnRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.SOConnRefCountersZoneType = set.getInt(130);
				if(set.wasNull()) {
					anObject.SOConnRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.SOConnRefAxPartnerCode = set.getString(131);
				anObject.SOConnRefAxPartnerName = set.getString(132);
				anObject.SOConnRefAxContractNumber = set.getString(133);
				anObject.SOConnRefAxContractDate = set.getDate(134);
				anObject.SOConnRefAxContractCode = set.getString(135);
				anObject.SOConnRefAxContractId = set.getString(136);
				anObject.SOConnRefAxContractCommentGen = set.getString(137);

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
	

} // end of ENSOProj2SOConnDAO
