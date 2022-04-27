
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENOperativeObjectDAOGen;
import com.ksoe.energynet.valueobject.ENOperativeObject;
import com.ksoe.energynet.valueobject.brief.ENOperativeObjectShort;
import com.ksoe.energynet.valueobject.lists.ENOperativeObjectShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for ENOperativeObject;
  *
  */

public class ENOperativeObjectDAO extends ENOperativeObjectDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENOperativeObjectDAO() {super();}
  //public ENOperativeObjectDAO(Connection aConnection) {super(aConnection);}
  //public ENOperativeObjectDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENOperativeObjectDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENOperativeObjectDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  @Override
public void remove(int uid) throws PersistenceException
  {
	  ENOperativeObject obj = getObject(uid);

	  super.remove(uid);

	  ENElementDAO eDao = new ENElementDAO(super.getConnection(), super.getUserProfile() );
	  eDao.remove(obj.element.code);
  }



	@Override
	public ENOperativeObjectShortList getScrollableFilteredList(ENOperativeObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENOperativeObjectShortList result = new ENOperativeObjectShortList();
		ENOperativeObjectShort anObject;
		result.list = new Vector<ENOperativeObjectShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENOPERATIVEOBJECT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENOPERATIVEOBJECT.CODE"+
			",ENOPERATIVEOBJECT.NAME"+
			",ENOPERATIVEOBJECT.CONTRACTNUMBER"+
			",ENOPERATIVEOBJECT.CONTRACTDATE"+
			",ENOPERATIVEOBJECT.PARTNERCODE"+
			",ENOPERATIVEOBJECT.PARTNERNAME"+
			",ENOPERATIVEOBJECT.FINDOCCODE"+
			",ENOPERATIVEOBJECT.FINDOCID"+
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
			", ENELEMENT.CODE " +
			", ENGENERALCONTRACTS.CODE " +
			", ENGENERALCONTRACTS.FINDOCID " +
			", ENGENERALCONTRACTS.FINDOCCODE " +
			", ENGENERALCONTRACTS.CONTRACTNUMBER " +
			", ENGENERALCONTRACTS.CONTRACTDATE " +
			", ENGENERALCONTRACTS.COMMENTGEN " +
			", ENGENERALCONTRACTS.PARTNERID " +
			", ENGENERALCONTRACTS.PARTNERCODE " +
			", ENGENERALCONTRACTS.PARTNERNAME " +
			", ENGENERALCONTRACTS.CONTRACTREGDATE " +
			", ENGENERALCONTRACTS.CONTRACTSTARTDATE " +
			", ENGENERALCONTRACTS.CONTRACTENDDATE " +
			", ENGENERALCONTRACTS.AXCONTRACTID " +
			", ENGENERALCONTRACTS.AXCONTRACTCODE " +
			", ENGENERALCONTRACTS.AXCONTRACTNUMBER " +
			", ENGENERALCONTRACTS.AXCONTRACTACCOUNT " +
			", ENGENERALCONTRACTS.AXCONTRACTDATE " +
			", ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN " +
			", ENGENERALCONTRACTS.AXCONTRACTGROUPCODE " +
			", ENGENERALCONTRACTS.AXPARTNERCODE " +
			", ENGENERALCONTRACTS.AXPARTNERNAME " +
			", ENGENERALCONTRACTS.USERGEN " +

			" FROM ENOPERATIVEOBJECT left join ENGENERALCONTRACTS on ENGENERALCONTRACTS.CODE = ENOPERATIVEOBJECT.GENERALCONTRACTREFCODE " +
			", ENDEPARTMENT " +
			", ENELEMENT " +
			//", ENGENERALCONTRACTS " +
		"";
		whereStr = " ENDEPARTMENT.CODE = ENOPERATIVEOBJECT.DEPARTMENTCODE" ; //+
		whereStr += " AND ENELEMENT.CODE = ENOPERATIVEOBJECT.ELEMENTCODE" ; //+
		//whereStr += " AND ENGENERALCONTRACTS.CODE = ENOPERATIVEOBJECT.GENERALCONTRACTREFCODE" ; //+


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENOperativeObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENOperativeObject.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENOPERATIVEOBJECT",segregationInfo,getUserProfile().getDomainInfo());
		if (domainWhereStr.length() != 0){
			if (whereStr.length() == 0) {
				whereStr = domainWhereStr;
			} else {
				whereStr = " "+whereStr + " AND " +domainWhereStr;
			}
		}

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
				anObject = new ENOperativeObjectShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.name = set.getString(2);
				anObject.contractNumber = set.getString(3);
				anObject.contractDate = set.getDate(4);
				anObject.partnerCode = set.getString(5);
				anObject.partnerName = set.getString(6);
				anObject.finDocCode = set.getString(7);
				anObject.finDocID = set.getInt(8);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}

				anObject.departmentCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.departmentCode = Integer.MIN_VALUE;
				}
				anObject.departmentShortName = set.getString(10);
				anObject.departmentDateStart = set.getDate(11);
				anObject.departmentDateFinal = set.getDate(12);
				anObject.departmentRenCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.departmentRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentShpzBalans = set.getString(14);
				anObject.departmentKau_table_id_1884 = set.getInt(15);
				if(set.wasNull()) {
					anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentKau_1884 = set.getString(16);
				anObject.departmentName_1884 = set.getString(17);
				anObject.departmentHrmorganizationid = set.getString(18);
				anObject.elementCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefCode = set.getInt(20);
				if(set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocID = set.getInt(21);
				if(set.wasNull()) {
					anObject.generalContractRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocCode = set.getString(22);
				anObject.generalContractRefContractNumber = set.getString(23);
				anObject.generalContractRefContractDate = set.getDate(24);
				anObject.generalContractRefCommentGen = set.getString(25);
				anObject.generalContractRefPartnerId = set.getInt(26);
				if(set.wasNull()) {
					anObject.generalContractRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.generalContractRefPartnerCode = set.getString(27);
				anObject.generalContractRefPartnerName = set.getString(28);
				anObject.generalContractRefContractRegDate = set.getDate(29);
				anObject.generalContractRefContractStartDate = set.getDate(30);
				anObject.generalContractRefContractEndDate = set.getDate(31);
				anObject.generalContractRefAxContractId = set.getString(32);
				anObject.generalContractRefAxContractCode = set.getString(33);
				anObject.generalContractRefAxContractNumber = set.getString(34);
				anObject.generalContractRefAxContractAccount = set.getString(35);
				anObject.generalContractRefAxContractDate = set.getDate(36);
				anObject.generalContractRefAxContractCommentGen = set.getString(37);
				anObject.generalContractRefAxContractGroupCode = set.getString(38);
				anObject.generalContractRefAxPartnerCode = set.getString(39);
				anObject.generalContractRefAxPartnerName = set.getString(40);
				anObject.generalContractRefUserGen = set.getString(41);

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


} // end of ENOperativeObjectDAO

