package com.ksoe.energynet.logic;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENMolDAO;
import com.ksoe.energynet.dataminer.ENMolStatusDAO;
import com.ksoe.energynet.dataminer.ENWorkOrder2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.FINDoc2MolDataDAO;
import com.ksoe.energynet.dataminer.FINMolDAO;
import com.ksoe.energynet.dataminer.FINMolDataDAO;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENMol;
import com.ksoe.energynet.valueobject.ENMolStatus;
import com.ksoe.energynet.valueobject.ENMolType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.FINDoc2MolData;
import com.ksoe.energynet.valueobject.FINDocType;
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.brief.ENMolShort;
import com.ksoe.energynet.valueobject.brief.ENMolStatusShort;
import com.ksoe.energynet.valueobject.brief.ENWorkOrder2ENPlanWorkShort;
import com.ksoe.energynet.valueobject.brief.FINMolShort;
import com.ksoe.energynet.valueobject.filter.ENMolFilter;
import com.ksoe.energynet.valueobject.filter.ENMolStatusFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrder2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.FINDoc2MolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINMolFilter;
import com.ksoe.energynet.valueobject.lists.ENMolShortList;
import com.ksoe.energynet.valueobject.lists.ENMolStatusShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrder2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.FINDoc2MolDataShortList;
import com.ksoe.energynet.valueobject.lists.FINMolShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.fin.dataminer.OSMolDAO;
import com.ksoe.fin.logic.FKConsts;
import com.ksoe.fin.logic.FKLogic2;
import com.ksoe.fin.valueobject.brief.OSMolShort;
import com.ksoe.fin.valueobject.filter.OSMolFilter;
import com.ksoe.fin.valueobject.lists.OSMolShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.mdax.logic.AXTransactionsLogic;
import com.ksoe.mdax.services.journalactionks.JournalAction;

public class FINMolLogic extends LogicModule{
	private static final long serialVersionUID = 1L;

	public int[] getFINDocCodesByMOLDataCodeForOUT(int molDataCode, int opTypeCode) throws PersistenceException
	{
		FINDoc2MolDataDAO dao = new FINDoc2MolDataDAO(connection, userProfile);
		FINDoc2MolDataFilter f = new FINDoc2MolDataFilter();
		f.molData.code = molDataCode;

		if (opTypeCode == FINDocType.MOVE_302)
		   f.conditionSQL = "findoctyperefcode in (1,2)"; // только для 301-2 и 28 для 301-2
		else
		if (opTypeCode == FINDocType.MOVE_304)
		   f.conditionSQL = "findoctyperefcode in (3,5)";
		else
		if (opTypeCode == FINDocType.MOVE_332)
		   f.conditionSQL = "findoctyperefcode in (36,37)";
		else
		if (opTypeCode == FINDocType.MOVE_334)
		   f.conditionSQL = "findoctyperefcode in (38,39)";
		else

		if (opTypeCode == FINDocType.MOVE_292)
		   f.conditionSQL = "findoctyperefcode in (50,51)";
		else
		if (opTypeCode == FINDocType.MOVE_294)
		   f.conditionSQL = "findoctyperefcode in (52,53)";

		// сортировать !! всегда должна быть ПЕРВОЙ 30х !!!
		// при вставках ВСЕГДА должно быть первой 30х операция
		//нах перелили ТО не в том порядке !!! f.orderBySQL = "FINDOC2MOLDATA.CODE desc";
		f.orderBySQL = "FINDOC2MOLDATA.findoctyperefcode";

		FINDoc2MolDataShortList l = dao.getScrollableFilteredList(f,0,-1);
		// AS 18.03.2011 перешли на ПАКАДЖ .. 28 нах ..
		//if (l.totalCount != 2){
		//	throw new EnergyproSystemException("Ошибка с развязкой МОЛов и документов в ФК ... molDataCode = " + molDataCode + ", opTypeCode = " + opTypeCode);
			//throw new EnergyproSystemException("Error in count findoc for getFINDocCodesByMOLDataCodeForOUT");
		//}
		int[] out = new int[2];
		out[0] = Integer.MIN_VALUE;
		out[1] = Integer.MIN_VALUE;
		for (int i=0; i<l.totalCount; i++){
			out[i] = l.get(i).finDocCode;
		}
		return out;
	}


	public FINMolData getFINMolDataByWorkOrderCode(int workOrderCode, int molTypeCode) throws PersistenceException
	{
		FINMolData out = null;
		FINMolDataFilter f = new FINMolDataFilter();
		f.molTypeRef.code = molTypeCode;
		f.workOrder.code = workOrderCode;
		//f.conditionSQL = " finmoldata.code in (select FINDOC2MOLDATA.MOLDATACODE from FINDOC2MOLDATA where FINDOC2MOLDATA.WORKORDERCODE = "+ (workOrderCode) +" )";

		FINMolDataDAO dao = new FINMolDataDAO(connection, userProfile );
		int[] arr = dao.getFilteredCodeArray(f,0,-1);
		if (arr.length > 0) {
			out = dao.getObject(arr[0]);
		}

		return out;

		/*
		 *
		 *    f :=  FINMolDataFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.molTypeRef := FINMolTypeRef.Create;
   f.molTypeRef.code := molTypeCode;
   f.conditionSQL := ' finmoldata.code in (select FINDOC2MOLDATA.MOLDATACODE from FINDOC2MOLDATA where FINDOC2MOLDATA.WORKORDERCODE = '+ IntToStr(workOrderCode) +' )';
   TempMOLData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;
   l := TempMOLData.getScrollableFilteredList(f,0,1);
   if l.totalCount > 0 then
     Result := TempMOLData.getObject(l.list[0].code)
   else
     Result := nil;
		 */
	}
	
	/**
	 * 
	 * <p>Функция возвращает соответствующий статус EnergyNet статусу из Фин. коллекции </p>
	 * 
	 * @param finMolState {@code Integer} статус МОЛ фин. коллекции
	 * @see FKConsts#TDIVISION_STATE_ACTIVE
	 * @see FKConsts#TDIVISION_STATE_INACTIVE
	 * 
	 * @return соответствующий статус МОЛ в EnergyNet {@link ENMolStatus}
	 */
	private int getENMolStatusValueByFinMolStateValue(int finMolState) {
		switch(finMolState) {
			case FKConsts.TDIVISION_STATE_ACTIVE:
				return ENMolStatus.VALID;
			case FKConsts.TDIVISION_STATE_INACTIVE:
				return ENMolStatus.NOT_VALID;
			default:
				throw new SystemException(String.format("Incorrect value: %d", finMolState));
		}
	}
	
	/**
	 * 
	 * Класс только для блокировки внутри метода {@link FINMolLogic#synchronizeENMolsWithFinCollection()}
	 * 
	 * @author kreschishinma
	 *
	 */
	private class SynchronizationMolsLock {
		
	}
	
	/**
	 * 
	 * <p>Синхронизация справочников МОЛов EnergyNet и Финколлекции </p>
	 * 
	 * <p>Эта процедура синхронизирует справочник МОЛов EnergyNet и приводит его в соответствие
	 * со справочником МОЛов Фин. коллекции</p>
	 * 
	 * <p>Приводятся в соответствие статусы и наименования МОЛов по коду.</p>
	 * <p>Процедура не добавляет МОЛ которых нет в справочнике EnergyNet</p>
	 * <p>Процедура не удаляет лишних МОЛ которых нет в справочнике в Фин. коллекции</p>
	 * 
	 * @param addOSMols {@code true} В синхронизации при добавлении будут учавствовать МОЛ из модуля "Учет основных средств"
	 * @return {@link ENMolShortList} лист МОЛов которых нет в справочнике EnergyNet.
	 * 
	 * @throws DatasourceConnectException 
	 * @throws PersistenceException 
	 * 
	 */
	public ENMolShortList synchronizeENMolsWithFinCollection(boolean addOSMols) throws DatasourceConnectException, PersistenceException {
		Connection energyNetConnection = null;
		Connection finConnection = null;
		try {
			synchronized(SynchronizationMolsLock.class) {
				energyNetConnection = this.connection;
				finConnection = this.getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
				
				Vector<ENMolShort> molsNotInCompendium = new Vector<ENMolShort>();
				
				ENMolDAO molDao = new ENMolDAO(energyNetConnection, userProfile);
				FINMolDAO finMolDao = new FINMolDAO(finConnection, userProfile);
				OSMolDAO osMolDao = new OSMolDAO(finConnection, userProfile);
				
				/*Инициализация статусов*/
				ENMolStatusDAO statusDao = new ENMolStatusDAO(energyNetConnection, userProfile);
				Hashtable<Integer, String> statusNames = new Hashtable<Integer, String>();
				ENMolStatusShortList listStatuses = statusDao.getScrollableFilteredList((ENMolStatusFilter)null, 0, -1);
				for(ENMolStatusShort status : listStatuses.list) {
					statusNames.put(status.code, status.name);
				}

				FINMolShortList finMolList = finMolDao.getScrollableFilteredList((FINMolFilter)null, 0, -1);
				
				// 17.01.2019 В синхронизацию добавляются МОЛ из основных
				if(addOSMols) {
					OSMolFilter osMolFilter = new OSMolFilter();
					osMolFilter.conditionSQL = " not exists (select 1 from umc_dba.tdivision div1 where div1.id = osmol.kod_mol)";
					OSMolShortList osMolList = osMolDao.getScrollableFilteredList(osMolFilter, 0, -1);
					for(OSMolShort osMol : osMolList.list) 
						finMolList.list.add(FINMolShort.createObjectFromOSMolShort(osMol));					
				}

				
				
				for(FINMolShort finMol : finMolList.list) {
					ENMol mol = molDao.getMolByFinCode(finMol.id);
				    if(mol != null) {
						boolean isStatusChanged = false;
						
					    boolean isFinMolActive = (finMol.state == FKConsts.TDIVISION_STATE_ACTIVE);
						boolean isENMolActive = (mol.statusRef.code == ENMolStatus.VALID);
						if(isFinMolActive != isENMolActive) {
							mol.statusRef.code = this.getENMolStatusValueByFinMolStateValue(finMol.state);
							isStatusChanged = true;
						} else {
							isStatusChanged = false;
						}
						
						boolean isNameChanged = false;
						if(!mol.name.toUpperCase().equals(finMol.text.toUpperCase())) {
							mol.name = finMol.text;
							isNameChanged = true;
						} else {
							isNameChanged = false;
						}
						
						if(isStatusChanged || isNameChanged) {
							molDao.save(mol);		
						}         
				    } else {
				    	ENMolShort molNotInCompendium = new ENMolShort();
				    	molNotInCompendium.finCode = finMol.id;
				    	molNotInCompendium.name = finMol.text;
				    	molNotInCompendium.statusRefCode = this.getENMolStatusValueByFinMolStateValue(finMol.state);
				    	molNotInCompendium.statusRefName = statusNames.get(molNotInCompendium.statusRefCode);
				    	molsNotInCompendium.add(molNotInCompendium);
				    }
				}
				
				ENMolShortList molList = new ENMolShortList();
				molList.setList(molsNotInCompendium);
				molList.totalCount = molsNotInCompendium.size();
				return molList;				
			}			
		} finally {
            try {
                if (energyNetConnection != null && ! energyNetConnection.isClosed()) {
                	energyNetConnection.close();
                	energyNetConnection = null;
                }
            } catch (SQLException e) {
            }
            try {
                if (finConnection != null && ! finConnection.isClosed()) {
                	finConnection.close();
                	finConnection = null;
                }
            } catch (SQLException e) {
            }
			
		}
	}

	public int getFINDocCodeByWorkOrderCode( int molDataCode, int operationTypeCode) throws PersistenceException
	{
		int docCode = Integer.MIN_VALUE;

    	FINDoc2MolDataDAO dao2 = new FINDoc2MolDataDAO(connection, userProfile);
    	FINDoc2MolDataFilter f = new FINDoc2MolDataFilter();
    	f.molData.code = molDataCode;
    	f.finDocTypeRef.code = operationTypeCode;
    	FINDoc2MolDataShortList l = dao2.getScrollableFilteredList(f,0,-1);

		if (l.totalCount == 0){
			throw new EnergyproSystemException("FINDoc codes not found for MOLData-WorkOrder. MOLDataCode = " + molDataCode + " , operationType = "+operationTypeCode);
		}
		docCode = l.get(0).finDocCode;

		return docCode;
	}

	public int[] getMOLDataArrayByWorkOrderCode(int workOrderCode) throws PersistenceException
	{
        FINMolDataFilter mdFilter = new FINMolDataFilter();
        //mdFilter.conditionSQL = "code in (select  moldatacode from findoc2moldata where workordercode = "+ workOrderCode +")";
        mdFilter.workOrder.code = workOrderCode;
        FINMolDataDAO molDAO = new FINMolDataDAO(connection, userProfile);
        int[] molArr = molDAO.getFilteredCodeArray(mdFilter, 0, -1);
        return molArr;
	}

	public void removeMOLData(int molDataCode, int workOrderCode_NOUSED)
	{
		Connection enConn = null;
	    try
	     {
	    	finConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	    	enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
	    	FINLogic fLogic = new FINLogic(finConnection, userProfile);
	    	FKLogic2 fkLogic2 = new FKLogic2(finConnection, userProfile);
	    	AXTransactionsLogic axLogic = new AXTransactionsLogic(enConn, userProfile);
	    	FINMolDataDAO dao = new FINMolDataDAO(connection, userProfile);

	    	//FINMolData mol = dao.getObject(molDataCode);

	    	FINDoc2MolDataDAO dao2 = new FINDoc2MolDataDAO(connection, userProfile);
	    	FINDoc2MolDataFilter f = new FINDoc2MolDataFilter();
	    	f.molData.code = molDataCode;

	    	WorkOrderLogic wrkOrderLogic = new WorkOrderLogic(connection, userProfile);
	    	ENWorkOrder workOrder = wrkOrderLogic.getWorkOrderByMolDataCode(molDataCode);

	    	PlanWorkLogic planWorkLogic = new PlanWorkLogic(connection, userProfile);
		    ENPlanWork planWork = planWorkLogic.getPlanByWorkOrderCode(workOrder.code);

	    	int opType = Integer.MIN_VALUE;

	    	/* AS 18.03.2011 ... а остатки от старых 28-х надо бы поудалять ;)
	    	*/
	    	//f.workOrder.code = workOrderCode;
	    	f.molData.code = molDataCode;
	    	// 02.12.11 if (planWork.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION){
	    	if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
	    			|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
	    			|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS)
	    	{
	    	    f.finDocTypeRef.code = FINDocType.MOVE_28_332;
	    	}
	    	else
	    	if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
	    	{
	    	    f.finDocTypeRef.code = FINDocType.MOVE_28_292;
	    	}
	    	else
	    	{
	    	    f.finDocTypeRef.code = FINDocType.MOVE_28_302;
	    	}

	    	FINDoc2MolDataShortList list = dao2.getScrollableFilteredList(f,0,-1);
	    	for (int i=0; i<list.totalCount; i++){
	    		//AS 18.03.2011 opType = fLogic.getFINOperationCodeByTypeCode(list.get(i).finDocTypeRefCode, list.get(i).molDataTypeRefCode);
	    		//AS 18.03.2011 fLogic.removeDoc(list.get(i).finDocCode, opType);
	    		dao2.remove(list.get(i).code);
	    	}

	    	//if (planWork.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION){
	    	if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
	    			|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
	    			|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS)
	    	{
	    	    f.finDocTypeRef.code = FINDocType.MOVE_332;
	    	}
	    	else
	    	if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
	    	{
	    	    f.finDocTypeRef.code = FINDocType.MOVE_292;
	    	}
	    	else
	    	{
	    	    f.finDocTypeRef.code = FINDocType.MOVE_302;
	    	}

	    	list = dao2.getScrollableFilteredList(f,0,-1);

	    	for (int i=0; i<list.totalCount; i++){
	    		opType = fLogic.getFINOperationCodeByTypeCode(list.get(i).finDocTypeRefCode, list.get(i).molDataTypeRefCode);
	    		fLogic.validateDocStatus(list.get(i).finDocCode, opType);
	    		//fLogic.fuckingBUH(list.get(i).finDocCode, false);
	    		fkLogic2.Drop_Document(list.get(i).finDocCode);
	    		//removeDoc(list.get(i).finDocCode, opType);
	    		dao2.remove(list.get(i).code);

	    		// &&&&&&&&&&&&&&mdax удалим документ из AX  removeDocumentMDAXWriteOff
	    		if (list.get(i).axJournalId != null && !list.get(i).axJournalId.equals("") ) {
	    		    	JournalAction journalAction = new JournalAction();
	  					journalAction.journalTableDelete(list.get(i).axJournalId,
	  							axLogic.getUserSecurity().domainUserName,
	  							axLogic.getUserSecurity().userPass);

	    		}
	    	}

	    	// типа обнулить ссылку в ФИНМатериалсах ..
	    	// но типа оно сюда не дойдет ... вывалиться

	    	dao.remove(molDataCode);

	     }
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    catch (DatasourceConnectException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally
	    {
			try {
				if (finConnection != null && ! finConnection.isClosed()) {
					finConnection.close();
					finConnection = null;
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

	/**
	 *
	 * Возвращает лист объектов FINDoc2MolData связанных с планом
	 *
	 * @param plan заданный план
	 * @return лист объектов FINDoc2MolData
	 * @throws PersistenceException
	 */
	public List<FINDoc2MolData> getListOfFINDoc2MolData(ENPlanWork plan) throws PersistenceException {
		ENWorkOrder2ENPlanWorkDAO order2PlanDao = new ENWorkOrder2ENPlanWorkDAO(connection, userProfile);
		FINMolDataDAO molDataDao = new FINMolDataDAO(connection, userProfile);
		FINDoc2MolDataDAO finDoc2MolDao = new FINDoc2MolDataDAO(connection, userProfile);

	    ArrayList<FINDoc2MolData> list = new ArrayList<FINDoc2MolData>();

	    ENWorkOrder2ENPlanWorkFilter order2PlanFilter = new ENWorkOrder2ENPlanWorkFilter();
	    order2PlanFilter.plan.code = plan.code;
	    ENWorkOrder2ENPlanWorkShortList order2PlanList = order2PlanDao.getScrollableFilteredList(order2PlanFilter, 0, -1);
	    for(ENWorkOrder2ENPlanWorkShort order2Plan : order2PlanList.list) {
	        FINMolDataFilter molDataFilter = new FINMolDataFilter();
	        molDataFilter.workOrder.code = order2Plan.workOrderCode;
	        int[] molDataCodes = molDataDao.getFilteredCodeArray(molDataFilter, 0, -1);
	        for(int molDataCode : molDataCodes) {
	            FINDoc2MolDataFilter finDoc2MolFilter = new FINDoc2MolDataFilter();
	            finDoc2MolFilter.molData.code = molDataCode;
	            int[] finDoc2MolCodes = finDoc2MolDao.getFilteredCodeArray(finDoc2MolFilter, 0, -1);
	            for(int finDoc2MolCode : finDoc2MolCodes) {
	                FINDoc2MolData obj = finDoc2MolDao.getObject(finDoc2MolCode);
	                list.add(obj);
	            }
	        }
	    }

	    return list;
	}

	public void checkMOLCount(int parentCode, int parentTypeCode , FINMolData molData) throws PersistenceException
	{

		FINMolDataDAO objectDAO = new FINMolDataDAO(connection, userProfile);

	     FINMolDataFilter molDataFilter = new FINMolDataFilter();
	     molDataFilter.molTypeRef.code = molData.molTypeRef.code;

	     // типа мастер пока один ...


	         if (parentTypeCode == 1){
	             //molDataFilter.conditionSQL = "finmoldata.code in (select FINDOC2MOLDATA.MOLDATACODE from FINDOC2MOLDATA where FINDOC2MOLDATA.WORKORDERCODE = "+ parentCode+")";
	        	 molDataFilter.workOrder.code = parentCode;
	         }
	         else
	         if (parentTypeCode == 2){
	        	 //molDataFilter.conditionSQL = "finmoldata.code in (select FINDOC2MOLDATA.MOLDATACODE from FINDOC2MOLDATA where FINDOC2MOLDATA.ACTCODE = "+ parentCode+")";
	        	 molDataFilter.act.code = parentCode;
	         }
	         else
	         {
	        	 throw new EnergyproSystemException("НЕизвестный тип (parentTypeCode) для checkMOLCount, parentTypeCode = " + parentTypeCode);
	         }

	         if (molData != null)
		        molDataFilter.conditionSQL = " code <> " + molData.code;

	         if (molData.molTypeRef.code == FINMolType.MASTER){
	         int[] molDataArr = objectDAO.getFilteredCodeArray(molDataFilter, 0, -1);

		         if (molDataArr.length > 0){
		        	 throw new EnergyproSystemException("Один мастер уже есть на "+ ((parentTypeCode == 1) ? "наряде " : "Акте") +".");
		         }
	         }

		     molDataFilter = new FINMolDataFilter();
		     molDataFilter.molTypeRef.code = molData.molTypeRef.code;
	         molDataFilter.finMolCode = molData.finMolCode;
	         if (parentTypeCode == 1){
	             //molDataFilter.conditionSQL = "finmoldata.code in (select FINDOC2MOLDATA.MOLDATACODE from FINDOC2MOLDATA where FINDOC2MOLDATA.WORKORDERCODE = "+ parentCode+")";
	        	 molDataFilter.workOrder.code = parentCode;

	         }
	         else{
	        	 //molDataFilter.conditionSQL = "finmoldata.code in (select FINDOC2MOLDATA.MOLDATACODE from FINDOC2MOLDATA where FINDOC2MOLDATA.ACTCODE = "+ parentCode+")";
	        	 molDataFilter.act.code = parentCode;
	         }

	         if (molData != null)
			        molDataFilter.conditionSQL = " code <> " + molData.code;

	         int[] molDataArr = objectDAO.getFilteredCodeArray(molDataFilter, 0, -1);

	         if (molDataArr.length > 0){
	        	 throw new EnergyproSystemException("Такой МОЛ (" + molData.finMolCode + " " +  molData.finMolName + ") c таким же типом уже есть ");
	         }

	}

	/**
	 *
	 * Возвратит четырехзначный код МОЛ кладовщика по первым двум цыфрам
	 *
	 * @param mask первые две цифры для выбора МОЛ
	 * @param exceptionIfMoreThanOne если будет найдено более одной записи с МОЛ, то будет выброшено исключение
	 * @return 4значный код МОЛ или {@code null} если не было найдено
	 * @throws PersistenceException
	 */
	public String getMolCodeStoreKeeperByMask(String mask, boolean exceptionIfMoreThanOne) throws PersistenceException {
		if(mask == null) {
			throw new java.lang.NullPointerException("mask is null");
		}
		if(mask.length() != 2 || !Tools.checkIfStringConsistsOfDigits(mask)) {
			throw new SystemException(String.format("Неправильна умова для пошуку МВО: %s", mask));
		}
		String out = null;
        ENMolFilter molFilter = new ENMolFilter();
        molFilter.statusRef.code = ENMolStatus.VALID;
        molFilter.finCode = mask + "*";
        molFilter.conditionSQL = String.format("%s in (?,?)", ENMol.typeRef_QFielld);

        Vector<Object> bindedObjects = new Vector<Object>();
        bindedObjects.add(ENMolType.STOREKEEPER);
        bindedObjects.add(ENMolType.STOREKEEPER_CENTRAL);

        ENMolDAO dao = new ENMolDAO(connection, userProfile);
        ENMolShortList molList = dao.getScrollableFilteredList(molFilter, 0, -1, bindedObjects);

        if(molList.totalCount > 1 && exceptionIfMoreThanOne) {
        	throw new SystemException(String.format("Неможливо визначити МВО комірника за умовами (\"%s\"). Знайдено %d МВО", mask, molList.totalCount));
        }

        if(molList.totalCount > 0) {
        	out = molList.get(0).finCode;
        }

        return out;
	}
	/*
	 * возвращает аксаптовый айди журнала по molDataCode
	 *
	 * */
	public String getAxJournalIdByWorkOrderCode( int molDataCode, int operationTypeCode) throws PersistenceException
	{
		String axJournalI = "";

    	FINDoc2MolDataDAO dao2 = new FINDoc2MolDataDAO(connection, userProfile);
    	FINDoc2MolDataFilter f = new FINDoc2MolDataFilter();
    	f.molData.code = molDataCode;
    	f.finDocTypeRef.code = operationTypeCode;
    	FINDoc2MolDataShortList l = dao2.getScrollableFilteredList(f,0,-1);

		if (l.totalCount == 0){
			throw new EnergyproSystemException("tAxJournalI codes not found for MOLData-WorkOrder. MOLDataCode = " + molDataCode + " , operationType = "+operationTypeCode);
		}
		axJournalI = l.get(0).axJournalId;

		return axJournalI;
	}

	  public FINMolLogic(Connection connection, UserProfile userProfile)
	  {
	    super(connection, userProfile);
	  }

		private java.sql.Connection finConnection = null;
		private java.sql.Connection enConnection = null;

		protected java.sql.Connection getConnection_(String dataSourceName) throws DatasourceConnectException
		{
		try {
		if (finConnection != null && ! finConnection.isClosed()) {
			return finConnection;
		}

		InitialContext initialContext = new InitialContext();
		DataSource dataSource = (DataSource) initialContext
				.lookup(dataSourceName);
		finConnection = dataSource.getConnection();
		return finConnection;
		} catch (NamingException e) {
		throw new DatasourceConnectException(dataSourceName, e);
		} catch (SQLException e) {
		throw new DatasourceConnectException(dataSourceName, e);
		}
		}
}
