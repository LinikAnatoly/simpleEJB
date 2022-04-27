
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Sat Sep 26 14:38:30 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.ENSettingsKeysConsts;
import com.ksoe.energynet.logic.ENSettingsLogic;
import com.ksoe.energynet.util.tools.CollectionTools;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPurchasesObjectReason;
import com.ksoe.energynet.valueobject.ENTravelSheetFuel;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.SCCounterStatus;
import com.ksoe.energynet.valueobject.brief.ENEstimateItem2FinShort;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemShort;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemWriteOffShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2FinShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemWriteOffShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQPurchaseItem2EstimateItemDAO;
import com.ksoe.rqorder.logic.PlanPurchaseLogic;
import com.ksoe.rqorder.valueobject.RQBillType;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;
import com.ksoe.rqorder.valueobject.RQPurchaseItem2EstimateItem;
import com.ksoe.rqorder.valueobject.filter.RQOrderFilter;
import com.ksoe.rqorder.valueobject.filter.RQPurchaseItem2EstimateItemFilter;
import com.ksoe.techcard.logic.MaterialsLogic;
import com.ksoe.techcard.valueobject.TKAccountingType;

  /**
  *  DAO Object for ENEstimateItem;
  *
  */

public class ENEstimateItemDAO extends ENEstimateItemDAOGen {

  public ENEstimateItemDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENEstimateItemDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public int getEstimateForCounterMove(int departmentCode, int elementType, int materialCode)  throws PersistenceException
  {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;

    selectStr = " select " +
    " ei.code " +
    "  from " +
    " enestimateitem ei, enplanwork p, rqfkorderitem oi, rqfkorderitem2enstmttm oi2e " +
    " , enplanworkitem pi , enelementdata ed " +
    " where " +
    " ei.planrefcode = p.code " +
    " and pi.planrefcode = p.code and ei.planitemrefcode = pi.code " +
    " and p.kindcode = 2 " +
    " and p.responsibilityrefcode = 240000002 " +
    " and p.budgetrefcode = 240000001 " +
    " and p.departmentrefcode = ? " +
    " and ed.etype = ? " +
    " and ei.materialrefcode = ? " +
    " and ed.ecode = p.elementrefcode " +
    " and ei.accountingtyperefcode = 2 " +
    "  " +
    " and ((p.yeargen =2011 and p.monthgen < 5) or (p.yeargen =2010)) " +
    " and ei.code = oi2e.estimateitemcode " +
    " and oi.code = oi2e.fkorderitemrefcode " +
    " and oi.fkorderrefcode in " +
    "  ( " +
    "  500011564, 500011563, 500007622, 500008964, 500008967, 500011564, 500011563 " +
    //"  -- komplekt " +
    "  , 500011834, 500011858, 500011852, 500009064, 500003203, 500002362  " +
    "  ) " +
    " and p.code not in " +
    " ( " +
    "  " +
    " select ch1.planoldrefcode " +
    "       from enplancorrecthistory ch1, enplancorrecthistory ch2, enplanwork p1, " +
    "       enplanworkitem pi1 " +
    "     where ch1.planoldrefcode = p.code and ch1.reasoncode = 4 " +
    "       and ch2.planoldrefcode = ch1.plannewrefcode and ch2.reasoncode = 5 " +
    "       and ch2.plannewrefcode = p1.code " +
    "       and p1.kindcode = 4 " +
    "       and p1.code = pi1.planrefcode " +
    "       and pi1.kartarefcode = pi.kartarefcode " +
    " and p1.responsibilityrefcode = p.responsibilityrefcode " +
    " and p1.budgetrefcode = p.budgetrefcode " +
    " and p1.departmentrefcode = p.departmentrefcode    " +
    " ) " +
    "  " +
    " and ei.code not in  " +
    " (select e2e.estimateiteminrefcode from enestimateitem2nstmttm e2e where e2e.typerefcode = 5 ) " +
    " order by oi.modify_time" ;

    try
        {
        statement = connection.prepareStatement(selectStr);

        statement.setInt(1,departmentCode);
        statement.setInt(2,elementType);
        statement.setInt(3,materialCode);

        set = statement.executeQuery();
        if (set.next())
            return set.getInt(1);
        else
            return Integer.MIN_VALUE;
        }
    catch(SQLException e)
        {
        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        return Integer.MIN_VALUE;
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

  public ENTravelSheetFuel[] getFuelsByTravelSheetItem(int travelSheetItemCode) throws PersistenceException
  {

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    Vector<ENTravelSheetFuel> v = new Vector<>();

    selectStr = "select ft.code, sum(ei.countfact) from entransport2enestimate t2e, entravlshttm2trnsprttm ti2t , enestimateitem ei, tkfueltype ft "+
                    " where t2e.transportrefcode = ti2t.transportitemrefcode and ti2t.travelsheetitemrefcode = ? and ei.code = t2e.estimaterefcode " +
                    " and ei.materialrefcode = ft.materialrefcode group by ft.code";

    try
        {
        statement = connection.prepareStatement(selectStr);

        statement.setInt(1,travelSheetItemCode);

        set = statement.executeQuery();
        while(set.next()) {
            ENTravelSheetFuel f = new ENTravelSheetFuel();
            f.fuelType.code = set.getInt(1);
            if (set.wasNull())
                f.fuelType.code = Integer.MIN_VALUE;
            f.countGen = set.getBigDecimal(2);
            if (f.countGen != null)
                f.countGen = f.countGen.setScale(2, BigDecimal.ROUND_HALF_UP);

            v.add(f);
        }

        return v.toArray(new ENTravelSheetFuel[v.size()]);

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



  public ENEstimateItemShortList getDetailedEstimateList(ENEstimateItemFilter eFilter, ENPlanWorkFilter pFilter) throws PersistenceException
  {
    ENEstimateItemShortList result = new ENEstimateItemShortList();
    ENEstimateItemShort anObject;
    result.list = new Vector<>();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";

    String     conditionE = eFilter.conditionSQL == null ? "" : eFilter.conditionSQL;
    String     conditionP = pFilter.conditionSQL == null ? "" : pFilter.conditionSQL;

    String     orderBy = eFilter.orderBySQL == null ? "" : eFilter.orderBySQL; //processCondition(anOrderBy);

    // if(orderBy.length() == 0)
    	orderBy = " ENPLANWORK.DATESTART, SM.NAME ";

    //if(quantity < 0)
    int quantity = Integer.MAX_VALUE/2;
    int fromPosition = 0;
    if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
        "ENESTIMATEITEM.CODE"+
        ",ENESTIMATEITEM.COUNTGEN"+
        ",ENESTIMATEITEM.COUNTFACT"+
        ",ENESTIMATEITEM.USERGEN"+
        ",ENESTIMATEITEM.DATEEDIT"+

        ", ENPLANWORK.CODE " +
        ", ENPLANWORK.DATEGEN " +
        ", ENPLANWORK.USERGEN " +
        ", ENPLANWORK.DATEEDIT " +
        ", ENPLANWORKITEM.CODE " +
        ", ENPLANWORKITEM.COUNTGEN " +
        ", ENPLANWORKITEM.USERGEN " +
        ", ENPLANWORKITEM.DATEEDIT " +
        ", sm.CODE " +
        ", sm.NAME " +

        ", ENESTIMATEITEM.TYPEREFCODE " +
        ", (select ENESTIMATEITEMTYPE.NAME from ENESTIMATEITEMTYPE where ENESTIMATEITEMTYPE.CODE = ENESTIMATEITEM.TYPEREFCODE) " +

        ", tu.NAME  "+
    //   ", kr.id, kr.NUM, kr.OPISANIE " +
       // ", kr.code, kr.techkartnumber, kr.name " +


        ", (select kr.code from TKTECHCARD kr , ENPLANWORKITEM pi where  kr.code = pi.kartarefcode "+
        "  and pi.code = enestimateitem.planitemrefcode ) "+
        ",(select kr.techkartnumber from TKTECHCARD kr , ENPLANWORKITEM pi where  kr.code = pi.kartarefcode "+
        "          and pi.code = enestimateitem.planitemrefcode ) "+
        ",(select kr.name from TKTECHCARD kr , ENPLANWORKITEM pi where  kr.code = pi.kartarefcode "+
        "          and pi.code = enestimateitem.planitemrefcode ) "+

        ", ENESTIMATEITEM.KINDREFCODE " +
        ", (select ENESTIMATEITEMKIND.NAME from ENESTIMATEITEMKIND where ENESTIMATEITEMKIND.CODE = ENESTIMATEITEM.KINDREFCODE) " +

        ", ENESTIMATEITEM.STATUSREFCODE "+
        ", (select ENESTIMATEITEMSTATUS.NAME from ENESTIMATEITEMSTATUS where ENESTIMATEITEMSTATUS.CODE = ENESTIMATEITEM.STATUSREFCODE) " +

        ", (select count(f.code) from finmaterials f where f.estimateitemrefcode = ENESTIMATEITEM.CODE and f.statusrefcode = 1) as countFINMaterials " +

        ", (select invnumber||coalesce(' (дог.№'||ENPLANWORK.PRICONNECTIONNUMBER||')', '') from enelementdata where ecode = enplanwork.elementrefcode ) as invnumber " +
        ", (select ename from enelementdata where ecode = enplanwork.elementrefcode ) as ename " +
        ", enplanwork.elementrefcode " +

        //",  enelementdata.invnumber||coalesce(' (дог.№'||ENPLANWORK.PRICONNECTIONNUMBER||')', ''),  enelementdata.ename,  enelementdata.ecode" +

        ", enplanworktype.name, enplanworkstate.name "+

        ", ENPLANWORK.YEARGEN " +
        ", ENPLANWORK.MONTHGEN " +

        ", ENPLANWORK.DATESTART, ENPLANWORK.DATEFINAL " +

        ", ENPLANWORK.DEPARTMENTREFCODE " +
        ", (select ENDEPARTMENT.NAME from ENDEPARTMENT where ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE) " +


         ", enplanwork.budgetrefcode " +   // 38
         ", (select '213400'::numeric from enpurchasesobject s " +
        "    where s.elementcode = enplanwork.elementrefcode " +
        "      and s.purchasesreasoncode = " + ENPurchasesObjectReason.PURCHASES_AVZ + ") " +

        ", enplanwork.statuscode " +

"  /* NET-4529 Код строки плана закупки в которой сидит естимейт*/ \n"+
	 "  , ( select pi2ei.purchaseitemrefcode \n"+
	 " from rqpurchaseitem2estmttm pi2ei  , rqpurchaseitem pi , rqplanpurchase plpurch \n"+
	 " where pi2ei.estimateitemrefcode = ENESTIMATEITEM.CODE \n"+
	 " and pi2ei.purchaseitemrefcode = pi.code \n"+
	 " and plpurch.code = pi.purchaserefcode \n"+
	 " and plpurch.yeargen = ENPLANWORK.yeargen) as purchaseitemrefcode \n"+

        " FROM ENESTIMATEITEM " +

        "left join ENPLANWORKITEM on ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE " +

    //  " left join TEHKART._ARTI kr on kr.id = ENPLANWORKITEM.kartarefcode " +

       // " left join TKTECHCARD kr on kr.code = ENPLANWORKITEM.kartarefcode " +
        ", ENPLANWORK " +
        //", ENPLANWORKITEM " +
        ", TKMATERIALS sm" +
    //  ", REPIMPORT.TMESURE_UNIT tu" +
        ", TKMEASUREMENT tu" +
        ", ENESTIMATEITEMTYPE " +
        // ", ENESTIMATEITEMKIND " +
        // ", ENESTIMATEITEMSTATUS " +
        // перенести ...
        //", enelementdata  " +
        ", enplanworktype, enplanworkstate " +

        //" , ENDEPARTMENT " +
        //" WHERE "
        "";

        whereStr = " ENPLANWORK.CODE = ENESTIMATEITEM.PLANREFCODE" ; //+

        whereStr = whereStr + " and tu.code = sm.MEASUREMENTCODE ";

        //whereStr = whereStr +" AND ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE" ; //+

        whereStr = whereStr +" AND sm.CODE = ENESTIMATEITEM.MATERIALREFCODE" ; //+

        whereStr = whereStr + " ";

        whereStr = whereStr +" AND ENESTIMATEITEMTYPE.CODE = ENESTIMATEITEM.TYPEREFCODE" ; //+
        // whereStr = whereStr +" AND ENESTIMATEITEMKIND.CODE = ENESTIMATEITEM.KINDREFCODE" ; //+
        // whereStr = whereStr +" AND ENESTIMATEITEMSTATUS.CODE = ENESTIMATEITEM.STATUSREFCODE ";

        whereStr = whereStr +" AND ENESTIMATEITEM.COUNTFACT <> 0 ";

        //whereStr = whereStr +" AND ENESTIMATEITEM.statusrefcode  in ("+ ENEstimateItemStatus.PLANNED + ", " + ENEstimateItemStatus.TEMP +") ";

        // чуть шо перенести в другой метод ...
        whereStr = whereStr +" and enplanworktype.code = enplanwork.typerefcode and enplanworkstate.code = enplanwork.staterefcode";
        //whereStr = whereStr +" and enplanwork.elementrefcode = enelementdata.ecode ";
        // whereStr = whereStr + " AND ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE ";

        whereStr = whereStr +" and enplanwork.statuscode not in (2, 6) ";


        if (pFilter.kind != null && pFilter.kind.code == ENPlanWorkKind.SALE_SPECIFICATION) {
            whereStr = whereStr + " and enplanwork.kindcode = " + ENPlanWorkKind.SALE_SPECIFICATION;
        } else {
            whereStr = whereStr + " and enplanwork.kindcode = " + ENPlanWorkKind.CURRENT;
        }


        //selectStr = selectStr + " ${s} ENESTIMATEITEM.CODE IN ( SELECT ENESTIMATEITEM.CODE FROM ENESTIMATEITEM ";

//    " ";
        if(eFilter != null)
        {
        if(eFilter.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.CODE = ?";
        }
        if(eFilter.countGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.COUNTGEN = ?";
        }
        if(eFilter.countFact != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.COUNTFACT = ?";
        }
            if (eFilter.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
                else
                    whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
            }
        if(eFilter.dateEdit != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
        }
        if(eFilter.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.PLANREFCODE = ? ";
        }
        if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
        }
        if(eFilter.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
        }

        if(eFilter.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.TYPEREFCODE = ? ";
        }

        if(eFilter.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.KINDREFCODE = ? ";
        }
        if(eFilter.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
        }

        }


        if(pFilter != null)
        {
        /*
        if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.DEPARTMENTREFCODE = ?";
        }

        if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.BUDGETREFCODE = ?";
        }
        if(pFilter.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
        }

        if(pFilter.monthGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
        }

        if(pFilter.formRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK.FORMREFCODE = ?";
        }

        // НАХ так делать ... передаем фильтр  и не обрабатываем ЕГО !!!
        if (pFilter.elementRef.code != Integer.MIN_VALUE){
            if (whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK.ELEMENTREFCODE = ?";
        }
           */

        /////////////////////////////////////////////////////////////////////////////////////
            if(pFilter.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.CODE = ?";
            }
            if(pFilter.dateGen != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
            }
            if(pFilter.dateStart != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
            }
            if(pFilter.dateFinal != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
            }
            if(pFilter.yearGen != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
            }
            if(pFilter.monthGen != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
            }
            if (pFilter.commentGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (pFilter.commentGen.indexOf('*',0) < 0 && pFilter.commentGen.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENPLANWORK.COMMENTGEN = ?";
                else
                    whereStr = whereStr + "  ENPLANWORK.COMMENTGEN LIKE ?";
            }
            if (pFilter.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (pFilter.userGen.indexOf('*',0) < 0 && pFilter.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
                else
                    whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
            }
            if(pFilter.dateEdit != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
            }
            if(pFilter.distanceAlong != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DISTANCEALONG = ?";
            }
            if(pFilter.distanceTo != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DISTANCETO = ?";
            }
            if (pFilter.workOrderNumber != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (pFilter.workOrderNumber.indexOf('*',0) < 0 && pFilter.workOrderNumber.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER = ?";
                else
                    whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER LIKE ?";
            }
            if(pFilter.dateWorkOrder != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DATEWORKORDER = ?";
            }
            if (pFilter.priConnectionNumber != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (pFilter.priConnectionNumber.indexOf('*',0) < 0 && pFilter.priConnectionNumber.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER = ?";
                else
                    whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";
            }

            if(pFilter.modify_time != Long.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.MODIFY_TIME = ?";
            }
            if(pFilter.status.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.STATUSCODE = ? ";
            }
            if(pFilter.elementRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.ELEMENTREFCODE = ? ";
            }
            if(pFilter.typeRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
            }
            if(pFilter.kind.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.KINDCODE = ? ";
            }
            if(pFilter.renRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.RENREFCODE = ? ";
            }
            if(pFilter.finExecutor.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.FINEXECUTORCODE = ? ";
            }
            if(pFilter.stateRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
            }
            if(pFilter.formRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.FORMREFCODE = ? ";
            }
            if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.BUDGETREFCODE = ? ";
            }
            if(pFilter.responsibilityRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
            }
            if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.DEPARTMENTREFCODE = ? ";
            }
        /////////////////////////////////////////////////////////////////////////////////////
        }


        if(conditionE.length() != 0)
        {
            if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";

            whereStr = whereStr + " (" + conditionE + ")";
        }

        if(conditionP.length() != 0)
        {
            if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";

            whereStr = whereStr + " (" + conditionP + ")";
        }

//    + " WHERE" +  сделано выше ????
        if(whereStr.length() != 0)
            selectStr = selectStr + " WHERE" + whereStr;

    // selectStr = selectStr + ") ";

    selectStr = selectStr + " ORDER BY " + orderBy;

    try
        {
        statement = connection.prepareStatement(selectStr);

        // System.out.println("############# getDetailedEstimateList selectStr = " + selectStr);

        int number = 0;
        if(eFilter != null){
            if(eFilter.code != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,eFilter.code);
            }
        if(eFilter.countGen != null){
            number++;
            eFilter.countGen = eFilter.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,eFilter.countGen);
        }
        if(eFilter.countFact != null){
            number++;
            eFilter.countFact = eFilter.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,eFilter.countFact);
        }
            if (eFilter.commentGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (eFilter.commentGen.indexOf('*',0) < 0 && eFilter.commentGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
                else
                    whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

            if(eFilter.commentGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(eFilter.commentGen);
                for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            }
            if (eFilter.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
                else
                    whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

            if(eFilter.userGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(eFilter.userGen);
                for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            }
        if(eFilter.dateEdit != null){
            number++;
            statement.setDate(number,new java.sql.Date(eFilter.dateEdit.getTime()));
        }


        if(eFilter.modify_time != Long.MIN_VALUE){
            number++;
            if(eFilter.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(eFilter.modify_time));
        }
        if(eFilter.planRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,eFilter.planRef.code);
        }
        if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,eFilter.planItemRef.code);
        }
        if(eFilter.materialRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,eFilter.materialRef.code);
        }
        if(eFilter.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,eFilter.typeRef.code);
        }

        if(eFilter.kindRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,eFilter.kindRef.code);
        }

        if(eFilter.statusRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,eFilter.statusRef.code);
        }
        }


        if(pFilter != null)
        {
        /*
        if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.departmentRef.code);           }

        if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.budgetRef.code);
        }
        if(pFilter.yearGen != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.yearGen);
        }

        if(pFilter.monthGen != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.monthGen);
        }
        if(pFilter.formRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.formRef.code);
        }

        if (pFilter.elementRef.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number, pFilter.elementRef.code);
        }
        */

        //////////////////////////////////////////////////////////
            if(pFilter.code != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,pFilter.code);
            }
            if(pFilter.dateGen != null){
                number++;
                statement.setDate(number,new java.sql.Date(pFilter.dateGen.getTime()));
            }
            if(pFilter.dateStart != null){
                number++;
                statement.setDate(number,new java.sql.Date(pFilter.dateStart.getTime()));
            }
            if(pFilter.dateFinal != null){
                number++;
                statement.setDate(number,new java.sql.Date(pFilter.dateFinal.getTime()));
            }
            if(pFilter.yearGen != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,pFilter.yearGen);
            }
            if(pFilter.monthGen != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,pFilter.monthGen);
            }
            if (pFilter.commentGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (pFilter.commentGen.indexOf('*',0) < 0 && pFilter.commentGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENPLANWORK.COMMENTGEN = ?";
                else
                    whereStr = whereStr + " ENPLANWORK.COMMENTGEN LIKE ?";

            if(pFilter.commentGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(pFilter.commentGen);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            }
            if (pFilter.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (pFilter.userGen.indexOf('*',0) < 0 && pFilter.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENPLANWORK.USERGEN = ?";
                else
                    whereStr = whereStr + " ENPLANWORK.USERGEN LIKE ?";

            if(pFilter.userGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(pFilter.userGen);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            }
            if(pFilter.dateEdit != null){
                number++;
                statement.setDate(number,new java.sql.Date(pFilter.dateEdit.getTime()));
            }
            if(pFilter.distanceAlong != null){
                number++;
                pFilter.distanceAlong = pFilter.distanceAlong.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,pFilter.distanceAlong);
            }
            if(pFilter.distanceTo != null){
                number++;
                pFilter.distanceTo = pFilter.distanceTo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,pFilter.distanceTo);
            }
            if (pFilter.workOrderNumber != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (pFilter.workOrderNumber.indexOf('*',0) < 0 && pFilter.workOrderNumber.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER = ?";
                else
                    whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER LIKE ?";

            if(pFilter.workOrderNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(pFilter.workOrderNumber);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            }
            if(pFilter.dateWorkOrder != null){
                number++;
                statement.setDate(number,new java.sql.Date(pFilter.dateWorkOrder.getTime()));
            }
            if (pFilter.priConnectionNumber != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (pFilter.priConnectionNumber.indexOf('*',0) < 0 && pFilter.priConnectionNumber.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER = ?";
                else
                    whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";

            if(pFilter.priConnectionNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(pFilter.priConnectionNumber);
                for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
            }

            if(pFilter.modify_time != Long.MIN_VALUE){
                number++;
                if(pFilter.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(number,null);
                else
                    statement.setBigDecimal(number,new java.math.BigDecimal(pFilter.modify_time));
            }
        if(pFilter.status.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,pFilter.status.code);
        }
        if(pFilter.elementRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,pFilter.elementRef.code);
        }
        if(pFilter.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,pFilter.typeRef.code);
        }
        if(pFilter.kind.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,pFilter.kind.code);
        }
        if(pFilter.renRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,pFilter.renRef.code);
        }
        if(pFilter.finExecutor.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,pFilter.finExecutor.code);
        }
        if(pFilter.stateRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,pFilter.stateRef.code);
        }
        if(pFilter.formRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,pFilter.formRef.code);
        }
        if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,pFilter.budgetRef.code);
        }
        if(pFilter.responsibilityRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,pFilter.responsibilityRef.code);
        }
        if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,pFilter.departmentRef.code);
        }
        //////////////////////////////////////////////////////////
        }


        //if(condition.length() > 0 && aBindObjects != null)
        // _bindObjectsToPreparedStatement(statement,aBindObjects,number);

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

        anObject = new ENEstimateItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.countGen = set.getBigDecimal(2);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countFact = set.getBigDecimal(3);
        if(anObject.countFact != null)
            anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(4);
        anObject.dateEdit = set.getDate(5);


        anObject.planRefCode = set.getInt(6);

        anObject.planRefDateGen = set.getDate(7);

        anObject.planRefUserGen = set.getString(8);

        anObject.planRefDateEdit = set.getDate(9);

        anObject.planItemRefCode = set.getInt(10);
        if (set.wasNull())
            anObject.planItemRefCode = Integer.MIN_VALUE;

        anObject.planItemRefCountGen = set.getBigDecimal(11);
        if(anObject.planItemRefCountGen != null)
            anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.planItemRefUserGen = set.getString(12);

        anObject.planItemRefDateEdit = set.getDate(13);

        anObject.materialRefCode = set.getInt(14);

        anObject.materialRefName = set.getString(15);

        anObject.typeRefCode = set.getInt(16);

        anObject.typeRefName = set.getString(17);

        anObject.measureType = set.getString(18);

        anObject.kartaRefCode = set.getInt(19);
        anObject.kartaNum = set.getString(20);
        anObject.kartaRefName = set.getString(21);

        anObject.kindRefCode = set.getInt(22);
        anObject.kindRefName = set.getString(23);

        anObject.statusRefCode = set.getInt(24);
        anObject.statusRefName = set.getString(25);

        anObject.countFINMaterials = set.getInt(26);
        if ( set.wasNull() )
            anObject.countFINMaterials = Integer.MIN_VALUE;

        //",  enelementdata.invnumber,  enelementdata.ename,  enelementdata.ecode, enplanworktype.name, enplanworkstate.name "+
        anObject.invNumber = set.getString(27);
        anObject.elementName = set.getString(28);
        anObject.ecode = set.getInt(29);
        if ( set.wasNull() )
            anObject.ecode = Integer.MIN_VALUE;
        anObject.planType = set.getString(30);
        anObject.planState = set.getString(31);

        anObject.planRefYearGen = set.getInt(32);
        if ( set.wasNull() )
            anObject.planRefYearGen = Integer.MIN_VALUE;

        anObject.planRefMonthGen = set.getInt(33);
        if ( set.wasNull() )
            anObject.planRefMonthGen = Integer.MIN_VALUE;

        anObject.planRefDateStart = set.getDate(34);
        anObject.planRefDateFinal = set.getDate(35);

        anObject.planRefDepartmentCode = set.getInt(36);
        if (set.wasNull())
            anObject.planRefDepartmentCode = Integer.MIN_VALUE;

        anObject.planRefDepartmentName = set.getString(37);


        anObject.budgetRefCode = set.getInt(38);
        if ( set.wasNull() )
            anObject.budgetRefCode = Integer.MIN_VALUE;

        anObject.ddsCodeAvz = set.getInt(39);
        if (set.wasNull())
            anObject.ddsCodeAvz = Integer.MIN_VALUE;

        anObject.planRefStatusCode = set.getInt(40);
        if (set.wasNull())
        	anObject.planRefStatusCode = Integer.MIN_VALUE;

anObject.purchaseItemRefCode = set.getInt("purchaseitemrefcode");
        if (set.wasNull())
        	anObject.purchaseItemRefCode = Integer.MIN_VALUE;

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


  public ENEstimateItemShortList getDetailedEstimateListForTender(ENEstimateItemFilter eFilter, ENPlanWorkFilter pFilter, RQOrderFilter orderFilter,
        boolean includePlanned, boolean includeOrdered, boolean includePresent) throws PersistenceException
  {
    ENEstimateItemShortList result = new ENEstimateItemShortList();
    ENEstimateItemShort anObject;
    result.list = new Vector<>();

    String     selectStr = "";
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";

    String     conditionE = eFilter.conditionSQL == null ? "" : eFilter.conditionSQL;
    String     conditionP = pFilter.conditionSQL == null ? "" : pFilter.conditionSQL;

    String     orderBy = eFilter.orderBySQL == null ? "" : eFilter.orderBySQL; //processCondition(anOrderBy);

    if(orderBy.length() == 0)
        orderBy = "ENESTIMATEITEM.CODE";

    //if(quantity < 0)
    int quantity = Integer.MAX_VALUE/2;
    int fromPosition = 0;
    if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    //int number = 0;

    if (includePlanned)
    {
        //// 30.01.13 Добавилась возможность выбирать материалы, которые уже в наличии
        // Пробьем статически
        // eFilter.statusRef.code = ENEstimateItemStatus.PLANNED;
        eFilter.statusRef.code = Integer.MIN_VALUE; // Статусы обрабатываются ниже

        String strEstimatesStatus = "";
        if (includePresent)
        {
            strEstimatesStatus = ENEstimateItemStatus.PLANNED + ", " + ENEstimateItemStatus.PRESENT;
        }
        else
        {
            strEstimatesStatus = "" + ENEstimateItemStatus.PLANNED;
        }

        selectStr = "SELECT "+
            "ENESTIMATEITEM.CODE"+
            ",ENESTIMATEITEM.COUNTGEN"+
            ",ENESTIMATEITEM.COUNTFACT"+
            ",ENESTIMATEITEM.USERGEN"+
            ",ENESTIMATEITEM.DATEEDIT"+

            ", ENPLANWORK.CODE " +
            ", ENPLANWORK.DATEGEN " +
            ", ENPLANWORK.USERGEN " +
            ", ENPLANWORK.DATEEDIT " +
            ", ENPLANWORKITEM.CODE " +
            ", ENPLANWORKITEM.COUNTGEN " +
            ", ENPLANWORKITEM.USERGEN " +
            ", ENPLANWORKITEM.DATEEDIT " +
            ", sm.CODE " +
            ", sm.NAME " +
            ", ENESTIMATEITEMTYPE.CODE " +
            ", ENESTIMATEITEMTYPE.NAME " +
            ", tu.NAME  "+
        //   ", kr.id, kr.NUM, kr.OPISANIE " +
            ", kr.code, kr.techkartnumber, kr.name " +

            ", ENESTIMATEITEMKIND.CODE " +
            ", ENESTIMATEITEMKIND.NAME " +

            ", ENESTIMATEITEM.STATUSREFCODE "+
            ", ENESTIMATEITEMSTATUS.NAME " +

            ", (select count(f.code) from finmaterials f where f.estimateitemrefcode = ENESTIMATEITEM.CODE and f.statusrefcode = 1) as countFINMaterials " +

            ", (select invnumber||coalesce(' (дог.№'||ENPLANWORK.PRICONNECTIONNUMBER||')', '') from enelementdata where ecode = enplanwork.elementrefcode ) as invnumber " +
            ", (select ename from enelementdata where ecode = enplanwork.elementrefcode ) as ename " +
            ", enplanwork.elementrefcode " +

            //",  enelementdata.invnumber||coalesce(' (дог.№'||ENPLANWORK.PRICONNECTIONNUMBER||')', ''),  enelementdata.ename,  enelementdata.ecode" +

            ", enplanworktype.name, enplanworkstate.name "+

            ", ENPLANWORK.YEARGEN " +
            ", ENPLANWORK.MONTHGEN " +

            ", ENPLANWORK.DATESTART, ENPLANWORK.DATEFINAL " +

            ", ENPLANWORK.DEPARTMENTREFCODE " +
            ", ENDEPARTMENT.NAME " +


            ", enplanwork.budgetrefcode " +   // 38
            ", (select '213400'::numeric from enpurchasesobject s " +
            "    where s.elementcode = enplanwork.elementrefcode " +
            "      and s.purchasesreasoncode = " + ENPurchasesObjectReason.PURCHASES_AVZ + ") " +

			", ENESTIMATEITEM.CODE as RQPURCHASEITEMCODE " +

            " FROM ENESTIMATEITEM " +

            "left join ENPLANWORKITEM on ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE " +

        //  " left join TEHKART._ARTI kr on kr.id = ENPLANWORKITEM.kartarefcode " +

            " left join TKTECHCARD kr on kr.code = ENPLANWORKITEM.kartarefcode " +
            ", ENPLANWORK " +
            //", ENPLANWORKITEM " +
            ", TKMATERIALS sm" +
        //  ", REPIMPORT.TMESURE_UNIT tu" +
            ",TKMEASUREMENT tu" +
            ", ENESTIMATEITEMTYPE " +
            ", ENESTIMATEITEMKIND " +
            ", ENESTIMATEITEMSTATUS " +
            // перенести ...
            //", enelementdata  " +
            ", enplanworktype, enplanworkstate " +

            " , ENDEPARTMENT " +
            //" WHERE "
            "";

            whereStr = " ENPLANWORK.CODE = ENESTIMATEITEM.PLANREFCODE" ; //+

            whereStr = whereStr + " and tu.code = sm.MEASUREMENTCODE ";

            //whereStr = whereStr +" AND ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE" ; //+

            whereStr = whereStr +" AND sm.CODE = ENESTIMATEITEM.MATERIALREFCODE" ; //+

            whereStr = whereStr + " ";

            whereStr = whereStr +" AND ENESTIMATEITEMTYPE.CODE = ENESTIMATEITEM.TYPEREFCODE" ; //+

            whereStr = whereStr +" AND ENESTIMATEITEMKIND.CODE = ENESTIMATEITEM.KINDREFCODE" ; //+

            whereStr = whereStr +" AND ENESTIMATEITEMSTATUS.CODE = ENESTIMATEITEM.STATUSREFCODE ";

            whereStr = whereStr +" AND ENESTIMATEITEM.COUNTFACT <> 0 ";

            ///// 30.01.13
            // Не выбираем те, которые уже привязаны (перенесено из клиента)
            whereStr = whereStr + " AND enestimateitem.code not in (select enestimateitem2contrct.estimateitemcode from enestimateitem2contrct) ";
            // Не выбираем те, которые в приходах
            whereStr = whereStr + " AND enestimateitem.code not in " +
                                " (select ie.estimateitemcode " +
                                "    from rqfkorderitem2enstmttm ie " +
                                "   where ie.finmaterialsrefcode is null) ";
            // Не выбираем те, которые в заявках
            whereStr = whereStr + " AND enestimateitem.code not in " +
                                " (select oie.estimateitemcode " +
                                "    from rqorderitem2enestimttm oie) ";
            /////

            //whereStr = whereStr +" AND ENESTIMATEITEM.statusrefcode  in ("+ ENEstimateItemStatus.PLANNED + ", " + ENEstimateItemStatus.TEMP +") ";

            // чуть шо перенести в другой метод ...
            whereStr = whereStr +" and enplanworktype.code = enplanwork.typerefcode and enplanworkstate.code = enplanwork.staterefcode";
            //whereStr = whereStr +" and enplanwork.elementrefcode = enelementdata.ecode ";
            whereStr = whereStr + " AND ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE ";

            whereStr = whereStr +" and enplanwork.statuscode not in (2, 6) ";

            /*
            if (pFilter.kind != null && pFilter.kind.code == ENPlanWorkKind.SALE_SPECIFICATION) {
                whereStr = whereStr + " and enplanwork.kindcode = " + ENPlanWorkKind.SALE_SPECIFICATION;
            } else {
                whereStr = whereStr + " and enplanwork.kindcode = " + ENPlanWorkKind.CURRENT;
            }
            */
            whereStr = whereStr + " and enplanwork.kindcode = " + ENPlanWorkKind.CURRENT;


            //selectStr = selectStr + " ${s} ENESTIMATEITEM.CODE IN ( SELECT ENESTIMATEITEM.CODE FROM ENESTIMATEITEM ";

    //    " ";
            if(eFilter != null)
            {
            if(eFilter.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.CODE = ?";
            }
            if(eFilter.countGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.COUNTGEN = ?";
            }
            if(eFilter.countFact != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.COUNTFACT = ?";
            }
                if (eFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
                    else
                        whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
                }
            if(eFilter.dateEdit != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
            }
            if(eFilter.planRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.PLANREFCODE = ? ";
            }
            if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
            }
            if(eFilter.materialRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
            }
            if(eFilter.typeRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.TYPEREFCODE = ? ";
            }

            if(eFilter.kindRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.KINDREFCODE = ? ";
            }
            if(eFilter.statusRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
            }
            }


            if(pFilter != null)
            {


            /////////////////////////////////////////////////////////////////////////////////////
                if(pFilter.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.CODE = ?";
                }
                if(pFilter.dateGen != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
                }
                if(pFilter.dateStart != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
                }
                if(pFilter.dateFinal != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
                }
                if(pFilter.yearGen != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
                }
                if(pFilter.monthGen != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
                }
                if (pFilter.commentGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (pFilter.commentGen.indexOf('*',0) < 0 && pFilter.commentGen.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.COMMENTGEN = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.COMMENTGEN LIKE ?";
                }
                if (pFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (pFilter.userGen.indexOf('*',0) < 0 && pFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
                }
                if(pFilter.dateEdit != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
                }
                if(pFilter.distanceAlong != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DISTANCEALONG = ?";
                }
                if(pFilter.distanceTo != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DISTANCETO = ?";
                }
                if (pFilter.workOrderNumber != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (pFilter.workOrderNumber.indexOf('*',0) < 0 && pFilter.workOrderNumber.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER LIKE ?";
                }
                if(pFilter.dateWorkOrder != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEWORKORDER = ?";
                }
                if (pFilter.priConnectionNumber != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (pFilter.priConnectionNumber.indexOf('*',0) < 0 && pFilter.priConnectionNumber.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";
                }

                if(pFilter.modify_time != Long.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.MODIFY_TIME = ?";
                }
                if(pFilter.status.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.STATUSCODE = ? ";
                }
                if(pFilter.elementRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.ELEMENTREFCODE = ? ";
                }
                if(pFilter.typeRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
                }
                if(pFilter.kind.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.KINDCODE = ? ";
                }
                if(pFilter.renRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.RENREFCODE = ? ";
                }
                if(pFilter.finExecutor.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.FINEXECUTORCODE = ? ";
                }
                if(pFilter.stateRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
                }
                if(pFilter.formRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.FORMREFCODE = ? ";
                }
                if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.BUDGETREFCODE = ? ";
                }
                if(pFilter.responsibilityRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
                }
                if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.DEPARTMENTREFCODE = ? ";
                }
            /////////////////////////////////////////////////////////////////////////////////////
            }

            ///// 30.01.13
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEITEM.STATUSREFCODE in (" + strEstimatesStatus + ") ";
            /////

            if(conditionE.length() != 0)
            {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";

                whereStr = whereStr + " (" + conditionE + ")";
            }

            if(conditionP.length() != 0)
            {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";

                whereStr = whereStr + " (" + conditionP + ")";
            }

    //    + " WHERE" +  сделано выше ????
            if(whereStr.length() != 0)
                selectStr = selectStr + " WHERE" + whereStr;

        // selectStr = selectStr + ") ";

        selectStr = selectStr + " ORDER BY " + orderBy;

        try
            {
            statement = connection.prepareStatement(selectStr);
            int number = 0;
            if(eFilter != null){
                if(eFilter.code != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,eFilter.code);
                }
            if(eFilter.countGen != null){
                number++;
                eFilter.countGen = eFilter.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,eFilter.countGen);
            }
            if(eFilter.countFact != null){
                number++;
                eFilter.countFact = eFilter.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,eFilter.countFact);
            }
                if (eFilter.commentGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (eFilter.commentGen.indexOf('*',0) < 0 && eFilter.commentGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
                    else
                        whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

                if(eFilter.commentGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(eFilter.commentGen);
                    for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
                if (eFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
                    else
                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

                if(eFilter.userGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(eFilter.userGen);
                    for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
            if(eFilter.dateEdit != null){
                number++;
                statement.setDate(number,new java.sql.Date(eFilter.dateEdit.getTime()));
            }


            if(eFilter.modify_time != Long.MIN_VALUE){
                number++;
                if(eFilter.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(number,null);
                else
                    statement.setBigDecimal(number,new java.math.BigDecimal(eFilter.modify_time));
            }
            if(eFilter.planRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.planRef.code);
            }
            if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.planItemRef.code);
            }
            if(eFilter.materialRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.materialRef.code);
            }
            if(eFilter.typeRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.typeRef.code);
            }

            if(eFilter.kindRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.kindRef.code);
            }

            if(eFilter.statusRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.statusRef.code);
            }
            }


            if(pFilter != null)
            {
            //////////////////////////////////////////////////////////
                if(pFilter.code != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,pFilter.code);
                }
                if(pFilter.dateGen != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateGen.getTime()));
                }
                if(pFilter.dateStart != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateStart.getTime()));
                }
                if(pFilter.dateFinal != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateFinal.getTime()));
                }
                if(pFilter.yearGen != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,pFilter.yearGen);
                }
                if(pFilter.monthGen != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,pFilter.monthGen);
                }
                if (pFilter.commentGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (pFilter.commentGen.indexOf('*',0) < 0 && pFilter.commentGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENPLANWORK.COMMENTGEN = ?";
                    else
                        whereStr = whereStr + " ENPLANWORK.COMMENTGEN LIKE ?";

                if(pFilter.commentGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(pFilter.commentGen);
                    for(int i = 0;i < likeStr.length();i++){
                            if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                            if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
                if (pFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (pFilter.userGen.indexOf('*',0) < 0 && pFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENPLANWORK.USERGEN = ?";
                    else
                        whereStr = whereStr + " ENPLANWORK.USERGEN LIKE ?";

                if(pFilter.userGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(pFilter.userGen);
                    for(int i = 0;i < likeStr.length();i++){
                            if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                            if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
                if(pFilter.dateEdit != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateEdit.getTime()));
                }
                if(pFilter.distanceAlong != null){
                    number++;
                    pFilter.distanceAlong = pFilter.distanceAlong.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number,pFilter.distanceAlong);
                }
                if(pFilter.distanceTo != null){
                    number++;
                    pFilter.distanceTo = pFilter.distanceTo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number,pFilter.distanceTo);
                }
                if (pFilter.workOrderNumber != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (pFilter.workOrderNumber.indexOf('*',0) < 0 && pFilter.workOrderNumber.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER = ?";
                    else
                        whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER LIKE ?";

                if(pFilter.workOrderNumber != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(pFilter.workOrderNumber);
                    for(int i = 0;i < likeStr.length();i++){
                            if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                            if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
                if(pFilter.dateWorkOrder != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateWorkOrder.getTime()));
                }
                if (pFilter.priConnectionNumber != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (pFilter.priConnectionNumber.indexOf('*',0) < 0 && pFilter.priConnectionNumber.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER = ?";
                    else
                        whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";

                if(pFilter.priConnectionNumber != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(pFilter.priConnectionNumber);
                    for(int i = 0;i < likeStr.length();i++){
                            if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                            if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }

                if(pFilter.modify_time != Long.MIN_VALUE){
                    number++;
                    if(pFilter.modify_time == Long.MIN_VALUE)
                        statement.setBigDecimal(number,null);
                    else
                        statement.setBigDecimal(number,new java.math.BigDecimal(pFilter.modify_time));
                }
            if(pFilter.status.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.status.code);
            }
            if(pFilter.elementRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.elementRef.code);
            }
            if(pFilter.typeRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.typeRef.code);
            }
            if(pFilter.kind.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.kind.code);
            }
            if(pFilter.renRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.renRef.code);
            }
            if(pFilter.finExecutor.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.finExecutor.code);
            }
            if(pFilter.stateRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.stateRef.code);
            }
            if(pFilter.formRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.formRef.code);
            }
            if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.budgetRef.code);
            }
            if(pFilter.responsibilityRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.responsibilityRef.code);
            }
            if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.departmentRef.code);
            }
            //////////////////////////////////////////////////////////
            }

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

            anObject = new ENEstimateItemShort();

            anObject.code = set.getInt(1);
            if ( set.wasNull() )
                anObject.code = Integer.MIN_VALUE;
            anObject.countGen = set.getBigDecimal(2);
            if(anObject.countGen != null)
                anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            anObject.countFact = set.getBigDecimal(3);
            if(anObject.countFact != null)
                anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            anObject.userGen = set.getString(4);
            anObject.dateEdit = set.getDate(5);


            anObject.planRefCode = set.getInt(6);

            anObject.planRefDateGen = set.getDate(7);

            anObject.planRefUserGen = set.getString(8);

            anObject.planRefDateEdit = set.getDate(9);

            anObject.planItemRefCode = set.getInt(10);
            if (set.wasNull())
                anObject.planItemRefCode = Integer.MIN_VALUE;

            anObject.planItemRefCountGen = set.getBigDecimal(11);
            if(anObject.planItemRefCountGen != null)
                anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

            anObject.planItemRefUserGen = set.getString(12);

            anObject.planItemRefDateEdit = set.getDate(13);

            anObject.materialRefCode = set.getInt(14);

            anObject.materialRefName = set.getString(15);

            anObject.typeRefCode = set.getInt(16);

            anObject.typeRefName = set.getString(17);

            anObject.measureType = set.getString(18);

            anObject.kartaRefCode = set.getInt(19);
            anObject.kartaNum = set.getString(20);
            anObject.kartaRefName = set.getString(21);

            anObject.kindRefCode = set.getInt(22);
            anObject.kindRefName = set.getString(23);

            anObject.statusRefCode = set.getInt(24);
            anObject.statusRefName = set.getString(25);

            anObject.countFINMaterials = set.getInt(26);
            if ( set.wasNull() )
                anObject.countFINMaterials = Integer.MIN_VALUE;

            //",  enelementdata.invnumber,  enelementdata.ename,  enelementdata.ecode, enplanworktype.name, enplanworkstate.name "+
            anObject.invNumber = set.getString(27);
            anObject.elementName = set.getString(28);
            anObject.ecode = set.getInt(29);
            if ( set.wasNull() )
                anObject.ecode = Integer.MIN_VALUE;
            anObject.planType = set.getString(30);
            anObject.planState = set.getString(31);

            anObject.planRefYearGen = set.getInt(32);
            if ( set.wasNull() )
                anObject.planRefYearGen = Integer.MIN_VALUE;

            anObject.planRefMonthGen = set.getInt(33);
            if ( set.wasNull() )
                anObject.planRefMonthGen = Integer.MIN_VALUE;

            anObject.planRefDateStart = set.getDate(34);
            anObject.planRefDateFinal = set.getDate(35);

            anObject.planRefDepartmentCode = set.getInt(36);
            if (set.wasNull())
                anObject.planRefDepartmentCode = Integer.MIN_VALUE;

            anObject.planRefDepartmentName = set.getString(37);


            anObject.budgetRefCode = set.getInt(38);
            if ( set.wasNull() )
                anObject.budgetRefCode = Integer.MIN_VALUE;

            anObject.ddsCodeAvz = set.getInt(39);
            if (set.wasNull())
                anObject.ddsCodeAvz = Integer.MIN_VALUE;

            anObject.purchaseItemRefCode = set.getInt("RQPURCHASEITEMCODE");
			if(set.wasNull()) {
				anObject.purchaseItemRefCode = Integer.MIN_VALUE;
			}


            result.list.add(anObject);
            }

            result.setTotalCount(i);
            // return result;
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

    /*
    if (selectStr.length() > 0)
    {
        selectStr = selectStr + "\n UNION \n";
    }
    */

    if (includeOrdered)
    {
        //// 30.01.13 Добавилась возможность выбирать материалы, которые уже в наличии
        // Пробьем статически
        // eFilter.statusRef.code = ENEstimateItemStatus.ORDERED;
        eFilter.statusRef.code = Integer.MIN_VALUE; // Статусы обрабатываются ниже

        String strEstimatesStatus = "";
        if (includePresent)
        {
            strEstimatesStatus = ENEstimateItemStatus.ORDERED + ", " + ENEstimateItemStatus.PRESENT;
        }
        else
        {
            strEstimatesStatus = "" + ENEstimateItemStatus.ORDERED;
        }


        String orderCondition = "";

        selectStr = /*selectStr + */ "SELECT "+
            "ENESTIMATEITEM.CODE"+
            ",ENESTIMATEITEM.COUNTGEN"+
            ",ENESTIMATEITEM.COUNTFACT"+
            ",ENESTIMATEITEM.USERGEN"+
            ",ENESTIMATEITEM.DATEEDIT"+

            ", ENPLANWORK.CODE " +
            ", ENPLANWORK.DATEGEN " +
            ", ENPLANWORK.USERGEN " +
            ", ENPLANWORK.DATEEDIT " +
            ", ENPLANWORKITEM.CODE " +
            ", ENPLANWORKITEM.COUNTGEN " +
            ", ENPLANWORKITEM.USERGEN " +
            ", ENPLANWORKITEM.DATEEDIT " +
            ", sm.CODE " +
            ", sm.NAME " +
            ", ENESTIMATEITEMTYPE.CODE " +
            ", ENESTIMATEITEMTYPE.NAME " +
            ", tu.NAME  "+
        //   ", kr.id, kr.NUM, kr.OPISANIE " +
            ", kr.code, kr.techkartnumber, kr.name " +

            ", ENESTIMATEITEMKIND.CODE " +
            ", ENESTIMATEITEMKIND.NAME " +

            ", ENESTIMATEITEM.STATUSREFCODE "+
            ", ENESTIMATEITEMSTATUS.NAME " +

            ", (select count(f.code) from finmaterials f where f.estimateitemrefcode = ENESTIMATEITEM.CODE and f.statusrefcode = 1) as countFINMaterials " +

            ", (select invnumber||coalesce(' (дог.№'||ENPLANWORK.PRICONNECTIONNUMBER||')', '') from enelementdata where ecode = enplanwork.elementrefcode ) as invnumber " +
            ", (select ename from enelementdata where ecode = enplanwork.elementrefcode ) as ename " +
            ", enplanwork.elementrefcode " +

            //",  enelementdata.invnumber||coalesce(' (дог.№'||ENPLANWORK.PRICONNECTIONNUMBER||')', ''),  enelementdata.ename,  enelementdata.ecode" +

            ", enplanworktype.name, enplanworkstate.name "+

            ", ENPLANWORK.YEARGEN " +
            ", ENPLANWORK.MONTHGEN " +

            ", ENPLANWORK.DATESTART, ENPLANWORK.DATEFINAL " +

            ", ENPLANWORK.DEPARTMENTREFCODE " +
            ", ENDEPARTMENT.NAME " +


            ", enplanwork.budgetrefcode " +   // 38
            ", (select '213400'::numeric from enpurchasesobject s " +
            "    where s.elementcode = enplanwork.elementrefcode " +
            "      and s.purchasesreasoncode = " + ENPurchasesObjectReason.PURCHASES_AVZ + ") " +

            /////
            ", RQORDER.NUMBERDOC " +
            ", RQORDER.ORDERPERIOD " +

            ", (select RQORG.NAME from RQORG where RQORG.CODE = RQORDERITEM.ORGCODE) " +
            ", RQORDERITEM.CONTRACTNUMBER " +
            ", RQORDERITEM.CONTRACTDATE " +
            ", RQORDERITEM.FINDOCCODE " +
            ", RQORDERITEM.FINDOCID " +
            /////

            " FROM ENESTIMATEITEM " +

            "left join ENPLANWORKITEM on ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE " +

        //  " left join TEHKART._ARTI kr on kr.id = ENPLANWORKITEM.kartarefcode " +

            " left join TKTECHCARD kr on kr.code = ENPLANWORKITEM.kartarefcode " +
            ", ENPLANWORK " +
            //", ENPLANWORKITEM " +
            ", TKMATERIALS sm" +
        //  ", REPIMPORT.TMESURE_UNIT tu" +
            ",TKMEASUREMENT tu" +
            ", ENESTIMATEITEMTYPE " +
            ", ENESTIMATEITEMKIND " +
            ", ENESTIMATEITEMSTATUS " +
            // перенести ...
            //", enelementdata  " +
            ", enplanworktype, enplanworkstate " +

            " , ENDEPARTMENT " +
            //" WHERE "

            /////
            " , rqorderitem2enestimttm " +
            " , rqorderitem " +
            " , rqorder " +
            /////

            "";

            whereStr = " ENPLANWORK.CODE = ENESTIMATEITEM.PLANREFCODE" ; //+

            whereStr = whereStr + " and tu.code = sm.MEASUREMENTCODE ";

            //whereStr = whereStr +" AND ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE" ; //+

            whereStr = whereStr +" AND sm.CODE = ENESTIMATEITEM.MATERIALREFCODE" ; //+

            whereStr = whereStr + " ";

            whereStr = whereStr +" AND ENESTIMATEITEMTYPE.CODE = ENESTIMATEITEM.TYPEREFCODE" ; //+

            whereStr = whereStr +" AND ENESTIMATEITEMKIND.CODE = ENESTIMATEITEM.KINDREFCODE" ; //+

            whereStr = whereStr +" AND ENESTIMATEITEMSTATUS.CODE = ENESTIMATEITEM.STATUSREFCODE ";

            whereStr = whereStr +" AND ENESTIMATEITEM.COUNTFACT <> 0 ";

            //whereStr = whereStr +" AND ENESTIMATEITEM.statusrefcode  in ("+ ENEstimateItemStatus.PLANNED + ", " + ENEstimateItemStatus.TEMP +") ";

            ///// 30.01.13
            // Не выбираем те, которые уже привязаны (перенесено из клиента)
            whereStr = whereStr + " AND enestimateitem.code not in (select enestimateitem2contrct.estimateitemcode from enestimateitem2contrct) ";
            // Не выбираем те, которые в приходах
            whereStr = whereStr + " AND enestimateitem.code not in " +
                                " (select ie.estimateitemcode " +
                                "    from rqfkorderitem2enstmttm ie " +
                                "   where ie.finmaterialsrefcode is null) ";
            /////

            /////
            whereStr = whereStr +" AND ENESTIMATEITEM.CODE = rqorderitem2enestimttm.estimateitemcode ";
            whereStr = whereStr +" AND rqorderitem2enestimttm.orderitemcode = rqorderitem.code ";
            whereStr = whereStr +" AND rqorderitem.orderrefcode = rqorder.code ";
            /////


            // чуть шо перенести в другой метод ...
            whereStr = whereStr +" and enplanworktype.code = enplanwork.typerefcode and enplanworkstate.code = enplanwork.staterefcode";
            //whereStr = whereStr +" and enplanwork.elementrefcode = enelementdata.ecode ";
            whereStr = whereStr + " AND ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE ";

            whereStr = whereStr +" and enplanwork.statuscode not in (2, 6) ";


            whereStr = whereStr + " and enplanwork.kindcode = " + ENPlanWorkKind.CURRENT;


            //selectStr = selectStr + " ${s} ENESTIMATEITEM.CODE IN ( SELECT ENESTIMATEITEM.CODE FROM ENESTIMATEITEM ";

    //    " ";
            if(eFilter != null)
            {
            if(eFilter.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.CODE = ?";
            }
            if(eFilter.countGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.COUNTGEN = ?";
            }
            if(eFilter.countFact != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.COUNTFACT = ?";
            }
                if (eFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
                    else
                        whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
                }
            if(eFilter.dateEdit != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
            }
            if(eFilter.planRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.PLANREFCODE = ? ";
            }
            if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
            }
            if(eFilter.materialRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
            }
            if(eFilter.typeRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.TYPEREFCODE = ? ";
            }

            if(eFilter.kindRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.KINDREFCODE = ? ";
            }

            if(eFilter.statusRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
            }

            }

            ///// 30.01.13
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEITEM.STATUSREFCODE in (" + strEstimatesStatus + ") ";
            /////

            if(conditionE.length() != 0)
            {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";

                whereStr = whereStr + " (" + conditionE + ")";
            }

            /*
            if(conditionP.length() != 0)
            {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";

                whereStr = whereStr + " (" + conditionP + ")";
            }
            */

            orderCondition = "";

            if (orderFilter != null)
            {
                    if(orderFilter.code != Integer.MIN_VALUE) {
                        orderCondition = " RQORDER.CODE = ? ";
                    }

                    if(orderFilter.orderPeriod != null) {
                        if(orderCondition.length() != 0)
                            orderCondition = orderCondition + " AND ";
                        orderCondition = " first_day(RQORDER.ORDERPERIOD) = ? ";
                    }

                    if(orderFilter.kindRef != null)
                    {
                        if(orderFilter.kindRef.code != Integer.MIN_VALUE) {
                            if(orderCondition.length() != 0)
                                orderCondition = orderCondition + " AND ";
                            orderCondition = orderCondition + " RQORDER.KINDREFCODE = ? ";
                        }
                    }
            }

            /*
            String eCondition =
                " ENESTIMATEITEM.CODE in ( " +
                "   select ie.estimateitemcode " +
                "     from rqorderitem2enestimttm ie, rqorderitem oi, rqorder " +
                "    where ie.orderitemcode = oi.code " +
                "      and oi.orderrefcode = rqorder.code " +
                "      and " + orderCondition +
                " ) ";
            */

                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";

                // whereStr = whereStr + " (" + eCondition + ")";
                whereStr = whereStr + " (" + orderCondition + ")";

    //    + " WHERE" +  сделано выше ????
            if(whereStr.length() != 0)
                selectStr = selectStr + " WHERE" + whereStr;

        // selectStr = selectStr + ") ";

        selectStr = selectStr + " ORDER BY " + orderBy;

        try
            {
            statement = connection.prepareStatement(selectStr);
            int number = 0;
            if(eFilter != null){
                if(eFilter.code != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,eFilter.code);
                }
            if(eFilter.countGen != null){
                number++;
                eFilter.countGen = eFilter.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,eFilter.countGen);
            }
            if(eFilter.countFact != null){
                number++;
                eFilter.countFact = eFilter.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,eFilter.countFact);
            }
                if (eFilter.commentGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (eFilter.commentGen.indexOf('*',0) < 0 && eFilter.commentGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
                    else
                        whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

                if(eFilter.commentGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(eFilter.commentGen);
                    for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
                if (eFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
                    else
                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

                if(eFilter.userGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(eFilter.userGen);
                    for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
            if(eFilter.dateEdit != null){
                number++;
                statement.setDate(number,new java.sql.Date(eFilter.dateEdit.getTime()));
            }


            if(eFilter.modify_time != Long.MIN_VALUE){
                number++;
                if(eFilter.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(number,null);
                else
                    statement.setBigDecimal(number,new java.math.BigDecimal(eFilter.modify_time));
            }
            if(eFilter.planRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.planRef.code);
            }
            if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.planItemRef.code);
            }
            if(eFilter.materialRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.materialRef.code);
            }
            if(eFilter.typeRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.typeRef.code);
            }

            if(eFilter.kindRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.kindRef.code);
            }

            if(eFilter.statusRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.statusRef.code);
            }
            }



            if (orderFilter != null)
            {
                if(orderFilter.code != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,orderFilter.code);
                }

                if(orderFilter.orderPeriod != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(orderFilter.orderPeriod.getTime()));
                }

                if(orderFilter.kindRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number,orderFilter.kindRef.code);
                }
            }


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

            anObject = new ENEstimateItemShort();

            anObject.code = set.getInt(1);
            if ( set.wasNull() )
                anObject.code = Integer.MIN_VALUE;
            anObject.countGen = set.getBigDecimal(2);
            if(anObject.countGen != null)
                anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            anObject.countFact = set.getBigDecimal(3);
            if(anObject.countFact != null)
                anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            anObject.userGen = set.getString(4);
            anObject.dateEdit = set.getDate(5);


            anObject.planRefCode = set.getInt(6);

            anObject.planRefDateGen = set.getDate(7);

            anObject.planRefUserGen = set.getString(8);

            anObject.planRefDateEdit = set.getDate(9);

            anObject.planItemRefCode = set.getInt(10);
            if (set.wasNull())
                anObject.planItemRefCode = Integer.MIN_VALUE;

            anObject.planItemRefCountGen = set.getBigDecimal(11);
            if(anObject.planItemRefCountGen != null)
                anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

            anObject.planItemRefUserGen = set.getString(12);

            anObject.planItemRefDateEdit = set.getDate(13);

            anObject.materialRefCode = set.getInt(14);

            anObject.materialRefName = set.getString(15);

            anObject.typeRefCode = set.getInt(16);

            anObject.typeRefName = set.getString(17);

            anObject.measureType = set.getString(18);

            anObject.kartaRefCode = set.getInt(19);
            anObject.kartaNum = set.getString(20);
            anObject.kartaRefName = set.getString(21);

            anObject.kindRefCode = set.getInt(22);
            anObject.kindRefName = set.getString(23);

            anObject.statusRefCode = set.getInt(24);
            anObject.statusRefName = set.getString(25);

            anObject.countFINMaterials = set.getInt(26);
            if ( set.wasNull() )
                anObject.countFINMaterials = Integer.MIN_VALUE;

            //",  enelementdata.invnumber,  enelementdata.ename,  enelementdata.ecode, enplanworktype.name, enplanworkstate.name "+
            anObject.invNumber = set.getString(27);
            anObject.elementName = set.getString(28);
            anObject.ecode = set.getInt(29);
            if ( set.wasNull() )
                anObject.ecode = Integer.MIN_VALUE;
            anObject.planType = set.getString(30);
            anObject.planState = set.getString(31);

            anObject.planRefYearGen = set.getInt(32);
            if ( set.wasNull() )
                anObject.planRefYearGen = Integer.MIN_VALUE;

            anObject.planRefMonthGen = set.getInt(33);
            if ( set.wasNull() )
                anObject.planRefMonthGen = Integer.MIN_VALUE;

            anObject.planRefDateStart = set.getDate(34);
            anObject.planRefDateFinal = set.getDate(35);

            anObject.planRefDepartmentCode = set.getInt(36);
            if (set.wasNull())
                anObject.planRefDepartmentCode = Integer.MIN_VALUE;

            anObject.planRefDepartmentName = set.getString(37);


            anObject.budgetRefCode = set.getInt(38);
            if ( set.wasNull() )
                anObject.budgetRefCode = Integer.MIN_VALUE;

            anObject.ddsCodeAvz = set.getInt(39);
            if (set.wasNull())
                anObject.ddsCodeAvz = Integer.MIN_VALUE;

            /////
            anObject.orderNumber = set.getString(40);
            anObject.orderPeriod = set.getDate(41);

            anObject.orgName = set.getString(42);
            anObject.contractNumber = set.getString(43);
            anObject.contractDate = set.getDate(44);
            anObject.finDocCode = set.getString(45);
            anObject.finDocID = set.getInt(46);
            if ( set.wasNull() )
                anObject.finDocID = Integer.MIN_VALUE;
            /////

            result.list.add(anObject);
            }

            //result.setTotalCount(i);
            result.setTotalCount(result.getTotalCount() + i);
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

    return result;
   }




  @Override
public ENEstimateItemShortList getScrollableFilteredList(ENEstimateItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector<Object> aBindObjects) throws PersistenceException
  {
   ENEstimateItemShortList result = new ENEstimateItemShortList();
   ENEstimateItemShort anObject;
   result.list = new Vector<>();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENESTIMATEITEM.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENESTIMATEITEM.CODE"+
    ",ENESTIMATEITEM.COUNTGEN"+
    ",ENESTIMATEITEM.COUNTFACT"+
    ",ENESTIMATEITEM.USERGEN"+
    ",ENESTIMATEITEM.DATEEDIT"+

     ", ENPLANWORK.CODE " +
     ", ENPLANWORK.DATEGEN " +
     ", ENPLANWORK.USERGEN " +
     ", ENPLANWORK.DATEEDIT " +
     ", ENPLANWORKITEM.CODE " +
     ", ENPLANWORKITEM.COUNTGEN " +
     ", ENPLANWORKITEM.USERGEN " +
     ", ENPLANWORKITEM.DATEEDIT " +
     ", sm.CODE " +
     ", sm.NAME " +
     ", ENESTIMATEITEMTYPE.CODE " +
     ", ENESTIMATEITEMTYPE.NAME " +
     ", tu.NAME  "+
  //   ", kr.id, kr.NUM, kr.OPISANIE " +
     ", kr.code, kr.techkartnumber, kr.name " +
     /*

     ", (select kr.code from TKTECHCARD kr , ENPLANWORKITEM pi where  kr.code = pi.kartarefcode "+
     "  and pi.code = enestimateitem.planitemrefcode ) "+
     ",(select kr.techkartnumber from TKTECHCARD kr , ENPLANWORKITEM pi where  kr.code = pi.kartarefcode "+
     "          and pi.code = enestimateitem.planitemrefcode ) "+
     ",(select kr.name from TKTECHCARD kr , ENPLANWORKITEM pi where  kr.code = pi.kartarefcode "+
     "          and pi.code = enestimateitem.planitemrefcode ) "+
*/
     ", ENESTIMATEITEMKIND.CODE " +
     ", ENESTIMATEITEMKIND.NAME " +

     ", ENESTIMATEITEM.STATUSREFCODE "+
     ", ENESTIMATEITEMSTATUS.NAME " +

     ", (select count(f.code) from finmaterials f where f.estimateitemrefcode = ENESTIMATEITEM.CODE and f.statusrefcode = 1) as countFINMaterials " +

     //",  enelementdata.invnumber,  enelementdata.ename,  enelementdata.ecode" +
     ", (select invnumber from enelementdata where ecode = enplanwork.elementrefcode ) as invnumber " +
     ", (select ename from enelementdata where ecode = enplanwork.elementrefcode ) as ename " +
     ", enplanwork.elementrefcode " +
     ", enplanworktype.name, enplanworkstate.name "+
     ", ENPLANWORK.YEARGEN " +
     ", ENPLANWORK.MONTHGEN " +
     ", ENESTIMATEITEM.DELIVERYTIME " +

     ", ENPLANWORK.DEPARTMENTREFCODE " +
     ", ENDEPARTMENT.NAME " +

     ", ENPLANWORK.DATESTART " +
     ", ENPLANWORK.DATEFINAL " +

     ", tt.code, tt.name " +

     ", ENESTIMATEITEM.ACCOUNTINGTYPEREFCODE " +
     ", ENESTIMATEITEM.ISUSEVAT " +
 //  код связки строки плана закупки к естимейту
     " , ( select pi2ei.code from rqpurchaseitem2estmttm pi2ei where pi2ei.estimateitemrefcode = ENESTIMATEITEM.CODE and pi2ei.purchaseitemrefcode =  ENESTIMATEITEM.purchaseitemrefcode ) as  rqpurchitm2estimatecod " +

     ",  ENESTIMATEITEM.PURCHASEITEMREFCODE as RQPURCHASEITEMCODE " +

    " FROM ENESTIMATEITEM " +

    " left join ENPLANWORK on ENPLANWORK.CODE = ENESTIMATEITEM.PLANREFCODE " +
    " left join ENPLANWORKITEM on ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE " +
    " left join tktimeuse tt on tt.code = ENESTIMATEITEM.USEWORKTIME " +

  //  " left join TEHKART._ARTI kr on kr.id = ENPLANWORKITEM.kartarefcode " +

      " left join TKTECHCARD kr on kr.code = ENPLANWORKITEM.kartarefcode " +

    // ", ENPLANWORK " +
    //", ENPLANWORKITEM " +
    ", TKMATERIALS sm" +
  //  ", REPIMPORT.TMESURE_UNIT tu" +
    ",TKMEASUREMENT tu" +
    ", ENESTIMATEITEMTYPE " +
    ", ENESTIMATEITEMKIND " +
    ", ENESTIMATEITEMSTATUS " +
    // перенести ...
    //", enelementdata  " +
    ", enplanworktype, enplanworkstate " +

    ", ENDEPARTMENT " +
    //" WHERE "
    "";

    // whereStr = " ENPLANWORK.CODE = ENESTIMATEITEM.PLANREFCODE" ; //+

    whereStr =  " tu.code = sm.MEASUREMENTCODE ";

     //whereStr = whereStr +" AND ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE" ; //+

     whereStr = whereStr +" AND sm.CODE = ENESTIMATEITEM.MATERIALREFCODE" ; //+

     whereStr = whereStr + " ";

     whereStr = whereStr +" AND ENESTIMATEITEMTYPE.CODE = ENESTIMATEITEM.TYPEREFCODE" ; //+

     whereStr = whereStr +" AND ENESTIMATEITEMKIND.CODE = ENESTIMATEITEM.KINDREFCODE" ; //+

     whereStr = whereStr +" AND ENESTIMATEITEMSTATUS.CODE = ENESTIMATEITEM.STATUSREFCODE ";

     // чуть шо перенести в другой метод ...
     whereStr = whereStr +" and enplanworktype.code = enplanwork.typerefcode and enplanworkstate.code = enplanwork.staterefcode";
     //whereStr = whereStr +" and enplanwork.elementrefcode = enelementdata.ecode ";

     whereStr = whereStr + " and enplanwork.departmentrefcode = endepartment.code ";

     //selectStr = selectStr + " ${s} ENESTIMATEITEM.CODE IN ( SELECT ENESTIMATEITEM.CODE FROM ENESTIMATEITEM ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.CODE = ?";
       }
       if(aFilterObject.countGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.COUNTGEN = ?";
       }
       if(aFilterObject.countFact != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.COUNTFACT = ?";
       }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
            else
                whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
       }

       if(aFilterObject.deliveryTime != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.DELIVERYTIME = ?";
       }

       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.PLANREFCODE = ? ";
       }
       if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
       }
       if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.TYPEREFCODE = ? ";
       }

       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.KINDREFCODE = ? ";
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
       }

       if(aFilterObject.accountingTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.ACCOUNTINGTYPEREFCODE = ? ";
       }

       if(aFilterObject.isUseVAT != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.ISUSEVAT = ?";
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
        selectStr = selectStr + " WHERE" + whereStr;

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
           aFilterObject.countGen = aFilterObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.countGen);
       }
       if(aFilterObject.countFact != null){
           number++;
           aFilterObject.countFact = aFilterObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.countFact);
       }
        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
            else
                whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

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
        }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
            else
                whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

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
        }
       if(aFilterObject.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
       }

       if(aFilterObject.deliveryTime != Integer.MIN_VALUE){
           number++;
           statement.setInt(number,aFilterObject.deliveryTime);
       }


       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.planRef.code);
      }
      if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.planItemRef.code);
      }
      if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.materialRef.code);
      }
      if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.typeRef.code);
      }

      if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.kindRef.code);
      }

      if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.statusRef.code);
      }

      if(aFilterObject.accountingTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.accountingTypeRef.code);
      }

      if(aFilterObject.isUseVAT != Integer.MIN_VALUE){
          number++;
          statement.setInt(number,aFilterObject.isUseVAT);
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

       anObject = new ENEstimateItemShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.countGen = set.getBigDecimal(2);
       if(anObject.countGen != null)
           anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.countFact = set.getBigDecimal(3);
       if(anObject.countFact != null)
           anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.userGen = set.getString(4);
       anObject.dateEdit = set.getDate(5);


       anObject.planRefCode = set.getInt(6);

       anObject.planRefDateGen = set.getDate(7);

       anObject.planRefUserGen = set.getString(8);

       anObject.planRefDateEdit = set.getDate(9);

       anObject.planItemRefCode = set.getInt(10);
       if (set.wasNull())
        anObject.planItemRefCode = Integer.MIN_VALUE;

       anObject.planItemRefCountGen = set.getBigDecimal(11);
       if(anObject.planItemRefCountGen != null)
         anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.planItemRefUserGen = set.getString(12);

       anObject.planItemRefDateEdit = set.getDate(13);

       anObject.materialRefCode = set.getInt(14);

       anObject.materialRefName = set.getString(15);

       anObject.typeRefCode = set.getInt(16);

       anObject.typeRefName = set.getString(17);

       anObject.measureType = set.getString(18);

       anObject.kartaRefCode = set.getInt(19);
       anObject.kartaNum = set.getString(20);
       anObject.kartaRefName = set.getString(21);

       anObject.kindRefCode = set.getInt(22);
       anObject.kindRefName = set.getString(23);

       anObject.statusRefCode = set.getInt(24);
       anObject.statusRefName = set.getString(25);

       anObject.countFINMaterials = set.getInt(26);
       if ( set.wasNull() )
           anObject.countFINMaterials = Integer.MIN_VALUE;

       //",  enelementdata.invnumber,  enelementdata.ename,  enelementdata.ecode, enplanworktype.name, enplanworkstate.name "+
       anObject.invNumber = set.getString(27);
       anObject.elementName = set.getString(28);
       anObject.ecode = set.getInt(29);
       if ( set.wasNull() )
           anObject.ecode = Integer.MIN_VALUE;
       anObject.planType = set.getString(30);
       anObject.planState = set.getString(31);

       anObject.planRefYearGen = set.getInt(32);
       if ( set.wasNull() )
           anObject.planRefYearGen = Integer.MIN_VALUE;

       anObject.planRefMonthGen = set.getInt(33);
       if ( set.wasNull() )
           anObject.planRefMonthGen = Integer.MIN_VALUE;

       anObject.deliveryTime = set.getInt(34);
       if ( set.wasNull() )
           anObject.deliveryTime = Integer.MIN_VALUE;

       anObject.planRefDepartmentCode = set.getInt(35);
       if (set.wasNull())
        anObject.planRefDepartmentCode = Integer.MIN_VALUE;

       anObject.planRefDepartmentName = set.getString(36);

       anObject.planRefDateStart = set.getDate(37);
       anObject.planRefDateFinal = set.getDate(38);

       anObject.useWorkTime = set.getInt(39);
       if (set.wasNull())
        anObject.useWorkTime = Integer.MIN_VALUE;
       anObject.useWorkTimeName = set.getString(40);

       anObject.accountingTypeRefCode = set.getInt(41);
        if(set.wasNull())
        anObject.accountingTypeRefCode = Integer.MIN_VALUE;

        anObject.isUseVAT = set.getInt(42);
        if ( set.wasNull() )
            anObject.isUseVAT = Integer.MIN_VALUE;


        anObject.purchaseItem2EstimateitemCode = set.getInt("rqpurchitm2estimatecod");
        if(set.wasNull())
            anObject.purchaseItem2EstimateitemCode = Integer.MIN_VALUE;

        anObject.purchaseItemRefCode = set.getInt("RQPURCHASEITEMCODE");
		if(set.wasNull()) {
			anObject.purchaseItemRefCode = Integer.MIN_VALUE;
		}

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


  @Override
public void save(ENEstimateItem anObject) throws PersistenceException
  {
      this.save(anObject , true );
  }

  /**
   * @param ifCheckHavePlanPurchaseByEstimate - проверять или нет на принадлежность к плану закупок */
public void save(ENEstimateItem anObject , boolean ifCheckHavePlanPurchaseByEstimate ) throws PersistenceException
  {

	  PlanPurchaseLogic purLogic = new PlanPurchaseLogic(getConnection(), getUserProfile());
	  ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(getConnection(), getUserProfile());
	  ENPlanWorkDAO pDAO = new ENPlanWorkDAO(getConnection(), getUserProfile());
	  PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(getConnection(), getUserProfile());
	  RQPurchaseItem2EstimateItemDAO pi2eiDAO = new RQPurchaseItem2EstimateItemDAO(getConnection(), getUserProfile());
	  AuthLogic al = new AuthLogic(getConnection(), getUserProfile());

	  ENEstimateItem currEiObj = eiDAO.getObjectNoSegr(anObject.code);
	  ENPlanWork pObj = pDAO.getObjectNOSEGR(currEiObj.planRef.code);

	 if (ifCheckHavePlanPurchaseByEstimate
			 /*!!!!! временно дать доступ олегу на внесен планов*/
			 //&& !getUserProfile().userName.equalsIgnoreCase("dyadyovoe")
			 //&& !getUserProfile().userName.equalsIgnoreCase("marchenkoyp")
			 // && !getUserProfile().userName.equalsIgnoreCase("energynet")
			 /*&& (!al.checkPermissionSilent("ksoe/rqorder/RQPlanPurchaseController", "editEnplanwork")) planpurchase2017*/
			 ) {

		int isHavePlanPurchaseByEstimate = purLogic.checkHavePlanPurchaseByEstimate(anObject.planRef.code);

		if (pObj.kind.code == ENPlanWorkKind.CURRENT) {
		  if (currEiObj.purchaseItemRef.code != Integer.MIN_VALUE && anObject.purchaseItemRef.code == Integer.MIN_VALUE ){
				  System.out.print(" ((((((((((((((( ERROR PURCHASE reset purchaseItemRef.code by ENEstimateItem =  " + anObject.code + " user = " + getUserProfile().userName  );


			  }


				if ((currEiObj.countFact.doubleValue() != anObject.countFact.doubleValue()) || (currEiObj.statusRef.code != anObject.statusRef.code ) ) {
				// если есть план закупок на год и пытаются менять количество в плановом плане
				if( (anObject.kindRef.code == ENEstimateItemKind.MATERIALS || anObject.kindRef.code == ENEstimateItemKind.SERVICES ) &&   isHavePlanPurchaseByEstimate  > 0  && (currEiObj.countFact.doubleValue() != anObject.countFact.doubleValue())  ) {
					/*tezzzt SUPP-72313*/if (!getUserProfile().userName.equalsIgnoreCase("energynet") && !getUserProfile().userName.equalsIgnoreCase("YaroshikSV") ){
						throw new EnergyproSystemException(" \n ENEstimateItem.save  \n \n Вже складений річний план закупівель. Змінювати кількість матеріалів/послуг в ПЛАНОВИХ планах заборонено ");
					}

				}
				// если материал в плане закупок и меняют количество
				if ( anObject.purchaseItemRef.code != Integer.MIN_VALUE && (currEiObj.countFact.doubleValue() != anObject.countFact.doubleValue()) ) {

					/*tezzzt SUPP-72313*/	if (!getUserProfile().userName.equals("energynet") && !getUserProfile().userName.equalsIgnoreCase("YaroshikSV")  ){
						throw new EnergyproSystemException(" \n ENEstimateItem.save  \n \n Матеріал вже в плані закупівель !! Змінювати кількість матеріалів/послуг заборонено ");
					}
				}


				// если меняют статус на мес плане на ЗАПЛАНИРОВАННЫЙ то тоже проверим на наличие годового плана закупок
				if( (anObject.kindRef.code == ENEstimateItemKind.MATERIALS || anObject.kindRef.code == ENEstimateItemKind.SERVICES ) && isHavePlanPurchaseByEstimate > 0 && anObject.statusRef.code == ENEstimateItemStatus.PLANNED ) {

					/*tezzzt SUPP-72313*/	if (!getUserProfile().userName.equals("energynet") && !getUserProfile().userName.equalsIgnoreCase("YaroshikSV")  ){
						throw new EnergyproSystemException(" \n ENEstimateItem.save  \n \n Вже складений річний план закупівель. Змінювати статус на \" Запланований \" в ПЛАНОВИХ планах заборонено !!! ");
					}
				}


			  }
	   }
	 }

	// освобождение на строке закупки если меняют статус материала с запланированного на непотрибно замовляти .. С замовленого на непотрибно замовляти обработчик должен быть со стороны заявки
		if ( pObj.kind.code == ENPlanWorkKind.CURRENT &&
				anObject.purchaseItemRef.code != Integer.MIN_VALUE && currEiObj.statusRef.code == ENEstimateItemStatus.PLANNED &&  anObject.statusRef.code == ENEstimateItemStatus.UNUSED  ) {
			purchaseLogic.freeEstimateWhenOrderItemSetStatusCanceled( anObject.code) ;
		}

	 // если план месячный и естимейт относится к плану закупок то на связке естимейта с планом закупок поменяем количество плановое НО кол-во для публикац не трогать -
     // редактировать должны планы для выполнения работ .
	 if ( pObj.kind.code == ENPlanWorkKind.CURRENT
			 && currEiObj.purchaseItemRef.code != Integer.MIN_VALUE
 			 ) {
		 RQPurchaseItem2EstimateItemFilter pi2eiFil = new RQPurchaseItem2EstimateItemFilter();
		 pi2eiFil.purchaseItemRef.code = currEiObj.purchaseItemRef.code;
		 pi2eiFil.estimateItemRef.code = currEiObj.code;
		 int[] pIt2eiArr = pi2eiDAO.getFilteredCodeArray(pi2eiFil, 0, -1);
		 if(pIt2eiArr.length > 0 )
		  {
			 RQPurchaseItem2EstimateItem pIt2eiObj = pi2eiDAO.getObject(pIt2eiArr[0]);
			 // пересохраним только если меняется кол-во
			 if(pIt2eiObj.countGen.doubleValue() != anObject.countFact.doubleValue() ) {
				 pIt2eiObj.countGen = anObject.countFact;
				 if(pIt2eiObj.statusComment == null ) {
					 pIt2eiObj.statusComment = "|||| save estimateitem " + " plancode=" +pObj.code ;
				 } else
				 {
					 pIt2eiObj.statusComment = pIt2eiObj.statusComment.concat(" |||| save estimateitem " + " plancode=" +pObj.code );
				 }

				 pi2eiDAO.save(pIt2eiObj);
			 }

		  }

	 }

	// обнулить привязку к плану закупок если в связке нетт
	 RQPurchaseItem2EstimateItemFilter pi2eiFilter = new RQPurchaseItem2EstimateItemFilter();
	 pi2eiFilter.estimateItemRef.code = anObject.code;
	 int[] pi2eiArr = pi2eiDAO.getFilteredCodeArray(pi2eiFilter, 0, -1);
	 if(pi2eiArr.length == 0) {
		 anObject.purchaseItemRef.code = Integer.MIN_VALUE;
	 }

    if (anObject.kindRef == null){
        anObject.kindRef.code = ENEstimateItemKind.MATERIALS;
    }
    if (anObject.kindRef.code == Integer.MIN_VALUE){
        anObject.kindRef.code = ENEstimateItemKind.MATERIALS;
    }

    MaterialsLogic tkMatLogic = new MaterialsLogic(getConnection(), getUserProfile());
    if (anObject.accountingTypeRef == null){
        anObject.accountingTypeRef.code = tkMatLogic.getAccountTypeCodeByTKMaterialsCode(anObject.materialRef.code);
    }
    if (anObject.accountingTypeRef.code == Integer.MIN_VALUE){
        anObject.accountingTypeRef.code = tkMatLogic.getAccountTypeCodeByTKMaterialsCode(anObject.materialRef.code);
    }

    anObject.dateEdit = new Date();
    anObject.userGen = getUserProfile().userName;
       save(anObject,null);
  }

  //  @Override
	@Override
	public int add(ENEstimateItem anObject) throws PersistenceException {

		return this.add(anObject , true );

	}

   /**
    * @param ifCheckHavePlanPurchaseByEstimate - проверять или нет на принадлежность к плану закупок */
   // @Override
	@Override
	public int add(ENEstimateItem anObject , boolean ifCheckHavePlanPurchaseByEstimate ) throws PersistenceException {

		// checkHavePlanPurchaseByEstimate - где не нужно проверять на принадлежность к плану закупок то = false
		if (ifCheckHavePlanPurchaseByEstimate && (anObject.statusRef.code != ENEstimateItemStatus.UNUSED
				                                  && anObject.statusRef.code != ENEstimateItemStatus.BY_TRUCKING
				                                		 && anObject.statusRef.code != ENEstimateItemStatus.PRESENT // 31.10.2016 - добвляется например материал(счетчик) со статусом "у наявності" - как бі тоже можно пропускать такое и не проверять - в закупку он не попадает же
				                                		 )
			/*!!!!! временно дать доступ олегу на внесен планов*/ // && !getUserProfile().userName.equalsIgnoreCase("dyadyovoe")
			/*!!!!! energynet && !getUserProfile().userName.equalsIgnoreCase("energynet")*/
				) {
	        PlanPurchaseLogic purLogic = new PlanPurchaseLogic(getConnection(), getUserProfile());
			if( purLogic.checkHavePlanPurchaseByEstimate(anObject.planRef.code)  > 0
					//&& !getUserProfile().userName.equalsIgnoreCase("marchenkoyp")
					) {
			/*	for (StackTraceElement ste : Thread.currentThread().getStackTrace()) {
					   System.out.println(ste);
					}*/
				//System.out.print(anObject.toString());
				ENSettingsLogic settingsLogic = new ENSettingsLogic(getConnection(), getUserProfile());
				Vector<String> usersAllowed = settingsLogic.getVectorWithValues(ENSettingsKeysConsts
						.USERS_ALLOWED_TO_ADD_ESTIMATES_DESPITE_PURCHASES_PLAN);
				if(!CollectionTools.checkCollectionContainsStringIgnoreCase(usersAllowed, getUserProfile().userName)) {
					throw new EnergyproSystemException(" \n ENEstimateItem.add  \n \n Вже складений річний план закупівель. Додавання матеріалів/послуг в ПЛАНОВІ плани заборонено ");
				}



			}
		}

		if (anObject.kindRef == null) {
			anObject.kindRef.code = ENEstimateItemKind.MATERIALS;
		}

		if (anObject.kindRef.code == Integer.MIN_VALUE) {
			anObject.kindRef.code = ENEstimateItemKind.MATERIALS;
		}

		MaterialsLogic tkMatLogic = new MaterialsLogic(getConnection(),
				getUserProfile());
		if (anObject.accountingTypeRef == null) {
			anObject.accountingTypeRef.code = tkMatLogic
					.getAccountTypeCodeByTKMaterialsCode(anObject.materialRef.code);
		}

		if (anObject.accountingTypeRef.code == Integer.MIN_VALUE) {
			anObject.accountingTypeRef.code = tkMatLogic
					.getAccountTypeCodeByTKMaterialsCode(anObject.materialRef.code);
		}

		anObject.dateEdit = new Date();
		anObject.userGen = getUserProfile().userName;

		if (anObject.isUseVAT == Integer.MIN_VALUE) {
			anObject.isUseVAT = ENConsts.ENESTIMATEITEM_USEVAT;
		}

		/** 07.09.2016 +++ при добавлении не может быть ссылки на план закупок */
		anObject.purchaseItemRef.code = Integer.MIN_VALUE;


		return super.add(anObject , true );
	}


  @Override
  public void remove(int uid) throws PersistenceException
  {
    ENEstimateItem object = getObject(uid);

        FINMaterialsDAO fDAO = new FINMaterialsDAO(getConnection(), getUserProfile());
        FINMaterialsFilter fFilter = new FINMaterialsFilter();
        fFilter.estimateItemRef.code = object.code;
        fFilter.statusRef.code = FINMaterialsStatus.GOOD;
        FINMaterialsShortList fList = fDAO.getScrollableFilteredList(fFilter,0,-1);

        if ( fList.totalCount > 0 ){
            throw new EnergyproSystemException("Есть зарезервированные материалы .. удалите привязку материалов !!! \n код строки материала в плане : " + uid);
        }

        fFilter = new FINMaterialsFilter();
        fFilter.estimateItemRef.code = object.code;
      fList = fDAO.getScrollableFilteredList(fFilter,0,-1);

    for (int i=0; i < fList.totalCount; i++){
        fDAO.remove(fList.get(i).code);
    }

    super.remove(uid);



  }

  public ENEstimateItemShortList getForBillInvoiceList_test(String molCode, ENEstimateItemFilter eiFilter, boolean isBill, int billType) throws PersistenceException {
      ENEstimateItemShortList result = new ENEstimateItemShortList();
      ENEstimateItemShort anObject;
      result.list = new Vector<>();

      String selectStr;
      Connection connection = getConnection();
      PreparedStatement statement = null;
      ResultSet set = null;
      String whereStr = "";
      String orderBy = eiFilter.orderBySQL == null ? "" : eiFilter.orderBySQL;
      String condition = eiFilter.conditionSQL == null ? "" : eiFilter.conditionSQL;

      if (orderBy.length() == 0)
          orderBy = "sm.name";

      int quantity = Integer.MAX_VALUE / 2;
      int fromPosition = 0;
      if (getUserProfile() == null) {
          throw new PersistenceException("Internal Error (User Profile Is Undefined)");
      }

      if (isBill) {
          selectStr = " select enestimateitem.code, " +
          (billType == RQBillType.SERVICES ? " enestimateitem.countfact, "
                  : " case when coalesce(sum(rqbillitem2enestimattm.countgen),0) > 0 " +
                  " or " +
                  " coalesce( (select sum(rem.countgen) from rqfkorderitemremainder rem where rem.estimateitemrefcode = enestimateitem.code  ),0) > 0 " +
                  "  then (enestimateitem.countfact-coalesce(sum(rqbillitem2enestimattm.countgen),0)  " +
                  " - /*минус излишки*/ " +
                  " coalesce( (select sum(rem.countgen) from rqfkorderitemremainder rem where rem.estimateitemrefcode = enestimateitem.code  ),0)) " +
                  "   else enestimateitem.countfact end, ") +
          " sm.name, " +
          " tu.name, " +
          " rr.numberdoc, " +
          " rr.orderperiod, " +
          " budg.shortname, " +
          " rqorderitem.code as oi, "+

          " enestimateitem.countfact-coalesce(sum(rqbillitem2enestimattm.countgen),0) as ost, " +

          " (select el.ename from enelementdata el where el.ecode = enplanwork.elementrefcode) as elname, " +

          " (select d.name from endepartment d where d.code = enplanwork.departmentrefcode) as department, " +

          ///// 23.09.13
          " (select el.invnumber from enelementdata el where el.ecode = enplanwork.elementrefcode) as invnumber " +
          /////

          " from rqorderitem2enestimttm, " +
          " enplanwork left join endepartment budg on budg.code = enplanwork.budgetrefcode, " +
          " tkmaterials sm,tkmeasurement tu, rqorderitem " +
          " left join (select rqorder.code, rqorder.numberdoc, rqorder.orderperiod from rqorder) rr on rr.code = rqorderitem.orderrefcode, "+

          " enestimateitem " +
          " left join rqbillitem2enestimattm on rqbillitem2enestimattm.estimateitemcode = enestimateitem.code " +
          "";
      } else {

          selectStr = " select enestimateitem.code, " +
          (billType == RQBillType.SERVICES ? " enestimateitem.countfact, "
                  : " case when coalesce(sum(RQFKORDERITEM2ENSTMTTM.countgen),0) > 0 " +
                  " or " +
                  " coalesce( (select sum(rem.countgen) from rqfkorderitemremainder rem where rem.estimateitemrefcode = enestimateitem.code  ),0) > 0 " +
                  "  then (enestimateitem.countfact-coalesce(sum(case when rqfkorder.kindcode = 1 then RQFKORDERITEM2ENSTMTTM.countgen else 0 end),0) " +
                  " - /*минус излишки*/  " +
                  " coalesce( (select sum(rem.countgen) from rqfkorderitemremainder rem where rem.estimateitemrefcode = enestimateitem.code  ),0) ) " +
                  "   else enestimateitem.countfact end, ") +
          " sm.name, " +
          " tu.name, " +
          " rr.numberdoc, " +
          " rr.orderperiod, " +
          " budg.shortname, " +
          " rqorderitem.code as oi, "+

          " enestimateitem.countfact-coalesce(sum(RQFKORDERITEM2ENSTMTTM.countgen),0) as ost, " +

          " (select el.ename from enelementdata el where el.ecode = enplanwork.elementrefcode) as elname, " +

          " (select d.name from endepartment d where d.code = enplanwork.departmentrefcode) as department, " +

          ///// 23.09.13
          " (select el.invnumber from enelementdata el where el.ecode = enplanwork.elementrefcode) as invnumber " +
          /////

          " from rqorderitem2enestimttm, " +
          " enplanwork left join endepartment budg on budg.code = enplanwork.budgetrefcode, " +
          " tkmaterials sm,tkmeasurement tu, rqorderitem " +
          " left join (select rqorder.code, rqorder.numberdoc, rqorder.orderperiod from rqorder) rr on rr.code = rqorderitem.orderrefcode, "+
          " enestimateitem " +
          " left join RQFKORDERITEM2ENSTMTTM on RQFKORDERITEM2ENSTMTTM.estimateitemcode = enestimateitem.code " +
          " left join rqfkorderitem on rqfkorderitem.code = RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE " +
          " left join rqfkorder on rqfkorderitem.fkorderrefcode = rqfkorder.code " +
          " and coalesce(RQFKORDERITEM2ENSTMTTM.finmaterialsrefcode, -1) = -1 " +
          " left join rqbillitem2enestimattm on rqbillitem2enestimattm.estimateitemcode = enestimateitem.code " +
          "";
      }

  whereStr = " enplanwork.code = enestimateitem.planrefcode ";
  whereStr = whereStr + " and tu.code = sm.measurementcode ";
  whereStr = whereStr + " and sm.code = enestimateitem.materialrefcode ";
  whereStr = whereStr + " and rqorderitem2enestimttm.estimateitemcode = enestimateitem.code ";
  whereStr = whereStr + " and rqorderitem2enestimttm.orderitemcode = rqorderitem.code ";

  whereStr = BaseDAOUtils.addToCondition(buildCondition(eiFilter), whereStr);
  whereStr = BaseDAOUtils.addToCondition(condition, whereStr);

//+ " WHERE" +  сделано выше ????
  if(whereStr.length() != 0) {
      selectStr = selectStr + " WHERE" + whereStr;
  }

 if (!isBill) {
      selectStr = selectStr + " group by enestimateitem.code, enestimateitem.countfact, sm.name, " +
      " tu.name, rr.numberdoc, rr.orderperiod, budg.shortname, department, rqorderitem.code, enplanwork.elementrefcode " +

      (billType == RQBillType.SERVICES ? " "
              : " having (enestimateitem.countfact-coalesce(sum(rqfkorderitem2enstmttm.countgen),0)) > 0 ") +

      " ORDER BY " + orderBy;

 } else {
      selectStr = selectStr + " group by enestimateitem.code, enestimateitem.countfact, sm.name, " +
      " tu.name, rr.numberdoc, rr.orderperiod, budg.shortname, department, rqorderitem.code, enplanwork.elementrefcode " +
      " ORDER BY " + orderBy;
 }

 try
  {
   statement = connection.prepareStatement(selectStr);
   setParameters(eiFilter, statement);

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

     anObject = new ENEstimateItemShort();

     /*
     enestimateitem.code,      1
     enestimateitem.countfact, 2
     sm.name,                  3
     tu.name,                  4
     rr.numberdoc,             5
     rr.orderperiod,           6
     budg.shortname            7
     orderItemCode             8
     остаток                   9
     объект планирования      10
     подразделение            11
     инв. №                   12
     */

     anObject.code = set.getInt(1);
     if ( set.wasNull() )
         anObject.code = Integer.MIN_VALUE;

     anObject.countFact = set.getBigDecimal(2);
     if(anObject.countFact != null)
         anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

     anObject.materialRefName = set.getString(3);
     anObject.measureType = set.getString(4);
     anObject.invNumber = set.getString(5);
     anObject.dateEdit = set.getDate(6);
     anObject.elementName = set.getString(7);
     anObject.planRefCode = set.getInt(8);

     anObject.countGen = set.getBigDecimal(9);
     if(anObject.countGen != null)
         anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

     anObject.typeRefName = set.getString(10);

     anObject.planRefDepartmentName = set.getString(11);

     anObject.contractNumber = set.getString(12);

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


  public ENEstimateItemShortList getForBillInvoiceList(ENEstimateItemFilter eiFilter, boolean isBill, int billType) throws PersistenceException
  {
        ENEstimateItemShortList result = new ENEstimateItemShortList();
        ENEstimateItemShort anObject;
        result.list = new Vector<>();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";
        String orderBy = eiFilter.orderBySQL == null ? "" : eiFilter.orderBySQL;
        String condition = eiFilter.conditionSQL == null ? "" : eiFilter.conditionSQL;

        if (orderBy.length() == 0)
            orderBy = "sm.name";

        int quantity = Integer.MAX_VALUE / 2;
        int fromPosition = 0;
        if (getUserProfile() == null)
            throw new PersistenceException("Internal Error (User Profile Is Undefined)");

/*   selectStr = " select enestimateitem.code, " +
        " enestimateitem.countfact, " +
        " sm.name, " +
        " tu.name, " +
        " rr.numberdoc, " +
        " rr.orderperiod, " +
        " budg.shortname" +
        " from rqorderitem2enestimttm, " +
        " enplanwork left join endepartment budg on budg.code = enplanwork.budgetrefcode, " +
        " tkmaterials sm,tkmeasurement tu, rqorderitem " +
        " left join (select rqorder.code, rqorder.numberdoc, rqorder.orderperiod from rqorder) rr on rr.code = rqorderitem.orderrefcode, "+
        " enestimateitem " +
        " left join rqbillitem2enestimattm " +
        " on rqbillitem2enestimattm.estimateitemcode = enestimateitem.code " +
        "";
*/

        if (isBill) {
            selectStr = " select enestimateitem.code, " +
            //" enestimateitem.countfact, " +
            //  { коментарим вывод кол-ва факт т.к не учитываются то что  было отдано в излишки с естимейта ранее 01.11.2012
            /*(billType == RQBillType.SERVICES ? " enestimateitem.countfact, "
                    : " case when coalesce(sum(rqbillitem2enestimattm.countgen),0) > 0 " +
                    "  then (enestimateitem.countfact-coalesce(sum(rqbillitem2enestimattm.countgen),0)) " +
                    "   else enestimateitem.countfact end, ") +
            */
            // } конец комента

            (billType == RQBillType.SERVICES ? " enestimateitem.countfact, "
                    : " case when coalesce(sum(rqbillitem2enestimattm.countgen),0) > 0 " +
                    " or " +
                    " coalesce( (select sum(rem.countgen) from rqfkorderitemremainder rem where rem.estimateitemrefcode = enestimateitem.code  ),0) > 0 " +
                    "  then (enestimateitem.countfact-coalesce(sum(rqbillitem2enestimattm.countgen),0)  " +
                    " - /*минус излишки*/ " +
                    " coalesce( (select sum(rem.countgen) from rqfkorderitemremainder rem where rem.estimateitemrefcode = enestimateitem.code  ),0)) " +
                    "   else enestimateitem.countfact end, ") +
           //     " 1111 as  countfact ,  " +

            " sm.name, " +
            " tu.name, " +
            " rr.numberdoc, " +
            " rr.orderperiod, " +
            " budg.shortname, " +
            " rqorderitem.code as oi, "+

            " enestimateitem.countfact-coalesce(sum(rqbillitem2enestimattm.countgen),0) as ost, " +

            " (select el.ename from enelementdata el where el.ecode = enplanwork.elementrefcode) as elname, " +

            " (select d.name from endepartment d where d.code = enplanwork.departmentrefcode) as department, " +

            ///// 23.09.13
            " (select el.invnumber from enelementdata el where el.ecode = enplanwork.elementrefcode) as invnumber " +
            /////

            " from rqorderitem2enestimttm, " +
            " enplanwork left join endepartment budg on budg.code = enplanwork.budgetrefcode, " +
            " tkmaterials sm,tkmeasurement tu, rqorderitem " +
            " left join (select rqorder.code, rqorder.numberdoc, rqorder.orderperiod from rqorder) rr on rr.code = rqorderitem.orderrefcode, "+

            " enestimateitem " +
            " left join rqbillitem2enestimattm on rqbillitem2enestimattm.estimateitemcode = enestimateitem.code " +
            "";
        }
        else {

            selectStr = " select enestimateitem.code, " +
            //" enestimateitem.countfact, " +
            // { коментарим вывод кол-ва факт т.к не учитываются то что  было отдано в излишки с естимейта ранее  01.11.2012
            /*(billType == RQBillType.SERVICES ? " enestimateitem.countfact, "
                    : " case when coalesce(sum(RQFKORDERITEM2ENSTMTTM.countgen),0) > 0 " +
                    "  then (enestimateitem.countfact-coalesce(sum(RQFKORDERITEM2ENSTMTTM.countgen),0)) " +
                    "   else enestimateitem.countfact end, ") +
            */
            // } конец комента

            (billType == RQBillType.SERVICES ? " enestimateitem.countfact, "
                    : " case when coalesce(sum(RQFKORDERITEM2ENSTMTTM.countgen),0) > 0 " +
                    " or " +
                    " coalesce( (select sum(rem.countgen) from rqfkorderitemremainder rem where rem.estimateitemrefcode = enestimateitem.code  ),0) > 0 " +
                    "  then (enestimateitem.countfact-coalesce(sum(case when rqfkorder.kindcode = 1 then RQFKORDERITEM2ENSTMTTM.countgen else 0 end),0) " +
                    " - /*минус излишки*/  " +
                    " coalesce( (select sum(rem.countgen) from rqfkorderitemremainder rem where rem.estimateitemrefcode = enestimateitem.code  ),0) ) " +
                    "   else enestimateitem.countfact end, ") +
            " sm.name, " +
            " tu.name, " +
            " rr.numberdoc, " +
            " rr.orderperiod, " +
            " budg.shortname, " +
            " rqorderitem.code as oi, "+

            " enestimateitem.countfact-coalesce(sum(RQFKORDERITEM2ENSTMTTM.countgen),0) as ost, " +

            " (select el.ename from enelementdata el where el.ecode = enplanwork.elementrefcode) as elname, " +

            " (select d.name from endepartment d where d.code = enplanwork.departmentrefcode) as department, " +

            ///// 23.09.13
            " (select el.invnumber from enelementdata el where el.ecode = enplanwork.elementrefcode) as invnumber " +
            /////

            " from rqorderitem2enestimttm, " +
            " enplanwork left join endepartment budg on budg.code = enplanwork.budgetrefcode, " +
            " tkmaterials sm,tkmeasurement tu, rqorderitem " +
            " left join (select rqorder.code, rqorder.numberdoc, rqorder.orderperiod from rqorder) rr on rr.code = rqorderitem.orderrefcode, "+
            " enestimateitem left join RQFKORDERITEM2ENSTMTTM on 	(RQFKORDERITEM2ENSTMTTM.estimateitemcode = enestimateitem.code "+
	                                                 "    and  RQFKORDERITEM2ENSTMTTM.fkorderitemrefcode in  "+
	                                                 "     ( select fi.code from rqfkorderitem fi , rqfkorder ff "+
	                                                 "        where fi.fkorderrefcode = ff.code  "+
	                                                 "          and ff.kindcode in ("+RQFKOrderKind.PRIHOD_POSTAVKA +"," +RQFKOrderKind.PRIHOD_BUFET + " )  "+
	                                                 "     )  "+
	                                                 "    )"+
            " left join rqfkorderitem on rqfkorderitem.code = RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE " +
            " left join rqfkorder on rqfkorderitem.fkorderrefcode = rqfkorder.code " +
            " and coalesce(RQFKORDERITEM2ENSTMTTM.finmaterialsrefcode, -1) = -1 " +
            " left join rqbillitem2enestimattm on rqbillitem2enestimattm.estimateitemcode = enestimateitem.code " +
            "";
/*
            selectStr = " select enestimateitem.code, " +
            //" enestimateitem.countfact, " +
            " case when coalesce(sum(rqinvoiceitem2enstmttm.countgen),0) > 0 " +
            "  then (enestimateitem.countfact-coalesce(sum(rqinvoiceitem2enstmttm.countgen),0)) " +
            "   else enestimateitem.countfact end, " +
            " sm.name, " +
            " tu.name, " +
            " rr.numberdoc, " +
            " rr.orderperiod, " +
            " budg.shortname, " +

            " enestimateitem.countfact-coalesce(sum(rqinvoiceitem2enstmttm.countgen),0) as ost " +

            " from rqorderitem2enestimttm, " +
            " enplanwork left join endepartment budg on budg.code = enplanwork.budgetrefcode, " +
            " tkmaterials sm,tkmeasurement tu, rqorderitem " +
            " left join (select rqorder.code, rqorder.numberdoc, rqorder.orderperiod from rqorder) rr on rr.code = rqorderitem.orderrefcode, "+

            " enestimateitem " +
            " left join rqinvoiceitem2enstmttm on rqinvoiceitem2enstmttm.estimateitemcode = enestimateitem.code " +
            "";
*/
        }

    whereStr = " enplanwork.code = enestimateitem.planrefcode ";
    whereStr = whereStr + " and tu.code = sm.measurementcode ";
    whereStr = whereStr + " and sm.code = enestimateitem.materialrefcode ";
    whereStr = whereStr + " and rqorderitem2enestimttm.estimateitemcode = enestimateitem.code ";
    whereStr = whereStr + " and rqorderitem2enestimttm.orderitemcode = rqorderitem.code ";

    // суммирует и расходы !!!
    //whereStr = whereStr + " and RQFKORDERITEM2ENSTMTTM.finmaterialsrefcode is null ";

    if(eiFilter != null)
     {
       if(eiFilter.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.CODE = ?";
       }
       if(eiFilter.countGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.COUNTGEN = ?";
       }
       if(eiFilter.countFact != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.COUNTFACT = ?";
       }
        if (eiFilter.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (eiFilter.userGen.indexOf('*',0) < 0 && eiFilter.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
            else
                whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
        }
       if(eiFilter.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
       }
       if(eiFilter.planRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.PLANREFCODE = ? ";
       }
       if(eiFilter.planItemRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
       }
       if(eiFilter.materialRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
       }
       if(eiFilter.typeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.TYPEREFCODE = ? ";
       }

       if(eiFilter.kindRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.KINDREFCODE = ? ";
       }
       if(eiFilter.statusRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
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
        selectStr = selectStr + " WHERE" + whereStr;

   // selectStr = selectStr + ") ";

   if (!isBill) {
        selectStr = selectStr + " group by enestimateitem.code, enestimateitem.countfact, sm.name, " +
        " tu.name, rr.numberdoc, rr.orderperiod, budg.shortname, department, rqorderitem.code, enplanwork.elementrefcode " +

        (billType == RQBillType.SERVICES ? " "
                : " having (enestimateitem.countfact-coalesce(sum(rqfkorderitem2enstmttm.countgen),0)) > 0 ") +

        " ORDER BY " + orderBy;

   } else {
        selectStr = selectStr + " group by enestimateitem.code, enestimateitem.countfact, sm.name, " +
        " tu.name, rr.numberdoc, rr.orderperiod, budg.shortname, department, rqorderitem.code, enplanwork.elementrefcode " +
        " ORDER BY " + orderBy;
   }

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(eiFilter != null){
        if(eiFilter.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,eiFilter.code);
        }
       if(eiFilter.countGen != null){
           number++;
           eiFilter.countGen = eiFilter.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,eiFilter.countGen);
       }
       if(eiFilter.countFact != null){
           number++;
           eiFilter.countFact = eiFilter.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,eiFilter.countFact);
       }
        if (eiFilter.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND";
            if (eiFilter.commentGen.indexOf('*',0) < 0 && eiFilter.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
            else
                whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

          if(eiFilter.commentGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(eiFilter.commentGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        }
        if (eiFilter.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND";
            if (eiFilter.userGen.indexOf('*',0) < 0 && eiFilter.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
            else
                whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

          if(eiFilter.userGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(eiFilter.userGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        }
       if(eiFilter.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(eiFilter.dateEdit.getTime()));
       }

       if(eiFilter.modify_time != Long.MIN_VALUE){
           number++;
           if(eiFilter.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(eiFilter.modify_time));
       }
      if(eiFilter.planRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,eiFilter.planRef.code);
      }
      if(eiFilter.planItemRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,eiFilter.planItemRef.code);
      }
      if(eiFilter.materialRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,eiFilter.materialRef.code);
      }
      if(eiFilter.typeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,eiFilter.typeRef.code);
      }

      if(eiFilter.kindRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,eiFilter.kindRef.code);
      }

      if(eiFilter.statusRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,eiFilter.statusRef.code);
      }
     }

     //if(condition.length() > 0 && aBindObjects != null)
      //_bindObjectsToPreparedStatement(statement,aBindObjects,number);

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

       anObject = new ENEstimateItemShort();

       /*
       enestimateitem.code,      1
       enestimateitem.countfact, 2
       sm.name,                  3
       tu.name,                  4
       rr.numberdoc,             5
       rr.orderperiod,           6
       budg.shortname            7
       orderItemCode             8
       остаток                   9
       объект планирования      10
       подразделение            11
       инв. №                   12
       */

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;

       anObject.countFact = set.getBigDecimal(2);
       if(anObject.countFact != null)
           anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.materialRefName = set.getString(3);
       anObject.measureType = set.getString(4);
       anObject.invNumber = set.getString(5);
       anObject.dateEdit = set.getDate(6);
       anObject.elementName = set.getString(7);
       anObject.planRefCode = set.getInt(8);

       anObject.countGen = set.getBigDecimal(9);
       if(anObject.countGen != null)
           anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.typeRefName = set.getString(10);

       anObject.planRefDepartmentName = set.getString(11);

       anObject.contractNumber = set.getString(12);

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


  public ENEstimateItemShortList getForBillInvoiceListForGenerateItem(ENEstimateItemFilter eiFilter, boolean isBill, int billType) throws PersistenceException
  {
        ENEstimateItemShortList result = new ENEstimateItemShortList();
        ENEstimateItemShort anObject;
        result.list = new Vector<>();

        String selectStr = "";
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";
        String orderBy = eiFilter.orderBySQL == null ? "" : eiFilter.orderBySQL;
        String condition = eiFilter.conditionSQL == null ? "" : eiFilter.conditionSQL;

        if (orderBy.length() == 0)
            orderBy = "mat_name";

        int quantity = Integer.MAX_VALUE / 2;
        int fromPosition = 0;
        if (getUserProfile() == null)
            throw new PersistenceException("Internal Error (User Profile Is Undefined)");

/*   selectStr = " select enestimateitem.code, " +
        " enestimateitem.countfact, " +
        " sm.name, " +
        " tu.name, " +
        " rr.numberdoc, " +
        " rr.orderperiod, " +
        " budg.shortname" +
        " from rqorderitem2enestimttm, " +
        " enplanwork left join endepartment budg on budg.code = enplanwork.budgetrefcode, " +
        " tkmaterials sm,tkmeasurement tu, rqorderitem " +
        " left join (select rqorder.code, rqorder.numberdoc, rqorder.orderperiod from rqorder) rr on rr.code = rqorderitem.orderrefcode, "+
        " enestimateitem " +
        " left join rqbillitem2enestimattm " +
        " on rqbillitem2enestimattm.estimateitemcode = enestimateitem.code " +
        "";
*/

        if (isBill) {
            selectStr = " select enestimateitem.code, " +
            //" enestimateitem.countfact, " +
            //  { коментарим вывод кол-ва факт т.к не учитываются то что  было отдано в излишки с естимейта ранее 01.11.2012
            /*(billType == RQBillType.SERVICES ? " enestimateitem.countfact, "
                    : " case when coalesce(sum(rqbillitem2enestimattm.countgen),0) > 0 " +
                    "  then (enestimateitem.countfact-coalesce(sum(rqbillitem2enestimattm.countgen),0)) " +
                    "   else enestimateitem.countfact end, ") +
            */
            // } конец комента

// SUPP-13857 -- количество берем со связки строки заявки и естимейта
//                    " case when coalesce(sum(rqbillitem2enestimattm.countgen),0) > 0 " +
//                    " or " +
//                    " coalesce( (select sum(rem.countgen) from rqfkorderitemremainder rem where rem.estimateitemrefcode = enestimateitem.code  ),0) > 0 " +
//                    "  then (enestimateitem.countfact-coalesce(sum(rqbillitem2enestimattm.countgen),0)  " +
//                    " - /*минус излишки*/ " +
//                    " coalesce( (select sum(rem.countgen) from rqfkorderitemremainder rem where rem.estimateitemrefcode = enestimateitem.code  ),0)) " +
//                    "   else enestimateitem.countfact end, " +
        " rqorderitem2enestimttm.countgen - coalesce(sum( " +
        " rqbillitem2enestimattm.countgen), 0) as countfact_mod , " +

" (select name from tkmaterials where code = enestimateitem.materialrefcode) as mat_name, " +
" (select name from tkmeasurement where code = (select tkmaterials.measurementcode from tkmaterials " +
" where  code = enestimateitem.materialrefcode ) ) as mu_name, " +
            " rr.numberdoc, " +
            " rr.orderperiod, " +
            " budg.shortname, " +
            " rqorderitem.code as oi, " +

            " enestimateitem.countfact-coalesce(sum(rqbillitem2enestimattm.countgen),0) as ost, " +

            " (select el.ename from enelementdata el where el.ecode = enplanwork.elementrefcode) as elname, " +

            " (select d.name from endepartment d where d.code = enplanwork.departmentrefcode) as department, " +

            ///// 23.09.13
            " (select el.invnumber from enelementdata el where el.ecode = enplanwork.elementrefcode) as invnumber " +
            /////

            " from rqorderitem2enestimttm, " +
            " enplanwork left join endepartment budg on budg.code = enplanwork.budgetrefcode, " +
            " rqorderitem " +
            " left join (select rqorder.code, rqorder.numberdoc, rqorder.orderperiod from rqorder) rr on rr.code = rqorderitem.orderrefcode, "+

            " enestimateitem " +
            " left join rqbillitem2enestimattm on rqbillitem2enestimattm.estimateitemcode = enestimateitem.code " +
            "";
        }


    whereStr = " enplanwork.code = enestimateitem.planrefcode ";
    whereStr = whereStr + " and rqorderitem2enestimttm.estimateitemcode = enestimateitem.code ";
    whereStr = whereStr + " and rqorderitem2enestimttm.orderitemcode = rqorderitem.code ";


    // суммирует и расходы !!!
    //whereStr = whereStr + " and RQFKORDERITEM2ENSTMTTM.finmaterialsrefcode is null ";

    if(eiFilter != null)
     {
       if(eiFilter.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.CODE = ?";
       }
       if(eiFilter.countGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.COUNTGEN = ?";
       }
       if(eiFilter.countFact != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.COUNTFACT = ?";
       }
        if (eiFilter.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (eiFilter.userGen.indexOf('*',0) < 0 && eiFilter.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
            else
                whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
        }
       if(eiFilter.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
       }
       if(eiFilter.planRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.PLANREFCODE = ? ";
       }
       if(eiFilter.planItemRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
       }
       if(eiFilter.materialRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
       }
       if(eiFilter.typeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.TYPEREFCODE = ? ";
       }

       if(eiFilter.kindRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.KINDREFCODE = ? ";
       }
       if(eiFilter.statusRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
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
        selectStr = selectStr + " WHERE" + whereStr;


        selectStr = selectStr + " group by enestimateitem.code, /*enestimateitem.countfact,*/  mat_name, " +
        " mu_name,  rr.numberdoc, rr.orderperiod, budg.shortname, department, rqorderitem.code, enplanwork.elementrefcode , rqorderitem2enestimttm.countgen " +
        " ORDER BY " + orderBy;


   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(eiFilter != null){
        if(eiFilter.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,eiFilter.code);
        }
       if(eiFilter.countGen != null){
           number++;
           eiFilter.countGen = eiFilter.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,eiFilter.countGen);
       }
       if(eiFilter.countFact != null){
           number++;
           eiFilter.countFact = eiFilter.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,eiFilter.countFact);
       }
        if (eiFilter.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND";
            if (eiFilter.commentGen.indexOf('*',0) < 0 && eiFilter.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
            else
                whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

          if(eiFilter.commentGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(eiFilter.commentGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        }
        if (eiFilter.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND";
            if (eiFilter.userGen.indexOf('*',0) < 0 && eiFilter.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
            else
                whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

          if(eiFilter.userGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(eiFilter.userGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        }
       if(eiFilter.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(eiFilter.dateEdit.getTime()));
       }


       if(eiFilter.modify_time != Long.MIN_VALUE){
           number++;
           if(eiFilter.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(eiFilter.modify_time));
       }
      if(eiFilter.planRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,eiFilter.planRef.code);
      }
      if(eiFilter.planItemRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,eiFilter.planItemRef.code);
      }
      if(eiFilter.materialRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,eiFilter.materialRef.code);
      }
      if(eiFilter.typeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,eiFilter.typeRef.code);
      }

      if(eiFilter.kindRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,eiFilter.kindRef.code);
      }

      if(eiFilter.statusRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,eiFilter.statusRef.code);
      }
     }

     //if(condition.length() > 0 && aBindObjects != null)
      //_bindObjectsToPreparedStatement(statement,aBindObjects,number);

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

       anObject = new ENEstimateItemShort();

       /*
       enestimateitem.code,      1
       enestimateitem.countfact, 2
       sm.name,                  3
       tu.name,                  4
       rr.numberdoc,             5
       rr.orderperiod,           6
       budg.shortname            7
       orderItemCode             8
       остаток                   9
       объект планирования      10
       подразделение            11
       инв. №                   12
       */


       anObject.countFact = set.getBigDecimal(2);
	       if (anObject.countFact != null && anObject.countFact.doubleValue() > 0 ) {

	       anObject.code = set.getInt(1);
	       if ( set.wasNull() )
	           anObject.code = Integer.MIN_VALUE;


	       if(anObject.countFact != null)
	           anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

	       anObject.materialRefName = set.getString(3);
	       anObject.measureType = set.getString(4);
	       anObject.invNumber = set.getString(5);
	       anObject.dateEdit = set.getDate(6);
	       anObject.elementName = set.getString(7);
	       anObject.planRefCode = set.getInt(8);

	       anObject.countGen = set.getBigDecimal(9);
	       if(anObject.countGen != null)
	           anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

	       anObject.typeRefName = set.getString(10);

	       anObject.planRefDepartmentName = set.getString(11);

	       anObject.contractNumber = set.getString(12);

	       result.list.add(anObject);
	       }
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



  public ENEstimateItemWriteOffShortList getScrollableFilteredListWriteOff(String anCondition ) throws PersistenceException
  {
   ENEstimateItemWriteOffShortList result = new ENEstimateItemWriteOffShortList();
   ENEstimateItemWriteOffShort anObject;
   result.list = new Vector<>();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   int quantity = Integer.MAX_VALUE / 2;
   int fromPosition = 0;

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = " Select  \n" +
            "       f.estimateitemrefcode ,  \n" +
            "       tm.name as enmatname ,  \n" +
            "       tm.measurementcode as enmeasurementcode , \n" +
            "       tkm.name as  enmeasurementname , \n" +
            "       f.mat_name as fmmatname,  \n" +
            "       f.mu_name as fmmeasurementname,  \n" +
            "       f.mu_id as fmmeasurementcode ,  \n" +
            "       f.nn,  \n" +
            "       f.div_code,  \n" +
            "       f.div_name,  \n" +
            "       f.party_id,   \n" +
            "       f.bal_sch, \n" +
            //"       sizobj.tabnumber,  \n" +
            "       sizobj.tabnumber ||' партия =' || f.party_id ||  '  nn = ' || f.nn  as tabnumber  ,  \n" + //!!!!!!! tezzzt для теста , потом вернуть что бі вібирался только табельний
            "       sizobj.fio,  \n" +
            "       sizobj.profesion , \n" +

            "       (select dep.name from endepartment dep where dep.code = sizobj.departmentrefcode) as depname , \n" +

            "     sizobj.code as sizcode ,         \n" +
            "   to_char(o.dategen,'dd.mm.yyyy') as dateloadexpl ,  \n" +
            "  i2e.countgen -  coalesce(( select sum(coalesce(nn2nn.countgen,0)) from  enestimateitem2nstmttm nn2nn where nn2nn.estimateiteminrefcode = ei.code and nn2nn.typerefcode = 6 ),0)  as countgen ,    \n" +
            "  (select plan.code \n" +
            "                from enestimateitem2nstmttm n2n, enplanwork plan, enestimateitem eitem \n" +
            "                where n2n.estimateiteminrefcode = ei.code \n" +
            "                and n2n.estimateitemoutrefcode = eitem.code \n" +
            "                and eitem.planrefcode = plan.code limit 1  ) as checkplan   \n" +
            " , coalesce(tu.name,'Невизначено') as countmonth_txt \n" +
            " ,  coalesce(( select sum(coalesce(nn2nn.countgen,0)) from  enestimateitem2nstmttm nn2nn where nn2nn.estimateiteminrefcode = ei.code and nn2nn.typerefcode = 6 ),0)  as countcurestimate   \n" +
            "   From \n" +
            " enestimateitem ei , rqfkorderitem2enstmttm i2e, rqfkorderitem oi, rqfkorder o, \n" +
            " finmaterials f, enplanwork pw, ensizobject sizobj  , \n" +
            " tkmaterials tm left JOIN tktimeuse tu on (tu.code = tm.timeusecode)  , tkmeasurement tkm \n" +
            "  \n" +
            //   " where ei.statusrefcode = 6 -- введенные в эксплуатацию \n" +
            " where i2e.estimateitemcode = ei.code \n" +
            " and oi.code = i2e.fkorderitemrefcode \n" +
            " and o.code = oi.fkorderrefcode \n" +
            " and o.kindcode in (8,9) -- ордера на ввод в эксплуатацию (МБП и МНМА) \n" +
            " and o.statuscode = 3 \n" +
            " and f.estimateitemrefcode = ei.code \n" +
            " and tm.code = ei.materialrefcode \n" +
            "  \n" +
            " and pw.code = ei.planrefcode \n" +
            " and pw.elementrefcode = sizobj.elementcode \n" +
            " and tkm.code = tm.measurementcode \n" +
            " and i2e.finmaterialsrefcode=f.code \n" + /// 13.12.2017 -- задваивалось из за отсутствия связки
//               "      and ei.code not in \n" +
//               "               ( \n" +
//               "              select n2n.estimateiteminrefcode \n" +
//               "           from enestimateitem1232nstmttm n2n , \n" +
//               "           enestimateitem eitem, enplanwork plan \n" +
//               "           where n2n.estimateiteminrefcode = ei.code " +
//               "           and n2n.estimateitemoutrefcode = eitem.code \n" +
//               "           and eitem.planrefcode = plan.code \n" +
//               "           and plan.statuscode = 3 \n" +
//               "               ) \n" +
            anCondition
            ;


   try
   {
   statement = connection.prepareStatement(selectStr);
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

     anObject = new ENEstimateItemWriteOffShort();


     anObject.estimateitemrefcode = set.getInt(1);
     if ( set.wasNull() )
         anObject.estimateitemrefcode = Integer.MIN_VALUE;
     anObject.enmatname = set.getString(2);

     anObject.enmeasurementcode = set.getInt(3);
     if ( set.wasNull() )
         anObject.enmeasurementcode = Integer.MIN_VALUE;

     anObject.enmeasurementname = set.getString(4);

     anObject.fmmatname = set.getString(5);

     anObject.fmmeasurementname = set.getString(6);

     anObject.fmmeasurementcode = set.getInt(7);
     if ( set.wasNull() )
         anObject.fmmeasurementcode = Integer.MIN_VALUE;

     anObject.nn = set.getString(8);

     anObject.div_code = set.getString(9);

     anObject.div_name = set.getString(10);

     anObject.party_id = set.getInt(11);
     if ( set.wasNull() )
         anObject.party_id = Integer.MIN_VALUE;

     anObject.bal_sch = set.getString(12);

     anObject.tabnumber = set.getString(13);

     anObject.fio = set.getString(14);

     anObject.profesion = set.getString(15);

     anObject.depname = set.getString(16);

     anObject.sizcode = set.getInt(17);
     if ( set.wasNull() )
         anObject.sizcode = Integer.MIN_VALUE;

     anObject.dateloadexpl = set.getString(18);

     anObject.countgen = set.getBigDecimal(19);

     anObject.checkplan = set.getInt(20);
     if ( set.wasNull() )
         anObject.checkplan = Integer.MIN_VALUE;

     anObject.countmonth_txt = set.getString(21);

     anObject.countgenForView = set.getBigDecimal(22);

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
  /* лист на выборку материалов для списания с подстанций */
  public ENEstimateItemWriteOffShortList getScrollableFilteredListWriteOffSubstation(String anCondition ) throws PersistenceException
  {
   ENEstimateItemWriteOffShortList result = new ENEstimateItemWriteOffShortList();
   ENEstimateItemWriteOffShort anObject;
   result.list = new Vector<>();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   int quantity = Integer.MAX_VALUE / 2;
   int fromPosition = 0;

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = " /*выборка для списания  средств защиты c объектов Подстанция  */  \n" +
   " Select   \n" +
   "                       f.estimateitemrefcode ,   \n" +
   "                       tm.name as enmatname ,   \n" +
   "                       tm.measurementcode as enmeasurementcode ,  \n" +
   "                       tkm.name as  enmeasurementname ,  \n" +
   "                       f.mat_name as fmmatname,   \n" +
   "                       f.mu_name as fmmeasurementname,   \n" +
   "                       f.mu_id as fmmeasurementcode ,   \n" +
   "                       f.nn,   \n" +
   "                       o.moloutcode ,   \n" +
   "                       o.moloutname ,   \n" +
   "                       f.party_id,    \n" +
   "                       o.account as bal_sch,  \n" +
   "                       s150.invnumber ,  \n" +
   "                       s150.name as psname,  \n" +
   "                       s150.buhname  ,  \n" +
   "                       (select ren.name from epren ren where ren.code = ( select enelement.renrefcode from enelement where enelement.code  \n" +
   " = pw.elementrefcode limit 1  )) as depname ,  \n" +
   "                     s150.sizcode as sizcode ,          \n" +
   "                   to_char(o.dategen,'dd.mm.yyyy') as dateloadexpl ,   \n" +
   "  i2e.countgen -  coalesce(( select sum(coalesce(nn2nn.countgen,0)) from  enestimateitem2nstmttm nn2nn where nn2nn.estimateiteminrefcode = ei.code and nn2nn.typerefcode = 6 ),0)  as countgen ,    \n" +
   "                  (select plan.code  \n" +
   "                                from enestimateitem2nstmttm n2n, enplanwork plan, enestimateitem eitem  \n" +
   "                                where n2n.estimateiteminrefcode = ei.code  \n" +
   "                                and n2n.estimateitemoutrefcode = eitem.code  \n" +
   "                                and eitem.planrefcode = plan.code Limit 1 ) as checkplan    \n" +
   "                 , coalesce(tu.name,'Невизначено') as countmonth_txt  \n" +
   " ,  coalesce(( select sum(coalesce(nn2nn.countgen,0)) from  enestimateitem2nstmttm nn2nn where nn2nn.estimateiteminrefcode = ei.code and nn2nn.typerefcode = 6 ),0)  as countcurestimate   \n" +
   "                   From  \n" +
   "                 enestimateitem ei , rqfkorderitem2enstmttm i2e, rqfkorderitem oi, rqfkorder o,  \n" +
   "                    finmaterials f,  \n" +
   "  (select enplanwork.code , enplanwork.elementrefcode , enplanwork.kindcode   from enplanwork where enplanwork.typerefcode = 13   ) as  pw     \n" +
   " , ensubstation150 s150  ,  \n" +
   "                 tkmaterials tm left JOIN tktimeuse tu on (tu.code = tm.timeusecode)  , tkmeasurement tkm  \n" +
   "                   \n" +
   "              \n" +
   "                 where i2e.estimateitemcode = ei.code  \n" +
   "                 and oi.code = i2e.fkorderitemrefcode  \n" +
   "                 and o.code = oi.fkorderrefcode  \n" +
   "                 and o.kindcode in (8,9,11,12)  \n" +
   "                 and o.statuscode = 3  \n" +
   "                 and f.estimateitemrefcode = ei.code  \n" +
   "                 and tm.code = ei.materialrefcode                   \n" +
   "                 and pw.code = ei.planrefcode  \n" +
   "                 and pw.elementrefcode = s150.elementcode  \n" +
   "                 and tkm.code = tm.measurementcode \n" +
   "                and pw.kindcode = 2 \n" +
   "  \n" +
            anCondition
            + " group by  \n" +
            " f.estimateitemrefcode ,    \n" +
            " tm.name ,    \n" +
            " tm.measurementcode ,   \n" +
            " tkm.name ,   \n" +
            " f.mat_name ,    \n" +
            " f.mu_name ,    \n" +
            " f.mu_id ,    \n" +
            " f.nn,    \n" +
            " o.moloutcode ,    \n" +
            " o.moloutname ,    \n" +
            " f.party_id,     \n" +
            " o.account ,   \n" +
            " s150.invnumber ,   \n" +
            " s150.name ,   \n" +
            " s150.buhname,  \n" +
            " pw.elementrefcode ,  \n" +
            " s150.sizcode ,  \n" +
            " o.dategen ,  \n" +
            " i2e.countgen  ,  \n" +
            " ei.code  ,  \n" +
            " tu.name \n" ;


   try
   {
   statement = connection.prepareStatement(selectStr);
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

     anObject = new ENEstimateItemWriteOffShort();


     anObject.estimateitemrefcode = set.getInt(1);
     if ( set.wasNull() )
         anObject.estimateitemrefcode = Integer.MIN_VALUE;
     anObject.enmatname = set.getString(2);

     anObject.enmeasurementcode = set.getInt(3);
     if ( set.wasNull() )
         anObject.enmeasurementcode = Integer.MIN_VALUE;

     anObject.enmeasurementname = set.getString(4);

     anObject.fmmatname = set.getString(5);

     anObject.fmmeasurementname = set.getString(6);

     anObject.fmmeasurementcode = set.getInt(7);
     if ( set.wasNull() )
         anObject.fmmeasurementcode = Integer.MIN_VALUE;

     anObject.nn = set.getString(8);

     anObject.div_code = set.getString(9);

     anObject.div_name = set.getString(10);

     anObject.party_id = set.getInt(11);
     if ( set.wasNull() )
         anObject.party_id = Integer.MIN_VALUE;

     anObject.bal_sch = set.getString(12);

     anObject.tabnumber = set.getString(13);

     anObject.fio = set.getString(14);

     anObject.profesion = set.getString(15);

     anObject.depname = set.getString(16);

     anObject.sizcode = set.getInt(17);
     if ( set.wasNull() )
         anObject.sizcode = Integer.MIN_VALUE;

     anObject.dateloadexpl = set.getString(18);

     anObject.countgen = set.getBigDecimal(19);

     anObject.checkplan = set.getInt(20);
     if ( set.wasNull() )
         anObject.checkplan = Integer.MIN_VALUE;

     anObject.countmonth_txt = set.getString(21);

     anObject.countgenForView = set.getBigDecimal(22);

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



  /* лист на выборку материалов для списания с бригад */
  public ENEstimateItemWriteOffShortList getScrollableFilteredListWriteOffBrigade(String anCondition ) throws PersistenceException
  {
   ENEstimateItemWriteOffShortList result = new ENEstimateItemWriteOffShortList();
   ENEstimateItemWriteOffShort anObject;
   result.list = new Vector<>();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   int quantity = Integer.MAX_VALUE / 2;
   int fromPosition = 0;

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = " /*выборка для списания  средств защиты c объектов Подстанция  */  \n" +
   " Select   \n" +
   "                       f.estimateitemrefcode ,   \n" +
   "                       tm.name as enmatname ,   \n" +
   "                       tm.measurementcode as enmeasurementcode ,  \n" +
   "                       tkm.name as  enmeasurementname ,  \n" +
   "                       f.mat_name as fmmatname,   \n" +
   "                       f.mu_name as fmmeasurementname,   \n" +
   "                       f.mu_id as fmmeasurementcode ,   \n" +
   "                       f.nn,   \n" +
   "                       o.moloutcode ,   \n" +
   "                       o.moloutname ,   \n" +
   "                       f.party_id,    \n" +
   "                       o.account as bal_sch,  \n" +
   "                       '---' as inv ,  \n" +
   "                       br.nazv ,  \n" +
   "                       br.ceh_nazv  ,  \n" +
   "                       (select ren.name from epren ren where ren.code = ( select enelement.renrefcode from enelement where enelement.code  \n" +
   " = pw.elementrefcode limit 1  )) as depname ,  \n" +
   "                     br.sizcode as sizcode ,          \n" +
   "                   to_char(o.dategen,'dd.mm.yyyy') as dateloadexpl ,   \n" +
   "  i2e.countgen -  coalesce(( select sum(coalesce(nn2nn.countgen,0)) from  enestimateitem2nstmttm nn2nn where nn2nn.estimateiteminrefcode = ei.code and nn2nn.typerefcode = 6 ),0)  as countgen ,    \n" +
   "                  (select plan.code  \n" +
   "                                from enestimateitem2nstmttm n2n, enplanwork plan, enestimateitem eitem  \n" +
   "                                where n2n.estimateiteminrefcode = ei.code  \n" +
   "                                and n2n.estimateitemoutrefcode = eitem.code  \n" +
   "                                and eitem.planrefcode = plan.code limit 1  ) as checkplan    \n" +
   "                 , coalesce(tu.name,'Невизначено') as countmonth_txt  \n" +
   " ,  coalesce(( select sum(coalesce(nn2nn.countgen,0)) from  enestimateitem2nstmttm nn2nn where nn2nn.estimateiteminrefcode = ei.code and nn2nn.typerefcode = 6 ),0)  as countcurestimate   \n" +
   "                   From  \n" +
   "                 enestimateitem ei , rqfkorderitem2enstmttm i2e, rqfkorderitem oi, rqfkorder o,  \n" +
   "                    finmaterials f,  \n" +
   "  (select enplanwork.code , enplanwork.elementrefcode , enplanwork.kindcode  from enplanwork where enplanwork.typerefcode = 13   ) as  pw     \n" +
   " , enszbrigade br  ,  \n" +
   "                 tkmaterials tm left JOIN tktimeuse tu on (tu.code = tm.timeusecode)  , tkmeasurement tkm  \n" +
   "                   \n" +
   "              \n" +
   "                 where i2e.estimateitemcode = ei.code  \n" +
   "                 and oi.code = i2e.fkorderitemrefcode  \n" +
   "                 and o.code = oi.fkorderrefcode  \n" +
   "                 and o.kindcode in (8,9,11,12)  \n" +
   "                 and o.statuscode = 3  \n" +
   "                 and f.estimateitemrefcode = ei.code  \n" +
   "                 and tm.code = ei.materialrefcode                   \n" +
   "                 and pw.code = ei.planrefcode  \n" +
   "                 and pw.elementrefcode = br.elementcode  \n" +
   "                 and tkm.code = tm.measurementcode \n" +
   "                and pw.kindcode = 2 \n" +
   "  \n" +
            anCondition
        +
        " group  by    f.estimateitemrefcode ,    \n" +
        " tm.name  ,    \n" +
        " tm.measurementcode  ,   \n" +
        " tkm.name ,   \n" +
        " f.mat_name ,    \n" +
        " f.mu_name ,    \n" +
        " f.mu_id ,    \n" +
        " f.nn,    \n" +
        " o.moloutcode ,    \n" +
        " o.moloutname ,    \n" +
        " f.party_id,     \n" +
        " o.account ,   \n" +
        " br.nazv ,   \n" +
        " br.ceh_nazv  ,  \n" +
        " pw.elementrefcode    ,  \n" +
        " br.sizcode ,  \n" +
        " o.dategen  ,  \n" +
        " i2e.countgen ,  \n" +
        " ei.code  ,  \n" +
        " tu.name  \n"   ;


   try
   {
   statement = connection.prepareStatement(selectStr);
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

     anObject = new ENEstimateItemWriteOffShort();


     anObject.estimateitemrefcode = set.getInt(1);
     if ( set.wasNull() )
         anObject.estimateitemrefcode = Integer.MIN_VALUE;
     anObject.enmatname = set.getString(2);

     anObject.enmeasurementcode = set.getInt(3);
     if ( set.wasNull() )
         anObject.enmeasurementcode = Integer.MIN_VALUE;

     anObject.enmeasurementname = set.getString(4);

     anObject.fmmatname = set.getString(5);

     anObject.fmmeasurementname = set.getString(6);

     anObject.fmmeasurementcode = set.getInt(7);
     if ( set.wasNull() )
         anObject.fmmeasurementcode = Integer.MIN_VALUE;

     anObject.nn = set.getString(8);

     anObject.div_code = set.getString(9);

     anObject.div_name = set.getString(10);

     anObject.party_id = set.getInt(11);
     if ( set.wasNull() )
         anObject.party_id = Integer.MIN_VALUE;

     anObject.bal_sch = set.getString(12);

     anObject.tabnumber = set.getString(13);

     anObject.fio = set.getString(14);

     anObject.profesion = set.getString(15);

     anObject.depname = set.getString(16);

     anObject.sizcode = set.getInt(17);
     if ( set.wasNull() )
         anObject.sizcode = Integer.MIN_VALUE;

     anObject.dateloadexpl = set.getString(18);

     anObject.countgen = set.getBigDecimal(19);

     anObject.checkplan = set.getInt(20);
     if ( set.wasNull() )
         anObject.checkplan = Integer.MIN_VALUE;

     anObject.countmonth_txt = set.getString(21);

     anObject.countgenForView = set.getBigDecimal(22);

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
    public void changeCountFact(int estimateCode, BigDecimal countFact, int statusCode)
            throws PersistenceException {
        Connection connection = getConnection();

        String changeCountFact =
                " update enestimateitem set countfact = " + countFact + ", statusrefcode = " + statusCode +
                " where code = " + estimateCode;

        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(changeCountFact);
            statement.execute();
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\n statement - " + changeCountFact
                    + "\n estimateCode = " + estimateCode);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            statement = null;
        }
    }



    public ENEstimateItemShortList getEstimateByTransportRouteList(
            ENEstimateItem aFilterObject, String anCondition, String anOrderBy,
            int fromPosition, int quantity)
            throws PersistenceException {
        ENEstimateItemShortList result = new ENEstimateItemShortList();
        ENEstimateItemShort anObject;
        result.list = new Vector<>();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";
        String orderBy = processCondition(anOrderBy);

        if (orderBy.length() == 0)
            orderBy = "ENESTIMATEITEM.CODE";

        if (quantity < 0)
            quantity = Integer.MAX_VALUE / 2;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = " select " +
                " enestimateitem.code, " +
                " enestimateitem.countgen," +
                " enestimateitem.countfact, " +
                " enestimateitem.usergen, " +
                " enestimateitem.dateedit, " +

                " enplanwork.code, " +
                " enplanwork.dategen, " +
                " enplanwork.usergen, " +
                " enplanwork.dateedit, " +
                " enplanworkitem.code, " +
                " enplanworkitem.countgen, " +
                " enplanworkitem.usergen, " +
                " enplanworkitem.dateedit, " +

                " sm.code, " +
                " sm.name, " +

                " enestimateitemtype.code, " +
                " enestimateitemtype.name, " +

                " tu.name, kr.code, kr.techkartnumber, kr.name, " +

                " enestimateitemkind.code, " +
                " enestimateitemkind.name, " +

                " enestimateitem.statusrefcode, " +
                " enestimateitemstatus.name, " +

                " (select count(f.code) from finmaterials f where f.estimateitemrefcode = enestimateitem.code and f.statusrefcode = 1) as countfinmaterials, " +
                " (select invnumber from enelementdata where ecode = enplanwork.elementrefcode ) as invnumber, " +
                " (select ename from enelementdata where ecode = enplanwork.elementrefcode ) as ename, " +

                " enplanwork.elementrefcode, " +
                " enplanworktype.name, " +
                " enplanworkstate.name, " +
                " enplanwork.yeargen, " +
                " enplanwork.monthgen, " +
                " enestimateitem.deliverytime, " +

                " enplanwork.departmentrefcode, " +
                " endepartment.name, " +

                " enplanwork.datestart, " +
                " enplanwork.datefinal, " +
                " tt.code, tt.name, " +
                " enestimateitem.accountingtyperefcode " +

                " from enestimateitem " +
                " left join enplanworkitem on enplanworkitem.code = enestimateitem.planitemrefcode " +
                " left join tktimeuse tt on tt.code = enestimateitem.useworktime " +
                " left join tktechcard kr on kr.code = enplanworkitem.kartarefcode, " +
                " enplanwork, tkmaterials sm, tkmeasurement tu, enestimateitemtype, enestimateitemkind, " +
                " enestimateitemstatus, enplanworktype, enplanworkstate, endepartment " +

                " where enplanwork.code = enestimateitem.planrefcode " +
                " and tu.code = sm.measurementcode " +
                " and sm.code = enestimateitem.materialrefcode " +
                " and enestimateitemtype.code = enestimateitem.typerefcode " +
                " and enestimateitemkind.code = enestimateitem.kindrefcode " +
                " and enestimateitemstatus.code = enestimateitem.statusrefcode " +
                " and enplanworktype.code = enplanwork.typerefcode and enplanworkstate.code = enplanwork.staterefcode " +
                " and enplanwork.departmentrefcode = endepartment.code " +
                " and enplanwork.code = " + aFilterObject.planRef.code +

                " union all " +

                " select oi.code, 0, oi.countgen, oi.usergen, oi.dateedit, " +
                " null, null, null, null, null, null, null, null, " +
                " null, oi.nomenclaturename, " +
                " null, " +
                " (select 'В/О № ' || o.numberdoc || ' від: ' || to_char(o.dategen,'dd.MM.yyyy') from rqfkorder o where o.code = oi.fkorderrefcode), " +
                " oi.nomenclatureunitname, null, '0102', 'Перевезення вантажу', " +
                " null, null, null, 'Для перевезень', " +
                " null, null, 'Вантаж для перевезення', " +
                " null, null, null, null, null, null, null, null, null, " +
                " null, null, null, null " +

                " from rqfkorderitem oi where oi.fkorderrefcode in ( " +
                " select distinct to2fo.fkorderrefcode from entransportrot2rqfkrdr to2fo " +
                " where to2fo.transportrouterefcode in ( " +
                " select r.code from entransportroute r where r.planrefcode = " + aFilterObject.planRef.code + "))" +

                " union all " +

                " select ti.code, 0, ti.countfact, ti.usergen, ti.dateedit, " +
                " null, null, null, null, null, null, null, null, " +
                " null, ti.materialname, " +
                " null, " +
                " (select 'ТТО № ' || t.numberdoc || ' від: ' || to_char(t.dategen,'dd.MM.yyyy') from rqtransportinvoice t where t.code = ti.transportinvoicerefcod), " +
                " ti.measurementname, null, '0102', 'Перевезення вантажу', " +
                " null, null, null, 'Для перевезень', " +
                " null, null, 'Вантаж для перевезення', " +
                " null, null, null, null, null, null, null, null, null, " +
                " null, null, null, null " +

                " from rqtransportinvoiceitem ti where ti.transportinvoicerefcod in ( " +
                " select distinct tt.invoicerefcode from ntrnsprtrt2rqtrnsprtnv tt " +
                " where tt.transportrouterefcode in ( " +
                " select r.code from entransportroute r where r.planrefcode = " + aFilterObject.planRef.code + "))";


        selectStr = selectStr + " ORDER BY " + orderBy;
        selectStr = selectStr + " OFFSET " + fromPosition;
        if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

        try {
            statement = connection.prepareStatement(selectStr);
            int number = 0;
            if (aFilterObject != null) {
                if (aFilterObject.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.code);
                }
                if (aFilterObject.countGen != null) {
                    number++;
                    aFilterObject.countGen = aFilterObject.countGen.setScale(3,
                            java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number, aFilterObject.countGen);
                }
                if (aFilterObject.countFact != null) {
                    number++;
                    aFilterObject.countFact = aFilterObject.countFact.setScale(
                            3, java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number, aFilterObject.countFact);
                }
                if (aFilterObject.commentGen != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.commentGen.indexOf('*', 0) < 0
                            && aFilterObject.commentGen.indexOf('?', 0) < 0)
                        whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
                    else
                        whereStr = whereStr
                                + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

                    if (aFilterObject.commentGen != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.commentGen);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }
                if (aFilterObject.userGen != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.userGen.indexOf('*', 0) < 0
                            && aFilterObject.userGen.indexOf('?', 0) < 0)
                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
                    else
                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

                    if (aFilterObject.userGen != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.userGen);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }
                if (aFilterObject.dateEdit != null) {
                    number++;
                    statement.setDate(number, new java.sql.Date(
                            aFilterObject.dateEdit.getTime()));
                }

                if (aFilterObject.deliveryTime != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.deliveryTime);
                }

                if (aFilterObject.modify_time != Long.MIN_VALUE) {
                    number++;
                    if (aFilterObject.modify_time == Long.MIN_VALUE)
                        statement.setBigDecimal(number, null);
                    else
                        statement.setBigDecimal(number,
                                new java.math.BigDecimal(
                                        aFilterObject.modify_time));
                }

                if (aFilterObject.materialRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.materialRef.code);
                }
                if (aFilterObject.typeRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.typeRef.code);
                }


                if (aFilterObject.statusRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.statusRef.code);
                }

                if (aFilterObject.accountingTypeRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number,
                            aFilterObject.accountingTypeRef.code);
                }

            }

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
//                if (i < fromPosition)
//                    continue;
//                else if (i >= fromPosition + quantity) {
//                    i++;
//                    break;
//                }

                anObject = new ENEstimateItemShort();

                anObject.code = set.getInt(1);
                if (set.wasNull())
                    anObject.code = Integer.MIN_VALUE;
                anObject.countGen = set.getBigDecimal(2);
                if (anObject.countGen != null)
                    anObject.countGen = anObject.countGen.setScale(6,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.countFact = set.getBigDecimal(3);
                if (anObject.countFact != null)
                    anObject.countFact = anObject.countFact.setScale(6,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.userGen = set.getString(4);
                anObject.dateEdit = set.getDate(5);

                anObject.planRefCode = set.getInt(6);

                anObject.planRefDateGen = set.getDate(7);

                anObject.planRefUserGen = set.getString(8);

                anObject.planRefDateEdit = set.getDate(9);

                anObject.planItemRefCode = set.getInt(10);
                if (set.wasNull())
                    anObject.planItemRefCode = Integer.MIN_VALUE;

                anObject.planItemRefCountGen = set.getBigDecimal(11);
                if (anObject.planItemRefCountGen != null)
                    anObject.planItemRefCountGen = anObject.planItemRefCountGen
                            .setScale(3, java.math.BigDecimal.ROUND_HALF_UP);

                anObject.planItemRefUserGen = set.getString(12);

                anObject.planItemRefDateEdit = set.getDate(13);

                anObject.materialRefCode = set.getInt(14);

                anObject.materialRefName = set.getString(15);

                anObject.typeRefCode = set.getInt(16);

                anObject.typeRefName = set.getString(17);

                anObject.measureType = set.getString(18);

                anObject.kartaRefCode = set.getInt(19);
                anObject.kartaNum = set.getString(20);
                anObject.kartaRefName = set.getString(21);

                anObject.kindRefCode = set.getInt(22);
                anObject.kindRefName = set.getString(23);

                anObject.statusRefCode = set.getInt(24);
                anObject.statusRefName = set.getString(25);

                anObject.countFINMaterials = set.getInt(26);
                if (set.wasNull())
                    anObject.countFINMaterials = Integer.MIN_VALUE;

                anObject.invNumber = set.getString(27);
                anObject.elementName = set.getString(28);
                anObject.ecode = set.getInt(29);
                if (set.wasNull())
                    anObject.ecode = Integer.MIN_VALUE;
                anObject.planType = set.getString(30);
                anObject.planState = set.getString(31);

                anObject.planRefYearGen = set.getInt(32);
                if (set.wasNull())
                    anObject.planRefYearGen = Integer.MIN_VALUE;

                anObject.planRefMonthGen = set.getInt(33);
                if (set.wasNull())
                    anObject.planRefMonthGen = Integer.MIN_VALUE;

                anObject.deliveryTime = set.getInt(34);
                if (set.wasNull())
                    anObject.deliveryTime = Integer.MIN_VALUE;

                anObject.planRefDepartmentCode = set.getInt(35);
                if (set.wasNull())
                    anObject.planRefDepartmentCode = Integer.MIN_VALUE;

                anObject.planRefDepartmentName = set.getString(36);

                anObject.planRefDateStart = set.getDate(37);
                anObject.planRefDateFinal = set.getDate(38);

                anObject.useWorkTime = set.getInt(39);
                if (set.wasNull())
                    anObject.useWorkTime = Integer.MIN_VALUE;
                anObject.useWorkTimeName = set.getString(40);

                anObject.accountingTypeRefCode = set.getInt(41);
                if (set.wasNull())
                    anObject.accountingTypeRefCode = Integer.MIN_VALUE;

                result.list.add(anObject);
            }

            result.setTotalCount(i);
            return result;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return null;
        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
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


    public ENEstimateItemShortList getListByTransportInvoice(int planCode)
            throws PersistenceException {
        ENEstimateItemShortList result = new ENEstimateItemShortList();
        ENEstimateItemShort anObject;
        result.list = new Vector<>();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = " select sum(e.countfact), m.code, m.name, me.name " +
                " from enestimateitem e, tkmaterials m, tkmeasurement me " +
                " where e.materialrefcode = m.code " +
                " and m.measurementcode = me.code " +
                " and e.planrefcode = " + planCode +
                " and e.countfact > 0 " +
                " and e.kindrefcode = " + ENEstimateItemKind.MATERIALS +
                " group by m.code, m.name, me.name " +
                " order by m.code";

        try {
            statement = connection.prepareStatement(selectStr);
            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {

                anObject = new ENEstimateItemShort();

                anObject.countFact = set.getBigDecimal(1);
                if (anObject.countFact != null)
                    anObject.countFact = anObject.countFact.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

                anObject.materialRefCode = set.getInt(2);
                if (set.wasNull())
                    anObject.materialRefCode = Integer.MIN_VALUE;

                anObject.materialRefName = set.getString(3);
                anObject.measureType = set.getString(4);

                result.list.add(anObject);
            }

            result.setTotalCount(i);
            return result;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return null;
        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
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


    public BigDecimal getPlanMaterialsCount(int planCode, int materialCode)
            throws PersistenceException {

        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        String SQL = " select sum(e.countfact) " +
                " from enestimateitem e, tkmaterials m " +
                " where e.materialrefcode = m.code " +
                " and e.planrefcode = " + planCode +
                " and e.materialrefcode = " + materialCode +
                " and e.countfact > 0 " +
                " and e.kindrefcode = " + ENEstimateItemKind.MATERIALS +
                " group by m.code";

        BigDecimal planMaterialsCount = new BigDecimal(0);

        try {
            statement = connection.prepareStatement(SQL);

            set = statement.executeQuery();

            while(set.next()) {
                planMaterialsCount = set.getBigDecimal(1);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + SQL);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);

        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
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

        return planMaterialsCount;
    }


    public ENEstimateItemShort[] getDetailedESList(
            ENEstimateItemFilter eFilter, ENPlanWorkFilter pFilter) throws PersistenceException {
        ENEstimateItemShortList result = new ENEstimateItemShortList();
        ENEstimateItemShort anObject;
        result.list = new Vector<>();
        Vector<ENEstimateItemShort> v = new Vector<>();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";

        String conditionE = eFilter.conditionSQL == null ? "" : eFilter.conditionSQL;
        String conditionP = pFilter.conditionSQL == null ? "" : pFilter.conditionSQL;

        String orderBy = eFilter.orderBySQL == null ? "" : eFilter.orderBySQL;

        if (orderBy.length() == 0)
            orderBy = "ENESTIMATEITEM.CODE";

        //if(quantity < 0)
        int quantity = Integer.MAX_VALUE/2;
        int fromPosition = 0;
        if(getUserProfile() == null)
            throw new PersistenceException("Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT "+
            "ENESTIMATEITEM.CODE"+
            ",ENESTIMATEITEM.COUNTGEN"+
            ",ENESTIMATEITEM.COUNTFACT"+
            ",ENESTIMATEITEM.USERGEN"+
            ",ENESTIMATEITEM.DATEEDIT"+

            ", ENPLANWORK.CODE " +
            ", ENPLANWORK.DATEGEN " +
            ", ENPLANWORK.USERGEN " +
            ", ENPLANWORK.DATEEDIT " +
            ", ENPLANWORKITEM.CODE " +
            ", ENPLANWORKITEM.COUNTGEN " +
            ", ENPLANWORKITEM.USERGEN " +
            ", ENPLANWORKITEM.DATEEDIT " +
            ", sm.CODE " +
            ", sm.NAME " +
            ", ENESTIMATEITEMTYPE.CODE " +
            ", ENESTIMATEITEMTYPE.NAME " +
            ", tu.NAME  "+
        //   ", kr.id, kr.NUM, kr.OPISANIE " +
            ", kr.code, kr.techkartnumber, kr.name " +
            /*

            ", (select kr.code from TKTECHCARD kr , ENPLANWORKITEM pi where  kr.code = pi.kartarefcode "+
            "  and pi.code = enestimateitem.planitemrefcode ) "+
            ",(select kr.techkartnumber from TKTECHCARD kr , ENPLANWORKITEM pi where  kr.code = pi.kartarefcode "+
            "          and pi.code = enestimateitem.planitemrefcode ) "+
            ",(select kr.name from TKTECHCARD kr , ENPLANWORKITEM pi where  kr.code = pi.kartarefcode "+
            "          and pi.code = enestimateitem.planitemrefcode ) "+
        */
            ", ENESTIMATEITEMKIND.CODE " +
            ", ENESTIMATEITEMKIND.NAME " +

            ", ENESTIMATEITEM.STATUSREFCODE "+
            ", ENESTIMATEITEMSTATUS.NAME " +

            ", (select count(f.code) from finmaterials f where f.estimateitemrefcode = ENESTIMATEITEM.CODE and f.statusrefcode = 1) as countFINMaterials " +

            ", (select invnumber||coalesce(' (дог.№'||ENPLANWORK.PRICONNECTIONNUMBER||')', '') from enelementdata where ecode = enplanwork.elementrefcode ) as invnumber " +
            ", (select ename from enelementdata where ecode = enplanwork.elementrefcode ) as ename " +
            ", enplanwork.elementrefcode " +

            //",  enelementdata.invnumber||coalesce(' (дог.№'||ENPLANWORK.PRICONNECTIONNUMBER||')', ''),  enelementdata.ename,  enelementdata.ecode" +

            ", enplanworktype.name, enplanworkstate.name "+

            ", ENPLANWORK.YEARGEN " +
            ", ENPLANWORK.MONTHGEN " +

            ", ENPLANWORK.DATESTART, ENPLANWORK.DATEFINAL " +

            ", ENPLANWORK.DEPARTMENTREFCODE " +
            ", ENDEPARTMENT.NAME " +


            ", enplanwork.budgetrefcode " +   // 38
             ", (select '213400'::numeric from enpurchasesobject s " +
            "    where s.elementcode = enplanwork.elementrefcode " +
            "      and s.purchasesreasoncode = " + ENPurchasesObjectReason.PURCHASES_AVZ + ") " +

			//код связки строки плана закупки к естимейту
			" , ( select pi2ei.code from rqpurchaseitem2estmttm pi2ei where pi2ei.estimateitemrefcode = ENESTIMATEITEM.CODE and pi2ei.purchaseitemrefcode =  ENESTIMATEITEM.purchaseitemrefcode ) as  rqpurchitm2estimatecod " +
            //код encontract
			" , ( select distinct c.code from enestimateitem2contrct ei2c  , encontract c " +
			"		where ei2c.estimateitemcode = ENESTIMATEITEM.CODE  " +
			"		and ei2c.contractnumber = c.contractnumber " +
			"		and ei2c.findocid = ei2c.findocid order by c.code DESC limit 1  )  as encontractcode " +

			" FROM ENESTIMATEITEM " +

            "left join ENPLANWORKITEM on ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE " +

        //  " left join TEHKART._ARTI kr on kr.id = ENPLANWORKITEM.kartarefcode " +

            " left join TKTECHCARD kr on kr.code = ENPLANWORKITEM.kartarefcode " +
            ", ENPLANWORK " +
            //", ENPLANWORKITEM " +
            ", TKMATERIALS sm" +
        //  ", REPIMPORT.TMESURE_UNIT tu" +
            ",TKMEASUREMENT tu" +
            ", ENESTIMATEITEMTYPE " +
            ", ENESTIMATEITEMKIND " +
            ", ENESTIMATEITEMSTATUS " +
            // перенести ...
            //", enelementdata  " +
            ", enplanworktype, enplanworkstate " +

            " , ENDEPARTMENT " +
            //" WHERE "
            "";

            whereStr = " ENPLANWORK.CODE = ENESTIMATEITEM.PLANREFCODE" ; //+

            whereStr = whereStr + " and tu.code = sm.MEASUREMENTCODE ";

            //whereStr = whereStr +" AND ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE" ; //+

            whereStr = whereStr +" AND sm.CODE = ENESTIMATEITEM.MATERIALREFCODE" ; //+

            whereStr = whereStr + " ";

            whereStr = whereStr +" AND ENESTIMATEITEMTYPE.CODE = ENESTIMATEITEM.TYPEREFCODE" ; //+

            whereStr = whereStr +" AND ENESTIMATEITEMKIND.CODE = ENESTIMATEITEM.KINDREFCODE" ; //+

            whereStr = whereStr +" AND ENESTIMATEITEMSTATUS.CODE = ENESTIMATEITEM.STATUSREFCODE ";

            whereStr = whereStr +" AND ENESTIMATEITEM.COUNTFACT <> 0 ";

            //whereStr = whereStr +" AND ENESTIMATEITEM.statusrefcode  in ("+ ENEstimateItemStatus.PLANNED + ", " + ENEstimateItemStatus.TEMP +") ";

            // чуть шо перенести в другой метод ...
            whereStr = whereStr +" and enplanworktype.code = enplanwork.typerefcode and enplanworkstate.code = enplanwork.staterefcode";
            //whereStr = whereStr +" and enplanwork.elementrefcode = enelementdata.ecode ";
            whereStr = whereStr + " AND ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE ";

            whereStr = whereStr +" and enplanwork.statuscode not in (2, 6) ";
            whereStr = whereStr +" and enplanwork.kindcode = " + ENPlanWorkKind.CURRENT;


            if(eFilter != null)
            {
            if(eFilter.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.CODE = ?";
            }
            if(eFilter.countGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.COUNTGEN = ?";
            }
            if(eFilter.countFact != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.COUNTFACT = ?";
            }
                if (eFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
                    else
                        whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
                }
            if(eFilter.dateEdit != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
            }
            if(eFilter.planRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.PLANREFCODE = ? ";
            }
            if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
            }
            if(eFilter.materialRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
            }
            if(eFilter.typeRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.TYPEREFCODE = ? ";
            }

            if(eFilter.kindRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.KINDREFCODE = ? ";
            }
            if(eFilter.statusRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
            }
            }


            if(pFilter != null)
            {
                if(pFilter.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.CODE = ?";
                }
                if(pFilter.dateGen != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
                }
                if(pFilter.dateStart != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
                }
                if(pFilter.dateFinal != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
                }
                if(pFilter.yearGen != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
                }
                if(pFilter.monthGen != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
                }
                if (pFilter.commentGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (pFilter.commentGen.indexOf('*',0) < 0 && pFilter.commentGen.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.COMMENTGEN = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.COMMENTGEN LIKE ?";
                }
                if (pFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (pFilter.userGen.indexOf('*',0) < 0 && pFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
                }
                if(pFilter.dateEdit != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
                }
                if(pFilter.distanceAlong != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DISTANCEALONG = ?";
                }
                if(pFilter.distanceTo != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DISTANCETO = ?";
                }
                if (pFilter.workOrderNumber != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (pFilter.workOrderNumber.indexOf('*',0) < 0 && pFilter.workOrderNumber.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER LIKE ?";
                }
                if(pFilter.dateWorkOrder != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEWORKORDER = ?";
                }
                if (pFilter.priConnectionNumber != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (pFilter.priConnectionNumber.indexOf('*',0) < 0 && pFilter.priConnectionNumber.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";
                }

                if(pFilter.modify_time != Long.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.MODIFY_TIME = ?";
                }
                if(pFilter.status.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.STATUSCODE = ? ";
                }
                if(pFilter.elementRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.ELEMENTREFCODE = ? ";
                }
                if(pFilter.typeRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
                }
                if(pFilter.kind.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.KINDCODE = ? ";
                }
                if(pFilter.renRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.RENREFCODE = ? ";
                }
                if(pFilter.finExecutor.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.FINEXECUTORCODE = ? ";
                }
                if(pFilter.stateRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
                }
                if(pFilter.formRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.FORMREFCODE = ? ";
                }
                if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.BUDGETREFCODE = ? ";
                }
                if(pFilter.responsibilityRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
                }
                if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.DEPARTMENTREFCODE = ? ";
                }
            }

            if(conditionE.length() != 0)
            {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";

                whereStr = whereStr + " (" + conditionE + ")";
            }

            if(conditionP.length() != 0)
            {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";

                whereStr = whereStr + " (" + conditionP + ")";
            }

//        + " WHERE" +  сделано выше ????
            if(whereStr.length() != 0)
                selectStr = selectStr + " WHERE" + whereStr;

        // selectStr = selectStr + ") ";

        selectStr = selectStr + " ORDER BY " + orderBy;

        try
            {
            statement = connection.prepareStatement(selectStr);
            int number = 0;
            if(eFilter != null){
                if(eFilter.code != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,eFilter.code);
                }
            if(eFilter.countGen != null){
                number++;
                eFilter.countGen = eFilter.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,eFilter.countGen);
            }
            if(eFilter.countFact != null){
                number++;
                eFilter.countFact = eFilter.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,eFilter.countFact);
            }
                if (eFilter.commentGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (eFilter.commentGen.indexOf('*',0) < 0 && eFilter.commentGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
                    else
                        whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

                if(eFilter.commentGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(eFilter.commentGen);
                    for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
                if (eFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
                    else
                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

                if(eFilter.userGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(eFilter.userGen);
                    for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
            if(eFilter.dateEdit != null){
                number++;
                statement.setDate(number,new java.sql.Date(eFilter.dateEdit.getTime()));
            }


            if(eFilter.modify_time != Long.MIN_VALUE){
                number++;
                if(eFilter.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(number,null);
                else
                    statement.setBigDecimal(number,new java.math.BigDecimal(eFilter.modify_time));
            }
            if(eFilter.planRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.planRef.code);
            }
            if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.planItemRef.code);
            }
            if(eFilter.materialRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.materialRef.code);
            }
            if(eFilter.typeRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.typeRef.code);
            }

            if(eFilter.kindRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.kindRef.code);
            }

            if(eFilter.statusRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.statusRef.code);
            }
            }


            if(pFilter != null)
            {

                if(pFilter.code != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,pFilter.code);
                }
                if(pFilter.dateGen != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateGen.getTime()));
                }
                if(pFilter.dateStart != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateStart.getTime()));
                }
                if(pFilter.dateFinal != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateFinal.getTime()));
                }
                if(pFilter.yearGen != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,pFilter.yearGen);
                }
                if(pFilter.monthGen != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,pFilter.monthGen);
                }
                if (pFilter.commentGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (pFilter.commentGen.indexOf('*',0) < 0 && pFilter.commentGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENPLANWORK.COMMENTGEN = ?";
                    else
                        whereStr = whereStr + " ENPLANWORK.COMMENTGEN LIKE ?";

                if(pFilter.commentGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(pFilter.commentGen);
                    for(int i = 0;i < likeStr.length();i++){
                            if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                            if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
                if (pFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (pFilter.userGen.indexOf('*',0) < 0 && pFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENPLANWORK.USERGEN = ?";
                    else
                        whereStr = whereStr + " ENPLANWORK.USERGEN LIKE ?";

                if(pFilter.userGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(pFilter.userGen);
                    for(int i = 0;i < likeStr.length();i++){
                            if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                            if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
                if(pFilter.dateEdit != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateEdit.getTime()));
                }
                if(pFilter.distanceAlong != null){
                    number++;
                    pFilter.distanceAlong = pFilter.distanceAlong.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number,pFilter.distanceAlong);
                }
                if(pFilter.distanceTo != null){
                    number++;
                    pFilter.distanceTo = pFilter.distanceTo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number,pFilter.distanceTo);
                }
                if (pFilter.workOrderNumber != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (pFilter.workOrderNumber.indexOf('*',0) < 0 && pFilter.workOrderNumber.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER = ?";
                    else
                        whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER LIKE ?";

                if(pFilter.workOrderNumber != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(pFilter.workOrderNumber);
                    for(int i = 0;i < likeStr.length();i++){
                            if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                            if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
                if(pFilter.dateWorkOrder != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateWorkOrder.getTime()));
                }
                if (pFilter.priConnectionNumber != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (pFilter.priConnectionNumber.indexOf('*',0) < 0 && pFilter.priConnectionNumber.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER = ?";
                    else
                        whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";

                if(pFilter.priConnectionNumber != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(pFilter.priConnectionNumber);
                    for(int i = 0;i < likeStr.length();i++){
                            if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                            if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }

                if(pFilter.modify_time != Long.MIN_VALUE){
                    number++;
                    if(pFilter.modify_time == Long.MIN_VALUE)
                        statement.setBigDecimal(number,null);
                    else
                        statement.setBigDecimal(number,new java.math.BigDecimal(pFilter.modify_time));
                }
            if(pFilter.status.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.status.code);
            }
            if(pFilter.elementRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.elementRef.code);
            }
            if(pFilter.typeRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.typeRef.code);
            }
            if(pFilter.kind.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.kind.code);
            }
            if(pFilter.renRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.renRef.code);
            }
            if(pFilter.finExecutor.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.finExecutor.code);
            }
            if(pFilter.stateRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.stateRef.code);
            }
            if(pFilter.formRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.formRef.code);
            }
            if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.budgetRef.code);
            }
            if(pFilter.responsibilityRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.responsibilityRef.code);
            }
            if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.departmentRef.code);
            }
            }

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

            anObject = new ENEstimateItemShort();

            anObject.code = set.getInt(1);
            if ( set.wasNull() )
                anObject.code = Integer.MIN_VALUE;
            anObject.countGen = set.getBigDecimal(2);
            if(anObject.countGen != null)
                anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            anObject.countFact = set.getBigDecimal(3);
            if(anObject.countFact != null)
                anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            anObject.userGen = set.getString(4);
            anObject.dateEdit = set.getDate(5);


            anObject.planRefCode = set.getInt(6);

            anObject.planRefDateGen = set.getDate(7);

            anObject.planRefUserGen = set.getString(8);

            anObject.planRefDateEdit = set.getDate(9);

            anObject.planItemRefCode = set.getInt(10);
            if (set.wasNull())
                anObject.planItemRefCode = Integer.MIN_VALUE;

            anObject.planItemRefCountGen = set.getBigDecimal(11);
            if(anObject.planItemRefCountGen != null)
                anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

            anObject.planItemRefUserGen = set.getString(12);

            anObject.planItemRefDateEdit = set.getDate(13);

            anObject.materialRefCode = set.getInt(14);

            anObject.materialRefName = set.getString(15);

            anObject.typeRefCode = set.getInt(16);

            anObject.typeRefName = set.getString(17);

            anObject.measureType = set.getString(18);

            anObject.kartaRefCode = set.getInt(19);
            anObject.kartaNum = set.getString(20);
            anObject.kartaRefName = set.getString(21);

            anObject.kindRefCode = set.getInt(22);
            anObject.kindRefName = set.getString(23);

            anObject.statusRefCode = set.getInt(24);
            anObject.statusRefName = set.getString(25);

            anObject.countFINMaterials = set.getInt(26);
            if ( set.wasNull() )
                anObject.countFINMaterials = Integer.MIN_VALUE;

            //",  enelementdata.invnumber,  enelementdata.ename,  enelementdata.ecode, enplanworktype.name, enplanworkstate.name "+
            anObject.invNumber = set.getString(27);
            anObject.elementName = set.getString(28);
            anObject.ecode = set.getInt(29);
            if ( set.wasNull() )
                anObject.ecode = Integer.MIN_VALUE;
            anObject.planType = set.getString(30);
            anObject.planState = set.getString(31);

            anObject.planRefYearGen = set.getInt(32);
            if ( set.wasNull() )
                anObject.planRefYearGen = Integer.MIN_VALUE;

            anObject.planRefMonthGen = set.getInt(33);
            if ( set.wasNull() )
                anObject.planRefMonthGen = Integer.MIN_VALUE;

            anObject.planRefDateStart = set.getDate(34);
            anObject.planRefDateFinal = set.getDate(35);

            anObject.planRefDepartmentCode = set.getInt(36);
            if (set.wasNull())
                anObject.planRefDepartmentCode = Integer.MIN_VALUE;

            anObject.planRefDepartmentName = set.getString(37);

            anObject.budgetRefCode = set.getInt(38);
            if ( set.wasNull() )
                anObject.budgetRefCode = Integer.MIN_VALUE;

            anObject.ddsCodeAvz = set.getInt(39);
            if (set.wasNull())
                anObject.ddsCodeAvz = Integer.MIN_VALUE;

            anObject.purchaseItem2EstimateitemCode = set.getInt("rqpurchitm2estimatecod");
            if(set.wasNull())
                anObject.purchaseItem2EstimateitemCode = Integer.MIN_VALUE;

            anObject.enContractCode = set.getInt("encontractcode");
            if(set.wasNull())
                anObject.enContractCode = Integer.MIN_VALUE;



            v.add(anObject);
            }

            ENEstimateItemShort[] arr = new ENEstimateItemShort[v.size()];
            for (int j = 0; j < v.size(); j++ ) {
                arr[j] = (ENEstimateItemShort) v.get(j);
            }

            return arr;

            }

            catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            return null;

            } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
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

    public ENEstimateItemShortList getDetailedEstimateBySCCountersList(
            ENEstimateItemFilter eFilter, ENPlanWorkFilter pFilter)
            throws PersistenceException {
        ENEstimateItemShortList result = new ENEstimateItemShortList();
        ENEstimateItemShort anObject;
        result.list = new Vector<>();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";

        String conditionE = eFilter.conditionSQL == null ? ""
                : eFilter.conditionSQL;
        String conditionP = pFilter.conditionSQL == null ? ""
                : pFilter.conditionSQL;

        String orderBy = " ENPLANWORK.DATESTART, SM.NAME, ENESTIMATEITEMTYPE.CODE ";

        // if(quantity < 0)
        int quantity = Integer.MAX_VALUE / 2;
        int fromPosition = 0;
        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT "+
            "ENESTIMATEITEM.CODE"+
            ",ENESTIMATEITEM.COUNTGEN"+
            ",ENESTIMATEITEM.COUNTFACT"+
            ",ENESTIMATEITEM.USERGEN"+
            ",ENESTIMATEITEM.DATEEDIT"+

            ", ENPLANWORK.CODE " +
            ", ENPLANWORK.DATEGEN " +
            ", ENPLANWORK.USERGEN " +
            ", ENPLANWORK.DATEEDIT " +

            //", ENPLANWORKITEM.CODE " +
            //", ENPLANWORKITEM.COUNTGEN " +
            //", ENPLANWORKITEM.USERGEN " +
            //", ENPLANWORKITEM.DATEEDIT " +

             ", (select ENPLANWORKITEM.CODE from ENPLANWORKITEM where ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE) " +
             ", (select ENPLANWORKITEM.COUNTGEN from ENPLANWORKITEM where ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE) " +
             ", (select ENPLANWORKITEM.USERGEN from ENPLANWORKITEM where ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE) " +
             ", (select ENPLANWORKITEM.DATEEDIT from ENPLANWORKITEM where ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE) " +

            ", sm.CODE " +
            ", sm.NAME " +
            ", ENESTIMATEITEMTYPE.CODE " +
            ", ENESTIMATEITEMTYPE.NAME " +
            ", tu.NAME  "+

            //", kr.code, kr.techkartnumber, kr.name " +

             ", (select kr.code from TKTECHCARD kr, ENPLANWORKITEM " +
             "    where kr.code = ENPLANWORKITEM.kartarefcode and ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE) " +
             ", (select kr.techkartnumber from TKTECHCARD kr, ENPLANWORKITEM " +
             "    where kr.code = ENPLANWORKITEM.kartarefcode and ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE) " +
             ", (select kr.name from TKTECHCARD kr, ENPLANWORKITEM " +
             "    where kr.code = ENPLANWORKITEM.kartarefcode and ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE) " +

            ", ENESTIMATEITEMKIND.CODE " +
            ", ENESTIMATEITEMKIND.NAME " +

            ", ENESTIMATEITEM.STATUSREFCODE "+
            ", ENESTIMATEITEMSTATUS.NAME " +

            ", (select count(f.code) from finmaterials f where f.estimateitemrefcode = ENESTIMATEITEM.CODE and f.statusrefcode = 1) as countFINMaterials " +

            ", (select invnumber||coalesce(' (дог.№'||ENPLANWORK.PRICONNECTIONNUMBER||')', '') from enelementdata where ecode = enplanwork.elementrefcode ) as invnumber " +
            ", (select ename from enelementdata where ecode = enplanwork.elementrefcode ) as ename " +
            ", enplanwork.elementrefcode " +

            ", enplanworktype.name, enplanworkstate.name "+

            ", ENPLANWORK.YEARGEN " +
            ", ENPLANWORK.MONTHGEN " +

            ", ENPLANWORK.DATESTART, ENPLANWORK.DATEFINAL " +

            ", ENPLANWORK.DEPARTMENTREFCODE " +
            ", ENDEPARTMENT.NAME " +


            ", enplanwork.budgetrefcode " +   // 38
            ", (select '213400'::numeric from enpurchasesobject s " +
            "    where s.elementcode = enplanwork.elementrefcode " +
            "      and s.purchasesreasoncode = " + ENPurchasesObjectReason.PURCHASES_AVZ + ") " +

			", ENESTIMATEITEM.PURCHASEITEMREFCODE as RQPURCHASEITEMCODE " +

			" FROM ENESTIMATEITEM " +

            //" left join ENPLANWORKITEM on ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE " +
            //" left join TKTECHCARD kr on kr.code = ENPLANWORKITEM.kartarefcode " +

            ", ENPLANWORK " +
            ", TKMATERIALS sm" +
            ", TKMEASUREMENT tu" +
            ", ENESTIMATEITEMTYPE " +
            ", ENESTIMATEITEMKIND " +
            ", ENESTIMATEITEMSTATUS " +
            // перенести ...
            //", enelementdata  " +
            ", enplanworktype, enplanworkstate " +

            " , ENDEPARTMENT " +
            //" WHERE "
            "";

            whereStr = " ENPLANWORK.CODE = ENESTIMATEITEM.PLANREFCODE" ; //+

            whereStr = whereStr + " and tu.code = sm.MEASUREMENTCODE ";

            //whereStr = whereStr +" AND ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE" ; //+

            whereStr = whereStr +" AND sm.CODE = ENESTIMATEITEM.MATERIALREFCODE" ; //+

            whereStr = whereStr + " ";

            whereStr = whereStr +" AND ENESTIMATEITEMTYPE.CODE = ENESTIMATEITEM.TYPEREFCODE" ; //+

            whereStr = whereStr +" AND ENESTIMATEITEMKIND.CODE = ENESTIMATEITEM.KINDREFCODE" ; //+

            whereStr = whereStr +" AND ENESTIMATEITEMSTATUS.CODE = ENESTIMATEITEM.STATUSREFCODE ";

            whereStr = whereStr +" AND ENESTIMATEITEM.COUNTFACT <> 0 ";

            //whereStr = whereStr +" AND ENESTIMATEITEM.statusrefcode  in ("+ ENEstimateItemStatus.PLANNED + ", " + ENEstimateItemStatus.TEMP +") ";

            // чуть шо перенести в другой метод ...
            whereStr = whereStr +" and enplanworktype.code = enplanwork.typerefcode and enplanworkstate.code = enplanwork.staterefcode";
            //whereStr = whereStr +" and enplanwork.elementrefcode = enelementdata.ecode ";
            whereStr = whereStr + " AND ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE ";

            whereStr = whereStr +" and enplanwork.statuscode not in (2, 6) ";
            whereStr = whereStr +" and enplanwork.kindcode = " + ENPlanWorkKind.CURRENT;


            if(eFilter != null)
            {
            if(eFilter.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.CODE = ?";
            }
            if(eFilter.countGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.COUNTGEN = ?";
            }
            if(eFilter.countFact != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.COUNTFACT = ?";
            }
                if (eFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
                    else
                        whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
                }
            if(eFilter.dateEdit != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
            }
            if(eFilter.planRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.PLANREFCODE = ? ";
            }
            if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
            }
            if(eFilter.materialRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
            }
            if(eFilter.typeRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.TYPEREFCODE = ? ";
            }

            if(eFilter.kindRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.KINDREFCODE = ? ";
            }
            if(eFilter.statusRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
            }
            }


            if(pFilter != null)
            {
            /*
            if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.DEPARTMENTREFCODE = ?";
            }

            if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.BUDGETREFCODE = ?";
            }
            if(pFilter.yearGen != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
            }

            if(pFilter.monthGen != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
            }

            if(pFilter.formRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANWORK.FORMREFCODE = ?";
            }

            // НАХ так делать ... передаем фильтр  и не обрабатываем ЕГО !!!
            if (pFilter.elementRef.code != Integer.MIN_VALUE){
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + " ENPLANWORK.ELEMENTREFCODE = ?";
            }
            */

            /////////////////////////////////////////////////////////////////////////////////////
                if(pFilter.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.CODE = ?";
                }
                if(pFilter.dateGen != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
                }
                if(pFilter.dateStart != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
                }
                if(pFilter.dateFinal != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
                }
                if(pFilter.yearGen != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
                }
                if(pFilter.monthGen != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
                }
                if (pFilter.commentGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (pFilter.commentGen.indexOf('*',0) < 0 && pFilter.commentGen.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.COMMENTGEN = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.COMMENTGEN LIKE ?";
                }
                if (pFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (pFilter.userGen.indexOf('*',0) < 0 && pFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
                }
                if(pFilter.dateEdit != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
                }
                if(pFilter.distanceAlong != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DISTANCEALONG = ?";
                }
                if(pFilter.distanceTo != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DISTANCETO = ?";
                }
                if (pFilter.workOrderNumber != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (pFilter.workOrderNumber.indexOf('*',0) < 0 && pFilter.workOrderNumber.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER LIKE ?";
                }
                if(pFilter.dateWorkOrder != null) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.DATEWORKORDER = ?";
                }
                if (pFilter.priConnectionNumber != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (pFilter.priConnectionNumber.indexOf('*',0) < 0 && pFilter.priConnectionNumber.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER = ?";
                    else
                        whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";
                }

                if(pFilter.modify_time != Long.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + "  ENPLANWORK.MODIFY_TIME = ?";
                }
                if(pFilter.status.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.STATUSCODE = ? ";
                }
                if(pFilter.elementRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.ELEMENTREFCODE = ? ";
                }
                if(pFilter.typeRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
                }
                if(pFilter.kind.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.KINDCODE = ? ";
                }
                if(pFilter.renRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.RENREFCODE = ? ";
                }
                if(pFilter.finExecutor.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.FINEXECUTORCODE = ? ";
                }
                if(pFilter.stateRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
                }
                if(pFilter.formRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.FORMREFCODE = ? ";
                }
                if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.BUDGETREFCODE = ? ";
                }
                if(pFilter.responsibilityRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
                }
                if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
                    if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                    whereStr = whereStr + " ENPLANWORK.DEPARTMENTREFCODE = ? ";
                }
            /////////////////////////////////////////////////////////////////////////////////////
            }


            if(conditionE.length() != 0)
            {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";

                whereStr = whereStr + " (" + conditionE + ")";
            }

            if(conditionP.length() != 0)
            {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";

                whereStr = whereStr + " (" + conditionP + ")";
            }

//        + " WHERE" +  сделано выше ????
            if(whereStr.length() != 0)
                selectStr = selectStr + " WHERE" + whereStr;

        // selectStr = selectStr + ") ";

        selectStr = selectStr + " ORDER BY " + orderBy;

        try
            {
            statement = connection.prepareStatement(selectStr);
            int number = 0;
            if(eFilter != null){
                if(eFilter.code != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,eFilter.code);
                }
            if(eFilter.countGen != null){
                number++;
                eFilter.countGen = eFilter.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,eFilter.countGen);
            }
            if(eFilter.countFact != null){
                number++;
                eFilter.countFact = eFilter.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,eFilter.countFact);
            }
                if (eFilter.commentGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (eFilter.commentGen.indexOf('*',0) < 0 && eFilter.commentGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
                    else
                        whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

                if(eFilter.commentGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(eFilter.commentGen);
                    for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
                if (eFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
                    else
                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

                if(eFilter.userGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(eFilter.userGen);
                    for(int i = 0;i < likeStr.length();i++){
                        if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                        if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
            if(eFilter.dateEdit != null){
                number++;
                statement.setDate(number,new java.sql.Date(eFilter.dateEdit.getTime()));
            }


            if(eFilter.modify_time != Long.MIN_VALUE){
                number++;
                if(eFilter.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(number,null);
                else
                    statement.setBigDecimal(number,new java.math.BigDecimal(eFilter.modify_time));
            }
            if(eFilter.planRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.planRef.code);
            }
            if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.planItemRef.code);
            }
            if(eFilter.materialRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.materialRef.code);
            }
            if(eFilter.typeRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.typeRef.code);
            }

            if(eFilter.kindRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.kindRef.code);
            }

            if(eFilter.statusRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,eFilter.statusRef.code);
            }
            }


            if(pFilter != null)
            {
            /*
            if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number,pFilter.departmentRef.code);           }

            if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number,pFilter.budgetRef.code);
            }
            if(pFilter.yearGen != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number,pFilter.yearGen);
            }

            if(pFilter.monthGen != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number,pFilter.monthGen);
            }
            if(pFilter.formRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number,pFilter.formRef.code);
            }

            if (pFilter.elementRef.code != Integer.MIN_VALUE){
                number++;
                statement.setInt(number, pFilter.elementRef.code);
            }
            */

            //////////////////////////////////////////////////////////
                if(pFilter.code != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,pFilter.code);
                }
                if(pFilter.dateGen != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateGen.getTime()));
                }
                if(pFilter.dateStart != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateStart.getTime()));
                }
                if(pFilter.dateFinal != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateFinal.getTime()));
                }
                if(pFilter.yearGen != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,pFilter.yearGen);
                }
                if(pFilter.monthGen != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,pFilter.monthGen);
                }
                if (pFilter.commentGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (pFilter.commentGen.indexOf('*',0) < 0 && pFilter.commentGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENPLANWORK.COMMENTGEN = ?";
                    else
                        whereStr = whereStr + " ENPLANWORK.COMMENTGEN LIKE ?";

                if(pFilter.commentGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(pFilter.commentGen);
                    for(int i = 0;i < likeStr.length();i++){
                            if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                            if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
                if (pFilter.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (pFilter.userGen.indexOf('*',0) < 0 && pFilter.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENPLANWORK.USERGEN = ?";
                    else
                        whereStr = whereStr + " ENPLANWORK.USERGEN LIKE ?";

                if(pFilter.userGen != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(pFilter.userGen);
                    for(int i = 0;i < likeStr.length();i++){
                            if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                            if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
                if(pFilter.dateEdit != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateEdit.getTime()));
                }
                if(pFilter.distanceAlong != null){
                    number++;
                    pFilter.distanceAlong = pFilter.distanceAlong.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number,pFilter.distanceAlong);
                }
                if(pFilter.distanceTo != null){
                    number++;
                    pFilter.distanceTo = pFilter.distanceTo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number,pFilter.distanceTo);
                }
                if (pFilter.workOrderNumber != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (pFilter.workOrderNumber.indexOf('*',0) < 0 && pFilter.workOrderNumber.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER = ?";
                    else
                        whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER LIKE ?";

                if(pFilter.workOrderNumber != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(pFilter.workOrderNumber);
                    for(int i = 0;i < likeStr.length();i++){
                            if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                            if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }
                if(pFilter.dateWorkOrder != null){
                    number++;
                    statement.setDate(number,new java.sql.Date(pFilter.dateWorkOrder.getTime()));
                }
                if (pFilter.priConnectionNumber != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (pFilter.priConnectionNumber.indexOf('*',0) < 0 && pFilter.priConnectionNumber.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER = ?";
                    else
                        whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";

                if(pFilter.priConnectionNumber != null){
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(pFilter.priConnectionNumber);
                    for(int i = 0;i < likeStr.length();i++){
                            if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                            if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                    }
                    statement.setString(number,likeStr.toString());
                }
                }

                if(pFilter.modify_time != Long.MIN_VALUE){
                    number++;
                    if(pFilter.modify_time == Long.MIN_VALUE)
                        statement.setBigDecimal(number,null);
                    else
                        statement.setBigDecimal(number,new java.math.BigDecimal(pFilter.modify_time));
                }
            if(pFilter.status.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.status.code);
            }
            if(pFilter.elementRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.elementRef.code);
            }
            if(pFilter.typeRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.typeRef.code);
            }
            if(pFilter.kind.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.kind.code);
            }
            if(pFilter.renRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.renRef.code);
            }
            if(pFilter.finExecutor.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.finExecutor.code);
            }
            if(pFilter.stateRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.stateRef.code);
            }
            if(pFilter.formRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.formRef.code);
            }
            if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.budgetRef.code);
            }
            if(pFilter.responsibilityRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.responsibilityRef.code);
            }
            if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,pFilter.departmentRef.code);
            }
            //////////////////////////////////////////////////////////
            }


            //if(condition.length() > 0 && aBindObjects != null)
            // _bindObjectsToPreparedStatement(statement,aBindObjects,number);

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

            anObject = new ENEstimateItemShort();

            anObject.code = set.getInt(1);
            if ( set.wasNull() )
                anObject.code = Integer.MIN_VALUE;
            anObject.countGen = set.getBigDecimal(2);
            if(anObject.countGen != null)
                anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            anObject.countFact = set.getBigDecimal(3);
            if(anObject.countFact != null)
                anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            anObject.userGen = set.getString(4);
            anObject.dateEdit = set.getDate(5);


            anObject.planRefCode = set.getInt(6);

            anObject.planRefDateGen = set.getDate(7);

            anObject.planRefUserGen = set.getString(8);

            anObject.planRefDateEdit = set.getDate(9);

            anObject.planItemRefCode = set.getInt(10);
            if (set.wasNull())
                anObject.planItemRefCode = Integer.MIN_VALUE;

            anObject.planItemRefCountGen = set.getBigDecimal(11);
            if(anObject.planItemRefCountGen != null)
                anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

            anObject.planItemRefUserGen = set.getString(12);

            anObject.planItemRefDateEdit = set.getDate(13);

            anObject.materialRefCode = set.getInt(14);

            anObject.materialRefName = set.getString(15);

            anObject.typeRefCode = set.getInt(16);

            anObject.typeRefName = set.getString(17);

            anObject.measureType = set.getString(18);

            anObject.kartaRefCode = set.getInt(19);
            anObject.kartaNum = set.getString(20);
            anObject.kartaRefName = set.getString(21);

            anObject.kindRefCode = set.getInt(22);
            anObject.kindRefName = set.getString(23);

            anObject.statusRefCode = set.getInt(24);
            anObject.statusRefName = set.getString(25);

            anObject.countFINMaterials = set.getInt(26);
            if ( set.wasNull() )
                anObject.countFINMaterials = Integer.MIN_VALUE;

            //",  enelementdata.invnumber,  enelementdata.ename,  enelementdata.ecode, enplanworktype.name, enplanworkstate.name "+
            anObject.invNumber = set.getString(27);
            anObject.elementName = set.getString(28);
            anObject.ecode = set.getInt(29);
            if ( set.wasNull() )
                anObject.ecode = Integer.MIN_VALUE;
            anObject.planType = set.getString(30);
            anObject.planState = set.getString(31);

            anObject.planRefYearGen = set.getInt(32);
            if ( set.wasNull() )
                anObject.planRefYearGen = Integer.MIN_VALUE;

            anObject.planRefMonthGen = set.getInt(33);
            if ( set.wasNull() )
                anObject.planRefMonthGen = Integer.MIN_VALUE;

            anObject.planRefDateStart = set.getDate(34);
            anObject.planRefDateFinal = set.getDate(35);

            anObject.planRefDepartmentCode = set.getInt(36);
            if (set.wasNull())
                anObject.planRefDepartmentCode = Integer.MIN_VALUE;

            anObject.planRefDepartmentName = set.getString(37);


            anObject.budgetRefCode = set.getInt(38);
            if ( set.wasNull() )
                anObject.budgetRefCode = Integer.MIN_VALUE;

            anObject.ddsCodeAvz = set.getInt(39);
            if (set.wasNull())
                anObject.ddsCodeAvz = Integer.MIN_VALUE;

            anObject.purchaseItemRefCode = set.getInt("RQPURCHASEITEMCODE");
			if(set.wasNull()) {
				anObject.purchaseItemRefCode = Integer.MIN_VALUE;
			}


            result.list.add(anObject);
            }

            result.setTotalCount(i);
            return result;

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return null;
        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
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


    public ENEstimateItem getObjectNoRef(int uid) throws PersistenceException {
        ENEstimateItem result = new ENEstimateItem();
        result.code = uid;
        loadObjectNoRef(result);
        if (result.code == Integer.MIN_VALUE)
            return null;
        return result;
    }


    public void loadObjectNoRef(ENEstimateItem anObject)
            throws PersistenceException {
        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT  ENESTIMATEITEM.CODE, ENESTIMATEITEM.COUNTGEN, ENESTIMATEITEM.COUNTFACT, ENESTIMATEITEM.PRICE, ENESTIMATEITEM.COST, "
                + " ENESTIMATEITEM.DELIVERYTIME, ENESTIMATEITEM.USEWORKTIME, ENESTIMATEITEM.COMMENTGEN, ENESTIMATEITEM.USERGEN, ENESTIMATEITEM.DATEEDIT, "
                + " ENESTIMATEITEM.MODIFY_TIME, ENESTIMATEITEM.PLANREFCODE, ENESTIMATEITEM.PLANITEMREFCODE, ENESTIMATEITEM.MATERIALREFCODE, "
                + " ENESTIMATEITEM.TYPEREFCODE, ENESTIMATEITEM.KINDREFCODE, ENESTIMATEITEM.STATUSREFCODE, ENESTIMATEITEM.OLDSTATUSREFCODE, "
                + " ENESTIMATEITEM.ACCOUNTINGTYPEREFCODE "
                + ", ENESTIMATEITEM.ISUSEVAT "
                + ", ENESTIMATEITEM.PURCHASEITEMREFCODE "
                + " FROM ENESTIMATEITEM WHERE ENESTIMATEITEM.CODE = ?";

        try {
            statement = connection.prepareStatement(selectStr);
            statement.setInt(1, anObject.code);
            set = statement.executeQuery();
            if (!set.next())
                anObject.code = Integer.MIN_VALUE;
            else {
                anObject.code = set.getInt(1);
                anObject.countGen = set.getBigDecimal(2);
                if (anObject.countGen != null)
                    anObject.countGen = anObject.countGen.setScale(6,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.countFact = set.getBigDecimal(3);
                if (anObject.countFact != null)
                    anObject.countFact = anObject.countFact.setScale(6,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.price = set.getBigDecimal(4);
                if (anObject.price != null)
                    anObject.price = anObject.price.setScale(2,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.cost = set.getBigDecimal(5);
                if (anObject.cost != null)
                    anObject.cost = anObject.cost.setScale(2,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.deliveryTime = set.getInt(6);
                if (set.wasNull())
                    anObject.deliveryTime = Integer.MIN_VALUE;
                anObject.useWorkTime = set.getInt(7);
                if (set.wasNull())
                    anObject.useWorkTime = Integer.MIN_VALUE;
                anObject.commentGen = set.getString(8);
                anObject.userGen = set.getString(9);
                anObject.dateEdit = set.getDate(10);

                anObject.modify_time = set.getLong(11);
                if (set.wasNull())
                    anObject.modify_time = Long.MIN_VALUE;
                anObject.planRef.code = set.getInt(12);
                if (set.wasNull())
                    anObject.planRef.code = Integer.MIN_VALUE;
                anObject.planItemRef.code = set.getInt(13);
                if (set.wasNull())
                    anObject.planItemRef.code = Integer.MIN_VALUE;
                anObject.materialRef.code = set.getInt(14);
                if (set.wasNull())
                    anObject.materialRef.code = Integer.MIN_VALUE;
                anObject.typeRef.code = set.getInt(15);
                if (set.wasNull())
                    anObject.typeRef.code = Integer.MIN_VALUE;
                anObject.kindRef.code = set.getInt(16);
                if (set.wasNull())
                    anObject.kindRef.code = Integer.MIN_VALUE;
                anObject.statusRef.code = set.getInt(17);
                if (set.wasNull())
                    anObject.statusRef.code = Integer.MIN_VALUE;
                anObject.oldStatusRef.code = set.getInt(18);
                if (set.wasNull())
                    anObject.oldStatusRef.code = Integer.MIN_VALUE;
                anObject.accountingTypeRef.code = set.getInt(19);
                if (set.wasNull())
                    anObject.accountingTypeRef.code = Integer.MIN_VALUE;

                anObject.isUseVAT = set.getInt(20);
                if (set.wasNull())
                    anObject.isUseVAT = Integer.MIN_VALUE;

                anObject.purchaseItemRef.code = set.getInt(21);
    			if (set.wasNull()) {
    				anObject.purchaseItemRef.code = Integer.MIN_VALUE;
    			}
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
        } finally {
            try {
                if (set != null)
                    set.close();
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




    public ENEstimateItem getObjectNoSegr(int uid) throws PersistenceException {
        ENEstimateItem result = new ENEstimateItem();
        result.code = uid;
        loadObjectNoSegr(result);
        if (result.code == Integer.MIN_VALUE)
            return null;
        return result;
    }

    public void loadObjectNoSegr(ENEstimateItem anObject)
            throws PersistenceException {
        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT  ENESTIMATEITEM.CODE, ENESTIMATEITEM.COUNTGEN, ENESTIMATEITEM.COUNTFACT, ENESTIMATEITEM.PRICE, ENESTIMATEITEM.COST, "
                + " ENESTIMATEITEM.DELIVERYTIME, ENESTIMATEITEM.USEWORKTIME, ENESTIMATEITEM.COMMENTGEN, ENESTIMATEITEM.USERGEN, ENESTIMATEITEM.DATEEDIT, "
                + " ENESTIMATEITEM.MODIFY_TIME, ENESTIMATEITEM.PLANREFCODE, ENESTIMATEITEM.PLANITEMREFCODE, ENESTIMATEITEM.MATERIALREFCODE, "
                + " ENESTIMATEITEM.TYPEREFCODE, ENESTIMATEITEM.KINDREFCODE, ENESTIMATEITEM.STATUSREFCODE, ENESTIMATEITEM.OLDSTATUSREFCODE, "
                + " ENESTIMATEITEM.ACCOUNTINGTYPEREFCODE "
                + ", ENESTIMATEITEM.ISUSEVAT "
                + ", ENESTIMATEITEM.PURCHASEITEMREFCODE "
                + " FROM ENESTIMATEITEM WHERE ENESTIMATEITEM.CODE = ?";

        try {
            statement = connection.prepareStatement(selectStr);
            statement.setInt(1, anObject.code);
            set = statement.executeQuery();
            if (!set.next())
                anObject.code = Integer.MIN_VALUE;
            else {
                anObject.code = set.getInt(1);
                anObject.countGen = set.getBigDecimal(2);
                if (anObject.countGen != null)
                    anObject.countGen = anObject.countGen.setScale(6,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.countFact = set.getBigDecimal(3);
                if (anObject.countFact != null)
                    anObject.countFact = anObject.countFact.setScale(6,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.price = set.getBigDecimal(4);
                if (anObject.price != null)
                    anObject.price = anObject.price.setScale(2,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.cost = set.getBigDecimal(5);
                if (anObject.cost != null)
                    anObject.cost = anObject.cost.setScale(2,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.deliveryTime = set.getInt(6);
                if (set.wasNull())
                    anObject.deliveryTime = Integer.MIN_VALUE;
                anObject.useWorkTime = set.getInt(7);
                if (set.wasNull())
                    anObject.useWorkTime = Integer.MIN_VALUE;
                anObject.commentGen = set.getString(8);
                anObject.userGen = set.getString(9);
                anObject.dateEdit = set.getDate(10);

                anObject.modify_time = set.getLong(11);
                if (set.wasNull())
                    anObject.modify_time = Long.MIN_VALUE;
                anObject.planRef.code = set.getInt(12);
                if (set.wasNull())
                    anObject.planRef.code = Integer.MIN_VALUE;
                anObject.planItemRef.code = set.getInt(13);
                if (set.wasNull())
                    anObject.planItemRef.code = Integer.MIN_VALUE;
                anObject.materialRef.code = set.getInt(14);
                if (set.wasNull())
                    anObject.materialRef.code = Integer.MIN_VALUE;
                anObject.typeRef.code = set.getInt(15);
                if (set.wasNull())
                    anObject.typeRef.code = Integer.MIN_VALUE;
                anObject.kindRef.code = set.getInt(16);
                if (set.wasNull())
                    anObject.kindRef.code = Integer.MIN_VALUE;
                anObject.statusRef.code = set.getInt(17);
                if (set.wasNull())
                    anObject.statusRef.code = Integer.MIN_VALUE;
                anObject.oldStatusRef.code = set.getInt(18);
                if (set.wasNull())
                    anObject.oldStatusRef.code = Integer.MIN_VALUE;
                anObject.accountingTypeRef.code = set.getInt(19);
                if (set.wasNull())
                    anObject.accountingTypeRef.code = Integer.MIN_VALUE;

                anObject.isUseVAT = set.getInt(20);
                if (set.wasNull())
                    anObject.isUseVAT = Integer.MIN_VALUE;

                anObject.purchaseItemRef.code = set.getInt(21);
    			if (set.wasNull()) {
    				anObject.purchaseItemRef.code = Integer.MIN_VALUE;
    			}

                if (anObject.typeRef.code != Integer.MIN_VALUE) {
                    anObject.setTypeRef(new com.ksoe.energynet.dataminer.generated.ENEstimateItemTypeDAOGen(
                            connection, getUserProfile())
                            .getRef(anObject.typeRef.code));
                }
                if (anObject.kindRef.code != Integer.MIN_VALUE) {
                    anObject.setKindRef(new com.ksoe.energynet.dataminer.generated.ENEstimateItemKindDAOGen(
                            connection, getUserProfile())
                            .getRef(anObject.kindRef.code));
                }
                if (anObject.statusRef.code != Integer.MIN_VALUE) {
                    anObject.setStatusRef(new com.ksoe.energynet.dataminer.generated.ENEstimateItemStatusDAOGen(
                            connection, getUserProfile())
                            .getRef(anObject.statusRef.code));
                }
                if (anObject.oldStatusRef.code != Integer.MIN_VALUE) {
                    anObject.setOldStatusRef(new com.ksoe.energynet.dataminer.generated.ENEstimateItemStatusDAOGen(
                            connection, getUserProfile())
                            .getRef(anObject.oldStatusRef.code));
                }
                if (anObject.accountingTypeRef.code != Integer.MIN_VALUE) {
                    anObject.setAccountingTypeRef(new com.ksoe.techcard.dataminer.generated.TKAccountingTypeDAOGen(
                            connection, getUserProfile())
                            .getRef(anObject.accountingTypeRef.code));
                }
                if(anObject.purchaseItemRef.code != Integer.MIN_VALUE) {
    				anObject.setPurchaseItemRef(
    					new com.ksoe.rqorder.dataminer.generated.RQPurchaseItemDAOGen(connection,getUserProfile()).getRef(anObject.purchaseItemRef.code));
    			}
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
        } finally {
            try {
                if (set != null)
                    set.close();
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

    public ENEstimateItemShortList getShortListForFact(ENEstimateItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
    {
        return getShortListForFact(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }

    public ENEstimateItemShortList getShortListForFact(ENEstimateItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector<Object> aBindObjects) throws PersistenceException
    {
    ENEstimateItemShortList result = new ENEstimateItemShortList();
    ENEstimateItemShort anObject;
    result.list = new Vector<>();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
        orderBy = "ENESTIMATEITEM.CODE";

    if(quantity < 0)
        quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
        "ENESTIMATEITEM.CODE"+

        ",ENESTIMATEITEM.COUNTGEN"+
        ",ENESTIMATEITEM.COUNTFACT"+

        //", ENPLANWORK.CODE " +
        ", ENESTIMATEITEM.PLANREFCODE " +

        ", sm.CODE " +
        ", sm.NAME " +

        ", tu.NAME  "+

        ", (select sum(f.quantity) from finmaterials f where f.estimateitemrefcode = ENESTIMATEITEM.CODE and f.statusrefcode = 1) as quantityFINMaterials " +

        " FROM ENESTIMATEITEM " +

        //", ENPLANWORK " +

        ", TKMATERIALS sm" +

        ",TKMEASUREMENT tu" +
        //" WHERE "
        "";

        //whereStr = " ENPLANWORK.CODE = ENESTIMATEITEM.PLANREFCODE" ; //+

        //whereStr = whereStr + " and tu.code = sm.MEASUREMENTCODE ";
    whereStr = whereStr + " tu.code = sm.MEASUREMENTCODE ";

        whereStr = whereStr +" AND sm.CODE = ENESTIMATEITEM.MATERIALREFCODE" ; //+

        whereStr = whereStr + " ";


        //selectStr = selectStr + " ${s} ENESTIMATEITEM.CODE IN ( SELECT ENESTIMATEITEM.CODE FROM ENESTIMATEITEM ";

    //" ";
        if(aFilterObject != null)
        {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.COUNTGEN = ?";
        }
        if(aFilterObject.countFact != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.COUNTFACT = ?";
        }
            if (aFilterObject.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
                else
                    whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
            }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
        }

        if(aFilterObject.deliveryTime != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.DELIVERYTIME = ?";
        }

        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.PLANREFCODE = ? ";
        }
        if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.TYPEREFCODE = ? ";
        }

        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.KINDREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
        }

        if(aFilterObject.accountingTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.ACCOUNTINGTYPEREFCODE = ? ";
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
            selectStr = selectStr + " WHERE" + whereStr;

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
            aFilterObject.countGen = aFilterObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.countFact != null){
            number++;
            aFilterObject.countFact = aFilterObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFact);
        }
            if (aFilterObject.commentGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
                else
                    whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

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
            }
            if (aFilterObject.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
                else
                    whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

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
            }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }

        if(aFilterObject.deliveryTime != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.deliveryTime);
        }


        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planRef.code);
        }
        if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planItemRef.code);
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.materialRef.code);
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.typeRef.code);
        }

        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.kindRef.code);
        }

        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.statusRef.code);
        }

        if(aFilterObject.accountingTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.accountingTypeRef.code);
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

        anObject = new ENEstimateItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.countGen = set.getBigDecimal(2);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

        anObject.countFact = set.getBigDecimal(3);
        if(anObject.countFact != null)
            anObject.countFact = anObject.countFact.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

        anObject.planRefCode = set.getInt(4);

        anObject.materialRefCode = set.getInt(5);

        anObject.materialRefName = set.getString(6);

        anObject.measureType = set.getString(7);

        anObject.quantityFINMaterials = set.getBigDecimal(8);
        if(anObject.quantityFINMaterials != null)
            anObject.quantityFINMaterials = anObject.quantityFINMaterials.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

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


    public ENEstimateItem2FinShortList getShortListWithFinMaterialsForFact(ENEstimateItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
    {
        return getShortListWithFinMaterialsForFact(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }

    public ENEstimateItem2FinShortList getShortListWithFinMaterialsForFact(ENEstimateItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector<Object> aBindObjects) throws PersistenceException
    {
        ENEstimateItem2FinShortList result = new ENEstimateItem2FinShortList();
        ENEstimateItem2FinShort anObject;
        result.list = new Vector<>();

        String     selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet  set = null;
        String     whereStr = "";
        String     condition = processCondition(anCondition);
        String     orderBy = processCondition(anOrderBy);

        if(orderBy.length() == 0)
            orderBy = "ENESTIMATEITEM.CODE";

        String groupBy =
            " ENESTIMATEITEM.CODE, " +
            " ENESTIMATEITEM.COUNTGEN, " +
            " ENESTIMATEITEM.COUNTFACT, " +
            " ENESTIMATEITEM.PLANREFCODE, " +
            " sm.CODE, " +
            " sm.NAME, " +
            " tu.NAME, " +
            " FINMATERIALS.MAT_ID, " +
            " FINMATERIALS.NN, " +
            " FINMATERIALS.MAT_NAME, " +
            " ENESTIMATEITEM.typerefcode ";


        if(quantity < 0)
            quantity = Integer.MAX_VALUE/2;

        if(getUserProfile() == null)
            throw new PersistenceException("Internal Error (User Profile Is Undefined)");

        selectStr =
        	" SELECT sub_info.* " +
        	"	, (	select count(ei.code)  from enestimateitem ei  , enplanworkitem pi , tkmaterials mm , tkelement2techcard eltk  \n " +
        	"		Where ei.code = sub_info.CODE \n " +
        	"		and ei.materialrefcode = mm.code \n " +
        	"		and pi.code = ei.planitemrefcode \n " +
        	"		and mm.elementcode=eltk.elementcode \n " +
        	"		and eltk.techkartcode=pi.kartarefcode \n " +
         	"		and eltk.isobligatory > 0 ) as isobligatory \n " +
        	" FROM " +
        	" ENESTIMATEITEM " +
        	" INNER JOIN " +
            " (SELECT ENESTIMATEITEM.CODE, " +
            "        ENESTIMATEITEM.COUNTGEN, " +
            "        ENESTIMATEITEM.COUNTFACT, " +
            "        ENESTIMATEITEM.PLANREFCODE, " +
            "        sm.CODE as tkmaterialcode, " +
            "        sm.NAME as tkmaterialname, " +
            "        tu.NAME as measurename, " +
            "        FINMATERIALS.MAT_ID, " +
            "        FINMATERIALS.NN, " +
            "        FINMATERIALS.MAT_NAME, " +
            ///// 30.01.2017 MDAX-441 Добавился коэф-т перевода ед. измерения из AX (FINMATERIALS.axfactor)
            /*
            "        sum(FINMATERIALS.QUANTITY) as quantity, " +
            "        (select sum(f.quantity) from finmaterials f " +
            "          where f.estimateitemrefcode = ENESTIMATEITEM.CODE " +
            "            and f.statusrefcode = 1) as quantityFINMaterials, " +
            */
    		" sum(cast(FINMATERIALS.QUANTITY / " +
    		"          (case " +
    		"            when coalesce(FINMATERIALS.axfactor, 0) > 0 then FINMATERIALS.axfactor " +
    		"            else 1 " +
    		"          end) " +
    		"     as numeric(15,6))) as quantity, " +
    		" (select sum(cast(f.quantity / " +
    		"                  (case " +
    		"                     when coalesce(f.axfactor, 0) > 0 then f.axfactor " +
    		"                     else 1 " +
    		"                   end) " +
    		"             as numeric(15,6))) " +
    		" from finmaterials f " +
    		" where f.estimateitemrefcode = ENESTIMATEITEM.CODE " +
    		" and f.statusrefcode = 1) as quantityFINMaterials, " +
    		/////
    		"        ENESTIMATEITEM.typerefcode " +
            "		, ENESTIMATEITEM.KINDREFCODE " +
            " FROM ENESTIMATEITEM " +
            "      left join finmaterials on (finmaterials.estimateitemrefcode = " +
            "       ENESTIMATEITEM.code and finmaterials.statusrefcode = " + FINMaterialsStatus.GOOD + ") " +
            "      inner join TKMATERIALS as sm on sm.code = ENESTIMATEITEM.MATERIALREFCODE " +
            "      inner join TKMEASUREMENT as tu on tu.code = sm.MEASUREMENTCODE " +
            " WHERE CASE WHEN finmaterials.code is null then not exists (select 1 from sccounter as co where co.estimateitemrefcode = ENESTIMATEITEM.CODE and co.statusrefcode <> " + SCCounterStatus.CANCELED + ") " +
                                                       " and not exists (select 1 from scseal as sc where sc.estimateitemrefcode = ENESTIMATEITEM.CODE /*and sc.statusrefcode <>  100*/ ) else 1 = 1 end " +
            " GROUP BY " + groupBy +
            " " +
            " UNION ALL " +
            " " +
            " SELECT " +
            " 		ENESTIMATEITEM.CODE " +
            " 		, ENESTIMATEITEM.COUNTGEN " +
            " 		, ENESTIMATEITEM.COUNTFACT " +
            " 		, ENESTIMATEITEM.PLANREFCODE " +
            " 		, TKMATERIALS.CODE as tkmaterialcode " +
            " 		, TKMATERIALS.NAME as tkmaterialname " +
            " 		, TKMEASUREMENT.NAME as measurename " +
            " 		, SCCOUNTER.SCCODE as mat_id " +
            " 		, SCCOUNTER.INVNUMBER as nn " +
            " 		, SCCOUNTER.NAME as mat_name " +
            " 		, 1 as quantity " +
            " 		, 1 as quantityFINMaterials " +
            "		, ENESTIMATEITEM.TYPEREFCODE " +
            "		, ENESTIMATEITEM.KINDREFCODE " +
            " FROM " +
            " 		ENESTIMATEITEM " +
            " 		INNER JOIN SCCOUNTER ON (SCCOUNTER.estimateitemrefcode = ENESTIMATEITEM.CODE AND SCCOUNTER.statusrefcode <> " + SCCounterStatus.CANCELED + ") " +
            " 		INNER JOIN TKMATERIALS ON TKMATERIALS.CODE = ENESTIMATEITEM.MATERIALREFCODE " +
            " 		INNER JOIN TKMEASUREMENT ON TKMATERIALS.MEASUREMENTCODE = TKMEASUREMENT.CODE" +

    		// 31.05.16 NET-4530 Добавились пломбы
    		" UNION ALL " +
    		" " +
    		" SELECT  " +
    		"       ENESTIMATEITEM.CODE " +
    		"       , ENESTIMATEITEM.COUNTGEN " +
    		"       , ENESTIMATEITEM.COUNTFACT " +
    		"       , ENESTIMATEITEM.PLANREFCODE " +
    		"       , TKMATERIALS.CODE as tkmaterialcode " +
    		"       , TKMATERIALS.NAME as tkmaterialname " +
    		"       , TKMEASUREMENT.NAME as measurename " +
    		"       , SCSEAL.SCCODE as mat_id " +
    		"       /*, SCSEAL.INVNUMBER as nn */ " +
    		"       , SCSEAL.buildnumber as nn " +
    		"       , SCSEAL.NAME as mat_name " +
    		"       , 1 as quantity " +
    		//"       , 1 as quantityFINMaterials " +
            "       , (select count(distinct s.code) from SCSEAL s " +
            "           where s.estimateitemrefcode = ENESTIMATEITEM.CODE " +
            "             /*and s.statusrefcode = 1*/) as quantityFINMaterials " +

    		"       , ENESTIMATEITEM.TYPEREFCODE " +
    		"       , ENESTIMATEITEM.KINDREFCODE " +
            " FROM " +
            " 		ENESTIMATEITEM " +
            " 		INNER JOIN SCSEAL ON (SCSEAL.estimateitemrefcode = ENESTIMATEITEM.CODE /*AND SCSEAL.statusrefcode <> 100*/) " +
            " 		INNER JOIN TKMATERIALS ON TKMATERIALS.CODE = ENESTIMATEITEM.MATERIALREFCODE " +
            " 		INNER JOIN TKMEASUREMENT ON TKMATERIALS.MEASUREMENTCODE = TKMEASUREMENT.CODE" +

            ") as sub_info ON ENESTIMATEITEM.CODE = sub_info.CODE";

            if(aFilterObject != null)
            {
            if(aFilterObject.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  sub_info.CODE = ?";
            }
            if(aFilterObject.countGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  sub_info.COUNTGEN = ?";
            }
            if(aFilterObject.countFact != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  sub_info.COUNTFACT = ?";
            }
                if (aFilterObject.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND ";
                    if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
                    else
                        whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
                }
            if(aFilterObject.dateEdit != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
            }

            if(aFilterObject.deliveryTime != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENESTIMATEITEM.DELIVERYTIME = ?";
            }

            if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "sub_info.PLANREFCODE = ? ";
            }
            if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
            }
            if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
            }
            if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "sub_info.TYPEREFCODE = ? ";
            }

            if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "sub_info.KINDREFCODE = ? ";
            }
            if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
            }

            if(aFilterObject.accountingTypeRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENESTIMATEITEM.ACCOUNTINGTYPEREFCODE = ? ";
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
                aFilterObject.countGen = aFilterObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,aFilterObject.countGen);
            }
            if(aFilterObject.countFact != null){
                number++;
                aFilterObject.countFact = aFilterObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(number,aFilterObject.countFact);
            }
                if (aFilterObject.commentGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
                    else
                        whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

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
                }
                if (aFilterObject.userGen != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
                    else
                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

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
                }
            if(aFilterObject.dateEdit != null){
                number++;
                statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
            }

            if(aFilterObject.deliveryTime != Integer.MIN_VALUE){
                number++;
                statement.setInt(number,aFilterObject.deliveryTime);
            }


            if(aFilterObject.modify_time != Long.MIN_VALUE){
                number++;
                if(aFilterObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(number,null);
                else
                    statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
            }
            if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.planRef.code);
            }
            if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.planItemRef.code);
            }
            if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.materialRef.code);
            }
            if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.typeRef.code);
            }

            if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.kindRef.code);
            }

            if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.statusRef.code);
            }

            if(aFilterObject.accountingTypeRef.code != Integer.MIN_VALUE) {
                number++;
                statement.setInt(number,aFilterObject.accountingTypeRef.code);
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

            anObject = new ENEstimateItem2FinShort();

            anObject.code = set.getInt(1);
            if ( set.wasNull() )
                anObject.code = Integer.MIN_VALUE;

            anObject.estimateCode = set.getInt(1);
            if ( set.wasNull() )
                anObject.estimateCode = Integer.MIN_VALUE;

            anObject.estimateCountGen = set.getBigDecimal(2);
            if(anObject.estimateCountGen != null)
                anObject.estimateCountGen = anObject.estimateCountGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

            anObject.estimateCountFact = set.getBigDecimal(3);
            if(anObject.estimateCountFact != null)
                anObject.estimateCountFact = anObject.estimateCountFact.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

            anObject.planRefCode = set.getInt(4);
            if ( set.wasNull() )
                anObject.planRefCode = Integer.MIN_VALUE;

            anObject.materialRefCode = set.getInt(5);

            anObject.materialRefName = set.getString(6);

            anObject.measureType = set.getString(7);

            anObject.mat_id = set.getInt(8);
            if ( set.wasNull() )
                anObject.mat_id = Integer.MIN_VALUE;

            anObject.nn = set.getString(9);

            anObject.mat_name = set.getString(10);

            anObject.quantity = set.getBigDecimal(11);
            if(anObject.quantity != null)
                anObject.quantity = anObject.quantity.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

            anObject.quantityFINMaterials = set.getBigDecimal(12);
            if(anObject.quantityFINMaterials != null)
                anObject.quantityFINMaterials = anObject.quantityFINMaterials.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

            anObject.estimateTypeRefCode = set.getInt(13);
            if ( set.wasNull() )
                anObject.estimateTypeRefCode = Integer.MIN_VALUE;


            anObject.isobligatory = set.getInt(15);
            if ( set.wasNull() )
                anObject.isobligatory = Integer.MIN_VALUE;

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


    public ENEstimateItemShortList getShortListForOSExpl(ENEstimateItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
        return getShortListForOSExpl(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }

    public ENEstimateItemShortList getShortListForOSExpl(ENEstimateItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector<Object> aBindObjects) throws PersistenceException
    {
    ENEstimateItemShortList result = new ENEstimateItemShortList();
    ENEstimateItemShort anObject;
    result.list = new Vector<>();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
        orderBy = "ENESTIMATEITEM.CODE";

    if(quantity < 0)
        quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
        "ENESTIMATEITEM.CODE"+

        ",ENESTIMATEITEM.COUNTFACT"+

        //", ENPLANWORK.CODE " +
        ", ENESTIMATEITEM.PLANREFCODE " +

        ", sm.CODE " +
        ", sm.NAME " +

        ", tu.NAME  "+

        " FROM ENESTIMATEITEM " +

        //", ENPLANWORK " +

        ", TKMATERIALS sm" +

        ",TKMEASUREMENT tu" +
        //" WHERE "
        "";

        //whereStr = " ENPLANWORK.CODE = ENESTIMATEITEM.PLANREFCODE" ; //+

        //whereStr = whereStr + " and tu.code = sm.MEASUREMENTCODE ";
    whereStr = whereStr + " tu.code = sm.MEASUREMENTCODE ";

        whereStr = whereStr +" AND sm.CODE = ENESTIMATEITEM.MATERIALREFCODE" ; //+

        whereStr = whereStr + " ";


        //selectStr = selectStr + " ${s} ENESTIMATEITEM.CODE IN ( SELECT ENESTIMATEITEM.CODE FROM ENESTIMATEITEM ";

    //" ";
        if(aFilterObject != null)
        {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.COUNTGEN = ?";
        }
        if(aFilterObject.countFact != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.COUNTFACT = ?";
        }
            if (aFilterObject.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
                else
                    whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
            }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
        }

        if(aFilterObject.deliveryTime != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.DELIVERYTIME = ?";
        }

        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.PLANREFCODE = ? ";
        }
        if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.TYPEREFCODE = ? ";
        }

        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.KINDREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
        }

        if(aFilterObject.accountingTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.ACCOUNTINGTYPEREFCODE = ? ";
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
            selectStr = selectStr + " WHERE" + whereStr;

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
            aFilterObject.countGen = aFilterObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.countFact != null){
            number++;
            aFilterObject.countFact = aFilterObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFact);
        }
            if (aFilterObject.commentGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
                else
                    whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

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
            }
            if (aFilterObject.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
                else
                    whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

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
            }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }

        if(aFilterObject.deliveryTime != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.deliveryTime);
        }


        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planRef.code);
        }
        if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planItemRef.code);
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.materialRef.code);
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.typeRef.code);
        }

        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.kindRef.code);
        }

        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.statusRef.code);
        }

        if(aFilterObject.accountingTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.accountingTypeRef.code);
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

        anObject = new ENEstimateItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.countFact = set.getBigDecimal(2);
        if(anObject.countFact != null)
            anObject.countFact = anObject.countFact.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

        anObject.planRefCode = set.getInt(3);

        anObject.materialRefCode = set.getInt(4);

        anObject.materialRefName = set.getString(5);

        anObject.measureType = set.getString(6);

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


    public ENEstimateItem2FinShortList getShortListForBindingCheck(ENEstimateItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
    {
        return getShortListForBindingCheck(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }

    public ENEstimateItem2FinShortList getShortListForBindingCheck(ENEstimateItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector<Object> aBindObjects) throws PersistenceException
    {
    ENEstimateItem2FinShortList result = new ENEstimateItem2FinShortList();
    ENEstimateItem2FinShort anObject;
    result.list = new Vector<>();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
        orderBy = "sm.name";

    String groupBy =
        " sm.CODE, " +
        " sm.NAME, " +
        " ENESTIMATEITEM.planitemrefcode ";

    if(quantity < 0)
        quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr =
        " SELECT sm.CODE as tkmaterialcode, " +
        "        sm.NAME, " +
        "        coalesce(sum(FINMATERIALS.QUANTITY), 0) as quantity, " +
        "        (select pi.kartarefcode from enplanworkitem pi where pi.code = ENESTIMATEITEM.planitemrefcode) as kartarefcode, " +
        "        (select tc.techkartnumber " +
        "         from enplanworkitem pi, tktechcard tc " +
        "          where pi.code = ENESTIMATEITEM.planitemrefcode " +
        "            and pi.kartarefcode = tc.code) as techkartnumber, " +
        "        (select tc.name " +
        "         from enplanworkitem pi, tktechcard tc " +
        "         where pi.code = ENESTIMATEITEM.planitemrefcode " +
        "           and pi.kartarefcode = tc.code) as techkartname " +
        " FROM ENESTIMATEITEM " +
        "      left join finmaterials on (finmaterials.estimateitemrefcode = " +
        "       ENESTIMATEITEM.code and finmaterials.statusrefcode = 1), " +
        "      TKMATERIALS sm ";

    whereStr = whereStr +" sm.CODE = ENESTIMATEITEM.MATERIALREFCODE " ; //+

    whereStr = whereStr + " ";


        //selectStr = selectStr + " ${s} ENESTIMATEITEM.CODE IN ( SELECT ENESTIMATEITEM.CODE FROM ENESTIMATEITEM ";

    //" ";
        if(aFilterObject != null)
        {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.COUNTGEN = ?";
        }
        if(aFilterObject.countFact != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.COUNTFACT = ?";
        }
            if (aFilterObject.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
                else
                    whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
            }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
        }

        if(aFilterObject.deliveryTime != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM.DELIVERYTIME = ?";
        }

        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.PLANREFCODE = ? ";
        }
        if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.TYPEREFCODE = ? ";
        }

        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.KINDREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
        }

        if(aFilterObject.accountingTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM.ACCOUNTINGTYPEREFCODE = ? ";
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
            selectStr = selectStr + " WHERE" + whereStr;

    // selectStr = selectStr + ") ";

    selectStr = selectStr + " GROUP BY " + groupBy;

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
            aFilterObject.countGen = aFilterObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.countFact != null){
            number++;
            aFilterObject.countFact = aFilterObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFact);
        }
            if (aFilterObject.commentGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
                else
                    whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

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
            }
            if (aFilterObject.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
                else
                    whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

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
            }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }

        if(aFilterObject.deliveryTime != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.deliveryTime);
        }


        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planRef.code);
        }
        if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planItemRef.code);
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.materialRef.code);
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.typeRef.code);
        }

        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.kindRef.code);
        }

        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.statusRef.code);
        }

        if(aFilterObject.accountingTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.accountingTypeRef.code);
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

        anObject = new ENEstimateItem2FinShort();
/*
        " SELECT sm.CODE as tkmaterialcode, " +
        "        sm.NAME, " +
        "        coalesce(sum(FINMATERIALS.QUANTITY), 0) as quantity, " +
        "        (select pi.kartarefcode from enplanworkitem pi where pi.code = ENESTIMATEITEM.planitemrefcode) as kartarefcode, " +
        "        (select tc.techkartnumber " +
        "         from enplanworkitem pi, tktechcard tc " +
        "          where pi.code = ENESTIMATEITEM.planitemrefcode " +
        "            and pi.kartarefcode = tc.code) as techkartnumber, " +
        "        (select tc.name " +
        "         from enplanworkitem pi, tktechcard tc " +
        "         where pi.code = ENESTIMATEITEM.planitemrefcode " +
        "           and pi.kartarefcode = tc.code) as techkartname " +
        " FROM ENESTIMATEITEM " +
        "      left join finmaterials on (finmaterials.estimateitemrefcode = " +
        "       ENESTIMATEITEM.code and finmaterials.statusrefcode = 1), " +
        "      TKMATERIALS sm ";
 */
        anObject.materialRefCode = set.getInt(1);
        anObject.materialRefName = set.getString(2);

        anObject.quantity = set.getBigDecimal(3);
        if(anObject.quantity != null)
            anObject.quantity = anObject.quantity.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

        anObject.kartaRefCode = set.getInt(4);
        if ( set.wasNull() )
            anObject.kartaRefCode = Integer.MIN_VALUE;
        anObject.kartaNum = set.getString(5);
        anObject.kartaRefName = set.getString(6);

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
     * Функция для поиска естимейтов с месячных планов будущего периода по енергосбыту , приход счетчиков
     *
     * **/
    public int[] getEstimateWithPlansFuturePeriod(ENEstimateItem eiObj) throws PersistenceException
    {
     Vector<Integer> result = new Vector<>();

     ENPlanWorkDAO pDAO = new ENPlanWorkDAO(getConnection(), getUserProfile());
   	 ENPlanWork pObj = pDAO.getObject(eiObj.planRef.code);

     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     selectStr = " select ei.code from " +
             " enplanwork p , enestimateitem ei " +
             " where p.code = ei.planrefcode " +
             " and to_date('01.'||p.monthgen||'.'||p.yeargen,'dd.mm.yyyy') >= to_date('01."+pObj.monthGen+"."+pObj.yearGen+"','dd.mm.yyyy') " +
             " and exists (select el.code from enelement el where el.code = p.elementrefcode and el.typerefcode = "+ENElementType.TY_BYT+" ) " +
             " and p.kindcode = " + ENPlanWorkKind.CURRENT +
             " and ei.statusrefcode = " + ENEstimateItemStatus.PLANNED +  /*zaplanovano*/
             " and ei.accountingtyperefcode = " + TKAccountingType.COUNTERS +   /*счетчики const*/
             " and ei.materialrefcode = " + eiObj.materialRef.code +  /*код материала с естимейта */
             " and p.typerefcode = " + pObj.typeRef.code +
             " and p.staterefcode = " + pObj.stateRef.code +
             " and p.formrefcode = " + pObj.formRef.code +
             " and p.departmentrefcode = " + pObj.departmentRef.code +
             " and p.budgetrefcode = " + pObj.budgetRef.code +
             " /* отсекаем мес планы на которые сделаны факты */ " +
             " and p.code not in ( select chp.planoldrefcode from enplancorrecthistory chp , enplancorrecthistory chf " +
             "        where chp.planoldrefcode = p.code " +
             "        and  chp.reasoncode = " + ENPlanCorrectReason.MOVE_TO_NPW +
             "        and chp.plannewrefcode = chf.planoldrefcode " +
             "        and chf.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT + " )  Order by p.datestart "  ;

 try
      {
       statement = connection.prepareStatement(selectStr);

       set = statement.executeQuery();
       while(set.next()) {
         result.add(new Integer(set.getInt(1)));
       }

       int[] array;

       array = new int[result.size()];
       for(int j = 0;j < result.size();j++)
        array[j] = ((Integer)result.get(j)).intValue();

       return array;
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


     } // end of getFilteredCodeArray

/**
 * по естимейтам вытягиваем кол-во на естимейте и кол-во которое должно быть учтено для закупки (если есть договор то не учитываем - пробуем так )
 * **/
    public ENEstimateItemShortList getScrollableFilteredListForPlanPurchase(ENEstimateItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
    {
     ENEstimateItemShortList result = new ENEstimateItemShortList();
     ENEstimateItemShort anObject;
     result.list = new Vector<>();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;


     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENESTIMATEITEM.CODE"+
      ",ENESTIMATEITEM.COUNTFACT"+
", (select p.elementrefcode from enplanwork p where p.code = enestimateitem.planrefcode  ) as elcode " +
//пробуем пока без анализа привязки к договорам " ,  case when contract_by_ei.estimateitemcode is not null then 0 else ENESTIMATEITEM.countfact end  as  COUNTPURCHASE " +
" ,ENESTIMATEITEM.COUNTFACT as COUNTPURCHASE  "+
" FROM ENESTIMATEITEM  \n"+
// пробуем пока без анализа привязки к договорам
//" left join \n"+
//" 	  ( \n"+
//" 	   select distinct estimateitemcode from ( \n"+
//" 	   select oi2ei.estimateitemcode from net.rqorderitem2enestimttm oi2ei  , rqorderitem oi \n"+
//" 	    where oi2ei.orderitemcode = oi.code \n"+
//" 	    and oi.findocid is not null \n"+
//"       and  oi2ei.estimateitemcode  " + aFilterObject.conditionSQL +
//" 	    union   \n"+
//" 	    select e2c.estimateitemcode from net.enestimateitem2contrct e2c  where e2c.estimateitemcode "+ aFilterObject.conditionSQL +
//" 	    ) as selc1 \n"+
//" 	  ) as contract_by_ei on (ENESTIMATEITEM.code = contract_by_ei.estimateitemcode )  "
" where ENESTIMATEITEM.CODE   " +   aFilterObject.conditionSQL ;


/*        if(condition.length() != 0)
       {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";

          whereStr = whereStr + " (" + condition + ")";
       }


      if(whereStr.length() != 0)
          selectStr = selectStr + " WHERE " + whereStr;*/




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
         if(aFilterObject.countFact != null){
             number++;
             aFilterObject.countFact = aFilterObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.countFact);
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
          if(aFilterObject.isUseVAT != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.isUseVAT);
          }
          if(aFilterObject.deliveryTime != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.deliveryTime);
          }
          if(aFilterObject.useWorkTime != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.useWorkTime);
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
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planRef.code);
        }
        if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planItemRef.code);
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.materialRef.code);
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.typeRef.code);
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.kindRef.code);
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.statusRef.code);
        }
        if(aFilterObject.oldStatusRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.oldStatusRef.code);
        }
        if(aFilterObject.accountingTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.accountingTypeRef.code);
        }
       }



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

         anObject = new ENEstimateItemShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;

         anObject.countFact = set.getBigDecimal(2);
         if(anObject.countFact != null)
             anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

         anObject.ecode = set.getInt(3);
         if ( set.wasNull() )
             anObject.ecode = Integer.MIN_VALUE;


         anObject.quantityFINMaterials = set.getBigDecimal(4); // countPurchase
         if(anObject.quantityFINMaterials != null)
             anObject.quantityFINMaterials = anObject.quantityFINMaterials.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

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

/**
     *  перечень естимейтов с учетом  связки естимейта к договорам enestimateitem2contrct
     *
     * */

    public ENEstimateItemShortList getDetailedEstimate2ContractList(ENEstimateItemFilter eFilter, ENPlanWorkFilter pFilter) throws PersistenceException
    {
      ENEstimateItemShortList result = new ENEstimateItemShortList();
      ENEstimateItemShort anObject;
      result.list = new Vector<>();

      String     selectStr;
      Connection connection = getConnection();
      PreparedStatement statement = null;
      ResultSet  set = null;
      String     whereStr = "";

      String     conditionE = eFilter.conditionSQL == null ? "" : eFilter.conditionSQL;
      String     conditionP = pFilter.conditionSQL == null ? "" : pFilter.conditionSQL;

      // String     orderBy = eFilter.orderBySQL == null ? "" : eFilter.orderBySQL; //processCondition(anOrderBy);
      String     orderBy = "ENESTIMATEITEM.CODE ";

      if(orderBy.length() == 0)
          orderBy = "ENESTIMATEITEM.CODE";

      //if(quantity < 0)
      int quantity = Integer.MAX_VALUE/2;
      int fromPosition = 0;
      if(getUserProfile() == null)
          throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      selectStr = "SELECT "+
          "ENESTIMATEITEM.CODE"+
          ",ENESTIMATEITEM.COUNTGEN"+
          ",ENESTIMATEITEM.COUNTFACT"+
          ",ENESTIMATEITEM.USERGEN"+
          ",ENESTIMATEITEM.DATEEDIT"+

          ", ENPLANWORK.CODE " +
          ", ENPLANWORK.DATEGEN " +
          ", ENPLANWORK.USERGEN " +
          ", ENPLANWORK.DATEEDIT " +
          ", (select ENPLANWORKITEM.CODE from ENPLANWORKITEM where ENPLANWORKITEM.CODE =  ENESTIMATEITEM.planitemrefcode ) as ENPLANWORKITEMCODE " +
          ", (select ENPLANWORKITEM.COUNTGEN from ENPLANWORKITEM where ENPLANWORKITEM.CODE =  ENESTIMATEITEM.planitemrefcode ) as ENPLANWORKITEMCOUNTGEN " +
          ", (select ENPLANWORKITEM.USERGEN from ENPLANWORKITEM where ENPLANWORKITEM.CODE =  ENESTIMATEITEM.planitemrefcode ) as ENPLANWORKITEMUSERGEN " +
          ", (select ENPLANWORKITEM.DATEEDIT from ENPLANWORKITEM where ENPLANWORKITEM.CODE =  ENESTIMATEITEM.planitemrefcode ) as ENPLANWORKITEMDATEEDIT " +
          ", sm.CODE " +
          ", sm.NAME " +
          ", ENESTIMATEITEMTYPE.CODE " +
          ", ENESTIMATEITEMTYPE.NAME " +
          ", tu.NAME  "+
      //   ", kr.id, kr.NUM, kr.OPISANIE " +
      ", (select  TKTECHCARD.code from TKTECHCARD where TKTECHCARD.code = (select ENPLANWORKITEM.kartarefcode from ENPLANWORKITEM where ENPLANWORKITEM.CODE =  ENESTIMATEITEM.planitemrefcode )  ) as TKTECHCARDCODE "+
      ", (select  TKTECHCARD.techkartnumber from TKTECHCARD where TKTECHCARD.code = (select ENPLANWORKITEM.kartarefcode from ENPLANWORKITEM where ENPLANWORKITEM.CODE =  ENESTIMATEITEM.planitemrefcode )  ) as TKTECHCARDtechkartnumber "+
      ", (select  TKTECHCARD.name from TKTECHCARD where TKTECHCARD.code = (select ENPLANWORKITEM.kartarefcode from ENPLANWORKITEM where ENPLANWORKITEM.CODE =  ENESTIMATEITEM.planitemrefcode )  ) as TKTECHCARDname "+

          /*

          ", (select kr.code from TKTECHCARD kr , ENPLANWORKITEM pi where  kr.code = pi.kartarefcode "+
          "  and pi.code = enestimateitem.planitemrefcode ) "+
          ",(select kr.techkartnumber from TKTECHCARD kr , ENPLANWORKITEM pi where  kr.code = pi.kartarefcode "+
          "          and pi.code = enestimateitem.planitemrefcode ) "+
          ",(select kr.name from TKTECHCARD kr , ENPLANWORKITEM pi where  kr.code = pi.kartarefcode "+
          "          and pi.code = enestimateitem.planitemrefcode ) "+
      */
          ", ENESTIMATEITEMKIND.CODE " +
          ", ENESTIMATEITEMKIND.NAME " +

          ", ENESTIMATEITEM.STATUSREFCODE "+
          ", ENESTIMATEITEMSTATUS.NAME " +

          ", (select count(f.code) from finmaterials f where f.estimateitemrefcode = ENESTIMATEITEM.CODE and f.statusrefcode = 1) as countFINMaterials " +

          ", (select invnumber||coalesce(' (дог.№'||ENPLANWORK.PRICONNECTIONNUMBER||')', '') from enelementdata where ecode = enplanwork.elementrefcode ) as invnumber " +
          ", (select ename from enelementdata where ecode = enplanwork.elementrefcode ) as ename " +
          ", enplanwork.elementrefcode " +

          //",  enelementdata.invnumber||coalesce(' (дог.№'||ENPLANWORK.PRICONNECTIONNUMBER||')', ''),  enelementdata.ename,  enelementdata.ecode" +

          ", enplanworktype.name, enplanworkstate.name "+

          ", ENPLANWORK.YEARGEN " +
          ", ENPLANWORK.MONTHGEN " +

          ", ENPLANWORK.DATESTART, ENPLANWORK.DATEFINAL " +

          ", ENPLANWORK.DEPARTMENTREFCODE " +
          ", ENDEPARTMENT.NAME " +


           ", enplanwork.budgetrefcode " +   // 38
           ", (select '213400'::numeric from enpurchasesobject s " +
          "    where s.elementcode = enplanwork.elementrefcode " +
          "      and s.purchasesreasoncode = " + ENPurchasesObjectReason.PURCHASES_AVZ + ") " +

          ", enplanwork.statuscode " +

          " , enestimateitem2contrct.rqpurchitm2estimatecod  " +

          "  , ( select distinct net.get_purchase_name_by_purchaseitemcode(pi2ei.purchaseitemrefcode::integer) " +
			" from enestimateitem2contrct ei2ctrct  ,  rqpurchaseitem2estmttm pi2ei " +
			 " where ei2ctrct.rqpurchitm2estimatecod = pi2ei.code " +
			 " and ei2ctrct.code =  enestimateitem2contrct.code ) as purchaseInfoByOrderItem " +

		" , (select o.numberdoc || ' від ' || to_char(o.dategen,'dd.mm.yyyy') || ' код ДДС=' || coalesce(dds.txtcode ,'') || ' Бюджетотримач=' || budg.shortname  \n" +
		" from rqorderitem2enestimttm oi2ei , rqorderitem oi   \n" +
		" left join rqddscodes dds on (dds.code = oi.ddscodescode)   \n" +
		" left join endepartment budg on (oi.budgetrefcode = budg.code)  \n" +
		" ,  rqorder o   \n" +
		" where oi2ei.estimateitemcode = ENESTIMATEITEM.CODE  \n" +
		" and oi2ei.orderitemcode = oi.code  \n" +
		" and oi.orderrefcode = o.code ) as order_info   \n" +

       ", ENESTIMATEITEM.PURCHASEITEMREFCODE as RQPURCHASEITEMCODE " +

          " FROM ENESTIMATEITEM " +

      //    "left join ENPLANWORKITEM on ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE " +

      //  " left join TEHKART._ARTI kr on kr.id = ENPLANWORKITEM.kartarefcode " +

      //    " left join TKTECHCARD kr on kr.code = ENPLANWORKITEM.kartarefcode " +
          ", ENPLANWORK " +
          //", ENPLANWORKITEM " +
          ", TKMATERIALS sm" +
      //  ", REPIMPORT.TMESURE_UNIT tu" +
          ",TKMEASUREMENT tu" +
          ", ENESTIMATEITEMTYPE " +
          ", ENESTIMATEITEMKIND " +
          ", ENESTIMATEITEMSTATUS " +
          // перенести ...
          //", enelementdata  " +
          ", enplanworktype, enplanworkstate " +

          " , ENDEPARTMENT " +
          " , enestimateitem2contrct " +
          //" WHERE "
          "";

          whereStr = " ENPLANWORK.CODE = ENESTIMATEITEM.PLANREFCODE" ; //+

          whereStr = whereStr + " and tu.code = sm.MEASUREMENTCODE ";

          whereStr = whereStr + " and enestimateitem2contrct.estimateitemcode = ENESTIMATEITEM.CODE ";

          //whereStr = whereStr +" AND ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE" ; //+

          whereStr = whereStr +" AND sm.CODE = ENESTIMATEITEM.MATERIALREFCODE" ; //+

          whereStr = whereStr + " ";

          whereStr = whereStr +" AND ENESTIMATEITEMTYPE.CODE = ENESTIMATEITEM.TYPEREFCODE" ; //+

          whereStr = whereStr +" AND ENESTIMATEITEMKIND.CODE = ENESTIMATEITEM.KINDREFCODE" ; //+

          whereStr = whereStr +" AND ENESTIMATEITEMSTATUS.CODE = ENESTIMATEITEM.STATUSREFCODE ";

          whereStr = whereStr +" AND ENESTIMATEITEM.COUNTFACT <> 0 ";

          //whereStr = whereStr +" AND ENESTIMATEITEM.statusrefcode  in ("+ ENEstimateItemStatus.PLANNED + ", " + ENEstimateItemStatus.TEMP +") ";

          // чуть шо перенести в другой метод ...
          whereStr = whereStr +" and enplanworktype.code = enplanwork.typerefcode and enplanworkstate.code = enplanwork.staterefcode";
          //whereStr = whereStr +" and enplanwork.elementrefcode = enelementdata.ecode ";
          whereStr = whereStr + " AND ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE ";

          whereStr = whereStr +" and enplanwork.statuscode not in (2, 6) ";


          if (pFilter.kind != null && pFilter.kind.code == ENPlanWorkKind.SALE_SPECIFICATION) {
              whereStr = whereStr + " and enplanwork.kindcode = " + ENPlanWorkKind.SALE_SPECIFICATION;
          } else {
              whereStr = whereStr + " and enplanwork.kindcode = " + ENPlanWorkKind.CURRENT;
          }


          //selectStr = selectStr + " ${s} ENESTIMATEITEM.CODE IN ( SELECT ENESTIMATEITEM.CODE FROM ENESTIMATEITEM ";

//      " ";
          if(eFilter != null)
          {
          if(eFilter.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENESTIMATEITEM.CODE = ?";
          }
          if(eFilter.countGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENESTIMATEITEM.COUNTGEN = ?";
          }
          if(eFilter.countFact != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENESTIMATEITEM.COUNTFACT = ?";
          }
              if (eFilter.userGen != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND ";
                  if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
                      whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
                  else
                      whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
              }
          if(eFilter.dateEdit != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
          }
          if(eFilter.planRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENESTIMATEITEM.PLANREFCODE = ? ";
          }
          if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
          }
          if(eFilter.materialRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
          }
          if(eFilter.typeRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENESTIMATEITEM.TYPEREFCODE = ? ";
          }

          if(eFilter.kindRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENESTIMATEITEM.KINDREFCODE = ? ";
          }
          if(eFilter.statusRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
          }
          }


          if(pFilter != null)
          {
          /*
          if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANWORK.DEPARTMENTREFCODE = ?";
          }

          if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANWORK.BUDGETREFCODE = ?";
          }
          if(pFilter.yearGen != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
          }

          if(pFilter.monthGen != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
          }

          if(pFilter.formRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANWORK.FORMREFCODE = ?";
          }

          // НАХ так делать ... передаем фильтр  и не обрабатываем ЕГО !!!
          if (pFilter.elementRef.code != Integer.MIN_VALUE){
              if (whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              whereStr = whereStr + " ENPLANWORK.ELEMENTREFCODE = ?";
          }
             */

          /////////////////////////////////////////////////////////////////////////////////////
              if(pFilter.code != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  ENPLANWORK.CODE = ?";
              }
              if(pFilter.dateGen != null) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
              }
              if(pFilter.dateStart != null) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
              }
              if(pFilter.dateFinal != null) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
              }
              if(pFilter.yearGen != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
              }
              if(pFilter.monthGen != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
              }
              if (pFilter.commentGen != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND ";
                  if (pFilter.commentGen.indexOf('*',0) < 0 && pFilter.commentGen.indexOf('?',0) < 0)
                      whereStr = whereStr + "  ENPLANWORK.COMMENTGEN = ?";
                  else
                      whereStr = whereStr + "  ENPLANWORK.COMMENTGEN LIKE ?";
              }
              if (pFilter.userGen != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND ";
                  if (pFilter.userGen.indexOf('*',0) < 0 && pFilter.userGen.indexOf('?',0) < 0)
                      whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
                  else
                      whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
              }
              if(pFilter.dateEdit != null) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
              }
              if(pFilter.distanceAlong != null) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  ENPLANWORK.DISTANCEALONG = ?";
              }
              if(pFilter.distanceTo != null) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  ENPLANWORK.DISTANCETO = ?";
              }
              if (pFilter.workOrderNumber != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND ";
                  if (pFilter.workOrderNumber.indexOf('*',0) < 0 && pFilter.workOrderNumber.indexOf('?',0) < 0)
                      whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER = ?";
                  else
                      whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER LIKE ?";
              }
              if(pFilter.dateWorkOrder != null) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  ENPLANWORK.DATEWORKORDER = ?";
              }
              if (pFilter.priConnectionNumber != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND ";
                  if (pFilter.priConnectionNumber.indexOf('*',0) < 0 && pFilter.priConnectionNumber.indexOf('?',0) < 0)
                      whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER = ?";
                  else
                      whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";
              }

              if(pFilter.modify_time != Long.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + "  ENPLANWORK.MODIFY_TIME = ?";
              }
              if(pFilter.status.code != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + " ENPLANWORK.STATUSCODE = ? ";
              }
              if(pFilter.elementRef.code != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + " ENPLANWORK.ELEMENTREFCODE = ? ";
              }
              if(pFilter.typeRef.code != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
              }
              if(pFilter.kind.code != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + " ENPLANWORK.KINDCODE = ? ";
              }
              if(pFilter.renRef.code != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + " ENPLANWORK.RENREFCODE = ? ";
              }
              if(pFilter.finExecutor.code != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + " ENPLANWORK.FINEXECUTORCODE = ? ";
              }
              if(pFilter.stateRef.code != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
              }
              if(pFilter.formRef.code != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + " ENPLANWORK.FORMREFCODE = ? ";
              }
              if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + " ENPLANWORK.BUDGETREFCODE = ? ";
              }
              if(pFilter.responsibilityRef.code != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + " ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
              }
              if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
                  if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                  whereStr = whereStr + " ENPLANWORK.DEPARTMENTREFCODE = ? ";
              }
          /////////////////////////////////////////////////////////////////////////////////////
          }


          if(conditionE.length() != 0)
          {
              if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";

              whereStr = whereStr + " (" + conditionE + ")";
          }

          if(conditionP.length() != 0)
          {
              if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";

              whereStr = whereStr + " (" + conditionP + ")";
          }

//      + " WHERE" +  сделано выше ????
          if(whereStr.length() != 0)
              selectStr = selectStr + " WHERE" + whereStr;

      // selectStr = selectStr + ") ";

      selectStr = selectStr + " ORDER BY " + orderBy;

      try
          {
          statement = connection.prepareStatement(selectStr);
          int number = 0;
          if(eFilter != null){
              if(eFilter.code != Integer.MIN_VALUE){
                  number++;
                  statement.setInt(number,eFilter.code);
              }
          if(eFilter.countGen != null){
              number++;
              eFilter.countGen = eFilter.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,eFilter.countGen);
          }
          if(eFilter.countFact != null){
              number++;
              eFilter.countFact = eFilter.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,eFilter.countFact);
          }
              if (eFilter.commentGen != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND";
                  if (eFilter.commentGen.indexOf('*',0) < 0 && eFilter.commentGen.indexOf('?',0) < 0)
                      whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
                  else
                      whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

              if(eFilter.commentGen != null){
                  number++;
                  StringBuffer likeStr = new StringBuffer();
                  likeStr.append(eFilter.commentGen);
                  for(int i = 0;i < likeStr.length();i++){
                      if(likeStr.charAt(i) == '*')
                              likeStr.setCharAt(i,'%');
                      if(likeStr.charAt(i) == '?')
                              likeStr.setCharAt(i,'_');
                  }
                  statement.setString(number,likeStr.toString());
              }
              }
              if (eFilter.userGen != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND";
                  if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
                      whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
                  else
                      whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

              if(eFilter.userGen != null){
                  number++;
                  StringBuffer likeStr = new StringBuffer();
                  likeStr.append(eFilter.userGen);
                  for(int i = 0;i < likeStr.length();i++){
                      if(likeStr.charAt(i) == '*')
                              likeStr.setCharAt(i,'%');
                      if(likeStr.charAt(i) == '?')
                              likeStr.setCharAt(i,'_');
                  }
                  statement.setString(number,likeStr.toString());
              }
              }
          if(eFilter.dateEdit != null){
              number++;
              statement.setDate(number,new java.sql.Date(eFilter.dateEdit.getTime()));
          }


          if(eFilter.modify_time != Long.MIN_VALUE){
              number++;
              if(eFilter.modify_time == Long.MIN_VALUE)
                  statement.setBigDecimal(number,null);
              else
                  statement.setBigDecimal(number,new java.math.BigDecimal(eFilter.modify_time));
          }
          if(eFilter.planRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,eFilter.planRef.code);
          }
          if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,eFilter.planItemRef.code);
          }
          if(eFilter.materialRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,eFilter.materialRef.code);
          }
          if(eFilter.typeRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,eFilter.typeRef.code);
          }

          if(eFilter.kindRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,eFilter.kindRef.code);
          }

          if(eFilter.statusRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,eFilter.statusRef.code);
          }
          }


          if(pFilter != null)
          {
          /*
          if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,pFilter.departmentRef.code);           }

          if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,pFilter.budgetRef.code);
          }
          if(pFilter.yearGen != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,pFilter.yearGen);
          }

          if(pFilter.monthGen != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,pFilter.monthGen);
          }
          if(pFilter.formRef.code != Integer.MIN_VALUE) {
                  number++;
                  statement.setInt(number,pFilter.formRef.code);
          }

          if (pFilter.elementRef.code != Integer.MIN_VALUE){
              number++;
              statement.setInt(number, pFilter.elementRef.code);
          }
          */

          //////////////////////////////////////////////////////////
              if(pFilter.code != Integer.MIN_VALUE){
                  number++;
                  statement.setInt(number,pFilter.code);
              }
              if(pFilter.dateGen != null){
                  number++;
                  statement.setDate(number,new java.sql.Date(pFilter.dateGen.getTime()));
              }
              if(pFilter.dateStart != null){
                  number++;
                  statement.setDate(number,new java.sql.Date(pFilter.dateStart.getTime()));
              }
              if(pFilter.dateFinal != null){
                  number++;
                  statement.setDate(number,new java.sql.Date(pFilter.dateFinal.getTime()));
              }
              if(pFilter.yearGen != Integer.MIN_VALUE){
                  number++;
                  statement.setInt(number,pFilter.yearGen);
              }
              if(pFilter.monthGen != Integer.MIN_VALUE){
                  number++;
                  statement.setInt(number,pFilter.monthGen);
              }
              if (pFilter.commentGen != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND";
                  if (pFilter.commentGen.indexOf('*',0) < 0 && pFilter.commentGen.indexOf('?',0) < 0)
                      whereStr = whereStr + " ENPLANWORK.COMMENTGEN = ?";
                  else
                      whereStr = whereStr + " ENPLANWORK.COMMENTGEN LIKE ?";

              if(pFilter.commentGen != null){
                  number++;
                  StringBuffer likeStr = new StringBuffer();
                  likeStr.append(pFilter.commentGen);
                  for(int i = 0;i < likeStr.length();i++){
                          if(likeStr.charAt(i) == '*')
                              likeStr.setCharAt(i,'%');
                          if(likeStr.charAt(i) == '?')
                              likeStr.setCharAt(i,'_');
                  }
                  statement.setString(number,likeStr.toString());
              }
              }
              if (pFilter.userGen != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND";
                  if (pFilter.userGen.indexOf('*',0) < 0 && pFilter.userGen.indexOf('?',0) < 0)
                      whereStr = whereStr + " ENPLANWORK.USERGEN = ?";
                  else
                      whereStr = whereStr + " ENPLANWORK.USERGEN LIKE ?";

              if(pFilter.userGen != null){
                  number++;
                  StringBuffer likeStr = new StringBuffer();
                  likeStr.append(pFilter.userGen);
                  for(int i = 0;i < likeStr.length();i++){
                          if(likeStr.charAt(i) == '*')
                              likeStr.setCharAt(i,'%');
                          if(likeStr.charAt(i) == '?')
                              likeStr.setCharAt(i,'_');
                  }
                  statement.setString(number,likeStr.toString());
              }
              }
              if(pFilter.dateEdit != null){
                  number++;
                  statement.setDate(number,new java.sql.Date(pFilter.dateEdit.getTime()));
              }
              if(pFilter.distanceAlong != null){
                  number++;
                  pFilter.distanceAlong = pFilter.distanceAlong.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                  statement.setBigDecimal(number,pFilter.distanceAlong);
              }
              if(pFilter.distanceTo != null){
                  number++;
                  pFilter.distanceTo = pFilter.distanceTo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                  statement.setBigDecimal(number,pFilter.distanceTo);
              }
              if (pFilter.workOrderNumber != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND";
                  if (pFilter.workOrderNumber.indexOf('*',0) < 0 && pFilter.workOrderNumber.indexOf('?',0) < 0)
                      whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER = ?";
                  else
                      whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER LIKE ?";

              if(pFilter.workOrderNumber != null){
                  number++;
                  StringBuffer likeStr = new StringBuffer();
                  likeStr.append(pFilter.workOrderNumber);
                  for(int i = 0;i < likeStr.length();i++){
                          if(likeStr.charAt(i) == '*')
                              likeStr.setCharAt(i,'%');
                          if(likeStr.charAt(i) == '?')
                              likeStr.setCharAt(i,'_');
                  }
                  statement.setString(number,likeStr.toString());
              }
              }
              if(pFilter.dateWorkOrder != null){
                  number++;
                  statement.setDate(number,new java.sql.Date(pFilter.dateWorkOrder.getTime()));
              }
              if (pFilter.priConnectionNumber != null) {
                  if(whereStr.length() != 0)
                      whereStr = whereStr + " AND";
                  if (pFilter.priConnectionNumber.indexOf('*',0) < 0 && pFilter.priConnectionNumber.indexOf('?',0) < 0)
                      whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER = ?";
                  else
                      whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";

              if(pFilter.priConnectionNumber != null){
                  number++;
                  StringBuffer likeStr = new StringBuffer();
                  likeStr.append(pFilter.priConnectionNumber);
                  for(int i = 0;i < likeStr.length();i++){
                          if(likeStr.charAt(i) == '*')
                              likeStr.setCharAt(i,'%');
                          if(likeStr.charAt(i) == '?')
                              likeStr.setCharAt(i,'_');
                  }
                  statement.setString(number,likeStr.toString());
              }
              }

              if(pFilter.modify_time != Long.MIN_VALUE){
                  number++;
                  if(pFilter.modify_time == Long.MIN_VALUE)
                      statement.setBigDecimal(number,null);
                  else
                      statement.setBigDecimal(number,new java.math.BigDecimal(pFilter.modify_time));
              }
          if(pFilter.status.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,pFilter.status.code);
          }
          if(pFilter.elementRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,pFilter.elementRef.code);
          }
          if(pFilter.typeRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,pFilter.typeRef.code);
          }
          if(pFilter.kind.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,pFilter.kind.code);
          }
          if(pFilter.renRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,pFilter.renRef.code);
          }
          if(pFilter.finExecutor.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,pFilter.finExecutor.code);
          }
          if(pFilter.stateRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,pFilter.stateRef.code);
          }
          if(pFilter.formRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,pFilter.formRef.code);
          }
          if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,pFilter.budgetRef.code);
          }
          if(pFilter.responsibilityRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,pFilter.responsibilityRef.code);
          }
          if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
              number++;
              statement.setInt(number,pFilter.departmentRef.code);
          }
          //////////////////////////////////////////////////////////
          }


          //if(condition.length() > 0 && aBindObjects != null)
          // _bindObjectsToPreparedStatement(statement,aBindObjects,number);

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

          anObject = new ENEstimateItemShort();

          anObject.code = set.getInt(1);
          if ( set.wasNull() )
              anObject.code = Integer.MIN_VALUE;
          anObject.countGen = set.getBigDecimal(2);
          if(anObject.countGen != null)
              anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.countFact = set.getBigDecimal(3);
          if(anObject.countFact != null)
              anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.userGen = set.getString(4);
          anObject.dateEdit = set.getDate(5);


          anObject.planRefCode = set.getInt(6);

          anObject.planRefDateGen = set.getDate(7);

          anObject.planRefUserGen = set.getString(8);

          anObject.planRefDateEdit = set.getDate(9);

          anObject.planItemRefCode = set.getInt(10);
          if (set.wasNull())
              anObject.planItemRefCode = Integer.MIN_VALUE;

          anObject.planItemRefCountGen = set.getBigDecimal(11);
          if(anObject.planItemRefCountGen != null)
              anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

          anObject.planItemRefUserGen = set.getString(12);

          anObject.planItemRefDateEdit = set.getDate(13);

          anObject.materialRefCode = set.getInt(14);

          anObject.materialRefName = set.getString(15);

          anObject.typeRefCode = set.getInt(16);

          anObject.typeRefName = set.getString(17);

          anObject.measureType = set.getString(18);

          anObject.kartaRefCode = set.getInt(19);
          anObject.kartaNum = set.getString(20);
          anObject.kartaRefName = set.getString(21);

          anObject.kindRefCode = set.getInt(22);
          anObject.kindRefName = set.getString(23);

          anObject.statusRefCode = set.getInt(24);
          anObject.statusRefName = set.getString(25);

          anObject.countFINMaterials = set.getInt(26);
          if ( set.wasNull() )
              anObject.countFINMaterials = Integer.MIN_VALUE;

          //",  enelementdata.invnumber,  enelementdata.ename,  enelementdata.ecode, enplanworktype.name, enplanworkstate.name "+
          anObject.invNumber = set.getString(27);
          anObject.elementName = set.getString(28);
          anObject.ecode = set.getInt(29);
          if ( set.wasNull() )
              anObject.ecode = Integer.MIN_VALUE;
          anObject.planType = set.getString(30);
          anObject.planState = set.getString(31);

          anObject.planRefYearGen = set.getInt(32);
          if ( set.wasNull() )
              anObject.planRefYearGen = Integer.MIN_VALUE;

          anObject.planRefMonthGen = set.getInt(33);
          if ( set.wasNull() )
              anObject.planRefMonthGen = Integer.MIN_VALUE;

          anObject.planRefDateStart = set.getDate(34);
          anObject.planRefDateFinal = set.getDate(35);

          anObject.planRefDepartmentCode = set.getInt(36);
          if (set.wasNull())
              anObject.planRefDepartmentCode = Integer.MIN_VALUE;

          anObject.planRefDepartmentName = set.getString(37);


          anObject.budgetRefCode = set.getInt(38);
          if ( set.wasNull() )
              anObject.budgetRefCode = Integer.MIN_VALUE;

          anObject.ddsCodeAvz = set.getInt(39);
          if (set.wasNull())
              anObject.ddsCodeAvz = Integer.MIN_VALUE;

          anObject.planRefStatusCode = set.getInt(40);
          if (set.wasNull())
          	anObject.planRefStatusCode = Integer.MIN_VALUE;


          anObject.purchaseItem2EstimateitemCode = set.getInt("rqpurchitm2estimatecod");
          if (set.wasNull())
            	anObject.purchaseItem2EstimateitemCode = Integer.MIN_VALUE;


          anObject.purchaseInfoByOrderItem = set.getString("purchaseInfoByOrderItem");

          anObject.orderNumber = set.getString("order_info");

          anObject.purchaseItemRefCode = set.getInt("RQPURCHASEITEMCODE");
			if(set.wasNull()) {
				anObject.purchaseItemRefCode = Integer.MIN_VALUE;
			}

			System.out.print(" getDetailedEstimate2ContractList return rownum = " + i+1);
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
	 * по естимейту находит в какой строке плана закупок он сидиит и по всем другим естимейтам из этого плана закупок выбираем дистиктом объекты
	 * **/
	    public ENEstimateItemShortList selectENObjectCodeNamesByAllEstimateExceptThisEstimate(int eiCode) throws PersistenceException
	    {
	     ENEstimateItemShortList result = new ENEstimateItemShortList();
	     ENEstimateItemShort anObject;
	     result.list = new Vector<>();

	     String     selectStr;
	     Connection connection = getConnection();
	     PreparedStatement statement = null;
	     ResultSet  set = null;

	     if(getUserProfile() == null)
	      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	     selectStr = " select string_agg(distinct ecode::text ,',') as objectcodes , string_agg(distinct coalesce(ename,'') || ' инв№ ' ||coalesce(invnumber,'') ,' ;') as objectnames \n" +
	    		 "  from enestimateitem ei , enplanwork pw , enelementdata eld  \n" +
	    		 " where ei.planrefcode = pw.code \n" +
	    		 " and pw.elementrefcode = eld.ecode \n" +
	    		 " and ei.code in \n" +
	    		 " ( select pi2ei2.estimateitemrefcode from rqpurchaseitem2estmttm pi2ei2 where pi2ei2.purchaseitemrefcode in \n" +
	    		 " ( select pi2ei.purchaseitemrefcode from rqpurchaseitem2estmttm pi2ei where pi2ei.estimateitemrefcode = "+eiCode+"  ) \n" +
	    		 " ) \n" +
	    		 " and ei.code not in ("+eiCode+") ";

	     try
	      {
	       statement = connection.prepareStatement(selectStr);

	       set = statement.executeQuery();
	       int i;
	       for(i = 0;set.next();i++)
	        {

	         anObject = new ENEstimateItemShort();

	         anObject.materialRefName = set.getString("objectcodes");
	         anObject.elementName = set.getString("objectnames");

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


	 /**
	  * Апдейт статуса естимейтов по строке заявки
	  *
	  * */
	    public void changeStatusItemsByOrderItemCodeForChangeStatusOrderItem(int oiCode , int statusCode)
	            throws PersistenceException {
	        Connection connection = getConnection();

	        if(oiCode == Integer.MIN_VALUE ) {
	        	throw new EnergyproSystemException(" Неможливо встановити статус матеріалів у планах... changeStatusItemsByOrderItemCode oiCode is null ");
	        }

	        String changeStatus =
	                " update enestimateitem set statusrefcode = " + statusCode + ", usergen ='" + getUserProfile().userName + "'" +
	                " where code in ( select qqq.estimateitemcode from rqorderitem2enestimttm qqq where qqq.orderitemcode = "+oiCode+" ) " ;

	        PreparedStatement statement = null;

	        try {
	            statement = connection.prepareStatement(changeStatus);
	            statement.execute();
	        } catch (SQLException e) {
	            System.out.println(e.getMessage() + "\n statement - " + changeStatus );
	            EnergyproPersistenceExceptionAnalyzer.analyser
	                    .throwPersistenceException(e);
	        } finally {
	            try {
	                if (statement != null)
	                    statement.close();
	            } catch (SQLException e) {
	            }
	            statement = null;
	        }
	    }

	    /**
		 * Сброс привязки на естимейтах привязки к строке плана закупок , по коду строки плана закупок   */
	    /*public void resetOnEnEstimateitemPurchaseItemCodeByENestimateCode (int eiCode) throws PersistenceException {


	        Connection connection = getConnection();

	        if (eiCode == Integer.MIN_VALUE){
	        	 throw new EnergyproSystemException(" Помилка видаленні відношення матеріалу до строки плану закупівлі!!!");
	        }

	        String sql = " update enestimateitem set  purchaseitemrefcode = null where enestimateitem.code =  " + eiCode  ;

	        PreparedStatement statement = null;

	        try {
	            statement = connection.prepareStatement(sql);
	            statement.execute();
	        } catch (SQLException e) {
	            System.out.println(e.getMessage() + "\n statement - " + sql
	                    + "\n estimateCode = " + eiCode);
	            EnergyproPersistenceExceptionAnalyzer.analyser
	                    .throwPersistenceException(e);
	        } finally {
	            try {
	                if (statement != null)
	                    statement.close();
	            } catch (SQLException e) {
	            }
	            statement = null;
	        }
	    }*/

	    public ENEstimateItemShort[] getDetailedESListForLink2Contract(
	            ENEstimateItemFilter eFilter, ENPlanWorkFilter pFilter) throws PersistenceException {
	        ENEstimateItemShortList result = new ENEstimateItemShortList();
	        ENEstimateItemShort anObject;
	        result.list = new Vector<>();
	        Vector<ENEstimateItemShort> v = new Vector<>();

	        String selectStr;
	        Connection connection = getConnection();
	        PreparedStatement statement = null;
	        ResultSet set = null;
	        String whereStr = "";

	        String conditionE = eFilter.conditionSQL == null ? "" : eFilter.conditionSQL;
	        String conditionP = pFilter.conditionSQL == null ? "" : pFilter.conditionSQL;

	        String orderBy = eFilter.orderBySQL == null ? "" : eFilter.orderBySQL;

	        if (orderBy.length() == 0)
	            orderBy = "ENESTIMATEITEM.CODE";

	        //if(quantity < 0)
	        int quantity = Integer.MAX_VALUE/2;
	        int fromPosition = 0;
	        if(getUserProfile() == null)
	            throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	        selectStr = "SELECT "+
	            "ENESTIMATEITEM.CODE"+
	            ",ENESTIMATEITEM.COUNTGEN"+
	            ",ENESTIMATEITEM.COUNTFACT"+
	            ",ENESTIMATEITEM.USERGEN"+
	            ",ENESTIMATEITEM.DATEEDIT"+

	            ", ENPLANWORK.CODE " +
	            ", ENPLANWORK.DATEGEN " +
	            ", ENPLANWORK.USERGEN " +
	            ", ENPLANWORK.DATEEDIT " +
	            ", ENPLANWORKITEM.CODE " +
	            ", ENPLANWORKITEM.COUNTGEN " +
	            ", ENPLANWORKITEM.USERGEN " +
	            ", ENPLANWORKITEM.DATEEDIT " +
	            ", sm.CODE " +
	            ", sm.NAME " +
	            ", ENESTIMATEITEMTYPE.CODE " +
	            ", ENESTIMATEITEMTYPE.NAME " +
	            ", tu.NAME  "+

	            ", kr.code, kr.techkartnumber, kr.name " +
	            ", ENESTIMATEITEMKIND.CODE " +
	            ", ENESTIMATEITEMKIND.NAME " +

	            ", ENESTIMATEITEM.STATUSREFCODE "+
	            ", ENESTIMATEITEMSTATUS.NAME " +

	            ", (select count(f.code) from finmaterials f where f.estimateitemrefcode = ENESTIMATEITEM.CODE and f.statusrefcode = 1) as countFINMaterials " +

	            ", (select invnumber||coalesce(' (дог.№'||ENPLANWORK.PRICONNECTIONNUMBER||')', '') from enelementdata where ecode = enplanwork.elementrefcode ) as invnumber " +
	            ", (select ename from enelementdata where ecode = enplanwork.elementrefcode ) as ename " +
	            ", enplanwork.elementrefcode " +

	            ", enplanworktype.name, enplanworkstate.name "+

	            ", ENPLANWORK.YEARGEN " +
	            ", ENPLANWORK.MONTHGEN " +

	            ", ENPLANWORK.DATESTART, ENPLANWORK.DATEFINAL " +

	            ", ENPLANWORK.DEPARTMENTREFCODE " +
	            ", ENDEPARTMENT.NAME " +


	            ", enplanwork.budgetrefcode " +   // 38
	             ", (select '213400'::numeric from enpurchasesobject s " +
	            "    where s.elementcode = enplanwork.elementrefcode " +
	            "      and s.purchasesreasoncode = " + ENPurchasesObjectReason.PURCHASES_AVZ + ") " + // 39

                    " , ( select rqpurchaseitem2estmttm.code from rqpurchaseitem2estmttm where estimateitemrefcode=ENESTIMATEITEM.CODE ) as rqpurchaseitem2estmttmcode " + // 40

	            " FROM ENESTIMATEITEM " +

	            "left join ENPLANWORKITEM on ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE " +

	        //  " left join TEHKART._ARTI kr on kr.id = ENPLANWORKITEM.kartarefcode " +

	            " left join TKTECHCARD kr on kr.code = ENPLANWORKITEM.kartarefcode " +
	            ", ENPLANWORK " +
	            //", ENPLANWORKITEM " +
	            ", TKMATERIALS sm" +
	        //  ", REPIMPORT.TMESURE_UNIT tu" +
	            ",TKMEASUREMENT tu" +
	            ", ENESTIMATEITEMTYPE " +
	            ", ENESTIMATEITEMKIND " +
	            ", ENESTIMATEITEMSTATUS " +
	            // перенести ...
	            //", enelementdata  " +
	            ", enplanworktype, enplanworkstate " +

	            " , ENDEPARTMENT " +
	            //" WHERE "
	            "";

	            whereStr = " ENPLANWORK.CODE = ENESTIMATEITEM.PLANREFCODE" ; //+

	            whereStr = whereStr + " and tu.code = sm.MEASUREMENTCODE ";

	            //whereStr = whereStr +" AND ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE" ; //+

	            whereStr = whereStr +" AND sm.CODE = ENESTIMATEITEM.MATERIALREFCODE" ; //+

	            whereStr = whereStr + " ";

	            whereStr = whereStr +" AND ENESTIMATEITEMTYPE.CODE = ENESTIMATEITEM.TYPEREFCODE" ; //+

	            whereStr = whereStr +" AND ENESTIMATEITEMKIND.CODE = ENESTIMATEITEM.KINDREFCODE" ; //+

	            whereStr = whereStr +" AND ENESTIMATEITEMSTATUS.CODE = ENESTIMATEITEM.STATUSREFCODE ";

	            whereStr = whereStr +" AND ENESTIMATEITEM.COUNTFACT <> 0 ";

	            //whereStr = whereStr +" AND ENESTIMATEITEM.statusrefcode  in ("+ ENEstimateItemStatus.PLANNED + ", " + ENEstimateItemStatus.TEMP +") ";

	            // чуть шо перенести в другой метод ...
	            whereStr = whereStr +" and enplanworktype.code = enplanwork.typerefcode and enplanworkstate.code = enplanwork.staterefcode";
	            //whereStr = whereStr +" and enplanwork.elementrefcode = enelementdata.ecode ";
	            whereStr = whereStr + " AND ENPLANWORK.DEPARTMENTREFCODE = ENDEPARTMENT.CODE ";

	            whereStr = whereStr +" and enplanwork.statuscode not in (2, 6) ";
	            whereStr = whereStr +" and enplanwork.kindcode = " + ENPlanWorkKind.CURRENT;


	            if(eFilter != null)
	            {
	            if(eFilter.code != Integer.MIN_VALUE) {
	                if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                whereStr = whereStr + "  ENESTIMATEITEM.CODE = ?";
	            }
	            if(eFilter.countGen != null) {
	                if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                whereStr = whereStr + "  ENESTIMATEITEM.COUNTGEN = ?";
	            }
	            if(eFilter.countFact != null) {
	                if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                whereStr = whereStr + "  ENESTIMATEITEM.COUNTFACT = ?";
	            }
	                if (eFilter.userGen != null) {
	                    if(whereStr.length() != 0)
	                        whereStr = whereStr + " AND ";
	                    if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
	                        whereStr = whereStr + "  ENESTIMATEITEM.USERGEN = ?";
	                    else
	                        whereStr = whereStr + "  ENESTIMATEITEM.USERGEN LIKE ?";
	                }
	            if(eFilter.dateEdit != null) {
	                if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                whereStr = whereStr + "  ENESTIMATEITEM.DATEEDIT = ?";
	            }
	            if(eFilter.planRef.code != Integer.MIN_VALUE) {
	                if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                whereStr = whereStr + "ENESTIMATEITEM.PLANREFCODE = ? ";
	            }
	            if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
	                if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                whereStr = whereStr + "ENESTIMATEITEM.PLANITEMREFCODE = ? ";
	            }
	            if(eFilter.materialRef.code != Integer.MIN_VALUE) {
	                if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                whereStr = whereStr + "ENESTIMATEITEM.MATERIALREFCODE = ? ";
	            }
	            if(eFilter.typeRef.code != Integer.MIN_VALUE) {
	                if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                whereStr = whereStr + "ENESTIMATEITEM.TYPEREFCODE = ? ";
	            }

	            if(eFilter.kindRef.code != Integer.MIN_VALUE) {
	                if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                whereStr = whereStr + "ENESTIMATEITEM.KINDREFCODE = ? ";
	            }
	            if(eFilter.statusRef.code != Integer.MIN_VALUE) {
	                if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                whereStr = whereStr + "ENESTIMATEITEM.STATUSREFCODE = ? ";
	            }
	            }


	            if(pFilter != null)
	            {
	                if(pFilter.code != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + "  ENPLANWORK.CODE = ?";
	                }
	                if(pFilter.dateGen != null) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + "  ENPLANWORK.DATEGEN = ?";
	                }
	                if(pFilter.dateStart != null) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + "  ENPLANWORK.DATESTART = ?";
	                }
	                if(pFilter.dateFinal != null) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + "  ENPLANWORK.DATEFINAL = ?";
	                }
	                if(pFilter.yearGen != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + "  ENPLANWORK.YEARGEN = ?";
	                }
	                if(pFilter.monthGen != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + "  ENPLANWORK.MONTHGEN = ?";
	                }
	                if (pFilter.commentGen != null) {
	                    if(whereStr.length() != 0)
	                        whereStr = whereStr + " AND ";
	                    if (pFilter.commentGen.indexOf('*',0) < 0 && pFilter.commentGen.indexOf('?',0) < 0)
	                        whereStr = whereStr + "  ENPLANWORK.COMMENTGEN = ?";
	                    else
	                        whereStr = whereStr + "  ENPLANWORK.COMMENTGEN LIKE ?";
	                }
	                if (pFilter.userGen != null) {
	                    if(whereStr.length() != 0)
	                        whereStr = whereStr + " AND ";
	                    if (pFilter.userGen.indexOf('*',0) < 0 && pFilter.userGen.indexOf('?',0) < 0)
	                        whereStr = whereStr + "  ENPLANWORK.USERGEN = ?";
	                    else
	                        whereStr = whereStr + "  ENPLANWORK.USERGEN LIKE ?";
	                }
	                if(pFilter.dateEdit != null) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + "  ENPLANWORK.DATEEDIT = ?";
	                }
	                if(pFilter.distanceAlong != null) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + "  ENPLANWORK.DISTANCEALONG = ?";
	                }
	                if(pFilter.distanceTo != null) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + "  ENPLANWORK.DISTANCETO = ?";
	                }
	                if (pFilter.workOrderNumber != null) {
	                    if(whereStr.length() != 0)
	                        whereStr = whereStr + " AND ";
	                    if (pFilter.workOrderNumber.indexOf('*',0) < 0 && pFilter.workOrderNumber.indexOf('?',0) < 0)
	                        whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER = ?";
	                    else
	                        whereStr = whereStr + "  ENPLANWORK.WORKORDERNUMBER LIKE ?";
	                }
	                if(pFilter.dateWorkOrder != null) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + "  ENPLANWORK.DATEWORKORDER = ?";
	                }
	                if (pFilter.priConnectionNumber != null) {
	                    if(whereStr.length() != 0)
	                        whereStr = whereStr + " AND ";
	                    if (pFilter.priConnectionNumber.indexOf('*',0) < 0 && pFilter.priConnectionNumber.indexOf('?',0) < 0)
	                        whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER = ?";
	                    else
	                        whereStr = whereStr + "  ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";
	                }

	                if(pFilter.modify_time != Long.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + "  ENPLANWORK.MODIFY_TIME = ?";
	                }
	                if(pFilter.status.code != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + " ENPLANWORK.STATUSCODE = ? ";
	                }
	                if(pFilter.elementRef.code != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + " ENPLANWORK.ELEMENTREFCODE = ? ";
	                }
	                if(pFilter.typeRef.code != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + " ENPLANWORK.TYPEREFCODE = ? ";
	                }
	                if(pFilter.kind.code != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + " ENPLANWORK.KINDCODE = ? ";
	                }
	                if(pFilter.renRef.code != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + " ENPLANWORK.RENREFCODE = ? ";
	                }
	                if(pFilter.finExecutor.code != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + " ENPLANWORK.FINEXECUTORCODE = ? ";
	                }
	                if(pFilter.stateRef.code != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + " ENPLANWORK.STATEREFCODE = ? ";
	                }
	                if(pFilter.formRef.code != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + " ENPLANWORK.FORMREFCODE = ? ";
	                }
	                if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + " ENPLANWORK.BUDGETREFCODE = ? ";
	                }
	                if(pFilter.responsibilityRef.code != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + " ENPLANWORK.RESPONSIBILITYREFCODE = ? ";
	                }
	                if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
	                    if(whereStr.length() != 0)
	                    whereStr = whereStr + " AND ";
	                    whereStr = whereStr + " ENPLANWORK.DEPARTMENTREFCODE = ? ";
	                }
	            }

	            if(conditionE.length() != 0)
	            {
	                if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";

	                whereStr = whereStr + " (" + conditionE + ")";
	            }

	            if(conditionP.length() != 0)
	            {
	                if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";

	                whereStr = whereStr + " (" + conditionP + ")";
	            }

//	        + " WHERE" +  сделано выше ????
	            if(whereStr.length() != 0)
	                selectStr = selectStr + " WHERE" + whereStr;

	        // selectStr = selectStr + ") ";

	        selectStr = selectStr + " ORDER BY " + orderBy;

	        try
	            {
	            statement = connection.prepareStatement(selectStr);
	            int number = 0;
	            if(eFilter != null){
	                if(eFilter.code != Integer.MIN_VALUE){
	                    number++;
	                    statement.setInt(number,eFilter.code);
	                }
	            if(eFilter.countGen != null){
	                number++;
	                eFilter.countGen = eFilter.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
	                statement.setBigDecimal(number,eFilter.countGen);
	            }
	            if(eFilter.countFact != null){
	                number++;
	                eFilter.countFact = eFilter.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
	                statement.setBigDecimal(number,eFilter.countFact);
	            }
	                if (eFilter.commentGen != null) {
	                    if(whereStr.length() != 0)
	                        whereStr = whereStr + " AND";
	                    if (eFilter.commentGen.indexOf('*',0) < 0 && eFilter.commentGen.indexOf('?',0) < 0)
	                        whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN = ?";
	                    else
	                        whereStr = whereStr + " ENESTIMATEITEM.COMMENTGEN LIKE ?";

	                if(eFilter.commentGen != null){
	                    number++;
	                    StringBuffer likeStr = new StringBuffer();
	                    likeStr.append(eFilter.commentGen);
	                    for(int i = 0;i < likeStr.length();i++){
	                        if(likeStr.charAt(i) == '*')
	                                likeStr.setCharAt(i,'%');
	                        if(likeStr.charAt(i) == '?')
	                                likeStr.setCharAt(i,'_');
	                    }
	                    statement.setString(number,likeStr.toString());
	                }
	                }
	                if (eFilter.userGen != null) {
	                    if(whereStr.length() != 0)
	                        whereStr = whereStr + " AND";
	                    if (eFilter.userGen.indexOf('*',0) < 0 && eFilter.userGen.indexOf('?',0) < 0)
	                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN = ?";
	                    else
	                        whereStr = whereStr + " ENESTIMATEITEM.USERGEN LIKE ?";

	                if(eFilter.userGen != null){
	                    number++;
	                    StringBuffer likeStr = new StringBuffer();
	                    likeStr.append(eFilter.userGen);
	                    for(int i = 0;i < likeStr.length();i++){
	                        if(likeStr.charAt(i) == '*')
	                                likeStr.setCharAt(i,'%');
	                        if(likeStr.charAt(i) == '?')
	                                likeStr.setCharAt(i,'_');
	                    }
	                    statement.setString(number,likeStr.toString());
	                }
	                }
	            if(eFilter.dateEdit != null){
	                number++;
	                statement.setDate(number,new java.sql.Date(eFilter.dateEdit.getTime()));
	            }


	            if(eFilter.modify_time != Long.MIN_VALUE){
	                number++;
	                if(eFilter.modify_time == Long.MIN_VALUE)
	                    statement.setBigDecimal(number,null);
	                else
	                    statement.setBigDecimal(number,new java.math.BigDecimal(eFilter.modify_time));
	            }
	            if(eFilter.planRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,eFilter.planRef.code);
	            }
	            if(eFilter.planItemRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,eFilter.planItemRef.code);
	            }
	            if(eFilter.materialRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,eFilter.materialRef.code);
	            }
	            if(eFilter.typeRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,eFilter.typeRef.code);
	            }

	            if(eFilter.kindRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,eFilter.kindRef.code);
	            }

	            if(eFilter.statusRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,eFilter.statusRef.code);
	            }
	            }


	            if(pFilter != null)
	            {

	                if(pFilter.code != Integer.MIN_VALUE){
	                    number++;
	                    statement.setInt(number,pFilter.code);
	                }
	                if(pFilter.dateGen != null){
	                    number++;
	                    statement.setDate(number,new java.sql.Date(pFilter.dateGen.getTime()));
	                }
	                if(pFilter.dateStart != null){
	                    number++;
	                    statement.setDate(number,new java.sql.Date(pFilter.dateStart.getTime()));
	                }
	                if(pFilter.dateFinal != null){
	                    number++;
	                    statement.setDate(number,new java.sql.Date(pFilter.dateFinal.getTime()));
	                }
	                if(pFilter.yearGen != Integer.MIN_VALUE){
	                    number++;
	                    statement.setInt(number,pFilter.yearGen);
	                }
	                if(pFilter.monthGen != Integer.MIN_VALUE){
	                    number++;
	                    statement.setInt(number,pFilter.monthGen);
	                }
	                if (pFilter.commentGen != null) {
	                    if(whereStr.length() != 0)
	                        whereStr = whereStr + " AND";
	                    if (pFilter.commentGen.indexOf('*',0) < 0 && pFilter.commentGen.indexOf('?',0) < 0)
	                        whereStr = whereStr + " ENPLANWORK.COMMENTGEN = ?";
	                    else
	                        whereStr = whereStr + " ENPLANWORK.COMMENTGEN LIKE ?";

	                if(pFilter.commentGen != null){
	                    number++;
	                    StringBuffer likeStr = new StringBuffer();
	                    likeStr.append(pFilter.commentGen);
	                    for(int i = 0;i < likeStr.length();i++){
	                            if(likeStr.charAt(i) == '*')
	                                likeStr.setCharAt(i,'%');
	                            if(likeStr.charAt(i) == '?')
	                                likeStr.setCharAt(i,'_');
	                    }
	                    statement.setString(number,likeStr.toString());
	                }
	                }
	                if (pFilter.userGen != null) {
	                    if(whereStr.length() != 0)
	                        whereStr = whereStr + " AND";
	                    if (pFilter.userGen.indexOf('*',0) < 0 && pFilter.userGen.indexOf('?',0) < 0)
	                        whereStr = whereStr + " ENPLANWORK.USERGEN = ?";
	                    else
	                        whereStr = whereStr + " ENPLANWORK.USERGEN LIKE ?";

	                if(pFilter.userGen != null){
	                    number++;
	                    StringBuffer likeStr = new StringBuffer();
	                    likeStr.append(pFilter.userGen);
	                    for(int i = 0;i < likeStr.length();i++){
	                            if(likeStr.charAt(i) == '*')
	                                likeStr.setCharAt(i,'%');
	                            if(likeStr.charAt(i) == '?')
	                                likeStr.setCharAt(i,'_');
	                    }
	                    statement.setString(number,likeStr.toString());
	                }
	                }
	                if(pFilter.dateEdit != null){
	                    number++;
	                    statement.setDate(number,new java.sql.Date(pFilter.dateEdit.getTime()));
	                }
	                if(pFilter.distanceAlong != null){
	                    number++;
	                    pFilter.distanceAlong = pFilter.distanceAlong.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
	                    statement.setBigDecimal(number,pFilter.distanceAlong);
	                }
	                if(pFilter.distanceTo != null){
	                    number++;
	                    pFilter.distanceTo = pFilter.distanceTo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
	                    statement.setBigDecimal(number,pFilter.distanceTo);
	                }
	                if (pFilter.workOrderNumber != null) {
	                    if(whereStr.length() != 0)
	                        whereStr = whereStr + " AND";
	                    if (pFilter.workOrderNumber.indexOf('*',0) < 0 && pFilter.workOrderNumber.indexOf('?',0) < 0)
	                        whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER = ?";
	                    else
	                        whereStr = whereStr + " ENPLANWORK.WORKORDERNUMBER LIKE ?";

	                if(pFilter.workOrderNumber != null){
	                    number++;
	                    StringBuffer likeStr = new StringBuffer();
	                    likeStr.append(pFilter.workOrderNumber);
	                    for(int i = 0;i < likeStr.length();i++){
	                            if(likeStr.charAt(i) == '*')
	                                likeStr.setCharAt(i,'%');
	                            if(likeStr.charAt(i) == '?')
	                                likeStr.setCharAt(i,'_');
	                    }
	                    statement.setString(number,likeStr.toString());
	                }
	                }
	                if(pFilter.dateWorkOrder != null){
	                    number++;
	                    statement.setDate(number,new java.sql.Date(pFilter.dateWorkOrder.getTime()));
	                }
	                if (pFilter.priConnectionNumber != null) {
	                    if(whereStr.length() != 0)
	                        whereStr = whereStr + " AND";
	                    if (pFilter.priConnectionNumber.indexOf('*',0) < 0 && pFilter.priConnectionNumber.indexOf('?',0) < 0)
	                        whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER = ?";
	                    else
	                        whereStr = whereStr + " ENPLANWORK.PRICONNECTIONNUMBER LIKE ?";

	                if(pFilter.priConnectionNumber != null){
	                    number++;
	                    StringBuffer likeStr = new StringBuffer();
	                    likeStr.append(pFilter.priConnectionNumber);
	                    for(int i = 0;i < likeStr.length();i++){
	                            if(likeStr.charAt(i) == '*')
	                                likeStr.setCharAt(i,'%');
	                            if(likeStr.charAt(i) == '?')
	                                likeStr.setCharAt(i,'_');
	                    }
	                    statement.setString(number,likeStr.toString());
	                }
	                }

	                if(pFilter.modify_time != Long.MIN_VALUE){
	                    number++;
	                    if(pFilter.modify_time == Long.MIN_VALUE)
	                        statement.setBigDecimal(number,null);
	                    else
	                        statement.setBigDecimal(number,new java.math.BigDecimal(pFilter.modify_time));
	                }
	            if(pFilter.status.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,pFilter.status.code);
	            }
	            if(pFilter.elementRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,pFilter.elementRef.code);
	            }
	            if(pFilter.typeRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,pFilter.typeRef.code);
	            }
	            if(pFilter.kind.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,pFilter.kind.code);
	            }
	            if(pFilter.renRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,pFilter.renRef.code);
	            }
	            if(pFilter.finExecutor.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,pFilter.finExecutor.code);
	            }
	            if(pFilter.stateRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,pFilter.stateRef.code);
	            }
	            if(pFilter.formRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,pFilter.formRef.code);
	            }
	            if(pFilter.budgetRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,pFilter.budgetRef.code);
	            }
	            if(pFilter.responsibilityRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,pFilter.responsibilityRef.code);
	            }
	            if(pFilter.departmentRef.code != Integer.MIN_VALUE) {
	                number++;
	                statement.setInt(number,pFilter.departmentRef.code);
	            }
	            }

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

	            anObject = new ENEstimateItemShort();

	            anObject.code = set.getInt(1);
	            if ( set.wasNull() )
	                anObject.code = Integer.MIN_VALUE;
	            anObject.countGen = set.getBigDecimal(2);
	            if(anObject.countGen != null)
	                anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	            anObject.countFact = set.getBigDecimal(3);
	            if(anObject.countFact != null)
	                anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	            anObject.userGen = set.getString(4);
	            anObject.dateEdit = set.getDate(5);


	            anObject.planRefCode = set.getInt(6);

	            anObject.planRefDateGen = set.getDate(7);

	            anObject.planRefUserGen = set.getString(8);

	            anObject.planRefDateEdit = set.getDate(9);

	            anObject.planItemRefCode = set.getInt(10);
	            if (set.wasNull())
	                anObject.planItemRefCode = Integer.MIN_VALUE;

	            anObject.planItemRefCountGen = set.getBigDecimal(11);
	            if(anObject.planItemRefCountGen != null)
	                anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

	            anObject.planItemRefUserGen = set.getString(12);

	            anObject.planItemRefDateEdit = set.getDate(13);

	            anObject.materialRefCode = set.getInt(14);

	            anObject.materialRefName = set.getString(15);

	            anObject.typeRefCode = set.getInt(16);

	            anObject.typeRefName = set.getString(17);

	            anObject.measureType = set.getString(18);

	            anObject.kartaRefCode = set.getInt(19);
	            anObject.kartaNum = set.getString(20);
	            anObject.kartaRefName = set.getString(21);

	            anObject.kindRefCode = set.getInt(22);
	            anObject.kindRefName = set.getString(23);

	            anObject.statusRefCode = set.getInt(24);
	            anObject.statusRefName = set.getString(25);

	            anObject.countFINMaterials = set.getInt(26);
	            if ( set.wasNull() )
	                anObject.countFINMaterials = Integer.MIN_VALUE;

	            //",  enelementdata.invnumber,  enelementdata.ename,  enelementdata.ecode, enplanworktype.name, enplanworkstate.name "+
	            anObject.invNumber = set.getString(27);
	            anObject.elementName = set.getString(28);
	            anObject.ecode = set.getInt(29);
	            if ( set.wasNull() )
	                anObject.ecode = Integer.MIN_VALUE;
	            anObject.planType = set.getString(30);
	            anObject.planState = set.getString(31);

	            anObject.planRefYearGen = set.getInt(32);
	            if ( set.wasNull() )
	                anObject.planRefYearGen = Integer.MIN_VALUE;

	            anObject.planRefMonthGen = set.getInt(33);
	            if ( set.wasNull() )
	                anObject.planRefMonthGen = Integer.MIN_VALUE;

	            anObject.planRefDateStart = set.getDate(34);
	            anObject.planRefDateFinal = set.getDate(35);

	            anObject.planRefDepartmentCode = set.getInt(36);
	            if (set.wasNull())
	                anObject.planRefDepartmentCode = Integer.MIN_VALUE;

	            anObject.planRefDepartmentName = set.getString(37);

	            anObject.budgetRefCode = set.getInt(38);
	            if ( set.wasNull() )
	                anObject.budgetRefCode = Integer.MIN_VALUE;

	            anObject.ddsCodeAvz = set.getInt(39);
	            if (set.wasNull())
	                anObject.ddsCodeAvz = Integer.MIN_VALUE;
	            //++++++++
	            anObject.purchaseItem2EstimateitemCode=set.getInt(40);
	            if (set.wasNull())
	                anObject.purchaseItem2EstimateitemCode = Integer.MIN_VALUE;

	            v.add(anObject);
	            }

	            ENEstimateItemShort[] arr = new ENEstimateItemShort[v.size()];
	            for (int j = 0; j < v.size(); j++ ) {
	                arr[j] = (ENEstimateItemShort) v.get(j);
	            }

	            return arr;

	            }

	            catch (SQLException e) {
	            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
	            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	            return null;

	            } finally {
	            try {
	                if (set != null)
	                    set.close();
	            } catch (SQLException e) {
	            }
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




} // end of ENEstimateItemDAO
