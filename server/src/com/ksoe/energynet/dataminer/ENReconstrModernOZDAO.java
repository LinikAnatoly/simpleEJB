
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

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENReconstrModernOZDAOGen;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ;
import com.ksoe.energynet.valueobject.brief.ENReconstrModernOZShort;
import com.ksoe.energynet.valueobject.lists.ENReconstrModernOZShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;

  /**
  *  DAO Object for ENReconstrModernOZ;  
  * 	
  */

public class ENReconstrModernOZDAO extends ENReconstrModernOZDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENReconstrModernOZDAO() {super();}
  //public ENReconstrModernOZDAO(Connection aConnection) {super(aConnection);}
  //public ENReconstrModernOZDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENReconstrModernOZDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENReconstrModernOZDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  
  public ENReconstrModernOZShortList getScrollableFilteredList(ENReconstrModernOZ aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {   
   ENReconstrModernOZShortList result = new ENReconstrModernOZShortList();
   ENReconstrModernOZShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);
	
   if(orderBy.length() == 0)
    orderBy = "ENRECONSTRMODERNOZ.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
   selectStr = "SELECT "+
    "ENRECONSTRMODERNOZ.CODE"+
    ",ENRECONSTRMODERNOZ.NUMBERGEN"+
    ",ENRECONSTRMODERNOZ.DATEGEN"+
    ",ENRECONSTRMODERNOZ.DATEEDIT"+
    ",ENRECONSTRMODERNOZ.SUMMAGEN"+
    ",ENRECONSTRMODERNOZ.SUMMANDS"+
    ",ENRECONSTRMODERNOZ.CHARACTERISTIC"+
    ",ENRECONSTRMODERNOZ.EXECUTEDPOSITION"+
    ",ENRECONSTRMODERNOZ.EXECUTEDNAME"+
    ",ENRECONSTRMODERNOZ.ACCEPTEDPOSITION"+
    ",ENRECONSTRMODERNOZ.ACCEPTEDNAME"+
    ",ENRECONSTRMODERNOZ.CONTRACTPRICE"+
    ",ENRECONSTRMODERNOZ.CODEMOL"+
    ",ENRECONSTRMODERNOZ.CODEPODR"+
    ",ENRECONSTRMODERNOZ.INVNUMBEROZ"+
    ",ENRECONSTRMODERNOZ.NAMEOZ"+
    ",ENRECONSTRMODERNOZ.FINCONTRACTNUMBER"+
    ",ENRECONSTRMODERNOZ.FINCONTRACTDATE"+
    ",ENRECONSTRMODERNOZ.PARTNERNAME"+
    ",ENRECONSTRMODERNOZ.PARTNERCODE"+
    ",ENRECONSTRMODERNOZ.CHARACTERISTICOS"+
    ",ENRECONSTRMODERNOZ.USERGEN"+

     ", ENDEPARTMENT.CODE " +
     ", ENDEPARTMENT.SHORTNAME " +
     ", ENDEPARTMENT.DATESTART " +
     ", ENDEPARTMENT.DATEFINAL " +
     ", ENDEPARTMENT.SHPZBALANS " +
     ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
     ", ENDEPARTMENT.KAU_1884 " +
     ", ENDEPARTMENT.NAME_1884 " +
     ", ENRECONSTRMODERNOZSTTS.CODE " +
     ", ENRECONSTRMODERNOZSTTS.NAME " +
     ", ENRECOMODTYPEWORK.CODE " +
     ", ENRECOMODTYPEWORK.NAME " +
     ",ENRECONSTRMODERNOZ.TERMUSEFUL"+
     ",ENRECONSTRMODERNOZ.servicesobjectcode"+
     ",ENRECONSTRMODERNOZ.DATEEXPLOITATIONIN"+
	 ",ENRECONSTRMODERNOZ.DATEEXPLOITATIONOUT"+
    " FROM ENRECONSTRMODERNOZ LEFT JOIN ENRECOMODTYPEWORK ON (ENRECOMODTYPEWORK.CODE = ENRECONSTRMODERNOZ.TYPEREFCODE) " +
    ", ENDEPARTMENT " +
    ", ENRECONSTRMODERNOZSTTS " +
    // ", ENRECOMODTYPEWORK " +
    //" WHERE " 
	""; 
    whereStr = " ENDEPARTMENT.CODE = ENRECONSTRMODERNOZ.DEPARTMENTREFCODE" ; //+
     whereStr = whereStr +" AND ENRECONSTRMODERNOZSTTS.CODE = ENRECONSTRMODERNOZ.STATUSREFCODE" ; //+
    // whereStr = whereStr +" AND ENRECOMODTYPEWORK.CODE = ENRECONSTRMODERNOZ.TYPEREFCODE" ; //+
		//selectStr = selectStr + " ${s} ENRECONSTRMODERNOZ.CODE IN ( SELECT ENRECONSTRMODERNOZ.CODE FROM ENRECONSTRMODERNOZ ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENRECONSTRMODERNOZ.CODE = ?";
       }
        if (aFilterObject.numbergen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.NUMBERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.NUMBERGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.dateGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENRECONSTRMODERNOZ.DATEGEN = ?";
       }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENRECONSTRMODERNOZ.DATEEDIT = ?";
       }
       if(aFilterObject.summaGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENRECONSTRMODERNOZ.SUMMAGEN = ?";
       }
       if(aFilterObject.summaNDS != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENRECONSTRMODERNOZ.SUMMAGEN = ?";
       }
        if (aFilterObject.characteristic != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.characteristic.indexOf('*',0) < 0 && aFilterObject.characteristic.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.CHARACTERISTIC) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.CHARACTERISTIC) LIKE UPPER(?)";
        }
        if (aFilterObject.executedPosition != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.executedPosition.indexOf('*',0) < 0 && aFilterObject.executedPosition.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.EXECUTEDPOSITION) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.EXECUTEDPOSITION) LIKE UPPER(?)";
        }
        if (aFilterObject.executedName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.executedName.indexOf('*',0) < 0 && aFilterObject.executedName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.EXECUTEDNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.EXECUTEDNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.acceptedPosition != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.acceptedPosition.indexOf('*',0) < 0 && aFilterObject.acceptedPosition.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.ACCEPTEDPOSITION) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.ACCEPTEDPOSITION) LIKE UPPER(?)";
        }
        if (aFilterObject.acceptedName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.acceptedName.indexOf('*',0) < 0 && aFilterObject.acceptedName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.ACCEPTEDNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.ACCEPTEDNAME) LIKE UPPER(?)";
        }
       if(aFilterObject.contractPrice != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENRECONSTRMODERNOZ.CONTRACTPRICE = ?";
       }
        if (aFilterObject.codeMol != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.codeMol.indexOf('*',0) < 0 && aFilterObject.codeMol.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.CODEMOL) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.CODEMOL) LIKE UPPER(?)";
        }
        if (aFilterObject.codePodr != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.codePodr.indexOf('*',0) < 0 && aFilterObject.codePodr.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.CODEPODR) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.CODEPODR) LIKE UPPER(?)";
        }
        if (aFilterObject.invNumberOZ != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.invNumberOZ.indexOf('*',0) < 0 && aFilterObject.invNumberOZ.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.INVNUMBEROZ) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.INVNUMBEROZ) LIKE UPPER(?)";
        }
        if (aFilterObject.nameOZ != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.nameOZ.indexOf('*',0) < 0 && aFilterObject.nameOZ.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.NAMEOZ) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.NAMEOZ) LIKE UPPER(?)";
        }
        if (aFilterObject.finContractNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finContractNumber.indexOf('*',0) < 0 && aFilterObject.finContractNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.FINCONTRACTNUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.FINCONTRACTNUMBER) LIKE UPPER(?)";
        }
       if(aFilterObject.finContractDate != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENRECONSTRMODERNOZ.FINCONTRACTDATE = ?";
       }
        if (aFilterObject.partnerName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.partnerName.indexOf('*',0) < 0 && aFilterObject.partnerName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.PARTNERNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.PARTNERNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.partnerCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.PARTNERCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.PARTNERCODE) LIKE UPPER(?)";
        }
        if (aFilterObject.characteristicOS != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.characteristicOS.indexOf('*',0) < 0 && aFilterObject.characteristicOS.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.CHARACTERISTICOS) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.CHARACTERISTICOS) LIKE UPPER(?)";
        }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.USERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.USERGEN) LIKE UPPER(?)";
        }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENRECONSTRMODERNOZ.DOMAIN_INFO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENRECONSTRMODERNOZ.DOMAIN_INFO) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENRECONSTRMODERNOZ.MODIFY_TIME = ?";
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENRECONSTRMODERNOZ.DEPARTMENTREFCODE = ? ";
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENRECONSTRMODERNOZ.STATUSREFCODE = ? ";
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENRECONSTRMODERNOZ.TYPEREFCODE = ? ";
       }

     }

	  
   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENReconstrModernOZ.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENReconstrModernOZ.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("ENRECONSTRMODERNOZ",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND ENRECONSTRMODERNOZ.DOMAIN_INFO IS NOT NULL";
   //else
	  if (whereStr.length() == 0) 
	     whereStr = domainWhereStr;
	  else
	     whereStr = " "+whereStr + " AND " +domainWhereStr;
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

	selectStr = selectStr + " OFFSET " + fromPosition;
	if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }

          if(aFilterObject.numbergen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.numbergen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.dateGen != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
       }
       if(aFilterObject.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
       }
       if(aFilterObject.summaGen != null){
           number++;
           aFilterObject.summaGen = aFilterObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.summaGen);
       }

          if(aFilterObject.characteristic != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.characteristic);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.executedPosition != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.executedPosition);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.executedName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.executedName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.acceptedPosition != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.acceptedPosition);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.acceptedName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.acceptedName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.contractPrice != null){
           number++;
           aFilterObject.contractPrice = aFilterObject.contractPrice.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.contractPrice);
       }

          if(aFilterObject.codeMol != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.codeMol);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.codePodr != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.codePodr);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.invNumberOZ != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.invNumberOZ);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.nameOZ != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.nameOZ);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.finContractNumber != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.finContractNumber);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.finContractDate != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.finContractDate.getTime()));
       }

          if(aFilterObject.partnerName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.partnerName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.partnerCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.partnerCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
          if(aFilterObject.characteristicOS != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.characteristicOS);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
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

          if(aFilterObject.domain_info != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.domain_info);
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
      if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.departmentRef.code);
      }
      if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.statusRef.code);
      }
      if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.typeRef.code);
      }
     }

     if(condition.length() > 0 && aBindObjects != null)
      _bindObjectsToPreparedStatement(statement,aBindObjects,number);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++) {
       anObject = new ENReconstrModernOZShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.numbergen = set.getString(2);
       anObject.dateGen = set.getDate(3);
       anObject.dateEdit = set.getDate(4);
       anObject.summaGen = set.getBigDecimal(5);
       if(anObject.summaGen != null)
           anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.summaNDS = set.getBigDecimal(6);
       if(anObject.summaNDS != null)
           anObject.summaNDS = anObject.summaNDS.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.characteristic = set.getString(7);
       anObject.executedPosition = set.getString(8);
       anObject.executedName = set.getString(9);
       anObject.acceptedPosition = set.getString(10);
       anObject.acceptedName = set.getString(11);
       anObject.contractPrice = set.getBigDecimal(12);
       if(anObject.contractPrice != null)
           anObject.contractPrice = anObject.contractPrice.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.codeMol = set.getString(13);
       anObject.codePodr = set.getString(14);
       anObject.invNumberOZ = set.getString(15);
       anObject.nameOZ = set.getString(16);
       anObject.finContractNumber = set.getString(17);
       anObject.finContractDate = set.getDate(18);
       anObject.partnerName = set.getString(19);
       anObject.partnerCode = set.getString(20);
       anObject.characteristicOS = set.getString(21);
       anObject.userGen = set.getString(22);

       anObject.departmentRefCode = set.getInt(23);
		if(set.wasNull())
		   anObject.departmentRefCode = Integer.MIN_VALUE;		
       anObject.departmentRefShortName = set.getString(24);
       anObject.departmentRefDateStart = set.getDate(25);
       anObject.departmentRefDateFinal = set.getDate(26);
       anObject.departmentRefShpzBalans = set.getString(27);
       anObject.departmentRefKau_table_id_1884 = set.getInt(28);
		if(set.wasNull())
		   anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;		
       anObject.departmentRefKau_1884 = set.getString(29);
       anObject.departmentRefName_1884 = set.getString(30);
       anObject.statusRefCode = set.getInt(31);
		if(set.wasNull())
		   anObject.statusRefCode = Integer.MIN_VALUE;		
       anObject.statusRefName = set.getString(32);
       anObject.typeRefCode = set.getInt(33);
		if(set.wasNull())
		   anObject.typeRefCode = Integer.MIN_VALUE;		
       anObject.typeRefName = set.getString(34);
       
       anObject.termUseful = set.getInt(35);
		if ( set.wasNull() ) {
			anObject.termUseful = Integer.MIN_VALUE;
		}
		
		anObject.servicesobjectCode = set.getInt(36);
		if ( set.wasNull() ) {
			anObject.servicesobjectCode = Integer.MIN_VALUE;
		}
		
		anObject.dateExploitationIn = set.getDate(37);
		anObject.dateExploitationOut = set.getDate(38);

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

	public ENReconstrModernOZ getObjectNOSEGR(int uid) throws PersistenceException {
		ENReconstrModernOZ result = new ENReconstrModernOZ();
		result.code = uid;
		loadObject(result, true);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

  public void updateSumGenAndNDS(ENReconstrModernOZ anObject) throws PersistenceException
  {
  	Connection connection = getConnection();

		String updRm =
	        "UPDATE ENReconstrModernOZ SET summagen = ? , summands = ? " +  
	        " WHERE CODE = ? ";

		PreparedStatement statement = null;

		try
		{
			statement = connection.prepareStatement(updRm);

		    if (anObject.summaGen == null)
		        statement.setBigDecimal(1,null);
		    else
		        statement.setBigDecimal(1,anObject.summaGen);

		    if (anObject.summaNDS == null)
		        statement.setBigDecimal(2,null);
		    else
		        statement.setBigDecimal(2,anObject.summaNDS);

		    statement.setInt(3,anObject.code);

		    statement.execute();
		}
	  	catch(SQLException e)
	  	{
	  	  System.out.println(e.getMessage()+"\nstatement - " + updRm + "\n rmCode = " + anObject.code);
	  	  EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	  	}
	    finally
	    {
	     try {if (statement != null) statement.close();} catch (SQLException e) {}
	     statement = null;
	    }
  }
  
  public void setContractpriceAsSummaGen(ENReconstrModernOZ anObject) throws PersistenceException
  {
  	Connection connection = getConnection();

		String updRm =
	        "UPDATE ENReconstrModernOZ SET contractprice = summagen " +  
	        " WHERE CODE = ? ";

		PreparedStatement statement = null;

		try
		{
			statement = connection.prepareStatement(updRm);

		    statement.setInt(1,anObject.code);

		    statement.execute();
		}
	  	catch(SQLException e)
	  	{
	  	  System.out.println(e.getMessage()+"\nstatement - " + updRm + "\n rmCode = " + anObject.code);
	  	  EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	  	}
	    finally
	    {
	     try {if (statement != null) statement.close();} catch (SQLException e) {}
	     statement = null;
	    }
  }
  
  /* апдейт номера и даты договора , кода и наименования партнера , типа работ */
  public void updateContractPartnerType(ENReconstrModernOZ anObject) throws PersistenceException
  {
  	Connection connection = getConnection();

		String updRm =
	        "UPDATE ENReconstrModernOZ SET finContractNumber = ? , finContractDate = ?  , partnerCode =  ?  , partnerName = ?  ,  typerefcode =  ? " +  
	        " WHERE CODE = ? ";

		PreparedStatement statement = null;

		try
		{
			statement = connection.prepareStatement(updRm);

			statement.setString(1,anObject.finContractNumber);
			
			if (anObject.finContractDate == null)
		        statement.setDate(2,null);
		    else
		        statement.setDate(2,new java.sql.Date(anObject.finContractDate.getTime()));
			
			statement.setString(3,anObject.partnerCode);
			statement.setString(4,anObject.partnerName);
			statement.setInt(5,anObject.typeRef.code);
          
		    statement.setInt(6,anObject.code);

		    statement.execute();
		}
	  	catch(SQLException e)
	  	{
	  	  System.out.println(e.getMessage()+"\nstatement - " + updRm + "\n rmCode = " + anObject.code);
	  	  EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	  	}
	    finally
	    {
	     try {if (statement != null) statement.close();} catch (SQLException e) {}
	     statement = null;
	    }
  }
  
  
  
  /* апдейт поля характеристика объекта до проведения доввода */
  public void updateCharacteristicsOs(ENReconstrModernOZ anObject) throws PersistenceException
  {
  	Connection connection = getConnection();

		String updRm =
	        "UPDATE ENReconstrModernOZ SET characteristicos = ? " +  
	        " WHERE CODE = ? ";

		PreparedStatement statement = null;

		try
		{
			statement = connection.prepareStatement(updRm);

			statement.setString(1,anObject.characteristicOS);			
          
		    statement.setInt(2,anObject.code);

		    statement.execute();
		}
	  	catch(SQLException e)
	  	{
	  	  System.out.println(e.getMessage()+"\nstatement - " + updRm + "\n rmCode = " + anObject.code);
	  	  EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	  	}
	    finally
	    {
	     try {if (statement != null) statement.close();} catch (SQLException e) {}
	     statement = null;
	    }
  }


  
  /* апдейт номера и даты договора , кода и наименования партнера , типа работ */
  public void updateTypeOZ(int rmCode , int rmTypeCode) throws PersistenceException
  {
  	Connection connection = getConnection();

		String updRm =
	        "UPDATE ENReconstrModernOZ SET typerefcode = ? " +  
	        " WHERE CODE = ? ";

		PreparedStatement statement = null;

		try
		{
			statement = connection.prepareStatement(updRm);

			statement.setInt(1,rmTypeCode);
			statement.setInt(2,rmCode);	
			

		    statement.execute();
		}
	  	catch(SQLException e)
	  	{
	  	  System.out.println(e.getMessage()+"\nstatement - " + updRm + "\n rmCode = " + rmCode);
	  	  EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	  	}
	    finally
	    {
	     try {if (statement != null) statement.close();} catch (SQLException e) {}
	     statement = null;
	    }
  }



} // end of ENReconstrModernOZDAO

