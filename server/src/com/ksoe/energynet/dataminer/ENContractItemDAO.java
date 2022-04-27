
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENContractItemDAOGen;
import com.ksoe.energynet.valueobject.ENContractItem;
import com.ksoe.energynet.valueobject.brief.ENContractItemShort;
import com.ksoe.energynet.valueobject.lists.ENContractItemShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENContractItem;
  *
  */

public class ENContractItemDAO extends ENContractItemDAOGen {


  public ENContractItemDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENContractItemDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  public int add(ENContractItem anObject) throws PersistenceException
  {
    anObject.dateEdit = new Date();
    anObject.userGen = getUserProfile().userName;
    return super.add(anObject);
  }

  public void save(ENContractItem anObject) throws PersistenceException
  {
    anObject.dateEdit = new Date();
    anObject.userGen = getUserProfile().userName;
    super.save(anObject);
  }
  
  /** Лист по строкам договорных материалов с остатком непривязанных */
  public ENContractItemShortList getScrollableFilteredListWithCountRest(ENContractItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENContractItemShortList result = new ENContractItemShortList();
   ENContractItemShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENCONTRACTITEM.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
   
   

   selectStr = 
		   " select contractitemcode ,  name as materialname	, counttotal,	countbinded	, (counttotal - countbinded ) as countrest ,  price,	cost,	contractnumber,	contractdate,	 \n" +
		   " findocid,	findoccode,	contractenddate \n" +
		   " from ( \n" +
		   " select m.name, ci.countgen as counttotal,   \n" +
		   "         (select coalesce(sum(ec.countfact), 0)  \n" +
		   "          from enestimateitem2contrct ec, enestimateitem ei  \n" +
		   "          where ec.estimateitemcode = ei.code  \n" +
		   "            and ei.materialrefcode = m.code  \n" +
		   "            and ec.findocid = c.findocid  \n" +
		   "            and ec.findoccode = c.findoccode) as countbinded,  \n" +
		   "         ci.price, ci.cost,   \n" +
		   "         c.contractnumber, c.contractdate, c.findocid, c.findoccode , c.contractenddate  \n" +
		   "  from encontract c, encontractitem ci, tkmaterials m   \n" +
		   "  where ci.contractcode = c.code  \n" +
		   "    and ci.materialcode = m.code   \n" +
		   "    and m.code = " + aFilterObject.material.code + " \n" +
		    "    and to_char(c.contractenddate,'yyyy') >='" + condition + "' \n" + //условие по году в сондишене что бы заезжало 
		   " ) as sel_in \n" ;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }

       anObject = new ENContractItemShort();

       
       anObject.code = set.getInt("contractitemcode");
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       
       anObject.materialName = set.getString("materialname");
       
       anObject.countGen = set.getBigDecimal("counttotal");
       if(anObject.countGen != null)
           anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       
       
       anObject.countBinded = set.getBigDecimal("countbinded");
       if(anObject.countBinded != null)
           anObject.countBinded = anObject.countBinded.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       
       
       anObject.countRest = set.getBigDecimal("countrest");
       if(anObject.countRest != null)
           anObject.countRest = anObject.countRest.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       
       anObject.price = set.getBigDecimal("price");
       if(anObject.price != null)
           anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       
       anObject.cost = set.getBigDecimal("cost");
       if(anObject.cost != null)
           anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       
       anObject.contractContractNumber = set.getString("contractnumber");
       anObject.contractContractDate = set.getDate("contractdate");
       
       anObject.contractFinDocID = set.getInt("findocid");
       if(set.wasNull())
       anObject.contractFinDocID = Integer.MIN_VALUE;
       
       anObject.contractFinDocCode = set.getString("findoccode");
       
       anObject.contractEndDate = set.getDate("contractenddate");
       
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

  public ENContractItemShortList getScrollableFilteredList(ENContractItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENContractItemShortList result = new ENContractItemShortList();
   ENContractItemShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENCONTRACTITEM.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENCONTRACTITEM.CODE"+
    ",ENCONTRACTITEM.COUNTGEN"+
    ",ENCONTRACTITEM.PRICE"+
    ",ENCONTRACTITEM.COST"+
    ",ENCONTRACTITEM.COUNTREAL"+
    ",ENCONTRACTITEM.USERGEN"+
    ",ENCONTRACTITEM.DATEEDIT"+

     ", TKMATERIALS.CODE " +
     ", TKMATERIALS.NAME " +
     ", TKMATERIALS.COST " +
     ", TKMATERIALS.DELIVERYDATE " +
     ", TKMATERIALS.NUMKATALOG " +
     ", TKMATERIALS.IDENTID " +
     ", ENCONTRACT.CODE " +
     ", ENCONTRACT.CONTRACTNUMBER " +
     ", ENCONTRACT.CONTRACTDATE " +
     ", ENCONTRACT.FINDOCCODE " +
     ", ENCONTRACT.FINDOCID " +
     ", ENCONTRACT.USERGEN " +
     ", ENCONTRACT.DATEEDIT " +
	   ",          coalesce((select coalesce(sum(ec.countfact), 0)  \n" +
	   "          from enestimateitem2contrct ec, enestimateitem ei  \n" +
	   "          where ec.estimateitemcode = ei.code  \n" +
	   "            and ei.materialrefcode = ENCONTRACTITEM.materialcode  \n" +
	   "            and ec.findocid = ENCONTRACT.findocid  \n" +
	   "            and ec.findoccode = ENCONTRACT.findoccode),0) as countbinded  \n" +

    " FROM ENCONTRACTITEM " +
    ", TKMATERIALS " +
    ", ENCONTRACT " +
    //" WHERE "
   "";
    whereStr = " TKMATERIALS.CODE = ENCONTRACTITEM.MATERIALCODE" ; //+
     whereStr = whereStr +" AND ENCONTRACT.CODE = ENCONTRACTITEM.CONTRACTCODE" ; //+
       //selectStr = selectStr + " ${s} ENCONTRACTITEM.CODE IN ( SELECT ENCONTRACTITEM.CODE FROM ENCONTRACTITEM ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENCONTRACTITEM.CODE = ?";
       }
       if(aFilterObject.countGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENCONTRACTITEM.COUNTGEN = ?";
       }
       if(aFilterObject.price != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENCONTRACTITEM.PRICE = ?";
       }
       if(aFilterObject.cost != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENCONTRACTITEM.COST = ?";
       }
        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENCONTRACTITEM.COMMENTGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENCONTRACTITEM.COMMENTGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.countReal != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENCONTRACTITEM.COUNTREAL = ?";
       }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENCONTRACTITEM.USERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENCONTRACTITEM.USERGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENCONTRACTITEM.DATEEDIT = ?";
       }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENCONTRACTITEM.MODIFY_TIME = ?";
       }
       if(aFilterObject.material.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENCONTRACTITEM.MATERIALCODE = ? ";
       }
       if(aFilterObject.contract.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENCONTRACTITEM.CONTRACTCODE = ? ";
       }

     }



     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE " + whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }
       if(aFilterObject.countGen != null){
           number++;
           aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.countGen);
       }
       if(aFilterObject.price != null){
           number++;
           aFilterObject.price = aFilterObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.price);
       }
       if(aFilterObject.cost != null){
           number++;
           aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.cost);
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
       if(aFilterObject.countReal != null){
           number++;
           aFilterObject.countReal = aFilterObject.countReal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.countReal);
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
           statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
       }
       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.material.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.material.code);
      }
      if(aFilterObject.contract.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.contract.code);
      }
     }

     if(condition.length() > 0 && aBindObjects != null)
      _bindObjectsToPreparedStatement(statement,aBindObjects,number);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }

       anObject = new ENContractItemShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.countGen = set.getBigDecimal(2);
       if(anObject.countGen != null)
           anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.price = set.getBigDecimal(3);
       if(anObject.price != null)
           anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.cost = set.getBigDecimal(4);
       if(anObject.cost != null)
           anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.countReal = set.getBigDecimal(5);
       if(anObject.countReal != null)
           anObject.countReal = anObject.countReal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.userGen = set.getString(6);
       anObject.dateEdit = set.getDate(7);

       anObject.materialCode = set.getInt(8);
       if(set.wasNull())
       anObject.materialCode = Integer.MIN_VALUE;
       anObject.materialName = set.getString(9);

       anObject.contractCode = set.getInt(14);
       if(set.wasNull())
       anObject.contractCode = Integer.MIN_VALUE;
       anObject.contractContractNumber = set.getString(15);
       anObject.contractContractDate = set.getDate(16);
       anObject.contractFinDocCode = set.getString(17);
       anObject.contractFinDocID = set.getInt(18);
       if(set.wasNull())
       anObject.contractFinDocID = Integer.MIN_VALUE;
       anObject.contractUserGen = set.getString(19);
       anObject.contractDateEdit = set.getDate(20);
       
       anObject.countbinded = set.getBigDecimal(21);
       if(anObject.countbinded != null)
           anObject.countbinded  = anObject.countbinded.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

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




} // end of ENContractItemDAO

