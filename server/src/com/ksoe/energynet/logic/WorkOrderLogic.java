package com.ksoe.energynet.logic;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENWorkOrder2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderDAO;
import com.ksoe.energynet.dataminer.FINDoc2MolDataDAO;
import com.ksoe.energynet.dataminer.FINDoc2WorkOrderDAO;
import com.ksoe.energynet.dataminer.FINMolDataDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.logic.AuthLogic.FinConnectionData;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork;
import com.ksoe.energynet.valueobject.ENWorkOrderByt;
import com.ksoe.energynet.valueobject.ENWorkOrderBytType;
import com.ksoe.energynet.valueobject.FINChargeType;
import com.ksoe.energynet.valueobject.FINDoc2WorkOrder;
import com.ksoe.energynet.valueobject.FINDocType;
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.filter.ENWorkOrder2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.FINDoc2MolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINDoc2WorkOrderFilter;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrder2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.FINDoc2MolDataShortList;
import com.ksoe.energynet.valueobject.lists.FINMolDataShortList;
import com.ksoe.energynet.valueobject.references.ENWorkOrderBytTypeRef;
import com.ksoe.energypro.exception.EnergyproBusinessException;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.fin.logic.FKLogic2;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class WorkOrderLogic extends LogicModule{



	public void removeWorkOrderForOpenPlanByPlanCode(int planCode, boolean isDeleteInFK) throws PersistenceException
	{
		ENWorkOrder2ENPlanWorkFilter f = new ENWorkOrder2ENPlanWorkFilter();
		f.plan.code = planCode;
		ENWorkOrder2ENPlanWorkDAO dao = new ENWorkOrder2ENPlanWorkDAO(connection, userProfile);
		ENWorkOrder2ENPlanWorkShortList list = dao.getScrollableFilteredList(f, 0, -1);
		for (int i=0; i < list.totalCount; i++){
			removeWorkOrderForOpenPlanByWorkOrderCode2(list.get(i).workOrderCode, isDeleteInFK);
		}
	}


	public void removeWorkOrderForOpenPlanByWorkOrderCode2(int workOrderCode, boolean isDeleteInFK) throws PersistenceException
	{
			try {

	    	// !!!!!!! такой же кусок и в PlanWorkLogic closeClearPlan !!!!!!!

	    	//ENWorkOrder2ENPlanWork w2p = objectDAO.getObject(code);

        	// проверить наличие АКТА на это Задание ... если есть - в сад !
        	//ActLogic actLogic = new ActLogic(enConn, getUserProfile());
        	//ENAct act = actLogic.getActByPlanCode(w2p.plan.code, false);
        	//if ( act != null){
        	//	throw new EnergyproSystemException("Remove ACT ...№ " + act.numberGen);
        	//}

	    	// если есть развязанные материалы - отменить развязку ..
	        //WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE), getUserProfile());
	        ENWorkOrderDAO woDAO = new ENWorkOrderDAO(connection, userProfile);
	        ENWorkOrder workOrder = woDAO.getObject(workOrderCode);

	        FINLogic finLogic = new FINLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);
	        FKLogic2 fkLogic2 = new FKLogic2(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

	        FINMolLogic molLogic = new FINMolLogic(connection, userProfile);
	        FINMolDataDAO molDAO = new FINMolDataDAO(connection, userProfile);

	        PlanWorkLogic planWorkLogic = new PlanWorkLogic(connection, userProfile);
            ENPlanWork planWork = planWorkLogic.getPlanByWorkOrderCode(workOrder.code);


	        FINDoc2MolDataDAO f2mDAO = new FINDoc2MolDataDAO(connection, userProfile);

	        FINMolDataFilter molDataFilter = new FINMolDataFilter();
	        molDataFilter.workOrder.code = workOrder.code;

        	FINDoc2MolDataFilter f2mFilter = new FINDoc2MolDataFilter();
        	//f2mFilter.molData.code = molList.get(k).code;
        	// 02.12.11 if (planWork.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION){
        	if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
        			|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
        			|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS)
        	{
        	    f2mFilter.finDocTypeRef.code = FINDocType.MOVE_28_332;
        	}
        	else
        	if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        	{
        	    f2mFilter.finDocTypeRef.code = FINDocType.MOVE_28_292;
        	}
        	else
        	{
        	    f2mFilter.finDocTypeRef.code = FINDocType.MOVE_28_302;
        	}
        	f2mFilter.conditionSQL = "FINDOC2MOLDATA.moldatacode in (select finmoldata.code from finmoldata where finmoldata.workordercode = " + workOrderCode + ")";

        	FINDoc2MolDataShortList f2mList  = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);

	        //FINMolDataShortList molList  = molDAO.getScrollableFilteredList(molDataFilter, 0, -1);
	        for (int k = 0; k < f2mList.totalCount; k++){
	        	if (isDeleteInFK){
	        		/* 28 удалятся пакаджем ...
	        			finLogic.removeDoc(
	        					             f2mList.get(k).finDocCode,
	        					             finLogic.getFINOperationCodeByTypeCode(f2mList.get(k).finDocTypeRefCode, f2mList.get(k).molDataTypeRefCode )
	        					            );
	               */
	        	}
	        	f2mDAO.remove(f2mList.get(k).code);
	        }

	        //f2mFilter = new FINDoc2MolDataFilter();
	        // if (planWork.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION){
	        if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
	        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
	        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS)
	        {
	            f2mFilter.finDocTypeRef.code = FINDocType.MOVE_332;
	        }
        	else
	        if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
	        {
	        	f2mFilter.finDocTypeRef.code = FINDocType.MOVE_292;
	        }
	        else
	        {
	            f2mFilter.finDocTypeRef.code = FINDocType.MOVE_302;
	        }
	        f2mList  = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
	        for (int k = 0; k < f2mList.totalCount; k++){
	        	//FINDoc2MolData f2m = f2mDAO.getObject(f2mArr[k]);
	        	if (isDeleteInFK){
	        		// проверим статус .. хотя по идее тут он еще не меняеться
	        		finLogic.validateDocStatus(f2mList.get(k).finDocCode, finLogic.getFINOperationCodeByTypeCode(f2mList.get(k).finDocTypeRefCode, f2mList.get(k).molDataTypeRefCode ));

	        		// могут выносить из закрытых в ФК периодов ... поменяем дату ...
	        		Date fkDate = finLogic.getCurrentPeriodInFK();

		    		if (fkDate.after(workOrder.dateGen)){
		    			  fkLogic2.updateDateTHead(f2mList.get(k).finDocCode, fkDate);
		    		}

	        		fkLogic2.Drop_Document(f2mList.get(k).finDocCode, true);

	        		/*
	        			finLogic.removeDoc(
	        					            f2mList.get(k).finDocCode,
	        					            finLogic.getFINOperationCodeByTypeCode(f2mList.get(k).finDocTypeRefCode, f2mList.get(k).molDataTypeRefCode ));
	        	    */

	        	}
	        	f2mDAO.remove(f2mList.get(k).code);
	        }



	        int[] molArr = molLogic.getMOLDataArrayByWorkOrderCode(workOrder.code);

/* вынесли выше .. при отмене доков из ФК
	        f2mFilter = new FINDoc2MolDataFilter();
//	      ** f2mFilter.workOrder.code = workOrder.code;
	        f2mList  = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
	        for (int k = 0; k < f2mList.totalCount; k++){
	        	f2mDAO.remove(f2mList.get(k).code);
	        }
*/

	        for (int k=0; k < molArr.length; k++){
	        	molDAO.remove(molArr[k]);
	        }

/*

	        FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(connection, userProfile);
	        FINDoc2WorkOrderFilter f2wFilter = new FINDoc2WorkOrderFilter();
	        f2wFilter.workOrderRef.code = workOrder.code;
	        f2wFilter.typeRef.code = FINDocType.MOVE_28_302;

	        int[] f2wArr = f2wDAO.getFilteredCodeArray(f2wFilter,null,null,0,-1,null);

	        //FINDoc2WorkOrderShortList f2wList28 = f2wDAO.getScrollableFilteredList(f2wFilter, 0, -1);
	        for (int k = 0; k < f2wArr.length; k++){
	        	FINDoc2WorkOrder fd = f2wDAO.getObject(f2wArr[k]);
	        	// удалим дркументы из ФинКолл ...
	        	//int operationType =

	        	// выносить из ФИН кол только ОДИН раз ..
	        	if ( isDeleteInFK ){
	        	  finLogic.removeDoc(fd.finDocMOLCode, finLogic.getFINOperationCodeByTypeCode(fd.typeRef.code, true));
	        	  finLogic.removeDoc(fd.finDocMechanicCode, finLogic.getFINOperationCodeByTypeCode(fd.typeRef.code, false));
	        	}

	        	f2wDAO.remove(f2wArr[k]);
	        }

	        f2wFilter = new FINDoc2WorkOrderFilter();
	        f2wFilter.workOrderRef.code = workOrder.code;
	        f2wFilter.typeRef.code = FINDocType.MOVE_302;

	        f2wArr = f2wDAO.getFilteredCodeArray(f2wFilter,null,null,0,-1,null);

	        //FINDoc2WorkOrderShortList f2wList28 = f2wDAO.getScrollableFilteredList(f2wFilter, 0, -1);
	        for (int k = 0; k < f2wArr.length; k++){
	        	FINDoc2WorkOrder fd = f2wDAO.getObject(f2wArr[k]);
	        	// удалим дркументы из ФинКолл ...
	        	//int operationType =

	        	// выносить из ФИН кол только ОДИН раз ..
	        	if ( isDeleteInFK ){
	        	  finLogic.removeDoc(fd.finDocMOLCode, finLogic.getFINOperationCodeByTypeCode(fd.typeRef.code, true));
	        	  finLogic.removeDoc(fd.finDocMechanicCode, finLogic.getFINOperationCodeByTypeCode(fd.typeRef.code, false));
	        	}

	        	f2wDAO.remove(f2wArr[k]);
	        }


*/

	    	// удалим развязку ...
	        ENWorkOrder2ENPlanWorkDAO w2pDAO = new ENWorkOrder2ENPlanWorkDAO(connection, userProfile);
	        ENWorkOrder2ENPlanWorkFilter w2pFilter = new ENWorkOrder2ENPlanWorkFilter();
	        w2pFilter.workOrder.code = workOrder.code;
	        int[] arr = w2pDAO.getFilteredCodeArray(w2pFilter, null, null, 0, -1, null);
	        for (int n = 0; n < arr.length; n++){
	        	w2pDAO.remove(arr[n]);
	        }

	    	// удалим Наряд !
	    	woDAO.remove(workOrder.code);

/*	   ДОДЕЛАТЬ ....
	    	// удалить блокировку для СЧЕТЧИКОВ ....
		      ENElement el = new ENElementDAO(connection, userProfile).getObject(w2p.plan.elementRef.code);
		      ENWorkOrder wo = new ENWorkOrder();
		      wo.workOrderNumber = null;
		      wo.dateGen = null;
		      // только для счетчиков - залочить его для движений в СканСчетчиках ...
		      if (el.typeRef.code == ENElementType.METROLOGY_COUNTER){
		    	  CounterLogic cntLogic = new CounterLogic(enConn, getUserProfile());
		    	  ENMetrologyCounter cnt = cntLogic.getCounterByElementCode(w2p.plan.elementRef.code);
		    	  cntLogic.lockCounter( cnt, wo, 0);
		      }
*/
	    	// удалим ФИНМатериалы

	      //ENWorkOrder2ENPlanWorkDAO objectDAO = new ENWorkOrder2ENPlanWorkDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE));

	      //objectDAO.remove(code);
	     }

		catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
					e);
		}
	}


	public void removeWorkOrderForOpenPlanByWorkOrderCode(int workOrderCode, boolean isDeleteInFK) throws PersistenceException
	{
	    try
	     {
	    	//ENWorkOrder2ENPlanWork w2p = objectDAO.getObject(code);
        	// проверить наличие АКТА на это Задание ... если есть - в сад !
        	//ActLogic actLogic = new ActLogic(enConn, getUserProfile());
        	//ENAct act = actLogic.getActByPlanCode(w2p.plan.code, false);
        	//if ( act != null){
        	//	throw new EnergyproSystemException("Remove ACT ...№ " + act.numberGen);
        	//}

	    	// если есть развязанные материалы - отменить развязку ..
	        //WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE), getUserProfile());
	        ENWorkOrderDAO woDAO = new ENWorkOrderDAO(connection, userProfile);
	        ENWorkOrder workOrder = woDAO.getObject(workOrderCode);

	        PlanWorkLogic planWorkLogic = new PlanWorkLogic(connection, userProfile);
		    ENPlanWork planWork = planWorkLogic.getPlanByWorkOrderCode(workOrder.code);

	        FINLogic finLogic = new FINLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

	        FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(connection, userProfile);
	        FINDoc2WorkOrderFilter f2wFilter = new FINDoc2WorkOrderFilter();
	        f2wFilter.workOrderRef.code = workOrder.code;

	        //if (planWork.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION){
	        if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
	        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
	        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS)
	        {
	            f2wFilter.typeRef.code = FINDocType.MOVE_28_332;
	        }
	        else
	        {
	            f2wFilter.typeRef.code = FINDocType.MOVE_28_302;
	        }

	        int[] f2wArr = f2wDAO.getFilteredCodeArray(f2wFilter,null,null,0,-1,null);

	        //FINDoc2WorkOrderShortList f2wList28 = f2wDAO.getScrollableFilteredList(f2wFilter, 0, -1);
	        for (int k = 0; k < f2wArr.length; k++){
	        	FINDoc2WorkOrder fd = f2wDAO.getObject(f2wArr[k]);
	        	// удалим дркументы из ФинКолл ...
	        	//int operationType =

	        	// выносить из ФИН кол только ОДИН раз ..
	        	if ( isDeleteInFK ){
	        	  finLogic.removeDoc(fd.finDocMOLCode, finLogic.getFINOperationCodeByTypeCode(fd.typeRef.code, true));
	        	  finLogic.removeDoc(fd.finDocMechanicCode, finLogic.getFINOperationCodeByTypeCode(fd.typeRef.code, false));
	        	}

	        	f2wDAO.remove(f2wArr[k]);
	        }

	        f2wFilter = new FINDoc2WorkOrderFilter();
	        f2wFilter.workOrderRef.code = workOrder.code;
	        //if (planWork.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION){
	        if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
	        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
	        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS)
	        {
	            f2wFilter.typeRef.code = FINDocType.MOVE_332;
	        }
	        else
	        {
	            f2wFilter.typeRef.code = FINDocType.MOVE_302;
	        }

	        f2wArr = f2wDAO.getFilteredCodeArray(f2wFilter,null,null,0,-1,null);

	        //FINDoc2WorkOrderShortList f2wList28 = f2wDAO.getScrollableFilteredList(f2wFilter, 0, -1);
	        for (int k = 0; k < f2wArr.length; k++){
	        	FINDoc2WorkOrder fd = f2wDAO.getObject(f2wArr[k]);
	        	// удалим дркументы из ФинКолл ...
	        	//int operationType =

	        	// выносить из ФИН кол только ОДИН раз ..
	        	if ( isDeleteInFK ){
	        	  finLogic.removeDoc(fd.finDocMOLCode, finLogic.getFINOperationCodeByTypeCode(fd.typeRef.code, true));
	        	  finLogic.removeDoc(fd.finDocMechanicCode, finLogic.getFINOperationCodeByTypeCode(fd.typeRef.code, false));
	        	}

	        	f2wDAO.remove(f2wArr[k]);
	        }

	    	// удалим развязку ...
	        ENWorkOrder2ENPlanWorkDAO w2pDAO = new ENWorkOrder2ENPlanWorkDAO(connection, userProfile);
	        ENWorkOrder2ENPlanWorkFilter w2pFilter = new ENWorkOrder2ENPlanWorkFilter();
	        w2pFilter.workOrder.code = workOrder.code;
	        int[] arr = w2pDAO.getFilteredCodeArray(w2pFilter, null, null, 0, -1, null);
	        for (int n = 0; n < arr.length; n++){
	        	w2pDAO.remove(arr[n]);
	        }

	    	// удалим Наряд !
	    	woDAO.remove(workOrder.code);

/*	   ДОДЕЛАТЬ ....
	    	// удалить блокировку для СЧЕТЧИКОВ ....
		      ENElement el = new ENElementDAO(connection, userProfile).getObject(w2p.plan.elementRef.code);
		      ENWorkOrder wo = new ENWorkOrder();
		      wo.workOrderNumber = null;
		      wo.dateGen = null;
		      // только для счетчиков - залочить его для движений в СканСчетчиках ...
		      if (el.typeRef.code == ENElementType.METROLOGY_COUNTER){
		    	  CounterLogic cntLogic = new CounterLogic(enConn, getUserProfile());
		    	  ENMetrologyCounter cnt = cntLogic.getCounterByElementCode(w2p.plan.elementRef.code);
		    	  cntLogic.lockCounter( cnt, wo, 0);
		      }
*/
	    	// удалим ФИНМатериалы

	      //ENWorkOrder2ENPlanWorkDAO objectDAO = new ENWorkOrder2ENPlanWorkDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE));

	      //objectDAO.remove(code);
	     }
	    //catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    catch (DatasourceConnectException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    }



	public ENWorkOrder getWorkOrderByEstimateItemCode(int estimateCode, boolean isException)  throws PersistenceException
	{
		ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
		ENEstimateItem e = eDAO.getObject(estimateCode);
		if ( e == null){
			throw new EnergyproBusinessException("EstimateItem not found, code="+estimateCode);
		}

		return getWorkOrderByPlanCode(e.planRef.code, isException);
	}

	public ENWorkOrder getWorkOrderByEstimateItemCode(int estimateCode)  throws PersistenceException
	{
		return getWorkOrderByEstimateItemCode(estimateCode, true);
	}

	public ENWorkOrder getWorkOrderByPlanCode(int planCode, boolean isException)  throws PersistenceException
	{
		if (planCode == Integer.MIN_VALUE) {
			throw new SystemException("\n\nНе заданий код плану!");
		}

		ENWorkOrder out = new ENWorkOrder();

		ENWorkOrder2ENPlanWorkDAO a2DAO = new ENWorkOrder2ENPlanWorkDAO(connection, userProfile);
		ENWorkOrder2ENPlanWorkFilter a2Filter = new ENWorkOrder2ENPlanWorkFilter();
		a2Filter.plan.code = planCode;
		ENWorkOrder2ENPlanWorkShortList a2List = a2DAO.getScrollableFilteredList(a2Filter,0,-1);

		if (( a2List.totalCount != 1) && ( isException ))
		{
			throw new EnergyproSystemException("На плані немає Наряду-Завдання .., код плану="+planCode);
		}

		if ( a2List.totalCount == 0){
			return null;
		}


		ENWorkOrderDAO aDAO = new ENWorkOrderDAO(connection, userProfile);
		out = aDAO.getObject(a2List.get(0).workOrderCode);


		return out;
	}

	public ENWorkOrder getWorkOrderByPlanCode(int planCode)  throws PersistenceException
	{
		return getWorkOrderByPlanCode(planCode, true);
		/*
		ENWorkOrder out = new ENWorkOrder();

		ENWorkOrder2ENPlanWorkDAO a2DAO = new ENWorkOrder2ENPlanWorkDAO(connection, userProfile);
		ENWorkOrder2ENPlanWorkFilter a2Filter = new ENWorkOrder2ENPlanWorkFilter();
		a2Filter.plan.code = planCode;
		ENWorkOrder2ENPlanWorkShortList a2List = a2DAO.getScrollableFilteredList(a2Filter,0,-1);
		if ( a2List.totalCount != 1){
			throw new EnergyproBusinessException("error in count WorkOrder in plans, code="+planCode);
		}

		ENWorkOrderDAO aDAO = new ENWorkOrderDAO(connection, userProfile);
		out = aDAO.getObject(a2List.get(0).workOrderCode);


		return out;
		*/
	}

	public FINDoc2WorkOrder getFINDocCodeByWorkOrderCode__(int workOrderCode, int operationType) throws PersistenceException{
		FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(connection, userProfile);
		FINDoc2WorkOrderFilter f2wFilter = new FINDoc2WorkOrderFilter();
		f2wFilter.workOrderRef.code = workOrderCode;
		f2wFilter.typeRef.code = operationType;

		int[] l = f2wDAO.getFilteredCodeArray(f2wFilter,null,null,0,-1,null);

		if (l.length == 0){
			throw new EnergyproSystemException("FINDoc codes not found for WorkOrder. code = " + workOrderCode + " , operationType = "+operationType);
		}

		FINDoc2WorkOrder out = f2wDAO.getObject(l[0]);

		return out;
	}


	public ENWorkOrder getWorkOrderByMolDataCode(int molDataCode)  throws PersistenceException
	{
		return getWorkOrderByMolDataCode(molDataCode, true);

	}

	public ENWorkOrder getWorkOrderByMolDataCode(int molDataCode, boolean isException)  throws PersistenceException
	{
		ENWorkOrder out = new ENWorkOrder();


		FINMolDataDAO fmdDAO = new FINMolDataDAO(connection,userProfile);
		FINMolDataFilter fmdFilter = new FINMolDataFilter();
		fmdFilter.code = molDataCode;

		FINMolDataShortList fmdList = fmdDAO.getScrollableFilteredList(fmdFilter,0,-1);

		if (( fmdList.totalCount != 1) && ( isException ))
		{
			throw new EnergyproSystemException("error in getWorkOrderByMolDataCode");
		}

		if ( fmdList.totalCount == 0){
			return null;
		}


		ENWorkOrderDAO aDAO = new ENWorkOrderDAO(connection, userProfile);
		out = aDAO.getObject(fmdList.get(0).workOrderCode);


		return out;
	}


	public String getMasterCodeFromWorkOrderByPlanCode(int planCode, boolean isException) throws PersistenceException
	{
		ENWorkOrder2ENPlanWorkDAO w2pDAO = new ENWorkOrder2ENPlanWorkDAO(connection, userProfile);
		ENWorkOrder2ENPlanWorkFilter w2pFilter = new ENWorkOrder2ENPlanWorkFilter();
		w2pFilter.plan.code = planCode;

		int[] w2pArr = w2pDAO.getFilteredCodeArray(w2pFilter, 0, -1);

		if ((w2pArr.length != 1) && ( isException ))
		{
			throw new EnergyproSystemException("На плані немає Наряду-Завдання .., код плану = " + planCode);
		}

		if (w2pArr.length == 0) {
			return "";
		}

		ENWorkOrder2ENPlanWork w2p = w2pDAO.getObject(w2pArr[0]);

		FINMolDataDAO fmdDAO = new FINMolDataDAO(connection,userProfile);

		FINMolDataFilter fmdFilter = new FINMolDataFilter();
		fmdFilter.workOrder.code = w2p.workOrder.code;
		fmdFilter.molTypeRef.code = FINMolType.MASTER;

		int[] fmdArr = fmdDAO.getFilteredCodeArray(fmdFilter, 0, -1);

		if (fmdArr.length == 0)
		{
			throw new EnergyproSystemException("На плані немає МВО-майстра, код плану = " + planCode + " [1]");
		}

		if (fmdArr.length > 1)
		{
			throw new EnergyproSystemException("На плані знайдено більше 1 (" + fmdArr.length + ") МВО-майстра, код плану = " + planCode);
		}

		FINMolData fmd = fmdDAO.getObject(fmdArr[0]);

		if (fmd.finMolCode == null)
		{
			throw new EnergyproSystemException("На плані немає МВО-майстра, код плану = " + planCode + " [2]");
		}

		return fmd.finMolCode;
	}

	  public WorkOrderLogic(Connection connection, UserProfile userProfile)
	  {
	    super(connection, userProfile);
	  }



	public int addWorkOrderByt(ENWorkOrderByt object) {

		// /// 13.01.15 Если тип не задан, ставим 1 ("Змінні завдання, сформовані в EnergyNet")
		if (object.typeRef == null) {
			object.typeRef = new ENWorkOrderBytTypeRef();
			object.typeRef.code = ENWorkOrderBytType.BY_ENERGYNET;

		} else if (object.typeRef.code == Integer.MIN_VALUE) {
			object.typeRef.code = ENWorkOrderBytType.BY_ENERGYNET;
		}
		// ///

		Connection finConn = null;
		Connection enConn = null;

		int workOrderBytCode = Integer.MIN_VALUE;

		try {

			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(userProfile, enConn);

			/////
			AuthLogic l = new AuthLogic(enConn, userProfile);
			FinConnectionData finConnectionData = l.getFinConnectionData();
			/////

			//finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			finConn = getConnection(finConnectionData.connectionString);

			if (object.finWorker != null) {
				if (object.finWorker.tabNumber != null) {

					// проверим является ли воркер инвалидом
					HumenLogic hLogic = new HumenLogic(enConn, userProfile);
					FINLogic fLogicFin = new FINLogic(finConn, userProfile);
					// FINLogic fLogicNet = new
					// FINLogic(enConn,getUserProfile());

					FINWorkerDAO wDAO = new FINWorkerDAO(userProfile, enConn);
					FINWorker w = new FINWorker();

		    		w.code = Integer.MIN_VALUE;
		    		w.name = object.finWorker.name;
		    		w.tabNumber = object.finWorker.tabNumber;
		    		w.positionCode = object.finWorker.positionCode;
		    		w.positionName = object.finWorker.positionName;
		    		w.departmentCode = object.finWorker.departmentCode;
		    		w.departmentName = object.finWorker.departmentName;
		    		w.priceGen = object.finWorker.priceGen;
		    		w.categor = object.finWorker.categor;
		    		w.finCode = object.finWorker.finCode;
		    		///// 07.12.11 Убираем признак "Командировочный" вообще, потому что с ним неправильно рассчитывается з/п
		    		//w.isSentAssignment = object.finWorker.isSentAssignment;
		    		w.isSentAssignment = 0;
		    		/////
		    		w.kindRef.code = object.finWorker.kindRef.code;
	                // MDAX-441
	                w.positionId = object.finWorker.positionId;

		    		// если инвалид тогда проставляем в финворкер процент отчислений со справочника FINCHARGEHISTORY и тип отчислений FINChargeType = 2
		    		// иначе процент отчислений также берем со справочника но только для обычных работников  FINChargeType = 1
		    		if (fLogicFin.getCheckIsInvalid(object.finWorker.tabNumber, object.dateGen) > 0 )
		    		{
		                // если инвалид
		    	        w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_INVALID, object.dateGen);
		    	        w.chargeRef.code = FINChargeType.IS_INVALID;
		    		}
		    		else
		    		{   // если НЕ инвалид
		    			w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID, object.dateGen);
		    			w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
		    		}

					object.finWorker.code = wDAO.add(w);
				}
			}

			workOrderBytCode = workOrderBytDAO.add(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
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

		return workOrderBytCode;
	}

}
