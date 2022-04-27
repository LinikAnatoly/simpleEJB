
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENPlanWorkItem2Graph;
 *
 */

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENPlanCorrectHistoryDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItem2GraphDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.ejb.generated.ENPlanWorkItem2GraphControllerEJBGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkItem2Graph;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemShort;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkItem2GraphShort;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkItemShort;
import com.ksoe.energynet.valueobject.filter.ENPlanCorrectHistoryFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItem2GraphFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItem2GraphShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKTechCardDAO;
import com.ksoe.techcard.valueobject.TKTechCard;

public class ENPlanWorkItem2GraphControllerEJB extends
		ENPlanWorkItem2GraphControllerEJBGen {

	public ENPlanWorkItem2GraphControllerEJB() {
	}
	
	/* ENPlanWorkItem2Graph. Получить список для просмотра по фильтру */
	public ENPlanWorkItem2GraphShortList getScrollableFilteredListGraph(
			ENPlanWorkItem2GraphFilter filterObject) {
		try {
			ENPlanWorkItem2GraphDAO objectDAO = new ENPlanWorkItem2GraphDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getScrollableFilteredListGraph(filterObject);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get list of {%com.ksoe.energynet.valueobject.ENPlanWorkItem2Graph%} objects.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	// редактирование графика
	public void editENPlanWorkItem2Graph(ENPlanWorkItem2GraphShort[] pi2grList) {
		try {

			int month = Tools.getMonth(pi2grList[0].dayWork);
			
			// если из месячного сделан Задание План то запрет на внесние графика 
			
			ENPlanCorrectHistoryDAO hhDAO = new ENPlanCorrectHistoryDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENPlanWorkItem2GraphDAO objectDAO = new ENPlanWorkItem2GraphDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			TKTechCardDAO tkdDAO = new TKTechCardDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENPlanCorrectHistoryFilter hhFilter = new ENPlanCorrectHistoryFilter();
			hhFilter.planOldRef.code = pi2grList[0].planWorkRefCode;
			hhFilter.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;
			
			int[] plHHArr = hhDAO.getFilteredCodeArray(hhFilter, 0, -1);
			
			if (plHHArr.length > 0 ) {
				 throw new EnergyproSystemException("\n Редагування графіку неможливе... Вже складені \"Завдання План\"   " );
			}
			
			//!!!!!! удаление записей по работам по месяцу который заехал в листе
			objectDAO.removeGrafikByPlanworkAndMonth(pi2grList);
			
			//!!!!!! вставка графика 
			for (int i = 0; i < pi2grList.length; i++) {
				
			   if (pi2grList[i].planWorkItemRefCode != Integer.MIN_VALUE ){
				    ENPlanWorkItem2Graph pi2grObj = new ENPlanWorkItem2Graph();
					pi2grObj.code = Integer.MIN_VALUE;
					pi2grObj.planWorkRef.code  = pi2grList[i].planWorkRefCode;
					pi2grObj.planWorkItemRef.code  = pi2grList[i].planWorkItemRefCode;
					pi2grObj.dayWork = pi2grList[i].dayWork;
					pi2grObj.userGen = getUserProfile().userName;
					pi2grObj.dateEdit = new Date();
					pi2grObj.countgen = pi2grList[i].countgen;
					
					objectDAO.add(pi2grObj); 
			   }	
			}
			
			// проверка  что бы кол-во работ по графику не превішало кол-во работ в месячном плане 
			ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
			piFilter.planRef.code = pi2grList[0].planWorkRefCode;
			int[] piArr = piDAO.getFilteredCodeArray(piFilter, 0, -1);
			
			
			for (int pi = 0; pi < piArr.length; pi++) {
			   ENPlanWorkItem piObj = piDAO.getObject(piArr[pi]); 
			   ENPlanWorkItem2GraphFilter pi2grfil = new ENPlanWorkItem2GraphFilter();
			   pi2grfil.planWorkRef.code = pi2grList[0].planWorkRefCode;
			   pi2grfil.planWorkItemRef.code = piObj.code;
			   int[] pi2grArr = objectDAO.getFilteredCodeArray(pi2grfil, 0, -1);
			   BigDecimal countWorkItemByGraph = new BigDecimal(0);
			   
			   for (int pii2gr = 0; pii2gr < pi2grArr.length; pii2gr++) {
				   ENPlanWorkItem2Graph pii2grObj = objectDAO.getObject(pi2grArr[pii2gr]);
				   countWorkItemByGraph = countWorkItemByGraph.add(pii2grObj.countgen);
			    }
			  
			   if (piObj.countGen.setScale(3, BigDecimal.ROUND_HALF_UP ).doubleValue() <  countWorkItemByGraph.setScale(3, BigDecimal.ROUND_HALF_UP ).doubleValue() ){
				   TKTechCard tkObj = tkdDAO.getObject(piObj.kartaRef.code);
				   throw new EnergyproSystemException("\n Кількість роботи (" + countWorkItemByGraph.setScale(3, BigDecimal.ROUND_HALF_UP ) + ") роботи по графіку("+ tkObj.name +") перевищує кількість ("+ piObj.countGen.setScale(3, BigDecimal.ROUND_HALF_UP ) +") роботи у Місячному плані"   );
			   }
			   
			}
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get list of {%com.ksoe.energynet.valueobject.ENPlanWorkItem2Graph%} objects.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	
	public void closePlanWorkWithParamsOnGraph( int planWorkRefCode,
            String masterCode,
            String masterName,
            String mechanicCode,
            String mechanicName) {
		
		try {
			
			ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENPlanCorrectHistoryDAO hhDAO = new ENPlanCorrectHistoryDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENPlanWorkItem2GraphDAO objectDAO = new ENPlanWorkItem2GraphDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENPlanWorkItem2GraphDAO pl2grDAO = new ENPlanWorkItem2GraphDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			Context context = new InitialContext();
            Object objWoRef = context.lookup(ENPlanWorkController.JNDI_NAME);
            ENPlanWorkControllerHome woHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(objWoRef, ENPlanWorkControllerHome.class);
            ENPlanWorkController planController = woHome.create();
			
			ENPlanWorkItem2GraphShortList pl2grList = pl2grDAO.getGroupListGraphByDays(planWorkRefCode);
			for (int i = 0; i < pl2grList.totalCount; i++) {
				
				// цикл по работам из плана 
				ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
				piFilter.planRef.code = planWorkRefCode;
				int[] piArr = piDAO.getFilteredCodeArray(piFilter, 0, -1);
				
				Vector<ENPlanWorkItemShort> itemVector = new Vector<ENPlanWorkItemShort>(); 
				
				for (int pi = 0; pi < piArr.length; pi++) {
				 ENPlanWorkItem piObj = piDAO.getObject(piArr[pi]);
				 
				    ENPlanWorkItem2GraphFilter pl2grFil = new ENPlanWorkItem2GraphFilter();
					pl2grFil.planWorkRef.code = planWorkRefCode;
					pl2grFil.planWorkItemRef.code = piObj.code;
					pl2grFil.dayWork = pl2grList.get(i).dayWork;

					
					int[] pl2grArr = pl2grDAO.getFilteredCodeArray(pl2grFil, 0, -1);
					
					BigDecimal countWorkInGraph = new BigDecimal(0);
					
					if( pl2grArr.length > 0 ){
						ENPlanWorkItem2Graph pl2gr = pl2grDAO.getObject(pl2grArr[0]);
						if(pl2gr.countgen.doubleValue() > 0 ){
							 // если есть данные что работа запланирована по графику то берем кол-во с графика 
							    countWorkInGraph = pl2gr.countgen; 
						}
					}
					
					// arr 
					ENPlanWorkItemShort piShort = new ENPlanWorkItemShort();
					piShort.kartaRefCode = piObj.kartaRef.code;
					piShort.countGen = countWorkInGraph.setScale(3, BigDecimal.ROUND_HALF_UP);
	                itemVector.add(piShort);
				}
				
				
				ENPlanWorkItemShort[] planWorkItemArr = new ENPlanWorkItemShort[itemVector.size()];
	            for (int j = 0; j < itemVector.size(); j++ ) {
	            	planWorkItemArr[j] = (ENPlanWorkItemShort) itemVector.get(j);
	            }
				
				// создание планов по дням с работами больше 0
				
				
                planController.closePlanWorkWithParams(planWorkRefCode, pl2grList.get(i).dayWork,  masterCode, masterName, mechanicCode, mechanicName, planWorkItemArr);
				
			}
			
			
		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't get list of {%com.ksoe.energynet.valueobject.ENPlanWorkItem2Graph%} objects.", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		}catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		}catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}
		finally {
			closeConnection();
		}
	}


} // end of EJB Controller for ENPlanWorkItem2Graph