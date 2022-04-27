
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.util.List;
import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENAct2RQFKOrderDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENActIncomServ2ENActDAO;
import com.ksoe.energynet.dataminer.ENActIncomeServicesDAO;
import com.ksoe.energynet.dataminer.ENElement2ActDAO;
import com.ksoe.energynet.dataminer.ENElement2ActTypeDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENServices2PlanDAO;
import com.ksoe.energynet.ejb.generated.ENElement2ActControllerEJBGen;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.ElementLogic;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.ENActIncomServ2ENAct;
import com.ksoe.energynet.valueobject.ENActIncomeServices;
import com.ksoe.energynet.valueobject.ENElement2Act;
import com.ksoe.energynet.valueobject.ENElement2ActType;
import com.ksoe.energynet.valueobject.ENServices2Plan;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2RQFKOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENActIncomServ2ENActFilter;
import com.ksoe.energynet.valueobject.filter.ENActIncomeServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENElement2ActFilter;
import com.ksoe.energynet.valueobject.filter.ENElementFilter;
import com.ksoe.energynet.valueobject.filter.ENServices2PlanFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

/**
 * EJB Controller for ENElement2Act;
 *
 */
public class ENElement2ActControllerEJB extends
		ENElement2ActControllerEJBGen {
	
	private static final long serialVersionUID = 1L;

	public ENElement2ActControllerEJB() {
	}
	
	private void checkENServicesObject2ENActWorks(ENElement2Act object, boolean isAddition) throws DatasourceConnectException, PersistenceException {

		if(object == null || object.actRef == null || object.elementRef == null
				|| object.actRef.code == Integer.MIN_VALUE || object.elementRef.code == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException();
		}

		if(object.typeRef.code != ENElement2ActType.SERVICES_WORKS) {
			return;
		}

		ENActDAO actDao = new ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ENAct2RQFKOrderDAO act2fkOrderDao = new ENAct2RQFKOrderDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
		ENAct2ENPlanWorkDAO act2PlanDao = new ENAct2ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ENServices2PlanDAO services2PlanDao = new ENServices2PlanDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		ENActIncomServ2ENActDAO actIncomeServices2ActDao = new ENActIncomServ2ENActDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		ENActIncomeServicesDAO actIncomeServicesDao = new ENActIncomeServicesDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

		ENServicesObject servicesObject = servicesLogic.getSOByElementCode(object.elementRef.code);

		ENAct act = actDao.getObject(object.actRef.code);

		if(isAddition) {
			ActLogic actLogic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			// Проверка, что акт уже и так не связан с договором через планы
			ENServices2PlanFilter services2PlanFilter = new ENServices2PlanFilter();
			services2PlanFilter.servicesObjectRef.code = servicesObject.code;
			services2PlanFilter.conditionSQL = "ENSERVICES2PLAN.PLANREFCODE in (" + actLogic.getPlanCodesByAct(act.code) + ")";

			List<Integer> planCodes = services2PlanDao.getListOfPropertyValues(String.format("%s::integer", ENServices2Plan.planRef_QFielld)
					, services2PlanFilter, 0, -1, null);

			if(planCodes != null && planCodes.size() > 0) {
				ENAct2ENPlanWorkFilter act2PlanFilter = new ENAct2ENPlanWorkFilter();
				act2PlanFilter.actRef.code = act.code;
				act2PlanFilter.conditionSQL = String.format("%s in (%s)"
						, ENAct2ENPlanWork.plan_QFielld, Tools.repeatSymbol("?", ",", planCodes.size()));

				Vector<Object> params = new Vector<Object>(planCodes);

				if(act2PlanDao.count(act2PlanFilter, params) > 0) {
					throw new SystemException(this.getStringForException(object.elementRef.code, act.code, object.typeRef.code, true));
				}
			}

			ENAct2RQFKOrderFilter act2fkOrderFilter = new ENAct2RQFKOrderFilter();
			act2fkOrderFilter.actRef.code = object.actRef.code;

			int[] act2fkOrderCodes = act2fkOrderDao.getFilteredCodeArray(act2fkOrderFilter, 0, -1);

			if(act2fkOrderCodes.length > 0) {
				throw new SystemException("Акти послуг зі сторони у договори додавайти на вкладці \"Послуги зі сторони\"!");
			}

			// Проверка, что нет еще составленного доходного акта на период расходного акта
			ENActIncomeServicesFilter actIncomeServicesFilter = new ENActIncomeServicesFilter();
			actIncomeServicesFilter.servicesObjectRef.code = servicesObject.code;
			actIncomeServicesFilter.conditionSQL = String.format("? between %s and %s"
					, ENActIncomeServices.actDateStart_QFielld, ENActIncomeServices.actDateEnd_QFielld);

			Vector<Object> actIncomeServicesParams = new Vector<Object>();
			actIncomeServicesParams.add(act.dateAct);

			int[] actIncomeServicesCodes = actIncomeServicesDao.getFilteredCodeArray(actIncomeServicesFilter, 0, -1, actIncomeServicesParams);

			if(actIncomeServicesCodes.length > 0) {
				ENActIncomeServices actIncomeServices = actIncomeServicesDao.getObject(actIncomeServicesCodes[0]);
				throw new SystemException(String.format("На період акту № %s від %s вже складений прибутковий акт № %s від %s.\nДодавання неможливе!"
						, act.numberGen, Tools.dateFormatDefault.format(act.dateAct)
						, actIncomeServices.numberGen, Tools.dateFormatDefault.format(actIncomeServices.dateGen)));
				
			}
		}

		if(!isAddition) {

			ENActIncomServ2ENActFilter actIncomeServices2ActFilter = new ENActIncomServ2ENActFilter();
			actIncomeServices2ActFilter.actRef.code = act.code;

			int[] actIncomeServices2ActCodes = actIncomeServices2ActDao.getFilteredCodeArray(actIncomeServices2ActFilter, 0, -1);

			// При удалении проверка, что акт еще не попал в приходный акт
			for(int actIncomeServices2ActCode : actIncomeServices2ActCodes) {
				ENActIncomServ2ENAct actIncomeServices2Act = actIncomeServices2ActDao.getObject(actIncomeServices2ActCode);
				ENActIncomeServices actIncomeServices = actIncomeServicesDao.getObject(actIncomeServices2Act.actIncomeRef.code);
				if(actIncomeServices.servicesObjectRef.code == servicesObject.code) {
					throw new SystemException(String.format("Акт № %s від %s вже додано у прибутковий акт № %s від %s!\n"
							+ "Видалення неможливе!"
							, act.numberGen, Tools.dateFormatDefault.format(act.dateAct)
							, actIncomeServices.numberGen, Tools.dateFormatDefault.format(actIncomeServices.dateGen)));
				}
			}
		}
	}
	
	public int add(ENElement2Act object) {
		try {
			ENElement2ActDAO objectDAO = new ENElement2ActDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			this.checkDuplication(object);
			this.checkActObject(object);
			
			switch(object.typeRef.code) {
			case ENElement2ActType.SERVICES_WORKS:
				this.checkENServicesObject2ENActWorks(object, true);
				break;
			}

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENElement2Act%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	public void save(ENElement2Act object) {
		throw new SystemException("Цей метод є недоступним!");
	}
	
	public void remove(int elementCode, int actCode, int typeCode) {
		try {
			ENElement2ActDAO objectDAO = new ENElement2ActDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			if(elementCode == Integer.MIN_VALUE) {
				throw new java.lang.NullPointerException("Не заданий елемент!");
			}
			
			if(elementCode == Integer.MIN_VALUE) {
				throw new java.lang.NullPointerException("Не заданий акт!");
			}
			
			if(typeCode == Integer.MIN_VALUE) {
				throw new java.lang.NullPointerException("Не заданий тип зв''язку!");
			}
			
			ENElement2ActFilter filter = new ENElement2ActFilter();
			filter.actRef.code = actCode;
			filter.elementRef.code = elementCode;
			filter.typeRef.code = typeCode;
			
			int[] codes = objectDAO.getFilteredCodeArray(filter, 0, -1);
			
			if(codes.length == 1) {
				
				ENElement2Act object = objectDAO.getObject(codes[0]);
				
				switch(object.typeRef.code) {
				case ENElement2ActType.SERVICES_WORKS:
					this.checkENServicesObject2ENActWorks(object, false);
					break;
					
				}
				
				objectDAO.remove(codes[0]);
			} else {
				if(codes.length == 0) {
					
					throw new SystemException(this.getStringForException(elementCode, actCode, typeCode, false));
					
				} else {
					throw new SystemException(String.format("Помилка у кількості записів для елементу з кодом %d "
							+ "та акту з кодом %d з типом зв'язку %d!"
							, elementCode, actCode, typeCode));
				}
			}

			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENElement2Act%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	private String getStringForException(int elementCode, int actCode, int typeCode, boolean isLinked) 
			throws PersistenceException, DatasourceConnectException {
		ENActDAO actDao = new ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ENElementDAO elementDao = new ENElementDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ElementLogic elementLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		ENElement2ActTypeDAO element2ActTypeDao = new ENElement2ActTypeDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		
		
		
		ENAct act = actDao.getObject(actCode);
		if(act == null) {
			throw new SystemException(String.format("Не знайдено акту з кодом %d!", actCode));
		}
		
		ENElementFilter elementFilter = new ENElementFilter();
		elementFilter.code = elementCode;
		
		if(elementDao.count(elementFilter) == 0) {
			throw new SystemException(String.format("Не знайдено об'єкту з кодом %d!", elementCode));
		}
		
		ENElement2ActType element2ActType = element2ActTypeDao.getObject(typeCode);
		
		if(element2ActType == null) {
			throw new SystemException(String.format("Не знайдено типу зв''язку з кодом %d!", element2ActType));
		}
		
		String[] name = elementLogic.getNameByCode(elementCode);
		
		String string = String.format("%s № %s %s із актом № %s від %s"
				, name[0], name[1]
				, (isLinked ? "вже зв''язаний" : "не зв''язаний")
				, act.numberGen, Tools.dateFormatDefault.format(act.dateAct));
		
		return string;
	}
	
	private void checkActObject(ENElement2Act object) throws DatasourceConnectException, PersistenceException {
		ENActDAO actDao = new ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		
		ENAct act = actDao.getObject(object.actRef.code);
		
		if(act.element.code == object.elementRef.code) {
			ElementLogic elementLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			String[] name = elementLogic.getNameByCode(object.elementRef.code);
			
			throw new SystemException(String.format("Акт № %s від %s складен на об'єкт %s %s, тому немає необхідності пов'язувати цей акт із цим об'єктом!"
					, act.numberGen, Tools.dateFormatDefault.format(act.dateAct), name[0], name[1]));
		}
		
		
		
	}
	
	private void checkDuplication(ENElement2Act object) {
		try {
			ENElement2ActDAO dao = new ENElement2ActDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENElement2ActFilter filter = new ENElement2ActFilter();
			filter.actRef.code = object.actRef.code;
			filter.elementRef.code = object.elementRef.code;
			filter.typeRef.code = object.typeRef.code;
			
			long count = dao.count(filter);
			if(count > 0) {
				
				throw new SystemException(this.getStringForException(object.elementRef.code
						, object.actRef.code, object.typeRef.code, true));
			}

		    
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENElement2Act%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

} // end of EJB Controller for ENElement2Act