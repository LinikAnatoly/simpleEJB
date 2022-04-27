
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
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENWorkOrderBytItemDAOGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENWorkOrderBytItem;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderBytItemShort;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItemFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytItemShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.valueobject.TKReplaceCounterKind;

/**
 * DAO Object for ENWorkOrderBytItem;
 *
 */

public class ENWorkOrderBytItemDAO extends ENWorkOrderBytItemDAOGen {

    public ENWorkOrderBytItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENWorkOrderBytItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    @Override
	public int add(ENWorkOrderBytItem anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userEdit = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    @Override
	public void save(ENWorkOrderBytItem anObject) throws PersistenceException
    {
        anObject.userEdit = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }


    @Override
	public ENWorkOrderBytItemShortList getScrollableFilteredList(ENWorkOrderBytItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENWorkOrderBytItemShortList result = new ENWorkOrderBytItemShortList();
     ENWorkOrderBytItemShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENWORKORDERBYTITEM.ADDRESS, tcnum, finworkername, ENWORKORDERBYTITEM.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENWORKORDERBYTITEM.CODE"+
      ",ENWORKORDERBYTITEM.CONTRACTNUMBERSERVICES"+
      ",ENWORKORDERBYTITEM.ACCOUNTNUMBER"+
      ",ENWORKORDERBYTITEM.NAME"+
      ",ENWORKORDERBYTITEM.ADDRESS"+
      ",ENWORKORDERBYTITEM.INVNUMBER"+
      ",ENWORKORDERBYTITEM.SERIALNUMBER"+
      ",ENWORKORDERBYTITEM.SEAL"+
      ",ENWORKORDERBYTITEM.PHONE"+
      ",ENWORKORDERBYTITEM.COMMENTGEN"+
      ",ENWORKORDERBYTITEM.DATEADD"+
      ",ENWORKORDERBYTITEM.DATEEDIT"+
      ",ENWORKORDERBYTITEM.USERADD"+
      ",ENWORKORDERBYTITEM.USEREDIT"+

       ", ENWORKORDERBYT.CODE " +
       ", ENWORKORDERBYT.NUMBERGEN " +
       ", ENWORKORDERBYT.DATEGEN " +
       ", ENWORKORDERBYT.COMMENTGEN " +

       ", ENWORKORDERBYTITEM.HUMENITEMREFCODE " +

       ", ENWORKORDERBYTITEM.PLANREFCODE " +

       ", ENWORKORDERBYTITEM.FINWORKERCODE " +
       ", (select FINWORKER.NAME from FINWORKER where FINWORKER.CODE = ENWORKORDERBYTITEM.FINWORKERCODE) as finworkername " +
       ", (select FINWORKER.TABNUMBER from FINWORKER where FINWORKER.CODE = ENWORKORDERBYTITEM.FINWORKERCODE) " +

       ", ENWORKORDERBYTITEM.RECORDPOINTBYTREFCODE " +

       ", ENWORKORDERBYTITEM.SERVICESOBJECTREFCODE " +

       ", ENPLANWORKITEM.CODE " +
       ", (select TKTECHCARD.CODE from TKTECHCARD where TKTECHCARD.CODE = ENPLANWORKITEM.kartarefcode) " +
       ", (select TKTECHCARD.NAME from TKTECHCARD where TKTECHCARD.CODE = ENPLANWORKITEM.kartarefcode) " +
       ", (select TKTECHCARD.TECHKARTNUMBER from TKTECHCARD where TKTECHCARD.CODE = ENPLANWORKITEM.kartarefcode) as tcnum " +

       ", ENWORKORDERBYTITEM.CUSTOMERNAME " +

       ", (select p.typerefcode from enplanwork p where p.code = ENWORKORDERBYTITEM.PLANREFCODE) as plantypecode " +
       ", (select p.staterefcode from enplanwork p where p.code = ENWORKORDERBYTITEM.PLANREFCODE) as planstatecode " +

       ", (select tkp.shortname " +
       "     from enhumenitem hi, tkposition tkp " +
       "    where hi.code = ENWORKORDERBYTITEM.HUMENITEMREFCODE " +
       "      and hi.positiongencode = tkp.code) as positionname " +

       ", ENWORKORDERBYTITEM.SCCOUNTERREFCODE " +
       ", (select sc.sccode from sccounter sc where sc.code = ENWORKORDERBYTITEM.SCCOUNTERREFCODE) " +
       ", (select sc.name from sccounter sc where sc.code = ENWORKORDERBYTITEM.SCCOUNTERREFCODE) " +
       ", (select sc.invnumber from sccounter sc where sc.code = ENWORKORDERBYTITEM.SCCOUNTERREFCODE) " +
       ", (select sc.buildnumber from sccounter sc where sc.code = ENWORKORDERBYTITEM.SCCOUNTERREFCODE) " +
       ", (select sc.molcode from sccounter sc where sc.code = ENWORKORDERBYTITEM.SCCOUNTERREFCODE) " +

	   ", ENWORKORDERBYTITEM.RECORDPOINTPROMREFCODE " +
	   ", ENWORKORDERBYTITEM.RECORDPOINTNAME " +

	   ", coalesce((select coalesce(tcl.code, 0) " +
	   "  from enplanwork2classfctntp tcl, tkclassificationtype t " +
	   " where tcl.classificationtyperfcd = t.code  " +
	   "   and t.replacecounterkindcode = " + TKReplaceCounterKind.REPLACE_COUNTER +
	   "   and tcl.planrefcode in (select p.code from enplanwork p where p.elementrefcode = " +
	   "     (select s.elementcode from enservicesobject s " +
	   "	   where s.code = enworkorderbytitem.servicesobjectrefcode) " +
	   "	    and p.kindcode = " + ENPlanWorkKind.CALCULATION + " ) limit 1), 0) as replaceCounterServices " +
	   
	   ", ENWORKORDERBYTITEM.STATUSCODE " +
	   ", ENWORKORDERBYTITEM.factCode " +
	   ", (select to_char(enplaninformcustomer.timestart, 'dd.MM.yyyy HH24:mi') || ' - '|| to_char(enplaninformcustomer.timefinal,'HH24:mi') from enplaninformcustomer where enplaninformcustomer.planrefcode = ENWORKORDERBYTITEM.planrefcode) " + 

		", ( " +
		"   select p.dategen " +
		"   from enplancorrecthistory pch, enplanwork p " +
		"   where pch.plannewrefcode = ENWORKORDERBYTITEM.planrefcode " +
		"     and pch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_NPW +
		"     and p.code = pch.planoldrefcode " +
		"  ) as monthplandategen " +

		", ( " +
		"   select " +
		"     pmh.yeargen || '.' || " +
		"     (case when pmh.monthgen < 10 then '0' else '' end) || " +
		"     pmh.monthgen " +
		"   from enplanworkmovehistory pmh " +
		"   where pmh.planrefcode = ( " +
		"     select pch.planoldrefcode " +
		"     from enplancorrecthistory pch " +
		"     where pch.plannewrefcode = ENWORKORDERBYTITEM.planrefcode " +
		"       and pch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_NPW +
		"   ) " +
		"   order by pmh.dategen desc, pmh.code desc " +
		"   limit 1 " +
		"  ) as previousperiod " + 
      
      
      " FROM ENWORKORDERBYTITEM " +
      ", ENWORKORDERBYT " +
      //", ENHUMENITEM " +
      ", ENPLANWORKITEM " +
      //", ENPLANWORK " +
      //", FINWORKER " +
      //", ENRECORDPOINTBYT " +
      //", ENSERVICESOBJECT " +
      //" WHERE "
   "";
      whereStr = " ENWORKORDERBYT.CODE = ENWORKORDERBYTITEM.WORKORDERBYTREFCODE" ; //+
      //whereStr = whereStr +" AND ENHUMENITEM.CODE = ENWORKORDERBYTITEM.HUMENITEMREFCODE" ; //+
      whereStr = whereStr +" AND ENPLANWORKITEM.CODE = ENWORKORDERBYTITEM.PLANITEMREFCODE" ; //+
      //whereStr = whereStr +" AND ENHUMENITEM.PLANITEMREFCODE = ENPLANWORKITEM.CODE" ; //+
       //whereStr = whereStr +" AND ENPLANWORK.CODE = ENWORKORDERBYTITEM.PLANREFCODE" ; //+
       //whereStr = whereStr +" AND FINWORKER.CODE = ENWORKORDERBYTITEM.FINWORKERCODE" ; //+
       //whereStr = whereStr +" AND ENRECORDPOINTBYT.CODE = ENWORKORDERBYTITEM.RECORDPOINTBYTREFCODE" ; //+
       //whereStr = whereStr +" AND ENSERVICESOBJECT.CODE = ENWORKORDERBYTITEM.SERVICESOBJECTREFCODE" ; //+
     //selectStr = selectStr + " ${s} ENWORKORDERBYTITEM.CODE IN ( SELECT ENWORKORDERBYTITEM.CODE FROM ENWORKORDERBYTITEM ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYTITEM.CODE = ?";
         }
          if (aFilterObject.contractNumberServices != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.contractNumberServices.indexOf('*',0) < 0 && aFilterObject.contractNumberServices.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.CONTRACTNUMBERSERVICES) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.CONTRACTNUMBERSERVICES) LIKE UPPER(?)";
          }
          if (aFilterObject.accountNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.accountNumber.indexOf('*',0) < 0 && aFilterObject.accountNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.ACCOUNTNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.ACCOUNTNUMBER) LIKE UPPER(?)";
          }
          if (aFilterObject.name != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.NAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.NAME) LIKE UPPER(?)";
          }
          if (aFilterObject.customerName != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.customerName.indexOf('*',0) < 0 && aFilterObject.customerName.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.CUSTOMERNAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.CUSTOMERNAME) LIKE UPPER(?)";
          }
          if (aFilterObject.address != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.ADDRESS) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.ADDRESS) LIKE UPPER(?)";
          }
          if (aFilterObject.invNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.INVNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.INVNUMBER) LIKE UPPER(?)";
          }
          if (aFilterObject.serialNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.SERIALNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.SERIALNUMBER) LIKE UPPER(?)";
          }
          if (aFilterObject.seal != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.seal.indexOf('*',0) < 0 && aFilterObject.seal.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.SEAL) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.SEAL) LIKE UPPER(?)";
          }
          if (aFilterObject.phone != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.phone.indexOf('*',0) < 0 && aFilterObject.phone.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.PHONE) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.PHONE) LIKE UPPER(?)";
          }
          if (aFilterObject.recordPointName != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.recordPointName.indexOf('*',0) < 0 && aFilterObject.recordPointName.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.RECORDPOINTNAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.RECORDPOINTNAME) LIKE UPPER(?)";
          }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.COMMENTGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.COMMENTGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateAdd != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYTITEM.DATEADD = ?";
         }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYTITEM.DATEEDIT = ?";
         }
          if (aFilterObject.userAdd != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.USERADD) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.USERADD) LIKE UPPER(?)";
          }
          if (aFilterObject.userEdit != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userEdit.indexOf('*',0) < 0 && aFilterObject.userEdit.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.USEREDIT) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.USEREDIT) LIKE UPPER(?)";
          }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYTITEM.MODIFY_TIME = ?";
         }
         if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.WORKORDERBYTREFCODE = ? ";
         }
         if(aFilterObject.humenItemRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.HUMENITEMREFCODE = ? ";
         }
         if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.PLANREFCODE = ? ";
         }
         if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.FINWORKERCODE = ? ";
         }
         if(aFilterObject.recordPointBytRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.RECORDPOINTBYTREFCODE = ? ";
         }
         if(aFilterObject.recordPointPromRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.RECORDPOINTPROMREFCODE = ? ";
         }
         if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.SERVICESOBJECTREFCODE = ? ";
         }
         if(aFilterObject.scCounterRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.SCCOUNTERREFCODE = ? ";
         }
         if(aFilterObject.statuscode != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.STATUSCODE = ? ";
         }
         if(aFilterObject.factCode != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.factCode = ? ";
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

            if(aFilterObject.contractNumberServices != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.contractNumberServices);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.accountNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.accountNumber);
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

            if(aFilterObject.customerName != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.customerName);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.address != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.address);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
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

            if(aFilterObject.serialNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.serialNumber);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.seal != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.seal);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.phone != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.phone);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.recordPointName != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.recordPointName);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
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
         if(aFilterObject.dateAdd != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
         }
         if(aFilterObject.dateEdit != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
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

            if(aFilterObject.userEdit != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userEdit);
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
        if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.workOrderBytRef.code);
        }
        if(aFilterObject.humenItemRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.humenItemRef.code);
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planRef.code);
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.finWorker.code);
        }
        if(aFilterObject.recordPointBytRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.recordPointBytRef.code);
        }
        if(aFilterObject.recordPointPromRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.recordPointPromRef.code);
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.servicesObjectRef.code);
        }
        if(aFilterObject.scCounterRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.scCounterRef.code);
        }
        if(aFilterObject.statuscode != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.statuscode);
        }
        if(aFilterObject.factCode != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.factCode);
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

         anObject = new ENWorkOrderBytItemShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.contractNumberServices = set.getString(2);
         anObject.accountNumber = set.getString(3);
         anObject.name = set.getString(4);
         anObject.address = set.getString(5);
         anObject.invNumber = set.getString(6);
         anObject.serialNumber = set.getString(7);
         anObject.seal = set.getString(8);
         anObject.phone = set.getString(9);
         anObject.commentGen = set.getString(10);
         anObject.dateAdd = set.getTimestamp(11);
         anObject.dateEdit = set.getTimestamp(12);
         anObject.userAdd = set.getString(13);
         anObject.userEdit = set.getString(14);

         anObject.workOrderBytRefCode = set.getInt(15);
         if(set.wasNull())
        	 anObject.workOrderBytRefCode = Integer.MIN_VALUE;
         anObject.workOrderBytRefNumberGen = set.getString(16);
         anObject.workOrderBytRefDateGen = set.getDate(17);
         anObject.workOrderBytRefCommentGen = set.getString(18);

         anObject.humenItemRefCode = set.getInt(19);
         if(set.wasNull())
        	 anObject.humenItemRefCode = Integer.MIN_VALUE;

         anObject.planRefCode = set.getInt(20);
         if(set.wasNull())
        	 anObject.planRefCode = Integer.MIN_VALUE;

         anObject.finWorkerCode = set.getInt(21);
         if(set.wasNull())
        	 anObject.finWorkerCode = Integer.MIN_VALUE;
         anObject.finWorkerName = set.getString(22);
         anObject.finWorkerTabNumber = set.getString(23);

         anObject.recordPointBytRefCode = set.getInt(24);
         if(set.wasNull())
        	 anObject.recordPointBytRefCode = Integer.MIN_VALUE;

         anObject.servicesObjectRefCode = set.getInt(25);
         if(set.wasNull())
        	 anObject.servicesObjectRefCode = Integer.MIN_VALUE;

         anObject.planItemRefCode = set.getInt(26);
         if(set.wasNull())
        	 anObject.planItemRefCode = Integer.MIN_VALUE;

         anObject.kartaRefCode = set.getInt(27);
         if(set.wasNull())
        	 anObject.kartaRefCode = Integer.MIN_VALUE;

         anObject.kartaRefName = set.getString(28);
         anObject.kartaRefNum = set.getString(29);

         anObject.customerName = set.getString(30);

         anObject.planRefTypeCode = set.getInt(31);
         if(set.wasNull())
        	 anObject.planRefTypeCode = Integer.MIN_VALUE;

         anObject.planRefStateCode = set.getInt(32);
         if(set.wasNull())
        	 anObject.planRefStateCode = Integer.MIN_VALUE;

         anObject.positionName = set.getString(33);

/*

       ", ENWORKORDERBYTITEM.SCCOUNTERREFCODE " +
       ", (select sc.sccode from sccounter sc where sc.code = ENWORKORDERBYTITEM.SCCOUNTERREFCODE) " +
       ", (select sc.name from sccounter sc where sc.code = ENWORKORDERBYTITEM.SCCOUNTERREFCODE) " +
       ", (select sc.invnumber from sccounter sc where sc.code = ENWORKORDERBYTITEM.SCCOUNTERREFCODE) " +
       ", (select sc.buildnumber from sccounter sc where sc.code = ENWORKORDERBYTITEM.SCCOUNTERREFCODE) " +
       ", (select sc.molcode from sccounter sc where sc.code = ENWORKORDERBYTITEM.SCCOUNTERREFCODE) " +

 */
         anObject.scCounterRefCode = set.getInt(34);
         if(set.wasNull())
        	 anObject.scCounterRefCode = Integer.MIN_VALUE;

         anObject.scCounterRefScCode = set.getInt(35);
         if(set.wasNull())
        	 anObject.scCounterRefScCode = Integer.MIN_VALUE;

         anObject.scCounterRefName = set.getString(36);
         anObject.scCounterRefInvNumber = set.getString(37);
         anObject.scCounterRefBuildNumber = set.getString(38);
         anObject.scCounterRefMolCode = set.getString(39);

         anObject.recordPointPromRefCode = set.getInt(40);
         if(set.wasNull())
        	 anObject.recordPointPromRefCode = Integer.MIN_VALUE;

         anObject.recordPointName = set.getString(41);

		 anObject.replaceCounterServices = set.getInt(42);
		 if (set.wasNull())
			anObject.replaceCounterServices = Integer.MIN_VALUE;
		 
         anObject.statuscode = set.getInt(43);
         if(set.wasNull())
        	 anObject.statuscode = Integer.MIN_VALUE;
         
         anObject.factCode = set.getInt(44);
         if(set.wasNull())
        	 anObject.factCode = Integer.MIN_VALUE;
         
         anObject.smsInformTime = set.getString(45);

         // SUPP-100160 (СЗ-015822)
         anObject.monthPlanDateGen = set.getTimestamp(46);
         anObject.previousPeriod = set.getString(47);

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

    
	public ENWorkOrderBytItemShortList getLightList(ENWorkOrderBytItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
     ENWorkOrderBytItemShortList result = new ENWorkOrderBytItemShortList();
     ENWorkOrderBytItemShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(aFilterObject.conditionSQL);
     String     orderBy = processCondition(aFilterObject.orderBySQL);

     if(orderBy.length() == 0)
      orderBy = "ENWORKORDERBYTITEM.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT " +
      " ENWORKORDERBYTITEM.CODE " +

       ", ENWORKORDERBYT.CODE " +
       ", ENWORKORDERBYT.NUMBERGEN " +
       ", ENWORKORDERBYT.DATEGEN " +

      " FROM ENWORKORDERBYTITEM " +
      ", ENWORKORDERBYT " +
   "";
      whereStr = " ENWORKORDERBYT.CODE = ENWORKORDERBYTITEM.WORKORDERBYTREFCODE" ; //+

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYTITEM.CODE = ?";
         }
          if (aFilterObject.contractNumberServices != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.contractNumberServices.indexOf('*',0) < 0 && aFilterObject.contractNumberServices.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.CONTRACTNUMBERSERVICES) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.CONTRACTNUMBERSERVICES) LIKE UPPER(?)";
          }
          if (aFilterObject.accountNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.accountNumber.indexOf('*',0) < 0 && aFilterObject.accountNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.ACCOUNTNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.ACCOUNTNUMBER) LIKE UPPER(?)";
          }
          if (aFilterObject.name != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.NAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.NAME) LIKE UPPER(?)";
          }
          if (aFilterObject.customerName != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.customerName.indexOf('*',0) < 0 && aFilterObject.customerName.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.CUSTOMERNAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.CUSTOMERNAME) LIKE UPPER(?)";
          }
          if (aFilterObject.address != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.ADDRESS) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.ADDRESS) LIKE UPPER(?)";
          }
          if (aFilterObject.invNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.INVNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.INVNUMBER) LIKE UPPER(?)";
          }
          if (aFilterObject.serialNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.SERIALNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.SERIALNUMBER) LIKE UPPER(?)";
          }
          if (aFilterObject.seal != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.seal.indexOf('*',0) < 0 && aFilterObject.seal.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.SEAL) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.SEAL) LIKE UPPER(?)";
          }
          if (aFilterObject.phone != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.phone.indexOf('*',0) < 0 && aFilterObject.phone.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.PHONE) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.PHONE) LIKE UPPER(?)";
          }
          if (aFilterObject.recordPointName != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.recordPointName.indexOf('*',0) < 0 && aFilterObject.recordPointName.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.RECORDPOINTNAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.RECORDPOINTNAME) LIKE UPPER(?)";
          }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.COMMENTGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.COMMENTGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateAdd != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYTITEM.DATEADD = ?";
         }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYTITEM.DATEEDIT = ?";
         }
          if (aFilterObject.userAdd != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.USERADD) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.USERADD) LIKE UPPER(?)";
          }
          if (aFilterObject.userEdit != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userEdit.indexOf('*',0) < 0 && aFilterObject.userEdit.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.USEREDIT) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.USEREDIT) LIKE UPPER(?)";
          }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYTITEM.MODIFY_TIME = ?";
         }
         if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.WORKORDERBYTREFCODE = ? ";
         }
         if(aFilterObject.humenItemRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.HUMENITEMREFCODE = ? ";
         }
         if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.PLANREFCODE = ? ";
         }
         if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.FINWORKERCODE = ? ";
         }
         if(aFilterObject.recordPointBytRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.RECORDPOINTBYTREFCODE = ? ";
         }
         if(aFilterObject.recordPointPromRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.RECORDPOINTPROMREFCODE = ? ";
         }
         if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.SERVICESOBJECTREFCODE = ? ";
         }
         if(aFilterObject.scCounterRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.SCCOUNTERREFCODE = ? ";
         }
         if(aFilterObject.statuscode != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.STATUSCODE = ? ";
         }
         if(aFilterObject.factCode != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.factCode = ? ";
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

            if(aFilterObject.contractNumberServices != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.contractNumberServices);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.accountNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.accountNumber);
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

            if(aFilterObject.customerName != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.customerName);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.address != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.address);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
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

            if(aFilterObject.serialNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.serialNumber);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.seal != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.seal);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.phone != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.phone);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.recordPointName != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.recordPointName);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
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
         if(aFilterObject.dateAdd != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
         }
         if(aFilterObject.dateEdit != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
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

            if(aFilterObject.userEdit != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userEdit);
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
        if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.workOrderBytRef.code);
        }
        if(aFilterObject.humenItemRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.humenItemRef.code);
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planRef.code);
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.finWorker.code);
        }
        if(aFilterObject.recordPointBytRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.recordPointBytRef.code);
        }
        if(aFilterObject.recordPointPromRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.recordPointPromRef.code);
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.servicesObjectRef.code);
        }
        if(aFilterObject.scCounterRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.scCounterRef.code);
        }
        if(aFilterObject.statuscode != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.statuscode);
        }
        if(aFilterObject.factCode != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.factCode);
        }
       }

       //if(condition.length() > 0 && aBindObjects != null)
       // _bindObjectsToPreparedStatement(statement,aBindObjects,number);

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

         anObject = new ENWorkOrderBytItemShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;

         anObject.workOrderBytRefCode = set.getInt(2);
         if(set.wasNull())
        	 anObject.workOrderBytRefCode = Integer.MIN_VALUE;
         
         anObject.workOrderBytRefNumberGen = set.getString(3);
         anObject.workOrderBytRefDateGen = set.getDate(4);

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
        

    public ENWorkOrderBytItemShortList getScrollableFilteredListForAdd(ENWorkOrderBytItemFilter aFilterObject,/*String anCondition,String anOrderBy,*/ int fromPosition, int quantity) throws PersistenceException
    {
     ENWorkOrderBytItemShortList result = new ENWorkOrderBytItemShortList();
     ENWorkOrderBytItemShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(aFilterObject.conditionSQL);
     String     orderBy = processCondition(aFilterObject.orderBySQL);

     if(orderBy.length() == 0)
      //orderBy = "enplanwork.code, tktechcard.techkartnumber, finworker.name";
      orderBy = "address, tktechcard.techkartnumber, finworker.name, enplanwork.code";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr =
		 "  SELECT " +
		 "   " +
		 "      ENHUMENITEM.CODE " +
		 "   " +
		 "      ,case  " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.SERVICES_OBJECT + " then " +
		 "          (select so.contractnumberservices from enservicesobject so where so.elementcode = enplanwork.elementrefcode) " +
		 "        else '' " +
		 "      end as contractnumberservices " +
		 "   " +
		 "      ,case  " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_BYT + " then " +
		 "          (select rb.accountnumber from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_PROM + " then " +
		 "          (select rp.accountnumber from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.METROLOGY_COUNTER + " then " +
		 "          (select co.invnumber from enmetrologycounter as co where co.elementcode = enplanwork.elementrefcode) " +
		 "        else '' " +
		 "      end as accountnumber " +
		 "   " +
		 "      ,case  " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_BYT + " then " +
		 "          (select rb.name from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_PROM + " then " +
		 "          (select rp.accountname || ' (' || rp.recordpointname || ')' from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.SERVICES_OBJECT + " then " +
		 "          (select so.contragentname from enservicesobject so where so.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.METROLOGY_COUNTER + " then " +
		 "          (select co.name from enmetrologycounter as co where co.elementcode = enplanwork.elementrefcode) " +
		 "        else '' " +
		 "      end as name " +
		 "   " +
		 "      ,case  " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_BYT + " then " +
		 "          (select rb.address from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_PROM + " then " +
		 "          (select rp.recordpointaddr from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.SERVICES_OBJECT + " then " +
		 "          (select so.contragentaddresswork from enservicesobject so where so.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.METROLOGY_COUNTER + " then " +
		 "          (select co.name from enmetrologycounter as co where co.elementcode = enplanwork.elementrefcode) " +
		 "        else '' " +
		 "      end as address " +
		 "   " +
		 "      ,case  " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_BYT + " then " +
		 "          (select rb.invnumber from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_PROM + " then " +
		 "          (select rp.invnumber from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.METROLOGY_COUNTER + " then " +
		 "          (select co.invnumber from enmetrologycounter as co where co.elementcode = enplanwork.elementrefcode) " +
		 "        else '' " +
		 "      end as invnumber " +
		 "   " +
		 "      ,case  " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_BYT + " then " +
		 "          (select rb.serialnumber from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_PROM + " then " +
		 "          (select rp.counternumber from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.METROLOGY_COUNTER + " then " +
		 "          (select co.buildnumber from enmetrologycounter as co where co.elementcode = enplanwork.elementrefcode) " +
		 "        else '' " +
		 "      end as serialnumber " +
		 "   " +
		 "      ,case  " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_BYT + " then " +
		 "          (select rb.seal from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_PROM + " then " +
		 "          (select rp.seal from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) " +
		 "        else '' " +
		 "      end as seal " +
		 "   " +
		 "      ,case  " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_BYT + " then " +
		 "          (select rb.phone from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.TY_PROM + " then " +
		 "          (select rp.phone from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) " +
		 "        when (select e.typerefcode from enelement e where e.code = enplanwork.elementrefcode) = " + ENElementType.SERVICES_OBJECT + " then " +
		 "          (select so.contragentphonenumber from enservicesobject so where so.elementcode = enplanwork.elementrefcode) " +
		 "        else '' " +
		 "      end as phone " +
		 "   " +
		 "      , ENHUMENITEM.CODE " +
		 "      , ENPLANWORK.CODE " +
		 "   " +
		 "      , TKPOSITION.SHORTNAME  " +
		 "   " +
		 "      , ENHUMENITEM.FINWORKERCODE  " +
		 "   " +
		 "      , FINWORKER.NAME  " +
		 "      , FINWORKER.TABNUMBER  " +
		 "      , FINWORKER.POSITIONNAME  " +
		 "      , FINWORKER.FINCODE  " +
		 "   " +
		 "      , TKTECHCARD.code " +
		 "      , TKTECHCARD.techkartnumber " +
		 "      , TKTECHCARD.name  " +

		 "      , ENPLANWORK.datestart  " +
		 "      , ENPLANWORK.typerefcode  " + 
		 "      , (select  ENPLANWORKTYPE.NAME  from enplanworktype where enplanworktype.code = enplanwork.typerefcode) || '(' || " +
         "       (select  ENPLANWORKFORM.NAME  from ENPLANWORKFORM where ENPLANWORKFORM.code = enplanwork.formrefcode) || ')' as typename " +
		 "        " +
		 "  FROM ENHUMENITEM  " +
		 "       left join FINWORKER on FINWORKER.CODE = ENHUMENITEM.FINWORKERCODE  " +
		 "      , ENPLANWORK  " +
		 "      , ENPLANWORKITEM  " +
		 "      , TKPOSITION  " +
		 "      , TKTECHCARD  " +
		 "      , ENELEMENT  "; 

/*
		 "  WHERE ENPLANWORK.CODE = ENHUMENITEM.PLANREFCODE " +
		 "    AND TKTECHCARD.CODE = ENPLANWORKITEM.KARTAREFCODE " +
		 "    AND ENPLANWORKITEM.CODE = ENHUMENITEM.PLANITEMREFCODE  " +
		 "    AND TKPOSITION.CODE = ENHUMENITEM.POSITIONGENCODE  " +
		 "    AND ENPLANWORKITEM.PLANREFCODE = ENPLANWORK.CODE ";
*/

      whereStr = " ENPLANWORK.CODE = ENHUMENITEM.PLANREFCODE " +
		 "    AND TKTECHCARD.CODE = ENPLANWORKITEM.KARTAREFCODE " +
		 "    AND ENPLANWORKITEM.CODE = ENHUMENITEM.PLANITEMREFCODE  " +
		 "    AND TKPOSITION.CODE = ENHUMENITEM.POSITIONGENCODE  " +
		 "    AND ENPLANWORKITEM.PLANREFCODE = ENPLANWORK.CODE " +
		 "    AND ENPLANWORK.ELEMENTREFCODE = ENELEMENT.CODE " + 
		 "    AND ENPLANWORKITEM.COUNTGEN > 0 ";


/*
      if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYTITEM.CODE = ?";
         }
          if (aFilterObject.contractNumberServices != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.contractNumberServices.indexOf('*',0) < 0 && aFilterObject.contractNumberServices.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.CONTRACTNUMBERSERVICES) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.CONTRACTNUMBERSERVICES) LIKE UPPER(?)";
          }
          if (aFilterObject.accountNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.accountNumber.indexOf('*',0) < 0 && aFilterObject.accountNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.ACCOUNTNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.ACCOUNTNUMBER) LIKE UPPER(?)";
          }
          if (aFilterObject.name != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.NAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.NAME) LIKE UPPER(?)";
          }
          if (aFilterObject.address != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.ADDRESS) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.ADDRESS) LIKE UPPER(?)";
          }
          if (aFilterObject.invNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.INVNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.INVNUMBER) LIKE UPPER(?)";
          }
          if (aFilterObject.serialNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.SERIALNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.SERIALNUMBER) LIKE UPPER(?)";
          }
          if (aFilterObject.seal != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.seal.indexOf('*',0) < 0 && aFilterObject.seal.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.SEAL) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.SEAL) LIKE UPPER(?)";
          }
          if (aFilterObject.phone != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.phone.indexOf('*',0) < 0 && aFilterObject.phone.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.PHONE) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.PHONE) LIKE UPPER(?)";
          }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.COMMENTGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.COMMENTGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateAdd != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYTITEM.DATEADD = ?";
         }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYTITEM.DATEEDIT = ?";
         }
          if (aFilterObject.userAdd != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.USERADD) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.USERADD) LIKE UPPER(?)";
          }
          if (aFilterObject.userEdit != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userEdit.indexOf('*',0) < 0 && aFilterObject.userEdit.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM.USEREDIT) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM.USEREDIT) LIKE UPPER(?)";
          }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWORKORDERBYTITEM.MODIFY_TIME = ?";
         }
         if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.WORKORDERBYTREFCODE = ? ";
         }
         if(aFilterObject.humenItemRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.HUMENITEMREFCODE = ? ";
         }
         if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.PLANREFCODE = ? ";
         }
         if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.FINWORKERCODE = ? ";
         }
         if(aFilterObject.recordPointBytRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.RECORDPOINTBYTREFCODE = ? ";
         }
         if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWORKORDERBYTITEM.SERVICESOBJECTREFCODE = ? ";
         }

       }
*/


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

/*
       int number = 0;
       if(aFilterObject != null){
          if(aFilterObject.code != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.code);
          }

            if(aFilterObject.contractNumberServices != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.contractNumberServices);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.accountNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.accountNumber);
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

            if(aFilterObject.address != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.address);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
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

            if(aFilterObject.serialNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.serialNumber);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.seal != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.seal);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.phone != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.phone);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
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
         if(aFilterObject.dateAdd != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
         }
         if(aFilterObject.dateEdit != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
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

            if(aFilterObject.userEdit != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userEdit);
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
        if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.workOrderBytRef.code);
        }
        if(aFilterObject.humenItemRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.humenItemRef.code);
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planRef.code);
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.finWorker.code);
        }
        if(aFilterObject.recordPointBytRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.recordPointBytRef.code);
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.servicesObjectRef.code);
        }
       }

       if(condition.length() > 0 && aBindObjects != null)
        _bindObjectsToPreparedStatement(statement,aBindObjects,number);
*/

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

         anObject = new ENWorkOrderBytItemShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.contractNumberServices = set.getString(2);
         anObject.accountNumber = set.getString(3);
         anObject.name = set.getString(4);
         anObject.address = set.getString(5);
         anObject.invNumber = set.getString(6);
         anObject.serialNumber = set.getString(7);
         anObject.seal = set.getString(8);
         anObject.phone = set.getString(9);

         anObject.humenItemRefCode = set.getInt(10);
         if(set.wasNull())
        	 anObject.humenItemRefCode = Integer.MIN_VALUE;

         anObject.planRefCode = set.getInt(11);
         if(set.wasNull())
        	 anObject.planRefCode = Integer.MIN_VALUE;

         anObject.positionName = set.getString(12);

         anObject.finWorkerCode = set.getInt(13);
         if(set.wasNull())
        	 anObject.finWorkerCode = Integer.MIN_VALUE;
         anObject.finWorkerName = set.getString(14);
         anObject.finWorkerTabNumber = set.getString(15);
         anObject.finWorkerPositionName = set.getString(16);
         anObject.finWorkerFinCode = set.getInt(17);
         if(set.wasNull())
        	 anObject.finWorkerFinCode = Integer.MIN_VALUE;

         anObject.kartaRefCode = set.getInt(18);
         if(set.wasNull())
        	 anObject.kartaRefCode = Integer.MIN_VALUE;
         anObject.kartaRefNum = set.getString(19);
         anObject.kartaRefName = set.getString(20);

         anObject.planRefDateStart = set.getDate(21);
         anObject.planRefTypeCode = set.getInt(22);
         anObject.planRefTypeName = set.getString(23);
         

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

    public ENWorkOrderBytItemShortList getScrollableFilteredListForAdd2(ENWorkOrderBytItemFilter aFilterObject,/*String anCondition,String anOrderBy,*/ int fromPosition, int quantity) throws PersistenceException
    {
     ENWorkOrderBytItemShortList result = new ENWorkOrderBytItemShortList();
     ENWorkOrderBytItemShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(aFilterObject.conditionSQL);
     String     orderBy = processCondition(aFilterObject.orderBySQL);

     if(orderBy.length() == 0)
      //orderBy = "enplanwork.code, tktechcard.techkartnumber, finworker.name";
      orderBy = "address, tcnum, finworkername, plancode";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");


     ///////////////// 1-я часть запроса: выбираем планы по УСЛУГАМ НА СТОРОНУ, сгруппированные по калькуляции
     selectStr =
	     "  select " +
	     "    null as humenitemcode,  " +
	     "    contractnumberservices, accountnumber, name, address, " +
	     "    invnumber, serialnumber, seal, phone, plancode, " +
	     "    tcpositionname, FINWORKERCODE, finworkername, TABNUMBER, POSITIONNAME, FINCODE, tcpositioncode, " +
	     "    tccode, tcnum, tcname, plandate, typerefcode, typename   " +
	     "  from  " +
	     "  ( " +
	     "    SELECT " +
	     "       ENHUMENITEM.CODE  " +
	     "               " +
	     "       ,(select so.contractnumberservices from enservicesobject so where so.elementcode = enplanwork.elementrefcode) as contractnumberservices " +
	     "       ,cast('' as varchar) as accountnumber   " +
	     "       ,(select so.contragentname from enservicesobject so where so.elementcode = enplanwork.elementrefcode) as name  " +
	     "       ,(select so.contragentaddresswork from enservicesobject so where so.elementcode = enplanwork.elementrefcode) as address  " +
	     "       ,cast('' as varchar) as invnumber  " +
	     "       ,cast('' as varchar) as serialnumber  " +
	     "       ,cast('' as varchar) as seal  " +
	     "       ,(select so.contragentphonenumber from enservicesobject so where so.elementcode = enplanwork.elementrefcode) as phone,  " +
	     "               " +
	     "       ENPLANWORK.CODE as plancode, " +
	     "       TKPOSITION.SHORTNAME as tcpositionname, " +
	     "       ENHUMENITEM.FINWORKERCODE, " +
	     "       FINWORKER.NAME as finworkername, " +
	     "       FINWORKER.TABNUMBER, " +
	     "       FINWORKER.POSITIONNAME, " +
	     "       FINWORKER.FINCODE, " +
	     "            " +
	     "       TKPOSITION.code as tcpositioncode, " +
	     "       TKTECHCARD.classificationtypecode as tccode, " +
	     "       (select ct.kod from tkclassificationtype ct where ct.code = TKTECHCARD.classificationtypecode) as tcnum, " +
	     "       (select ct.name from tkclassificationtype ct where ct.code = TKTECHCARD.classificationtypecode) as tcname, " +

	     "       ENPLANWORK.datestart as plandate, " +
		 "       ENPLANWORK.typerefcode,  " + 
		 "       (select  ENPLANWORKTYPE.NAME  from enplanworktype where enplanworktype.code = enplanwork.typerefcode) || '(' || " +
         "       (select  ENPLANWORKFORM.NAME  from ENPLANWORKFORM where ENPLANWORKFORM.code = enplanwork.formrefcode) || ')' as typename " +

	     "  FROM ENHUMENITEM " +
	     "       left join FINWORKER on FINWORKER.CODE = ENHUMENITEM.FINWORKERCODE, " +
	     "       ENPLANWORK, " +
	     "       ENPLANWORKITEM, " +
	     "       TKPOSITION, " +
	     "       TKTECHCARD, " +
	     "       ENELEMENT ";


     whereStr = " ENPLANWORK.CODE = ENHUMENITEM.PLANREFCODE " +
		 "    AND TKTECHCARD.CODE = ENPLANWORKITEM.KARTAREFCODE " +
		 "    AND ENPLANWORKITEM.CODE = ENHUMENITEM.PLANITEMREFCODE  " +
		 "    AND TKPOSITION.CODE = ENHUMENITEM.POSITIONGENCODE  " +
		 "    AND ENPLANWORKITEM.PLANREFCODE = ENPLANWORK.CODE " +
		 "    AND ENPLANWORK.ELEMENTREFCODE = ENELEMENT.CODE " +
		 "    AND ENELEMENT.typerefcode = " + ENElementType.SERVICES_OBJECT +
         "    AND ENPLANWORKITEM.COUNTGEN > 0 ";


     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }

    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE " + whereStr;


	 selectStr = selectStr +
		     "  ) q " +
		     "  group by " +
		     "    contractnumberservices, accountnumber, name, address, " +
		     "    invnumber, serialnumber, seal, phone, plancode, " +
		     "    tcpositionname, FINWORKERCODE, finworkername, TABNUMBER, POSITIONNAME, FINCODE, tcpositioncode, " +
		     "    tccode, tcnum, tcname, plandate, typerefcode, typename   ";

     ///////////////// 2-я часть запроса: выбираем планы по ТОЧКАМ УЧЕТА (БЫТ)
	 selectStr = selectStr +
	     "  union all " +
	     "   " +
	     "    SELECT " +
	     "       ENHUMENITEM.CODE  " +
	     "               " +
	     "       ,cast('' as varchar) as contractnumberservices  " +
	     "       ,(select rb.accountnumber from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) as accountnumber   " +
	     "       ,(select rb.name from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) as name  " +
	     "       ,(select rb.address from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) as address  " +
	     "       ,(select rb.invnumber from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) as invnumber  " +
	     "       ,(select rb.serialnumber from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) as serialnumber  " +
	     "       ,(select rb.seal from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) as seal  " +
	     "       ,(select rb.phone from enrecordpointbyt rb where rb.elementcode = enplanwork.elementrefcode) as phone, " +
	     "               " +
	     "       ENPLANWORK.CODE as plancode, " +
	     "       TKPOSITION.SHORTNAME as tcpositionname, " +
	     "       ENHUMENITEM.FINWORKERCODE, " +
	     "       FINWORKER.NAME as finworkername, " +
	     "       FINWORKER.TABNUMBER, " +
	     "       FINWORKER.POSITIONNAME, " +
	     "       FINWORKER.FINCODE, " +
	     "            " +
	     "       TKPOSITION.code as tcpositioncode, " +
	     "       TKTECHCARD.code as tccode, " +
	     "       TKTECHCARD.techkartnumber as tcnum, " +
	     "       TKTECHCARD.name as tcname,         " +

	     "       ENPLANWORK.datestart as plandate, " +
		 "       ENPLANWORK.typerefcode,  " + 
		 "       (select  ENPLANWORKTYPE.NAME  from enplanworktype where enplanworktype.code = enplanwork.typerefcode) || '(' || " +
         "       (select  ENPLANWORKFORM.NAME  from ENPLANWORKFORM where ENPLANWORKFORM.code = enplanwork.formrefcode) || ')' as typename " +
	     "            " +
	     "    FROM ENHUMENITEM " +
	     "         left join FINWORKER on FINWORKER.CODE = ENHUMENITEM.FINWORKERCODE, " +
	     "         ENPLANWORK, " +
	     "         ENPLANWORKITEM, " +
	     "         TKPOSITION, " +
	     "         TKTECHCARD, " +
	     "         ENELEMENT ";


     whereStr = " ENPLANWORK.CODE = ENHUMENITEM.PLANREFCODE " +
		 "    AND TKTECHCARD.CODE = ENPLANWORKITEM.KARTAREFCODE " +
		 "    AND ENPLANWORKITEM.CODE = ENHUMENITEM.PLANITEMREFCODE  " +
		 "    AND TKPOSITION.CODE = ENHUMENITEM.POSITIONGENCODE  " +
		 "    AND ENPLANWORKITEM.PLANREFCODE = ENPLANWORK.CODE " +
		 "    AND ENPLANWORK.ELEMENTREFCODE = ENELEMENT.CODE " +
		 "    AND ENELEMENT.typerefcode = " + ENElementType.TY_BYT +
		 "    AND ENPLANWORKITEM.COUNTGEN > 0 ";


     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }

    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE " + whereStr;


    ///////////////// 3-я часть запроса: выбираем планы по ТОЧКАМ УЧЕТА (ПРОМ)
	selectStr = selectStr +
	     "  union all " +
	     "   " +
	     "    SELECT " +
	     "       ENHUMENITEM.CODE  " +
	     "               " +
	     "       ,cast('' as varchar) as contractnumberservices  " +
	     "       ,(select rp.accountnumber from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) as accountnumber   " +
	     "       ,(select rp.accountname || ' (' || rp.recordpointname || ')' from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) as name  " +
	     "       ,(select rp.recordpointaddr from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) as address  " +
	     "       ,(select rp.invnumber from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) as invnumber  " +
	     "       ,(select rp.counternumber from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) as serialnumber  " +
	     "       ,(select rp.seal from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) as seal  " +
	     "       ,(select rp.phone from enrecordpointprom rp where rp.elementcode = enplanwork.elementrefcode) as phone, " +
	     "               " +
	     "       ENPLANWORK.CODE as plancode, " +
	     "       TKPOSITION.SHORTNAME as tcpositionname, " +
	     "       ENHUMENITEM.FINWORKERCODE, " +
	     "       FINWORKER.NAME as finworkername, " +
	     "       FINWORKER.TABNUMBER, " +
	     "       FINWORKER.POSITIONNAME, " +
	     "       FINWORKER.FINCODE, " +
	     "            " +
	     "       TKPOSITION.code as tcpositioncode, " +
	     "       TKTECHCARD.code as tccode, " +
	     "       TKTECHCARD.techkartnumber as tcnum, " +
	     "       TKTECHCARD.name as tcname,         " +

	     "       ENPLANWORK.datestart as plandate, " +
		 "       ENPLANWORK.typerefcode,  " + 
		 "       (select  ENPLANWORKTYPE.NAME  from enplanworktype where enplanworktype.code = enplanwork.typerefcode) || '(' || " +
         "       (select  ENPLANWORKFORM.NAME  from ENPLANWORKFORM where ENPLANWORKFORM.code = enplanwork.formrefcode) || ')' as typename " +
	     "            " +
	     "    FROM ENHUMENITEM " +
	     "         left join FINWORKER on FINWORKER.CODE = ENHUMENITEM.FINWORKERCODE, " +
	     "         ENPLANWORK, " +
	     "         ENPLANWORKITEM, " +
	     "         TKPOSITION, " +
	     "         TKTECHCARD, " +
	     "         ENELEMENT ";


    whereStr = " ENPLANWORK.CODE = ENHUMENITEM.PLANREFCODE " +
		 "    AND TKTECHCARD.CODE = ENPLANWORKITEM.KARTAREFCODE " +
		 "    AND ENPLANWORKITEM.CODE = ENHUMENITEM.PLANITEMREFCODE  " +
		 "    AND TKPOSITION.CODE = ENHUMENITEM.POSITIONGENCODE  " +
		 "    AND ENPLANWORKITEM.PLANREFCODE = ENPLANWORK.CODE " +
		 "    AND ENPLANWORK.ELEMENTREFCODE = ENELEMENT.CODE " +
		 "    AND ENELEMENT.typerefcode = " + ENElementType.TY_PROM +
		 "    AND ENPLANWORKITEM.COUNTGEN > 0 ";


    if(condition.length() != 0)
    {
       if(whereStr.length() != 0)
          whereStr = whereStr + " AND ";

       whereStr = whereStr + " (" + condition + ")";
    }

   if(whereStr.length() != 0)
       selectStr = selectStr + " WHERE " + whereStr;

   
   ///////////////// 4-я часть запроса: выбираем планы ВРТУ (на ВЛ, КЛ и ТП)
   selectStr = selectStr +
	   "  union all " +
	   "     " +
	   "    SELECT ENHUMENITEM.CODE " +
	   "            " +
	   "          ,(select so.contractnumberservices  " +
	   "            from  enservicesobject2techcondtnsservices so2tc, entechcond2planwork tcp, enservicesobject so  " +
	   "            where so2tc.servicesobjectrefcode = so.code " +
	   "              and so2tc.techcondservrefcode = tcp.techconservicesrefcode " +
	   "              and tcp.planrefcode = enplanwork.code) as contractnumberservices  " +
	   "           " +
	   "          ,(case  " +
	   "              when ENELEMENT.typerefcode = " + ENElementType.LINE04 + " then  " +
	   "                (select l.name || coalesce(' (№ ' || l.invnumber || ')', '')  " +
	   "                 from enline04 l  " +
	   "                 where l.elementcode = ENELEMENT.code) " +
	   "              when ENELEMENT.typerefcode = " + ENElementType.LINE_CABLE + " then  " +
	   "                (select lc.name || coalesce(' (№ ' || lc.invnumber || ')', '')  " +
	   "                 from enlinecable lc  " +
	   "                 where lc.elementcode = ENELEMENT.code) " +	   
	   "              when ENELEMENT.typerefcode = " + ENElementType.SUBSTATION04 + " then  " +
	   "                (select s.name || coalesce(' (№ ' || s.invnumber || ')', '')  " +
	   "                 from ensubstation04 s  " +
	   "                 where s.elementcode = ENELEMENT.code) " +
	   "              else " +
	   "                cast('' as varchar) " +
	   "            end) as accountnumber " +
	   "              " +
	   "          ,(select so.contragentname  " +
	   "            from  enservicesobject2techcondtnsservices so2tc, entechcond2planwork tcp, enservicesobject so  " +
	   "            where so2tc.servicesobjectrefcode = so.code " +
	   "              and so2tc.techcondservrefcode = tcp.techconservicesrefcode " +
	   "              and tcp.planrefcode = enplanwork.code) as name  " +
	   "          ,(select so.contragentaddresswork  " +
	   "            from  enservicesobject2techcondtnsservices so2tc, entechcond2planwork tcp, enservicesobject so  " +
	   "            where so2tc.servicesobjectrefcode = so.code " +
	   "              and so2tc.techcondservrefcode = tcp.techconservicesrefcode " +
	   "              and tcp.planrefcode = enplanwork.code) as address " +
	   "          ,cast('' as varchar) as invnumber   " +
	   "          ,cast('' as varchar) as serialnumber   " +
	   "          ,cast('' as varchar) as seal   " +
	   "          ,(select so.contragentphonenumber  " +
	   "            from  enservicesobject2techcondtnsservices so2tc, entechcond2planwork tcp, enservicesobject so  " +
	   "            where so2tc.servicesobjectrefcode = so.code " +
	   "              and so2tc.techcondservrefcode = tcp.techconservicesrefcode " +
	   "              and tcp.planrefcode = enplanwork.code) as phone, " +
	   "             " +
	   "           ENPLANWORK.CODE as plancode, " +
	   "           TKPOSITION.SHORTNAME as tcpositionname, " +
	   "           ENHUMENITEM.FINWORKERCODE, " +
	   "           FINWORKER.NAME as finworkername, " +
	   "           FINWORKER.TABNUMBER, " +
	   "           FINWORKER.POSITIONNAME, " +
	   "           FINWORKER.FINCODE, " +
	   "           TKPOSITION.code as tcpositioncode, " +
	   "           TKTECHCARD.code as tccode, " +
	   "           TKTECHCARD.techkartnumber as tcnum, " +
	   "           TKTECHCARD.name as tcname, " +
	   "           ENPLANWORK.datestart as plandate, " +
	   "           ENPLANWORK.typerefcode, " +
	   "           (select ENPLANWORKTYPE.NAME from enplanworktype where " +
	   "            enplanworktype.code = enplanwork.typerefcode) || '(' || " +
	   "           (select ENPLANWORKFORM.NAME from ENPLANWORKFORM where " +
	   "            ENPLANWORKFORM.code = enplanwork.formrefcode) || ')' as typename " +
	   "    FROM ENHUMENITEM " +
	   "         left join FINWORKER on FINWORKER.CODE = ENHUMENITEM.FINWORKERCODE, " +
	   "         ENPLANWORK, " +
	   "         ENPLANWORKITEM, " +
	   "         TKPOSITION, " +
	   "         TKTECHCARD, " +
	   "         ENELEMENT ";
   

   whereStr = " ENPLANWORK.CODE = ENHUMENITEM.PLANREFCODE " +
		 "    AND TKTECHCARD.CODE = ENPLANWORKITEM.KARTAREFCODE " +
		 "    AND ENPLANWORKITEM.CODE = ENHUMENITEM.PLANITEMREFCODE  " +
		 "    AND TKPOSITION.CODE = ENHUMENITEM.POSITIONGENCODE  " +
		 "    AND ENPLANWORKITEM.PLANREFCODE = ENPLANWORK.CODE " +
		 "    AND ENPLANWORK.ELEMENTREFCODE = ENELEMENT.CODE " +
		 "    AND ENELEMENT.typerefcode in (" + ENElementType.LINE04 + ", " + 
		 										ENElementType.SUBSTATION04 + ", " + 
		 										ENElementType.LINE_CABLE + ")" + 
		 "    AND ENPLANWORK.budgetrefcode = " + ENConsts.ENBUDGET_VRTU +
		 "    AND ENPLANWORKITEM.COUNTGEN > 0 ";


   if(condition.length() != 0)
   {
      if(whereStr.length() != 0)
         whereStr = whereStr + " AND ";

      whereStr = whereStr + " (" + condition + ")";
   }

  if(whereStr.length() != 0)
      selectStr = selectStr + " WHERE " + whereStr;   
   
     // selectStr = selectStr + ") ";

     selectStr = selectStr + " ORDER BY " + orderBy;

     selectStr = selectStr + " OFFSET " + fromPosition;
     if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

     try
      {
       statement = connection.prepareStatement(selectStr);

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

    	   /*
    	   select
    	   null as humenitemcode,
    	   contractnumberservices, accountnumber, name, address,
    	   invnumber, serialnumber, seal, phone, plancode,
    	   tcpositionname, FINWORKERCODE, finworkername, TABNUMBER, POSITIONNAME, FINCODE, tcpositioncode,
    	   tccode, tcnum, tcname
    	   */

         anObject = new ENWorkOrderBytItemShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;

         anObject.humenItemRefCode = set.getInt(1);
         if(set.wasNull())
        	 anObject.humenItemRefCode = Integer.MIN_VALUE;

         anObject.contractNumberServices = set.getString(2);
         anObject.accountNumber = set.getString(3);
         anObject.name = set.getString(4);
         anObject.address = set.getString(5);
         anObject.invNumber = set.getString(6);
         anObject.serialNumber = set.getString(7);
         anObject.seal = set.getString(8);
         anObject.phone = set.getString(9);

         anObject.planRefCode = set.getInt(10);
         if(set.wasNull())
        	 anObject.planRefCode = Integer.MIN_VALUE;

         anObject.positionName = set.getString(11);

         anObject.finWorkerCode = set.getInt(12);
         if(set.wasNull())
        	 anObject.finWorkerCode = Integer.MIN_VALUE;
         anObject.finWorkerName = set.getString(13);
         anObject.finWorkerTabNumber = set.getString(14);
         anObject.finWorkerPositionName = set.getString(15);
         anObject.finWorkerFinCode = set.getInt(16);
         if(set.wasNull())
        	 anObject.finWorkerFinCode = Integer.MIN_VALUE;
         anObject.positionCode = set.getInt(17);
         if(set.wasNull())
        	 anObject.positionCode = Integer.MIN_VALUE;

         anObject.kartaRefCode = set.getInt(18);
         if(set.wasNull())
        	 anObject.kartaRefCode = Integer.MIN_VALUE;
         anObject.kartaRefNum = set.getString(19);
         anObject.kartaRefName = set.getString(20);

         anObject.planRefDateStart = set.getDate(21);
         anObject.planRefTypeCode = set.getInt(22);
         anObject.planRefTypeName = set.getString(23);

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

    public ENWorkOrderBytItemShortList getScrollableFilteredListForPlanning(ENWorkOrderBytItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    	return getScrollableFilteredListForPlanning(aFilterObject, fromPosition, quantity, ENElementType.TY_BYT);
    }

    public ENWorkOrderBytItemShortList getScrollableFilteredListForPlanning(ENWorkOrderBytItemFilter aFilterObject,/*String anCondition,String anOrderBy,*/ int fromPosition, int quantity, int elementType) throws PersistenceException
    {
	     ENWorkOrderBytItemShortList result = new ENWorkOrderBytItemShortList();
	     ENWorkOrderBytItemShort anObject;
	     result.list = new Vector();

	     String     selectStr;
	     Connection connection = getConnection();
	     PreparedStatement statement = null;
	     ResultSet  set = null;
	     String     whereStr = "";
	     String     condition = processCondition(aFilterObject.conditionSQL);
	     String     orderBy = processCondition(aFilterObject.orderBySQL);

	     if(orderBy.length() == 0)
	      orderBy = "address, tcnum, plandate, plancode";

	     if(quantity < 0)
	      quantity = Integer.MAX_VALUE/2;

	     if(getUserProfile() == null)
	      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	     if (elementType == ENElementType.TY_BYT)
	     {
	         selectStr =
	        		 "  SELECT " +
	        		 "    rb.accountnumber, " +
	        		 "    rb.name, " +
	        		 "    rb.address, " +
	        		 "    rb.invnumber, " +
	        		 "    rb.serialnumber, " +
	        		 "    rb.seal, " +
	        		 "    rb.phone, " +

	        		 "    ENPLANWORK.CODE as plancode, " +

	        		 "    (SELECT distinct group_concat((TKTECHCARD.techkartnumber||' '||TKTECHCARD.name), chr(10)) " +
	        		 "       FROM TKTECHCARD, ENPLANWORKITEM " +
	        		 "      WHERE TKTECHCARD.code = ENPLANWORKITEM.kartarefcode and " +
	        		 "            ENPLANWORKITEM.planrefcode = ENPLANWORK.code and " +
	        		 "            ENPLANWORKITEM.countgen > 0) as tcnum, " +

	        		 "    ENPLANWORK.datestart as plandate, " +

	        		 "    null as recordpointname " +

	        	     "  FROM " +
	        	     "    ENPLANWORK, " +
	        	     "    ENELEMENT, " +
	        	     "    ENRECORDPOINTBYT rb ";

	             // Выбираем только Месячные планы по ТУ-быт
	             whereStr = " ENPLANWORK.ELEMENTREFCODE = ENELEMENT.CODE " +
	            	 "    AND rb.ELEMENTCODE = ENELEMENT.CODE " +
	        		 "    AND ENELEMENT.typerefcode = " + ENElementType.TY_BYT +
	                 "    AND ENPLANWORK.kindcode = " + ENPlanWorkKind.CURRENT;
	     }
	     else if (elementType == ENElementType.TY_PROM)
	     {
	         selectStr =
	        		 "  SELECT " +
	        		 "    rp.accountnumber, " +
	        		 "    rp.accountname, " +
	        		 "    rp.recordpointaddr as address, " +
	        		 "    rp.invnumber, " +
	        		 "    rp.counternumber, " +
	        		 "    rp.seal, " +
	        		 "    rp.phone, " +

	        		 "    ENPLANWORK.CODE as plancode, " +

	        		 "    (SELECT distinct group_concat((TKTECHCARD.techkartnumber||' '||TKTECHCARD.name), chr(10)) " +
	        		 "       FROM TKTECHCARD, ENPLANWORKITEM " +
	        		 "      WHERE TKTECHCARD.code = ENPLANWORKITEM.kartarefcode and " +
	        		 "            ENPLANWORKITEM.planrefcode = ENPLANWORK.code and " +
	        		 "            ENPLANWORKITEM.countgen > 0) as tcnum, " +

	        		 "    ENPLANWORK.datestart as plandate, " +

	        		 "    rp.recordpointname " +

	        	     "  FROM " +
	        	     "    ENPLANWORK, " +
	        	     "    ENELEMENT, " +
	        	     "    ENRECORDPOINTPROM rp ";

	             // Выбираем только Месячные планы по ТУ-пром
	             whereStr = " ENPLANWORK.ELEMENTREFCODE = ENELEMENT.CODE " +
	            	 "    AND rp.ELEMENTCODE = ENELEMENT.CODE " +
	        		 "    AND ENELEMENT.typerefcode = " + ENElementType.TY_PROM +
	                 "    AND ENPLANWORK.kindcode = " + ENPlanWorkKind.CURRENT;
	     }
	     else
	     {
	    	 throw new SystemException("\n\nNET-4350 Невідомий код типу об''єкту планування (" + elementType + ")!");
	     }


	     if(condition.length() != 0)
	     {
	        if(whereStr.length() != 0)
	           whereStr = whereStr + " AND ";

	        whereStr = whereStr + " (" + condition + ")";
	     }

	    if(whereStr.length() != 0)
	        selectStr = selectStr + " WHERE " + whereStr;

	     // selectStr = selectStr + ") ";

	     selectStr = selectStr + " ORDER BY " + orderBy;

	     selectStr = selectStr + " OFFSET " + fromPosition;
	     if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

	     try
	      {
	       statement = connection.prepareStatement(selectStr);

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

	    	   /*
			   SELECT
			     accountnumber,
	             name,
			     address,
			     invnumber,
			     serialnumber,
			     seal,
			     phone,
			     plancode,
			     tcnum,
			     plandate
	    	   */

	         anObject = new ENWorkOrderBytItemShort();

	         anObject.code = Integer.MIN_VALUE;
	         anObject.humenItemRefCode = Integer.MIN_VALUE;

	         anObject.accountNumber = set.getString(1);
	         anObject.name = set.getString(2);
	         anObject.address = set.getString(3);
	         anObject.invNumber = set.getString(4);
	         anObject.serialNumber = set.getString(5);
	         anObject.seal = set.getString(6);
	         anObject.phone = set.getString(7);

	         anObject.planRefCode = set.getInt(8);
	         if(set.wasNull())
	        	 anObject.planRefCode = Integer.MIN_VALUE;

	         anObject.kartaRefNum = set.getString(9);

	         anObject.planRefDateStart = set.getDate(10);

	         anObject.recordPointName = set.getString(11);

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

	public int add(ENWorkOrderBytItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENWORKORDERBYTITEM (CODE,CONTRACTNUMBERSERVICES,ACCOUNTNUMBER,NAME,CUSTOMERNAME,ADDRESS,INVNUMBER,SERIALNUMBER,SEAL,PHONE,STATUSCODE,RPCODE,DATECOUNTERINST,DATECOUNTERCHECK,COUNTERTYPE,CLASSACCURACY,CHECKPERIOD,RPSTATUSCODE,PHASITY,DATECHECK,CHECKPERIOD1,PLACECOUNTER,RPISWORKING,RECORDPOINTNAME,ROUTEBYTNAME,ROUTEBYTNUMBERGEN,COMMENTGEN,DATEADD,DATEEDIT,USERADD,USEREDIT,MODIFY_TIME,FACTCODE,COUNTERCAPACITY,COUNTERVOLTAGENOMINAL,COUNTERDATEPRODUCT,WORKORDERBYTREFCODE,HUMENITEMREFCODE,PLANREFCODE,PLANITEMREFCODE,FINWORKERCODE,RECORDPOINTBYTREFCODE,RECORDPOINTPROMREFCODE,ROUTEBYTREFCODE,SERVICESOBJECTREFCODE,SCCOUNTERREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.contractNumberServices);
			statement.setString(3,anObject.accountNumber);
			statement.setString(4,anObject.name);
			statement.setString(5,anObject.customerName);
			statement.setString(6,anObject.address);
			statement.setString(7,anObject.invNumber);
			statement.setString(8,anObject.serialNumber);
			statement.setString(9,anObject.seal);
			statement.setString(10,anObject.phone);
			if (anObject.statuscode != Integer.MIN_VALUE ) {
				statement.setInt(11,anObject.statuscode);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.rpCode != Integer.MIN_VALUE ) {
				statement.setInt(12,anObject.rpCode);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			if (anObject.dateCounterInst == null) {
				statement.setDate(13,null);
			} else {
				statement.setDate(13,new java.sql.Date(anObject.dateCounterInst.getTime()));
			}
			if (anObject.dateCounterCheck == null) {
				statement.setDate(14,null);
			} else {
				statement.setDate(14,new java.sql.Date(anObject.dateCounterCheck.getTime()));
			}
			statement.setString(15,anObject.counterType);
			if (anObject.classAccuracy != null) {
				anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(16,anObject.classAccuracy);
			if (anObject.checkperiod != null) {
				anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(17,anObject.checkperiod);
			if (anObject.rpStatusCode != Integer.MIN_VALUE ) {
				statement.setInt(18,anObject.rpStatusCode);
			} else {
				statement.setNull(18,java.sql.Types.INTEGER);
			}
			if (anObject.phasity != null) {
				anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(19,anObject.phasity);
			if (anObject.datecheck == null) {
				statement.setDate(20,null);
			} else {
				statement.setDate(20,new java.sql.Date(anObject.datecheck.getTime()));
			}
			if (anObject.checkperiod1 != null) {
				anObject.checkperiod1 = anObject.checkperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(21,anObject.checkperiod1);
			statement.setString(22,anObject.placecounter);
			if (anObject.rpIsWorking != Integer.MIN_VALUE ) {
				statement.setInt(23,anObject.rpIsWorking);
			} else {
				statement.setNull(23,java.sql.Types.INTEGER);
			}
			statement.setString(24,anObject.recordPointName);
			statement.setString(25,anObject.routeBytName);
			statement.setString(26,anObject.routeBytNumbergen);
			statement.setString(27,anObject.commentGen);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(28,null);
			} else {
				statement.setTimestamp(28,new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			if (anObject.dateEdit == null) {
				statement.setTimestamp(29,null);
			} else {
				statement.setTimestamp(29,new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			statement.setString(30,anObject.userAdd);
			statement.setString(31,anObject.userEdit);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(32,null);
			} else {
				statement.setBigDecimal(32,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.factCode != Integer.MIN_VALUE ) {
				statement.setInt(33,anObject.factCode);
			} else {
				statement.setNull(33,java.sql.Types.INTEGER);
			}
			if (anObject.counterCapacity != Integer.MIN_VALUE ) {
				statement.setInt(34,anObject.counterCapacity);
			} else {
				statement.setNull(34,java.sql.Types.INTEGER);
			}
			if (anObject.counterVoltageNominal != null) {
				anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(35,anObject.counterVoltageNominal);
			if (anObject.counterDateProduct == null) {
				statement.setDate(36,null);
			} else {
				statement.setDate(36,new java.sql.Date(anObject.counterDateProduct.getTime()));
			}
			if (anObject.workOrderBytRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWorkOrderBytDAOGen(connection,getUserProfile()).exists(anObject.workOrderBytRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.workOrderBytRef.code%} = {%"+anObject.workOrderBytRef.code+"%}");
				}
				statement.setInt(37,anObject.workOrderBytRef.code);
			} else {
				statement.setNull(37,java.sql.Types.INTEGER);
			}
			if (anObject.humenItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENHumenItemDAOGen(connection,getUserProfile()).exists(anObject.humenItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.humenItemRef.code%} = {%"+anObject.humenItemRef.code+"%}");
				}
				statement.setInt(38,anObject.humenItemRef.code);
			} else {
				statement.setNull(38,java.sql.Types.INTEGER);
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(39,anObject.planRef.code);
			} else {
				statement.setNull(39,java.sql.Types.INTEGER);
			}
			if (anObject.planItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkItemDAOGen(connection,getUserProfile()).exists(anObject.planItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.planItemRef.code%} = {%"+anObject.planItemRef.code+"%}");
				}
				statement.setInt(40,anObject.planItemRef.code);
			} else {
				statement.setNull(40,java.sql.Types.INTEGER);
			}
			if (anObject.finWorker.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).exists(anObject.finWorker.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.finWorker.code%} = {%"+anObject.finWorker.code+"%}");
				}
				statement.setInt(41,anObject.finWorker.code);
			} else {
				statement.setNull(41,java.sql.Types.INTEGER);
			}
			if (anObject.recordPointBytRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.ENRecordPointBytDAO(connection,getUserProfile()).existsNoSegr(anObject.recordPointBytRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.recordPointBytRef.code%} = {%"+anObject.recordPointBytRef.code+"%}");
				}
				statement.setInt(42,anObject.recordPointBytRef.code);
			} else {
				statement.setNull(42,java.sql.Types.INTEGER);
			}
			if (anObject.recordPointPromRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.ENRecordPointPromDAO(connection,getUserProfile()).existsNoSegr(anObject.recordPointPromRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.recordPointPromRef.code%} = {%"+anObject.recordPointPromRef.code+"%}");
				}
				statement.setInt(43,anObject.recordPointPromRef.code);
			} else {
				statement.setNull(43,java.sql.Types.INTEGER);
			}
			if (anObject.routeBytRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENRouteBytDAOGen(connection,getUserProfile()).exists(anObject.routeBytRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.routeBytRef.code%} = {%"+anObject.routeBytRef.code+"%}");
				}
				statement.setInt(44,anObject.routeBytRef.code);
			} else {
				statement.setNull(44,java.sql.Types.INTEGER);
			}
			if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
				}
				statement.setInt(45,anObject.servicesObjectRef.code);
			} else {
				statement.setNull(45,java.sql.Types.INTEGER);
			}
			if (anObject.scCounterRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.SCCounterDAOGen(connection,getUserProfile()).exists(anObject.scCounterRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.scCounterRef.code%} = {%"+anObject.scCounterRef.code+"%}");
				}
				statement.setInt(46,anObject.scCounterRef.code);
			} else {
				statement.setNull(46,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENWorkOrderBytItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
} // end of ENWorkOrderBytItemDAO
