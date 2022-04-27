
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
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
import com.ksoe.energynet.valueobject.ENAct2DFDocDecree;
import com.ksoe.energynet.valueobject.filter.ENAct2DFDocDecreeFilter;
import com.ksoe.energynet.valueobject.brief.ENAct2DFDocDecreeShort;
import com.ksoe.energynet.valueobject.lists.ENAct2DFDocDecreeShortList;


/**
 * DAO Object for ENAct2DFDocDecree;
 *
 */

public class ENAct2DFDocDecreeDAOGen extends GenericDataMiner {

	public ENAct2DFDocDecreeDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENAct2DFDocDecreeDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENAct2DFDocDecree inObject) throws PersistenceException {
		ENAct2DFDocDecree obj = new ENAct2DFDocDecree();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if(inObject.userAdd == null && obj.userAdd == null){}
		else
			if(inObject.userAdd == null || obj.userAdd == null) return false;
			else
				if ( ! inObject.userAdd.equals(obj.userAdd)){
					return false;
				}

		if(inObject.dateAdd == null && obj.dateAdd == null){} else 
			if(inObject.dateAdd == null || obj.dateAdd == null) return false;
			else
				if (inObject.dateAdd.compareTo(obj.dateAdd) != 0){
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

		if(inObject.specifications == null && obj.specifications == null){}
		else
			if(inObject.specifications == null || obj.specifications == null) return false;
			else
				if ( ! inObject.specifications.equals(obj.specifications)){
					return false;
				}

		if (inObject.numberHours != obj.numberHours){
					return false;
				}

		if (inObject.DFDocDecreeCode != obj.DFDocDecreeCode){
					return false;
				}

		if (inObject.dfDocCode != obj.dfDocCode){
					return false;
				}

		if(inObject.responsFIO == null && obj.responsFIO == null){}
		else
			if(inObject.responsFIO == null || obj.responsFIO == null) return false;
			else
				if ( ! inObject.responsFIO.equals(obj.responsFIO)){
					return false;
				}

		if(inObject.responsPosition == null && obj.responsPosition == null){}
		else
			if(inObject.responsPosition == null || obj.responsPosition == null) return false;
			else
				if ( ! inObject.responsPosition.equals(obj.responsPosition)){
					return false;
				}

		if(inObject.responsGenitiveFIO == null && obj.responsGenitiveFIO == null){}
		else
			if(inObject.responsGenitiveFIO == null || obj.responsGenitiveFIO == null) return false;
			else
				if ( ! inObject.responsGenitiveFIO.equals(obj.responsGenitiveFIO)){
					return false;
				}

		if(inObject.responsGenitivePosition == null && obj.responsGenitivePosition == null){}
		else
			if(inObject.responsGenitivePosition == null || obj.responsGenitivePosition == null) return false;
			else
				if ( ! inObject.responsGenitivePosition.equals(obj.responsGenitivePosition)){
					return false;
				}

		if(inObject.responsSurname == null && obj.responsSurname == null){}
		else
			if(inObject.responsSurname == null || obj.responsSurname == null) return false;
			else
				if ( ! inObject.responsSurname.equals(obj.responsSurname)){
					return false;
				}

		if(inObject.responsSurnameGenitive == null && obj.responsSurnameGenitive == null){}
		else
			if(inObject.responsSurnameGenitive == null || obj.responsSurnameGenitive == null) return false;
			else
				if ( ! inObject.responsSurnameGenitive.equals(obj.responsSurnameGenitive)){
					return false;
				}

		if(inObject.responsName == null && obj.responsName == null){}
		else
			if(inObject.responsName == null || obj.responsName == null) return false;
			else
				if ( ! inObject.responsName.equals(obj.responsName)){
					return false;
				}

		if(inObject.responsNameGenitive == null && obj.responsNameGenitive == null){}
		else
			if(inObject.responsNameGenitive == null || obj.responsNameGenitive == null) return false;
			else
				if ( ! inObject.responsNameGenitive.equals(obj.responsNameGenitive)){
					return false;
				}

		if(inObject.responsPatronimic == null && obj.responsPatronimic == null){}
		else
			if(inObject.responsPatronimic == null || obj.responsPatronimic == null) return false;
			else
				if ( ! inObject.responsPatronimic.equals(obj.responsPatronimic)){
					return false;
				}

		if(inObject.responsPatronimicGenitive == null && obj.responsPatronimicGenitive == null){}
		else
			if(inObject.responsPatronimicGenitive == null || obj.responsPatronimicGenitive == null) return false;
			else
				if ( ! inObject.responsPatronimicGenitive.equals(obj.responsPatronimicGenitive)){
					return false;
				}

		if(inObject.departmentName == null && obj.departmentName == null){}
		else
			if(inObject.departmentName == null || obj.departmentName == null) return false;
			else
				if ( ! inObject.departmentName.equals(obj.departmentName)){
					return false;
				}

		if(inObject.departmentNameGenitive == null && obj.departmentNameGenitive == null){}
		else
			if(inObject.departmentNameGenitive == null || obj.departmentNameGenitive == null) return false;
			else
				if ( ! inObject.departmentNameGenitive.equals(obj.departmentNameGenitive)){
					return false;
				}
		if (inObject.actRef.code != obj.actRef.code){
			return false;
		}
		return true;
	}

	public int add(ENAct2DFDocDecree anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENAct2DFDocDecree anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENACT2DFDOCDECREE (CODE,COMMENTGEN,USERADD,DATEADD,USERGEN,DATEEDIT,MODIFY_TIME,SPECIFICATIONS,NUMBERHOURS,DFDOCDECREECODE,DFDOCCODE,RESPONSFIO,RESPONSPOSITION,RESPONSGENITIVEFIO,RESPONSGENITIVEPOSITIN,RESPONSSURNAME,RESPONSSURNAMEGENITIVE,RESPONSNAME,RESPONSNAMEGENITIVE,RESPONSPATRONIMIC,RESPONSPATRONIMICGENTV,DEPARTMENTNAME,DEPARTMENTNAMEGENITIVE,ACTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.commentGen);
			statement.setString(3, anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(4, null);
			} else {
				statement.setTimestamp(4, new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(5, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(6, null);
			} else {
				statement.setTimestamp(6, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(7, null);
			} else {
				statement.setBigDecimal(7, new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(8, anObject.specifications);
			if (anObject.numberHours != Integer.MIN_VALUE ) {
				statement.setInt(9, anObject.numberHours);
			} else {
				statement.setNull(9, java.sql.Types.INTEGER);
			}
			if (anObject.DFDocDecreeCode != Integer.MIN_VALUE ) {
				statement.setInt(10, anObject.DFDocDecreeCode);
			} else {
				statement.setNull(10, java.sql.Types.INTEGER);
			}
			if (anObject.dfDocCode != Integer.MIN_VALUE ) {
				statement.setInt(11, anObject.dfDocCode);
			} else {
				statement.setNull(11, java.sql.Types.INTEGER);
			}
			statement.setString(12, anObject.responsFIO);
			statement.setString(13, anObject.responsPosition);
			statement.setString(14, anObject.responsGenitiveFIO);
			statement.setString(15, anObject.responsGenitivePosition);
			statement.setString(16, anObject.responsSurname);
			statement.setString(17, anObject.responsSurnameGenitive);
			statement.setString(18, anObject.responsName);
			statement.setString(19, anObject.responsNameGenitive);
			statement.setString(20, anObject.responsPatronimic);
			statement.setString(21, anObject.responsPatronimicGenitive);
			statement.setString(22, anObject.departmentName);
			statement.setString(23, anObject.departmentNameGenitive);
			if (anObject.actRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.actRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAct2DFDocDecree.actRef.code%} = {%"+anObject.actRef.code+"%}");
				}
				statement.setInt(24,anObject.actRef.code);
			} else {
				statement.setNull(24,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENAct2DFDocDecreeDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENAct2DFDocDecree anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENAct2DFDocDecree anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENAct2DFDocDecree oldObject = new ENAct2DFDocDecree();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENAct2DFDocDecree.modify_time_Field+" FROM  ENACT2DFDOCDECREE WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERADD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEADD") == 0) {
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
					if(fieldNameStr.compareTo("SPECIFICATIONS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NUMBERHOURS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCDECREECODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPONSFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPONSPOSITION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPONSGENITIVEFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPONSGENITIVEPOSITION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPONSSURNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPONSSURNAMEGENITIVE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPONSNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPONSNAMEGENITIVE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPONSPATRONIMIC") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPONSPATRONIMICGENITIVE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENTNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENTNAMEGENITIVE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENACT2DFDOCDECREE SET  COMMENTGEN = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , SPECIFICATIONS = ? , NUMBERHOURS = ? , DFDOCDECREECODE = ? , DFDOCCODE = ? , RESPONSFIO = ? , RESPONSPOSITION = ? , RESPONSGENITIVEFIO = ? , RESPONSGENITIVEPOSITIN = ? , RESPONSSURNAME = ? , RESPONSSURNAMEGENITIVE = ? , RESPONSNAME = ? , RESPONSNAMEGENITIVE = ? , RESPONSPATRONIMIC = ? , RESPONSPATRONIMICGENTV = ? , DEPARTMENTNAME = ? , DEPARTMENTNAMEGENITIVE = ? , ACTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENACT2DFDOCDECREE SET ";
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
					statement.setString(1, anObject.commentGen);
					statement.setString(2, anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(3, null);
					} else {
						statement.setTimestamp(3, new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(4, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(5, null);
					} else {
						statement.setTimestamp(5, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(6, null);
					} else {
						statement.setBigDecimal(6, new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(7, anObject.specifications);
					if (anObject.numberHours != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.numberHours);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					if (anObject.DFDocDecreeCode != Integer.MIN_VALUE) {
						statement.setInt(9, anObject.DFDocDecreeCode);
					} else {
						statement.setNull(9, java.sql.Types.INTEGER);
					}
					if (anObject.dfDocCode != Integer.MIN_VALUE) {
						statement.setInt(10, anObject.dfDocCode);
					} else {
						statement.setNull(10, java.sql.Types.INTEGER);
					}
					statement.setString(11, anObject.responsFIO);
					statement.setString(12, anObject.responsPosition);
					statement.setString(13, anObject.responsGenitiveFIO);
					statement.setString(14, anObject.responsGenitivePosition);
					statement.setString(15, anObject.responsSurname);
					statement.setString(16, anObject.responsSurnameGenitive);
					statement.setString(17, anObject.responsName);
					statement.setString(18, anObject.responsNameGenitive);
					statement.setString(19, anObject.responsPatronimic);
					statement.setString(20, anObject.responsPatronimicGenitive);
					statement.setString(21, anObject.departmentName);
					statement.setString(22, anObject.departmentNameGenitive);
					if (anObject.actRef.code != Integer.MIN_VALUE) {
						statement.setInt(23, anObject.actRef.code);
					} else {
						statement.setNull(23, java.sql.Types.INTEGER);
					}
					statement.setInt(24, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
							continue;
						}
						if("USERADD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userAdd);
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
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
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
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1, null);
							} else {
								statement.setBigDecimal(i+1, new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("SPECIFICATIONS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.specifications);
							continue;
						}
						if("NUMBERHOURS".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.numberHours);
							continue;
						}
						if("DFDOCDECREECODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.DFDocDecreeCode);
							continue;
						}
						if("DFDOCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.dfDocCode);
							continue;
						}
						if("RESPONSFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.responsFIO);
							continue;
						}
						if("RESPONSPOSITION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.responsPosition);
							continue;
						}
						if("RESPONSGENITIVEFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.responsGenitiveFIO);
							continue;
						}
						if("RESPONSGENITIVEPOSITION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.responsGenitivePosition);
							continue;
						}
						if("RESPONSSURNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.responsSurname);
							continue;
						}
						if("RESPONSSURNAMEGENITIVE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.responsSurnameGenitive);
							continue;
						}
						if("RESPONSNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.responsName);
							continue;
						}
						if("RESPONSNAMEGENITIVE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.responsNameGenitive);
							continue;
						}
						if("RESPONSPATRONIMIC".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.responsPatronimic);
							continue;
						}
						if("RESPONSPATRONIMICGENITIVE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.responsPatronimicGenitive);
							continue;
						}
						if("DEPARTMENTNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.departmentName);
							continue;
						}
						if("DEPARTMENTNAMEGENITIVE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.departmentNameGenitive);
							continue;
						}
						if("ACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.actRef.code);
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

	} // end of save(ENAct2DFDocDecree anObject,String[] anAttributes)


	public ENAct2DFDocDecreeShort getShortObject(int anObjectCode) throws PersistenceException {
		ENAct2DFDocDecree filterObject = new ENAct2DFDocDecree();
		Vector<ENAct2DFDocDecreeShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENAct2DFDocDecreeShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENAct2DFDocDecree filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.specifications, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.numberHours, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.DFDocDecreeCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.dfDocCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.responsFIO, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.responsPosition, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.responsGenitiveFIO, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.responsGenitivePosition, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.responsSurname, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.responsSurnameGenitive, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.responsName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.responsNameGenitive, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.responsPatronimic, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.responsPatronimicGenitive, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.departmentName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.departmentNameGenitive, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENAct2DFDocDecreeFilter filter) {
		String out = buildCondition((ENAct2DFDocDecree)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENAct2DFDocDecree filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENAct2DFDocDecree.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENAct2DFDocDecree.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENAct2DFDocDecree.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENAct2DFDocDecree.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENAct2DFDocDecree.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENAct2DFDocDecree.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENAct2DFDocDecree.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.specifications, ENAct2DFDocDecree.specifications_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.numberHours, ENAct2DFDocDecree.numberHours_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.DFDocDecreeCode, ENAct2DFDocDecree.DFDocDecreeCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.dfDocCode, ENAct2DFDocDecree.dfDocCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.responsFIO, ENAct2DFDocDecree.responsFIO_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.responsPosition, ENAct2DFDocDecree.responsPosition_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.responsGenitiveFIO, ENAct2DFDocDecree.responsGenitiveFIO_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.responsGenitivePosition, ENAct2DFDocDecree.responsGenitivePosition_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.responsSurname, ENAct2DFDocDecree.responsSurname_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.responsSurnameGenitive, ENAct2DFDocDecree.responsSurnameGenitive_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.responsName, ENAct2DFDocDecree.responsName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.responsNameGenitive, ENAct2DFDocDecree.responsNameGenitive_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.responsPatronimic, ENAct2DFDocDecree.responsPatronimic_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.responsPatronimicGenitive, ENAct2DFDocDecree.responsPatronimicGenitive_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.departmentName, ENAct2DFDocDecree.departmentName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.departmentNameGenitive, ENAct2DFDocDecree.departmentNameGenitive_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actRef.code, ENAct2DFDocDecree.actRef_QFielld, out);
		}
		return out;
	}

	public ENAct2DFDocDecreeShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENAct2DFDocDecreeShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENAct2DFDocDecreeShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENAct2DFDocDecreeShortList getFilteredList(ENAct2DFDocDecree filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENAct2DFDocDecreeShortList getScrollableFilteredList(ENAct2DFDocDecree aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENAct2DFDocDecreeShortList getScrollableFilteredList(ENAct2DFDocDecree aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENAct2DFDocDecreeShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENAct2DFDocDecreeShortList getScrollableFilteredList(ENAct2DFDocDecreeFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENAct2DFDocDecreeShortList getScrollableFilteredList(ENAct2DFDocDecreeFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENAct2DFDocDecreeShortList getScrollableFilteredList(ENAct2DFDocDecree aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENAct2DFDocDecreeShortList result = new ENAct2DFDocDecreeShortList();
		ENAct2DFDocDecreeShort anObject;
		result.list = new Vector<ENAct2DFDocDecreeShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT2DFDOCDECREE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACT2DFDOCDECREE.CODE"+
			",ENACT2DFDOCDECREE.COMMENTGEN"+
			",ENACT2DFDOCDECREE.USERADD"+
			",ENACT2DFDOCDECREE.DATEADD"+
			",ENACT2DFDOCDECREE.USERGEN"+
			",ENACT2DFDOCDECREE.DATEEDIT"+
			",ENACT2DFDOCDECREE.SPECIFICATIONS"+
			",ENACT2DFDOCDECREE.NUMBERHOURS"+
			",ENACT2DFDOCDECREE.DFDOCDECREECODE"+
			",ENACT2DFDOCDECREE.DFDOCCODE"+
			",ENACT2DFDOCDECREE.RESPONSFIO"+
			",ENACT2DFDOCDECREE.RESPONSPOSITION"+
			",ENACT2DFDOCDECREE.RESPONSGENITIVEFIO"+
			",ENACT2DFDOCDECREE.RESPONSGENITIVEPOSITIN"+
			",ENACT2DFDOCDECREE.RESPONSSURNAME"+
			",ENACT2DFDOCDECREE.RESPONSSURNAMEGENITIVE"+
			",ENACT2DFDOCDECREE.RESPONSNAME"+
			",ENACT2DFDOCDECREE.RESPONSNAMEGENITIVE"+
			",ENACT2DFDOCDECREE.RESPONSPATRONIMIC"+
			",ENACT2DFDOCDECREE.RESPONSPATRONIMICGENTV"+
			",ENACT2DFDOCDECREE.DEPARTMENTNAME"+
			",ENACT2DFDOCDECREE.DEPARTMENTNAMEGENITIVE"+
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
		" FROM ENACT2DFDOCDECREE " +
			" LEFT JOIN ENACT on ENACT.CODE = ENACT2DFDOCDECREE.ACTREFCODE "+
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
				anObject = new ENAct2DFDocDecreeShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(2);
				anObject.userAdd = set.getString(3);
				anObject.dateAdd = set.getTimestamp(4);
				anObject.userGen = set.getString(5);
				anObject.dateEdit = set.getTimestamp(6);
				anObject.specifications = set.getString(7);
				anObject.numberHours = set.getInt(8);
				if ( set.wasNull() ) {
					anObject.numberHours = Integer.MIN_VALUE;
				}
				anObject.DFDocDecreeCode = set.getInt(9);
				if ( set.wasNull() ) {
					anObject.DFDocDecreeCode = Integer.MIN_VALUE;
				}
				anObject.dfDocCode = set.getInt(10);
				if ( set.wasNull() ) {
					anObject.dfDocCode = Integer.MIN_VALUE;
				}
				anObject.responsFIO = set.getString(11);
				anObject.responsPosition = set.getString(12);
				anObject.responsGenitiveFIO = set.getString(13);
				anObject.responsGenitivePosition = set.getString(14);
				anObject.responsSurname = set.getString(15);
				anObject.responsSurnameGenitive = set.getString(16);
				anObject.responsName = set.getString(17);
				anObject.responsNameGenitive = set.getString(18);
				anObject.responsPatronimic = set.getString(19);
				anObject.responsPatronimicGenitive = set.getString(20);
				anObject.departmentName = set.getString(21);
				anObject.departmentNameGenitive = set.getString(22);

				anObject.actRefCode = set.getInt(23);
				if(set.wasNull()) {
					anObject.actRefCode = Integer.MIN_VALUE;
				}
				anObject.actRefNumberGen = set.getString(24);
				anObject.actRefDateGen = set.getDate(25);
				anObject.actRefFinMolCode = set.getString(26);
				anObject.actRefFinMolName = set.getString(27);
				anObject.actRefFinMechanicName = set.getString(28);
				anObject.actRefInvNumber = set.getString(29);
				anObject.actRefUserGen = set.getString(30);
				anObject.actRefDateEdit = set.getDate(31);
				anObject.actRefDateAct = set.getDate(32);
				anObject.actRefMolCodeObject = set.getString(33);
				anObject.actRefCheckedByAccountant = set.getBoolean(34);
				if(set.wasNull()) {
					anObject.actRefCheckedByAccountant = null;
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
	
	public int[] getFilteredCodeArray(ENAct2DFDocDecreeFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENAct2DFDocDecreeFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENAct2DFDocDecree aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACT2DFDOCDECREE.CODE FROM ENACT2DFDOCDECREE";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT2DFDOCDECREE.CODE";
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


	public ENAct2DFDocDecree getObject(int uid) throws PersistenceException {
		ENAct2DFDocDecree result = new ENAct2DFDocDecree();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENAct2DFDocDecree anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENACT2DFDOCDECREE.CODE, ENACT2DFDOCDECREE.COMMENTGEN, ENACT2DFDOCDECREE.USERADD, ENACT2DFDOCDECREE.DATEADD, ENACT2DFDOCDECREE.USERGEN, ENACT2DFDOCDECREE.DATEEDIT, ENACT2DFDOCDECREE.MODIFY_TIME, ENACT2DFDOCDECREE.SPECIFICATIONS, ENACT2DFDOCDECREE.NUMBERHOURS, ENACT2DFDOCDECREE.DFDOCDECREECODE, ENACT2DFDOCDECREE.DFDOCCODE, ENACT2DFDOCDECREE.RESPONSFIO, ENACT2DFDOCDECREE.RESPONSPOSITION, ENACT2DFDOCDECREE.RESPONSGENITIVEFIO, ENACT2DFDOCDECREE.RESPONSGENITIVEPOSITIN, ENACT2DFDOCDECREE.RESPONSSURNAME, ENACT2DFDOCDECREE.RESPONSSURNAMEGENITIVE, ENACT2DFDOCDECREE.RESPONSNAME, ENACT2DFDOCDECREE.RESPONSNAMEGENITIVE, ENACT2DFDOCDECREE.RESPONSPATRONIMIC, ENACT2DFDOCDECREE.RESPONSPATRONIMICGENTV, ENACT2DFDOCDECREE.DEPARTMENTNAME, ENACT2DFDOCDECREE.DEPARTMENTNAMEGENITIVE, ENACT2DFDOCDECREE.ACTREFCODE "
			+" FROM ENACT2DFDOCDECREE WHERE ENACT2DFDOCDECREE.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.commentGen = set.getString(2);
				anObject.userAdd = set.getString(3);
				anObject.dateAdd = set.getTimestamp(4);
				anObject.userGen = set.getString(5);
				anObject.dateEdit = set.getTimestamp(6);
				anObject.modify_time = set.getLong(7);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.specifications = set.getString(8);
				anObject.numberHours = set.getInt(9);
				if (set.wasNull()) {
					anObject.numberHours = Integer.MIN_VALUE;
				}
				anObject.DFDocDecreeCode = set.getInt(10);
				if (set.wasNull()) {
					anObject.DFDocDecreeCode = Integer.MIN_VALUE;
				}
				anObject.dfDocCode = set.getInt(11);
				if (set.wasNull()) {
					anObject.dfDocCode = Integer.MIN_VALUE;
				}
				anObject.responsFIO = set.getString(12);
				anObject.responsPosition = set.getString(13);
				anObject.responsGenitiveFIO = set.getString(14);
				anObject.responsGenitivePosition = set.getString(15);
				anObject.responsSurname = set.getString(16);
				anObject.responsSurnameGenitive = set.getString(17);
				anObject.responsName = set.getString(18);
				anObject.responsNameGenitive = set.getString(19);
				anObject.responsPatronimic = set.getString(20);
				anObject.responsPatronimicGenitive = set.getString(21);
				anObject.departmentName = set.getString(22);
				anObject.departmentNameGenitive = set.getString(23);
				anObject.actRef.code = set.getInt(24);
				if (set.wasNull()) {
					anObject.actRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENAct2DFDocDecreeRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENAct2DFDocDecreeRef ref = new com.ksoe.energynet.valueobject.references.ENAct2DFDocDecreeRef();
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

		selectStr = "DELETE FROM  ENACT2DFDOCDECREE WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENAct2DFDocDecree object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENAct2DFDocDecree.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAct2DFDocDecree.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENAct2DFDocDecree.remove%} access denied");
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
	
	public long count(ENAct2DFDocDecreeFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENAct2DFDocDecreeFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENAct2DFDocDecreeFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENACT2DFDOCDECREE", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENACT2DFDOCDECREE WHERE code = ?", propertyName);
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

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENAct2DFDocDecreeFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENACT2DFDOCDECREE");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct2DFDocDecree.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENAct2DFDocDecree.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENACT2DFDOCDECREE.CODE FROM  ENACT2DFDOCDECREE WHERE  ENACT2DFDOCDECREE.CODE = ?";
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
		_checkConditionToken(condition,"code","ENACT2DFDOCDECREE.CODE");
		_checkConditionToken(condition,"commentgen","ENACT2DFDOCDECREE.COMMENTGEN");
		_checkConditionToken(condition,"useradd","ENACT2DFDOCDECREE.USERADD");
		_checkConditionToken(condition,"dateadd","ENACT2DFDOCDECREE.DATEADD");
		_checkConditionToken(condition,"usergen","ENACT2DFDOCDECREE.USERGEN");
		_checkConditionToken(condition,"dateedit","ENACT2DFDOCDECREE.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENACT2DFDOCDECREE.MODIFY_TIME");
		_checkConditionToken(condition,"specifications","ENACT2DFDOCDECREE.SPECIFICATIONS");
		_checkConditionToken(condition,"numberhours","ENACT2DFDOCDECREE.NUMBERHOURS");
		_checkConditionToken(condition,"dfdocdecreecode","ENACT2DFDOCDECREE.DFDOCDECREECODE");
		_checkConditionToken(condition,"dfdoccode","ENACT2DFDOCDECREE.DFDOCCODE");
		_checkConditionToken(condition,"responsfio","ENACT2DFDOCDECREE.RESPONSFIO");
		_checkConditionToken(condition,"responsposition","ENACT2DFDOCDECREE.RESPONSPOSITION");
		_checkConditionToken(condition,"responsgenitivefio","ENACT2DFDOCDECREE.RESPONSGENITIVEFIO");
		_checkConditionToken(condition,"responsgenitiveposition","ENACT2DFDOCDECREE.RESPONSGENITIVEPOSITIN");
		_checkConditionToken(condition,"responssurname","ENACT2DFDOCDECREE.RESPONSSURNAME");
		_checkConditionToken(condition,"responssurnamegenitive","ENACT2DFDOCDECREE.RESPONSSURNAMEGENITIVE");
		_checkConditionToken(condition,"responsname","ENACT2DFDOCDECREE.RESPONSNAME");
		_checkConditionToken(condition,"responsnamegenitive","ENACT2DFDOCDECREE.RESPONSNAMEGENITIVE");
		_checkConditionToken(condition,"responspatronimic","ENACT2DFDOCDECREE.RESPONSPATRONIMIC");
		_checkConditionToken(condition,"responspatronimicgenitive","ENACT2DFDOCDECREE.RESPONSPATRONIMICGENTV");
		_checkConditionToken(condition,"departmentname","ENACT2DFDOCDECREE.DEPARTMENTNAME");
		_checkConditionToken(condition,"departmentnamegenitive","ENACT2DFDOCDECREE.DEPARTMENTNAMEGENITIVE");
		// relationship conditions
		_checkConditionToken(condition,"actref","ACTREFCODE");
		_checkConditionToken(condition,"actref.code","ACTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENAct2DFDocDecree anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENACT2DFDOCDECREE", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENACT2DFDOCDECREE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENACT2DFDOCDECREE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENACT2DFDOCDECREE");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENAct2DFDocDecreeDAO
