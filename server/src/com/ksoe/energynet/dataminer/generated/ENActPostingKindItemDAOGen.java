
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
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
import com.ksoe.energynet.valueobject.ENActPostingKindItem;
import com.ksoe.energynet.valueobject.filter.ENActPostingKindItemFilter;
import com.ksoe.energynet.valueobject.brief.ENActPostingKindItemShort;
import com.ksoe.energynet.valueobject.lists.ENActPostingKindItemShortList;


/**
 * DAO Object for ENActPostingKindItem;
 *
 */

public class ENActPostingKindItemDAOGen extends GenericDataMiner {

	public ENActPostingKindItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENActPostingKindItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENActPostingKindItem inObject) throws PersistenceException {
		ENActPostingKindItem obj = new ENActPostingKindItem();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.cehKt == null && obj.cehKt == null){}
		else
			if(inObject.cehKt == null || obj.cehKt == null) return false;
			else
				if ( ! inObject.cehKt.equals(obj.cehKt)){
					return false;
				}

		if(inObject.accountKt == null && obj.accountKt == null){}
		else
			if(inObject.accountKt == null || obj.accountKt == null) return false;
			else
				if ( ! inObject.accountKt.equals(obj.accountKt)){
					return false;
				}

		if(inObject.kauKt == null && obj.kauKt == null){}
		else
			if(inObject.kauKt == null || obj.kauKt == null) return false;
			else
				if ( ! inObject.kauKt.equals(obj.kauKt)){
					return false;
				}

		if(inObject.cehDt == null && obj.cehDt == null){}
		else
			if(inObject.cehDt == null || obj.cehDt == null) return false;
			else
				if ( ! inObject.cehDt.equals(obj.cehDt)){
					return false;
				}

		if(inObject.accountDt == null && obj.accountDt == null){}
		else
			if(inObject.accountDt == null || obj.accountDt == null) return false;
			else
				if ( ! inObject.accountDt.equals(obj.accountDt)){
					return false;
				}

		if(inObject.kauDt == null && obj.kauDt == null){}
		else
			if(inObject.kauDt == null || obj.kauDt == null) return false;
			else
				if ( ! inObject.kauDt.equals(obj.kauDt)){
					return false;
				}

		if(inObject.summaGen == null && obj.summaGen == null){}
		else
			if(inObject.summaGen == null || obj.summaGen == null) return false;
			else
				if ( ! inObject.summaGen.equals(obj.summaGen)){
					return false;
				}

		if(inObject.plusMinus == null && obj.plusMinus == null){}
		else
			if(inObject.plusMinus == null || obj.plusMinus == null) return false;
			else
				if ( ! inObject.plusMinus.equals(obj.plusMinus)){
					return false;
				}

		if(inObject.description == null && obj.description == null){}
		else
			if(inObject.description == null || obj.description == null) return false;
			else
				if ( ! inObject.description.equals(obj.description)){
					return false;
				}
		if (inObject.ENActPostingKind.code != obj.ENActPostingKind.code){
			return false;
		}
		if (inObject.ENActPostingTypeSum.code != obj.ENActPostingTypeSum.code){
			return false;
		}
		if (inObject.ENActPostingForm.code != obj.ENActPostingForm.code){
			return false;
		}
		return true;
	}

	public int add(ENActPostingKindItem anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENActPostingKindItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENACTPOSTINGKINDITEM (CODE,CEHKT,ACCOUNTKT,KAUKT,CEHDT,ACCOUNTDT,KAUDT,SUMMAGEN,PLUSMINUS,DESCRIPTION,ENACTPOSTINGKINDCODE,ENACTPOSTINGTYPESUMCOD,ENACTPOSTINGFORMCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.cehKt);
			statement.setString(3, anObject.accountKt);
			statement.setString(4, anObject.kauKt);
			statement.setString(5, anObject.cehDt);
			statement.setString(6, anObject.accountDt);
			statement.setString(7, anObject.kauDt);
			if (anObject.summaGen != null) {
				anObject.summaGen = anObject.summaGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8, anObject.summaGen);
			statement.setString(9, anObject.plusMinus);
			statement.setString(10, anObject.description);
			if (anObject.ENActPostingKind.code != Integer.MIN_VALUE){
				statement.setInt(11,anObject.ENActPostingKind.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.ENActPostingTypeSum.code != Integer.MIN_VALUE){
				statement.setInt(12,anObject.ENActPostingTypeSum.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			if (anObject.ENActPostingForm.code != Integer.MIN_VALUE){
				statement.setInt(13,anObject.ENActPostingForm.code);
			} else {
				statement.setNull(13,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENActPostingKindItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENActPostingKindItem anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENActPostingKindItem anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("CEHKT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTKT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KAUKT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CEHDT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTDT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KAUDT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMMAGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLUSMINUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DESCRIPTION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ENACTPOSTINGKIND") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ENACTPOSTINGTYPESUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ENACTPOSTINGFORM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENACTPOSTINGKINDITEM SET  CEHKT = ? , ACCOUNTKT = ? , KAUKT = ? , CEHDT = ? , ACCOUNTDT = ? , KAUDT = ? , SUMMAGEN = ? , PLUSMINUS = ? , DESCRIPTION = ? , ENACTPOSTINGKINDCODE = ? , ENACTPOSTINGTYPESUMCOD = ? , ENACTPOSTINGFORMCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENACTPOSTINGKINDITEM SET ";
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
					statement.setString(1, anObject.cehKt);
					statement.setString(2, anObject.accountKt);
					statement.setString(3, anObject.kauKt);
					statement.setString(4, anObject.cehDt);
					statement.setString(5, anObject.accountDt);
					statement.setString(6, anObject.kauDt);
					if (anObject.summaGen != null) {
						anObject.summaGen = anObject.summaGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7, anObject.summaGen);
					statement.setString(8, anObject.plusMinus);
					statement.setString(9, anObject.description);
					if (anObject.ENActPostingKind.code != Integer.MIN_VALUE) {
						statement.setInt(10, anObject.ENActPostingKind.code);
					} else {
						statement.setNull(10, java.sql.Types.INTEGER);
					}
					if (anObject.ENActPostingTypeSum.code != Integer.MIN_VALUE) {
						statement.setInt(11, anObject.ENActPostingTypeSum.code);
					} else {
						statement.setNull(11, java.sql.Types.INTEGER);
					}
					if (anObject.ENActPostingForm.code != Integer.MIN_VALUE) {
						statement.setInt(12, anObject.ENActPostingForm.code);
					} else {
						statement.setNull(12, java.sql.Types.INTEGER);
					}
					statement.setInt(13, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("CEHKT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.cehKt);
							continue;
						}
						if("ACCOUNTKT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.accountKt);
							continue;
						}
						if("KAUKT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kauKt);
							continue;
						}
						if("CEHDT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.cehDt);
							continue;
						}
						if("ACCOUNTDT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.accountDt);
							continue;
						}
						if("KAUDT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kauDt);
							continue;
						}
						if("SUMMAGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.summaGen != null) {
								anObject.summaGen = anObject.summaGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.summaGen);
							continue;
						}
						if("PLUSMINUS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.plusMinus);
							continue;
						}
						if("DESCRIPTION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.description);
							continue;
						}
						if("ENACTPOSTINGKIND".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ENActPostingKind.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.ENActPostingKind.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ENACTPOSTINGTYPESUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ENActPostingTypeSum.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.ENActPostingTypeSum.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ENACTPOSTINGFORM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ENActPostingForm.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.ENActPostingForm.code);
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

	} // end of save(ENActPostingKindItem anObject,String[] anAttributes)


	public ENActPostingKindItemShort getShortObject(int anObjectCode) throws PersistenceException {
		ENActPostingKindItem filterObject = new ENActPostingKindItem();
		Vector<ENActPostingKindItemShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENActPostingKindItemShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENActPostingKindItem filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.cehKt, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountKt, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kauKt, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.cehDt, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountDt, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kauDt, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.summaGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.plusMinus, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.description, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ENActPostingKind.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ENActPostingTypeSum.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ENActPostingForm.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENActPostingKindItemFilter filter) {
		String out = buildCondition((ENActPostingKindItem)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENActPostingKindItem filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENActPostingKindItem.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.cehKt, ENActPostingKindItem.cehKt_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountKt, ENActPostingKindItem.accountKt_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kauKt, ENActPostingKindItem.kauKt_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.cehDt, ENActPostingKindItem.cehDt_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountDt, ENActPostingKindItem.accountDt_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kauDt, ENActPostingKindItem.kauDt_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.summaGen, ENActPostingKindItem.summaGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.plusMinus, ENActPostingKindItem.plusMinus_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.description, ENActPostingKindItem.description_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ENActPostingKind.code, ENActPostingKindItem.ENActPostingKind_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ENActPostingTypeSum.code, ENActPostingKindItem.ENActPostingTypeSum_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ENActPostingForm.code, ENActPostingKindItem.ENActPostingForm_QFielld, out);
		}
		return out;
	}

	public ENActPostingKindItemShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENActPostingKindItemShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENActPostingKindItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENActPostingKindItemShortList getFilteredList(ENActPostingKindItem filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENActPostingKindItemShortList getScrollableFilteredList(ENActPostingKindItem aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENActPostingKindItemShortList getScrollableFilteredList(ENActPostingKindItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENActPostingKindItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENActPostingKindItemShortList getScrollableFilteredList(ENActPostingKindItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENActPostingKindItemShortList getScrollableFilteredList(ENActPostingKindItemFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENActPostingKindItemShortList getScrollableFilteredList(ENActPostingKindItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENActPostingKindItemShortList result = new ENActPostingKindItemShortList();
		ENActPostingKindItemShort anObject;
		result.list = new Vector<ENActPostingKindItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTPOSTINGKINDITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACTPOSTINGKINDITEM.CODE"+
			",ENACTPOSTINGKINDITEM.CEHKT"+
			",ENACTPOSTINGKINDITEM.ACCOUNTKT"+
			",ENACTPOSTINGKINDITEM.KAUKT"+
			",ENACTPOSTINGKINDITEM.CEHDT"+
			",ENACTPOSTINGKINDITEM.ACCOUNTDT"+
			",ENACTPOSTINGKINDITEM.KAUDT"+
			",ENACTPOSTINGKINDITEM.SUMMAGEN"+
			",ENACTPOSTINGKINDITEM.PLUSMINUS"+
			",ENACTPOSTINGKINDITEM.DESCRIPTION"+
			", ENACTPOSTINGKIND.CODE " +
			", ENACTPOSTINGKIND.NUMBERGEN " +
			", ENACTPOSTINGKIND.NAME " +
			", ENACTPOSTINGKIND.DATETEMPLATE " +
			", ENACTPOSTINGKIND.ACCOUNT_EXPENSE " +
			", ENACTPOSTINGKIND.KAU_EXPENSE " +
			", ENACTPOSTINGKIND.ACCOUNT_CLOSING " +
			", ENACTPOSTINGKIND.KAU_CLOSING " +
			", ENACTPOSTINGKIND.TYPEOPERMATETIALSACT " +
			", ENACTPOSTINGKIND.TYPEOPERMATETIALSORDER " +
			", ENACTPOSTINGKIND.TYPEOPERCOUNTERSACT " +
			", ENACTPOSTINGTYPESUM.CODE " +
			", ENACTPOSTINGTYPESUM.NAME " +
			", ENACTPOSTINGFORM.CODE " +
			", ENACTPOSTINGFORM.NAME " +
		" FROM ENACTPOSTINGKINDITEM " +
			" LEFT JOIN ENACTPOSTINGKIND on ENACTPOSTINGKIND.CODE = ENACTPOSTINGKINDITEM.ENACTPOSTINGKINDCODE "+
			" LEFT JOIN ENACTPOSTINGTYPESUM on ENACTPOSTINGTYPESUM.CODE = ENACTPOSTINGKINDITEM.ENACTPOSTINGTYPESUMCOD "+
			" LEFT JOIN ENACTPOSTINGFORM on ENACTPOSTINGFORM.CODE = ENACTPOSTINGKINDITEM.ENACTPOSTINGFORMCODE "+
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
				anObject = new ENActPostingKindItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.cehKt = set.getString(2);
				anObject.accountKt = set.getString(3);
				anObject.kauKt = set.getString(4);
				anObject.cehDt = set.getString(5);
				anObject.accountDt = set.getString(6);
				anObject.kauDt = set.getString(7);
				anObject.summaGen = set.getBigDecimal(8);
				if(anObject.summaGen != null) {
					anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plusMinus = set.getString(9);
				anObject.description = set.getString(10);

				anObject.ENActPostingKindCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.ENActPostingKindCode = Integer.MIN_VALUE;
				}
				anObject.ENActPostingKindNumberGen = set.getString(12);
				anObject.ENActPostingKindName = set.getString(13);
				anObject.ENActPostingKindDateTemplate = set.getTimestamp(14);
				anObject.ENActPostingKindAccount_expense = set.getString(15);
				anObject.ENActPostingKindKau_expense = set.getString(16);
				anObject.ENActPostingKindAccount_closing = set.getString(17);
				anObject.ENActPostingKindKau_closing = set.getString(18);
				anObject.ENActPostingKindTypeOperMatetialsAct = set.getString(19);
				anObject.ENActPostingKindTypeOperMatetialsOrder = set.getString(20);
				anObject.ENActPostingKindTypeOperCountersAct = set.getString(21);
				anObject.ENActPostingTypeSumCode = set.getInt(22);
				if(set.wasNull()) {
					anObject.ENActPostingTypeSumCode = Integer.MIN_VALUE;
				}
				anObject.ENActPostingTypeSumName = set.getString(23);
				anObject.ENActPostingFormCode = set.getInt(24);
				if(set.wasNull()) {
					anObject.ENActPostingFormCode = Integer.MIN_VALUE;
				}
				anObject.ENActPostingFormName = set.getString(25);

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
	
	public int[] getFilteredCodeArray(ENActPostingKindItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENActPostingKindItemFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENActPostingKindItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACTPOSTINGKINDITEM.CODE FROM ENACTPOSTINGKINDITEM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTPOSTINGKINDITEM.CODE";
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


	public ENActPostingKindItem getObject(int uid) throws PersistenceException {
		ENActPostingKindItem result = new ENActPostingKindItem();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENActPostingKindItem anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENACTPOSTINGKINDITEM.CODE, ENACTPOSTINGKINDITEM.CEHKT, ENACTPOSTINGKINDITEM.ACCOUNTKT, ENACTPOSTINGKINDITEM.KAUKT, ENACTPOSTINGKINDITEM.CEHDT, ENACTPOSTINGKINDITEM.ACCOUNTDT, ENACTPOSTINGKINDITEM.KAUDT, ENACTPOSTINGKINDITEM.SUMMAGEN, ENACTPOSTINGKINDITEM.PLUSMINUS, ENACTPOSTINGKINDITEM.DESCRIPTION, ENACTPOSTINGKINDITEM.ENACTPOSTINGKINDCODE, ENACTPOSTINGKINDITEM.ENACTPOSTINGTYPESUMCOD, ENACTPOSTINGKINDITEM.ENACTPOSTINGFORMCODE "
			+" FROM ENACTPOSTINGKINDITEM WHERE ENACTPOSTINGKINDITEM.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.cehKt = set.getString(2);
				anObject.accountKt = set.getString(3);
				anObject.kauKt = set.getString(4);
				anObject.cehDt = set.getString(5);
				anObject.accountDt = set.getString(6);
				anObject.kauDt = set.getString(7);
				anObject.summaGen = set.getBigDecimal(8);
				if(anObject.summaGen != null) {
					anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plusMinus = set.getString(9);
				anObject.description = set.getString(10);
				anObject.ENActPostingKind.code = set.getInt(11);
				if (set.wasNull()) {
					anObject.ENActPostingKind.code = Integer.MIN_VALUE;
				}
				anObject.ENActPostingTypeSum.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.ENActPostingTypeSum.code = Integer.MIN_VALUE;
				}
				anObject.ENActPostingForm.code = set.getInt(13);
				if (set.wasNull()) {
					anObject.ENActPostingForm.code = Integer.MIN_VALUE;
				}
				if(anObject.ENActPostingKind.code != Integer.MIN_VALUE) {
					anObject.setENActPostingKind(
						new com.ksoe.energynet.dataminer.generated.ENActPostingKindDAOGen(connection,getUserProfile()).getObject(anObject.ENActPostingKind.code));
				}
				if(anObject.ENActPostingTypeSum.code != Integer.MIN_VALUE) {
					anObject.setENActPostingTypeSum(
						new com.ksoe.energynet.dataminer.generated.ENActPostingTypeSumDAOGen(connection,getUserProfile()).getObject(anObject.ENActPostingTypeSum.code));
				}
				if(anObject.ENActPostingForm.code != Integer.MIN_VALUE) {
					anObject.setENActPostingForm(
						new com.ksoe.energynet.dataminer.generated.ENActPostingFormDAOGen(connection,getUserProfile()).getObject(anObject.ENActPostingForm.code));
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


	public com.ksoe.energynet.valueobject.references.ENActPostingKindItemRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENActPostingKindItemRef ref = new com.ksoe.energynet.valueobject.references.ENActPostingKindItemRef();
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

		selectStr = "DELETE FROM  ENACTPOSTINGKINDITEM WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENActPostingKindItem object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENActPostingKindItem.getObject%} access denied");
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
	
	public long count(ENActPostingKindItemFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENActPostingKindItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENActPostingKindItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENACTPOSTINGKINDITEM", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENACTPOSTINGKINDITEM WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENActPostingKindItemFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENActPostingKindItemFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENACTPOSTINGKINDITEM");
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
			"SELECT  ENACTPOSTINGKINDITEM.CODE FROM  ENACTPOSTINGKINDITEM WHERE  ENACTPOSTINGKINDITEM.CODE = ?";
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
		_checkConditionToken(condition,"code","ENACTPOSTINGKINDITEM.CODE");
		_checkConditionToken(condition,"cehkt","ENACTPOSTINGKINDITEM.CEHKT");
		_checkConditionToken(condition,"accountkt","ENACTPOSTINGKINDITEM.ACCOUNTKT");
		_checkConditionToken(condition,"kaukt","ENACTPOSTINGKINDITEM.KAUKT");
		_checkConditionToken(condition,"cehdt","ENACTPOSTINGKINDITEM.CEHDT");
		_checkConditionToken(condition,"accountdt","ENACTPOSTINGKINDITEM.ACCOUNTDT");
		_checkConditionToken(condition,"kaudt","ENACTPOSTINGKINDITEM.KAUDT");
		_checkConditionToken(condition,"summagen","ENACTPOSTINGKINDITEM.SUMMAGEN");
		_checkConditionToken(condition,"plusminus","ENACTPOSTINGKINDITEM.PLUSMINUS");
		_checkConditionToken(condition,"description","ENACTPOSTINGKINDITEM.DESCRIPTION");
		// relationship conditions
		_checkConditionToken(condition,"enactpostingkind","ENACTPOSTINGKINDCODE");
		_checkConditionToken(condition,"enactpostingkind.code","ENACTPOSTINGKINDCODE");
		_checkConditionToken(condition,"enactpostingtypesum","ENACTPOSTINGTYPESUMCOD");
		_checkConditionToken(condition,"enactpostingtypesum.code","ENACTPOSTINGTYPESUMCOD");
		_checkConditionToken(condition,"enactpostingform","ENACTPOSTINGFORMCODE");
		_checkConditionToken(condition,"enactpostingform.code","ENACTPOSTINGFORMCODE");
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
	
	private void _collectAutoIncrementFields(ENActPostingKindItem anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENACTPOSTINGKINDITEM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENACTPOSTINGKINDITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENACTPOSTINGKINDITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENACTPOSTINGKINDITEM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENActPostingKindItemDAO
