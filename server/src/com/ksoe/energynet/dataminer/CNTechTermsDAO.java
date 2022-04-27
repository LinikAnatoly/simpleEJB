
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.CNTechTermsDAOGen;
import com.ksoe.energynet.valueobject.CNSubsystemType;
import com.ksoe.energynet.valueobject.CNTechTerms;
import com.ksoe.energynet.valueobject.brief.CNTechTermsShort;
import com.ksoe.energynet.valueobject.lists.CNTechTermsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for CNTechTerms;
  *
  */

public class CNTechTermsDAO extends CNTechTermsDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public CNTechTermsDAO() {super();}
  //public CNTechTermsDAO(Connection aConnection) {super(aConnection);}
  //public CNTechTermsDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public CNTechTermsDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public CNTechTermsDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  @Override
  public CNTechTermsShortList getScrollableFilteredList(CNTechTerms aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    CNTechTermsShortList result = new CNTechTermsShortList();
    CNTechTermsShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";

    String ssPrefix = null;
    String purpField = null;
    switch (aFilterObject.subsystemRef.code) {
    case CNSubsystemType.SS_CONNECTION: //Присоединение
        {
        ssPrefix = "cn";
        purpField = "purpose";
        break;
        }
    case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
        {
        ssPrefix = "ncn";
        purpField = "purpose";
        break;
        }
    case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
        {
        ssPrefix = "cn_20110314";
        purpField = "description";
        break;
        }
    case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
        {
        ssPrefix = "eap";
        purpField = "description";
        break;
        }
	case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
		{
		  ssPrefix = "adso";
		  purpField = "description";
	      break;
		}
    default:
        {
        throw new EnergyproSystemException("Неизвестна подсистема EnergyWorkFlow");
        }
    }

    String     condition = processCondition(anCondition, aFilterObject.subsystemRef.code);
    String     orderBy = processCondition(anOrderBy, aFilterObject.subsystemRef.code);

    if(orderBy.length() == 0)
     orderBy = ssPrefix + "_TECHTERMS.ID";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
      ssPrefix + "_TECHTERMS.ID, " +
      ssPrefix + "_TECHTERMS.ID_PROPOSAL, " +

      "(SELECT NAME FROM CN.CN_PROPOSAL " +
      "  WHERE CN.CN_PROPOSAL.ID = " + ssPrefix + "_TECHTERMS.ID" +
      ") AS PROPOSALNAME, " +

      ssPrefix + "_TECHTERMS.POWER1, " +
      ssPrefix + "_TECHTERMS.POW1PROSP, " +
      ssPrefix + "_TECHTERMS.POW1HEAT, " +
      ssPrefix + "_TECHTERMS.POWER2, " +
      ssPrefix + "_TECHTERMS.POW2PROSP, " +
      ssPrefix + "_TECHTERMS.POW2HEAT, " +
      ssPrefix + "_TECHTERMS.POWER3, " +
      ssPrefix + "_TECHTERMS.POW3PROSP, " +
      ssPrefix + "_TECHTERMS.POW3HEAT, " +
      ssPrefix + "_TECHTERMS.POW_STOVE, " +
      ssPrefix + "_TECHTERMS.POW_WATER_HEAT, " +
      ssPrefix + "_TECHTERMS.POW_HOUSE_HEAT, " +
      ssPrefix + "_TECHTERMS.TENSION_POINT, " +
      ssPrefix + "_TECHTERMS.CURRENT_AUTOMAT, " +
      ssPrefix + "_TECHTERMS.POW_EXIST, " +
      ssPrefix + "_TECHTERMS.TENSION_EXIST, " +
      ssPrefix + "_TECHTERMS.IS_REALIZED, " +
      ssPrefix + "_TECHTERMS.REASON, " +
      ssPrefix + "_TECHTERMS.SOURCE, " +
      ssPrefix + "_TECHTERMS.SOURCE_NUM, " +
      ssPrefix + "_TECHTERMS.ENSUR_POINT, " +
      ssPrefix + "_TECHTERMS.ENSUR_POINT_NUM, " +
      ssPrefix + "_TECHTERMS.CONNECT_POINT, " +
      ssPrefix + "_TECHTERMS.CONNECT_POINT_NUM, " +
      ssPrefix + "_TECHTERMS.EXPLOIT_YEAR, " +
      ssPrefix + "_TECHTERMS.BASESTATION, " +

      aFilterObject.subsystemRef.code + " AS SUBSYSTEMTYPECODE, " +

      "CASE " + aFilterObject.subsystemRef.code +
      "  WHEN " + CNSubsystemType.SS_CONNECTION +
      "    THEN 'ПРИСОЕДИНЕНИЕ'" +
      "  WHEN " + CNSubsystemType.SS_NEWCONNECTION +
      "    THEN 'ПРИСОЕДИНЕНИЕ с 01.08.2010'" +
      "  WHEN " + CNSubsystemType.SS_CONNECTION_20110314 +
      "    THEN 'ПРИСОЕДИНЕНИЕ с 14.03.2011'" +
      "  WHEN " + CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER +
      "    THEN 'ПРИСОЕДИНЕНИЕ с 01.03.2013'" +
      "END AS SUBSYSTEMTYPENAME, " +

      ssPrefix + "_TECHTERMS.ID_PACK AS PACKCODE, " +
      ssPrefix + "_PACKAGES.NAME, " +
      ssPrefix + "_PACKAGES.ID_REN, " +

      "(SELECT NAME FROM CN.CN_REN " +
      "  WHERE CN.CN_REN.ID = CN." + ssPrefix + "_PACKAGES.ID_REN" +
      ") AS RENNAME, " +

      ssPrefix + "_PACKAGES.ID_DISTRICT, " +

      "(SELECT NAME FROM CN.DISTRICTS " +
      "  WHERE CN.DISTRICTS.ID = CN." + ssPrefix + "_PACKAGES.ID_DISTRICT" +
      ") AS DISTRICTNAME, " +


      ssPrefix + "_PACKAGES.ID_PACK_STATUS, " +

      "(SELECT NAME FROM CN.CN_PACK_STATUS " +
      "  WHERE CN.CN_PACK_STATUS.ID = " + ssPrefix + "_PACKAGES.ID_PACK_STATUS" +
      ") AS STATUSNAME, " +

      ssPrefix + "_PACKAGES." + purpField + ", " +
      ssPrefix + "_PACKAGES.POWER, " +
      ssPrefix + "_PACKAGES.ADRES AS ADDRESS, " +
      ssPrefix + "_PACKAGES.REG_NUM_CN_CONTRACT, " +
      ssPrefix + "_PACKAGES.DATE_CN_CONTRACT, " +
      ssPrefix + "_PACKAGES.REG_NUM_TU_CONTRACT, " +
      ssPrefix + "_PACKAGES.DATE_TU_CONTRACT, " +
      ssPrefix + "_PACKAGES.REG_NUM_TU_CREATION_CONTRACT, " +
      ssPrefix + "_PACKAGES.DATE_TU_CREATION_CONTRACT, " +
      ssPrefix + "_PACKAGES.PROJECT_NUM, " +
      ssPrefix + "_PACKAGES.PROJECT_DATE, " +
      ssPrefix + "_PACKAGES.OVER5, " +
      ssPrefix + "_PACKAGES.STATUS, " +
      ssPrefix + "_PACKAGES.LETTER_NUM_CUSTOMER, " +
      ssPrefix + "_PACKAGES.DATE_LETTER_CUSTOMER, " +
      ssPrefix + "_PACKAGES.LETTER_NUM , " +
      ssPrefix + "_PACKAGES.DATE_LETTER, " +
      ssPrefix + "_PACKAGES.RELIABILITY_CLASS, " +
      ssPrefix + "_PACKAGES.ID_WAITING_STATUS, " +

      "(SELECT NAME FROM CN.CN_WAITING_STATUS " +
      "  WHERE CN.CN_WAITING_STATUS.ID = " + ssPrefix + "_PACKAGES.ID_WAITING_STATUS " +
      ") AS WAITINGSTATUS, " +

      ssPrefix + "_PACKAGES.IS_PAYABLE, " +
      ssPrefix + "_PACKAGES.WORKSIZE, " +
      ssPrefix + "_PACKAGES.WORK_INC_NET, " +
      //ssPrefix + "_PACKAGES.BUSINESS_TYPE, " +
      ssPrefix + "_PACKAGES.ESTIMATETERM, " +
      ssPrefix + "_PACKAGES.ESTIMATEDATE, " +
      ssPrefix + "_PACKAGES.BUILDINGTERM, " +
      ssPrefix + "_PACKAGES.BUILDINGDATE, " +
      ssPrefix + "_PACKAGES.BUYINGTERM, " +
      ssPrefix + "_PACKAGES.BUYINGDATE, " +
      ssPrefix + "_PACKAGES.ESTIMATE_NUM, " +
      ssPrefix + "_PACKAGES.ESTIMATE_CONTRACT_DATE, " +
      ssPrefix + "_PACKAGES.IS_RESERV " +

      " FROM CN." + ssPrefix + "_TECHTERMS, CN." + ssPrefix + "_PACKAGES ";

      whereStr = " CN. " + ssPrefix + "_PACKAGES.ID = CN." + ssPrefix + "_TECHTERMS.ID_PACK" ;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.ID = ?";
        }
        if(aFilterObject.id_proposal != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.ID_PROPOSAL = ?";
        }

        /*if (aFilterObject.proposalName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.proposalName.indexOf('*',0) < 0 && aFilterObject.proposalName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNTECHTERMS.PROPOSALNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNTECHTERMS.PROPOSALNAME) LIKE UPPER(?)";
         }*/

        if(aFilterObject.power1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.POWER1 = ?";
        }
        if(aFilterObject.power1prosp != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.POW1PROSP = ?";
        }
        if(aFilterObject.power1heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.POW1HEAT = ?";
        }
        if(aFilterObject.power2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.POWER2 = ?";
        }
        if(aFilterObject.power2prosp != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.POW2PROSP = ?";
        }
        if(aFilterObject.power2heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.POW2HEAT = ?";
        }
        if(aFilterObject.power3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.POWER3 = ?";
        }
        if(aFilterObject.power3prosp != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.POW3PROSP = ?";
        }
        if(aFilterObject.power3heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.POW3HEAT = ?";
        }
        if(aFilterObject.pow_stove != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.POW_STOVE = ?";
        }
        if(aFilterObject.pow_water_heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.POW_WATER_HEAT = ?";
        }
        if(aFilterObject.pow_house_heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.POW_HOUSE_HEAT = ?";
        }
        if(aFilterObject.tension_point != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.TENSION_POINT = ?";
        }
        if(aFilterObject.current_automat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.CURRENT_AUTOMAT = ?";
        }
        if(aFilterObject.pow_exist != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.POW_EXIST = ?";
        }
        if(aFilterObject.tension_exist != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.TENSION_EXIST = ?";
        }
        if(aFilterObject.is_realized != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.IS_REALIZED = ?";
        }
         if (aFilterObject.reason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reason.indexOf('*',0) < 0 && aFilterObject.reason.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(" + ssPrefix + "_TECHTERMS.REASON) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(" + ssPrefix + "_TECHTERMS.REASON) LIKE UPPER(?)";
         }
         if (aFilterObject.source != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.source.indexOf('*',0) < 0 && aFilterObject.source.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(" + ssPrefix + "_TECHTERMS.SOURCE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(" + ssPrefix + "_TECHTERMS.SOURCE) LIKE UPPER(?)";
         }
         if (aFilterObject.source_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.source_num.indexOf('*',0) < 0 && aFilterObject.source_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(" + ssPrefix + "_TECHTERMS.SOURCE_NUM) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(" + ssPrefix + "_TECHTERMS.SOURCE_NUM) LIKE UPPER(?)";
         }
         if (aFilterObject.ensur_point != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.ensur_point.indexOf('*',0) < 0 && aFilterObject.ensur_point.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(" + ssPrefix + "_TECHTERMS.ENSUR_POINT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(" + ssPrefix + "_TECHTERMS.ENSUR_POINT) LIKE UPPER(?)";
         }
         if (aFilterObject.ensur_point_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.ensur_point_num.indexOf('*',0) < 0 && aFilterObject.ensur_point_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(" + ssPrefix + "_TECHTERMS.ENSUR_POINT_NUM) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(" + ssPrefix + "_TECHTERMS.ENSUR_POINT_NUM) LIKE UPPER(?)";
         }
         if (aFilterObject.connect_point != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.connect_point.indexOf('*',0) < 0 && aFilterObject.connect_point.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(" + ssPrefix + "_TECHTERMS.CONNECT_POINT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(" + ssPrefix + "_TECHTERMS.CONNECT_POINT) LIKE UPPER(?)";
         }
         if (aFilterObject.connect_point_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.connect_point_num.indexOf('*',0) < 0 && aFilterObject.connect_point_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(" + ssPrefix + "_TECHTERMS.CONNECT_POINT_NUM) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(" + ssPrefix + "_TECHTERMS.CONNECT_POINT_NUM) LIKE UPPER(?)";
         }
        if(aFilterObject.exploit_year != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.EXPLOIT_YEAR = ?";
        }
        if(aFilterObject.baseStation != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.BASESTATION = ?";
        }
        /*if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNTECHTERMS.SUBSYSTEMREFCODE = ? ";
        }*/

        if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " " + ssPrefix + "_TECHTERMS.ID_PACK = ? ";
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
         if(aFilterObject.id_proposal != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_proposal);
         }

           if(aFilterObject.proposalName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.proposalName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.power1 != null){
            number++;
            aFilterObject.power1 = aFilterObject.power1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1);
        }
        if(aFilterObject.power1prosp != null){
            number++;
            aFilterObject.power1prosp = aFilterObject.power1prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1prosp);
        }
        if(aFilterObject.power1heat != null){
            number++;
            aFilterObject.power1heat = aFilterObject.power1heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1heat);
        }
        if(aFilterObject.power2 != null){
            number++;
            aFilterObject.power2 = aFilterObject.power2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2);
        }
        if(aFilterObject.power2prosp != null){
            number++;
            aFilterObject.power2prosp = aFilterObject.power2prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2prosp);
        }
        if(aFilterObject.power2heat != null){
            number++;
            aFilterObject.power2heat = aFilterObject.power2heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2heat);
        }
        if(aFilterObject.power3 != null){
            number++;
            aFilterObject.power3 = aFilterObject.power3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power3);
        }
        if(aFilterObject.power3prosp != null){
            number++;
            aFilterObject.power3prosp = aFilterObject.power3prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power3prosp);
        }
        if(aFilterObject.power3heat != null){
            number++;
            aFilterObject.power3heat = aFilterObject.power3heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power3heat);
        }
        if(aFilterObject.pow_stove != null){
            number++;
            aFilterObject.pow_stove = aFilterObject.pow_stove.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_stove);
        }
        if(aFilterObject.pow_water_heat != null){
            number++;
            aFilterObject.pow_water_heat = aFilterObject.pow_water_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_water_heat);
        }
        if(aFilterObject.pow_house_heat != null){
            number++;
            aFilterObject.pow_house_heat = aFilterObject.pow_house_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_house_heat);
        }
        if(aFilterObject.tension_point != null){
            number++;
            aFilterObject.tension_point = aFilterObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tension_point);
        }
        if(aFilterObject.current_automat != null){
            number++;
            aFilterObject.current_automat = aFilterObject.current_automat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.current_automat);
        }
        if(aFilterObject.pow_exist != null){
            number++;
            aFilterObject.pow_exist = aFilterObject.pow_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_exist);
        }
        if(aFilterObject.tension_exist != null){
            number++;
            aFilterObject.tension_exist = aFilterObject.tension_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tension_exist);
        }
         if(aFilterObject.is_realized != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_realized);
         }

           if(aFilterObject.reason != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reason);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.source != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.source);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.source_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.source_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.ensur_point != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.ensur_point);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.ensur_point_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.ensur_point_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.connect_point != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.connect_point);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.connect_point_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.connect_point_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.exploit_year != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.exploit_year);
         }
         if(aFilterObject.baseStation != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.baseStation);
         }
       /*if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }*/
       if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cnPackRef.code);
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

        anObject = new CNTechTermsShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.id_proposal = set.getInt(2);
        if ( set.wasNull() )
            anObject.id_proposal = Integer.MIN_VALUE;
        anObject.proposalName = set.getString(3);
        anObject.power1 = set.getBigDecimal(4);
        if(anObject.power1 != null)
            anObject.power1 = anObject.power1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power1prosp = set.getBigDecimal(5);
        if(anObject.power1prosp != null)
            anObject.power1prosp = anObject.power1prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power1heat = set.getBigDecimal(6);
        if(anObject.power1heat != null)
            anObject.power1heat = anObject.power1heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2 = set.getBigDecimal(7);
        if(anObject.power2 != null)
            anObject.power2 = anObject.power2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2prosp = set.getBigDecimal(8);
        if(anObject.power2prosp != null)
            anObject.power2prosp = anObject.power2prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2heat = set.getBigDecimal(9);
        if(anObject.power2heat != null)
            anObject.power2heat = anObject.power2heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power3 = set.getBigDecimal(10);
        if(anObject.power3 != null)
            anObject.power3 = anObject.power3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power3prosp = set.getBigDecimal(11);
        if(anObject.power3prosp != null)
            anObject.power3prosp = anObject.power3prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power3heat = set.getBigDecimal(12);
        if(anObject.power3heat != null)
            anObject.power3heat = anObject.power3heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_stove = set.getBigDecimal(13);
        if(anObject.pow_stove != null)
            anObject.pow_stove = anObject.pow_stove.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_water_heat = set.getBigDecimal(14);
        if(anObject.pow_water_heat != null)
            anObject.pow_water_heat = anObject.pow_water_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_house_heat = set.getBigDecimal(15);
        if(anObject.pow_house_heat != null)
            anObject.pow_house_heat = anObject.pow_house_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tension_point = set.getBigDecimal(16);
        if(anObject.tension_point != null)
            anObject.tension_point = anObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.current_automat = set.getBigDecimal(17);
        if(anObject.current_automat != null)
            anObject.current_automat = anObject.current_automat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_exist = set.getBigDecimal(18);
        if(anObject.pow_exist != null)
            anObject.pow_exist = anObject.pow_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tension_exist = set.getBigDecimal(19);
        if(anObject.tension_exist != null)
            anObject.tension_exist = anObject.tension_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.is_realized = set.getInt(20);
        if ( set.wasNull() )
            anObject.is_realized = Integer.MIN_VALUE;
        anObject.reason = set.getString(21);
        anObject.source = set.getString(22);
        anObject.source_num = set.getString(23);
        anObject.ensur_point = set.getString(24);
        anObject.ensur_point_num = set.getString(25);
        anObject.connect_point = set.getString(26);
        anObject.connect_point_num = set.getString(27);
        anObject.exploit_year = set.getInt(28);
        if ( set.wasNull() )
            anObject.exploit_year = Integer.MIN_VALUE;
        anObject.baseStation = set.getInt(29);
        if ( set.wasNull() )
            anObject.baseStation = Integer.MIN_VALUE;

        anObject.subsystemRefCode = set.getInt(30);
        if(set.wasNull())
        anObject.subsystemRefCode = Integer.MIN_VALUE;
        anObject.subsystemRefName = set.getString(31);

        /*anObject.cnPackRefCode = set.getInt(32);
        if(set.wasNull())
        anObject.cnPackRefCode = Integer.MIN_VALUE;*/

        anObject.cnPackRefPackCode = set.getInt(32);
        if(set.wasNull())
        anObject.cnPackRefPackCode = Integer.MIN_VALUE;
        anObject.cnPackRefName = set.getString(33);
        anObject.cnPackRefId_ren = set.getInt(34);
        if(set.wasNull())
        anObject.cnPackRefId_ren = Integer.MIN_VALUE;
        anObject.cnPackRefRenName = set.getString(35);
        anObject.cnPackRefId_district = set.getInt(36);
        if(set.wasNull())
        anObject.cnPackRefId_district = Integer.MIN_VALUE;
        anObject.cnPackRefDistrictName = set.getString(37);
        anObject.cnPackRefId_pack_status = set.getInt(38);
        if(set.wasNull())
        anObject.cnPackRefId_pack_status = Integer.MIN_VALUE;
        anObject.cnPackRefStatusName = set.getString(39);
        anObject.cnPackRefDescription = set.getString(40);
        anObject.cnPackRefPower = set.getBigDecimal(41);
        if(anObject.cnPackRefPower != null)
          anObject.cnPackRefPower = anObject.cnPackRefPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.cnPackRefAddress = set.getString(42);

        //anObject.cnPackRefAddress_jur = set.getString(44);

        anObject.cnPackRefReg_num_cn_contract = set.getString(43);
        anObject.cnPackRefDate_cn_contract = set.getDate(44);

        /*anObject.cnPackRefReg_num_spl_pp_contract = set.getString(47);
        anObject.cnPackRefDate_spl_pp_contract = set.getDate(48);*/

        anObject.cnPackRefReg_num_tu_contract = set.getString(45);
        anObject.cnPackRefDate_tu_contract = set.getDate(46);
        anObject.cnPackRefReg_num_tu_cr_contract = set.getString(47);
        anObject.cnPackRefDate_tu_cr_contract = set.getDate(48);
        anObject.cnPackRefProject_num = set.getString(49);
        anObject.cnPackRefProject_date = set.getDate(50);

        anObject.cnPackRefOver5 = set.getInt(51);
        if(set.wasNull())
        anObject.cnPackRefOver5 = Integer.MIN_VALUE;
        anObject.cnPackRefStatus = set.getInt(52);
        if(set.wasNull())
        anObject.cnPackRefStatus = Integer.MIN_VALUE;
        anObject.cnPackRefLetter_num_customer = set.getString(53);
        anObject.cnPackRefDate_letter_customer = set.getDate(54);
        anObject.cnPackRefLetter_num = set.getString(55);
        anObject.cnPackRefDate_letter = set.getDate(56);
        anObject.cnPackRefReliability_class = set.getString(57);
        anObject.cnPackRefId_waiting_status = set.getInt(58);
        if(set.wasNull())
        anObject.cnPackRefId_waiting_status = Integer.MIN_VALUE;
        anObject.cnPackRefWaitingStatus = set.getString(59);
        anObject.cnPackRefIs_payable = set.getInt(60);
        if(set.wasNull())
        anObject.cnPackRefIs_payable = Integer.MIN_VALUE;
        anObject.cnPackRefWorksize = set.getString(61);
        anObject.cnPackRefWork_inc_net = set.getString(62);
        //anObject.cnPackRefBusiness_type = set.getString(63);
        anObject.cnPackRefEstimateterm = set.getInt(63);
        if(set.wasNull())
        anObject.cnPackRefEstimateterm = Integer.MIN_VALUE;
        anObject.cnPackRefEstimatedate = set.getDate(64);
        anObject.cnPackRefBuildingterm = set.getInt(65);
        if(set.wasNull())
        anObject.cnPackRefBuildingterm = Integer.MIN_VALUE;
        anObject.cnPackRefBuildingdate = set.getDate(66);
        anObject.cnPackRefBuyingterm = set.getInt(67);
        if(set.wasNull())
        anObject.cnPackRefBuyingterm = Integer.MIN_VALUE;
        anObject.cnPackRefBuyingdate = set.getDate(68);
        anObject.cnPackRefEstimate_num = set.getString(69);
        anObject.cnPackRefEstimate_contract_date = set.getDate(70);
        anObject.cnPackRefIs_reserv = set.getInt(71);
        if(set.wasNull())
        anObject.cnPackRefIs_reserv = Integer.MIN_VALUE;

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

  public CNTechTerms getObjectByPackAndSubsystemID(int packID, int ssID) throws PersistenceException
  {
   CNTechTerms result = new CNTechTerms();
   result.cnPackRef.code = packID;
   result.subsystemRef.code = ssID;
   loadObjectByPackAndSubsystemID(result);
   if(result.code == Integer.MIN_VALUE)
    return null;
   return result;
  }

  public void loadObjectByPackAndSubsystemID(CNTechTerms anObject) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet set = null;

   String ssPrefix = null;
   switch (anObject.subsystemRef.code) {
    case CNSubsystemType.SS_CONNECTION: //Присоединение
        {
        ssPrefix = "cn";
        break;
        }
    case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
        {
        ssPrefix = "ncn";
        break;
        }
    case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
        {
        ssPrefix = "cn_20110314";
        break;
        }
    case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
        {
        ssPrefix = "eap";
        break;
        }
	case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
		{
		ssPrefix = "adso";
	    break;
		}
    default:
        {
        throw new EnergyproSystemException("Неизвестна подсистема EnergyWorkFlow");
        }
    }

   selectStr =  "SELECT " +
     "CN." + ssPrefix + "_TECHTERMS.ID, " +
     "CN." + ssPrefix + "_TECHTERMS.ID_PROPOSAL, " +
     "(SELECT NAME FROM CN.CN_PROPOSAL " +
     "  WHERE ID = CN." + ssPrefix + "_TECHTERMS.ID_PROPOSAL " +
     ") AS PROPOSALNAME, " +
     "CN." + ssPrefix + "_TECHTERMS.POWER1, " +
     "CN." + ssPrefix + "_TECHTERMS.POW1PROSP, " +
     "CN." + ssPrefix + "_TECHTERMS.POW1HEAT, " +
     "CN." + ssPrefix + "_TECHTERMS.POWER2, " +
     "CN." + ssPrefix + "_TECHTERMS.POW2PROSP, " +
     "CN." + ssPrefix + "_TECHTERMS.POW2HEAT, " +
     "CN." + ssPrefix + "_TECHTERMS.POWER3, " +
     "CN." + ssPrefix + "_TECHTERMS.POW3PROSP, " +
     "CN." + ssPrefix + "_TECHTERMS.POW3HEAT, " +
     "CN." + ssPrefix + "_TECHTERMS.POW_STOVE, " +
     "CN." + ssPrefix + "_TECHTERMS.POW_WATER_HEAT, " +
     "CN." + ssPrefix + "_TECHTERMS.POW_HOUSE_HEAT, " +
     "CN." + ssPrefix + "_TECHTERMS.TENSION_POINT, " +
     "CN." + ssPrefix + "_TECHTERMS.CURRENT_AUTOMAT, " +
     "CN." + ssPrefix + "_TECHTERMS.POW_EXIST, " +
     "CN." + ssPrefix + "_TECHTERMS.TENSION_EXIST, " +
     "CN." + ssPrefix + "_TECHTERMS.IS_REALIZED, " +
     "CN." + ssPrefix + "_TECHTERMS.REASON, " +
     "CN." + ssPrefix + "_TECHTERMS.SOURCE, " +
     "CN." + ssPrefix + "_TECHTERMS.SOURCE_NUM, " +
     "CN." + ssPrefix + "_TECHTERMS.ENSUR_POINT, " +
     "CN." + ssPrefix + "_TECHTERMS.ENSUR_POINT_NUM, " +
     "CN." + ssPrefix + "_TECHTERMS.CONNECT_POINT, " +
     "CN." + ssPrefix + "_TECHTERMS.CONNECT_POINT_NUM, " +
     "CN." + ssPrefix + "_TECHTERMS.EXPLOIT_YEAR, " +
     "CN." + ssPrefix + "_TECHTERMS.BASESTATION, " +
     anObject.subsystemRef.code + " AS SUBSYSTEMREFCODE, " +
     "CN." + ssPrefix + "_TECHTERMS.ID_PACK " +

     " FROM CN." + ssPrefix + "_TECHTERMS WHERE CN." + ssPrefix + "_TECHTERMS.ID_PACK = " + anObject.cnPackRef.code;

   try
    {
     statement = connection.prepareStatement(selectStr);

     set = statement.executeQuery();
     if(!set.next())
      anObject.code = Integer.MIN_VALUE;
     else
      {
       anObject.code = set.getInt(1);

       anObject.id_proposal = set.getInt(2);
       if ( set.wasNull() )
          anObject.id_proposal = Integer.MIN_VALUE;
       anObject.proposalName = set.getString(3);
       anObject.power1 = set.getBigDecimal(4);
       if(anObject.power1 != null)
           anObject.power1 = anObject.power1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.power1prosp = set.getBigDecimal(5);
       if(anObject.power1prosp != null)
           anObject.power1prosp = anObject.power1prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.power1heat = set.getBigDecimal(6);
       if(anObject.power1heat != null)
           anObject.power1heat = anObject.power1heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.power2 = set.getBigDecimal(7);
       if(anObject.power2 != null)
           anObject.power2 = anObject.power2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.power2prosp = set.getBigDecimal(8);
       if(anObject.power2prosp != null)
           anObject.power2prosp = anObject.power2prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.power2heat = set.getBigDecimal(9);
       if(anObject.power2heat != null)
           anObject.power2heat = anObject.power2heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.power3 = set.getBigDecimal(10);
       if(anObject.power3 != null)
           anObject.power3 = anObject.power3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.power3prosp = set.getBigDecimal(11);
       if(anObject.power3prosp != null)
           anObject.power3prosp = anObject.power3prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.power3heat = set.getBigDecimal(12);
       if(anObject.power3heat != null)
           anObject.power3heat = anObject.power3heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.pow_stove = set.getBigDecimal(13);
       if(anObject.pow_stove != null)
           anObject.pow_stove = anObject.pow_stove.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.pow_water_heat = set.getBigDecimal(14);
       if(anObject.pow_water_heat != null)
           anObject.pow_water_heat = anObject.pow_water_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.pow_house_heat = set.getBigDecimal(15);
       if(anObject.pow_house_heat != null)
           anObject.pow_house_heat = anObject.pow_house_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.tension_point = set.getBigDecimal(16);
       if(anObject.tension_point != null)
           anObject.tension_point = anObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.current_automat = set.getBigDecimal(17);
       if(anObject.current_automat != null)
           anObject.current_automat = anObject.current_automat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.pow_exist = set.getBigDecimal(18);
       if(anObject.pow_exist != null)
           anObject.pow_exist = anObject.pow_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.tension_exist = set.getBigDecimal(19);
       if(anObject.tension_exist != null)
           anObject.tension_exist = anObject.tension_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.is_realized = set.getInt(20);
       if ( set.wasNull() )
          anObject.is_realized = Integer.MIN_VALUE;
       anObject.reason = set.getString(21);
       anObject.source = set.getString(22);
       anObject.source_num = set.getString(23);
       anObject.ensur_point = set.getString(24);
       anObject.ensur_point_num = set.getString(25);
       anObject.connect_point = set.getString(26);
       anObject.connect_point_num = set.getString(27);
       anObject.exploit_year = set.getInt(28);
       if ( set.wasNull() )
          anObject.exploit_year = Integer.MIN_VALUE;
       anObject.baseStation = set.getInt(29);
       if ( set.wasNull() )
          anObject.baseStation = Integer.MIN_VALUE;

       anObject.subsystemRef.code = set.getInt(30);
       if ( set.wasNull() )
           anObject.subsystemRef.code = Integer.MIN_VALUE;

       anObject.cnPackRef.code = set.getInt(31);
       if ( set.wasNull() )
        anObject.cnPackRef.code = Integer.MIN_VALUE;

     }
   }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
    }
   finally
    {
     try {if(set != null) set.close(); if (statement != null) statement.close();}
     catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }

  @Override
public void loadObject(CNTechTerms anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    String ssPrefix = null;
    switch (anObject.subsystemRef.code) {
    case CNSubsystemType.SS_CONNECTION: //Присоединение
        {
        ssPrefix = "cn";
        break;
        }
    case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
        {
        ssPrefix = "ncn";
        break;
        }
    case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
        {
        ssPrefix = "cn_20110314";
        break;
        }
    case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
        {
        ssPrefix = "eap";
        break;
        }
	case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
		{
		ssPrefix = "adso";
	    break;
		}
    default:
        {
        throw new EnergyproSystemException("Неизвестна подсистема EnergyWorkFlow");
        }
    }

    selectStr =  "SELECT " +
      ssPrefix + "_TECHTERMS.ID, " +
      ssPrefix + "_TECHTERMS.ID_PROPOSAL, " +
      ssPrefix + "_TECHTERMS.PROPOSALNAME, " +
      ssPrefix + "_TECHTERMS.POWER1, " +
      ssPrefix + "_TECHTERMS.POWER1PROSP, " +
      ssPrefix + "_TECHTERMS.POWER1HEAT, " +
      ssPrefix + "_TECHTERMS.POWER2, " +
      ssPrefix + "_TECHTERMS.POWER2PROSP, " +
      ssPrefix + "_TECHTERMS.POWER2HEAT, " +
      ssPrefix + "_TECHTERMS.POWER3, " +
      ssPrefix + "_TECHTERMS.POWER3PROSP, " +
      ssPrefix + "_TECHTERMS.POWER3HEAT, " +
      ssPrefix + "_TECHTERMS.POW_STOVE, " +
      ssPrefix + "_TECHTERMS.POW_WATER_HEAT, " +
      ssPrefix + "_TECHTERMS.POW_HOUSE_HEAT, " +
      ssPrefix + "_TECHTERMS.TENSION_POINT, " +
      ssPrefix + "_TECHTERMS.CURRENT_AUTOMAT, " +
      ssPrefix + "_TECHTERMS.POW_EXIST, " +
      ssPrefix + "_TECHTERMS.TENSION_EXIST, " +
      ssPrefix + "_TECHTERMS.IS_REALIZED, " +
      ssPrefix + "_TECHTERMS.REASON, " +
      ssPrefix + "_TECHTERMS.SOURCE, " +
      ssPrefix + "_TECHTERMS.SOURCE_NUM, " +
      ssPrefix + "_TECHTERMS.ENSUR_POINT, " +
      ssPrefix + "_TECHTERMS.ENSUR_POINT_NUM, " +
      ssPrefix + "_TECHTERMS.CONNECT_POINT, " +
      ssPrefix + "_TECHTERMS.CONNECT_POINT_NUM, " +
      ssPrefix + "_TECHTERMS.EXPLOIT_YEAR, " +
      ssPrefix + "_TECHTERMS.BASESTATION, " +
      anObject.subsystemRef.code + " AS SUBSYSTEMREFCODE " +
      ssPrefix + "_TECHTERMS.ID_PACK " +

      " FROM " + ssPrefix + "_TECHTERMS WHERE " + ssPrefix + "_TECHTERMS.ID = ?";

    try
     {
      statement = connection.prepareStatement(selectStr);
      statement.setInt(1,anObject.code);
      set = statement.executeQuery();
      if(!set.next())
       anObject.code = Integer.MIN_VALUE;
      else
       {
        anObject.code = set.getInt(1);
        anObject.id_proposal = set.getInt(2);
        if ( set.wasNull() )
           anObject.id_proposal = Integer.MIN_VALUE;
        anObject.proposalName = set.getString(3);
        anObject.power1 = set.getBigDecimal(4);
        if(anObject.power1 != null)
            anObject.power1 = anObject.power1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power1prosp = set.getBigDecimal(5);
        if(anObject.power1prosp != null)
            anObject.power1prosp = anObject.power1prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power1heat = set.getBigDecimal(6);
        if(anObject.power1heat != null)
            anObject.power1heat = anObject.power1heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2 = set.getBigDecimal(7);
        if(anObject.power2 != null)
            anObject.power2 = anObject.power2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2prosp = set.getBigDecimal(8);
        if(anObject.power2prosp != null)
            anObject.power2prosp = anObject.power2prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2heat = set.getBigDecimal(9);
        if(anObject.power2heat != null)
            anObject.power2heat = anObject.power2heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power3 = set.getBigDecimal(10);
        if(anObject.power3 != null)
            anObject.power3 = anObject.power3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power3prosp = set.getBigDecimal(11);
        if(anObject.power3prosp != null)
            anObject.power3prosp = anObject.power3prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power3heat = set.getBigDecimal(12);
        if(anObject.power3heat != null)
            anObject.power3heat = anObject.power3heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_stove = set.getBigDecimal(13);
        if(anObject.pow_stove != null)
            anObject.pow_stove = anObject.pow_stove.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_water_heat = set.getBigDecimal(14);
        if(anObject.pow_water_heat != null)
            anObject.pow_water_heat = anObject.pow_water_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_house_heat = set.getBigDecimal(15);
        if(anObject.pow_house_heat != null)
            anObject.pow_house_heat = anObject.pow_house_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tension_point = set.getBigDecimal(16);
        if(anObject.tension_point != null)
            anObject.tension_point = anObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.current_automat = set.getBigDecimal(17);
        if(anObject.current_automat != null)
            anObject.current_automat = anObject.current_automat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_exist = set.getBigDecimal(18);
        if(anObject.pow_exist != null)
            anObject.pow_exist = anObject.pow_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tension_exist = set.getBigDecimal(19);
        if(anObject.tension_exist != null)
            anObject.tension_exist = anObject.tension_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.is_realized = set.getInt(20);
        if ( set.wasNull() )
           anObject.is_realized = Integer.MIN_VALUE;
        anObject.reason = set.getString(21);
        anObject.source = set.getString(22);
        anObject.source_num = set.getString(23);
        anObject.ensur_point = set.getString(24);
        anObject.ensur_point_num = set.getString(25);
        anObject.connect_point = set.getString(26);
        anObject.connect_point_num = set.getString(27);
        anObject.exploit_year = set.getInt(28);
        if ( set.wasNull() )
           anObject.exploit_year = Integer.MIN_VALUE;
        anObject.baseStation = set.getInt(29);
        if ( set.wasNull() )
           anObject.baseStation = Integer.MIN_VALUE;

        anObject.subsystemRef.code = set.getInt(30);
        if ( set.wasNull() )
            anObject.subsystemRef.code = Integer.MIN_VALUE;
        anObject.cnPackRef.code = set.getInt(31);
        if ( set.wasNull() )
            anObject.cnPackRef.code = Integer.MIN_VALUE;
        if(anObject.subsystemRef.code != Integer.MIN_VALUE)
        {
           anObject.setSubsystemRef(
        new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).getRef(anObject.subsystemRef.code));
    }
        if(anObject.cnPackRef.code != Integer.MIN_VALUE)
        {
           anObject.setCnPackRef(
        new com.ksoe.energynet.dataminer.generated.CNPackDAOGen(connection,getUserProfile()).getRef(anObject.cnPackRef.code));
    }
      }
    }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     }
    finally
     {
      try {if(set != null) set.close(); if (statement != null) statement.close();}
      catch (SQLException e) {}
      if(connection != super.getConnection())
       {
        try{connection.close();} catch(SQLException e){}
       }
     }
   }


  public static String processCondition(String aCondition, Integer ssId)
   {
    if(aCondition == null || aCondition.length() == 0)
     return "";

    String ssPrefix = null;
    //String purpField = null;
    switch (ssId) {
    case CNSubsystemType.SS_CONNECTION: //Присоединение
        {
        ssPrefix = "cn";
        //purpField = "purpose";
        break;
        }
    case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
        {
        ssPrefix = "ncn";
        //purpField = "purpose";
        break;
        }
    case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
        {
        ssPrefix = "cn_20110314";
        //purpField = "description";
        break;
        }
    case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
        {
        ssPrefix = "eap";
        //purpField = "description";
        break;
        }
    case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
		{
		ssPrefix = "adso";
		//purpField = "description";
	    break;
		}
    default:
        {
        throw new EnergyproSystemException("Неизвестна подсистема EnergyWorkFlow");
        }
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
    _checkConditionToken(condition,"code",ssPrefix+"_TECHTERMS.ID");
    _checkConditionToken(condition,"id_proposal",ssPrefix+"_TECHTERMS.ID_PROPOSAL");
    //_checkConditionToken(condition,"proposalname","PROPOSALNAME");
    _checkConditionToken(condition,"power1",ssPrefix+"_TECHTERMS.POWER1");
    _checkConditionToken(condition,"power1prosp",ssPrefix+"_TECHTERMS.POWER1PROSP");
    _checkConditionToken(condition,"power1heat",ssPrefix+"_TECHTERMS.POWER1HEAT");
    _checkConditionToken(condition,"power2",ssPrefix+"_TECHTERMS.POWER2");
    _checkConditionToken(condition,"power2prosp",ssPrefix+"_TECHTERMS.POWER2PROSP");
    _checkConditionToken(condition,"power2heat",ssPrefix+"_TECHTERMS.POWER2HEAT");
    _checkConditionToken(condition,"power3",ssPrefix+"_TECHTERMS.POWER3");
    _checkConditionToken(condition,"power3prosp",ssPrefix+"_TECHTERMS.POWER3PROSP");
    _checkConditionToken(condition,"power3heat",ssPrefix+"_TECHTERMS.POWER3HEAT");
    _checkConditionToken(condition,"pow_stove",ssPrefix+"_TECHTERMS.POW_STOVE");
    _checkConditionToken(condition,"pow_water_heat",ssPrefix+"_TECHTERMS.POW_WATER_HEAT");
    _checkConditionToken(condition,"pow_house_heat",ssPrefix+"_TECHTERMS.POW_HOUSE_HEAT");
    _checkConditionToken(condition,"tension_point",ssPrefix+"_TECHTERMS.TENSION_POINT");
    _checkConditionToken(condition,"current_automat",ssPrefix+"_TECHTERMS.CURRENT_AUTOMAT");
    _checkConditionToken(condition,"pow_exist",ssPrefix+"_TECHTERMS.POW_EXIST");
    _checkConditionToken(condition,"tension_exist",ssPrefix+"_TECHTERMS.TENSION_EXIST");
    _checkConditionToken(condition,"is_realized",ssPrefix+"_TECHTERMS.IS_REALIZED");
    _checkConditionToken(condition,"reason",ssPrefix+"_TECHTERMS.REASON");
    _checkConditionToken(condition,"source",ssPrefix+"_TECHTERMS.SOURCE");
    _checkConditionToken(condition,"source_num",ssPrefix+"_TECHTERMS.SOURCE_NUM");
    _checkConditionToken(condition,"ensur_point",ssPrefix+"_TECHTERMS.ENSUR_POINT");
    _checkConditionToken(condition,"ensur_point_num",ssPrefix+"_TECHTERMS.ENSUR_POINT_NUM");
    _checkConditionToken(condition,"connect_point",ssPrefix+"_TECHTERMS.CONNECT_POINT");
    _checkConditionToken(condition,"connect_point_num",ssPrefix+"_TECHTERMS.CONNECT_POINT_NUM");
    _checkConditionToken(condition,"exploit_year",ssPrefix+"_TECHTERMS.EXPLOIT_YEAR");
    _checkConditionToken(condition,"basestation",ssPrefix+"_TECHTERMS.BASESTATION");

      // relationship conditions
    _checkConditionToken(condition,"id_pack",ssPrefix+"_TECHTERMS.ID_PACK");
    return condition.toString();
   }


} // end of CNTechTermsDAO

