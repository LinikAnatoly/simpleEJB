
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.dataminer.TKCalcMaterialsDAO;
import com.ksoe.techcard.valueobject.TKCalcCost;
import com.ksoe.techcard.valueobject.TKClassificationType;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENServicesCostDAOGen;
import com.ksoe.energynet.logic.ServicesCalculatorLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENServicesCost;
import com.ksoe.energynet.valueobject.ENServicesMaterials;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesTransport;
import com.ksoe.energynet.valueobject.brief.ENServicesCostShort;
import com.ksoe.energynet.valueobject.filter.ENServicesCostFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesCostShortList;
import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

/**
 * DAO Object for ENServicesCost;
 *
 */

public class ENServicesCostDAO extends ENServicesCostDAOGen {

    public ENServicesCostDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServicesCostDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    
    /**
     * 
     * Получить коды объектов {@link ENServicesCost} связанных с объектом {@link TKCalcCost}
     * 
     * @param calcCost объект расчета калькуляции {@link}
     * @return
     * @throws PersistenceException
     */
    public int[] getCodesByTKCalcCost(TKCalcCost calcCost) throws PersistenceException {
    	ENServicesCostFilter filter = new ENServicesCostFilter();
    	filter.tkCalcCostRef.code = calcCost.code;
    	return this.getFilteredCodeArray(filter, 0, -1);
    }
    
    public ENServicesCost removeENServicesCostAndReturnTransientState(ENServicesCost servicesCost) throws PersistenceException {
    	ServicesCalculatorLogic servicesCalculatorLogic = new ServicesCalculatorLogic(this.getConnection(), this.getUserProfile());
    	ENServicesMaterialsDAO servicesMaterialsDao = new ENServicesMaterialsDAO(this.getConnection(), this.getUserProfile());
    	TKCalcMaterialsDAO calcMaterialsDao = new TKCalcMaterialsDAO(this.getConnection(), this.getUserProfile());
    	ENServicesTransportDAO servicesTransportDao = new ENServicesTransportDAO(this.getConnection(), this.getUserProfile());
    	
    	ENServicesCost servicesCostOld = this.getObject(servicesCost.code);
    	servicesCostOld.materials = new Vector<ENServicesMaterials>();
    	
    	int[] materialCodes = servicesMaterialsDao.getArrayOfCodesByENServicesCost(servicesCost);
    	
    	for(int materialCode : materialCodes) {
    		ENServicesMaterials servicesMaterial = servicesMaterialsDao.getObject(materialCode);
    		if(servicesMaterial.calcMaterialsRef.code != Integer.MIN_VALUE) {
    			servicesMaterial.calcMaterial = calcMaterialsDao.getObject(servicesMaterial.calcMaterialsRef.code);    			
    		}
    		servicesCostOld.materials.add(servicesMaterial);
    	}
    	
    	int[] transportCodes = servicesTransportDao.getArrayOfCodesByENServicesCost(servicesCostOld);
    	if(transportCodes.length > 0) {
    		ENServicesTransport servicesTransport = servicesTransportDao.getObject(transportCodes[0]);
    		servicesCostOld.distance = servicesTransport.distance;
    	}
    	
    	servicesCalculatorLogic.removeServicesCost(servicesCostOld);
    	
    	return servicesCostOld;
    }
    
    public void restoreTransientState(ENServicesCost servicesCost, boolean preserveMaterials) throws PersistenceException {
    	ENServicesMaterialsDAO servicesMaterialsDao = new ENServicesMaterialsDAO(this.getConnection(), this.getUserProfile());
    	ServicesCalculatorLogic servicesCalculatorLogic = new ServicesCalculatorLogic(this.getConnection(), this.getUserProfile());
    	servicesCost.code = this.add(servicesCost);
    	if(preserveMaterials) {
	    	if(servicesCost.materials != null) {
	    		for(ENServicesMaterials material : servicesCost.materials) {
	    			material.servicesCostRef.code = servicesCost.code;
	    			servicesMaterialsDao.add(material);
	    		}
	    	}
    	}
    	
    	servicesCalculatorLogic.evaluateServicesCost(servicesCost, servicesCost.distance, null, preserveMaterials);
    }
    
    /**
     * 
     * Получить список кодов расчитанных калькуляций {@link EMServicesCost} для договора и
     * расходного акта
     * 
     * Выбираются только те калькуляции, работы которых включены в расходный акт
     * 
     * @param element объект элемента договора {@link ENElement}
     * @param act расходный акт
     * @return список кодов {@link ENServicesCost}
     */
    public List<Integer> getListOfCodesByENServicesObjectAndAct(ENElement element
    		, ENAct act) {
    	return this.getListOfCodesByENServicesObjectAndAct(element, act, null);
    }
    
    /**
     * 
     * Получить список кодов расчитанных калькуляций {@link EMServicesCost} для договора и
     * расходного акта
     * 
     * Выбираются только те калькуляции, работы которых включены в расходный акт
     * 
     * @param element объект договора {@link ENElement}
     * @param act расходный акт {@link ENAct}
     * @param clsType калькуляция если не {@code null} будут выбраны 
     * @return список кодов {@link ENServicesCost}
     */
    public List<Integer> getListOfCodesByENServicesObjectAndAct(ENElement element
    		, ENAct act, TKClassificationType clsType) {
    	
    	if(element == null || element.code == Integer.MIN_VALUE 
    			|| act == null || act.code == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException();
    	}
    	
    	String sql = "select distinct sco.code::integer from enact as ac " +
    			 "inner join enact2enplanwork as acpw on ac.code = acpw.actrefcode " +
    			 "inner join enplancorrecthistory as pch on acpw.plancode = pch.plannewrefcode " +
    			 "inner join enservicescost as sco on pch.planrefcode = sco.planrefcode " +
    			 "inner join enservicesobject as so on sco.servicesobjectrefcode = so.code " +
    			 "inner join tkcalccost as cc on sco.tkcalccostrefcode = cc.code " +
    			 "where " +
    			 "so.elementcode = ? and ac.code = ? " +
    			 ((clsType == null) ? "" : " and cc.classificationtyperfcd = ?");    	
    	Vector<Integer> params = new Vector<Integer>();
    	params.add(element.code);
    	params.add(act.code);
    	if(clsType != null) {
    		params.add(clsType.code);
    	}
    	
    	return BaseDAOUtils.executeStatementAndReadObjects(this.getConnection(), sql, params
    			, new BaseDAOUtils.IntegerFromResultSetTransformator(), false);
    }
    
    public ENServicesCost getObjectByENServicesObjectAndAct(ENElement element
    		, ENAct act, TKClassificationType clsType) throws PersistenceException {
    	List<Integer> list = this.getListOfCodesByENServicesObjectAndAct(element, act, clsType);
    	if(list.size() > 0) {
    		return this.getObject(list.get(0));
    	} else {
    		return null;
    	}
    }
    
	public ENServicesCostShortList getScrollableFilteredList(ENServicesCost aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENServicesCostShortList result = new ENServicesCostShortList();
		ENServicesCostShort anObject;
		result.list = new Vector<ENServicesCostShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESCOST.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSERVICESCOST.CODE"+
			",ENSERVICESCOST.DATEGEN"+
			",ENSERVICESCOST.CALCULATIONCOST"+
			",ENSERVICESCOST.COSTWITHOUTVAT"+
			",ENSERVICESCOST.COSTVAT"+
			",ENSERVICESCOST.COSTWITHVAT"+
			", TKCALCCOST.CODE " +
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
			", TKCLASSIFICATIONTYPE.KOD " +
			", TKCLASSIFICATIONTYPE.NAME " +
			", ENSERVICESCOST.PLANREFCODE " +
			", ENSERVICESCOST.COUNTGEN " +
			", TKFINWORKTYPE.KVED " +
		" FROM ENSERVICESCOST " +
			"INNER JOIN TKCALCCOST ON ENSERVICESCOST.TKCALCCOSTREFCODE = TKCALCCOST.CODE " +
			"INNER JOIN TKCLASSIFICATIONTYPE ON TKCALCCOST.CLASSIFICATIONTYPERFCD = TKCLASSIFICATIONTYPE.CODE " +
			"INNER JOIN ENSERVICESOBJECT ON ENSERVICESCOST.SERVICESOBJECTREFCODE = ENSERVICESOBJECT.CODE " +
			"LEFT JOIN TKFINWORKTYPE ON TKCLASSIFICATIONTYPE.FINWORKTYPECODE = TKFINWORKTYPE.CODE " +
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
				anObject = new ENServicesCostShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.dateGen = set.getDate(2);
				anObject.calculationCost = set.getBigDecimal(3);
				if(anObject.calculationCost != null) {
					anObject.calculationCost = anObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costWithoutVAT = set.getBigDecimal(4);
				if(anObject.costWithoutVAT != null) {
					anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costVAT = set.getBigDecimal(5);
				if(anObject.costVAT != null) {
					anObject.costVAT = anObject.costVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costWithVAT = set.getBigDecimal(6);
				if(anObject.costWithVAT != null) {
					anObject.costWithVAT = anObject.costWithVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.tkCalcCostRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.tkCalcCostRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefContractNumber = set.getString(9);
				anObject.servicesObjectRefContractDate = set.getDate(10);
				anObject.servicesObjectRefName = set.getString(11);
				anObject.servicesObjectRefPartnerCode = set.getString(12);
				anObject.servicesObjectRefFinDocCode = set.getString(13);
				anObject.servicesObjectRefFinDocID = set.getInt(14);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCommentGen = set.getString(15);
				anObject.servicesObjectRefContractNumberServices = set.getString(16);
				anObject.servicesObjectRefContractDateServices = set.getDate(17);
				anObject.servicesObjectRefContragentName = set.getString(18);
				anObject.servicesObjectRefContragentAddress = set.getString(19);
				anObject.servicesObjectRefContragentAddressWork = set.getString(20);
				anObject.servicesObjectRefContragentOkpo = set.getString(21);
				anObject.servicesObjectRefContragentBankAccount = set.getString(22);
				anObject.servicesObjectRefContragentBankName = set.getString(23);
				anObject.servicesObjectRefContragentBankMfo = set.getString(24);
				anObject.servicesObjectRefContragentBossName = set.getString(25);
				anObject.servicesObjectRefContragentPassport = set.getString(26);
				anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(27);
				if(anObject.servicesObjectRefContractServicesSumma != null) {
					anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesSummaVAT = set.getBigDecimal(28);
				if(anObject.servicesObjectRefContractServicesSummaVAT != null) {
					anObject.servicesObjectRefContractServicesSummaVAT = anObject.servicesObjectRefContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(29);
				if(anObject.servicesObjectRefContractServicesPower != null) {
					anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCommentServicesGen = set.getString(30);
				anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(31);
				if(anObject.servicesObjectRefContractServicesDistance != null) {
					anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(32);
				if(anObject.servicesObjectRefContractServicesDay != null) {
					anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefUserGen = set.getString(33);
				anObject.servicesObjectRefDateEdit = set.getDate(34);
				anObject.servicesObjectRefWarrantDate = set.getDate(35);
				anObject.servicesObjectRefWarrantNumber = set.getString(36);
				anObject.servicesObjectRefWarrantFIO = set.getString(37);
				anObject.servicesObjectRefRegionalType = set.getInt(38);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBasisType = set.getBigDecimal(39);
				if(anObject.servicesObjectRefBasisType != null) {
					anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContragentPosition = set.getString(40);
				anObject.servicesObjectRefExecuteWorkDate = set.getDate(41);
				anObject.servicesObjectRefTimeStart = set.getTimestamp(42);
				anObject.servicesObjectRefTimeFinal = set.getTimestamp(43);
				anObject.servicesObjectRefContragentPhoneNumber = set.getString(44);
				anObject.servicesObjectRefExecutorPhoneNumber = set.getString(45);
				anObject.servicesObjectRefContragentObjectWork = set.getString(46);
				anObject.servicesObjectRefIsNoPay = set.getInt(47);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefIsCustomerMaterials = set.getInt(48);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDate = set.getDate(49);
				anObject.servicesObjectRefFinPayFormCode = set.getInt(50);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFinPayFormName = set.getString(51);
				anObject.servicesObjectRefPartnerId = set.getInt(52);
				if(set.wasNull()) {
					anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDetail = set.getString(53);
				anObject.servicesObjectRefActTransferNumber = set.getString(54);
				anObject.servicesObjectRefActTransferDate = set.getDate(55);
				anObject.servicesObjectRefResposible = set.getString(56);
				anObject.servicesObjectRefResposiblePosition = set.getString(57);
				anObject.servicesObjectRefResposibleTabNumber = set.getString(58);
				anObject.servicesObjectRefPrevContractStatus = set.getInt(59);
				if(set.wasNull()) {
					anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefReconnectionTU = set.getInt(60);
				if(set.wasNull()) {
					anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountCode = set.getInt(61);
				if(set.wasNull()) {
					anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountNumber = set.getString(62);
				anObject.servicesObjectRefTabNumber = set.getString(63);
				anObject.servicesObjectRefCitiesList = set.getString(64);
				anObject.servicesObjectRefLineLength = set.getBigDecimal(65);
				if(anObject.servicesObjectRefLineLength != null) {
					anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefProjectCode = set.getString(66);
				anObject.servicesObjectRefCnPackCode = set.getInt(67);
				if(set.wasNull()) {
					anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefDfPackCode = set.getInt(68);
				if(set.wasNull()) {
					anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCountersZoneType = set.getInt(69);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefAxPartnerCode = set.getString(70);
				anObject.servicesObjectRefAxPartnerName = set.getString(71);
				anObject.servicesObjectRefAxContractNumber = set.getString(72);
				anObject.servicesObjectRefAxContractDate = set.getDate(73);
				anObject.servicesObjectRefAxContractCode = set.getString(74);
				anObject.servicesObjectRefAxContractId = set.getString(75);
				anObject.servicesObjectRefAxContractCommentGen = set.getString(76);
				anObject.servicesObjectRefProjAgreeSumma = set.getBigDecimal(77);
				if(anObject.servicesObjectRefProjAgreeSumma != null) {
					anObject.servicesObjectRefProjAgreeSumma = anObject.servicesObjectRefProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefTopographySumma = set.getBigDecimal(78);
				if(anObject.servicesObjectRefTopographySumma != null) {
					anObject.servicesObjectRefTopographySumma = anObject.servicesObjectRefTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCreatedFromSite = set.getInt(79);
				if(set.wasNull()) {
					anObject.servicesObjectRefCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefTerm = set.getInt(80);
				if(set.wasNull()) {
					anObject.servicesObjectRefTerm = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefRegulation = set.getInt(81);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBoundaryDateWork = set.getDate(82);
				anObject.servicesObjectRefCountDayDelay = set.getInt(83);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFactDateWork = set.getDate(84);
				
				anObject.tkClassificationTypeRefKod = set.getString(85);
				anObject.tkClassificationTypeRefName = set.getString(86);
				
				anObject.planRefCode = set.getInt(87);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.countGen = set.getBigDecimal(88);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				
				anObject.tkClassificationTypeRefKved = set.getString(89);
				

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
	
	public ENServicesCost getObjectByClassficiationTypeAndServicesElementCode(int elementCode, int tkClassificationTypeCode) throws PersistenceException {
		if(elementCode == Integer.MIN_VALUE || tkClassificationTypeCode == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException("elementCode or tkClassificationTypeCode is null!");
		}
		
		ENServicesCostFilter servicesCostFilter = new ENServicesCostFilter();
		servicesCostFilter.conditionSQL = String.format("%s = ? " +
		" AND %s = ?", ENServicesObject.element_QFielld, TKCalcCost.classificationTypeRef_QFielld);
		
		Vector<Integer> params = new Vector<Integer>();
		params.add(elementCode);
		params.add(tkClassificationTypeCode);
		
		ENServicesCostShortList list = this.getScrollableFilteredList(servicesCostFilter, 0, -1, params);
		
		if(list.totalCount > 0) {
			return this.getObject(list.get(0).code);
		} else {
			return null;
		}
		
	}
	
	public ENServicesCost getObjectByClassficiationTypeAndPlanCode(int planCode, int tkClassificationTypeCode) throws PersistenceException {
		if(planCode == Integer.MIN_VALUE || tkClassificationTypeCode == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException("planCode or tkClassificationTypeCode is null!");
		}
		
		ENServicesCostFilter servicesCostFilter = new ENServicesCostFilter();
		servicesCostFilter.conditionSQL = String.format("%s = ? " +
		" AND %s = ?", ENServicesCost.planRef_QFielld, TKCalcCost.classificationTypeRef_QFielld);
		
		Vector<Integer> params = new Vector<Integer>();
		params.add(planCode);
		params.add(tkClassificationTypeCode);
		
		ENServicesCostShortList list = this.getScrollableFilteredList(servicesCostFilter, 0, -1, params);
		
		if(list.totalCount > 0) {
			return this.getObject(list.get(0).code);
		} else {
			return null;
		}
		
	}
	
	public int[] getCodesbyENServicesObjectRef(ENServicesObjectRef servicesObject) throws PersistenceException {
		if(servicesObject == null || servicesObject.code == Integer.MIN_VALUE) throw new java.lang.NullPointerException();
		ENServicesCostFilter filter = new ENServicesCostFilter();
		filter.servicesObjectRef = servicesObject;
		filter.orderBySQL = String.format("%s DESC", ENServicesCost.dateGen_QFielld);
		return this.getFilteredCodeArray(filter, 0, -1);
	}
	
	public int[] getCodesByENPlanWork(ENPlanWork plan) throws PersistenceException {
		ENPlanWorkRef planRef = new ENPlanWorkRef();
		planRef.code = plan.code;
		return this.getCodesByENPlanWorkRef(planRef);
	}
	public int[] getCodesByENPlanWorkRef(ENPlanWorkRef planRef) throws PersistenceException {
		if(planRef == null || planRef.code == Integer.MIN_VALUE) throw new java.lang.NullPointerException();
		ENServicesCostFilter filter = new ENServicesCostFilter();
		filter.planRef = planRef;
		return this.getFilteredCodeArray(filter, 0, -1);
	}


} // end of ENServicesCostDAO
