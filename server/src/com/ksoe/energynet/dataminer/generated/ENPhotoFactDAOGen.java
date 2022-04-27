
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.valueobject.ENPhotoFact;
import com.ksoe.energynet.valueobject.brief.ENPhotoFactShort;
import com.ksoe.energynet.valueobject.filter.ENPhotoFactFilter;
import com.ksoe.energynet.valueobject.lists.ENPhotoFactShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENPhotoFact;
 *
 */

public class ENPhotoFactDAOGen extends GenericDataMiner {

	public ENPhotoFactDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENPhotoFactDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENPhotoFact inObject) throws PersistenceException {
		ENPhotoFact obj = new ENPhotoFact();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.description == null && obj.description == null){}
		else
			if(inObject.description == null || obj.description == null) return false;
			else
				if ( ! inObject.description.equals(obj.description)){
					return false;
				}

		if(inObject.dateFact == null && obj.dateFact == null){} else
			if(inObject.dateFact == null || obj.dateFact == null) return false;
			else
				if (inObject.dateFact.compareTo(obj.dateFact) != 0){
					return false;
				}

		if(inObject.actNumber == null && obj.actNumber == null){}
		else
			if(inObject.actNumber == null || obj.actNumber == null) return false;
			else
				if ( ! inObject.actNumber.equals(obj.actNumber)){
					return false;
				}

		if(inObject.personalAccount == null && obj.personalAccount == null){}
		else
			if(inObject.personalAccount == null || obj.personalAccount == null) return false;
			else
				if ( ! inObject.personalAccount.equals(obj.personalAccount)){
					return false;
				}

		if(inObject.personalAccountUid == null && obj.personalAccountUid == null){}
		else
			if(inObject.personalAccountUid == null || obj.personalAccountUid == null) return false;
			else
				if ( ! inObject.personalAccountUid.equals(obj.personalAccountUid)){
					return false;
				}

		if (inObject.recordpointCode != obj.recordpointCode){
					return false;
				}

		if(inObject.customerFIO == null && obj.customerFIO == null){}
		else
			if(inObject.customerFIO == null || obj.customerFIO == null) return false;
			else
				if ( ! inObject.customerFIO.equals(obj.customerFIO)){
					return false;
				}

		if(inObject.dateAdd == null && obj.dateAdd == null){} else
			if(inObject.dateAdd == null || obj.dateAdd == null) return false;
			else
				if (inObject.dateAdd.compareTo(obj.dateAdd) != 0){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}
		if (inObject.renRef.code != obj.renRef.code){
			return false;
		}
		if (inObject.workOrderBytRef.code != obj.workOrderBytRef.code){
			return false;
		}
		return true;
	}

	public int add(ENPhotoFact anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENPhotoFact anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENPHOTOFACT (CODE,DESCRIPTION,DATEFACT,ACTNUMBER,PERSONALACCOUNT,PERSONALACCOUNTUID,RECORDPOINTCODE,CUSTOMERFIO,DATEADD,DATEEDIT,USERGEN,RENREFCODE,WORKORDERBYTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.description);
			if (anObject.dateFact == null) {
				statement.setTimestamp(3, null);
			} else {
				statement.setTimestamp(3, new java.sql.Timestamp(anObject.dateFact.getTime()));
			}
			statement.setString(4, anObject.actNumber);
			statement.setString(5, anObject.personalAccount);
			statement.setString(6, anObject.personalAccountUid);
			if (anObject.recordpointCode != Integer.MIN_VALUE ) {
				statement.setInt(7, anObject.recordpointCode);
			} else {
				statement.setNull(7, java.sql.Types.INTEGER);
			}
			statement.setString(8, anObject.customerFIO);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(9, null);
			} else {
				statement.setTimestamp(9, new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			if (anObject.dateEdit == null) {
				statement.setTimestamp(10, null);
			} else {
				statement.setTimestamp(10, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			statement.setString(11, anObject.userGen);
			if (anObject.renRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energypro.dataminer.generated.EPRenDAOGen(connection,getUserProfile()).exists(anObject.renRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energypro.valueobject.ENPhotoFact.renRef.code%} = {%"+anObject.renRef.code+"%}");
				}
				statement.setInt(12,anObject.renRef.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			if (anObject.workOrderBytRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWorkOrderBytDAOGen(connection,getUserProfile()).exists(anObject.workOrderBytRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPhotoFact.workOrderBytRef.code%} = {%"+anObject.workOrderBytRef.code+"%}");
				}
				statement.setInt(13,anObject.workOrderBytRef.code);
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
			throw new PersistenceException("Error in method {%ENPhotoFactDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENPhotoFact anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENPhotoFact anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("DESCRIPTION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEFACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERSONALACCOUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERSONALACCOUNTUID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RECORDPOINTCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CUSTOMERFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEADD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RENREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WORKORDERBYTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENPHOTOFACT SET  DESCRIPTION = ? , DATEFACT = ? , ACTNUMBER = ? , PERSONALACCOUNT = ? , PERSONALACCOUNTUID = ? , RECORDPOINTCODE = ? , CUSTOMERFIO = ? , DATEADD = ? , DATEEDIT = ? , USERGEN = ? , RENREFCODE = ? , WORKORDERBYTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENPHOTOFACT SET ";
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
					statement.setString(1, anObject.description);
					if (anObject.dateFact == null) {
						statement.setTimestamp(2, null);
					} else {
						statement.setTimestamp(2, new java.sql.Timestamp(anObject.dateFact.getTime()));
					}
					statement.setString(3, anObject.actNumber);
					statement.setString(4, anObject.personalAccount);
					statement.setString(5, anObject.personalAccountUid);
					if (anObject.recordpointCode != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.recordpointCode);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					statement.setString(7, anObject.customerFIO);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(8, null);
					} else {
						statement.setTimestamp(8, new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					if (anObject.dateEdit == null) {
						statement.setTimestamp(9, null);
					} else {
						statement.setTimestamp(9, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					statement.setString(10, anObject.userGen);
					if (anObject.renRef.code != Integer.MIN_VALUE) {
						statement.setInt(11, anObject.renRef.code);
					} else {
						statement.setNull(11, java.sql.Types.INTEGER);
					}
					if (anObject.workOrderBytRef.code != Integer.MIN_VALUE) {
						statement.setInt(12, anObject.workOrderBytRef.code);
					} else {
						statement.setNull(12, java.sql.Types.INTEGER);
					}
					statement.setInt(13, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DESCRIPTION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.description);
							continue;
						}
						if("DATEFACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateFact == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateFact.getTime()));
							}
							continue;
						}
						if("ACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.actNumber);
							continue;
						}
						if("PERSONALACCOUNT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.personalAccount);
							continue;
						}
						if("PERSONALACCOUNTUID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.personalAccountUid);
							continue;
						}
						if("RECORDPOINTCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.recordpointCode);
							continue;
						}
						if("CUSTOMERFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.customerFIO);
							continue;
						}
						if("DATEADD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateAdd == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateAdd.getTime()));
							}
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
							continue;
						}
						if("RENREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.renRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.renRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("WORKORDERBYTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.workOrderBytRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.workOrderBytRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
					}
					statement.setInt(fields.size(), anObject.code);
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

	} // end of save(ENPhotoFact anObject,String[] anAttributes)


	public ENPhotoFactShort getShortObject(int anObjectCode) throws PersistenceException {
		ENPhotoFact filterObject = new ENPhotoFact();
		Vector<ENPhotoFactShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENPhotoFactShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENPhotoFact filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.description, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateFact, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.actNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.personalAccount, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.personalAccountUid, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.recordpointCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.customerFIO, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.renRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.workOrderBytRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENPhotoFactFilter filter) {
		String out = buildCondition((ENPhotoFact)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENPhotoFact filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENPhotoFact.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.description, ENPhotoFact.description_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateFact, ENPhotoFact.dateFact_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.actNumber, ENPhotoFact.actNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.personalAccount, ENPhotoFact.personalAccount_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.personalAccountUid, ENPhotoFact.personalAccountUid_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.recordpointCode, ENPhotoFact.recordpointCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.customerFIO, ENPhotoFact.customerFIO_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENPhotoFact.dateAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENPhotoFact.dateEdit_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENPhotoFact.userGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.renRef.code, ENPhotoFact.renRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.workOrderBytRef.code, ENPhotoFact.workOrderBytRef_QFielld, out);
		}
		return out;
	}

	public ENPhotoFactShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENPhotoFactShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENPhotoFactShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENPhotoFactShortList getFilteredList(ENPhotoFact filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENPhotoFactShortList getScrollableFilteredList(ENPhotoFact aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENPhotoFactShortList getScrollableFilteredList(ENPhotoFact aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENPhotoFactShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENPhotoFactShortList getScrollableFilteredList(ENPhotoFactFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENPhotoFactShortList getScrollableFilteredList(ENPhotoFactFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENPhotoFactShortList getScrollableFilteredList(ENPhotoFact aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENPhotoFactShortList result = new ENPhotoFactShortList();
		ENPhotoFactShort anObject;
		result.list = new Vector<ENPhotoFactShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPHOTOFACT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENPHOTOFACT.CODE"+
			",ENPHOTOFACT.DESCRIPTION"+
			",ENPHOTOFACT.DATEFACT"+
			",ENPHOTOFACT.ACTNUMBER"+
			",ENPHOTOFACT.PERSONALACCOUNT"+
			",ENPHOTOFACT.PERSONALACCOUNTUID"+
			",ENPHOTOFACT.CUSTOMERFIO"+
			",ENPHOTOFACT.DATEADD"+
			",ENPHOTOFACT.DATEEDIT"+
			",ENPHOTOFACT.USERGEN"+
			", EPREN.CODE " +
			", EPREN.NAME " +
			", ENWORKORDERBYT.CODE " +
			", ENWORKORDERBYT.NUMBERGEN " +
			", ENWORKORDERBYT.DATEGEN " +
			", ENWORKORDERBYT.COMMENTGEN " +
			", ENWORKORDERBYT.DATEADD " +
			", ENWORKORDERBYT.DATEEDIT " +
			", ENWORKORDERBYT.USERADD " +
			", ENWORKORDERBYT.USEREDIT " +
		" FROM ENPHOTOFACT " +
			", EPREN " +
			", ENWORKORDERBYT " +
		"";
		whereStr = " EPREN.CODE = ENPHOTOFACT.RENREFCODE" ; //+
		whereStr += " AND ENWORKORDERBYT.CODE = ENPHOTOFACT.WORKORDERBYTREFCODE" ; //+


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
				anObject = new ENPhotoFactShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.description = set.getString(2);
				anObject.dateFact = set.getTimestamp(3);
				anObject.actNumber = set.getString(4);
				anObject.personalAccount = set.getString(5);
				anObject.personalAccountUid = set.getString(6);
				anObject.customerFIO = set.getString(7);
				anObject.dateAdd = set.getTimestamp(8);
				anObject.dateEdit = set.getTimestamp(9);
				anObject.userGen = set.getString(10);

				anObject.renRefCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.renRefCode = Integer.MIN_VALUE;
				}
				anObject.renRefName = set.getString(12);
				anObject.workOrderBytRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.workOrderBytRefCode = Integer.MIN_VALUE;
				}
				anObject.workOrderBytRefNumberGen = set.getString(14);
				anObject.workOrderBytRefDateGen = set.getDate(15);
				anObject.workOrderBytRefCommentGen = set.getString(16);
				anObject.workOrderBytRefDateAdd = set.getTimestamp(17);
				anObject.workOrderBytRefDateEdit = set.getTimestamp(18);
				anObject.workOrderBytRefUserAdd = set.getString(19);
				anObject.workOrderBytRefUserEdit = set.getString(20);

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

	public int[] getFilteredCodeArray(ENPhotoFactFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENPhotoFactFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENPhotoFact aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENPHOTOFACT.CODE FROM ENPHOTOFACT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPHOTOFACT.CODE";
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
				if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}
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


	public ENPhotoFact getObject(int uid) throws PersistenceException {
		ENPhotoFact result = new ENPhotoFact();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENPhotoFact anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENPHOTOFACT.CODE, ENPHOTOFACT.DESCRIPTION, ENPHOTOFACT.DATEFACT, ENPHOTOFACT.ACTNUMBER, ENPHOTOFACT.PERSONALACCOUNT, ENPHOTOFACT.PERSONALACCOUNTUID, ENPHOTOFACT.RECORDPOINTCODE, ENPHOTOFACT.CUSTOMERFIO, ENPHOTOFACT.DATEADD, ENPHOTOFACT.DATEEDIT, ENPHOTOFACT.USERGEN, ENPHOTOFACT.RENREFCODE, ENPHOTOFACT.WORKORDERBYTREFCODE "
			+" FROM ENPHOTOFACT WHERE ENPHOTOFACT.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);

				anObject.description = set.getString(2);
				anObject.dateFact = set.getTimestamp(3);
				anObject.actNumber = set.getString(4);
				anObject.personalAccount = set.getString(5);
				anObject.personalAccountUid = set.getString(6);
				anObject.recordpointCode = set.getInt(7);
				if (set.wasNull()) {
					anObject.recordpointCode = Integer.MIN_VALUE;
				}
				anObject.customerFIO = set.getString(8);
				anObject.dateAdd = set.getTimestamp(9);
				anObject.dateEdit = set.getTimestamp(10);
				anObject.userGen = set.getString(11);
				anObject.renRef.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.renRef.code = Integer.MIN_VALUE;
				}
				anObject.workOrderBytRef.code = set.getInt(13);
				if (set.wasNull()) {
					anObject.workOrderBytRef.code = Integer.MIN_VALUE;
				}
				if(anObject.renRef.code != Integer.MIN_VALUE) {
					anObject.setRenRef(
						new com.ksoe.energypro.dataminer.generated.EPRenDAOGen(connection,getUserProfile()).getRef(anObject.renRef.code));
				}
				if(anObject.workOrderBytRef.code != Integer.MIN_VALUE) {
					anObject.setWorkOrderBytRef(
						new com.ksoe.energynet.dataminer.generated.ENWorkOrderBytDAOGen(connection,getUserProfile()).getRef(anObject.workOrderBytRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENPhotoFactRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENPhotoFactRef ref = new com.ksoe.energynet.valueobject.references.ENPhotoFactRef();
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

		selectStr = "DELETE FROM  ENPHOTOFACT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENPhotoFact object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENPhotoFact.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPhotoFact.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENPhotoFact.remove%} access denied");
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

	public long count(ENPhotoFactFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENPhotoFactFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENPhotoFactFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENPHOTOFACT", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENPhotoFactFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENPHOTOFACT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPhotoFact.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENPhotoFact.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENPHOTOFACT.CODE FROM  ENPHOTOFACT WHERE  ENPHOTOFACT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENPHOTOFACT.CODE");
		_checkConditionToken(condition,"description","ENPHOTOFACT.DESCRIPTION");
		_checkConditionToken(condition,"datefact","ENPHOTOFACT.DATEFACT");
		_checkConditionToken(condition,"actnumber","ENPHOTOFACT.ACTNUMBER");
		_checkConditionToken(condition,"personalaccount","ENPHOTOFACT.PERSONALACCOUNT");
		_checkConditionToken(condition,"personalaccountuid","ENPHOTOFACT.PERSONALACCOUNTUID");
		_checkConditionToken(condition,"recordpointcode","ENPHOTOFACT.RECORDPOINTCODE");
		_checkConditionToken(condition,"customerfio","ENPHOTOFACT.CUSTOMERFIO");
		_checkConditionToken(condition,"dateadd","ENPHOTOFACT.DATEADD");
		_checkConditionToken(condition,"dateedit","ENPHOTOFACT.DATEEDIT");
		_checkConditionToken(condition,"usergen","ENPHOTOFACT.USERGEN");
		// relationship conditions
		_checkConditionToken(condition,"renref","RENREFCODE");
		_checkConditionToken(condition,"renref.code","RENREFCODE");
		_checkConditionToken(condition,"workorderbytref","WORKORDERBYTREFCODE");
		_checkConditionToken(condition,"workorderbytref.code","WORKORDERBYTREFCODE");
		return condition.toString();
	}

	@Override
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

	private void _collectAutoIncrementFields(ENPhotoFact anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENPHOTOFACT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENPHOTOFACT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENPHOTOFACT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENPHOTOFACT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENPhotoFactDAO
