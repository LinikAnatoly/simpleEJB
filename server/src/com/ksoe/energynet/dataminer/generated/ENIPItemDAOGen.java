
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
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
import com.ksoe.energynet.valueobject.ENIPItem;
import com.ksoe.energynet.valueobject.filter.ENIPItemFilter;
import com.ksoe.energynet.valueobject.brief.ENIPItemShort;
import com.ksoe.energynet.valueobject.lists.ENIPItemShortList;


/**
 * DAO Object for ENIPItem;
 *
 */

public class ENIPItemDAOGen extends GenericDataMiner {

	public ENIPItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENIPItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENIPItem inObject) throws PersistenceException {
		ENIPItem obj = new ENIPItem();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.buhName == null && obj.buhName == null){}
		else
			if(inObject.buhName == null || obj.buhName == null) return false;
			else
				if ( ! inObject.buhName.equals(obj.buhName)){
					return false;
				}

		if(inObject.itemNumber == null && obj.itemNumber == null){}
		else
			if(inObject.itemNumber == null || obj.itemNumber == null) return false;
			else
				if ( ! inObject.itemNumber.equals(obj.itemNumber)){
					return false;
				}

		if(inObject.invNumber == null && obj.invNumber == null){}
		else
			if(inObject.invNumber == null || obj.invNumber == null) return false;
			else
				if ( ! inObject.invNumber.equals(obj.invNumber)){
					return false;
				}

		if (inObject.isProjectDocument != obj.isProjectDocument){
					return false;
				}

		if(inObject.financing == null && obj.financing == null){}
		else
			if(inObject.financing == null || obj.financing == null) return false;
			else
				if ( ! inObject.financing.equals(obj.financing)){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if(inObject.countGen == null && obj.countGen == null){}
		else
			if(inObject.countGen == null || obj.countGen == null) return false;
			else
				if ( ! inObject.countGen.equals(obj.countGen)){
					return false;
				}

		if(inObject.price == null && obj.price == null){}
		else
			if(inObject.price == null || obj.price == null) return false;
			else
				if ( ! inObject.price.equals(obj.price)){
					return false;
				}

		if(inObject.sumGen == null && obj.sumGen == null){}
		else
			if(inObject.sumGen == null || obj.sumGen == null) return false;
			else
				if ( ! inObject.sumGen.equals(obj.sumGen)){
					return false;
				}

		if(inObject.quarter1count == null && obj.quarter1count == null){}
		else
			if(inObject.quarter1count == null || obj.quarter1count == null) return false;
			else
				if ( ! inObject.quarter1count.equals(obj.quarter1count)){
					return false;
				}

		if(inObject.quarter1sum == null && obj.quarter1sum == null){}
		else
			if(inObject.quarter1sum == null || obj.quarter1sum == null) return false;
			else
				if ( ! inObject.quarter1sum.equals(obj.quarter1sum)){
					return false;
				}

		if(inObject.quarter2count == null && obj.quarter2count == null){}
		else
			if(inObject.quarter2count == null || obj.quarter2count == null) return false;
			else
				if ( ! inObject.quarter2count.equals(obj.quarter2count)){
					return false;
				}

		if(inObject.quarter2sum == null && obj.quarter2sum == null){}
		else
			if(inObject.quarter2sum == null || obj.quarter2sum == null) return false;
			else
				if ( ! inObject.quarter2sum.equals(obj.quarter2sum)){
					return false;
				}

		if(inObject.quarter3count == null && obj.quarter3count == null){}
		else
			if(inObject.quarter3count == null || obj.quarter3count == null) return false;
			else
				if ( ! inObject.quarter3count.equals(obj.quarter3count)){
					return false;
				}

		if(inObject.quarter3sum == null && obj.quarter3sum == null){}
		else
			if(inObject.quarter3sum == null || obj.quarter3sum == null) return false;
			else
				if ( ! inObject.quarter3sum.equals(obj.quarter3sum)){
					return false;
				}

		if(inObject.quarter4count == null && obj.quarter4count == null){}
		else
			if(inObject.quarter4count == null || obj.quarter4count == null) return false;
			else
				if ( ! inObject.quarter4count.equals(obj.quarter4count)){
					return false;
				}

		if(inObject.quarter4sum == null && obj.quarter4sum == null){}
		else
			if(inObject.quarter4sum == null || obj.quarter4sum == null) return false;
			else
				if ( ! inObject.quarter4sum.equals(obj.quarter4sum)){
					return false;
				}

		if(inObject.countGenInside == null && obj.countGenInside == null){}
		else
			if(inObject.countGenInside == null || obj.countGenInside == null) return false;
			else
				if ( ! inObject.countGenInside.equals(obj.countGenInside)){
					return false;
				}

		if(inObject.priceInside == null && obj.priceInside == null){}
		else
			if(inObject.priceInside == null || obj.priceInside == null) return false;
			else
				if ( ! inObject.priceInside.equals(obj.priceInside)){
					return false;
				}

		if(inObject.sumGenInside == null && obj.sumGenInside == null){}
		else
			if(inObject.sumGenInside == null || obj.sumGenInside == null) return false;
			else
				if ( ! inObject.sumGenInside.equals(obj.sumGenInside)){
					return false;
				}

		if(inObject.mm1countInside == null && obj.mm1countInside == null){}
		else
			if(inObject.mm1countInside == null || obj.mm1countInside == null) return false;
			else
				if ( ! inObject.mm1countInside.equals(obj.mm1countInside)){
					return false;
				}

		if(inObject.mm1sumInside == null && obj.mm1sumInside == null){}
		else
			if(inObject.mm1sumInside == null || obj.mm1sumInside == null) return false;
			else
				if ( ! inObject.mm1sumInside.equals(obj.mm1sumInside)){
					return false;
				}

		if(inObject.mm2countInside == null && obj.mm2countInside == null){}
		else
			if(inObject.mm2countInside == null || obj.mm2countInside == null) return false;
			else
				if ( ! inObject.mm2countInside.equals(obj.mm2countInside)){
					return false;
				}

		if(inObject.mm2sumInside == null && obj.mm2sumInside == null){}
		else
			if(inObject.mm2sumInside == null || obj.mm2sumInside == null) return false;
			else
				if ( ! inObject.mm2sumInside.equals(obj.mm2sumInside)){
					return false;
				}

		if(inObject.mm3countInside == null && obj.mm3countInside == null){}
		else
			if(inObject.mm3countInside == null || obj.mm3countInside == null) return false;
			else
				if ( ! inObject.mm3countInside.equals(obj.mm3countInside)){
					return false;
				}

		if(inObject.mm3sumInside == null && obj.mm3sumInside == null){}
		else
			if(inObject.mm3sumInside == null || obj.mm3sumInside == null) return false;
			else
				if ( ! inObject.mm3sumInside.equals(obj.mm3sumInside)){
					return false;
				}

		if(inObject.mm4countInside == null && obj.mm4countInside == null){}
		else
			if(inObject.mm4countInside == null || obj.mm4countInside == null) return false;
			else
				if ( ! inObject.mm4countInside.equals(obj.mm4countInside)){
					return false;
				}

		if(inObject.mm4sumInside == null && obj.mm4sumInside == null){}
		else
			if(inObject.mm4sumInside == null || obj.mm4sumInside == null) return false;
			else
				if ( ! inObject.mm4sumInside.equals(obj.mm4sumInside)){
					return false;
				}

		if(inObject.mm5countInside == null && obj.mm5countInside == null){}
		else
			if(inObject.mm5countInside == null || obj.mm5countInside == null) return false;
			else
				if ( ! inObject.mm5countInside.equals(obj.mm5countInside)){
					return false;
				}

		if(inObject.mm5sumInside == null && obj.mm5sumInside == null){}
		else
			if(inObject.mm5sumInside == null || obj.mm5sumInside == null) return false;
			else
				if ( ! inObject.mm5sumInside.equals(obj.mm5sumInside)){
					return false;
				}

		if(inObject.mm6countInside == null && obj.mm6countInside == null){}
		else
			if(inObject.mm6countInside == null || obj.mm6countInside == null) return false;
			else
				if ( ! inObject.mm6countInside.equals(obj.mm6countInside)){
					return false;
				}

		if(inObject.mm6sumInside == null && obj.mm6sumInside == null){}
		else
			if(inObject.mm6sumInside == null || obj.mm6sumInside == null) return false;
			else
				if ( ! inObject.mm6sumInside.equals(obj.mm6sumInside)){
					return false;
				}

		if(inObject.mm7countInside == null && obj.mm7countInside == null){}
		else
			if(inObject.mm7countInside == null || obj.mm7countInside == null) return false;
			else
				if ( ! inObject.mm7countInside.equals(obj.mm7countInside)){
					return false;
				}

		if(inObject.mm7sumInside == null && obj.mm7sumInside == null){}
		else
			if(inObject.mm7sumInside == null || obj.mm7sumInside == null) return false;
			else
				if ( ! inObject.mm7sumInside.equals(obj.mm7sumInside)){
					return false;
				}

		if(inObject.mm8countInside == null && obj.mm8countInside == null){}
		else
			if(inObject.mm8countInside == null || obj.mm8countInside == null) return false;
			else
				if ( ! inObject.mm8countInside.equals(obj.mm8countInside)){
					return false;
				}

		if(inObject.mm8sumInside == null && obj.mm8sumInside == null){}
		else
			if(inObject.mm8sumInside == null || obj.mm8sumInside == null) return false;
			else
				if ( ! inObject.mm8sumInside.equals(obj.mm8sumInside)){
					return false;
				}

		if(inObject.mm9countInside == null && obj.mm9countInside == null){}
		else
			if(inObject.mm9countInside == null || obj.mm9countInside == null) return false;
			else
				if ( ! inObject.mm9countInside.equals(obj.mm9countInside)){
					return false;
				}

		if(inObject.mm9sumInside == null && obj.mm9sumInside == null){}
		else
			if(inObject.mm9sumInside == null || obj.mm9sumInside == null) return false;
			else
				if ( ! inObject.mm9sumInside.equals(obj.mm9sumInside)){
					return false;
				}

		if(inObject.mm10countInside == null && obj.mm10countInside == null){}
		else
			if(inObject.mm10countInside == null || obj.mm10countInside == null) return false;
			else
				if ( ! inObject.mm10countInside.equals(obj.mm10countInside)){
					return false;
				}

		if(inObject.mm10sumInside == null && obj.mm10sumInside == null){}
		else
			if(inObject.mm10sumInside == null || obj.mm10sumInside == null) return false;
			else
				if ( ! inObject.mm10sumInside.equals(obj.mm10sumInside)){
					return false;
				}

		if(inObject.mm11countInside == null && obj.mm11countInside == null){}
		else
			if(inObject.mm11countInside == null || obj.mm11countInside == null) return false;
			else
				if ( ! inObject.mm11countInside.equals(obj.mm11countInside)){
					return false;
				}

		if(inObject.mm11sumInside == null && obj.mm11sumInside == null){}
		else
			if(inObject.mm11sumInside == null || obj.mm11sumInside == null) return false;
			else
				if ( ! inObject.mm11sumInside.equals(obj.mm11sumInside)){
					return false;
				}

		if(inObject.mm12countInside == null && obj.mm12countInside == null){}
		else
			if(inObject.mm12countInside == null || obj.mm12countInside == null) return false;
			else
				if ( ! inObject.mm12countInside.equals(obj.mm12countInside)){
					return false;
				}

		if(inObject.mm12sumInside == null && obj.mm12sumInside == null){}
		else
			if(inObject.mm12sumInside == null || obj.mm12sumInside == null) return false;
			else
				if ( ! inObject.mm12sumInside.equals(obj.mm12sumInside)){
					return false;
				}

		if(inObject.infoTenders == null && obj.infoTenders == null){}
		else
			if(inObject.infoTenders == null || obj.infoTenders == null) return false;
			else
				if ( ! inObject.infoTenders.equals(obj.infoTenders)){
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
		if (inObject.measurement.code != obj.measurement.code){
			return false;
		}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		if (inObject.invGroupRef.code != obj.invGroupRef.code){
			return false;
		}
		if (inObject.renRef.code != obj.renRef.code){
			return false;
		}
		if (inObject.purposeProgramRef.code != obj.purposeProgramRef.code){
			return false;
		}
		if (inObject.ipRef.code != obj.ipRef.code){
			return false;
		}
		if (inObject.parentRef.code != obj.parentRef.code){
			return false;
		}
		if (inObject.methodExecWorkRef.code != obj.methodExecWorkRef.code){
			return false;
		}
		if (inObject.ipImplementTypeRef.code != obj.ipImplementTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENIPItem anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENIPItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENIPITEM (CODE,NAME,BUHNAME,ITEMNUMBER,INVNUMBER,ISPROJECTDOCUMENT,FINANCING,COMMENTGEN,COUNTGEN,PRICE,SUMGEN,QUARTER1COUNT,QUARTER1SUM,QUARTER2COUNT,QUARTER2SUM,QUARTER3COUNT,QUARTER3SUM,QUARTER4COUNT,QUARTER4SUM,COUNTGENINSIDE,PRICEINSIDE,SUMGENINSIDE,MM1COUNTINSIDE,MM1SUMINSIDE,MM2COUNTINSIDE,MM2SUMINSIDE,MM3COUNTINSIDE,MM3SUMINSIDE,MM4COUNTINSIDE,MM4SUMINSIDE,MM5COUNTINSIDE,MM5SUMINSIDE,MM6COUNTINSIDE,MM6SUMINSIDE,MM7COUNTINSIDE,MM7SUMINSIDE,MM8COUNTINSIDE,MM8SUMINSIDE,MM9COUNTINSIDE,MM9SUMINSIDE,MM10COUNTINSIDE,MM10SUMINSIDE,MM11COUNTINSIDE,MM11SUMINSIDE,MM12COUNTINSIDE,MM12SUMINSIDE,INFOTENDERS,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,MEASUREMENTCODE,STATUSREFCODE,INVGROUPREFCODE,RENREFCODE,PURPOSEPROGRAMREFCODE,IPREFCODE,PARENTREFCODE,METHODEXECWORKREFCODE,IPIMPLEMENTTYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.name);
			statement.setString(3,anObject.buhName);
			statement.setString(4,anObject.itemNumber);
			statement.setString(5,anObject.invNumber);
			if (anObject.isProjectDocument != Integer.MIN_VALUE ) {
				statement.setInt(6,anObject.isProjectDocument);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			statement.setString(7,anObject.financing);
			statement.setString(8,anObject.commentGen);
			if (anObject.countGen != null) {
				anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9,anObject.countGen);
			if (anObject.price != null) {
				anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10,anObject.price);
			if (anObject.sumGen != null) {
				anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11,anObject.sumGen);
			if (anObject.quarter1count != null) {
				anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(12,anObject.quarter1count);
			if (anObject.quarter1sum != null) {
				anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(13,anObject.quarter1sum);
			if (anObject.quarter2count != null) {
				anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(14,anObject.quarter2count);
			if (anObject.quarter2sum != null) {
				anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(15,anObject.quarter2sum);
			if (anObject.quarter3count != null) {
				anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(16,anObject.quarter3count);
			if (anObject.quarter3sum != null) {
				anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(17,anObject.quarter3sum);
			if (anObject.quarter4count != null) {
				anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(18,anObject.quarter4count);
			if (anObject.quarter4sum != null) {
				anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(19,anObject.quarter4sum);
			if (anObject.countGenInside != null) {
				anObject.countGenInside = anObject.countGenInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(20,anObject.countGenInside);
			if (anObject.priceInside != null) {
				anObject.priceInside = anObject.priceInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(21,anObject.priceInside);
			if (anObject.sumGenInside != null) {
				anObject.sumGenInside = anObject.sumGenInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(22,anObject.sumGenInside);
			if (anObject.mm1countInside != null) {
				anObject.mm1countInside = anObject.mm1countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(23,anObject.mm1countInside);
			if (anObject.mm1sumInside != null) {
				anObject.mm1sumInside = anObject.mm1sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(24,anObject.mm1sumInside);
			if (anObject.mm2countInside != null) {
				anObject.mm2countInside = anObject.mm2countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(25,anObject.mm2countInside);
			if (anObject.mm2sumInside != null) {
				anObject.mm2sumInside = anObject.mm2sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(26,anObject.mm2sumInside);
			if (anObject.mm3countInside != null) {
				anObject.mm3countInside = anObject.mm3countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(27,anObject.mm3countInside);
			if (anObject.mm3sumInside != null) {
				anObject.mm3sumInside = anObject.mm3sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(28,anObject.mm3sumInside);
			if (anObject.mm4countInside != null) {
				anObject.mm4countInside = anObject.mm4countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(29,anObject.mm4countInside);
			if (anObject.mm4sumInside != null) {
				anObject.mm4sumInside = anObject.mm4sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(30,anObject.mm4sumInside);
			if (anObject.mm5countInside != null) {
				anObject.mm5countInside = anObject.mm5countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(31,anObject.mm5countInside);
			if (anObject.mm5sumInside != null) {
				anObject.mm5sumInside = anObject.mm5sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(32,anObject.mm5sumInside);
			if (anObject.mm6countInside != null) {
				anObject.mm6countInside = anObject.mm6countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(33,anObject.mm6countInside);
			if (anObject.mm6sumInside != null) {
				anObject.mm6sumInside = anObject.mm6sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(34,anObject.mm6sumInside);
			if (anObject.mm7countInside != null) {
				anObject.mm7countInside = anObject.mm7countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(35,anObject.mm7countInside);
			if (anObject.mm7sumInside != null) {
				anObject.mm7sumInside = anObject.mm7sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(36,anObject.mm7sumInside);
			if (anObject.mm8countInside != null) {
				anObject.mm8countInside = anObject.mm8countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(37,anObject.mm8countInside);
			if (anObject.mm8sumInside != null) {
				anObject.mm8sumInside = anObject.mm8sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(38,anObject.mm8sumInside);
			if (anObject.mm9countInside != null) {
				anObject.mm9countInside = anObject.mm9countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(39,anObject.mm9countInside);
			if (anObject.mm9sumInside != null) {
				anObject.mm9sumInside = anObject.mm9sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(40,anObject.mm9sumInside);
			if (anObject.mm10countInside != null) {
				anObject.mm10countInside = anObject.mm10countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(41,anObject.mm10countInside);
			if (anObject.mm10sumInside != null) {
				anObject.mm10sumInside = anObject.mm10sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(42,anObject.mm10sumInside);
			if (anObject.mm11countInside != null) {
				anObject.mm11countInside = anObject.mm11countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(43,anObject.mm11countInside);
			if (anObject.mm11sumInside != null) {
				anObject.mm11sumInside = anObject.mm11sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(44,anObject.mm11sumInside);
			if (anObject.mm12countInside != null) {
				anObject.mm12countInside = anObject.mm12countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(45,anObject.mm12countInside);
			if (anObject.mm12sumInside != null) {
				anObject.mm12sumInside = anObject.mm12sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(46,anObject.mm12sumInside);
			statement.setString(47,anObject.infoTenders);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(48,null);
			} else {
				statement.setBigDecimal(48,new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(49,anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(50,null);
			} else {
				statement.setTimestamp(50,new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(51,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(52,null);
			} else {
				statement.setTimestamp(52,new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.measurement.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKMeasurementDAOGen(connection,getUserProfile()).exists(anObject.measurement.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENIPItem.measurement.code%} = {%"+anObject.measurement.code+"%}");
				}
				statement.setInt(53,anObject.measurement.code);
			} else {
				statement.setNull(53,java.sql.Types.INTEGER);
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENIPItemStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIPItem.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
				}
				statement.setInt(54,anObject.statusRef.code);
			} else {
				statement.setNull(54,java.sql.Types.INTEGER);
			}
			if (anObject.invGroupRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENInvestProgramGroupsDAOGen(connection,getUserProfile()).exists(anObject.invGroupRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIPItem.invGroupRef.code%} = {%"+anObject.invGroupRef.code+"%}");
				}
				statement.setInt(55,anObject.invGroupRef.code);
			} else {
				statement.setNull(55,java.sql.Types.INTEGER);
			}
			if (anObject.renRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energypro.dataminer.generated.EPRenDAOGen(connection,getUserProfile()).exists(anObject.renRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energypro.valueobject.ENIPItem.renRef.code%} = {%"+anObject.renRef.code+"%}");
				}
				statement.setInt(56,anObject.renRef.code);
			} else {
				statement.setNull(56,java.sql.Types.INTEGER);
			}
			if (anObject.purposeProgramRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENIPPurposeProgramDAOGen(connection,getUserProfile()).exists(anObject.purposeProgramRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIPItem.purposeProgramRef.code%} = {%"+anObject.purposeProgramRef.code+"%}");
				}
				statement.setInt(57,anObject.purposeProgramRef.code);
			} else {
				statement.setNull(57,java.sql.Types.INTEGER);
			}
			if (anObject.ipRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENIPDAOGen(connection,getUserProfile()).exists(anObject.ipRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIPItem.ipRef.code%} = {%"+anObject.ipRef.code+"%}");
				}
				statement.setInt(58,anObject.ipRef.code);
			} else {
				statement.setNull(58,java.sql.Types.INTEGER);
			}
			if (anObject.parentRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENIPItemDAOGen(connection,getUserProfile()).exists(anObject.parentRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIPItem.parentRef.code%} = {%"+anObject.parentRef.code+"%}");
				}
				statement.setInt(59,anObject.parentRef.code);
			} else {
				statement.setNull(59,java.sql.Types.INTEGER);
			}
			if (anObject.methodExecWorkRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENMethodExecuteWorkDAOGen(connection,getUserProfile()).exists(anObject.methodExecWorkRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIPItem.methodExecWorkRef.code%} = {%"+anObject.methodExecWorkRef.code+"%}");
				}
				statement.setInt(60,anObject.methodExecWorkRef.code);
			} else {
				statement.setNull(60,java.sql.Types.INTEGER);
			}
			if (anObject.ipImplementTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENIPImplementationTypeDAOGen(connection,getUserProfile()).exists(anObject.ipImplementTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIPItem.ipImplementTypeRef.code%} = {%"+anObject.ipImplementTypeRef.code+"%}");
				}
				statement.setInt(61,anObject.ipImplementTypeRef.code);
			} else {
				statement.setNull(61,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENIPItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENIPItem anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENIPItem anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENIPItem oldObject = new ENIPItem();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENIPItem.modify_time_Field+" FROM  ENIPITEM WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUHNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ITEMNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISPROJECTDOCUMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINANCING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("QUARTER1COUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("QUARTER1SUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("QUARTER2COUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("QUARTER2SUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("QUARTER3COUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("QUARTER3SUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("QUARTER4COUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("QUARTER4SUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTGENINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICEINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMGENINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM1COUNTINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM1SUMINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM2COUNTINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM2SUMINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM3COUNTINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM3SUMINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM4COUNTINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM4SUMINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM5COUNTINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM5SUMINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM6COUNTINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM6SUMINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM7COUNTINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM7SUMINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM8COUNTINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM8SUMINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM9COUNTINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM9SUMINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM10COUNTINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM10SUMINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM11COUNTINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM11SUMINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM12COUNTINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MM12SUMINSIDE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INFOTENDERS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
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
					if(fieldNameStr.compareTo("MEASUREMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVGROUPREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RENREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PURPOSEPROGRAMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("IPREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("METHODEXECWORKREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("IPIMPLEMENTTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENIPITEM SET  NAME = ? , BUHNAME = ? , ITEMNUMBER = ? , INVNUMBER = ? , ISPROJECTDOCUMENT = ? , FINANCING = ? , COMMENTGEN = ? , COUNTGEN = ? , PRICE = ? , SUMGEN = ? , QUARTER1COUNT = ? , QUARTER1SUM = ? , QUARTER2COUNT = ? , QUARTER2SUM = ? , QUARTER3COUNT = ? , QUARTER3SUM = ? , QUARTER4COUNT = ? , QUARTER4SUM = ? , COUNTGENINSIDE = ? , PRICEINSIDE = ? , SUMGENINSIDE = ? , MM1COUNTINSIDE = ? , MM1SUMINSIDE = ? , MM2COUNTINSIDE = ? , MM2SUMINSIDE = ? , MM3COUNTINSIDE = ? , MM3SUMINSIDE = ? , MM4COUNTINSIDE = ? , MM4SUMINSIDE = ? , MM5COUNTINSIDE = ? , MM5SUMINSIDE = ? , MM6COUNTINSIDE = ? , MM6SUMINSIDE = ? , MM7COUNTINSIDE = ? , MM7SUMINSIDE = ? , MM8COUNTINSIDE = ? , MM8SUMINSIDE = ? , MM9COUNTINSIDE = ? , MM9SUMINSIDE = ? , MM10COUNTINSIDE = ? , MM10SUMINSIDE = ? , MM11COUNTINSIDE = ? , MM11SUMINSIDE = ? , MM12COUNTINSIDE = ? , MM12SUMINSIDE = ? , INFOTENDERS = ? , MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , MEASUREMENTCODE = ? , STATUSREFCODE = ? , INVGROUPREFCODE = ? , RENREFCODE = ? , PURPOSEPROGRAMREFCODE = ? , IPREFCODE = ? , PARENTREFCODE = ? , METHODEXECWORKREFCODE = ? , IPIMPLEMENTTYPEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENIPITEM SET ";
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
					statement.setString(1,anObject.name);
					statement.setString(2,anObject.buhName);
					statement.setString(3,anObject.itemNumber);
					statement.setString(4,anObject.invNumber);
					if (anObject.isProjectDocument != Integer.MIN_VALUE) {
						statement.setInt(5,anObject.isProjectDocument);
					} else {
						statement.setNull(5,java.sql.Types.INTEGER);
					}
					statement.setString(6,anObject.financing);
					statement.setString(7,anObject.commentGen);
					if (anObject.countGen != null) {
						anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8,anObject.countGen);
					if (anObject.price != null) {
						anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9,anObject.price);
					if (anObject.sumGen != null) {
						anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10,anObject.sumGen);
					if (anObject.quarter1count != null) {
						anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(11,anObject.quarter1count);
					if (anObject.quarter1sum != null) {
						anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(12,anObject.quarter1sum);
					if (anObject.quarter2count != null) {
						anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(13,anObject.quarter2count);
					if (anObject.quarter2sum != null) {
						anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(14,anObject.quarter2sum);
					if (anObject.quarter3count != null) {
						anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(15,anObject.quarter3count);
					if (anObject.quarter3sum != null) {
						anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(16,anObject.quarter3sum);
					if (anObject.quarter4count != null) {
						anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(17,anObject.quarter4count);
					if (anObject.quarter4sum != null) {
						anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(18,anObject.quarter4sum);
					if (anObject.countGenInside != null) {
						anObject.countGenInside = anObject.countGenInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(19,anObject.countGenInside);
					if (anObject.priceInside != null) {
						anObject.priceInside = anObject.priceInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(20,anObject.priceInside);
					if (anObject.sumGenInside != null) {
						anObject.sumGenInside = anObject.sumGenInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(21,anObject.sumGenInside);
					if (anObject.mm1countInside != null) {
						anObject.mm1countInside = anObject.mm1countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(22,anObject.mm1countInside);
					if (anObject.mm1sumInside != null) {
						anObject.mm1sumInside = anObject.mm1sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(23,anObject.mm1sumInside);
					if (anObject.mm2countInside != null) {
						anObject.mm2countInside = anObject.mm2countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(24,anObject.mm2countInside);
					if (anObject.mm2sumInside != null) {
						anObject.mm2sumInside = anObject.mm2sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(25,anObject.mm2sumInside);
					if (anObject.mm3countInside != null) {
						anObject.mm3countInside = anObject.mm3countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(26,anObject.mm3countInside);
					if (anObject.mm3sumInside != null) {
						anObject.mm3sumInside = anObject.mm3sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(27,anObject.mm3sumInside);
					if (anObject.mm4countInside != null) {
						anObject.mm4countInside = anObject.mm4countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(28,anObject.mm4countInside);
					if (anObject.mm4sumInside != null) {
						anObject.mm4sumInside = anObject.mm4sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(29,anObject.mm4sumInside);
					if (anObject.mm5countInside != null) {
						anObject.mm5countInside = anObject.mm5countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(30,anObject.mm5countInside);
					if (anObject.mm5sumInside != null) {
						anObject.mm5sumInside = anObject.mm5sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(31,anObject.mm5sumInside);
					if (anObject.mm6countInside != null) {
						anObject.mm6countInside = anObject.mm6countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(32,anObject.mm6countInside);
					if (anObject.mm6sumInside != null) {
						anObject.mm6sumInside = anObject.mm6sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(33,anObject.mm6sumInside);
					if (anObject.mm7countInside != null) {
						anObject.mm7countInside = anObject.mm7countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(34,anObject.mm7countInside);
					if (anObject.mm7sumInside != null) {
						anObject.mm7sumInside = anObject.mm7sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(35,anObject.mm7sumInside);
					if (anObject.mm8countInside != null) {
						anObject.mm8countInside = anObject.mm8countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(36,anObject.mm8countInside);
					if (anObject.mm8sumInside != null) {
						anObject.mm8sumInside = anObject.mm8sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(37,anObject.mm8sumInside);
					if (anObject.mm9countInside != null) {
						anObject.mm9countInside = anObject.mm9countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(38,anObject.mm9countInside);
					if (anObject.mm9sumInside != null) {
						anObject.mm9sumInside = anObject.mm9sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(39,anObject.mm9sumInside);
					if (anObject.mm10countInside != null) {
						anObject.mm10countInside = anObject.mm10countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(40,anObject.mm10countInside);
					if (anObject.mm10sumInside != null) {
						anObject.mm10sumInside = anObject.mm10sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(41,anObject.mm10sumInside);
					if (anObject.mm11countInside != null) {
						anObject.mm11countInside = anObject.mm11countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(42,anObject.mm11countInside);
					if (anObject.mm11sumInside != null) {
						anObject.mm11sumInside = anObject.mm11sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(43,anObject.mm11sumInside);
					if (anObject.mm12countInside != null) {
						anObject.mm12countInside = anObject.mm12countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(44,anObject.mm12countInside);
					if (anObject.mm12sumInside != null) {
						anObject.mm12sumInside = anObject.mm12sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(45,anObject.mm12sumInside);
					statement.setString(46,anObject.infoTenders);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(47,null);
					} else {
						statement.setBigDecimal(47,new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(48,anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(49,null);
					} else {
						statement.setTimestamp(49,new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(50,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(51,null);
					} else {
						statement.setTimestamp(51,new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.measurement.code != Integer.MIN_VALUE) {
						statement.setInt(52,anObject.measurement.code);
					} else {
						statement.setNull(52,java.sql.Types.INTEGER);
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(53,anObject.statusRef.code);
					} else {
						statement.setNull(53,java.sql.Types.INTEGER);
					}
					if (anObject.invGroupRef.code != Integer.MIN_VALUE) {
						statement.setInt(54,anObject.invGroupRef.code);
					} else {
						statement.setNull(54,java.sql.Types.INTEGER);
					}
					if (anObject.renRef.code != Integer.MIN_VALUE) {
						statement.setInt(55,anObject.renRef.code);
					} else {
						statement.setNull(55,java.sql.Types.INTEGER);
					}
					if (anObject.purposeProgramRef.code != Integer.MIN_VALUE) {
						statement.setInt(56,anObject.purposeProgramRef.code);
					} else {
						statement.setNull(56,java.sql.Types.INTEGER);
					}
					if (anObject.ipRef.code != Integer.MIN_VALUE) {
						statement.setInt(57,anObject.ipRef.code);
					} else {
						statement.setNull(57,java.sql.Types.INTEGER);
					}
					if (anObject.parentRef.code != Integer.MIN_VALUE) {
						statement.setInt(58,anObject.parentRef.code);
					} else {
						statement.setNull(58,java.sql.Types.INTEGER);
					}
					if (anObject.methodExecWorkRef.code != Integer.MIN_VALUE) {
						statement.setInt(59,anObject.methodExecWorkRef.code);
					} else {
						statement.setNull(59,java.sql.Types.INTEGER);
					}
					if (anObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(60,anObject.ipImplementTypeRef.code);
					} else {
						statement.setNull(60,java.sql.Types.INTEGER);
					}
					statement.setInt(61,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.name);
							continue;
						}
						if("BUHNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.buhName);
							continue;
						}
						if("ITEMNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.itemNumber);
							continue;
						}
						if("INVNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.invNumber);
							continue;
						}
						if("ISPROJECTDOCUMENT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.isProjectDocument);
							continue;
						}
						if("FINANCING".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.financing);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.commentGen);
							continue;
						}
						if("COUNTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGen != null) {
								anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.countGen);
							continue;
						}
						if("PRICE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.price != null) {
								anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.price);
							continue;
						}
						if("SUMGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sumGen != null) {
								anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.sumGen);
							continue;
						}
						if("QUARTER1COUNT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.quarter1count != null) {
								anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.quarter1count);
							continue;
						}
						if("QUARTER1SUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.quarter1sum != null) {
								anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.quarter1sum);
							continue;
						}
						if("QUARTER2COUNT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.quarter2count != null) {
								anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.quarter2count);
							continue;
						}
						if("QUARTER2SUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.quarter2sum != null) {
								anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.quarter2sum);
							continue;
						}
						if("QUARTER3COUNT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.quarter3count != null) {
								anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.quarter3count);
							continue;
						}
						if("QUARTER3SUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.quarter3sum != null) {
								anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.quarter3sum);
							continue;
						}
						if("QUARTER4COUNT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.quarter4count != null) {
								anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.quarter4count);
							continue;
						}
						if("QUARTER4SUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.quarter4sum != null) {
								anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.quarter4sum);
							continue;
						}
						if("COUNTGENINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGenInside != null) {
								anObject.countGenInside = anObject.countGenInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.countGenInside);
							continue;
						}
						if("PRICEINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.priceInside != null) {
								anObject.priceInside = anObject.priceInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.priceInside);
							continue;
						}
						if("SUMGENINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sumGenInside != null) {
								anObject.sumGenInside = anObject.sumGenInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.sumGenInside);
							continue;
						}
						if("MM1COUNTINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm1countInside != null) {
								anObject.mm1countInside = anObject.mm1countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm1countInside);
							continue;
						}
						if("MM1SUMINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm1sumInside != null) {
								anObject.mm1sumInside = anObject.mm1sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm1sumInside);
							continue;
						}
						if("MM2COUNTINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm2countInside != null) {
								anObject.mm2countInside = anObject.mm2countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm2countInside);
							continue;
						}
						if("MM2SUMINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm2sumInside != null) {
								anObject.mm2sumInside = anObject.mm2sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm2sumInside);
							continue;
						}
						if("MM3COUNTINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm3countInside != null) {
								anObject.mm3countInside = anObject.mm3countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm3countInside);
							continue;
						}
						if("MM3SUMINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm3sumInside != null) {
								anObject.mm3sumInside = anObject.mm3sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm3sumInside);
							continue;
						}
						if("MM4COUNTINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm4countInside != null) {
								anObject.mm4countInside = anObject.mm4countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm4countInside);
							continue;
						}
						if("MM4SUMINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm4sumInside != null) {
								anObject.mm4sumInside = anObject.mm4sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm4sumInside);
							continue;
						}
						if("MM5COUNTINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm5countInside != null) {
								anObject.mm5countInside = anObject.mm5countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm5countInside);
							continue;
						}
						if("MM5SUMINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm5sumInside != null) {
								anObject.mm5sumInside = anObject.mm5sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm5sumInside);
							continue;
						}
						if("MM6COUNTINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm6countInside != null) {
								anObject.mm6countInside = anObject.mm6countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm6countInside);
							continue;
						}
						if("MM6SUMINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm6sumInside != null) {
								anObject.mm6sumInside = anObject.mm6sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm6sumInside);
							continue;
						}
						if("MM7COUNTINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm7countInside != null) {
								anObject.mm7countInside = anObject.mm7countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm7countInside);
							continue;
						}
						if("MM7SUMINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm7sumInside != null) {
								anObject.mm7sumInside = anObject.mm7sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm7sumInside);
							continue;
						}
						if("MM8COUNTINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm8countInside != null) {
								anObject.mm8countInside = anObject.mm8countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm8countInside);
							continue;
						}
						if("MM8SUMINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm8sumInside != null) {
								anObject.mm8sumInside = anObject.mm8sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm8sumInside);
							continue;
						}
						if("MM9COUNTINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm9countInside != null) {
								anObject.mm9countInside = anObject.mm9countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm9countInside);
							continue;
						}
						if("MM9SUMINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm9sumInside != null) {
								anObject.mm9sumInside = anObject.mm9sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm9sumInside);
							continue;
						}
						if("MM10COUNTINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm10countInside != null) {
								anObject.mm10countInside = anObject.mm10countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm10countInside);
							continue;
						}
						if("MM10SUMINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm10sumInside != null) {
								anObject.mm10sumInside = anObject.mm10sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm10sumInside);
							continue;
						}
						if("MM11COUNTINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm11countInside != null) {
								anObject.mm11countInside = anObject.mm11countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm11countInside);
							continue;
						}
						if("MM11SUMINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm11sumInside != null) {
								anObject.mm11sumInside = anObject.mm11sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm11sumInside);
							continue;
						}
						if("MM12COUNTINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm12countInside != null) {
								anObject.mm12countInside = anObject.mm12countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm12countInside);
							continue;
						}
						if("MM12SUMINSIDE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.mm12sumInside != null) {
								anObject.mm12sumInside = anObject.mm12sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.mm12sumInside);
							continue;
						}
						if("INFOTENDERS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.infoTenders);
							continue;
						}
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1,null);
							} else {
								statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("USERADD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userAdd);
							continue;
						}
						if("DATEADD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateAdd == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateAdd.getTime()));
							}
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("MEASUREMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.measurement.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.measurement.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("STATUSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.statusRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.statusRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("INVGROUPREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.invGroupRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.invGroupRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("RENREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.renRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.renRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PURPOSEPROGRAMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.purposeProgramRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.purposeProgramRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("IPREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ipRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.ipRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PARENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.parentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.parentRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("METHODEXECWORKREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.methodExecWorkRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.methodExecWorkRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("IPIMPLEMENTTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.ipImplementTypeRef.code);
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

	} // end of save(ENIPItem anObject,String[] anAttributes)


	public ENIPItemShort getShortObject(int anObjectCode) throws PersistenceException {
		ENIPItem filterObject = new ENIPItem();
		Vector<ENIPItemShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENIPItemShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENIPItem filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.buhName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.itemNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.invNumber, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isProjectDocument, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.financing, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.price, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sumGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.quarter1count, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.quarter1sum, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.quarter2count, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.quarter2sum, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.quarter3count, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.quarter3sum, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.quarter4count, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.quarter4sum, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGenInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.priceInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sumGenInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm1countInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm1sumInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm2countInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm2sumInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm3countInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm3sumInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm4countInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm4sumInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm5countInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm5sumInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm6countInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm6sumInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm7countInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm7sumInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm8countInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm8sumInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm9countInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm9sumInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm10countInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm10sumInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm11countInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm11sumInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm12countInside, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.mm12sumInside, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.infoTenders, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.measurement.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.invGroupRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.renRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.purposeProgramRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ipRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.parentRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.methodExecWorkRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ipImplementTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENIPItemFilter filter) {
		String out = buildCondition((ENIPItem)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENIPItem filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENIPItem.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENIPItem.name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.buhName, ENIPItem.buhName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.itemNumber, ENIPItem.itemNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.invNumber, ENIPItem.invNumber_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isProjectDocument, ENIPItem.isProjectDocument_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.financing, ENIPItem.financing_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENIPItem.commentGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGen, ENIPItem.countGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.price, ENIPItem.price_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sumGen, ENIPItem.sumGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.quarter1count, ENIPItem.quarter1count_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.quarter1sum, ENIPItem.quarter1sum_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.quarter2count, ENIPItem.quarter2count_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.quarter2sum, ENIPItem.quarter2sum_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.quarter3count, ENIPItem.quarter3count_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.quarter3sum, ENIPItem.quarter3sum_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.quarter4count, ENIPItem.quarter4count_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.quarter4sum, ENIPItem.quarter4sum_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGenInside, ENIPItem.countGenInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.priceInside, ENIPItem.priceInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sumGenInside, ENIPItem.sumGenInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm1countInside, ENIPItem.mm1countInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm1sumInside, ENIPItem.mm1sumInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm2countInside, ENIPItem.mm2countInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm2sumInside, ENIPItem.mm2sumInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm3countInside, ENIPItem.mm3countInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm3sumInside, ENIPItem.mm3sumInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm4countInside, ENIPItem.mm4countInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm4sumInside, ENIPItem.mm4sumInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm5countInside, ENIPItem.mm5countInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm5sumInside, ENIPItem.mm5sumInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm6countInside, ENIPItem.mm6countInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm6sumInside, ENIPItem.mm6sumInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm7countInside, ENIPItem.mm7countInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm7sumInside, ENIPItem.mm7sumInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm8countInside, ENIPItem.mm8countInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm8sumInside, ENIPItem.mm8sumInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm9countInside, ENIPItem.mm9countInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm9sumInside, ENIPItem.mm9sumInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm10countInside, ENIPItem.mm10countInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm10sumInside, ENIPItem.mm10sumInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm11countInside, ENIPItem.mm11countInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm11sumInside, ENIPItem.mm11sumInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm12countInside, ENIPItem.mm12countInside_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.mm12sumInside, ENIPItem.mm12sumInside_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.infoTenders, ENIPItem.infoTenders_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENIPItem.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENIPItem.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENIPItem.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENIPItem.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENIPItem.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.measurement.code, ENIPItem.measurement_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, ENIPItem.statusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.invGroupRef.code, ENIPItem.invGroupRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.renRef.code, ENIPItem.renRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.purposeProgramRef.code, ENIPItem.purposeProgramRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ipRef.code, ENIPItem.ipRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.parentRef.code, ENIPItem.parentRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.methodExecWorkRef.code, ENIPItem.methodExecWorkRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ipImplementTypeRef.code, ENIPItem.ipImplementTypeRef_QFielld, out);
		}
		return out;
	}

	public ENIPItemShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENIPItemShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENIPItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENIPItemShortList getFilteredList(ENIPItem filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENIPItemShortList getScrollableFilteredList(ENIPItem aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENIPItemShortList getScrollableFilteredList(ENIPItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENIPItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENIPItemShortList getScrollableFilteredList(ENIPItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENIPItemShortList getScrollableFilteredList(ENIPItemFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENIPItemShortList getScrollableFilteredList(ENIPItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENIPItemShortList result = new ENIPItemShortList();
		ENIPItemShort anObject;
		result.list = new Vector<ENIPItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENIPITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENIPITEM.CODE"+
			",ENIPITEM.NAME"+
			",ENIPITEM.BUHNAME"+
			",ENIPITEM.ITEMNUMBER"+
			",ENIPITEM.INVNUMBER"+
			",ENIPITEM.ISPROJECTDOCUMENT"+
			",ENIPITEM.FINANCING"+
			",ENIPITEM.COMMENTGEN"+
			",ENIPITEM.COUNTGEN"+
			",ENIPITEM.PRICE"+
			",ENIPITEM.SUMGEN"+
			",ENIPITEM.QUARTER1COUNT"+
			",ENIPITEM.QUARTER1SUM"+
			",ENIPITEM.QUARTER2COUNT"+
			",ENIPITEM.QUARTER2SUM"+
			",ENIPITEM.QUARTER3COUNT"+
			",ENIPITEM.QUARTER3SUM"+
			",ENIPITEM.QUARTER4COUNT"+
			",ENIPITEM.QUARTER4SUM"+
			",ENIPITEM.COUNTGENINSIDE"+
			",ENIPITEM.PRICEINSIDE"+
			",ENIPITEM.SUMGENINSIDE"+
			",ENIPITEM.MM1COUNTINSIDE"+
			",ENIPITEM.MM1SUMINSIDE"+
			",ENIPITEM.MM2COUNTINSIDE"+
			",ENIPITEM.MM2SUMINSIDE"+
			",ENIPITEM.MM3COUNTINSIDE"+
			",ENIPITEM.MM3SUMINSIDE"+
			",ENIPITEM.MM4COUNTINSIDE"+
			",ENIPITEM.MM4SUMINSIDE"+
			",ENIPITEM.MM5COUNTINSIDE"+
			",ENIPITEM.MM5SUMINSIDE"+
			",ENIPITEM.MM6COUNTINSIDE"+
			",ENIPITEM.MM6SUMINSIDE"+
			",ENIPITEM.MM7COUNTINSIDE"+
			",ENIPITEM.MM7SUMINSIDE"+
			",ENIPITEM.MM8COUNTINSIDE"+
			",ENIPITEM.MM8SUMINSIDE"+
			",ENIPITEM.MM9COUNTINSIDE"+
			",ENIPITEM.MM9SUMINSIDE"+
			",ENIPITEM.MM10COUNTINSIDE"+
			",ENIPITEM.MM10SUMINSIDE"+
			",ENIPITEM.MM11COUNTINSIDE"+
			",ENIPITEM.MM11SUMINSIDE"+
			",ENIPITEM.MM12COUNTINSIDE"+
			",ENIPITEM.MM12SUMINSIDE"+
			",ENIPITEM.INFOTENDERS"+
			",ENIPITEM.USERADD"+
			",ENIPITEM.DATEADD"+
			",ENIPITEM.USERGEN"+
			",ENIPITEM.DATEEDIT"+
			", TKMEASUREMENT.CODE " +
			", TKMEASUREMENT.NAME " +
			", ENIPITEMSTATUS.CODE " +
			", ENIPITEMSTATUS.NAME " +
			", ENINVESTPROGRAMGROUPS.CODE " +
			", ENINVESTPROGRAMGROUPS.NAME " +
			", ENINVESTPROGRAMGROUPS.COMMENTGEN " +
			", EPREN.CODE " +
			", EPREN.NAME " +
			", ENIPPURPOSEPROGRAM.CODE " +
			", ENIPPURPOSEPROGRAM.NAME " +
			", ENIP.CODE " +
			", ENIP.NAME " +
			", ENIP.YEARGEN " +
			", ENIP.VERSION " +
			", ENIP.COMMENTGEN " +
			", ENIP.DATEADD " +
			", ENIP.DATEEDIT " +
			", ENIP.USERADD " +
			", ENIP.USEREDIT " +
			", ENIPITEM.CODE " +
			", ENIPITEM.NAME " +
			", ENIPITEM.BUHNAME " +
			", ENIPITEM.ITEMNUMBER " +
			", ENIPITEM.INVNUMBER " +
			", ENIPITEM.ISPROJECTDOCUMENT " +
			", ENIPITEM.FINANCING " +
			", ENIPITEM.COMMENTGEN " +
			", ENIPITEM.COUNTGEN " +
			", ENIPITEM.PRICE " +
			", ENIPITEM.SUMGEN " +
			", ENIPITEM.QUARTER1COUNT " +
			", ENIPITEM.QUARTER1SUM " +
			", ENIPITEM.QUARTER2COUNT " +
			", ENIPITEM.QUARTER2SUM " +
			", ENIPITEM.QUARTER3COUNT " +
			", ENIPITEM.QUARTER3SUM " +
			", ENIPITEM.QUARTER4COUNT " +
			", ENIPITEM.QUARTER4SUM " +
			", ENIPITEM.COUNTGENINSIDE " +
			", ENIPITEM.PRICEINSIDE " +
			", ENIPITEM.SUMGENINSIDE " +
			", ENIPITEM.MM1COUNTINSIDE " +
			", ENIPITEM.MM1SUMINSIDE " +
			", ENIPITEM.MM2COUNTINSIDE " +
			", ENIPITEM.MM2SUMINSIDE " +
			", ENIPITEM.MM3COUNTINSIDE " +
			", ENIPITEM.MM3SUMINSIDE " +
			", ENIPITEM.MM4COUNTINSIDE " +
			", ENIPITEM.MM4SUMINSIDE " +
			", ENIPITEM.MM5COUNTINSIDE " +
			", ENIPITEM.MM5SUMINSIDE " +
			", ENIPITEM.MM6COUNTINSIDE " +
			", ENIPITEM.MM6SUMINSIDE " +
			", ENIPITEM.MM7COUNTINSIDE " +
			", ENIPITEM.MM7SUMINSIDE " +
			", ENIPITEM.MM8COUNTINSIDE " +
			", ENIPITEM.MM8SUMINSIDE " +
			", ENIPITEM.MM9COUNTINSIDE " +
			", ENIPITEM.MM9SUMINSIDE " +
			", ENIPITEM.MM10COUNTINSIDE " +
			", ENIPITEM.MM10SUMINSIDE " +
			", ENIPITEM.MM11COUNTINSIDE " +
			", ENIPITEM.MM11SUMINSIDE " +
			", ENIPITEM.MM12COUNTINSIDE " +
			", ENIPITEM.MM12SUMINSIDE " +
			", ENIPITEM.INFOTENDERS " +
			", ENIPITEM.USERADD " +
			", ENIPITEM.DATEADD " +
			", ENIPITEM.USERGEN " +
			", ENIPITEM.DATEEDIT " +
			", ENMETHODEXECUTEWORK.CODE " +
			", ENMETHODEXECUTEWORK.NAME " +
			", ENIPIMPLEMENTATIONTYPE.CODE " +
			", ENIPIMPLEMENTATIONTYPE.NAME " +
		" FROM ENIPITEM " +
			", TKMEASUREMENT " +
			", ENIPITEMSTATUS " +
			", ENINVESTPROGRAMGROUPS " +
			", EPREN " +
			", ENIPPURPOSEPROGRAM " +
			", ENIP " +
			", ENIPITEM " +
			", ENMETHODEXECUTEWORK " +
			", ENIPIMPLEMENTATIONTYPE " +
		"";
		whereStr = " TKMEASUREMENT.CODE = ENIPITEM.MEASUREMENTCODE" ; //+
		whereStr += " AND ENIPITEMSTATUS.CODE = ENIPITEM.STATUSREFCODE" ; //+
		whereStr += " AND ENINVESTPROGRAMGROUPS.CODE = ENIPITEM.INVGROUPREFCODE" ; //+
		whereStr += " AND EPREN.CODE = ENIPITEM.RENREFCODE" ; //+
		whereStr += " AND ENIPPURPOSEPROGRAM.CODE = ENIPITEM.PURPOSEPROGRAMREFCODE" ; //+
		whereStr += " AND ENIP.CODE = ENIPITEM.IPREFCODE" ; //+
		whereStr += " AND ENIPITEM.CODE = ENIPITEM.PARENTREFCODE" ; //+
		whereStr += " AND ENMETHODEXECUTEWORK.CODE = ENIPITEM.METHODEXECWORKREFCODE" ; //+
		whereStr += " AND ENIPIMPLEMENTATIONTYPE.CODE = ENIPITEM.IPIMPLEMENTTYPEREFCODE" ; //+

	
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
				anObject = new ENIPItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.name = set.getString(2);
				anObject.buhName = set.getString(3);
				anObject.itemNumber = set.getString(4);
				anObject.invNumber = set.getString(5);
				anObject.isProjectDocument = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.isProjectDocument = Integer.MIN_VALUE;
				}
				anObject.financing = set.getString(7);
				anObject.commentGen = set.getString(8);
				anObject.countGen = set.getBigDecimal(9);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.price = set.getBigDecimal(10);
				if(anObject.price != null) {
					anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGen = set.getBigDecimal(11);
				if(anObject.sumGen != null) {
					anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter1count = set.getBigDecimal(12);
				if(anObject.quarter1count != null) {
					anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter1sum = set.getBigDecimal(13);
				if(anObject.quarter1sum != null) {
					anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter2count = set.getBigDecimal(14);
				if(anObject.quarter2count != null) {
					anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter2sum = set.getBigDecimal(15);
				if(anObject.quarter2sum != null) {
					anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter3count = set.getBigDecimal(16);
				if(anObject.quarter3count != null) {
					anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter3sum = set.getBigDecimal(17);
				if(anObject.quarter3sum != null) {
					anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter4count = set.getBigDecimal(18);
				if(anObject.quarter4count != null) {
					anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter4sum = set.getBigDecimal(19);
				if(anObject.quarter4sum != null) {
					anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countGenInside = set.getBigDecimal(20);
				if(anObject.countGenInside != null) {
					anObject.countGenInside = anObject.countGenInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceInside = set.getBigDecimal(21);
				if(anObject.priceInside != null) {
					anObject.priceInside = anObject.priceInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGenInside = set.getBigDecimal(22);
				if(anObject.sumGenInside != null) {
					anObject.sumGenInside = anObject.sumGenInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm1countInside = set.getBigDecimal(23);
				if(anObject.mm1countInside != null) {
					anObject.mm1countInside = anObject.mm1countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm1sumInside = set.getBigDecimal(24);
				if(anObject.mm1sumInside != null) {
					anObject.mm1sumInside = anObject.mm1sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm2countInside = set.getBigDecimal(25);
				if(anObject.mm2countInside != null) {
					anObject.mm2countInside = anObject.mm2countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm2sumInside = set.getBigDecimal(26);
				if(anObject.mm2sumInside != null) {
					anObject.mm2sumInside = anObject.mm2sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm3countInside = set.getBigDecimal(27);
				if(anObject.mm3countInside != null) {
					anObject.mm3countInside = anObject.mm3countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm3sumInside = set.getBigDecimal(28);
				if(anObject.mm3sumInside != null) {
					anObject.mm3sumInside = anObject.mm3sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm4countInside = set.getBigDecimal(29);
				if(anObject.mm4countInside != null) {
					anObject.mm4countInside = anObject.mm4countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm4sumInside = set.getBigDecimal(30);
				if(anObject.mm4sumInside != null) {
					anObject.mm4sumInside = anObject.mm4sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm5countInside = set.getBigDecimal(31);
				if(anObject.mm5countInside != null) {
					anObject.mm5countInside = anObject.mm5countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm5sumInside = set.getBigDecimal(32);
				if(anObject.mm5sumInside != null) {
					anObject.mm5sumInside = anObject.mm5sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm6countInside = set.getBigDecimal(33);
				if(anObject.mm6countInside != null) {
					anObject.mm6countInside = anObject.mm6countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm6sumInside = set.getBigDecimal(34);
				if(anObject.mm6sumInside != null) {
					anObject.mm6sumInside = anObject.mm6sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm7countInside = set.getBigDecimal(35);
				if(anObject.mm7countInside != null) {
					anObject.mm7countInside = anObject.mm7countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm7sumInside = set.getBigDecimal(36);
				if(anObject.mm7sumInside != null) {
					anObject.mm7sumInside = anObject.mm7sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm8countInside = set.getBigDecimal(37);
				if(anObject.mm8countInside != null) {
					anObject.mm8countInside = anObject.mm8countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm8sumInside = set.getBigDecimal(38);
				if(anObject.mm8sumInside != null) {
					anObject.mm8sumInside = anObject.mm8sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm9countInside = set.getBigDecimal(39);
				if(anObject.mm9countInside != null) {
					anObject.mm9countInside = anObject.mm9countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm9sumInside = set.getBigDecimal(40);
				if(anObject.mm9sumInside != null) {
					anObject.mm9sumInside = anObject.mm9sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm10countInside = set.getBigDecimal(41);
				if(anObject.mm10countInside != null) {
					anObject.mm10countInside = anObject.mm10countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm10sumInside = set.getBigDecimal(42);
				if(anObject.mm10sumInside != null) {
					anObject.mm10sumInside = anObject.mm10sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm11countInside = set.getBigDecimal(43);
				if(anObject.mm11countInside != null) {
					anObject.mm11countInside = anObject.mm11countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm11sumInside = set.getBigDecimal(44);
				if(anObject.mm11sumInside != null) {
					anObject.mm11sumInside = anObject.mm11sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm12countInside = set.getBigDecimal(45);
				if(anObject.mm12countInside != null) {
					anObject.mm12countInside = anObject.mm12countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm12sumInside = set.getBigDecimal(46);
				if(anObject.mm12sumInside != null) {
					anObject.mm12sumInside = anObject.mm12sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.infoTenders = set.getString(47);
				anObject.userAdd = set.getString(48);
				anObject.dateAdd = set.getTimestamp(49);
				anObject.userGen = set.getString(50);
				anObject.dateEdit = set.getTimestamp(51);

				anObject.measurementCode = set.getInt(52);
				if(set.wasNull()) {
					anObject.measurementCode = Integer.MIN_VALUE;
				}
				anObject.measurementName = set.getString(53);
				anObject.statusRefCode = set.getInt(54);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(55);
				anObject.invGroupRefCode = set.getInt(56);
				if(set.wasNull()) {
					anObject.invGroupRefCode = Integer.MIN_VALUE;
				}
				anObject.invGroupRefName = set.getString(57);
				anObject.invGroupRefCommentgen = set.getString(58);
				anObject.renRefCode = set.getInt(59);
				if(set.wasNull()) {
					anObject.renRefCode = Integer.MIN_VALUE;
				}
				anObject.renRefName = set.getString(60);
				anObject.purposeProgramRefCode = set.getInt(61);
				if(set.wasNull()) {
					anObject.purposeProgramRefCode = Integer.MIN_VALUE;
				}
				anObject.purposeProgramRefName = set.getString(62);
				anObject.ipRefCode = set.getInt(63);
				if(set.wasNull()) {
					anObject.ipRefCode = Integer.MIN_VALUE;
				}
				anObject.ipRefName = set.getString(64);
				anObject.ipRefYearGen = set.getInt(65);
				if(set.wasNull()) {
					anObject.ipRefYearGen = Integer.MIN_VALUE;
				}
				anObject.ipRefVersion = set.getInt(66);
				if(set.wasNull()) {
					anObject.ipRefVersion = Integer.MIN_VALUE;
				}
				anObject.ipRefCommentGen = set.getString(67);
				anObject.ipRefDateAdd = set.getTimestamp(68);
				anObject.ipRefDateEdit = set.getTimestamp(69);
				anObject.ipRefUserAdd = set.getString(70);
				anObject.ipRefUserEdit = set.getString(71);
				anObject.parentRefCode = set.getInt(72);
				if(set.wasNull()) {
					anObject.parentRefCode = Integer.MIN_VALUE;
				}
				anObject.parentRefName = set.getString(73);
				anObject.parentRefBuhName = set.getString(74);
				anObject.parentRefItemNumber = set.getString(75);
				anObject.parentRefInvNumber = set.getString(76);
				anObject.parentRefIsProjectDocument = set.getInt(77);
				if(set.wasNull()) {
					anObject.parentRefIsProjectDocument = Integer.MIN_VALUE;
				}
				anObject.parentRefFinancing = set.getString(78);
				anObject.parentRefCommentGen = set.getString(79);
				anObject.parentRefCountGen = set.getBigDecimal(80);
				if(anObject.parentRefCountGen != null) {
					anObject.parentRefCountGen = anObject.parentRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefPrice = set.getBigDecimal(81);
				if(anObject.parentRefPrice != null) {
					anObject.parentRefPrice = anObject.parentRefPrice.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefSumGen = set.getBigDecimal(82);
				if(anObject.parentRefSumGen != null) {
					anObject.parentRefSumGen = anObject.parentRefSumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefQuarter1count = set.getBigDecimal(83);
				if(anObject.parentRefQuarter1count != null) {
					anObject.parentRefQuarter1count = anObject.parentRefQuarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefQuarter1sum = set.getBigDecimal(84);
				if(anObject.parentRefQuarter1sum != null) {
					anObject.parentRefQuarter1sum = anObject.parentRefQuarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefQuarter2count = set.getBigDecimal(85);
				if(anObject.parentRefQuarter2count != null) {
					anObject.parentRefQuarter2count = anObject.parentRefQuarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefQuarter2sum = set.getBigDecimal(86);
				if(anObject.parentRefQuarter2sum != null) {
					anObject.parentRefQuarter2sum = anObject.parentRefQuarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefQuarter3count = set.getBigDecimal(87);
				if(anObject.parentRefQuarter3count != null) {
					anObject.parentRefQuarter3count = anObject.parentRefQuarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefQuarter3sum = set.getBigDecimal(88);
				if(anObject.parentRefQuarter3sum != null) {
					anObject.parentRefQuarter3sum = anObject.parentRefQuarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefQuarter4count = set.getBigDecimal(89);
				if(anObject.parentRefQuarter4count != null) {
					anObject.parentRefQuarter4count = anObject.parentRefQuarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefQuarter4sum = set.getBigDecimal(90);
				if(anObject.parentRefQuarter4sum != null) {
					anObject.parentRefQuarter4sum = anObject.parentRefQuarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefCountGenInside = set.getBigDecimal(91);
				if(anObject.parentRefCountGenInside != null) {
					anObject.parentRefCountGenInside = anObject.parentRefCountGenInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefPriceInside = set.getBigDecimal(92);
				if(anObject.parentRefPriceInside != null) {
					anObject.parentRefPriceInside = anObject.parentRefPriceInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefSumGenInside = set.getBigDecimal(93);
				if(anObject.parentRefSumGenInside != null) {
					anObject.parentRefSumGenInside = anObject.parentRefSumGenInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm1countInside = set.getBigDecimal(94);
				if(anObject.parentRefMm1countInside != null) {
					anObject.parentRefMm1countInside = anObject.parentRefMm1countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm1sumInside = set.getBigDecimal(95);
				if(anObject.parentRefMm1sumInside != null) {
					anObject.parentRefMm1sumInside = anObject.parentRefMm1sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm2countInside = set.getBigDecimal(96);
				if(anObject.parentRefMm2countInside != null) {
					anObject.parentRefMm2countInside = anObject.parentRefMm2countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm2sumInside = set.getBigDecimal(97);
				if(anObject.parentRefMm2sumInside != null) {
					anObject.parentRefMm2sumInside = anObject.parentRefMm2sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm3countInside = set.getBigDecimal(98);
				if(anObject.parentRefMm3countInside != null) {
					anObject.parentRefMm3countInside = anObject.parentRefMm3countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm3sumInside = set.getBigDecimal(99);
				if(anObject.parentRefMm3sumInside != null) {
					anObject.parentRefMm3sumInside = anObject.parentRefMm3sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm4countInside = set.getBigDecimal(100);
				if(anObject.parentRefMm4countInside != null) {
					anObject.parentRefMm4countInside = anObject.parentRefMm4countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm4sumInside = set.getBigDecimal(101);
				if(anObject.parentRefMm4sumInside != null) {
					anObject.parentRefMm4sumInside = anObject.parentRefMm4sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm5countInside = set.getBigDecimal(102);
				if(anObject.parentRefMm5countInside != null) {
					anObject.parentRefMm5countInside = anObject.parentRefMm5countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm5sumInside = set.getBigDecimal(103);
				if(anObject.parentRefMm5sumInside != null) {
					anObject.parentRefMm5sumInside = anObject.parentRefMm5sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm6countInside = set.getBigDecimal(104);
				if(anObject.parentRefMm6countInside != null) {
					anObject.parentRefMm6countInside = anObject.parentRefMm6countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm6sumInside = set.getBigDecimal(105);
				if(anObject.parentRefMm6sumInside != null) {
					anObject.parentRefMm6sumInside = anObject.parentRefMm6sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm7countInside = set.getBigDecimal(106);
				if(anObject.parentRefMm7countInside != null) {
					anObject.parentRefMm7countInside = anObject.parentRefMm7countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm7sumInside = set.getBigDecimal(107);
				if(anObject.parentRefMm7sumInside != null) {
					anObject.parentRefMm7sumInside = anObject.parentRefMm7sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm8countInside = set.getBigDecimal(108);
				if(anObject.parentRefMm8countInside != null) {
					anObject.parentRefMm8countInside = anObject.parentRefMm8countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm8sumInside = set.getBigDecimal(109);
				if(anObject.parentRefMm8sumInside != null) {
					anObject.parentRefMm8sumInside = anObject.parentRefMm8sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm9countInside = set.getBigDecimal(110);
				if(anObject.parentRefMm9countInside != null) {
					anObject.parentRefMm9countInside = anObject.parentRefMm9countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm9sumInside = set.getBigDecimal(111);
				if(anObject.parentRefMm9sumInside != null) {
					anObject.parentRefMm9sumInside = anObject.parentRefMm9sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm10countInside = set.getBigDecimal(112);
				if(anObject.parentRefMm10countInside != null) {
					anObject.parentRefMm10countInside = anObject.parentRefMm10countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm10sumInside = set.getBigDecimal(113);
				if(anObject.parentRefMm10sumInside != null) {
					anObject.parentRefMm10sumInside = anObject.parentRefMm10sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm11countInside = set.getBigDecimal(114);
				if(anObject.parentRefMm11countInside != null) {
					anObject.parentRefMm11countInside = anObject.parentRefMm11countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm11sumInside = set.getBigDecimal(115);
				if(anObject.parentRefMm11sumInside != null) {
					anObject.parentRefMm11sumInside = anObject.parentRefMm11sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm12countInside = set.getBigDecimal(116);
				if(anObject.parentRefMm12countInside != null) {
					anObject.parentRefMm12countInside = anObject.parentRefMm12countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefMm12sumInside = set.getBigDecimal(117);
				if(anObject.parentRefMm12sumInside != null) {
					anObject.parentRefMm12sumInside = anObject.parentRefMm12sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefInfoTenders = set.getString(118);
				anObject.parentRefUserAdd = set.getString(119);
				anObject.parentRefDateAdd = set.getTimestamp(120);
				anObject.parentRefUserGen = set.getString(121);
				anObject.parentRefDateEdit = set.getTimestamp(122);
				anObject.methodExecWorkRefCode = set.getInt(123);
				if(set.wasNull()) {
					anObject.methodExecWorkRefCode = Integer.MIN_VALUE;
				}
				anObject.methodExecWorkRefName = set.getString(124);
				anObject.ipImplementTypeRefCode = set.getInt(125);
				if(set.wasNull()) {
					anObject.ipImplementTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.ipImplementTypeRefName = set.getString(126);

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
	
	public int[] getFilteredCodeArray(ENIPItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENIPItemFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENIPItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENIPITEM.CODE FROM ENIPITEM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENIPITEM.CODE";
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

	public ENIPItem getObject(int uid) throws PersistenceException {
		ENIPItem result = new ENIPItem();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENIPItem anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENIPITEM.CODE, ENIPITEM.NAME, ENIPITEM.BUHNAME, ENIPITEM.ITEMNUMBER, ENIPITEM.INVNUMBER, ENIPITEM.ISPROJECTDOCUMENT, ENIPITEM.FINANCING, ENIPITEM.COMMENTGEN, ENIPITEM.COUNTGEN, ENIPITEM.PRICE, ENIPITEM.SUMGEN, ENIPITEM.QUARTER1COUNT, ENIPITEM.QUARTER1SUM, ENIPITEM.QUARTER2COUNT, ENIPITEM.QUARTER2SUM, ENIPITEM.QUARTER3COUNT, ENIPITEM.QUARTER3SUM, ENIPITEM.QUARTER4COUNT, ENIPITEM.QUARTER4SUM, ENIPITEM.COUNTGENINSIDE, ENIPITEM.PRICEINSIDE, ENIPITEM.SUMGENINSIDE, ENIPITEM.MM1COUNTINSIDE, ENIPITEM.MM1SUMINSIDE, ENIPITEM.MM2COUNTINSIDE, ENIPITEM.MM2SUMINSIDE, ENIPITEM.MM3COUNTINSIDE, ENIPITEM.MM3SUMINSIDE, ENIPITEM.MM4COUNTINSIDE, ENIPITEM.MM4SUMINSIDE, ENIPITEM.MM5COUNTINSIDE, ENIPITEM.MM5SUMINSIDE, ENIPITEM.MM6COUNTINSIDE, ENIPITEM.MM6SUMINSIDE, ENIPITEM.MM7COUNTINSIDE, ENIPITEM.MM7SUMINSIDE, ENIPITEM.MM8COUNTINSIDE, ENIPITEM.MM8SUMINSIDE, ENIPITEM.MM9COUNTINSIDE, ENIPITEM.MM9SUMINSIDE, ENIPITEM.MM10COUNTINSIDE, ENIPITEM.MM10SUMINSIDE, ENIPITEM.MM11COUNTINSIDE, ENIPITEM.MM11SUMINSIDE, ENIPITEM.MM12COUNTINSIDE, ENIPITEM.MM12SUMINSIDE, ENIPITEM.INFOTENDERS, ENIPITEM.MODIFY_TIME, ENIPITEM.USERADD, ENIPITEM.DATEADD, ENIPITEM.USERGEN, ENIPITEM.DATEEDIT, ENIPITEM.MEASUREMENTCODE, ENIPITEM.STATUSREFCODE, ENIPITEM.INVGROUPREFCODE, ENIPITEM.RENREFCODE, ENIPITEM.PURPOSEPROGRAMREFCODE, ENIPITEM.IPREFCODE, ENIPITEM.PARENTREFCODE, ENIPITEM.METHODEXECWORKREFCODE, ENIPITEM.IPIMPLEMENTTYPEREFCODE "
			+" FROM ENIPITEM WHERE ENIPITEM.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.name = set.getString(2);
				anObject.buhName = set.getString(3);
				anObject.itemNumber = set.getString(4);
				anObject.invNumber = set.getString(5);
				anObject.isProjectDocument = set.getInt(6);
				if (set.wasNull()) {
					anObject.isProjectDocument = Integer.MIN_VALUE;
				}
				anObject.financing = set.getString(7);
				anObject.commentGen = set.getString(8);
				anObject.countGen = set.getBigDecimal(9);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.price = set.getBigDecimal(10);
				if(anObject.price != null) {
					anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGen = set.getBigDecimal(11);
				if(anObject.sumGen != null) {
					anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter1count = set.getBigDecimal(12);
				if(anObject.quarter1count != null) {
					anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter1sum = set.getBigDecimal(13);
				if(anObject.quarter1sum != null) {
					anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter2count = set.getBigDecimal(14);
				if(anObject.quarter2count != null) {
					anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter2sum = set.getBigDecimal(15);
				if(anObject.quarter2sum != null) {
					anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter3count = set.getBigDecimal(16);
				if(anObject.quarter3count != null) {
					anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter3sum = set.getBigDecimal(17);
				if(anObject.quarter3sum != null) {
					anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter4count = set.getBigDecimal(18);
				if(anObject.quarter4count != null) {
					anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quarter4sum = set.getBigDecimal(19);
				if(anObject.quarter4sum != null) {
					anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countGenInside = set.getBigDecimal(20);
				if(anObject.countGenInside != null) {
					anObject.countGenInside = anObject.countGenInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceInside = set.getBigDecimal(21);
				if(anObject.priceInside != null) {
					anObject.priceInside = anObject.priceInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGenInside = set.getBigDecimal(22);
				if(anObject.sumGenInside != null) {
					anObject.sumGenInside = anObject.sumGenInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm1countInside = set.getBigDecimal(23);
				if(anObject.mm1countInside != null) {
					anObject.mm1countInside = anObject.mm1countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm1sumInside = set.getBigDecimal(24);
				if(anObject.mm1sumInside != null) {
					anObject.mm1sumInside = anObject.mm1sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm2countInside = set.getBigDecimal(25);
				if(anObject.mm2countInside != null) {
					anObject.mm2countInside = anObject.mm2countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm2sumInside = set.getBigDecimal(26);
				if(anObject.mm2sumInside != null) {
					anObject.mm2sumInside = anObject.mm2sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm3countInside = set.getBigDecimal(27);
				if(anObject.mm3countInside != null) {
					anObject.mm3countInside = anObject.mm3countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm3sumInside = set.getBigDecimal(28);
				if(anObject.mm3sumInside != null) {
					anObject.mm3sumInside = anObject.mm3sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm4countInside = set.getBigDecimal(29);
				if(anObject.mm4countInside != null) {
					anObject.mm4countInside = anObject.mm4countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm4sumInside = set.getBigDecimal(30);
				if(anObject.mm4sumInside != null) {
					anObject.mm4sumInside = anObject.mm4sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm5countInside = set.getBigDecimal(31);
				if(anObject.mm5countInside != null) {
					anObject.mm5countInside = anObject.mm5countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm5sumInside = set.getBigDecimal(32);
				if(anObject.mm5sumInside != null) {
					anObject.mm5sumInside = anObject.mm5sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm6countInside = set.getBigDecimal(33);
				if(anObject.mm6countInside != null) {
					anObject.mm6countInside = anObject.mm6countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm6sumInside = set.getBigDecimal(34);
				if(anObject.mm6sumInside != null) {
					anObject.mm6sumInside = anObject.mm6sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm7countInside = set.getBigDecimal(35);
				if(anObject.mm7countInside != null) {
					anObject.mm7countInside = anObject.mm7countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm7sumInside = set.getBigDecimal(36);
				if(anObject.mm7sumInside != null) {
					anObject.mm7sumInside = anObject.mm7sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm8countInside = set.getBigDecimal(37);
				if(anObject.mm8countInside != null) {
					anObject.mm8countInside = anObject.mm8countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm8sumInside = set.getBigDecimal(38);
				if(anObject.mm8sumInside != null) {
					anObject.mm8sumInside = anObject.mm8sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm9countInside = set.getBigDecimal(39);
				if(anObject.mm9countInside != null) {
					anObject.mm9countInside = anObject.mm9countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm9sumInside = set.getBigDecimal(40);
				if(anObject.mm9sumInside != null) {
					anObject.mm9sumInside = anObject.mm9sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm10countInside = set.getBigDecimal(41);
				if(anObject.mm10countInside != null) {
					anObject.mm10countInside = anObject.mm10countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm10sumInside = set.getBigDecimal(42);
				if(anObject.mm10sumInside != null) {
					anObject.mm10sumInside = anObject.mm10sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm11countInside = set.getBigDecimal(43);
				if(anObject.mm11countInside != null) {
					anObject.mm11countInside = anObject.mm11countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm11sumInside = set.getBigDecimal(44);
				if(anObject.mm11sumInside != null) {
					anObject.mm11sumInside = anObject.mm11sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm12countInside = set.getBigDecimal(45);
				if(anObject.mm12countInside != null) {
					anObject.mm12countInside = anObject.mm12countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.mm12sumInside = set.getBigDecimal(46);
				if(anObject.mm12sumInside != null) {
					anObject.mm12sumInside = anObject.mm12sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.infoTenders = set.getString(47);
				anObject.modify_time = set.getLong(48);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.userAdd = set.getString(49);
				anObject.dateAdd = set.getTimestamp(50);
				anObject.userGen = set.getString(51);
				anObject.dateEdit = set.getTimestamp(52);
				anObject.measurement.code = set.getInt(53);
				if (set.wasNull()) {
					anObject.measurement.code = Integer.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(54);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				anObject.invGroupRef.code = set.getInt(55);
				if (set.wasNull()) {
					anObject.invGroupRef.code = Integer.MIN_VALUE;
				}
				anObject.renRef.code = set.getInt(56);
				if (set.wasNull()) {
					anObject.renRef.code = Integer.MIN_VALUE;
				}
				anObject.purposeProgramRef.code = set.getInt(57);
				if (set.wasNull()) {
					anObject.purposeProgramRef.code = Integer.MIN_VALUE;
				}
				anObject.ipRef.code = set.getInt(58);
				if (set.wasNull()) {
					anObject.ipRef.code = Integer.MIN_VALUE;
				}
				anObject.parentRef.code = set.getInt(59);
				if (set.wasNull()) {
					anObject.parentRef.code = Integer.MIN_VALUE;
				}
				anObject.methodExecWorkRef.code = set.getInt(60);
				if (set.wasNull()) {
					anObject.methodExecWorkRef.code = Integer.MIN_VALUE;
				}
				anObject.ipImplementTypeRef.code = set.getInt(61);
				if (set.wasNull()) {
					anObject.ipImplementTypeRef.code = Integer.MIN_VALUE;
				}
				if(anObject.measurement.code != Integer.MIN_VALUE) {
					anObject.setMeasurement(
						new com.ksoe.techcard.dataminer.generated.TKMeasurementDAOGen(connection,getUserProfile()).getObject(anObject.measurement.code));
				}
				if(anObject.statusRef.code != Integer.MIN_VALUE) {
					anObject.setStatusRef(
						new com.ksoe.energynet.dataminer.generated.ENIPItemStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
				}
				if(anObject.invGroupRef.code != Integer.MIN_VALUE) {
					anObject.setInvGroupRef(
						new com.ksoe.energynet.dataminer.generated.ENInvestProgramGroupsDAOGen(connection,getUserProfile()).getRef(anObject.invGroupRef.code));
				}
				if(anObject.renRef.code != Integer.MIN_VALUE) {
					anObject.setRenRef(
						new com.ksoe.energypro.dataminer.generated.EPRenDAOGen(connection,getUserProfile()).getRef(anObject.renRef.code));
				}
				if(anObject.purposeProgramRef.code != Integer.MIN_VALUE) {
					anObject.setPurposeProgramRef(
						new com.ksoe.energynet.dataminer.generated.ENIPPurposeProgramDAOGen(connection,getUserProfile()).getRef(anObject.purposeProgramRef.code));
				}
				if(anObject.ipRef.code != Integer.MIN_VALUE) {
					anObject.setIpRef(
						new com.ksoe.energynet.dataminer.generated.ENIPDAOGen(connection,getUserProfile()).getRef(anObject.ipRef.code));
				}
				if(anObject.parentRef.code != Integer.MIN_VALUE) {
					anObject.setParentRef(
						new com.ksoe.energynet.dataminer.generated.ENIPItemDAOGen(connection,getUserProfile()).getRef(anObject.parentRef.code));
				}
				if(anObject.methodExecWorkRef.code != Integer.MIN_VALUE) {
					anObject.setMethodExecWorkRef(
						new com.ksoe.energynet.dataminer.generated.ENMethodExecuteWorkDAOGen(connection,getUserProfile()).getRef(anObject.methodExecWorkRef.code));
				}
				if(anObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
					anObject.setIpImplementTypeRef(
						new com.ksoe.energynet.dataminer.generated.ENIPImplementationTypeDAOGen(connection,getUserProfile()).getRef(anObject.ipImplementTypeRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENIPItemRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENIPItemRef ref = new com.ksoe.energynet.valueobject.references.ENIPItemRef();
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

		selectStr = "DELETE FROM  ENIPITEM WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENIPItem object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENIPItem.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENIPItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENIPItem.remove%} access denied");
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
	
	public long count(ENIPItemFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENIPItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENIPItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENIPITEM", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENIPItemFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENIPITEM");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENIPItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENIPItem.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENIPITEM.CODE FROM  ENIPITEM WHERE  ENIPITEM.CODE = ?";
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
		_checkConditionToken(condition,"code","ENIPITEM.CODE");
		_checkConditionToken(condition,"name","ENIPITEM.NAME");
		_checkConditionToken(condition,"buhname","ENIPITEM.BUHNAME");
		_checkConditionToken(condition,"itemnumber","ENIPITEM.ITEMNUMBER");
		_checkConditionToken(condition,"invnumber","ENIPITEM.INVNUMBER");
		_checkConditionToken(condition,"isprojectdocument","ENIPITEM.ISPROJECTDOCUMENT");
		_checkConditionToken(condition,"financing","ENIPITEM.FINANCING");
		_checkConditionToken(condition,"commentgen","ENIPITEM.COMMENTGEN");
		_checkConditionToken(condition,"countgen","ENIPITEM.COUNTGEN");
		_checkConditionToken(condition,"price","ENIPITEM.PRICE");
		_checkConditionToken(condition,"sumgen","ENIPITEM.SUMGEN");
		_checkConditionToken(condition,"quarter1count","ENIPITEM.QUARTER1COUNT");
		_checkConditionToken(condition,"quarter1sum","ENIPITEM.QUARTER1SUM");
		_checkConditionToken(condition,"quarter2count","ENIPITEM.QUARTER2COUNT");
		_checkConditionToken(condition,"quarter2sum","ENIPITEM.QUARTER2SUM");
		_checkConditionToken(condition,"quarter3count","ENIPITEM.QUARTER3COUNT");
		_checkConditionToken(condition,"quarter3sum","ENIPITEM.QUARTER3SUM");
		_checkConditionToken(condition,"quarter4count","ENIPITEM.QUARTER4COUNT");
		_checkConditionToken(condition,"quarter4sum","ENIPITEM.QUARTER4SUM");
		_checkConditionToken(condition,"countgeninside","ENIPITEM.COUNTGENINSIDE");
		_checkConditionToken(condition,"priceinside","ENIPITEM.PRICEINSIDE");
		_checkConditionToken(condition,"sumgeninside","ENIPITEM.SUMGENINSIDE");
		_checkConditionToken(condition,"mm1countinside","ENIPITEM.MM1COUNTINSIDE");
		_checkConditionToken(condition,"mm1suminside","ENIPITEM.MM1SUMINSIDE");
		_checkConditionToken(condition,"mm2countinside","ENIPITEM.MM2COUNTINSIDE");
		_checkConditionToken(condition,"mm2suminside","ENIPITEM.MM2SUMINSIDE");
		_checkConditionToken(condition,"mm3countinside","ENIPITEM.MM3COUNTINSIDE");
		_checkConditionToken(condition,"mm3suminside","ENIPITEM.MM3SUMINSIDE");
		_checkConditionToken(condition,"mm4countinside","ENIPITEM.MM4COUNTINSIDE");
		_checkConditionToken(condition,"mm4suminside","ENIPITEM.MM4SUMINSIDE");
		_checkConditionToken(condition,"mm5countinside","ENIPITEM.MM5COUNTINSIDE");
		_checkConditionToken(condition,"mm5suminside","ENIPITEM.MM5SUMINSIDE");
		_checkConditionToken(condition,"mm6countinside","ENIPITEM.MM6COUNTINSIDE");
		_checkConditionToken(condition,"mm6suminside","ENIPITEM.MM6SUMINSIDE");
		_checkConditionToken(condition,"mm7countinside","ENIPITEM.MM7COUNTINSIDE");
		_checkConditionToken(condition,"mm7suminside","ENIPITEM.MM7SUMINSIDE");
		_checkConditionToken(condition,"mm8countinside","ENIPITEM.MM8COUNTINSIDE");
		_checkConditionToken(condition,"mm8suminside","ENIPITEM.MM8SUMINSIDE");
		_checkConditionToken(condition,"mm9countinside","ENIPITEM.MM9COUNTINSIDE");
		_checkConditionToken(condition,"mm9suminside","ENIPITEM.MM9SUMINSIDE");
		_checkConditionToken(condition,"mm10countinside","ENIPITEM.MM10COUNTINSIDE");
		_checkConditionToken(condition,"mm10suminside","ENIPITEM.MM10SUMINSIDE");
		_checkConditionToken(condition,"mm11countinside","ENIPITEM.MM11COUNTINSIDE");
		_checkConditionToken(condition,"mm11suminside","ENIPITEM.MM11SUMINSIDE");
		_checkConditionToken(condition,"mm12countinside","ENIPITEM.MM12COUNTINSIDE");
		_checkConditionToken(condition,"mm12suminside","ENIPITEM.MM12SUMINSIDE");
		_checkConditionToken(condition,"infotenders","ENIPITEM.INFOTENDERS");
		_checkConditionToken(condition,"modify_time","ENIPITEM.MODIFY_TIME");
		_checkConditionToken(condition,"useradd","ENIPITEM.USERADD");
		_checkConditionToken(condition,"dateadd","ENIPITEM.DATEADD");
		_checkConditionToken(condition,"usergen","ENIPITEM.USERGEN");
		_checkConditionToken(condition,"dateedit","ENIPITEM.DATEEDIT");
		// relationship conditions
		_checkConditionToken(condition,"measurement","MEASUREMENTCODE");
		_checkConditionToken(condition,"measurement.code","MEASUREMENTCODE");
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
		_checkConditionToken(condition,"invgroupref","INVGROUPREFCODE");
		_checkConditionToken(condition,"invgroupref.code","INVGROUPREFCODE");
		_checkConditionToken(condition,"renref","RENREFCODE");
		_checkConditionToken(condition,"renref.code","RENREFCODE");
		_checkConditionToken(condition,"purposeprogramref","PURPOSEPROGRAMREFCODE");
		_checkConditionToken(condition,"purposeprogramref.code","PURPOSEPROGRAMREFCODE");
		_checkConditionToken(condition,"ipref","IPREFCODE");
		_checkConditionToken(condition,"ipref.code","IPREFCODE");
		_checkConditionToken(condition,"parentref","PARENTREFCODE");
		_checkConditionToken(condition,"parentref.code","PARENTREFCODE");
		_checkConditionToken(condition,"methodexecworkref","METHODEXECWORKREFCODE");
		_checkConditionToken(condition,"methodexecworkref.code","METHODEXECWORKREFCODE");
		_checkConditionToken(condition,"ipimplementtyperef","IPIMPLEMENTTYPEREFCODE");
		_checkConditionToken(condition,"ipimplementtyperef.code","IPIMPLEMENTTYPEREFCODE");
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
	
	private void _collectAutoIncrementFields(ENIPItem anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENIPITEM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENIPITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENIPITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENIPITEM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENIPItemDAO
