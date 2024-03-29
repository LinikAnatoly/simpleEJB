
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2022 SIT
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
import com.ksoe.energynet.valueobject.ENTravelSheetFuelRemains;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelRemainsFilter;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetFuelRemainsShort;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelRemainsShortList;


/**
 * DAO Object for ENTravelSheetFuelRemains;
 *
 */

public class ENTravelSheetFuelRemainsDAOGen extends GenericDataMiner {

	public ENTravelSheetFuelRemainsDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENTravelSheetFuelRemainsDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENTravelSheetFuelRemains inObject) throws PersistenceException {
		ENTravelSheetFuelRemains obj = new ENTravelSheetFuelRemains();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
					return false;
				}

		if(inObject.countGenStart == null && obj.countGenStart == null){}
		else
			if(inObject.countGenStart == null || obj.countGenStart == null) return false;
			else
				if ( ! inObject.countGenStart.equals(obj.countGenStart)){
					return false;
				}

		if(inObject.priceGenStart == null && obj.priceGenStart == null){}
		else
			if(inObject.priceGenStart == null || obj.priceGenStart == null) return false;
			else
				if ( ! inObject.priceGenStart.equals(obj.priceGenStart)){
					return false;
				}

		if(inObject.sumGenStart == null && obj.sumGenStart == null){}
		else
			if(inObject.sumGenStart == null || obj.sumGenStart == null) return false;
			else
				if ( ! inObject.sumGenStart.equals(obj.sumGenStart)){
					return false;
				}

		if(inObject.countGenIn == null && obj.countGenIn == null){}
		else
			if(inObject.countGenIn == null || obj.countGenIn == null) return false;
			else
				if ( ! inObject.countGenIn.equals(obj.countGenIn)){
					return false;
				}

		if(inObject.priceGenIn == null && obj.priceGenIn == null){}
		else
			if(inObject.priceGenIn == null || obj.priceGenIn == null) return false;
			else
				if ( ! inObject.priceGenIn.equals(obj.priceGenIn)){
					return false;
				}

		if(inObject.sumGenIn == null && obj.sumGenIn == null){}
		else
			if(inObject.sumGenIn == null || obj.sumGenIn == null) return false;
			else
				if ( ! inObject.sumGenIn.equals(obj.sumGenIn)){
					return false;
				}

		if(inObject.countGenOut == null && obj.countGenOut == null){}
		else
			if(inObject.countGenOut == null || obj.countGenOut == null) return false;
			else
				if ( ! inObject.countGenOut.equals(obj.countGenOut)){
					return false;
				}

		if(inObject.priceGenOut == null && obj.priceGenOut == null){}
		else
			if(inObject.priceGenOut == null || obj.priceGenOut == null) return false;
			else
				if ( ! inObject.priceGenOut.equals(obj.priceGenOut)){
					return false;
				}

		if(inObject.sumGenOut == null && obj.sumGenOut == null){}
		else
			if(inObject.sumGenOut == null || obj.sumGenOut == null) return false;
			else
				if ( ! inObject.sumGenOut.equals(obj.sumGenOut)){
					return false;
				}

		if(inObject.countGenFinal == null && obj.countGenFinal == null){}
		else
			if(inObject.countGenFinal == null || obj.countGenFinal == null) return false;
			else
				if ( ! inObject.countGenFinal.equals(obj.countGenFinal)){
					return false;
				}

		if(inObject.priceGenFinal == null && obj.priceGenFinal == null){}
		else
			if(inObject.priceGenFinal == null || obj.priceGenFinal == null) return false;
			else
				if ( ! inObject.priceGenFinal.equals(obj.priceGenFinal)){
					return false;
				}

		if(inObject.sumGenFinal == null && obj.sumGenFinal == null){}
		else
			if(inObject.sumGenFinal == null || obj.sumGenFinal == null) return false;
			else
				if ( ! inObject.sumGenFinal.equals(obj.sumGenFinal)){
					return false;
				}

		if(inObject.isThirdParty == null && obj.isThirdParty == null){} else 
			if(inObject.isThirdParty == null || obj.isThirdParty == null) return false;
			else
				if (inObject.isThirdParty.compareTo(obj.isThirdParty) != 0){
					return false;
				}
		if (inObject.travelSheetRef.code != obj.travelSheetRef.code){
			return false;
		}
		if (inObject.fuelTypeRef.code != obj.fuelTypeRef.code){
			return false;
		}
		if (inObject.realTransport.code != obj.realTransport.code){
			return false;
		}
		if (inObject.travelSheetFuelTypeRef.code != obj.travelSheetFuelTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENTravelSheetFuelRemains anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENTravelSheetFuelRemains anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENTRAVELSHEETFUELREMNS (CODE,DATEGEN,COUNTGENSTART,PRICEGENSTART,SUMGENSTART,COUNTGENIN,PRICEGENIN,SUMGENIN,COUNTGENOUT,PRICEGENOUT,SUMGENOUT,COUNTGENFINAL,PRICEGENFINAL,SUMGENFINAL,ISTHIRDPARTY,MODIFY_TIME,TRAVELSHEETREFCODE,FUELTYPEREFCODE,REALTRANSPORTCODE,TRAVELSHEETFUELTYPRFCD) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.dateGen == null) {
				statement.setDate(2, null);
			} else {
				statement.setDate(2, new java.sql.Date(anObject.dateGen.getTime()));
			}
			if (anObject.countGenStart != null) {
				anObject.countGenStart = anObject.countGenStart.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3, anObject.countGenStart);
			if (anObject.priceGenStart != null) {
				anObject.priceGenStart = anObject.priceGenStart.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4, anObject.priceGenStart);
			if (anObject.sumGenStart != null) {
				anObject.sumGenStart = anObject.sumGenStart.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5, anObject.sumGenStart);
			if (anObject.countGenIn != null) {
				anObject.countGenIn = anObject.countGenIn.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6, anObject.countGenIn);
			if (anObject.priceGenIn != null) {
				anObject.priceGenIn = anObject.priceGenIn.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7, anObject.priceGenIn);
			if (anObject.sumGenIn != null) {
				anObject.sumGenIn = anObject.sumGenIn.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8, anObject.sumGenIn);
			if (anObject.countGenOut != null) {
				anObject.countGenOut = anObject.countGenOut.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9, anObject.countGenOut);
			if (anObject.priceGenOut != null) {
				anObject.priceGenOut = anObject.priceGenOut.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10, anObject.priceGenOut);
			if (anObject.sumGenOut != null) {
				anObject.sumGenOut = anObject.sumGenOut.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11, anObject.sumGenOut);
			if (anObject.countGenFinal != null) {
				anObject.countGenFinal = anObject.countGenFinal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(12, anObject.countGenFinal);
			if (anObject.priceGenFinal != null) {
				anObject.priceGenFinal = anObject.priceGenFinal.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(13, anObject.priceGenFinal);
			if (anObject.sumGenFinal != null) {
				anObject.sumGenFinal = anObject.sumGenFinal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(14, anObject.sumGenFinal);
			if (anObject.isThirdParty != null) {
				statement.setBoolean(15, anObject.isThirdParty);
			} else {
				statement.setNull(15, java.sql.Types.BOOLEAN);
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(16, null);
			} else {
				statement.setBigDecimal(16, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.travelSheetRef.code != Integer.MIN_VALUE){
				statement.setInt(17,anObject.travelSheetRef.code);
			} else {
				statement.setNull(17,java.sql.Types.INTEGER);
			}
			if (anObject.fuelTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(18,anObject.fuelTypeRef.code);
			} else {
				statement.setNull(18,java.sql.Types.INTEGER);
			}
			if (anObject.realTransport.code != Integer.MIN_VALUE){
				statement.setInt(19,anObject.realTransport.code);
			} else {
				statement.setNull(19,java.sql.Types.INTEGER);
			}
			if (anObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(20,anObject.travelSheetFuelTypeRef.code);
			} else {
				statement.setNull(20,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENTravelSheetFuelRemainsDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENTravelSheetFuelRemains anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENTravelSheetFuelRemains anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENTravelSheetFuelRemains oldObject = new ENTravelSheetFuelRemains();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENTravelSheetFuelRemains.modify_time_Field+" FROM  ENTRAVELSHEETFUELREMNS WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTGENSTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICEGENSTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMGENSTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTGENIN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICEGENIN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMGENIN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTGENOUT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICEGENOUT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMGENOUT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTGENFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICEGENFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMGENFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISTHIRDPARTY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRAVELSHEETREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FUELTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REALTRANSPORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRAVELSHEETFUELTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENTRAVELSHEETFUELREMNS SET  DATEGEN = ? , COUNTGENSTART = ? , PRICEGENSTART = ? , SUMGENSTART = ? , COUNTGENIN = ? , PRICEGENIN = ? , SUMGENIN = ? , COUNTGENOUT = ? , PRICEGENOUT = ? , SUMGENOUT = ? , COUNTGENFINAL = ? , PRICEGENFINAL = ? , SUMGENFINAL = ? , ISTHIRDPARTY = ? , MODIFY_TIME = ? , TRAVELSHEETREFCODE = ? , FUELTYPEREFCODE = ? , REALTRANSPORTCODE = ? , TRAVELSHEETFUELTYPRFCD = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENTRAVELSHEETFUELREMAINS SET ";
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
					if (anObject.dateGen == null) {
						statement.setDate(1, null);
					} else {
						statement.setDate(1, new java.sql.Date(anObject.dateGen.getTime()));
					}
					if (anObject.countGenStart != null) {
						anObject.countGenStart = anObject.countGenStart.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2, anObject.countGenStart);
					if (anObject.priceGenStart != null) {
						anObject.priceGenStart = anObject.priceGenStart.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3, anObject.priceGenStart);
					if (anObject.sumGenStart != null) {
						anObject.sumGenStart = anObject.sumGenStart.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4, anObject.sumGenStart);
					if (anObject.countGenIn != null) {
						anObject.countGenIn = anObject.countGenIn.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5, anObject.countGenIn);
					if (anObject.priceGenIn != null) {
						anObject.priceGenIn = anObject.priceGenIn.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6, anObject.priceGenIn);
					if (anObject.sumGenIn != null) {
						anObject.sumGenIn = anObject.sumGenIn.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7, anObject.sumGenIn);
					if (anObject.countGenOut != null) {
						anObject.countGenOut = anObject.countGenOut.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8, anObject.countGenOut);
					if (anObject.priceGenOut != null) {
						anObject.priceGenOut = anObject.priceGenOut.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9, anObject.priceGenOut);
					if (anObject.sumGenOut != null) {
						anObject.sumGenOut = anObject.sumGenOut.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10, anObject.sumGenOut);
					if (anObject.countGenFinal != null) {
						anObject.countGenFinal = anObject.countGenFinal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(11, anObject.countGenFinal);
					if (anObject.priceGenFinal != null) {
						anObject.priceGenFinal = anObject.priceGenFinal.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(12, anObject.priceGenFinal);
					if (anObject.sumGenFinal != null) {
						anObject.sumGenFinal = anObject.sumGenFinal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(13, anObject.sumGenFinal);
					if (anObject.isThirdParty == null) {
						statement.setNull(14, java.sql.Types.BOOLEAN);
					} else {
						statement.setBoolean(14, anObject.isThirdParty);
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(15, null);
					} else {
						statement.setBigDecimal(15, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.travelSheetRef.code != Integer.MIN_VALUE) {
						statement.setInt(16, anObject.travelSheetRef.code);
					} else {
						statement.setNull(16, java.sql.Types.INTEGER);
					}
					if (anObject.fuelTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(17, anObject.fuelTypeRef.code);
					} else {
						statement.setNull(17, java.sql.Types.INTEGER);
					}
					if (anObject.realTransport.code != Integer.MIN_VALUE) {
						statement.setInt(18, anObject.realTransport.code);
					} else {
						statement.setNull(18, java.sql.Types.INTEGER);
					}
					if (anObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(19, anObject.travelSheetFuelTypeRef.code);
					} else {
						statement.setNull(19, java.sql.Types.INTEGER);
					}
					statement.setInt(20, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DATEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateGen == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateGen.getTime()));
							}
							continue;
						}
						if("COUNTGENSTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGenStart != null) {
								anObject.countGenStart = anObject.countGenStart.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.countGenStart);
							continue;
						}
						if("PRICEGENSTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.priceGenStart != null) {
								anObject.priceGenStart = anObject.priceGenStart.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.priceGenStart);
							continue;
						}
						if("SUMGENSTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sumGenStart != null) {
								anObject.sumGenStart = anObject.sumGenStart.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sumGenStart);
							continue;
						}
						if("COUNTGENIN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGenIn != null) {
								anObject.countGenIn = anObject.countGenIn.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.countGenIn);
							continue;
						}
						if("PRICEGENIN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.priceGenIn != null) {
								anObject.priceGenIn = anObject.priceGenIn.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.priceGenIn);
							continue;
						}
						if("SUMGENIN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sumGenIn != null) {
								anObject.sumGenIn = anObject.sumGenIn.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sumGenIn);
							continue;
						}
						if("COUNTGENOUT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGenOut != null) {
								anObject.countGenOut = anObject.countGenOut.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.countGenOut);
							continue;
						}
						if("PRICEGENOUT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.priceGenOut != null) {
								anObject.priceGenOut = anObject.priceGenOut.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.priceGenOut);
							continue;
						}
						if("SUMGENOUT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sumGenOut != null) {
								anObject.sumGenOut = anObject.sumGenOut.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sumGenOut);
							continue;
						}
						if("COUNTGENFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGenFinal != null) {
								anObject.countGenFinal = anObject.countGenFinal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.countGenFinal);
							continue;
						}
						if("PRICEGENFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.priceGenFinal != null) {
								anObject.priceGenFinal = anObject.priceGenFinal.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.priceGenFinal);
							continue;
						}
						if("SUMGENFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sumGenFinal != null) {
								anObject.sumGenFinal = anObject.sumGenFinal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sumGenFinal);
							continue;
						}
						if("ISTHIRDPARTY".compareTo((String)fields.get(i)) == 0) {
								statement.setBoolean(i+1, anObject.isThirdParty);
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
						if("TRAVELSHEETREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.travelSheetRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.travelSheetRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("FUELTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.fuelTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.fuelTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
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
						if("TRAVELSHEETFUELTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.travelSheetFuelTypeRef.code);
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

	} // end of save(ENTravelSheetFuelRemains anObject,String[] anAttributes)


	public ENTravelSheetFuelRemainsShort getShortObject(int anObjectCode) throws PersistenceException {
		ENTravelSheetFuelRemains filterObject = new ENTravelSheetFuelRemains();
		Vector<ENTravelSheetFuelRemainsShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENTravelSheetFuelRemainsShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENTravelSheetFuelRemains filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGenStart, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.priceGenStart, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sumGenStart, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGenIn, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.priceGenIn, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sumGenIn, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGenOut, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.priceGenOut, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sumGenOut, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGenFinal, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.priceGenFinal, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sumGenFinal, index, statement);
			index = BaseDAOUtils.setBooleanParameter(filter.isThirdParty, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.travelSheetRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.fuelTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.realTransport.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.travelSheetFuelTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENTravelSheetFuelRemainsFilter filter) {
		String out = buildCondition((ENTravelSheetFuelRemains)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENTravelSheetFuelRemains filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENTravelSheetFuelRemains.code_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENTravelSheetFuelRemains.dateGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGenStart, ENTravelSheetFuelRemains.countGenStart_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.priceGenStart, ENTravelSheetFuelRemains.priceGenStart_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sumGenStart, ENTravelSheetFuelRemains.sumGenStart_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGenIn, ENTravelSheetFuelRemains.countGenIn_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.priceGenIn, ENTravelSheetFuelRemains.priceGenIn_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sumGenIn, ENTravelSheetFuelRemains.sumGenIn_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGenOut, ENTravelSheetFuelRemains.countGenOut_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.priceGenOut, ENTravelSheetFuelRemains.priceGenOut_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sumGenOut, ENTravelSheetFuelRemains.sumGenOut_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGenFinal, ENTravelSheetFuelRemains.countGenFinal_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.priceGenFinal, ENTravelSheetFuelRemains.priceGenFinal_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sumGenFinal, ENTravelSheetFuelRemains.sumGenFinal_QFielld, out);
			out = BaseDAOUtils.addBooleanToCondition(filter.isThirdParty, ENTravelSheetFuelRemains.isThirdParty_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENTravelSheetFuelRemains.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.travelSheetRef.code, ENTravelSheetFuelRemains.travelSheetRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.fuelTypeRef.code, ENTravelSheetFuelRemains.fuelTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.realTransport.code, ENTravelSheetFuelRemains.realTransport_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.travelSheetFuelTypeRef.code, ENTravelSheetFuelRemains.travelSheetFuelTypeRef_QFielld, out);
		}
		return out;
	}

	public ENTravelSheetFuelRemainsShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENTravelSheetFuelRemainsShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENTravelSheetFuelRemainsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENTravelSheetFuelRemainsShortList getFilteredList(ENTravelSheetFuelRemains filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENTravelSheetFuelRemainsShortList getScrollableFilteredList(ENTravelSheetFuelRemains aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENTravelSheetFuelRemainsShortList getScrollableFilteredList(ENTravelSheetFuelRemains aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENTravelSheetFuelRemainsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENTravelSheetFuelRemainsShortList getScrollableFilteredList(ENTravelSheetFuelRemainsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENTravelSheetFuelRemainsShortList getScrollableFilteredList(ENTravelSheetFuelRemainsFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENTravelSheetFuelRemainsShortList getScrollableFilteredList(ENTravelSheetFuelRemains aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENTravelSheetFuelRemainsShortList result = new ENTravelSheetFuelRemainsShortList();
		ENTravelSheetFuelRemainsShort anObject;
		result.list = new Vector<ENTravelSheetFuelRemainsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTRAVELSHEETFUELREMNS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENTRAVELSHEETFUELREMNS.CODE"+
			",ENTRAVELSHEETFUELREMNS.DATEGEN"+
			",ENTRAVELSHEETFUELREMNS.COUNTGENSTART"+
			",ENTRAVELSHEETFUELREMNS.PRICEGENSTART"+
			",ENTRAVELSHEETFUELREMNS.SUMGENSTART"+
			",ENTRAVELSHEETFUELREMNS.COUNTGENIN"+
			",ENTRAVELSHEETFUELREMNS.PRICEGENIN"+
			",ENTRAVELSHEETFUELREMNS.SUMGENIN"+
			",ENTRAVELSHEETFUELREMNS.COUNTGENOUT"+
			",ENTRAVELSHEETFUELREMNS.PRICEGENOUT"+
			",ENTRAVELSHEETFUELREMNS.SUMGENOUT"+
			",ENTRAVELSHEETFUELREMNS.COUNTGENFINAL"+
			",ENTRAVELSHEETFUELREMNS.PRICEGENFINAL"+
			",ENTRAVELSHEETFUELREMNS.SUMGENFINAL"+
			",ENTRAVELSHEETFUELREMNS.ISTHIRDPARTY"+
			", ENTRAVELSHEET.CODE " +
			", ENTRAVELSHEET.NUMBERGEN " +
			", ENTRAVELSHEET.DATESTART " +
			", ENTRAVELSHEET.DATEFINAL " +
			", ENTRAVELSHEET.SPEEDOMETERSTART " +
			", ENTRAVELSHEET.SPEEDOMETERFINAL " +
			", ENTRAVELSHEET.FUELCOUNTERSTART " +
			", ENTRAVELSHEET.FUELCOUNTERFINAL " +
			", ENTRAVELSHEET.TIMESTART " +
			", ENTRAVELSHEET.TIMEFINAL " +
			", ENTRAVELSHEET.DATEEDIT " +
			", ENTRAVELSHEET.USERGEN " +
			", TKFUELTYPE.CODE " +
			", TKFUELTYPE.NAME " +
			", TKTRANSPORTREAL.CODE " +
			", TKTRANSPORTREAL.NAME " +
			", TKTRANSPORTREAL.INVNUMBER " +
			", TKTRANSPORTREAL.GOSNUMBER " +
			", ENTRAVELSHEETFUELTYPE.CODE " +
			", ENTRAVELSHEETFUELTYPE.NAME " +
		" FROM ENTRAVELSHEETFUELREMNS " +
			" LEFT JOIN ENTRAVELSHEET on ENTRAVELSHEET.CODE = ENTRAVELSHEETFUELREMNS.TRAVELSHEETREFCODE "+
			" LEFT JOIN TKFUELTYPE on TKFUELTYPE.CODE = ENTRAVELSHEETFUELREMNS.FUELTYPEREFCODE "+
			" LEFT JOIN TKTRANSPORTREAL on TKTRANSPORTREAL.CODE = ENTRAVELSHEETFUELREMNS.REALTRANSPORTCODE "+
			" LEFT JOIN ENTRAVELSHEETFUELTYPE on ENTRAVELSHEETFUELTYPE.CODE = ENTRAVELSHEETFUELREMNS.TRAVELSHEETFUELTYPRFCD "+
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
				anObject = new ENTravelSheetFuelRemainsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.dateGen = set.getDate(2);
				anObject.countGenStart = set.getBigDecimal(3);
				if(anObject.countGenStart != null) {
					anObject.countGenStart = anObject.countGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceGenStart = set.getBigDecimal(4);
				if(anObject.priceGenStart != null) {
					anObject.priceGenStart = anObject.priceGenStart.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGenStart = set.getBigDecimal(5);
				if(anObject.sumGenStart != null) {
					anObject.sumGenStart = anObject.sumGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countGenIn = set.getBigDecimal(6);
				if(anObject.countGenIn != null) {
					anObject.countGenIn = anObject.countGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceGenIn = set.getBigDecimal(7);
				if(anObject.priceGenIn != null) {
					anObject.priceGenIn = anObject.priceGenIn.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGenIn = set.getBigDecimal(8);
				if(anObject.sumGenIn != null) {
					anObject.sumGenIn = anObject.sumGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countGenOut = set.getBigDecimal(9);
				if(anObject.countGenOut != null) {
					anObject.countGenOut = anObject.countGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceGenOut = set.getBigDecimal(10);
				if(anObject.priceGenOut != null) {
					anObject.priceGenOut = anObject.priceGenOut.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGenOut = set.getBigDecimal(11);
				if(anObject.sumGenOut != null) {
					anObject.sumGenOut = anObject.sumGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countGenFinal = set.getBigDecimal(12);
				if(anObject.countGenFinal != null) {
					anObject.countGenFinal = anObject.countGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceGenFinal = set.getBigDecimal(13);
				if(anObject.priceGenFinal != null) {
					anObject.priceGenFinal = anObject.priceGenFinal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGenFinal = set.getBigDecimal(14);
				if(anObject.sumGenFinal != null) {
					anObject.sumGenFinal = anObject.sumGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.isThirdParty = set.getBoolean(15);
				if ( set.wasNull() ) {
					anObject.isThirdParty = null;
				}

				anObject.travelSheetRefCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.travelSheetRefCode = Integer.MIN_VALUE;
				}
				anObject.travelSheetRefNumberGen = set.getString(17);
				anObject.travelSheetRefDateStart = set.getDate(18);
				anObject.travelSheetRefDateFinal = set.getDate(19);
				anObject.travelSheetRefSpeedometerStart = set.getBigDecimal(20);
				if(anObject.travelSheetRefSpeedometerStart != null) {
					anObject.travelSheetRefSpeedometerStart = anObject.travelSheetRefSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelSheetRefSpeedometerFinal = set.getBigDecimal(21);
				if(anObject.travelSheetRefSpeedometerFinal != null) {
					anObject.travelSheetRefSpeedometerFinal = anObject.travelSheetRefSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelSheetRefFuelCounterStart = set.getBigDecimal(22);
				if(anObject.travelSheetRefFuelCounterStart != null) {
					anObject.travelSheetRefFuelCounterStart = anObject.travelSheetRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelSheetRefFuelCounterFinal = set.getBigDecimal(23);
				if(anObject.travelSheetRefFuelCounterFinal != null) {
					anObject.travelSheetRefFuelCounterFinal = anObject.travelSheetRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelSheetRefTimeStart = set.getTimestamp(24);
				anObject.travelSheetRefTimeFinal = set.getTimestamp(25);
				anObject.travelSheetRefDateEdit = set.getTimestamp(26);
				anObject.travelSheetRefUserGen = set.getString(27);
				anObject.fuelTypeRefCode = set.getInt(28);
				if(set.wasNull()) {
					anObject.fuelTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.fuelTypeRefName = set.getString(29);
				anObject.realTransportCode = set.getInt(30);
				if(set.wasNull()) {
					anObject.realTransportCode = Integer.MIN_VALUE;
				}
				anObject.realTransportName = set.getString(31);
				anObject.realTransportInvNumber = set.getString(32);
				anObject.realTransportGosNumber = set.getString(33);
				anObject.travelSheetFuelTypeRefCode = set.getInt(34);
				if(set.wasNull()) {
					anObject.travelSheetFuelTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.travelSheetFuelTypeRefName = set.getString(35);

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
	
	public int[] getFilteredCodeArray(ENTravelSheetFuelRemainsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENTravelSheetFuelRemainsFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENTravelSheetFuelRemains aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENTRAVELSHEETFUELREMNS.CODE FROM ENTRAVELSHEETFUELREMNS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTRAVELSHEETFUELREMNS.CODE";
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


	public ENTravelSheetFuelRemains getObject(int uid) throws PersistenceException {
		ENTravelSheetFuelRemains result = new ENTravelSheetFuelRemains();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENTravelSheetFuelRemains anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENTRAVELSHEETFUELREMNS.CODE, ENTRAVELSHEETFUELREMNS.DATEGEN, ENTRAVELSHEETFUELREMNS.COUNTGENSTART, ENTRAVELSHEETFUELREMNS.PRICEGENSTART, ENTRAVELSHEETFUELREMNS.SUMGENSTART, ENTRAVELSHEETFUELREMNS.COUNTGENIN, ENTRAVELSHEETFUELREMNS.PRICEGENIN, ENTRAVELSHEETFUELREMNS.SUMGENIN, ENTRAVELSHEETFUELREMNS.COUNTGENOUT, ENTRAVELSHEETFUELREMNS.PRICEGENOUT, ENTRAVELSHEETFUELREMNS.SUMGENOUT, ENTRAVELSHEETFUELREMNS.COUNTGENFINAL, ENTRAVELSHEETFUELREMNS.PRICEGENFINAL, ENTRAVELSHEETFUELREMNS.SUMGENFINAL, ENTRAVELSHEETFUELREMNS.ISTHIRDPARTY, ENTRAVELSHEETFUELREMNS.MODIFY_TIME, ENTRAVELSHEETFUELREMNS.TRAVELSHEETREFCODE, ENTRAVELSHEETFUELREMNS.FUELTYPEREFCODE, ENTRAVELSHEETFUELREMNS.REALTRANSPORTCODE, ENTRAVELSHEETFUELREMNS.TRAVELSHEETFUELTYPRFCD "
			+" FROM ENTRAVELSHEETFUELREMNS WHERE ENTRAVELSHEETFUELREMNS.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.dateGen = set.getDate(2);
				anObject.countGenStart = set.getBigDecimal(3);
				if(anObject.countGenStart != null) {
					anObject.countGenStart = anObject.countGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceGenStart = set.getBigDecimal(4);
				if(anObject.priceGenStart != null) {
					anObject.priceGenStart = anObject.priceGenStart.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGenStart = set.getBigDecimal(5);
				if(anObject.sumGenStart != null) {
					anObject.sumGenStart = anObject.sumGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countGenIn = set.getBigDecimal(6);
				if(anObject.countGenIn != null) {
					anObject.countGenIn = anObject.countGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceGenIn = set.getBigDecimal(7);
				if(anObject.priceGenIn != null) {
					anObject.priceGenIn = anObject.priceGenIn.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGenIn = set.getBigDecimal(8);
				if(anObject.sumGenIn != null) {
					anObject.sumGenIn = anObject.sumGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countGenOut = set.getBigDecimal(9);
				if(anObject.countGenOut != null) {
					anObject.countGenOut = anObject.countGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceGenOut = set.getBigDecimal(10);
				if(anObject.priceGenOut != null) {
					anObject.priceGenOut = anObject.priceGenOut.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGenOut = set.getBigDecimal(11);
				if(anObject.sumGenOut != null) {
					anObject.sumGenOut = anObject.sumGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countGenFinal = set.getBigDecimal(12);
				if(anObject.countGenFinal != null) {
					anObject.countGenFinal = anObject.countGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceGenFinal = set.getBigDecimal(13);
				if(anObject.priceGenFinal != null) {
					anObject.priceGenFinal = anObject.priceGenFinal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGenFinal = set.getBigDecimal(14);
				if(anObject.sumGenFinal != null) {
					anObject.sumGenFinal = anObject.sumGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.isThirdParty = set.getBoolean(15);
				if (set.wasNull()) {
					anObject.isThirdParty = null;
				}
				anObject.modify_time = set.getLong(16);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.travelSheetRef.code = set.getInt(17);
				if (set.wasNull()) {
					anObject.travelSheetRef.code = Integer.MIN_VALUE;
				}
				anObject.fuelTypeRef.code = set.getInt(18);
				if (set.wasNull()) {
					anObject.fuelTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.realTransport.code = set.getInt(19);
				if (set.wasNull()) {
					anObject.realTransport.code = Integer.MIN_VALUE;
				}
				anObject.travelSheetFuelTypeRef.code = set.getInt(20);
				if (set.wasNull()) {
					anObject.travelSheetFuelTypeRef.code = Integer.MIN_VALUE;
				}
				if(anObject.realTransport.code != Integer.MIN_VALUE) {
					anObject.setRealTransport(
						new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.realTransport.code));
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


	public com.ksoe.energynet.valueobject.references.ENTravelSheetFuelRemainsRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENTravelSheetFuelRemainsRef ref = new com.ksoe.energynet.valueobject.references.ENTravelSheetFuelRemainsRef();
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

		selectStr = "DELETE FROM  ENTRAVELSHEETFUELREMNS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENTravelSheetFuelRemains object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENTravelSheetFuelRemains.getObject%} access denied");
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
	
	public long count(ENTravelSheetFuelRemainsFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENTravelSheetFuelRemainsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENTravelSheetFuelRemainsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENTRAVELSHEETFUELREMNS", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENTRAVELSHEETFUELREMNS WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENTravelSheetFuelRemainsFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENTravelSheetFuelRemainsFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENTRAVELSHEETFUELREMNS");
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
			"SELECT  ENTRAVELSHEETFUELREMNS.CODE FROM  ENTRAVELSHEETFUELREMNS WHERE  ENTRAVELSHEETFUELREMNS.CODE = ?";
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
		_checkConditionToken(condition,"code","ENTRAVELSHEETFUELREMNS.CODE");
		_checkConditionToken(condition,"dategen","ENTRAVELSHEETFUELREMNS.DATEGEN");
		_checkConditionToken(condition,"countgenstart","ENTRAVELSHEETFUELREMNS.COUNTGENSTART");
		_checkConditionToken(condition,"pricegenstart","ENTRAVELSHEETFUELREMNS.PRICEGENSTART");
		_checkConditionToken(condition,"sumgenstart","ENTRAVELSHEETFUELREMNS.SUMGENSTART");
		_checkConditionToken(condition,"countgenin","ENTRAVELSHEETFUELREMNS.COUNTGENIN");
		_checkConditionToken(condition,"pricegenin","ENTRAVELSHEETFUELREMNS.PRICEGENIN");
		_checkConditionToken(condition,"sumgenin","ENTRAVELSHEETFUELREMNS.SUMGENIN");
		_checkConditionToken(condition,"countgenout","ENTRAVELSHEETFUELREMNS.COUNTGENOUT");
		_checkConditionToken(condition,"pricegenout","ENTRAVELSHEETFUELREMNS.PRICEGENOUT");
		_checkConditionToken(condition,"sumgenout","ENTRAVELSHEETFUELREMNS.SUMGENOUT");
		_checkConditionToken(condition,"countgenfinal","ENTRAVELSHEETFUELREMNS.COUNTGENFINAL");
		_checkConditionToken(condition,"pricegenfinal","ENTRAVELSHEETFUELREMNS.PRICEGENFINAL");
		_checkConditionToken(condition,"sumgenfinal","ENTRAVELSHEETFUELREMNS.SUMGENFINAL");
		_checkConditionToken(condition,"isthirdparty","ENTRAVELSHEETFUELREMNS.ISTHIRDPARTY");
		_checkConditionToken(condition,"modify_time","ENTRAVELSHEETFUELREMNS.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"travelsheetref","TRAVELSHEETREFCODE");
		_checkConditionToken(condition,"travelsheetref.code","TRAVELSHEETREFCODE");
		_checkConditionToken(condition,"fueltyperef","FUELTYPEREFCODE");
		_checkConditionToken(condition,"fueltyperef.code","FUELTYPEREFCODE");
		_checkConditionToken(condition,"realtransport","REALTRANSPORTCODE");
		_checkConditionToken(condition,"realtransport.code","REALTRANSPORTCODE");
		_checkConditionToken(condition,"travelsheetfueltyperef","TRAVELSHEETFUELTYPRFCD");
		_checkConditionToken(condition,"travelsheetfueltyperef.code","TRAVELSHEETFUELTYPRFCD");
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
	
	private void _collectAutoIncrementFields(ENTravelSheetFuelRemains anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENTRAVELSHEETFUELREMNS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENTRAVELSHEETFUELREMNS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENTRAVELSHEETFUELREMNS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENTRAVELSHEETFUELREMNS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENTravelSheetFuelRemainsDAO
