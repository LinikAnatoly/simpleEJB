
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENIPItem2ContractDAOGen;
import com.ksoe.energynet.valueobject.ENIPItem2Contract;
import com.ksoe.energynet.valueobject.brief.ENIPItem2ContractShort;
import com.ksoe.energynet.valueobject.lists.ENIPItem2ContractShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENIPItem2Contract;
 *
 */

public class ENIPItem2ContractDAO extends ENIPItem2ContractDAOGen {

    public ENIPItem2ContractDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENIPItem2ContractDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public ENIPItem2ContractShortList findContractList(int ENIPItemCode ) throws PersistenceException
    {
     ENIPItem2ContractShortList result = new ENIPItem2ContractShortList();
     ENIPItem2ContractShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";



     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = " select  \n" +
    		 "   distinct ec.contractnumber as contractnumber \n" +
    		 "  , ec.contractdate as contractdate \n" +
    		 "  , ec.findoccode as findoccode \n" +
    		 "  , ec.findocid as findocid \n" +
    		 "  , o.id as orgid \n" +
    		 "  , o.name as orgname \n" +
    		 "  , o.ukr_name as orgukrname \n" +
    		 "  , o.codeorg as orgcode  \n" +
    		 "  , e2p.ipitemrefcode    \n" +
    		 " from enestimateitem2contrct ec, enestimateitem ei, tkmaterials m , rqorg o , enipitem2plan e2p \n" +
    		 " where ec.estimateitemcode = ei.code \n" +
    		 "   and ei.materialrefcode = m.code \n" +
    		 "   and ec.orgcode = o.code \n" +
    		 "   and ei.planrefcode = e2p.planrefcode \n" +
    		 "   and e2p.ipitemrefcode = " + ENIPItemCode + " \n" +
    		 "   and case when  \n" +
    		 "          (select  count(i2m.code) from  enipitem2tkmaterials i2m where i2m.ipitemrefcode = e2p.ipitemrefcode ) > 0  \n" +
    		 "          then  \n" +
    		 "         m.code in (select  i2m.code from  enipitem2tkmaterials i2m where i2m.ipitemrefcode = e2p.ipitemrefcode )   \n" +
    		 "          else  \n" +
    		 "         1=1 \n" +
    		 "           end  \n";




     try
      {
       statement = connection.prepareStatement(selectStr);

       set = statement.executeQuery();
       int i;
       for (i = 0; set.next(); i++) {


         anObject = new ENIPItem2ContractShort();


         anObject.contractNumber = set.getString(1);
         anObject.contractDate = set.getDate(2);
         anObject.finDocCode = set.getString(3);
         anObject.finDocID = set.getInt(4);
         if ( set.wasNull() )
             anObject.finDocID = Integer.MIN_VALUE;
         anObject.orgId = set.getInt(5);
         if ( set.wasNull() )
             anObject.orgId = Integer.MIN_VALUE;
         anObject.orgName = set.getString(6);
         anObject.orgUkrName = set.getString(7);
         anObject.orgCode = set.getString(8);



          result.list.add(anObject);
        }

       result.setTotalCount(i);
       return result;
      }
     catch(SQLException e)
      {
       System.out.println(e.getMessage()+"\nstatement - "+selectStr);
       throw new SystemException(e.getMessage(), e);
       //return null;
      }
     finally
      {
       try {if (set != null) set.close();}             catch (SQLException e) {}
       try {if (statement != null) statement.close();} catch (SQLException e) {}
       if(connection != super.getConnection())
        {
         try{connection.close();} catch(SQLException e){}
        }
      }
    }



	@Override
	public ENIPItem2ContractShortList getScrollableFilteredList(ENIPItem2Contract aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENIPItem2ContractShortList result = new ENIPItem2ContractShortList();
		ENIPItem2ContractShort anObject;
		result.list = new Vector<ENIPItem2ContractShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENIPITEM2CONTRACT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENIPITEM2CONTRACT.CODE"+
			",ENIPITEM2CONTRACT.CONTRACTNUMBER"+
			",ENIPITEM2CONTRACT.CONTRACTDATE"+
			",ENIPITEM2CONTRACT.FINDOCCODE"+
			",ENIPITEM2CONTRACT.FINDOCID"+
			",ENIPITEM2CONTRACT.ORGID"+
			",ENIPITEM2CONTRACT.ORGNAME"+
			",ENIPITEM2CONTRACT.ORGUKRNAME"+
			",ENIPITEM2CONTRACT.ORGCODE"+
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
			", ENGENERALCONTRACTS.CODE " +
			", ENGENERALCONTRACTS.FINDOCID " +
			", ENGENERALCONTRACTS.FINDOCCODE " +
			", ENGENERALCONTRACTS.CONTRACTNUMBER " +
			", ENGENERALCONTRACTS.CONTRACTDATE " +
			", ENGENERALCONTRACTS.COMMENTGEN " +
			", ENGENERALCONTRACTS.PARTNERID " +
			", ENGENERALCONTRACTS.PARTNERCODE " +
			", ENGENERALCONTRACTS.PARTNERNAME " +
			", ENGENERALCONTRACTS.CONTRACTREGDATE " +
			", ENGENERALCONTRACTS.CONTRACTSTARTDATE " +
			", ENGENERALCONTRACTS.CONTRACTENDDATE " +
			", ENGENERALCONTRACTS.AXCONTRACTID " +
			", ENGENERALCONTRACTS.AXCONTRACTCODE " +
			", ENGENERALCONTRACTS.AXCONTRACTNUMBER " +
			", ENGENERALCONTRACTS.AXCONTRACTACCOUNT " +
			", ENGENERALCONTRACTS.AXCONTRACTDATE " +
			", ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN " +
			", ENGENERALCONTRACTS.AXCONTRACTGROUPCODE " +
			", ENGENERALCONTRACTS.AXPARTNERCODE " +
			", ENGENERALCONTRACTS.AXPARTNERNAME " +
			", ENGENERALCONTRACTS.USERGEN " +

		" FROM ENIPITEM2CONTRACT left join ENGENERALCONTRACTS on ENGENERALCONTRACTS.CODE = ENIPITEM2CONTRACT.GENERALCONTRACTREFCODE " +
			", ENIPITEM " +
			//", ENGENERALCONTRACTS " +
		"";
		whereStr = " ENIPITEM.CODE = ENIPITEM2CONTRACT.IPITEMREFCODE" ; //+
		//whereStr += " AND ENGENERALCONTRACTS.CODE = ENIPITEM2CONTRACT.GENERALCONTRACTREFCODE" ; //+


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);
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
				anObject = new ENIPItem2ContractShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.contractNumber = set.getString(2);
				anObject.contractDate = set.getDate(3);
				anObject.finDocCode = set.getString(4);
				anObject.finDocID = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.orgId = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.orgId = Integer.MIN_VALUE;
				}
				anObject.orgName = set.getString(7);
				anObject.orgUkrName = set.getString(8);
				anObject.orgCode = set.getString(9);

				anObject.ipItemRefCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.ipItemRefCode = Integer.MIN_VALUE;
				}
				anObject.ipItemRefName = set.getString(11);
				anObject.ipItemRefBuhName = set.getString(12);
				anObject.ipItemRefItemNumber = set.getString(13);
				anObject.ipItemRefInvNumber = set.getString(14);
				anObject.ipItemRefIsProjectDocument = set.getInt(15);
				if(set.wasNull()) {
					anObject.ipItemRefIsProjectDocument = Integer.MIN_VALUE;
				}
				anObject.ipItemRefFinancing = set.getString(16);
				anObject.ipItemRefCommentGen = set.getString(17);
				anObject.ipItemRefCountGen = set.getBigDecimal(18);
				if(anObject.ipItemRefCountGen != null) {
					anObject.ipItemRefCountGen = anObject.ipItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefPrice = set.getBigDecimal(19);
				if(anObject.ipItemRefPrice != null) {
					anObject.ipItemRefPrice = anObject.ipItemRefPrice.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefSumGen = set.getBigDecimal(20);
				if(anObject.ipItemRefSumGen != null) {
					anObject.ipItemRefSumGen = anObject.ipItemRefSumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter1count = set.getBigDecimal(21);
				if(anObject.ipItemRefQuarter1count != null) {
					anObject.ipItemRefQuarter1count = anObject.ipItemRefQuarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter1sum = set.getBigDecimal(22);
				if(anObject.ipItemRefQuarter1sum != null) {
					anObject.ipItemRefQuarter1sum = anObject.ipItemRefQuarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter2count = set.getBigDecimal(23);
				if(anObject.ipItemRefQuarter2count != null) {
					anObject.ipItemRefQuarter2count = anObject.ipItemRefQuarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter2sum = set.getBigDecimal(24);
				if(anObject.ipItemRefQuarter2sum != null) {
					anObject.ipItemRefQuarter2sum = anObject.ipItemRefQuarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter3count = set.getBigDecimal(25);
				if(anObject.ipItemRefQuarter3count != null) {
					anObject.ipItemRefQuarter3count = anObject.ipItemRefQuarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter3sum = set.getBigDecimal(26);
				if(anObject.ipItemRefQuarter3sum != null) {
					anObject.ipItemRefQuarter3sum = anObject.ipItemRefQuarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter4count = set.getBigDecimal(27);
				if(anObject.ipItemRefQuarter4count != null) {
					anObject.ipItemRefQuarter4count = anObject.ipItemRefQuarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter4sum = set.getBigDecimal(28);
				if(anObject.ipItemRefQuarter4sum != null) {
					anObject.ipItemRefQuarter4sum = anObject.ipItemRefQuarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefCountGenInside = set.getBigDecimal(29);
				if(anObject.ipItemRefCountGenInside != null) {
					anObject.ipItemRefCountGenInside = anObject.ipItemRefCountGenInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefPriceInside = set.getBigDecimal(30);
				if(anObject.ipItemRefPriceInside != null) {
					anObject.ipItemRefPriceInside = anObject.ipItemRefPriceInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefSumGenInside = set.getBigDecimal(31);
				if(anObject.ipItemRefSumGenInside != null) {
					anObject.ipItemRefSumGenInside = anObject.ipItemRefSumGenInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm1countInside = set.getBigDecimal(32);
				if(anObject.ipItemRefMm1countInside != null) {
					anObject.ipItemRefMm1countInside = anObject.ipItemRefMm1countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm1sumInside = set.getBigDecimal(33);
				if(anObject.ipItemRefMm1sumInside != null) {
					anObject.ipItemRefMm1sumInside = anObject.ipItemRefMm1sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm2countInside = set.getBigDecimal(34);
				if(anObject.ipItemRefMm2countInside != null) {
					anObject.ipItemRefMm2countInside = anObject.ipItemRefMm2countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm2sumInside = set.getBigDecimal(35);
				if(anObject.ipItemRefMm2sumInside != null) {
					anObject.ipItemRefMm2sumInside = anObject.ipItemRefMm2sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm3countInside = set.getBigDecimal(36);
				if(anObject.ipItemRefMm3countInside != null) {
					anObject.ipItemRefMm3countInside = anObject.ipItemRefMm3countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm3sumInside = set.getBigDecimal(37);
				if(anObject.ipItemRefMm3sumInside != null) {
					anObject.ipItemRefMm3sumInside = anObject.ipItemRefMm3sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm4countInside = set.getBigDecimal(38);
				if(anObject.ipItemRefMm4countInside != null) {
					anObject.ipItemRefMm4countInside = anObject.ipItemRefMm4countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm4sumInside = set.getBigDecimal(39);
				if(anObject.ipItemRefMm4sumInside != null) {
					anObject.ipItemRefMm4sumInside = anObject.ipItemRefMm4sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm5countInside = set.getBigDecimal(40);
				if(anObject.ipItemRefMm5countInside != null) {
					anObject.ipItemRefMm5countInside = anObject.ipItemRefMm5countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm5sumInside = set.getBigDecimal(41);
				if(anObject.ipItemRefMm5sumInside != null) {
					anObject.ipItemRefMm5sumInside = anObject.ipItemRefMm5sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm6countInside = set.getBigDecimal(42);
				if(anObject.ipItemRefMm6countInside != null) {
					anObject.ipItemRefMm6countInside = anObject.ipItemRefMm6countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm6sumInside = set.getBigDecimal(43);
				if(anObject.ipItemRefMm6sumInside != null) {
					anObject.ipItemRefMm6sumInside = anObject.ipItemRefMm6sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm7countInside = set.getBigDecimal(44);
				if(anObject.ipItemRefMm7countInside != null) {
					anObject.ipItemRefMm7countInside = anObject.ipItemRefMm7countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm7sumInside = set.getBigDecimal(45);
				if(anObject.ipItemRefMm7sumInside != null) {
					anObject.ipItemRefMm7sumInside = anObject.ipItemRefMm7sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm8countInside = set.getBigDecimal(46);
				if(anObject.ipItemRefMm8countInside != null) {
					anObject.ipItemRefMm8countInside = anObject.ipItemRefMm8countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm8sumInside = set.getBigDecimal(47);
				if(anObject.ipItemRefMm8sumInside != null) {
					anObject.ipItemRefMm8sumInside = anObject.ipItemRefMm8sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm9countInside = set.getBigDecimal(48);
				if(anObject.ipItemRefMm9countInside != null) {
					anObject.ipItemRefMm9countInside = anObject.ipItemRefMm9countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm9sumInside = set.getBigDecimal(49);
				if(anObject.ipItemRefMm9sumInside != null) {
					anObject.ipItemRefMm9sumInside = anObject.ipItemRefMm9sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm10countInside = set.getBigDecimal(50);
				if(anObject.ipItemRefMm10countInside != null) {
					anObject.ipItemRefMm10countInside = anObject.ipItemRefMm10countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm10sumInside = set.getBigDecimal(51);
				if(anObject.ipItemRefMm10sumInside != null) {
					anObject.ipItemRefMm10sumInside = anObject.ipItemRefMm10sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm11countInside = set.getBigDecimal(52);
				if(anObject.ipItemRefMm11countInside != null) {
					anObject.ipItemRefMm11countInside = anObject.ipItemRefMm11countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm11sumInside = set.getBigDecimal(53);
				if(anObject.ipItemRefMm11sumInside != null) {
					anObject.ipItemRefMm11sumInside = anObject.ipItemRefMm11sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm12countInside = set.getBigDecimal(54);
				if(anObject.ipItemRefMm12countInside != null) {
					anObject.ipItemRefMm12countInside = anObject.ipItemRefMm12countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm12sumInside = set.getBigDecimal(55);
				if(anObject.ipItemRefMm12sumInside != null) {
					anObject.ipItemRefMm12sumInside = anObject.ipItemRefMm12sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefInfoTenders = set.getString(56);
				anObject.ipItemRefUserAdd = set.getString(57);
				anObject.ipItemRefDateAdd = set.getTimestamp(58);
				anObject.ipItemRefUserGen = set.getString(59);
				anObject.ipItemRefDateEdit = set.getTimestamp(60);
				anObject.generalContractRefCode = set.getInt(61);
				if(set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocID = set.getInt(62);
				if(set.wasNull()) {
					anObject.generalContractRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocCode = set.getString(63);
				anObject.generalContractRefContractNumber = set.getString(64);
				anObject.generalContractRefContractDate = set.getDate(65);
				anObject.generalContractRefCommentGen = set.getString(66);
				anObject.generalContractRefPartnerId = set.getInt(67);
				if(set.wasNull()) {
					anObject.generalContractRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.generalContractRefPartnerCode = set.getString(68);
				anObject.generalContractRefPartnerName = set.getString(69);
				anObject.generalContractRefContractRegDate = set.getDate(70);
				anObject.generalContractRefContractStartDate = set.getDate(71);
				anObject.generalContractRefContractEndDate = set.getDate(72);
				anObject.generalContractRefAxContractId = set.getString(73);
				anObject.generalContractRefAxContractCode = set.getString(74);
				anObject.generalContractRefAxContractNumber = set.getString(75);
				anObject.generalContractRefAxContractAccount = set.getString(76);
				anObject.generalContractRefAxContractDate = set.getDate(77);
				anObject.generalContractRefAxContractCommentGen = set.getString(78);
				anObject.generalContractRefAxContractGroupCode = set.getString(79);
				anObject.generalContractRefAxPartnerCode = set.getString(80);
				anObject.generalContractRefAxPartnerName = set.getString(81);
				anObject.generalContractRefUserGen = set.getString(82);

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



} // end of ENIPItem2ContractDAO
