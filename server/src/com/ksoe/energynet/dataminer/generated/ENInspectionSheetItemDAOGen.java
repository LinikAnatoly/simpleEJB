
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
import com.ksoe.energynet.valueobject.ENInspectionSheetItem;
import com.ksoe.energynet.valueobject.filter.ENInspectionSheetItemFilter;
import com.ksoe.energynet.valueobject.brief.ENInspectionSheetItemShort;
import com.ksoe.energynet.valueobject.lists.ENInspectionSheetItemShortList;


/**
 * DAO Object for ENInspectionSheetItem;
 *
 */

public class ENInspectionSheetItemDAOGen extends GenericDataMiner {

	public ENInspectionSheetItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENInspectionSheetItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENInspectionSheetItem inObject) throws PersistenceException {
		ENInspectionSheetItem obj = new ENInspectionSheetItem();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.defectCode == null && obj.defectCode == null){}
		else
			if(inObject.defectCode == null || obj.defectCode == null) return false;
			else
				if ( ! inObject.defectCode.equals(obj.defectCode)){
					return false;
				}

		if(inObject.defectName == null && obj.defectName == null){}
		else
			if(inObject.defectName == null || obj.defectName == null) return false;
			else
				if ( ! inObject.defectName.equals(obj.defectName)){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if (inObject.isDetecting != obj.isDetecting){
					return false;
				}

		if(inObject.countGen == null && obj.countGen == null){}
		else
			if(inObject.countGen == null || obj.countGen == null) return false;
			else
				if ( ! inObject.countGen.equals(obj.countGen)){
					return false;
				}

		if(inObject.countDefects == null && obj.countDefects == null){}
		else
			if(inObject.countDefects == null || obj.countDefects == null) return false;
			else
				if ( ! inObject.countDefects.equals(obj.countDefects)){
					return false;
				}

		if(inObject.defectLength == null && obj.defectLength == null){}
		else
			if(inObject.defectLength == null || obj.defectLength == null) return false;
			else
				if ( ! inObject.defectLength.equals(obj.defectLength)){
					return false;
				}

		if(inObject.coefficientKi == null && obj.coefficientKi == null){}
		else
			if(inObject.coefficientKi == null || obj.coefficientKi == null) return false;
			else
				if ( ! inObject.coefficientKi.equals(obj.coefficientKi)){
					return false;
				}

		if(inObject.pointsPi == null && obj.pointsPi == null){}
		else
			if(inObject.pointsPi == null || obj.pointsPi == null) return false;
			else
				if ( ! inObject.pointsPi.equals(obj.pointsPi)){
					return false;
				}

		if(inObject.weightXi == null && obj.weightXi == null){}
		else
			if(inObject.weightXi == null || obj.weightXi == null) return false;
			else
				if ( ! inObject.weightXi.equals(obj.weightXi)){
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
		if (inObject.sheetRef.code != obj.sheetRef.code){
			return false;
		}
		if (inObject.classificationTypeRef.code != obj.classificationTypeRef.code){
			return false;
		}
		if (inObject.elementRef.code != obj.elementRef.code){
			return false;
		}
		return true;
	}

	public int add(ENInspectionSheetItem anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENInspectionSheetItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENINSPECTIONSHEETITEM (CODE,DEFECTCODE,DEFECTNAME,COMMENTGEN,ISDETECTING,COUNTGEN,COUNTDEFECTS,DEFECTLENGTH,COEFFICIENTKI,POINTSPI,WEIGHTXI,USERGEN,DATEEDIT,MODIFY_TIME,SHEETREFCODE,CLASSIFICATIONTYPERFCD,ELEMENTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.defectCode);
			statement.setString(3, anObject.defectName);
			statement.setString(4, anObject.commentGen);
			if (anObject.isDetecting != Integer.MIN_VALUE ) {
				statement.setInt(5, anObject.isDetecting);
			} else {
				statement.setNull(5, java.sql.Types.INTEGER);
			}
			if (anObject.countGen != null) {
				anObject.countGen = anObject.countGen.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6, anObject.countGen);
			if (anObject.countDefects != null) {
				anObject.countDefects = anObject.countDefects.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7, anObject.countDefects);
			if (anObject.defectLength != null) {
				anObject.defectLength = anObject.defectLength.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8, anObject.defectLength);
			if (anObject.coefficientKi != null) {
				anObject.coefficientKi = anObject.coefficientKi.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9, anObject.coefficientKi);
			if (anObject.pointsPi != null) {
				anObject.pointsPi = anObject.pointsPi.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10, anObject.pointsPi);
			if (anObject.weightXi != null) {
				anObject.weightXi = anObject.weightXi.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11, anObject.weightXi);
			statement.setString(12, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(13, null);
			} else {
				statement.setDate(13, new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(14, null);
			} else {
				statement.setBigDecimal(14, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.sheetRef.code != Integer.MIN_VALUE){
				statement.setInt(15,anObject.sheetRef.code);
			} else {
				statement.setNull(15,java.sql.Types.INTEGER);
			}
			if (anObject.classificationTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(16,anObject.classificationTypeRef.code);
			} else {
				statement.setNull(16,java.sql.Types.INTEGER);
			}
			if (anObject.elementRef.code != Integer.MIN_VALUE){
				statement.setInt(17,anObject.elementRef.code);
			} else {
				statement.setNull(17,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENInspectionSheetItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENInspectionSheetItem anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENInspectionSheetItem anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENInspectionSheetItem oldObject = new ENInspectionSheetItem();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENInspectionSheetItem.modify_time_Field+" FROM  ENINSPECTIONSHEETITEM WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("DEFECTCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEFECTNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISDETECTING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTDEFECTS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEFECTLENGTH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COEFFICIENTKI") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POINTSPI") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WEIGHTXI") == 0) {
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
					if(fieldNameStr.compareTo("SHEETREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CLASSIFICATIONTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENINSPECTIONSHEETITEM SET  DEFECTCODE = ? , DEFECTNAME = ? , COMMENTGEN = ? , ISDETECTING = ? , COUNTGEN = ? , COUNTDEFECTS = ? , DEFECTLENGTH = ? , COEFFICIENTKI = ? , POINTSPI = ? , WEIGHTXI = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , SHEETREFCODE = ? , CLASSIFICATIONTYPERFCD = ? , ELEMENTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENINSPECTIONSHEETITEM SET ";
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
					statement.setString(1, anObject.defectCode);
					statement.setString(2, anObject.defectName);
					statement.setString(3, anObject.commentGen);
					if (anObject.isDetecting != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.isDetecting);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					if (anObject.countGen != null) {
						anObject.countGen = anObject.countGen.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5, anObject.countGen);
					if (anObject.countDefects != null) {
						anObject.countDefects = anObject.countDefects.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6, anObject.countDefects);
					if (anObject.defectLength != null) {
						anObject.defectLength = anObject.defectLength.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7, anObject.defectLength);
					if (anObject.coefficientKi != null) {
						anObject.coefficientKi = anObject.coefficientKi.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8, anObject.coefficientKi);
					if (anObject.pointsPi != null) {
						anObject.pointsPi = anObject.pointsPi.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9, anObject.pointsPi);
					if (anObject.weightXi != null) {
						anObject.weightXi = anObject.weightXi.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10, anObject.weightXi);
					statement.setString(11, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(12, null);
					} else {
						statement.setDate(12, new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(13, null);
					} else {
						statement.setBigDecimal(13, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.sheetRef.code != Integer.MIN_VALUE) {
						statement.setInt(14, anObject.sheetRef.code);
					} else {
						statement.setNull(14, java.sql.Types.INTEGER);
					}
					if (anObject.classificationTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(15, anObject.classificationTypeRef.code);
					} else {
						statement.setNull(15, java.sql.Types.INTEGER);
					}
					if (anObject.elementRef.code != Integer.MIN_VALUE) {
						statement.setInt(16, anObject.elementRef.code);
					} else {
						statement.setNull(16, java.sql.Types.INTEGER);
					}
					statement.setInt(17, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DEFECTCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.defectCode);
							continue;
						}
						if("DEFECTNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.defectName);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
							continue;
						}
						if("ISDETECTING".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isDetecting);
							continue;
						}
						if("COUNTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGen != null) {
								anObject.countGen = anObject.countGen.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.countGen);
							continue;
						}
						if("COUNTDEFECTS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countDefects != null) {
								anObject.countDefects = anObject.countDefects.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.countDefects);
							continue;
						}
						if("DEFECTLENGTH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.defectLength != null) {
								anObject.defectLength = anObject.defectLength.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.defectLength);
							continue;
						}
						if("COEFFICIENTKI".compareTo((String)fields.get(i)) == 0) {
							if (anObject.coefficientKi != null) {
								anObject.coefficientKi = anObject.coefficientKi.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.coefficientKi);
							continue;
						}
						if("POINTSPI".compareTo((String)fields.get(i)) == 0) {
							if (anObject.pointsPi != null) {
								anObject.pointsPi = anObject.pointsPi.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.pointsPi);
							continue;
						}
						if("WEIGHTXI".compareTo((String)fields.get(i)) == 0) {
							if (anObject.weightXi != null) {
								anObject.weightXi = anObject.weightXi.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.weightXi);
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
						if("SHEETREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sheetRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.sheetRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CLASSIFICATIONTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.classificationTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.classificationTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ELEMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.elementRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.elementRef.code);
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

	} // end of save(ENInspectionSheetItem anObject,String[] anAttributes)


	public ENInspectionSheetItemShort getShortObject(int anObjectCode) throws PersistenceException {
		ENInspectionSheetItem filterObject = new ENInspectionSheetItem();
		Vector<ENInspectionSheetItemShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENInspectionSheetItemShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENInspectionSheetItem filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.defectCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.defectName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isDetecting, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countDefects, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.defectLength, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.coefficientKi, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.pointsPi, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.weightXi, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.sheetRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.classificationTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.elementRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENInspectionSheetItemFilter filter) {
		String out = buildCondition((ENInspectionSheetItem)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENInspectionSheetItem filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENInspectionSheetItem.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.defectCode, ENInspectionSheetItem.defectCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.defectName, ENInspectionSheetItem.defectName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENInspectionSheetItem.commentGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isDetecting, ENInspectionSheetItem.isDetecting_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGen, ENInspectionSheetItem.countGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countDefects, ENInspectionSheetItem.countDefects_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.defectLength, ENInspectionSheetItem.defectLength_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.coefficientKi, ENInspectionSheetItem.coefficientKi_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.pointsPi, ENInspectionSheetItem.pointsPi_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.weightXi, ENInspectionSheetItem.weightXi_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENInspectionSheetItem.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENInspectionSheetItem.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENInspectionSheetItem.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sheetRef.code, ENInspectionSheetItem.sheetRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.classificationTypeRef.code, ENInspectionSheetItem.classificationTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.elementRef.code, ENInspectionSheetItem.elementRef_QFielld, out);
		}
		return out;
	}

	public ENInspectionSheetItemShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENInspectionSheetItemShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENInspectionSheetItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENInspectionSheetItemShortList getFilteredList(ENInspectionSheetItem filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENInspectionSheetItemShortList getScrollableFilteredList(ENInspectionSheetItem aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENInspectionSheetItemShortList getScrollableFilteredList(ENInspectionSheetItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENInspectionSheetItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENInspectionSheetItemShortList getScrollableFilteredList(ENInspectionSheetItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENInspectionSheetItemShortList getScrollableFilteredList(ENInspectionSheetItemFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENInspectionSheetItemShortList getScrollableFilteredList(ENInspectionSheetItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENInspectionSheetItemShortList result = new ENInspectionSheetItemShortList();
		ENInspectionSheetItemShort anObject;
		result.list = new Vector<ENInspectionSheetItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENINSPECTIONSHEETITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENINSPECTIONSHEETITEM.CODE"+
			",ENINSPECTIONSHEETITEM.DEFECTCODE"+
			",ENINSPECTIONSHEETITEM.DEFECTNAME"+
			",ENINSPECTIONSHEETITEM.COMMENTGEN"+
			",ENINSPECTIONSHEETITEM.ISDETECTING"+
			",ENINSPECTIONSHEETITEM.COUNTGEN"+
			",ENINSPECTIONSHEETITEM.COUNTDEFECTS"+
			",ENINSPECTIONSHEETITEM.DEFECTLENGTH"+
			",ENINSPECTIONSHEETITEM.COEFFICIENTKI"+
			",ENINSPECTIONSHEETITEM.POINTSPI"+
			",ENINSPECTIONSHEETITEM.WEIGHTXI"+
			",ENINSPECTIONSHEETITEM.USERGEN"+
			", ENINSPECTIONSHEET.CODE " +
			", ENINSPECTIONSHEET.NAME " +
			", ENINSPECTIONSHEET.INSPECTIONKIND " +
			", ENINSPECTIONSHEET.DATEGEN " +
			", ENINSPECTIONSHEET.EXECUTOR " +
			", ENINSPECTIONSHEET.ACCEPTED " +
			", ENINSPECTIONSHEET.OBJECTINVNUMBER " +
			", ENINSPECTIONSHEET.OBJECTNAME " +
			", ENINSPECTIONSHEET.EQUIPMENTKIND " +
			", ENINSPECTIONSHEET.TAKEINTOCALCULATION " +
			", ENINSPECTIONSHEET.USERGEN " +
			", ENINSPECTIONSHEET.DATEEDIT " +
			", TKCLASSIFICATIONTYPE.CODE " +
			", TKCLASSIFICATIONTYPE.NAME " +
			", TKCLASSIFICATIONTYPE.KOD " +
			", ENELEMENT.CODE " +
		" FROM ENINSPECTIONSHEETITEM " +
			" LEFT JOIN ENINSPECTIONSHEET on ENINSPECTIONSHEET.CODE = ENINSPECTIONSHEETITEM.SHEETREFCODE "+
			" LEFT JOIN TKCLASSIFICATIONTYPE on TKCLASSIFICATIONTYPE.CODE = ENINSPECTIONSHEETITEM.CLASSIFICATIONTYPERFCD "+
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENINSPECTIONSHEETITEM.ELEMENTREFCODE "+
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
				anObject = new ENInspectionSheetItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.defectCode = set.getString(2);
				anObject.defectName = set.getString(3);
				anObject.commentGen = set.getString(4);
				anObject.isDetecting = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.isDetecting = Integer.MIN_VALUE;
				}
				anObject.countGen = set.getBigDecimal(6);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countDefects = set.getBigDecimal(7);
				if(anObject.countDefects != null) {
					anObject.countDefects = anObject.countDefects.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.defectLength = set.getBigDecimal(8);
				if(anObject.defectLength != null) {
					anObject.defectLength = anObject.defectLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.coefficientKi = set.getBigDecimal(9);
				if(anObject.coefficientKi != null) {
					anObject.coefficientKi = anObject.coefficientKi.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.pointsPi = set.getBigDecimal(10);
				if(anObject.pointsPi != null) {
					anObject.pointsPi = anObject.pointsPi.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.weightXi = set.getBigDecimal(11);
				if(anObject.weightXi != null) {
					anObject.weightXi = anObject.weightXi.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.userGen = set.getString(12);

				anObject.sheetRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.sheetRefCode = Integer.MIN_VALUE;
				}
				anObject.sheetRefName = set.getString(14);
				anObject.sheetRefInspectionKind = set.getInt(15);
				if(set.wasNull()) {
					anObject.sheetRefInspectionKind = Integer.MIN_VALUE;
				}
				anObject.sheetRefDateGen = set.getDate(16);
				anObject.sheetRefExecutor = set.getString(17);
				anObject.sheetRefAccepted = set.getString(18);
				anObject.sheetRefObjectInvNumber = set.getString(19);
				anObject.sheetRefObjectName = set.getString(20);
				anObject.sheetRefEquipmentKind = set.getInt(21);
				if(set.wasNull()) {
					anObject.sheetRefEquipmentKind = Integer.MIN_VALUE;
				}
				anObject.sheetRefTakeIntoCalculation = set.getInt(22);
				if(set.wasNull()) {
					anObject.sheetRefTakeIntoCalculation = Integer.MIN_VALUE;
				}
				anObject.sheetRefUserGen = set.getString(23);
				anObject.sheetRefDateEdit = set.getDate(24);
				anObject.classificationTypeRefCode = set.getInt(25);
				if(set.wasNull()) {
					anObject.classificationTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.classificationTypeRefName = set.getString(26);
				anObject.classificationTypeRefKod = set.getString(27);
				anObject.elementRefCode = set.getInt(28);
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
	
	public int[] getFilteredCodeArray(ENInspectionSheetItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENInspectionSheetItemFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENInspectionSheetItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENINSPECTIONSHEETITEM.CODE FROM ENINSPECTIONSHEETITEM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENINSPECTIONSHEETITEM.CODE";
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


	public ENInspectionSheetItem getObject(int uid) throws PersistenceException {
		ENInspectionSheetItem result = new ENInspectionSheetItem();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENInspectionSheetItem anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENINSPECTIONSHEETITEM.CODE, ENINSPECTIONSHEETITEM.DEFECTCODE, ENINSPECTIONSHEETITEM.DEFECTNAME, ENINSPECTIONSHEETITEM.COMMENTGEN, ENINSPECTIONSHEETITEM.ISDETECTING, ENINSPECTIONSHEETITEM.COUNTGEN, ENINSPECTIONSHEETITEM.COUNTDEFECTS, ENINSPECTIONSHEETITEM.DEFECTLENGTH, ENINSPECTIONSHEETITEM.COEFFICIENTKI, ENINSPECTIONSHEETITEM.POINTSPI, ENINSPECTIONSHEETITEM.WEIGHTXI, ENINSPECTIONSHEETITEM.USERGEN, ENINSPECTIONSHEETITEM.DATEEDIT, ENINSPECTIONSHEETITEM.MODIFY_TIME, ENINSPECTIONSHEETITEM.SHEETREFCODE, ENINSPECTIONSHEETITEM.CLASSIFICATIONTYPERFCD, ENINSPECTIONSHEETITEM.ELEMENTREFCODE "
			+" FROM ENINSPECTIONSHEETITEM WHERE ENINSPECTIONSHEETITEM.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.defectCode = set.getString(2);
				anObject.defectName = set.getString(3);
				anObject.commentGen = set.getString(4);
				anObject.isDetecting = set.getInt(5);
				if (set.wasNull()) {
					anObject.isDetecting = Integer.MIN_VALUE;
				}
				anObject.countGen = set.getBigDecimal(6);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countDefects = set.getBigDecimal(7);
				if(anObject.countDefects != null) {
					anObject.countDefects = anObject.countDefects.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.defectLength = set.getBigDecimal(8);
				if(anObject.defectLength != null) {
					anObject.defectLength = anObject.defectLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.coefficientKi = set.getBigDecimal(9);
				if(anObject.coefficientKi != null) {
					anObject.coefficientKi = anObject.coefficientKi.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.pointsPi = set.getBigDecimal(10);
				if(anObject.pointsPi != null) {
					anObject.pointsPi = anObject.pointsPi.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.weightXi = set.getBigDecimal(11);
				if(anObject.weightXi != null) {
					anObject.weightXi = anObject.weightXi.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.userGen = set.getString(12);
				anObject.dateEdit = set.getDate(13);
				anObject.modify_time = set.getLong(14);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.sheetRef.code = set.getInt(15);
				if (set.wasNull()) {
					anObject.sheetRef.code = Integer.MIN_VALUE;
				}
				anObject.classificationTypeRef.code = set.getInt(16);
				if (set.wasNull()) {
					anObject.classificationTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.elementRef.code = set.getInt(17);
				if (set.wasNull()) {
					anObject.elementRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENInspectionSheetItemRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENInspectionSheetItemRef ref = new com.ksoe.energynet.valueobject.references.ENInspectionSheetItemRef();
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

		selectStr = "DELETE FROM  ENINSPECTIONSHEETITEM WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENInspectionSheetItem object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENInspectionSheetItem.getObject%} access denied");
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
	
	public long count(ENInspectionSheetItemFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENInspectionSheetItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENInspectionSheetItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENINSPECTIONSHEETITEM", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENINSPECTIONSHEETITEM WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENInspectionSheetItemFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENInspectionSheetItemFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENINSPECTIONSHEETITEM");
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
			"SELECT  ENINSPECTIONSHEETITEM.CODE FROM  ENINSPECTIONSHEETITEM WHERE  ENINSPECTIONSHEETITEM.CODE = ?";
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
		_checkConditionToken(condition,"code","ENINSPECTIONSHEETITEM.CODE");
		_checkConditionToken(condition,"defectcode","ENINSPECTIONSHEETITEM.DEFECTCODE");
		_checkConditionToken(condition,"defectname","ENINSPECTIONSHEETITEM.DEFECTNAME");
		_checkConditionToken(condition,"commentgen","ENINSPECTIONSHEETITEM.COMMENTGEN");
		_checkConditionToken(condition,"isdetecting","ENINSPECTIONSHEETITEM.ISDETECTING");
		_checkConditionToken(condition,"countgen","ENINSPECTIONSHEETITEM.COUNTGEN");
		_checkConditionToken(condition,"countdefects","ENINSPECTIONSHEETITEM.COUNTDEFECTS");
		_checkConditionToken(condition,"defectlength","ENINSPECTIONSHEETITEM.DEFECTLENGTH");
		_checkConditionToken(condition,"coefficientki","ENINSPECTIONSHEETITEM.COEFFICIENTKI");
		_checkConditionToken(condition,"pointspi","ENINSPECTIONSHEETITEM.POINTSPI");
		_checkConditionToken(condition,"weightxi","ENINSPECTIONSHEETITEM.WEIGHTXI");
		_checkConditionToken(condition,"usergen","ENINSPECTIONSHEETITEM.USERGEN");
		_checkConditionToken(condition,"dateedit","ENINSPECTIONSHEETITEM.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENINSPECTIONSHEETITEM.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"sheetref","SHEETREFCODE");
		_checkConditionToken(condition,"sheetref.code","SHEETREFCODE");
		_checkConditionToken(condition,"classificationtyperef","CLASSIFICATIONTYPERFCD");
		_checkConditionToken(condition,"classificationtyperef.code","CLASSIFICATIONTYPERFCD");
		_checkConditionToken(condition,"elementref","ELEMENTREFCODE");
		_checkConditionToken(condition,"elementref.code","ELEMENTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENInspectionSheetItem anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENINSPECTIONSHEETITEM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENINSPECTIONSHEETITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENINSPECTIONSHEETITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENINSPECTIONSHEETITEM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENInspectionSheetItemDAO
