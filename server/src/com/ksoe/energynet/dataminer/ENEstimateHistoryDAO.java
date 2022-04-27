//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENEstimateHistoryDAOGen;
import com.ksoe.energynet.valueobject.ENEstimateHistory;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.valueobject.RQOrderItem2ENEstimateItem;

/**
 * DAO Object for ENEstimateHistory;
 *
 */

public class ENEstimateHistoryDAO extends ENEstimateHistoryDAOGen {

    public ENEstimateHistoryDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENEstimateHistoryDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


    public int add(ENEstimateHistory anObject) throws PersistenceException {
        return this.add(anObject, true);
    }

    public int add(ENEstimateHistory anObject, boolean aUseSequential)
            throws PersistenceException {
        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;

        if (aUseSequential)
            _collectAutoIncrementFields(anObject, connection);

        selectStr = "INSERT INTO ENESTIMATEHISTORY (CODE,COUNTFACT,HISTORYTYPEREFCODE,ESTIMATEITEMREFCODE,RQORDERITEMREFCODE,RQBILLITEMREFCODE,FKORDERITEMREFCODE) VALUES (?,?,?,?,?,?,?)";

        try {
            statement = connection.prepareStatement(selectStr);
            if (anObject.code != Integer.MIN_VALUE)
                statement.setInt(1, anObject.code);
            else
                statement.setNull(1, java.sql.Types.INTEGER);
            if (anObject.countFact != null)
                anObject.countFact = anObject.countFact.setScale(6,
                        java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(2, anObject.countFact);
            if (anObject.historyTypeRef.code != Integer.MIN_VALUE) {
                statement.setInt(3, anObject.historyTypeRef.code);
            } else
                statement.setNull(3, java.sql.Types.INTEGER);
            if (anObject.estimateItemRef.code != Integer.MIN_VALUE) {
                statement.setInt(4, anObject.estimateItemRef.code);
            } else
                statement.setNull(4, java.sql.Types.INTEGER);
            if (anObject.rqOrderItemRef.code != Integer.MIN_VALUE) {
                statement.setInt(5, anObject.rqOrderItemRef.code);
            } else
                statement.setNull(5, java.sql.Types.INTEGER);
            if (anObject.rqBillItemRef.code != Integer.MIN_VALUE) {
                statement.setInt(6, anObject.rqBillItemRef.code);
            } else
                statement.setNull(6, java.sql.Types.INTEGER);
            if (anObject.fkOrderItemRef.code != Integer.MIN_VALUE) {
                statement.setInt(7, anObject.fkOrderItemRef.code);
            } else
                statement.setNull(7, java.sql.Types.INTEGER);

            statement.execute();
            return anObject.code;
        } catch (SQLException e) {
            _sequenceTable.clear();
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return Integer.MIN_VALUE;
        } catch (Exception e) {
            _sequenceTable.clear();
            throw new PersistenceException(
                    "Error in method {%ENEstimateHistoryDAOGen.add%}", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    // /////////// PRIVATE SECTION ///////////////
    protected static Hashtable _sequenceTable = new Hashtable();

    private void _collectAutoIncrementFields(ENEstimateHistory anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENESTIMATEHISTORY", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) {
            sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENESTIMATEHISTORY", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENESTIMATEHISTORY", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENESTIMATEHISTORY");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }
    
    
	public void add(Vector<ENEstimateHistory> addHist, boolean useSequential,Connection connection) throws PersistenceException {

		String insertStr;
		StringBuffer itemsStr;
		PreparedStatement statement = null;

		String usergen = getUserProfile().userName;
		long modify_time = System.currentTimeMillis();
		long dategen = modify_time / 1000;


		for (int i = 0; i < addHist.size(); i++) {
			if ((useSequential) || (addHist.get(i).code == Integer.MIN_VALUE)) _collectAutoIncrementFields(addHist.get(i), connection);
		}

		insertStr = " INSERT INTO ENESTIMATEHISTORY (CODE,COUNTFACT,HISTORYTYPEREFCODE,ESTIMATEITEMREFCODE,RQORDERITEMREFCODE,RQBILLITEMREFCODE,FKORDERITEMREFCODE) "
				+ " VALUES ";

		itemsStr = new StringBuffer("");


		for (int i = 0; i < addHist.size(); i++) {

			ENEstimateHistory hist = addHist.get(i);

			if (i!=0) itemsStr.append(", \n");
			itemsStr.append("(");

			if (hist.code != Integer.MIN_VALUE ) {
				itemsStr.append(""+hist.code);
			} else {
				itemsStr.append("null");
			}

			if (hist.countFact != null) {
				hist.countFact = hist.countFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				itemsStr.append(","+hist.countFact);
			} else {
				itemsStr.append(",null");
			}

	    	if (hist.historyTypeRef.code != Integer.MIN_VALUE ) {
				itemsStr.append(","+hist.historyTypeRef.code);
			} else {
				itemsStr.append(",null");
			}

			if (hist.estimateItemRef.code != Integer.MIN_VALUE ) {
				itemsStr.append(","+hist.estimateItemRef.code);
			} else {
				itemsStr.append(",null");
			}
			
			if (hist.rqOrderItemRef.code != Integer.MIN_VALUE ) {
				itemsStr.append(","+hist.rqOrderItemRef.code);
			} else {
				itemsStr.append(",null");
			}
			
			if (hist.rqBillItemRef.code != Integer.MIN_VALUE ) {
				itemsStr.append(","+hist.rqBillItemRef.code);
			} else {
				itemsStr.append(",null");
			}
			
			if (hist.fkOrderItemRef.code != Integer.MIN_VALUE ) {
				itemsStr.append(","+hist.fkOrderItemRef.code);
			} else {
				itemsStr.append(",null");
			}

			itemsStr.append(")");

		}

		try {

			statement = connection.prepareStatement(insertStr.concat(itemsStr.toString()));
			statement.execute();

			statement.close();
			//connection.close();

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENEstimateHistory.add%}",e);
		} finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			/*
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
			*/
		}
	}



} // end of ENEstimateHistoryDAO

