
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.FINMaterialsDAOGen;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.brief.FINMaterialsShort;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;

  /**
  *  DAO Object for FINMaterials;
  *
  */

public class FINMaterialsDAO extends FINMaterialsDAOGen {


  public FINMaterialsDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINMaterialsDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  /**
   * 
   * Получить сумму материалов заказчика по договору {@link ENServicesObject}
   * 
   * @param servicesObject договор {@link ENServicesObject}
   * @return сумма материалов заказчика договора 
   * @throws PersistenceException
   */
  public BigDecimal getSumOfCustomerMaterials(ENServicesObject servicesObject) throws PersistenceException {
	  BigDecimal out = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
	  Collection<Integer> codes = this.getCodesOfCustomerMaterials(servicesObject);
	  for(int code : codes) {
		  FINMaterials finMat = this.getObject(code);
		  out = out.add(finMat.cost);
	  }
	  
	  return out;
  }
  /**
   * 
   * Получить массив кодов материалов заказчика по договора {@link ENServicesObject}
   * 
   * @param servicesObject заданный договор {@link ENServicesObject}
   * @return массив кодов материалов заказчика
   * @throws PersistenceException
   */
  public int[] getArrayofCustomerMaterialsCodes(ENServicesObject servicesObject) {
	  Set<Integer> set = this.getCodesOfCustomerMaterials(servicesObject);
	  int[] codes = new int[set.size()];
	  int count = 0;
	  for(Integer code : set) codes[count++] = code;
	  return codes;
  }
  
  /**
   * 
   * Получить сет кодов материалов заказчика по договора {@link ENServicesObject}
   * 
   * @param servicesObject заданный договор {@link ENServicesObject}
   * @return сет кодов материалов заказчика
   * @throws PersistenceException
   */
  public Set<Integer> getCodesOfCustomerMaterials(ENServicesObject servicesObject) {
	  String sql = "select " +
			  "  fm.code::integer " +
			  "from enservicesobject as so " +
			  "  inner join enplanwork as p on so.elementcode = p.elementrefcode " +
			  "  inner join enmol2planwork as mp on mp.planrefcode = p.code " +
			  "  inner join enestimateitem as es on p.code = es.planrefcode " +
			  "  inner join finmaterials as fm on es.code = fm.estimateitemrefcode " +
			  "where p.kindcode = ? " +
			  "  and so.code = ? " +
			  "  and es.kindrefcode = ? " +
			  "  and fm.statusrefcode = ? " +
			  " " +
			  "union " +
			  " " +
			  "select " +
			  "  fm.code::integer " +
			  "from " +
			  "  enservicesobject as so " +
			  "  inner join enservices2plan as spl on so.code = spl.servicesobjectrefcode " +
			  "  inner join enplanwork as pw on spl.planrefcode = pw.code " +
			  "  inner join enmol2planwork as mp on mp.planrefcode = pw.code " +
			  "  inner join enestimateitem as es on pw.code = es.planrefcode " +
			  "  inner join finmaterials as fm on es.code = fm.estimateitemrefcode " +
			  "where " +
			  "  so.code = ? " +
			  "  and pw.kindcode = ? " +
			  "  and es.kindrefcode = ? " +
			  "  and fm.statusrefcode = ? ";
	  
	  Vector<Integer> binded = new Vector<Integer>(Arrays.asList(ENPlanWorkKind.CURRENT
			  , servicesObject.code
			  , ENEstimateItemKind.CUSTOMER_MATERIALS
			  , FINMaterialsStatus.GOOD
			  , servicesObject.code
			  , ENPlanWorkKind.CURRENT
			  , ENEstimateItemKind.CUSTOMER_MATERIALS
			  , FINMaterialsStatus.GOOD));
	  
	  List<Integer> codes = BaseDAOUtils.executeStatementAndReadObjects(this.getConnection()
			  , sql, binded, new BaseDAOUtils.IntegerFromResultSetTransformator(), false);
	  
	  return new HashSet<Integer>(codes);
  }

  /**
   *
   * Процедура для установки нужного modify_time для finmaterials
   *
   * @param code код finmaterials
   * @param modify_time время изменения в миллисекундах
   */
  public void updateModify_time(int code, long modify_time) throws PersistenceException
  {
    String     selectStr;
        Connection connection = getConnection();

        selectStr = "UPDATE FINMATERIALS SET MODIFY_TIME = ? WHERE CODE = ?";

        if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

        FINMaterials object = getObject(code);

        if(object == null)
        throw new PersistenceException("{%FINMaterials.getObject%} access denied");

        PreparedStatement statement = null;
        try
        {
        statement = connection.prepareStatement(selectStr);
        statement.setLong(1, modify_time);
        statement.setInt(2,code);
        statement.execute();
        }
        catch(SQLException e)
        {
        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        if(connection != super.getConnection())
        {
            try{connection.close();} catch(SQLException e){}
        }
        }
  }

  public FINMaterialsShortList getFilteredPartyList(int estimateItemCode) throws PersistenceException
   {
    //Vector result = new Vector();

    FINMaterialsShortList result = new FINMaterialsShortList();
    FINMaterialsShort anObject;
    result.list = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr =
    //    "SELECT distinct FINMATERIALS.PARTY_ID, FINMATERIALS.NN, FINMATERIALS.MAT_NAME  FROM FINMATERIALS ";


    //для чистых партий это неактуально ...
    //" select distinct f.nn, f.mat_name, f.mu_name, f.party_id , f.QUANTITY from finmaterials f " +
    //" where f.estimateitemrefcode = ? and f.statusrefcode in ("+ FINMaterialsStatus.GOOD +","+ FINMaterialsStatus.VIRTUAL +") " +
    //" union " +
   " select distinct i.nomenclaturenum, i.nomenclaturename, i.nomenclatureunitname, o2p.partycode, RQFKORDERITEM2ENSTMTTM.countgen from  rqfkorderitem i, rqfkorderdata2fkparty o2p , RQFKORDERITEM2ENSTMTTM " +
   " where i.code = o2p.fkorderitemrefcode and o2p.estimateitemrefcode = ? " +
   " i.CODE = RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE ";





    try
     {
      statement = connection.prepareStatement(selectStr);

      statement.setInt(1,estimateItemCode);
      statement.setInt(2,estimateItemCode);


      set = statement.executeQuery();
      int i;
      for(i = 0;set.next();i++)
       {


        anObject = new FINMaterialsShort();


        anObject.nn = set.getString(1);
        anObject.mat_name = set.getString(2);
        anObject.mu_name = set.getString(3);
        anObject.party_id = set.getInt(4);
        if (set.wasNull())
            anObject.party_id = Integer.MIN_VALUE;

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


    } // end of getFilteredCodeArray



  @Override
public void remove(int code) throws PersistenceException
  {
    ActLogic actLogic = new ActLogic(getConnection(), getUserProfile());
    FINMaterials m = getObject(code);

    //ENAct act = actLogic.getActByEstimateItemCode(m.estimateItemRef.code, false);

    // отменненыеМАТЕРИАЛЫ можно удалаять ....
    if ( m.statusRef.code != FINMaterialsStatus.CANCELED )
    {
        PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(), getUserProfile());
        int planCode = planLogic.getPlanCodeByEstimateNoSegr(m.estimateItemRef.code);

        ENAct act = actLogic.getActByPlanCode(planCode, false);

        // материалы уже на НАРЯД-ЗАДАНИИ !!! на акте - только 300 операция !!!
        if (act != null){
            throw new EnergyproSystemException("Удалите акт !!!");

//
//      //actLogic.validateAct2Plan(act.code, planCode);
//
//      FINLogic finLogic = new FINLogic(getFINConnection(), getUserProfile());
//      finLogic.validateDocDate(act.dateGen);
//
//      //finLogic.validateDocStatus(act.finDocCode);
//      ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(getConnection(), getUserProfile());
//      ENEstimateItem estimate = estimateDAO.getObject(m.estimateItemRef.code);
//
//      //finLogic.validateDocStatus(act.finDocCode);
//      if (estimate.kindRef.code == ENEstimateItemKind.MATERIALS )
//          finLogic.validateDocStatus(act.finDocCode, 300 );
//        else
//        if (estimate.kindRef.code == ENEstimateItemKind.GSM )
//          finLogic.validateDocStatus(act.finDocMechanicCode, 301 );
//        else
//            throw new EnergyproSystemException("Unknown ENEstimateItemKind code="+estimate.kindRef.code);
//
    } // акта не БЫЛО
  }
    super.remove(code);
  }



  @Override
  public FINMaterialsShortList getScrollableFilteredList(FINMaterials aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   FINMaterialsShortList result = new FINMaterialsShortList();
   FINMaterialsShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "FINMATERIALS.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "FINMATERIALS.CODE"+
    ",FINMATERIALS.NN"+
    ",FINMATERIALS.MAT_NAME"+
    ",FINMATERIALS.MU_NAME"+
    ",FINMATERIALS.DIV_NAME"+
    ",FINMATERIALS.PARTNER_NAME"+
    ",FINMATERIALS.DOC_DATE"+
    ",FINMATERIALS.PARTY_DISCRIPTION"+
    ",FINMATERIALS.REST_PURPOSE_ID"+
    ",FINMATERIALS.REST_PURPOSE_NAME"+
    ",FINMATERIALS.REST_PURPOSE_TYPE_ID"+
    ",FINMATERIALS.BUDGET_CORE_ID"+
    ",FINMATERIALS.FRC_CODE"+
    ",FINMATERIALS.FRC_NAME"+
    ",FINMATERIALS.CALC_PRICE"+
    ",FINMATERIALS.QUANTITY"+
    ",FINMATERIALS.PRICE"+
    ",FINMATERIALS.COST"+
    ",FINMATERIALS.BAL_SCH"+

     ", ENESTIMATEITEM.CODE " +
     ", ENESTIMATEITEM.COUNTGEN " +
     ", ENESTIMATEITEM.COUNTFACT " +
     ", ENESTIMATEITEM.PRICE " +
     ", ENESTIMATEITEM.COST " +
     ", ENESTIMATEITEM.USERGEN " +
     ", ENESTIMATEITEM.DATEEDIT " +
     ", FINMATERIALSSTATUS.CODE " +
     ", FINMATERIALSSTATUS.NAME " +

     ", ENESTIMATEITEM.KINDREFCODE "+
     ", ENESTIMATEITEMKIND.NAME" +

     ", FINMATERIALS.USERGEN" +
     ", FINMATERIALS.DATEEDIT" +

     ", FINMATERIALS.PARTY_ID" +

     ", FINMATERIALS.PARENTREFCODE " +

     ", FINMATERIALS.WEAR_DATE " +
     ", FINMATERIALS.MAT_ID " +
     "  ,FINMATERIALS.EXTRA_CARGO " +
     "  ,FINMATERIALS.COST_EXT "+
     "  ,FINMATERIALS.EXTRA_CARGO_NDS " +
     "  ,FINMATERIALS.COST_EXT_NDS "+
     "	,FINMATERIALS.DIV_CODE " +

	"  , FINMATERIALS.AX_PARTY_ID " +
	"  , FINMATERIALS.AX_REST_PURPOSE_ID " +
	"  , FINMATERIALS.AX_REST_PURPOSE_TYPEID " +
	"  , FINMATERIALS.AX_FRC_CODE " +

	", FINMATERIALS.AXINVENTTRANSFERLINSCD"+
	", FINMATERIALS.AXINVENTDIMFINID"+

   " , FINMATERIALS.AXFACTOR " +
    " FROM FINMATERIALS " +
    ", ENESTIMATEITEM " +
    ", FINMATERIALSSTATUS " +
    ", ENESTIMATEITEMKIND" +


    //" WHERE "
    "";
    whereStr = " ENESTIMATEITEM.CODE = FINMATERIALS.ESTIMATEITEMREFCODE" ; //+
     whereStr = whereStr +" AND FINMATERIALSSTATUS.CODE = FINMATERIALS.STATUSREFCODE" ; //+
     whereStr = whereStr +" AND ENESTIMATEITEM.KINDREFCODE = ENESTIMATEITEMKIND.CODE" ; //+
     //selectStr = selectStr + " ${s} FINMATERIALS.CODE IN ( SELECT FINMATERIALS.CODE FROM FINMATERIALS ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.CODE = ?";
       }
       if(aFilterObject.mat_id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.MAT_ID = ?";
       }
        if (aFilterObject.nn != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.nn.indexOf('*',0) < 0 && aFilterObject.nn.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.NN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.NN) LIKE UPPER(?)";
        }
        if (aFilterObject.mat_name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.mat_name.indexOf('*',0) < 0 && aFilterObject.mat_name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.MAT_NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.MAT_NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.mu_id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.MU_ID = ?";
       }
        if (aFilterObject.mu_name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.mu_name.indexOf('*',0) < 0 && aFilterObject.mu_name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.MU_NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.MU_NAME) LIKE UPPER(?)";
        }
        if (aFilterObject.div_code != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.div_code.indexOf('*',0) < 0 && aFilterObject.div_code.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.DIV_CODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.DIV_CODE) LIKE UPPER(?)";
        }
        if (aFilterObject.div_name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.div_name.indexOf('*',0) < 0 && aFilterObject.div_name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.DIV_NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.DIV_NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.party_id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.PARTY_ID = ?";
       }
        if (aFilterObject.doc_num != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.doc_num.indexOf('*',0) < 0 && aFilterObject.doc_num.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.DOC_NUM) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.DOC_NUM) LIKE UPPER(?)";
        }

       //if(aFilterObject.partner != Integer.MIN_VALUE) {
       //    if(whereStr.length() != 0)
       //       whereStr = whereStr + " AND ";
       //    whereStr = whereStr + "  FINMATERIALS.PARTNER = ?";
      // }

       if (aFilterObject.partner != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.partner.indexOf('*',0) < 0 && aFilterObject.partner.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(FINMATERIALS.PARTNER) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(FINMATERIALS.PARTNER) LIKE UPPER(?)";
       }

        if (aFilterObject.partner_name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.partner_name.indexOf('*',0) < 0 && aFilterObject.partner_name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.PARTNER_NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.PARTNER_NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.doc_date != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.DOC_DATE = ?";
       }
        if (aFilterObject.party_discription != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.party_discription.indexOf('*',0) < 0 && aFilterObject.party_discription.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.PARTY_DISCRIPTION) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.PARTY_DISCRIPTION) LIKE UPPER(?)";
        }
       if(aFilterObject.rest_purpose_id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.REST_PURPOSE_ID = ?";
       }
        if (aFilterObject.rest_purpose_name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.rest_purpose_name.indexOf('*',0) < 0 && aFilterObject.rest_purpose_name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.REST_PURPOSE_NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.REST_PURPOSE_NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.rest_purpose_type_id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.REST_PURPOSE_TYPE_ID = ?";
       }
       if(aFilterObject.budget_core_id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.BUDGET_CORE_ID = ?";
       }
       if(aFilterObject.frc_code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.FRC_CODE = ?";
       }
        if (aFilterObject.frc_name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.frc_name.indexOf('*',0) < 0 && aFilterObject.frc_name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.FRC_NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.FRC_NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.calc_price != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.CALC_PRICE = ?";
       }
       if(aFilterObject.quantity != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.QUANTITY = ?";
       }
       if(aFilterObject.price != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.PRICE = ?";
       }
       if(aFilterObject.cost != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.COST = ?";
       }
        if (aFilterObject.bal_sch != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.bal_sch.indexOf('*',0) < 0 && aFilterObject.bal_sch.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.BAL_SCH) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.BAL_SCH) LIKE UPPER(?)";
        }
       if(aFilterObject.finDocItemCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.FINDOCITEMCODE = ?";
       }

       /////// AX
       if (aFilterObject.ax_party_id != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.ax_party_id.indexOf('*',0) < 0 && aFilterObject.ax_party_id.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(FINMATERIALS.AX_PARTY_ID) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(FINMATERIALS.AX_PARTY_ID) LIKE UPPER(?)";
       }
       if (aFilterObject.ax_rest_purpose_id != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.ax_rest_purpose_id.indexOf('*',0) < 0 && aFilterObject.ax_rest_purpose_id.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(FINMATERIALS.AX_REST_PURPOSE_ID) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(FINMATERIALS.AX_REST_PURPOSE_ID) LIKE UPPER(?)";
       }
       if (aFilterObject.ax_rest_purpose_typeid != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.ax_rest_purpose_typeid.indexOf('*',0) < 0 && aFilterObject.ax_rest_purpose_typeid.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(FINMATERIALS.AX_REST_PURPOSE_TYPEID) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(FINMATERIALS.AX_REST_PURPOSE_TYPEID) LIKE UPPER(?)";
       }
       if (aFilterObject.ax_frc_code != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.ax_frc_code.indexOf('*',0) < 0 && aFilterObject.ax_frc_code.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(FINMATERIALS.AX_FRC_CODE) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(FINMATERIALS.AX_FRC_CODE) LIKE UPPER(?)";
       }
       if(aFilterObject.axFactor != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.AXFACTOR = ?";
       }
       ///////

       if(aFilterObject.wear_date != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.WEAR_DATE = ?";
       }

       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.MODIFY_TIME = ?";
       }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "FINMATERIALS.ESTIMATEITEMREFCODE = ? ";
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "FINMATERIALS.STATUSREFCODE = ? ";
       }
       if(aFilterObject.molDataRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "FINMATERIALS.MOLDATAREFCODE = ? ";
       }

       if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " FINMATERIALS.PARENTREFCODE = ? ";
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
        if(aFilterObject.mat_id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.mat_id);
        }

          if(aFilterObject.nn != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.nn);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.mat_name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.mat_name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.mu_id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.mu_id);
        }

          if(aFilterObject.mu_name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.mu_name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.div_code != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.div_code);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.div_name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.div_name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.party_id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.party_id);
        }

          if(aFilterObject.doc_num != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.doc_num);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.partner != null){
            number++;
            statement.setString(number,aFilterObject.partner);
        }

          if(aFilterObject.partner_name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.partner_name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.doc_date != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.doc_date.getTime()));
       }

          if(aFilterObject.party_discription != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.party_discription);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.rest_purpose_id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.rest_purpose_id);
        }

          if(aFilterObject.rest_purpose_name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.rest_purpose_name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.rest_purpose_type_id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.rest_purpose_type_id);
        }
        if(aFilterObject.budget_core_id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.budget_core_id);
        }
        if(aFilterObject.frc_code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.frc_code);
        }

          if(aFilterObject.frc_name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.frc_name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.calc_price != null){
           number++;
           aFilterObject.calc_price = aFilterObject.calc_price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.calc_price);
       }
       if(aFilterObject.quantity != null){
           number++;
           aFilterObject.quantity = aFilterObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.quantity);
       }
       if(aFilterObject.price != null){
           number++;
           aFilterObject.price = aFilterObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.price);
       }
       if(aFilterObject.cost != null){
           number++;
           aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.cost);
       }

          if(aFilterObject.bal_sch != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.bal_sch);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.finDocItemCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.finDocItemCode);
        }

        ///// AX
        if(aFilterObject.ax_party_id != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.ax_party_id);
            for(int i = 0;i < likeStr.length();i++){
                 if(likeStr.charAt(i) == '*')
                      likeStr.setCharAt(i,'%');
                 if(likeStr.charAt(i) == '?')
                      likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }
        if(aFilterObject.ax_rest_purpose_id != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.ax_rest_purpose_id);
            for(int i = 0;i < likeStr.length();i++){
                 if(likeStr.charAt(i) == '*')
                      likeStr.setCharAt(i,'%');
                 if(likeStr.charAt(i) == '?')
                      likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }
        if(aFilterObject.ax_rest_purpose_typeid != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.ax_rest_purpose_typeid);
            for(int i = 0;i < likeStr.length();i++){
                 if(likeStr.charAt(i) == '*')
                      likeStr.setCharAt(i,'%');
                 if(likeStr.charAt(i) == '?')
                      likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }
        if(aFilterObject.ax_frc_code != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.ax_frc_code);
            for(int i = 0;i < likeStr.length();i++){
                 if(likeStr.charAt(i) == '*')
                      likeStr.setCharAt(i,'%');
                 if(likeStr.charAt(i) == '?')
                      likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }
        if(aFilterObject.axFactor != null){
            number++;
            aFilterObject.axFactor = aFilterObject.axFactor.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.axFactor);
        }
        /////

        if(aFilterObject.wear_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.wear_date.getTime()));
        }

       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.estimateItemRef.code);
      }
      if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.statusRef.code);
      }
      if(aFilterObject.molDataRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.molDataRef.code);
      }

      if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.parentRef.code);
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

       anObject = new FINMaterialsShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.nn = set.getString(2);
       anObject.mat_name = set.getString(3);
       anObject.mu_name = set.getString(4);
       anObject.div_name = set.getString(5);
       anObject.partner_name = set.getString(6);
       anObject.doc_date = set.getDate(7);
       anObject.party_discription = set.getString(8);
       anObject.rest_purpose_id = set.getInt(9);
       if ( set.wasNull() )
           anObject.rest_purpose_id = Integer.MIN_VALUE;
       anObject.rest_purpose_name = set.getString(10);
       anObject.rest_purpose_type_id = set.getInt(11);
       if ( set.wasNull() )
           anObject.rest_purpose_type_id = Integer.MIN_VALUE;
       anObject.budget_core_id = set.getInt(12);
       if ( set.wasNull() )
           anObject.budget_core_id = Integer.MIN_VALUE;
       anObject.frc_code = set.getInt(13);
       if ( set.wasNull() )
           anObject.frc_code = Integer.MIN_VALUE;
       anObject.frc_name = set.getString(14);
       anObject.calc_price = set.getBigDecimal(15);
       if(anObject.calc_price != null)
           anObject.calc_price = anObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.quantity = set.getBigDecimal(16);
       if(anObject.quantity != null)
           anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.price = set.getBigDecimal(17);
       if(anObject.price != null)
           anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.cost = set.getBigDecimal(18);
       if(anObject.cost != null)
           anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.bal_sch = set.getString(19);


       anObject.estimateItemRefCode = set.getInt(20);

       anObject.estimateItemRefCountGen = set.getBigDecimal(21);
       if(anObject.estimateItemRefCountGen != null)
         anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefCountFact = set.getBigDecimal(22);
       if(anObject.estimateItemRefCountFact != null)
         anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefPrice = set.getBigDecimal(23);
       if(anObject.estimateItemRefPrice != null)
         anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefCost = set.getBigDecimal(24);
       if(anObject.estimateItemRefCost != null)
         anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefUserGen = set.getString(25);

       anObject.estimateItemRefDateEdit = set.getDate(26);

       anObject.statusRefCode = set.getInt(27);

       anObject.statusRefName = set.getString(28);

       anObject.estimateItemRefKindCode = set.getInt(29);
       anObject.estimateItemRefKindName = set.getString(30);

       anObject.userGen = set.getString(31);

       //anObject.dateEdit = set.getDate(32);
       anObject.dateEdit = set.getTimestamp(32);

       anObject.party_id = set.getInt(33);

       anObject.parentRefCode = set.getInt(34);
        if(set.wasNull())
        anObject.parentRefCode = Integer.MIN_VALUE;

        anObject.wear_date = set.getDate(35);
        anObject.mat_id = set.getInt(36);

        anObject.extra_cargo=set.getBigDecimal(37);
        anObject.cost_ext=set.getBigDecimal(38);
        anObject.extra_cargo_nds=set.getBigDecimal(39);
        anObject.cost_ext_nds=set.getBigDecimal(40);
        anObject.div_code = set.getString(41);

		anObject.ax_party_id = set.getString(42);
		anObject.ax_rest_purpose_id = set.getString(43);
		anObject.ax_rest_purpose_typeid = set.getString(44);
		anObject.ax_frc_code = set.getString(45);

        anObject.axInventTransferLinesCode = set.getString(46);
		anObject.axInventDimFinId = set.getString(47);

		anObject.axFactor = set.getBigDecimal(48);
		if (anObject.axFactor != null)
			anObject.axFactor = anObject.axFactor.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);

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



  public FINMaterialsShortList getGroupedFilteredList(FINMaterialsFilter aFilterObject, int fromPosition,int quantity) throws PersistenceException
  {
   FINMaterialsShortList result = new FINMaterialsShortList();
   FINMaterialsShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";

   String     condition =  aFilterObject.conditionSQL == null ? "" :  aFilterObject.conditionSQL ; //processCondition(anCondition);
   String     orderBy =  aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL ; // processCondition(anOrderBy);

   if(orderBy.length() == 0)
     orderBy = " FINMATERIALS.NN, FINMATERIALS.BAL_SCH, case when ENESTIMATEITEM.KINDREFCODE = 2 then FINMATERIALS.MAT_NAME||'(ПММ)' else FINMATERIALS.MAT_NAME end, FINMATERIALS.MU_NAME, FINMATERIALS.CALC_PRICE ";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");


   selectStr = "SELECT "+
    //"FINMATERIALS.CODE"+
    " FINMATERIALS.NN"+
    ", case when ENESTIMATEITEM.KINDREFCODE = 2 then FINMATERIALS.MAT_NAME||'(ПММ)' else FINMATERIALS.MAT_NAME end "+
    ",FINMATERIALS.MU_NAME"+
    //",FINMATERIALS.DIV_NAME"+
    //",FINMATERIALS.PARTNER_NAME"+
    //",FINMATERIALS.DOC_DATE"+
    //",FINMATERIALS.PARTY_DISCRIPTION"+
    //",FINMATERIALS.REST_PURPOSE_ID"+
    //",FINMATERIALS.REST_PURPOSE_NAME"+
    //",FINMATERIALS.REST_PURPOSE_TYPE_ID"+
    //",FINMATERIALS.BUDGET_CORE_ID"+
    //",FINMATERIALS.FRC_CODE"+
    //",FINMATERIALS.FRC_NAME"+
    //",FINMATERIALS.CALC_PRICE"+
    ", SUM(FINMATERIALS.QUANTITY)"+
    ",FINMATERIALS.CALC_PRICE"+
    ", SUM(FINMATERIALS.COST)"+
    ",FINMATERIALS.BAL_SCH"+

   //  ", ENESTIMATEITEM.CODE " +
   //  ", ENESTIMATEITEM.COUNTGEN " +
  //   ", ENESTIMATEITEM.COUNTFACT " +
   //  ", ENESTIMATEITEM.PRICE " +
  //   ", ENESTIMATEITEM.COST " +
   //  ", ENESTIMATEITEM.USERGEN " +
    // ", ENESTIMATEITEM.DATEEDIT " +
   //  ", FINMATERIALSSTATUS.CODE " +
   //  ", FINMATERIALSSTATUS.NAME " +
     ", ENESTIMATEITEM.KINDREFCODE "+
     ", ENESTIMATEITEMKIND.NAME" +
    " FROM FINMATERIALS " +
    ", ENESTIMATEITEM " +
    ", FINMATERIALSSTATUS " +
    ", ENESTIMATEITEMKIND" +
    //" WHERE "
    "";
    whereStr = " ENESTIMATEITEM.CODE = FINMATERIALS.ESTIMATEITEMREFCODE" ; //+
    whereStr = whereStr +" AND ENESTIMATEITEM.KINDREFCODE = ENESTIMATEITEMKIND.CODE" ; //+
     whereStr = whereStr +" AND FINMATERIALSSTATUS.CODE = FINMATERIALS.STATUSREFCODE" ; //+
        //selectStr = selectStr + " ${s} FINMATERIALS.CODE IN ( SELECT FINMATERIALS.CODE FROM FINMATERIALS ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.CODE = ?";
       }
       if(aFilterObject.mat_id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.MAT_ID = ?";
       }
        if (aFilterObject.nn != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.nn.indexOf('*',0) < 0 && aFilterObject.nn.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.NN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.NN) LIKE UPPER(?)";
        }
        if (aFilterObject.mat_name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.mat_name.indexOf('*',0) < 0 && aFilterObject.mat_name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.MAT_NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.MAT_NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.mu_id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.MU_ID = ?";
       }
        if (aFilterObject.mu_name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.mu_name.indexOf('*',0) < 0 && aFilterObject.mu_name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.MU_NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.MU_NAME) LIKE UPPER(?)";
        }
        if (aFilterObject.div_code != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.div_code.indexOf('*',0) < 0 && aFilterObject.div_code.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.DIV_CODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.DIV_CODE) LIKE UPPER(?)";
        }
        if (aFilterObject.div_name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.div_name.indexOf('*',0) < 0 && aFilterObject.div_name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.DIV_NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.DIV_NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.party_id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.PARTY_ID = ?";
       }
        if (aFilterObject.doc_num != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.doc_num.indexOf('*',0) < 0 && aFilterObject.doc_num.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.DOC_NUM) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.DOC_NUM) LIKE UPPER(?)";
        }

       //if(aFilterObject.partner != Integer.MIN_VALUE) {
       //    if(whereStr.length() != 0)
       //       whereStr = whereStr + " AND ";
       //    whereStr = whereStr + "  FINMATERIALS.PARTNER = ?";
      // }

       if (aFilterObject.partner != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.partner.indexOf('*',0) < 0 && aFilterObject.partner.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(FINMATERIALS.PARTNER) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(FINMATERIALS.PARTNER) LIKE UPPER(?)";
       }

        if (aFilterObject.partner_name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.partner_name.indexOf('*',0) < 0 && aFilterObject.partner_name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.PARTNER_NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.PARTNER_NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.doc_date != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.DOC_DATE = ?";
       }
        if (aFilterObject.party_discription != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.party_discription.indexOf('*',0) < 0 && aFilterObject.party_discription.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.PARTY_DISCRIPTION) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.PARTY_DISCRIPTION) LIKE UPPER(?)";
        }
       if(aFilterObject.rest_purpose_id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.REST_PURPOSE_ID = ?";
       }
        if (aFilterObject.rest_purpose_name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.rest_purpose_name.indexOf('*',0) < 0 && aFilterObject.rest_purpose_name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.REST_PURPOSE_NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.REST_PURPOSE_NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.rest_purpose_type_id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.REST_PURPOSE_TYPE_ID = ?";
       }
       if(aFilterObject.budget_core_id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.BUDGET_CORE_ID = ?";
       }
       if(aFilterObject.frc_code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.FRC_CODE = ?";
       }
        if (aFilterObject.frc_name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.frc_name.indexOf('*',0) < 0 && aFilterObject.frc_name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.FRC_NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.FRC_NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.calc_price != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.CALC_PRICE = ?";
       }
       if(aFilterObject.quantity != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.QUANTITY = ?";
       }
       if(aFilterObject.price != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.PRICE = ?";
       }
       if(aFilterObject.cost != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.COST = ?";
       }
        if (aFilterObject.bal_sch != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.bal_sch.indexOf('*',0) < 0 && aFilterObject.bal_sch.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINMATERIALS.BAL_SCH) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINMATERIALS.BAL_SCH) LIKE UPPER(?)";
        }
       if(aFilterObject.finDocItemCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.FINDOCITEMCODE = ?";
       }

       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINMATERIALS.MODIFY_TIME = ?";
       }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "FINMATERIALS.ESTIMATEITEMREFCODE = ? ";
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "FINMATERIALS.STATUSREFCODE = ? ";
       }
       if(aFilterObject.molDataRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "FINMATERIALS.MOLDATAREFCODE = ? ";
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

    // GROUPED ...


    String groupSQL = " FINMATERIALS.NN, case when ENESTIMATEITEM.KINDREFCODE = 2 then FINMATERIALS.MAT_NAME||'(ПММ)' else FINMATERIALS.MAT_NAME end, FINMATERIALS.MU_NAME, FINMATERIALS.CALC_PRICE, "+
    "FINMATERIALS.BAL_SCH, ENESTIMATEITEM.KINDREFCODE, ENESTIMATEITEMKIND.NAME";

    selectStr = selectStr + " group by " + groupSQL;

   if (orderBy.length() > 0)
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
        if(aFilterObject.mat_id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.mat_id);
        }

          if(aFilterObject.nn != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.nn);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.mat_name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.mat_name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.mu_id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.mu_id);
        }

          if(aFilterObject.mu_name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.mu_name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.div_code != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.div_code);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.div_name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.div_name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.party_id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.party_id);
        }

          if(aFilterObject.doc_num != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.doc_num);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.partner != null){
            number++;
            statement.setString(number,aFilterObject.partner);
        }

          if(aFilterObject.partner_name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.partner_name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.doc_date != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.doc_date.getTime()));
       }

          if(aFilterObject.party_discription != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.party_discription);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.rest_purpose_id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.rest_purpose_id);
        }

          if(aFilterObject.rest_purpose_name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.rest_purpose_name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.rest_purpose_type_id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.rest_purpose_type_id);
        }
        if(aFilterObject.budget_core_id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.budget_core_id);
        }
        if(aFilterObject.frc_code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.frc_code);
        }

          if(aFilterObject.frc_name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.frc_name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.calc_price != null){
           number++;
           aFilterObject.calc_price = aFilterObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.calc_price);
       }
       if(aFilterObject.quantity != null){
           number++;
           aFilterObject.quantity = aFilterObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.quantity);
       }
       if(aFilterObject.price != null){
           number++;
           aFilterObject.price = aFilterObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.price);
       }
       if(aFilterObject.cost != null){
           number++;
           aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.cost);
       }

          if(aFilterObject.bal_sch != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.bal_sch);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.finDocItemCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.finDocItemCode);
        }


       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.estimateItemRef.code);
      }
      if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.statusRef.code);
      }

      if(aFilterObject.molDataRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.molDataRef.code);
      }
     }
/*
     if(condition.length() > 0 && aBindObjects != null)
      _bindObjectsToPreparedStatement(statement,aBindObjects,number);
*/
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

       anObject = new FINMaterialsShort();

       anObject.code = Integer.MIN_VALUE;
       anObject.nn = set.getString(1);
       anObject.mat_name = set.getString(2);
       anObject.mu_name = set.getString(3);

       anObject.quantity = set.getBigDecimal(4);
       if(anObject.quantity != null)
           anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.price = set.getBigDecimal(5);
       if(anObject.price != null)
           anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.cost = set.getBigDecimal(6);
       if(anObject.cost != null)
           anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.bal_sch = set.getString(7);


       anObject.estimateItemRefKindCode = set.getInt(8);
       anObject.estimateItemRefKindName = set.getString(9);

       //if ( anObject.estimateItemKindCode == ENEstimateItemKind.GSM)
        //   anObject.mat_name = anObject.mat_name + " (ПММ)";


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



  public FINMaterialsShortList getListForTranzit2OperativeOLD(Date dateStart, Date dateFinish, int budgetCode, int departmentCode, String condition) throws PersistenceException
  {
   FINMaterialsShortList result = new FINMaterialsShortList();
   FINMaterialsShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   //String     whereStr = "";

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr =
    " SELECT  \n" +
    "     FINMATERIALS.CODE \n" +
    "     ,FINMATERIALS.NN \n" +
    "     ,FINMATERIALS.MAT_NAME \n" +
    "     ,FINMATERIALS.MU_NAME \n" +
    "     ,FINMATERIALS.DIV_NAME \n" +
    "     ,FINMATERIALS.PARTNER_NAME \n" +
    "     ,FINMATERIALS.DOC_DATE \n" +
    "     ,FINMATERIALS.PARTY_DISCRIPTION \n" +
    "     ,FINMATERIALS.REST_PURPOSE_ID \n" +
    "     ,FINMATERIALS.REST_PURPOSE_NAME \n" +
    "     ,FINMATERIALS.REST_PURPOSE_TYPE_ID \n" +
    "     ,FINMATERIALS.BUDGET_CORE_ID \n" +
    "     ,FINMATERIALS.FRC_CODE \n" +
    "     ,FINMATERIALS.FRC_NAME \n" +
    "     ,FINMATERIALS.CALC_PRICE \n" +
    "     ,FINMATERIALS.QUANTITY \n" +
    "     ,FINMATERIALS.PRICE \n" +
    "     ,FINMATERIALS.COST \n" +
    "     ,FINMATERIALS.BAL_SCH \n" +
    "  \n" +
    "      , ENESTIMATEITEM.CODE   \n" +
    "      , ENESTIMATEITEM.COUNTGEN   \n" +
    "      , ENESTIMATEITEM.COUNTFACT   \n" +
    "      , ENESTIMATEITEM.PRICE   \n" +
    "      , ENESTIMATEITEM.COST   \n" +
    "      , ENESTIMATEITEM.USERGEN   \n" +
    "      , ENESTIMATEITEM.DATEEDIT   \n" +
    "      , FINMATERIALSSTATUS.CODE   \n" +
    "      , FINMATERIALSSTATUS.NAME   \n" +
    "       \n" +
    "      , ENESTIMATEITEM.KINDREFCODE  \n" +
    "      , ENESTIMATEITEMKIND.NAME  \n" +
    "       \n" +
    "      , FINMATERIALS.USERGEN  \n" +
    "      , FINMATERIALS.DATEEDIT  \n" +
    "       \n" +
    "      , FINMATERIALS.PARTY_ID   \n" +
    "       \n" +
    "      , FINMATERIALS.PARENTREFCODE   \n" +
    "       \n" +
    "      , FINMATERIALS.WEAR_DATE   \n" +
    "  \n" +
    "      , o.moloutcode      \n" +
    "      , o.moloutname      \n" +
    " FROM FINMATERIALS   \n" +
    "     , ENESTIMATEITEM   \n" +
    "     , FINMATERIALSSTATUS   \n" +
    "     , ENESTIMATEITEMKIND,  \n" +
    " ( \n" +
    " select  \n" +
    " finmaterialscode \n" +

    //" from net.f_temp_material('01.09.2011', '02.09.2011', 75000001, 481 ) \n" +

    " from net.f_temp_material('" + new SimpleDateFormat("dd.MM.yyyy").format(dateStart)
    + "', '" + new SimpleDateFormat("dd.MM.yyyy").format(dateFinish) + "', "
    // + budgetCode + ", "
        // + departmentCode + ", "
    + budgetCode + ") \n" +

    " where finmaterialscode in (select ff.code from finmaterials ff , enestimateitem eni , enplanwork pw \n" +
    "                                          where ff.estimateitemrefcode = eni.code \n" +
    "                                            and eni.planrefcode = pw.code \n" +
    "                                            and pw.kindcode = " + ENPlanWorkKind.CURRENT + " \n" +
    "                                            and ff.code =  finmaterialscode  ) \n" +
    "  and moloutcode not like ('18%') \n" +
    "  and moloutcode not like ('%00')  \n" +
    condition + " \n" +
    " ) fm, \n" +
    " rqfkorder o, rqfkorderitem oi, rqfkorderitem2enstmttm oe     \n" +
    "  \n" +
    " WHERE   \n" +
    "   ENESTIMATEITEM.CODE = FINMATERIALS.ESTIMATEITEMREFCODE  \n" +
    "   AND FINMATERIALSSTATUS.CODE = FINMATERIALS.STATUSREFCODE  \n" +
    "   AND ENESTIMATEITEM.KINDREFCODE = ENESTIMATEITEMKIND.CODE  \n" +
    "   and oe.fkorderitemrefcode = oi.code \n" +
    "   and oi.fkorderrefcode = o.code \n" +
    "   and o.kindcode = 2 \n" +
    "   and oe.finmaterialsrefcode = FINMATERIALS.code \n" +
    "   and FINMATERIALS.code = fm.finmaterialscode   \n" +
    "  \n" +
    " order by o.moloutcode ";


   try
    {
     statement = connection.prepareStatement(selectStr);


     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
        /*
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }
        */

       anObject = new FINMaterialsShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.nn = set.getString(2);
       anObject.mat_name = set.getString(3);
       anObject.mu_name = set.getString(4);

       //!!! Берем код МОЛа из поля rqfkorder.moloutname (см. ниже)
       //anObject.div_name = set.getString(5);

       anObject.partner_name = set.getString(6);
       anObject.doc_date = set.getDate(7);
       anObject.party_discription = set.getString(8);
       anObject.rest_purpose_id = set.getInt(9);
       if ( set.wasNull() )
           anObject.rest_purpose_id = Integer.MIN_VALUE;
       anObject.rest_purpose_name = set.getString(10);
       anObject.rest_purpose_type_id = set.getInt(11);
       if ( set.wasNull() )
           anObject.rest_purpose_type_id = Integer.MIN_VALUE;
       anObject.budget_core_id = set.getInt(12);
       if ( set.wasNull() )
           anObject.budget_core_id = Integer.MIN_VALUE;
       anObject.frc_code = set.getInt(13);
       if ( set.wasNull() )
           anObject.frc_code = Integer.MIN_VALUE;
       anObject.frc_name = set.getString(14);
       anObject.calc_price = set.getBigDecimal(15);
       if(anObject.calc_price != null)
           anObject.calc_price = anObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.quantity = set.getBigDecimal(16);
       if(anObject.quantity != null)
           anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.price = set.getBigDecimal(17);
       if(anObject.price != null)
           anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.cost = set.getBigDecimal(18);
       if(anObject.cost != null)
           anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.bal_sch = set.getString(19);


       anObject.estimateItemRefCode = set.getInt(20);

       anObject.estimateItemRefCountGen = set.getBigDecimal(21);
       if(anObject.estimateItemRefCountGen != null)
         anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefCountFact = set.getBigDecimal(22);
       if(anObject.estimateItemRefCountFact != null)
         anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefPrice = set.getBigDecimal(23);
       if(anObject.estimateItemRefPrice != null)
         anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefCost = set.getBigDecimal(24);
       if(anObject.estimateItemRefCost != null)
         anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefUserGen = set.getString(25);

       anObject.estimateItemRefDateEdit = set.getDate(26);

       anObject.statusRefCode = set.getInt(27);

       anObject.statusRefName = set.getString(28);

       anObject.estimateItemRefKindCode = set.getInt(29);
       anObject.estimateItemRefKindName = set.getString(30);

       anObject.userGen = set.getString(31);

       //anObject.dateEdit = set.getDate(32);
       anObject.dateEdit = set.getTimestamp(32);

       anObject.party_id = set.getInt(33);

       anObject.parentRefCode = set.getInt(34);
        if(set.wasNull())
        anObject.parentRefCode = Integer.MIN_VALUE;

        anObject.wear_date = set.getDate(35);

        //!!! Берем код и имя МОЛа из полей rqfkorder.moloutcode и rqfkorder.moloutname
        anObject.div_code = set.getString(36);
        anObject.div_name = set.getString(37);

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

  public FINMaterialsShortList getListForTranzit2Operative(Date dateStart, Date dateFinish, int budgetCode, int departmentCode, String condition) throws PersistenceException
  {
   FINMaterialsShortList result = new FINMaterialsShortList();
   FINMaterialsShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   //String     whereStr = "";

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr =
    " SELECT  \n" +
    "     FINMATERIALS.CODE \n" +
    "     ,FINMATERIALS.NN \n" +
    "     ,FINMATERIALS.MAT_NAME \n" +
    "     ,FINMATERIALS.MU_NAME \n" +
    "     ,FINMATERIALS.DIV_NAME \n" +
    "     ,FINMATERIALS.PARTNER_NAME \n" +
    "     ,FINMATERIALS.DOC_DATE \n" +
    "     ,FINMATERIALS.PARTY_DISCRIPTION \n" +
    "     ,FINMATERIALS.REST_PURPOSE_ID \n" +
    "     ,FINMATERIALS.REST_PURPOSE_NAME \n" +
    "     ,FINMATERIALS.REST_PURPOSE_TYPE_ID \n" +
    "     ,FINMATERIALS.BUDGET_CORE_ID \n" +
    "     ,FINMATERIALS.FRC_CODE \n" +
    "     ,FINMATERIALS.FRC_NAME \n" +
    "     ,FINMATERIALS.CALC_PRICE \n" +
    "     ,FINMATERIALS.QUANTITY \n" +
    "     ,FINMATERIALS.PRICE \n" +
    "     ,FINMATERIALS.COST \n" +
    "     ,FINMATERIALS.BAL_SCH \n" +
    "  \n" +
    "      , ENESTIMATEITEM.CODE   \n" +
    "      , ENESTIMATEITEM.COUNTGEN   \n" +
    "      , ENESTIMATEITEM.COUNTFACT   \n" +
    "      , ENESTIMATEITEM.PRICE   \n" +
    "      , ENESTIMATEITEM.COST   \n" +
    "      , ENESTIMATEITEM.USERGEN   \n" +
    "      , ENESTIMATEITEM.DATEEDIT   \n" +
    "      , FINMATERIALSSTATUS.CODE   \n" +
    "      , FINMATERIALSSTATUS.NAME   \n" +
    "       \n" +
    "      , ENESTIMATEITEM.KINDREFCODE  \n" +
    "      , ENESTIMATEITEMKIND.NAME  \n" +
    "       \n" +
    "      , FINMATERIALS.USERGEN  \n" +
    "      , FINMATERIALS.DATEEDIT  \n" +
    "       \n" +
    "      , FINMATERIALS.PARTY_ID   \n" +
    "       \n" +
    "      , FINMATERIALS.PARENTREFCODE   \n" +
    "       \n" +
    "      , FINMATERIALS.WEAR_DATE   \n" +
    "  \n" +
    "      , o.moloutcode      \n" +
    "      , o.moloutname      \n" +

    " FROM FINMATERIALS   \n" +
    "     , ENESTIMATEITEM   \n" +
    "     , FINMATERIALSSTATUS   \n" +
    "     , ENESTIMATEITEMKIND,  \n" +

    " rqfkorder o, rqfkorderitem oi, rqfkorderitem2enstmttm oe \n" +

    " , enplanwork pw, enelementdata ed \n" +
    " WHERE pw.elementrefcode = ed.ecode  \n" +
    " and ed.etype = 16 \n" +
    " and pw.kindcode = 2 \n" +
    " and pw.statuscode = 3 \n" +
    " and ENESTIMATEITEM.code = FINMATERIALS.estimateitemrefcode \n" +
    " and pw.code = ENESTIMATEITEM.planrefcode  \n" +
    " and FINMATERIALS.statusrefcode = 1 \n" +
    " and ENESTIMATEITEM.countfact <> 0 \n" +
    "  and o.moloutcode not like ('18%') \n" +
    "  and o.moloutcode not like ('%00')  \n" +

    "   AND ENESTIMATEITEM.CODE = FINMATERIALS.ESTIMATEITEMREFCODE  \n" +
    "   AND FINMATERIALSSTATUS.CODE = FINMATERIALS.STATUSREFCODE  \n" +
    "   AND ENESTIMATEITEM.KINDREFCODE = ENESTIMATEITEMKIND.CODE  \n" +
    "   and oe.fkorderitemrefcode = oi.code \n" +
    "   and oi.fkorderrefcode = o.code \n" +
    //"   and o.kindcode = 2 \n" +
    "   and oe.finmaterialsrefcode = FINMATERIALS.code \n" +

    "  \n" +
    " order by o.moloutcode ";


   try
    {
     statement = connection.prepareStatement(selectStr);


     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
        /*
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }
        */

       anObject = new FINMaterialsShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.nn = set.getString(2);
       anObject.mat_name = set.getString(3);
       anObject.mu_name = set.getString(4);

       //!!! Берем код МОЛа из поля rqfkorder.moloutname (см. ниже)
       //anObject.div_name = set.getString(5);

       anObject.partner_name = set.getString(6);
       anObject.doc_date = set.getDate(7);
       anObject.party_discription = set.getString(8);
       anObject.rest_purpose_id = set.getInt(9);
       if ( set.wasNull() )
           anObject.rest_purpose_id = Integer.MIN_VALUE;
       anObject.rest_purpose_name = set.getString(10);
       anObject.rest_purpose_type_id = set.getInt(11);
       if ( set.wasNull() )
           anObject.rest_purpose_type_id = Integer.MIN_VALUE;
       anObject.budget_core_id = set.getInt(12);
       if ( set.wasNull() )
           anObject.budget_core_id = Integer.MIN_VALUE;
       anObject.frc_code = set.getInt(13);
       if ( set.wasNull() )
           anObject.frc_code = Integer.MIN_VALUE;
       anObject.frc_name = set.getString(14);
       anObject.calc_price = set.getBigDecimal(15);
       if(anObject.calc_price != null)
           anObject.calc_price = anObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.quantity = set.getBigDecimal(16);
       if(anObject.quantity != null)
           anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.price = set.getBigDecimal(17);
       if(anObject.price != null)
           anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.cost = set.getBigDecimal(18);
       if(anObject.cost != null)
           anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.bal_sch = set.getString(19);


       anObject.estimateItemRefCode = set.getInt(20);

       anObject.estimateItemRefCountGen = set.getBigDecimal(21);
       if(anObject.estimateItemRefCountGen != null)
         anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefCountFact = set.getBigDecimal(22);
       if(anObject.estimateItemRefCountFact != null)
         anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefPrice = set.getBigDecimal(23);
       if(anObject.estimateItemRefPrice != null)
         anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefCost = set.getBigDecimal(24);
       if(anObject.estimateItemRefCost != null)
         anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefUserGen = set.getString(25);

       anObject.estimateItemRefDateEdit = set.getDate(26);

       anObject.statusRefCode = set.getInt(27);

       anObject.statusRefName = set.getString(28);

       anObject.estimateItemRefKindCode = set.getInt(29);
       anObject.estimateItemRefKindName = set.getString(30);

       anObject.userGen = set.getString(31);

       //anObject.dateEdit = set.getDate(32);
       anObject.dateEdit = set.getTimestamp(32);

       anObject.party_id = set.getInt(33);

       anObject.parentRefCode = set.getInt(34);
        if(set.wasNull())
        anObject.parentRefCode = Integer.MIN_VALUE;

        anObject.wear_date = set.getDate(35);

        //!!! Берем код и имя МОЛа из полей rqfkorder.moloutcode и rqfkorder.moloutname
        anObject.div_code = set.getString(36);
        anObject.div_name = set.getString(37);

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




  public FINMaterialsShortList getListForTranzit2OperativeByEstimateCodes(String estimateCodes, String condition) throws PersistenceException
  {
   FINMaterialsShortList result = new FINMaterialsShortList();
   FINMaterialsShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   //String     whereStr = "";

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");


   selectStr =
    " SELECT \n" +
    "     CODE   \n" +
    "     ,NN   \n" +
    "     ,MAT_NAME   \n" +
    "     ,MU_NAME   \n" +
    "     ,DIV_NAME   \n" +
    "     ,PARTNER_NAME   \n" +
    "     ,DOC_DATE   \n" +
    "     ,PARTY_DISCRIPTION   \n" +
    "     ,REST_PURPOSE_ID   \n" +
    "     ,REST_PURPOSE_NAME   \n" +
    "     ,REST_PURPOSE_TYPE_ID   \n" +
    "     ,BUDGET_CORE_ID   \n" +
    "     ,FRC_CODE   \n" +
    "     ,FRC_NAME   \n" +
    "     ,CALC_PRICE   \n" +
    "     ,QUANTITY   \n" +
    "     ,PRICE   \n" +
    "     ,COST   \n" +
    "     ,BAL_SCH   \n" +
    "                      \n" +
    "      , ecode    \n" +
    "      , COUNTGEN     \n" +
    "      , COUNTFACT     \n" +
    "      , eprice      \n" +
    "      , ecost     \n" +
    "      , eusergen     \n" +
    "      , edateedit   \n" +
    "        \n" +
    "      , statuscode     \n" +
    "      , statusname    \n" +
    "                           \n" +
    "      , ekindcode    \n" +
    "      , ekindname  \n" +
    "                           \n" +
    "      , USERGEN    \n" +
    "      , DATEEDIT    \n" +
    "                           \n" +
    "      , PARTY_ID     \n" +
    "                           \n" +
    "      , PARENTREFCODE     \n" +
    "                           \n" +
    "      , WEAR_DATE     \n" +
    "                      \n" +
    "      , moloutcode        \n" +
    "      , moloutname   \n" +
    " FROM \n" +
    " ( \n" +
    " --- РАСХОДЫ \n" +

    /* 18.11.2011 пробуем отловить транзит, который уже был переброшен из оперативного */

    " SELECT    \n" +
    "     FINMATERIALS.CODE   \n" +
    "     ,FINMATERIALS.NN   \n" +
    "     ,FINMATERIALS.MAT_NAME   \n" +
    "     ,FINMATERIALS.MU_NAME   \n" +
    "     ,FINMATERIALS.DIV_NAME   \n" +
    "     ,FINMATERIALS.PARTNER_NAME   \n" +
    "     ,FINMATERIALS.DOC_DATE   \n" +
    "     ,FINMATERIALS.PARTY_DISCRIPTION   \n" +
    "     ,FINMATERIALS.REST_PURPOSE_ID   \n" +
    "     ,FINMATERIALS.REST_PURPOSE_NAME   \n" +
    "     ,FINMATERIALS.REST_PURPOSE_TYPE_ID   \n" +
    "     ,FINMATERIALS.BUDGET_CORE_ID   \n" +
    "     ,FINMATERIALS.FRC_CODE   \n" +
    "     ,FINMATERIALS.FRC_NAME   \n" +
    "     ,FINMATERIALS.CALC_PRICE   \n" +
    "     ,FINMATERIALS.QUANTITY   \n" +
    "     ,FINMATERIALS.PRICE   \n" +
    "     ,FINMATERIALS.COST   \n" +
    "     ,FINMATERIALS.BAL_SCH   \n" +
    "                      \n" +
    "      , ENESTIMATEITEM.CODE as ecode    \n" +
    "      , ENESTIMATEITEM.COUNTGEN     \n" +
    "      , ENESTIMATEITEM.COUNTFACT     \n" +
    "      , ENESTIMATEITEM.PRICE as eprice      \n" +
    "      , ENESTIMATEITEM.COST as ecost     \n" +
    "      , ENESTIMATEITEM.USERGEN as eusergen     \n" +
    "      , ENESTIMATEITEM.DATEEDIT as edateedit   \n" +
    "        \n" +
    "      , FINMATERIALSSTATUS.CODE as statuscode     \n" +
    "      , FINMATERIALSSTATUS.NAME as statusname    \n" +
    "                           \n" +
    "      , ENESTIMATEITEM.KINDREFCODE as ekindcode    \n" +
    "      , ENESTIMATEITEMKIND.NAME as ekindname   \n" +
    "                           \n" +
    "      , FINMATERIALS.USERGEN    \n" +
    "      , FINMATERIALS.DATEEDIT    \n" +
    "                           \n" +
    "      , FINMATERIALS.PARTY_ID     \n" +
    "                           \n" +
    "      , FINMATERIALS.PARENTREFCODE     \n" +
    "                           \n" +
    "      , FINMATERIALS.WEAR_DATE     \n" +
    "                      \n" +
    "      , o.moloutcode        \n" +
    "      , o.moloutname        \n" +
    " FROM FINMATERIALS     \n" +
    "     , ENESTIMATEITEM     \n" +
    "     , FINMATERIALSSTATUS     \n" +
    "     , ENESTIMATEITEMKIND,    \n" +
    "             \n" +
    " rqfkorder o, rqfkorderitem oi, rqfkorderitem2enstmttm oe       \n" +
    "                 \n" +
    " ----------------------------------  \n" +
    "  WHERE o.statuscode not in (" + RQFKOrderStatus.GOOD + ", " + RQFKOrderStatus.CREATED + ") \n" +
    "    and oi.code = oe.fkorderitemrefcode      \n" +
    "    and o.code = oi.fkorderrefcode   \n" +
    "     AND ENESTIMATEITEM.CODE = FINMATERIALS.ESTIMATEITEMREFCODE    \n" +
    "     AND FINMATERIALSSTATUS.CODE = FINMATERIALS.STATUSREFCODE    \n" +
    "     AND ENESTIMATEITEM.KINDREFCODE = ENESTIMATEITEMKIND.CODE    \n" +
    "     and oe.estimateitemcode = ENESTIMATEITEM.code \n" +
    "     and oe.fkorderitemrefcode = oi.code   \n" +
    "     and oi.fkorderrefcode = o.code   \n" +
    "     and oe.finmaterialsrefcode = FINMATERIALS.code   \n" +
    "     and FINMATERIALS.statusrefcode in (" + FINMaterialsStatus.GOOD + "," + FINMaterialsStatus.MOVED_TO_OPERATIVE + ")" +

    "     and FINMATERIALS.code in (select fff.code from " +
    "        (select f.mat_id, f.nn, f.mat_name, f.mu_id, f.mu_name, f.div_code, f.div_name, f.party_id, f.price, f.bal_sch " +
    "           from finmaterials f " +
    "          where f.estimateitemrefcode in (" + estimateCodes + ")" +
    "            and f.statusrefcode in (" + FINMaterialsStatus.GOOD + "," + FINMaterialsStatus.MOVED_TO_OPERATIVE + ")" +
    "         except " +
    "         select f.mat_id, f.nn, f.mat_name, f.mu_id, f.mu_name, f.div_code, f.div_name, f.party_id, f.price, f.bal_sch " +
    "           from finmaterials f where f.estimateitemrefcode in (" +
    "            select w.estimateitemoutrefcode from enestimateitem2nstmttm w where w.estimateiteminrefcode in (" +
    "            select a.estimateitemoutrefcode from enestimateitem2nstmttm a where a.estimateiteminrefcode in (" + estimateCodes + "))) " +
    "           and f.statusrefcode = " + FINMaterialsStatus.GOOD + ") as sel_fin, " +
    "      finmaterials fff " +
    "      where fff.mat_id = sel_fin.mat_id " +
    "        and fff.nn = sel_fin.nn " +
    "        and fff.mat_name =  sel_fin.mat_name " +
    "        and fff.mu_id = sel_fin.mu_id " +
    "        and fff.mu_name = sel_fin.mu_name " +
    "        and fff.div_code = sel_fin.div_code " +
    "        and fff.div_name = sel_fin.div_name " +
    "        and fff.party_id = sel_fin.party_id " +
    "        and fff.price =  sel_fin.price " +
    "        and fff.bal_sch =  sel_fin.bal_sch " +
    "        and fff.statusrefcode in (" + FINMaterialsStatus.GOOD + "," + FINMaterialsStatus.MOVED_TO_OPERATIVE + ")" +
    "        and fff.estimateitemrefcode in (" + estimateCodes + ")) " +

    " union all \n" +
    "  \n" +
    " --- ПРИХОДЫ \n" +
    " SELECT   \n" +
    "     -1 as FINMATERIALSCODE   \n" +
    "     , oi.nomenclaturenum as NN   \n" +
    "     , oi.nomenclaturename as MAT_NAME   \n" +
    "     , oi.nomenclatureunitname as MU_NAME   \n" +
    "     , o.moloutname as DIV_NAME   \n" +
    "     , (select rqorg.name from rqorg where rqorg.code = o.orgcode) as PARTNER_NAME   \n" +
    "     , o.dategen as DOC_DATE   \n" +
    "     , od2p.partyCode || '_party_description' as PARTY_DISCRIPTION   \n" +
    "     , -1 as REST_PURPOSE_ID   \n" +
    "     , 'Undefined' as REST_PURPOSE_NAME   \n" +
    "     , -1 as REST_PURPOSE_TYPE_ID   \n" +
    "     , -1 as BUDGET_CORE_ID   \n" +
    "     , -1 as FRC_CODE   \n" +
    "     , '' as FRC_NAME   \n" +
    "     , oi.pricewithoutnds as CALC_PRICE   \n" +
    "     , oe.countgen as QUANTITY   \n" +
    "     , oi.pricewithoutnds as PRICE   \n" +
    "     , oi.sumwithoutnds as COST   \n" +
    "     , '20__' as BAL_SCH   \n" +
    "               \n" +
    "      , ENESTIMATEITEM.CODE as ecode    \n" +
    "      , ENESTIMATEITEM.COUNTGEN     \n" +
    "      , ENESTIMATEITEM.COUNTFACT     \n" +
    "      , ENESTIMATEITEM.PRICE as eprice      \n" +
    "      , ENESTIMATEITEM.COST as ecost     \n" +
    "      , ENESTIMATEITEM.USERGEN as eusergen     \n" +
    "      , ENESTIMATEITEM.DATEEDIT as edateedit        \n" +
    "        \n" +
    "      , 1 as STATUSCODE     \n" +
    "      , 'Дійсний' as STATUSNAME     \n" +
    "                         \n" +
    "      , ENESTIMATEITEM.KINDREFCODE as ekindcode    \n" +
    "      , ENESTIMATEITEMKIND.NAME as ekindname     \n" +
    "  \n" +
    "                         \n" +
    "      , '' as USERGEN    \n" +
    "      , o.dategen as DATEEDIT    \n" +
    "                         \n" +
    "      , od2p.partycode as PARTY_ID     \n" +
    "                         \n" +
    "      , null as PARENTREFCODE     \n" +
    "                         \n" +
    "      , null as WEAR_DATE , \n" +
    "                  \n" +
    "      o.moloutcode        \n" +
    "      , o.moloutname        \n" +
    " FROM ENESTIMATEITEM     \n" +
    "     , ENESTIMATEITEMKIND,    \n" +
    "           \n" +
    " rqfkorder o, rqfkorderitem oi, rqfkorderitem2enstmttm oe, \n" +
    " rqfkorderdata2fkparty od2p  \n" +
    "               \n" +
    " ----------------------------------  \n" +
    "  WHERE o.statuscode not in (" + RQFKOrderStatus.GOOD + ", " + RQFKOrderStatus.CREATED + ") \n" +
    "    and oi.code = oe.fkorderitemrefcode      \n" +
    "    and o.code = oi.fkorderrefcode   \n" +
    "    and oe.estimateitemcode in (" + estimateCodes + ") \n" +
    "    and oe.modify_time = ( Select max(fi2ei.modify_time) from rqfkorder rqfkor , rqfkorderitem2enstmttm fi2ei, rqfkorderitem rqfkit    \n" +
    "                                Where rqfkor.statuscode not in (" + RQFKOrderStatus.GOOD + ", " + RQFKOrderStatus.CREATED + ") \n" +
    "                                  and rqfkit.code = fi2ei.fkorderitemrefcode      \n" +
    "                                  and rqfkor.code = rqfkit.fkorderrefcode   \n" +
    "                                  and fi2ei.estimateitemcode in (" + estimateCodes + ") \n" +
    "                                  and fi2ei.estimateitemcode = oe.estimateitemcode \n" +
    "                                  and rqfkor.kindcode <> " + RQFKOrderKind.RASHOD_TRANZIT2OPERATIVE + " )  \n" +
    " ------------------------------  \n" +
    "           \n" +
    "     AND ENESTIMATEITEM.KINDREFCODE = ENESTIMATEITEMKIND.CODE    \n" +
    "     and oe.fkorderitemrefcode = oi.code   \n" +
    "     and oi.fkorderrefcode = o.code   \n" +
    "     and o.kindcode = " + RQFKOrderKind.PRIHOD_POSTAVKA + " \n" +
    "     and oe.estimateitemcode = ENESTIMATEITEM.code \n" +
    "              \n" +
    "     and od2p.estimateitemrefcode = ENESTIMATEITEM.code \n" +
    "     and od2p.fkorderitemrefcode = oi.code \n" +
    "     and od2p.fkorderrefcode = o.code \n" +
    "      \n" +
    " --order by o.moloutcode      \n" +
    " ) as qq         \n" +
    "  \n" +
    " order by moloutcode ";



   try
    {
     statement = connection.prepareStatement(selectStr);


     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
        /*
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }
        */

       anObject = new FINMaterialsShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.nn = set.getString(2);
       anObject.mat_name = set.getString(3);
       anObject.mu_name = set.getString(4);

       //!!! Берем код МОЛа из поля rqfkorder.moloutname (см. ниже)
       //anObject.div_name = set.getString(5);

       anObject.partner_name = set.getString(6);
       anObject.doc_date = set.getDate(7);
       anObject.party_discription = set.getString(8);
       anObject.rest_purpose_id = set.getInt(9);
       if ( set.wasNull() )
           anObject.rest_purpose_id = Integer.MIN_VALUE;
       anObject.rest_purpose_name = set.getString(10);
       anObject.rest_purpose_type_id = set.getInt(11);
       if ( set.wasNull() )
           anObject.rest_purpose_type_id = Integer.MIN_VALUE;
       anObject.budget_core_id = set.getInt(12);
       if ( set.wasNull() )
           anObject.budget_core_id = Integer.MIN_VALUE;
       anObject.frc_code = set.getInt(13);
       if ( set.wasNull() )
           anObject.frc_code = Integer.MIN_VALUE;
       anObject.frc_name = set.getString(14);
       anObject.calc_price = set.getBigDecimal(15);
       if(anObject.calc_price != null)
           anObject.calc_price = anObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.quantity = set.getBigDecimal(16);
       if(anObject.quantity != null)
           anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.price = set.getBigDecimal(17);
       if(anObject.price != null)
           anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.cost = set.getBigDecimal(18);
       if(anObject.cost != null)
           anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.bal_sch = set.getString(19);


       anObject.estimateItemRefCode = set.getInt(20);

       anObject.estimateItemRefCountGen = set.getBigDecimal(21);
       if(anObject.estimateItemRefCountGen != null)
         anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefCountFact = set.getBigDecimal(22);
       if(anObject.estimateItemRefCountFact != null)
         anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefPrice = set.getBigDecimal(23);
       if(anObject.estimateItemRefPrice != null)
         anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefCost = set.getBigDecimal(24);
       if(anObject.estimateItemRefCost != null)
         anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefUserGen = set.getString(25);

       anObject.estimateItemRefDateEdit = set.getDate(26);

       anObject.statusRefCode = set.getInt(27);

       anObject.statusRefName = set.getString(28);

       anObject.estimateItemRefKindCode = set.getInt(29);
       anObject.estimateItemRefKindName = set.getString(30);

       anObject.userGen = set.getString(31);

       //anObject.dateEdit = set.getDate(32);
       anObject.dateEdit = set.getTimestamp(32);

       anObject.party_id = set.getInt(33);

       anObject.parentRefCode = set.getInt(34);
        if(set.wasNull())
        anObject.parentRefCode = Integer.MIN_VALUE;

        anObject.wear_date = set.getDate(35);

        //!!! Берем код и имя МОЛа из полей rqfkorder.moloutcode и rqfkorder.moloutname
        anObject.div_code = set.getString(36);
        anObject.div_name = set.getString(37);

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

  public FINMaterialsShortList getListForOperative2Tranzit(String molCode) throws PersistenceException
  {
	  if (molCode.equals(""))
	  {
		  throw new SystemException("Не задан код МОЛа!");
	  }

	   FINMaterialsShortList result = new FINMaterialsShortList();
	   FINMaterialsShort anObject;
	   result.list = new Vector();

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   ResultSet  set = null;
	   //String     whereStr = "";

	   if(getUserProfile() == null)
	    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	   selectStr =
			   "  SELECT " +
			   "     CODE  " +
			   "     ,NN  " +
			   "     ,MAT_NAME  " +
			   "     ,MU_NAME  " +
			   "   " +
			   "     ,aaa.moloutcode  " +
			   "     ,aaa.molname  " +
			   "   " +
			   "     ,PARTNER_NAME  " +
			   "     ,DOC_DATE  " +
			   "     ,PARTY_DISCRIPTION  " +
			   "     ,aaa.REST_PURPOSE_ID  " +
			   "     ,aaa.REST_PURPOSE_NAME  " +
			   "     ,aaa.REST_PURPOSE_TYPE_ID  " +
			   "     ,BUDGET_CORE_ID  " +
			   "     ,FRC_CODE  " +
			   "     ,FRC_NAME  " +
			   "     ,CALC_PRICE  " +
			   "     ,aaa.countfact  " +
			   "     ,PRICE  " +
			   "     ,aaa.summa  " +
			   "     ,BAL_SCH  " +
			   "   " +
			   "     , fm.estimateitemrefcode  " +
			   "     , aaa.partycode  " +
			   "   " +
			   "  FROM finmaterials fm, aaa " +
			   "  WHERE fm.code = aaa.finmaterialscode " +
			   "    and aaa.moloutcode = '" + molCode + "'" +
			   "  ORDER BY fm.code";

	   try
	    {
	     statement = connection.prepareStatement(selectStr);


	     set = statement.executeQuery();
	     int i;
	     for(i = 0;set.next();i++)
	      {
	        /*
	       if(i < fromPosition)
	        continue;
	       else if(i >= fromPosition + quantity)
	        {
	         i++;
	         break;
	        }
	        */

	       anObject = new FINMaterialsShort();

	       anObject.code = set.getInt(1);
	       if ( set.wasNull() )
	           anObject.code = Integer.MIN_VALUE;
	       anObject.nn = set.getString(2);
	       anObject.mat_name = set.getString(3);
	       anObject.mu_name = set.getString(4);

	       anObject.div_code = set.getString(5);
	       anObject.div_name = set.getString(6);

	       anObject.partner_name = set.getString(7);
	       anObject.doc_date = set.getDate(8);
	       anObject.party_discription = set.getString(9);
	       anObject.rest_purpose_id = set.getInt(10);
	       if ( set.wasNull() )
	           anObject.rest_purpose_id = Integer.MIN_VALUE;
	       anObject.rest_purpose_name = set.getString(11);
	       anObject.rest_purpose_type_id = set.getInt(12);
	       if ( set.wasNull() )
	           anObject.rest_purpose_type_id = Integer.MIN_VALUE;
	       anObject.budget_core_id = set.getInt(13);
	       if ( set.wasNull() )
	           anObject.budget_core_id = Integer.MIN_VALUE;
	       anObject.frc_code = set.getInt(14);
	       if ( set.wasNull() )
	           anObject.frc_code = Integer.MIN_VALUE;
	       anObject.frc_name = set.getString(15);
	       anObject.calc_price = set.getBigDecimal(16);
	       if(anObject.calc_price != null)
	           anObject.calc_price = anObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
	       anObject.quantity = set.getBigDecimal(17);
	       if(anObject.quantity != null)
	           anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	       anObject.price = set.getBigDecimal(18);
	       if(anObject.price != null)
	           anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
	       anObject.cost = set.getBigDecimal(19);
	       if(anObject.cost != null)
	           anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	       anObject.bal_sch = set.getString(20);

	       anObject.estimateItemRefCode = set.getInt(21);

	       anObject.party_id = set.getInt(22);

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



  public FINMaterialsShortList getFilteredPartyListWriteOff(int estimateItemCode, String codeMol) throws PersistenceException
  {

   FINMaterialsShortList result = new FINMaterialsShortList();
   FINMaterialsShort anObject;
   result.list = new Vector();

   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     selectStr =
    " select DISTINCT(fm.nn) , fm.party_id from finmaterials fm , enestimateitem2nstmttm e2e   \n" +
    "  where fm.estimateitemrefcode = e2e.estimateiteminrefcode  \n" +
    "    and e2e.typerefcode = 6 \n" +
    "    and e2e.estimateitemoutrefcode = " + estimateItemCode + " \n" +
    "    and fm.div_code = " + codeMol + "::text";

   try
    {
     statement = connection.prepareStatement(selectStr);



     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       anObject = new FINMaterialsShort();
       anObject.nn = set.getString(1);
       anObject.party_id = set.getInt(2);
       if (set.wasNull())
        anObject.party_id = Integer.MIN_VALUE;

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


   } // end of getFilteredCodeArray


  public FINMaterialsShortList getListForpackingListWithPallete(String estimateCodes, String condition) throws PersistenceException
  {
   FINMaterialsShortList result = new FINMaterialsShortList();
   FINMaterialsShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   //String     whereStr = "";

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

/* 25.10.11 ДОБАВИЛИСЬ ПРИХОДЫ. СМ. НИЖЕ
   selectStr =
    " SELECT   \n" +
    "     FINMATERIALS.CODE  \n" +
    "     ,FINMATERIALS.NN  \n" +
    "     ,FINMATERIALS.MAT_NAME  \n" +
    "     ,FINMATERIALS.MU_NAME  \n" +
    "     ,FINMATERIALS.DIV_NAME  \n" +
    "     ,FINMATERIALS.PARTNER_NAME  \n" +
    "     ,FINMATERIALS.DOC_DATE  \n" +
    "     ,FINMATERIALS.PARTY_DISCRIPTION  \n" +
    "     ,FINMATERIALS.REST_PURPOSE_ID  \n" +
    "     ,FINMATERIALS.REST_PURPOSE_NAME  \n" +
    "     ,FINMATERIALS.REST_PURPOSE_TYPE_ID  \n" +
    "     ,FINMATERIALS.BUDGET_CORE_ID  \n" +
    "     ,FINMATERIALS.FRC_CODE  \n" +
    "     ,FINMATERIALS.FRC_NAME  \n" +
    "     ,FINMATERIALS.CALC_PRICE  \n" +
    "     ,FINMATERIALS.QUANTITY  \n" +
    "     ,FINMATERIALS.PRICE  \n" +
    "     ,FINMATERIALS.COST  \n" +
    "     ,FINMATERIALS.BAL_SCH  \n" +
    "           \n" +
    "      , ENESTIMATEITEM.CODE    \n" +
    "      , ENESTIMATEITEM.COUNTGEN    \n" +
    "      , ENESTIMATEITEM.COUNTFACT    \n" +
    "      , ENESTIMATEITEM.PRICE    \n" +
    "      , ENESTIMATEITEM.COST    \n" +
    "      , ENESTIMATEITEM.USERGEN    \n" +
    "      , ENESTIMATEITEM.DATEEDIT    \n" +
    "      , FINMATERIALSSTATUS.CODE    \n" +
    "      , FINMATERIALSSTATUS.NAME    \n" +
    "                \n" +
    "      , ENESTIMATEITEM.KINDREFCODE   \n" +
    "      , ENESTIMATEITEMKIND.NAME   \n" +
    "                \n" +
    "      , FINMATERIALS.USERGEN   \n" +
    "      , FINMATERIALS.DATEEDIT   \n" +
    "                \n" +
    "      , FINMATERIALS.PARTY_ID    \n" +
    "                \n" +
    "      , FINMATERIALS.PARENTREFCODE    \n" +
    "                \n" +
    "      , FINMATERIALS.WEAR_DATE    \n" +
    "           \n" +
    "      , o.moloutcode       \n" +
    "      , o.moloutname       \n" +
    " FROM FINMATERIALS    \n" +
    "     , ENESTIMATEITEM    \n" +
    "     , FINMATERIALSSTATUS    \n" +
    "     , ENESTIMATEITEMKIND,   \n" +
    "  \n" +
    " rqfkorder o, rqfkorderitem oi, rqfkorderitem2enstmttm oe      \n" +
    "      \n" +
    " ---------------------------------- \n" +
    "  WHERE o.statuscode not in (" + RQFKOrderStatus.GOOD + ", " + RQFKOrderStatus.CREATED + ") \n" +
    "    and oi.code = oe.fkorderitemrefcode     \n" +
    "    and o.code = oi.fkorderrefcode  \n" +
    "    and oe.estimateitemcode in (" + estimateCodes + ") \n" +
    "    and oe.modify_time = ( Select max(fi2ei.modify_time) from rqfkorder rqfkor , rqfkorderitem2enstmttm fi2ei, rqfkorderitem rqfkit   \n" +
    "                                Where rqfkor.statuscode not in (" + RQFKOrderStatus.GOOD + ", " + RQFKOrderStatus.CREATED + ") \n" +
    "                                  and rqfkit.code = fi2ei.fkorderitemrefcode     \n" +
    "                                  and rqfkor.code = rqfkit.fkorderrefcode  \n" +
    "                                  and fi2ei.estimateitemcode in (" + estimateCodes + ")) \n" +
    " ------------------------------ \n" +
    "  \n" +
    "     AND ENESTIMATEITEM.CODE = FINMATERIALS.ESTIMATEITEMREFCODE   \n" +
    "     AND FINMATERIALSSTATUS.CODE = FINMATERIALS.STATUSREFCODE   \n" +
    "     AND ENESTIMATEITEM.KINDREFCODE = ENESTIMATEITEMKIND.CODE   \n" +
    "     and oe.fkorderitemrefcode = oi.code  \n" +
    "     and oi.fkorderrefcode = o.code  \n" +
    "     and o.kindcode = " + RQFKOrderKind.RASHOD_OE2REM + " \n" + //??? А RASHOD_OPERATIVE2TRANZIT и RASHOD_E2E ???
    "     and oe.finmaterialsrefcode = FINMATERIALS.code  \n" +
    "     and FINMATERIALS.statusrefcode = " + FINMaterialsStatus.GOOD + " \n" +
    "     \n" +
    " order by o.moloutcode ";
*/

   selectStr =
    " SELECT \n" +
    "     CODE   \n" +
    "     ,NN   \n" +
    "     ,MAT_NAME   \n" +
    "     ,MU_NAME   \n" +
    "     ,DIV_NAME   \n" +
    "     ,PARTNER_NAME   \n" +
    "     ,DOC_DATE   \n" +
    "     ,PARTY_DISCRIPTION   \n" +
    "     ,REST_PURPOSE_ID   \n" +
    "     ,REST_PURPOSE_NAME   \n" +
    "     ,REST_PURPOSE_TYPE_ID   \n" +
    "     ,BUDGET_CORE_ID   \n" +
    "     ,FRC_CODE   \n" +
    "     ,FRC_NAME   \n" +
    "     ,CALC_PRICE   \n" +
    "     ,QUANTITY   \n" +
    "     ,PRICE   \n" +
    "     ,COST   \n" +
    "     ,BAL_SCH   \n" +
    "                      \n" +
    "      , ecode    \n" +
    "      , COUNTGEN     \n" +
    "      , COUNTFACT     \n" +
    "      , eprice      \n" +
    "      , ecost     \n" +
    "      , eusergen     \n" +
    "      , edateedit   \n" +
    "        \n" +
    "      , statuscode     \n" +
    "      , statusname    \n" +
    "                           \n" +
    "      , ekindcode    \n" +
    "      , ekindname  \n" +
    "                           \n" +
    "      , USERGEN    \n" +
    "      , DATEEDIT    \n" +
    "                           \n" +
    "      , PARTY_ID     \n" +
    "                           \n" +
    "      , PARENTREFCODE     \n" +
    "                           \n" +
    "      , WEAR_DATE     \n" +
    "                      \n" +
    "      , moloutcode        \n" +
    "      , moloutname   \n" +
    " FROM \n" +
    " ( \n" +
    " --- РАСХОДЫ \n" +


    /* " SELECT    \n" +
    "     FINMATERIALS.CODE   \n" +
    "     ,FINMATERIALS.NN   \n" +
    "     ,FINMATERIALS.MAT_NAME   \n" +
    "     ,FINMATERIALS.MU_NAME   \n" +
    "     ,FINMATERIALS.DIV_NAME   \n" +
    "     ,FINMATERIALS.PARTNER_NAME   \n" +
    "     ,FINMATERIALS.DOC_DATE   \n" +
    "     ,FINMATERIALS.PARTY_DISCRIPTION   \n" +
    "     ,FINMATERIALS.REST_PURPOSE_ID   \n" +
    "     ,FINMATERIALS.REST_PURPOSE_NAME   \n" +
    "     ,FINMATERIALS.REST_PURPOSE_TYPE_ID   \n" +
    "     ,FINMATERIALS.BUDGET_CORE_ID   \n" +
    "     ,FINMATERIALS.FRC_CODE   \n" +
    "     ,FINMATERIALS.FRC_NAME   \n" +
    "     ,FINMATERIALS.CALC_PRICE   \n" +
    "     ,FINMATERIALS.QUANTITY   \n" +
    "     ,FINMATERIALS.PRICE   \n" +
    "     ,FINMATERIALS.COST   \n" +
    "     ,FINMATERIALS.BAL_SCH   \n" +
    "                      \n" +
    "      , ENESTIMATEITEM.CODE as ecode    \n" +
    "      , ENESTIMATEITEM.COUNTGEN     \n" +
    "      , ENESTIMATEITEM.COUNTFACT     \n" +
    "      , ENESTIMATEITEM.PRICE as eprice      \n" +
    "      , ENESTIMATEITEM.COST as ecost     \n" +
    "      , ENESTIMATEITEM.USERGEN as eusergen     \n" +
    "      , ENESTIMATEITEM.DATEEDIT as edateedit   \n" +
    "        \n" +
    "      , FINMATERIALSSTATUS.CODE as statuscode     \n" +
    "      , FINMATERIALSSTATUS.NAME as statusname    \n" +
    "                           \n" +
    "      , ENESTIMATEITEM.KINDREFCODE as ekindcode    \n" +
    "      , ENESTIMATEITEMKIND.NAME as ekindname   \n" +
    "                           \n" +
    "      , FINMATERIALS.USERGEN    \n" +
    "      , FINMATERIALS.DATEEDIT    \n" +
    "                           \n" +
    "      , FINMATERIALS.PARTY_ID     \n" +
    "                           \n" +
    "      , FINMATERIALS.PARENTREFCODE     \n" +
    "                           \n" +
    "      , FINMATERIALS.WEAR_DATE     \n" +
    "                      \n" +
    "      , o.moloutcode        \n" +
    "      , o.moloutname        \n" +
    " FROM FINMATERIALS     \n" +
    "     , ENESTIMATEITEM     \n" +
    "     , FINMATERIALSSTATUS     \n" +
    "     , ENESTIMATEITEMKIND,    \n" +
    "             \n" +
    " rqfkorder o, rqfkorderitem oi, rqfkorderitem2enstmttm oe       \n" +
    "                 \n" +
    " ----------------------------------  \n" +
    "  WHERE o.statuscode not in (" + RQFKOrderStatus.GOOD + ", " + RQFKOrderStatus.CREATED + ") \n" +
    "    and oi.code = oe.fkorderitemrefcode      \n" +
    "    and o.code = oi.fkorderrefcode   \n" +
    "    and oe.estimateitemcode in (" + estimateCodes + ") \n" +
    "    and oe.modify_time = ( Select max(fi2ei.modify_time) from rqfkorder rqfkor , rqfkorderitem2enstmttm fi2ei, rqfkorderitem rqfkit    \n" +
    "                                Where rqfkor.statuscode not in (" + RQFKOrderStatus.GOOD + ", " + RQFKOrderStatus.CREATED + ") \n" +
    "                                  and rqfkit.code = fi2ei.fkorderitemrefcode      \n" +
    "                                  and rqfkor.code = rqfkit.fkorderrefcode   \n" +
    //"                                  and fi2ei.estimateitemcode in (" + estimateCodes + ") \n" +
    "                                  and fi2ei.estimateitemcode = oe.estimateitemcode \n" +
    "                                  and rqfkor.kindcode <> " + RQFKOrderKind.RASHOD_TRANZIT2OPERATIVE + " )  \n" +
    " ------------------------------  \n" +
    "             \n" +
    "     AND ENESTIMATEITEM.CODE = FINMATERIALS.ESTIMATEITEMREFCODE    \n" +
    "     AND FINMATERIALSSTATUS.CODE = FINMATERIALS.STATUSREFCODE    \n" +
    "     AND ENESTIMATEITEM.KINDREFCODE = ENESTIMATEITEMKIND.CODE    \n" +
    "     and oe.estimateitemcode = ENESTIMATEITEM.code \n" +
    "     and oe.fkorderitemrefcode = oi.code   \n" +
    "     and oi.fkorderrefcode = o.code   \n" +
    //"     and o.kindcode in (2, 4, 5, 6) --  // + RASHOD_OPERATIVE2TRANZIT и RASHOD_E2E \n" +
    "     and o.kindcode in (" + RQFKOrderKind.RASHOD_OE2REM + ", " + RQFKOrderKind.RASHOD_OE2OUT + ", " +
                                    RQFKOrderKind.RASHOD_OPERATIVE2TRANZIT + ", " + RQFKOrderKind.RASHOD_E2E + ") \n" +
    "     and oe.finmaterialsrefcode = FINMATERIALS.code   \n" +
    "     and FINMATERIALS.statusrefcode = " + FINMaterialsStatus.GOOD + " \n" +
    "                \n" +
    " --order by o.moloutcode  \n" +
    "  \n" +  */


    /* 18.11.2011 пробуем отловить транзит, который уже был переброшен из оперативного */

    " SELECT    \n" +
    "     FINMATERIALS.CODE   \n" +
    "     ,FINMATERIALS.NN   \n" +
    "     ,FINMATERIALS.MAT_NAME   \n" +
    "     ,FINMATERIALS.MU_NAME   \n" +
    "     ,FINMATERIALS.DIV_NAME   \n" +
    "     ,FINMATERIALS.PARTNER_NAME   \n" +
    "     ,FINMATERIALS.DOC_DATE   \n" +
    "     ,FINMATERIALS.PARTY_DISCRIPTION   \n" +
    "     ,FINMATERIALS.REST_PURPOSE_ID   \n" +
    "     ,FINMATERIALS.REST_PURPOSE_NAME   \n" +
    "     ,FINMATERIALS.REST_PURPOSE_TYPE_ID   \n" +
    "     ,FINMATERIALS.BUDGET_CORE_ID   \n" +
    "     ,FINMATERIALS.FRC_CODE   \n" +
    "     ,FINMATERIALS.FRC_NAME   \n" +
    "     ,FINMATERIALS.CALC_PRICE   \n" +
    "     ,FINMATERIALS.QUANTITY   \n" +
    "     ,FINMATERIALS.PRICE   \n" +
    "     ,FINMATERIALS.COST   \n" +
    "     ,FINMATERIALS.BAL_SCH   \n" +
    "                      \n" +
    "      , ENESTIMATEITEM.CODE as ecode    \n" +
    "      , ENESTIMATEITEM.COUNTGEN     \n" +
    "      , ENESTIMATEITEM.COUNTFACT     \n" +
    "      , ENESTIMATEITEM.PRICE as eprice      \n" +
    "      , ENESTIMATEITEM.COST as ecost     \n" +
    "      , ENESTIMATEITEM.USERGEN as eusergen     \n" +
    "      , ENESTIMATEITEM.DATEEDIT as edateedit   \n" +
    "        \n" +
    "      , FINMATERIALSSTATUS.CODE as statuscode     \n" +
    "      , FINMATERIALSSTATUS.NAME as statusname    \n" +
    "                           \n" +
    "      , ENESTIMATEITEM.KINDREFCODE as ekindcode    \n" +
    "      , ENESTIMATEITEMKIND.NAME as ekindname   \n" +
    "                           \n" +
    "      , FINMATERIALS.USERGEN    \n" +
    "      , FINMATERIALS.DATEEDIT    \n" +
    "                           \n" +
    "      , FINMATERIALS.PARTY_ID     \n" +
    "                           \n" +
    "      , FINMATERIALS.PARENTREFCODE     \n" +
    "                           \n" +
    "      , FINMATERIALS.WEAR_DATE     \n" +
    "                      \n" +
    "      , o.moloutcode        \n" +
    "      , o.moloutname        \n" +
    " FROM FINMATERIALS     \n" +
    "     , ENESTIMATEITEM     \n" +
    "     , FINMATERIALSSTATUS     \n" +
    "     , ENESTIMATEITEMKIND,    \n" +
    "             \n" +
    " rqfkorder o, rqfkorderitem oi, rqfkorderitem2enstmttm oe       \n" +
    "                 \n" +
    " ----------------------------------  \n" +
    "  WHERE o.statuscode not in (" + RQFKOrderStatus.GOOD + ", " + RQFKOrderStatus.CREATED + ") \n" +
    "    and oi.code = oe.fkorderitemrefcode      \n" +
    "    and o.code = oi.fkorderrefcode   \n" +
    "     AND ENESTIMATEITEM.CODE = FINMATERIALS.ESTIMATEITEMREFCODE    \n" +
    "     AND FINMATERIALSSTATUS.CODE = FINMATERIALS.STATUSREFCODE    \n" +
    "     AND ENESTIMATEITEM.KINDREFCODE = ENESTIMATEITEMKIND.CODE    \n" +
    "     and oe.estimateitemcode = ENESTIMATEITEM.code \n" +
    "     and oe.fkorderitemrefcode = oi.code   \n" +
    "     and oi.fkorderrefcode = o.code   \n" +
    "     and oe.finmaterialsrefcode = FINMATERIALS.code   \n" +
    "     and FINMATERIALS.statusrefcode in (" + FINMaterialsStatus.GOOD + "," + FINMaterialsStatus.MOVED_TO_OPERATIVE + ")" +

    "     and FINMATERIALS.code in (select fff.code from " +
    "        (select f.mat_id, f.nn, f.mat_name, f.mu_id, f.mu_name, f.div_code, f.div_name, f.party_id, f.price, f.bal_sch " +
    "           from finmaterials f " +
    "          where f.estimateitemrefcode in (" + estimateCodes + ")" +
    "            and f.statusrefcode in (" + FINMaterialsStatus.GOOD + "," + FINMaterialsStatus.MOVED_TO_OPERATIVE + ")" +
    "         except " +
    "         select f.mat_id, f.nn, f.mat_name, f.mu_id, f.mu_name, f.div_code, f.div_name, f.party_id, f.price, f.bal_sch " +
    "           from finmaterials f where f.estimateitemrefcode in (" +
    "            select w.estimateitemoutrefcode from enestimateitem2nstmttm w where w.estimateiteminrefcode in (" +
    "            select a.estimateitemoutrefcode from enestimateitem2nstmttm a where a.estimateiteminrefcode in (" + estimateCodes + "))) " +
    "           and f.statusrefcode = " + FINMaterialsStatus.GOOD + ") as sel_fin, " +
    "      finmaterials fff " +
    "      where fff.mat_id = sel_fin.mat_id " +
    "        and fff.nn = sel_fin.nn " +
    "        and fff.mat_name =  sel_fin.mat_name " +
    "        and fff.mu_id = sel_fin.mu_id " +
    "        and fff.mu_name = sel_fin.mu_name " +
    "        and fff.div_code = sel_fin.div_code " +
    "        and fff.div_name = sel_fin.div_name " +
    "        and fff.party_id = sel_fin.party_id " +
    "        and fff.price =  sel_fin.price " +
    "        and fff.bal_sch =  sel_fin.bal_sch " +
    "        and fff.statusrefcode in (" + FINMaterialsStatus.GOOD + "," + FINMaterialsStatus.MOVED_TO_OPERATIVE + ")" +
    "        and fff.estimateitemrefcode in (" + estimateCodes + ")) " +

    " union all \n" +
    "  \n" +
    " --- ПРИХОДЫ \n" +
    " SELECT   \n" +
    "     -1 as FINMATERIALSCODE   \n" +
    "     , oi.nomenclaturenum as NN   \n" +
    "     , oi.nomenclaturename as MAT_NAME   \n" +
    "     , oi.nomenclatureunitname as MU_NAME   \n" +
    "     , o.moloutname as DIV_NAME   \n" +
    "     , (select rqorg.name from rqorg where rqorg.code = o.orgcode) as PARTNER_NAME   \n" +
    "     , o.dategen as DOC_DATE   \n" +
    "     , od2p.partyCode || '_party_description' as PARTY_DISCRIPTION   \n" +
    "     , -1 as REST_PURPOSE_ID   \n" +
    "     , 'Undefined' as REST_PURPOSE_NAME   \n" +
    "     , -1 as REST_PURPOSE_TYPE_ID   \n" +
    "     , -1 as BUDGET_CORE_ID   \n" +
    "     , -1 as FRC_CODE   \n" +
    "     , '' as FRC_NAME   \n" +
    "     , oi.pricewithoutnds as CALC_PRICE   \n" +
    "     , oe.countgen as QUANTITY   \n" +
    "     , oi.pricewithoutnds as PRICE   \n" +
    "     , oi.sumwithoutnds as COST   \n" +
    "     , '20__' as BAL_SCH   \n" +
    "               \n" +
    "      , ENESTIMATEITEM.CODE as ecode    \n" +
    "      , ENESTIMATEITEM.COUNTGEN     \n" +
    "      , ENESTIMATEITEM.COUNTFACT     \n" +
    "      , ENESTIMATEITEM.PRICE as eprice      \n" +
    "      , ENESTIMATEITEM.COST as ecost     \n" +
    "      , ENESTIMATEITEM.USERGEN as eusergen     \n" +
    "      , ENESTIMATEITEM.DATEEDIT as edateedit        \n" +
    "        \n" +
    "      , 1 as STATUSCODE     \n" +
    "      , 'Дійсний' as STATUSNAME     \n" +
    "                         \n" +
    "      , ENESTIMATEITEM.KINDREFCODE as ekindcode    \n" +
    "      , ENESTIMATEITEMKIND.NAME as ekindname     \n" +
    "  \n" +
    "                         \n" +
    "      , '' as USERGEN    \n" +
    "      , o.dategen as DATEEDIT    \n" +
    "                         \n" +
    "      , od2p.partycode as PARTY_ID     \n" +
    "                         \n" +
    "      , null as PARENTREFCODE     \n" +
    "                         \n" +
    "      , null as WEAR_DATE , \n" +
    "                  \n" +
    "      o.moloutcode        \n" +
    "      , o.moloutname        \n" +
    " FROM ENESTIMATEITEM     \n" +
    "     , ENESTIMATEITEMKIND,    \n" +
    "           \n" +
    " rqfkorder o, rqfkorderitem oi, rqfkorderitem2enstmttm oe, \n" +
    " rqfkorderdata2fkparty od2p  \n" +
    "               \n" +
    " ----------------------------------  \n" +
    "  WHERE o.statuscode not in (" + RQFKOrderStatus.GOOD + ", " + RQFKOrderStatus.CREATED + ") \n" +
    "    and oi.code = oe.fkorderitemrefcode      \n" +
    "    and o.code = oi.fkorderrefcode   \n" +
    "    and oe.estimateitemcode in (" + estimateCodes + ") \n" +
    "    and oe.modify_time = ( Select max(fi2ei.modify_time) from rqfkorder rqfkor , rqfkorderitem2enstmttm fi2ei, rqfkorderitem rqfkit    \n" +
    "                                Where rqfkor.statuscode not in (" + RQFKOrderStatus.GOOD + ", " + RQFKOrderStatus.CREATED + ") \n" +
    "                                  and rqfkit.code = fi2ei.fkorderitemrefcode      \n" +
    "                                  and rqfkor.code = rqfkit.fkorderrefcode   \n" +
    //"                                  and fi2ei.estimateitemcode in (" + estimateCodes + ") \n" +
    "                                  and fi2ei.estimateitemcode = oe.estimateitemcode \n" +
    "                                  and rqfkor.kindcode <> " + RQFKOrderKind.RASHOD_TRANZIT2OPERATIVE + " )  \n" +
    " ------------------------------  \n" +
    "           \n" +
    "     AND ENESTIMATEITEM.KINDREFCODE = ENESTIMATEITEMKIND.CODE    \n" +
    "     and oe.fkorderitemrefcode = oi.code   \n" +
    "     and oi.fkorderrefcode = o.code   \n" +
    "     and o.kindcode = " + RQFKOrderKind.PRIHOD_POSTAVKA + " \n" +
    "     and oe.estimateitemcode = ENESTIMATEITEM.code \n" +
    "              \n" +
    "     and od2p.estimateitemrefcode = ENESTIMATEITEM.code \n" +
    "     and od2p.fkorderitemrefcode = oi.code \n" +
    "     and od2p.fkorderrefcode = o.code \n" +
    "      \n" +
    " --order by o.moloutcode      \n" +
    " ) as qq         \n" +
    "  \n" +
    " order by moloutcode ";



   try
    {
     statement = connection.prepareStatement(selectStr);


     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
        /*
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }
        */

       anObject = new FINMaterialsShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.nn = set.getString(2);
       anObject.mat_name = set.getString(3);
       anObject.mu_name = set.getString(4);

       //!!! Берем код МОЛа из поля rqfkorder.moloutname (см. ниже)
       //anObject.div_name = set.getString(5);

       anObject.partner_name = set.getString(6);
       anObject.doc_date = set.getDate(7);
       anObject.party_discription = set.getString(8);
       anObject.rest_purpose_id = set.getInt(9);
       if ( set.wasNull() )
           anObject.rest_purpose_id = Integer.MIN_VALUE;
       anObject.rest_purpose_name = set.getString(10);
       anObject.rest_purpose_type_id = set.getInt(11);
       if ( set.wasNull() )
           anObject.rest_purpose_type_id = Integer.MIN_VALUE;
       anObject.budget_core_id = set.getInt(12);
       if ( set.wasNull() )
           anObject.budget_core_id = Integer.MIN_VALUE;
       anObject.frc_code = set.getInt(13);
       if ( set.wasNull() )
           anObject.frc_code = Integer.MIN_VALUE;
       anObject.frc_name = set.getString(14);
       anObject.calc_price = set.getBigDecimal(15);
       if(anObject.calc_price != null)
           anObject.calc_price = anObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.quantity = set.getBigDecimal(16);
       if(anObject.quantity != null)
           anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.price = set.getBigDecimal(17);
       if(anObject.price != null)
           anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.cost = set.getBigDecimal(18);
       if(anObject.cost != null)
           anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.bal_sch = set.getString(19);


       anObject.estimateItemRefCode = set.getInt(20);

       anObject.estimateItemRefCountGen = set.getBigDecimal(21);
       if(anObject.estimateItemRefCountGen != null)
         anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefCountFact = set.getBigDecimal(22);
       if(anObject.estimateItemRefCountFact != null)
         anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefPrice = set.getBigDecimal(23);
       if(anObject.estimateItemRefPrice != null)
         anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefCost = set.getBigDecimal(24);
       if(anObject.estimateItemRefCost != null)
         anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.estimateItemRefUserGen = set.getString(25);

       anObject.estimateItemRefDateEdit = set.getDate(26);

       anObject.statusRefCode = set.getInt(27);

       anObject.statusRefName = set.getString(28);

       anObject.estimateItemRefKindCode = set.getInt(29);
       anObject.estimateItemRefKindName = set.getString(30);

       anObject.userGen = set.getString(31);

       //anObject.dateEdit = set.getDate(32);
       anObject.dateEdit = set.getTimestamp(32);

       anObject.party_id = set.getInt(33);

       anObject.parentRefCode = set.getInt(34);
        if(set.wasNull())
        anObject.parentRefCode = Integer.MIN_VALUE;

        anObject.wear_date = set.getDate(35);

        //!!! Берем код и имя МОЛа из полей rqfkorder.moloutcode и rqfkorder.moloutname
        anObject.div_code = set.getString(36);
        anObject.div_name = set.getString(37);

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

  public FINMaterials copy(FINMaterials object)
  {
	  FINMaterials newFinMaterial = new FINMaterials();
      newFinMaterial.estimateItemRef.code = object.estimateItemRef.code;
      newFinMaterial.div_code = object.div_code;
      newFinMaterial.finDocItemCode = object.finDocItemCode;
      newFinMaterial.quantity = object.quantity;
      newFinMaterial.nn = object.nn;
      newFinMaterial.mat_name = object.mat_name;
      newFinMaterial.mu_name = object.mu_name;
      newFinMaterial.div_name = object.div_name;
      newFinMaterial.rest_purpose_name = object.rest_purpose_name;
      newFinMaterial.nn = object.nn;
      newFinMaterial.partner_name = object.partner_name;
      newFinMaterial.doc_date = object.doc_date;
      newFinMaterial.party_discription = object.party_discription;
      newFinMaterial.rest_purpose_id = object.rest_purpose_id;
      newFinMaterial.rest_purpose_type_id = object.rest_purpose_type_id;
      newFinMaterial.budget_core_id = object.budget_core_id;
      newFinMaterial.frc_code = object.frc_code;
      newFinMaterial.frc_name = object.frc_name;
      newFinMaterial.calc_price = object.calc_price;
      newFinMaterial.price = object.price;
      newFinMaterial.cost = object.cost;
      newFinMaterial.bal_sch = object.bal_sch;
      newFinMaterial.mat_id = object.mat_id;
      newFinMaterial.party_id = object.party_id;
      newFinMaterial.partner = object.partner;
      newFinMaterial.mu_id = object.mu_id;
      newFinMaterial.doc_num = object.doc_num;
      newFinMaterial.fullQuantity = object.fullQuantity;
      newFinMaterial.fullCost = object.fullCost;
      newFinMaterial.molDataRef.code = object.molDataRef.code;
      newFinMaterial.wear_date = object.wear_date;

      return newFinMaterial;
  }



  public FINMaterialsShortList getListForTranzit2OperativeByPlanCode(int planCode) throws PersistenceException
  {
   FINMaterialsShortList result = new FINMaterialsShortList();
   FINMaterialsShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   //String     whereStr = "";

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");


   selectStr =
     " select q.partycode, q.molcode, q.molname, q.frc_code, q.frc_name, " +
            " q.mat_nn, q.mat_name,q.mu_name, sum(q.quantity) as quantity, " +

     /**
      *	 при отсутствии эстимейта, берем любой из полученного набора....
      *  +++ поправочка на на один эстимейт...
      */
	 "	coalesce( ( select ei.code from enestimateitem ei, finmaterials f " +
     "			     where ei.kindrefcode = " + ENEstimateItemKind.MATERIALS +
     "	               and ei.countfact > 0 " +
     "	               and ei.planrefcode = " + planCode +
     "	               and ei.code = f.estimateitemrefcode " +
     "	               and f.nn = q.mat_nn limit 1),  " +
     " 			(select eit.code from enestimateitem eit " +
     "            where eit.countfact > 0 " +
     "	            and eit.kindrefcode = " + ENEstimateItemKind.MATERIALS +
     "	            and eit.statusrefcode = " + ENEstimateItemStatus.PRESENT +
     "	            and eit.planrefcode = " + planCode + " limit 1 ) ) as estimateitemcode " +

      	/*
            " (select ei.code from enestimateitem ei, finmaterials f " +
            " where ei.kindrefcode = 1 and ei.countfact > 0 and ei.planrefcode = " + planCode +
            " and ei.code = f.estimateitemrefcode and f.nn = q.mat_nn " +
            " limit 1) as estimateitemcode " +
        */

      		" from " +
			" ( " +
            " select fies1.estimateitemcode, fopa1.partycode, fies1.countgen as quantity," +
            " fo1.moloutcode as molcode, fo1.moloutname as molname, " +
            " d2r.fincfocode as frc_code, dp.shortname as frc_name, " +
            " fi1.nomenclaturenum as mat_nn, fi1.nomenclaturename as mat_name, " +
            " fi1.nomenclatureunitname as mu_name " +
	 " from rqfkorderitem2enstmttm as fies1 inner join rqfkorderitem as fi1 on fies1.fkorderitemrefcode = fi1.code " +
     " inner join rqfkorder as fo1 on fi1.fkorderrefcode = fo1.code " +
     " inner join rqfkorderdata2fkparty as fopa1 on (fi1.code = fopa1.fkorderitemrefcode and fies1.estimateitemcode = fopa1.estimateitemrefcode) " +
	 " inner join enestimateitem as ei on fies1.estimateitemcode = ei.code " +
     " inner join enplanwork as pl on pl.code = ei.planrefcode " +
     " inner join endepartment2epren as d2r on d2r.departmentrefcode = pl.budgetrefcode " +
     " inner join endepartment as dp on pl.budgetrefcode = dp.code " +
     " where fo1.kindcode in (1,15) and fies1.estimateitemcode in ( " +
     " select ei.code from enestimateitem ei where ei.kindrefcode = 1 and ei.countfact > 0 and ei.planrefcode = " + planCode + ")" +

     " union all " +

     " select  rem1.estimateitemrefcode, fopa1.partycode, rem1.countgen as quantity ," +
             " fo1.moloutcode as molcode, fo1.moloutname as molname, " +
             " d2r.fincfocode as frc_code, dp.shortname as frc_name, " +
             " fi1.nomenclaturenum as mat_nn, fi1.nomenclaturename as mat_name," +
             " fi1.nomenclatureunitname as mu_name " +
	 " from rqfkorderitemremainder as rem1 inner join rqfkorderitem as fi1 on rem1.fkorderitemrefcode = fi1.code " +
	 " inner join rqfkorder as fo1 on fi1.fkorderrefcode = fo1.code " +
	 " inner join rqfkorderdata2fkparty as fopa1 on (fi1.code = fopa1.fkorderitemrefcode and rem1.estimateitemrefcode = fopa1.estimateitemrefcode) " +
	 " left join endepartment2epren d2r on  d2r.departmentrefcode = rem1.budgetcode " +
     " left join endepartment dp on rem1.budgetcode = dp.code " +
     " where  fo1.kindcode in (1,15) and   rem1.estimateitemrefcode in (" +
     " select ei.code from enestimateitem ei where ei.kindrefcode = 1 and ei.countfact > 0 and ei.planrefcode = " + planCode + ")" +

	 " union all " +

	 " select fies1.estimateitemcode, ma1.party_id, ma1.quantity, " +
            " fo1.moloutcode as molcode, fo1.moloutname as molname, " +
            " d2r.fincfocode as frc_code, dp.shortname as frc_name, " +
            " ma1.nn as mat_nn, ma1.mat_name as mat_name, ma1.mu_name as mu_name " +
	 " from rqfkorderitem2enstmttm as fies1 inner join rqfkorderitem as fi1 on fies1.fkorderitemrefcode = fi1.code " +
	 " inner join rqfkorder as fo1 on fi1.fkorderrefcode = fo1.code " +
	 " inner join finmaterials as ma1 on fies1.finmaterialsrefcode = ma1.code " +
	 " inner join enestimateitem as ei on fies1.estimateitemcode = ei.code " +
     " inner join enplanwork as pl on pl.code = ei.planrefcode " +
     " inner join endepartment2epren as d2r on d2r.departmentrefcode = pl.budgetrefcode " +
     " inner join endepartment as dp on pl.budgetrefcode = dp.code " +
	 " where ma1.statusrefcode = 1 and fo1.kindcode not in (1,15) " +
     " and  fies1.estimateitemcode in ( " +
     " select ei.code from enestimateitem ei where ei.kindrefcode = 1 and ei.countfact > 0 and ei.planrefcode = " + planCode + ")" +

     " union all " +

	 " select fies1.estimateitemcode, ma1.party_id, " +
	        " case when fo1.molincode = fo1.moloutcode then 0 else - ma1.quantity end as quantity, " +
            " fo1.molincode as molcode, fo1.molinname as molname, " +
            " d2r.fincfocode as frc_code,dp.shortname as frc_name, " +
            " ma1.nn as mat_nn, ma1.mat_name as mat_name, ma1.mu_name as mu_name " +
     " from rqfkorderitem2enstmttm as fies1 inner join rqfkorderitem as fi1 on fies1.fkorderitemrefcode = fi1.code " +
	 " inner join rqfkorder as fo1 on fi1.fkorderrefcode = fo1.code " +
	 " inner join finmaterials as ma1 on fies1.finmaterialsrefcode = ma1.code " +
     " inner join enestimateitem as ei on fies1.estimateitemcode = ei.code " +
     " inner join enplanwork as pl on pl.code = ei.planrefcode " +
     " inner join endepartment2epren as d2r on d2r.departmentrefcode = pl.budgetrefcode " +
     " inner join endepartment as dp on pl.budgetrefcode = dp.code " +
	 " where ma1.statusrefcode = 1 and fo1.kindcode not in (1,15) " +
     " and   fies1.estimateitemcode in ( " +
     " select ei.code from enestimateitem ei where ei.kindrefcode = 1 and ei.countfact > 0 and ei.planrefcode = " + planCode + ")" +

     " union all " +

     " select ma1.estimateitemrefcode, ma1.party_id, - ma1.quantity, " +
            " ma1.div_code as molcode,  ma1.div_name as molname, " +
            " ma1.frc_code::TEXT as frc_code, ma1.frc_name as frc_name, " +
            " ma1.nn as mat_nn, ma1.mat_name as mat_name, ma1.mu_name as mu_name " +
     " from finmaterials as ma1 inner join enestimateitem ei on ma1.estimateitemrefcode = ei.code " +
	 " where ma1.statusrefcode = 1 and ei.kindrefcode = 1 " +
     " and ei.countfact > 0 and ei.planrefcode in ( " +
          " select pcr.plannewrefcode from enplancorrecthistory pcr " +
          " where pcr.planoldrefcode in ( " +
          " select pch.plannewrefcode from enplancorrecthistory pch where pch.planoldrefcode = " + planCode +
          " and pch.reasoncode = 4)) " +
          " ) as q " +
     " group by q.partycode, q.molcode, q.molname, q.frc_code, q.frc_name, q.mat_nn, q.mat_name,q.mu_name " +
     " having sum(q.quantity) > 0 " +
     " order by q.molcode, q.partycode ";

   try
    {
     statement = connection.prepareStatement(selectStr);


     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {

       anObject = new FINMaterialsShort();

       anObject.party_id = set.getInt(1);
       anObject.div_code = set.getString(2);
       anObject.div_name = set.getString(3);
       anObject.frc_code = set.getInt(4);
       if ( set.wasNull() )
           anObject.frc_code = Integer.MIN_VALUE;
       anObject.frc_name = set.getString(5);
       anObject.nn = set.getString(6);
       anObject.mat_name = set.getString(7);
       anObject.mu_name = set.getString(8);
       anObject.quantity = set.getBigDecimal(9);
       if(anObject.quantity != null)
           anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.estimateItemRefCode = set.getInt(10);

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
   * Получить список материалов {@link FINMaterialsShortList} по коду ордера {@link RQFKOrder}
   * 
   * @param fkOrder заданный ордер {@link RQFKOrder}
   * @return список материалов {@link FINMaterialsShortList}
   * @throws PersistenceException
   */
  public FINMaterialsShortList getListByRQFKOrder(RQFKOrder fkOrder) throws PersistenceException {
	  if(fkOrder == null || fkOrder.code == Integer.MIN_VALUE) {
		  
	  }
	  FINMaterialsFilter filter = new FINMaterialsFilter();
	  filter.conditionSQL = "EXISTS (SELECT FROM rqfkorderitem AS fi1\n" + 
	  		"INNER JOIN rqfkorderitem2enstmttm AS fies1 ON fi1.code = fies1.fkorderitemrefcode\n" + 
	  		"WHERE fies1.finmaterialsrefcode = finmaterials.code\n" + 
	  		"AND fi1.fkorderrefcode = ?)";
	  filter.statusRef.code = FINMaterialsStatus.GOOD;
	  return this.getScrollableFilteredList(filter, 0, -1, new Vector<>(Arrays.asList(fkOrder.code)));
  }



} // end of FINMaterialsDAO

