
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen;
import com.ksoe.energynet.logic.ContractLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObject2TechCondtnsServices;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.ENTechContragentType;
import com.ksoe.energynet.valueobject.brief.ENAct2ENPlanWorkShort;
import com.ksoe.energynet.valueobject.brief.ENTechConditionsServicesShort;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2TechCondtnsServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENTechCond2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2TechCondtnsServicesShortList;
import com.ksoe.energynet.valueobject.lists.ENTechCond2PlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsServicesShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;
import com.ksoe.netobjects.valueobject.ENPriconnectionData;
import com.ksoe.rqorder.dataminer.RQFKOrder2PlanFactDAO;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrder2PlanFact;
import com.ksoe.rqorder.valueobject.brief.RQFKOrder2PlanFactShort;
import com.ksoe.rqorder.valueobject.filter.RQFKOrder2PlanFactFilter;
import com.ksoe.rqorder.valueobject.lists.RQFKOrder2PlanFactShortList;


  /**
  *  DAO Object for ENTechConditionsServices;
  *
  */

public class ENTechConditionsServicesDAO extends ENTechConditionsServicesDAOGen {

  public ENTechConditionsServicesDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTechConditionsServicesDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  @Override
  public ENTechConditionsServicesShortList getScrollableFilteredList(ENTechConditionsServices aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENTechConditionsServicesShortList result = new ENTechConditionsServicesShortList();
   ENTechConditionsServicesShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENTECHCONDITIONSSERVCS.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENTECHCONDITIONSSERVCS.CODE"+
    ",ENTECHCONDITIONSSERVCS.CONTRACTNUMBER"+
    ",ENTECHCONDITIONSSERVCS.CONTRACTDATE"+
    ",ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER"+
    ",ENTECHCONDITIONSSERVCS.FINCONTRACTDATE"+
    ",ENTECHCONDITIONSSERVCS.PARTNERNAME"+
    ",ENTECHCONDITIONSSERVCS.PARTNERCODE"+
    ",ENTECHCONDITIONSSERVCS.FINDOCCODE"+
    ",ENTECHCONDITIONSSERVCS.FINDOCID"+
    ",ENTECHCONDITIONSSERVCS.FINCOMMENTGEN"+
    ",ENTECHCONDITIONSSERVCS.TYSUMMAGEN"+
    ",ENTECHCONDITIONSSERVCS.TYSUMMAVAT"+
    ",ENTECHCONDITIONSSERVCS.TYSERVICESSUMMA"+
    ",ENTECHCONDITIONSSERVCS.TYSERVICESPOWER"+
    ",ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN"+
    ",ENTECHCONDITIONSSERVCS.USERGEN"+
    ",ENTECHCONDITIONSSERVCS.DATEEDIT"+
    ",ENTECHCONDITIONSSERVCS.CNPACKCODE"+

     ", ENELEMENT.CODE " +
     ", ENDEPARTMENT.CODE " +
     ", ENDEPARTMENT.SHORTNAME " +
     ", ENDEPARTMENT.DATESTART " +
     ", ENDEPARTMENT.DATEFINAL " +
     ", ENDEPARTMENT.SHPZBALANS " +
     ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
     ", ENDEPARTMENT.KAU_1884 " +
     ", ENDEPARTMENT.NAME_1884 " +
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
     ", ENTECHCONDTNSSRVCSSTTS.CODE " +
     ", ENTECHCONDTNSSRVCSSTTS.NAME " +
     ", ENTECHCONDITINSSRVCSTP.CODE " +
     ", ENTECHCONDITINSSRVCSTP.NAME " +
     ", ENTECHCONTRAGENTFORM.CODE " +
     ", ENTECHCONTRAGENTFORM.NAME " +
     ", ENTECHCONDRESPONSIBLES.CODE " +
     ", ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO " +
     ", ENTECHCONDRESPONSIBLES.RESPONSIBLETABNUMBER " +
     ", ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION " +
     ", ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME " +
     ", ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE " +
     ", ENTECHCONDRESPONSIBLES.POWER " +

     ", (select group_concat(cast(ag.contragentname as text),',') from encontragent ag where ag.techcondservicesrefcod = entechconditionsservcs.code) " +
     ", (select group_concat(cast (ag.contragentokpo as text),',') from encontragent ag where ag.techcondservicesrefcod = entechconditionsservcs.code) " +

     //", ENTECHCONDITIONSSERVCS.CNSUBSYSTEMCODE "+
     //", ENTECHCONDITIONSSERVCS.CNSUBSYSTEMNAME "+
     ", (SELECT CNSUBSYSTEMTYPE.CODE FROM CNSUBSYSTEMTYPE WHERE CNSUBSYSTEMTYPE.CODE = ENTECHCONDITIONSSERVCS.CNSUBSYSTEMTYPEREFCODE) " +
     ", (SELECT CNSUBSYSTEMTYPE.NAME FROM CNSUBSYSTEMTYPE WHERE CNSUBSYSTEMTYPE.CODE = ENTECHCONDITIONSSERVCS.CNSUBSYSTEMTYPEREFCODE) " +

     ", (SELECT COALESCE(enplanwork.dateendpriconnection,NULL) FROM enplanwork , ENTECHCOND2PLANWORK  WHERE enplanwork.CODE  =  ENTECHCOND2PLANWORK.planrefcode AND ENTECHCOND2PLANWORK.techconservicesrefcode = ENTECHCONDITIONSSERVCS.CODE AND enplanwork.kindcode = 2 AND enplanwork.dateendpriconnection IS NOT NULL   LIMIT 1   ) AS dateendpriconnection " +

     ", ENTECHCONTRAGENTTYPE.CODE " +
     ", ENTECHCONTRAGENTTYPE.NAME " +    //  59

     ", ENCONNECTIONKIND.CODE " +
     ", ENCONNECTIONKIND.NAME " +

     ", ENTECHCONDITIONSSERVCS.BUILDERSAREA " +  // 62
     ", ENTECHCONDITIONSSERVCS.ISSEA " +         // 63

     ", (select enconnectioncalctype.code from enconnectioncalctype where enconnectioncalctype.code = entechconditionsservcs.calctyperefcode) " +
    ", (select enconnectioncalctype.name from enconnectioncalctype where enconnectioncalctype.code = entechconditionsservcs.calctyperefcode) " +

    ", ENTECHCONDITIONSSERVCS.BASESTATION " +
     ", ENTECHCONDITIONSSERVCS.SMALLARCHFRM " +

    ", ENTECHCONDITIONSSERVCS.AIRLINE04REFCODE" +
     ", ENTECHCONDITIONSSERVCS.CABLELINE04REFCODE" +
     ", ENTECHCONDITIONSSERVCS.TRREFCODE" +
     ", ENTECHCONDITIONSSERVCS.S04REFCODE" +
     ", ENTECHCONDITIONSSERVCS.AIRLINE10REFCODE" +
     ", ENTECHCONDITIONSSERVCS.CABLELINE10REFCODE" +
     ", ENTECHCONDITIONSSERVCS.S35REFCODE" +
     ", ENTECHCONDITIONSSERVCS.AIRLINE150REFCODE" +
     ", ENTECHCONDITIONSSERVCS.CABLELINE150REFCODE" +
     ", ENTECHCONDITIONSSERVCS.S150REFCODE" +

     ", (select l.invnumber from enline04 l where l.code = ENTECHCONDITIONSSERVCS.airline04refcode) " +
     ", (select l.name from enline04 l where l.code = ENTECHCONDITIONSSERVCS.airline04refcode) " +

     ", (select s.invnumber from ensubstation04 s where s.code = ENTECHCONDITIONSSERVCS.s04refcode) " +
     ", (select s.name from ensubstation04 s where s.code = ENTECHCONDITIONSSERVCS.s04refcode) " +

     ", (select l.invnumber from enline10 l where l.code = ENTECHCONDITIONSSERVCS.airline10refcode) " +
     ", (select l.name from enline10 l where l.code = ENTECHCONDITIONSSERVCS.airline10refcode) " +

     ", (select s.invnumber from ensubstation150 s where s.code = ENTECHCONDITIONSSERVCS.s35refcode) " +
     ", (select s.name from ensubstation150 s where s.code = ENTECHCONDITIONSSERVCS.s35refcode) " +
     ", ENTECHCONDITIONSSERVCS.ISDISCONNECTIONNEEDED " +

    " FROM ENTECHCONDITIONSSERVCS " +
    " left join ENWARRANT on ENWARRANT.CODE = ENTECHCONDITIONSSERVCS.WARRANTREFCODE " +
    " left join ENTECHCONDRESPONSIBLES on ENTECHCONDRESPONSIBLES.CODE = ENTECHCONDITIONSSERVCS.TECHCONDRESPONSBLSRFCD " +
    ", ENELEMENT " +
    ", ENDEPARTMENT " +
    //", ENWARRANT " +
    ", ENTECHCONDTNSSRVCSSTTS " +
    ", ENTECHCONDITINSSRVCSTP " +
    ", ENTECHCONTRAGENTFORM " +
    ", ENTECHCONTRAGENTTYPE " +
    ", ENCONNECTIONKIND " +

    "";
     whereStr = " ENELEMENT.CODE = ENTECHCONDITIONSSERVCS.ELEMENTCODE" ; //+
     whereStr = whereStr +" AND ENDEPARTMENT.CODE = ENTECHCONDITIONSSERVCS.DEPARTMENTCODE" ; //+
     //whereStr = whereStr +" AND ENWARRANT.CODE = ENTECHCONDITIONSSERVCS.WARRANTREFCODE" ; //+
     whereStr = whereStr +" AND ENTECHCONDTNSSRVCSSTTS.CODE = ENTECHCONDITIONSSERVCS.TECHCONDSERVICESSTTSCD" ; //+
     whereStr = whereStr +" AND ENTECHCONDITINSSRVCSTP.CODE = ENTECHCONDITIONSSERVCS.TECHCONDSERVICESTYPECD" ; //+
     whereStr = whereStr +" AND ENTECHCONTRAGENTFORM.CODE = ENTECHCONDITIONSSERVCS.CONTRAGENTFORMCODE" ; //+
     whereStr = whereStr +" AND ENTECHCONTRAGENTTYPE.CODE = ENTECHCONDITIONSSERVCS.CONTRAGENTTYPEREFCODE" ; //+
     whereStr = whereStr +" AND ENCONNECTIONKIND.CODE = ENTECHCONDITIONSSERVCS.CONNECTIONKINDREFCODE" ; //+

     //whereStr = whereStr +" AND ENTECHCONDRESPONSIBLES.CODE = ENTECHCONDITIONSSERVCS.TECHCONDRESPONSBLSRFCD" ; //+
    //selectStr = selectStr + " ${s} ENTECHCONDITIONSSERVCS.CODE IN ( SELECT ENTECHCONDITIONSSERVCS.CODE FROM ENTECHCONDITIONSSERVCS ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.CODE = ?";
       }
        if (aFilterObject.contractNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.CONTRACTNUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.CONTRACTNUMBER) LIKE UPPER(?)";
        }
       if(aFilterObject.contractDate != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.CONTRACTDATE = ?";
       }
        if (aFilterObject.finContractNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finContractNumber.indexOf('*',0) < 0 && aFilterObject.finContractNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER) LIKE UPPER(?)";
        }
       if(aFilterObject.finContractDate != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.FINCONTRACTDATE = ?";
       }
        if (aFilterObject.partnerName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.partnerName.indexOf('*',0) < 0 && aFilterObject.partnerName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.PARTNERNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.PARTNERNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.partnerCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.PARTNERCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.PARTNERCODE) LIKE UPPER(?)";
        }
        if (aFilterObject.finDocCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.FINDOCCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.FINDOCCODE) LIKE UPPER(?)";
        }
       if(aFilterObject.finDocID != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.FINDOCID = ?";
       }
        if (aFilterObject.finCommentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finCommentGen.indexOf('*',0) < 0 && aFilterObject.finCommentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.FINCOMMENTGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.FINCOMMENTGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.tySummaGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.TYSUMMAGEN = ?";
       }
       if(aFilterObject.tySummaVat != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.TYSUMMAVAT = ?";
       }
       if(aFilterObject.tyServicesSumma != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.TYSERVICESSUMMA = ?";
       }
       if(aFilterObject.tyServicesPower != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.TYSERVICESPOWER = ?";
       }
        if (aFilterObject.commentServicesGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentServicesGen.indexOf('*',0) < 0 && aFilterObject.commentServicesGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN) LIKE UPPER(?)";
        }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.USERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.USERGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.DATEEDIT = ?";
       }
       if(aFilterObject.cnPackCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.CNPACKCODE = ?";
       }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.DOMAIN_INFO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.DOMAIN_INFO) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.MODIFY_TIME = ?";
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.ELEMENTCODE = ? ";
       }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.DEPARTMENTCODE = ? ";
       }
       if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.WARRANTREFCODE = ? ";
       }
       if(aFilterObject.techCondServicesStatus.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.TECHCONDSERVICESSTTSCD = ? ";
       }
       if(aFilterObject.techCondServicesType.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.TECHCONDSERVICESTYPECD = ? ";
       }
       if(aFilterObject.contragentForm.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CONTRAGENTFORMCODE = ? ";
       }
       if(aFilterObject.techCondResponsiblesRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.TECHCONDRESPONSBLSRFCD = ? ";
       }
       /*
       if(aFilterObject.cnSubsystemCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.CNSUBSYSTEMCODE = ?";
       }
        if (aFilterObject.cnSubsystemName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.cnSubsystemName.indexOf('*',0) < 0 && aFilterObject.cnSubsystemName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.CNSUBSYSTEMNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.CNSUBSYSTEMNAME) LIKE UPPER(?)";
        }
        */
       if(aFilterObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CNSUBSYSTEMTYPEREFCODE = ? ";
       }
       if(aFilterObject.contragentTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CONTRAGENTTYPEREFCODE = ? ";
       }
       if(aFilterObject.connectionKindRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CONNECTIONKINDREFCODE = ? ";
       }

       if(aFilterObject.buildersArea != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.BUILDERSAREA = ?";
       }

    if(aFilterObject.isSea != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.ISSEA = ?";
       }

    if(aFilterObject.baseStation != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.BASESTATION = ?";
        }

    if(aFilterObject.smallArchFrm != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.SMALLARCHFRM = ?";
        }

        if(aFilterObject.airLine04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.AIRLINE04REFCODE = ? ";
        }
        if(aFilterObject.cableLine04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CABLELINE04REFCODE = ? ";
        }
        if(aFilterObject.trRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.TRREFCODE = ? ";
        }
        if(aFilterObject.s04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.S04REFCODE = ? ";
        }
        if(aFilterObject.airLine10Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.AIRLINE10REFCODE = ? ";
        }
        if(aFilterObject.cableLine10Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CABLELINE10REFCODE = ? ";
        }
        if(aFilterObject.s35Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.S35REFCODE = ? ";
        }
        if(aFilterObject.airLine150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.AIRLINE150REFCODE = ? ";
        }
        if(aFilterObject.cableLine150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CABLELINE150REFCODE = ? ";
        }
        if(aFilterObject.s150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.S150REFCODE = ? ";
        }
        if(aFilterObject.isDisconnectionNeeded != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.ISDISCONNECTIONNEEDED = ? ";
        }

     }


   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsServices.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENTechConditionsServices.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("ENTECHCONDITIONSSERVCS",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND ENTECHCONDITIONSSERVCS.DOMAIN_INFO IS NOT NULL";
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

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }

          if(aFilterObject.contractNumber != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contractNumber);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.contractDate != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.contractDate.getTime()));
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

          if(aFilterObject.finDocCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.finDocCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.finDocID != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.finDocID);
        }

          if(aFilterObject.finCommentGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.finCommentGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.tySummaGen != null){
           number++;
           aFilterObject.tySummaGen = aFilterObject.tySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.tySummaGen);
       }
       if(aFilterObject.tySummaVat != null){
           number++;
           aFilterObject.tySummaVat = aFilterObject.tySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.tySummaVat);
       }
       if(aFilterObject.tyServicesSumma != null){
           number++;
           aFilterObject.tyServicesSumma = aFilterObject.tyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.tyServicesSumma);
       }
       if(aFilterObject.tyServicesPower != null){
           number++;
           aFilterObject.tyServicesPower = aFilterObject.tyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.tyServicesPower);
       }

          if(aFilterObject.commentServicesGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.commentServicesGen);
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
       if(aFilterObject.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
       }
        if(aFilterObject.cnPackCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.cnPackCode);
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
      if(aFilterObject.element.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.element.code);
      }
      if(aFilterObject.department.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.department.code);
      }
      if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.warrantRef.code);
      }
      if(aFilterObject.techCondServicesStatus.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.techCondServicesStatus.code);
      }
      if(aFilterObject.techCondServicesType.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.techCondServicesType.code);
      }
      if(aFilterObject.contragentForm.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.contragentForm.code);
      }
      if(aFilterObject.techCondResponsiblesRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.techCondResponsiblesRef.code);
      }
      /*
      if(aFilterObject.cnSubsystemCode != Integer.MIN_VALUE){
          number++;
          statement.setInt(number,aFilterObject.cnSubsystemCode);
      }
        if(aFilterObject.cnSubsystemName != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.cnSubsystemName);
            for(int i = 0;i < likeStr.length();i++){
                if(likeStr.charAt(i) == '*')
                    likeStr.setCharAt(i,'%');
                if(likeStr.charAt(i) == '?')
                    likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }
    */
      if(aFilterObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.cnSubsystemTypeRef.code);
      }
      if(aFilterObject.contragentTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.contragentTypeRef.code);
      }
      if(aFilterObject.connectionKindRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.connectionKindRef.code);
      }

      if(aFilterObject.buildersArea != Integer.MIN_VALUE){
          number++;
          statement.setInt(number,aFilterObject.buildersArea);
      }
      if(aFilterObject.isSea != Integer.MIN_VALUE){
          number++;
          statement.setInt(number,aFilterObject.isSea);
      }
    if(aFilterObject.baseStation != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.baseStation);
      }
      if(aFilterObject.smallArchFrm != Integer.MIN_VALUE){
        number++;
          statement.setInt(number,aFilterObject.smallArchFrm);
    }

    if(aFilterObject.airLine04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine04Ref.code);
       }
       if(aFilterObject.cableLine04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine04Ref.code);
       }
       if(aFilterObject.trRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trRef.code);
       }
       if(aFilterObject.s04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s04Ref.code);
       }
       if(aFilterObject.airLine10Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine10Ref.code);
       }
       if(aFilterObject.cableLine10Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine10Ref.code);
       }
       if(aFilterObject.s35Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s35Ref.code);
       }
       if(aFilterObject.airLine150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine150Ref.code);
       }
       if(aFilterObject.cableLine150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine150Ref.code);
       }
       if(aFilterObject.s150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s150Ref.code);
       }
       if(aFilterObject.isDisconnectionNeeded != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.isDisconnectionNeeded);
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

       anObject = new ENTechConditionsServicesShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.contractNumber = set.getString(2);
       anObject.contractDate = set.getDate(3);
       anObject.finContractNumber = set.getString(4);
       anObject.finContractDate = set.getDate(5);
       anObject.partnerName = set.getString(6);
       anObject.partnerCode = set.getString(7);
       anObject.finDocCode = set.getString(8);
       anObject.finDocID = set.getInt(9);
       if ( set.wasNull() )
           anObject.finDocID = Integer.MIN_VALUE;
       anObject.finCommentGen = set.getString(10);
       anObject.tySummaGen = set.getBigDecimal(11);
       if(anObject.tySummaGen != null)
           anObject.tySummaGen = anObject.tySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.tySummaVat = set.getBigDecimal(12);
       if(anObject.tySummaVat != null)
           anObject.tySummaVat = anObject.tySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.tyServicesSumma = set.getBigDecimal(13);
       if(anObject.tyServicesSumma != null)
           anObject.tyServicesSumma = anObject.tyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.tyServicesPower = set.getBigDecimal(14);
       if(anObject.tyServicesPower != null)
           anObject.tyServicesPower = anObject.tyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.commentServicesGen = set.getString(15);
       anObject.userGen = set.getString(16);
       anObject.dateEdit = set.getDate(17);
       anObject.cnPackCode = set.getInt(18);
       if ( set.wasNull() )
           anObject.cnPackCode = Integer.MIN_VALUE;

       anObject.elementCode = set.getInt(19);
        if(set.wasNull())
        anObject.elementCode = Integer.MIN_VALUE;
       anObject.departmentCode = set.getInt(20);
        if(set.wasNull())
        anObject.departmentCode = Integer.MIN_VALUE;
       anObject.departmentShortName = set.getString(21);
       anObject.departmentDateStart = set.getDate(22);
       anObject.departmentDateFinal = set.getDate(23);
       anObject.departmentShpzBalans = set.getString(24);
       anObject.departmentKau_table_id_1884 = set.getInt(25);
        if(set.wasNull())
        anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
       anObject.departmentKau_1884 = set.getString(26);
       anObject.departmentName_1884 = set.getString(27);
       anObject.warrantRefCode = set.getInt(28);
        if(set.wasNull())
        anObject.warrantRefCode = Integer.MIN_VALUE;
       anObject.warrantRefNumbergen = set.getString(29);
       anObject.warrantRefName = set.getString(30);
       anObject.warrantRefWarrantFIO = set.getString(31);
       anObject.warrantRefWarrantShortFIO = set.getString(32);
       anObject.warrantRefWarrantPosition = set.getString(33);
       anObject.warrantRefGenitiveFIO = set.getString(34);
       anObject.warrantRefGenitivePosition = set.getString(35);
       anObject.warrantRefPassport = set.getString(36);
       anObject.warrantRefAddress = set.getString(37);
       anObject.warrantRefPower = set.getInt(38);
        if(set.wasNull())
        anObject.warrantRefPower = Integer.MIN_VALUE;
       anObject.warrantRefMaxSum = set.getBigDecimal(39);
       if(anObject.warrantRefMaxSum != null)
         anObject.warrantRefMaxSum = anObject.warrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.techCondServicesStatusCode = set.getInt(40);
        if(set.wasNull())
        anObject.techCondServicesStatusCode = Integer.MIN_VALUE;
       anObject.techCondServicesStatusName = set.getString(41);
       anObject.techCondServicesTypeCode = set.getInt(42);
        if(set.wasNull())
        anObject.techCondServicesTypeCode = Integer.MIN_VALUE;
       anObject.techCondServicesTypeName = set.getString(43);
       anObject.contragentFormCode = set.getInt(44);
        if(set.wasNull())
        anObject.contragentFormCode = Integer.MIN_VALUE;
       anObject.contragentFormName = set.getString(45);
       anObject.techCondResponsiblesRefCode = set.getInt(46);
        if(set.wasNull())
        anObject.techCondResponsiblesRefCode = Integer.MIN_VALUE;
       anObject.techCondResponsiblesRefResponsibleFIO = set.getString(47);
       anObject.techCondResponsiblesRefResponsibleTabNumber = set.getInt(48);
        if(set.wasNull())
        anObject.techCondResponsiblesRefResponsibleTabNumber = Integer.MIN_VALUE;
       anObject.techCondResponsiblesRefResponsiblePosition = set.getString(49);
       anObject.techCondResponsiblesRefResponsibleDepName = set.getString(50);
       anObject.techCondResponsiblesRefResponsibleDepCode = set.getString(51);
       anObject.techCondResponsiblesRefPower = set.getInt(52);
        if(set.wasNull())
        anObject.techCondResponsiblesRefPower = Integer.MIN_VALUE;

       anObject.contragentName = set.getString(53);
       anObject.contragentOkpo = set.getString(54);

       /*
       anObject.cnSubsystemCode = set.getInt(55);
       if ( set.wasNull() )
           anObject.cnSubsystemCode = Integer.MIN_VALUE;
       anObject.cnSubsystemName = set.getString(56);
       */

       anObject.cnSubsystemTypeRefCode = set.getInt(55);
        if(set.wasNull())
        anObject.cnSubsystemTypeRefCode = Integer.MIN_VALUE;
       anObject.cnSubsystemTypeRefName = set.getString(56);
       anObject.dateEndPriconnection = set.getDate(57);

       anObject.contragentTypeRefCode = set.getInt(58);
        if(set.wasNull())
        anObject.contragentTypeRefCode = Integer.MIN_VALUE;
       anObject.contragentTypeRefName = set.getString(59);

       anObject.connectionKindRefCode = set.getInt(60);
        if(set.wasNull())
        anObject.connectionKindRefCode = Integer.MIN_VALUE;
       anObject.connectionKindRefName = set.getString(61);

       anObject.buildersArea = set.getInt(62);
       if (set.wasNull())
           anObject.buildersArea = Integer.MIN_VALUE;

       anObject.isSea = set.getInt(63);
       if ( set.wasNull() )
           anObject.isSea = Integer.MIN_VALUE;

       anObject.calcTypeRefCode = set.getInt(64);
        if(set.wasNull())
        anObject.calcTypeRefCode = Integer.MIN_VALUE;
       anObject.calcTypeRefName = set.getString(65);

    anObject.baseStation = set.getInt(66);
    if ( set.wasNull() )
        anObject.baseStation = Integer.MIN_VALUE;
    anObject.smallArchFrm = set.getInt(67);
    if ( set.wasNull() )
        anObject.smallArchFrm = Integer.MIN_VALUE;

    anObject.airLine04RefCode = set.getInt(68);
        if(set.wasNull())
        anObject.airLine04RefCode = Integer.MIN_VALUE;
        anObject.cableLine04RefCode = set.getInt(69);
        if(set.wasNull())
        anObject.cableLine04RefCode = Integer.MIN_VALUE;
        anObject.trRefCode = set.getInt(70);
        if(set.wasNull())
        anObject.trRefCode = Integer.MIN_VALUE;
        anObject.s04RefCode = set.getInt(71);
        if(set.wasNull())
        anObject.s04RefCode = Integer.MIN_VALUE;
        anObject.airLine10RefCode = set.getInt(72);
        if(set.wasNull())
        anObject.airLine10RefCode = Integer.MIN_VALUE;
        anObject.cableLine10RefCode = set.getInt(73);
        if(set.wasNull())
        anObject.cableLine10RefCode = Integer.MIN_VALUE;
        anObject.s35RefCode = set.getInt(74);
        if(set.wasNull())
        anObject.s35RefCode = Integer.MIN_VALUE;
        anObject.airLine150RefCode = set.getInt(75);
        if(set.wasNull())
        anObject.airLine150RefCode = Integer.MIN_VALUE;
        anObject.cableLine150RefCode = set.getInt(76);
        if(set.wasNull())
        anObject.cableLine150RefCode = Integer.MIN_VALUE;
        anObject.s150RefCode = set.getInt(77);
        if(set.wasNull())
        anObject.s150RefCode = Integer.MIN_VALUE;

        anObject.airLine04RefInvNumber = set.getString(78);
        anObject.airLine04RefName = set.getString(79);

        anObject.s04RefInvNumber = set.getString(80);
        anObject.s04RefName = set.getString(81);

        anObject.airLine10RefInvNumber = set.getString(82);
        anObject.airLine10RefName = set.getString(83);

        anObject.s35RefInvNumber = set.getString(84);
        anObject.s35RefName = set.getString(85);

        anObject.isDisconnectionNeeded = set.getInt(86);
        if(set.wasNull())
            anObject.isDisconnectionNeeded = Integer.MIN_VALUE;

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

  /**
   *
   * Возвращает список договоров на приєднання без ограничения по доменам
   */
  public ENTechConditionsServicesShortList getScrollableFilteredListWITHOUT_SEGR(ENTechConditionsServices aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENTechConditionsServicesShortList result = new ENTechConditionsServicesShortList();
   ENTechConditionsServicesShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENTECHCONDITIONSSERVCS.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENTECHCONDITIONSSERVCS.CODE"+
    ",ENTECHCONDITIONSSERVCS.CONTRACTNUMBER"+
    ",ENTECHCONDITIONSSERVCS.CONTRACTDATE"+
    ",ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER"+
    ",ENTECHCONDITIONSSERVCS.FINCONTRACTDATE"+
    ",ENTECHCONDITIONSSERVCS.PARTNERNAME"+
    ",ENTECHCONDITIONSSERVCS.PARTNERCODE"+
    ",ENTECHCONDITIONSSERVCS.FINDOCCODE"+
    ",ENTECHCONDITIONSSERVCS.FINDOCID"+
    ",ENTECHCONDITIONSSERVCS.FINCOMMENTGEN"+
    ",ENTECHCONDITIONSSERVCS.TYSUMMAGEN"+
    ",ENTECHCONDITIONSSERVCS.TYSUMMAVAT"+
    ",ENTECHCONDITIONSSERVCS.TYSERVICESSUMMA"+
    ",ENTECHCONDITIONSSERVCS.TYSERVICESPOWER"+
    ",ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN"+
    ",ENTECHCONDITIONSSERVCS.USERGEN"+
    ",ENTECHCONDITIONSSERVCS.DATEEDIT"+
    ",ENTECHCONDITIONSSERVCS.CNPACKCODE"+

     ", ENELEMENT.CODE " +
     ", ENDEPARTMENT.CODE " +
     ", ENDEPARTMENT.SHORTNAME " +
     ", ENDEPARTMENT.DATESTART " +
     ", ENDEPARTMENT.DATEFINAL " +
     ", ENDEPARTMENT.SHPZBALANS " +
     ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
     ", ENDEPARTMENT.KAU_1884 " +
     ", ENDEPARTMENT.NAME_1884 " +
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
     ", ENTECHCONDTNSSRVCSSTTS.CODE " +
     ", ENTECHCONDTNSSRVCSSTTS.NAME " +
     ", ENTECHCONDITINSSRVCSTP.CODE " +
     ", ENTECHCONDITINSSRVCSTP.NAME " +
     ", ENTECHCONTRAGENTFORM.CODE " +
     ", ENTECHCONTRAGENTFORM.NAME " +
     ", ENTECHCONDRESPONSIBLES.CODE " +
     ", ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO " +
     ", ENTECHCONDRESPONSIBLES.RESPONSIBLETABNUMBER " +
     ", ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION " +
     ", ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME " +
     ", ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE " +
     ", ENTECHCONDRESPONSIBLES.POWER " +

     ", (select group_concat(cast(ag.contragentname as text),',') from encontragent ag where ag.techcondservicesrefcod = entechconditionsservcs.code) " +
     ", (select group_concat(cast (ag.contragentokpo as text),',') from encontragent ag where ag.techcondservicesrefcod = entechconditionsservcs.code) " +

     //", ENTECHCONDITIONSSERVCS.CNSUBSYSTEMCODE "+
     //", ENTECHCONDITIONSSERVCS.CNSUBSYSTEMNAME "+
     ", (SELECT CNSUBSYSTEMTYPE.CODE FROM CNSUBSYSTEMTYPE WHERE CNSUBSYSTEMTYPE.CODE = ENTECHCONDITIONSSERVCS.CNSUBSYSTEMTYPEREFCODE) " +
     ", (SELECT CNSUBSYSTEMTYPE.NAME FROM CNSUBSYSTEMTYPE WHERE CNSUBSYSTEMTYPE.CODE = ENTECHCONDITIONSSERVCS.CNSUBSYSTEMTYPEREFCODE) " +

     ", (SELECT COALESCE(enplanwork.dateendpriconnection,NULL) FROM enplanwork , ENTECHCOND2PLANWORK  WHERE enplanwork.CODE  =  ENTECHCOND2PLANWORK.planrefcode AND ENTECHCOND2PLANWORK.techconservicesrefcode = ENTECHCONDITIONSSERVCS.CODE AND enplanwork.kindcode = 2 AND enplanwork.dateendpriconnection IS NOT NULL   LIMIT 1   ) AS dateendpriconnection " +

     ", ENTECHCONTRAGENTTYPE.CODE " +
     ", ENTECHCONTRAGENTTYPE.NAME " +     //  59

     ", ENCONNECTIONKIND.CODE " +
     ", ENCONNECTIONKIND.NAME " +

     ", ENTECHCONDITIONSSERVCS.BUILDERSAREA " +  // 62
     ", ENTECHCONDITIONSSERVCS.ISSEA " +         // 63

     ", (select enconnectioncalctype.code from enconnectioncalctype where enconnectioncalctype.code = entechconditionsservcs.calctyperefcode) " +
     ", (select enconnectioncalctype.name from enconnectioncalctype where enconnectioncalctype.code = entechconditionsservcs.calctyperefcode) " +

    ", ENTECHCONDITIONSSERVCS.BASESTATION " +
     ", ENTECHCONDITIONSSERVCS.SMALLARCHFRM " +

    ", ENTECHCONDITIONSSERVCS.AIRLINE04REFCODE" +
     ", ENTECHCONDITIONSSERVCS.CABLELINE04REFCODE" +
     ", ENTECHCONDITIONSSERVCS.TRREFCODE" +
     ", ENTECHCONDITIONSSERVCS.S04REFCODE" +
     ", ENTECHCONDITIONSSERVCS.AIRLINE10REFCODE" +
     ", ENTECHCONDITIONSSERVCS.CABLELINE10REFCODE" +
     ", ENTECHCONDITIONSSERVCS.S35REFCODE" +
     ", ENTECHCONDITIONSSERVCS.AIRLINE150REFCODE" +
     ", ENTECHCONDITIONSSERVCS.CABLELINE150REFCODE" +
     ", ENTECHCONDITIONSSERVCS.S150REFCODE" +
     ", ENTECHCONDITIONSSERVCS.ISDISCONNECTIONNEEDED " +

    " FROM ENTECHCONDITIONSSERVCS " +
    " left join ENWARRANT on ENWARRANT.CODE = ENTECHCONDITIONSSERVCS.WARRANTREFCODE " +
    " left join ENTECHCONDRESPONSIBLES on ENTECHCONDRESPONSIBLES.CODE = ENTECHCONDITIONSSERVCS.TECHCONDRESPONSBLSRFCD " +
    ", ENELEMENT " +
    ", ENDEPARTMENT " +
    //", ENWARRANT " +
    ", ENTECHCONDTNSSRVCSSTTS " +
    ", ENTECHCONDITINSSRVCSTP " +
    ", ENTECHCONTRAGENTFORM " +
    ", ENTECHCONTRAGENTTYPE " +
    ", ENCONNECTIONKIND " +

    "";
     whereStr = " ENELEMENT.CODE = ENTECHCONDITIONSSERVCS.ELEMENTCODE" ; //+
     whereStr = whereStr +" AND ENDEPARTMENT.CODE = ENTECHCONDITIONSSERVCS.DEPARTMENTCODE" ; //+
     //whereStr = whereStr +" AND ENWARRANT.CODE = ENTECHCONDITIONSSERVCS.WARRANTREFCODE" ; //+
     whereStr = whereStr +" AND ENTECHCONDTNSSRVCSSTTS.CODE = ENTECHCONDITIONSSERVCS.TECHCONDSERVICESSTTSCD" ; //+
     whereStr = whereStr +" AND ENTECHCONDITINSSRVCSTP.CODE = ENTECHCONDITIONSSERVCS.TECHCONDSERVICESTYPECD" ; //+
     whereStr = whereStr +" AND ENTECHCONTRAGENTFORM.CODE = ENTECHCONDITIONSSERVCS.CONTRAGENTFORMCODE" ; //+
     whereStr = whereStr +" AND ENTECHCONTRAGENTTYPE.CODE = ENTECHCONDITIONSSERVCS.CONTRAGENTTYPEREFCODE" ; //+
     whereStr = whereStr +" AND ENCONNECTIONKIND.CODE = ENTECHCONDITIONSSERVCS.CONNECTIONKINDREFCODE" ; //+

     //whereStr = whereStr +" AND ENTECHCONDRESPONSIBLES.CODE = ENTECHCONDITIONSSERVCS.TECHCONDRESPONSBLSRFCD" ; //+

     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.CODE = ?";
       }
        if (aFilterObject.contractNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.CONTRACTNUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.CONTRACTNUMBER) LIKE UPPER(?)";
        }
       if(aFilterObject.contractDate != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.CONTRACTDATE = ?";
       }
        if (aFilterObject.finContractNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finContractNumber.indexOf('*',0) < 0 && aFilterObject.finContractNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER) LIKE UPPER(?)";
        }
       if(aFilterObject.finContractDate != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.FINCONTRACTDATE = ?";
       }
        if (aFilterObject.partnerName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.partnerName.indexOf('*',0) < 0 && aFilterObject.partnerName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.PARTNERNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.PARTNERNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.partnerCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.PARTNERCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.PARTNERCODE) LIKE UPPER(?)";
        }
        if (aFilterObject.finDocCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.FINDOCCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.FINDOCCODE) LIKE UPPER(?)";
        }
       if(aFilterObject.finDocID != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.FINDOCID = ?";
       }
        if (aFilterObject.finCommentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finCommentGen.indexOf('*',0) < 0 && aFilterObject.finCommentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.FINCOMMENTGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.FINCOMMENTGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.tySummaGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.TYSUMMAGEN = ?";
       }
       if(aFilterObject.tySummaVat != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.TYSUMMAVAT = ?";
       }
       if(aFilterObject.tyServicesSumma != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.TYSERVICESSUMMA = ?";
       }
       if(aFilterObject.tyServicesPower != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.TYSERVICESPOWER = ?";
       }
        if (aFilterObject.commentServicesGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentServicesGen.indexOf('*',0) < 0 && aFilterObject.commentServicesGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN) LIKE UPPER(?)";
        }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.USERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.USERGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.DATEEDIT = ?";
       }
       if(aFilterObject.cnPackCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.CNPACKCODE = ?";
       }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.DOMAIN_INFO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.DOMAIN_INFO) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.MODIFY_TIME = ?";
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.ELEMENTCODE = ? ";
       }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.DEPARTMENTCODE = ? ";
       }
       if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.WARRANTREFCODE = ? ";
       }
       if(aFilterObject.techCondServicesStatus.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.TECHCONDSERVICESSTTSCD = ? ";
       }
       if(aFilterObject.techCondServicesType.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.TECHCONDSERVICESTYPECD = ? ";
       }
       if(aFilterObject.contragentForm.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CONTRAGENTFORMCODE = ? ";
       }
       if(aFilterObject.techCondResponsiblesRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.TECHCONDRESPONSBLSRFCD = ? ";
       }
       /*
       if(aFilterObject.cnSubsystemCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.CNSUBSYSTEMCODE = ?";
       }
        if (aFilterObject.cnSubsystemName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.cnSubsystemName.indexOf('*',0) < 0 && aFilterObject.cnSubsystemName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENTECHCONDITIONSSERVCS.CNSUBSYSTEMNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENTECHCONDITIONSSERVCS.CNSUBSYSTEMNAME) LIKE UPPER(?)";
        }
        */
       if(aFilterObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CNSUBSYSTEMTYPEREFCODE = ? ";
       }
       if(aFilterObject.contragentTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CONTRAGENTTYPEREFCODE = ? ";
       }
       if(aFilterObject.connectionKindRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CONNECTIONKINDREFCODE = ? ";
       }

       if(aFilterObject.buildersArea != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.BUILDERSAREA = ?";
       }
       if(aFilterObject.isSea != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.ISSEA = ?";
       }

    if(aFilterObject.baseStation != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.BASESTATION = ?";
        }

    if(aFilterObject.smallArchFrm != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDITIONSSERVCS.SMALLARCHFRM = ?";
        }

        if(aFilterObject.airLine04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.AIRLINE04REFCODE = ? ";
        }
        if(aFilterObject.cableLine04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CABLELINE04REFCODE = ? ";
        }
        if(aFilterObject.trRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.TRREFCODE = ? ";
        }
        if(aFilterObject.s04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.S04REFCODE = ? ";
        }
        if(aFilterObject.airLine10Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.AIRLINE10REFCODE = ? ";
        }
        if(aFilterObject.cableLine10Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CABLELINE10REFCODE = ? ";
        }
        if(aFilterObject.s35Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.S35REFCODE = ? ";
        }
        if(aFilterObject.airLine150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.AIRLINE150REFCODE = ? ";
        }
        if(aFilterObject.cableLine150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.CABLELINE150REFCODE = ? ";
        }
        if(aFilterObject.s150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.S150REFCODE = ? ";
        }
        if(aFilterObject.isDisconnectionNeeded != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDITIONSSERVCS.ISDISCONNECTIONNEEDED = ? ";
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

          if(aFilterObject.contractNumber != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.contractNumber);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.contractDate != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.contractDate.getTime()));
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

          if(aFilterObject.finDocCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.finDocCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.finDocID != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.finDocID);
        }

          if(aFilterObject.finCommentGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.finCommentGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.tySummaGen != null){
           number++;
           aFilterObject.tySummaGen = aFilterObject.tySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.tySummaGen);
       }
       if(aFilterObject.tySummaVat != null){
           number++;
           aFilterObject.tySummaVat = aFilterObject.tySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.tySummaVat);
       }
       if(aFilterObject.tyServicesSumma != null){
           number++;
           aFilterObject.tyServicesSumma = aFilterObject.tyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.tyServicesSumma);
       }
       if(aFilterObject.tyServicesPower != null){
           number++;
           aFilterObject.tyServicesPower = aFilterObject.tyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.tyServicesPower);
       }

          if(aFilterObject.commentServicesGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.commentServicesGen);
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
       if(aFilterObject.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
       }
        if(aFilterObject.cnPackCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.cnPackCode);
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
      if(aFilterObject.element.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.element.code);
      }
      if(aFilterObject.department.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.department.code);
      }
      if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.warrantRef.code);
      }
      if(aFilterObject.techCondServicesStatus.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.techCondServicesStatus.code);
      }
      if(aFilterObject.techCondServicesType.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.techCondServicesType.code);
      }
      if(aFilterObject.contragentForm.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.contragentForm.code);
      }
      if(aFilterObject.techCondResponsiblesRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.techCondResponsiblesRef.code);
      }
      /*
      if(aFilterObject.cnSubsystemCode != Integer.MIN_VALUE){
          number++;
          statement.setInt(number,aFilterObject.cnSubsystemCode);
      }
        if(aFilterObject.cnSubsystemName != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.cnSubsystemName);
            for(int i = 0;i < likeStr.length();i++){
                if(likeStr.charAt(i) == '*')
                    likeStr.setCharAt(i,'%');
                if(likeStr.charAt(i) == '?')
                    likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }
    */
      if(aFilterObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.cnSubsystemTypeRef.code);
      }
      if(aFilterObject.contragentTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.contragentTypeRef.code);
      }
      if(aFilterObject.connectionKindRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.connectionKindRef.code);
      }

      if(aFilterObject.buildersArea != Integer.MIN_VALUE){
          number++;
          statement.setInt(number,aFilterObject.buildersArea);
      }
      if(aFilterObject.isSea != Integer.MIN_VALUE){
          number++;
          statement.setInt(number,aFilterObject.isSea);
      }

    if(aFilterObject.baseStation != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.baseStation);
      }
      if(aFilterObject.smallArchFrm != Integer.MIN_VALUE){
        number++;
          statement.setInt(number,aFilterObject.smallArchFrm);
    }

    if(aFilterObject.airLine04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine04Ref.code);
       }
       if(aFilterObject.cableLine04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine04Ref.code);
       }
       if(aFilterObject.trRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trRef.code);
       }
       if(aFilterObject.s04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s04Ref.code);
       }
       if(aFilterObject.airLine10Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine10Ref.code);
       }
       if(aFilterObject.cableLine10Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine10Ref.code);
       }
       if(aFilterObject.s35Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s35Ref.code);
       }
       if(aFilterObject.airLine150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine150Ref.code);
       }
       if(aFilterObject.cableLine150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine150Ref.code);
       }
       if(aFilterObject.s150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s150Ref.code);
       }
       if(aFilterObject.isDisconnectionNeeded != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.isDisconnectionNeeded);
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

       anObject = new ENTechConditionsServicesShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.contractNumber = set.getString(2);
       anObject.contractDate = set.getDate(3);
       anObject.finContractNumber = set.getString(4);
       anObject.finContractDate = set.getDate(5);
       anObject.partnerName = set.getString(6);
       anObject.partnerCode = set.getString(7);
       anObject.finDocCode = set.getString(8);
       anObject.finDocID = set.getInt(9);
       if ( set.wasNull() )
           anObject.finDocID = Integer.MIN_VALUE;
       anObject.finCommentGen = set.getString(10);
       anObject.tySummaGen = set.getBigDecimal(11);
       if(anObject.tySummaGen != null)
           anObject.tySummaGen = anObject.tySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.tySummaVat = set.getBigDecimal(12);
       if(anObject.tySummaVat != null)
           anObject.tySummaVat = anObject.tySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.tyServicesSumma = set.getBigDecimal(13);
       if(anObject.tyServicesSumma != null)
           anObject.tyServicesSumma = anObject.tyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.tyServicesPower = set.getBigDecimal(14);
       if(anObject.tyServicesPower != null)
           anObject.tyServicesPower = anObject.tyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.commentServicesGen = set.getString(15);
       anObject.userGen = set.getString(16);
       anObject.dateEdit = set.getDate(17);
       anObject.cnPackCode = set.getInt(18);
       if ( set.wasNull() )
           anObject.cnPackCode = Integer.MIN_VALUE;

       anObject.elementCode = set.getInt(19);
        if(set.wasNull())
        anObject.elementCode = Integer.MIN_VALUE;
       anObject.departmentCode = set.getInt(20);
        if(set.wasNull())
        anObject.departmentCode = Integer.MIN_VALUE;
       anObject.departmentShortName = set.getString(21);
       anObject.departmentDateStart = set.getDate(22);
       anObject.departmentDateFinal = set.getDate(23);
       anObject.departmentShpzBalans = set.getString(24);
       anObject.departmentKau_table_id_1884 = set.getInt(25);
        if(set.wasNull())
        anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
       anObject.departmentKau_1884 = set.getString(26);
       anObject.departmentName_1884 = set.getString(27);
       anObject.warrantRefCode = set.getInt(28);
        if(set.wasNull())
        anObject.warrantRefCode = Integer.MIN_VALUE;
       anObject.warrantRefNumbergen = set.getString(29);
       anObject.warrantRefName = set.getString(30);
       anObject.warrantRefWarrantFIO = set.getString(31);
       anObject.warrantRefWarrantShortFIO = set.getString(32);
       anObject.warrantRefWarrantPosition = set.getString(33);
       anObject.warrantRefGenitiveFIO = set.getString(34);
       anObject.warrantRefGenitivePosition = set.getString(35);
       anObject.warrantRefPassport = set.getString(36);
       anObject.warrantRefAddress = set.getString(37);
       anObject.warrantRefPower = set.getInt(38);
        if(set.wasNull())
        anObject.warrantRefPower = Integer.MIN_VALUE;
       anObject.warrantRefMaxSum = set.getBigDecimal(39);
       if(anObject.warrantRefMaxSum != null)
         anObject.warrantRefMaxSum = anObject.warrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.techCondServicesStatusCode = set.getInt(40);
        if(set.wasNull())
        anObject.techCondServicesStatusCode = Integer.MIN_VALUE;
       anObject.techCondServicesStatusName = set.getString(41);
       anObject.techCondServicesTypeCode = set.getInt(42);
        if(set.wasNull())
        anObject.techCondServicesTypeCode = Integer.MIN_VALUE;
       anObject.techCondServicesTypeName = set.getString(43);
       anObject.contragentFormCode = set.getInt(44);
        if(set.wasNull())
        anObject.contragentFormCode = Integer.MIN_VALUE;
       anObject.contragentFormName = set.getString(45);
       anObject.techCondResponsiblesRefCode = set.getInt(46);
        if(set.wasNull())
        anObject.techCondResponsiblesRefCode = Integer.MIN_VALUE;
       anObject.techCondResponsiblesRefResponsibleFIO = set.getString(47);
       anObject.techCondResponsiblesRefResponsibleTabNumber = set.getInt(48);
        if(set.wasNull())
        anObject.techCondResponsiblesRefResponsibleTabNumber = Integer.MIN_VALUE;
       anObject.techCondResponsiblesRefResponsiblePosition = set.getString(49);
       anObject.techCondResponsiblesRefResponsibleDepName = set.getString(50);
       anObject.techCondResponsiblesRefResponsibleDepCode = set.getString(51);
       anObject.techCondResponsiblesRefPower = set.getInt(52);
        if(set.wasNull())
        anObject.techCondResponsiblesRefPower = Integer.MIN_VALUE;

       anObject.contragentName = set.getString(53);
       anObject.contragentOkpo = set.getString(54);

       /*
       anObject.cnSubsystemCode = set.getInt(55);
       if ( set.wasNull() )
           anObject.cnSubsystemCode = Integer.MIN_VALUE;
       anObject.cnSubsystemName = set.getString(56);
       */

       anObject.cnSubsystemTypeRefCode = set.getInt(55);
        if(set.wasNull())
        anObject.cnSubsystemTypeRefCode = Integer.MIN_VALUE;
       anObject.cnSubsystemTypeRefName = set.getString(56);
       anObject.dateEndPriconnection = set.getDate(57);

       anObject.contragentTypeRefCode = set.getInt(58);
        if(set.wasNull())
        anObject.contragentTypeRefCode = Integer.MIN_VALUE;
       anObject.contragentTypeRefName = set.getString(59);

       anObject.connectionKindRefCode = set.getInt(60);
        if(set.wasNull())
        anObject.connectionKindRefCode = Integer.MIN_VALUE;
       anObject.connectionKindRefName = set.getString(61);

       anObject.buildersArea = set.getInt(62);
       if (set.wasNull())
           anObject.buildersArea = Integer.MIN_VALUE;

       anObject.isSea = set.getInt(63);
       if ( set.wasNull() )
           anObject.isSea = Integer.MIN_VALUE;

       anObject.calcTypeRefCode = set.getInt(64);
          if (set.wasNull())
         anObject.calcTypeRefCode = Integer.MIN_VALUE;
       anObject.calcTypeRefName = set.getString(65);

    anObject.baseStation = set.getInt(66);
    if ( set.wasNull() )
        anObject.baseStation = Integer.MIN_VALUE;
    anObject.smallArchFrm = set.getInt(67);
    if ( set.wasNull() )
        anObject.smallArchFrm = Integer.MIN_VALUE;

    anObject.airLine04RefCode = set.getInt(68);
        if(set.wasNull())
        anObject.airLine04RefCode = Integer.MIN_VALUE;
        anObject.cableLine04RefCode = set.getInt(69);
        if(set.wasNull())
        anObject.cableLine04RefCode = Integer.MIN_VALUE;
        anObject.trRefCode = set.getInt(70);
        if(set.wasNull())
        anObject.trRefCode = Integer.MIN_VALUE;
        anObject.s04RefCode = set.getInt(71);
        if(set.wasNull())
        anObject.s04RefCode = Integer.MIN_VALUE;
        anObject.airLine10RefCode = set.getInt(72);
        if(set.wasNull())
        anObject.airLine10RefCode = Integer.MIN_VALUE;
        anObject.cableLine10RefCode = set.getInt(73);
        if(set.wasNull())
        anObject.cableLine10RefCode = Integer.MIN_VALUE;
        anObject.s35RefCode = set.getInt(74);
        if(set.wasNull())
        anObject.s35RefCode = Integer.MIN_VALUE;
        anObject.airLine150RefCode = set.getInt(75);
        if(set.wasNull())
        anObject.airLine150RefCode = Integer.MIN_VALUE;
        anObject.cableLine150RefCode = set.getInt(76);
        if(set.wasNull())
        anObject.cableLine150RefCode = Integer.MIN_VALUE;
        anObject.s150RefCode = set.getInt(77);
        if(set.wasNull())
        anObject.s150RefCode = Integer.MIN_VALUE;

        anObject.isDisconnectionNeeded = set.getInt(78);
        if(set.wasNull())
        anObject.isDisconnectionNeeded = Integer.MIN_VALUE;


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


  public String _collectAutoIncrementNumber()
          throws PersistenceException {

      SequenceKey hashKey = new SequenceKey("ENTECHCONDITIONSSERVCS", "CONTRACTNUMBER");
      Integer nextSeqValue = null;
      SequenceValue sequenceValue;
      synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
          if (sequenceValue == null) {
              sequenceValue = getNewSequenceValue("ENTECHCONDITIONSSERVCS", "CONTRACTNUMBER");
              _sequenceTable.put(hashKey, sequenceValue);
          }
          if (!sequenceValue.isNextValueAvailable()) {
              sequenceValue = getNewSequenceValue("ENTECHCONDITIONSSERVCS", "CONTRACTNUMBER");
              _sequenceTable.put(hashKey, sequenceValue);
          }
      }

      nextSeqValue = sequenceValue.getNextValue();
      if (nextSeqValue == null) {
          throw new PersistenceException(
                  "Can't obtain auto increment value from: ENTECHCONDITIONSSERVCS");
      } else {

          return nextSeqValue.toString();
      }
  }


    public String getActsListByCnPackCode(int cnPackCode, int cnSubsystemCode)
            throws PersistenceException {

        if (cnPackCode == Integer.MIN_VALUE)
        {
            // throw new EnergyproSystemException("Не задано код пакета");
            return "";
        }

        if (cnSubsystemCode == Integer.MIN_VALUE)
        {
            // throw new EnergyproSystemException("Не задано код підсистеми");
            return "";
        }

        Connection connection = getConnection();
        PreparedStatement statement = null;
        String actCodes = "";

        try {
            String selectStr = " select a.numbergen " +
                    " from enact a where a.statusrefcode = " + ENActStatus.CLOSED +
                    " and a.code in ( " +
                    " select a2pl.actrefcode from enact2enplanwork a2pl where a2pl.plancode in ( " +
                    " select ct2pl.planrefcode from entechcond2planwork ct2pl where ct2pl.techconservicesrefcode in (" +
                    " select s.code from entechconditionsservcs s " +
                    "  where s.cnpackcode = " + cnPackCode + " and s.cnsubsystemtyperefcode = " + cnSubsystemCode + ")))";

            statement = connection.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                if (actCodes != "")
                    actCodes = actCodes + ", ";
                actCodes = actCodes + resultSet.getString(1);
            }

            resultSet.close();

            return actCodes;
        } catch (SQLException e) {
            throw new PersistenceException("Can't get ActsList By CnPackCode",
                    e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    @Override
	public int add(ENTechConditionsServices anObject) throws PersistenceException
    {
        // По дефолту - физ. лицо
        if (anObject.contragentTypeRef == null)
        {
            anObject.contragentTypeRef.code = ENTechContragentType.PHYSICAL;
        }
        if (anObject.contragentTypeRef.code == Integer.MIN_VALUE)
        {
            anObject.contragentTypeRef.code = ENTechContragentType.PHYSICAL;
        }

        /** добавление и проверка договора на наличие в АХ и ФК */
        //// DEBUG !!!!!

        if ( 1 == 1 ) {
    	    if (anObject.finDocCode != null && !anObject.finDocCode.equals("")) {

    	    	if (anObject.finContractNumber != null && !anObject.finContractNumber.equals("")) {

    	    		boolean isCustomer = true;
    	    		boolean isException = true;
    	        	ContractLogic contractLogic = new ContractLogic(getConnection(), getUserProfile());
    					anObject.generalContractRef.code = contractLogic
    							.addByContractNumber(anObject.finContractNumber, anObject.partnerCode, anObject.finDocCode, isCustomer, isException);

    	        }
    	    }
        }

        return super.add(anObject);
    }


    @Override
	public void save(ENTechConditionsServices anObject) throws PersistenceException
    {
        // По дефолту - физ. лицо
        if (anObject.contragentTypeRef == null)
        {
            anObject.contragentTypeRef.code = ENTechContragentType.PHYSICAL;
        }
        if (anObject.contragentTypeRef.code == Integer.MIN_VALUE)
        {
            anObject.contragentTypeRef.code = ENTechContragentType.PHYSICAL;
        }

        /** 23.04.2013 +++ непонятно откуда заходит номер договора из ФК!?!?!?! */
        if(anObject.contractNumber.contains("/")) {
            throw new EnergyproSystemException("\n "
                    + "\n Ви користуєтеся застарілою версією EnergyNet!!!", getUserProfile());
        }

        /** добавление и проверка договора на наличие в АХ и ФК */
        //// DEBUG !!!!!

        if ( 1 == 1 ) {
    	    if (anObject.finDocCode != null && !anObject.finDocCode.equals("")) {

    	    	if (anObject.finContractNumber != null && !anObject.finContractNumber.equals("")) {

    	    		boolean isCustomer = true;
    	    		boolean isException = true;
    	        	ContractLogic contractLogic = new ContractLogic(getConnection(), getUserProfile());
    					anObject.generalContractRef.code = contractLogic
    							.addByContractNumber(anObject.finContractNumber, anObject.partnerCode, anObject.finDocCode, isCustomer, isException);

    	        }
    	    }
        }

        super.save(anObject);
    }


    public void fastUpdatePaySum(int code, BigDecimal paySum, int calcTypeCode)
            throws PersistenceException, DatasourceConnectException {
        String sqlStr = null;
        PreparedStatement statement = null;
        Connection connection = getConnection();

        try {

            /** сумма платы заходит без НДС, в тыс.грн */ /**NET-4284 USE_NDS??? непонятно к чему привязываться для определения НДС  */
            BigDecimal summaGen = (paySum.multiply(new BigDecimal(1000))).multiply(new BigDecimal(1.2)).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            BigDecimal summaVat = summaGen.subtract(paySum.multiply(new BigDecimal(1000))).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            BigDecimal servicesSumma = summaGen;

            sqlStr = " update entechconditionsservcs set " +
                    " tysummagen = " + summaGen + ", tysummavat = " + summaVat +
                       ", tyservicessumma = " + servicesSumma + ", calctyperefcode = " + calcTypeCode +
                    " where code = " + code;

            statement = connection.prepareStatement(sqlStr);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new PersistenceException(
                    "Can't perform fast Update PaySum", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }
    
    public ENTechConditionsServices getENTechConditionsServicesByPlan(ENPlanWork plan) throws PersistenceException {
    	if(plan == null) {
    		throw new java.lang.NullPointerException("plan is null");
    	}
    	
    	ENTechCond2PlanWorkDAO tech2PlanDao = new ENTechCond2PlanWorkDAO(getConnection(), getUserProfile());
    	ENTechCond2PlanWorkFilter tech2PlanFilter = new ENTechCond2PlanWorkFilter();
    	tech2PlanFilter.planRef.code = plan.code;
    	ENTechCond2PlanWorkShortList tech2PlanList = tech2PlanDao.getScrollableFilteredList(tech2PlanFilter, 0, -1);
    	if(tech2PlanList.totalCount > 1) {
    		throw new SystemException(String.format("Помилка у кількості приєднань для плану з кодом %d", plan.code));
    	} else {
    		if(tech2PlanList.totalCount == 0) {
    			return null;
    		} else {
    			return this.getObject(tech2PlanList.get(0).techConServicesRefCode);
    		}
    	}    	
    }

    /**
     *
     * Возвращает договор найденый по номеру и дате.
     *
     * @param contractNumber номер договора присоединения
     * @param contractDate дата договора присоединения
     * @param isThrowException если true, то выбьет исключение при нахождении нескольких договоров
     * или при отсутствии, если false, то метод вернет либо null (договор не найден) либо первый из списка найденных
     * @return договор по номеру и дате
     * @throws PersistenceException
     */
    public ENTechConditionsServices getObjectByContractNumberAndDate(String contractNumber, Date contractDate, boolean isThrowException) throws PersistenceException {
    	if(contractNumber == null || contractDate == null) {
    		throw new java.lang.IllegalArgumentException("Argument is null");
    	}
    	ENTechConditionsServices out = null;
    	ENTechConditionsServicesFilter filter = new ENTechConditionsServicesFilter();
    	filter.contractNumber = contractNumber;
    	filter.contractDate = contractDate;
    	/*SUPP-53408 Исключим из выборки договора со статусом отмененный*/
    	filter.conditionSQL = String.format(" exists (select 1 from %s as sotc1 inner join %s as so1 on sotc1.%s = so1.%s where sotc1.%s = %s and so1.%s <> ?)"
    			, ENServicesObject2TechCondtnsServices.tableName, ENServicesObject.tableName, ENServicesObject2TechCondtnsServices.servicesObjectRef_Field
    			, ENServicesObject.code_Field, ENServicesObject2TechCondtnsServices.techCondServRef_Field, ENTechConditionsServices.code_QFielld
    			, ENServicesObject.contractStatusRef_Field);
    	Vector<Object> bindedParams = new Vector<Object>();
    	bindedParams.add(ENServicesContractStatus.CANCELED);
    	int[] codes = this.getFilteredCodeArray(filter, filter.conditionSQL, filter.orderBySQL, 0, -1, bindedParams);
    	
		// SUPP-82368 Если договор не найден, то осуществляется еще одна попытка найти среди отмененных 
    	if(codes.length == 0) {
    		filter.conditionSQL = filter.conditionSQL.replace("<>", "=");
    		codes = this.getFilteredCodeArray(filter, filter.conditionSQL, filter.orderBySQL, 0, -1, bindedParams);
    	}
    	
    	if(codes.length == 0) {
    		        	
    		if(isThrowException) {
        		throw new SystemException(String.format("Не найдено договора по номеру %s и даты %s", contractNumber, new SimpleDateFormat("dd.MM.yyyy").format(contractDate)));
    		}
    	} else {
    		if(codes.length > 1) {
    			if(isThrowException) {
    				throw new SystemException(String.format("По номеру %s и даты %s найдено более 1го договора (всего: %d)", contractNumber, new SimpleDateFormat("dd.MM.yyyy").format(contractDate), codes.length));
    			}
    		}
    	}
    	
    	
    	out = (codes.length == 0) ? null : this.getObject(codes[0]);
    	return out;
    }
    
    public ENTechConditionsServices getObjectByENEServicesObject(ENServicesObject servicesObject) throws PersistenceException {
    	ENTechConditionsServices out = null;
    	
    	ENServicesObject2TechCondtnsServicesDAO so2TechDao = new ENServicesObject2TechCondtnsServicesDAO(getUserProfile(), getConnection());
    	ENServicesObject2TechCondtnsServicesFilter so2TechFilter = new ENServicesObject2TechCondtnsServicesFilter();
    	so2TechFilter.servicesObjectRef.code = servicesObject.code;
    	ENServicesObject2TechCondtnsServicesShortList so2TechList = so2TechDao.getFilteredList(so2TechFilter);
    	if(so2TechList.totalCount > 0) {
    		if(so2TechList.totalCount > 1) {
    			throw new SystemException(String.format("Помилка у кількості записів для договору № %s - %d"
    					, servicesObject.contractNumberServices, so2TechList.totalCount));
    		}
    		
    		out = this.getObject(so2TechList.get(0).techCondServRefCode);
    	}
    	
    	
    	return out;
    }
    
    public ENTechConditionsServices getObjectByRQFKOrder(RQFKOrder fkOrder) throws PersistenceException {
    	ENTechConditionsServices out = null;
    	
    	RQFKOrder2PlanFactDAO fkOrder2PlanDao = new RQFKOrder2PlanFactDAO(getConnection(), getUserProfile());
    	RQFKOrder2PlanFactFilter fkOrder2PlanFilter = new RQFKOrder2PlanFactFilter();
    	fkOrder2PlanFilter.fkorder.code = fkOrder.code;
    	RQFKOrder2PlanFactShortList fkOrder2PlanList = fkOrder2PlanDao.getScrollableFilteredList(fkOrder2PlanFilter, 0, -1);
    	for(RQFKOrder2PlanFactShort item : fkOrder2PlanList.list) {
    		ENPlanWork plan = new ENPlanWork();
    		plan.code = item.planCode;
    		ENTechConditionsServices techCond = this.getENTechConditionsServicesByPlan(plan);
    		if(techCond != null) {
    			out = techCond;
    			break;
    		}
    	}
    	return out;
    }
    
    /**
     * 
     * Получить коллекцию объектов по акту
     * 
     * @param act {@link ENAct} акт
     * @return коллекция объектов тех. условий {@link ENTechConditionsServices}
     * @throws PersistenceException
     */
    public Set<ENTechConditionsServices> getObjectsByENAct(ENAct act) throws PersistenceException {
    	Set<ENTechConditionsServices> out = new HashSet<ENTechConditionsServices>();
    	List<Integer> list = new ArrayList<Integer>();
    	
    	ENAct2ENPlanWorkDAO act2PlanDao = new ENAct2ENPlanWorkDAO(getConnection(), getUserProfile());
    	ENAct2ENPlanWorkFilter act2PlanFilter = new ENAct2ENPlanWorkFilter();
    	act2PlanFilter.actRef.code = act.code;
    	ENAct2ENPlanWorkShortList act2PlanList = act2PlanDao.getScrollableFilteredList(act2PlanFilter, 0, -1);
    	for(ENAct2ENPlanWorkShort item : act2PlanList.list) {
    		ENPlanWork plan = new ENPlanWork();
    		plan.code = item.planCode;
    		ENTechConditionsServices techCond = this.getENTechConditionsServicesByPlan(plan);
    		if(techCond != null && !list.contains(techCond.code)) {
    			out.add(techCond);
    			list.add(techCond.code);
    		}
    	}
    	return out;
    }

    public void fastUpdatePaySumBy2Substations(int code, BigDecimal paySum, int calcTypeCode)
            throws PersistenceException, DatasourceConnectException {
        String sqlStr = null;
        String selectStr = null;
        BigDecimal paySum2 = new BigDecimal(0);
        PreparedStatement statement = null;
        PreparedStatement stm = null;
        ResultSet resultSet = null;
        Connection connection = getConnection();

        try {

            selectStr = "select sum(coalesce(paysum,0)) from enpriconnectiondata " +
                    " where isprimarysubstation = " + ENPriconnectionData.PRIMARY_SUBSTATION +
                    " and techcondservrefcode = " + code;
            stm = connection.prepareStatement(selectStr);
            resultSet = stm.executeQuery();
            while (resultSet.next()) {
                paySum2 = resultSet.getBigDecimal(1);
            }
            resultSet.close();
            stm.close();

            if (paySum2 == null)
            {
                paySum2 = new BigDecimal(0);
            }

            BigDecimal totallSum = paySum.add(paySum2);


            /** сумма платы заходит без НДС, в тыс.грн */ /**NET-4284 USE_NDS??? непонятно к чему привязываться для определения НДС  */
            BigDecimal summaGen = (totallSum.multiply(new BigDecimal(1000))).multiply(new BigDecimal(1.2)).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            BigDecimal summaVat = summaGen.subtract(totallSum.multiply(new BigDecimal(1000))).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            BigDecimal servicesSumma = summaGen;

            sqlStr = " update entechconditionsservcs set " +
                    " tysummagen = " + summaGen + ", tysummavat = " + summaVat +
                       ", tyservicessumma = " + servicesSumma + ", calctyperefcode = " + calcTypeCode +
                    " where code = " + code;

            statement = connection.prepareStatement(sqlStr);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new PersistenceException(
                    "Can't perform fast Update PaySum", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }



} // end of ENTechConditionsServicesDAO
