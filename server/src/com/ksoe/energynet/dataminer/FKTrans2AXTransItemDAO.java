
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
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.FKTrans2AXTransItemDAOGen;
import com.ksoe.energynet.valueobject.FKTrans2AXTransItem;
import com.ksoe.energynet.valueobject.brief.FKTrans2AXTransItemShort;
import com.ksoe.energynet.valueobject.lists.FKTrans2AXTransItemShortList;

/**
 * DAO Object for FKTrans2AXTransItem;
 *
 */

public class FKTrans2AXTransItemDAO extends FKTrans2AXTransItemDAOGen {

    public FKTrans2AXTransItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public FKTrans2AXTransItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    /*
     * лист скол-вом проводок с групировкой по датаам   
     * 
     * **/
	public FKTrans2AXTransItemShortList getScrollableFilteredListGroup(FKTrans2AXTransItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
		FKTrans2AXTransItemShort anObject;
		result.list = new Vector<FKTrans2AXTransItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "FKTRANS2AXTRANSITEM.transdate";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "select transdate , count(code) as counttrans " +
		 " from fktrans2axtransitem  ";
		//whereStr = " FKTRANS2AXTRANS.CODE = FKTRANS2AXTRANSITEM.FKTRANS2AXTRANSCODE" ; //+

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);
		if(whereStr.length() != 0) {
			selectStr += " WHERE " + whereStr;
		}
		selectStr = selectStr + " GROUP BY FKTRANS2AXTRANSITEM.TRANSDATE " +  " ORDER BY " + orderBy;

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
				anObject = new FKTrans2AXTransItemShort();
				anObject.code = set.getInt(2); // кол-во
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				
				anObject.transDate = set.getDate(1);
				

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
	
	
	/*
     * лист с уникальным набором бал СЧЕТ , бал КАУ UNION ALL кор СЧЕТ , кор КАУ с фильтром по дате и по коду реестра проводок     
     * 
     * **/
	public FKTrans2AXTransItemShortList getAccountAndKAUDistinctFKTrans(int FKTrans2AXTransCode , String transDate) throws PersistenceException {
		FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
		FKTrans2AXTransItemShort anObject;
		result.list = new Vector<FKTrans2AXTransItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		
		selectStr =  " select distinct qq.balsch , qq.balkau , qq.isprihod   from fktrans2axtransitem qq \n"+ 
				 " where qq.fktrans2axtranscode = "+FKTrans2AXTransCode+" \n"+
				 " and qq.transdate = '"+transDate+"' \n"+
				 " union  \n"+
				 " select distinct qq.korsch as balsch, qq.korkau as balkau  , qq.isprihod  from fktrans2axtransitem qq \n"+ 
				 " where qq.fktrans2axtranscode = "+FKTrans2AXTransCode+" \n"+
				 " and qq.transdate = '"+transDate+"' ";

		int number = 0;
		try {
			statement = connection.prepareStatement(selectStr);
			
			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new FKTrans2AXTransItemShort();
				anObject.balSch = set.getString("balsch");		
				anObject.balKau = set.getString("balkau");
				anObject.isPrihod = set.getInt("isprihod");
				

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


	public FKTrans2AXTransItemShortList getScrollableFilteredList(FKTrans2AXTransItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		FKTrans2AXTransItemShortList result = new FKTrans2AXTransItemShortList();
		FKTrans2AXTransItemShort anObject;
		result.list = new Vector<FKTrans2AXTransItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "FKTRANS2AXTRANSITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"FKTRANS2AXTRANSITEM.CODE"+
			",FKTRANS2AXTRANSITEM.NUMUNFKSTR"+
			",FKTRANS2AXTRANSITEM.PARTID"+
			",FKTRANS2AXTRANSITEM.ISPRIHOD"+
			",FKTRANS2AXTRANSITEM.TRANSDATE"+
			",FKTRANS2AXTRANSITEM.BALCEH"+
			",FKTRANS2AXTRANSITEM.BALSCH"+
			",FKTRANS2AXTRANSITEM.BALKAU"+
			",FKTRANS2AXTRANSITEM.KORCEH"+
			",FKTRANS2AXTRANSITEM.KORSCH"+
			",FKTRANS2AXTRANSITEM.KORKAU"+
			",FKTRANS2AXTRANSITEM.AMOUNTCUR"+
			",FKTRANS2AXTRANSITEM.CURRENCY"+
			",FKTRANS2AXTRANSITEM.AMOUNTMST"+
			",FKTRANS2AXTRANSITEM.ACCOUNTNUM"+
			",FKTRANS2AXTRANSITEM.OFFSETACCOUNTNUM"+
			",coalesce(FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION1)"+
			",coalesce(FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION2)"+
			",coalesce(FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION3)"+
			",coalesce(FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION4)"+
			",coalesce(FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION5)"+
			",coalesce(FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION6)"+
			",coalesce(FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION7)"+
			",coalesce(FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION8)"+
			",coalesce(FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION9)"+
			",coalesce(FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION10)"+
			",coalesce(FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION11)"+
			",coalesce(FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION12)"+
			",coalesce(FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION13)"+
			",coalesce(FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION1)"+
			",coalesce(FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION2)"+
			",coalesce(FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION3)"+
			",coalesce(FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION4)"+
			",coalesce(FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION5)"+
			",coalesce(FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION6)"+
			",coalesce(FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION7)"+
			",coalesce(FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION8)"+
			",coalesce(FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION9)"+
			",coalesce(FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION10)"+
			",coalesce(FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION11)"+
			",coalesce(FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION12)"+
			",coalesce(FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION13)"+
			",coalesce(FKTRANS2AXTRANSITEM.LEDGERTXT)"+
			",coalesce(FKTRANS2AXTRANSITEM.VOUCHER)"+
			",FKTRANS2AXTRANSITEM.STATUS"+
			",FKTRANS2AXTRANSITEM.ERRORSTR"+
			", FKTRANS2AXTRANS.CODE " +
			", FKTRANS2AXTRANS.MONTHGEN " +
			", FKTRANS2AXTRANS.YEARGEN " +
			", FKTRANS2AXTRANS.TASKOWNER " +
		" FROM FKTRANS2AXTRANSITEM " +
			", FKTRANS2AXTRANS " +
		"";
		whereStr = " FKTRANS2AXTRANS.CODE = FKTRANS2AXTRANSITEM.FKTRANS2AXTRANSCODE" ; //+

	
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
				anObject = new FKTrans2AXTransItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numUnFKStr = set.getString(2);
				anObject.partId = set.getInt(3);
				if ( set.wasNull() ) {
					anObject.partId = Integer.MIN_VALUE;
				}
				anObject.isPrihod = set.getInt(4);
				if ( set.wasNull() ) {
					anObject.isPrihod = Integer.MIN_VALUE;
				}
				anObject.transDate = set.getDate(5);
				anObject.balCeh = set.getString(6);
				anObject.balSch = set.getString(7);
				anObject.balKau = set.getString(8);
				anObject.korCeh = set.getString(9);
				anObject.korSch = set.getString(10);
				anObject.korKau = set.getString(11);
				anObject.amountCur = set.getBigDecimal(12);
				if(anObject.amountCur != null) {
					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.currency = set.getString(13);
				anObject.amountMST = set.getBigDecimal(14);
				if(anObject.amountMST != null) {
					anObject.amountMST = anObject.amountMST.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.accountNum = set.getString(15);
				anObject.offsetAccountNum = set.getString(16);
				anObject.accountDimension1 = set.getString(17);
				anObject.accountDimension2 = set.getString(18);
				anObject.accountDimension3 = set.getString(19);
				anObject.accountDimension4 = set.getString(20);
				anObject.accountDimension5 = set.getString(21);
				anObject.accountDimension6 = set.getString(22);
				anObject.accountDimension7 = set.getString(23);
				anObject.accountDimension8 = set.getString(24);
				anObject.accountDimension9 = set.getString(25);
				anObject.accountDimension10 = set.getString(26);
				anObject.accountDimension11 = set.getString(27);
				anObject.accountDimension12 = set.getString(28);
				anObject.accountDimension13 = set.getString(29);
				anObject.corAccountDimension1 = set.getString(30);
				anObject.corAccountDimension2 = set.getString(31);
				anObject.corAccountDimension3 = set.getString(32);
				anObject.corAccountDimension4 = set.getString(33);
				anObject.corAccountDimension5 = set.getString(34);
				anObject.corAccountDimension6 = set.getString(35);
				anObject.corAccountDimension7 = set.getString(36);
				anObject.corAccountDimension8 = set.getString(37);
				anObject.corAccountDimension9 = set.getString(38);
				anObject.corAccountDimension10 = set.getString(39);
				anObject.corAccountDimension11 = set.getString(40);
				anObject.corAccountDimension12 = set.getString(41);
				anObject.corAccountDimension13 = set.getString(42);
				anObject.ledgerTxt = set.getString(43);
				anObject.voucher = set.getString(44);
				anObject.status = set.getInt(45);
				if ( set.wasNull() ) {
					anObject.status = Integer.MIN_VALUE;
				}
				anObject.errorStr = set.getString(46);

				anObject.FKTrans2AXTransCode = set.getInt(47);
				if(set.wasNull()) {
					anObject.FKTrans2AXTransCode = Integer.MIN_VALUE;
				}
				anObject.FKTrans2AXTransMonthGen = set.getInt(48);
				if(set.wasNull()) {
					anObject.FKTrans2AXTransMonthGen = Integer.MIN_VALUE;
				}
				anObject.FKTrans2AXTransYearGen = set.getInt(49);
				if(set.wasNull()) {
					anObject.FKTrans2AXTransYearGen = Integer.MIN_VALUE;
				}
				anObject.FKTrans2AXTransTaskOwner = set.getString(50);

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
	

    
    
} // end of FKTrans2AXTransItemDAO
