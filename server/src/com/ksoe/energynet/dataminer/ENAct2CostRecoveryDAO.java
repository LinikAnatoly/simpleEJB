
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENAct2CostRecoveryDAOGen;
import com.ksoe.energynet.valueobject.ENAct2CostRecovery;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.brief.ENAct2CostRecoveryShort;
import com.ksoe.energynet.valueobject.filter.ENAct2CostRecoveryFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2CostRecoveryShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.logic.TKConsts;

  /**
  *  DAO Object for ENAct2CostRecovery;  
  * 	
  */

public class ENAct2CostRecoveryDAO extends ENAct2CostRecoveryDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENAct2CostRecoveryDAO() {super();}
  //public ENAct2CostRecoveryDAO(Connection aConnection) {super(aConnection);}
  //public ENAct2CostRecoveryDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENAct2CostRecoveryDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAct2CostRecoveryDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  
  public boolean costAlreadyIncludedByActCode(int actCode) throws PersistenceException {
	  if(actCode == Integer.MIN_VALUE) throw new java.lang.NullPointerException("Не заданий код акту!");
	  ENAct2CostRecoveryFilter filter = new ENAct2CostRecoveryFilter();
	  filter.actRef.code = actCode;
	  int[] codes = this.getFilteredCodeArray(filter, 0, -1);
	  
	  return codes.length > 0;
  }
  public ENAct2CostRecoveryShortList getList4Cost(int elementCode) throws PersistenceException
  {
	  ENAct2CostRecoveryShortList result = new ENAct2CostRecoveryShortList();
	  ENAct2CostRecoveryShort anObject;
	  
   result.list = new Vector<ENAct2CostRecoveryShort>();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   
   selectStr = "SELECT DISTINCT "
   		+ " tcp.kod"
   		+ ", tcp.name"
   		+ ", 'ШТ' AS measure"
   		+ ", max(p2c.countgen) AS countgen"
   		+ ", tcp.costworkscontractor"
   		+ ", max(p2c.countgen) * tcp.costworkscontractor AS summa "
   		+ ", tcp.code "
   		+ " FROM "
   		+ " enservicesobject AS so INNER JOIN enplanwork AS p ON so.elementcode = p.elementrefcode "
	   	+ " INNER JOIN enplanworkitem AS pi ON p.code = pi.planrefcode "
	   	+ " INNER JOIN tktechcard AS tk ON pi.kartarefcode = tk.code"
	   	+ " INNER JOIN tkclassificationtype AS tcp ON tk.classificationtypecode = tcp.code "
	   	+ " INNER JOIN enplanwork2classfctntp AS p2c ON (p.code = p2c.planrefcode AND tcp.code = p2c.classificationtyperfcd) "
	   	+ " WHERE  "
	   	+ " p.kindcode = ? "
	   	+ " AND p.elementrefcode = ? "
	   	+ " AND tcp.isnotlicensedactivity = ?  "
	   	+ " GROUP BY tcp.kod , tcp.name , tcp.costworkscontractor , tcp.code   "
	   	+ " UNION ALL "
        + " SELECT"
        + " '' AS kod"
        + ", cai.name || coalesce(' (' ||s.comment || ')','') AS name "
        + ", 'ШТ' as measure"
        + ", s.countgen"
        + ",  s.summa as costworkcontractor"
        + ", s.summa"
        + ", null as code "
        + " FROM"
        + " enservices2clcddtnltms AS s "
        + " INNER JOIN encalcadditionalitemtp AS cai ON s.calcadditionaltmtprfcd = cai.code "
        + " INNER JOIN enservicesobject AS so ON s.servicesobjectrefcode = so.code "
        + " WHERE so.elementcode = ? ";

   
   try
    {
     statement = connection.prepareStatement(selectStr);
     
     statement.setInt(1, ENPlanWorkKind.CALCULATION);
     statement.setInt(2, elementCode);
     statement.setInt(3, TKConsts.ISNOTLICENSEDACTIVITY_COSTWORKSCONTRACTOR);
     statement.setInt(4, elementCode);
     
     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       anObject = new ENAct2CostRecoveryShort();
       anObject.name = set.getString(2);
       anObject.measureUnitName = set.getString(3);
       anObject.countGen = set.getBigDecimal(4);
       if (anObject.countGen != null){
    	   anObject.countGen = anObject.countGen.setScale(2, BigDecimal.ROUND_HALF_UP);
       }
       anObject.price = set.getBigDecimal(5);
       if (anObject.price != null){
    	   anObject.price = anObject.price.setScale(2, BigDecimal.ROUND_HALF_UP);
       }
       
       anObject.summa = set.getBigDecimal(6);
       if (anObject.summa != null){
    	   anObject.summa = anObject.summa.setScale(2, BigDecimal.ROUND_HALF_UP);
       }   
       
       anObject.classificationTypeRefCode  = set.getInt(7);
       if ( set.wasNull() )
    	   anObject.classificationTypeRefCode = Integer.MIN_VALUE;
       
       result.list.add(anObject);
      }
     result.setTotalCount(i);
     return result;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return null;
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

  public ENAct2CostRecoveryShortList getScrollableFilteredList(ENAct2CostRecovery aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENAct2CostRecoveryShortList result = new ENAct2CostRecoveryShortList();
   ENAct2CostRecoveryShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENACT2COSTRECOVERY.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENACT2COSTRECOVERY.CODE"+
    ",ENACT2COSTRECOVERY.NAME"+
    ",ENACT2COSTRECOVERY.MEASUREUNITNAME"+
    ",ENACT2COSTRECOVERY.COUNTGEN"+
    ",ENACT2COSTRECOVERY.PRICE"+
    ",ENACT2COSTRECOVERY.SUMMA"+

     ", ENACT.CODE " +
     ", ENACT.NUMBERGEN " +
     ", ENACT.DATEGEN " +
     ", ENACT.FINDOCCODE " +
     ", ENACT.FINDOCMECHANICCODE " +
     ", ENACT.FINMOLNAME " +
     ", ENACT.FINMECHANICNAME " +
     ", ENACT.INVNUMBER " +
     ", ENACT.USERGEN " +
     ", ENACT.DATEEDIT " +
     ", ENACT.DATEACT " +
     ", TKCLASSIFICATIONTYPE.CODE " +
     ", TKCLASSIFICATIONTYPE.NAME " +
     ", TKCLASSIFICATIONTYPE.KOD " +
    " FROM ENACT2COSTRECOVERY " +
    " left join TKCLASSIFICATIONTYPE on (TKCLASSIFICATIONTYPE.CODE = ENACT2COSTRECOVERY.CLASSIFICATIONTYPERFCD)" +
    ", ENACT " +

    //" WHERE "
   "";
    whereStr = " ENACT.CODE = ENACT2COSTRECOVERY.ACTREFCODE" ; //+
       //selectStr = selectStr + " ${s} ENACT2COSTRECOVERY.CODE IN ( SELECT ENACT2COSTRECOVERY.CODE FROM ENACT2COSTRECOVERY ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2COSTRECOVERY.CODE = ?";
       }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT2COSTRECOVERY.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT2COSTRECOVERY.NAME) LIKE UPPER(?)";
        }
        if (aFilterObject.measureUnitName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.measureUnitName.indexOf('*',0) < 0 && aFilterObject.measureUnitName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT2COSTRECOVERY.MEASUREUNITNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT2COSTRECOVERY.MEASUREUNITNAME) LIKE UPPER(?)";
        }
       if(aFilterObject.countGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2COSTRECOVERY.COUNTGEN = ?";
       }
       if(aFilterObject.price != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2COSTRECOVERY.PRICE = ?";
       }
       if(aFilterObject.summa != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2COSTRECOVERY.SUMMA = ?";
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENACT2COSTRECOVERY.ACTREFCODE = ? ";
       }
       if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENACT2COSTRECOVERY.CLASSIFICATIONTYPERFCD = ? ";
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

          if(aFilterObject.measureUnitName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.measureUnitName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.countGen != null){
           number++;
           aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.countGen);
       }
       if(aFilterObject.price != null){
           number++;
           aFilterObject.price = aFilterObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.price);
       }
       if(aFilterObject.summa != null){
           number++;
           aFilterObject.summa = aFilterObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.summa);
       }
      if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.actRef.code);
      }
      if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.classificationTypeRef.code);
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

       anObject = new ENAct2CostRecoveryShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.name = set.getString(2);
       anObject.measureUnitName = set.getString(3);
       anObject.countGen = set.getBigDecimal(4);
       if(anObject.countGen != null)
           anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.price = set.getBigDecimal(5);
       if(anObject.price != null)
           anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.summa = set.getBigDecimal(6);
       if(anObject.summa != null)
           anObject.summa = anObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.actRefCode = set.getInt(7);
       if(set.wasNull())
       anObject.actRefCode = Integer.MIN_VALUE;
       anObject.actRefNumberGen = set.getString(8);
       anObject.actRefDateGen = set.getDate(9);
       anObject.actRefFinDocCode = set.getInt(10);
       if(set.wasNull())
       anObject.actRefFinDocCode = Integer.MIN_VALUE;
       anObject.actRefFinDocMechanicCode = set.getInt(11);
       if(set.wasNull())
       anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
       anObject.actRefFinMolName = set.getString(12);
       anObject.actRefFinMechanicName = set.getString(13);
       anObject.actRefInvNumber = set.getString(14);
       anObject.actRefUserGen = set.getString(15);
       anObject.actRefDateEdit = set.getDate(16);
       anObject.actRefDateAct = set.getDate(17);
       anObject.classificationTypeRefCode = set.getInt(18);
       if(set.wasNull())
       anObject.classificationTypeRefCode = Integer.MIN_VALUE;
       anObject.classificationTypeRefName = set.getString(19);
       anObject.classificationTypeRefKod = set.getString(20);

        result.list.add(anObject);
      }

     result.setTotalCount(i);
     return result;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return null;
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

  

} // end of ENAct2CostRecoveryDAO

