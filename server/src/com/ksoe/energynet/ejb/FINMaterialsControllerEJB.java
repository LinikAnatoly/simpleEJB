
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for FINMaterials;
  *
  */



import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.Config;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.FINDoc2WorkOrderDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.ejb.generated.FINMaterialsControllerEJBGen;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.ElementLogic;
import com.ksoe.energynet.logic.EstimateLogic;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.logic.FINMolLogic;
import com.ksoe.energynet.logic.FinMaterialsAvrLogic;
import com.ksoe.energynet.logic.FinMaterialsLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.energynet.logic.TravelSheetLogic;
import com.ksoe.energynet.logic.WorkOrderLogic;
import com.ksoe.energynet.logic.mDaxLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemData;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetStatus;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.FINDoc2WorkOrder;
import com.ksoe.energynet.valueobject.FINDocType;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.FINDoc2WorkOrderFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2FinShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.fin.dataminer.PartyDAO;
import com.ksoe.fin.dataminer.TmaterialDAO;
import com.ksoe.fin.logic.FKConsts;
import com.ksoe.fin.logic.FKLogic2;
import com.ksoe.fin.valueobject.Party;
import com.ksoe.fin.valueobject.filter.TmaterialFilter;
import com.ksoe.fin.valueobject.lists.TmaterialShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.mdax.logic.AXTransactionsLogic;
import com.ksoe.mdax.services.itemservice.InventItemGroupFinder;
import com.ksoe.mdax.services.journalactionks.JournalAction;
import com.ksoe.mdax.util.WebServicesConsts;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQStorageZoneDAO;
import com.ksoe.rqorder.logic.FKOrderLogic;
import com.ksoe.rqorder.logic.RQConsts;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;
import com.ksoe.rqorder.valueobject.RQStorageZone;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderFilter;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderShortList;
import com.ksoe.techcard.dataminer.TKMaterials2RecycledMaterialsDAO;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.dataminer.TKTransportRealHistoryDAO;
import com.ksoe.techcard.logic.TKConsts;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKMaterials;
import com.ksoe.techcard.valueobject.TKTransportRealHistory;
import com.ksoe.techcard.valueobject.filter.TKMaterials2RecycledMaterialsFilter;
import com.ksoe.techcard.valueobject.filter.TKMaterialsFilter;
import com.ksoe.techcard.valueobject.lists.TKMaterials2RecycledMaterialsShortList;

public class FINMaterialsControllerEJB extends FINMaterialsControllerEJBGen
 {

  public FINMaterialsControllerEJB() {}

  private boolean isRounded = false;



  public FINMaterialsShortList getGroupedFilteredList(FINMaterialsFilter aFilterObject, int fromPosition,int quantity)
  {
        try
        {
        FINMaterialsDAO objectDAO = new FINMaterialsDAO(
        		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        return objectDAO.getGroupedFilteredList(aFilterObject, fromPosition, quantity);

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get DATA list of {%com.ksoe.energynet.valueobject.FINMaterials%} objects from AuthorizationJNDINames.FINMATERIAL_DATASOURCE",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
  }


  public FINMaterialsShortList getFilteredPartyList(int estimateItemCode)
  {
        try
        {
        FINMaterialsDAO objectDAO = new FINMaterialsDAO(
        		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        return objectDAO.getFilteredPartyList(estimateItemCode);

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getFilteredPartyList list of {%com.ksoe.energynet.valueobject.FINMaterials%} objects from AuthorizationJNDINames.FINMATERIAL_DATASOURCE",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
  }

  public BigDecimal getExtraCargo(String NN){
    Connection finConn = null;
    BigDecimal EXTRA_CARGO;
    EXTRA_CARGO = new BigDecimal(0);

  try
     {
      finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

    FINLogic finLogic = new FINLogic(finConn, getUserProfile());
    EXTRA_CARGO = finLogic.getExtraCargo(NN);
     }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException(e.getMessage(),e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
        }

    return EXTRA_CARGO;

  }


  public void setExtraCargo(String NN,BigDecimal newExtraCargo){
    Connection finConn = null;

  try
     {
      finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

    FINLogic finLogic = new FINLogic(finConn, getUserProfile());
    finLogic.setExtraCargo(NN,newExtraCargo);
     }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException(e.getMessage(),e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
                }
            } catch (SQLException e) {
            }
        }

  }


  @Override
public void save(FINMaterials object){
    throw new EnergyproSystemException("Изменять нельзя ... удалите и заведите заново");
  }


  /*FINMaterials. Изменить*/
  public void save__(FINMaterials object)
   {
    // нах ОНО .. тока БАГИ ;)
    Connection finConn = null;
    Connection enConn = null;

    try
     {

      finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
      enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

      FINMaterialsDAO objectDAO = new FINMaterialsDAO(getUserProfile(),enConn);
      FINMaterials oldFin = objectDAO.getObject(object.code);

      if (oldFin.quantity.doubleValue() < object.quantity.doubleValue()){
        throw new EnergyproSystemException("old materials count is less than new");
      }


      object.userGen = getUserProfile().userName;
      object.dateEdit = new Date();

      ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(enConn, getUserProfile());
      ENEstimateItem estimate = estimateDAO.getObject(object.estimateItemRef.code);

/*
      ActLogic actLogic = new ActLogic(enConn, getUserProfile());
      ENAct act = actLogic.getActByPlanCode(estimate.planRef.code);
      if (act == null){
        throw new EnergyproSystemException("Act not found for plan, code=" + estimate.planRef.code);
      }
*/
      WorkOrderLogic workOrderLogic = new WorkOrderLogic(enConn, getUserProfile());
      ENWorkOrder workOrder = workOrderLogic.getWorkOrderByEstimateItemCode(object.estimateItemRef.code);

      PlanWorkLogic planWorkLogic = new PlanWorkLogic(enConn, getUserProfile());
      ENPlanWork planWork = planWorkLogic.getPlanByWorkOrderCode(workOrder.code);

      FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(enConn, getUserProfile());
      FINDoc2WorkOrderFilter f2wFilter = new FINDoc2WorkOrderFilter();
      f2wFilter.workOrderRef.code = workOrder.code;
      if (planWork.typeRef.code != ENPlanWorkType.WRITINGOFFPROTECTION){

      f2wFilter.typeRef.code = FINDocType.MOVE_302;

      int[] f2wArr302 = f2wDAO.getFilteredCodeArray(f2wFilter,null,null,0,-1,null);
      if (f2wArr302.length == 0){
        throw new EnergyproSystemException("Error in count FINDocs o/t 302 for WorkOrder.code=" + workOrder.code);
      }
      FINDoc2WorkOrder f2w302 = f2wDAO.getObject(f2wArr302[0]);

      f2wFilter.typeRef.code = FINDocType.MOVE_28_302;
      int[] f2wArr28 = f2wDAO.getFilteredCodeArray(f2wFilter,null,null,0,-1,null);
      if (f2wArr28.length == 0){
        throw new EnergyproSystemException("Error in count FINDocs o/t 28 for WorkOrder.code=" + workOrder.code);
      }
      FINDoc2WorkOrder f2w28 = f2wDAO.getObject(f2wArr28[0]);

      FINLogic finLogic = new FINLogic(finConn, getUserProfile());
      // а нужна ли проверка??? по идее они там и висят на 302-303 ...
      //finLogic.validateDocStatus(f2w302.finDocMOLCode, 302);
      //finLogic.validateDocStatus(f2w302.finDocMechanicCode, 303);

      finLogic.validateDocDate(workOrder.dateGen);

      // пересчитаем СТОИМОСТЬ !!!!
      //object.calc_price = object.calc_price.setScale(3, BigDecimal.ROUND_HALF_UP);
      //object.cost = new BigDecimal(object.calc_price.doubleValue() * object.quantity.doubleValue()).setScale(2, BigDecimal.ROUND_HALF_UP);

      // пересчитаем СТОИМОСТЬ !!!!
      // если заехал ВЕСЬ остаток ... СТОИМОСТЬ ПЕРЕСЧИТЫВАТЬ НЕ надо ...
      // *****
      //System.out.println("%%%%%%% " + "nn: " + object.nn + " ; div_code: " + object.div_code + " ; party_id: " + object.party_id + " ; sysdate: " + (new Date()));
      //System.out.println("object.fullQuantity:" + object.fullQuantity.doubleValue());
      //System.out.println("object.quantity:" + object.quantity.doubleValue());
      //System.out.print("subtract" + Math.abs( object.fullQuantity.subtract(object.quantity).doubleValue()));

      // *****
      object.calc_price = object.calc_price.setScale(3, BigDecimal.ROUND_HALF_UP);
      object.price = object.price.setScale(3, BigDecimal.ROUND_HALF_UP);
      /*
      if ( Math.abs( object.fullQuantity.doubleValue() - object.quantity.doubleValue() ) < 0.000001)
      {
        object.cost = object.fullCost.setScale(2, BigDecimal.ROUND_HALF_UP);
      }
      else
      {
        object.cost = new BigDecimal(object.calc_price.doubleValue() * object.quantity.doubleValue()).setScale(2, BigDecimal.ROUND_HALF_UP);
      }
      */

      object.cost = calcCost(object);
      object.quantity = calcQuantity(object);

      int tStringID = object.finDocItemCode;

      int rest_purpose_id = object.rest_purpose_id ;//finLogic.getRestPurposeCodeByWorkOrderNumber(workOrder.workOrderNumber);
      //object.rest_purpose_id = finLogic.getRestPurposeCodeByWorkOrderNumber(workOrder.workOrderNumber);
      String rest_purpose_name = object.rest_purpose_name;


      if (estimate.kindRef.code == ENEstimateItemKind.MATERIALS ){
        finLogic.removeDocEntry(f2w302.finDocMOLCode, object.finDocItemCode );
        finLogic.removeDocEntry(f2w28.finDocMOLCode, object.finDocItemCode );

        // проверим кол-во на остатке ...
        //BigDecimal q = finLogic.checkCountIn3000(object, f2w302.finDocMOLCode);
        //if ( q.doubleValue() > 0 )
        // throw new EnergyproSystemException("Ошибка в резервировании материала. Этот материал использовался в нарядах, с более поздней датой. Остаток : " + q.toString());

        BigDecimal q = finLogic.checkCountIn3000(object, f2w302.finDocMOLCode);
        if ( q.doubleValue() <= 0 )
            throw new EnergyproSystemException("Ошибка в резервировании материала. Этот материал использовался в нарядах, с более поздней датой. Остаток : " + q.toString());

        if ( (q.doubleValue() - object.quantity.doubleValue()) < 0.0 )
            throw new EnergyproSystemException("Ошибка в резервировании материала. Этот материал использовался в нарядах, с более поздней датой. Остаток : " + new BigDecimal(q.doubleValue() - object.quantity.doubleValue()));


        object.finDocItemCode = finLogic.createDocEntry(object, 302, f2w302.finDocMOLCode, tStringID);
        finLogic.createDocEntry(object, 28, f2w28.finDocMOLCode, tStringID);

      }
      else
      if (estimate.kindRef.code == ENEstimateItemKind.GSM ){
        finLogic.removeDocEntry(f2w302.finDocMechanicCode, object.finDocItemCode );
        finLogic.removeDocEntry(f2w28.finDocMechanicCode, object.finDocItemCode );

        // проверим кол-во на остаке

        BigDecimal q = finLogic.checkCountIn3000(object, f2w302.finDocMechanicCode);
        if ( q.doubleValue() <= 0 )
            throw new EnergyproSystemException("Ошибка в резервировании материала. Этот материал использовался в нарядах, с более поздней датой. Остаток : " + q.toString());

        if ( (q.doubleValue() - object.quantity.doubleValue()) < 0.0 )
            throw new EnergyproSystemException("Ошибка в резервировании материала. Этот материал использовался в нарядах, с более поздней датой. Остаток : " + new BigDecimal(q.doubleValue() - object.quantity.doubleValue()));



        object.finDocItemCode = finLogic.createDocEntry(object, 302, f2w302.finDocMechanicCode, tStringID);
        finLogic.createDocEntry(object, 28, f2w28.finDocMechanicCode, tStringID);


      }
      else
        throw new EnergyproSystemException("Unknown ENEstimateItemKind code="+estimate.kindRef.code);



      //object.finDocItemCode = finLogic.createDocEntry(object, act.finDocCode);
      // само посчитает в createDocEntry ...finLogic.updateDocSum(act.finDocCode);

      object.rest_purpose_id = rest_purpose_id;
      object.rest_purpose_name = rest_purpose_name;

     // не забудем сохранить материал ....
      objectDAO.save(object);
      }
      // -------- ДЛЯ СПИСАНИЯ СРЕДСТВ ЗАЩИТЫ
      else
      {
          f2wFilter.typeRef.code = FINDocType.MOVE_332;

          int[] f2wArr332 = f2wDAO.getFilteredCodeArray(f2wFilter,null,null,0,-1,null);
          if (f2wArr332.length == 0){
            throw new EnergyproSystemException("Error in count FINDocs o/t 332 for WorkOrder.code=" + workOrder.code);
          }
          FINDoc2WorkOrder f2w332 = f2wDAO.getObject(f2wArr332[0]);

          f2wFilter.typeRef.code = FINDocType.MOVE_28_332;
          int[] f2wArr28 = f2wDAO.getFilteredCodeArray(f2wFilter,null,null,0,-1,null);
          if (f2wArr28.length == 0){
            throw new EnergyproSystemException("Error in count FINDocs o/t 28 for WorkOrder.code=" + workOrder.code);
          }
          FINDoc2WorkOrder f2w28 = f2wDAO.getObject(f2wArr28[0]);

          FINLogic finLogic = new FINLogic(finConn, getUserProfile());
          // а нужна ли проверка??? по идее они там и висят на 302-303 ...
          //finLogic.validateDocStatus(f2w302.finDocMOLCode, 302);
          //finLogic.validateDocStatus(f2w302.finDocMechanicCode, 303);

          finLogic.validateDocDate(workOrder.dateGen);

          // пересчитаем СТОИМОСТЬ !!!!
          //object.calc_price = object.calc_price.setScale(3, BigDecimal.ROUND_HALF_UP);
          //object.cost = new BigDecimal(object.calc_price.doubleValue() * object.quantity.doubleValue()).setScale(2, BigDecimal.ROUND_HALF_UP);

          // пересчитаем СТОИМОСТЬ !!!!
          // если заехал ВЕСЬ остаток ... СТОИМОСТЬ ПЕРЕСЧИТЫВАТЬ НЕ надо ...
          // *****
          //System.out.println("%%%%%%% " + "nn: " + object.nn + " ; div_code: " + object.div_code + " ; party_id: " + object.party_id + " ; sysdate: " + (new Date()));
          //System.out.println("object.fullQuantity:" + object.fullQuantity.doubleValue());
          //System.out.println("object.quantity:" + object.quantity.doubleValue());
          //System.out.print("subtract" + Math.abs( object.fullQuantity.subtract(object.quantity).doubleValue()));

          // *****
          object.calc_price = object.calc_price.setScale(3, BigDecimal.ROUND_HALF_UP);
          object.price = object.price.setScale(3, BigDecimal.ROUND_HALF_UP);
          /*
          if ( Math.abs( object.fullQuantity.doubleValue() - object.quantity.doubleValue() ) < 0.000001)
          {
            object.cost = object.fullCost.setScale(2, BigDecimal.ROUND_HALF_UP);
          }
          else
          {
            object.cost = new BigDecimal(object.calc_price.doubleValue() * object.quantity.doubleValue()).setScale(2, BigDecimal.ROUND_HALF_UP);
          }
          */

          object.cost = calcCost(object);
          object.quantity = calcQuantity(object);

          int tStringID = object.finDocItemCode;

          int rest_purpose_id = object.rest_purpose_id ;//finLogic.getRestPurposeCodeByWorkOrderNumber(workOrder.workOrderNumber);
          //object.rest_purpose_id = finLogic.getRestPurposeCodeByWorkOrderNumber(workOrder.workOrderNumber);
          String rest_purpose_name = object.rest_purpose_name;


          if (estimate.kindRef.code == ENEstimateItemKind.MATERIALS ){
            finLogic.removeDocEntry(f2w332.finDocMOLCode, object.finDocItemCode );
            finLogic.removeDocEntry(f2w28.finDocMOLCode, object.finDocItemCode );

            // проверим кол-во на остатке ...
            //BigDecimal q = finLogic.checkCountIn3000(object, f2w302.finDocMOLCode);
            //if ( q.doubleValue() > 0 )
            // throw new EnergyproSystemException("Ошибка в резервировании материала. Этот материал использовался в нарядах, с более поздней датой. Остаток : " + q.toString());

            BigDecimal q = finLogic.checkCountIn3000(object, f2w332.finDocMOLCode);
            if ( q.doubleValue() <= 0 )
                throw new EnergyproSystemException("Ошибка в резервировании материала. Этот материал использовался в нарядах, с более поздней датой. Остаток : " + q.toString());

            if ( (q.doubleValue() - object.quantity.doubleValue()) < 0.0 )
                throw new EnergyproSystemException("Ошибка в резервировании материала. Этот материал использовался в нарядах, с более поздней датой. Остаток : " + new BigDecimal(q.doubleValue() - object.quantity.doubleValue()));


            object.finDocItemCode = finLogic.createDocEntry(object, 332, f2w332.finDocMOLCode, tStringID);
            finLogic.createDocEntry(object, 28, f2w28.finDocMOLCode, tStringID);

          }
          else
          if (estimate.kindRef.code == ENEstimateItemKind.GSM ){
            finLogic.removeDocEntry(f2w332.finDocMechanicCode, object.finDocItemCode );
            finLogic.removeDocEntry(f2w28.finDocMechanicCode, object.finDocItemCode );

            // проверим кол-во на остаке

            BigDecimal q = finLogic.checkCountIn3000(object, f2w332.finDocMechanicCode);
            if ( q.doubleValue() <= 0 )
                throw new EnergyproSystemException("Ошибка в резервировании материала. Этот материал использовался в нарядах, с более поздней датой. Остаток : " + q.toString());

            if ( (q.doubleValue() - object.quantity.doubleValue()) < 0.0 )
                throw new EnergyproSystemException("Ошибка в резервировании материала. Этот материал использовался в нарядах, с более поздней датой. Остаток : " + new BigDecimal(q.doubleValue() - object.quantity.doubleValue()));



            object.finDocItemCode = finLogic.createDocEntry(object, 332, f2w332.finDocMechanicCode, tStringID);
            finLogic.createDocEntry(object, 28, f2w28.finDocMechanicCode, tStringID);


          }
          else
            throw new EnergyproSystemException("Unknown ENEstimateItemKind code="+estimate.kindRef.code);



          //object.finDocItemCode = finLogic.createDocEntry(object, act.finDocCode);
          // само посчитает в createDocEntry ...finLogic.updateDocSum(act.finDocCode);

          object.rest_purpose_id = rest_purpose_id;
          object.rest_purpose_name = rest_purpose_name;

         // не забудем сохранить материал ....
          objectDAO.save(object);
          }


     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENAct%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {
        try {
            if (finConn != null && ! finConn.isClosed()) {
                finConn.close();
                finConn = null;
            }
        } catch (SQLException e) {
        }
        try {
            if (enConn != null && ! enConn.isClosed()) {
                enConn.close();
                enConn = null;
            }
        } catch (SQLException e) {
        }
    }
   }


  /*FINMaterials. Удалить*/
  public void remove_(int code)
   {

    Connection finConn = null;
    Connection enConn = null;

    ENWorkOrder workOrder = null;
    FINMaterials finMaterials = null;

   try
    {
        finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
        enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);


        FINMaterialsDAO objectDAO = new FINMaterialsDAO(getUserProfile(), enConn);
        finMaterials = objectDAO.getObject(code);

        AuthLogic netAuth = new AuthLogic(enConn, getUserProfile());
        int writeOffTmcConf = netAuth.checkUsesDataForWriteOff();

        if ( finMaterials.statusRef.code == FINMaterialsStatus.CANCELED ){
            throw new EnergyproSystemException("FINMaterials already canceled, code="+code);
        }



        /*
        ENActDAO actDAO = new ENActDAO(enConn, getUserProfile());
        ENActFilter actFilter = new ENActFilter();
        actFilter.conditionSQL = " enact.code in (select enact2enplanwork.actrefcode from enact2enplanwork "+
        "where enact2enplanwork.plancode in (select enestimateitem.planrefcode from enestimateitem where enestimateitem.code = "+finMaterials.estimateItemRef.code+"))";

        ENActShortList actList = actDAO.getScrollableFilteredList(actFilter,0,-1);
        if (actList.totalCount != 1){
            throw new EnergyproSystemException("Act not found or error in count acts ... for ENEstimateitem, code = "+finMaterials.estimateItemRef.code);
        }

        ENAct act = actDAO.getObject(actList.get(0).code);
          */

/*
        ActLogic actLogic = new ActLogic(enConn, getUserProfile());
        ENAct act = actLogic.getActByEstimateItemCode(finMaterials.estimateItemRef.code);

        FINLogic finLogic = new FINLogic( finConn, getUserProfile());
          //удалим ЕНТРИ +  переформируем docs_reestr_list !!! ВЕСЬ !!!
        //finLogic.validateDocStatus(act.finDocCode);

        ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(enConn, getUserProfile());
        ENEstimateItem estimate = estimateDAO.getObject(finMaterials.estimateItemRef.code);

        //finLogic.validateDocStatus(act.finDocCode);
        if (estimate.kindRef.code == ENEstimateItemKind.MATERIALS )
            finLogic.validateDocStatus(act.finDocCode, 300 );
            else
            if (estimate.kindRef.code == ENEstimateItemKind.GSM )
            finLogic.validateDocStatus(act.finDocMechanicCode, 301 );
            else
                throw new EnergyproSystemException("Unknown ENEstimateItemKind code="+estimate.kindRef.code);

*/
        FINLogic finLogic = new FINLogic( finConn, getUserProfile());
        FINMolLogic finMolLogic = new FINMolLogic(enConn, getUserProfile());

        WorkOrderLogic workOrderLogic = new WorkOrderLogic(enConn, getUserProfile());
        workOrder = workOrderLogic.getWorkOrderByEstimateItemCode(finMaterials.estimateItemRef.code);

        ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(enConn, getUserProfile());
        ENEstimateItem estimate = estimateDAO.getObject(finMaterials.estimateItemRef.code);

        PlanWorkLogic planWorkLogic = new PlanWorkLogic(enConn, getUserProfile());
        ENPlanWork planWork = planWorkLogic.getPlanByWorkOrderCode(workOrder.code);

        ENAct act = new ActLogic(enConn,getUserProfile()).getActByPlanCode(estimate.planRef.code, false);
        if (act != null)
        {
            // такого типа никогда не будет ;)
            //if (act.statusRef.code != ENActStatus.GOOD)
            throw new EnergyproSystemException("Цей факт включено до Акту (№ "+ act.numberGen +" ) ... видаляйте прив'язку до Акта!!! ...\n бо Ви друкуєте акт, а потім змінюєте його ;(");
        }

        ///////////////////////////////////
        // ПРАВААААААААААААААААААААА
        /////////////////////////////////

        AuthLogic al = new AuthLogic(enConn, getUserProfile());
        if (estimate.kindRef.code == ENEstimateItemKind.GSM ){

            // ГСМ ХОЕ списывает  только один ЮЗЕР ... IshenkoMA

            al.checkPermissionGSM(finMaterials.div_code);

            ENTravelSheet ts = new TravelSheetLogic(enConn, getUserProfile()).getTravelSheetByEstimateItemCode(estimate.code);
            if ( ts != null){
                if (ts.statusRef.code == ENTravelSheetStatus.CLOSED){
                    throw new EnergyproSystemException("Цей ПММ вже у закритому ПЛ № " + ts.numberGen);
                }
            }
        }

      //  al.checkPermissionMOL(finMaterials.div_code);


        // Для Буфета проверим права на соответствующие типы актов
        if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        {
            if (!al.checkPermission("ksoe/energynet/ENPlanWorkController", "checkWritingsOffBufet")) {
                throw new EnergyproSystemException("У Вас немає прав на цю операцію!");
            }
        }
        ///////////////////////////////////////////////////

        // 28.11.2016 NET-4543 Проверка прав на акты перевода во вторсырье
        planWorkLogic.checkForRecyclableMaterials(planWork);

        //finLogic.validateDocStatus(act.finDocCode);
        int finDocCode = Integer.MIN_VALUE;

        String molCode;
        int operationType;
        int finDoc;
        //int operationType;

        FINDoc2WorkOrder d2w = new FINDoc2WorkOrder();

        // for 28 !!!
        finDocCode = Integer.MIN_VALUE;

        //String molCode;
        //int operationType;
        //int finDoc;
        //int operationType;
        d2w = null;

        //d2w = workOrderLogic.getFINDocCodeByWorkOrderCode(workOrder.code, FINDocType.MOVE_28_302); // Тип операции РЕЗЕРВ (переход в 302 вид)

        //AS 17.03.2011 finDocCode = finMolLogic.getFINDocCodeByWorkOrderCode(finMaterials.molDataRef.code, FINDocType.MOVE_28_302 );

/*
        if (estimate.kindRef.code == ENEstimateItemKind.MATERIALS ){
            finDocCode = d2w.finDocMOLCode ; //act.finDocCode;
            //finLogic.validateDocStatus(finDocCode, 28 );
            //operationType = 302;
        }
        else
            if (estimate.kindRef.code == ENEstimateItemKind.GSM ){
                finDocCode = d2w.finDocMechanicCode ; //act.finDocMechanicCode;
                //finLogic.validateDocStatus(finDocCode, 28 );
                operationType = 303;
            }
            else
                throw new EnergyproSystemException("Unknown ENEstimateItemKind code="+estimate.kindRef.code);
*/


        // типа удалять развязку можно с Любого периода ...
        // finLogic.validateDocDate(workOrder.dateGen);

//        AS 17.03.2011 finLogic.removeDocEntry(finDocCode, finMaterials.finDocItemCode );

        // пересчитаем общие суммы
//        AS 17.03.2011 finLogic.updateDocSum(finDocCode);


        // 302 - 303
        //d2w = workOrderLogic.getFINDocCodeByWorkOrderCode(workOrder.code, FINDocType.MOVE_302); // Тип операции РЕЗЕРВ (переход в 302 вид)

        // 02.12.11 if (planWork.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION) {
        if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS)
        {
            finDocCode = finMolLogic.getFINDocCodeByWorkOrderCode( finMaterials.molDataRef.code, FINDocType.MOVE_332 );
        }
        else
        if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        {
            finDocCode = finMolLogic.getFINDocCodeByWorkOrderCode( finMaterials.molDataRef.code, FINDocType.MOVE_292 );
        }
        else
        {
            finDocCode = finMolLogic.getFINDocCodeByWorkOrderCode( finMaterials.molDataRef.code, FINDocType.MOVE_302 );
        }

        //finDocCode = Integer.MIN_VALUE;
        if (estimate.kindRef.code == ENEstimateItemKind.MATERIALS ){
            if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
            		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
            		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS)
            {
                operationType = 332;
            }
            else
            if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
            {
                operationType = 292;
            }
            else
            {
                operationType = 302;
            }
        }
        else
            if (estimate.kindRef.code == ENEstimateItemKind.CUSTOMER_MATERIALS){
                operationType = 302;
            }
            else
            if (estimate.kindRef.code == ENEstimateItemKind.GSM ){
                //finDocCode = d2w.finDocMechanicCode ; //act.finDocMechanicCode;
                //finLogic.validateDocStatus(finDocCode, 303 );
                operationType = 303;
            }
            else
                throw new EnergyproSystemException("Unknown ENEstimateItemKind code="+estimate.kindRef.code);

        // статус ТОЛЬКО в 302 - 303 - 332
        finLogic.validateDocStatus(finDocCode, operationType);

        // типа удалять развязку можно с Любого периода ...
        //finLogic.validateDocDate(workOrder.dateGen);
//        AS 17.03.2011 finLogic.removeDocEntry(finDocCode, finMaterials.finDocItemCode );

        // пересчитаем общие суммы
//        AS 17.03.2011 finLogic.updateDocSum(finDocCode);

        FKLogic2 fkLogic2 = new FKLogic2(finConn, getUserProfile());

        // иногда выносят то что было зарезервировано РАНЬШЕ закрытого периода в ФК ...
        // перебьем ДАТУ документа и вынесем строку ...
        // а может ВЕСЬ документ сразу ???
        Date fkDate = finLogic.getCurrentPeriodInFK();
        boolean dateChange = false;
        Date oldDate = workOrder.dateGen;
        if (fkDate.after(workOrder.dateGen)){
                //throw new PersistenceException("В Фин.Колекции уже период " + d);
            fkLogic2.updateDateTHead(finDocCode, fkDate);
            workOrder.dateGen = fkDate;
            dateChange = true;
        }




        boolean isErr = true;
        fkLogic2.OpenDocument(finDocCode);
        try{

        fkLogic2.DropString(finMaterials.finDocItemCode);

            /* закомментарено см. NET-2268
        int red_rest = fkLogic2.check_red_rest(finDocCode, finMaterials.finDocItemCode, 1);
        if (red_rest != 0){
            throw new EnergyproSystemException("Удаление этой строки приведет к образованию КРАСНОГО остатка ...");
        }
        */

        BigDecimal docSum = fkLogic2.getDocStrings();

        String Via_who = getUserProfile().userName.toUpperCase() + " (" + new SimpleDateFormat("dd.MM.yyyy").format(workOrder.dateGen).toString() +")" ;

        fkLogic2.UpdateDocumentShort(
                    workOrder.workOrderNumber,
                    operationType,
                    finMaterials.div_code,
                    finMaterials.div_code,
                    workOrder.dateGen,
                    docSum,
                    Via_who
                );


        fkLogic2.SaveDocument(finDocCode);
        isErr = false;
        }
        catch(Exception e){
            //fkLogic2.CancelDocument();
            System.out.println("error remove FinMaterials : ");
            System.out.println("workOrderNumber :" + workOrder == null ? "--" : workOrder.workOrderNumber);
            System.out.println("finMaterials : nn = " + finMaterials == null ? "---" : ( finMaterials.nn + ", count = " + finMaterials.quantity ));
            throw new EnergyproSystemException(e.getMessage());
        }
        finally
        {
            fkLogic2.CancelDocumentHackFK(isErr);
        }

        // вернем дату документа на родину ...
        if (dateChange){
            fkLogic2.updateDateTHead(finDocCode, oldDate);
        }


        /** 18.09.2014... +++ вынесем втор.сырье... */
		Context estimateCnt = new InitialContext();
		Object estimateRef = estimateCnt.lookup(ENEstimateItemController.JNDI_NAME);
		ENEstimateItemControllerHome estimateHome = (ENEstimateItemControllerHome) PortableRemoteObject
				.narrow(estimateRef, ENEstimateItemControllerHome.class);
		ENEstimateItemController estimateController = estimateHome.create();

        ENEstimateItemFilter recycledFilter = new ENEstimateItemFilter();
        recycledFilter.conditionSQL = " enestimateitem.code in ( " +
        		"select f.estimateitemrefcode from finmaterials f where f.parentrefcode in ( " +
        		"select fm.code from finmaterials fm " +
        		" where fm.statusrefcode = " + FINMaterialsStatus.GOOD +
        		//"   and fm.estimateitemrefcode = " + estimate.code + "))";
        		"   and fm.code = " + finMaterials.code + "))";

        int recycledArr[] = estimateDAO.getFilteredCodeArray(recycledFilter, 0, -1);
        for (int r = 0; r < recycledArr.length; r++) {
        	estimateController.removeUnmount(recycledArr[r]);
        }



        finMaterials.statusRef.code = FINMaterialsStatus.CANCELED;
        finMaterials.molDataRef.code = Integer.MIN_VALUE;

        finMaterials.userGen = getUserProfile().userName;
        finMaterials.dateEdit = new Date();

        String _messageId = "";
        AXTransactionsLogic axLogic = new AXTransactionsLogic(enConn, getUserProfile());
        //ymp finmaterials remove from mdax удаление строки с журнала и перевод finmaterials в статус "отмененный"

			if ((writeOffTmcConf == 1 || writeOffTmcConf == 2)
					&& (finMaterials.axInventTransferLinesCode != null && !finMaterials.axInventTransferLinesCode
							.equals(""))) {
				_messageId = axLogic
						.aifttsbegin(WebServicesConsts.defaultTimeOut);
				System.out.println("&&&&&&&&&&&  start journalTransDelete.... "
						+ " axInventTransferLinesCode = "
						+ finMaterials.axInventTransferLinesCode);
				JournalAction journalAction = new JournalAction();
				journalAction.journalTransDelete(
						finMaterials.axInventTransferLinesCode,
						axLogic.getUserSecurity().domainUserName,
						axLogic.getUserSecurity().userPass);
			}

        objectDAO.save(finMaterials);

        /*
        // типа если ГСМ - апдейтим остатки топлива ...
        * остатки только сравним ... при добавлении чтобы было не больше чем в оборотке
        if (estimate.kindRef.code == ENEstimateItemKind.GSM ){
            new TravelSheetFuelLogic(enConn, getUserProfile()).updateRemainderCountOut(finMaterials.estimateItemRef.code);
        }
        */
        if (!_messageId.equals("") && (writeOffTmcConf == 1 || writeOffTmcConf == 2) ) {
    		axLogic.aifttscommit(_messageId);
    	}

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't remove FINMaterials.", e);
		} catch (PersistenceException e) {

			System.out.println("error remove FinMaterials : ");
			System.out.println("workOrderNumber :" + workOrder.workOrderNumber);
			System.out.println("finMaterials : nn = " + finMaterials.nn + ", count = " + finMaterials.quantity);

			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}


  private BigDecimal calcQuantity(FINMaterials f){
         BigDecimal out = new BigDecimal(0);
        if ( Math.abs( f.fullCost.subtract(f.cost).doubleValue()) < 0.01 )
        {
            out = f.fullQuantity;
        }
        else
        {
            out = f.quantity;
        }
        return out;
  }

  private BigDecimal calcQuantity(FINMaterials f, FINMaterials f3k){
      BigDecimal out = new BigDecimal(0);

      f.quantity = f.quantity.setScale(6, BigDecimal.ROUND_HALF_UP);
      f3k.quantity = f3k.quantity.setScale(6, BigDecimal.ROUND_HALF_UP);

      f.cost = f.cost.setScale(2, BigDecimal.ROUND_HALF_UP);
      f3k.cost = f3k.cost.setScale(2, BigDecimal.ROUND_HALF_UP);

      //BigDecimal count_ = f.quantity.subtract(f3k.quantity);
      BigDecimal cost_ = f.cost.subtract(f3k.cost);

        if ( Math.abs( cost_.doubleValue()) < 0.01 )
        {
            out = f3k.quantity; // :) сбыт нашел глючек ;))) f.quantity.add(count_) ;
            isRounded = true;
        }
        else
        {
            out = f.quantity;
        }
        return out;
}

  private BigDecimal calcCost(FINMaterials f, FINMaterials f3k){
    BigDecimal out = new BigDecimal(0);

    out = (f.calc_price.multiply(f.quantity)).setScale(2, BigDecimal.ROUND_HALF_UP);

      f.quantity = f.quantity.setScale(6, BigDecimal.ROUND_HALF_UP);
      f3k.quantity = f3k.quantity.setScale(6, BigDecimal.ROUND_HALF_UP);

      f.cost = f.cost.setScale(2, BigDecimal.ROUND_HALF_UP);
      f3k.cost = f3k.cost.setScale(2, BigDecimal.ROUND_HALF_UP);

      BigDecimal count_ = f.quantity.subtract(f3k.quantity);
      BigDecimal cost_ = out.subtract(f3k.cost);
      //BigDecimal cost__ = (f.calc_price.multiply(f.quantity)).setScale(2, BigDecimal.ROUND_HALF_UP);

        if ( Math.abs( count_.doubleValue()) < 0.000001 )
        {
            out = f3k.cost; //out.add(cost_);
            isRounded = true;
        }
        out = out.setScale(2, BigDecimal.ROUND_HALF_UP);
        return out;
  }

  private BigDecimal calcCost(FINMaterials f){
    BigDecimal out = new BigDecimal(0);

        if ( Math.abs( f.fullQuantity.subtract(f.quantity).doubleValue()) < 0.000001 )
        {
            out = f.fullCost.setScale(2, BigDecimal.ROUND_HALF_UP);
        }
        else
        {
            out = (f.calc_price.multiply(f.quantity)).setScale(2, BigDecimal.ROUND_HALF_UP);
        }
        return out;
  }



  public int addMaterials(FINMaterials object) {
	  return addMaterials(object, true);
  }

  public int addMaterials(FINMaterials object, boolean isException) {

	  Connection enConn = null;
	  Connection finConn = null;

	  int writeOffTmcConf = Integer.MIN_VALUE;
	  String _messageId = "";
	  AXTransactionsLogic axLogic = null;

	  try {

		  enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		  finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

		  ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(enConn, getUserProfile());
		  //ENEstimateItem estimate = estimateDAO.getObject(object.estimateItemRef.code);
		  ENEstimateItemShort estimate = estimateDAO.getShortObject(object.estimateItemRef.code);

		  ENPlanWorkDAO planDAO = new ENPlanWorkDAO(enConn, getUserProfile());
		  ENPlanWork plan = planDAO.getObject(estimate.planRefCode);

		  ElementLogic elementLogic = new ElementLogic(enConn, getUserProfile());
		  ENElement e = elementLogic.getElementByCode(plan.elementRef.code);
		  int eType = e.typeRef.code; //elementLogic.getElementTypeByCode(plan.elementRef.code);

		  FINMaterialsDAO finDAO = new FINMaterialsDAO(enConn, getUserProfile());
		  AuthLogic netAuth = new AuthLogic(enConn, getUserProfile());

		  axLogic = new AXTransactionsLogic(enConn, getUserProfile());

	      writeOffTmcConf = netAuth.checkUsesDataForWriteOff();

		  boolean USES_MDAX_INVENTORYONHAND = netAuth.checkUsesMDAXData(Config.CONFIG_USES_MDAX_INVENTORYONHAND);


		  /**  торжественное открытие транзакции в АХ  */
          if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
    	      _messageId = axLogic.aifttsbegin(WebServicesConsts.defaultTimeOut+60);
    	      System.out.println(" finmaterialscontroller addMaterials axLogic.aifttsbegin , _messageId = " + _messageId );
  		  }


		    /*************************************************************************************
		    /// 06.02.12 Возвращаем Нет.Оперативный запас назад (чтоб его было видно) ;-)

		    // Разрешать или нет привязку из Net. Оперативного запаса (true - разрешать)
		    boolean allowNetOperative = false;

		    //  if (object.rest_purpose_id == RQConsts.REST_PURPOSE_ID_OPERATIVE)
		    if (object.rest_purpose_id != RQConsts.REST_PURPOSE_ID_TRANZIT)
		    {
		        if ((plan.budgetRef.code == ENConsts.ENBUDGET_ENERGOSBYT) ||
		            (eType == ENElementType.WRITING_NO_OBJECT))
		        {
		            allowNetOperative = true;
		        }

		        if ((plan.budgetRef.code == ENConsts.ENBUDGET_VPTU) && (eType == ENElementType.SERVICES_OBJECT))
		        {
		            allowNetOperative = true;
		        }

		        if ((plan.budgetRef.code == ENConsts.ENBUDGET_SIT) || (eType == ENElementType.SIT))
		        {
		            allowNetOperative = true;
		        }

		        if (! allowNetOperative)
		        {
		            throw new EnergyproSystemException("Дозволено прив'язувати матеріали тільки з призначенням залишку \"Транзит\"!");
		        }
		    }
		      *************************************************************************************/

		   // если остатки взяли с аксапты
        	if(USES_MDAX_INVENTORYONHAND) {

        		if (object.ax_rest_purpose_typeid != null && !object.ax_rest_purpose_typeid.equals(""))
        		{
        			object.rest_purpose_type_id = Integer.parseInt(object.ax_rest_purpose_typeid.replace("30100", "")  ) ; // вырезаем из аксаптового значения НАЗНАЧЕНИЯ код который соответствуем ФК коду назнач остатка
        		}

        		if (object.ax_party_id != null && !object.ax_party_id.equals(""))
        		{
        			object.party_id = Integer.parseInt(object.ax_party_id);
        		}
			}

			 //SUPP-3851
		    if(object.rest_purpose_type_id == RQConsts.REST_PURPOSE_TYPE_ID_AVR16)
		        throw new EnergyproSystemException("Неможливо списувати матеріал з призначенням залишку АВР16");

		    // Для Буфета проверим права на соответствующие типы актов
		    if (plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
		    {
		        AuthLogic al = new AuthLogic(enConn, getUserProfile());

		        if (!al.checkPermission("ksoe/energynet/ENPlanWorkController", "checkWritingsOffBufet")) {
		            throw new EnergyproSystemException("У Вас немає прав на цю операцію!");
		        }
		    }


		    /* 09.11.2011 Вернули проверку, пробуем конвертацию ед.измерения... */
		    /* 31.10.11 Пока проверку уберем... Как сделаем перевод единиц измерения с помощью макетов, вернем*/
		    /// !!!!! 28.10.11 Проверим единицы измерения !!!!!
		    //ENEstimateItemShort estimateShort = estimateDAO.getShortObject(object.estimateItemRef.code);
		    String fmUnitName = object.mu_name.trim().toUpperCase();
		    String estimateUnitName = estimate.measureType.trim().toUpperCase();

		    if (! fmUnitName.equals(estimateUnitName)) {
		    	// MDAX-441 Если задан коэф-т перевода из AX, то не проверяем (в этом случае ед. измерения будут отличаться)
		    	// Не проверяем только для Материалов (для ГСМ и т.д. оставим проверку)
		        if (object.axFactor == null || object.axFactor.compareTo(new BigDecimal(0)) <= 0 ||
		        	estimate.kindRefCode != ENEstimateItemKind.MATERIALS)
		        {
			    	// Для списаний не сверяем, т.к. там один материал в плане - "Матеріал для списань", с ед. изм. "ШТ"
			        if ((eType != ENElementType.WRITING_NO_OBJECT) || (plan.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION))  {
			            throw new EnergyproSystemException("Не співпадають одиниці виміру: \"" + fmUnitName.toUpperCase()
			                    + "\" та \"" + estimateUnitName.toUpperCase() + "\"\n"
			                    //+  "\" Скористайтеся актом переведення одиниць виміру!!! \"");
			                    + "Потрібно внести коефіцієнт перерахунку в MS Dynamics Axapta! Зверніться до ВТВ!");
			        }
		        }
		    }
		    /////

	        // 28.11.2016 NET-4543 Проверка прав на акты перевода во вторсырье
			PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
	        planLogic.checkForRecyclableMaterials(plan);


		    EstimateLogic logic = new EstimateLogic(enConn,getUserProfile());

		    /**
		     *  SUPP-12703... 18.02.2014 +++
		     *  Проверка на совпадение наименования у норм.материала в плане и у привязываемой к нему номенклатуры
		     *
		     *  !!!не проверяем списания!!!
		     *  проверка продержалась 40 мин.
		     */
		    /*
		    	if (estimate.materialRefCode != TKConsts.TKMATERIALS_WRITING) {
		        	String eName = estimate.materialRefName.toUpperCase().trim();
		        	String nName = object.mat_name.toUpperCase().trim();
		        	if (nName.length() > 255)
		            	nName = nName.substring(0, 255);

		        	if (!nName.equals(eName)) {
		            	throw new EnergyproSystemException("\n \n SUPP-12703... " +
		                    	"\n Номенклатурна назва матеріалу ( " + nName + " ) не співпадає з назвою нормативного матеріала ( "
		                    	+ eName + " ). Змініть номенклатуру або заведіть нову!");
		        	}
		    	}
		     */


		    /** 18.03.2014 13:00 +++ проверяем для материалов, обязательных для выполнения работ
		     *
		     *  поставлен рекорд - проверка продержалась до 25.03.2014.....
		     */

		    if (estimate.planItemRefCode != Integer.MIN_VALUE) {

		        ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(enConn, getUserProfile());
		        ENPlanWorkItem planItem = planItemDAO.getObject(estimate.planItemRefCode);

		        ENEstimateItemData data = logic.getTKMaterialDataByTechCard(estimate.materialRefCode, planItem.kartaRef.code);

		        if (data.isObligatory == 1) {
		            if (estimate.materialRefCode != TKConsts.TKMATERIALS_WRITING) {
		                String eName = estimate.materialRefName.toUpperCase().trim();
		                String nName = object.mat_name.toUpperCase().trim();
		                if (nName.length() > 255)
		                    nName = nName.substring(0, 255);

		                if (!nName.equals(eName)) {

		                    System.out.println("##### err nName = " + nName + " != " + eName + " ### planCode = " +
		                            plan.code + " ### materialCode = " + estimate.materialRefCode + " ### nn = " + object.nn);

		                    if (!logic.checkNomenclaturesByMaterial(estimate.materialRefCode, object.nn)) {
		                        throw new EnergyproSystemException("\n \n SUPP-12703... " +
		                                "\n Цей матеріал є обов'язковим для виконання роботи!!" +
		                                "\n Номенклатурна назва матеріалу ( " + nName + " ) не співпадає з назвою нормативного матеріала ( "
		                                + eName + " ). Змініть номенклатуру або заведіть нову!");
		                    }
		                }
		            }
		        }
		    }


		    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		    ///// 04.02.13 NET-4061, п. 3
		    logic.checkForOperativeStockRestriction(eType, plan, object);
		    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		    /* проверка кол-ва материала */
		    if ((eType != ENElementType.WRITING_NO_OBJECT && e.elementInRef.code != ENConsts.ENELEMENT_METROLOGY_OBJECT_WRITEOFF) 
		    		|| (plan.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION)) {

		        /*
		    	if (object.quantity.doubleValue() > estimate.countFact.doubleValue()) {
		            throw new EnergyproSystemException(
		                    "Кількість матеріалу перевищує кількість на роботі!");
		        }
		        */
		    	if (FINMaterials.getConvertedQuantity(object).doubleValue() > estimate.countFact.doubleValue()) {
		            throw new EnergyproSystemException(
		                    "Кількість матеріалу перевищує кількість на роботі!");
		        }

		        //////// 21.12.12 А была ведь дырка в проверках...
		        // Можно было, например, на 6 штук в плане попривязывать хоть 100 раз по одной штуке
		        // (проверка выше сработала бы только если бы за один раз пытались привязать больше 6 штук)
		        FINMaterialsFilter fFilter = new FINMaterialsFilter();
		        fFilter.estimateItemRef.code = estimate.code;
		        fFilter.statusRef.code = FINMaterialsStatus.GOOD;

		        FINMaterialsShortList fList = finDAO.getScrollableFilteredList(fFilter, 0, -1);
		        BigDecimal fQuantity = new BigDecimal(0);

		        for (int i = 0; i < fList.totalCount; i++)
		        {
			        // MDAX-441 Добавился коэффициент перевода единиц измерения из AX
		            //fQuantity = fQuantity.add(fList.get(i).quantity);
		        	fQuantity = fQuantity.add(FINMaterials.getConvertedQuantity(fList.get(i)));
		        }

		        //fQuantity = fQuantity.add(object.quantity);
		        fQuantity = fQuantity.add(FINMaterials.getConvertedQuantity(object));

		        fQuantity.setScale(6, BigDecimal.ROUND_HALF_UP);

		        if (fQuantity.doubleValue() > estimate.countFact.doubleValue()) {
		            throw new EnergyproSystemException(
		                    "Кількість матеріалу перевищує кількість на роботі!");
		        }
		        ////////


		        /* Если тип эстимейта не автоматически созданый */
		        if (estimate.typeRefCode != ENEstimateItemType.AUTO ) {

		            /* Проверим по номенклатуре и партии был ли приход по энерджинет */
		            FINMaterialsFilter finFilter = new FINMaterialsFilter();
		            finFilter.nn = object.nn;
		            finFilter.party_id = object.party_id;
		            finFilter.conditionSQL = " FINMATERIALS.CODE in ( select fm.code " +
		            " from finmaterials fm  , rqfkorder f , rqfkorderitem fi , rqfkorderitem2enstmttm fi2e " +
		            " where fm.nn = " +  object.nn + " ::text " +
		            " and fm.code = fi2e.finmaterialsrefcode " +
		            " and fi2e.fkorderitemrefcode = fi.code " +
		            " and fi.fkorderrefcode = f.code " +
		            " and f.kindcode in (" + RQFKOrderKind.RASHOD_LOADEXPL_MBP + "," + RQFKOrderKind.RASHOD_LOADEXPL_MNMA + "," + RQFKOrderKind.RASHOD_MBP + ","+ RQFKOrderKind.RASHOD_MNMA + ")  " +
		            " and fm.party_id = " + object.party_id +
		            " and f.moloutcode  = " + object.div_code + " ::text) " ;
		            int[] finArr = finDAO.getFilteredCodeArray(finFilter,0,-1);
		            if (finArr.length > 0 ) {
		                throw new EnergyproSystemException(
		                " Номенклатура " + object.mat_name + " нн. " + object.nn + " Партія "  + object.party_id +  " МОЛ " +  object.div_code +  " було введення в експлуатацію через програму EnergyNET. Для списання матеріалу використовуйте пункти меню \"Добавить с персонала\", \"Добавить с бригад\", \" Добавить с подстанций\" !!!" );
		            }
		        }

		    }


		    /** NET-4402...
		     * 	16.09.2014... +++ для списаний определяем нормативную группу материала по номенклатуре...
		     *  определение группы материала необходимо для списания трансформаторов...
		     */

		    TKMaterialsDAO materialsDao = new TKMaterialsDAO(enConn, getUserProfile());

	        boolean power_transformers = false;
	        boolean isRecyclableMaterials = false;

	        // Если план на перевод материалов во вторсырье
	        if (plan.elementRef.code == ENElement.NO_OBJECT_RECYCLABLE_MATERIALS)
	        {
	        	isRecyclableMaterials = true;
	        }

	        if (eType == ENElementType.WRITING_NO_OBJECT
	        		&& plan.typeRef.code == ENPlanWorkType.WRITINGS) {

	        	int materialGroupCode = logic.getMaterialGroupCode(object.nn);

	        	if (materialGroupCode != Integer.MIN_VALUE) {
	        		if (materialGroupCode == TKConsts.TKMATERIALS_GROUP_POWER_TRANSFORMERS) {

	        			power_transformers = true;

	        			/** в одном плане(акте ????) должны быть трансформаторы одного типа !!!*/
	        	        FINMaterialsFilter finMaterialsFilter = new FINMaterialsFilter();
	        	        finMaterialsFilter.estimateItemRef.code = estimate.code;
	        	        finMaterialsFilter.statusRef.code = FINMaterialsStatus.GOOD;

	        	        FINMaterialsShortList finMaterialsList = finDAO.getScrollableFilteredList(finMaterialsFilter, 0, -1);

	        	        if (finMaterialsList.totalCount > 0) {

		        	        String nomenclatures = "";

		        	        for (int f = 0; f < finMaterialsList.totalCount; f++) {
		        	            if (nomenclatures.length() <= 0) {
		        	            	nomenclatures = "" + "'" + finMaterialsList.get(f).nn + "'";
		        	            } else {
		        	            	nomenclatures = nomenclatures + ", " + "'" + finMaterialsList.get(f).nn + "'";
		        	            }
		        	        }

		        	        TKMaterialsFilter materialsFilter = new TKMaterialsFilter();
		        	        materialsFilter.conditionSQL = " parentrefcode = " + TKConsts.TKMATERIALS_GROUP_POWER_TRANSFORMERS +
		        	        		" and tkmaterials.code in (" +
		        	        		" select w.materialrefcode from tempnomenclatures w " +
		        	        		" where w.nn in ('" + object.nn + "'," + nomenclatures + "))";

		        	        int materialsArr[] = materialsDao.getFilteredCodeArray(materialsFilter, 0, -1);

		        	        if (materialsArr.length > 1) {
				        		throw new EnergyproSystemException("\n\n" +
				                        "Трансформатори повинні бути одного типу!!!");
		        	        }
	        	        }
	        		}
	        	} 
	        	/* 27.09.2017 Уберем вообще эту проверку. Для правильно занесенных трансформаторов логика выше и так отработает,
	        	 * а для всех остальных номенклатур особого смысла в этой проверке нет
	        	else {
	        		throw new EnergyproSystemException("\n\n" +
	                        "Помилка при визначенні нормативної групи матеріала для номенклатури " + object.nn + "!!!\n" +
	        				"Зверніться у ВТВ. тел. 13-65");
	        	}
	        	*/
	        }



		    /* 17.11.2011 +++ надо добавить проверку суммарного(по фактам) кол-ва */
		    //logic.checkAllFact(estimate.code, plan.code, object.quantity, estimate.countFact);


		    //////////////////////////// 28.10.11 Проверка на непроведенные ордера на переброску между объектами
		    ENEstimateItem parentEstimate = new ENEstimateItem();
		    parentEstimate.code = Integer.MIN_VALUE;

		    parentEstimate = logic.getEstimateFromCurrentPlanByEstimateCode(object.estimateItemRef.code);

		    // типа в связках(Ест2Ест) ниче нету (пока у метрологии) + кривые АВРы
		    if (parentEstimate.code == Integer.MIN_VALUE){
		    	parentEstimate = logic.getEstimateFromCurrentPlanByPlans(object.estimateItemRef.code);
		    }

		    if (parentEstimate.code != Integer.MIN_VALUE)
		    {
		    	RQFKOrderDAO fkOrderDAO = new RQFKOrderDAO(enConn, getUserProfile());
		    	RQFKOrderFilter fkOrderFilter = new RQFKOrderFilter();
		    	fkOrderFilter.kind.code = RQFKOrderKind.RASHOD_E2E;
		    	fkOrderFilter.conditionSQL = "code in ( " +
		    			" select o.code " +
		    			" from enestimateitem ei, finmaterials fm, rqfkorderitem2enstmttm ie, " +
		    			"      rqfkorderitem oi, rqfkorder o " +
		    			" where fm.estimateitemrefcode = ei.code " +
		    			"   and ie.estimateitemcode = ei.code " +
		    			"   and ie.finmaterialsrefcode = fm.code " +
		    			"   and ie.fkorderitemrefcode = oi.code " +
		    			"   and oi.fkorderrefcode = o.code " +
		    			"   and fm.party_id = " + object.party_id +
		    			"   and fm.nn = " + object.nn + " ::text " +
		    			"   and o.moloutcode = " + object.div_code + " ::text " +
		    			"   and o.kindcode = " + RQFKOrderKind.RASHOD_E2E +
		    			"   and o.statuscode <> " + RQFKOrderStatus.IN_FK +
		    			" )";

		    	RQFKOrderShortList fkOrderList = fkOrderDAO.getScrollableFilteredList(fkOrderFilter, 0, -1);
		    	if (fkOrderList.totalCount > 0)
		    	{
		    		throw new EnergyproSystemException("Матеріал, який ви резервуєте, знаходиться в ще не проведеному ордері на переміщення між об'єктами " +
	                                                "(№ " + fkOrderList.get(0).numberDoc + " від " +
	                                                new SimpleDateFormat("dd.MM.yyyy").format(fkOrderList.get(0).dateGen) + ")! \n" +
	                                                "Спочатку проведіть цей ордер!");
		    	}
		    }
		    ///////////////////////

			/*
			    ENEstimateItem out = new ENEstimateItem();
			    out.code = Integer.MIN_VALUE;
			    try
			        {
			        EstimateLogic logic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
			        out = logic.getEstimateFromCurrentPlanByEstimateCode(estimateCode);

			        // типа в связках(Ест2Ест) ниче нету (пока у метрологии) + кривые АВРы
			        if (out.code == Integer.MIN_VALUE){
			            out = logic.getEstimateFromCurrentPlanByPlans(estimateCode);
			        }

			        return out;
			        }
			    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't connect to DB",e);}
			    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
			    finally                              {closeConnection();}
			 */



		    int fmCode = add_(object, isException);

		    // Если finMaterials не добавился, то дальше ничего не делаем и выходим
		    if (fmCode == Integer.MIN_VALUE)
		    {
		    	return fmCode;
		    }

		    /** 17.09.2014 +++ металлолом для трансформаторов */
		    /** 25.11.2016 Или планы на перевод материалов во вторсырье */
		    if (power_transformers || isRecyclableMaterials) {

				Context estimateCnt = new InitialContext();
				Object estimateRef = estimateCnt.lookup(ENEstimateItemController.JNDI_NAME);
				ENEstimateItemControllerHome estimateHome = (ENEstimateItemControllerHome) PortableRemoteObject
						.narrow(estimateRef, ENEstimateItemControllerHome.class);
				ENEstimateItemController estimateController = estimateHome.create();


				TKMaterials2RecycledMaterialsDAO recycledDao = new TKMaterials2RecycledMaterialsDAO(enConn, getUserProfile());
				TKMaterials2RecycledMaterialsFilter recycledFilter = new TKMaterials2RecycledMaterialsFilter();
				recycledFilter.conditionSQL = "tkmaterials.code = (select w.materialrefcode " +
						" from tempnomenclatures w where w.nn = '" + object.nn + "')";

				TKMaterials2RecycledMaterialsShortList recycledList = recycledDao.getScrollableFilteredList(recycledFilter, 0, -1);



				if (recycledList.totalCount > 0) {
					for (int r = 0; r < recycledList.totalCount; r++) {

						BigDecimal eCountGen = new BigDecimal(0);
						BigDecimal eCountFact = new BigDecimal(0);
						BigDecimal ePrice = new BigDecimal(0);
						int eIsUseVAT = ENConsts.ENESTIMATEITEM_USEVAT;
						int ePlanRefCode = plan.code;
						int eMaterialRefCode = Integer.MIN_VALUE;
						int eKindRefCode = ENEstimateItemKind.UNMOUNT;
						int eAccountingTypeRefCode = TKAccountingType.TMC;
						int nomenclatureCode = Integer.MIN_VALUE;
						int isCreateObject = 0;
						int finMaterialsParentCode = fmCode;
						String account = "";

						TKMaterials materials = materialsDao.getObject(recycledList.get(r).recycledMaterialRefCode);

						TmaterialDAO tMaterialDao = new TmaterialDAO(finConn, getUserProfile());
						TmaterialFilter tMaterialFilter = new TmaterialFilter();
						tMaterialFilter.nn = materials.nomenclatureNumber;

						TmaterialShortList tMaterialList = tMaterialDao.getScrollableFilteredList(tMaterialFilter, 0, -1);
						if (tMaterialList.totalCount > 0) {

							if (isRecyclableMaterials)
							{
								eCountFact = recycledList.get(r).countGen.multiply(object.quantity).setScale(6, BigDecimal.ROUND_HALF_UP);
							}
							else
							{
								eCountFact = recycledList.get(r).countGen;
							}

							//ePrice = tMaterialList.get(0).cost == null ? new BigDecimal(0) : tMaterialList.get(0).cost;

							// Если есть код группы номенклатур из AX, то мы должны выбрать бал. счет из группы
							if (tMaterialList.get(0).axInventItemGroupId != null && !tMaterialList.get(0).axInventItemGroupId.equals(""))
							{
								account = InventItemGroupFinder.getAXInventProfileId(tMaterialList.get(0).axInventItemGroupId);
								// Для AX нужно брать цену с норм. материала, т.к. на номенклатурах в AX цен нет!
								// ePrice = materials.cost == null ? new BigDecimal(0) : materials.cost;
							}
							else
							{
								account = tMaterialList.get(0).bal_sch;
								// ePrice = tMaterialList.get(0).cost == null ? new BigDecimal(0) : tMaterialList.get(0).cost;
							}

							// 28.03.2017 Берем цену всегда с норм. материала!!!
							ePrice = materials.cost == null ? new BigDecimal(0) : materials.cost;

							eMaterialRefCode = materials.code;
							nomenclatureCode = tMaterialList.get(0).id;

						} else {
			        		throw new EnergyproSystemException("\n\n" +
			                        "Номенклатуру " + object.nn + " не знайдено в Ф.К.!!!");
						}


						ENEstimateItem estimateItem = new ENEstimateItem();

						estimateItem.countGen = eCountGen;
						estimateItem.countFact = eCountFact;
						estimateItem.price = ePrice;
						estimateItem.isUseVAT = eIsUseVAT;
						estimateItem.planRef.code = ePlanRefCode;
						estimateItem.materialRef.code = eMaterialRefCode;
						estimateItem.kindRef.code = eKindRefCode;
						estimateItem.accountingTypeRef.code = eAccountingTypeRefCode;

						estimateController.addUnmount(estimateItem,
								nomenclatureCode, /*object.nn*/materials.nomenclatureNumber, isCreateObject,
								finMaterialsParentCode, account, true);

					}
				} else {
	        		throw new EnergyproSystemException("\n\n" +
	                        "Для номенклатури " + object.nn + " не знайдено матеріали для вторинної сировини!!!\n" +
	        				"Зверніться у ВТВ. тел. 13-65");
				}
		    }
		    if(!_messageId.equals("")) {
		    	axLogic.aifttscommit(_messageId);
		    }


			return fmCode;

		} catch (Exception e) {
			if(writeOffTmcConf==1 || writeOffTmcConf==2) {
				System.out.println(" finmaterialscontroller addMaterials axLogic.aifttsabort , _messageId = " + _messageId);
				axLogic.aifttsabort(_messageId);
			}
			System.out.println("error addMaterials : ");
			throw new EnergyproSystemException(e.getMessage());
		}

		finally {
			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}


  public int addGsm(FINMaterials object){

      Connection enConn = null;

      int writeOffTmcConf = Integer.MIN_VALUE;
	  String _messageId = "";
	  AXTransactionsLogic axLogic = null;
            try {
				enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	            ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(enConn, getUserProfile());

	            AuthLogic netAuth = new AuthLogic(enConn, getUserProfile());
	            axLogic = new AXTransactionsLogic(enConn, getUserProfile());
	  	        writeOffTmcConf = netAuth.checkUsesDataForWriteOff();

                boolean USES_MDAX_INVENTORYONHAND = netAuth.checkUsesMDAXData(Config.CONFIG_USES_MDAX_INVENTORYONHAND);

	            /* 28.11.2011 +++ проверка кол-ва топлива */
	            ENEstimateItem estimate = estimateDAO.getObject(object.estimateItemRef.code);
	            if (object.quantity.doubleValue() > estimate.countFact.doubleValue()) {
	                throw new EnergyproSystemException(
	                        "Кількість палива перевищує кількість на роботі!");
	            }

	            System.out.println("### start addGsm : ");

	            /**  торжественное открытие транзакции в АХ  */
	            if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
	      	      _messageId = axLogic.aifttsbegin(WebServicesConsts.defaultTimeOut+60);
	      	      System.out.println(" finmaterialscontroller addMaterials axLogic.aifttsbegin , _messageId = " + _messageId );
	    		  }

	         // если остатки взяли с аксапты
	        	if(USES_MDAX_INVENTORYONHAND && !object.ax_rest_purpose_typeid.equals("") ) {
					object.rest_purpose_type_id = Integer.parseInt(object.ax_rest_purpose_typeid.replace("30100", "")  ) ; // вырезаем из аксаптового значения НАЗНАЧЕНИЯ код который соответствуем ФК коду назнач остатка
				}

	            int finamterialsCode = add_(object);

	            if(!_messageId.equals("")) {
			    	axLogic.aifttscommit(_messageId);
			    }

               return finamterialsCode;

            } catch (Exception e) {
    			if(writeOffTmcConf==1 || writeOffTmcConf==2) {
    				System.out.println(" finmaterialscontroller addGsm axLogic.aifttsabort , _messageId = " + _messageId);
    				axLogic.aifttsabort(_messageId);
    			}
    			System.out.println("error addGsm : ");
    			throw new EnergyproSystemException(e.getMessage());
    		}
  }

	@Override
	public int add(FINMaterials object) {
		throw new EnergyproSystemException("Перезайдите в программу ...");
	}

	public void removeMaterials(int code) {
		remove_(code);
	}

	public void removeGsm(int code) {
		// жаль нету обьекта :) авторизация в РЕМОВЕ ...
		remove_(code);
	}

	@Override
	public void remove(int code) {
		add(new FINMaterials());
	}

	public int add_(FINMaterials object) {
		return add_(object, true);
	}

	public int add_(FINMaterials object, boolean isException) {
		Connection finConn = null;
		Connection enConn = null;

		System.out.println("start add metarials ... " + object.mat_name);

		try {
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			FINLogic finLogic = new FINLogic(finConn, getUserProfile());
			WorkOrderLogic workOrderLogic = new WorkOrderLogic(enConn, getUserProfile());
			ENWorkOrder workOrder = workOrderLogic.getWorkOrderByEstimateItemCode(object.estimateItemRef.code);

			ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(enConn, getUserProfile());
			ENEstimateItem estimate = estimateDAO.getObject(object.estimateItemRef.code);

			PlanWorkLogic planWorkLogic = new PlanWorkLogic(enConn, getUserProfile());
			ENPlanWork planWork = planWorkLogic.getPlanByWorkOrderCode(workOrder.code);
			TransportLogic transportLogic = new TransportLogic(enConn, getUserProfile());
			
			mDaxLogic mdLogic = new mDaxLogic(enConn, getUserProfile());

			AuthLogic netAuth = new AuthLogic(enConn, getUserProfile());

			AXTransactionsLogic axLogic = new AXTransactionsLogic(enConn, getUserProfile());

			boolean USES_MDAX_INVENTORYONHAND = netAuth.checkUsesMDAXData(Config.CONFIG_USES_MDAX_INVENTORYONHAND);
			int writeOffTmcConf = netAuth.checkUsesDataForWriteOff();

			// 05.11.14 NET-4414
			if (estimate.kindRef.code != ENEstimateItemKind.GSM) {
				if (object.rest_purpose_type_id == RQConsts.REST_PURPOSE_TYPE_ID_FUELTANK) {
					throw new EnergyproSystemException("\n\n"
							+ "NET-4414 Під цей нормативний матеріал заборонено прив'язувати ПММ з призначенням залишку \"Бак\" !");
				}
			} else {
				if (object.rest_purpose_type_id != RQConsts.REST_PURPOSE_TYPE_ID_FUELTANK						 
						) {
					throw new EnergyproSystemException("\n\n"
							+ "NET-4414 Прив'язувати ПММ можливо тільки з залишків з призначенням \"Бак\" !");
				}
			}


			ENAct act = new ActLogic(enConn,getUserProfile()).getActByPlanCode(estimate.planRef.code, false);
			if (act != null) {
				// такого типа никогда не будет ;)
				//if (act.statusRef.code != ENActStatus.GOOD)
					throw new EnergyproSystemException("\n\n"
							+ "Цей факт включено до Акту (№ "+ act.numberGen +" ) ... видаляйте прив'язку до Акта!!! ...\n "
							+ " бо Ви друкуєте акт, а потім змінюєте його ;(");
			}



		    // проверим списание в пределах ЦФО и бюджетодержателя ... для мат-лов .. ГСМ от куда хош ...
		    // через 2 часа все поменялось ..
		    /*
		    if (estimate.kindRef.code == ENEstimateItemKind.MATERIALS){
		       PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
		       ENPlanWork plan = planLogic.getPlanByCode(estimate.planRef.code );

			   DepartmentLogic departmentLogic = new DepartmentLogic(enConn, getUserProfile());
		       departmentLogic.validateCFOfkCodeByBudjetCode( plan.budgetRef.code , object.budget_core_id);
		    }
		    */


			/*
			 *  отменили 2010.06.29
			     // запрет трогать Бенз обловским службам ....
			     PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
			     ENPlanWorkDAO planDAO = new ENPlanWorkDAO(enConn, getUserProfile());
			     ENPlanWork plan = planDAO.getObject( planLogic.getPlanCodeByEstimate(estimate.code) );
			     ENDepartmentDAO depDAO = new ENDepartmentDAO(enConn, getUserProfile());
			     ENDepartment dep = depDAO.getObject(plan.departmentRef.code);


			     ElementLogic eLogic = new ElementLogic(enConn, getUserProfile());
			     int eType = eLogic.getElementTypeByCode(plan.elementRef.code);

			     if (
			            (dep.renCode == 3)
			            && (estimate.kindRef.code == ENEstimateItemKind.GSM)
			            && (eType != ENElementType.BUILDER)
			        )
			        {
			        throw new EnergyproSystemException("ПММ служб ХОЕ резервувати тимчасово заборонено ...");
			     }
			*/

			//finLogic.validateDocStatus(act.finDocCode);
			int finDocCode = Integer.MIN_VALUE;
			String axJournalId = "";

			FINMolLogic finMolLogic = new FINMolLogic(enConn, getUserProfile());

			String molCode;
			int operationType;
			int finDoc;
			//int operationType;

			System.out.println("done work 1 " + object.nn + " " + object.mat_name);

			//FINDoc2WorkOrder d2w = workOrderLogic.getFINDocCodeByWorkOrderCode(workOrder.code, 1); // Тип операции РЕЗЕРВ (переход в 30х вид)
			//if (planWork.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION) {
			if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
					|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
					|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/) {

				finDocCode = finMolLogic.getFINDocCodeByWorkOrderCode(object.molDataRef.code, FINDocType.MOVE_332);
				axJournalId = finMolLogic.getAxJournalIdByWorkOrderCode(object.molDataRef.code, FINDocType.MOVE_332);
			} else {
				if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION
						|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION
						|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL) {

					finDocCode = finMolLogic.getFINDocCodeByWorkOrderCode(object.molDataRef.code, FINDocType.MOVE_292);
					axJournalId = finMolLogic.getAxJournalIdByWorkOrderCode(object.molDataRef.code, FINDocType.MOVE_292);
			    } else {
			    	finDocCode = finMolLogic.getFINDocCodeByWorkOrderCode(object.molDataRef.code, FINDocType.MOVE_302);
			    	axJournalId = finMolLogic.getAxJournalIdByWorkOrderCode(object.molDataRef.code, FINDocType.MOVE_302);
			    }
			}

			FINMaterialsList finListFK = null;
			// заполнить данными из фк если в конфиге стоит выборка остатков из аксапты
			if ( USES_MDAX_INVENTORYONHAND ) {
				object = finLogic.fillFinmaterialsFromFKByMdaxData(object , workOrder.dateGen ,  finDocCode );
			}

			// AuthLogic al = new AuthLogic(enConn, getUserProfile());
			// al.checkPermissionMOL(object.div_code);

			if (estimate.kindRef.code == ENEstimateItemKind.MATERIALS) {
				if (estimate.accountingTypeRef.code != TKAccountingType.TMC) {
					throw new EnergyproSystemException(
							"З таким типом Матеріалу ТМЦ з ФК не розносится ...");
				}

				if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
						|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
						|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /* SUPP-13237*/) {
					operationType = 332;
				} else if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION
						|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION
						|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL) {
					operationType = 292;
				} else {
					operationType = 302;
				}

			} else if (estimate.kindRef.code == ENEstimateItemKind.CUSTOMER_MATERIALS) {
				operationType = 302;
			} else if (estimate.kindRef.code == ENEstimateItemKind.GSM) {

		        // проверим сходится для номенклатура с типом топлива ...
		        // 09.03 АС .. факир был пьян ... пока так проверять НЕЛЬЗЯ !!! пока не буду ВСЕ с путевыми листами ....
		        /* 13.05.2011 есть метод похитрее ;) YF{{{{{{{{{{{!!!!!!!!!
		        TransportLogic tLogic = new TransportLogic(enConn, getUserProfile());
		        int transportItemCode = tLogic.getTransportItemCodeByEstimateItem(estimate.code);
		        // если в Путевых - сверим номенклатуры и кол-во, которое списывается...
		        if (tLogic.checkTransportItemInTravelSheet(transportItemCode, false))
		        {
		            if (! tLogic.checkFuelNomenclatureByMaterial(estimate.materialRef.code, object.nn)){
		                throw new EnergyproSystemException("Не співпадає номенклатура з типом палива ..." + object.nn + " " + object.mat_name + " й код мат-лу " + estimate.materialRef.code);
		            }
		            // проверим при закрытии ПЛ ... могут разносить кусками
		               //if (estimate.countFact.doubleValue() != object.quantity.doubleValue()){
		              //     throw new EnergyproSystemException("Не співпадає кількість витраченого та кількість, що списується ..");
		             // }
		        }
		        */

				// бортанем привязку ГСМ на планах - он часто уходит в красные остатки в таком виде ;)
				PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());
				ENPlanWork plan = planLogic.getPlanByCode(estimate.planRef.code);
				if (plan.kind.code == ENPlanWorkKind.NPW) {
					throw new EnergyproSystemException(
							"ПММ прив_язується тільки з подорожніх листів на Фактах ...");
				}

				TravelSheetLogic tsLogic = new TravelSheetLogic(enConn, getUserProfile());
				ENTravelSheet ts = tsLogic.getTravelSheetByEstimateItemCode(estimate.code);
				if (ts != null) {

					if (ts.statusRef.code == ENTravelSheetStatus.CLOSED){
						throw new EnergyproSystemException("Цей ПММ вже у закритому ПЛ № " + ts.numberGen);
					}

					if (!transportLogic.checkFuelNomenclatureByMaterial(estimate.materialRef.code, object.nn)) {
						throw new EnergyproSystemException("\n\n"
								+ "Не співпадає номенклатура з типом палива ..." + object.nn + " " + object.mat_name + " й мат-л "
								+ new TKMaterialsDAO(enConn, getUserProfile()).getObject(estimate.materialRef.code).name );
					}

					EstimateLogic estLogic = new EstimateLogic(enConn, getUserProfile());
					FINMaterialsShortList fmList1 = estLogic.getFINMaterialsListByEstimateItemCode(estimate.code);
					BigDecimal countGSM = object.quantity;

					for (int p = 0; p < fmList1.totalCount; p++) {
						countGSM = countGSM.add(fmList1.get(p).quantity).setScale(6, BigDecimal.ROUND_HALF_UP);

						if (estimate.countFact.doubleValue() < countGSM.doubleValue()) {
							throw new EnergyproSystemException("Кількість, що списується, перевищує кількість витраченого");
						}
					}
				}

				int transportItemCode = transportLogic.getTransportItemCodeByEstimateItem(estimate.code);
				ENTransportItem transport = new ENTransportItemDAO(enConn, getUserProfile()).getObject(transportItemCode);
				// для инвентаризации будем пропускать проверки
				if (plan.elementRef.code != ENElement.INVENTARIZATION_WRITEOFF_OBJECT) {

					if (transport == null) {
						throw new EnergyproSystemException("Транспорт не знайдено ...");
					}
					
					TKTransportRealHistory transportHistory = transportLogic.getHistory(transport.transportReal.code, ts.dateFinal);

					if (transportHistory.finMolCode == null) {
						throw new EnergyproSystemException("Вкажіть підзвіт, з якого заправляють автомобіль держ. № " + transport.transportReal.gosNumber);
					}

					// NET-4304 Сверка с историей
					if (!transportHistory.finMolCode.equals(object.div_code)) {
						throw new EnergyproSystemException("\n\n"
	                            + "На період з " + Tools.dateFormatDefault.format(transportHistory.dateStart) + " та "
	                            + ((transportHistory.dateFinal == null)
	                            		? Tools.dateFormatDefault.format(plan.dateFinal)
	                            				: Tools.dateFormatDefault.format(transportHistory.dateFinal))
	                            + " транспорт № " + transport.transportReal.gosNumber + " заправлявся з підзвіту " + transportHistory.finMolCode
	                            + ", а не " + object.div_code);
	                }

				}

				/// вообще бесполезная проверка, в сад её
			    // al.checkPermissionGSM(object.div_code);

				operationType = 303;
			} else
				throw new EnergyproSystemException("Unknown ENEstimateItemKind code = " + estimate.kindRef.code);

			// AS 17.03.2011
			finLogic.validateDocStatus(finDocCode, operationType );

			System.out.println("done work 2 " + object.nn + " " + object.mat_name);

			// AS 31.01.2011
			// проверим остатки на КОНЕЦ месяца ... на 3к не всегда помогает ;))
			// главное что бы не было на конец месяца ...

			Calendar calendar_ = Calendar.getInstance();
			calendar_.setTime(workOrder.dateGen);
			calendar_.set(Calendar.DAY_OF_MONTH, calendar_.getActualMaximum(Calendar.DAY_OF_MONTH));
			Date dateLastDay = calendar_.getTime();
			System.out.println("start work 2.1 chk on date " + dateLastDay );

			FINMaterials matLastDay;

			// Y если план списание средств защиты то включаем фильтр из остатков по дате ввода в эксплуатацию
			// 02.12.11 DL Для МБП и МНМА, наверное тоже
			// if (planWork.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION) {
			if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
					|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
					|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/) {

				matLastDay = finLogic.getInDate(object, finDocCode, dateLastDay, true);
			} else {
				matLastDay = finLogic.getInDate(object, finDocCode, dateLastDay);
			}


		     /* //AS 17.03.2011
		     BigDecimal q_ = matLastDay.quantity.setScale(6, BigDecimal.ROUND_HALF_UP) ; //finLogic.checkCountIn3000(object, finDocCode);

		     if ( q_.doubleValue() == 0 )
		        throw new EnergyproSystemException("Ошибка в резервировании материала(на конец месяца). Этот материал использовался в нарядах, с более поздней датой. Остаток : " + q_.toString(), getUserProfile());

		     if ( q_.doubleValue() < 0 )
		        throw new EnergyproSystemException("Ошибка в резервировании материала(на конец месяца). У Вас уже образовался КРАСНЫЙ остаток!!! " + q_.toString(), getUserProfile());


		     if ( (q_.doubleValue() - object.quantity.doubleValue()) < 0.0 )
		        throw new EnergyproSystemException("Ошибка в резервировании материала(на конец месяца). Можно использовать : " + q_.toString(), getUserProfile());
		     System.out.println("end work 2.1 chk on date " + dateLastDay );

		     //matLastDay = null;
		     // AS /////////////////////////

		     FINMaterials mat3k = finLogic.getIn3000(object, finDocCode);
		     //FINMaterials mat3k = finLogic2.getIn3000(object, finDocCode);

		     BigDecimal q = mat3k.quantity.setScale(6, BigDecimal.ROUND_HALF_UP) ; //finLogic.checkCountIn3000(object, finDocCode);

		     if ( q.doubleValue() == 0 )
		        throw new EnergyproSystemException("Ошибка в резервировании материала. Этот материал использовался в нарядах, с более поздней датой. Остаток : " + q.toString(), getUserProfile());

		     if ( q.doubleValue() < 0 )
		        throw new EnergyproSystemException("Ошибка в резервировании материала. У Вас уже образовался КРАСНЫЙ остаток!!! " + q.toString(), getUserProfile());


		     if ( (q.doubleValue() - object.quantity.doubleValue()) < 0.0 )
		        throw new EnergyproSystemException("Ошибка в резервировании материала. Можно использовать : " + q.toString(), getUserProfile());

		     */


			finLogic.validateDocDate(workOrder.dateGen);

			//finLogic2.validateDocDate(workOrder.dateGen);

			object.calc_price = object.calc_price.setScale(3, BigDecimal.ROUND_HALF_UP);
			object.price = object.price.setScale(3, BigDecimal.ROUND_HALF_UP);

			isRounded = false;
			// остаток может учитывать приходы след. месяца ...
			// а разрывать красные. остатки при переходах через месяц НЕЛЬЗЯ ...
			// РАСЧЕТА будет на конец месяца , а не на 3000 год ;) !!!
			//object.cost = calcCost(object, mat3k);
			//object.quantity = calcQuantity(object, mat3k);


			object.cost = calcCost(object, matLastDay);
			object.quantity = calcQuantity(object, matLastDay);


		    /*if (object.quantity.multiply(new BigDecimal(2)).doubleValue() >= object.fullQuantity.doubleValue()
		           && object.quantity.doubleValue() < 0.10)
		    {
		       object.cost = object.quantity.multiply(object.price).setScale(3, BigDecimal.ROUND_HALF_UP);
		       //object.price = object.calc_price;
		    }*/


			// если округлили раньше - ниче не делать ...
			if (!isRounded ) {
				if ((object.calc_price.doubleValue() - object.price.doubleValue()) >= 0.01
						//&& object.quantity.doubleValue() != mat3k.quantity.doubleValue()
						//&& object.quantity.doubleValue() != object.fullQuantity.doubleValue()
						) {
					object.cost = object.cost.subtract(new BigDecimal(0.01));
				}

				if ((object.calc_price.doubleValue() - object.price.doubleValue()) <= -0.01
						//&& object.calc_price.doubleValue() != object.price.doubleValue())
						) {
					object.cost = object.cost.add(new BigDecimal(0.01));
				}
			} // если округлено на последних кусках партии


			// для ДОРОБКА ... стоимость больше  10 грн - значит доробка ;) !!! .. чем приход ..
			if ((object.price.doubleValue() - object.calc_price.doubleValue()) > 10.00) {
				object.calc_price = object.price;
				object.cost = calcCost(object, matLastDay);
			}

			object.cost = object.cost.setScale(2, BigDecimal.ROUND_HALF_UP);
			//matLastDay = null;
			//mat3k = null;

			//// как то заежжают МИНУСОВЫЕ кол-во, стоим, цена !!!!!!
			checkNumericsNotNegative(object);

			// пересчитаем СТОИМОСТЬ !!!!
			// если заехал ВЕСЬ остаток ... СТОИМОСТЬ ПЕРЕСЧИТЫВАТЬ НЕ надо ...
			// *****
			//System.out.println("%%%%%%% " + "nn: " + object.nn + " ; div_code: " + object.div_code + " ; party_id: " + object.party_id + " ; sysdate: " + (new Date()));
			//System.out.println("object.fullQuantity:" + object.fullQuantity.doubleValue());
			//System.out.println("object.quantity:" + object.quantity.doubleValue());
			//System.out.print("subtract" + Math.abs( object.fullQuantity.subtract(object.quantity).doubleValue()));

			// *****
			/*
			if ( Math.abs( object.fullQuantity.subtract(object.quantity).doubleValue()) < 0.00000001 )
			{
			   object.cost = object.fullCost.setScale(2, BigDecimal.ROUND_HALF_UP);
			}
			else
			{
			   object.cost = new BigDecimal(object.calc_price.doubleValue() * object.quantity.doubleValue()).setScale(2, BigDecimal.ROUND_HALF_UP);
			}
			*/


			// для 302 !!! измениться !!!!!
			System.out.println("done work 3 " + object.nn + " " + object.mat_name);

			// проверим дату партии и дату документа .. у 5110 Дунца есть машина времени ;)
			PartyDAO partyDAO = new PartyDAO(finConn, getUserProfile());
			Party party = partyDAO.getObject(object.party_id);

			if (workOrder.dateGen.before( party.party_date)) {
				System.out.println("!!! Машина времени .... workOrder=" + workOrder.code + " party=" + party.id );
				throw new EnergyproSystemException("\n\n"
						+ String.format("Матеріал %s %s ще не доставлений ...", object.nn, object.mat_name));
			}


			// AS NEW LOGIC $)
			String Via_who = getUserProfile().userName.toUpperCase() + " (" + new SimpleDateFormat("dd.MM.yyyy").format(workOrder.dateGen).toString() +")" ;
			FKLogic2 fkLogic2 = new FKLogic2(finConn, getUserProfile());

			//fkLogic2.check_doc_date(workOrder.dateGen, true);
			boolean isErr = true;
			fkLogic2.OpenDocument(finDocCode);
			String errText = "";

			try {
				/* вроде делать только после изменений .... */
				BigDecimal docSum = fkLogic2.getDocStrings();

				//createDocThead(workOrder.workOrderNumber, workOrder.dateGen , operationType, molData.finMolCode, Integer.MIN_VALUE, "ENERGYNET", Via_who);
				fkLogic2.UpdateDocumentShort(
						workOrder.workOrderNumber,
						operationType,
						object.div_code,
						object.div_code,
						workOrder.dateGen,
						docSum,
						Via_who);


				/*ymp materialsWriteOff остатки в аксапту - вставка строк в документ */
				if (writeOffTmcConf == 1 || writeOffTmcConf == 2) {
					String[] createdStringBack = {"","",""};
					createdStringBack = mdLogic.addLinesForWriteOffTMC(object , axJournalId , workOrder.dateGen );
					// код строки журнала из AX
					object.axInventTransferLinesCode = createdStringBack[0];
					object.price = new BigDecimal(createdStringBack[1]);
					object.cost = new BigDecimal(createdStringBack[2]);

					if(object.axInventTransferLinesCode.equals("")) {
						throw new EnergyproSystemException("error inserting lines in mDAX");
					}
				}

				///// 28.09.12 NET-3102
				// object.finDocItemCode = fkLogic2.addString(object, object.rest_purpose_id, 2075);
				FKOrderLogic fkOrderLogic = new FKOrderLogic(getUserProfile(), enConn);
				int rest_purpose_id = fkOrderLogic.getNewDetailedRestPurposeId(RQConsts.REST_PURPOSE_ID_RESERVE, object.rest_purpose_id);
				object.finDocItemCode = fkLogic2.addString(object, object.rest_purpose_id, rest_purpose_id);
				/////




				if (object.finDocItemCode == Integer.MIN_VALUE) {
					throw new EnergyproSystemException("error inserting DOC in FinCollection");
				}

				//errText = "error inserting DOC in FinCollection"
				//BigDecimal red_rest = fkLogic2.check_red_rest(finDocCode);
				//fkLogic2.createRealtimeProv(finDocCode);
				//int red_rest = fkLogic2.check_red_rest(finDocCode, object.finDocItemCode, 0);


				/** 24.10.2014... +++ для привязки тросика и пломбы не уходим в исключение.... */
				int red_rest = fkLogic2.check_red_rest(finDocCode, object.finDocItemCode, 0);

				if (red_rest != 0 && !isException) {
					fkLogic2.DropString(object.finDocItemCode);
					fkLogic2.SaveDocument(finDocCode);
					isErr = false;

					// ympmdaxwriteoff если красный остаток - также вынести строку из журнала аксапты
					if(object.axInventTransferLinesCode != null && !object.axInventTransferLinesCode.equals("")) {

						 if (axLogic.aifttsCheckOpen()) {
							 JournalAction journalAction = new JournalAction();
								journalAction.journalTransDelete(
										object.axInventTransferLinesCode,
										axLogic.getUserSecurity().domainUserName,
										axLogic.getUserSecurity().userPass);
						 } else
						 {
							 throw new EnergyproSystemException(
										"\n Не найдена активная транзакция для пользователя "
												+ axLogic.getUserSecurity().userName
												+ " !!! ");
						 }


					}
					return Integer.MIN_VALUE;
				}

				if (red_rest != 0 ) {
					System.out.println("error redRest : ");
					System.out.println("workOrderNumber :" + workOrder.workOrderNumber);
					System.out.println("finMaterials : nn = " + object.nn + ", count = " + object.quantity );
					finLogic.checkDocForRedRestAndFormDetailedException(finDocCode, true, FKConsts.CHECK_RED_REST_IS_UPDATE);
					throw new EnergyproSystemException("\n\n"
							+ "Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!! "
							+ "Залишок на кінець місяця " + matLastDay.quantity);
					//errText = "Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!! Залишок на кінець місяця " + matLastDay.quantity;
				}

				docSum = fkLogic2.getDocStrings();

				fkLogic2.UpdateDocumentShort(
						workOrder.workOrderNumber,
						operationType,
						object.div_code,
						object.div_code,
						workOrder.dateGen,
						docSum,
						Via_who);

				fkLogic2.SaveDocument(finDocCode);
				isErr = false;
			}

			catch (Exception e) {
				System.out.println("error SaveDocument FinMaterials : ");
				System.out.println("workOrderNumber :" + workOrder.workOrderNumber);
				System.out.println("finMaterials : nn = " + object.nn + ", count = " + object.quantity + ", balSch = " + object.bal_sch);

				throw new EnergyproSystemException(e.getMessage());
			}

			finally {
				fkLogic2.CancelDocumentHackFK(isErr);
			}


			//AS 17.03.2011 object.finDocItemCode = finLogic.createDocEntry(object, 302, finDocCode, Integer.MIN_VALUE);
			/*
     		object.finDocItemCode = finLogic2.createDocEntry(FINDocType.v302, finDocCode, Integer.MIN_VALUE, object.mat_id, object.bal_sch,
            	object.quantity , object.calc_price, object.cost, object.party_id,
            object.rest_purpose_id, object.budget_core_id, object.bal_sch,
            object.mat_name, object.mu_name
            );
			*/


			// 28 vid operaciii
			//d2w = workOrderLogic.getFINDocCodeByWorkOrderCode(workOrder.code, FINDocType.MOVE_28_302); // Тип операции РЕЗЕРВ (переход в 30х вид)
			//AS 17.03.2011 finDocCode = finMolLogic.getFINDocCodeByWorkOrderCode( object.molDataRef.code, FINDocType.MOVE_28_302);

			// если надо сохранить предыдущее назначение остатка - ПРОВЕРИТЬ !!!!
			// изменим назначение остатка для 28 !!!

			//   AS 17.03.2011 int rest_purpose_id = object.rest_purpose_id ;//finLogic.getRestPurposeCodeByWorkOrderNumber(workOrder.workOrderNumber);
			//object.rest_purpose_id = finLogic.getRestPurposeCodeByWorkOrderNumber(workOrder.workOrderNumber);
			//   AS 17.03.2011 String rest_purpose_name = object.rest_purpose_name;

			//object.rest_purpose_id = RQConsts.REST_PURPOSE_ID_RESERVE; // возвращал 2075 finLogic_.getRestPurposeCodeByWorkOrderNumber(workOrder.workOrderNumber);
			//   AS 17.03.2011 object.rest_purpose_id = finLogic.getRestPurposeCodeByWorkOrderNumber(workOrder.workOrderNumber);
			//   AS 17.03.2011 object.rest_purpose_name = workOrder.workOrderNumber;

			/*
     		if (estimate.kindRef.code == ENEstimateItemKind.MATERIALS ){
        	finDocCode = d2w.finDocMOLCode ; //act.finDocCode;
         	//finLogic.validateDocStatus(finDocCode, 28 );
         	//operationType = 302;
     		}
     		else
       		if (estimate.kindRef.code == ENEstimateItemKind.GSM ){
        	finDocCode = d2w.finDocMechanicCode ; //act.finDocMechanicCode;
            //finLogic.validateDocStatus(finDocCode, 28 );
            //operationType = 303;
       		}
       		else
        		throw new EnergyproSystemException("Unknown ENEstimateItemKind code="+estimate.kindRef.code);
			*/

			System.out.println("done work 4 " + object.nn + " " + object.mat_name);

			//   AS 17.03.2011 finLogic.validateDocStatus(finDocCode, 28 );
			     //finLogic2.validateDocStatus(finDocCode, 28);


			//   AS 17.03.2011 finLogic.createDocEntry(object, 28, finDocCode, Integer.MIN_VALUE);
			     /*
			     finLogic2.createDocEntry(FINDocType.v28, finDocCode, Integer.MIN_VALUE, object.mat_id, object.bal_sch,
			            object.quantity , object.calc_price, object.cost, object.party_id,
			            object.rest_purpose_id, object.budget_core_id, object.bal_sch,
			            object.mat_name, object.mu_name
			            );
			     */
			//   AS 17.03.2011 object.rest_purpose_id = rest_purpose_id;
			//   AS 17.03.2011 object.rest_purpose_name = rest_purpose_name;


			object.statusRef.code = FINMaterialsStatus.GOOD;

			object.userGen = getUserProfile().userName;
			object.dateEdit = new Date();

			FINMaterialsDAO objectDAO = new FINMaterialsDAO(getUserProfile(), enConn);
			int finCode = objectDAO.add(object);

		     // типа если ГСМ - апдейтим остатки топлива ...
		     /*
		     if (estimate.kindRef.code == ENEstimateItemKind.GSM ){
		        new TravelSheetFuelLogic(enConn, getUserProfile()).updateRemainderCountOutByEstimateCode(object.estimateItemRef.code);
		     }
		     */
			/////////////////////////

			return finCode;
			//return super.add(object);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			System.out.println("final add materials ... " + object.mat_name);
			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	/**
	 *
	 * Проверка, что у объекта FINMaterials все числовые характеристики (цена, кол-во, стоимость) неотрицательные
	 *
	 * Если какое-то отрицательное то функция выдаст исключение
	 *
	 * @param object объект FINMaterials
	 */
	private void checkNumericsNotNegative(FINMaterials object) {
		BigDecimal zero = new BigDecimal(0);
		String errStr = "%s меньше 0 (%f), номенклатура %s";
		if (object.quantity.compareTo(zero) < 0) {
			throw new EnergyproSystemException(String.format(errStr, "object.quantity", object.quantity, object.nn));
		}
		if(object.cost.compareTo(zero) < 0) {
			throw new EnergyproSystemException(String.format(errStr, "object.cost", object.cost, object.nn));
		}
		if (object.price.compareTo(zero) < 0) {
			throw new EnergyproSystemException(String.format(errStr, "object.price", object.price, object.nn));
		}
		if (object.calc_price.compareTo(zero) < 0) {
			throw new EnergyproSystemException(String.format(errStr, "object.calc_price", object.calc_price, object.nn));
		}
	}


  /*EFINMaterials. Получить список МАТЕРИАЛОВ из остатков ФК */
  /**
   *
   * Выборка материалов из ФК
   *
   * @param aFilterObject фильтр
   * @param balansNumberCondition условие для счетов
   * @param molCode код МОЛ
   * @param materialCondition условие для материалов
   * @param date Дата для остатков
   * @param finDocCode id документа
   * @param isWithAvar включать аварийный запас в выборку
   * @return shortList с материалами
   */
  public FINMaterialsList getMaterialsList(FINMaterialsFilter aFilterObject, String balansNumberCondition, String molCode, String materialCondition, Date date, int finDocCode)
   {
	  try {
		  FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(
				  getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

		  return finMaterialsLogic.getMaterialsList(aFilterObject, balansNumberCondition,  molCode,  materialCondition,  date, finDocCode);
	  }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }


  /**
   *
   * Выборка материалов из ФК (вместе с аварийным запасом)
   *
   * @param aFilterObject фильтр
   * @param balansNumberCondition условие для счетов
   * @param molCode код МОЛ
   * @param materialCondition условие для материалов
   * @param date Дата для остатков
   * @param finDocCode id документа
   * @return shortList с материалами
   */
	public FINMaterialsList getMaterialsListWithAvar(
			FINMaterialsFilter aFilterObject, String balansNumberCondition,
			String molCode, String materialCondition, Date date, int finDocCode) {
		try {

			FinMaterialsAvrLogic finMaterialsAvrLogic = new FinMaterialsAvrLogic(
					getConnection(AuthorizationJNDINames.FINMATERIALS_AVAR_DATASOURCE), getUserProfile());

			return finMaterialsAvrLogic.getMaterialsList(aFilterObject, balansNumberCondition,  molCode,  materialCondition,  date, finDocCode);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



	public Date getOpenPeriodDate() {
		try {
			FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
					getUserProfile());

			return finMaterialsLogic.getOpenPeriodDate();

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}

		finally {
			closeConnection();
		}
	}


  public FINMaterialsList getMaterialsList(int planCode, FINMaterialsFilter aFilterObject, String balansNumberCondition, String molCode, String materialCondition, Date date, int finDocCode)
  {
   try
    {
     FINLogic finLogic = new FINLogic(
    		 getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
     return finLogic.getMaterialsList(planCode, aFilterObject, balansNumberCondition,  molCode,  materialCondition,  date, finDocCode);
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
  }

  /*FINMaterials. Получить список МАТЕРИАЛОВ для переброски из Транзита в Net. Оперативный запас */
  public FINMaterialsShortList getListForTranzit2Operative(Date dateStart, Date dateFinish, int budgetCode, int departmentCode, String condition)
  {
   try
    {
     FINMaterialsDAO objectDAO = new FINMaterialsDAO(
    		 getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
     return objectDAO.getListForTranzit2Operative(dateStart, dateFinish, budgetCode, departmentCode, condition);
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
  }


  /*EFINMaterials. Получить список номенклатур и партий для естимейта  */
  public FINMaterialsShortList getFilteredPartyListWriteOff(int estimateItemCode, String codeMol)
   {
    try
     {
        FINMaterialsDAO objectDAO = new FINMaterialsDAO(
        		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      return objectDAO.getFilteredPartyListWriteOff(estimateItemCode, codeMol);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }


    public ENEstimateItem2FinShortList getENEstimateItem2FinShortList(int planCode, FINMaterialsFilter finFilter, String MOLCode,
            String balansNumberCondition, String materialCondition, Date docDate, int finDocCode)
    {
        try
        {
            EstimateLogic logic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
            //logic.getMegaList(planCode, MOLCode, docDate, finDocCode);
            //return logic.getENEstimateItem2FinShortList(planCode, MOLCode, docDate, finDocCode);
            return logic.getENEstimateItem2FinShortList(planCode, finFilter, MOLCode, balansNumberCondition, materialCondition, docDate, finDocCode);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't connect to DB",e);}
        //catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }

    public void batchAddMaterials(FINMaterials[] finList)
    {
        for (int i = 0; i < finList.length; i++)
        {
            this.addMaterials(finList[i]);
        }
    }

    public ENEstimateItem2FinShortList getShortListWithFinMaterialsForFact(ENEstimateItemFilter aFilterObject, int fromPosition, int quantity)
    {
        try
        {
        ENEstimateItemDAO objectDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        return objectDAO.getShortListWithFinMaterialsForFact(aFilterObject, fromPosition, quantity);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getShortListWithFinMaterialsForFact",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }

    /**
     *
     * Установка зоны для массива FINMaterials'ов.
     *
     * Используется для установки зоны изготовленным материалам.
     *
     * @param objects массив объектов FINMaterials
     * @param storageZoneCode код зоны хранения
     */
    public void setStorageZone(FINMaterials[] objects, int storageZoneCode) {
    	Connection enConn = null;
    	try {
    		if(objects == null || objects.length == 0) {
    			throw new java.lang.IllegalArgumentException("Массив объектов \"objects\" типа \"FINMaterials\" должен быть заполнен");
    		}
    		enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
    		FINMaterialsDAO finMaterialsDao = new FINMaterialsDAO(enConn, getUserProfile());
    		FKOrderLogic fkOrderLogic = new FKOrderLogic(getUserProfile(), enConn);
    		RQStorageZoneDAO storageZoneDao = new RQStorageZoneDAO(getUserProfile(), enConn);
    		RQStorageZone storageZone = storageZoneDao.getObject(storageZoneCode);

    		for(int i = 0; i < objects.length; i++) {
    			int rest_purpose_base_id = fkOrderLogic.getBaseRestPurposeId(objects[i].rest_purpose_id);
    			int new_rest_purpose_id = fkOrderLogic.getRestPurposeIdForZone(storageZoneCode, rest_purpose_base_id);
    			String new_rest_purpose_name = fkOrderLogic.getRestPurposeNameForZone(storageZone, objects[i].rest_purpose_type_id);
    			objects[i].rest_purpose_id = new_rest_purpose_id;
    			objects[i].rest_purpose_name = new_rest_purpose_name;
    			finMaterialsDao.save(objects[i]);
    		}


    	} catch (DatasourceConnectException e) {
    		throw new EnergyproSystemException(e);
		}
        catch (PersistenceException e) {
        	throw new EnergyproSystemException(e.getMessage(),e);
        }
    	finally {
    		closeConnection();
    	}
    }

} // end of EJB Controller for FINMaterials
