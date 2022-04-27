
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.Hashtable;
import java.util.Vector;

import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENGPSTrackerHistoryDAOGen;
import com.ksoe.energynet.valueobject.ENGPSTrackerHistory;

/**
 * DAO Object for ENGPSTrackerHistory;
 *
 */

public class ENGPSTrackerHistoryDAO extends ENGPSTrackerHistoryDAOGen {

    public ENGPSTrackerHistoryDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENGPSTrackerHistoryDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
///////////// PRIVATE SECTION ///////////////
protected static Hashtable<SequenceKey, SequenceValue> _sequenceTable = new Hashtable<SequenceKey, SequenceValue>();

private void _collectAutoIncrementFields(ENGPSTrackerHistory anObject, Connection connection) throws PersistenceException {

SequenceKey hashKey = new SequenceKey("ENGPSTRACKERHISTORY", "CODE");
Integer nextSeqValue = null;
SequenceValue sequenceValue;
synchronized (_sequenceTable) {
	sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
	if (sequenceValue == null) {
		sequenceValue = getNewSequenceValue("ENGPSTRACKERHISTORY", "CODE");
		_sequenceTable.put(hashKey, sequenceValue);
	}
	if (!sequenceValue.isNextValueAvailable()) {
		sequenceValue = getNewSequenceValue("ENGPSTRACKERHISTORY", "CODE");
		_sequenceTable.put(hashKey, sequenceValue);
	}
}

nextSeqValue = sequenceValue.getNextValue();
if (nextSeqValue == null) {
	throw new PersistenceException(
		"Can't obtain auto increment value from: ENGPSTRACKERHISTORY");
} else {
	anObject.code = nextSeqValue.intValue();
	return;
}
}
    
	public int add(ENGPSTrackerHistory anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.userGen = getUserProfile().userName;
		anObject.dateEdit = new Date();
		
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENGPSTRACKERHISTORY (CODE,DATESTART,DATEFINAL,REG_ID,PHONENUMBER,CARDNUMBER,USERGEN,DATEEDIT,REALTRANSPORTCODE,GPSTRACKERCODE) VALUES (?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.dateStart == null) {
				statement.setDate(2, null);
			} else {
				statement.setDate(2, new java.sql.Date(anObject.dateStart.getTime()));
			}
			if (anObject.dateFinal == null) {
				statement.setDate(3, null);
			} else {
				statement.setDate(3, new java.sql.Date(anObject.dateFinal.getTime()));
			}
			statement.setString(4, anObject.reg_id);
			statement.setString(5, anObject.phoneNumber);
			statement.setString(6, anObject.cardNumber);
			statement.setString(7, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(8, null);
			} else {
				statement.setTimestamp(8, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.realTransport.code != Integer.MIN_VALUE){
				statement.setInt(9,anObject.realTransport.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			if (anObject.gpsTracker.code != Integer.MIN_VALUE){
				statement.setInt(10,anObject.gpsTracker.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENGPSTrackerHistoryDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}


	public void save(ENGPSTrackerHistory anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("DATESTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REG_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PHONENUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CARDNUMBER") == 0) {
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
					if(fieldNameStr.compareTo("REALTRANSPORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GPSTRACKER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENGPSTRACKERHISTORY SET  DATESTART = ? , DATEFINAL = ? , REG_ID = ? , PHONENUMBER = ? , CARDNUMBER = ? , USERGEN = ? , DATEEDIT = ? , REALTRANSPORTCODE = ? , GPSTRACKERCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENGPSTRACKERHISTORY SET ";
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
					if (anObject.dateStart == null) {
						statement.setDate(1, null);
					} else {
						statement.setDate(1, new java.sql.Date(anObject.dateStart.getTime()));
					}
					if (anObject.dateFinal == null) {
						statement.setDate(2, null);
					} else {
						statement.setDate(2, new java.sql.Date(anObject.dateFinal.getTime()));
					}
					statement.setString(3, anObject.reg_id);
					statement.setString(4, anObject.phoneNumber);
					statement.setString(5, anObject.cardNumber);
					statement.setString(6, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(7, null);
					} else {
						statement.setTimestamp(7, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.realTransport.code != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.realTransport.code);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					if (anObject.gpsTracker.code != Integer.MIN_VALUE) {
						statement.setInt(9, anObject.gpsTracker.code);
					} else {
						statement.setNull(9, java.sql.Types.INTEGER);
					}
					statement.setInt(10, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DATESTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateStart == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateStart.getTime()));
							}
							continue;
						}
						if("DATEFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateFinal == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateFinal.getTime()));
							}
							continue;
						}
						if("REG_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.reg_id);
							continue;
						}
						if("PHONENUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.phoneNumber);
							continue;
						}
						if("CARDNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.cardNumber);
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
						if("REALTRANSPORT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.realTransport.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.realTransport.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("GPSTRACKER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.gpsTracker.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.gpsTracker.code);
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

	} // end of save(ENGPSTrackerHistory anObject,String[] anAttributes)



} // end of ENGPSTrackerHistoryDAO
