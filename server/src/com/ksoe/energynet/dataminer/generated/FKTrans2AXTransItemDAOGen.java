
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.valueobject.FKTrans2AXTransItem;
import com.ksoe.energynet.valueobject.filter.FKTrans2AXTransItemFilter;
import com.ksoe.energynet.valueobject.brief.FKTrans2AXTransItemShort;
import com.ksoe.energynet.valueobject.lists.FKTrans2AXTransItemShortList;


/**
 * DAO Object for FKTrans2AXTransItem;
 *
 */

public class FKTrans2AXTransItemDAOGen extends GenericDataMiner {

	public FKTrans2AXTransItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public FKTrans2AXTransItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(FKTrans2AXTransItem inObject) throws PersistenceException {
		FKTrans2AXTransItem obj = new FKTrans2AXTransItem();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numUnFKStr == null && obj.numUnFKStr == null){}
		else
			if(inObject.numUnFKStr == null || obj.numUnFKStr == null) return false;
			else
				if ( ! inObject.numUnFKStr.equals(obj.numUnFKStr)){
					return false;
				}

		if (inObject.partId != obj.partId){
					return false;
				}

		if (inObject.isPrihod != obj.isPrihod){
					return false;
				}

		if(inObject.transDate == null && obj.transDate == null){} else 
			if(inObject.transDate == null || obj.transDate == null) return false;
			else
				if (inObject.transDate.compareTo(obj.transDate) != 0){
					return false;
				}

		if(inObject.balCeh == null && obj.balCeh == null){}
		else
			if(inObject.balCeh == null || obj.balCeh == null) return false;
			else
				if ( ! inObject.balCeh.equals(obj.balCeh)){
					return false;
				}

		if(inObject.balSch == null && obj.balSch == null){}
		else
			if(inObject.balSch == null || obj.balSch == null) return false;
			else
				if ( ! inObject.balSch.equals(obj.balSch)){
					return false;
				}

		if(inObject.balKau == null && obj.balKau == null){}
		else
			if(inObject.balKau == null || obj.balKau == null) return false;
			else
				if ( ! inObject.balKau.equals(obj.balKau)){
					return false;
				}

		if(inObject.korCeh == null && obj.korCeh == null){}
		else
			if(inObject.korCeh == null || obj.korCeh == null) return false;
			else
				if ( ! inObject.korCeh.equals(obj.korCeh)){
					return false;
				}

		if(inObject.korSch == null && obj.korSch == null){}
		else
			if(inObject.korSch == null || obj.korSch == null) return false;
			else
				if ( ! inObject.korSch.equals(obj.korSch)){
					return false;
				}

		if(inObject.korKau == null && obj.korKau == null){}
		else
			if(inObject.korKau == null || obj.korKau == null) return false;
			else
				if ( ! inObject.korKau.equals(obj.korKau)){
					return false;
				}

		if(inObject.amountCur == null && obj.amountCur == null){}
		else
			if(inObject.amountCur == null || obj.amountCur == null) return false;
			else
				if ( ! inObject.amountCur.equals(obj.amountCur)){
					return false;
				}

		if(inObject.currency == null && obj.currency == null){}
		else
			if(inObject.currency == null || obj.currency == null) return false;
			else
				if ( ! inObject.currency.equals(obj.currency)){
					return false;
				}

		if(inObject.amountMST == null && obj.amountMST == null){}
		else
			if(inObject.amountMST == null || obj.amountMST == null) return false;
			else
				if ( ! inObject.amountMST.equals(obj.amountMST)){
					return false;
				}

		if(inObject.accountNum == null && obj.accountNum == null){}
		else
			if(inObject.accountNum == null || obj.accountNum == null) return false;
			else
				if ( ! inObject.accountNum.equals(obj.accountNum)){
					return false;
				}

		if(inObject.offsetAccountNum == null && obj.offsetAccountNum == null){}
		else
			if(inObject.offsetAccountNum == null || obj.offsetAccountNum == null) return false;
			else
				if ( ! inObject.offsetAccountNum.equals(obj.offsetAccountNum)){
					return false;
				}

		if(inObject.accountDimension1 == null && obj.accountDimension1 == null){}
		else
			if(inObject.accountDimension1 == null || obj.accountDimension1 == null) return false;
			else
				if ( ! inObject.accountDimension1.equals(obj.accountDimension1)){
					return false;
				}

		if(inObject.accountDimension2 == null && obj.accountDimension2 == null){}
		else
			if(inObject.accountDimension2 == null || obj.accountDimension2 == null) return false;
			else
				if ( ! inObject.accountDimension2.equals(obj.accountDimension2)){
					return false;
				}

		if(inObject.accountDimension3 == null && obj.accountDimension3 == null){}
		else
			if(inObject.accountDimension3 == null || obj.accountDimension3 == null) return false;
			else
				if ( ! inObject.accountDimension3.equals(obj.accountDimension3)){
					return false;
				}

		if(inObject.accountDimension4 == null && obj.accountDimension4 == null){}
		else
			if(inObject.accountDimension4 == null || obj.accountDimension4 == null) return false;
			else
				if ( ! inObject.accountDimension4.equals(obj.accountDimension4)){
					return false;
				}

		if(inObject.accountDimension5 == null && obj.accountDimension5 == null){}
		else
			if(inObject.accountDimension5 == null || obj.accountDimension5 == null) return false;
			else
				if ( ! inObject.accountDimension5.equals(obj.accountDimension5)){
					return false;
				}

		if(inObject.accountDimension6 == null && obj.accountDimension6 == null){}
		else
			if(inObject.accountDimension6 == null || obj.accountDimension6 == null) return false;
			else
				if ( ! inObject.accountDimension6.equals(obj.accountDimension6)){
					return false;
				}

		if(inObject.accountDimension7 == null && obj.accountDimension7 == null){}
		else
			if(inObject.accountDimension7 == null || obj.accountDimension7 == null) return false;
			else
				if ( ! inObject.accountDimension7.equals(obj.accountDimension7)){
					return false;
				}

		if(inObject.accountDimension8 == null && obj.accountDimension8 == null){}
		else
			if(inObject.accountDimension8 == null || obj.accountDimension8 == null) return false;
			else
				if ( ! inObject.accountDimension8.equals(obj.accountDimension8)){
					return false;
				}

		if(inObject.accountDimension9 == null && obj.accountDimension9 == null){}
		else
			if(inObject.accountDimension9 == null || obj.accountDimension9 == null) return false;
			else
				if ( ! inObject.accountDimension9.equals(obj.accountDimension9)){
					return false;
				}

		if(inObject.accountDimension10 == null && obj.accountDimension10 == null){}
		else
			if(inObject.accountDimension10 == null || obj.accountDimension10 == null) return false;
			else
				if ( ! inObject.accountDimension10.equals(obj.accountDimension10)){
					return false;
				}

		if(inObject.accountDimension11 == null && obj.accountDimension11 == null){}
		else
			if(inObject.accountDimension11 == null || obj.accountDimension11 == null) return false;
			else
				if ( ! inObject.accountDimension11.equals(obj.accountDimension11)){
					return false;
				}

		if(inObject.accountDimension12 == null && obj.accountDimension12 == null){}
		else
			if(inObject.accountDimension12 == null || obj.accountDimension12 == null) return false;
			else
				if ( ! inObject.accountDimension12.equals(obj.accountDimension12)){
					return false;
				}

		if(inObject.accountDimension13 == null && obj.accountDimension13 == null){}
		else
			if(inObject.accountDimension13 == null || obj.accountDimension13 == null) return false;
			else
				if ( ! inObject.accountDimension13.equals(obj.accountDimension13)){
					return false;
				}

		if(inObject.corAccountDimension1 == null && obj.corAccountDimension1 == null){}
		else
			if(inObject.corAccountDimension1 == null || obj.corAccountDimension1 == null) return false;
			else
				if ( ! inObject.corAccountDimension1.equals(obj.corAccountDimension1)){
					return false;
				}

		if(inObject.corAccountDimension2 == null && obj.corAccountDimension2 == null){}
		else
			if(inObject.corAccountDimension2 == null || obj.corAccountDimension2 == null) return false;
			else
				if ( ! inObject.corAccountDimension2.equals(obj.corAccountDimension2)){
					return false;
				}

		if(inObject.corAccountDimension3 == null && obj.corAccountDimension3 == null){}
		else
			if(inObject.corAccountDimension3 == null || obj.corAccountDimension3 == null) return false;
			else
				if ( ! inObject.corAccountDimension3.equals(obj.corAccountDimension3)){
					return false;
				}

		if(inObject.corAccountDimension4 == null && obj.corAccountDimension4 == null){}
		else
			if(inObject.corAccountDimension4 == null || obj.corAccountDimension4 == null) return false;
			else
				if ( ! inObject.corAccountDimension4.equals(obj.corAccountDimension4)){
					return false;
				}

		if(inObject.corAccountDimension5 == null && obj.corAccountDimension5 == null){}
		else
			if(inObject.corAccountDimension5 == null || obj.corAccountDimension5 == null) return false;
			else
				if ( ! inObject.corAccountDimension5.equals(obj.corAccountDimension5)){
					return false;
				}

		if(inObject.corAccountDimension6 == null && obj.corAccountDimension6 == null){}
		else
			if(inObject.corAccountDimension6 == null || obj.corAccountDimension6 == null) return false;
			else
				if ( ! inObject.corAccountDimension6.equals(obj.corAccountDimension6)){
					return false;
				}

		if(inObject.corAccountDimension7 == null && obj.corAccountDimension7 == null){}
		else
			if(inObject.corAccountDimension7 == null || obj.corAccountDimension7 == null) return false;
			else
				if ( ! inObject.corAccountDimension7.equals(obj.corAccountDimension7)){
					return false;
				}

		if(inObject.corAccountDimension8 == null && obj.corAccountDimension8 == null){}
		else
			if(inObject.corAccountDimension8 == null || obj.corAccountDimension8 == null) return false;
			else
				if ( ! inObject.corAccountDimension8.equals(obj.corAccountDimension8)){
					return false;
				}

		if(inObject.corAccountDimension9 == null && obj.corAccountDimension9 == null){}
		else
			if(inObject.corAccountDimension9 == null || obj.corAccountDimension9 == null) return false;
			else
				if ( ! inObject.corAccountDimension9.equals(obj.corAccountDimension9)){
					return false;
				}

		if(inObject.corAccountDimension10 == null && obj.corAccountDimension10 == null){}
		else
			if(inObject.corAccountDimension10 == null || obj.corAccountDimension10 == null) return false;
			else
				if ( ! inObject.corAccountDimension10.equals(obj.corAccountDimension10)){
					return false;
				}

		if(inObject.corAccountDimension11 == null && obj.corAccountDimension11 == null){}
		else
			if(inObject.corAccountDimension11 == null || obj.corAccountDimension11 == null) return false;
			else
				if ( ! inObject.corAccountDimension11.equals(obj.corAccountDimension11)){
					return false;
				}

		if(inObject.corAccountDimension12 == null && obj.corAccountDimension12 == null){}
		else
			if(inObject.corAccountDimension12 == null || obj.corAccountDimension12 == null) return false;
			else
				if ( ! inObject.corAccountDimension12.equals(obj.corAccountDimension12)){
					return false;
				}

		if(inObject.corAccountDimension13 == null && obj.corAccountDimension13 == null){}
		else
			if(inObject.corAccountDimension13 == null || obj.corAccountDimension13 == null) return false;
			else
				if ( ! inObject.corAccountDimension13.equals(obj.corAccountDimension13)){
					return false;
				}

		if(inObject.ledgerTxt == null && obj.ledgerTxt == null){}
		else
			if(inObject.ledgerTxt == null || obj.ledgerTxt == null) return false;
			else
				if ( ! inObject.ledgerTxt.equals(obj.ledgerTxt)){
					return false;
				}

		if(inObject.voucher == null && obj.voucher == null){}
		else
			if(inObject.voucher == null || obj.voucher == null) return false;
			else
				if ( ! inObject.voucher.equals(obj.voucher)){
					return false;
				}

		if (inObject.status != obj.status){
					return false;
				}

		if(inObject.errorStr == null && obj.errorStr == null){}
		else
			if(inObject.errorStr == null || obj.errorStr == null) return false;
			else
				if ( ! inObject.errorStr.equals(obj.errorStr)){
					return false;
				}
		if (inObject.FKTrans2AXTrans.code != obj.FKTrans2AXTrans.code){
			return false;
		}
		return true;
	}

	public int add(FKTrans2AXTransItem anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(FKTrans2AXTransItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO FKTRANS2AXTRANSITEM (CODE,NUMUNFKSTR,PARTID,ISPRIHOD,TRANSDATE,BALCEH,BALSCH,BALKAU,KORCEH,KORSCH,KORKAU,AMOUNTCUR,CURRENCY,AMOUNTMST,ACCOUNTNUM,OFFSETACCOUNTNUM,ACCOUNTDIMENSION1,ACCOUNTDIMENSION2,ACCOUNTDIMENSION3,ACCOUNTDIMENSION4,ACCOUNTDIMENSION5,ACCOUNTDIMENSION6,ACCOUNTDIMENSION7,ACCOUNTDIMENSION8,ACCOUNTDIMENSION9,ACCOUNTDIMENSION10,ACCOUNTDIMENSION11,ACCOUNTDIMENSION12,ACCOUNTDIMENSION13,CORACCOUNTDIMENSION1,CORACCOUNTDIMENSION2,CORACCOUNTDIMENSION3,CORACCOUNTDIMENSION4,CORACCOUNTDIMENSION5,CORACCOUNTDIMENSION6,CORACCOUNTDIMENSION7,CORACCOUNTDIMENSION8,CORACCOUNTDIMENSION9,CORACCOUNTDIMENSION10,CORACCOUNTDIMENSION11,CORACCOUNTDIMENSION12,CORACCOUNTDIMENSION13,LEDGERTXT,VOUCHER,STATUS,ERRORSTR,FKTRANS2AXTRANSCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.numUnFKStr);
			if (anObject.partId != Integer.MIN_VALUE ) {
				statement.setInt(3,anObject.partId);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}
			if (anObject.isPrihod != Integer.MIN_VALUE ) {
				statement.setInt(4,anObject.isPrihod);
			} else {
				statement.setNull(4,java.sql.Types.INTEGER);
			}
			if (anObject.transDate == null) {
				statement.setDate(5,null);
			} else {
				statement.setDate(5,new java.sql.Date(anObject.transDate.getTime()));
			}
			statement.setString(6,anObject.balCeh);
			statement.setString(7,anObject.balSch);
			statement.setString(8,anObject.balKau);
			statement.setString(9,anObject.korCeh);
			statement.setString(10,anObject.korSch);
			statement.setString(11,anObject.korKau);
			if (anObject.amountCur != null) {
				anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(12,anObject.amountCur);
			statement.setString(13,anObject.currency);
			if (anObject.amountMST != null) {
				anObject.amountMST = anObject.amountMST.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(14,anObject.amountMST);
			statement.setString(15,anObject.accountNum);
			statement.setString(16,anObject.offsetAccountNum);
			statement.setString(17,anObject.accountDimension1);
			statement.setString(18,anObject.accountDimension2);
			statement.setString(19,anObject.accountDimension3);
			statement.setString(20,anObject.accountDimension4);
			statement.setString(21,anObject.accountDimension5);
			statement.setString(22,anObject.accountDimension6);
			statement.setString(23,anObject.accountDimension7);
			statement.setString(24,anObject.accountDimension8);
			statement.setString(25,anObject.accountDimension9);
			statement.setString(26,anObject.accountDimension10);
			statement.setString(27,anObject.accountDimension11);
			statement.setString(28,anObject.accountDimension12);
			statement.setString(29,anObject.accountDimension13);
			statement.setString(30,anObject.corAccountDimension1);
			statement.setString(31,anObject.corAccountDimension2);
			statement.setString(32,anObject.corAccountDimension3);
			statement.setString(33,anObject.corAccountDimension4);
			statement.setString(34,anObject.corAccountDimension5);
			statement.setString(35,anObject.corAccountDimension6);
			statement.setString(36,anObject.corAccountDimension7);
			statement.setString(37,anObject.corAccountDimension8);
			statement.setString(38,anObject.corAccountDimension9);
			statement.setString(39,anObject.corAccountDimension10);
			statement.setString(40,anObject.corAccountDimension11);
			statement.setString(41,anObject.corAccountDimension12);
			statement.setString(42,anObject.corAccountDimension13);
			statement.setString(43,anObject.ledgerTxt);
			statement.setString(44,anObject.voucher);
			if (anObject.status != Integer.MIN_VALUE ) {
				statement.setInt(45,anObject.status);
			} else {
				statement.setNull(45,java.sql.Types.INTEGER);
			}
			statement.setString(46,anObject.errorStr);
			if (anObject.FKTrans2AXTrans.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.FKTrans2AXTransDAOGen(connection,getUserProfile()).exists(anObject.FKTrans2AXTrans.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FKTrans2AXTransItem.FKTrans2AXTrans.code%} = {%"+anObject.FKTrans2AXTrans.code+"%}");
				}
				statement.setInt(47,anObject.FKTrans2AXTrans.code);
			} else {
				statement.setNull(47,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%FKTrans2AXTransItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(FKTrans2AXTransItem anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(FKTrans2AXTransItem anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;


			String selectStr;

			Vector<String> fields = null;
			if(anAttributes != null) {
				String fieldNameStr;
				fields = new Vector<String>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NUMUNFKSTR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISPRIHOD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRANSDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BALCEH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BALSCH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BALKAU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KORCEH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KORSCH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KORKAU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AMOUNTCUR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CURRENCY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AMOUNTMST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTNUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OFFSETACCOUNTNUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDIMENSION1") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDIMENSION2") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDIMENSION3") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDIMENSION4") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDIMENSION5") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDIMENSION6") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDIMENSION7") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDIMENSION8") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDIMENSION9") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDIMENSION10") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDIMENSION11") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDIMENSION12") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDIMENSION13") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CORACCOUNTDIMENSION1") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CORACCOUNTDIMENSION2") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CORACCOUNTDIMENSION3") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CORACCOUNTDIMENSION4") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CORACCOUNTDIMENSION5") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CORACCOUNTDIMENSION6") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CORACCOUNTDIMENSION7") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CORACCOUNTDIMENSION8") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CORACCOUNTDIMENSION9") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CORACCOUNTDIMENSION10") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CORACCOUNTDIMENSION11") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CORACCOUNTDIMENSION12") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CORACCOUNTDIMENSION13") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("LEDGERTXT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VOUCHER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ERRORSTR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FKTRANS2AXTRANS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE FKTRANS2AXTRANSITEM SET  NUMUNFKSTR = ? , PARTID = ? , ISPRIHOD = ? , TRANSDATE = ? , BALCEH = ? , BALSCH = ? , BALKAU = ? , KORCEH = ? , KORSCH = ? , KORKAU = ? , AMOUNTCUR = ? , CURRENCY = ? , AMOUNTMST = ? , ACCOUNTNUM = ? , OFFSETACCOUNTNUM = ? , ACCOUNTDIMENSION1 = ? , ACCOUNTDIMENSION2 = ? , ACCOUNTDIMENSION3 = ? , ACCOUNTDIMENSION4 = ? , ACCOUNTDIMENSION5 = ? , ACCOUNTDIMENSION6 = ? , ACCOUNTDIMENSION7 = ? , ACCOUNTDIMENSION8 = ? , ACCOUNTDIMENSION9 = ? , ACCOUNTDIMENSION10 = ? , ACCOUNTDIMENSION11 = ? , ACCOUNTDIMENSION12 = ? , ACCOUNTDIMENSION13 = ? , CORACCOUNTDIMENSION1 = ? , CORACCOUNTDIMENSION2 = ? , CORACCOUNTDIMENSION3 = ? , CORACCOUNTDIMENSION4 = ? , CORACCOUNTDIMENSION5 = ? , CORACCOUNTDIMENSION6 = ? , CORACCOUNTDIMENSION7 = ? , CORACCOUNTDIMENSION8 = ? , CORACCOUNTDIMENSION9 = ? , CORACCOUNTDIMENSION10 = ? , CORACCOUNTDIMENSION11 = ? , CORACCOUNTDIMENSION12 = ? , CORACCOUNTDIMENSION13 = ? , LEDGERTXT = ? , VOUCHER = ? , STATUS = ? , ERRORSTR = ? , FKTRANS2AXTRANSCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE FKTRANS2AXTRANSITEM SET ";
				for(int fldIndex = 0;fldIndex < fields.size();fldIndex++) {
					selectStr+=(String)fields.get(fldIndex);
					if(fldIndex > 0) {
						selectStr+=",";
					}
				}
				selectStr += " WHERE CODE = ?";
			}

			statement = null;
			try {
				statement = connection.prepareStatement(selectStr);
				if(fields == null) {
					statement.setString(1,anObject.numUnFKStr);
					if (anObject.partId != Integer.MIN_VALUE) {
						statement.setInt(2,anObject.partId);
					} else {
						statement.setNull(2,java.sql.Types.INTEGER);
					}
					if (anObject.isPrihod != Integer.MIN_VALUE) {
						statement.setInt(3,anObject.isPrihod);
					} else {
						statement.setNull(3,java.sql.Types.INTEGER);
					}
					if (anObject.transDate == null) {
						statement.setDate(4,null);
					} else {
						statement.setDate(4,new java.sql.Date(anObject.transDate.getTime()));
					}
					statement.setString(5,anObject.balCeh);
					statement.setString(6,anObject.balSch);
					statement.setString(7,anObject.balKau);
					statement.setString(8,anObject.korCeh);
					statement.setString(9,anObject.korSch);
					statement.setString(10,anObject.korKau);
					if (anObject.amountCur != null) {
						anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(11,anObject.amountCur);
					statement.setString(12,anObject.currency);
					if (anObject.amountMST != null) {
						anObject.amountMST = anObject.amountMST.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(13,anObject.amountMST);
					statement.setString(14,anObject.accountNum);
					statement.setString(15,anObject.offsetAccountNum);
					statement.setString(16,anObject.accountDimension1);
					statement.setString(17,anObject.accountDimension2);
					statement.setString(18,anObject.accountDimension3);
					statement.setString(19,anObject.accountDimension4);
					statement.setString(20,anObject.accountDimension5);
					statement.setString(21,anObject.accountDimension6);
					statement.setString(22,anObject.accountDimension7);
					statement.setString(23,anObject.accountDimension8);
					statement.setString(24,anObject.accountDimension9);
					statement.setString(25,anObject.accountDimension10);
					statement.setString(26,anObject.accountDimension11);
					statement.setString(27,anObject.accountDimension12);
					statement.setString(28,anObject.accountDimension13);
					statement.setString(29,anObject.corAccountDimension1);
					statement.setString(30,anObject.corAccountDimension2);
					statement.setString(31,anObject.corAccountDimension3);
					statement.setString(32,anObject.corAccountDimension4);
					statement.setString(33,anObject.corAccountDimension5);
					statement.setString(34,anObject.corAccountDimension6);
					statement.setString(35,anObject.corAccountDimension7);
					statement.setString(36,anObject.corAccountDimension8);
					statement.setString(37,anObject.corAccountDimension9);
					statement.setString(38,anObject.corAccountDimension10);
					statement.setString(39,anObject.corAccountDimension11);
					statement.setString(40,anObject.corAccountDimension12);
					statement.setString(41,anObject.corAccountDimension13);
					statement.setString(42,anObject.ledgerTxt);
					statement.setString(43,anObject.voucher);
					if (anObject.status != Integer.MIN_VALUE) {
						statement.setInt(44,anObject.status);
					} else {
						statement.setNull(44,java.sql.Types.INTEGER);
					}
					statement.setString(45,anObject.errorStr);
					if (anObject.FKTrans2AXTrans.code != Integer.MIN_VALUE) {
						statement.setInt(46,anObject.FKTrans2AXTrans.code);
					} else {
						statement.setNull(46,java.sql.Types.INTEGER);
					}
					statement.setInt(47,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMUNFKSTR".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.numUnFKStr);
							continue;
						}
						if("PARTID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.partId);
							continue;
						}
						if("ISPRIHOD".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.isPrihod);
							continue;
						}
						if("TRANSDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.transDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.transDate.getTime()));
							}
							continue;
						}
						if("BALCEH".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.balCeh);
							continue;
						}
						if("BALSCH".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.balSch);
							continue;
						}
						if("BALKAU".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.balKau);
							continue;
						}
						if("KORCEH".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.korCeh);
							continue;
						}
						if("KORSCH".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.korSch);
							continue;
						}
						if("KORKAU".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.korKau);
							continue;
						}
						if("AMOUNTCUR".compareTo((String)fields.get(i)) == 0) {
							if (anObject.amountCur != null) {
								anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.amountCur);
							continue;
						}
						if("CURRENCY".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.currency);
							continue;
						}
						if("AMOUNTMST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.amountMST != null) {
								anObject.amountMST = anObject.amountMST.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.amountMST);
							continue;
						}
						if("ACCOUNTNUM".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountNum);
							continue;
						}
						if("OFFSETACCOUNTNUM".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.offsetAccountNum);
							continue;
						}
						if("ACCOUNTDIMENSION1".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountDimension1);
							continue;
						}
						if("ACCOUNTDIMENSION2".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountDimension2);
							continue;
						}
						if("ACCOUNTDIMENSION3".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountDimension3);
							continue;
						}
						if("ACCOUNTDIMENSION4".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountDimension4);
							continue;
						}
						if("ACCOUNTDIMENSION5".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountDimension5);
							continue;
						}
						if("ACCOUNTDIMENSION6".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountDimension6);
							continue;
						}
						if("ACCOUNTDIMENSION7".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountDimension7);
							continue;
						}
						if("ACCOUNTDIMENSION8".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountDimension8);
							continue;
						}
						if("ACCOUNTDIMENSION9".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountDimension9);
							continue;
						}
						if("ACCOUNTDIMENSION10".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountDimension10);
							continue;
						}
						if("ACCOUNTDIMENSION11".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountDimension11);
							continue;
						}
						if("ACCOUNTDIMENSION12".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountDimension12);
							continue;
						}
						if("ACCOUNTDIMENSION13".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountDimension13);
							continue;
						}
						if("CORACCOUNTDIMENSION1".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.corAccountDimension1);
							continue;
						}
						if("CORACCOUNTDIMENSION2".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.corAccountDimension2);
							continue;
						}
						if("CORACCOUNTDIMENSION3".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.corAccountDimension3);
							continue;
						}
						if("CORACCOUNTDIMENSION4".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.corAccountDimension4);
							continue;
						}
						if("CORACCOUNTDIMENSION5".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.corAccountDimension5);
							continue;
						}
						if("CORACCOUNTDIMENSION6".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.corAccountDimension6);
							continue;
						}
						if("CORACCOUNTDIMENSION7".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.corAccountDimension7);
							continue;
						}
						if("CORACCOUNTDIMENSION8".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.corAccountDimension8);
							continue;
						}
						if("CORACCOUNTDIMENSION9".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.corAccountDimension9);
							continue;
						}
						if("CORACCOUNTDIMENSION10".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.corAccountDimension10);
							continue;
						}
						if("CORACCOUNTDIMENSION11".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.corAccountDimension11);
							continue;
						}
						if("CORACCOUNTDIMENSION12".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.corAccountDimension12);
							continue;
						}
						if("CORACCOUNTDIMENSION13".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.corAccountDimension13);
							continue;
						}
						if("LEDGERTXT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.ledgerTxt);
							continue;
						}
						if("VOUCHER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.voucher);
							continue;
						}
						if("STATUS".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.status);
							continue;
						}
						if("ERRORSTR".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.errorStr);
							continue;
						}
						if("FKTRANS2AXTRANS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.FKTrans2AXTrans.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.FKTrans2AXTrans.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
					}
					statement.setInt(fields.size(),anObject.code);
				}
				statement.execute();
			} catch(SQLException e) {
				System.out.println(e.getMessage()+"\nstatement - "+selectStr);
				throw new SystemException(e.getMessage(), e);
			} finally {
				try {if (statement != null) statement.close();} catch (SQLException e) {}
			}
		} finally {
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}

	} // end of save(FKTrans2AXTransItem anObject,String[] anAttributes)


	public FKTrans2AXTransItemShort getShortObject(int anObjectCode) throws PersistenceException {
		FKTrans2AXTransItem filterObject = new FKTrans2AXTransItem();
		Vector<FKTrans2AXTransItemShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (FKTrans2AXTransItemShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(FKTrans2AXTransItem filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numUnFKStr, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.partId, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isPrihod, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.transDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.balCeh, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.balSch, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.balKau, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.korCeh, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.korSch, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.korKau, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.amountCur, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.currency, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.amountMST, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountNum, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.offsetAccountNum, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDimension1, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDimension2, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDimension3, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDimension4, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDimension5, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDimension6, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDimension7, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDimension8, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDimension9, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDimension10, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDimension11, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDimension12, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDimension13, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.corAccountDimension1, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.corAccountDimension2, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.corAccountDimension3, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.corAccountDimension4, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.corAccountDimension5, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.corAccountDimension6, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.corAccountDimension7, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.corAccountDimension8, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.corAccountDimension9, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.corAccountDimension10, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.corAccountDimension11, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.corAccountDimension12, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.corAccountDimension13, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.ledgerTxt, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.voucher, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.status, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.errorStr, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.FKTrans2AXTrans.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(FKTrans2AXTransItemFilter filter) {
		String out = buildCondition((FKTrans2AXTransItem)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(FKTrans2AXTransItem filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, FKTrans2AXTransItem.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numUnFKStr, FKTrans2AXTransItem.numUnFKStr_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.partId, FKTrans2AXTransItem.partId_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isPrihod, FKTrans2AXTransItem.isPrihod_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.transDate, FKTrans2AXTransItem.transDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.balCeh, FKTrans2AXTransItem.balCeh_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.balSch, FKTrans2AXTransItem.balSch_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.balKau, FKTrans2AXTransItem.balKau_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.korCeh, FKTrans2AXTransItem.korCeh_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.korSch, FKTrans2AXTransItem.korSch_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.korKau, FKTrans2AXTransItem.korKau_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.amountCur, FKTrans2AXTransItem.amountCur_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.currency, FKTrans2AXTransItem.currency_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.amountMST, FKTrans2AXTransItem.amountMST_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountNum, FKTrans2AXTransItem.accountNum_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.offsetAccountNum, FKTrans2AXTransItem.offsetAccountNum_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDimension1, FKTrans2AXTransItem.accountDimension1_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDimension2, FKTrans2AXTransItem.accountDimension2_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDimension3, FKTrans2AXTransItem.accountDimension3_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDimension4, FKTrans2AXTransItem.accountDimension4_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDimension5, FKTrans2AXTransItem.accountDimension5_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDimension6, FKTrans2AXTransItem.accountDimension6_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDimension7, FKTrans2AXTransItem.accountDimension7_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDimension8, FKTrans2AXTransItem.accountDimension8_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDimension9, FKTrans2AXTransItem.accountDimension9_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDimension10, FKTrans2AXTransItem.accountDimension10_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDimension11, FKTrans2AXTransItem.accountDimension11_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDimension12, FKTrans2AXTransItem.accountDimension12_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDimension13, FKTrans2AXTransItem.accountDimension13_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.corAccountDimension1, FKTrans2AXTransItem.corAccountDimension1_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.corAccountDimension2, FKTrans2AXTransItem.corAccountDimension2_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.corAccountDimension3, FKTrans2AXTransItem.corAccountDimension3_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.corAccountDimension4, FKTrans2AXTransItem.corAccountDimension4_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.corAccountDimension5, FKTrans2AXTransItem.corAccountDimension5_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.corAccountDimension6, FKTrans2AXTransItem.corAccountDimension6_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.corAccountDimension7, FKTrans2AXTransItem.corAccountDimension7_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.corAccountDimension8, FKTrans2AXTransItem.corAccountDimension8_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.corAccountDimension9, FKTrans2AXTransItem.corAccountDimension9_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.corAccountDimension10, FKTrans2AXTransItem.corAccountDimension10_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.corAccountDimension11, FKTrans2AXTransItem.corAccountDimension11_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.corAccountDimension12, FKTrans2AXTransItem.corAccountDimension12_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.corAccountDimension13, FKTrans2AXTransItem.corAccountDimension13_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.ledgerTxt, FKTrans2AXTransItem.ledgerTxt_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.voucher, FKTrans2AXTransItem.voucher_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.status, FKTrans2AXTransItem.status_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.errorStr, FKTrans2AXTransItem.errorStr_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.FKTrans2AXTrans.code, FKTrans2AXTransItem.FKTrans2AXTrans_QFielld, out);
		}
		return out;
	}

	public FKTrans2AXTransItemShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public FKTrans2AXTransItemShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public FKTrans2AXTransItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public FKTrans2AXTransItemShortList getFilteredList(FKTrans2AXTransItem filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public FKTrans2AXTransItemShortList getScrollableFilteredList(FKTrans2AXTransItem aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public FKTrans2AXTransItemShortList getScrollableFilteredList(FKTrans2AXTransItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public FKTrans2AXTransItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public FKTrans2AXTransItemShortList getScrollableFilteredList(FKTrans2AXTransItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public FKTrans2AXTransItemShortList getScrollableFilteredList(FKTrans2AXTransItemFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
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
			",FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION1"+
			",FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION2"+
			",FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION3"+
			",FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION4"+
			",FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION5"+
			",FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION6"+
			",FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION7"+
			",FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION8"+
			",FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION9"+
			",FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION10"+
			",FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION11"+
			",FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION12"+
			",FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION13"+
			",FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION1"+
			",FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION2"+
			",FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION3"+
			",FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION4"+
			",FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION5"+
			",FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION6"+
			",FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION7"+
			",FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION8"+
			",FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION9"+
			",FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION10"+
			",FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION11"+
			",FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION12"+
			",FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION13"+
			",FKTRANS2AXTRANSITEM.LEDGERTXT"+
			",FKTRANS2AXTRANSITEM.VOUCHER"+
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
	
	public int[] getFilteredCodeArray(FKTrans2AXTransItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(FKTrans2AXTransItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT FKTRANS2AXTRANSITEM.CODE FROM FKTRANS2AXTRANSITEM";
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
		
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);

		if(whereStr.length() != 0) {
			selectStr = selectStr + " WHERE " + whereStr;
		}

		selectStr = selectStr + " ORDER BY " + orderBy;
		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;

		try {
			statement = connection.prepareStatement(selectStr);
			int number = setParameters(aFilterObject, statement);

			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement,aBindObjects,number);
			}

			set = statement.executeQuery();
			int i;
			for(i = 0;set.next();i++) {
				if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}
				result.add(new Integer(set.getInt(1)));
			}

			int[] array = new int[result.size()];
			for(int j = 0;j < result.size();j++) {
				array[j] = ((Integer)result.get(j)).intValue();
			}
			return array;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	} // end of getFilteredCodeArray

	public FKTrans2AXTransItem getObject(int uid) throws PersistenceException {
		FKTrans2AXTransItem result = new FKTrans2AXTransItem();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(FKTrans2AXTransItem anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  FKTRANS2AXTRANSITEM.CODE, FKTRANS2AXTRANSITEM.NUMUNFKSTR, FKTRANS2AXTRANSITEM.PARTID, FKTRANS2AXTRANSITEM.ISPRIHOD, FKTRANS2AXTRANSITEM.TRANSDATE, FKTRANS2AXTRANSITEM.BALCEH, FKTRANS2AXTRANSITEM.BALSCH, FKTRANS2AXTRANSITEM.BALKAU, FKTRANS2AXTRANSITEM.KORCEH, FKTRANS2AXTRANSITEM.KORSCH, FKTRANS2AXTRANSITEM.KORKAU, FKTRANS2AXTRANSITEM.AMOUNTCUR, FKTRANS2AXTRANSITEM.CURRENCY, FKTRANS2AXTRANSITEM.AMOUNTMST, FKTRANS2AXTRANSITEM.ACCOUNTNUM, FKTRANS2AXTRANSITEM.OFFSETACCOUNTNUM, FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION1, FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION2, FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION3, FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION4, FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION5, FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION6, FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION7, FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION8, FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION9, FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION10, FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION11, FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION12, FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION13, FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION1, FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION2, FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION3, FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION4, FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION5, FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION6, FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION7, FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION8, FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION9, FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION10, FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION11, FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION12, FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION13, FKTRANS2AXTRANSITEM.LEDGERTXT, FKTRANS2AXTRANSITEM.VOUCHER, FKTRANS2AXTRANSITEM.STATUS, FKTRANS2AXTRANSITEM.ERRORSTR, FKTRANS2AXTRANSITEM.FKTRANS2AXTRANSCODE "
			+" FROM FKTRANS2AXTRANSITEM WHERE FKTRANS2AXTRANSITEM.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.numUnFKStr = set.getString(2);
				anObject.partId = set.getInt(3);
				if (set.wasNull()) {
					anObject.partId = Integer.MIN_VALUE;
				}
				anObject.isPrihod = set.getInt(4);
				if (set.wasNull()) {
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
				if (set.wasNull()) {
					anObject.status = Integer.MIN_VALUE;
				}
				anObject.errorStr = set.getString(46);
				anObject.FKTrans2AXTrans.code = set.getInt(47);
				if (set.wasNull()) {
					anObject.FKTrans2AXTrans.code = Integer.MIN_VALUE;
				}
				if(anObject.FKTrans2AXTrans.code != Integer.MIN_VALUE) {
					anObject.setFKTrans2AXTrans(
						new com.ksoe.energynet.dataminer.generated.FKTrans2AXTransDAOGen(connection,getUserProfile()).getRef(anObject.FKTrans2AXTrans.code));
				}
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if(set != null) set.close(); if (statement != null) statement.close();}
			catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}


	public com.ksoe.energynet.valueobject.references.FKTrans2AXTransItemRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.FKTrans2AXTransItemRef ref = new com.ksoe.energynet.valueobject.references.FKTrans2AXTransItemRef();
		if(exists(anObjectCode)) {
			ref.code = anObjectCode;
		} else {
			ref.code = Integer.MIN_VALUE;
		}
		return ref;
	}

	public void remove(int uid) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();

		selectStr = "DELETE FROM  FKTRANS2AXTRANSITEM WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		FKTrans2AXTransItem object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%FKTrans2AXTransItem.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(FKTrans2AXTransItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%FKTrans2AXTransItem.remove%} access denied");
		}

		PreparedStatement statement = null;
		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,uid);
			statement.execute();
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	
	public long count(FKTrans2AXTransItemFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(FKTrans2AXTransItemFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, FKTrans2AXTransItemFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM FKTRANS2AXTRANSITEM", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		

		whereStr = BaseDAOUtils.addToCondition(buildCondition(filter), whereStr);

		if(whereStr.length() != 0) {
			selectStr = selectStr + " WHERE " + whereStr;
		}
		
		try {
			statement = connection.prepareStatement(selectStr);
			int number = setParameters(filter, statement);

			if(bindObjects != null) {
				_bindObjectsToPreparedStatement(statement,bindObjects,number);
			}

			set = statement.executeQuery();
			if(set.next()) {
				return (E)set.getObject(1);
			} else {
				return null;
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}		
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, FKTrans2AXTransItemFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "FKTRANS2AXTRANSITEM");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;
		
		ArrayList<E> out = new ArrayList<E>();
		
		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		whereStr += buildCondition(filter);

		if(whereStr.length() != 0) {
			sql += " WHERE " + whereStr;
		}
		
		try {
			statement = connection.prepareStatement(sql);
			int number = setParameters(filter, statement);

			if(bindObjects != null) {
				_bindObjectsToPreparedStatement(statement,bindObjects,number);
			}

			set = statement.executeQuery();
			while(set.next()) {
				out.add((E)set.getObject(1));
			}
			return out;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+sql);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
		}		
	}

	public boolean exists(int anObjectCode) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if(anObjectCode == Integer.MIN_VALUE) {
			return false;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FKTrans2AXTransItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%FKTrans2AXTransItem.getObject%} access denied");
		}

		selectStr =
			"SELECT  FKTRANS2AXTRANSITEM.CODE FROM  FKTRANS2AXTRANSITEM WHERE  FKTRANS2AXTRANSITEM.CODE = ?";
		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObjectCode);
			set = statement.executeQuery();
			if(set.next()) {
				return true;
			}
			return false;
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

	public static String processCondition(String aCondition) {
		if(aCondition == null || aCondition.length() == 0) {
			return "";
		}

		StringBuffer condition = new StringBuffer(aCondition);
		_checkConditionToken(condition,";"," ");
		_checkConditionToken(condition,"--"," ");
		_checkConditionToken(condition,"\r"," ");
		_checkConditionToken(condition,"\n"," ");
		_checkConditionToken(condition,"||"," OR ");
		_checkConditionToken(condition,"&&"," AND ");
		_checkConditionToken(condition,"==","=");
		_checkConditionToken(condition,"!=","<>");
		_checkConditionToken(condition,"code","FKTRANS2AXTRANSITEM.CODE");
		_checkConditionToken(condition,"numunfkstr","FKTRANS2AXTRANSITEM.NUMUNFKSTR");
		_checkConditionToken(condition,"partid","FKTRANS2AXTRANSITEM.PARTID");
		_checkConditionToken(condition,"isprihod","FKTRANS2AXTRANSITEM.ISPRIHOD");
		_checkConditionToken(condition,"transdate","FKTRANS2AXTRANSITEM.TRANSDATE");
		_checkConditionToken(condition,"balceh","FKTRANS2AXTRANSITEM.BALCEH");
		_checkConditionToken(condition,"balsch","FKTRANS2AXTRANSITEM.BALSCH");
		_checkConditionToken(condition,"balkau","FKTRANS2AXTRANSITEM.BALKAU");
		_checkConditionToken(condition,"korceh","FKTRANS2AXTRANSITEM.KORCEH");
		_checkConditionToken(condition,"korsch","FKTRANS2AXTRANSITEM.KORSCH");
		_checkConditionToken(condition,"korkau","FKTRANS2AXTRANSITEM.KORKAU");
		_checkConditionToken(condition,"amountcur","FKTRANS2AXTRANSITEM.AMOUNTCUR");
		_checkConditionToken(condition,"currency","FKTRANS2AXTRANSITEM.CURRENCY");
		_checkConditionToken(condition,"amountmst","FKTRANS2AXTRANSITEM.AMOUNTMST");
		_checkConditionToken(condition,"accountnum","FKTRANS2AXTRANSITEM.ACCOUNTNUM");
		_checkConditionToken(condition,"offsetaccountnum","FKTRANS2AXTRANSITEM.OFFSETACCOUNTNUM");
		_checkConditionToken(condition,"accountdimension1","FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION1");
		_checkConditionToken(condition,"accountdimension2","FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION2");
		_checkConditionToken(condition,"accountdimension3","FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION3");
		_checkConditionToken(condition,"accountdimension4","FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION4");
		_checkConditionToken(condition,"accountdimension5","FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION5");
		_checkConditionToken(condition,"accountdimension6","FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION6");
		_checkConditionToken(condition,"accountdimension7","FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION7");
		_checkConditionToken(condition,"accountdimension8","FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION8");
		_checkConditionToken(condition,"accountdimension9","FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION9");
		_checkConditionToken(condition,"accountdimension10","FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION10");
		_checkConditionToken(condition,"accountdimension11","FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION11");
		_checkConditionToken(condition,"accountdimension12","FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION12");
		_checkConditionToken(condition,"accountdimension13","FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION13");
		_checkConditionToken(condition,"coraccountdimension1","FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION1");
		_checkConditionToken(condition,"coraccountdimension2","FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION2");
		_checkConditionToken(condition,"coraccountdimension3","FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION3");
		_checkConditionToken(condition,"coraccountdimension4","FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION4");
		_checkConditionToken(condition,"coraccountdimension5","FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION5");
		_checkConditionToken(condition,"coraccountdimension6","FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION6");
		_checkConditionToken(condition,"coraccountdimension7","FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION7");
		_checkConditionToken(condition,"coraccountdimension8","FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION8");
		_checkConditionToken(condition,"coraccountdimension9","FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION9");
		_checkConditionToken(condition,"coraccountdimension10","FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION10");
		_checkConditionToken(condition,"coraccountdimension11","FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION11");
		_checkConditionToken(condition,"coraccountdimension12","FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION12");
		_checkConditionToken(condition,"coraccountdimension13","FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION13");
		_checkConditionToken(condition,"ledgertxt","FKTRANS2AXTRANSITEM.LEDGERTXT");
		_checkConditionToken(condition,"voucher","FKTRANS2AXTRANSITEM.VOUCHER");
		_checkConditionToken(condition,"status","FKTRANS2AXTRANSITEM.STATUS");
		_checkConditionToken(condition,"errorstr","FKTRANS2AXTRANSITEM.ERRORSTR");
		// relationship conditions
		_checkConditionToken(condition,"fktrans2axtrans","FKTRANS2AXTRANSCODE");
		_checkConditionToken(condition,"fktrans2axtrans.code","FKTRANS2AXTRANSCODE");
		return condition.toString();
	}

	public Connection getConnection() {
		try {
			if(super.getConnection() != null && !super.getConnection().isClosed())
			return super.getConnection();

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource)initialContext.lookup(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			return dataSource.getConnection();
		}
		catch (NamingException e) {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
		catch (SQLException e)    {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
	}

	///////////// PRIVATE SECTION ///////////////
	protected static Hashtable<SequenceKey, SequenceValue> _sequenceTable = new Hashtable<SequenceKey, SequenceValue>();
	
	private void _collectAutoIncrementFields(FKTrans2AXTransItem anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("FKTRANS2AXTRANSITEM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("FKTRANS2AXTRANSITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("FKTRANS2AXTRANSITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: FKTRANS2AXTRANSITEM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of FKTrans2AXTransItemDAO
