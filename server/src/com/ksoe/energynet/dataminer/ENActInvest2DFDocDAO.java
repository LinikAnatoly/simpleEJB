
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.dataminer.DFDocDAO;
import com.ksoe.docflow.valueobject.DFDocType;
import com.ksoe.docflow.valueobject.filter.DFDocFilter;
import com.ksoe.docflow.valueobject.lists.DFDocShortList;
import com.ksoe.energynet.dataminer.generated.ENActInvest2DFDocDAOGen;
import com.ksoe.energynet.valueobject.ENActInvest2DFDoc;
import com.ksoe.energynet.valueobject.brief.ENActInvest2DFDocShort;
import com.ksoe.energynet.valueobject.lists.ENActInvest2DFDocShortList;

/**
 * DAO Object for ENActInvest2DFDoc;
 *
 */

public class ENActInvest2DFDocDAO extends ENActInvest2DFDocDAOGen {

    public ENActInvest2DFDocDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENActInvest2DFDocDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    
    public ENActInvest2DFDocShortList getScrollableFilteredList(ENActInvest2DFDoc aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENActInvest2DFDocShortList result = new ENActInvest2DFDocShortList();
		ENActInvest2DFDocShort anObject;
		result.list = new Vector<ENActInvest2DFDocShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTINVEST2DFDOC.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACTINVEST2DFDOC.CODE"+
			",ENACTINVEST2DFDOC.DFDOCCODE"+
			",ENACTINVEST2DFDOC.DFDOCTYPECODE"+
			",case when coalesce(NECESSARY,0) = 0 then 'Непотрібно' else ENACTINVEST2DFDOC.DFDOCNUMBER end as DFDOCNUMBER "+
			",ENACTINVEST2DFDOC.DFDOCDATE"+
			",ENACTINVEST2DFDOC.DFDOCDESCRIPTION"+
			",ENACTINVEST2DFDOC.COMMENTGEN"+
			",ENACTINVEST2DFDOC.NECESSARY"+
			",ENACTINVEST2DFDOC.USERADD"+
			",ENACTINVEST2DFDOC.DATEADD"+
			",ENACTINVEST2DFDOC.USERGEN"+
			",ENACTINVEST2DFDOC.DATEEDIT"+
			", ENACT.CODE " +
			", ENACT.NUMBERGEN " +
			", ENACT.DATEGEN " +
			", ENACT.FINMOLCODE " +
			", ENACT.FINMOLNAME " +
			", ENACT.FINMECHANICNAME " +
			", ENACT.INVNUMBER " +
			", ENACT.USERGEN " +
			", ENACT.DATEEDIT " +
			", ENACT.DATEACT " +
			", ENACT.MOLCODEOBJECT " +
			", ENACT.CHECKEDBYACCOUNTANT " +
			", ENACTINVESTTYPE2DFDOC.CODE " +
			", ENACTINVESTTYPE2DFDOC.NAME " +
		" FROM ENACTINVEST2DFDOC " +
			" LEFT JOIN ENACT on ENACT.CODE = ENACTINVEST2DFDOC.ACTREFCODE "+
			" LEFT JOIN ENACTINVESTTYPE2DFDOC on ENACTINVESTTYPE2DFDOC.CODE = ENACTINVEST2DFDOC.TYPEREFCODE "+
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
		
		Connection dfConnection = null;
		
		try {
			statement = connection.prepareStatement(selectStr);
			number = setParameters(aFilterObject, statement);
			
			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);
			}

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENActInvest2DFDocShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.dfDocCode = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.dfDocCode = Integer.MIN_VALUE;
				}
				anObject.dfDocTypeCode = set.getInt(3);
				if ( set.wasNull() ) {
					anObject.dfDocTypeCode = Integer.MIN_VALUE;
				}
				anObject.dfDocNumber = set.getString(4); 
				// вытянем актуальный номер документа, так как на моменте подвязки документ возможно был еще проектом
				
				if (anObject.code!= Integer.MIN_VALUE) {
					
					dfConnection = this.getdfConnection();
					DFDocDAO docDao = new DFDocDAO(dfConnection, super.getUserProfile());
					DFDocFilter docFilter = new DFDocFilter();
					 
					docFilter.conditionSQL = "docs.doccode in (" + anObject.dfDocCode + ")";
					docFilter.orderBySQL = " 1 DESC";
					DFDocShortList docsList = docDao.getLightDocFilteredList(docFilter, 0, -1, null);
					if (docsList.size() > 0) {
						anObject.dfDocNumber = docsList.get(0).docNum;
					}
					
				}
				
				
				anObject.dfDocDate = set.getDate(5);
				anObject.dfDocDescription = set.getString(6);
				anObject.commentgen = set.getString(7);
				anObject.necessary = set.getInt(8);
				if ( set.wasNull() ) {
					anObject.necessary = Integer.MIN_VALUE;
				}
				anObject.userAdd = set.getString(9);
				anObject.dateAdd = set.getTimestamp(10);
				anObject.userGen = set.getString(11);
				anObject.dateEdit = set.getTimestamp(12);

				anObject.actRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.actRefCode = Integer.MIN_VALUE;
				}
				anObject.actRefNumberGen = set.getString(14);
				anObject.actRefDateGen = set.getDate(15);
				anObject.actRefFinMolCode = set.getString(16);
				anObject.actRefFinMolName = set.getString(17);
				anObject.actRefFinMechanicName = set.getString(18);
				anObject.actRefInvNumber = set.getString(19);
				anObject.actRefUserGen = set.getString(20);
				anObject.actRefDateEdit = set.getDate(21);
				anObject.actRefDateAct = set.getDate(22);
				anObject.actRefMolCodeObject = set.getString(23);
				anObject.actRefCheckedByAccountant = set.getBoolean(24);
				if(set.wasNull()) {
					anObject.actRefCheckedByAccountant = null;
				}
				anObject.typeRefCode = set.getInt(25);
				if(set.wasNull()) {
					anObject.typeRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefName = set.getString(26);

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
				try{connection.close(); dfConnection.close();} catch(SQLException e){}
			}
		}
	}
    
    public Connection getdfConnection() {
		try {
			 

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource)initialContext.lookup(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			return dataSource.getConnection();
		}
		catch (NamingException e) {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.DOCFLOW_DATASOURCE+"%}",e);}
		catch (SQLException e)    {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.DOCFLOW_DATASOURCE+"%}",e);}
	}


} // end of ENActInvest2DFDocDAO
