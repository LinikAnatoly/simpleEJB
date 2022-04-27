
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
import com.ksoe.energynet.valueobject.ENDistributionAgree;
import com.ksoe.energynet.valueobject.filter.ENDistributionAgreeFilter;
import com.ksoe.energynet.valueobject.brief.ENDistributionAgreeShort;
import com.ksoe.energynet.valueobject.lists.ENDistributionAgreeShortList;


/**
 * DAO Object for ENDistributionAgree;
 *
 */

public class ENDistributionAgreeDAOGen extends GenericDataMiner {

	public ENDistributionAgreeDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENDistributionAgreeDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENDistributionAgree inObject) throws PersistenceException {
		ENDistributionAgree obj = new ENDistributionAgree();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numberGen == null && obj.numberGen == null){}
		else
			if(inObject.numberGen == null || obj.numberGen == null) return false;
			else
				if ( ! inObject.numberGen.equals(obj.numberGen)){
					return false;
				}

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
					return false;
				}

		if(inObject.eic == null && obj.eic == null){}
		else
			if(inObject.eic == null || obj.eic == null) return false;
			else
				if ( ! inObject.eic.equals(obj.eic)){
					return false;
				}

		if(inObject.objectname == null && obj.objectname == null){}
		else
			if(inObject.objectname == null || obj.objectname == null) return false;
			else
				if ( ! inObject.objectname.equals(obj.objectname)){
					return false;
				}

		if(inObject.objectaddress == null && obj.objectaddress == null){}
		else
			if(inObject.objectaddress == null || obj.objectaddress == null) return false;
			else
				if ( ! inObject.objectaddress.equals(obj.objectaddress)){
					return false;
				}

		if(inObject.power == null && obj.power == null){}
		else
			if(inObject.power == null || obj.power == null) return false;
			else
				if ( ! inObject.power.equals(obj.power)){
					return false;
				}

		if(inObject.d2fusename == null && obj.d2fusename == null){}
		else
			if(inObject.d2fusename == null || obj.d2fusename == null) return false;
			else
				if ( ! inObject.d2fusename.equals(obj.d2fusename)){
					return false;
				}

		if(inObject.d3countername == null && obj.d3countername == null){}
		else
			if(inObject.d3countername == null || obj.d3countername == null) return false;
			else
				if ( ! inObject.d3countername.equals(obj.d3countername)){
					return false;
				}

		if(inObject.d3countertype == null && obj.d3countertype == null){}
		else
			if(inObject.d3countertype == null || obj.d3countertype == null) return false;
			else
				if ( ! inObject.d3countertype.equals(obj.d3countertype)){
					return false;
				}

		if(inObject.d3amperageratio == null && obj.d3amperageratio == null){}
		else
			if(inObject.d3amperageratio == null || obj.d3amperageratio == null) return false;
			else
				if ( ! inObject.d3amperageratio.equals(obj.d3amperageratio)){
					return false;
				}

		if(inObject.d3voltageratio == null && obj.d3voltageratio == null){}
		else
			if(inObject.d3voltageratio == null || obj.d3voltageratio == null) return false;
			else
				if ( ! inObject.d3voltageratio.equals(obj.d3voltageratio)){
					return false;
				}

		if(inObject.d3totalratio == null && obj.d3totalratio == null){}
		else
			if(inObject.d3totalratio == null || obj.d3totalratio == null) return false;
			else
				if ( ! inObject.d3totalratio.equals(obj.d3totalratio)){
					return false;
				}

		if(inObject.d3place == null && obj.d3place == null){}
		else
			if(inObject.d3place == null || obj.d3place == null) return false;
			else
				if ( ! inObject.d3place.equals(obj.d3place)){
					return false;
				}

		if(inObject.d3voltageclass == null && obj.d3voltageclass == null){}
		else
			if(inObject.d3voltageclass == null || obj.d3voltageclass == null) return false;
			else
				if ( ! inObject.d3voltageclass.equals(obj.d3voltageclass)){
					return false;
				}

		if(inObject.d3workmode == null && obj.d3workmode == null){}
		else
			if(inObject.d3workmode == null || obj.d3workmode == null) return false;
			else
				if ( ! inObject.d3workmode.equals(obj.d3workmode)){
					return false;
				}

		if(inObject.d3tarifftype == null && obj.d3tarifftype == null){}
		else
			if(inObject.d3tarifftype == null || obj.d3tarifftype == null) return false;
			else
				if ( ! inObject.d3tarifftype.equals(obj.d3tarifftype)){
					return false;
				}

		if(inObject.d3accountingtype == null && obj.d3accountingtype == null){}
		else
			if(inObject.d3accountingtype == null || obj.d3accountingtype == null) return false;
			else
				if ( ! inObject.d3accountingtype.equals(obj.d3accountingtype)){
					return false;
				}

		if(inObject.d5feederlist == null && obj.d5feederlist == null){}
		else
			if(inObject.d5feederlist == null || obj.d5feederlist == null) return false;
			else
				if ( ! inObject.d5feederlist.equals(obj.d5feederlist)){
					return false;
				}

		if(inObject.d6reliabilitypue == null && obj.d6reliabilitypue == null){}
		else
			if(inObject.d6reliabilitypue == null || obj.d6reliabilitypue == null) return false;
			else
				if ( ! inObject.d6reliabilitypue.equals(obj.d6reliabilitypue)){
					return false;
				}

		if(inObject.d6reliabilityguaranteed == null && obj.d6reliabilityguaranteed == null){}
		else
			if(inObject.d6reliabilityguaranteed == null || obj.d6reliabilityguaranteed == null) return false;
			else
				if ( ! inObject.d6reliabilityguaranteed.equals(obj.d6reliabilityguaranteed)){
					return false;
				}

		if(inObject.d6balancesupplier == null && obj.d6balancesupplier == null){}
		else
			if(inObject.d6balancesupplier == null || obj.d6balancesupplier == null) return false;
			else
				if ( ! inObject.d6balancesupplier.equals(obj.d6balancesupplier)){
					return false;
				}

		if(inObject.d6balanceclient == null && obj.d6balanceclient == null){}
		else
			if(inObject.d6balanceclient == null || obj.d6balanceclient == null) return false;
			else
				if ( ! inObject.d6balanceclient.equals(obj.d6balanceclient)){
					return false;
				}

		if(inObject.d6responsibilitysupplier == null && obj.d6responsibilitysupplier == null){}
		else
			if(inObject.d6responsibilitysupplier == null || obj.d6responsibilitysupplier == null) return false;
			else
				if ( ! inObject.d6responsibilitysupplier.equals(obj.d6responsibilitysupplier)){
					return false;
				}

		if(inObject.d6responsibilityclient == null && obj.d6responsibilityclient == null){}
		else
			if(inObject.d6responsibilityclient == null || obj.d6responsibilityclient == null) return false;
			else
				if ( ! inObject.d6responsibilityclient.equals(obj.d6responsibilityclient)){
					return false;
				}

		if(inObject.d6balancelimit == null && obj.d6balancelimit == null){}
		else
			if(inObject.d6balancelimit == null || obj.d6balancelimit == null) return false;
			else
				if ( ! inObject.d6balancelimit.equals(obj.d6balancelimit)){
					return false;
				}

		if(inObject.d7linesource == null && obj.d7linesource == null){}
		else
			if(inObject.d7linesource == null || obj.d7linesource == null) return false;
			else
				if ( ! inObject.d7linesource.equals(obj.d7linesource)){
					return false;
				}

		if(inObject.d7attachment == null && obj.d7attachment == null){}
		else
			if(inObject.d7attachment == null || obj.d7attachment == null) return false;
			else
				if ( ! inObject.d7attachment.equals(obj.d7attachment)){
					return false;
				}

		if(inObject.d8conditions == null && obj.d8conditions == null){}
		else
			if(inObject.d8conditions == null || obj.d8conditions == null) return false;
			else
				if ( ! inObject.d8conditions.equals(obj.d8conditions)){
					return false;
				}

		if(inObject.d8transformertype == null && obj.d8transformertype == null){}
		else
			if(inObject.d8transformertype == null || obj.d8transformertype == null) return false;
			else
				if ( ! inObject.d8transformertype.equals(obj.d8transformertype)){
					return false;
				}

		if(inObject.d8voltagebh == null && obj.d8voltagebh == null){}
		else
			if(inObject.d8voltagebh == null || obj.d8voltagebh == null) return false;
			else
				if ( ! inObject.d8voltagebh.equals(obj.d8voltagebh)){
					return false;
				}

		if(inObject.d8voltagehh == null && obj.d8voltagehh == null){}
		else
			if(inObject.d8voltagehh == null || obj.d8voltagehh == null) return false;
			else
				if ( ! inObject.d8voltagehh.equals(obj.d8voltagehh)){
					return false;
				}

		if(inObject.d8lossesxx == null && obj.d8lossesxx == null){}
		else
			if(inObject.d8lossesxx == null || obj.d8lossesxx == null) return false;
			else
				if ( ! inObject.d8lossesxx.equals(obj.d8lossesxx)){
					return false;
				}

		if(inObject.d8losseskz == null && obj.d8losseskz == null){}
		else
			if(inObject.d8losseskz == null || obj.d8losseskz == null) return false;
			else
				if ( ! inObject.d8losseskz.equals(obj.d8losseskz)){
					return false;
				}

		if(inObject.d8amperage == null && obj.d8amperage == null){}
		else
			if(inObject.d8amperage == null || obj.d8amperage == null) return false;
			else
				if ( ! inObject.d8amperage.equals(obj.d8amperage)){
					return false;
				}

		if(inObject.d8voltagekz == null && obj.d8voltagekz == null){}
		else
			if(inObject.d8voltagekz == null || obj.d8voltagekz == null) return false;
			else
				if ( ! inObject.d8voltagekz.equals(obj.d8voltagekz)){
					return false;
				}

		if(inObject.d8linelength == null && obj.d8linelength == null){}
		else
			if(inObject.d8linelength == null || obj.d8linelength == null) return false;
			else
				if ( ! inObject.d8linelength.equals(obj.d8linelength)){
					return false;
				}

		if(inObject.d8liner == null && obj.d8liner == null){}
		else
			if(inObject.d8liner == null || obj.d8liner == null) return false;
			else
				if ( ! inObject.d8liner.equals(obj.d8liner)){
					return false;
				}

		if(inObject.d8linex == null && obj.d8linex == null){}
		else
			if(inObject.d8linex == null || obj.d8linex == null) return false;
			else
				if ( ! inObject.d8linex.equals(obj.d8linex)){
					return false;
				}

		if (inObject.d8hours != obj.d8hours){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}
		if (inObject.warrantRef.code != obj.warrantRef.code){
			return false;
		}
		return true;
	}

	public int add(ENDistributionAgree anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENDistributionAgree anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENDISTRIBUTIONAGREE (CODE,NUMBERGEN,DATEGEN,EIC,OBJECTNAME,OBJECTADDRESS,POWER,D2FUSENAME,D3COUNTERNAME,D3COUNTERTYPE,D3AMPERAGERATIO,D3VOLTAGERATIO,D3TOTALRATIO,D3PLACE,D3VOLTAGECLASS,D3WORKMODE,D3TARIFFTYPE,D3ACCOUNTINGTYPE,D5FEEDERLIST,D6RELIABILITYPUE,D6RELIABILITYGUARANTED,D6BALANCESUPPLIER,D6BALANCECLIENT,D6RESPONSIBILITYSUPPLR,D6RESPONSIBILITYCLIENT,D6BALANCELIMIT,D7LINESOURCE,D7ATTACHMENT,D8CONDITIONS,D8TRANSFORMERTYPE,D8VOLTAGEBH,D8VOLTAGEHH,D8LOSSESXX,D8LOSSESKZ,D8AMPERAGE,D8VOLTAGEKZ,D8LINELENGTH,D8LINER,D8LINEX,D8HOURS,USERGEN,MODIFY_TIME,WARRANTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.numberGen);
			if (anObject.dateGen == null) {
				statement.setTimestamp(3, null);
			} else {
				statement.setTimestamp(3, new java.sql.Timestamp(anObject.dateGen.getTime()));
			}
			statement.setString(4, anObject.eic);
			statement.setString(5, anObject.objectname);
			statement.setString(6, anObject.objectaddress);
			if (anObject.power != null) {
				anObject.power = anObject.power.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7, anObject.power);
			statement.setString(8, anObject.d2fusename);
			statement.setString(9, anObject.d3countername);
			statement.setString(10, anObject.d3countertype);
			if (anObject.d3amperageratio != null) {
				anObject.d3amperageratio = anObject.d3amperageratio.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11, anObject.d3amperageratio);
			if (anObject.d3voltageratio != null) {
				anObject.d3voltageratio = anObject.d3voltageratio.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(12, anObject.d3voltageratio);
			if (anObject.d3totalratio != null) {
				anObject.d3totalratio = anObject.d3totalratio.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(13, anObject.d3totalratio);
			statement.setString(14, anObject.d3place);
			statement.setString(15, anObject.d3voltageclass);
			statement.setString(16, anObject.d3workmode);
			statement.setString(17, anObject.d3tarifftype);
			statement.setString(18, anObject.d3accountingtype);
			statement.setString(19, anObject.d5feederlist);
			statement.setString(20, anObject.d6reliabilitypue);
			statement.setString(21, anObject.d6reliabilityguaranteed);
			statement.setString(22, anObject.d6balancesupplier);
			statement.setString(23, anObject.d6balanceclient);
			statement.setString(24, anObject.d6responsibilitysupplier);
			statement.setString(25, anObject.d6responsibilityclient);
			statement.setString(26, anObject.d6balancelimit);
			statement.setString(27, anObject.d7linesource);
			statement.setString(28, anObject.d7attachment);
			statement.setString(29, anObject.d8conditions);
			statement.setString(30, anObject.d8transformertype);
			if (anObject.d8voltagebh != null) {
				anObject.d8voltagebh = anObject.d8voltagebh.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(31, anObject.d8voltagebh);
			if (anObject.d8voltagehh != null) {
				anObject.d8voltagehh = anObject.d8voltagehh.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(32, anObject.d8voltagehh);
			if (anObject.d8lossesxx != null) {
				anObject.d8lossesxx = anObject.d8lossesxx.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(33, anObject.d8lossesxx);
			if (anObject.d8losseskz != null) {
				anObject.d8losseskz = anObject.d8losseskz.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(34, anObject.d8losseskz);
			if (anObject.d8amperage != null) {
				anObject.d8amperage = anObject.d8amperage.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(35, anObject.d8amperage);
			if (anObject.d8voltagekz != null) {
				anObject.d8voltagekz = anObject.d8voltagekz.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(36, anObject.d8voltagekz);
			if (anObject.d8linelength != null) {
				anObject.d8linelength = anObject.d8linelength.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(37, anObject.d8linelength);
			if (anObject.d8liner != null) {
				anObject.d8liner = anObject.d8liner.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(38, anObject.d8liner);
			if (anObject.d8linex != null) {
				anObject.d8linex = anObject.d8linex.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(39, anObject.d8linex);
			if (anObject.d8hours != Integer.MIN_VALUE ) {
				statement.setInt(40, anObject.d8hours);
			} else {
				statement.setNull(40, java.sql.Types.INTEGER);
			}
			statement.setString(41, anObject.userGen);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(42, null);
			} else {
				statement.setBigDecimal(42, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.warrantRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).exists(anObject.warrantRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDistributionAgree.warrantRef.code%} = {%"+anObject.warrantRef.code+"%}");
				}
				statement.setInt(43,anObject.warrantRef.code);
			} else {
				statement.setNull(43,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENDistributionAgreeDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENDistributionAgree anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENDistributionAgree anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENDistributionAgree oldObject = new ENDistributionAgree();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENDistributionAgree.modify_time_Field+" FROM  ENDISTRIBUTIONAGREE WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EIC") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OBJECTNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OBJECTADDRESS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POWER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D2FUSENAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D3COUNTERNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D3COUNTERTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D3AMPERAGERATIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D3VOLTAGERATIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D3TOTALRATIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D3PLACE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D3VOLTAGECLASS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D3WORKMODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D3TARIFFTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D3ACCOUNTINGTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D5FEEDERLIST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D6RELIABILITYPUE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D6RELIABILITYGUARANTEED") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D6BALANCESUPPLIER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D6BALANCECLIENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D6RESPONSIBILITYSUPPLIER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D6RESPONSIBILITYCLIENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D6BALANCELIMIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D7LINESOURCE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D7ATTACHMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D8CONDITIONS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D8TRANSFORMERTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D8VOLTAGEBH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D8VOLTAGEHH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D8LOSSESXX") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D8LOSSESKZ") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D8AMPERAGE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D8VOLTAGEKZ") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D8LINELENGTH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D8LINER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D8LINEX") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("D8HOURS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENDISTRIBUTIONAGREE SET  NUMBERGEN = ? , DATEGEN = ? , EIC = ? , OBJECTNAME = ? , OBJECTADDRESS = ? , POWER = ? , D2FUSENAME = ? , D3COUNTERNAME = ? , D3COUNTERTYPE = ? , D3AMPERAGERATIO = ? , D3VOLTAGERATIO = ? , D3TOTALRATIO = ? , D3PLACE = ? , D3VOLTAGECLASS = ? , D3WORKMODE = ? , D3TARIFFTYPE = ? , D3ACCOUNTINGTYPE = ? , D5FEEDERLIST = ? , D6RELIABILITYPUE = ? , D6RELIABILITYGUARANTED = ? , D6BALANCESUPPLIER = ? , D6BALANCECLIENT = ? , D6RESPONSIBILITYSUPPLR = ? , D6RESPONSIBILITYCLIENT = ? , D6BALANCELIMIT = ? , D7LINESOURCE = ? , D7ATTACHMENT = ? , D8CONDITIONS = ? , D8TRANSFORMERTYPE = ? , D8VOLTAGEBH = ? , D8VOLTAGEHH = ? , D8LOSSESXX = ? , D8LOSSESKZ = ? , D8AMPERAGE = ? , D8VOLTAGEKZ = ? , D8LINELENGTH = ? , D8LINER = ? , D8LINEX = ? , D8HOURS = ? , USERGEN = ? , MODIFY_TIME = ? , WARRANTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENDISTRIBUTIONAGREE SET ";
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
					statement.setString(1, anObject.numberGen);
					if (anObject.dateGen == null) {
						statement.setTimestamp(2, null);
					} else {
						statement.setTimestamp(2, new java.sql.Timestamp(anObject.dateGen.getTime()));
					}
					statement.setString(3, anObject.eic);
					statement.setString(4, anObject.objectname);
					statement.setString(5, anObject.objectaddress);
					if (anObject.power != null) {
						anObject.power = anObject.power.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6, anObject.power);
					statement.setString(7, anObject.d2fusename);
					statement.setString(8, anObject.d3countername);
					statement.setString(9, anObject.d3countertype);
					if (anObject.d3amperageratio != null) {
						anObject.d3amperageratio = anObject.d3amperageratio.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10, anObject.d3amperageratio);
					if (anObject.d3voltageratio != null) {
						anObject.d3voltageratio = anObject.d3voltageratio.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(11, anObject.d3voltageratio);
					if (anObject.d3totalratio != null) {
						anObject.d3totalratio = anObject.d3totalratio.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(12, anObject.d3totalratio);
					statement.setString(13, anObject.d3place);
					statement.setString(14, anObject.d3voltageclass);
					statement.setString(15, anObject.d3workmode);
					statement.setString(16, anObject.d3tarifftype);
					statement.setString(17, anObject.d3accountingtype);
					statement.setString(18, anObject.d5feederlist);
					statement.setString(19, anObject.d6reliabilitypue);
					statement.setString(20, anObject.d6reliabilityguaranteed);
					statement.setString(21, anObject.d6balancesupplier);
					statement.setString(22, anObject.d6balanceclient);
					statement.setString(23, anObject.d6responsibilitysupplier);
					statement.setString(24, anObject.d6responsibilityclient);
					statement.setString(25, anObject.d6balancelimit);
					statement.setString(26, anObject.d7linesource);
					statement.setString(27, anObject.d7attachment);
					statement.setString(28, anObject.d8conditions);
					statement.setString(29, anObject.d8transformertype);
					if (anObject.d8voltagebh != null) {
						anObject.d8voltagebh = anObject.d8voltagebh.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(30, anObject.d8voltagebh);
					if (anObject.d8voltagehh != null) {
						anObject.d8voltagehh = anObject.d8voltagehh.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(31, anObject.d8voltagehh);
					if (anObject.d8lossesxx != null) {
						anObject.d8lossesxx = anObject.d8lossesxx.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(32, anObject.d8lossesxx);
					if (anObject.d8losseskz != null) {
						anObject.d8losseskz = anObject.d8losseskz.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(33, anObject.d8losseskz);
					if (anObject.d8amperage != null) {
						anObject.d8amperage = anObject.d8amperage.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(34, anObject.d8amperage);
					if (anObject.d8voltagekz != null) {
						anObject.d8voltagekz = anObject.d8voltagekz.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(35, anObject.d8voltagekz);
					if (anObject.d8linelength != null) {
						anObject.d8linelength = anObject.d8linelength.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(36, anObject.d8linelength);
					if (anObject.d8liner != null) {
						anObject.d8liner = anObject.d8liner.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(37, anObject.d8liner);
					if (anObject.d8linex != null) {
						anObject.d8linex = anObject.d8linex.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(38, anObject.d8linex);
					if (anObject.d8hours != Integer.MIN_VALUE) {
						statement.setInt(39, anObject.d8hours);
					} else {
						statement.setNull(39, java.sql.Types.INTEGER);
					}
					statement.setString(40, anObject.userGen);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(41, null);
					} else {
						statement.setBigDecimal(41, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.warrantRef.code != Integer.MIN_VALUE) {
						statement.setInt(42, anObject.warrantRef.code);
					} else {
						statement.setNull(42, java.sql.Types.INTEGER);
					}
					statement.setInt(43, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.numberGen);
							continue;
						}
						if("DATEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateGen == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateGen.getTime()));
							}
							continue;
						}
						if("EIC".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.eic);
							continue;
						}
						if("OBJECTNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.objectname);
							continue;
						}
						if("OBJECTADDRESS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.objectaddress);
							continue;
						}
						if("POWER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.power != null) {
								anObject.power = anObject.power.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.power);
							continue;
						}
						if("D2FUSENAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d2fusename);
							continue;
						}
						if("D3COUNTERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d3countername);
							continue;
						}
						if("D3COUNTERTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d3countertype);
							continue;
						}
						if("D3AMPERAGERATIO".compareTo((String)fields.get(i)) == 0) {
							if (anObject.d3amperageratio != null) {
								anObject.d3amperageratio = anObject.d3amperageratio.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.d3amperageratio);
							continue;
						}
						if("D3VOLTAGERATIO".compareTo((String)fields.get(i)) == 0) {
							if (anObject.d3voltageratio != null) {
								anObject.d3voltageratio = anObject.d3voltageratio.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.d3voltageratio);
							continue;
						}
						if("D3TOTALRATIO".compareTo((String)fields.get(i)) == 0) {
							if (anObject.d3totalratio != null) {
								anObject.d3totalratio = anObject.d3totalratio.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.d3totalratio);
							continue;
						}
						if("D3PLACE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d3place);
							continue;
						}
						if("D3VOLTAGECLASS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d3voltageclass);
							continue;
						}
						if("D3WORKMODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d3workmode);
							continue;
						}
						if("D3TARIFFTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d3tarifftype);
							continue;
						}
						if("D3ACCOUNTINGTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d3accountingtype);
							continue;
						}
						if("D5FEEDERLIST".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d5feederlist);
							continue;
						}
						if("D6RELIABILITYPUE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d6reliabilitypue);
							continue;
						}
						if("D6RELIABILITYGUARANTEED".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d6reliabilityguaranteed);
							continue;
						}
						if("D6BALANCESUPPLIER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d6balancesupplier);
							continue;
						}
						if("D6BALANCECLIENT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d6balanceclient);
							continue;
						}
						if("D6RESPONSIBILITYSUPPLIER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d6responsibilitysupplier);
							continue;
						}
						if("D6RESPONSIBILITYCLIENT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d6responsibilityclient);
							continue;
						}
						if("D6BALANCELIMIT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d6balancelimit);
							continue;
						}
						if("D7LINESOURCE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d7linesource);
							continue;
						}
						if("D7ATTACHMENT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d7attachment);
							continue;
						}
						if("D8CONDITIONS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d8conditions);
							continue;
						}
						if("D8TRANSFORMERTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.d8transformertype);
							continue;
						}
						if("D8VOLTAGEBH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.d8voltagebh != null) {
								anObject.d8voltagebh = anObject.d8voltagebh.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.d8voltagebh);
							continue;
						}
						if("D8VOLTAGEHH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.d8voltagehh != null) {
								anObject.d8voltagehh = anObject.d8voltagehh.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.d8voltagehh);
							continue;
						}
						if("D8LOSSESXX".compareTo((String)fields.get(i)) == 0) {
							if (anObject.d8lossesxx != null) {
								anObject.d8lossesxx = anObject.d8lossesxx.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.d8lossesxx);
							continue;
						}
						if("D8LOSSESKZ".compareTo((String)fields.get(i)) == 0) {
							if (anObject.d8losseskz != null) {
								anObject.d8losseskz = anObject.d8losseskz.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.d8losseskz);
							continue;
						}
						if("D8AMPERAGE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.d8amperage != null) {
								anObject.d8amperage = anObject.d8amperage.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.d8amperage);
							continue;
						}
						if("D8VOLTAGEKZ".compareTo((String)fields.get(i)) == 0) {
							if (anObject.d8voltagekz != null) {
								anObject.d8voltagekz = anObject.d8voltagekz.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.d8voltagekz);
							continue;
						}
						if("D8LINELENGTH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.d8linelength != null) {
								anObject.d8linelength = anObject.d8linelength.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.d8linelength);
							continue;
						}
						if("D8LINER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.d8liner != null) {
								anObject.d8liner = anObject.d8liner.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.d8liner);
							continue;
						}
						if("D8LINEX".compareTo((String)fields.get(i)) == 0) {
							if (anObject.d8linex != null) {
								anObject.d8linex = anObject.d8linex.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.d8linex);
							continue;
						}
						if("D8HOURS".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.d8hours);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
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
						if("WARRANTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.warrantRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.warrantRef.code);
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

	} // end of save(ENDistributionAgree anObject,String[] anAttributes)


	public ENDistributionAgreeShort getShortObject(int anObjectCode) throws PersistenceException {
		ENDistributionAgree filterObject = new ENDistributionAgree();
		Vector<ENDistributionAgreeShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENDistributionAgreeShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENDistributionAgree filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numberGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.eic, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.objectname, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.objectaddress, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.power, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d2fusename, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d3countername, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d3countertype, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.d3amperageratio, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.d3voltageratio, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.d3totalratio, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d3place, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d3voltageclass, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d3workmode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d3tarifftype, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d3accountingtype, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d5feederlist, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d6reliabilitypue, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d6reliabilityguaranteed, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d6balancesupplier, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d6balanceclient, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d6responsibilitysupplier, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d6responsibilityclient, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d6balancelimit, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d7linesource, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d7attachment, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d8conditions, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.d8transformertype, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.d8voltagebh, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.d8voltagehh, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.d8lossesxx, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.d8losseskz, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.d8amperage, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.d8voltagekz, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.d8linelength, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.d8liner, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.d8linex, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.d8hours, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.warrantRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENDistributionAgreeFilter filter) {
		String out = buildCondition((ENDistributionAgree)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENDistributionAgree filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENDistributionAgree.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numberGen, ENDistributionAgree.numberGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENDistributionAgree.dateGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.eic, ENDistributionAgree.eic_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.objectname, ENDistributionAgree.objectname_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.objectaddress, ENDistributionAgree.objectaddress_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.power, ENDistributionAgree.power_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d2fusename, ENDistributionAgree.d2fusename_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d3countername, ENDistributionAgree.d3countername_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d3countertype, ENDistributionAgree.d3countertype_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.d3amperageratio, ENDistributionAgree.d3amperageratio_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.d3voltageratio, ENDistributionAgree.d3voltageratio_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.d3totalratio, ENDistributionAgree.d3totalratio_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d3place, ENDistributionAgree.d3place_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d3voltageclass, ENDistributionAgree.d3voltageclass_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d3workmode, ENDistributionAgree.d3workmode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d3tarifftype, ENDistributionAgree.d3tarifftype_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d3accountingtype, ENDistributionAgree.d3accountingtype_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d5feederlist, ENDistributionAgree.d5feederlist_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d6reliabilitypue, ENDistributionAgree.d6reliabilitypue_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d6reliabilityguaranteed, ENDistributionAgree.d6reliabilityguaranteed_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d6balancesupplier, ENDistributionAgree.d6balancesupplier_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d6balanceclient, ENDistributionAgree.d6balanceclient_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d6responsibilitysupplier, ENDistributionAgree.d6responsibilitysupplier_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d6responsibilityclient, ENDistributionAgree.d6responsibilityclient_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d6balancelimit, ENDistributionAgree.d6balancelimit_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d7linesource, ENDistributionAgree.d7linesource_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d7attachment, ENDistributionAgree.d7attachment_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d8conditions, ENDistributionAgree.d8conditions_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.d8transformertype, ENDistributionAgree.d8transformertype_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.d8voltagebh, ENDistributionAgree.d8voltagebh_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.d8voltagehh, ENDistributionAgree.d8voltagehh_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.d8lossesxx, ENDistributionAgree.d8lossesxx_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.d8losseskz, ENDistributionAgree.d8losseskz_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.d8amperage, ENDistributionAgree.d8amperage_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.d8voltagekz, ENDistributionAgree.d8voltagekz_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.d8linelength, ENDistributionAgree.d8linelength_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.d8liner, ENDistributionAgree.d8liner_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.d8linex, ENDistributionAgree.d8linex_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.d8hours, ENDistributionAgree.d8hours_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENDistributionAgree.userGen_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENDistributionAgree.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.warrantRef.code, ENDistributionAgree.warrantRef_QFielld, out);
		}
		return out;
	}

	public ENDistributionAgreeShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENDistributionAgreeShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENDistributionAgreeShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENDistributionAgreeShortList getFilteredList(ENDistributionAgree filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENDistributionAgreeShortList getScrollableFilteredList(ENDistributionAgree aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENDistributionAgreeShortList getScrollableFilteredList(ENDistributionAgree aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENDistributionAgreeShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENDistributionAgreeShortList getScrollableFilteredList(ENDistributionAgreeFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENDistributionAgreeShortList getScrollableFilteredList(ENDistributionAgreeFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENDistributionAgreeShortList getScrollableFilteredList(ENDistributionAgree aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENDistributionAgreeShortList result = new ENDistributionAgreeShortList();
		ENDistributionAgreeShort anObject;
		result.list = new Vector<ENDistributionAgreeShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENDISTRIBUTIONAGREE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENDISTRIBUTIONAGREE.CODE"+
			",ENDISTRIBUTIONAGREE.NUMBERGEN"+
			",ENDISTRIBUTIONAGREE.DATEGEN"+
			",ENDISTRIBUTIONAGREE.EIC"+
			",ENDISTRIBUTIONAGREE.OBJECTNAME"+
			",ENDISTRIBUTIONAGREE.OBJECTADDRESS"+
			",ENDISTRIBUTIONAGREE.POWER"+
			",ENDISTRIBUTIONAGREE.D2FUSENAME"+
			",ENDISTRIBUTIONAGREE.D3COUNTERNAME"+
			",ENDISTRIBUTIONAGREE.D3COUNTERTYPE"+
			",ENDISTRIBUTIONAGREE.D3AMPERAGERATIO"+
			",ENDISTRIBUTIONAGREE.D3VOLTAGERATIO"+
			",ENDISTRIBUTIONAGREE.D3TOTALRATIO"+
			",ENDISTRIBUTIONAGREE.D3PLACE"+
			",ENDISTRIBUTIONAGREE.D3VOLTAGECLASS"+
			",ENDISTRIBUTIONAGREE.D3WORKMODE"+
			",ENDISTRIBUTIONAGREE.D3TARIFFTYPE"+
			",ENDISTRIBUTIONAGREE.D3ACCOUNTINGTYPE"+
			",ENDISTRIBUTIONAGREE.D5FEEDERLIST"+
			",ENDISTRIBUTIONAGREE.D6RELIABILITYPUE"+
			",ENDISTRIBUTIONAGREE.D6RELIABILITYGUARANTED"+
			",ENDISTRIBUTIONAGREE.D6BALANCESUPPLIER"+
			",ENDISTRIBUTIONAGREE.D6BALANCECLIENT"+
			",ENDISTRIBUTIONAGREE.D6RESPONSIBILITYSUPPLR"+
			",ENDISTRIBUTIONAGREE.D6RESPONSIBILITYCLIENT"+
			",ENDISTRIBUTIONAGREE.D6BALANCELIMIT"+
			",ENDISTRIBUTIONAGREE.D7LINESOURCE"+
			",ENDISTRIBUTIONAGREE.D7ATTACHMENT"+
			",ENDISTRIBUTIONAGREE.D8CONDITIONS"+
			",ENDISTRIBUTIONAGREE.D8TRANSFORMERTYPE"+
			",ENDISTRIBUTIONAGREE.D8VOLTAGEBH"+
			",ENDISTRIBUTIONAGREE.D8VOLTAGEHH"+
			",ENDISTRIBUTIONAGREE.D8LOSSESXX"+
			",ENDISTRIBUTIONAGREE.D8LOSSESKZ"+
			",ENDISTRIBUTIONAGREE.D8AMPERAGE"+
			",ENDISTRIBUTIONAGREE.D8VOLTAGEKZ"+
			",ENDISTRIBUTIONAGREE.D8LINELENGTH"+
			",ENDISTRIBUTIONAGREE.D8LINER"+
			",ENDISTRIBUTIONAGREE.D8LINEX"+
			",ENDISTRIBUTIONAGREE.D8HOURS"+
			",ENDISTRIBUTIONAGREE.USERGEN"+
			", ENWARRANT.CODE " +
			", ENWARRANT.NUMBERGEN " +
			", ENWARRANT.NAME " +
			", ENWARRANT.WARRANTFIO " +
			", ENWARRANT.WARRANTSHORTFIO " +
			", ENWARRANT.WARRANTPOSITION " +
			", ENWARRANT.GENITIVEFIO " +
			", ENWARRANT.GENITIVEPOSITION " +
			", ENWARRANT.PASSPORT " +
			", ENWARRANT.ADDRESS " +
			", ENWARRANT.POWER " +
			", ENWARRANT.MAXSUM " +
		" FROM ENDISTRIBUTIONAGREE " +
			" LEFT JOIN ENWARRANT on ENWARRANT.CODE = ENDISTRIBUTIONAGREE.WARRANTREFCODE "+
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
				anObject = new ENDistributionAgreeShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberGen = set.getString(2);
				anObject.dateGen = set.getTimestamp(3);
				anObject.eic = set.getString(4);
				anObject.objectname = set.getString(5);
				anObject.objectaddress = set.getString(6);
				anObject.power = set.getBigDecimal(7);
				if(anObject.power != null) {
					anObject.power = anObject.power.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d2fusename = set.getString(8);
				anObject.d3countername = set.getString(9);
				anObject.d3countertype = set.getString(10);
				anObject.d3amperageratio = set.getBigDecimal(11);
				if(anObject.d3amperageratio != null) {
					anObject.d3amperageratio = anObject.d3amperageratio.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d3voltageratio = set.getBigDecimal(12);
				if(anObject.d3voltageratio != null) {
					anObject.d3voltageratio = anObject.d3voltageratio.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d3totalratio = set.getBigDecimal(13);
				if(anObject.d3totalratio != null) {
					anObject.d3totalratio = anObject.d3totalratio.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d3place = set.getString(14);
				anObject.d3voltageclass = set.getString(15);
				anObject.d3workmode = set.getString(16);
				anObject.d3tarifftype = set.getString(17);
				anObject.d3accountingtype = set.getString(18);
				anObject.d5feederlist = set.getString(19);
				anObject.d6reliabilitypue = set.getString(20);
				anObject.d6reliabilityguaranteed = set.getString(21);
				anObject.d6balancesupplier = set.getString(22);
				anObject.d6balanceclient = set.getString(23);
				anObject.d6responsibilitysupplier = set.getString(24);
				anObject.d6responsibilityclient = set.getString(25);
				anObject.d6balancelimit = set.getString(26);
				anObject.d7linesource = set.getString(27);
				anObject.d7attachment = set.getString(28);
				anObject.d8conditions = set.getString(29);
				anObject.d8transformertype = set.getString(30);
				anObject.d8voltagebh = set.getBigDecimal(31);
				if(anObject.d8voltagebh != null) {
					anObject.d8voltagebh = anObject.d8voltagebh.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8voltagehh = set.getBigDecimal(32);
				if(anObject.d8voltagehh != null) {
					anObject.d8voltagehh = anObject.d8voltagehh.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8lossesxx = set.getBigDecimal(33);
				if(anObject.d8lossesxx != null) {
					anObject.d8lossesxx = anObject.d8lossesxx.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8losseskz = set.getBigDecimal(34);
				if(anObject.d8losseskz != null) {
					anObject.d8losseskz = anObject.d8losseskz.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8amperage = set.getBigDecimal(35);
				if(anObject.d8amperage != null) {
					anObject.d8amperage = anObject.d8amperage.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8voltagekz = set.getBigDecimal(36);
				if(anObject.d8voltagekz != null) {
					anObject.d8voltagekz = anObject.d8voltagekz.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8linelength = set.getBigDecimal(37);
				if(anObject.d8linelength != null) {
					anObject.d8linelength = anObject.d8linelength.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8liner = set.getBigDecimal(38);
				if(anObject.d8liner != null) {
					anObject.d8liner = anObject.d8liner.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8linex = set.getBigDecimal(39);
				if(anObject.d8linex != null) {
					anObject.d8linex = anObject.d8linex.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8hours = set.getInt(40);
				if ( set.wasNull() ) {
					anObject.d8hours = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(41);

				anObject.warrantRefCode = set.getInt(42);
				if(set.wasNull()) {
					anObject.warrantRefCode = Integer.MIN_VALUE;
				}
				anObject.warrantRefNumbergen = set.getString(43);
				anObject.warrantRefName = set.getString(44);
				anObject.warrantRefWarrantFIO = set.getString(45);
				anObject.warrantRefWarrantShortFIO = set.getString(46);
				anObject.warrantRefWarrantPosition = set.getString(47);
				anObject.warrantRefGenitiveFIO = set.getString(48);
				anObject.warrantRefGenitivePosition = set.getString(49);
				anObject.warrantRefPassport = set.getString(50);
				anObject.warrantRefAddress = set.getString(51);
				anObject.warrantRefPower = set.getInt(52);
				if(set.wasNull()) {
					anObject.warrantRefPower = Integer.MIN_VALUE;
				}
				anObject.warrantRefMaxSum = set.getBigDecimal(53);
				if(anObject.warrantRefMaxSum != null) {
					anObject.warrantRefMaxSum = anObject.warrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
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
	
	public int[] getFilteredCodeArray(ENDistributionAgreeFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENDistributionAgreeFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENDistributionAgree aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENDISTRIBUTIONAGREE.CODE FROM ENDISTRIBUTIONAGREE";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENDISTRIBUTIONAGREE.CODE";
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


	public ENDistributionAgree getObject(int uid) throws PersistenceException {
		ENDistributionAgree result = new ENDistributionAgree();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENDistributionAgree anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENDISTRIBUTIONAGREE.CODE, ENDISTRIBUTIONAGREE.NUMBERGEN, ENDISTRIBUTIONAGREE.DATEGEN, ENDISTRIBUTIONAGREE.EIC, ENDISTRIBUTIONAGREE.OBJECTNAME, ENDISTRIBUTIONAGREE.OBJECTADDRESS, ENDISTRIBUTIONAGREE.POWER, ENDISTRIBUTIONAGREE.D2FUSENAME, ENDISTRIBUTIONAGREE.D3COUNTERNAME, ENDISTRIBUTIONAGREE.D3COUNTERTYPE, ENDISTRIBUTIONAGREE.D3AMPERAGERATIO, ENDISTRIBUTIONAGREE.D3VOLTAGERATIO, ENDISTRIBUTIONAGREE.D3TOTALRATIO, ENDISTRIBUTIONAGREE.D3PLACE, ENDISTRIBUTIONAGREE.D3VOLTAGECLASS, ENDISTRIBUTIONAGREE.D3WORKMODE, ENDISTRIBUTIONAGREE.D3TARIFFTYPE, ENDISTRIBUTIONAGREE.D3ACCOUNTINGTYPE, ENDISTRIBUTIONAGREE.D5FEEDERLIST, ENDISTRIBUTIONAGREE.D6RELIABILITYPUE, ENDISTRIBUTIONAGREE.D6RELIABILITYGUARANTED, ENDISTRIBUTIONAGREE.D6BALANCESUPPLIER, ENDISTRIBUTIONAGREE.D6BALANCECLIENT, ENDISTRIBUTIONAGREE.D6RESPONSIBILITYSUPPLR, ENDISTRIBUTIONAGREE.D6RESPONSIBILITYCLIENT, ENDISTRIBUTIONAGREE.D6BALANCELIMIT, ENDISTRIBUTIONAGREE.D7LINESOURCE, ENDISTRIBUTIONAGREE.D7ATTACHMENT, ENDISTRIBUTIONAGREE.D8CONDITIONS, ENDISTRIBUTIONAGREE.D8TRANSFORMERTYPE, ENDISTRIBUTIONAGREE.D8VOLTAGEBH, ENDISTRIBUTIONAGREE.D8VOLTAGEHH, ENDISTRIBUTIONAGREE.D8LOSSESXX, ENDISTRIBUTIONAGREE.D8LOSSESKZ, ENDISTRIBUTIONAGREE.D8AMPERAGE, ENDISTRIBUTIONAGREE.D8VOLTAGEKZ, ENDISTRIBUTIONAGREE.D8LINELENGTH, ENDISTRIBUTIONAGREE.D8LINER, ENDISTRIBUTIONAGREE.D8LINEX, ENDISTRIBUTIONAGREE.D8HOURS, ENDISTRIBUTIONAGREE.USERGEN, ENDISTRIBUTIONAGREE.MODIFY_TIME, ENDISTRIBUTIONAGREE.WARRANTREFCODE "
			+" FROM ENDISTRIBUTIONAGREE WHERE ENDISTRIBUTIONAGREE.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.numberGen = set.getString(2);
				anObject.dateGen = set.getTimestamp(3);
				anObject.eic = set.getString(4);
				anObject.objectname = set.getString(5);
				anObject.objectaddress = set.getString(6);
				anObject.power = set.getBigDecimal(7);
				if(anObject.power != null) {
					anObject.power = anObject.power.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d2fusename = set.getString(8);
				anObject.d3countername = set.getString(9);
				anObject.d3countertype = set.getString(10);
				anObject.d3amperageratio = set.getBigDecimal(11);
				if(anObject.d3amperageratio != null) {
					anObject.d3amperageratio = anObject.d3amperageratio.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d3voltageratio = set.getBigDecimal(12);
				if(anObject.d3voltageratio != null) {
					anObject.d3voltageratio = anObject.d3voltageratio.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d3totalratio = set.getBigDecimal(13);
				if(anObject.d3totalratio != null) {
					anObject.d3totalratio = anObject.d3totalratio.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d3place = set.getString(14);
				anObject.d3voltageclass = set.getString(15);
				anObject.d3workmode = set.getString(16);
				anObject.d3tarifftype = set.getString(17);
				anObject.d3accountingtype = set.getString(18);
				anObject.d5feederlist = set.getString(19);
				anObject.d6reliabilitypue = set.getString(20);
				anObject.d6reliabilityguaranteed = set.getString(21);
				anObject.d6balancesupplier = set.getString(22);
				anObject.d6balanceclient = set.getString(23);
				anObject.d6responsibilitysupplier = set.getString(24);
				anObject.d6responsibilityclient = set.getString(25);
				anObject.d6balancelimit = set.getString(26);
				anObject.d7linesource = set.getString(27);
				anObject.d7attachment = set.getString(28);
				anObject.d8conditions = set.getString(29);
				anObject.d8transformertype = set.getString(30);
				anObject.d8voltagebh = set.getBigDecimal(31);
				if(anObject.d8voltagebh != null) {
					anObject.d8voltagebh = anObject.d8voltagebh.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8voltagehh = set.getBigDecimal(32);
				if(anObject.d8voltagehh != null) {
					anObject.d8voltagehh = anObject.d8voltagehh.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8lossesxx = set.getBigDecimal(33);
				if(anObject.d8lossesxx != null) {
					anObject.d8lossesxx = anObject.d8lossesxx.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8losseskz = set.getBigDecimal(34);
				if(anObject.d8losseskz != null) {
					anObject.d8losseskz = anObject.d8losseskz.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8amperage = set.getBigDecimal(35);
				if(anObject.d8amperage != null) {
					anObject.d8amperage = anObject.d8amperage.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8voltagekz = set.getBigDecimal(36);
				if(anObject.d8voltagekz != null) {
					anObject.d8voltagekz = anObject.d8voltagekz.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8linelength = set.getBigDecimal(37);
				if(anObject.d8linelength != null) {
					anObject.d8linelength = anObject.d8linelength.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8liner = set.getBigDecimal(38);
				if(anObject.d8liner != null) {
					anObject.d8liner = anObject.d8liner.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8linex = set.getBigDecimal(39);
				if(anObject.d8linex != null) {
					anObject.d8linex = anObject.d8linex.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.d8hours = set.getInt(40);
				if (set.wasNull()) {
					anObject.d8hours = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(41);
				anObject.modify_time = set.getLong(42);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.warrantRef.code = set.getInt(43);
				if (set.wasNull()) {
					anObject.warrantRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENDistributionAgreeRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENDistributionAgreeRef ref = new com.ksoe.energynet.valueobject.references.ENDistributionAgreeRef();
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

		selectStr = "DELETE FROM  ENDISTRIBUTIONAGREE WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENDistributionAgree object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENDistributionAgree.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENDistributionAgree.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENDistributionAgree.remove%} access denied");
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
	
	public long count(ENDistributionAgreeFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENDistributionAgreeFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENDistributionAgreeFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENDISTRIBUTIONAGREE", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENDistributionAgreeFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENDISTRIBUTIONAGREE");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDistributionAgree.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENDistributionAgree.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENDISTRIBUTIONAGREE.CODE FROM  ENDISTRIBUTIONAGREE WHERE  ENDISTRIBUTIONAGREE.CODE = ?";
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
		_checkConditionToken(condition,"code","ENDISTRIBUTIONAGREE.CODE");
		_checkConditionToken(condition,"numbergen","ENDISTRIBUTIONAGREE.NUMBERGEN");
		_checkConditionToken(condition,"dategen","ENDISTRIBUTIONAGREE.DATEGEN");
		_checkConditionToken(condition,"eic","ENDISTRIBUTIONAGREE.EIC");
		_checkConditionToken(condition,"objectname","ENDISTRIBUTIONAGREE.OBJECTNAME");
		_checkConditionToken(condition,"objectaddress","ENDISTRIBUTIONAGREE.OBJECTADDRESS");
		_checkConditionToken(condition,"power","ENDISTRIBUTIONAGREE.POWER");
		_checkConditionToken(condition,"d2fusename","ENDISTRIBUTIONAGREE.D2FUSENAME");
		_checkConditionToken(condition,"d3countername","ENDISTRIBUTIONAGREE.D3COUNTERNAME");
		_checkConditionToken(condition,"d3countertype","ENDISTRIBUTIONAGREE.D3COUNTERTYPE");
		_checkConditionToken(condition,"d3amperageratio","ENDISTRIBUTIONAGREE.D3AMPERAGERATIO");
		_checkConditionToken(condition,"d3voltageratio","ENDISTRIBUTIONAGREE.D3VOLTAGERATIO");
		_checkConditionToken(condition,"d3totalratio","ENDISTRIBUTIONAGREE.D3TOTALRATIO");
		_checkConditionToken(condition,"d3place","ENDISTRIBUTIONAGREE.D3PLACE");
		_checkConditionToken(condition,"d3voltageclass","ENDISTRIBUTIONAGREE.D3VOLTAGECLASS");
		_checkConditionToken(condition,"d3workmode","ENDISTRIBUTIONAGREE.D3WORKMODE");
		_checkConditionToken(condition,"d3tarifftype","ENDISTRIBUTIONAGREE.D3TARIFFTYPE");
		_checkConditionToken(condition,"d3accountingtype","ENDISTRIBUTIONAGREE.D3ACCOUNTINGTYPE");
		_checkConditionToken(condition,"d5feederlist","ENDISTRIBUTIONAGREE.D5FEEDERLIST");
		_checkConditionToken(condition,"d6reliabilitypue","ENDISTRIBUTIONAGREE.D6RELIABILITYPUE");
		_checkConditionToken(condition,"d6reliabilityguaranteed","ENDISTRIBUTIONAGREE.D6RELIABILITYGUARANTED");
		_checkConditionToken(condition,"d6balancesupplier","ENDISTRIBUTIONAGREE.D6BALANCESUPPLIER");
		_checkConditionToken(condition,"d6balanceclient","ENDISTRIBUTIONAGREE.D6BALANCECLIENT");
		_checkConditionToken(condition,"d6responsibilitysupplier","ENDISTRIBUTIONAGREE.D6RESPONSIBILITYSUPPLR");
		_checkConditionToken(condition,"d6responsibilityclient","ENDISTRIBUTIONAGREE.D6RESPONSIBILITYCLIENT");
		_checkConditionToken(condition,"d6balancelimit","ENDISTRIBUTIONAGREE.D6BALANCELIMIT");
		_checkConditionToken(condition,"d7linesource","ENDISTRIBUTIONAGREE.D7LINESOURCE");
		_checkConditionToken(condition,"d7attachment","ENDISTRIBUTIONAGREE.D7ATTACHMENT");
		_checkConditionToken(condition,"d8conditions","ENDISTRIBUTIONAGREE.D8CONDITIONS");
		_checkConditionToken(condition,"d8transformertype","ENDISTRIBUTIONAGREE.D8TRANSFORMERTYPE");
		_checkConditionToken(condition,"d8voltagebh","ENDISTRIBUTIONAGREE.D8VOLTAGEBH");
		_checkConditionToken(condition,"d8voltagehh","ENDISTRIBUTIONAGREE.D8VOLTAGEHH");
		_checkConditionToken(condition,"d8lossesxx","ENDISTRIBUTIONAGREE.D8LOSSESXX");
		_checkConditionToken(condition,"d8losseskz","ENDISTRIBUTIONAGREE.D8LOSSESKZ");
		_checkConditionToken(condition,"d8amperage","ENDISTRIBUTIONAGREE.D8AMPERAGE");
		_checkConditionToken(condition,"d8voltagekz","ENDISTRIBUTIONAGREE.D8VOLTAGEKZ");
		_checkConditionToken(condition,"d8linelength","ENDISTRIBUTIONAGREE.D8LINELENGTH");
		_checkConditionToken(condition,"d8liner","ENDISTRIBUTIONAGREE.D8LINER");
		_checkConditionToken(condition,"d8linex","ENDISTRIBUTIONAGREE.D8LINEX");
		_checkConditionToken(condition,"d8hours","ENDISTRIBUTIONAGREE.D8HOURS");
		_checkConditionToken(condition,"usergen","ENDISTRIBUTIONAGREE.USERGEN");
		_checkConditionToken(condition,"modify_time","ENDISTRIBUTIONAGREE.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"warrantref","WARRANTREFCODE");
		_checkConditionToken(condition,"warrantref.code","WARRANTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENDistributionAgree anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENDISTRIBUTIONAGREE", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENDISTRIBUTIONAGREE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENDISTRIBUTIONAGREE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENDISTRIBUTIONAGREE");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENDistributionAgreeDAO
