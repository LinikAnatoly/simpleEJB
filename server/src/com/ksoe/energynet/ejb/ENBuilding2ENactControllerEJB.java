
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENBuilding2ENact;
 *
 */

import java.math.BigDecimal;
import java.text.SimpleDateFormat;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENBuilding2ENactDAO;
import com.ksoe.energynet.dataminer.ENBuilding2ServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENBuildingDAO;
import com.ksoe.energynet.dataminer.ENGeneralContractsDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENBuilding2ENactControllerEJBGen;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENBuilding;
import com.ksoe.energynet.valueobject.ENBuilding2ActTypeWork;
import com.ksoe.energynet.valueobject.ENBuilding2ENact;
import com.ksoe.energynet.valueobject.ENBuildingStatus;
import com.ksoe.energynet.valueobject.ENGeneralContracts;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.filter.ENBuilding2ENactFilter;
import com.ksoe.energynet.valueobject.filter.ENBuilding2ServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENBuilding2ENactShortList;
import com.ksoe.energynet.valueobject.lists.ENBuilding2ServicesObjectShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.rqorder.dataminer.RQFKOrder2PlanFactDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItemDAO;
import com.ksoe.rqorder.valueobject.RQFKOrderItem;
import com.ksoe.rqorder.valueobject.filter.RQFKOrder2PlanFactFilter;
import com.ksoe.rqorder.valueobject.lists.RQFKOrder2PlanFactShortList;

public class ENBuilding2ENactControllerEJB extends
		ENBuilding2ENactControllerEJBGen {

	public ENBuilding2ENactControllerEJB() {
	}
	
	
	/* ENBuilding2ENact. Добавить */
	public int add(ENBuilding2ENact object) {
		try {
			ENBuilding2ENactDAO objectDAO = new ENBuilding2ENactDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENBuildingDAO bDAO = new ENBuildingDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENActDAO actDAO = new ENActDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO plDao = new ENPlanWorkDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServicesObjectDAO soDao = new ENServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENGeneralContractsDAO genContractDAO = new ENGeneralContractsDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ActLogic actLogic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
			RQFKOrder2PlanFactDAO fo2plDAO = new RQFKOrder2PlanFactDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            RQFKOrderItemDAO fiDAO = new RQFKOrderItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            ENBuilding2ServicesObjectDAO b2sDAO = new ENBuilding2ServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            
            
            if (object.isActFromEnergyNET == null  ){
            	throw new SystemException(" Не вказаний спосіб додавання акту !!! ");
            }
            
            
            
			if (object.actRef.code != Integer.MIN_VALUE){
				ENAct actObj = actDAO.getObject(object.actRef.code);
				
				if(actObj.statusRef.code != ENActStatus.CLOSED){
					
		            throw new SystemException(" Акт не проведений !!! ");
		            
				}
				
				ENBuilding bObject = bDAO.getObject(object.ENBuildingRef.code);
				
				
				
				ENBuilding2ServicesObjectFilter b2sFil = new ENBuilding2ServicesObjectFilter();
				b2sFil.ENBuildingRef.code = bObject.code;
				ENBuilding2ServicesObjectShortList b2slist = b2sDAO.getScrollableFilteredList(b2sFil, 0, -1);

				if(actObj.actTypeRef.code != ENPlanWorkState.CAPITAL_BUILDER && actObj.actTypeRef.code != ENPlanWorkState.CAPITAL_REPAIR 
						&& b2slist.totalCount == 0 ){
					
		            throw new SystemException(" Тип акту повинен бути  'Капітальний ремонт' або 'Капітальне будівництво' !!! ");
		            
				}
				
				ENBuilding2ENactFilter b2aFil = new ENBuilding2ENactFilter();
	            b2aFil.actRef.code = actObj.code;
	            int[] b2aArr = objectDAO.getFilteredCodeArray(b2aFil, 0, -1);
	            if(b2aArr.length>0){
	            	ENBuilding2ENact b2aObj = objectDAO.getObject(b2aArr[0]); 
	            	ENBuilding bObj = bDAO.getObject(b2aObj.ENBuildingRef.code);
	            	throw new SystemException(" Акт вже доданий раніше до ОЗ-1 № " + bObj.numbergen + " від "+ new SimpleDateFormat("dd.MM.yyyy").format(bObj.dateGen).toString()   +"!!! ");
	            }
				
				object.actDate = actObj.dateAct; 
				object.actNumber = actObj.numberGen;
				object.isActFromEnergyNET = true;
				
			
			/***************** определение инвест  не инвест */
	         boolean isInvest = false;
	         ENPlanWorkFilter plFilter = new ENPlanWorkFilter();
	         plFilter.conditionSQL = " enplanwork.code = ( select p.code from enact2enplanwork a2p , enplanwork p \n" +
											" where a2p.actrefcode = " + object.actRef.code +
											" and a2p.plancode = p.code  \n" +
											" and p.typerefcode in (" +ENPlanWorkType.INVEST + ","+ ENPlanWorkType.SERVICES_FROM_SIDE_INVEST + ") \n" +
											" limit 1  ) " ;
	         int[] plIPArr = plDao.getFilteredCodeArrayNOSEGR(plFilter, 0, -1);
	         if (plIPArr.length > 0 ){
	        	 isInvest = true;
	         }
	         
	       /// объект услуг на сторону
        	ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
        	soFilter.conditionSQL = " enservicesobject.code in ( \n"+
        			 " select so.code from enact2enplanwork a2p , entechcond2planwork tc2p , enservicesobject2techcondtnsservices s2tc , enservicesobject so \n"+
 				 "	where a2p.actrefcode = " + object.actRef.code +
 				 "	and a2p.plancode= tc2p.planrefcode \n"+
 				 "	and tc2p.techconservicesrefcode = s2tc.techcondservrefcode \n"+
 				 "	and s2tc.servicesobjectrefcode = so.code  " +
 				 " and so.code = enservicesobject.code   \n"+
 				 " union \n"+
 				 " select so.code from enact act , enservicesobject so \n"+
 				 " where act.code = " + object.actRef.code +
 				 " and   act.elementcode = so.elementcode \n"+
        			 " limit 1 )" ;

	        	int[] soArr = soDao.getFilteredCodeArrayNOSEGR(soFilter, 0, -1);
	        	

	        	ENServicesObject soObj = null; 
	        	ENGeneralContracts genContract = null;

	        	if (soArr.length > 0 ){
	        		soObj = soDao.getObject(soArr[0]);
	        		genContract = genContractDAO.getObject(soObj.generalContractRef.code);

	        	}

	         /******** договора партнеры */

	        String partnerCode = "";
	        	
	     	String finDocCode = "";
	     	String contractNumber = "";

	     	String axPartnerCode = "";
	     	String axContractCode = ""; 
	     	String axContractNumber = "";
	     	String axContractAccount = ""; 
	     	if ( genContract != null ){


	     		partnerCode = genContract.partnerCode;
	         	finDocCode = genContract.finDocCode;
	         	contractNumber = genContract.contractNumber;

	         	axPartnerCode = genContract.axPartnerCode;
	         	axContractCode = genContract.axContractCode;
	         	axContractNumber = genContract.axContractNumber;
	         	axContractAccount = genContract.axContractAccount;
	         	
	         	object.finContractNumber = contractNumber;
	         	object.finContractDate = genContract.contractDate;
	         	
	         	object.partnerCode = genContract.partnerCode;
	         	object.partnerName = genContract.partnerName;
	         	
	         	object.ENBuilding2ActTypeWorkRef.code = ENBuilding2ActTypeWork.ENBUILDING2ACTTYPEWORK_PRICONNECTION;
	         
	     	} else {
	     		if(isInvest){
	     			object.ENBuilding2ActTypeWorkRef.code = ENBuilding2ActTypeWork.ENBUILDING2ACTTYPEWORK_INVESTPROGRAM;
	     		}
	     	}
			
	     	
	     	
	     	// посчитать сумму по акту 
	     	// zzzzz
 
	     	BigDecimal sumGenByAct = new BigDecimal(0);
	     	BigDecimal sumNdsByAct = new BigDecimal(0);
	     	
	     	 /* акт может быть на услуги со стороны, по услугам на сторону или наши работы */
	        
	        RQFKOrder2PlanFactFilter fo2plFilter = new RQFKOrder2PlanFactFilter();
	        fo2plFilter.act.code = object.actRef.code;
	        RQFKOrder2PlanFactShortList fo2plList = fo2plDAO.getScrollableFilteredList(fo2plFilter, 0, -1);

	        if (fo2plList.totalCount > 0) {


	        	for (int f = 0; f < fo2plList.totalCount; f++) {
	        		RQFKOrderItem fiObj = fiDAO.getObject(fo2plList.get(f).fkorderItemCode);
	        		
	        		
	        		sumGenByAct = sumGenByAct.add(fiObj.sumWithoutNds);
	        		sumNdsByAct = sumNdsByAct.add(fiObj.sumNds);
				}
	        	
	        	
	        	
	        } else {
	        	sumGenByAct = actLogic.getSumByActCode( object.actRef.code );	
	        }
	        
	     	
	     	
	     	object.sumGen = sumGenByAct;
	     	object.sumNds = sumNdsByAct;
	     	
	     	
	     	
	     	
			} else /*акты без EnergyNET*/ {
				object.isActFromEnergyNET = false;
				object.ENBuilding2ActTypeWorkRef.code = ENBuilding2ActTypeWork.ENBUILDING2ACTTYPEWORK_OTHER;
				object.isCalculationDate = 0;
			}

			int enBuilding2EnactCode =  objectDAO.add(object);
			
			this.recalcSumInOZ1(object.ENBuildingRef.code);
			
		    return enBuilding2EnactCode;
		    
		     
		    
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENBuilding2ENact%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	public void recalcSumInOZ1(int bCode) throws PersistenceException {
		try{
	     // пересчитаем общую сумму по всем актам относящихся к документу ОЗ1.
	        ENBuildingDAO bDAO = new ENBuildingDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        ENBuilding2ENactDAO b2actDAO = new ENBuilding2ENactDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        ENBuilding2ENactFilter b2actFilter = new ENBuilding2ENactFilter();
	        b2actFilter.ENBuildingRef.code = bCode;
	        ENBuilding2ENactShortList b2actList = b2actDAO.getScrollableFilteredList(b2actFilter, 0, -1);
	       
	        BigDecimal sumByAllActWithoutNDS = new BigDecimal(0);
	        BigDecimal sumByAllActNDS = new BigDecimal(0);
	        ENBuilding bObj = bDAO.getObject(bCode);

	        if (bObj == null){
	            throw new SystemException(
	            "Помилка при додаванні акту!!! ");
	        }

	                for (int j = 0; j < b2actList.totalCount; j++) {

	                    sumByAllActWithoutNDS  = sumByAllActWithoutNDS.add(b2actList.get(j).sumGen);
	                    sumByAllActNDS = sumByAllActNDS.add(b2actList.get(j).sumNds);
	                }
	                bObj.summaGen = sumByAllActWithoutNDS;
	                bObj.summaNDS = sumByAllActNDS;

	                bDAO.updateSumGenAndNDS(bObj);
	                if (bObj.finContractNumber == null ){
	                    bDAO.setContractpriceAsSummaGen(bObj);
	                }

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENBuilding2ENact%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	    }
	
	
	/* ENBuilding2ENact. Изменить */
	public void save(ENBuilding2ENact object) {
		try {
			ENBuilding2ENactDAO objectDAO = new ENBuilding2ENactDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

		    objectDAO.save(object);
		    
		    this.recalcSumInOZ1(object.ENBuildingRef.code);
		    
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENBuilding2ENact%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	/* ENBuilding2ENact. Удалить */
	public void remove(int code) {
		try {
			ENBuilding2ENactDAO objectDAO = new ENBuilding2ENactDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENBuilding2ENactDAO b2actDAO = new ENBuilding2ENactDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENBuilding2ENactFilter b2actFilter = new ENBuilding2ENactFilter();
	        b2actFilter.code = code;
	        ENBuilding2ENactShortList b2actList = b2actDAO.getScrollableFilteredList(b2actFilter, 0, -1);
	        
	        if(b2actList.totalCount == 0){
	        	throw new SystemException(
						"Об`єкт оз-1 не знайдено ");
	        }
	        int ENBuilderObjectCode = b2actList.get(0).ENBuildingRefCode;
	       
	        
			objectDAO.remove(code);
			
			this.recalcSumInOZ1(ENBuilderObjectCode);
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENBuilding2ENact%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENBuilding2ENact