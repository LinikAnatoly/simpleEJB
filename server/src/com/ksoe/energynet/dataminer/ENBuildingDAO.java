
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENBuildingDAOGen;
import com.ksoe.energynet.valueobject.ENBuilding;
import com.ksoe.energynet.valueobject.brief.ENBuildingShort;
import com.ksoe.energynet.valueobject.lists.ENBuildingShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
/**
 * DAO Object for ENBuilding;
 *
 */

public class ENBuildingDAO extends ENBuildingDAOGen {

    public ENBuildingDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENBuildingDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public ENBuilding getObjectNoRef(int uid) throws PersistenceException {

        boolean noSegregation = true;
        boolean noReferences = true;

        ENBuilding result = new ENBuilding();
        result.code = uid;
        loadObject(result, noSegregation, noReferences);
        if (result.code == Integer.MIN_VALUE)
            return null;
        return result;
    }

    public ENBuilding getObjectNoSegr(int uid) throws PersistenceException {

        boolean noSegregation = true;

        ENBuilding result = new ENBuilding();
        result.code = uid;
        loadObject(result, noSegregation);
        if (result.code == Integer.MIN_VALUE)
            return null;
        return result;
    }
    
    public ENBuilding getObject(int uid) throws PersistenceException {

        boolean noSegregation = true;

        ENBuilding result = new ENBuilding();
        result.code = uid;
        loadObject(result, noSegregation);
        if (result.code == Integer.MIN_VALUE)
            return null;	
        return result;
    }
    
    
    public void updateSumGenAndNDS(ENBuilding anObject) throws PersistenceException
    {
    	Connection connection = getConnection();

  		String updRm =
  	        "UPDATE ENBuilding SET summagen = ? , summands = ? " +  
  	        " WHERE CODE = ? ";

  		PreparedStatement statement = null;

  		try
  		{
  			statement = connection.prepareStatement(updRm);

  		    if (anObject.summaGen == null)
  		        statement.setBigDecimal(1,null);
  		    else
  		        statement.setBigDecimal(1,anObject.summaGen);

  		    if (anObject.summaNDS == null)
  		        statement.setBigDecimal(2,null);
  		    else
  		        statement.setBigDecimal(2,anObject.summaNDS);

  		    statement.setInt(3,anObject.code);

  		    statement.execute();
  		}
  	  	catch(SQLException e)
  	  	{
  	  	  System.out.println(e.getMessage()+"\nstatement - " + updRm + "\n rmCode = " + anObject.code);
  	  	  EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
  	  	}
  	    finally
  	    {
  	     try {if (statement != null) statement.close();} catch (SQLException e) {}
  	     statement = null;
  	    }
    }
    
    
    public void setContractpriceAsSummaGen(ENBuilding anObject) throws PersistenceException
    {
    	Connection connection = getConnection();

  		String updRm =
  	        "UPDATE ENBuilding SET contractprice = summagen " +  
  	        " WHERE CODE = ? ";

  		PreparedStatement statement = null;

  		try
  		{
  			statement = connection.prepareStatement(updRm);

  		    statement.setInt(1,anObject.code);

  		    statement.execute();
  		}
  	  	catch(SQLException e)
  	  	{
  	  	  System.out.println(e.getMessage()+"\nstatement - " + updRm + "\n rmCode = " + anObject.code);
  	  	  EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
  	  	}
  	    finally
  	    {
  	     try {if (statement != null) statement.close();} catch (SQLException e) {}
  	     statement = null;
  	    }
    }
    
    
    public ENBuildingShortList getScrollableFilteredList(ENBuilding aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENBuildingShortList result = new ENBuildingShortList();
		ENBuildingShort anObject;
		result.list = new Vector<ENBuildingShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUILDING.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENBUILDING.CODE"+
			",ENBUILDING.NUMBERGEN"+
			",ENBUILDING.DATEGEN"+
			",ENBUILDING.DATEEDIT"+
			",ENBUILDING.SUMMAGEN"+
			",ENBUILDING.SUMMANDS"+
			",ENBUILDING.CHARACTERISTIC"+
			",ENBUILDING.EXECUTEDPOSITION"+
			",ENBUILDING.EXECUTEDNAME"+
			",ENBUILDING.ACCEPTEDPOSITION"+
			",ENBUILDING.ACCEPTEDNAME"+
			",ENBUILDING.CONTRACTPRICE"+
			",ENBUILDING.CODEMOL"+
			",ENBUILDING.CODEPODR"+
			",ENBUILDING.INVNUMBEROZ"+
			",ENBUILDING.NAMEOZ"+
			",ENBUILDING.FINCONTRACTNUMBER"+
			",ENBUILDING.FINCONTRACTDATE"+
			",ENBUILDING.PARTNERNAME"+
			",ENBUILDING.PARTNERCODE"+
			",ENBUILDING.ISINVESTPROGRAM"+
			",ENBUILDING.YEARINVESTPROGRAM"+
			",ENBUILDING.ITEMINVESTPROGRAM"+
			",ENBUILDING.BUILDINGADDRESS"+
			",ENBUILDING.DECREENUMBER"+
			",ENBUILDING.DECREEDATE"+
			",ENBUILDING.EXPLOITATIONTERM"+
			",ENBUILDING.DATELOADEXPL"+
			",ENBUILDING.DATEBUILD"+
			",ENBUILDING.USERGEN"+
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
			", ENBUILDINGSTATUS.CODE " +
			", ENBUILDINGSTATUS.NAME " +
			", ENINVESTPROGRAMGROUPS.CODE " +
			", ENINVESTPROGRAMGROUPS.NAME " +
			", ENINVESTPROGRAMGROUPS.COMMENTGEN " +
			", ENELEMENT.CODE " +
		" FROM ENBUILDING " +
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENBUILDING.DEPARTMENTREFCODE "+
			" LEFT JOIN ENBUILDINGSTATUS on ENBUILDINGSTATUS.CODE = ENBUILDING.STATUSREFCODE "+
			" LEFT JOIN ENINVESTPROGRAMGROUPS on ENINVESTPROGRAMGROUPS.CODE = ENBUILDING.INVGROUPREFCODE "+
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENBUILDING.ELEMENTREFCODE "+
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilding.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENBuilding.getList%} access denied");
		}
		/*String domainWhereStr = SegregationQueryBuilder.addWhere("ENBUILDING",segregationInfo,getUserProfile().getDomainInfo());
		if (domainWhereStr.length() != 0){
			if (whereStr.length() == 0) {
				whereStr = domainWhereStr;
			} else {
				whereStr = " "+whereStr + " AND " +domainWhereStr;
			}
		}*/

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
				anObject = new ENBuildingShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numbergen = set.getString(2);
				anObject.dateGen = set.getDate(3);
				anObject.dateEdit = set.getDate(4);
				anObject.summaGen = set.getBigDecimal(5);
				if(anObject.summaGen != null) {
					anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.summaNDS = set.getBigDecimal(6);
				if(anObject.summaNDS != null) {
					anObject.summaNDS = anObject.summaNDS.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.characteristic = set.getString(7);
				anObject.executedPosition = set.getString(8);
				anObject.executedName = set.getString(9);
				anObject.acceptedPosition = set.getString(10);
				anObject.acceptedName = set.getString(11);
				anObject.contractPrice = set.getBigDecimal(12);
				if(anObject.contractPrice != null) {
					anObject.contractPrice = anObject.contractPrice.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.codeMol = set.getString(13);
				anObject.codePodr = set.getString(14);
				anObject.invNumberOZ = set.getString(15);
				anObject.nameOZ = set.getString(16);
				anObject.finContractNumber = set.getString(17);
				anObject.finContractDate = set.getDate(18);
				anObject.partnerName = set.getString(19);
				anObject.partnerCode = set.getString(20);
				anObject.isInvestProgram = set.getInt(21);
				if ( set.wasNull() ) {
					anObject.isInvestProgram = Integer.MIN_VALUE;
				}
				anObject.yearInvestProgram = set.getString(22);
				anObject.itemInvestProgram = set.getString(23);
				anObject.buildingAddress = set.getString(24);
				anObject.decreeNumber = set.getString(25);
				anObject.decreeDate = set.getDate(26);
				anObject.exploitationTerm = set.getInt(27);
				if ( set.wasNull() ) {
					anObject.exploitationTerm = Integer.MIN_VALUE;
				}
				anObject.dateLoadExpl = set.getDate(28);
				anObject.dateBuild = set.getDate(29);
				anObject.userGen = set.getString(30);

				anObject.departmentRefCode = set.getInt(31);
				if(set.wasNull()) {
					anObject.departmentRefCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShortName = set.getString(32);
				anObject.departmentRefDateStart = set.getDate(33);
				anObject.departmentRefDateFinal = set.getDate(34);
				anObject.departmentRefRenCode = set.getInt(35);
				if(set.wasNull()) {
					anObject.departmentRefRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShpzBalans = set.getString(36);
				anObject.departmentRefKau_table_id_1884 = set.getInt(37);
				if(set.wasNull()) {
					anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentRefKau_1884 = set.getString(38);
				anObject.departmentRefName_1884 = set.getString(39);
				anObject.departmentRefHrmorganizationid = set.getString(40);
				anObject.statusRefCode = set.getInt(41);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(42);
				anObject.invgroupRefCode = set.getInt(43);
				if(set.wasNull()) {
					anObject.invgroupRefCode = Integer.MIN_VALUE;
				}
				anObject.invgroupRefName = set.getString(44);
				anObject.invgroupRefCommentgen = set.getString(45);
				anObject.elementRefCode = set.getInt(46);
				if(set.wasNull()) {
					anObject.elementRefCode = Integer.MIN_VALUE;
				}

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

} // end of ENBuildingDAO
