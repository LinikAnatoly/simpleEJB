
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.SCSealDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.SCSeal;
import com.ksoe.energynet.valueobject.SCSealStatus;
import com.ksoe.energynet.valueobject.brief.SCSealShort;
import com.ksoe.energynet.valueobject.filter.SCSealFilter;
import com.ksoe.energynet.valueobject.lists.SCSealShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for SCSeal;
 *
 */

public class SCSealDAO extends SCSealDAOGen {

    public SCSealDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public SCSealDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    /**
     * 
     * Сумма включенных пломб по коду акта выполненных работ
     * 
     * @param actCode код акта
     * @return сумма пломб
     * @throws PersistenceException 
     */
    public BigDecimal getSumByActCode(int actCode) throws PersistenceException {
    	int[] statuses = SCSealStatus.getActiveSCSealStatuses();
    	String paramStatuses = Tools.repeatSymbol("?", ",", statuses.length);
    	SCSealFilter filter = new SCSealFilter();
    	filter.conditionSQL = String.format("exists (select 1 from %s as es1 inner join %s as acpw1 on es1.%s = acpw1.%s where acpw1.%s = ? and es1.%s = %s) and %s in (%s)"
    	    , ENEstimateItem.tableName, ENAct2ENPlanWork.tableName, ENEstimateItem.planRef_Field, ENAct2ENPlanWork.plan_Field, ENAct2ENPlanWork.actRef_Field, ENEstimateItem.code_Field, SCSeal.estimateItemRef_QFielld, SCSeal.statusRef_QFielld, paramStatuses);
    	Vector<Object> vec = new Vector<Object>();
    	vec.add(actCode);
    	for(int status : statuses) {
    		vec.add(status);
    	}
    	BigDecimal out = this.getAggregateValue("sum", SCSeal.cost_QFielld, filter, vec);
    	return (out == null) ? new BigDecimal(0) : out;
    }

    public int add(SCSeal anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    public void save(SCSeal anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }
    
    public SCSealShortList getScrollableFilteredList(SCSeal aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     SCSealShortList result = new SCSealShortList();
     SCSealShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "SCSEAL.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "SCSEAL.CODE"+
      ",SCSEAL.INVNUMBER"+
      ",SCSEAL.NAME"+
      ",SCSEAL.BUILDNUMBER"+
      ",SCSEAL.ACCOUNT"+
      ",SCSEAL.DEPARTMETFKCODE"+
      ",SCSEAL.MOLCODE"+
      ",SCSEAL.MOLNAME"+
      ",SCSEAL.DATEIN"+
      ",SCSEAL.DATEBUILD"+
      ",SCSEAL.COST"+
      ",SCSEAL.SCCODE"+
      ",SCSEAL.INSTALLORDERNUMBER"+
      ",SCSEAL.COSTOLD"+
      ",SCSEAL.USERADD"+
      ",SCSEAL.DATEADD"+
      ",SCSEAL.USERGEN"+
      ",SCSEAL.DATEEDIT"+

       ", SCSEALTYPE.CODE " +
       ", SCSEALTYPE.NAME " +
       ", SCSEALSTATUS.CODE " +
       ", SCSEALSTATUS.NAME " +
       ", ENESTIMATEITEM.CODE " +
       ", ENESTIMATEITEM.COUNTGEN " +
       ", ENESTIMATEITEM.COUNTFACT " +
       ", ENESTIMATEITEM.PRICE " +
       ", ENESTIMATEITEM.COST " +
       ", ENESTIMATEITEM.ISUSEVAT " +
       ", ENESTIMATEITEM.DELIVERYTIME " +
       ", ENESTIMATEITEM.USEWORKTIME " +
       ", ENESTIMATEITEM.USERGEN " +
       ", ENESTIMATEITEM.DATEEDIT " +
       ", SCSEALLOCKTYPE.CODE " +
       ", SCSEALLOCKTYPE.NAME " +
       ", RQSTORAGEZONE.CODE " +
       ", RQSTORAGEZONE.NAME " +
       " FROM " +
       "   SCSEAL " + 
       "     left join ENESTIMATEITEM on ENESTIMATEITEM.CODE = SCSEAL.ESTIMATEITEMREFCODE " +
       "     left join RQSTORAGEZONE on RQSTORAGEZONE.CODE = SCSEAL.ZONEREFCODE " +
       "     left join SCSEALLOCKTYPE on SCSEALLOCKTYPE.CODE = SCSEAL.LOCKTYPEREFCODE, " +
       "   SCSEALTYPE, " +
       "   SCSEALSTATUS " +
      //" WHERE "
   "";
      whereStr = " SCSEALTYPE.CODE = SCSEAL.TYPEREFCODE" ; //+
       whereStr = whereStr +" AND SCSEALSTATUS.CODE = SCSEAL.STATUSREFCODE" ; //+
       //whereStr = whereStr +" AND ENESTIMATEITEM.CODE = SCSEAL.ESTIMATEITEMREFCODE" ; //+
       //whereStr = whereStr +" AND SCSEALLOCKTYPE.CODE = SCSEAL.LOCKTYPEREFCODE" ; //+
       //whereStr = whereStr +" AND RQSTORAGEZONE.CODE = SCSEAL.ZONEREFCODE" ; //+
     //selectStr = selectStr + " ${s} SCSEAL.CODE IN ( SELECT SCSEAL.CODE FROM SCSEAL ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  SCSEAL.CODE = ?";
         }
          if (aFilterObject.invNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL.INVNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL.INVNUMBER) LIKE UPPER(?)";
          }
          if (aFilterObject.name != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL.NAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL.NAME) LIKE UPPER(?)";
          }
          if (aFilterObject.buildNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.buildNumber.indexOf('*',0) < 0 && aFilterObject.buildNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL.BUILDNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL.BUILDNUMBER) LIKE UPPER(?)";
          }
          if (aFilterObject.account != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.account.indexOf('*',0) < 0 && aFilterObject.account.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL.ACCOUNT) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL.ACCOUNT) LIKE UPPER(?)";
          }
          if (aFilterObject.departmetFKCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.departmetFKCode.indexOf('*',0) < 0 && aFilterObject.departmetFKCode.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL.DEPARTMETFKCODE) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL.DEPARTMETFKCODE) LIKE UPPER(?)";
          }
          if (aFilterObject.molCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL.MOLCODE) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL.MOLCODE) LIKE UPPER(?)";
          }
          if (aFilterObject.molName != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL.MOLNAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL.MOLNAME) LIKE UPPER(?)";
          }
         if(aFilterObject.dateIn != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  SCSEAL.DATEIN = ?";
         }
         if(aFilterObject.dateBuild != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  SCSEAL.DATEBUILD = ?";
         }
         if(aFilterObject.cost != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  SCSEAL.COST = ?";
         }
         if(aFilterObject.scCode != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  SCSEAL.SCCODE = ?";
         }
          if (aFilterObject.installOrderNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.installOrderNumber.indexOf('*',0) < 0 && aFilterObject.installOrderNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL.INSTALLORDERNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL.INSTALLORDERNUMBER) LIKE UPPER(?)";
          }
         if(aFilterObject.costOld != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  SCSEAL.COSTOLD = ?";
         }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL.COMMENTGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL.COMMENTGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  SCSEAL.MODIFY_TIME = ?";
         }
          if (aFilterObject.userAdd != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL.USERADD) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL.USERADD) LIKE UPPER(?)";
          }
         if(aFilterObject.dateAdd != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  SCSEAL.DATEADD = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(SCSEAL.USERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(SCSEAL.USERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  SCSEAL.DATEEDIT = ?";
         }
         if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "SCSEAL.TYPEREFCODE = ? ";
         }
         if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "SCSEAL.STATUSREFCODE = ? ";
         }
         if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "SCSEAL.ESTIMATEITEMREFCODE = ? ";
         }
         if(aFilterObject.lockTypeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "SCSEAL.LOCKTYPEREFCODE = ? ";
         }
         if(aFilterObject.zoneRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "SCSEAL.ZONEREFCODE = ? ";
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

            if(aFilterObject.invNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.invNumber);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.name != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.name);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.buildNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.buildNumber);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.account != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.account);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.departmetFKCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.departmetFKCode);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.molCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.molCode);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.molName != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.molName);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.dateIn != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateIn.getTime()));
         }
         if(aFilterObject.dateBuild != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateBuild.getTime()));
         }
         if(aFilterObject.cost != null){
             number++;
             aFilterObject.cost = aFilterObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.cost);
         }
          if(aFilterObject.scCode != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.scCode);
          }

            if(aFilterObject.installOrderNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.installOrderNumber);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.costOld != null){
             number++;
             aFilterObject.costOld = aFilterObject.costOld.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.costOld);
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
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.typeRef.code);
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.statusRef.code);
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.estimateItemRef.code);
        }
        if(aFilterObject.lockTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.lockTypeRef.code);
        }
        if(aFilterObject.zoneRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.zoneRef.code);
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

         anObject = new SCSealShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.invNumber = set.getString(2);
         anObject.name = set.getString(3);
         anObject.buildNumber = set.getString(4);
         anObject.account = set.getString(5);
         anObject.departmetFKCode = set.getString(6);
         anObject.molCode = set.getString(7);
         anObject.molName = set.getString(8);
         anObject.dateIn = set.getDate(9);
         anObject.dateBuild = set.getDate(10);
         anObject.cost = set.getBigDecimal(11);
         if(anObject.cost != null)
             anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.scCode = set.getInt(12);
         if ( set.wasNull() )
             anObject.scCode = Integer.MIN_VALUE;
         anObject.installOrderNumber = set.getString(13);
         anObject.costOld = set.getBigDecimal(14);
         if(anObject.costOld != null)
             anObject.costOld = anObject.costOld.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.userAdd = set.getString(15);
         anObject.dateAdd = set.getTimestamp(16);
         anObject.userGen = set.getString(17);
         anObject.dateEdit = set.getTimestamp(18);

         anObject.typeRefCode = set.getInt(19);
     if(set.wasNull())
       anObject.typeRefCode = Integer.MIN_VALUE;
         anObject.typeRefName = set.getString(20);
         anObject.statusRefCode = set.getInt(21);
     if(set.wasNull())
       anObject.statusRefCode = Integer.MIN_VALUE;
         anObject.statusRefName = set.getString(22);
         anObject.estimateItemRefCode = set.getInt(23);
     if(set.wasNull())
       anObject.estimateItemRefCode = Integer.MIN_VALUE;
         anObject.estimateItemRefCountGen = set.getBigDecimal(24);
         if(anObject.estimateItemRefCountGen != null)
           anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.estimateItemRefCountFact = set.getBigDecimal(25);
         if(anObject.estimateItemRefCountFact != null)
           anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.estimateItemRefPrice = set.getBigDecimal(26);
         if(anObject.estimateItemRefPrice != null)
           anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.estimateItemRefCost = set.getBigDecimal(27);
         if(anObject.estimateItemRefCost != null)
           anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.estimateItemRefIsUseVAT = set.getInt(28);
     if(set.wasNull())
       anObject.estimateItemRefIsUseVAT = Integer.MIN_VALUE;
         anObject.estimateItemRefDeliveryTime = set.getInt(29);
     if(set.wasNull())
       anObject.estimateItemRefDeliveryTime = Integer.MIN_VALUE;
         anObject.estimateItemRefUseWorkTime = set.getInt(30);
     if(set.wasNull())
       anObject.estimateItemRefUseWorkTime = Integer.MIN_VALUE;
         anObject.estimateItemRefUserGen = set.getString(31);
         anObject.estimateItemRefDateEdit = set.getDate(32);
         anObject.lockTypeRefCode = set.getInt(33);
     if(set.wasNull())
       anObject.lockTypeRefCode = Integer.MIN_VALUE;
         anObject.lockTypeRefName = set.getString(34);
         anObject.zoneRefCode = set.getInt(35);
     if(set.wasNull())
       anObject.zoneRefCode = Integer.MIN_VALUE;
         anObject.zoneRefName = set.getString(36);

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

    
} // end of SCSealDAO
