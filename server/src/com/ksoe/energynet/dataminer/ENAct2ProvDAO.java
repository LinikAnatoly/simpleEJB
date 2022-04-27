
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

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
import com.ksoe.energynet.dataminer.generated.ENAct2ProvDAOGen;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2Prov;
import com.ksoe.energynet.valueobject.ENServicesObject2Prov;
import com.ksoe.energynet.valueobject.brief.ENAct2ProvShort;
import com.ksoe.energynet.valueobject.filter.ENAct2ProvFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2ProvShortList;
import com.ksoe.energynet.util.Tools;

/**
 * DAO Object for ENAct2Prov;
 *
 */

public class ENAct2ProvDAO extends ENAct2ProvDAOGen {

    public ENAct2ProvDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENAct2ProvDAO(Connection aConnection,
            UserProfile anUserProfile) {    	
        super(aConnection, anUserProfile);
    }
    
    
    public int add(ENAct2Prov anObject) throws PersistenceException
    {
  	  anObject.dateEdit = new Date();
  	  anObject.userGen = getUserProfile().userName;
  	  return super.add(anObject);   
    }

    public void save(ENAct2Prov anObject) throws PersistenceException
    {
  	  anObject.dateEdit = new Date();
  	  anObject.userGen = getUserProfile().userName;
  	  super.save(anObject);
    }
    
    /**
     * Получить лист по акту
     * 
     * @param act акт {@link ENAct}
     * @param errorWhenNoRecord генерировать исключение если записей по акту не найдено
     * @return лист {@link ENAct2ProvShortList}
     * @throws PersistenceException
     */
    public ENAct2ProvShortList getListByAct(ENAct act, boolean errorWhenNoRecord) throws PersistenceException {
    	if(act == null || act.code == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException();
    	}
    	ENAct2ProvFilter filter = new ENAct2ProvFilter();
    	filter.actRef.code = act.code;
    	ENAct2ProvShortList list = this.getScrollableFilteredList(filter, 0, -1);
    	if(errorWhenNoRecord) {
    		if(list == null || list.totalCount == 0) {
    			throw new SystemException(String.format("Не знайдено шаблону проводок для акту № %s від %s"
    					, act.numberGen, Tools.dateFormatDefault.format(act.dateAct)));
    		}
    	}
    	return list;
    }
    
    
    public ENAct2ProvShortList getScrollableFilteredList(ENAct2Prov aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENAct2ProvShortList result = new ENAct2ProvShortList();
		ENAct2ProvShort anObject;
		result.list = new Vector<ENAct2ProvShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT2PROV.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACT2PROV.CODE"+
			",ENACT2PROV.PARTID"+
			",ENACT2PROV.USERGEN"+
			",ENACT2PROV.DATEPOSTING"+
			",ENACT2PROV.DATEEDIT"+
			",ENACT2PROV.VOUCHER"+
			",ENACT2PROV.ISINCOMEACT"+
			", ENACT.CODE " +
			", ENACT.NUMBERGEN " +
			", ENACT.DATEGEN " +
			", ENACT.FINDOCCODE " +
			", ENACT.FINDOCMECHANICCODE " +
			", ENACT.FINMOLNAME " +
			", ENACT.FINMECHANICNAME " +
			", ENACT.INVNUMBER " +
			", ENACT.USERGEN " +
			", ENACT.DATEEDIT " +
			", ENACT.DATEACT " +
			", ENACT.MOLCODEOBJECT " +
			", ENACTPOSTINGKIND.CODE " +
			", ENACTPOSTINGKIND.NAME " +
		" FROM ENACT2PROV left join ENACTPOSTINGKIND on (ENACTPOSTINGKIND.code = ENACT2PROV.ACTPOSTINGKINDREFCODE )" +
			", ENACT " +
			// ", ENACTPOSTINGKIND " +
		"";
		whereStr = " ENACT.CODE = ENACT2PROV.ACTREFCODE" ; //+
		//whereStr += " AND ENACTPOSTINGKIND.CODE = ENACT2PROV.ACTPOSTINGKINDREFCODE" ; //+

	
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
				anObject = new ENAct2ProvShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.partId = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.partId = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(3);
				anObject.datePosting = set.getDate(4);
				anObject.dateEdit = set.getDate(5);
				anObject.voucher = set.getString(6);
				anObject.isIncomeAct = set.getInt(7);
				if ( set.wasNull() ) {
					anObject.isIncomeAct = Integer.MIN_VALUE;
				}

				anObject.actRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.actRefCode = Integer.MIN_VALUE;
				}
				anObject.actRefNumberGen = set.getString(9);
				anObject.actRefDateGen = set.getDate(10);
				anObject.actRefFinDocCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.actRefFinDocCode = Integer.MIN_VALUE;
				}
				anObject.actRefFinDocMechanicCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
				}
				anObject.actRefFinMolName = set.getString(13);
				anObject.actRefFinMechanicName = set.getString(14);
				anObject.actRefInvNumber = set.getString(15);
				anObject.actRefUserGen = set.getString(16);
				anObject.actRefDateEdit = set.getDate(17);
				anObject.actRefDateAct = set.getDate(18);
				anObject.actRefMolCodeObject = set.getString(19);
				anObject.actPostingKindRefCode = set.getInt(20);
				if(set.wasNull()) {
					anObject.actPostingKindRefCode = Integer.MIN_VALUE;
				}
				anObject.actPostingKindRefName = set.getString(21);

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

} // end of ENAct2ProvDAO
