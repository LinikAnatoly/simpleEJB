
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.text.SimpleDateFormat;

/**
 * EJB Controller for ENAct2FinKodIst;
 *
 */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAct2FinKodIstDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENServices2PlanDAO;
import com.ksoe.energynet.dataminer.FinKodIstDAO;
import com.ksoe.energynet.dataminer.SCUsageInputDAO;
import com.ksoe.energynet.ejb.generated.ENAct2FinKodIstControllerEJBGen;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2FinKodIst;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.FinKodIst;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.filter.ENAct2FinKodIstFilter;
import com.ksoe.energynet.valueobject.filter.ENActFilter;
import com.ksoe.energynet.valueobject.filter.ENServices2PlanFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2FinKodIstShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENAct2FinKodIstControllerEJB extends
		ENAct2FinKodIstControllerEJBGen {

	public ENAct2FinKodIstControllerEJB() {
	}
	
	public int add(ENAct2FinKodIst object) {
		try {
			ENAct2FinKodIstDAO objectDAO = new ENAct2FinKodIstDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENAct2FinKodIstFilter a2iFilter = new ENAct2FinKodIstFilter();
			a2iFilter.actRef.code = object.actRef.code;
			ENAct2FinKodIstShortList a2iList = objectDAO.getScrollableFilteredList(a2iFilter, 0, -1);
			if (a2iList.totalCount > 0) {
				throw new SystemException("Для цього акту вже вказане джерело для пломб!");
			}
			
			ENActDAO actDAO = new ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENAct actObj = actDAO.getObject(object.actRef.code);
			
			if (actObj.statusRef.code == ENActStatus.CLOSED || 
					actObj.statusRef.code == ENActStatus.REVERSED) {
				throw new SystemException("Акт вже проведено або сторновано!");
			}
			
			// Проверка - нельзя ставить код источника 90 если он не связан с договором услуг на сторону
			// Т.к. потом возникают ошибки из-за нехватки данных при формировании проводок
			this.checkServicesForAct(actObj, object.kodIstRef.code);
			
		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENAct2FinKodIst%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	/**
	 * 
	 * Если код источника равен коду источнику для услуг на сторону
	 * и акт не связан с договором услуг на сторону, то метод вызовет ошибку, что этот
	 * источник возможно использовать только с актами, что связаны с услугами на сторону
	 * 
	 * 
	 * @param act {@link ENAct} акт для установки источника
	 * @param finKodIstCode код источника
	 * @throws DatasourceConnectException
	 * @throws PersistenceException
	 */
	private void checkServicesForAct(ENAct act, int finKodIstCode) throws DatasourceConnectException, PersistenceException {
		ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		ENServices2PlanDAO s2pDAO = new ENServices2PlanDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		ENServicesObject servicesObject = servicesLogic.getServicesObjectByElementCode(act.element.code, false);
		if(servicesObject == null && finKodIstCode == FinKodIst.MAIN_SERVICES) {
			
			// если по елементу не нашли договор то через связзку enservices2plan проверим . SUPP-83331 
			ENServices2PlanFilter s2pfil = new ENServices2PlanFilter();
			s2pfil.conditionSQL = " ENSERVICES2PLAN.planrefcode in (select a2p.plancode from enact2enplanwork a2p where a2p.actrefcode = "+ act.code +") ";
			int[] s2pArr = s2pDAO.getFilteredCodeArray(s2pfil, 0, -1);
			
			if(s2pArr.length==0){
				FinKodIstDAO istDao = new FinKodIstDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
				FinKodIst kodIst = istDao.getObject(finKodIstCode);
				throw new SystemException(String.format("Неможливо використовувати джерело \"%s %s\" для акту № %s від %s, "
						+ "\n що не зв'язаний з договором"
						+ " послуг на сторону", kodIst.value, kodIst.name, act.numberGen, new SimpleDateFormat("dd.MM.yyyy").format(act.dateGen)));
			}
			
		}
		
	}
	
	
	/* ENAct2FinKodIst. Удалить */
	public void remove(int code) {
		try {
			ENAct2FinKodIstDAO objectDAO = new ENAct2FinKodIstDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENAct2FinKodIst obj = objectDAO.getObject(code);
			ENActDAO actDAO = new ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENAct actObj = actDAO.getObject(obj.actRef.code);
			
			if (actObj.statusRef.code == ENActStatus.CLOSED || 
					actObj.statusRef.code == ENActStatus.REVERSED) {
				throw new SystemException("Акт вже проведено або сторновано!");
			}
			
			objectDAO.remove(code);
			
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENAct2FinKodIst%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	public  void setKodIst4Oz(int kodIstCode, int ozCode) {
		try {
			ENAct2FinKodIstDAO objectDAO = new ENAct2FinKodIstDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			FinKodIstDAO fIstDAO = new FinKodIstDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			FinKodIst fIst = fIstDAO.getObject(kodIstCode);
			
			ENActDAO actDAO = new ENActDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENActFilter actFilter = new ENActFilter();
			actFilter.conditionSQL = " code in ( " + 
		      " select scui.enactrefcode " +
		      " from scusageinputitemoz2nct scui, scusageinputitemoz scuii, " + 
		      " scusageinputitem scuseit, scusageinput scuse " +  
		      " where   " +
		      " scui.usageinputitemozrefcod = scuii.code " +
		      " and scuseit.code = scuii.usageinputitemrefcode " +
		      " and scuse.code = scuseit.usageinputrefcode " +
		      " and scuse.code = " + ozCode + ")";
			 int[] actArr = actDAO.getFilteredCodeArray(actFilter, 0, -1);
			
			 if (actArr.length == 0) {
				 throw new SystemException("Для цього акту ОЗ не знайдено актів виконаних робіт");
			 } 
			
			ENAct2FinKodIstFilter a2iFilter = new ENAct2FinKodIstFilter();
				
			 for (int brr=0; actArr.length > brr; brr++) {
				 
				 /// удалим уже установленный источник, если сетят повторно
					a2iFilter.actRef.code = actArr[brr];
					ENAct2FinKodIstShortList a2iList = objectDAO.getScrollableFilteredList(a2iFilter, 0, -1);
				    for (int chh=0;a2iList.totalCount > chh; chh++) {
				    	this.remove(a2iList.get(chh).code);
				    }
				  // установим новый источник
				    ENAct2FinKodIst a2ist = new ENAct2FinKodIst();
				    a2ist.actRef.code = actArr[brr];
				    a2ist.kodIstRef.code = kodIstCode;
				    this.add(a2ist);
				    	    
			 }
			 
			 SCUsageInputDAO scuiDAO = new SCUsageInputDAO(getUserProfile(),
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			 SCUsageInput scuiObj = scuiDAO.getObject(ozCode);
			 scuiObj.commentGen = "Источник для ПЛОМБ на этом ОЗ - " + fIst.value + " - " + fIst.name; 
			 scuiDAO.save(scuiObj);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENAct2FinKodIst%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENAct2FinKodIst