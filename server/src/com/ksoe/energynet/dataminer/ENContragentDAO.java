
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENContragentDAOGen;
import com.ksoe.energynet.valueobject.ENContragent;
import com.ksoe.energynet.valueobject.brief.ENContragentShort;
import com.ksoe.energynet.valueobject.lists.ENContragentShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENContragent;
  *
  */

public class ENContragentDAO extends ENContragentDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENContragentDAO() {super();}
  //public ENContragentDAO(Connection aConnection) {super(aConnection);}
  //public ENContragentDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENContragentDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENContragentDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public ENContragentShortList getScrollableFilteredList(ENContragent aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENContragentShortList result = new ENContragentShortList();
    ENContragentShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCONTRAGENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENCONTRAGENT.CODE"+
     ",ENCONTRAGENT.CONTRAGENTNAME"+
     ",ENCONTRAGENT.CONTRAGENTADDRESS"+
     ",ENCONTRAGENT.CONTRAGENTADDRESSWORK"+
     ",ENCONTRAGENT.CONTRAGENTPOSITION"+
     ",ENCONTRAGENT.CONTRAGENTOKPO"+
     ",ENCONTRAGENT.CONTRAGENTBANKACCOUNT"+
     ",ENCONTRAGENT.CONTRAGENTBANKNAME"+
     ",ENCONTRAGENT.CONTRAGENTBANKMFO"+
     ",ENCONTRAGENT.CONTRAGENTBOSSNAME"+
     ",ENCONTRAGENT.CONTRAGENTPASSPORT"+
     ",ENCONTRAGENT.WARRANTDATE"+
     ",ENCONTRAGENT.WARRANTNUMBER"+
     ",ENCONTRAGENT.WARRANTFIO"+
     ",ENCONTRAGENT.WARRANTPASSPORT"+
     ",ENCONTRAGENT.WARRANTADDRESS"+
     ",ENCONTRAGENT.TECHCONDITIONSITEM"+

      ", ENTECHCONDITIONSOBJCTS.CODE " +
      ", ENTECHCONDITIONSOBJCTS.NUMBERGEN " +
      ", ENTECHCONDITIONSOBJCTS.DATEGEN " +
      ", ENTECHCONDITIONSOBJCTS.CUSTOMER " +
      ", ENTECHCONDITIONSOBJCTS.BUILDING " +
      ", ENTECHCONDITIONSOBJCTS.ADDRESS " +
      ", ENTECHCONDITIONSOBJCTS.TYCURRENTPOWER " +
      ", ENTECHCONDITIONSOBJCTS.TYSERVICESPOWER " +

      ", (SELECT ENBASISTYPE.CODE FROM ENBASISTYPE WHERE ENBASISTYPE.CODE = ENCONTRAGENT.BASISTYPECODE) " +
      ", (SELECT ENBASISTYPE.NAME FROM ENBASISTYPE WHERE ENBASISTYPE.CODE = ENCONTRAGENT.BASISTYPECODE) " +

      ", ENTECHCONDITIONSSERVCS.CODE " +
      ", ENTECHCONDITIONSSERVCS.CONTRACTNUMBER " +
      ", ENTECHCONDITIONSSERVCS.CONTRACTDATE " +
      ", ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER " +
      ", ENTECHCONDITIONSSERVCS.FINCONTRACTDATE " +
      ", ENTECHCONDITIONSSERVCS.PARTNERNAME " +
      ", ENTECHCONDITIONSSERVCS.PARTNERCODE " +
      ", ENTECHCONDITIONSSERVCS.FINDOCCODE " +
      ", ENTECHCONDITIONSSERVCS.FINDOCID " +
      ", ENTECHCONDITIONSSERVCS.FINCOMMENTGEN " +
      ", ENTECHCONDITIONSSERVCS.TYSUMMAGEN " +
      ", ENTECHCONDITIONSSERVCS.TYSUMMAVAT " +
      ", ENTECHCONDITIONSSERVCS.TYSERVICESSUMMA " +
      ", ENTECHCONDITIONSSERVCS.TYSERVICESPOWER " +
      ", ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN " +
      ", ENTECHCONDITIONSSERVCS.USERGEN " +
      ", ENTECHCONDITIONSSERVCS.DATEEDIT " +
      ", ENTECHCONDITIONSSERVCS.CNPACKCODE " +
      ", ENSERVICESCONTRAGENTTP.CODE " +
      ", ENSERVICESCONTRAGENTTP.NAME " +

     " FROM ENCONTRAGENT " +
     " left join ENSERVICESCONTRAGENTTP on ENSERVICESCONTRAGENTTP.CODE = ENCONTRAGENT.CONTRAGENTTYPECODE " +

     ", ENTECHCONDITIONSOBJCTS " +
     //", ENBASISTYPE " +
     ", ENTECHCONDITIONSSERVCS " +
     //", ENSERVICESCONTRAGENTTP " +

	 "";

      whereStr = " ENTECHCONDITIONSOBJCTS.CODE = ENCONTRAGENT.TECHCONOBJECTSCODE" ; //+
      //whereStr = whereStr +" AND ENBASISTYPE.CODE = ENCONTRAGENT.BASISTYPECODE" ; //+
      whereStr = whereStr +" AND ENTECHCONDITIONSSERVCS.CODE = ENCONTRAGENT.TECHCONDSERVICESREFCOD" ; //+
      //whereStr = whereStr +" AND ENSERVICESCONTRAGENTTP.CODE = ENCONTRAGENT.CONTRAGENTTYPECODE" ; //+

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRAGENT.CODE = ?";
        }
         if (aFilterObject.contragentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTADDRESS) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTADDRESS) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentAddressWork != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentAddressWork.indexOf('*',0) < 0 && aFilterObject.contragentAddressWork.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTADDRESSWORK) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTADDRESSWORK) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentPosition != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentPosition.indexOf('*',0) < 0 && aFilterObject.contragentPosition.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTPOSITION) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTPOSITION) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentOkpo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentOkpo.indexOf('*',0) < 0 && aFilterObject.contragentOkpo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTOKPO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTOKPO) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentBankAccount != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankAccount.indexOf('*',0) < 0 && aFilterObject.contragentBankAccount.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTBANKACCOUNT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTBANKACCOUNT) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentBankName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankName.indexOf('*',0) < 0 && aFilterObject.contragentBankName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTBANKNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTBANKNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentBankMfo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankMfo.indexOf('*',0) < 0 && aFilterObject.contragentBankMfo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTBANKMFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTBANKMFO) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentBossName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBossName.indexOf('*',0) < 0 && aFilterObject.contragentBossName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTBOSSNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTBOSSNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTPASSPORT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTPASSPORT) LIKE UPPER(?)";
         }
        if(aFilterObject.warrantDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRAGENT.WARRANTDATE = ?";
        }
         if (aFilterObject.warrantNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantNumber.indexOf('*',0) < 0 && aFilterObject.warrantNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.WARRANTNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.WARRANTNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.warrantFIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantFIO.indexOf('*',0) < 0 && aFilterObject.warrantFIO.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.WARRANTFIO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.WARRANTFIO) LIKE UPPER(?)";
         }
         if (aFilterObject.warrantPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantPassport.indexOf('*',0) < 0 && aFilterObject.warrantPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.WARRANTPASSPORT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.WARRANTPASSPORT) LIKE UPPER(?)";
         }
         if (aFilterObject.warrantAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantAddress.indexOf('*',0) < 0 && aFilterObject.warrantAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.WARRANTADDRESS) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.WARRANTADDRESS) LIKE UPPER(?)";
         }
         if (aFilterObject.techConditionsItem != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.techConditionsItem.indexOf('*',0) < 0 && aFilterObject.techConditionsItem.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.TECHCONDITIONSITEM) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.TECHCONDITIONSITEM) LIKE UPPER(?)";
         }
        if(aFilterObject.techConObjects.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCONTRAGENT.TECHCONOBJECTSCODE = ? ";
        }
        if(aFilterObject.basisType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCONTRAGENT.BASISTYPECODE = ? ";
        }
        if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCONTRAGENT.TECHCONDSERVICESREFCOD = ? ";
        }
        if(aFilterObject.contragentType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCONTRAGENT.CONTRAGENTTYPECODE = ? ";
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

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;
      if(aFilterObject != null){
         if(aFilterObject.code != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.code);
         }

           if(aFilterObject.contragentName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentAddress != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentAddress);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentAddressWork != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentAddressWork);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentPosition != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentPosition);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentOkpo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentOkpo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentBankAccount != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankAccount);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentBankName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentBankMfo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankMfo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentBossName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBossName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentPassport != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentPassport);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.warrantDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.warrantDate.getTime()));
        }

           if(aFilterObject.warrantNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.warrantFIO != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantFIO);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.warrantPassport != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantPassport);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.warrantAddress != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantAddress);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.techConditionsItem != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.techConditionsItem);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
       if(aFilterObject.techConObjects.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techConObjects.code);
       }
       if(aFilterObject.basisType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.basisType.code);
       }
       if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServicesRef.code);
       }
       if(aFilterObject.contragentType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.contragentType.code);
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

        anObject = new ENContragentShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.contragentName = set.getString(2);
        anObject.contragentAddress = set.getString(3);
        anObject.contragentAddressWork = set.getString(4);
        anObject.contragentPosition = set.getString(5);
        anObject.contragentOkpo = set.getString(6);
        anObject.contragentBankAccount = set.getString(7);
        anObject.contragentBankName = set.getString(8);
        anObject.contragentBankMfo = set.getString(9);
        anObject.contragentBossName = set.getString(10);
        anObject.contragentPassport = set.getString(11);
        anObject.warrantDate = set.getDate(12);
        anObject.warrantNumber = set.getString(13);
        anObject.warrantFIO = set.getString(14);
        anObject.warrantPassport = set.getString(15);
        anObject.warrantAddress = set.getString(16);
        anObject.techConditionsItem = set.getString(17);

        anObject.techConObjectsCode = set.getInt(18);
		if(set.wasNull())
		   anObject.techConObjectsCode = Integer.MIN_VALUE;
        anObject.techConObjectsNumberGen = set.getString(19);
        anObject.techConObjectsDateGen = set.getDate(20);
        anObject.techConObjectsCustomer = set.getString(21);
        anObject.techConObjectsBuilding = set.getString(22);
        anObject.techConObjectsAddress = set.getString(23);
        anObject.techConObjectsTyCurrentPower = set.getBigDecimal(24);
        if(anObject.techConObjectsTyCurrentPower != null)
          anObject.techConObjectsTyCurrentPower = anObject.techConObjectsTyCurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techConObjectsTyServicesPower = set.getBigDecimal(25);
        if(anObject.techConObjectsTyServicesPower != null)
          anObject.techConObjectsTyServicesPower = anObject.techConObjectsTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.basisTypeCode = set.getInt(26);
		if(set.wasNull())
		   anObject.basisTypeCode = Integer.MIN_VALUE;
        anObject.basisTypeName = set.getString(27);
        anObject.techCondServicesRefCode = set.getInt(28);
		if(set.wasNull())
		   anObject.techCondServicesRefCode = Integer.MIN_VALUE;
        anObject.techCondServicesRefContractNumber = set.getString(29);
        anObject.techCondServicesRefContractDate = set.getDate(30);
        anObject.techCondServicesRefFinContractNumber = set.getString(31);
        anObject.techCondServicesRefFinContractDate = set.getDate(32);
        anObject.techCondServicesRefPartnerName = set.getString(33);
        anObject.techCondServicesRefPartnerCode = set.getString(34);
        anObject.techCondServicesRefFinDocCode = set.getString(35);
        anObject.techCondServicesRefFinDocID = set.getInt(36);
		if(set.wasNull())
		   anObject.techCondServicesRefFinDocID = Integer.MIN_VALUE;
        anObject.techCondServicesRefFinCommentGen = set.getString(37);
        anObject.techCondServicesRefTySummaGen = set.getBigDecimal(38);
        if(anObject.techCondServicesRefTySummaGen != null)
          anObject.techCondServicesRefTySummaGen = anObject.techCondServicesRefTySummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefTySummaVat = set.getBigDecimal(39);
        if(anObject.techCondServicesRefTySummaVat != null)
          anObject.techCondServicesRefTySummaVat = anObject.techCondServicesRefTySummaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefTyServicesSumma = set.getBigDecimal(40);
        if(anObject.techCondServicesRefTyServicesSumma != null)
          anObject.techCondServicesRefTyServicesSumma = anObject.techCondServicesRefTyServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefTyServicesPower = set.getBigDecimal(41);
        if(anObject.techCondServicesRefTyServicesPower != null)
          anObject.techCondServicesRefTyServicesPower = anObject.techCondServicesRefTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefCommentServicesGen = set.getString(42);
        anObject.techCondServicesRefUserGen = set.getString(43);
        anObject.techCondServicesRefDateEdit = set.getDate(44);
        anObject.techCondServicesRefCnPackCode = set.getInt(45);
		if(set.wasNull())
		   anObject.techCondServicesRefCnPackCode = Integer.MIN_VALUE;
        anObject.contragentTypeCode = set.getInt(46);
		if(set.wasNull())
		   anObject.contragentTypeCode = Integer.MIN_VALUE;
        anObject.contragentTypeName = set.getString(47);

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



} // end of ENContragentDAO

