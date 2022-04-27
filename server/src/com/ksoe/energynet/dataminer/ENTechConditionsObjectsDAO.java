
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
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENTechConditionsObjectsDAOGen;
import com.ksoe.energynet.valueobject.ENConnectionKind;
import com.ksoe.energynet.valueobject.ENSOValuesType;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesObjectStatus;
import com.ksoe.energynet.valueobject.ENTechConditionsObjects;
import com.ksoe.energynet.valueobject.brief.ENTechConditionsObjectsShort;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsObjectsFilter;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsObjectsShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;
/**
 * DAO Object for ENTechConditionsObjects;
 *
 */

public class ENTechConditionsObjectsDAO extends ENTechConditionsObjectsDAOGen {

    public ENTechConditionsObjectsDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTechConditionsObjectsDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }




	@Override
	public void save(ENTechConditionsObjects techConditionsObjects) throws PersistenceException {

		ENTechConditionsObjects oldTechConditionsObjects = getObjectNoSegr(techConditionsObjects.code);

		if (oldTechConditionsObjects.identNumber != Integer.MIN_VALUE) {

			if (oldTechConditionsObjects.dateGen != null && techConditionsObjects.dateGen != null) {
				if (!oldTechConditionsObjects.dateGen.equals(techConditionsObjects.dateGen)) {

					throw new SystemException("\n\n"
							+ "Після присвоєння ідентифікатора дата \"Технічних умов\" не змінюється!");
				}
			}

			if (oldTechConditionsObjects.dateGen != null && techConditionsObjects.dateGen == null) {
				throw new SystemException("\n\n"
						+ "Після присвоєння ідентифікатора дата \"Технічних умов\" не змінюється!");
			}

		}


		save(techConditionsObjects, null);
	}



    public ENTechConditionsObjects getObjectNoRef(int uid) throws PersistenceException {

        boolean noSegregation = true;
        boolean noReferences = true;

        ENTechConditionsObjects result = new ENTechConditionsObjects();
        result.code = uid;
        loadObject(result, noSegregation, noReferences);
        if (result.code == Integer.MIN_VALUE)
            return null;
        return result;
    }

    public ENTechConditionsObjects getObjectNoSegr(int uid) throws PersistenceException {

        boolean noSegregation = true;

        ENTechConditionsObjects result = new ENTechConditionsObjects();
        result.code = uid;
        loadObject(result, noSegregation);
        if (result.code == Integer.MIN_VALUE)
            return null;
        return result;
    }

    @Override
	public ENTechConditionsObjectsShortList getScrollableFilteredList(ENTechConditionsObjects aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENTechConditionsObjectsShortList result = new ENTechConditionsObjectsShortList();
		ENTechConditionsObjectsShort anObject;
		result.list = new Vector<>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTECHCONDITIONSOBJCTS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENTECHCONDITIONSOBJCTS.CODE"+
			",ENTECHCONDITIONSOBJCTS.NUMBERGEN"+
			",ENTECHCONDITIONSOBJCTS.DATEGEN"+
			",ENTECHCONDITIONSOBJCTS.CUSTOMER"+
			",ENTECHCONDITIONSOBJCTS.BUILDING"+
			",ENTECHCONDITIONSOBJCTS.ADDRESS"+
			",ENTECHCONDITIONSOBJCTS.TYCURRENTPOWER"+
			",ENTECHCONDITIONSOBJCTS.TYSERVICESPOWER"+
			",ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACES"+
			",ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACSNM"+
			",ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINT"+
			",ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINTNM"+
			",ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCE"+
			",ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCENUM"+
			",ENTECHCONDITIONSOBJCTS.CAT1CURRENTPOWER"+
			",ENTECHCONDITIONSOBJCTS.CAT2CURRENTPOWER"+
			",ENTECHCONDITIONSOBJCTS.CAT3CURRENTPOWER"+
			",ENTECHCONDITIONSOBJCTS.CAT1SERVICESPOWER"+
			",ENTECHCONDITIONSOBJCTS.CAT2SERVICESPOWER"+
			",ENTECHCONDITIONSOBJCTS.CAT3SERVICESPOWER"+
			",ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERWTRHTNG"+
			",ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERHEATING"+
			",ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERCOOKER"+
			",ENTECHCONDITIONSOBJCTS.POWERGENERATION"+
			",ENTECHCONDITIONSOBJCTS.USERGEN"+
			",ENTECHCONDITIONSOBJCTS.DATEEDIT"+
			", ENELEMENT.CODE " +
			", ENDEPARTMENT.CODE " +
			", ENDEPARTMENT.SHORTNAME " +
			", ENDEPARTMENT.DATESTART " +
			", ENDEPARTMENT.DATEFINAL " +
			", ENDEPARTMENT.RENCODE " +
			", ENDEPARTMENT.SHPZBALANS " +
			", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
			", ENDEPARTMENT.KAU_1884 " +
			", ENDEPARTMENT.NAME_1884 " +
			", ENDEPARTMENT.HRMORGANIZATIONID " +
			", ENTECHCONDITIONSOBJCTS.CATEGORYREFCODE " +
			  ", (SELECT ENPOWERRELIABILITYCTGR.NAME FROM ENPOWERRELIABILITYCTGR " +
			  "    WHERE ENPOWERRELIABILITYCTGR.CODE = ENTECHCONDITIONSOBJCTS.CATEGORYREFCODE " +
			  "  ) AS CATEGORYREFNAME " +
			", ENTECHCONDITIONSOBJCTS.POWERPOINTREFCODE " +
			  ", (SELECT ENCONNECTIONPOWERPOINT.NAME FROM ENCONNECTIONPOWERPOINT " +
			  "    WHERE ENCONNECTIONPOWERPOINT.CODE = ENTECHCONDITIONSOBJCTS.POWERPOINTREFCODE " +
			  "  ) AS POWERPOINTREFNAME " +
				",ENTECHCONDITIONSOBJCTS.IDENTNUMBER"+
				",ENTECHCONDITIONSOBJCTS.DATECHANGETU"+
		" FROM ENTECHCONDITIONSOBJCTS " +
			", ENELEMENT " +
			", ENDEPARTMENT " +
		"";
		whereStr = " ENELEMENT.CODE = ENTECHCONDITIONSOBJCTS.ELEMENTCODE" ; //+
		whereStr += " AND ENDEPARTMENT.CODE = ENTECHCONDITIONSOBJCTS.DEPARTMENTCODE" ; //+


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsObjects.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENTechConditionsObjects.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENTECHCONDITIONSOBJCTS",segregationInfo,getUserProfile().getDomainInfo());
		if (domainWhereStr.length() != 0){
			if (whereStr.length() == 0) {
				whereStr = domainWhereStr;
			} else {
				whereStr = " "+whereStr + " AND " +domainWhereStr;
			}
		}

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
				anObject = new ENTechConditionsObjectsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberGen = set.getString(2);
				anObject.dateGen = set.getDate(3);
				anObject.customer = set.getString(4);
				anObject.building = set.getString(5);
				anObject.address = set.getString(6);
				anObject.tyCurrentPower = set.getBigDecimal(7);
				if(anObject.tyCurrentPower != null) {
					anObject.tyCurrentPower = anObject.tyCurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPower = set.getBigDecimal(8);
				if(anObject.tyServicesPower != null) {
					anObject.tyServicesPower = anObject.tyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.connectionPowerPlaces = set.getString(9);
				anObject.connectionPowerPlacesNum = set.getString(10);
				anObject.connectionPowerPoint = set.getString(11);
				anObject.connectionPowerPointNum = set.getString(12);
				anObject.connectionSource = set.getString(13);
				anObject.connectionSourceNum = set.getString(14);
				anObject.cat1CurrentPower = set.getBigDecimal(15);
				if(anObject.cat1CurrentPower != null) {
					anObject.cat1CurrentPower = anObject.cat1CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat2CurrentPower = set.getBigDecimal(16);
				if(anObject.cat2CurrentPower != null) {
					anObject.cat2CurrentPower = anObject.cat2CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat3CurrentPower = set.getBigDecimal(17);
				if(anObject.cat3CurrentPower != null) {
					anObject.cat3CurrentPower = anObject.cat3CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat1ServicesPower = set.getBigDecimal(18);
				if(anObject.cat1ServicesPower != null) {
					anObject.cat1ServicesPower = anObject.cat1ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat2ServicesPower = set.getBigDecimal(19);
				if(anObject.cat2ServicesPower != null) {
					anObject.cat2ServicesPower = anObject.cat2ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat3ServicesPower = set.getBigDecimal(20);
				if(anObject.cat3ServicesPower != null) {
					anObject.cat3ServicesPower = anObject.cat3ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPowerWaterHeating = set.getBigDecimal(21);
				if(anObject.tyServicesPowerWaterHeating != null) {
					anObject.tyServicesPowerWaterHeating = anObject.tyServicesPowerWaterHeating.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPowerHeating = set.getBigDecimal(22);
				if(anObject.tyServicesPowerHeating != null) {
					anObject.tyServicesPowerHeating = anObject.tyServicesPowerHeating.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPowerCooker = set.getBigDecimal(23);
				if(anObject.tyServicesPowerCooker != null) {
					anObject.tyServicesPowerCooker = anObject.tyServicesPowerCooker.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.powerGeneration = set.getBigDecimal(24);
				if(anObject.powerGeneration != null) {
					anObject.powerGeneration = anObject.powerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.userGen = set.getString(25);
				anObject.dateEdit = set.getDate(26);

				anObject.elementCode = set.getInt(27);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}
				anObject.departmentCode = set.getInt(28);
				if(set.wasNull()) {
					anObject.departmentCode = Integer.MIN_VALUE;
				}
				anObject.departmentShortName = set.getString(29);
				anObject.departmentDateStart = set.getDate(30);
				anObject.departmentDateFinal = set.getDate(31);
				anObject.departmentRenCode = set.getInt(32);
				if(set.wasNull()) {
					anObject.departmentRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentShpzBalans = set.getString(33);
				anObject.departmentKau_table_id_1884 = set.getInt(34);
				if(set.wasNull()) {
					anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentKau_1884 = set.getString(35);
				anObject.departmentName_1884 = set.getString(36);
				anObject.departmentHrmorganizationid = set.getString(37);
				anObject.categoryRefCode = set.getInt(38);
				if(set.wasNull()) {
					anObject.categoryRefCode = Integer.MIN_VALUE;
				}
				anObject.categoryRefName = set.getString(39);
				anObject.powerPointRefCode = set.getInt(40);
				if(set.wasNull()) {
					anObject.powerPointRefCode = Integer.MIN_VALUE;
				}
				anObject.powerPointRefName = set.getString(41);

				anObject.identNumber = set.getInt(42);
				if ( set.wasNull() ) {
					anObject.identNumber = Integer.MIN_VALUE;
				}
				anObject.dateChangeTU = set.getDate(43);

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

	public class TechCondLock{
		public int isLock=Integer.MIN_VALUE;
	}

	public int getFreeIdentNumber() throws PersistenceException {

		synchronized (TechCondLock.class) {
			int result = Integer.MIN_VALUE;

			String selectStr;
			Connection connection = getConnection();
			PreparedStatement statement = null;
			ResultSet set = null;


			selectStr = "select min(q.freeid) as freeid\n" +
					"from \n" +
					"(SELECT id+1 as freeid\n" +
					"FROM(\n" +
					"  SELECT id, LEAD(id)OVER(ORDER BY Id)as next_id\n" +
					"  FROM (\n" +
					"    SELECT 0 Id\n" +
					"    UNION ALL\n" +
					"  SELECT identnumber as id\n" +
					"  FROM entechconditionsobjcts\n" +
					"  )T\n" +
					")T\n" +
					"WHERE id+1 <> next_id\n" +
					"union all\n" +
					"select max(coalesce(identnumber,0))+1 as freeid from entechconditionsobjcts) as q ";


			try {
				statement = connection.prepareStatement(selectStr);

				set = statement.executeQuery();
				int i;
				for (i = 0; set.next(); i++) {
					result = set.getInt(1);
					if (set.wasNull()) {
						result = Integer.MIN_VALUE;
					}

				}
				return result;

			} catch (SQLException e) {
				System.out.println(e.getMessage() + "\n statement - " + selectStr);
				throw new SystemException(e.getMessage(), e);
			} finally {
				try {
					if (set != null) set.close();
				} catch (SQLException e) {
				}
				try {
					if (statement != null) statement.close();
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
	}




    /**
     * Получить список Тех.Условий для сайта
     *
     * @param ENTechConditionsObjectsFilter
     * @return ENTechConditionsObjectsShortList
     */
	public ENTechConditionsObjectsShortList getPublicListTechConditions(ENTechConditionsObjectsFilter filterObject) {

		ENTechConditionsObjectsShortList result = new ENTechConditionsObjectsShortList();
		ENTechConditionsObjectsShort anObject;
		result.list = new Vector<>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition((filterObject == null) ? (null) : (filterObject.conditionSQL));
		String orderBy = processCondition((filterObject == null) ? (null) : (filterObject.orderBySQL));

		if(orderBy.length() == 0) {
			orderBy = " 2 desc ";
		}

		selectStr = " select * from ( "
				+ " select entechconditionsobjcts.numbergen as ty_number "
				+ " , entechconditionsobjcts.dategen as ty_date "
				+ " , case when sv2.dateval > to_date('01.06.2021','dd.MM.yyyy') then '' else enservicesobject.contractnumberservices end as contractnumberservices "
				+ " , case when sv2.dateval > to_date('01.06.2021','dd.MM.yyyy') then null else enservicesobject.contractdateservices end as contractdateservices "
				+ " , entechconditionsservcs.tyservicespower "
				+ " , coalesce(( select coalesce( ci.name, 'не визначено' ) from enconnectioninstlltntp ci where ci.code = tp.installationtyperefcod ), 'не визначено' ) as installationtype "
				+ " , entechconditionsobjcts.yeargen as year_introduction "
				+ " , coalesce(regexp_replace(entechconditionsobjcts.connectionpowerplaces, '\\s+$', ''), '---') as connectionpowerplaces "
				+ " , entechconditionsobjcts.voltageservices "
				+ " , ( select ck.name from enconnectionkind ck where ck.code = entechconditionsservcs.connectionkindrefcode ) as connectionkind "
				+ " , ( select dp.name from endepartment dp where dp.code = entechconditionsobjcts.departmentcode ) as department "
				+ " , ( select min(pm.dategen) from enpayment2so pm where pm.servicesobjectrefcode = enservicesobject.code ) as pay_date "
				+ " , sv.dateval as date_connection "

				+ " from entechconditionsservcs, entechconditionsobjcts, encontragent, enservicesobject "
				+ "  left join ensotechparams tp on tp.servicesobjectcode = enservicesobject.code "
		        + "  left join ensovalues sv on sv.servicesobjectcode = enservicesobject.code and sv.sovaluestypecode = " + ENSOValuesType.CONNECTION_DATE
                + "  left join ensovalues sv2 on sv2.servicesobjectcode = enservicesobject.code and sv2.sovaluestypecode = " + ENSOValuesType.CONTRACT_REGISTRATION_DATE;

		whereStr = " enservicesobject.techconobjectscode = entechconditionsobjcts.code ";
		whereStr += " and entechconditionsobjcts.code = encontragent.techconobjectscode ";
		whereStr += " and entechconditionsservcs.code = encontragent.techcondservicesrefcod ";
		whereStr += " and encontragent.techconobjectscode = entechconditionsobjcts.code ";
		// whereStr += " and enservicesobject.code in ( 1017195049, 1017166707, 1017193373, 1017152630 ) ";
		whereStr += " and entechconditionsservcs.connectionkindrefcode in ( " + ENConnectionKind.STANDART + ", " + ENConnectionKind.NO_STANDART + ", " + ENConnectionKind.READY_MADE + ") ";
		whereStr += " and enservicesobject.contractstatusrefcode in ( " + ENServicesContractStatus.SIGNED + ", " +  ENServicesContractStatus.PAID + ", " + ENServicesContractStatus.PREPAID + ") ";
		whereStr += " and enservicesobject.statusrefcode = " + ENServicesObjectStatus.GOOD;


		whereStr = BaseDAOUtils.addToCondition(buildCondition(filterObject), whereStr);
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);

		if (whereStr.length() != 0) {
			selectStr += " WHERE " + whereStr;
		}

		selectStr = selectStr + " ) w where ty_date < to_date(to_char(CURRENT_DATE,'01.MM.yyyy'),'dd.MM.yyyy') and date_connection is null ORDER BY " + orderBy;

		System.out.println("######################## getPublicListTechConditions.... sql = " + selectStr);

		int number = 0;
		try {

			statement = connection.prepareStatement(selectStr);
			number = setParameters(filterObject, statement);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {

				anObject = new ENTechConditionsObjectsShort();

				anObject.numberGen = set.getString(1);
				anObject.dateGen = set.getDate(2);
				anObject.contractNumberServices = set.getString(3);
				anObject.contractDateServices = set.getDate(4);
				anObject.tyServicesPower = set.getBigDecimal(5);
				anObject.installationType = set.getString(6);

				anObject.yearGen = set.getInt(7);
				if (set.wasNull()) {
					anObject.yearGen = Integer.MIN_VALUE;
				}

				anObject.connectionPowerPlaces = set.getString(8);
				anObject.tyCurrentPower = set.getBigDecimal(9);
				anObject.connectionKind = set.getString(10);
				anObject.departmentShortName = set.getString(11);
				anObject.servicesPayDate = set.getDate(12);


				result.list.add(anObject);
			}


			result.setTotalCount(i);

			return result;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
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



} // end of ENTechConditionsObjectsDAO
