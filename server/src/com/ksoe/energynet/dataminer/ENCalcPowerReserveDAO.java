
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
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
import com.ksoe.energynet.dataminer.generated.ENCalcPowerReserveDAOGen;
import com.ksoe.energynet.valueobject.ENCalcPowerReserve;
import com.ksoe.energynet.valueobject.brief.ENCalcPowerReserveShort;
import com.ksoe.energynet.valueobject.lists.ENCalcPowerReserveShortList;

/**
 * DAO Object for ENCalcPowerReserve;
 *
 */

public class ENCalcPowerReserveDAO extends ENCalcPowerReserveDAOGen {

    public ENCalcPowerReserveDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENCalcPowerReserveDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    
	public ENCalcPowerReserveShortList getScrollableFilteredList(ENCalcPowerReserve aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENCalcPowerReserveShortList result = new ENCalcPowerReserveShortList();
		ENCalcPowerReserveShort anObject;
		result.list = new Vector<ENCalcPowerReserveShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCALCPOWERRESERVE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENCALCPOWERRESERVE.CODE"+
			",ENCALCPOWERRESERVE.USERGEN"+
			",ENCALCPOWERRESERVE.DATEEDIT"+
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
			", ENGAUGE150.CODE " +
			", fig.CODE " +
			", fig.currentphasegreen || ';' || fig.currentphasered || ';' || fig.currentphaseyellow  as gvalues " +
			", fig.dateguage as gdate " +  
            ", tr.name as trname " +
            ", trt.name as typename " +
            ", tr.nominalpower " +
            ", s04.name as subsname " +
		" FROM ENCALCPOWERRESERVE " +
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENCALCPOWERRESERVE.SERVICESOBJECTREFCODE "+
			" LEFT JOIN ENGAUGE150 on ENGAUGE150.CODE = ENCALCPOWERRESERVE.GAUGE150REFCODE "+
			" LEFT JOIN ENFIDERGUAGE fig on fig.CODE = ENCALCPOWERRESERVE.GAUGEREFCODE "+
			" left join entransformer tr on (fig.transformercode = tr.code)	" +
			" left join entransformertype trt on (tr.transformertypecode = trt.code) " +
			" left join ensubstation04 s04 on (s04.code = fig.substation04code) " +
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
				anObject = new ENCalcPowerReserveShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(2);
				anObject.dateEdit = set.getTimestamp(3);

				anObject.servicesobjectRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.servicesobjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefContractNumber = set.getString(5);
				anObject.servicesobjectRefContractDate = set.getDate(6);
				anObject.servicesobjectRefName = set.getString(7);
				anObject.servicesobjectRefPartnerCode = set.getString(8);
				anObject.servicesobjectRefFinDocCode = set.getString(9);
				anObject.servicesobjectRefFinDocID = set.getInt(10);
				if(set.wasNull()) {
					anObject.servicesobjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefCommentGen = set.getString(11);
				anObject.servicesobjectRefContractNumberServices = set.getString(12);
				anObject.servicesobjectRefContractDateServices = set.getDate(13);
				anObject.servicesobjectRefContragentName = set.getString(14);
				anObject.servicesobjectRefContragentAddress = set.getString(15);
				anObject.servicesobjectRefContragentAddressWork = set.getString(16);
				anObject.servicesobjectRefContragentOkpo = set.getString(17);
				anObject.servicesobjectRefContragentBankAccount = set.getString(18);
				anObject.servicesobjectRefContragentBankName = set.getString(19);
				anObject.servicesobjectRefContragentBankMfo = set.getString(20);
				anObject.servicesobjectRefContragentBossName = set.getString(21);
				anObject.servicesobjectRefContragentPassport = set.getString(22);
				anObject.servicesobjectRefContractServicesSumma = set.getBigDecimal(23);
				if(anObject.servicesobjectRefContractServicesSumma != null) {
					anObject.servicesobjectRefContractServicesSumma = anObject.servicesobjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefContractServicesSummaVAT = set.getBigDecimal(24);
				if(anObject.servicesobjectRefContractServicesSummaVAT != null) {
					anObject.servicesobjectRefContractServicesSummaVAT = anObject.servicesobjectRefContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefContractServicesPower = set.getBigDecimal(25);
				if(anObject.servicesobjectRefContractServicesPower != null) {
					anObject.servicesobjectRefContractServicesPower = anObject.servicesobjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefCommentServicesGen = set.getString(26);
				anObject.servicesobjectRefContractServicesDistance = set.getBigDecimal(27);
				if(anObject.servicesobjectRefContractServicesDistance != null) {
					anObject.servicesobjectRefContractServicesDistance = anObject.servicesobjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefContractServicesDay = set.getBigDecimal(28);
				if(anObject.servicesobjectRefContractServicesDay != null) {
					anObject.servicesobjectRefContractServicesDay = anObject.servicesobjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefUserGen = set.getString(29);
				anObject.servicesobjectRefDateEdit = set.getDate(30);
				anObject.servicesobjectRefWarrantDate = set.getDate(31);
				anObject.servicesobjectRefWarrantNumber = set.getString(32);
				anObject.servicesobjectRefWarrantFIO = set.getString(33);
				anObject.servicesobjectRefRegionalType = set.getInt(34);
				if(set.wasNull()) {
					anObject.servicesobjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefBasisType = set.getBigDecimal(35);
				if(anObject.servicesobjectRefBasisType != null) {
					anObject.servicesobjectRefBasisType = anObject.servicesobjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefContragentPosition = set.getString(36);
				anObject.servicesobjectRefExecuteWorkDate = set.getDate(37);
				anObject.servicesobjectRefTimeStart = set.getTimestamp(38);
				anObject.servicesobjectRefTimeFinal = set.getTimestamp(39);
				anObject.servicesobjectRefContragentPhoneNumber = set.getString(40);
				anObject.servicesobjectRefExecutorPhoneNumber = set.getString(41);
				anObject.servicesobjectRefContragentObjectWork = set.getString(42);
				anObject.servicesobjectRefIsNoPay = set.getInt(43);
				if(set.wasNull()) {
					anObject.servicesobjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefIsCustomerMaterials = set.getInt(44);
				if(set.wasNull()) {
					anObject.servicesobjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefPayDate = set.getDate(45);
				anObject.servicesobjectRefFinPayFormCode = set.getInt(46);
				if(set.wasNull()) {
					anObject.servicesobjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefFinPayFormName = set.getString(47);
				anObject.servicesobjectRefPartnerId = set.getInt(48);
				if(set.wasNull()) {
					anObject.servicesobjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefPayDetail = set.getString(49);
				anObject.servicesobjectRefActTransferNumber = set.getString(50);
				anObject.servicesobjectRefActTransferDate = set.getDate(51);
				anObject.servicesobjectRefResposible = set.getString(52);
				anObject.servicesobjectRefResposiblePosition = set.getString(53);
				anObject.servicesobjectRefResposibleTabNumber = set.getString(54);
				anObject.servicesobjectRefPrevContractStatus = set.getInt(55);
				if(set.wasNull()) {
					anObject.servicesobjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefReconnectionTU = set.getInt(56);
				if(set.wasNull()) {
					anObject.servicesobjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefPersonalAccountCode = set.getInt(57);
				if(set.wasNull()) {
					anObject.servicesobjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefPersonalAccountNumber = set.getString(58);
				anObject.servicesobjectRefTabNumber = set.getString(59);
				anObject.servicesobjectRefCitiesList = set.getString(60);
				anObject.servicesobjectRefLineLength = set.getBigDecimal(61);
				if(anObject.servicesobjectRefLineLength != null) {
					anObject.servicesobjectRefLineLength = anObject.servicesobjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefProjectCode = set.getString(62);
				anObject.servicesobjectRefCnPackCode = set.getInt(63);
				if(set.wasNull()) {
					anObject.servicesobjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefDfPackCode = set.getInt(64);
				if(set.wasNull()) {
					anObject.servicesobjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefCountersZoneType = set.getInt(65);
				if(set.wasNull()) {
					anObject.servicesobjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefAxPartnerCode = set.getString(66);
				anObject.servicesobjectRefAxPartnerName = set.getString(67);
				anObject.servicesobjectRefAxContractNumber = set.getString(68);
				anObject.servicesobjectRefAxContractDate = set.getDate(69);
				anObject.servicesobjectRefAxContractCode = set.getString(70);
				anObject.servicesobjectRefAxContractId = set.getString(71);
				anObject.servicesobjectRefAxContractCommentGen = set.getString(72);
				anObject.servicesobjectRefProjAgreeSumma = set.getBigDecimal(73);
				if(anObject.servicesobjectRefProjAgreeSumma != null) {
					anObject.servicesobjectRefProjAgreeSumma = anObject.servicesobjectRefProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefTopographySumma = set.getBigDecimal(74);
				if(anObject.servicesobjectRefTopographySumma != null) {
					anObject.servicesobjectRefTopographySumma = anObject.servicesobjectRefTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefCreatedFromSite = set.getInt(75);
				if(set.wasNull()) {
					anObject.servicesobjectRefCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefTerm = set.getInt(76);
				if(set.wasNull()) {
					anObject.servicesobjectRefTerm = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefRegulation = set.getInt(77);
				if(set.wasNull()) {
					anObject.servicesobjectRefRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefBoundaryDateWork = set.getDate(78);
				anObject.servicesobjectRefCountDayDelay = set.getInt(79);
				if(set.wasNull()) {
					anObject.servicesobjectRefCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefFactDateWork = set.getDate(80);
				anObject.servicesobjectRefCodeEIC = set.getString(81);
				anObject.servicesobjectRefPersonalAccountUid = set.getString(82);
				anObject.gauge150RefCode = set.getInt(83);
				if(set.wasNull()) {
					anObject.gauge150RefCode = Integer.MIN_VALUE;
				}
				anObject.gaugeRefCode = set.getInt(84);
				if(set.wasNull()) {
					anObject.gaugeRefCode = Integer.MIN_VALUE;
				}
				
				anObject.gvalues = set.getString(85);
				anObject.gdate = set.getDate(86);
				anObject.trname = set.getString(87);
				anObject.trtypename = set.getString(88);
				
				anObject.trnominalpower = set.getInt(89);
				if(set.wasNull()) {
					anObject.trnominalpower = Integer.MIN_VALUE;
				}
				anObject.subsname = set.getString(90);
				
				
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
	

} // end of ENCalcPowerReserveDAO
