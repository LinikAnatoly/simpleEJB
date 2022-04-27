package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.util.List;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENFuelInvResultDAO;
import com.ksoe.energynet.dataminer.ENFuelInventarizationDAO;
import com.ksoe.energynet.dataminer.ENFuelInventarizationItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENSpravMolDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuelDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuelRemainsDAO;
import com.ksoe.energynet.dataminer.ENWorkOrder2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderDAO;
import com.ksoe.energynet.dataminer.FINDoc2MolDataDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.dataminer.FINMolDataDAO;
import com.ksoe.energynet.ejb.ENAct2ENPlanWorkController;
import com.ksoe.energynet.ejb.ENAct2ENPlanWorkControllerHome;
import com.ksoe.energynet.ejb.ENActController;
import com.ksoe.energynet.ejb.ENActControllerHome;
import com.ksoe.energynet.ejb.ENWorkOrder2ENPlanWorkController;
import com.ksoe.energynet.ejb.ENWorkOrder2ENPlanWorkControllerHome;
import com.ksoe.energynet.ejb.FINMaterialsController;
import com.ksoe.energynet.ejb.FINMaterialsControllerHome;
import com.ksoe.energynet.ejb.FINMolDataController;
import com.ksoe.energynet.ejb.FINMolDataControllerHome;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENFuelInvResult;
import com.ksoe.energynet.valueobject.ENFuelInvResultType;
import com.ksoe.energynet.valueobject.ENFuelInventarization;
import com.ksoe.energynet.valueobject.ENFuelInventarizationItem;
import com.ksoe.energynet.valueobject.ENFuelInventarizationStatus;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkForm;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkSource;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetFuel;
import com.ksoe.energynet.valueobject.ENTravelSheetFuelRemains;
import com.ksoe.energynet.valueobject.ENTravelSheetFuelType;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENFuelInvResultFilter;
import com.ksoe.energynet.valueobject.filter.ENFuelInventarizationItemFilter;
import com.ksoe.energynet.valueobject.filter.ENSpravMolFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrder2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.FINDoc2MolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENFuelInvResultShortList;
import com.ksoe.energynet.valueobject.lists.ENFuelInventarizationItemShortList;
import com.ksoe.energynet.valueobject.lists.ENSpravMolShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrder2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.FINDoc2MolDataShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.fin.logic.FKConsts;
import com.ksoe.fin.logic.FKLogic;
import com.ksoe.fin.valueobject.FINDocType;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItem2ENEstimateItemDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItemDAO;
import com.ksoe.rqorder.ejb.RQFKOrderItemController;
import com.ksoe.rqorder.ejb.RQFKOrderItemControllerHome;
import com.ksoe.rqorder.logic.AllocationListLogic;
import com.ksoe.rqorder.logic.FKOrderLogic;
import com.ksoe.rqorder.logic.RQConsts;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderItem;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItem2ENEstimateItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItemFilter;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderItem2ENEstimateItemShortList;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderItemShortList;
import com.ksoe.techcard.dataminer.TEMPNomenclaturesDAO;
import com.ksoe.techcard.dataminer.TKFuelTypeDAO;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.valueobject.TEMPNomenclaturesType;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKFuelType;
import com.ksoe.techcard.valueobject.TKMaterials;
import com.ksoe.techcard.valueobject.filter.TEMPNomenclaturesFilter;
import com.ksoe.techcard.valueobject.lists.TEMPNomenclaturesShortList;

public class FuelInventarizationLogic extends LogicModule {

    public FuelInventarizationLogic(Connection connection, UserProfile userProfile)
    {
        super(connection, userProfile);
    }

    public void generateInventarizationItems(ENFuelInventarization inventarizationObject)  {

    	try {

    	// проверим на статус, даем формировать только для черновых
    	if (inventarizationObject.statusRef.code != ENFuelInventarizationStatus.DRAFT)
    	{
    		throw new SystemException("Для создания строк инвентаризационная ведомость должна быть \"Черновой\"");
    	}

	    // проверим на наличие строк в ведомости
    	// если строки есть, то не даем еще раз сформировать
    	ENFuelInventarizationItemDAO iiDAO = new ENFuelInventarizationItemDAO(connection, userProfile);
    	ENFuelInventarizationItemFilter iiFilter = new ENFuelInventarizationItemFilter();
    	iiFilter.inventarizationRef.code = inventarizationObject.code;
        int[] iiArr = iiDAO.getFilteredCodeArray(iiFilter, 0, -1);
    	if (iiArr.length > 0)
    	{
    		throw new SystemException("Инвентаризационная ведомость уже содержит строки! \n Для создания строк нужно удалить существующие.");
    	}

    	ENFuelInventarizationItemShortList iiList = iiDAO.getInventarizationItemList(inventarizationObject);

    	if (iiList.totalCount == 0)
    	   {
    		throw new SystemException("Количество строк = 0!");
    	   }

    	for (int i=0;i<iiList.totalCount;i++)
    	   {
    		// проверка на непривязанное колличество топлива в предыдущем периоде
    		if (iiList.get(i).not_bounded_fuel_in_past_period.compareTo(new BigDecimal(0)) > 0)
    		   {
    			throw new SystemException("По машине " + iiList.get(i).transportRealRefName +
    					                  " в предыдущем периоде есть непривязанное топливо " +
    					                  " в колличестве = " + iiList.get(i).not_bounded_fuel_in_past_period);
    		   }

    		// проверка на привязанное количество топлива в текущем периоде
//    		if (iiList.get(i).reserved_fuel_in_next_period_quantity.compareTo(new BigDecimal(0)) > 0)
// 		       {
// 			   throw new SystemException("По машине " + iiList.get(i).transportRealRefName +
// 					                  " в текущем периоде есть привязанное топливо " +
// 					                  " в колличестве = " + iiList.get(i).reserved_fuel_in_next_period_quantity);
// 		       }

    		ENFuelInventarizationItem item = new ENFuelInventarizationItem();
    	    item.transportRealRef.code = iiList.get(i).transportRealRefCode;
    	    item.travelSheetRef.code = iiList.get(i).travelSheetRefCode;
    	    item.fuelTypeRef.code = iiList.get(i).fuelTypeRefCode;
    	    item.inventarizationRef.code = inventarizationObject.code;
    	    item.travelFuelTypeRef.code = iiList.get(i).travelFuelTypeRefCode;
    	    item.countGen = iiList.get(i).countGen;
    	    // пусть будет такое же колличество, что и из последнего ПЛ
    	    item.countFact = iiList.get(i).countGen;
    	    iiDAO.add(item);
        	}


    	ENFuelInventarizationDAO iDAO = new ENFuelInventarizationDAO(connection, userProfile);
    	inventarizationObject.statusRef.code = ENFuelInventarizationStatus.ITEMS_GENERATED;
    	iDAO.save(inventarizationObject);

    	}

        catch(PersistenceException e)
        {
            System.out.println(e.getMessage());
            throw new SystemException(e.getMessage());
        }

    }

	public void removeInventarizationItems(int inventarizationCode) {
		try {

			ENFuelInventarizationDAO iDAO = new ENFuelInventarizationDAO(connection, userProfile);
			ENFuelInventarization inventarizationObject = iDAO.getObject(inventarizationCode);

			// проверим на статус, даем удалять только для черновых
			// или для разнесенных фактов, т.к. еще ничего не зарезервированно
	    	if (inventarizationObject.statusRef.code != ENFuelInventarizationStatus.ITEMS_GENERATED &&
	    		inventarizationObject.statusRef.code != ENFuelInventarizationStatus.FACT_QUANTITY_INSERTED)
	    	{
	    		throw new SystemException("Для удаления строк инвентаризационная ведомость должна быть \"Строки сформированы\" или \"Факт разнесен\"");
	    	}

		    // проверим на наличие строк в ведомости
	    	// если строк нет, то что то пошло не так :)
	    	ENFuelInventarizationItemDAO iiDAO = new ENFuelInventarizationItemDAO(connection, userProfile);
	    	ENFuelInventarizationItemFilter iiFilter = new ENFuelInventarizationItemFilter();
	    	iiFilter.inventarizationRef.code = inventarizationObject.code;
	        int[] iiArr = iiDAO.getFilteredCodeArray(iiFilter, 0, -1);

	        if (iiArr.length == 0)
	    	{
	    		throw new SystemException("Инвентаризационная ведомость не содержит строк!");
	    	}

	        for (int z=0;z<iiArr.length;z++)
	        {
	        	iiDAO.remove(iiArr[z]);
	        }

	        inventarizationObject.statusRef.code = ENFuelInventarizationStatus.DRAFT;
	        iDAO.save(inventarizationObject);

		}
		catch(PersistenceException e)
        {
            System.out.println(e.getMessage());
            throw new SystemException(e.getMessage());
        }



	}


	public void reserveItems(int inventarizationCode)  {
		try {

			ENFuelInventarizationDAO iDAO = new ENFuelInventarizationDAO(connection, userProfile);
			ENFuelInventarization inventarizationObject = iDAO.getObject(inventarizationCode);

			 if (inventarizationObject.statusRef.code != ENFuelInventarizationStatus.FACT_QUANTITY_INSERTED)
				 throw new SystemException("Відомість повинна знаходитись у статусі \"Факт разнесен\"");

			 ENFuelInvResultDAO resultDAO = new ENFuelInvResultDAO(connection, userProfile);
			 ENFuelInvResultShortList resultList = resultDAO.summaryFuelList(inventarizationObject.code);

			 if (resultList.totalCount == 0)
				 throw new SystemException("Ошибка при выборе итоговых строк инвентаризации топлива!");

			 int fkordercode = Integer.MIN_VALUE;
			 int plancode4prihod = Integer.MIN_VALUE;
			 int plancode4writeoff = Integer.MIN_VALUE;

			 for (int t=0; t< resultList.totalCount; t++)
			 {

				 if (resultList.get(t).deltaCount.compareTo(new BigDecimal(0)) <= 0)
				 {continue;}

				 if (resultList.get(t).typeRefCode == ENFuelInvResultType.ORDER && (fkordercode == Integer.MIN_VALUE && plancode4prihod == Integer.MIN_VALUE)) {
					 fkordercode = createOrderForInventarization(inventarizationObject);
					 plancode4prihod = createPlanForInventarizationOrder(inventarizationObject);
				 }

				 if (resultList.get(t).typeRefCode == ENFuelInvResultType.ACT && plancode4writeoff == Integer.MIN_VALUE) {
					 plancode4writeoff = createPlanForInventarizationWriteOff(inventarizationObject);
				 }

				 ENFuelInvResult result = new ENFuelInvResult();
				 result.deltaCount = resultList.get(t).deltaCount;
				 result.fuelTypeRef.code = resultList.get(t).fuelTypeRefCode;
				 result.typeRef.code = resultList.get(t).typeRefCode;
				 result.inventarizationRef.code = inventarizationObject.code;

				 int rqfkorderitem = Integer.MIN_VALUE;
				 int eitemcode = Integer.MIN_VALUE;

				 if (result.typeRef.code == ENFuelInvResultType.ORDER) {
				 eitemcode = createEstimateItemForInventarization(plancode4prihod, result.fuelTypeRef.code, result.deltaCount);
		         rqfkorderitem = createOrderItemForInventarization(eitemcode, fkordercode);
				 }
				 else if (result.typeRef.code == ENFuelInvResultType.ACT)
				 {
				 eitemcode = createEstimateItemForInventarization(plancode4writeoff, result.fuelTypeRef.code, result.deltaCount);
				 createFinmaterialForInventarization(eitemcode, inventarizationObject);
				 }

				 result.fkorderitemRef.code = rqfkorderitem;
				 result.estimateItemRef.code = eitemcode;

				 resultDAO.add(result);

			 }

			 if (fkordercode != Integer.MIN_VALUE) {
				 RQFKOrderDAO foDAO = new RQFKOrderDAO(connection, userProfile);
				 RQFKOrder ford = foDAO.getObject(fkordercode);
				 ford.status.code = RQFKOrderStatus.CREATED;
	             foDAO.save(ford);
             }

			 if (plancode4writeoff != Integer.MIN_VALUE) {
				int actCode = createActForInventarization(plancode4writeoff, inventarizationObject);
				ENAct act = new ENActDAO(connection,userProfile).getObject(actCode);
				act.statusRef.code = ENActStatus.SIGNATURE;
				new ENActDAO(connection,userProfile).save(act);
			 }

			 inventarizationObject.statusRef.code = ENFuelInventarizationStatus.FUEL_RESERVED;
			 iDAO.save(inventarizationObject);

		}
		catch(PersistenceException e)
        {
            System.out.println(e.getMessage());
            throw new SystemException(e.getMessage());
        }


	}

	public void removeReserveItems(int inventarizationCode)  {
		try {

			Context cnt = new InitialContext();
            Object objRef = cnt.lookup(RQFKOrderItemController.JNDI_NAME);
            RQFKOrderItemControllerHome fkiHome = (RQFKOrderItemControllerHome) PortableRemoteObject
                    .narrow(objRef, RQFKOrderItemControllerHome.class);
            RQFKOrderItemController fkiController = fkiHome.create();

            objRef = cnt.lookup(ENAct2ENPlanWorkController.JNDI_NAME);
            ENAct2ENPlanWorkControllerHome a2pwHome = (ENAct2ENPlanWorkControllerHome) PortableRemoteObject
                    .narrow(objRef, ENAct2ENPlanWorkControllerHome.class);
            ENAct2ENPlanWorkController a2pwController = a2pwHome.create();

            objRef = cnt.lookup(FINMaterialsController.JNDI_NAME);
            FINMaterialsControllerHome finHome = (FINMaterialsControllerHome) PortableRemoteObject
                    .narrow(objRef, FINMaterialsControllerHome.class);
            FINMaterialsController finController = finHome.create();

            objRef = cnt.lookup(FINMolDataController.JNDI_NAME);
            FINMolDataControllerHome fmDataHome = (FINMolDataControllerHome) PortableRemoteObject
                    .narrow(objRef, FINMolDataControllerHome.class);
            FINMolDataController fmDataController = fmDataHome.create();

			 ENFuelInventarizationDAO iDAO = new ENFuelInventarizationDAO(connection, userProfile);
			 ENFuelInventarization inventarizationObject = iDAO.getObject(inventarizationCode);

			 if (inventarizationObject.statusRef.code != ENFuelInventarizationStatus.FUEL_RESERVED)
				 throw new SystemException("Відомість повинна знаходитись у статусі \"Топливо зарезервировано\"");

			 ENFuelInvResultDAO resultDAO = new ENFuelInvResultDAO(connection, userProfile);
	         ENFuelInvResultFilter resultFilter = new ENFuelInvResultFilter();
			 resultFilter.inventarizationRef.code = inventarizationObject.code;
			 ENFuelInvResultShortList resultList = resultDAO.getScrollableFilteredList(resultFilter, 0, -1);

			 if (resultList.totalCount == 0)
				 throw new SystemException("Ошибка при выборе итоговых строк инвентаризации топлива!");

	         ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
			 ENPlanWorkDAO pwDAO = new ENPlanWorkDAO(connection, userProfile);
			 RQFKOrderItemDAO foiDAO = new RQFKOrderItemDAO(connection, userProfile);
			 RQFKOrderDAO foDAO = new RQFKOrderDAO(connection, userProfile);
			 FINMaterialsDAO fDAO = new FINMaterialsDAO(connection, userProfile);
			 ENWorkOrder2ENPlanWorkDAO wo2pwDAO = new ENWorkOrder2ENPlanWorkDAO(connection, userProfile);
			 FINMolDataDAO fmDAO = new FINMolDataDAO(connection, userProfile);
			 ENActDAO actDAO = new ENActDAO(connection, userProfile);
			 WorkOrderLogic woLogic = new WorkOrderLogic(connection, userProfile);

			 int plan4ordercode = Integer.MIN_VALUE;
			 int plan4writeoffcode = Integer.MIN_VALUE;
			 int fkordercode = Integer.MIN_VALUE;

			 for (int t=0; t<resultList.totalCount; t++)
			 {
				 ENEstimateItem ei = eiDAO.getObject(resultList.get(t).estimateItemRefCode);

				 resultDAO.remove(resultList.get(t).code);

				 // найдем план и ордер
                 if (resultList.get(t).typeRefCode == ENFuelInvResultType.ORDER) {
		         plan4ordercode = ei.planRef.code;
				 RQFKOrderItem foi = foiDAO.getObject(resultList.get(t).fkorderitemRefCode);
				 fkordercode = foi.fkOrderRef.code;

				 fkiController.removePrihod(resultList.get(t).fkorderitemRefCode);

			        FINMaterialsFilter fFilter = new FINMaterialsFilter();
			        fFilter.estimateItemRef.code = resultList.get(t).estimateItemRefCode;
			        fFilter.statusRef.code = FINMaterialsStatus.GOOD;
			        FINMaterialsShortList fList = fDAO.getScrollableFilteredList(fFilter,0,-1);
				    for (int i=0; i < fList.totalCount; i++){
				        fDAO.remove(fList.get(i).code);
				    }


                 } else if (resultList.get(t).typeRefCode == ENFuelInvResultType.ACT) {
                	 plan4writeoffcode = ei.planRef.code;

                	 //найдем акт
                	 ENAct2ENPlanWorkDAO a2pwDAO = new ENAct2ENPlanWorkDAO(connection, userProfile);
                	 ENAct2ENPlanWorkFilter a2pwFilter = new ENAct2ENPlanWorkFilter();
                	 a2pwFilter.plan.code = plan4writeoffcode;
                	 ENAct2ENPlanWorkShortList a2pwList = a2pwDAO.getScrollableFilteredList(a2pwFilter, 0, -1);
                	 if (a2pwList.totalCount == 1) {
                		 // перебъем статус для отвязки
                		 ENAct act = actDAO.getObject(a2pwList.get(0).actRefCode);
                		 act.statusRef.code = ENActStatus.GOOD;
                		 actDAO.save(act);
                		 //
                		 // удалим связку плана и акта
                		 a2pwController.remove(a2pwList.get(0).code, 0);
                		 // удалим акт
                		 actDAO.remove(a2pwList.get(0).actRefCode);
                	 }

                	 // удалим привязку материалов
                	 FINMaterialsFilter fFilter = new FINMaterialsFilter();
                	 fFilter.estimateItemRef.code = ei.code;
                	 int[] fArr = fDAO.getFilteredCodeArray(fFilter, 0, -1);
                	 if (fArr.length==0) {
                		 throw new SystemException("Что то пошло не так. Финматериалсы не обнаружены");
                	 }
                	 for (int y=0; y < fArr.length; y++){
                	 finController.removeGsm(fArr[y]);
                	 }

                 }

                 eiDAO.remove(resultList.get(t).estimateItemRefCode);

			 }


			 if (plan4writeoffcode != Integer.MIN_VALUE) {
			// удалим наряд-задание для плана со списанием по инвентаризации
        	 ENWorkOrder2ENPlanWorkFilter wo2pwFilter = new ENWorkOrder2ENPlanWorkFilter();
        	 wo2pwFilter.plan.code = plan4writeoffcode;
        	 ENWorkOrder2ENPlanWorkShortList wo2pwList = wo2pwDAO.getScrollableFilteredList(wo2pwFilter, 0, -1);

	        	 if (wo2pwList.totalCount > 0) {
	        		 for (int v=0;v<wo2pwList.totalCount ;v++){
	        			 FINMolDataFilter fmFilter = new FINMolDataFilter();
	        			 fmFilter.workOrder.code = wo2pwList.get(v).workOrderCode;
	        			 int[] fmArr = fmDAO.getFilteredCodeArray(fmFilter, 0, -1);
	        			 for (int a=0;a<fmArr.length;a++) {
	        				 // удалим финмолдату
	        			     fmDataController.remove(fmArr[a], wo2pwList.get(v).workOrderCode, 1);
	        			 }
	        		// wo2pController.remove(wo2pwList.get(v).code);
	        		  woLogic.removeWorkOrderForOpenPlanByPlanCode(plan4writeoffcode,true);
	        		// woDAO.remove(wo2pwList.get(0).workOrderCode);
	        		 }
	        	 }
			 pwDAO.remove(plan4writeoffcode);
			 }

			 if (plan4ordercode != Integer.MIN_VALUE && fkordercode != Integer.MIN_VALUE) {
			   foDAO.remove(fkordercode);
			   pwDAO.remove(plan4ordercode);
			 }

			 inventarizationObject.statusRef.code = ENFuelInventarizationStatus.FACT_QUANTITY_INSERTED;
			 iDAO.save(inventarizationObject);

		}
		catch(PersistenceException e)
        {
            System.out.println(e.getMessage());
            throw new SystemException(e.getMessage());
        }
		catch(RemoteException e)
        {
            System.out.println(e.getMessage());
            throw new SystemException(e.getMessage());
        }
		catch(NamingException e)
        {
            System.out.println(e.getMessage());
            throw new SystemException(e.getMessage());
        }
		catch(CreateException e)
        {
            System.out.println(e.getMessage());
            throw new SystemException(e.getMessage());
        }

	}


	  /**
	   *
	   * Создает ордер для приходования топлива по инвентаризации
	   *
	   * @param object объект ENFuelInventarization инвентаризации
	   */
	  public int createOrderForInventarization(ENFuelInventarization object)
	  {
		  try
		  {
				FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);

				ENSpravMolDAO sprDAO = new ENSpravMolDAO(connection,userProfile);
				ENSpravMolFilter sprFilter = new ENSpravMolFilter();
				sprFilter.molkod = object.molCode;
				ENSpravMolShortList sprList = sprDAO.getScrollableFilteredList(sprFilter, 0, -1);

				if (sprList.totalCount == 0)
				{
					throw new SystemException("Мол не найден!");
				}


				RQFKOrder fkOrderObject = new RQFKOrder();
				fkOrderObject.code = Integer.MIN_VALUE;
				fkOrderObject.numberDoc = object.numberGen+"_auto";
				fkOrderObject.dateGen = object.dateGen;
				fkOrderObject.userGen = object.userGen;
				fkOrderObject.domain_info = userProfile.domainInfo.domain;
				fkOrderObject.kind.code = RQFKOrderKind.PRIHOD_POSTAVKA;
				fkOrderObject.status.code = RQFKOrderStatus.GOOD;
				fkOrderObject.molInCode = object.molCode;
				fkOrderObject.molInName = object.molName;
				fkOrderObject.molOutCode = object.molCode;
				fkOrderObject.molOutName = object.molName;
				fkOrderObject.department.code = sprList.get(0).departmentCode;
				fkOrderObject.datePosting = object.dateGen;
				fkOrderObject.accountingTypeRef.code = TKAccountingType.TMC;

				fkOrderObject.commentGen = "Оприбуткування палива по відомості " + object.numberGen;

				int orderCode = fkOrderLogic.createRQFKOrder(fkOrderObject);

				return orderCode;
		  } catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		  }
		  finally
		  {

		  }

	  }


	  /**
	   *
	   * Создает акт и связку акта для списания топлива по инвентаризации
	   *
	   * @param int plancode4writeoff
	 * @return actCode
	 * @throws RemoteException
	   */
	  public int createActForInventarization(int plancode4writeoff, ENFuelInventarization object)
	  {
		  try
		  {

			    Context cnt = new InitialContext();
	            Object objRef = cnt.lookup(ENAct2ENPlanWorkController.JNDI_NAME);
	            ENAct2ENPlanWorkControllerHome a2pHome = (ENAct2ENPlanWorkControllerHome) PortableRemoteObject
	                    .narrow(objRef, ENAct2ENPlanWorkControllerHome.class);
	            ENAct2ENPlanWorkController a2pController = a2pHome.create();

				ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection,userProfile);
				ENPlanWork plan = planDAO.getObject(plancode4writeoff);

				ENWorkOrder2ENPlanWorkDAO wo2pwDAO = new ENWorkOrder2ENPlanWorkDAO(connection,userProfile);
				ENWorkOrder2ENPlanWorkFilter wo2pwFilter = new ENWorkOrder2ENPlanWorkFilter();
				wo2pwFilter.plan.code = plan.code;
				ENWorkOrder2ENPlanWorkShortList wo2pwList = wo2pwDAO.getScrollableFilteredList(wo2pwFilter, 0, -1);
					if (wo2pwList.totalCount < 1) {
						throw new SystemException("Ошибка при создании акта! Не найден наряд");
					}
                ENWorkOrder worder = new ENWorkOrderDAO(connection,userProfile).getObject(wo2pwList.get(0).workOrderCode);

				ENAct act = new ENAct();

				act.element.code = plan.elementRef.code;
				act.actTypeRef.code = plan.stateRef.code;
				act.finMolCode = worder.finMolCode;
				act.finMolName = worder.finMolName;
				act.dateAct = worder.dateGen;
				act.dateGen = worder.dateGen;
				act.statusRef.code = ENActStatus.GOOD;
				act.commentGen = "Акт по списанию топлива по инвентаризации №" + object.numberGen;
				if((object.numberGen + "_auto").length() > 10) {
					act.numberGen = (object.numberGen + "_auto").substring(0, 10);
				} else {
					act.numberGen = object.numberGen + "_auto";
				}

				ENActDAO actDAO = new ENActDAO(connection, userProfile);
				int actCode = actDAO.add(act);

				ENAct2ENPlanWork a2p = new ENAct2ENPlanWork();
				a2p.actRef.code = actCode;
				a2p.plan.code = plancode4writeoff;

				///
				plan.status.code = ENPlanWorkStatus.GOOD;
				planDAO.save(plan);
				///

				a2pController.add(a2p, 0);

				return actCode;

		  } catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		  } catch (RemoteException e) {
				throw new EnergyproSystemException(e);
		  } catch (NamingException e) {
				throw new EnergyproSystemException(e);
		  } catch (CreateException e) {
			throw new EnergyproSystemException(e);
	      }
		  finally
		  {

		  }

	  }




	  /**
	   *
	   * Создает план для приходования топлива по инвентаризации
	   *
	   * @param object объект ENFuelInventarization инвентаризации
	   */
	  public int createPlanForInventarizationOrder(ENFuelInventarization object)
	  {
		  try
		  {
				ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection,userProfile);

				ENSpravMolDAO sprDAO = new ENSpravMolDAO(connection,userProfile);
				ENSpravMolFilter sprFilter = new ENSpravMolFilter();
				sprFilter.molkod = object.molCode;
				ENSpravMolShortList sprList = sprDAO.getScrollableFilteredList(sprFilter, 0, -1);

				if (sprList.totalCount == 0)
				{
					throw new SystemException("Мол не найден!");
				}

				ENPlanWork plan = new ENPlanWork();
				plan.code = Integer.MIN_VALUE;
				plan.dateStart = object.dateGen;
				plan.dateFinal = object.dateGen;
				plan.monthGen = object.dateGen.getMonth()+1;
				plan.yearGen = object.dateGen.getYear()+1900;
				plan.domain_info = userProfile.domainInfo.domain;
				plan.kind.code = ENPlanWorkKind.CURRENT;
				plan.status.code = ENPlanWorkStatus.LOCKED;
				plan.typeRef.code = ENPlanWorkType.NOT_PLANED;
				plan.stateRef.code = ENPlanWorkState.TO;
				plan.departmentRef.code = sprList.get(0).departmentCode;
				plan.budgetRef.code = ENConsts.ENBUDGET_TRANSPORT;
                plan.responsibilityRef.code = ENConsts.ENRESPONSIBILITY_TRANSPORT;
				plan.elementRef.code = ENElement.INVENTARIZATION_ORDER_OBJECT;
				plan.renRef.code = new Integer(0);
				plan.formRef.code = ENPlanWorkForm.NOPLANNED;
				plan.sourceRef.code = ENPlanWorkSource.MANUAL;

				plan.commentGen = "План для оприбуткування палива по відомості " + object.numberGen;

				int planCode = planDAO.add(plan);

				return planCode;
		  } catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		  }
		  finally
		  {

		  }

	  }


	  /**  Создает план и наряд для списания топлива по инвентаризации
	   *
	   * @param object объект ENFuelInventarization инвентаризации
	   */
	  public int createPlanForInventarizationWriteOff(ENFuelInventarization object)
	  {
		  try
		  {
				ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection,userProfile);

				ENSpravMolDAO sprDAO = new ENSpravMolDAO(connection,userProfile);
				ENSpravMolFilter sprFilter = new ENSpravMolFilter();
				sprFilter.molkod = object.molCode;
				ENSpravMolShortList sprList = sprDAO.getScrollableFilteredList(sprFilter, 0, -1);

				if (sprList.totalCount == 0)
				{
					throw new SystemException("Мол не найден!");
				}

				ENPlanWork plan = new ENPlanWork();
				plan.code = Integer.MIN_VALUE;
				plan.dateStart = object.dateGen;
				plan.dateFinal = object.dateGen;
				plan.monthGen = object.dateGen.getMonth()+1;
				plan.yearGen = object.dateGen.getYear()+1900;
				plan.domain_info = userProfile.domainInfo.domain;
				plan.kind.code = ENPlanWorkKind.FACT;
				plan.status.code = ENPlanWorkStatus.LOCKED;
				plan.typeRef.code = ENPlanWorkType.WRITINGS;
				plan.stateRef.code = ENPlanWorkState.TRUCKING;
				plan.departmentRef.code = sprList.get(0).departmentCode;
				plan.budgetRef.code = ENConsts.ENBUDGET_TRANSPORT;
                plan.responsibilityRef.code = ENConsts.ENRESPONSIBILITY_TRANSPORT;
				plan.elementRef.code = ENElement.INVENTARIZATION_WRITEOFF_OBJECT;
				plan.renRef.code = new Integer(0);
				plan.formRef.code = ENPlanWorkForm.NOPLANNED;
				plan.sourceRef.code = ENPlanWorkSource.MANUAL;

				plan.commentGen = "План для списання палива по відомості " + object.numberGen;

				int planCode = planDAO.add(plan);

				/// создание наряд-задания
				Context cnt = new InitialContext();
	            Object objRef = cnt.lookup(ENWorkOrder2ENPlanWorkController.JNDI_NAME);
	            ENWorkOrder2ENPlanWorkControllerHome wo2pHome = (ENWorkOrder2ENPlanWorkControllerHome) PortableRemoteObject
	                    .narrow(objRef, ENWorkOrder2ENPlanWorkControllerHome.class);
	            ENWorkOrder2ENPlanWorkController wo2pController = wo2pHome.create();

	            ENWorkOrder2ENPlanWork wo2pObj = new ENWorkOrder2ENPlanWork();
	            wo2pObj.plan = plan;
	            wo2pObj.workOrder.dateGen = plan.dateFinal;
	            wo2pObj.workOrder.department.code = plan.departmentRef.code;

                int workOrderCode = new ENWorkOrder2ENPlanWorkDAO(connection,userProfile).getObject(wo2pController.add(wo2pObj)).workOrder.code;

	            /// вставка ФинМолДаты
	            objRef = cnt.lookup(FINMolDataController.JNDI_NAME);
	            FINMolDataControllerHome fmDataHome = (FINMolDataControllerHome) PortableRemoteObject
	                    .narrow(objRef, FINMolDataControllerHome.class);
	            FINMolDataController fmDataController = fmDataHome.create();

	            // для Мастера
	            FINMolData fmDataObj = new FINMolData();
	            fmDataObj.finMolCode = object.molCode;
	            fmDataObj.finMolName = object.molName;
	            fmDataObj.molTypeRef.code = FINMolType.MASTER;
	            fmDataObj.workOrder = new ENWorkOrderDAO(connection,userProfile).getObject(workOrderCode);
                fmDataController.add(fmDataObj, workOrderCode, 1);
                // для Механика
	            fmDataObj = new FINMolData();
	            fmDataObj.finMolCode = object.molCode;
	            fmDataObj.finMolName = object.molName;
	            fmDataObj.molTypeRef.code = FINMolType.MECHANIC;
	            fmDataObj.workOrder = new ENWorkOrderDAO(connection,userProfile).getObject(workOrderCode);
                fmDataController.add(fmDataObj, workOrderCode, 1);

				return planCode;
		  } catch(PersistenceException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
			catch(RemoteException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
			catch(NamingException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
			catch(CreateException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
		  finally
		  {

		  }

	  }


	  /**
	   *
	   * Создает estimateitem для приходования топлива по инвентаризации
	   *
	   * @param object объект ENFuelInventarization инвентаризации
	   */
	  public int createEstimateItemForInventarization(int planCode, int fuelTypeCode, BigDecimal quantity)
	  {
		  try
		  {
				 TKFuelTypeDAO fuelTypeDAO = new TKFuelTypeDAO(connection,userProfile);
                 TKFuelType fuelType = fuelTypeDAO.getObject(fuelTypeCode);

                 ENPlanWork pw = new ENPlanWorkDAO(connection,userProfile).getObject(planCode);


                 ENEstimateItemDAO eitemDAO = new ENEstimateItemDAO(connection,userProfile);
				 ENEstimateItem eitem = new ENEstimateItem();
				 eitem.planRef.code = planCode;
				 eitem.materialRef.code = fuelType.materialRef.code;
				 eitem.countGen = quantity;
				 eitem.countFact = quantity;
                 if (pw.elementRef.code == ENElement.INVENTARIZATION_ORDER_OBJECT) {
				     eitem.kindRef.code = ENEstimateItemKind.MATERIALS;}
                 else
                	 if (pw.elementRef.code == ENElement.INVENTARIZATION_WRITEOFF_OBJECT) {
                	 eitem.kindRef.code = ENEstimateItemKind.GSM;
                 }

				 eitem.typeRef.code = ENEstimateItemType.AUTO;
				 eitem.statusRef.code = ENEstimateItemStatus.PRESENT;
				 int eitemcode = eitemDAO.add(eitem);

				return eitemcode;
		  } catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		  }
		  finally
		  {

		  }

	  }


	  /**
	   *
	   * Создает fkorderitem для приходования топлива по инвентаризации
	   *
	   * @param object объект ENFuelInventarization инвентаризации
	   */
	  public int createOrderItemForInventarization(int eitemcode, int fkordercode)
	  {
		  try
		  {
			    FKOrderLogic foLogic = new FKOrderLogic(userProfile, connection);
				FKLogic fkLogic = new FKLogic(
						getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

			     ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
			     ENEstimateItem eiObj = eiDAO.getObject(eitemcode);

			//// формирование финматериалса, вставка в ордер
				 FINMaterials fin = new FINMaterials();
				 RQFKOrder fkorder = new RQFKOrderDAO(connection,userProfile).getObject(fkordercode);

				 TEMPNomenclaturesDAO tnDAO = new TEMPNomenclaturesDAO(connection,userProfile);
				 TEMPNomenclaturesFilter tnFilter = new TEMPNomenclaturesFilter();
				 tnFilter.materialRef.code = eiObj.materialRef.code;
				 tnFilter.typeRef.code = TEMPNomenclaturesType.TEMPNOMENCLATURESTYPE_ETALON;
			     TEMPNomenclaturesShortList tnList = tnDAO.getScrollableFilteredList(tnFilter, 0, -1);

			        fin.mat_id = tnList.get(0).mat_id;
			        fin.mat_name = tnList.get(0).name;
			        fin.nn = tnList.get(0).nn;
                    fin.price = new TKMaterialsDAO(connection,userProfile).getObject(eiObj.materialRef.code).cost;
			        fin.quantity = eiObj.countFact;
					fin.rest_purpose_id =  RQConsts.REST_PURPOSE_ID_OPERATIVE;
	     			int storageZone = foLogic.getZoneForRestPurposeId(fin.rest_purpose_id);
	     			fin.estimateItemRef.code = eitemcode;
	     			fin.cost = fin.quantity.multiply(fin.price).setScale(BigDecimal.ROUND_HALF_UP, 2);
	     			fin.rest_purpose_id = foLogic.getRestPurposeIdForZone(storageZone, RQConsts.REST_PURPOSE_ID_OPERATIVE);
	     			fin.rest_purpose_type_id = RQConsts.REST_PURPOSE_TYPE_ID_NET_OPERATIVE;
	     			fin.rest_purpose_name = fkLogic.getNameOfRest_purpose(fin.rest_purpose_id);
					fin.mu_id = new TKMaterialsDAO(connection,userProfile).getObject(eiObj.materialRef.code).measurement.code;
					fin.mu_name = tnList.get(0).measurementname;
					if (tnList.get(0).materialRefCode == TKMaterials.DT_MATERIAL) {
						fin.bal_sch = "2034";
					} else fin.bal_sch = "2031";
					fin.calc_price = fin.price;
					fin.statusRef.code = FINMaterialsStatus.GOOD;
					fin.div_code = fkorder.molInCode;
					fin.div_name = fkorder.molInName;
					fin.fullCost = fin.cost;
					fin.fullQuantity = fin.quantity;
					fin.party_id = new Integer(1000);
					fin.party_discription = "Приход по инвентаризации";
					fin.doc_num = fkorder.numberDoc;
					fin.doc_date = fkorder.dateGen;
					fin.finDocItemCode = 0;
					fin.molDataRef.code = Integer.MIN_VALUE;
					fin.partner = fkorder.molInCode;
					fin.partner_name = fkorder.molInName;

					foLogic.createPrihodString(fin, fkorder);

					RQFKOrderItem2ENEstimateItemDAO fkoi2eiDAO = new RQFKOrderItem2ENEstimateItemDAO(connection, userProfile);
					RQFKOrderItem2ENEstimateItemFilter fkoi2eiFilter = new RQFKOrderItem2ENEstimateItemFilter();
					fkoi2eiFilter.estimateItem.code = eitemcode;
					RQFKOrderItem2ENEstimateItemShortList fkoi2eiList = fkoi2eiDAO.getScrollableFilteredList(fkoi2eiFilter, 0, -1);
					int rqfkorderitemcode = fkoi2eiList.get(0).fkOrderItemRefCode;

				return rqfkorderitemcode;
		  } catch (PersistenceException e) {
			  System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
		  }
		    catch(DatasourceConnectException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
		  finally
		  {

		  }

	  }



	  /**
	   *
	   * Создает finmaterials и резервирует материал для списания топлива по инвентаризации
	   *
	   * @param object объект ENFuelInventarization инвентаризации
	 * @throws DatasourceConnectException
	   */
	  public void createFinmaterialForInventarization(int eitemcode, ENFuelInventarization object)
	  {
		  try
		  {

			     ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(connection, userProfile);
			     ENEstimateItem eiObj = eiDAO.getObject(eitemcode);

				 Context cnt = new InitialContext();
	             Object objRef = cnt.lookup(FINMaterialsController.JNDI_NAME);
	             FINMaterialsControllerHome finHome = (FINMaterialsControllerHome) PortableRemoteObject
	                    .narrow(objRef, FINMaterialsControllerHome.class);
	             FINMaterialsController finController = finHome.create();

	          // определим finDocCode
	             int finDocCode = -1;

	             FINDoc2MolDataDAO fd2mdDAO = new FINDoc2MolDataDAO(connection,userProfile);

	             FINDoc2MolDataFilter fd2mdFilter = new FINDoc2MolDataFilter();
	             fd2mdFilter.finDocTypeRef.code = FINDocType.MOVE_302;
	             fd2mdFilter.conditionSQL = " findoc2moldata.moldatacode in ((select md.code from finmoldata md " +
	            				            " where md.workordercode in (select wo.workordercode from enworkorder2enplanwork wo " +
	            				            " where wo.plancode ="  + eiObj.planRef.code + ")" +
	            				            " and md.moltyperefcode = "  + FINMolType.MECHANIC +"))";

	             FINDoc2MolDataShortList fd2mdList = fd2mdDAO.getScrollableFilteredList(fd2mdFilter, 0, -1);


	             if (fd2mdList.totalCount == 1)
	             {
	            	 finDocCode = fd2mdList.get(0).finDocCode;
	             }

	             if (finDocCode == -1)
	                 throw new EnergyproSystemException(" Помилка при визначенні finDocCode ");


			     BigDecimal countFactForEstimate = new BigDecimal(0);

			     AllocationListLogic allocLogic = new AllocationListLogic(connection, userProfile);

                 String nomenclaturesIds = allocLogic.getNomenclaturesIdsByMaterialCode(eiObj.materialRef.code);

                 if (nomenclaturesIds.length() == 0)
			                {
			                    throw new SystemException("Непонятная ошибка!");
			                }

			     String finCondition = " dat.mat_id in (" + nomenclaturesIds + ")";
			     finCondition = finCondition + " and dat.rest_purpose_id = " + RQConsts.REST_PURPOSE_ID_FUELTANK ;
			     finCondition = finCondition + " and dat.rest_purpose_type_id = " + RQConsts.REST_PURPOSE_TYPE_ID_FUELTANK;

			     FINMaterialsFilter finFilterFK = new FINMaterialsFilter();
                 finFilterFK.conditionSQL = finCondition;
                 finFilterFK.orderBySQL = "dat.rest_purpose_type_id asc, dat.party_id";
                 String materialCondition = " and h.op_kind_id not in (" + FKConsts.NOT_PERMITTED_OP_KIND_IDS + ")";
			     String balansNumberCondition = "";

			     FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(
			    		 getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);
                 FINMaterialsList finListFK = finMaterialsLogic.getMaterialsList(finFilterFK, balansNumberCondition, object.molCode, materialCondition, object.dateGen, finDocCode);

                 countFactForEstimate = eiObj.countFact;

                 if (finListFK.totalCount == 0) {
                	 throw new SystemException("Залишки не знайдені");
                 }

			                for (int bz=0; bz<finListFK.totalCount;bz++)
			                {


			                	if (countFactForEstimate.compareTo(new BigDecimal(0)) == 0) {
			                		break;
			                	}

			                	FINMaterials finmaterialsObject = new FINMaterials();

			                	if (finListFK.get(bz).quantity.compareTo(countFactForEstimate) < 0) {
			                		 finmaterialsObject.quantity = finListFK.get(bz).quantity;
			                		 countFactForEstimate = countFactForEstimate.subtract(finListFK.get(bz).quantity);
			                	} else if (finListFK.get(bz).quantity.compareTo(countFactForEstimate) >= 0) {
			                		finmaterialsObject.quantity = countFactForEstimate;
			                		countFactForEstimate = new BigDecimal(0);
			                	}


			                    finmaterialsObject.code = Integer.MIN_VALUE;
			                    finmaterialsObject.estimateItemRef.code = eitemcode;
			                    finmaterialsObject.div_code = object.molCode;
			                    finmaterialsObject.finDocItemCode = -1;
			                    finmaterialsObject.nn = finListFK.get(bz).nn;
			                    finmaterialsObject.mat_name = finListFK.get(bz).mat_name;
			                    finmaterialsObject.mu_name = finListFK.get(bz).mu_name;
			                    finmaterialsObject.div_name = finListFK.get(bz).div_name;
			                    finmaterialsObject.rest_purpose_name = finListFK.get(bz).rest_purpose_name;
			                    finmaterialsObject.nn = finListFK.get(bz).nn;
			                    finmaterialsObject.partner_name = finListFK.get(bz).partner_name;
			                    finmaterialsObject.doc_date = finListFK.get(bz).doc_date;
			                    finmaterialsObject.party_discription = finListFK.get(bz).party_discription;
			                    finmaterialsObject.rest_purpose_id = finListFK.get(bz).rest_purpose_id;
			                    finmaterialsObject.rest_purpose_type_id = finListFK.get(bz).rest_purpose_type_id;
			                    finmaterialsObject.budget_core_id = finListFK.get(bz).budget_core_id;
			                    finmaterialsObject.frc_code = finListFK.get(bz).frc_code;
			                    finmaterialsObject.frc_name = finListFK.get(bz).frc_name;
			                    finmaterialsObject.calc_price = finListFK.get(bz).calc_price;
			                    finmaterialsObject.price = finListFK.get(bz).price;
			                    finmaterialsObject.cost = finListFK.get(bz).cost;
			                    finmaterialsObject.bal_sch = finListFK.get(bz).bal_sch;
			                    finmaterialsObject.mat_id = finListFK.get(bz).mat_id;
			                    finmaterialsObject.party_id = finListFK.get(bz).party_id;
			                    finmaterialsObject.partner = finListFK.get(bz).partner;
			                    finmaterialsObject.mu_id = finListFK.get(bz).mu_id;
			                    finmaterialsObject.doc_num = finListFK.get(bz).doc_num;
			                    finmaterialsObject.fullQuantity = finListFK.get(bz).fullQuantity;
			                    finmaterialsObject.fullCost = finListFK.get(bz).fullCost;
			                    finmaterialsObject.molDataRef.code = fd2mdList.get(0).molDataCode; /// ----
			                    finmaterialsObject.wear_date = finListFK.get(bz).wear_date;
			                    finController.addGsm(finmaterialsObject);

			                }





		  } catch(PersistenceException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
			catch(RemoteException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
			catch(NamingException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
			catch(CreateException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
		  catch(DatasourceConnectException e)
	        {
	            System.out.println(e.getMessage());
	            throw new SystemException(e.getMessage());
	        }
		  finally
		  {

		  }

	  }




	  /**
	   *
	   * Проверяет есть ли ордер в инвентаризации
	   *
	   * @param object объект RQFKOrder
	   */
	  public boolean checkOrderForInventarization(int fkordercode)
	  {
		  try
		  {

				RQFKOrderItemDAO oiDAO = new RQFKOrderItemDAO(connection, userProfile);
				RQFKOrderItemFilter oiFilter = new RQFKOrderItemFilter();
				oiFilter.fkOrderRef.code = fkordercode;
				RQFKOrderItemShortList oiList = oiDAO.getScrollableFilteredList(oiFilter, 0, -1);

				if (oiList.totalCount == 0) {
					throw new SystemException("В ордере нет строк!");
				}

				ENFuelInvResultDAO fiResultDAO = new ENFuelInvResultDAO(connection, userProfile);
				ENFuelInvResultFilter fiResultFilter = new ENFuelInvResultFilter();
				fiResultFilter.fkorderitemRef.code = oiList.get(0).code;
				ENFuelInvResultShortList fiResultList = fiResultDAO.getScrollableFilteredList(fiResultFilter, 0, -1);

				if (fiResultList.totalCount > 0)
				{
					return true;
				}

				return false;

		  } catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		  }
		  finally
		  {

		  }

	  }


	  /**
	   *
	   * Проводит приходный ордер по инвентаризации
	   *
	   * @param int fuelInventarizationCode
	 * @throws DatasourceConnectException
	   */

	  public void moveOrderForInventarizationToFK(int fuelInventarizationCode)
	  {
		  try
		  {

				ENFuelInvResultDAO fiResultDAO = new ENFuelInvResultDAO(connection, userProfile);
				ENFuelInvResultFilter fiResultFilter = new ENFuelInvResultFilter();
				fiResultFilter.inventarizationRef.code = fuelInventarizationCode;
				fiResultFilter.typeRef.code = ENFuelInvResultType.ORDER;
				ENFuelInvResultShortList fiResultList = fiResultDAO.getScrollableFilteredList(fiResultFilter, 0, -1);

				if (fiResultList.totalCount == 0)
				{
					return;
				}

				RQFKOrderItemDAO oiDAO = new RQFKOrderItemDAO(connection, userProfile);
                RQFKOrderItem oi = oiDAO.getObject(fiResultList.get(0).fkorderitemRefCode);

                RQFKOrderDAO oDAO = new RQFKOrderDAO(connection, userProfile);
				RQFKOrder o = oDAO.getObject(oi.fkOrderRef.code);

				if (oDAO.checkFKOrderNotInStatuses(o, false, RQFKOrderStatus.CREATED, RQFKOrderStatus.IN_WORK_ON_WAREHOUSE)) {
					throw new SystemException("Ордер должен быть в статусе \"Составленный\"");
				}


				FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);
                fkOrderLogic.updateEnPlanworkAndEnEstimateStatus(o.code);
                fkOrderLogic.movePrihodToFK_10_2(o.code);
                o.status.code = RQFKOrderStatus.IN_FK;
                oDAO.save(o);

		  }
	            catch(PersistenceException e)
	            {
	                System.out.println(e.getMessage());
	                throw new SystemException(e.getMessage());
	            }
	    		catch(DatasourceConnectException e)
	            {
	                System.out.println(e.getMessage());
	                throw new SystemException(e.getMessage());
	            }
		  finally
		  {

		  }

	  }


	  /** Отменяет проведение приходного ордера по инвентаризации
	   *
	   * @param int fuelInventarizationCode
	   */
	  public void cancelMoveOrderForInventarizationToFK(int fuelInventarizationCode)
	  {
		  try
		  {

				ENFuelInvResultDAO fiResultDAO = new ENFuelInvResultDAO(connection, userProfile);
				ENFuelInvResultFilter fiResultFilter = new ENFuelInvResultFilter();
				fiResultFilter.inventarizationRef.code = fuelInventarizationCode;
				fiResultFilter.typeRef.code = ENFuelInvResultType.ORDER;
				ENFuelInvResultShortList fiResultList = fiResultDAO.getScrollableFilteredList(fiResultFilter, 0, -1);

				if (fiResultList.totalCount == 0) {
					// Если не нашло приходного ордера, то наверное ничего не оприходовалось из топлива, поэтому
					// отменять нечего - поэтому просто return
					return;
				}

				RQFKOrderItemDAO oiDAO = new RQFKOrderItemDAO(connection, userProfile);
                RQFKOrderItem oi = oiDAO.getObject(fiResultList.get(0).fkorderitemRefCode);

                RQFKOrderDAO oDAO = new RQFKOrderDAO(connection, userProfile);
				RQFKOrder o = oDAO.getObject(oi.fkOrderRef.code);

				if (o.status.code != RQFKOrderStatus.IN_FK) {
					throw new SystemException("Ордер должен быть в статусе \"Проведенный в ФК\"");
				}

				FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, connection);
                fkOrderLogic.updateEnPlanworkAndEnEstimateStatus(o.code);
	            fkOrderLogic.unMovePrihodToFK_10(o.code);
        		o.status.code = RQFKOrderStatus.CREATED;
        		oDAO.save(o);

		  }
	            catch(PersistenceException e)
	            {
	                System.out.println(e.getMessage());
	                throw new SystemException(e.getMessage());
	            }
		  finally
		  {

		  }

	  }
	  
	  /**
	   * 
	   * Связан ли акт с упаковочной ведомостью
	   * 
	   * @param act заданный акт {@link ENAct}
	   * @return {@code true} если связан и {@code false} если иначе
	   * @throws PersistenceException
	   */
	  public boolean checkActForInventarization(ENAct act) throws PersistenceException {
		  if(act == null || act.code == Integer.MIN_VALUE) {
			  throw new java.lang.NullPointerException("Не заданий акт!");
		  }
		  boolean result = false;
		  ENAct2ENPlanWorkDAO act2PlanDao = new ENAct2ENPlanWorkDAO(connection, userProfile);
		  ENEstimateItemDAO estimateDao = new ENEstimateItemDAO(connection, userProfile);
		  ENFuelInvResultDAO fiResultDAO = new ENFuelInvResultDAO(connection, userProfile);
		  List<Integer> planCodes = act2PlanDao.getListOfPlanCodesByActCode(act.code);
		  for(int planCode : planCodes) {
			  ENEstimateItemFilter estimateFilter = new ENEstimateItemFilter();
			  estimateFilter.planRef.code = planCode;
			  int[] estimateCodes = estimateDao.getFilteredCodeArray(estimateFilter, 0, -1);
			  for(int estimateCode : estimateCodes) {
				  ENFuelInvResultFilter fiResultFilter = new ENFuelInvResultFilter();
				  fiResultFilter.typeRef.code = ENFuelInvResultType.ACT;
				  fiResultFilter.estimateItemRef.code = estimateCode;
				  int[] results = fiResultDAO.getFilteredCodeArray(fiResultFilter, 0, -1);
				  result = results.length > 0;
				  if(result) break;
			  }
			  if(result) break;
		  }
		  return result;
	  }

	  
	  /**** Проводит акт на списание топлива по инвентаризации
	   *   @param fuelInventarizationCode
	   */
	public void moveActForInventarizationToFK(int fuelInventarizationCode)  {

		try
		{
			ENFuelInvResultDAO fiResultDAO = new ENFuelInvResultDAO(connection, userProfile);
			ENFuelInvResultFilter fiResultFilter = new ENFuelInvResultFilter();
			fiResultFilter.inventarizationRef.code = fuelInventarizationCode;
			fiResultFilter.typeRef.code = ENFuelInvResultType.ACT;
			ENFuelInvResultShortList fiResultList = fiResultDAO.getScrollableFilteredList(fiResultFilter, 0, -1);

			if (fiResultList.totalCount == 0)
			{
				return;
			}

			// найдем по любому эстимэйту инвентаризации её акт на списание
			ENEstimateItem ei = new  ENEstimateItemDAO(connection,userProfile).getObject(fiResultList.get(0).estimateItemRefCode);
			ENPlanWork pw = new ENPlanWorkDAO(connection, userProfile).getObject(ei.planRef.code);
			ENAct2ENPlanWorkFilter a2pwFilter = new ENAct2ENPlanWorkFilter();
			a2pwFilter.plan.code = pw.code;
			ENAct2ENPlanWorkShortList a2pwList = new ENAct2ENPlanWorkDAO(connection,userProfile).getScrollableFilteredList(a2pwFilter, 0, -1);
			ENAct act = new ENActDAO(connection,userProfile).getObject(a2pwList.get(0).actRefCode);

		    Context cnt = new InitialContext();
            Object objRef = cnt.lookup(ENActController.JNDI_NAME);
            ENActControllerHome aHome = (ENActControllerHome) PortableRemoteObject
                    .narrow(objRef, ENActControllerHome.class);
            ENActController aController = aHome.create();

            // если акт уже проведен, то ничего не делаем
            if (act.statusRef.code == ENActStatus.CLOSED) {
            	return;
            }
            
            if (act.statusRef.code != ENActStatus.SIGNATURE) {
            	throw new SystemException("Ошибка при проведении акта на списание по инвентаризации. /n Акт не на подписании");
            }

            
            aController.close(act.code, 0);


		} catch(PersistenceException e)
        {
            System.out.println(e.getMessage());
            throw new SystemException(e.getMessage());
        }
		catch(RemoteException e)
        {
            System.out.println(e.getMessage());
            throw new SystemException(e.getMessage());
        }
		catch(NamingException e)
        {
            System.out.println(e.getMessage());
            throw new SystemException(e.getMessage());
        }
		catch(CreateException e)
        {
            System.out.println(e.getMessage());
            throw new SystemException(e.getMessage());
        }

	}




	  /**** Отменяет акт на списание топлива по инвентаризации
	   *   @param fuelInventarizationCode
	   */


	public void cancelMoveActForInventarizationToFK(int fuelInventarizationCode)  {

		try
		{
			ENFuelInvResultDAO fiResultDAO = new ENFuelInvResultDAO(connection, userProfile);
			ENFuelInvResultFilter fiResultFilter = new ENFuelInvResultFilter();
			fiResultFilter.inventarizationRef.code = fuelInventarizationCode;
			fiResultFilter.typeRef.code = ENFuelInvResultType.ACT;
			ENFuelInvResultShortList fiResultList = fiResultDAO.getScrollableFilteredList(fiResultFilter, 0, -1);

			if (fiResultList.totalCount == 0)
			{
				return;
			}

			// найдем по любому эстимэйту инвентаризации её акт на списание
			ENEstimateItem ei = new  ENEstimateItemDAO(connection,userProfile).getObject(fiResultList.get(0).estimateItemRefCode);
			ENPlanWork pw = new ENPlanWorkDAO(connection, userProfile).getObject(ei.planRef.code);
			ENAct2ENPlanWorkFilter a2pwFilter = new ENAct2ENPlanWorkFilter();
			a2pwFilter.plan.code = pw.code;
			ENAct2ENPlanWorkShortList a2pwList = new ENAct2ENPlanWorkDAO(connection,userProfile).getScrollableFilteredList(a2pwFilter, 0, -1);
			ENAct act = new ENActDAO(connection,userProfile).getObject(a2pwList.get(0).actRefCode);

		    Context cnt = new InitialContext();
          Object objRef = cnt.lookup(ENActController.JNDI_NAME);
          ENActControllerHome aHome = (ENActControllerHome) PortableRemoteObject
                  .narrow(objRef, ENActControllerHome.class);
          ENActController aController = aHome.create();

          if (act.statusRef.code != ENActStatus.CLOSED) {
          	throw new SystemException("Ошибка при отмене акта на списание по инвентаризации. /n Акт не проведен");
          }

          aController.unClose(act.code, 0);


		} catch(PersistenceException e)
      {
          System.out.println(e.getMessage());
          throw new SystemException(e.getMessage());
      }
		catch(RemoteException e)
      {
          System.out.println(e.getMessage());
          throw new SystemException(e.getMessage());
      }
		catch(NamingException e)
      {
          System.out.println(e.getMessage());
          throw new SystemException(e.getMessage());
      }
		catch(CreateException e)
      {
          System.out.println(e.getMessage());
          throw new SystemException(e.getMessage());
      }

	}

	/**
	 *
	 * Изменение остатков машин согласно данных инвентаризационной ведомости
	 *
	 * @param fuelInventarizationCode код инвентаризационной ведомости
	 * @param isProv <b>true</b> - проведение / <b>false</b> - отмена проведения
	 * @throws PersistenceException
	 */
	public void updateTravelSheetRemainders(int fuelInventarizationCode, boolean isProv) throws PersistenceException {
		ENFuelInventarizationDAO fuelInventarizationDao = new ENFuelInventarizationDAO(connection, userProfile);
		ENFuelInventarizationItemDAO itemDao = new ENFuelInventarizationItemDAO(connection, userProfile);
		ENTravelSheetDAO travelSheetDao = new ENTravelSheetDAO(connection, userProfile);
		TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(connection, userProfile);
		TravelSheetLogic travelSheetLogic = new TravelSheetLogic(connection, userProfile);
		ENTravelSheetFuelDAO travSheetFuelDao = new ENTravelSheetFuelDAO(connection, userProfile);
		TKFuelTypeDAO fuelTypeDao = new TKFuelTypeDAO(connection, userProfile);
		ENTravelSheetFuelRemainsDAO remainsDao = new ENTravelSheetFuelRemainsDAO(connection, userProfile);

		ENFuelInventarization fuelInventarization = fuelInventarizationDao.getObject(fuelInventarizationCode);

		ENFuelInventarizationItemFilter filter = new ENFuelInventarizationItemFilter();
		filter.inventarizationRef.code = fuelInventarizationCode;

		int[] codes = itemDao.getFilteredCodeArray(filter, 0, -1);

		int count = 0;
		for(int code : codes) {
			ENFuelInventarizationItem item = itemDao.getObject(code);
			ENTravelSheet travelSheet = travelSheetDao.getObject(item.travelSheetRef.code);
			BigDecimal countFact = item.countFact;
			BigDecimal countGen = item.countGen;
			int fuelType = item.fuelTypeRef.code;
			int travelSheetFuelType = item.travelFuelTypeRef.code;
			TKFuelType fuelTypeObj = fuelTypeDao.getObject(fuelType);


			if(countFact.compareTo(countGen) != 0) {
				BigDecimal diff = countFact.subtract(countGen);

				if(!isProv) {
					diff = diff.multiply(new BigDecimal(-1));
				}

				String commentSeries = null;
				if(isProv) {
					commentSeries = String.format("По инвентаризации № %s (%s)", fuelInventarization.numberGen, fuelTypeObj.name);
				} else {
					commentSeries = String.format("ОТМЕНА - По инвентаризации № %s (%s)", fuelInventarization.numberGen, fuelTypeObj.name);
				}

				ENTravelSheetFuel travelSheetFuel = new ENTravelSheetFuel();
				travelSheetFuel.countGen = diff;
				travelSheetFuel.dateGen = travelSheet.dateStart;
				travelSheetFuel.fuelType.code = fuelType;
				travelSheetFuel.isVRTU = 0;
				travelSheetFuel.realTransport.code = item.transportRealRef.code;
				travelSheetFuel.series = commentSeries;
				travelSheetFuel.travelSheetRef.code = travelSheet.code;
				travelSheetFuel.travelSheetFuelTypeRef.code = ENTravelSheetFuelType.MAIN;

				travSheetFuelDao.add(travelSheetFuel);

				ENTravelSheetFuelRemains remains = fuelLogic.getFuelRemainsByTravelSheet(travelSheet.code, fuelType, travelSheetFuelType, false);
				remains.countGenFinal = remains.countGenFinal.add(diff);
				remains.countGenIn = remains.countGenIn.add(diff);
				remainsDao.save(remains);

				ENTravelSheet prev = null;
				ENTravelSheet next = travelSheetDao.getObject(travelSheet.code);
				while(next != null) {
					prev = travelSheetDao.getObject(next.code);
					next = travelSheetLogic.getNextSheet(next);
					if(next != null) {
						ENTravelSheetFuelRemains remnsPrev = fuelLogic.getFuelRemainsByTravelSheet(prev.code, fuelType, travelSheetFuelType, false);
						ENTravelSheetFuelRemains remns = fuelLogic.getFuelRemainsByTravelSheet(next.code, fuelType, travelSheetFuelType, false);
						if(remns != null) {
							remns.countGenStart = (remnsPrev == null) ? new BigDecimal(0) : remnsPrev.countGenFinal;
							remns.countGenFinal = remns.countGenStart.add(remns.countGenIn).subtract(remns.countGenOut);
							remainsDao.save(remns);
						}
					}
				}
			} else {
				count++;
				System.out.println(String.format("Update travel sheet remainder by fuel inventarization (item code = %d). Done %d of %d"
						, code, count, codes.length));

				continue;
			}

			count++;
			System.out.println(String.format("Update travel sheet remainder by fuel inventarization (item code = %d). Done %d of %d"
					, code, count, codes.length));

		}
	}


}
