
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
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


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.valueobject.ENSheets4SO;
import com.ksoe.energynet.valueobject.filter.ENSheets4SOFilter;
import com.ksoe.energynet.valueobject.brief.ENSheets4SOShort;
import com.ksoe.energynet.valueobject.lists.ENSheets4SOShortList;


/**
 * DAO Object for ENSheets4SO;
 *
 */

public class ENSheets4SODAOGen extends GenericDataMiner {

	public ENSheets4SODAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENSheets4SODAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENSheets4SO inObject) throws PersistenceException {
		ENSheets4SO obj = new ENSheets4SO();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numbergen == null && obj.numbergen == null){}
		else
			if(inObject.numbergen == null || obj.numbergen == null) return false;
			else
				if ( ! inObject.numbergen.equals(obj.numbergen)){
					return false;
				}

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
					return false;
				}

		if (inObject.dayscnt != obj.dayscnt){
					return false;
				}

		if(inObject.nextSheetDate == null && obj.nextSheetDate == null){} else 
			if(inObject.nextSheetDate == null || obj.nextSheetDate == null) return false;
			else
				if (inObject.nextSheetDate.compareTo(obj.nextSheetDate) != 0){
					return false;
				}

		if (inObject.isLast != obj.isLast){
					return false;
				}

		if(inObject.recipient == null && obj.recipient == null){}
		else
			if(inObject.recipient == null || obj.recipient == null) return false;
			else
				if ( ! inObject.recipient.equals(obj.recipient)){
					return false;
				}

		if(inObject.recipientAddress == null && obj.recipientAddress == null){}
		else
			if(inObject.recipientAddress == null || obj.recipientAddress == null) return false;
			else
				if ( ! inObject.recipientAddress.equals(obj.recipientAddress)){
					return false;
				}

		if(inObject.postCode == null && obj.postCode == null){}
		else
			if(inObject.postCode == null || obj.postCode == null) return false;
			else
				if ( ! inObject.postCode.equals(obj.postCode)){
					return false;
				}

		if(inObject.signerPosition == null && obj.signerPosition == null){}
		else
			if(inObject.signerPosition == null || obj.signerPosition == null) return false;
			else
				if ( ! inObject.signerPosition.equals(obj.signerPosition)){
					return false;
				}

		if(inObject.signerFio == null && obj.signerFio == null){}
		else
			if(inObject.signerFio == null || obj.signerFio == null) return false;
			else
				if ( ! inObject.signerFio.equals(obj.signerFio)){
					return false;
				}

		if(inObject.executorFio == null && obj.executorFio == null){}
		else
			if(inObject.executorFio == null || obj.executorFio == null) return false;
			else
				if ( ! inObject.executorFio.equals(obj.executorFio)){
					return false;
				}

		if(inObject.executorPhone == null && obj.executorPhone == null){}
		else
			if(inObject.executorPhone == null || obj.executorPhone == null) return false;
			else
				if ( ! inObject.executorPhone.equals(obj.executorPhone)){
					return false;
				}

		if(inObject.executorEmail == null && obj.executorEmail == null){}
		else
			if(inObject.executorEmail == null || obj.executorEmail == null) return false;
			else
				if ( ! inObject.executorEmail.equals(obj.executorEmail)){
					return false;
				}

		if(inObject.additionalText == null && obj.additionalText == null){}
		else
			if(inObject.additionalText == null || obj.additionalText == null) return false;
			else
				if ( ! inObject.additionalText.equals(obj.additionalText)){
					return false;
				}

		if (inObject.isWithSignature != obj.isWithSignature){
					return false;
				}

		if(inObject.commentgen == null && obj.commentgen == null){}
		else
			if(inObject.commentgen == null || obj.commentgen == null) return false;
			else
				if ( ! inObject.commentgen.equals(obj.commentgen)){
					return false;
				}

		if (inObject.dfDocCode != obj.dfDocCode){
					return false;
				}

		if (inObject.dfDocTypeCode != obj.dfDocTypeCode){
					return false;
				}

		if(inObject.dfDocNumber == null && obj.dfDocNumber == null){}
		else
			if(inObject.dfDocNumber == null || obj.dfDocNumber == null) return false;
			else
				if ( ! inObject.dfDocNumber.equals(obj.dfDocNumber)){
					return false;
				}

		if(inObject.dfDocDate == null && obj.dfDocDate == null){} else 
			if(inObject.dfDocDate == null || obj.dfDocDate == null) return false;
			else
				if (inObject.dfDocDate.compareTo(obj.dfDocDate) != 0){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if (inObject.wfPackCode != obj.wfPackCode){
					return false;
				}
		if (inObject.sheet4sotype.code != obj.sheet4sotype.code){
			return false;
		}
		if (inObject.attachment.code != obj.attachment.code){
			return false;
		}
		if (inObject.servicesobject.code != obj.servicesobject.code){
			return false;
		}
		return true;
	}

	public int add(ENSheets4SO anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENSheets4SO anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSHEETS4SO (CODE,NUMBERGEN,NAME,DATEGEN,DAYSCNT,NEXTSHEETDATE,ISLAST,RECIPIENT,RECIPIENTADDRESS,POSTCODE,SIGNERPOSITION,SIGNERFIO,EXECUTORFIO,EXECUTORPHONE,EXECUTOREMAIL,ADDITIONALTEXT,ISWITHSIGNATURE,COMMENTGEN,DFDOCCODE,DFDOCTYPECODE,DFDOCNUMBER,DFDOCDATE,USERGEN,DATEEDIT,MODIFY_TIME,WFPACKCODE,SHEET4SOTYPECODE,ATTACHMENTCODE,SERVICESOBJECTCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.numbergen);
			statement.setString(3, anObject.name);
			if (anObject.dateGen == null) {
				statement.setDate(4, null);
			} else {
				statement.setDate(4, new java.sql.Date(anObject.dateGen.getTime()));
			}
			if (anObject.dayscnt != Integer.MIN_VALUE ) {
				statement.setInt(5, anObject.dayscnt);
			} else {
				statement.setNull(5, java.sql.Types.INTEGER);
			}
			if (anObject.nextSheetDate == null) {
				statement.setDate(6, null);
			} else {
				statement.setDate(6, new java.sql.Date(anObject.nextSheetDate.getTime()));
			}
			if (anObject.isLast != Integer.MIN_VALUE ) {
				statement.setInt(7, anObject.isLast);
			} else {
				statement.setNull(7, java.sql.Types.INTEGER);
			}
			statement.setString(8, anObject.recipient);
			statement.setString(9, anObject.recipientAddress);
			statement.setString(10, anObject.postCode);
			statement.setString(11, anObject.signerPosition);
			statement.setString(12, anObject.signerFio);
			statement.setString(13, anObject.executorFio);
			statement.setString(14, anObject.executorPhone);
			statement.setString(15, anObject.executorEmail);
			statement.setString(16, anObject.additionalText);
			if (anObject.isWithSignature != Integer.MIN_VALUE ) {
				statement.setInt(17, anObject.isWithSignature);
			} else {
				statement.setNull(17, java.sql.Types.INTEGER);
			}
			statement.setString(18, anObject.commentgen);
			if (anObject.dfDocCode != Integer.MIN_VALUE ) {
				statement.setInt(19, anObject.dfDocCode);
			} else {
				statement.setNull(19, java.sql.Types.INTEGER);
			}
			if (anObject.dfDocTypeCode != Integer.MIN_VALUE ) {
				statement.setInt(20, anObject.dfDocTypeCode);
			} else {
				statement.setNull(20, java.sql.Types.INTEGER);
			}
			statement.setString(21, anObject.dfDocNumber);
			if (anObject.dfDocDate == null) {
				statement.setDate(22, null);
			} else {
				statement.setDate(22, new java.sql.Date(anObject.dfDocDate.getTime()));
			}
			statement.setString(23, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(24, null);
			} else {
				statement.setDate(24, new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(25, null);
			} else {
				statement.setBigDecimal(25, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.wfPackCode != Integer.MIN_VALUE ) {
				statement.setInt(26, anObject.wfPackCode);
			} else {
				statement.setNull(26, java.sql.Types.INTEGER);
			}
			if (anObject.sheet4sotype.code != Integer.MIN_VALUE){
				statement.setInt(27,anObject.sheet4sotype.code);
			} else {
				statement.setNull(27,java.sql.Types.INTEGER);
			}
			if (anObject.attachment.code != Integer.MIN_VALUE){
				statement.setInt(28,anObject.attachment.code);
			} else {
				statement.setNull(28,java.sql.Types.INTEGER);
			}
			if (anObject.servicesobject.code != Integer.MIN_VALUE){
				statement.setInt(29,anObject.servicesobject.code);
			} else {
				statement.setNull(29,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENSheets4SODAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENSheets4SO anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENSheets4SO anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENSheets4SO oldObject = new ENSheets4SO();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENSheets4SO.modify_time_Field+" FROM  ENSHEETS4SO WHERE CODE = ?";
			ResultSet set = null;
			try {
				statement = connection.prepareStatement(oldObjectSelectStr);
				statement.setInt(1,oldObject.code);
				set = statement.executeQuery();
				if(!set.next()) {
					throw new PersistenceException("Can't get old object.");
				}
				oldObject.modify_time = set.getLong(1);
				if(set.wasNull()) {
					oldObject.modify_time = Long.MIN_VALUE;
				}
			} catch(SQLException e) {
				System.out.println(e.getMessage()+"\nstatement - "+oldObjectSelectStr);
				throw new SystemException(e.getMessage(), e);
			} finally {
				try {if (set != null) set.close();} catch (SQLException e) {}
				try {if (statement != null) statement.close();} catch (SQLException e) {}
				statement = null;
			}
			if(oldObject.modify_time != anObject.modify_time) {
				throw new PersistenceException("Can't update object (optimistic locking).");
			}
			anObject.modify_time = System.currentTimeMillis();

			String selectStr;

			Vector<String> fields = null;
			if(anAttributes != null) {
				String fieldNameStr;
				fields = new Vector<String>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NUMBERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DAYSCNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NEXTSHEETDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISLAST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RECIPIENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RECIPIENTADDRESS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POSTCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SIGNERPOSITION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SIGNERFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTORFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTORPHONE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTOREMAIL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ADDITIONALTEXT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISWITHSIGNATURE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCTYPECODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WFPACKCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SHEET4SOTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ATTACHMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESOBJECT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSHEETS4SO SET  NUMBERGEN = ? , NAME = ? , DATEGEN = ? , DAYSCNT = ? , NEXTSHEETDATE = ? , ISLAST = ? , RECIPIENT = ? , RECIPIENTADDRESS = ? , POSTCODE = ? , SIGNERPOSITION = ? , SIGNERFIO = ? , EXECUTORFIO = ? , EXECUTORPHONE = ? , EXECUTOREMAIL = ? , ADDITIONALTEXT = ? , ISWITHSIGNATURE = ? , COMMENTGEN = ? , DFDOCCODE = ? , DFDOCTYPECODE = ? , DFDOCNUMBER = ? , DFDOCDATE = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , WFPACKCODE = ? , SHEET4SOTYPECODE = ? , ATTACHMENTCODE = ? , SERVICESOBJECTCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSHEETS4SO SET ";
				for(int fldIndex = 0;fldIndex < fields.size();fldIndex++) {
					if(fldIndex > 0) {
						selectStr+=", ";
					}
					selectStr+=(String)fields.get(fldIndex);
					selectStr+=" = ?";
				}
				selectStr += " WHERE CODE = ?";
			}

			statement = null;
			try {
				statement = connection.prepareStatement(selectStr);
				if(fields == null) {
					statement.setString(1, anObject.numbergen);
					statement.setString(2, anObject.name);
					if (anObject.dateGen == null) {
						statement.setDate(3, null);
					} else {
						statement.setDate(3, new java.sql.Date(anObject.dateGen.getTime()));
					}
					if (anObject.dayscnt != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.dayscnt);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					if (anObject.nextSheetDate == null) {
						statement.setDate(5, null);
					} else {
						statement.setDate(5, new java.sql.Date(anObject.nextSheetDate.getTime()));
					}
					if (anObject.isLast != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.isLast);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					statement.setString(7, anObject.recipient);
					statement.setString(8, anObject.recipientAddress);
					statement.setString(9, anObject.postCode);
					statement.setString(10, anObject.signerPosition);
					statement.setString(11, anObject.signerFio);
					statement.setString(12, anObject.executorFio);
					statement.setString(13, anObject.executorPhone);
					statement.setString(14, anObject.executorEmail);
					statement.setString(15, anObject.additionalText);
					if (anObject.isWithSignature != Integer.MIN_VALUE) {
						statement.setInt(16, anObject.isWithSignature);
					} else {
						statement.setNull(16, java.sql.Types.INTEGER);
					}
					statement.setString(17, anObject.commentgen);
					if (anObject.dfDocCode != Integer.MIN_VALUE) {
						statement.setInt(18, anObject.dfDocCode);
					} else {
						statement.setNull(18, java.sql.Types.INTEGER);
					}
					if (anObject.dfDocTypeCode != Integer.MIN_VALUE) {
						statement.setInt(19, anObject.dfDocTypeCode);
					} else {
						statement.setNull(19, java.sql.Types.INTEGER);
					}
					statement.setString(20, anObject.dfDocNumber);
					if (anObject.dfDocDate == null) {
						statement.setDate(21, null);
					} else {
						statement.setDate(21, new java.sql.Date(anObject.dfDocDate.getTime()));
					}
					statement.setString(22, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(23, null);
					} else {
						statement.setDate(23, new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(24, null);
					} else {
						statement.setBigDecimal(24, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.wfPackCode != Integer.MIN_VALUE) {
						statement.setInt(25, anObject.wfPackCode);
					} else {
						statement.setNull(25, java.sql.Types.INTEGER);
					}
					if (anObject.sheet4sotype.code != Integer.MIN_VALUE) {
						statement.setInt(26, anObject.sheet4sotype.code);
					} else {
						statement.setNull(26, java.sql.Types.INTEGER);
					}
					if (anObject.attachment.code != Integer.MIN_VALUE) {
						statement.setInt(27, anObject.attachment.code);
					} else {
						statement.setNull(27, java.sql.Types.INTEGER);
					}
					if (anObject.servicesobject.code != Integer.MIN_VALUE) {
						statement.setInt(28, anObject.servicesobject.code);
					} else {
						statement.setNull(28, java.sql.Types.INTEGER);
					}
					statement.setInt(29, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.numbergen);
							continue;
						}
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name);
							continue;
						}
						if("DATEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateGen == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateGen.getTime()));
							}
							continue;
						}
						if("DAYSCNT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.dayscnt);
							continue;
						}
						if("NEXTSHEETDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.nextSheetDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.nextSheetDate.getTime()));
							}
							continue;
						}
						if("ISLAST".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isLast);
							continue;
						}
						if("RECIPIENT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.recipient);
							continue;
						}
						if("RECIPIENTADDRESS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.recipientAddress);
							continue;
						}
						if("POSTCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.postCode);
							continue;
						}
						if("SIGNERPOSITION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.signerPosition);
							continue;
						}
						if("SIGNERFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.signerFio);
							continue;
						}
						if("EXECUTORFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.executorFio);
							continue;
						}
						if("EXECUTORPHONE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.executorPhone);
							continue;
						}
						if("EXECUTOREMAIL".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.executorEmail);
							continue;
						}
						if("ADDITIONALTEXT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.additionalText);
							continue;
						}
						if("ISWITHSIGNATURE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isWithSignature);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentgen);
							continue;
						}
						if("DFDOCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.dfDocCode);
							continue;
						}
						if("DFDOCTYPECODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.dfDocTypeCode);
							continue;
						}
						if("DFDOCNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.dfDocNumber);
							continue;
						}
						if("DFDOCDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dfDocDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dfDocDate.getTime()));
							}
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1, null);
							} else {
								statement.setBigDecimal(i+1, new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("WFPACKCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.wfPackCode);
							continue;
						}
						if("SHEET4SOTYPE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sheet4sotype.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.sheet4sotype.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ATTACHMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.attachment.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.attachment.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("SERVICESOBJECT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesobject.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.servicesobject.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
					}
					statement.setInt(fields.size()+1, anObject.code);
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

	} // end of save(ENSheets4SO anObject,String[] anAttributes)


	public ENSheets4SOShort getShortObject(int anObjectCode) throws PersistenceException {
		ENSheets4SO filterObject = new ENSheets4SO();
		Vector<ENSheets4SOShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENSheets4SOShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENSheets4SO filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numbergen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.dayscnt, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.nextSheetDate, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isLast, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.recipient, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.recipientAddress, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.postCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.signerPosition, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.signerFio, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executorFio, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executorPhone, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executorEmail, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.additionalText, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isWithSignature, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentgen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.dfDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.dfDocTypeCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.dfDocNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dfDocDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.wfPackCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.sheet4sotype.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.attachment.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesobject.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENSheets4SOFilter filter) {
		String out = buildCondition((ENSheets4SO)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENSheets4SO filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENSheets4SO.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numbergen, ENSheets4SO.numbergen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENSheets4SO.name_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENSheets4SO.dateGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.dayscnt, ENSheets4SO.dayscnt_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.nextSheetDate, ENSheets4SO.nextSheetDate_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isLast, ENSheets4SO.isLast_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.recipient, ENSheets4SO.recipient_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.recipientAddress, ENSheets4SO.recipientAddress_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.postCode, ENSheets4SO.postCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.signerPosition, ENSheets4SO.signerPosition_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.signerFio, ENSheets4SO.signerFio_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executorFio, ENSheets4SO.executorFio_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executorPhone, ENSheets4SO.executorPhone_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executorEmail, ENSheets4SO.executorEmail_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.additionalText, ENSheets4SO.additionalText_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isWithSignature, ENSheets4SO.isWithSignature_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentgen, ENSheets4SO.commentgen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.dfDocCode, ENSheets4SO.dfDocCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.dfDocTypeCode, ENSheets4SO.dfDocTypeCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.dfDocNumber, ENSheets4SO.dfDocNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dfDocDate, ENSheets4SO.dfDocDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENSheets4SO.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENSheets4SO.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENSheets4SO.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.wfPackCode, ENSheets4SO.wfPackCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sheet4sotype.code, ENSheets4SO.sheet4sotype_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.attachment.code, ENSheets4SO.attachment_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesobject.code, ENSheets4SO.servicesobject_QFielld, out);
		}
		return out;
	}

	public ENSheets4SOShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENSheets4SOShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENSheets4SOShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENSheets4SOShortList getFilteredList(ENSheets4SO filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENSheets4SOShortList getScrollableFilteredList(ENSheets4SO aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENSheets4SOShortList getScrollableFilteredList(ENSheets4SO aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENSheets4SOShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENSheets4SOShortList getScrollableFilteredList(ENSheets4SOFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENSheets4SOShortList getScrollableFilteredList(ENSheets4SOFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENSheets4SOShortList getScrollableFilteredList(ENSheets4SO aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENSheets4SOShortList result = new ENSheets4SOShortList();
		ENSheets4SOShort anObject;
		result.list = new Vector<ENSheets4SOShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSHEETS4SO.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSHEETS4SO.CODE"+
			",ENSHEETS4SO.NUMBERGEN"+
			",ENSHEETS4SO.NAME"+
			",ENSHEETS4SO.DATEGEN"+
			",ENSHEETS4SO.DAYSCNT"+
			",ENSHEETS4SO.NEXTSHEETDATE"+
			",ENSHEETS4SO.ISLAST"+
			",ENSHEETS4SO.RECIPIENT"+
			",ENSHEETS4SO.RECIPIENTADDRESS"+
			",ENSHEETS4SO.POSTCODE"+
			",ENSHEETS4SO.SIGNERPOSITION"+
			",ENSHEETS4SO.SIGNERFIO"+
			",ENSHEETS4SO.EXECUTORFIO"+
			",ENSHEETS4SO.EXECUTORPHONE"+
			",ENSHEETS4SO.EXECUTOREMAIL"+
			",ENSHEETS4SO.ADDITIONALTEXT"+
			",ENSHEETS4SO.ISWITHSIGNATURE"+
			",ENSHEETS4SO.COMMENTGEN"+
			",ENSHEETS4SO.DFDOCCODE"+
			",ENSHEETS4SO.DFDOCTYPECODE"+
			",ENSHEETS4SO.DFDOCNUMBER"+
			",ENSHEETS4SO.DFDOCDATE"+
			",ENSHEETS4SO.USERGEN"+
			",ENSHEETS4SO.DATEEDIT"+
			",ENSHEETS4SO.WFPACKCODE"+
			", ENSHEETS4SOTYPE.CODE " +
			", ENSHEETS4SOTYPE.NAME " +
			", ENSHEETS4SOTYPE.NAMEFORDFDOC " +
			", ENSHEETS4SOTYPE.DFDOCNUMMASK " +
			", ENSHEETS4SOTYPE.DFDEPARTMENTCODE " +
			", ENSHEETS4SOTYPE.EXECUTORFIO " +
			", ENSHEETS4SOTYPE.EXECUTORPHONE " +
			", ENSHEETS4SOTYPE.EXECUTOREMAIL " +
			", ENSHEETS4SOTYPE.REPORTPATH " +
			", ENSHEETS4SOTYPE.REPORTFILENAME " +
			", ENSHEETS4SOTYPE.REPORTTYPE " +
			", ENSHEETS4SOTYPE.COMMENTGEN " +
			", ENDOCATTACHMENT.CODE " +
			", ENDOCATTACHMENT.COMMENTGEN " +
			", ENDOCATTACHMENT.FILELINK " +
			", ENDOCATTACHMENT.FILESIZE " +
			", ENDOCATTACHMENT.SIGNINGSTATUS " +
			", ENDOCATTACHMENT.USERADD " +
			", ENDOCATTACHMENT.DATEADD " +
			", ENDOCATTACHMENT.USERGEN " +
			", ENDOCATTACHMENT.DATEEDIT " +
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
			", ENSERVICESOBJECT.CUSTOMERMAILINGADDRESS " +
			", ENSERVICESOBJECT.POWERGENERATION " +
			", ENSERVICESOBJECT.POSTCODE " +
			", ENSERVICESOBJECT.CUSTOMEREMAIL " +
			", ENSERVICESOBJECT.DEMOGRAPHICCODE " +
			", ENSERVICESOBJECT.OWNERSHIPRECORDNUMBER " +
			", ENSERVICESOBJECT.REALESTATEREGNUMBER " +
		" FROM ENSHEETS4SO " +
			" LEFT JOIN ENSHEETS4SOTYPE on ENSHEETS4SOTYPE.CODE = ENSHEETS4SO.SHEET4SOTYPECODE "+
			" LEFT JOIN ENDOCATTACHMENT on ENDOCATTACHMENT.CODE = ENSHEETS4SO.ATTACHMENTCODE "+
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENSHEETS4SO.SERVICESOBJECTCODE "+
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
				anObject = new ENSheets4SOShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numbergen = set.getString(2);
				anObject.name = set.getString(3);
				anObject.dateGen = set.getDate(4);
				anObject.dayscnt = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.dayscnt = Integer.MIN_VALUE;
				}
				anObject.nextSheetDate = set.getDate(6);
				anObject.isLast = set.getInt(7);
				if ( set.wasNull() ) {
					anObject.isLast = Integer.MIN_VALUE;
				}
				anObject.recipient = set.getString(8);
				anObject.recipientAddress = set.getString(9);
				anObject.postCode = set.getString(10);
				anObject.signerPosition = set.getString(11);
				anObject.signerFio = set.getString(12);
				anObject.executorFio = set.getString(13);
				anObject.executorPhone = set.getString(14);
				anObject.executorEmail = set.getString(15);
				anObject.additionalText = set.getString(16);
				anObject.isWithSignature = set.getInt(17);
				if ( set.wasNull() ) {
					anObject.isWithSignature = Integer.MIN_VALUE;
				}
				anObject.commentgen = set.getString(18);
				anObject.dfDocCode = set.getInt(19);
				if ( set.wasNull() ) {
					anObject.dfDocCode = Integer.MIN_VALUE;
				}
				anObject.dfDocTypeCode = set.getInt(20);
				if ( set.wasNull() ) {
					anObject.dfDocTypeCode = Integer.MIN_VALUE;
				}
				anObject.dfDocNumber = set.getString(21);
				anObject.dfDocDate = set.getDate(22);
				anObject.userGen = set.getString(23);
				anObject.dateEdit = set.getDate(24);
				anObject.wfPackCode = set.getInt(25);
				if ( set.wasNull() ) {
					anObject.wfPackCode = Integer.MIN_VALUE;
				}

				anObject.sheet4sotypeCode = set.getInt(26);
				if(set.wasNull()) {
					anObject.sheet4sotypeCode = Integer.MIN_VALUE;
				}
				anObject.sheet4sotypeName = set.getString(27);
				anObject.sheet4sotypeNameForDfDoc = set.getString(28);
				anObject.sheet4sotypeDfDocNumMask = set.getString(29);
				anObject.sheet4sotypeDfDepartmentCode = set.getInt(30);
				if(set.wasNull()) {
					anObject.sheet4sotypeDfDepartmentCode = Integer.MIN_VALUE;
				}
				anObject.sheet4sotypeExecutorFio = set.getString(31);
				anObject.sheet4sotypeExecutorPhone = set.getString(32);
				anObject.sheet4sotypeExecutorEmail = set.getString(33);
				anObject.sheet4sotypeReportPath = set.getString(34);
				anObject.sheet4sotypeReportFileName = set.getString(35);
				anObject.sheet4sotypeReportType = set.getString(36);
				anObject.sheet4sotypeCommentGen = set.getString(37);
				anObject.attachmentCode = set.getInt(38);
				if(set.wasNull()) {
					anObject.attachmentCode = Integer.MIN_VALUE;
				}
				anObject.attachmentCommentGen = set.getString(39);
				anObject.attachmentFileLink = set.getString(40);
				anObject.attachmentFilesize = set.getLong(41);
				if(set.wasNull()) {
					anObject.attachmentFilesize = Long.MIN_VALUE;
				}
				anObject.attachmentSigningStatus = set.getInt(42);
				if(set.wasNull()) {
					anObject.attachmentSigningStatus = Integer.MIN_VALUE;
				}
				anObject.attachmentUserAdd = set.getString(43);
				anObject.attachmentDateAdd = set.getTimestamp(44);
				anObject.attachmentUserGen = set.getString(45);
				anObject.attachmentDateEdit = set.getTimestamp(46);
				anObject.servicesobjectCode = set.getInt(47);
				if(set.wasNull()) {
					anObject.servicesobjectCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectContractNumber = set.getString(48);
				anObject.servicesobjectContractDate = set.getDate(49);
				anObject.servicesobjectName = set.getString(50);
				anObject.servicesobjectPartnerCode = set.getString(51);
				anObject.servicesobjectFinDocCode = set.getString(52);
				anObject.servicesobjectFinDocID = set.getInt(53);
				if(set.wasNull()) {
					anObject.servicesobjectFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCommentGen = set.getString(54);
				anObject.servicesobjectContractNumberServices = set.getString(55);
				anObject.servicesobjectContractDateServices = set.getDate(56);
				anObject.servicesobjectContragentName = set.getString(57);
				anObject.servicesobjectContragentAddress = set.getString(58);
				anObject.servicesobjectContragentAddressWork = set.getString(59);
				anObject.servicesobjectContragentOkpo = set.getString(60);
				anObject.servicesobjectContragentBankAccount = set.getString(61);
				anObject.servicesobjectContragentBankName = set.getString(62);
				anObject.servicesobjectContragentBankMfo = set.getString(63);
				anObject.servicesobjectContragentBossName = set.getString(64);
				anObject.servicesobjectContragentPassport = set.getString(65);
				anObject.servicesobjectContractServicesSumma = set.getBigDecimal(66);
				if(anObject.servicesobjectContractServicesSumma != null) {
					anObject.servicesobjectContractServicesSumma = anObject.servicesobjectContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesSummaVAT = set.getBigDecimal(67);
				if(anObject.servicesobjectContractServicesSummaVAT != null) {
					anObject.servicesobjectContractServicesSummaVAT = anObject.servicesobjectContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesPower = set.getBigDecimal(68);
				if(anObject.servicesobjectContractServicesPower != null) {
					anObject.servicesobjectContractServicesPower = anObject.servicesobjectContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCommentServicesGen = set.getString(69);
				anObject.servicesobjectContractServicesDistance = set.getBigDecimal(70);
				if(anObject.servicesobjectContractServicesDistance != null) {
					anObject.servicesobjectContractServicesDistance = anObject.servicesobjectContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesDay = set.getBigDecimal(71);
				if(anObject.servicesobjectContractServicesDay != null) {
					anObject.servicesobjectContractServicesDay = anObject.servicesobjectContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectUserGen = set.getString(72);
				anObject.servicesobjectDateEdit = set.getDate(73);
				anObject.servicesobjectWarrantDate = set.getDate(74);
				anObject.servicesobjectWarrantNumber = set.getString(75);
				anObject.servicesobjectWarrantFIO = set.getString(76);
				anObject.servicesobjectRegionalType = set.getInt(77);
				if(set.wasNull()) {
					anObject.servicesobjectRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBasisType = set.getBigDecimal(78);
				if(anObject.servicesobjectBasisType != null) {
					anObject.servicesobjectBasisType = anObject.servicesobjectBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContragentPosition = set.getString(79);
				anObject.servicesobjectExecuteWorkDate = set.getDate(80);
				anObject.servicesobjectTimeStart = set.getTimestamp(81);
				anObject.servicesobjectTimeFinal = set.getTimestamp(82);
				anObject.servicesobjectContragentPhoneNumber = set.getString(83);
				anObject.servicesobjectExecutorPhoneNumber = set.getString(84);
				anObject.servicesobjectContragentObjectWork = set.getString(85);
				anObject.servicesobjectIsNoPay = set.getInt(86);
				if(set.wasNull()) {
					anObject.servicesobjectIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectIsCustomerMaterials = set.getInt(87);
				if(set.wasNull()) {
					anObject.servicesobjectIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDate = set.getDate(88);
				anObject.servicesobjectFinPayFormCode = set.getInt(89);
				if(set.wasNull()) {
					anObject.servicesobjectFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFinPayFormName = set.getString(90);
				anObject.servicesobjectPartnerId = set.getInt(91);
				if(set.wasNull()) {
					anObject.servicesobjectPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDetail = set.getString(92);
				anObject.servicesobjectActTransferNumber = set.getString(93);
				anObject.servicesobjectActTransferDate = set.getDate(94);
				anObject.servicesobjectResposible = set.getString(95);
				anObject.servicesobjectResposiblePosition = set.getString(96);
				anObject.servicesobjectResposibleTabNumber = set.getString(97);
				anObject.servicesobjectPrevContractStatus = set.getInt(98);
				if(set.wasNull()) {
					anObject.servicesobjectPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesobjectReconnectionTU = set.getInt(99);
				if(set.wasNull()) {
					anObject.servicesobjectReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountCode = set.getInt(100);
				if(set.wasNull()) {
					anObject.servicesobjectPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountNumber = set.getString(101);
				anObject.servicesobjectTabNumber = set.getString(102);
				anObject.servicesobjectCitiesList = set.getString(103);
				anObject.servicesobjectLineLength = set.getBigDecimal(104);
				if(anObject.servicesobjectLineLength != null) {
					anObject.servicesobjectLineLength = anObject.servicesobjectLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectProjectCode = set.getString(105);
				anObject.servicesobjectCnPackCode = set.getInt(106);
				if(set.wasNull()) {
					anObject.servicesobjectCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectDfPackCode = set.getInt(107);
				if(set.wasNull()) {
					anObject.servicesobjectDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCountersZoneType = set.getInt(108);
				if(set.wasNull()) {
					anObject.servicesobjectCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectAxPartnerCode = set.getString(109);
				anObject.servicesobjectAxPartnerName = set.getString(110);
				anObject.servicesobjectAxContractNumber = set.getString(111);
				anObject.servicesobjectAxContractDate = set.getDate(112);
				anObject.servicesobjectAxContractCode = set.getString(113);
				anObject.servicesobjectAxContractId = set.getString(114);
				anObject.servicesobjectAxContractCommentGen = set.getString(115);
				anObject.servicesobjectProjAgreeSumma = set.getBigDecimal(116);
				if(anObject.servicesobjectProjAgreeSumma != null) {
					anObject.servicesobjectProjAgreeSumma = anObject.servicesobjectProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectTopographySumma = set.getBigDecimal(117);
				if(anObject.servicesobjectTopographySumma != null) {
					anObject.servicesobjectTopographySumma = anObject.servicesobjectTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCreatedFromSite = set.getInt(118);
				if(set.wasNull()) {
					anObject.servicesobjectCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesobjectTerm = set.getInt(119);
				if(set.wasNull()) {
					anObject.servicesobjectTerm = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRegulation = set.getInt(120);
				if(set.wasNull()) {
					anObject.servicesobjectRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBoundaryDateWork = set.getDate(121);
				anObject.servicesobjectCountDayDelay = set.getInt(122);
				if(set.wasNull()) {
					anObject.servicesobjectCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFactDateWork = set.getDate(123);
				anObject.servicesobjectCodeEIC = set.getString(124);
				anObject.servicesobjectPersonalAccountUid = set.getString(125);
				anObject.servicesobjectCustomerMailingAddress = set.getString(126);
				anObject.servicesobjectPowerGeneration = set.getBigDecimal(127);
				if(anObject.servicesobjectPowerGeneration != null) {
					anObject.servicesobjectPowerGeneration = anObject.servicesobjectPowerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectPostCode = set.getString(128);
				anObject.servicesobjectCustomerEmail = set.getString(129);
				anObject.servicesobjectDemographicCode = set.getString(130);
				anObject.servicesobjectOwnershipRecordNumber = set.getString(131);
				anObject.servicesobjectRealEstateRegNumber = set.getString(132);

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
	
	public int[] getFilteredCodeArray(ENSheets4SOFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENSheets4SOFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENSheets4SO aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSHEETS4SO.CODE FROM ENSHEETS4SO";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSHEETS4SO.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);

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
				/*if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}*/
				result.add(set.getInt(1));
			}

			int[] array = new int[result.size()];
			for(int j = 0;j < result.size();j++) {
				array[j] = result.get(j);
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


	public ENSheets4SO getObject(int uid) throws PersistenceException {
		ENSheets4SO result = new ENSheets4SO();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENSheets4SO anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENSHEETS4SO.CODE, ENSHEETS4SO.NUMBERGEN, ENSHEETS4SO.NAME, ENSHEETS4SO.DATEGEN, ENSHEETS4SO.DAYSCNT, ENSHEETS4SO.NEXTSHEETDATE, ENSHEETS4SO.ISLAST, ENSHEETS4SO.RECIPIENT, ENSHEETS4SO.RECIPIENTADDRESS, ENSHEETS4SO.POSTCODE, ENSHEETS4SO.SIGNERPOSITION, ENSHEETS4SO.SIGNERFIO, ENSHEETS4SO.EXECUTORFIO, ENSHEETS4SO.EXECUTORPHONE, ENSHEETS4SO.EXECUTOREMAIL, ENSHEETS4SO.ADDITIONALTEXT, ENSHEETS4SO.ISWITHSIGNATURE, ENSHEETS4SO.COMMENTGEN, ENSHEETS4SO.DFDOCCODE, ENSHEETS4SO.DFDOCTYPECODE, ENSHEETS4SO.DFDOCNUMBER, ENSHEETS4SO.DFDOCDATE, ENSHEETS4SO.USERGEN, ENSHEETS4SO.DATEEDIT, ENSHEETS4SO.MODIFY_TIME, ENSHEETS4SO.WFPACKCODE, ENSHEETS4SO.SHEET4SOTYPECODE, ENSHEETS4SO.ATTACHMENTCODE, ENSHEETS4SO.SERVICESOBJECTCODE "
			+" FROM ENSHEETS4SO WHERE ENSHEETS4SO.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.numbergen = set.getString(2);
				anObject.name = set.getString(3);
				anObject.dateGen = set.getDate(4);
				anObject.dayscnt = set.getInt(5);
				if (set.wasNull()) {
					anObject.dayscnt = Integer.MIN_VALUE;
				}
				anObject.nextSheetDate = set.getDate(6);
				anObject.isLast = set.getInt(7);
				if (set.wasNull()) {
					anObject.isLast = Integer.MIN_VALUE;
				}
				anObject.recipient = set.getString(8);
				anObject.recipientAddress = set.getString(9);
				anObject.postCode = set.getString(10);
				anObject.signerPosition = set.getString(11);
				anObject.signerFio = set.getString(12);
				anObject.executorFio = set.getString(13);
				anObject.executorPhone = set.getString(14);
				anObject.executorEmail = set.getString(15);
				anObject.additionalText = set.getString(16);
				anObject.isWithSignature = set.getInt(17);
				if (set.wasNull()) {
					anObject.isWithSignature = Integer.MIN_VALUE;
				}
				anObject.commentgen = set.getString(18);
				anObject.dfDocCode = set.getInt(19);
				if (set.wasNull()) {
					anObject.dfDocCode = Integer.MIN_VALUE;
				}
				anObject.dfDocTypeCode = set.getInt(20);
				if (set.wasNull()) {
					anObject.dfDocTypeCode = Integer.MIN_VALUE;
				}
				anObject.dfDocNumber = set.getString(21);
				anObject.dfDocDate = set.getDate(22);
				anObject.userGen = set.getString(23);
				anObject.dateEdit = set.getDate(24);
				anObject.modify_time = set.getLong(25);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.wfPackCode = set.getInt(26);
				if (set.wasNull()) {
					anObject.wfPackCode = Integer.MIN_VALUE;
				}
				anObject.sheet4sotype.code = set.getInt(27);
				if (set.wasNull()) {
					anObject.sheet4sotype.code = Integer.MIN_VALUE;
				}
				anObject.attachment.code = set.getInt(28);
				if (set.wasNull()) {
					anObject.attachment.code = Integer.MIN_VALUE;
				}
				anObject.servicesobject.code = set.getInt(29);
				if (set.wasNull()) {
					anObject.servicesobject.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENSheets4SORef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENSheets4SORef ref = new com.ksoe.energynet.valueobject.references.ENSheets4SORef();
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

		selectStr = "DELETE FROM  ENSHEETS4SO WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENSheets4SO object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENSheets4SO.getObject%} access denied");
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
	
	public long count(ENSheets4SOFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENSheets4SOFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENSheets4SOFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSHEETS4SO", aggFunction, column);
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
	public <E> E getProperty(String propertyName, int code, E defaultValue) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet set = null;
		String sql = String.format("SELECT %s FROM ENSHEETS4SO WHERE code = ?", propertyName);
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			statement.setInt(1, code);
			set = statement.executeQuery();
			if(set.next()) {
				return (E)set.getObject(1);
			} else {
				return defaultValue;
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - " + sql);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			try{if(connection != null && !connection.isClosed())connection.close();} catch(SQLException e){}
		}
	}
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSheets4SOFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSheets4SOFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSHEETS4SO");
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
		
		if(filter.getOrderBySQL() != null && filter.getOrderBySQL().trim().length() > 0) {
			sql += " ORDER BY " + filter.getOrderBySQL();
		}
		
		sql += " OFFSET " + fromPosition;
		
		if(quantity > -1) {
			sql += " LIMIT " + quantity;
		}
		
		try {
			statement = connection.prepareStatement(sql);
			int number = setParameters(filter, statement);

			if(bindObjects != null) {
				_bindObjectsToPreparedStatement(statement,new Vector<Object>(bindObjects),number);
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
		
		selectStr =
			"SELECT  ENSHEETS4SO.CODE FROM  ENSHEETS4SO WHERE  ENSHEETS4SO.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSHEETS4SO.CODE");
		_checkConditionToken(condition,"numbergen","ENSHEETS4SO.NUMBERGEN");
		_checkConditionToken(condition,"name","ENSHEETS4SO.NAME");
		_checkConditionToken(condition,"dategen","ENSHEETS4SO.DATEGEN");
		_checkConditionToken(condition,"dayscnt","ENSHEETS4SO.DAYSCNT");
		_checkConditionToken(condition,"nextsheetdate","ENSHEETS4SO.NEXTSHEETDATE");
		_checkConditionToken(condition,"islast","ENSHEETS4SO.ISLAST");
		_checkConditionToken(condition,"recipient","ENSHEETS4SO.RECIPIENT");
		_checkConditionToken(condition,"recipientaddress","ENSHEETS4SO.RECIPIENTADDRESS");
		_checkConditionToken(condition,"postcode","ENSHEETS4SO.POSTCODE");
		_checkConditionToken(condition,"signerposition","ENSHEETS4SO.SIGNERPOSITION");
		_checkConditionToken(condition,"signerfio","ENSHEETS4SO.SIGNERFIO");
		_checkConditionToken(condition,"executorfio","ENSHEETS4SO.EXECUTORFIO");
		_checkConditionToken(condition,"executorphone","ENSHEETS4SO.EXECUTORPHONE");
		_checkConditionToken(condition,"executoremail","ENSHEETS4SO.EXECUTOREMAIL");
		_checkConditionToken(condition,"additionaltext","ENSHEETS4SO.ADDITIONALTEXT");
		_checkConditionToken(condition,"iswithsignature","ENSHEETS4SO.ISWITHSIGNATURE");
		_checkConditionToken(condition,"commentgen","ENSHEETS4SO.COMMENTGEN");
		_checkConditionToken(condition,"dfdoccode","ENSHEETS4SO.DFDOCCODE");
		_checkConditionToken(condition,"dfdoctypecode","ENSHEETS4SO.DFDOCTYPECODE");
		_checkConditionToken(condition,"dfdocnumber","ENSHEETS4SO.DFDOCNUMBER");
		_checkConditionToken(condition,"dfdocdate","ENSHEETS4SO.DFDOCDATE");
		_checkConditionToken(condition,"usergen","ENSHEETS4SO.USERGEN");
		_checkConditionToken(condition,"dateedit","ENSHEETS4SO.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENSHEETS4SO.MODIFY_TIME");
		_checkConditionToken(condition,"wfpackcode","ENSHEETS4SO.WFPACKCODE");
		// relationship conditions
		_checkConditionToken(condition,"sheet4sotype","SHEET4SOTYPECODE");
		_checkConditionToken(condition,"sheet4sotype.code","SHEET4SOTYPECODE");
		_checkConditionToken(condition,"attachment","ATTACHMENTCODE");
		_checkConditionToken(condition,"attachment.code","ATTACHMENTCODE");
		_checkConditionToken(condition,"servicesobject","SERVICESOBJECTCODE");
		_checkConditionToken(condition,"servicesobject.code","SERVICESOBJECTCODE");
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
	
	private void _collectAutoIncrementFields(ENSheets4SO anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSHEETS4SO", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSHEETS4SO", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSHEETS4SO", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSHEETS4SO");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENSheets4SODAO
