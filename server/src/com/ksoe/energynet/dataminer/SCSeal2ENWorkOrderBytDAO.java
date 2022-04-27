
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.SCSeal2ENWorkOrderBytDAOGen;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.SCSeal2ENWorkOrderByt;
import com.ksoe.energynet.valueobject.brief.SCSeal2ENWorkOrderBytShort;
import com.ksoe.energynet.valueobject.lists.SCSeal2ENWorkOrderBytShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.valueobject.TKAccountingType;

/**
 * DAO Object for SCSeal2ENWorkOrderByt;
 *
 */

public class SCSeal2ENWorkOrderBytDAO extends SCSeal2ENWorkOrderBytDAOGen {

    public SCSeal2ENWorkOrderBytDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public SCSeal2ENWorkOrderBytDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public int add(SCSeal2ENWorkOrderByt anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    public void save(SCSeal2ENWorkOrderByt anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }    
    
    public SCSeal2ENWorkOrderBytShortList getScrollableFilteredList(SCSeal2ENWorkOrderByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     SCSeal2ENWorkOrderBytShortList result = new SCSeal2ENWorkOrderBytShortList();
     SCSeal2ENWorkOrderBytShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "SCSEAL2ENWORKORDERBYT.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "SCSEAL2ENWORKORDERBYT.CODE"+
      ",SCSEAL2ENWORKORDERBYT.USERADD"+
      ",SCSEAL2ENWORKORDERBYT.DATEADD"+
      ",SCSEAL2ENWORKORDERBYT.USERGEN"+
      ",SCSEAL2ENWORKORDERBYT.DATEEDIT"+

       ", SCSEAL.CODE " +
       ", SCSEAL.INVNUMBER " +
       ", SCSEAL.NAME " +
       ", SCSEAL.BUILDNUMBER " +
       ", SCSEAL.ACCOUNT " +
       ", SCSEAL.DEPARTMETFKCODE " +
       ", SCSEAL.MOLCODE " +
       ", SCSEAL.MOLNAME " +
       ", SCSEAL.DATEIN " +
       ", SCSEAL.DATEBUILD " +
       ", SCSEAL.COST " +
       ", SCSEAL.SCCODE " +
       ", SCSEAL.INSTALLORDERNUMBER " +
       ", SCSEAL.COSTOLD " +
       ", SCSEAL.USERADD " +
       ", SCSEAL.DATEADD " +
       ", SCSEAL.USERGEN " +
       ", SCSEAL.DATEEDIT " +
       ", ENWORKORDERBYT.CODE " +
       ", ENWORKORDERBYT.NUMBERGEN " +
       ", ENWORKORDERBYT.DATEGEN " +
       ", ENWORKORDERBYT.COMMENTGEN " +
       ", ENWORKORDERBYT.DATEADD " +
       ", ENWORKORDERBYT.DATEEDIT " +
       ", ENWORKORDERBYT.USERADD " +
       ", ENWORKORDERBYT.USEREDIT " +
       ", ENWORKORDERBYTITEM.CODE " +
       ", ENWORKORDERBYTITEM.CONTRACTNUMBERSERVICES " +
       ", ENWORKORDERBYTITEM.ACCOUNTNUMBER " +
       ", ENWORKORDERBYTITEM.NAME " +
       ", ENWORKORDERBYTITEM.CUSTOMERNAME " +
       ", ENWORKORDERBYTITEM.ADDRESS " +
       ", ENWORKORDERBYTITEM.INVNUMBER " +
       ", ENWORKORDERBYTITEM.SERIALNUMBER " +
       ", ENWORKORDERBYTITEM.SEAL " +
       ", ENWORKORDERBYTITEM.PHONE " +
       ", ENWORKORDERBYTITEM.STATUSCODE " +
       ", ENWORKORDERBYTITEM.RPCODE " +
       ", ENWORKORDERBYTITEM.DATECOUNTERINST " +
       ", ENWORKORDERBYTITEM.DATECOUNTERCHECK " +
       ", ENWORKORDERBYTITEM.COUNTERTYPE " +
       ", ENWORKORDERBYTITEM.CLASSACCURACY " +
       ", ENWORKORDERBYTITEM.CHECKPERIOD " +
       ", ENWORKORDERBYTITEM.RPSTATUSCODE " +
       ", ENWORKORDERBYTITEM.PHASITY " +
       ", ENWORKORDERBYTITEM.DATECHECK " +
       ", ENWORKORDERBYTITEM.CHECKPERIOD1 " +
       ", ENWORKORDERBYTITEM.PLACECOUNTER " +
       ", ENWORKORDERBYTITEM.RPISWORKING " +
       ", ENWORKORDERBYTITEM.RECORDPOINTNAME " +
       ", ENWORKORDERBYTITEM.ROUTEBYTNAME " +
       ", ENWORKORDERBYTITEM.ROUTEBYTNUMBERGEN " +
       ", ENWORKORDERBYTITEM.COMMENTGEN " +
       ", ENWORKORDERBYTITEM.DATEADD " +
       ", ENWORKORDERBYTITEM.DATEEDIT " +
       ", ENWORKORDERBYTITEM.USERADD " +
       ", ENWORKORDERBYTITEM.USEREDIT " +
       ", ENWORKORDERBYTITEM.FACTCODE " +
       
       ", ei.code as eicode " +
       ", ei.countfact " +
       ", m.name as materialname " +
       
       ", SCSEAL2WORKORDERBYTKND.CODE " +
       ", SCSEAL2WORKORDERBYTKND.NAME " +       

       ", SCSEALTYPE.CODE " +
       ", SCSEALTYPE.NAME " +       
       
	   " FROM " +
	   "  SCSEAL2ENWORKORDERBYT left join ENWORKORDERBYTITEM " + 
	   "    ON ENWORKORDERBYTITEM.CODE = SCSEAL2ENWORKORDERBYT.WORKORDERBYTITEMREFCOD " +
	   ", SCSEAL " + 
	   "    left join enestimateitem ei on scseal.estimateitemrefcode = ei.code " +
	   "    left join tkmaterials m on ei.materialrefcode = m.code " +
	   ", ENWORKORDERBYT " + 
	   ", SCSEAL2WORKORDERBYTKND " +
	   ", SCSEALTYPE " +
      //" WHERE "
   "";
      whereStr = " SCSEAL.CODE = SCSEAL2ENWORKORDERBYT.SEALREFCODE" ; //+
       whereStr = whereStr +" AND ENWORKORDERBYT.CODE = SCSEAL2ENWORKORDERBYT.WORKORDERBYTREFCODE" ; //+
       whereStr = whereStr +" AND SCSEAL2WORKORDERBYTKND.CODE = SCSEAL2ENWORKORDERBYT.KINDREFCODE";
       whereStr = whereStr +" AND SCSEALTYPE.CODE = SCSEAL.TYPEREFCODE";
       //whereStr = whereStr +" AND ENWORKORDERBYTITEM.CODE = SCSEAL2ENWORKORDERBYT.WORKORDERBYTITEMREFCOD" ; //+
     //selectStr = selectStr + " ${s} SCSEAL2ENWORKORDERBYT.CODE IN ( SELECT SCSEAL2ENWORKORDERBYT.CODE FROM SCSEAL2ENWORKORDERBYT ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.CODE = ?";
         }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL2ENWORKORDERBYT.COMMENTGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL2ENWORKORDERBYT.COMMENTGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.MODIFY_TIME = ?";
         }
          if (aFilterObject.userAdd != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL2ENWORKORDERBYT.USERADD) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL2ENWORKORDERBYT.USERADD) LIKE UPPER(?)";
          }
         if(aFilterObject.dateAdd != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.DATEADD = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL2ENWORKORDERBYT.USERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL2ENWORKORDERBYT.USERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.DATEEDIT = ?";
         }
         if(aFilterObject.sealRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "SCSEAL2ENWORKORDERBYT.SEALREFCODE = ? ";
         }
         if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "SCSEAL2ENWORKORDERBYT.WORKORDERBYTREFCODE = ? ";
         }
         if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "SCSEAL2ENWORKORDERBYT.WORKORDERBYTITEMREFCOD = ? ";
         }
         if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "SCSEAL2ENWORKORDERBYT.KINDREFCODE = ? ";
         }         

       }

     

       if(condition.length() != 0)
       {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";

          whereStr = whereStr + " (" + condition + ")";
       }
 // + " WHERE" +  сделано выше ????
      if(whereStr.length() != 0)
          selectStr = selectStr + " WHERE " + whereStr;

     // selectStr = selectStr + ") ";

     selectStr = selectStr + " ORDER BY " + orderBy;

     selectStr = selectStr + " OFFSET " + fromPosition;
     if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

     try
      {
       statement = connection.prepareStatement(selectStr);
       int number = 0;
       if(aFilterObject != null){
          if(aFilterObject.code != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.code);
          }

            if(aFilterObject.commentGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.commentGen);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.modify_time != Long.MIN_VALUE){
             number++;
             if(aFilterObject.modify_time == Long.MIN_VALUE)
                 statement.setBigDecimal(number,null);
             else
                 statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
         }

            if(aFilterObject.userAdd != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userAdd);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.dateAdd != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
         }

            if(aFilterObject.userGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userGen);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.dateEdit != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
         }
        if(aFilterObject.sealRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.sealRef.code);
        }
        if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.workOrderBytRef.code);
        }
        if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.workOrderBytItemRef.code);
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.kindRef.code);
        }        
       }

       if(condition.length() > 0 && aBindObjects != null)
        _bindObjectsToPreparedStatement(statement,aBindObjects,number);

       set = statement.executeQuery();
       int i;
       for (i = 0; set.next(); i++) {
         /*
         if (i < fromPosition)
           continue;
         else if (i >= fromPosition + quantity) {
           i++;
           break;
         } */

         anObject = new SCSeal2ENWorkOrderBytShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.userAdd = set.getString(2);
         anObject.dateAdd = set.getTimestamp(3);
         anObject.userGen = set.getString(4);
         anObject.dateEdit = set.getTimestamp(5);

         anObject.sealRefCode = set.getInt(6);
     if(set.wasNull())
       anObject.sealRefCode = Integer.MIN_VALUE;
         anObject.sealRefInvNumber = set.getString(7);
         anObject.sealRefName = set.getString(8);
         anObject.sealRefBuildNumber = set.getString(9);
         anObject.sealRefAccount = set.getString(10);
         anObject.sealRefDepartmetFKCode = set.getString(11);
         anObject.sealRefMolCode = set.getString(12);
         anObject.sealRefMolName = set.getString(13);
         anObject.sealRefDateIn = set.getDate(14);
         anObject.sealRefDateBuild = set.getDate(15);
         anObject.sealRefCost = set.getBigDecimal(16);
         if(anObject.sealRefCost != null)
           anObject.sealRefCost = anObject.sealRefCost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.sealRefScCode = set.getInt(17);
     if(set.wasNull())
       anObject.sealRefScCode = Integer.MIN_VALUE;
         anObject.sealRefInstallOrderNumber = set.getString(18);
         anObject.sealRefCostOld = set.getBigDecimal(19);
         if(anObject.sealRefCostOld != null)
           anObject.sealRefCostOld = anObject.sealRefCostOld.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.sealRefUserAdd = set.getString(20);
         anObject.sealRefDateAdd = set.getTimestamp(21);
         anObject.sealRefUserGen = set.getString(22);
         anObject.sealRefDateEdit = set.getTimestamp(23);
         anObject.workOrderBytRefCode = set.getInt(24);
     if(set.wasNull())
       anObject.workOrderBytRefCode = Integer.MIN_VALUE;
         anObject.workOrderBytRefNumberGen = set.getString(25);
         anObject.workOrderBytRefDateGen = set.getDate(26);
         anObject.workOrderBytRefCommentGen = set.getString(27);
         anObject.workOrderBytRefDateAdd = set.getTimestamp(28);
         anObject.workOrderBytRefDateEdit = set.getTimestamp(29);
         anObject.workOrderBytRefUserAdd = set.getString(30);
         anObject.workOrderBytRefUserEdit = set.getString(31);
         anObject.workOrderBytItemRefCode = set.getInt(32);
     if(set.wasNull())
       anObject.workOrderBytItemRefCode = Integer.MIN_VALUE;
         anObject.workOrderBytItemRefContractNumberServices = set.getString(33);
         anObject.workOrderBytItemRefAccountNumber = set.getString(34);
         anObject.workOrderBytItemRefName = set.getString(35);
         anObject.workOrderBytItemRefCustomerName = set.getString(36);
         anObject.workOrderBytItemRefAddress = set.getString(37);
         anObject.workOrderBytItemRefInvNumber = set.getString(38);
         anObject.workOrderBytItemRefSerialNumber = set.getString(39);
         anObject.workOrderBytItemRefSeal = set.getString(40);
         anObject.workOrderBytItemRefPhone = set.getString(41);
         anObject.workOrderBytItemRefStatuscode = set.getInt(42);
     if(set.wasNull())
       anObject.workOrderBytItemRefStatuscode = Integer.MIN_VALUE;
         anObject.workOrderBytItemRefRpCode = set.getInt(43);
     if(set.wasNull())
       anObject.workOrderBytItemRefRpCode = Integer.MIN_VALUE;
         anObject.workOrderBytItemRefDateCounterInst = set.getDate(44);
         anObject.workOrderBytItemRefDateCounterCheck = set.getDate(45);
         anObject.workOrderBytItemRefCounterType = set.getString(46);
         anObject.workOrderBytItemRefClassAccuracy = set.getBigDecimal(47);
         if(anObject.workOrderBytItemRefClassAccuracy != null)
           anObject.workOrderBytItemRefClassAccuracy = anObject.workOrderBytItemRefClassAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.workOrderBytItemRefCheckperiod = set.getBigDecimal(48);
         if(anObject.workOrderBytItemRefCheckperiod != null)
           anObject.workOrderBytItemRefCheckperiod = anObject.workOrderBytItemRefCheckperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.workOrderBytItemRefRpStatusCode = set.getInt(49);
     if(set.wasNull())
       anObject.workOrderBytItemRefRpStatusCode = Integer.MIN_VALUE;
         anObject.workOrderBytItemRefPhasity = set.getBigDecimal(50);
         if(anObject.workOrderBytItemRefPhasity != null)
           anObject.workOrderBytItemRefPhasity = anObject.workOrderBytItemRefPhasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.workOrderBytItemRefDatecheck = set.getDate(51);
         anObject.workOrderBytItemRefCheckperiod1 = set.getBigDecimal(52);
         if(anObject.workOrderBytItemRefCheckperiod1 != null)
           anObject.workOrderBytItemRefCheckperiod1 = anObject.workOrderBytItemRefCheckperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.workOrderBytItemRefPlacecounter = set.getString(53);
         anObject.workOrderBytItemRefRpIsWorking = set.getInt(54);
     if(set.wasNull())
       anObject.workOrderBytItemRefRpIsWorking = Integer.MIN_VALUE;
         anObject.workOrderBytItemRefRecordPointName = set.getString(55);
         anObject.workOrderBytItemRefRouteBytName = set.getString(56);
         anObject.workOrderBytItemRefRouteBytNumbergen = set.getString(57);
         anObject.workOrderBytItemRefCommentGen = set.getString(58);
         anObject.workOrderBytItemRefDateAdd = set.getTimestamp(59);
         anObject.workOrderBytItemRefDateEdit = set.getTimestamp(60);
         anObject.workOrderBytItemRefUserAdd = set.getString(61);
         anObject.workOrderBytItemRefUserEdit = set.getString(62);
         anObject.workOrderBytItemRefFactCode = set.getInt(63);
     if(set.wasNull())
       anObject.workOrderBytItemRefFactCode = Integer.MIN_VALUE;

     anObject.estimateItemCode = set.getInt(64);
     if (set.wasNull())
    	 anObject.estimateItemCode = Integer.MIN_VALUE;
     
     anObject.estimateItemCountFact = set.getBigDecimal(65);
     if(anObject.estimateItemCountFact != null)
    	 anObject.estimateItemCountFact = anObject.estimateItemCountFact.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
     
     anObject.estimateItemMaterialName = set.getString(66);
     
     anObject.kindRefCode = set.getInt(67);
	 if(set.wasNull())
		 anObject.kindRefCode = Integer.MIN_VALUE;
     anObject.kindRefName = set.getString(68);

     anObject.sealRefTypeCode = set.getInt(69);
	 if(set.wasNull())
		 anObject.sealRefTypeCode = Integer.MIN_VALUE;
     anObject.sealRefTypeName = set.getString(70);
     
     
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


    public SCSeal2ENWorkOrderBytShortList getSealsListForWorkOrderByt(int workOrderBytCode) throws PersistenceException
    {
     SCSeal2ENWorkOrderBytShortList result = new SCSeal2ENWorkOrderBytShortList();
     SCSeal2ENWorkOrderBytShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     //String     whereStr = "";
     //String     orderBy = "wbi.ACCOUNTNUMBER";

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr =
    		 " SELECT " + 
    		 "   distinct ei.code, /*ei.countfact,*/ " +
    		 "   coalesce( " +
    		 " 	  (select sum(ei1.countfact) " + 
    		 " 	   from enestimateitem ei1 " +
    		 " 	   where ei1.planrefcode = fact.code " +
    		 " 		 and ei1.countfact > 0 " + 
    		 " 		 and ei1.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ")), 0) as countfact, " +    				 
    		 "   wbi.CONTRACTNUMBERSERVICES, " + 
    		 "   wbi.ACCOUNTNUMBER, " + 
    		 "   wbi.NAME, " + 
    		 "   wbi.CUSTOMERNAME, " + 
    		 "   wbi.ADDRESS, " +
    		 "   s.code, " + 
    		 "   s.invnumber, " +
    		 "   s.name, " + 
    		 "   s.buildnumber " +   
    		 " FROM " + 
    		 "   ENWORKORDERBYTITEM wbi, " + 
    		 "   enestimateitem ei " +
    		 "     left join scseal s on s.estimateitemrefcode = ei.code, " + 
    		 "   enplanwork plan, enplanwork fact, enplancorrecthistory ch " +
    		 " WHERE " + 
    		 "   ei.planrefcode = fact.code " +
    		 "   and wbi.planrefcode = plan.code " +
    		 "   and plan.code = ch.planoldrefcode " +
    		 "   and fact.code = ch.plannewrefcode " +
    		 "   and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
    		 "   and wbi.workorderbytrefcode = " + workOrderBytCode +
    		 "   and ei.countfact > 0 " + 
    		 "   and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " + 
    		 " ORDER BY " +  
    		 "   wbi.ACCOUNTNUMBER, " + 
    		 "   ei.code ";    		 
     
     try
      {
       statement = connection.prepareStatement(selectStr);

       set = statement.executeQuery();
       int i;
       for (i = 0; set.next(); i++) {

    	 anObject = new SCSeal2ENWorkOrderBytShort();

         anObject.estimateItemCode = set.getInt(1);
         if (set.wasNull())
        	 anObject.estimateItemCode = Integer.MIN_VALUE;
         
         anObject.estimateItemCountFact = set.getBigDecimal(2);
         if(anObject.estimateItemCountFact != null)
        	 anObject.estimateItemCountFact = anObject.estimateItemCountFact.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

         anObject.workOrderBytItemRefContractNumberServices = set.getString(3);
         anObject.workOrderBytItemRefAccountNumber = set.getString(4);
         anObject.workOrderBytItemRefName = set.getString(5);
         anObject.workOrderBytItemRefCustomerName = set.getString(6);
         anObject.workOrderBytItemRefAddress = set.getString(7);
         
         anObject.sealRefCode = set.getInt(8);
         if(set.wasNull())
        	 anObject.sealRefCode = Integer.MIN_VALUE;
         anObject.sealRefInvNumber = set.getString(9);
         anObject.sealRefName = set.getString(10);
         anObject.sealRefBuildNumber = set.getString(11);    	 
     
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


    public SCSeal2ENWorkOrderBytShortList getWorkOrderBytItemsForSealsBinding(int workOrderBytCode, int accountingTypeCode) throws PersistenceException
    {
     SCSeal2ENWorkOrderBytShortList result = new SCSeal2ENWorkOrderBytShortList();
     SCSeal2ENWorkOrderBytShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr =
    		 "  SELECT " +
			 "      wbi.CONTRACTNUMBERSERVICES, " +
			 "      wbi.ACCOUNTNUMBER, " +
			 "      wbi.NAME, " +
			 
			 "      wbi.CUSTOMERNAME, " +
             
			 " wbi.CUSTOMERNAME || " +
             " (case " +
             "   when wbi.recordpointpromrefcode is not null then " +
             "     coalesce(' (' || wbi.recordpointname || ')', '') " +
             "   else " + 
             "     '' " +
             " end) as CUSTOMERNAMEFULL, " +  
			 
			 "      wbi.ADDRESS, " +
			 "             " +
			 //"      ei.accountingtyperefcode," +
			 "             " +
			 "      group_concat('' || ei.code, ',') as eicodes, " +
			 "           " +
			 "      coalesce((select sum(ei1.countfact)  " +
			 "                from enestimateitem ei1  " +
			 "                where " +
			 "                  ei1.planrefcode = fact.code  " +
			 "                  and ei1.countfact > 0  " +
			 //"                  and ei1.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ")), " +
			 "                  and ei1.accountingtyperefcode = ei.accountingtyperefcode), " +
			 "              0) as counttotal, " +
			 "   " +
			 "      coalesce((select count(distinct s.code)  " +
			 "                from enestimateitem ei1, scseal s  " +
			 "                where " +
			 "                  ei1.planrefcode = fact.code  " +
			 "                  and ei1.countfact > 0  " +
			 //"                  and ei1.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
			 "                  and ei1.accountingtyperefcode = ei.accountingtyperefcode " +
			 "                  and s.estimateitemrefcode = ei1.code),  " +
			 "              0) as countreserved " +
			 "           " +
			 "  FROM  " +
			 "      ENWORKORDERBYTITEM wbi, " +
			 "      enestimateitem ei, " +
			 "      enplanwork plan, " +
			 "      enplanwork fact, " +
			 "      enplancorrecthistory ch " +
			 "     " +
			 "  WHERE  " +
			 "      ei.planrefcode = fact.code " +
			 "      and wbi.planrefcode = plan.code " +
			 "      and plan.code = ch.planoldrefcode " +
			 "      and fact.code = ch.plannewrefcode " +
			 "      and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
			 "      and wbi.workorderbytrefcode = " + workOrderBytCode +
			 "      and ei.countfact > 0 " +
			 //"      and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
			 "      and ei.accountingtyperefcode = " + accountingTypeCode +
			 "   " +
			 "  GROUP BY " +
			 "      wbi.CONTRACTNUMBERSERVICES, " +
			 "      wbi.ACCOUNTNUMBER, " +
			 "      wbi.NAME, " +
			 "      wbi.CUSTOMERNAME, " +
             "      wbi.recordpointpromrefcode, " +
             "      wbi.recordpointname, " +
			 "      wbi.ADDRESS, " +
			 "      fact.code, " +
			 "      ei.accountingtyperefcode " +
			 "   " +
			 "  ORDER BY  " +
			 "      wbi.ACCOUNTNUMBER ";
     
     try
      {
       statement = connection.prepareStatement(selectStr);

       set = statement.executeQuery();
       int i;
       for (i = 0; set.next(); i++) {

    	 anObject = new SCSeal2ENWorkOrderBytShort();

         anObject.workOrderBytItemRefContractNumberServices = set.getString(1);
         anObject.workOrderBytItemRefAccountNumber = set.getString(2);
         anObject.workOrderBytItemRefName = set.getString(3);
         anObject.workOrderBytItemRefCustomerName = set.getString(4);
         anObject.workOrderBytItemRefCustomerNameFull = set.getString(5);
         anObject.workOrderBytItemRefAddress = set.getString(6);

         anObject.estimateItemCodes = set.getString(7);
         
         anObject.estimateItemCountFact = set.getBigDecimal(8);
         if(anObject.estimateItemCountFact != null)
        	 anObject.estimateItemCountFact = anObject.estimateItemCountFact.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

         anObject.sealsCountFact = set.getBigDecimal(9);
         if(anObject.sealsCountFact != null)
        	 anObject.sealsCountFact = anObject.sealsCountFact.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

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

    
} // end of SCSeal2ENWorkOrderBytDAO
