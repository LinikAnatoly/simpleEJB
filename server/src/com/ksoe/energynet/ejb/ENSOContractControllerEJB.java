
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENSOContract;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENSOContractDAO;
import com.ksoe.energynet.dataminer.ENServicesObject2TechCondtnsServicesDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTechCond2PlanWorkDAO;
import com.ksoe.energynet.dataminer.FINContractsDAO;
import com.ksoe.energynet.ejb.generated.ENSOContractControllerEJBGen;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENSOContract;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesObject2TechCondtnsServices;
import com.ksoe.energynet.valueobject.FINContracts;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENSOContractFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENTechCond2PlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENSOContractShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2TechCondtnsServicesShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectShortList;
import com.ksoe.energynet.valueobject.lists.ENTechCond2PlanWorkShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.valueobject.RQOrg;
import com.ksoe.rqorder.valueobject.lists.RQOrgShortList;

public class ENSOContractControllerEJB extends
		ENSOContractControllerEJBGen {
	
	public ENSOContractControllerEJB() {
	}
	
	
	// строка с кодами планов со связки договора по тех условиям
	public String getStrCodePlanFromENtechCond2enplanwork(int codeEnTechConditionsServices) {
		String stringCodePlan="-1";	
		try {
			ENTechCond2PlanWorkDAO objectDAO = new ENTechCond2PlanWorkDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENTechCond2PlanWorkShortList  enTechCond2PlanWorkShortLists = new ENTechCond2PlanWorkShortList();
			ENTechCond2PlanWorkFilter enTechCond2PlanWorkFilter = new ENTechCond2PlanWorkFilter();
			enTechCond2PlanWorkFilter.techConServicesRef.code = codeEnTechConditionsServices;
			
			enTechCond2PlanWorkShortLists = objectDAO.getScrollableFilteredList(enTechCond2PlanWorkFilter, 0, -1);
			
			for (int i=0; i<enTechCond2PlanWorkShortLists.size(); i++){
				if("-1".equals(stringCodePlan)){
					stringCodePlan = String.valueOf(enTechCond2PlanWorkShortLists.get(i).planRefCode);
				}else{
					stringCodePlan = stringCodePlan +","+ String.valueOf(enTechCond2PlanWorkShortLists.get(i).planRefCode);
				}				
			}
		
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get {%com.ksoe.energynet.valueobject.ENTechCond2PlanWork%} object.", e);
		} catch (PersistenceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return stringCodePlan;   		
	}

	
	/**
	 * Добавить договор из ENPlanWork ( поля из фин.кол.: servicesFSideFinId, servicesFSideCnNum) 
	 * по критериям: 
	 * - месячный план
	 * - послуги со стороны 
	 * 
	 * @param servicesConnectionCode - Код (Об"єкти - послуги на сторону)
	 * @param enServicesConnectionElementCode - Код (Элемент сети)
	 * @param codeEnTechConditionsServices - Код из (Договір про виконання технічних умов)
	 */
	public void addFinDocIdFromENPlanWork(int servicesConnectionCode, int enServicesConnectionElementCode, int codeEnTechConditionsServices){
		try {
			String strTechCondPlanCodes = getStrCodePlanFromENtechCond2enplanwork(codeEnTechConditionsServices);
			String nameOrg="";
			ENPlanWorkDAO enPlanWorkDAO = new ENPlanWorkDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			FINContractsDAO finContractsDAO = new FINContractsDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));
			ENSOContractDAO enSOContractDAO = new ENSOContractDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQOrgDAO rqOrgDAO = new RQOrgDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));
			
			ENPlanWorkFilter enPlanWorkFilter = new ENPlanWorkFilter();
			ENPlanWorkShortList enPlanWorkShortLists;
			RQOrgShortList  rqOrgShortList; 						
			FINContracts finContracts;
			FINContracts tempFinContracts = new FINContracts();
			ENSOContract enSOContract;
			ENSOContractShortList enSOContractShortLists = new ENSOContractShortList();
			ENSOContractFilter enSOContractFilter = new ENSOContractFilter();
			
			enSOContractFilter.servicesObjectRef.code = servicesConnectionCode;
			//enSOContractShortLists = enSOContractDAO.getScrollableFilteredList(enSOContractFilter,0,-1);
			
			enPlanWorkFilter.conditionSQL = "(enplanwork.elementrefcode = " + enServicesConnectionElementCode +
                    " or enplanwork.code in (" + strTechCondPlanCodes + "))" +
                    		"AND enplanwork.kindcode = "+ENPlanWorkKind.CURRENT //Місячний
                    		+"AND enplanwork.typerefcode = "+ENPlanWorkType.SERVICES_FROM_SIDE; //Послуги зі сторони
							//+"AND enplanwork.SERVICESFSIDEFINID = "+servicesFSideFinId;
			
			enPlanWorkShortLists = enPlanWorkDAO.getScrollableFilteredList(enPlanWorkFilter, 0, -1);
			
			for (int i=0; i<enPlanWorkShortLists.size(); i++){
				enSOContract = new ENSOContract();
				int servicesFSideFinId = enPlanWorkShortLists.get(i).servicesFSideFinId;		
				
				if(servicesFSideFinId == Integer.MIN_VALUE)
					continue;
		
				finContracts = finContractsDAO.getObjectFromFK(servicesFSideFinId);
				rqOrgShortList = rqOrgDAO.getPartnersListForAgree(servicesFSideFinId);	
								
				nameOrg = rqOrgShortList.get(0).getName();		

				if(finContracts != null){
					enSOContractFilter.finDocID = finContracts.getFinDocID();
					enSOContractShortLists = enSOContractDAO.getScrollableFilteredList(enSOContractFilter,0,-1);		
						if(enSOContractShortLists.size() <=0 ){
							enSOContract.numContractFinCol = finContracts.getContractNumber();
							enSOContract.dateContractFinCol = finContracts.getContractDate();
							enSOContract.namePartnerFinCol = nameOrg;//finContracts.getOrg().name;
							enSOContract.noteContrcatFinCol = finContracts.getDescription();
							enSOContract.finDocID = finContracts.getFinDocID();
							enSOContract.servicesObjectRef.code = servicesConnectionCode;				
							
							enSOContractDAO.add(enSOContract);
						}			
				}		
			}

			
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't get {%com.ksoe.energynet.valueobject.ENSOContract%} object.", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}
		finally {
			closeConnection();
		}
	}
	

} // end of EJB Controller for ENSOContract