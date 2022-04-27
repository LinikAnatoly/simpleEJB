
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Sat Sep 26 14:38:30 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENPlanWorkItem;
  *
  */



import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;
import java.util.Vector;
import java.util.concurrent.TimeUnit;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENCalcContractTotalDAO;
import com.ksoe.energynet.dataminer.ENDepartment2EPRenDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENHumenItemDAO;
import com.ksoe.energynet.dataminer.ENMolDAO;
import com.ksoe.energynet.dataminer.ENPlanCorrectHistoryDAO;
import com.ksoe.energynet.dataminer.ENPlanWork2ClassificationTypeDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.dataminer.ENTimeLineDAO;
import com.ksoe.energynet.dataminer.ENTransportDepartmentDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportOrder2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportOrder2TravelDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.dataminer.FINMolDataDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.ejb.generated.ENPlanWorkItemControllerEJBGen;
import com.ksoe.energynet.logic.AVRLogic;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.ElementLogic;
import com.ksoe.energynet.logic.EstimateLogic;
import com.ksoe.energynet.logic.FINExecutorLogic;
import com.ksoe.energynet.logic.GlobusLogic;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.PlanWorkItemLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.ServicesCalculatorLogic;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.energynet.logic.TransportOrderLogic;
import com.ksoe.energynet.logic.WorkOrderLogic;
import com.ksoe.energynet.util.DBConnector;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.DSFstWork;
import com.ksoe.energynet.valueobject.DSFstWorkRequest;
import com.ksoe.energynet.valueobject.DSFstWorkResponse;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENConnectionWorkType;
import com.ksoe.energynet.valueobject.ENDistance;
import com.ksoe.energynet.valueobject.ENDistanceType;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENHumenItem;
import com.ksoe.energynet.valueobject.ENMol;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType;
import com.ksoe.energynet.valueobject.ENPlanWorkForm;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENRoadType;
import com.ksoe.energynet.valueobject.ENServicesContractKind;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesContragentType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObjectCalcType;
import com.ksoe.energynet.valueobject.ENSettleType;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.ENTransportDepartment;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItemStatus;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.FINExecutor;
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.brief.ENHumenItemShort;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkItemShort;
import com.ksoe.energynet.valueobject.brief.ENTransportItemShort;
import com.ksoe.energynet.valueobject.brief.ENTransportOrderShort;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetItemShort;
import com.ksoe.energynet.valueobject.filter.ENCalcContractTotalFilter;
import com.ksoe.energynet.valueobject.filter.ENDepartment2EPRenFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanCorrectHistoryFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2ClassificationTypeFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTimeLineFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportOrder2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportOrder2TravelFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.ENCalcContractTotalShortList;
import com.ksoe.energynet.valueobject.lists.ENDepartment2EPRenShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENHumenItemShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanCorrectHistoryShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2ClassificationTypeShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemForClosePlanShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENTimeLineShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportOrder2TransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportOrder2TravelShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportOrderShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;
import com.ksoe.techcard.dataminer.TKTechCardDAO;
import com.ksoe.techcard.dataminer.TKTransportMarkDAO;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.logic.TechCardLogic;
import com.ksoe.techcard.valueobject.TKClassificationType;
import com.ksoe.techcard.valueobject.TKTechCard;
import com.ksoe.techcard.valueobject.TKTechCardSource;
import com.ksoe.techcard.valueobject.TKTransportReal;
import com.ksoe.techcard.valueobject.TKTransportType;
import com.ksoe.techcard.valueobject.brief.TKMaterials2TKMaterialsShort;
import com.ksoe.techcard.valueobject.filter.TKClassificationTypeFilter;
import com.ksoe.techcard.valueobject.filter.TKTechCardFilter;
import com.ksoe.techcard.valueobject.filter.TKTransportMarkFilter;
import com.ksoe.techcard.valueobject.lists.TKClassificationTypeShortList;
import com.ksoe.techcard.valueobject.lists.TKTransportMarkShortList;



public class ENPlanWorkItemControllerEJB extends ENPlanWorkItemControllerEJBGen
 {

	private static final long serialVersionUID = 1L;


public ENPlanWorkItemControllerEJB() {}

  public int addBySRS(ENPlanWorkItem object){
        return add(object);
    }

    public int addBySVES(ENPlanWorkItem object){
            return add(object);
    }

    public int addBySPS(ENPlanWorkItem object){
            return add(object);
    }

    public int addByByt(ENPlanWorkItem object){
            return add(object);
    }

    public int addByProm(ENPlanWorkItem object){
            return add(object);
    }

    public void saveBySRS(ENPlanWorkItem object){
        save(object);
    }

    public void saveBySVES(ENPlanWorkItem object){
        save(object);
    }

    public void saveBySPS(ENPlanWorkItem object){
        save(object);
    }

    public void saveByByt(ENPlanWorkItem object){
            save(object);
        }

    public void saveByProm(ENPlanWorkItem object){
            save(object);
        }

    public void removeBySRS(int code){
            remove(code);
    }

    public void removeBySVES(int code){
        remove(code);
    }

    public void removeBySPS(int code){
        remove(code);
    }

    public void removeByByt(int code){
            remove(code);
        }

    public void removeByProm(int code){
            remove(code);
        }

    public int addByServicesFromSideObject(ENPlanWorkItem object) {
            return add(object);
    }

    public void removeByServicesFromSideObject(int code) {
        remove(code);
    }


	@Override
	public int add(ENPlanWorkItem object) {
		return add(object, false);
	}

	public int add(ENPlanWorkItem object, boolean isFromAVRInterface) {
		return add(object, isFromAVRInterface, false);
	}

	public int add(ENPlanWorkItem object, boolean isFromAVRInterface, boolean isForSupplier) {
		try {

			if (object.kartaRef.code == 0) {
				throw new EnergyproSystemException("\n\n"
						+ "робота не знайдена ... код плана =" + object.planRef.code);
			}

			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());

			// типа проверим совпадение времени общего на ТехКарте и СУММЫ времени на каждой должности ...
			new TechCardLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).validateNormOfTime(object.kartaRef.code);

			ENPlanWorkItemFilter f = new ENPlanWorkItemFilter();
			f.planRef.code = object.planRef.code;
			f.kartaRef.code = object.kartaRef.code;

			ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			int[] arr = dao.getFilteredCodeArray(f, null, null, 0, -1, null);
			if (arr.length > 0) {
				throw new EnergyproSystemException("\n\n"
						+ "Така робота вже є у Плані ... змінюйте кількість робіт ...");
			}

			//ENElementDAO eDao = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			//ENElement e = eDao.getObject(object.elementRef.code);
			PlanWorkLogic logic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ENPlanWork plan = logic.getPlanByCode(object.planRef.code);

			AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			if (!l.checkPermission4PlanItems(plan)) {
				throw new EnergyproSystemException("\n\n"
						+ "Acces denied for method addBy... from method ENPlanWorkItem.add()");
			}

			ElementLogic elementLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			int eType = elementLogic.getElementTypeByPlan(plan);

			/* 26.01.2012 +++ проверка добавления Услуги на планы с другими подвидами работ */
			TKTechCardDAO kDAO = new TKTechCardDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			boolean isServices = false;
			if (plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE
					|| plan.typeRef.code == ENPlanWorkType.SERVICES_FROM_SIDE_INVEST) {
				isServices = true;
			}

			TKTechCard karta = kDAO.getObject(object.kartaRef.code);

			logic.checkForProhibitedTechCard(object.kartaRef.code, plan.code, eType, "", isForSupplier);

			if (!isServices && karta.techcardsource.code == TKTechCardSource.SERVICES_FROM_SIDE) {
				throw new EnergyproSystemException("\n\n"
						+ "Послуги додаються тільки у плани з підвидом робіт \"Послуги зі сторони\"!!!");
			}

			/* 20.12.2011 +++ одна услуга в плане */
			if (isServices) {

				ENPlanWorkItemFilter pwf = new ENPlanWorkItemFilter();
				pwf.planRef.code = object.planRef.code;

				int[] arrPw = dao.getFilteredCodeArray(pwf, null, null, 0, -1, null);
				for (int t = 0; t < arrPw.length; t++) {
					ENPlanWorkItem pi = dao.getObject(arrPw[t]);

					TKTechCard kartaOld = kDAO.getObject(pi.kartaRef.code);
					TKTechCard kartaNew = kDAO.getObject(object.kartaRef.code);

					if (kartaOld.techcardsource.code == TKTechCardSource.SERVICES_FROM_SIDE
							&& kartaNew.techcardsource.code == TKTechCardSource.SERVICES_FROM_SIDE) {

						if (!servicesLogic.checkServicesProject(plan.elementRef.code)) {
							throw new EnergyproSystemException("\n\n "
									+ "Одна Послуга вже є у Плані!!! \n"
									+ "Додавати можна тільки роботи!!!");
						}
					}
				}
			}

			// NET-1974 Запрет на добавление работы если есть акт, кот. не черновой, т.к. цена работы
			// отображается в акте договоров-подряда и её изменение приведет к изменению самого акта (кот. может быть
			// "На подписании").
			if (plan.stateRef.code == ENPlanWorkState.TMC_TRANSFER) {
				ActLogic actLogic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
				ENAct actObj = actLogic.getActByPlanCode(plan.code, false);
				if (actObj != null) {
					if (actObj.statusRef.code != ENActStatus.GOOD) {
						throw new EnergyproSystemException("\n\n"
								+ "Акт № " + actObj.numberGen + " повинен бути чорновим для зміни ціни роботи");
					}
				}
			}



			/* 14.05.2012 +++ одна работа если перевозка грузов */
			if (plan.typeRef.code == ENPlanWorkType.TRUCKING) {

				ENPlanWorkItemFilter pwf = new ENPlanWorkItemFilter();
				pwf.planRef.code = object.planRef.code;

				int[] arrPw = dao.getFilteredCodeArray(pwf, null, null, 0, -1, null);
				for (int t = 0; t < arrPw.length; t++) {
					ENPlanWorkItem pi = dao.getObject(arrPw[t]);

					TKTechCard kartaOld = kDAO.getObject(pi.kartaRef.code);

					if (kartaOld.code == TKTechCard.TRUCKING_CARGO) {
						throw new EnergyproSystemException("\n\n"
								+ "Для перевезення вантажу дозволено використовувати лише одну роботу!!!");
					}
				}
			}


		    /* 24.05.2012 +++ разрешаем использовать "Калькуляции" для Проектування (госп. спосіб) */
		    /* 18.04.2012 +++ норматив "Калькуляции" только для работ "Услуги на сторону" */
		    if (karta.techcardsource.code == TKTechCardSource.CALCULATIONS
		            && plan.typeRef.code != ENPlanWorkType.WORK_IN_OUT
		            && plan.typeRef.code != ENPlanWorkType.EZ_OFF_ONN // OSB-2737 Энергосбыт-Пром, Подключения/отключения
		            && plan.typeRef.code != ENPlanWorkType.DESIGNING_TECHCONDITIONS

		            /* 22.03.2013 +++ разрешаем использовать "Калькуляции" для Стандартного присоединения */
		            && plan.typeRef.code != ENPlanWorkType.PRIEDNANNY

		            ) {
		        throw new EnergyproSystemException("\n\n"
		        		+ "Роботи з нормативу \"Калькуляції\" додаються тільки у плани \n"
		        		+ "з підвидом робіт \"Роботи на сторону\"!!!");
		    }

		    /* 18.04.2012 +++ нельзя использовать норматив "Норми, які не можна використовувати" */
		    if (karta.techcardsource.code == TKTechCardSource.NOT_BE_USED) {
		        throw new EnergyproSystemException("Роботи з цього нормативу не використовуються!!!");
		    }

		    // NET-4511 Нельзя использовать техкарты с признаком "Запрещено использовать"
		    if (karta.isProhibited == TKTechCard.PROHIBITED)
		    {
		    	throw new EnergyproSystemException("\n\nNET-4511 Для техкарти № " + karta.techKartNumber +
		    		" встановлено ознаку \"Заборонено використовувати\"!");
		    }

		    /* 30.11.2011 +++ энергосбыт - перевезення в сад!!!! */
		    if (plan.typeRef.code == ENPlanWorkType.TRUCKING
		                && plan.budgetRef.code == ENConsts.ENBUDGET_ENERGOSBYT) {
		        throw new EnergyproSystemException("\n\n"
		        		+ "Для енергозбуту заборонено складати плани з підвидом робіт \"Перевезення\"!");
		    }

		    /* 30.11.2011 +++ перевозка админ.персонала, только для ХОЕ!!!! */
		    if (object.kartaRef.code == ENConsts.ADMIN_TRUCKING
		            && (plan.departmentRef.code != ENConsts.ENDEPARTMENT_CO
		                    && plan.departmentRef.code != ENConsts.ENDEPARTMENT_KSOE)) {
		        throw new EnergyproSystemException("\n\n"
		        		+ "Ця робота тільки для апарату управління!!!");
		    }


			// если есть счетчик - заборт ...
			if (plan.kind.code == ENPlanWorkKind.FACT) {
				logic.checkInSCCounterByPlanCode(plan.code);
			}

			if (plan.typeRef.code == ENPlanWorkType.WRITINGS)
				throw new EnergyproSystemException("\n\n"
						+ "На такому плані робіт не повинно бути ...");

		     // перевозки ТОЛЬКО на перевозках ...
		     /* 31.07.2011 Гетьманов ршил что надо везде ....
		     TKTechCard tk = new TKTechCardDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).getObject(object.kartaRef.code);
		     if ((tk.techcardsource.code == TKTechCardSource.TRUCKING)
		            && (( plan.typeRef.code != ENPlanWorkType.TRUCKING )
		                    || ( plan.stateRef.code != ENPlanWorkState.TRUCKING )
		                    // || ( plan.typeRef.code != ENPlanWorkType.TRANSPORT_RELOCATION )
		                )
		     )
		     {
		        throw new EnergyproSystemException("Роботи з перевезення можна складати тільки на Тип плану - ПЕРЕВЕЗЕННЯ ...");
		     }
		     */


		     /** !?!?!?!?! 06.03.2012 +++ В.С. для перевозки грузов МОЛ не нужен
		     if (plan.kind.code == ENPlanWorkKind.CURRENT && eType != ENElementType.CARGO_OBJECT) {
		            logic.validateMOLinPlan(plan.code);
		     }
		     */

		    /*NET-2843 27.08.2012 ограничение на добавление работ на планы для объектов Благодійна допомога*/
		    if(eType == ENElementType.GIFT)
		    {
		        throw new EnergyproSystemException("\n\n"
		        		+ "Неможливо додати роботу на план для благодійної допомоги");
		    }

		    /*SUPP-3851*/
		    if(eType == ENElementType.NO_OBJECT_AVR16)
		        throw new EnergyproSystemException("\n\n"
		        		+ "Неможливо додати роботу на план \"Поповнення АВР-16\"");

		     /* 13.03.2013 +++ перевозку грузов можно делать только на объект "Груз для перевозок" */
		     if (plan.typeRef.code == ENPlanWorkType.TRUCKING
		            && object.kartaRef.code == TKTechCard.TRUCKING_CARGO
		                && eType != ENElementType.CARGO_OBJECT ) {
		        throw new EnergyproSystemException("\n\n"
		        		+ "Плани на перевезення вантажу складаються тільки з меню "
		        		+ " \"Рух траспорту\" - \"Перевезення вантажу\"!!!");
		    }


		    ///// На месячном плане, сформированном путем перехода из "Кошториса", изменять работы нельзя!
			if (plan.kind.code == ENPlanWorkKind.CURRENT) {
				if (logic.isCurrentPlanFromCalculation(plan)) {
					throw new EnergyproSystemException("\n\n"
							+ "Додавати роботи у місячний план, сформований з кошторису для послуг на сторону, заборонено!");
				}
			}
		    /////

			logic.validateENPlanWorkItemSource(object, eType);

		    int planItemOutCode = logic.addPlanWorkItem(object, plan);


		    // для АВР на НПЗ/Факте накинет такую же работу на Месячный .. если надо .. или увеличим кол-во работ ...

		    if ((( plan.kind.code == ENPlanWorkKind.NPW ) || ( plan.kind.code == ENPlanWorkKind.FACT )) && (plan.typeRef.code == ENPlanWorkType.AVR )) {

				ENPlanWorkItem pItem = dao.getObject(planItemOutCode);

				ENEstimateItemFilter estimateFilter = new ENEstimateItemFilter();
				estimateFilter.planItemRef.code = planItemOutCode;
				estimateFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
				ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
				ENEstimateItemShortList oldEList = estimateDAO.getScrollableFilteredList(estimateFilter, 0, -1);

				///// 28.01.14 SUPP-11863
				if (! isFromAVRInterface)
		        {
		            for (int i = 0; i < oldEList.totalCount; i++)
		            {
		                oldEList.get(i).countGen = new BigDecimal(0);
		                oldEList.get(i).countFact = new BigDecimal(0);
		            }
		        }
		        /////


		        AVRLogic avrLogic = new AVRLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		        avrLogic.recalcCurrentAVRByPlanWorkItem(pItem, new BigDecimal(0), oldEList);

		        /*
		        ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		        ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

		        ENEstimateItemFilter estimateFilter = new ENEstimateItemFilter();

		        ENPlanWorkItem parentCurrentPlanItem = logic.getParentCurrentPlanWorkItem(planItemOutCode);
		        // работы не было ... накинем ...
		        if (parentCurrentPlanItem.code == Integer.MIN_VALUE ){

		            parentCurrentPlanItem.kartaRef.code = object.kartaRef.code;
		            parentCurrentPlanItem.countGen = object.countGen;
		            parentCurrentPlanItem.commentGen = "работа создана с дочернего плана";
		            dao.add(parentCurrentPlanItem);

		            //EstimateLogic eLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		            //eLogic.cancelENEstimateItem(object.code); // при добавлении нечего пересчитывать ...
		            //eLogic.createENEstimateItems(parentCurrentPlanItem.code);
		            estimateFilter = new ENEstimateItemFilter();

		            estimateFilter.planItemRef.code = planItemOutCode;
		            int[] eArr = estimateDAO.getFilteredCodeArray(estimateFilter, 0, -1);
		            for (int ii=0; ii < eArr.length; ii++){
		                ENEstimateItem e = estimateDAO.getObject(eArr[ii]);
		                e.planItemRef.code = parentCurrentPlanItem.code;
		                e.planRef.code = parentCurrentPlanItem.planRef.code;
		                estimateDAO.add(e);

		                ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
		                e2e.estimateItemInRef.code = e.code;
		                e2e.estimateItemOutRef.code = eArr[ii];
		                e2e.countGen = e.countFact;
		                e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
		                e2eDAO.add(e2e);
		            }
		        }
		        else
		        {
		            // работа была в поточном ...
		            parentCurrentPlanItem.countGen = parentCurrentPlanItem.countGen.add(object.countGen);
		            dao.save(parentCurrentPlanItem);

		            estimateFilter = new ENEstimateItemFilter();
		            estimateFilter.planItemRef.code = planItemOutCode;
		            ENEstimateItemShortList estimateList = estimateDAO.getScrollableFilteredList(estimateFilter, 0, -1);
		            for (int ii=0; ii < estimateList.totalCount; ii++){
		                ENEstimateItemFilter estimateFilter1 = new ENEstimateItemFilter();
		                estimateFilter1.materialRef.code = estimateList.get(ii).materialRefCode;
		                estimateFilter1.planItemRef.code = parentCurrentPlanItem.code;
		                int[] eArr = estimateDAO.getFilteredCodeArray(estimateFilter1, 0, -1);
		                if (eArr.length == 0){
		                    // мат-л не найден ... накинем его ...
		                    ENEstimateItem e1 = estimateDAO.getObject(estimateList.get(ii).code);
		                    e1.planRef.code = parentCurrentPlanItem.planRef.code;
		                    e1.planItemRef.code = parentCurrentPlanItem.code;
		                    estimateDAO.add(e1);

		                    ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
		                    e2e.estimateItemInRef.code = e1.code;
		                    e2e.estimateItemOutRef.code = estimateList.get(ii).code;
		                    e2e.countGen = estimateList.get(ii).countFact;
		                    e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
		                    e2eDAO.add(e2e);

		                }
		                else{
		                    for (int qq=0; qq<eArr.length; qq++){
		                        ENEstimateItem e1 = estimateDAO.getObject(eArr[qq]);
		                        e1.countGen = e1.countGen.add(estimateList.get(ii).countGen);
		                        e1.countFact = e1.countFact.add(estimateList.get(ii).countFact);
		                        estimateDAO.save(e1);

		                        ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
		                        e2e.estimateItemInRef.code = e1.code;
		                        e2e.estimateItemOutRef.code = estimateList.get(ii).code;
		                        e2e.countGen = estimateList.get(ii).countFact;
		                        e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
		                        e2eDAO.add(e2e);
		                    }
		                }
		            }

		            //parentCurrentPlanItem.code = Integer.MIN_VALUE;
		            //parentCurrentPlanItem.planRef.code = object.planRef.code;
		            //parentCurrentPlanItem.countGen = object.countGen;
		            //dao.add(parentCurrentPlanItem);
		        }
		      */
		    } // авр на нпз/факте ..

		    //   ---------------------------- Проверим если работа "ПЕРЕВЕЗЕННЯ персоналу енергосбуту " тогда апдейтим бюджетодержателя на плане (ставим ЕНЕРГОСБЫТ)
			if (object.kartaRef.code == 500004872) {
				plan.budgetRef.code = ENConsts.ENBUDGET_ENERGOSBYT;
				ENPlanWorkDAO planDao = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
						getUserProfile());
				planDao.save(plan);
			}

			// 17.02.12 NET-1355 Пересчитываем дату окончания и общее время выполнения работ
			logic.recalcTotalTime(object.planRef.code);

			/////
			// NET-4440 Создаем запись в истории ГСМ по плану
			logic.generatePlanFuelHistory(object.planRef.code, plan.dateStart);
			/////

			/** Обновление стоимости на договоре подряда на выполнение ПКД... */
			if (servicesLogic.checkServicesProject(plan.elementRef.code)) {

				int agreement2soCode = servicesLogic.getAgreement2soCode(plan.elementRef.code);
				servicesLogic.recalcServicesProject(agreement2soCode);
			}

			return planItemOutCode;

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENPlanWorkItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	public int addPlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationType object,
			BigDecimal distance) {
		return addPlanWorkItemsByClassificationTypeForCalculation(object, distance, false, Integer.MIN_VALUE);
	}

	public int addPlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationType object,
			BigDecimal distance, boolean priconnections, int soCode) {
		return addPlanWorkItemsByClassificationTypeForCalculation(object, distance, priconnections, soCode, null, null);
	}

	public int addPlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationType object,
			BigDecimal distance, boolean priconnections, int soCode, TKMaterials2TKMaterialsShort m2mShort,
			Date customPlanDate) {
		try {
			PlanWorkItemLogic planWorkItemLogic = new PlanWorkItemLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			return planWorkItemLogic.addPlanWorkItemsByClassificationTypeForCalculation(object, distance,
					priconnections, soCode, m2mShort, customPlanDate);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	public int addPlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationType object,
			BigDecimal distance, int planKindCode, boolean priconnections, int soCode) {

		return addPlanWorkItemsByClassificationTypeForCalculation(object, distance, planKindCode, priconnections,
				soCode, null, null);
	}


	public int addPlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationType object,
			BigDecimal distance, int planKindCode, boolean priconnections, int soCode,
			TKMaterials2TKMaterialsShort m2mShort, Date customPlanDate) {
		try {
			PlanWorkItemLogic planWorkItemLogic = new PlanWorkItemLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			return planWorkItemLogic.addPlanWorkItemsByClassificationTypeForCalculation(object, distance, planKindCode,
					priconnections, soCode, m2mShort, customPlanDate);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType%} object.", e);
		} finally {
			closeConnection();
		}
	}



  public void savePlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationType object, BigDecimal distance) {
    savePlanWorkItemsByClassificationTypeForCalculation(object, distance, false);
  }

  public void savePlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationType object, BigDecimal distance, boolean priconnections) {
    try {

        /*SUPP-48476*/ this.setParametersOnDate(object, new Date());

        ENPlanWork2ClassificationTypeDAO dao = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
          // запомним план - Кошторис т.к начинать пересхранять бум с плана - кошторис единичный
        int planCalc =  object.planRef.code;

        BigDecimal contractCostWithoutVAT = new BigDecimal(0);

        if (!priconnections) {
            //        если лицензионнная тогда делаем пересчет для  план кошторис с единичного плана
            // if (isLicensed == 0 || isLicensed == Integer.MIN_VALUE){ NET-2396 создание / редактировани единичного кошториса для всех видов работ
                // переменная кода клана - Кошториса Единичного
                int planCalcSingle = Integer.MIN_VALUE;
                // Вытянем по коду План Кошториса код Плана Кошториса Единичного
                ENPlanWorkDAO planCalcDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkFilter planCalcFilter = new ENPlanWorkFilter();
                planCalcFilter.conditionSQL =  " code = ( select pw2.code from enplanwork pw1 , enelement el , enplanwork pw2 \n" +
                "                          Where pw1.elementrefcode = el.code \n" +
                "                            and pw1.code =  " + object.planRef.code + " \n" +
                "                            and pw1.kindcode = " + ENPlanWorkKind.CALCULATION + "   \n" +
                "                            and pw2.elementrefcode = el.code  \n" +
                "                            and pw2.kindcode = "+ ENPlanWorkKind.CALCULATION_SINGLE+" )";

                ENPlanWorkShortList planCalcList = planCalcDAO.getScrollableFilteredList(planCalcFilter, 0, -1);
                planCalcSingle = planCalcList.get(0).code;

                // фильтр по работам из  плана - кошториса единичного , по коду плана кошториса единичного
                ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
                piFilter.planRef.code = planCalcSingle;
                piFilter.conditionSQL = "enplanworkitem.kartarefcode in (select qq.code from tktechcard qq where qq.classificationtypecode = "+ object.classificationTypeRef.code +")";
                ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

                int[] piArr = piDAO.getFilteredCodeArray(piFilter, piFilter.conditionSQL, null, 0, -1, null);
                for (int i=0; i < piArr.length; i++){
                    ENPlanWorkItem pi = piDAO.getObject(piArr[i]);
                    // pi.countGen = object.countGen;
                    // для единичной работы всегда ставим количество 1 (при лицензированых работах)
                    pi.countGen = new BigDecimal(1);

                    this.saveForCalculation(pi, distance, priconnections);
                }

                ServicesLogic soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                // расстояния для план-кошторис единичного
                soLogic.createDistancesByPlanCode(planCalcSingle);
                // пересчитаем калькуляции под план-кошторис
                contractCostWithoutVAT = new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).calculateServices(planCalcSingle) ;

                //   } NET-2396 создание / редактировани единичного кошториса для всех видов работ
        }



        //{ ФИЛЬТР по работам из  плана - кошториса , по коду плана кошториса
        ENPlanWorkItemFilter pi2Filter = new ENPlanWorkItemFilter();
        pi2Filter.planRef.code = planCalc;
        pi2Filter.conditionSQL = "enplanworkitem.kartarefcode in (select qq.code from tktechcard qq where qq.classificationtypecode = "+ object.classificationTypeRef.code +")";
        ENPlanWorkItemDAO pi2DAO = new ENPlanWorkItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        int[] piArr2 = pi2DAO.getFilteredCodeArray(pi2Filter, pi2Filter.conditionSQL, null, 0, -1, null);
        for (int i=0; i < piArr2.length; i++){
            ENPlanWorkItem pi = pi2DAO.getObject(piArr2[i]);
            pi.countGen = object.countGen;

            this.saveForCalculation(pi, distance, priconnections);
        }
          // сохраним изминения в привязке
        object.dateEdit = new Date();
        object.userGen = getUserProfile().userName;
        dao.save(object);


        ServicesLogic so2Logic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        // расстояния для план-кошторис
        so2Logic.createDistancesByPlanCode(planCalc);
          //}
        //!!! После выполнения персчета для план-кошторис ?  , пересчитаем калькуляции под план-кошторис и обновим сумму договора БЕЗ НДС
        // BigDecimal NET-2396 создание / редактировани единичного кошториса для всех видов работ
        contractCostWithoutVAT = new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).calculateServices(planCalc, priconnections) ;

        ENServicesObject soObj = so2Logic.getServicesObjectByPlanCode(planCalc);
        soObj.contractServicesSumma = contractCostWithoutVAT;

        new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).save(soObj);

            //если лицензионнная тогда делаем пересчет для  план кошторис с единичного плана
            //   if (isLicensed == 0 || isLicensed == Integer.MIN_VALUE){ NET-2396 создание / редактировани единичного кошториса для всех видов работ
            // тут перерасчет таблиц калькуляций (данные с (кошторис единичный) множим на количество работ к кошторисе  )
                ServicesLogic sooLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                sooLogic.recalculateCalculations(object, priconnections);
            //  } NET-2396 создание / редактировани единичного кошториса для всех видов работ

    }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't savePlanWorkItemsByClassificationTypeForCalculation ",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
  }


    public int addPlanWorkItemsByClassificationTypeForCalculationNotLicensed(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours) {
        return addPlanWorkItemsByClassificationTypeForCalculationNotLicensed(
                object, distance, machinehours, false);
    }

    public int addPlanWorkItemsByClassificationTypeForCalculationNotLicensed(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, boolean priconnections) {
    	return addPlanWorkItemsByClassificationTypeForCalculationNotLicensed(
                object, distance, machinehours, false, null);
    }


  // для нелицензированных работ
  public int addPlanWorkItemsByClassificationTypeForCalculationNotLicensed(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, boolean priconnections, Date customPlanDate)
  {
    try
        {
        /* !!! this.add(piObj); проверит ...
        ServicesLogic serviceLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        if (object.planRef.code != Integer.MIN_VALUE){
            serviceLogic.checkEditableCalculation(object.planRef.code, true);
        }
        */
        TKClassificationTypeDAO clTypeDAO = new TKClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        TKClassificationTypeFilter clTypeFilter = new TKClassificationTypeFilter();

        ServicesLogic soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        TKTechCardDAO techCardDAO = new TKTechCardDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        TKTechCardFilter techCardFilter = new TKTechCardFilter();
        techCardFilter.classificationType.code = object.classificationTypeRef.code;
        int[] techCardArr = techCardDAO.getFilteredCodeArray(techCardFilter, 0, -1);
        if (techCardArr.length == 0){
            throw new EnergyproSystemException("Не знайдено операції(тех.карти) для класифікатора з кодом " + object.classificationTypeRef.code);
        }


        //////////////////////////////////////////////
            // Проверка на совпадение видов работ из Услуг
        soLogic.checkFinWorkTypes(object);
        //////////////////////////////////////////////

        // 15.11.2018 сравним customPlanDate с текущей датой сервера , если customPlanDate меньше тольгда переприсвоим в customPlanDate текущей датой сервера
		// ибо вылез бок когда дата на клиентских компьютерах сбивается
		// входящий параметр customPlanDate убрать нельзя т.к она используется для создания тестовых калькуляций
        if(customPlanDate==null){
			customPlanDate = new Date();
		}
        long diffDate = Tools.getDaysDiff( new Date() , customPlanDate, TimeUnit.DAYS  );
		if (diffDate<0){
			customPlanDate = new Date();
		}


        clTypeFilter.code = object.classificationTypeRef.code;
        TKClassificationTypeShortList clTypeList = clTypeDAO.getScrollableFilteredList(clTypeFilter,0,-1);

        this.checkCurrentUserCanAddCalculationsFromTestSources(clTypeList.get(0).code, clTypeList.get(0).techcardsourceCode);

        int piCode = Integer.MIN_VALUE;
        int planCode = object.planRef.code;
        for (int i=0; i < techCardArr.length; i++){
            ENPlanWorkItem piObj = new ENPlanWorkItem();
            piObj.planRef.code = planCode;
            piObj.kartaRef.code = techCardArr[i];
            piObj.countGen = object.countGen;
            piCode = this.addForCalculation(piObj, distance, ENPlanWorkKind.CALCULATION, priconnections, Integer.MIN_VALUE, null, customPlanDate);


            //проверяем тип классификатора (лицензированная работа или нет) - если нелицензированная, тогда расчет отдельный
                if (clTypeList.get(0).isnotlicensedactivity == 1.0 )
                {



                    // марка транспорта

                    TKTransportMarkDAO transportMarkDAO = new TKTransportMarkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                        TKTransportMarkFilter tmarkfilter = new TKTransportMarkFilter();
                        tmarkfilter.conditionSQL = "code in (select trm.code from tkclassificationtype c , tktechcard th , " +
                                " tkelement2techcard e2t , tkelement te , tktransport tr , tktransportmark trm" +
                                " where c.code = " + object.classificationTypeRef.code  +
                                "  and c.code = th.classificationtypecode" +
                                " and e2t.techkartcode = th.code " +
                                " and e2t.elementcode = te.code" +
                                "  and te.elementtypecode = 240000002" +
                                "  and te.code = tr.elementcode " +
                                "  and tr.transportmarkcode = trm.code ) ";




                        TKTransportMarkShortList tmList = transportMarkDAO.getScrollableFilteredList(tmarkfilter,0,-1);

                    // если тип транспорта бортовой, самосвал или тягач то включается перевод км в часы или наоборот в зависмости от того что заведено на клиенте

                if ((tmList.get(0).transporttypeCode == TKTransportType.TRACTORTRAILER ||
                        tmList.get(0).transporttypeCode == TKTransportType.BOARD ||
                        tmList.get(0).transporttypeCode == TKTransportType.TRUCK ) && (machinehours.doubleValue() == 0))  {

                        // перевод из часов в км если машина одна из трех типов
                        machinehours = distance.divide(tmList.get(0).basicSpeed,2,BigDecimal.ROUND_HALF_UP);
                            }

                //присвоим нормочасы для каждой машины на работе
                soLogic.updateMachineHoursByPlanItemCode(piCode , machinehours );


                if ((tmList.get(0).transporttypeCode == TKTransportType.TRACTORTRAILER ||
                    tmList.get(0).transporttypeCode == TKTransportType.BOARD ||
                    tmList.get(0).transporttypeCode == TKTransportType.TRUCK ) && (distance.doubleValue() == 0))  {


                    // перевод из км в часы если машина одна из трех типов
                distance = machinehours.multiply(tmList.get(0).basicSpeed).setScale(2, BigDecimal.ROUND_HALF_UP);

                }

            // на работу накидываются расстояния для машины

            //***
            //*** soLogic.createDistancesByPlanItemCodeNotLicensed(piCode , distance );
            ServicesLogic soLogic1 = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            soLogic1.createDistancesByPlanItemCodeNotLicensed(piCode , distance );
            //***

                }
            if (planCode == Integer.MIN_VALUE)
            {
                // как то оно хитро работает .. чуть шо передернуть piObj ;)
                planCode = piObj.planRef.code;
            }
        }

        if (piCode == Integer.MIN_VALUE){
            throw new EnergyproSystemException("Не додано жодної операції (тех.карти)");
        }
        /*
        if (object.planRef.code == Integer.MIN_VALUE){
            ENPlanWorkItem piObj2 = getObject(piCode);
            object.planRef.code = piObj2.planRef.code;
        }
        */

        object.planRef.code = planCode;


        ENPlanWork2ClassificationTypeDAO dao = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        object.userGen = getUserProfile().userName;
        object.dateEdit = new Date();
        this.setParametersOnDate(object,  (customPlanDate == null) ? new Date() : customPlanDate);
        int outCode = dao.add(object);

        if (clTypeList.get(0).isnotlicensedactivity != 1.0 ) {
                soLogic.createDistancesByPlanCode(planCode);
        }

        // создадим доставку ...
        new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).createDeliveryTime(planCode);

        // обновм сумму договора БЕЗ НДС
        BigDecimal contractCostWithoutVAT = new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).calculateServices(object.planRef.code) ;

        ENServicesObject soObj = soLogic.getServicesObjectByPlanCode(planCode);
        soObj.contractServicesSumma = contractCostWithoutVAT;

        new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).save(soObj);

        return outCode;


        }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
  }
  // для нелецензированых работ
  public void savePlanWorkItemsByClassificationTypeForCalculationNotLicensed(ENPlanWork2ClassificationType object, BigDecimal distance , BigDecimal machinehours )
  {
    try
    {

        TKClassificationTypeDAO clTypeDAO = new TKClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        TKClassificationTypeFilter clTypeFilter = new TKClassificationTypeFilter();

        ENPlanWork2ClassificationTypeDAO dao = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        // запомним план - Кошторис т.к начинать пересхранять бум с плана - кошторис единичный
        int planCalc =  object.planRef.code;

        clTypeFilter.code = object.classificationTypeRef.code;
        TKClassificationTypeShortList clTypeList = clTypeDAO.getScrollableFilteredList(clTypeFilter,0,-1);
        // NET-2396 создание / редактировани единичного кошториса для всех видов работ
        // Обработаем единичный кошторис
            // переменная кода клана - Кошториса Единичного
        int planCalcSingle = Integer.MIN_VALUE;
        // Вытянем по коду План Кошториса код Плана Кошториса Единичного
        ENPlanWorkDAO planCalcDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        ENPlanWorkFilter planCalcFilter = new ENPlanWorkFilter();
        planCalcFilter.conditionSQL =  " code = ( select pw2.code from enplanwork pw1 , enelement el , enplanwork pw2 \n" +
        "                          Where pw1.elementrefcode = el.code \n" +
        "                            and pw1.code =  " + object.planRef.code + " \n" +
        "                            and pw1.kindcode = " + ENPlanWorkKind.CALCULATION + "   \n" +
        "                            and pw2.elementrefcode = el.code  \n" +
        "                            and pw2.kindcode = "+ ENPlanWorkKind.CALCULATION_SINGLE+" )";

        ENPlanWorkShortList planCalcList = planCalcDAO.getScrollableFilteredList(planCalcFilter, 0, -1);
        // ЕСЛИ НАШЛИ ЕДИНИЧНЫЙ КОШТОРИС ТО РАСЧИТЫВАЕМ ДЛЯ НЕГО
        if (planCalcList.totalCount != 0) {
        planCalcSingle = planCalcList.get(0).code;

        ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
        piFilter.planRef.code = planCalcSingle;
        piFilter.conditionSQL = "enplanworkitem.kartarefcode in (select qq.code from tktechcard qq where qq.classificationtypecode = "+ object.classificationTypeRef.code +")";
        ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        // clTypeFilter.code = object.classificationTypeRef.code;
        // TKClassificationTypeShortList clTypeList = clTypeDAO.getScrollableFilteredList(clTypeFilter,0,-1);

        int[] piArr = piDAO.getFilteredCodeArray(piFilter, piFilter.conditionSQL, null, 0, -1, null);
        for (int i=0; i < piArr.length; i++){
            ENPlanWorkItem pi = piDAO.getObject(piArr[i]);
            pi.countGen = new BigDecimal(1);

            ServicesLogic soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            // soLogic.updateMachineHoursByPlanItemCode(pi.code , machinehours ); NET-4215 это нада только для транспортных услуг

            this.saveForCalculation(pi, distance);

            //проверяем тип класификатора (лецензированая работа или нет ) если нелицензированая тогда расчет отдельный
            if (clTypeList.get(0).isnotlicensedactivity == 1.0 )
            {



                // марка транспорта

                TKTransportMarkDAO transportMarkDAO = new TKTransportMarkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                    TKTransportMarkFilter tmarkfilter = new TKTransportMarkFilter();
                    tmarkfilter.conditionSQL = "code in (select trm.code from tkclassificationtype c , tktechcard th , " +
                            " tkelement2techcard e2t , tkelement te , tktransport tr , tktransportmark trm" +
                            " where c.code = " + object.classificationTypeRef.code  +
                            "  and c.code = th.classificationtypecode" +
                            " and e2t.techkartcode = th.code " +
                            " and e2t.elementcode = te.code" +
                            "  and te.elementtypecode = 240000002" +
                            "  and te.code = tr.elementcode " +
                            "  and tr.transportmarkcode = trm.code ) ";




                    TKTransportMarkShortList tmList = transportMarkDAO.getScrollableFilteredList(tmarkfilter,0,-1);

                // если тип транспорта бортовой, самосвал или тягач то включается перевод км в часы или наоборот в зависмости от того что заведено на клиенте

            if ((tmList.get(0).transporttypeCode == TKTransportType.TRACTORTRAILER ||
                    tmList.get(0).transporttypeCode == TKTransportType.BOARD ||
                    tmList.get(0).transporttypeCode == TKTransportType.TRUCK ) && (machinehours.doubleValue() == 0))  {

                    // перевод из часов в км если машина одна из трех типов
                    machinehours = distance.divide(tmList.get(0).basicSpeed,2,BigDecimal.ROUND_HALF_UP);
                        }

            //присвоим нормочасы для каждой машины на работе
            soLogic.updateMachineHoursByPlanItemCode(pi.code , machinehours );


            if ((tmList.get(0).transporttypeCode == TKTransportType.TRACTORTRAILER ||
                    tmList.get(0).transporttypeCode == TKTransportType.BOARD ||
                    tmList.get(0).transporttypeCode == TKTransportType.TRUCK ) && (distance.doubleValue() == 0))  {


                // перевод из км в часы если машина одна из трех типов
            distance = machinehours.multiply(tmList.get(0).basicSpeed).setScale(2, BigDecimal.ROUND_HALF_UP);

            }

        // на работу накидываются расстояния для машины
        soLogic.createDistancesByPlanItemCodeNotLicensed(pi.code , distance );
            }
        }

        // обновм сумму договора БЕЗ НДС
        ServicesCalculatorLogic calculatorLogic = new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        calculatorLogic.calculateServices(planCalcSingle);
        }

        // дальше РАСЧЕТ ДЛЯ обычного КОШТОРИСА (НЕ ЕДИНИЧНОГО)
        //   TKClassificationTypeDAO clTypeDAO2 = new TKClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());


        ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
        piFilter.planRef.code = planCalc;
        piFilter.conditionSQL = "enplanworkitem.kartarefcode in (select qq.code from tktechcard qq where qq.classificationtypecode = "+ object.classificationTypeRef.code +")";
        ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());


        // clTypeFilter.code = object.classificationTypeRef.code;
        // TKClassificationTypeShortList clTypeList = clTypeDAO.getScrollableFilteredList(clTypeFilter,0,-1);

        int[] piArr = piDAO.getFilteredCodeArray(piFilter, piFilter.conditionSQL, null, 0, -1, null);
        for (int i=0; i < piArr.length; i++){
            ENPlanWorkItem pi = piDAO.getObject(piArr[i]);
            pi.countGen = object.countGen;
            // pi.timeGen = machinehours; // нормо часы с транспорта присвоим нормо часам для работы
            ServicesLogic soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            // soLogic.updateMachineHoursByPlanItemCode(pi.code , machinehours ); NET-4215 это нада только для транспортных услуг

            this.saveForCalculation(pi, distance);

            //проверяем тип класификатора (лецензированая работа или нет ) если нелицензированая тогда расчет отдельный
            if (clTypeList.get(0).isnotlicensedactivity == 1.0 )
            {



                // марка транспорта

                TKTransportMarkDAO transportMarkDAO = new TKTransportMarkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                    TKTransportMarkFilter tmarkfilter = new TKTransportMarkFilter();
                    tmarkfilter.conditionSQL = "code in (select trm.code from tkclassificationtype c , tktechcard th , " +
                            " tkelement2techcard e2t , tkelement te , tktransport tr , tktransportmark trm" +
                            " where c.code = " + object.classificationTypeRef.code  +
                            "  and c.code = th.classificationtypecode" +
                            " and e2t.techkartcode = th.code " +
                            " and e2t.elementcode = te.code" +
                            "  and te.elementtypecode = 240000002" +
                            "  and te.code = tr.elementcode " +
                            "  and tr.transportmarkcode = trm.code ) ";




                    TKTransportMarkShortList tmList = transportMarkDAO.getScrollableFilteredList(tmarkfilter,0,-1);

                // если тип транспорта бортовой, самосвал или тягач то включается перевод км в часы или наоборот в зависмости от того что заведено на клиенте

            if ((tmList.get(0).transporttypeCode == TKTransportType.TRACTORTRAILER ||
                    tmList.get(0).transporttypeCode == TKTransportType.BOARD ||
                    tmList.get(0).transporttypeCode == TKTransportType.TRUCK ) && (machinehours.doubleValue() == 0))  {

                    // перевод из часов в км если машина одна из трех типов
                    machinehours = distance.divide(tmList.get(0).basicSpeed,2,BigDecimal.ROUND_HALF_UP);
                        }

            //присвоим нормочасы для каждой машины на работе
            soLogic.updateMachineHoursByPlanItemCode(pi.code , machinehours );


            if ((tmList.get(0).transporttypeCode == TKTransportType.TRACTORTRAILER ||
                    tmList.get(0).transporttypeCode == TKTransportType.BOARD ||
                    tmList.get(0).transporttypeCode == TKTransportType.TRUCK ) && (distance.doubleValue() == 0))  {


                // перевод из км в часы если машина одна из трех типов
            distance = machinehours.multiply(tmList.get(0).basicSpeed).setScale(2, BigDecimal.ROUND_HALF_UP);

            }

        // на работу накидываются расстояния для машины
        soLogic.createDistancesByPlanItemCodeNotLicensed(pi.code , distance );
            }
        }

        object.dateEdit = new Date();
        object.userGen = getUserProfile().userName;
        dao.save(object);

        ServicesLogic soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        if (clTypeList.get(0).isnotlicensedactivity != 1.0 ) {
        soLogic.createDistancesByPlanCode(planCalc);
        }

        // обновм сумму договора БЕЗ НДС
        BigDecimal contractCostWithoutVAT = new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).calculateServices(planCalc) ;

        ENServicesObject soObj = soLogic.getServicesObjectByPlanCode(planCalc);
        soObj.contractServicesSumma = contractCostWithoutVAT;
        new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).save(soObj);

        // тут перерасчет таблиц калькуляций (данные с (кошторис единичный) множим на количество работ к кошторисе  )
        ServicesLogic sooLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        sooLogic.recalculateCalculations(object);

    }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't savePlanWorkItemsByClassificationTypeForCalculation ",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
  }




	public void removePlanWorkItemsByClassificationTypeForCalculation(int plan2classificationTypeCode) {
		try {

			PlanWorkItemLogic planWorkItemLogic = new PlanWorkItemLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			planWorkItemLogic.removePlanWorkItemsByClassificationTypeForCalculation(plan2classificationTypeCode);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't removePlanWorkItemsByClassificationTypeForCalculation.", e);
		} finally {
			closeConnection();
		}
	}


	public void removePlanWorkItemsByClassificationTypeForCalculation_(int plan2classificationTypeCode) {
		try {

			PlanWorkItemLogic planWorkItemLogic = new PlanWorkItemLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			planWorkItemLogic.removePlanWorkItemsByClassificationTypeForCalculation_(plan2classificationTypeCode);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't removePlanWorkItemsByClassificationTypeForCalculation.", e);
		} finally {
			closeConnection();
		}
	}



	public int addForCalculation(ENPlanWorkItem object, BigDecimal distance) {
		return addForCalculation(object, distance, ENPlanWorkKind.CALCULATION, false, Integer.MIN_VALUE);

	}

	public int addForCalculation(ENPlanWorkItem object, BigDecimal distance, boolean priconnections) {
		return addForCalculation(object, distance, ENPlanWorkKind.CALCULATION, false, Integer.MIN_VALUE);
	}

	public int addForCalculation(ENPlanWorkItem object, BigDecimal distance, int planKindCode, boolean priconnections,
			int soCode) {
		return addForCalculation(object, distance, planKindCode, priconnections, soCode, null, null);
	}


	public int addForCalculation(ENPlanWorkItem object, BigDecimal distance, int planKindCode, boolean priconnections,
			int soCode, TKMaterials2TKMaterialsShort m2mShort, Date customPlanDate) {
		try {

			PlanWorkItemLogic planWorkItemLogic = new PlanWorkItemLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			return planWorkItemLogic.addForCalculation(object, distance, planKindCode, priconnections, soCode, m2mShort,
					customPlanDate);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENPlanWorkItem%} object.",
					e);
		} finally {
			closeConnection();
		}
	}


	@Override
	public void save(ENPlanWorkItem object) {
		this.save(object, false, true);
	}

	public void save(ENPlanWorkItem object, boolean isForAutoPlanOwnProduction) {
		this.save(object, isForAutoPlanOwnProduction, true);
	}

	public void save(ENPlanWorkItem object, boolean isForAutoPlanOwnProduction, boolean checkMonthPlan) {
		try {

			if (object.planRef.code == Integer.MIN_VALUE) {
				new EnergyproSystemException("planRef not found");
			}

			AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			if (!l.checkPermission4PlanItems(object.planRef.code)) {
				throw new EnergyproSystemException("\n\n"
						+ "Acces denied for method addBy... from method ENPlanWorkItem.save()");
			}

			PlanWorkLogic logic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			if (logic.isNotEditablePlan(object.planRef.code)) {
				throw new EnergyproSystemException("PlanWork closed or canceled , code=" + object.planRef.code);
			}

     		ENPlanWork plan = logic.getPlanByCode(object.planRef.code);

     		/* 06.03.2012 +++ В.С. для перевозки грузов МОЛ не нужен */
			ElementLogic elementLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			int eType = elementLogic.getElementTypeByPlan(plan);

			boolean isCargo = false;
			if (eType == ENElementType.CARGO_OBJECT) {
				isCargo = true;
			}

			if (eType != ENElementType.CARGO_OBJECT) {
				if (plan.kind.code == ENPlanWorkKind.CURRENT) {
					logic.validateMOLinPlan(plan.code);
				}
			}


     		/* для перевозки грузов - проверим наличие нормативных материалов */
     		/*SUPP-5477 Не проверять если работа обнуляется*/
			if (object.countGen.compareTo(new BigDecimal(0)) > 0)
				if (object.kartaRef.code == ENConsts.MATERIALS_TRUCKING
						|| object.kartaRef.code == ENConsts.MATERIALS_LOADS) {
					logic.validateMaterialsTrucking(object.code, object.planRef.code, isCargo);
				}


		    /* для перевозки персонала - проверим наличие нормативных должностей */
		    //  NET-3257 если кол-во работ больше 0 то проверяем на работников иначе нет .
			if ((object.kartaRef.code == ENConsts.ADMIN_TRUCKING || object.kartaRef.code == ENConsts.HUMEN_TRUCKING)
					&& object.countGen.doubleValue() > 0.0) {
				logic.validateHumenTrucking(object.code);
			}


     		///// На месячном плане, сформированном путем перехода из "Кошториса", изменять работы нельзя!
			if (plan.kind.code == ENPlanWorkKind.CURRENT) {
				if (logic.isCurrentPlanFromCalculation(plan)) {
					throw new EnergyproSystemException("\n\n"
							+ "Змінювати роботи у місячному плані, сформованому з кошторису для послуг на сторону, заборонено!");
				}
			}
     		/////
  			if (eType != ENElementType.SERVICES_OBJECT) {
				if (object.countGen.compareTo(new BigDecimal(0)) > 0)
					logic.checkForProhibitedTechCard(object.kartaRef.code, object.planRef.code, eType, "Роботи можливо тільки обнулити!");
  			}
  			/////

  			logic.validateENPlanWorkItemSource(object, eType);

  			//ENPlanWorkDAO pwDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
  			//ENPlanWork pw = pwDAO.getObject(object.planRef.code);

			ENPlanWorkItemDAO objectDAO = new ENPlanWorkItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.dateEdit = new Date();
			object.userGen = getUserProfile().userName;

    		// запомним предыдущий обьект ...
     		ENPlanWorkItem oldItem = objectDAO.getObject(object.code);

     		// NET-1974 Запрет на изменение цены работы если есть акт, кот. не черновой, т.к. цена работы
   			// отображается в акте договоров-подряда и её изменение приведет к изменению самого акта.
			{
				BigDecimal costGenOld = (oldItem.costGen != null ? oldItem.costGen : new BigDecimal(0));
				BigDecimal costGenNew = (object.costGen != null ? object.costGen : new BigDecimal(0));
				if (!costGenOld.equals(costGenNew)) {
					ActLogic actLogic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
					ENAct actObj = actLogic.getActByPlanCode(plan.code, false);
					if (actObj != null) {
						if (actObj.statusRef.code != ENActStatus.GOOD) {
							throw new EnergyproSystemException("\n\n"
									+ "Акт № " + actObj.numberGen + " повинен бути чорновим для зміни ціни роботи");
						}
					}
				}
			}

			// Проверка для собственного производства
			if (!isForAutoPlanOwnProduction && logic.isAutoPlanForOwnProduction(object.planRef.code)
					&& object.countGen.compareTo(oldItem.countGen) != 0) {
				throw new EnergyproSystemException("\n\n"
						+ "Цей план автоматично сгенерований для виробництва, неможливо змінити кількість робіт.");
			}


			objectDAO.save(object);

		    /** SUPP-60844... 01.06.2017 +++ для плановых - проверяем объем работ согласно месячного плана */
			if (checkMonthPlan && object.countGen.doubleValue() != 0) {
				if (plan.formRef.code == ENPlanWorkForm.PLANNED
						&& (plan.kind.code == ENPlanWorkKind.NPW || plan.kind.code == ENPlanWorkKind.FACT)) {

					/** SUPP-63543... +++ проверка - если изменилось кол-во работ... */
		    		if (oldItem.countGen.doubleValue() != object.countGen.doubleValue()) {

		    			int monthPlanCode = logic.getMonthPlanCodeByAnyPlanCode(plan.code);
		    			ENPlanWorkItemForClosePlanShortList planWorkItemForClosePlanShortList = logic.getPlanWorkItemForClosePlanList(monthPlanCode, object.kartaRef.code);

		    			if (planWorkItemForClosePlanShortList.totalCount > 0) {
		    				double monthPlanCountGen = planWorkItemForClosePlanShortList.get(0).monthPlanCountGen.doubleValue();
		            		double factCountGen = planWorkItemForClosePlanShortList.get(0).factCountGen.doubleValue();
		            		double npzCountGen = planWorkItemForClosePlanShortList.get(0).npzCountGen.doubleValue();

		            		System.out.println("#############  monthPlanCountGen = " + monthPlanCountGen
		            				+ " :: factCountGen = " + factCountGen + " :: npzCountGen = " + npzCountGen + " :: planCode = " + plan.code + " :: user = " + getUserProfile().userName);

		            		if ( (factCountGen + npzCountGen) > monthPlanCountGen ) {
		            			throw new SystemException("\n\n"
		            					+ "Кількість робіт не повинна перевищувати обсяг робіт місячного плану!\n"
		            			 		+ "Код місячного плану: " + monthPlanCode + ".\n"
		            			 		+ "У місячному плані: " + monthPlanCountGen + ".\n"
		            			 		+ "Загальна кількість виконаних робіт - Факти: " + factCountGen + ".\n"
		            			 		+ "Чорнові завдання - плани: " + npzCountGen + ".");
							}
						}
					}
				}
			}

			if (Math.abs(oldItem.countGen.doubleValue() - object.countGen.doubleValue()) > 0.001) {

    	 		/** NET-4422... 05.03.2015... +++ услуга по замене счетчика (переход на многотарифный учет) */
				if (eType != ENElementType.SERVICES_OBJECT) {
					// если есть счетчик - пока залочим изменение ВООБЩЕ ...
					if (plan.kind.code == ENPlanWorkKind.FACT) {
						logic.checkInSCCounterByPlanCode(plan.code);
					}
				}

		        // пересчитаем смету ...
		        EstimateLogic eLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		        HumenLogic hLogic = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		        TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		        TransportOrderLogic toLogic = new TransportOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

		        // путевой лист для тр-та ...
		        // AS 11.03.2011 перехало в recalcENTransportItemsByPlanItemCode
		        //tLogic.checkTransportItemInTravelSheetByPlanItemCode(object.code, true);

		        // проверим нет мат-лов взаявке ...
		        eLogic.checkOnRQinPlanWorkItem(object.code);

		        // 31.12.10 Проверка на связь материала с договором
		        eLogic.checkInContractByPlanWorkItemCode(object.code);

		        // обнуляют !!!
		        // а развязанные в резерве материалы остаються !!!!!!!!!!
		        if ( object.countGen.doubleValue() == 0){
		            FINMaterialsShortList finList = eLogic.getFINMaterialsListByPlanItemCode(object.code , Integer.MIN_VALUE);

		            if (finList.totalCount > 0){
		                throw new EnergyproSystemException("зачем резервировали материалы ??? а теперь обнуляете работы !!!");
		            }

		            // Проверим работу на наличие в ней пломб
		            logic.checkSealsInPlanWorkItem(object.code);

		            // проверим совм. доставку
		            //tLogic.validateEditableTransportByPlanItemCode(object.code);
		            tLogic.validateDeliveryOrderByPlanItemCode(object.code);

		            // и пересчитаем ВРЕМЯ доставки на ПЛАН ...
		            tLogic.createDeliveryTimeForPlan(object.planRef.code);

		            // 06.10.2017 Не дадим обнулить работу, если она уже включена в сменное задание
		            logic.checkPlanWorkItemInWorkOrderByt(object.code, "Змінювати кількість на нульову заборонено!");
		        }


		     /* 29.01.2020 SUPP-89106 Распоряжение руководства. Найти Коефіцієнт завантаження персоналу , фильтр по бюджетодержателю, источнику, и типу акта
		      при изменении работы коефициент пока что автоматом пересчитывать не нужно начальник сказал. пересчитывается только если выбирают с клиента - как и было .
		        try{
		        if (object.kartaRef.code != Integer.MIN_VALUE){
		        	TKTechCardDAO tkDAO = new TKTechCardDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		        	ENPlanWorkItem2TKKoefDAO pl2koeDAO = new ENPlanWorkItem2TKKoefDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

		        	TKTechCard tkObj = tkDAO.getObject(object.kartaRef.code);
		        	{
		        		TKTechCardSourceKoefDAO srsKoefDAO = new TKTechCardSourceKoefDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		        		TKTechCardSourceKoefFilter srsKofFil = new TKTechCardSourceKoefFilter();
		        		srsKofFil.budgetRef.code = plan.budgetRef.code;
		        		srsKofFil.workStateRef.code = plan.stateRef.code;
		        		srsKofFil.techCardSourceRef.code = tkObj.techcardsource.code;
		        		int[] srsKofArr = srsKoefDAO.getFilteredCodeArray(srsKofFil, 0, -1);

		        		if(srsKofArr.length>0){
		        			Context context = new InitialContext();
		                    Object pwi2koefRef = context.lookup(ENPlanWorkItem2TKKoefController.JNDI_NAME);

		                    ENPlanWorkItem2TKKoefControllerHome pwi2koefHome = (ENPlanWorkItem2TKKoefControllerHome) PortableRemoteObject.narrow(pwi2koefRef, ENPlanWorkItem2TKKoefControllerHome.class);
		                    ENPlanWorkItem2TKKoefController pwi2koefController;

		                    pwi2koefController = pwi2koefHome.create();

		                    // вынеcем старый коеф и занесем новый
		                    ENPlanWorkItem2TKKoefFilter pi2koefFil = new ENPlanWorkItem2TKKoefFilter();
		                    pi2koefFil.planWorkItemRef.code = object.code;
		                    int[] pl2foefArr = pl2koeDAO.getFilteredCodeArray(pi2koefFil, 0, -1);
		                    if(pl2foefArr.length>0){
		                    	pwi2koefController.remove(pl2foefArr[0]);
		                    }

		                    ENPlanWorkItem2TKKoef item2tkKoef = new ENPlanWorkItem2TKKoef();
		    				item2tkKoef.planWorkItemRef.code=object.code;
		    				item2tkKoef.sourceKoef.code=srsKofArr[0];
		    				pwi2koefController.add(item2tkKoef);
		        		}




		        	}
		        }
		        } catch (PersistenceException e) {
					throw new SystemException(e.getMessage(), e);
				}
				catch (NamingException e) {
					throw new SystemException(e.getMessage(), e);
				}
				catch (RemoteException e) {
					throw new SystemException(e.getMessage(), e);
				}
				catch (CreateException e) {
					throw new SystemException(e.getMessage(), e);
				} */
        		// пресчитаем ВРЕМЯ на работе ... для коэф ...
        		new PlanWorkItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) ,getUserProfile()).updateCoef(object.code);

        		ENEstimateItemDAO estimateDAO = new ENEstimateItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        		ENEstimateItemFilter estimateFilter = new ENEstimateItemFilter();

        		// пропорционалный расчет мат-лов .. от колва работ ..

				// вначале запомним что было до перерасчета ...
				ENEstimateItemShortList oldEList = new ENEstimateItemShortList();
				if (((plan.kind.code == ENPlanWorkKind.NPW) || (plan.kind.code == ENPlanWorkKind.FACT))
						&& (plan.typeRef.code == ENPlanWorkType.AVR)) {

					estimateFilter = new ENEstimateItemFilter();
					estimateFilter.planItemRef.code = object.code;
					estimateFilter.kindRef.code = ENEstimateItemKind.MATERIALS;

					oldEList = estimateDAO.getScrollableFilteredList(estimateFilter, 0, -1);

					eLogic.recalcENEstimateItemsByPlanItemCodeAVR(object.code);

				} else {

					TKTechCardDAO techCardDao = new TKTechCardDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
					TKTechCard techCard = techCardDao.getObject(object.kartaRef.code);

					boolean servicesFromSide = false;
					if (techCard.techcardsource.code == TKTechCardSource.SERVICES_FROM_SIDE) {
						servicesFromSide = true;
					}

					eLogic.recalcENEstimateItemsByPlanItemCode(object.code, true, servicesFromSide , oldItem.countGen );

				}

		        // пересчитаем людей ...
		        hLogic.recalcHumenItemsByPlanItemCode(object.code);
		        // пересчитаем транспорт
		        tLogic.recalcENTransportItemsByPlanItemCode(object.code);


        		// -------------------------------

        		// для АВР на НПЗ/Факте накинет такую же работу на Месячный .. если надо .. или увеличим кол-во работ ...
        		if ((( plan.kind.code == ENPlanWorkKind.NPW ) || ( plan.kind.code == ENPlanWorkKind.FACT )) && (plan.typeRef.code == ENPlanWorkType.AVR ))
        		{

            		AVRLogic avrLogic = new AVRLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            		avrLogic.recalcCurrentAVRByPlanWorkItem(object, oldItem.countGen , oldEList);

		            /*
		            ENEstimateItem2ENEstimateItemDAO e2eDAO = new ENEstimateItem2ENEstimateItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());


		            ENPlanWorkItem parentCurrentPlanItem = logic.getParentCurrentPlanWorkItem(object.code);
		            // работы не было ... накинем ...
		            if (parentCurrentPlanItem.code == Integer.MIN_VALUE ){

		                parentCurrentPlanItem.kartaRef.code = object.kartaRef.code;
		                parentCurrentPlanItem.countGen = object.countGen;
		                parentCurrentPlanItem.commentGen = "работа создана с дочернего плана";
		                objectDAO.add(parentCurrentPlanItem);

		                //EstimateLogic eLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		                //eLogic.cancelENEstimateItem(object.code); // при добавлении нечего пересчитывать ...
		                //eLogic.createENEstimateItems(parentCurrentPlanItem.code);
		                estimateFilter = new ENEstimateItemFilter();

		                estimateFilter.planItemRef.code = object.code;
		                estimateFilter.kindRef.code = ENEstimateItemKind.MATERIALS;

		                int[] eArr = estimateDAO.getFilteredCodeArray(estimateFilter, 0, -1);
		                for (int ii=0; ii < eArr.length; ii++){
		                    ENEstimateItem e = estimateDAO.getObject(eArr[ii]);
		                    e.planItemRef.code = parentCurrentPlanItem.code;
		                    e.planRef.code = parentCurrentPlanItem.planRef.code;
		                    estimateDAO.add(e);

		                    ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
		                    e2e.estimateItemInRef.code = e.code;
		                    e2e.estimateItemOutRef.code = eArr[ii];
		                    e2e.countGen = e.countFact;
		                    e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
		                    e2eDAO.add(e2e);
		                }
		            }
		            else
		            {
		                // работа была в поточном ...
		                BigDecimal workCount = object.countGen.subtract( oldItem.countGen ).setScale(3, BigDecimal.ROUND_HALF_UP);

		                parentCurrentPlanItem.countGen = parentCurrentPlanItem.countGen.add( workCount ).setScale(3, BigDecimal.ROUND_HALF_UP);
		                if (parentCurrentPlanItem.countGen.doubleValue() < 0.001){
		                    parentCurrentPlanItem.countGen = new BigDecimal(0);
		                }
		                objectDAO.save(parentCurrentPlanItem);


		                estimateFilter = new ENEstimateItemFilter();
		                estimateFilter.planItemRef.code = object.code;
		                estimateFilter.kindRef.code = ENEstimateItemKind.MATERIALS;

		                ENEstimateItemShortList estimateList = estimateDAO.getScrollableFilteredList(estimateFilter, 0, -1);
		                for (int ii=0; ii < estimateList.totalCount; ii++){
		                    ENEstimateItemFilter estimateFilter1 = new ENEstimateItemFilter();
		                    estimateFilter1.materialRef.code = estimateList.get(ii).materialRefCode;
		                    estimateFilter1.planItemRef.code = parentCurrentPlanItem.code;
		                    estimateFilter1.kindRef.code = ENEstimateItemKind.MATERIALS;
		                    int[] eArr = estimateDAO.getFilteredCodeArray(estimateFilter1, 0, -1);
		                    if (eArr.length == 0){
		                        // мат-л не найден ... накинем его ...
		                        ENEstimateItem e1 = estimateDAO.getObject(estimateList.get(ii).code);
		                        e1.planRef.code = parentCurrentPlanItem.planRef.code;
		                        e1.planItemRef.code = parentCurrentPlanItem.code;
		                        estimateDAO.add(e1);

		                        ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
		                        e2e.estimateItemInRef.code = e1.code;
		                        e2e.estimateItemOutRef.code = estimateList.get(ii).code;
		                        e2e.countGen = estimateList.get(ii).countFact;
		                        e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
		                        e2eDAO.add(e2e);

		                    }
		                    else{
		                        for (int qq=0; qq<eArr.length; qq++){
		                            ENEstimateItem e1 = estimateDAO.getObject(eArr[qq]);
		                            BigDecimal deltaP = new BigDecimal(0);
		                            BigDecimal deltaF = new BigDecimal(0);
		                            for (int qq1=0; qq1 < oldEList.totalCount; qq1++){
		                                if (oldEList.get(qq1).code == estimateList.get(ii).code){
		                                    deltaF = estimateList.get(ii).countFact.subtract(oldEList.get(qq1).countFact).setScale(6, BigDecimal.ROUND_HALF_UP);
		                                    deltaP = estimateList.get(ii).countGen.subtract(oldEList.get(qq1).countGen).setScale(6, BigDecimal.ROUND_HALF_UP);
		                                }
		                            }


		                            e1.countGen = e1.countGen.add(deltaP).setScale(6, BigDecimal.ROUND_HALF_UP);
		                            e1.countFact = e1.countFact.add(deltaF).setScale(6, BigDecimal.ROUND_HALF_UP);

		                            if (e1.countGen.doubleValue() < 0.000001 ){
		                                e1.countGen = new BigDecimal(0);
		                            }
		                            if (e1.countFact.doubleValue() < 0.000001 ){
		                                e1.countFact = new BigDecimal(0);
		                            }

		                            estimateDAO.save(e1);

		                            ENEstimateItem2ENEstimateItem e2e = new ENEstimateItem2ENEstimateItem();
		                            e2e.estimateItemInRef.code = e1.code;
		                            e2e.estimateItemOutRef.code = estimateList.get(ii).code;
		                            e2e.countGen = estimateList.get(ii).countFact;
		                            e2e.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
		                            e2eDAO.add(e2e);
		                        }
		                    }
		                }

		            }
		        */

		        }
		        //---------------------------- Проверим если работа "ПЕРЕВЕЗЕННЯ персоналу енергосбуту " тогда апдейтим бюджетодержателя на плане (ставим ЕНЕРГОСБЫТ)
		        if  ( object.kartaRef.code ==  500004872 ) {
		            plan.budgetRef.code = ENConsts.ENBUDGET_ENERGOSBYT;
		            ENPlanWorkDAO planDao = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		            planDao.save(plan);
		        }

        		/*Проверка включения в транспортную заявку, если работа обнуляется*/
		        if (object.countGen.doubleValue() <= 0)
        		{
        			toLogic.checkENTransportItemInTransportOrderByENPlanWorkItemCode(object.code);
        		}

        		// ---------------------------

        		// 24.02.12 NET-1355 Пересчитываем дату окончания и общее время выполнения работ
        		logic.recalcTotalTime(object.planRef.code);

        		/////
        		// NET-4440 Создаем запись в истории ГСМ по плану
        		logic.generatePlanFuelHistory(object.planRef.code, plan.dateStart);
        		/////


				/** Обновление стоимости на договоре подряда на выполнение ПКД... */
				ServicesLogic servicesLogic = new ServicesLogic(
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

				if (servicesLogic.checkServicesProject(plan.elementRef.code)) {

					int agreement2soCode = servicesLogic.getAgreement2soCode(plan.elementRef.code);
					servicesLogic.recalcServicesProject(agreement2soCode);
				}

			}
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENPlanWorkItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


  public void saveForCalculationSilent(ENPlanWorkItem object, BigDecimal distance) {

    saveForCalculation(object, distance, true);
    try {
        /** пересчитаем калькуляцию */
        ServicesLogic soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

        ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

        ENServicesObject soObject = soLogic.getServicesObjectByPlanCode(object.planRef.code);
        // ???? soLogic.createDistances(soObject, soObject.contractServicesDistance);
        soObject.contractServicesSumma = soLogic.calculateContractByElementCode(soObject.element.code);
        soDAO.save(soObject);

    } catch (PersistenceException e) {
        throw new EnergyproSystemException(e.getMessage(),e);
    }
      catch (DatasourceConnectException e) {
        throw new EnergyproSystemException(e.getMessage(),e);
    }

  }


  public void saveForCalculation(ENPlanWorkItem object, BigDecimal distance) {
    saveForCalculation(object, distance, false);
  }


  public void saveForCalculation(ENPlanWorkItem object, BigDecimal distance, boolean priconnections)
  {
   try
    {

     if ( object.planRef.code == Integer.MIN_VALUE){
        new EnergyproSystemException("planRef not found");
     }

     if (object.countGen.doubleValue() <= 0 && !priconnections){
        throw new EnergyproSystemException("Кількість робіт повинна бути більшою за 0!");
     }

      /*
    AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
    if ( ! l.checkPermission4PlanItems( object.planRef.code ))
    {
        throw new EnergyproSystemException("Acces denied for method addBy... from method ENPlanWorkItem.save()");
    }
    */

     PlanWorkLogic logic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
     ENPlanWork plan = logic.getPlanByCode(object.planRef.code);

     if ((plan.kind.code != ENPlanWorkKind.CALCULATION)&&(plan.kind.code != ENPlanWorkKind.CALCULATION_SINGLE)) {
         //logic.validateMOLinPlan(plan.code);
         throw new EnergyproSystemException("Цей план не є КОШТОРИСОМ!");
      }

     if (!priconnections) {
         if (logic.isNotEditablePlan(object.planRef.code)) {
            throw new EnergyproSystemException("PlanWork closed or canceled , code="+object.planRef.code);
         }

         ServicesLogic sLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
         sLogic.checkEditableCalculation(plan, true);
     }



     /* уехало снаружи ... при сохранении ВСЕГО КЛАСИФИКАТОРА
     ENServicesObject servicesObj = sLogic.getServicesObjectByElementCode(plan.elementRef.code);
     if (servicesObj.contractServicesDistance != null)
     {
        if (servicesObj.contractServicesDistance.doubleValue() != distance.doubleValue())
        {
            servicesObj.contractServicesDistance = distance;
            sLogic.createDistances(servicesObj, servicesObj.contractServicesDistance);
        }
     }
     else
     {
        servicesObj.contractServicesDistance = distance;
        new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).save(servicesObj);
        sLogic.createDistances(servicesObj, servicesObj.contractServicesDistance);
     }
     */

     //ENPlanWorkDAO pwDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
     //ENPlanWork pw = pwDAO.getObject(object.planRef.code);


     ///////////////////////////////////////////////////////////////////////////
     // Подкинем бюджетодержателя из техкарты
     boolean isBudgetEmpty = false;

     if (plan.budgetRef == null)
     {
        isBudgetEmpty = true;
     }

     if (plan.budgetRef.code == Integer.MIN_VALUE)
     {
        isBudgetEmpty = true;
     }

     if (isBudgetEmpty)
     {
        //plan = planDao.getObject(plan.code);
        TKTechCardDAO tcDao = new TKTechCardDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        TKTechCard tc = tcDao.getObject(object.kartaRef.code);

        if (tc.budgetRef != null)
        {
            if (tc.budgetRef.code > Integer.MIN_VALUE)
            {
                plan.budgetRef.code = tc.budgetRef.code;
                ENPlanWorkDAO planDao = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                planDao.save(plan);
            }
        }
     }
     ///////////////////////////////////////////////////////////////////////////


     ENPlanWorkItemDAO objectDAO = new ENPlanWorkItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


    object.dateEdit = new Date();
    object.userGen = getUserProfile().userName;

    // запомним предыдущий обьект ...
     ENPlanWorkItem oldItem = objectDAO.getObject(object.code);


     objectDAO.save(object);


     if ( Math.abs( oldItem.countGen.doubleValue() - object.countGen.doubleValue()) > 0.001)
     {
        // пересчитаем смету ...
        EstimateLogic eLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        HumenLogic hLogic = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        // путевой лист для тр-та ...
        // AS 11.03.2011 перехало в recalcENTransportItemsByPlanItemCode
        //tLogic.checkTransportItemInTravelSheetByPlanItemCode(object.code, true);

        /*
        // проверим нет мат-лов взаявке ...
        eLogic.checkOnRQinPlanWorkItem(object.code);

        // 31.12.10 Проверка на связь материала с договором
        eLogic.checkInContractByPlanWorkItemCode(object.code);
         */


        // пресчитаем ВРЕМЯ на работе ... для коэф ...
        new PlanWorkItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) ,getUserProfile()).updateCoef(object.code);

        // пропорционалный расчет мат-лов .. от колва работ ..

        // вначале запомним что было до перерасчета ...
        //ENEstimateItemShortList oldEList = new ENEstimateItemShortList();

        eLogic.recalcENEstimateItemsByPlanItemCode(object.code);

        // пересчитаем людей ...
        hLogic.recalcHumenItemsByPlanItemCode(object.code, true);
        // пересчитаем транспорт
        tLogic.recalcENTransportItemsByPlanItemCode(object.code);

        /////
        // NET-4440 Создаем запись в истории ГСМ по плану
        logic.generatePlanFuelHistory(object.planRef.code, plan.dateStart);
        /////
     }
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENPlanWorkItem%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
  }




  @Override
public void remove(int code)
  {
   try
    {


     ENPlanWorkItemDAO objectDAO = new ENPlanWorkItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
     ENPlanWorkItem object = objectDAO.getObject(code);

     if ( object.planRef.code == Integer.MIN_VALUE){
        throw new EnergyproSystemException("planRef not found");
     }

     PlanWorkLogic logic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
     PlanWorkItemLogic pLogic = new PlanWorkItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

     ENPlanWork plan = logic.getPlanByCode(object.planRef.code);

    AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
    //if ( ! l.checkPermission4PlanItems( object.planRef.code ))
    if ( ! l.checkPermission4PlanItems(plan))
    {
        throw new EnergyproSystemException("Acces denied for method addBy... from method ENPlanWorkItem.remove()");
    }


     if (logic.isNotEditablePlan(plan)) {
        throw new EnergyproSystemException("PlanWork closed or canceled , code="+object.planRef.code);
     }


     if (plan.kind.code != ENPlanWorkKind.YEAR) {
         throw new EnergyproSystemException("Работы УДАЛЯТЬ НЕЛЬЗЯ !!!! ... Только с Годового Чернового ...");
     }


     EstimateLogic eLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

     // 31.12.10 Проверка на связь материала с договором
    eLogic.checkInContractByPlanWorkItemCode(object.code);

     // удалим смету
    eLogic.removeENEstimateItemsByPlanItemCode(code);

      // удалим людей ...
      HumenLogic hLogic = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
      hLogic.removeHumenItemsByPlanItemCode(object.code);

      // удалим транспорт
      TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
      tLogic.removeENTransportItemsByPlanItemCode(object.code);


      // must be DELETEd COEFFFFFFFF for PlanWorkItem ..

      // проверить ЗАЯВКУ
      eLogic.checkOnRQinPlanWorkItem(object.code);


      if (plan.kind.code == ENPlanWorkKind.CURRENT){
        logic.validateMOLinPlan(plan.code);
      }

      /*Удаление коэффициентов загрузки персонала в работе*/
      pLogic.deleteTKKoefByPlanWorkItemCode(code);


     objectDAO.remove(code);

     // 24.02.12 NET-1355 Пересчитываем дату окончания и общее время выполнения работ
     logic.recalcTotalTime(object.planRef.code);

     /////
     // NET-4440 Создаем запись в истории ГСМ по плану
     logic.generatePlanFuelHistory(object.planRef.code, plan.dateStart);
     /////

    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENPlanWorkItem%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
  }



	public void removeForCalculation(int code) {
		removeForCalculation(code, false);
	}

	public void removeForCalculation(int code, boolean priconnection) {
		try {

			PlanWorkItemLogic planWorkItemLogic = new PlanWorkItemLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			planWorkItemLogic.removeForCalculation(code, priconnection);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENPlanWorkItem%} object.",
					e);
		} finally {
			closeConnection();
		}
	}


    public int addPlanByListOperationsNotLicensed(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, String condition, int planKindCode) {
        return addPlanByListOperationsNotLicensed(object, distance,
                machinehours, condition, planKindCode, false);
    }

    // для нелицензированных работ + (выборочные операции)
    public int addPlanByListOperationsNotLicensed(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, String condition, int planKindCode, boolean priconnections) {
        try {
            TKClassificationTypeDAO clTypeDAO = new TKClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            TKClassificationTypeFilter clTypeFilter = new TKClassificationTypeFilter();
            ServicesLogic soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            TKTechCardDAO techCardDAO = new TKTechCardDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            TKTechCardFilter techCardFilter = new TKTechCardFilter();
            techCardFilter.classificationType.code = object.classificationTypeRef.code;
            techCardFilter.conditionSQL = "code in (" + condition + ")";

            int[] techCardArr = techCardDAO.getFilteredCodeArray(techCardFilter, 0, -1);

            if (techCardArr.length == 0) {
                throw new EnergyproSystemException(
                        "Не знайдено операції(тех.карти) для класифікатора з кодом "
                                + object.classificationTypeRef.code);
            }


            //////////////////////////////////////////////
            // Проверка на совпадение видов работ из Услуг
            soLogic.checkFinWorkTypes(object);
            //////////////////////////////////////////////

            clTypeFilter.code = object.classificationTypeRef.code;
            TKClassificationTypeShortList clTypeList = clTypeDAO.getScrollableFilteredList(clTypeFilter, 0, -1);

            this.checkCurrentUserCanAddCalculationsFromTestSources(clTypeList.get(0).code, clTypeList.get(0).techcardsourceCode);

            this.setParametersOnDate(object, new Date());

            int piCode = Integer.MIN_VALUE;
            int planCode = object.planRef.code;
            for (int i = 0; i < techCardArr.length; i++) {
                ENPlanWorkItem piObj = new ENPlanWorkItem();
                piObj.planRef.code = planCode;
                piObj.kartaRef.code = techCardArr[i];
                piObj.countGen = object.countGen;
                piCode = this.addForCalculation(piObj, distance, planKindCode, priconnections, Integer.MIN_VALUE);

                // проверяем тип класификатора (лицензированная работа или нет)
                // если нелицензированная тогда расчет отдельный
                if (clTypeList.get(0).isnotlicensedactivity == 1.0) {

                    // марка транспорта
                    TKTransportMarkDAO transportMarkDAO = new TKTransportMarkDAO(
                            getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                    TKTransportMarkFilter tmarkfilter = new TKTransportMarkFilter();
                    tmarkfilter.conditionSQL = "code in (select trm.code from tkclassificationtype c, tktechcard th, "
                            + " tkelement2techcard e2t, tkelement te, tktransport tr, tktransportmark trm "
                            + " where c.code = " + object.classificationTypeRef.code
                            + " and c.code = th.classificationtypecode "
                            + " and e2t.techkartcode = th.code "
                            + " and e2t.elementcode = te.code "
                            + " and te.elementtypecode = 240000002 "
                            + " and te.code = tr.elementcode "
                            + " and tr.transportmarkcode = trm.code)";

                    TKTransportMarkShortList tmList = transportMarkDAO.getScrollableFilteredList(tmarkfilter, 0, -1);

                    // если тип транспорта бортовой, самосвал или тягач то
                    // включается перевод км в часы или наоборот в зависмости от
                    // того что заведено на клиенте

                    if ((tmList.get(0).transporttypeCode == TKTransportType.TRACTORTRAILER ||
                            tmList.get(0).transporttypeCode == TKTransportType.BOARD ||
                            tmList.get(0).transporttypeCode == TKTransportType.TRUCK )
                            && (machinehours.doubleValue() == 0)) {

                        // перевод из часов в км если машина одна из трех типов
                        machinehours = distance.divide(tmList.get(0).basicSpeed, 2, BigDecimal.ROUND_HALF_UP);
                    }

                    // присвоим нормочасы для каждой машины на работе
                    soLogic.updateMachineHoursByPlanItemCode(piCode, machinehours);

                    if ((tmList.get(0).transporttypeCode == TKTransportType.TRACTORTRAILER ||
                            tmList.get(0).transporttypeCode == TKTransportType.BOARD ||
                            tmList.get(0).transporttypeCode == TKTransportType.TRUCK )
                            && (distance.doubleValue() == 0)) {

                        // перевод из км в часы если машина одна из трех типов
                        distance = machinehours.multiply(tmList.get(0).basicSpeed).setScale(2, BigDecimal.ROUND_HALF_UP);
                    }

                    // на работу накидываются расстояния для машины
                    soLogic.createDistancesByPlanItemCodeNotLicensed(piCode, distance);
                }
                if (planCode == Integer.MIN_VALUE) {
                    // как то оно хитро работает .. чуть шо передернуть piObj ;)
                    planCode = piObj.planRef.code;
                }
            }

            if (piCode == Integer.MIN_VALUE) {
                throw new EnergyproSystemException(
                        "Не додано жодної операції (тех.карти)");
            }

            object.planRef.code = planCode;

            ENPlanWork2ClassificationTypeDAO dao = new ENPlanWork2ClassificationTypeDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            object.userGen = getUserProfile().userName;
            object.dateEdit = new Date();
            int outCode = dao.add(object);

            if (clTypeList.get(0).isnotlicensedactivity != 1.0) {
                //***
                //*** soLogic.createDistancesByPlanCode(planCode);
                ServicesLogic soLogic1 = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                soLogic1.createDistancesByPlanCode(planCode);
                //***
            }

            // создадим доставку ...
            new HumenLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile()).createDeliveryTime(planCode);

            // обновм сумму договора БЕЗ НДС
            BigDecimal contractCostWithoutVAT = new ServicesCalculatorLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile()).calculateServices(object.planRef.code);

            ENServicesObject soObj = soLogic.getServicesObjectByPlanCode(planCode);
            soObj.contractServicesSumma = contractCostWithoutVAT;

            new ENServicesObjectDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile()).save(soObj);

            return outCode;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't save {%com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    // для нелицензированных работ + (выборочные операции)
    public int addPlanByListOperationsNotLicensed(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, String condition  ) {
        try
        {  // значение "isnotlicensedactivity" для работы (NULL или 0 значит лицензионая)
            TKClassificationTypeDAO clTypedAO = new TKClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            TKClassificationType clo = clTypedAO.getObject(object.classificationTypeRef.code);

            this.checkCurrentUserCanAddCalculationsFromTestSources(clo.code, clo.techcardsource.code);

            int result = Integer.MIN_VALUE;
            if (object.planRef.code == Integer.MIN_VALUE )
            {
                addPlanByListOperationsNotLicensed( object, distance , machinehours , condition , ENPlanWorkKind.CALCULATION_SINGLE );

                    ServicesLogic soLogic;

                    soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

                    ENServicesObject so = soLogic.getServicesObjectByPlanCode(object.planRef.code);

                    object.planRef.code = soLogic.addForCalculation(so,ENPlanWorkKind.CALCULATION);
                    result = addPlanByListOperationsNotLicensed( object, distance , machinehours , condition , ENPlanWorkKind.CALCULATION);


            }
            else
            {
                        // запоминаем код плана кошториса (не единичного)
                        int planCalc =  object.planRef.code;

                        //  для кошториса  единичного
                        int planCalcSingle = Integer.MIN_VALUE;

                        ENPlanWorkDAO planCalcSingleDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                        ENPlanWorkFilter planCalcSingleFilter = new ENPlanWorkFilter();
                        planCalcSingleFilter.conditionSQL =  " code = ( select pw2.code from enplanwork pw1 , enelement el , enplanwork pw2 \n" +
                        "                          Where pw1.elementrefcode = el.code \n" +
                        "                            and pw1.code =  " + object.planRef.code + " \n" +
                        "                            and pw1.kindcode = " + ENPlanWorkKind.CALCULATION + "   \n" +
                        "                            and pw2.elementrefcode = el.code  \n" +
                        "                            and pw2.kindcode = "+ ENPlanWorkKind.CALCULATION_SINGLE+" )";

                        ENPlanWorkShortList planCalcSingleList = planCalcSingleDAO.getScrollableFilteredList(planCalcSingleFilter, 0, -1);

                        planCalcSingle = planCalcSingleList.get(0).code;

                        //    если лицензионнная тогда делаем единичный план кошторис
                        // NET-2396 создание / редактировани единичного кошториса для всех видов работ if (isLicensed == 0 || isLicensed == Integer.MIN_VALUE){
                        object.planRef.code = planCalcSingle;
                        addPlanByListOperationsNotLicensed( object, distance , machinehours , condition , ENPlanWorkKind.CALCULATION_SINGLE );



                        // для кошториса не единичного
                        object.planRef.code = planCalc;
                        result =  addPlanByListOperationsNotLicensed( object, distance , machinehours , condition , ENPlanWorkKind.CALCULATION);


            }

            // тут перерасчет таблиц калькуляций (данные с (кошторис единичный) множим на количество работ к кошторисе  )
            ServicesLogic sooLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            sooLogic.recalculateCalculations(object);


            return result;

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException(e.getMessage(),e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }


    public int addPlanWorkItemsByClassificationTypeForCalculation2(
            ENPlanWork2ClassificationType object, BigDecimal distance, int codeRem) {
        return addPlanWorkItemsByClassificationTypeForCalculation2(object, distance, codeRem, false);
    }


	public int addPlanWorkItemsByClassificationTypeForCalculation2(
			ENPlanWork2ClassificationType object, BigDecimal distance,
			int codeRem, boolean priconnections, boolean addTU) {
		return addPlanWorkItemsByClassificationTypeForCalculation2(object,
				distance, codeRem, priconnections, addTU, null, false, Integer.MIN_VALUE, false, null);
	}


	public int addPlanWorkItemsByClassificationTypeForCalculation2(
			ENPlanWork2ClassificationType object, BigDecimal distance,
			int codeRem, boolean priconnections) {
		return addPlanWorkItemsByClassificationTypeForCalculation2(object,
				distance, codeRem, priconnections, null, false, Integer.MIN_VALUE, false, null);
	}

	public int addPlanWorkItemsByClassificationTypeForCalculation2(
			ENPlanWork2ClassificationType object, BigDecimal distance,
			int codeRem, boolean priconnections, Date customPlanDate) {
		return addPlanWorkItemsByClassificationTypeForCalculation2(object,
				distance, codeRem, priconnections, null, false, Integer.MIN_VALUE, false, customPlanDate);
	}


	public int addPlanWorkItemsByClassificationTypeForCalculation2(
			ENPlanWork2ClassificationType object, BigDecimal distance,
			int codeRem, boolean priconnections, ENServicesObject tempObject,
			boolean docFlowCustomerServices)
	{
		return addPlanWorkItemsByClassificationTypeForCalculation2(
				object, distance,
				codeRem, priconnections, tempObject,
				docFlowCustomerServices, Integer.MIN_VALUE, false, null);
	}


	public int addPlanWorkItemsByClassificationTypeForCalculation2(
			ENPlanWork2ClassificationType object, BigDecimal distance,
			int codeRem, boolean priconnections, ENServicesObject tempObject,
			boolean docFlowCustomerServices, int counterZoneType) {

		return addPlanWorkItemsByClassificationTypeForCalculation2(object,
				distance, codeRem, priconnections, tempObject,
				docFlowCustomerServices, counterZoneType, false, null);
	}

	public int addPlanWorkItemsByClassificationTypeForCalculation2(
			ENPlanWork2ClassificationType object, BigDecimal distance,
			int codeRem, boolean priconnections, ENServicesObject tempObject,
			boolean docFlowCustomerServices, int counterZoneType, boolean relaxation, Date customPlanDate) {

		return addPlanWorkItemsByClassificationTypeForCalculation2(
				object, distance,
				codeRem, priconnections, false, tempObject,
				docFlowCustomerServices, counterZoneType, relaxation, customPlanDate );
	}


	public int addPlanWorkItemsByClassificationTypeForCalculation2(ENPlanWork2ClassificationType object,
			BigDecimal distance, int codeRem, boolean priconnections, boolean addTU, ENServicesObject tempObject,
			boolean docFlowCustomerServices, int counterZoneType, boolean relaxation, Date customPlanDate) {
		try {

			PlanWorkItemLogic planWorkItemLogic = new PlanWorkItemLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			return planWorkItemLogic.addPlanWorkItemsByClassificationTypeForCalculation2(object, distance, codeRem,
					priconnections, addTU, tempObject, docFlowCustomerServices, counterZoneType, relaxation,
					customPlanDate);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


    public void savePlanWorkItemsByClassificationTypeForCalculation2(
            ENPlanWork2ClassificationType object, BigDecimal distance, int codeRem) {
        savePlanWorkItemsByClassificationTypeForCalculation2(
                object, distance, codeRem, false);
    }


    public void savePlanWorkItemsByClassificationTypeForCalculation2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            int codeRem, boolean priconnections)
    {
        try
        {
            savePlanWorkItemsByClassificationTypeForCalculation(object, distance, priconnections);
            // апдейт департмент на договоре и планах кошторис и кошторис единичый

                ServicesLogic soLogic;
                ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkDAO plDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkFilter plFilter = new ENPlanWorkFilter();

                // ENPlanWork2ClassificationTypeDAO pw2clDAO = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                //  ENPlanWork2ClassificationType pw2clObj = pw2clDAO.getObject(result);
                soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENServicesObject    soObj =  soLogic.getServicesObjectByPlanCode(object.planRef.code);
                if (soObj.code != Integer.MIN_VALUE) {
                    soObj.department.code = codeRem;
                    soDAO.save(soObj);
                }

                plFilter.elementRef.code = soObj.element.code;
                plFilter.conditionSQL = "ENPLANWORKKIND.CODE in ( " + ENPlanWorkKind.CALCULATION + " , " + ENPlanWorkKind.CALCULATION_SINGLE + ")";
                int[] plArr = plDAO.getFilteredCodeArray(plFilter, null, null, 0, -1, null);

                    for (int p=0; p < plArr.length; p++) {
                        ENPlanWork plObj = plDAO.getObject(plArr[p]);
                        plObj.departmentRef.code = soObj.department.code;
                        plDAO.save(plObj);
                    }

                    // апдейт РЕМ для объекта по коду департмента из услуг добираемся до РЕМ
                    ENDepartment2EPRenDAO d2pDAO = new ENDepartment2EPRenDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                    ENDepartment2EPRenFilter d2pFilter = new ENDepartment2EPRenFilter();
                    d2pFilter.departmentRef.code = soObj.department.code;
                    ENDepartment2EPRenShortList d2pList = d2pDAO.getScrollableFilteredList(d2pFilter,0,-1);
                    if (d2pList.totalCount > 0 ) {
                        ENElementDAO elDAO = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                        ENElement elObj = elDAO.getObject(soObj.element.code);
                        elObj.renRef.code = d2pList.get(0).renRefCode;
                        elDAO.save(elObj);


                    }

                    // если под договор есть зарезервированное время тогда будем проверять
                    //  на пересечение с зарезервированым временем с другими договорами на дату выполнения работ указаную в договоре
                        ENTimeLineDAO  tlDAO = new ENTimeLineDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                        ENTimeLineFilter tlFilter = new ENTimeLineFilter();
                        tlFilter.servicesObjectRef.code = soObj.code;
                        ENTimeLineShortList tlList = tlDAO.getScrollableFilteredList(tlFilter,0,-1);
                        if (tlList.totalCount > 0 ) {

                                soLogic.recalcTimeLineForServicesObject(soObj.code);
                        }



        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException(e.getMessage(),e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}


    }


    public int addPlanByListOperationsNotLicensed2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, String condition, int codeRem) {
        return addPlanByListOperationsNotLicensed2(
                object, distance, machinehours, condition, codeRem, false);
    }


//     для нелицензированных работ + (выборочные операции) ВЕРСИЯ С ПОДРАЗДЕЛЕНИЕМ
    public int addPlanByListOperationsNotLicensed2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, String condition, int codeRem, boolean priconnections) {
        try
        {
        	TKClassificationTypeDAO classDao = new TKClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            TKClassificationType tklObj = classDao.getObject(object.classificationTypeRef.code);

            this.checkCurrentUserCanAddCalculationsFromTestSources(tklObj.code, tklObj.techcardsource.code);

            if (object.planRef.code != Integer.MIN_VALUE) {
                ENPlanWork2ClassificationTypeDAO pw2cltDAO = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWork2ClassificationTypeFilter pw2cltFilter = new ENPlanWork2ClassificationTypeFilter();
                pw2cltFilter.planRef.code = object.planRef.code;
                ENPlanWork2ClassificationTypeShortList pw2cltList = pw2cltDAO.getScrollableFilteredList(pw2cltFilter,0,-1);

                for (int i=0; i < pw2cltList.totalCount ; i++) {
                    int isJobsByTimeForList = pw2cltList.get(i).isJobsByTime;
                    int isJobsByTimeForObject =  object.isJobsByTime;
                    if (isJobsByTimeForList == Integer.MIN_VALUE )
                        isJobsByTimeForList = 0;
                    if (isJobsByTimeForObject == Integer.MIN_VALUE )
                        isJobsByTimeForObject = 0;

                    if ( isJobsByTimeForList != isJobsByTimeForObject ) {
                        throw new EnergyproSystemException("У калькуляції, що додається, признак резервування часу не співпадає з признаком тих калькуляцій, що вже включені у цей кошторис!!! ");
                    }
                }
            }

            int result = Integer.MIN_VALUE;
            result =  addPlanByListOperationsNotLicensed( object, distance , machinehours , condition);
            // апдейт департмент на договоре и планах кошторис и кошторис единичый

                ServicesLogic soLogic;
                ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkDAO plDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkFilter plFilter = new ENPlanWorkFilter();

                ENPlanWork2ClassificationTypeDAO pw2clDAO = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWork2ClassificationType pw2clObj = pw2clDAO.getObject(result);
                soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENServicesObject    soObj =  soLogic.getServicesObjectByPlanCode(pw2clObj.planRef.code);
                if (soObj.code != Integer.MIN_VALUE) {
                    soObj.department.code = codeRem;
                    soDAO.save(soObj);
                }

                plFilter.elementRef.code = soObj.element.code;
                plFilter.conditionSQL = "ENPLANWORKKIND.CODE in ( " + ENPlanWorkKind.CALCULATION + " , " + ENPlanWorkKind.CALCULATION_SINGLE + ")";
                int[] plArr = plDAO.getFilteredCodeArray(plFilter, null, null, 0, -1, null);

                    for (int p=0; p < plArr.length; p++) {
                        ENPlanWork plObj = plDAO.getObject(plArr[p]);
                        plObj.departmentRef.code = soObj.department.code;
                        plDAO.save(plObj);
                    }

                    // апдейт РЕМ для объекта по коду департмента из услуг добираемся до РЕМ
                    ENDepartment2EPRenDAO d2pDAO = new ENDepartment2EPRenDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                    ENDepartment2EPRenFilter d2pFilter = new ENDepartment2EPRenFilter();
                    d2pFilter.departmentRef.code = soObj.department.code;
                    ENDepartment2EPRenShortList d2pList = d2pDAO.getScrollableFilteredList(d2pFilter,0,-1);
                    if (d2pList.totalCount > 0 ) {
                        ENElementDAO elDAO = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                        ENElement elObj = elDAO.getObject(soObj.element.code);
                        elObj.renRef.code = d2pList.get(0).renRefCode;
                        elDAO.save(elObj);


                    }

            // если под договор есть зарезервированное время тогда будем проверять
            //  на пересечение с зарезервированым временем с другими договорами на дату выполнения работ указаную в договоре
                ENTimeLineDAO  tlDAO = new ENTimeLineDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENTimeLineFilter tlFilter = new ENTimeLineFilter();
                tlFilter.servicesObjectRef.code = soObj.code;
                ENTimeLineShortList tlList = tlDAO.getScrollableFilteredList(tlFilter,0,-1);
                if (tlList.totalCount > 0 ) {

                    soLogic.recalcTimeLineForServicesObject(soObj.code);
                }


            return result;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't save {%com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    public int addPlanWorkItemsByClassificationTypeForCalculationNotLicensed2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, int codeRem) {
        return addPlanWorkItemsByClassificationTypeForCalculationNotLicensed2(
                object, distance, machinehours, codeRem, false);
    }

    public int addPlanWorkItemsByClassificationTypeForCalculationNotLicensed2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, int codeRem, boolean priconnections) {

    	return addPlanWorkItemsByClassificationTypeForCalculationNotLicensed2(
                object, distance, machinehours, codeRem, false, null);

    }

    // для нелицензированных работ
    public int addPlanWorkItemsByClassificationTypeForCalculationNotLicensed2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, int codeRem, boolean priconnections, Date customPlanDate) {
        try
        {

            if (object.planRef.code != Integer.MIN_VALUE) {
                ENPlanWork2ClassificationTypeDAO pw2cltDAO = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWork2ClassificationTypeFilter pw2cltFilter = new ENPlanWork2ClassificationTypeFilter();
                pw2cltFilter.planRef.code = object.planRef.code;
                ENPlanWork2ClassificationTypeShortList pw2cltList = pw2cltDAO.getScrollableFilteredList(pw2cltFilter,0,-1);

                for (int i=0; i < pw2cltList.totalCount ; i++) {
                    int isJobsByTimeForList = pw2cltList.get(i).isJobsByTime;
                    int isJobsByTimeForObject =  object.isJobsByTime;
                    if (isJobsByTimeForList == Integer.MIN_VALUE )
                        isJobsByTimeForList = 0;
                    if (isJobsByTimeForObject == Integer.MIN_VALUE )
                        isJobsByTimeForObject = 0;

                    if ( isJobsByTimeForList != isJobsByTimeForObject ) {
                        throw new EnergyproSystemException("У калькуляції, що додається, признак резервування часу не співпадає з признаком тих калькуляцій, що вже включені у цей кошторис!!! ");
                    }
                }
            }

         // 15.11.2018 сравним customPlanDate с текущей датой сервера , если customPlanDate меньше тольгда переприсвоим в customPlanDate текущей датой сервера
		 // ибо вылез бок когда дата на клиентских компьютерах сбивается
		 // входящий параметр customPlanDate убрать нельзя т.к она используется для создания тестовых калькуляций
            if(customPlanDate==null){
				customPlanDate = new Date();
			}
         long diffDate = Tools.getDaysDiff( new Date() , customPlanDate, TimeUnit.DAYS  );
		 if (diffDate<0){
		 	customPlanDate = new Date();
		 }

            int result = Integer.MIN_VALUE;
            result =  addPlanWorkItemsByClassificationTypeForCalculationNotLicensed(object, distance , machinehours, priconnections, customPlanDate);
            // апдейт департмент на договоре и планах кошторис и кошторис единичый

                ServicesLogic soLogic;
                ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkDAO plDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkFilter plFilter = new ENPlanWorkFilter();

                ENPlanWork2ClassificationTypeDAO pw2clDAO = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWork2ClassificationType pw2clObj = pw2clDAO.getObject(result);
                soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENServicesObject    soObj =  soLogic.getServicesObjectByPlanCode(pw2clObj.planRef.code);
                if (soObj.code != Integer.MIN_VALUE) {
                    soObj.department.code = codeRem;
                    soDAO.save(soObj);
                }

                plFilter.elementRef.code = soObj.element.code;
                plFilter.conditionSQL = "ENPLANWORKKIND.CODE in ( " + ENPlanWorkKind.CALCULATION + " , " + ENPlanWorkKind.CALCULATION_SINGLE + ")";
                int[] plArr = plDAO.getFilteredCodeArray(plFilter, null, null, 0, -1, null);

                    for (int p=0; p < plArr.length; p++) {
                        ENPlanWork plObj = plDAO.getObject(plArr[p]);
                        plObj.departmentRef.code = soObj.department.code;
                        plDAO.save(plObj);
                    }
                    // апдейт РЕМ для объекта по коду департмента из услуг добираемся до РЕМ
                    ENDepartment2EPRenDAO d2pDAO = new ENDepartment2EPRenDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                    ENDepartment2EPRenFilter d2pFilter = new ENDepartment2EPRenFilter();
                    d2pFilter.departmentRef.code = soObj.department.code;
                    ENDepartment2EPRenShortList d2pList = d2pDAO.getScrollableFilteredList(d2pFilter,0,-1);
                    if (d2pList.totalCount > 0 ) {
                        ENElementDAO elDAO = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                        ENElement elObj = elDAO.getObject(soObj.element.code);
                        elObj.renRef.code = d2pList.get(0).renRefCode;
                        elDAO.save(elObj);

                    }

            // если под договор есть зарезервированное время тогда будем проверять
            //  на пересечение с зарезервированым временем с другими договорами на дату выполнения работ указаную в договоре
                ENTimeLineDAO  tlDAO = new ENTimeLineDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENTimeLineFilter tlFilter = new ENTimeLineFilter();
                tlFilter.servicesObjectRef.code = soObj.code;
                ENTimeLineShortList tlList = tlDAO.getScrollableFilteredList(tlFilter,0,-1);
                if (tlList.totalCount > 0 ) {

                    soLogic.recalcTimeLineForServicesObject(soObj.code);
                }


            return result;

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }


    public void savePlanWorkItemsByClassificationTypeForCalculationNotLicensed2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, int codeRem) {
        savePlanWorkItemsByClassificationTypeForCalculationNotLicensed2(
                object, distance, machinehours, codeRem, false);
    }

    // для нелецензированых работ
    public void savePlanWorkItemsByClassificationTypeForCalculationNotLicensed2(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            BigDecimal machinehours, int codeRem, boolean priconnections)
    {
        try
        {
            savePlanWorkItemsByClassificationTypeForCalculationNotLicensed( object, distance , machinehours);
            // апдейт департмент на договоре и планах кошторис и кошторис единичый

                ServicesLogic soLogic;
                ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkDAO plDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkFilter plFilter = new ENPlanWorkFilter();

                // ENPlanWork2ClassificationTypeDAO pw2clDAO = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                //  ENPlanWork2ClassificationType pw2clObj = pw2clDAO.getObject(result);
                soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENServicesObject    soObj =  soLogic.getServicesObjectByPlanCode(object.planRef.code);
                if (soObj.code != Integer.MIN_VALUE) {
                    soObj.department.code = codeRem;
                    soDAO.save(soObj);
                }

                plFilter.elementRef.code = soObj.element.code;
                plFilter.conditionSQL = "ENPLANWORKKIND.CODE in ( " + ENPlanWorkKind.CALCULATION + " , " + ENPlanWorkKind.CALCULATION_SINGLE + ")";
                int[] plArr = plDAO.getFilteredCodeArray(plFilter, null, null, 0, -1, null);

                    for (int p=0; p < plArr.length; p++) {
                        ENPlanWork plObj = plDAO.getObject(plArr[p]);
                        plObj.departmentRef.code = soObj.department.code;
                        plDAO.save(plObj);
                    }

                    // если под договор есть зарезервированное время тогда будем проверять
                    //  на пересечение с зарезервированым временем с другими договорами на дату выполнения работ указаную в договоре
                        ENTimeLineDAO  tlDAO = new ENTimeLineDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                        ENTimeLineFilter tlFilter = new ENTimeLineFilter();
                        tlFilter.servicesObjectRef.code = soObj.code;
                        ENTimeLineShortList tlList = tlDAO.getScrollableFilteredList(tlFilter,0,-1);
                        if (tlList.totalCount > 0 ) {

                                soLogic.recalcTimeLineForServicesObject(soObj.code);
                        }



        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't savePlanWorkItemsByClassificationTypeForCalculation ",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }

    public void addPlanWorkItemsByClassificationTypeForTechConditions(
            int classificationTypeCode, BigDecimal countGen,
            int planCode) {
    	addPlanWorkItemsByClassificationTypeForTechConditions(classificationTypeCode, countGen, planCode, false);
    }

    public void addPlanWorkItemsByClassificationTypeForTechConditions(
            int classificationTypeCode, BigDecimal countGen,
            int planCode, boolean isForSupplier) {
        try {

            TKTechCardDAO techCardDAO = new TKTechCardDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            TKTechCardFilter techCardFilter = new TKTechCardFilter();
            techCardFilter.classificationType.code = classificationTypeCode;
            int[] techCardArr = techCardDAO.getFilteredCodeArray(techCardFilter, 0, -1);
            if (techCardArr.length == 0) {
                throw new EnergyproSystemException(
                        "Не знайдено операції(тех.карти) для класифікатора з кодом "
                                + classificationTypeCode);
            }

            for (int i = 0; i < techCardArr.length; i++) {
                ENPlanWorkItem piObj = new ENPlanWorkItem();
                piObj.planRef.code = planCode;
                piObj.kartaRef.code = techCardArr[i];
                piObj.countGen = countGen;
                this.add(piObj, false, isForSupplier);
            }

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't addPlanWorkItemsByClassificationTypeForTechConditions",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }



	public void changeWork(int planItemCode, int techCardCode) {
		try {
			ENPlanWorkItemDAO itemDAO = new ENPlanWorkItemDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());

			ENPlanWorkItem item = itemDAO.getObject(planItemCode);
			item.kartaRef.code = techCardCode;

			boolean createEstimate = true;

			changePlanWorkItem(item, createEstimate);

		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENPlanWorkItem%} object.",
					e);
		}
		finally {
			closeConnection();
		}
	}

    /**
    *
    *   !!!!!!!! Хитрая замена работы в плане !!!!!!!!
    *   !!!!!!!! материалы переносятся на новую работу !!!!!!!!
    *   !!!!!!!! стара работа обнуляется !!!!!!
    *
    */

	public int changePlanWorkItem(ENPlanWorkItem object) {
		return changePlanWorkItem(object, false);
	}

	public int changePlanWorkItem(ENPlanWorkItem object, boolean createEstimate) {
		try {

            if (object.kartaRef.code == 0) {
                throw new EnergyproSystemException(
                        "робота не знайдена ... код плана ="
                                + object.planRef.code);
            }

            ENPlanWorkItemFilter f = new ENPlanWorkItemFilter();
            f.planRef.code = object.planRef.code;
            f.kartaRef.code = object.kartaRef.code;

            ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());
            int[] arr = dao.getFilteredCodeArray(f, null, null, 0, -1, null);
            if (arr.length > 0) {
                throw new EnergyproSystemException(
                        "Така робота вже є у Плані ... змінюйте кількість робіт ...");
            }

            PlanWorkLogic logic = new PlanWorkLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile());

            ENPlanWork plan = logic.getPlanByCode(object.planRef.code);

            if (plan.typeRef.code == ENPlanWorkType.WRITINGS)
                throw new EnergyproSystemException(
                        "На такому плані робіт не повинно бути ...");

            // 06.10.2017 Не дадим изменить работу, если она уже включена в сменное задание
            logic.checkPlanWorkItemInWorkOrderByt(object.code, "Для заміни техкарти спочатку видаліть її зі змінного завдання!");

            int planItemOutCode = logic.changePlanWorkItem(object, plan, createEstimate);

            return planItemOutCode;
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENPlanWorkItem%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }



    public void saveByChange(ENPlanWorkItem object)
    {
    try
        {

        if ( object.planRef.code == Integer.MIN_VALUE){
            new EnergyproSystemException("planRef not found");
        }

        AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        if ( ! l.checkPermission4PlanItems( object.planRef.code ))
        {
            throw new EnergyproSystemException("Acces denied for method addBy... from method ENPlanWorkItem.save()");
        }

        PlanWorkLogic logic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        ENPlanWork plan = logic.getPlanByCode(object.planRef.code);

        ElementLogic elementLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        int eType = elementLogic.getElementTypeByPlan(plan);


        ENPlanWorkItemDAO objectDAO = new ENPlanWorkItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

        object.dateEdit = new Date();
        object.userGen = getUserProfile().userName;

        // запомним предыдущий обьект ...
        ENPlanWorkItem oldItem = objectDAO.getObject(object.code);

        // NET-1974 Запрет на изменение цены работы если есть акт, кот. не черновой, т.к. цена работы
        // отображается в акте договоров-подряда и её изменение приведет к изменению самого акта.
        {BigDecimal costGenOld = (oldItem.costGen != null ? oldItem.costGen : new BigDecimal(0));
        BigDecimal costGenNew = (object.costGen != null ? object.costGen : new BigDecimal(0));
            if(!costGenOld.equals(costGenNew))
            {
                ActLogic actLogic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENAct actObj = actLogic.getActByPlanCode(plan.code, false);
                if(actObj != null)
                {
                    if(actObj.statusRef.code != ENActStatus.GOOD)
                    {
                        throw new EnergyproSystemException("Акт № "+actObj.numberGen+" повинен бути чорновим для зміни ціни роботи");
                    }
                }
            }
        }

  		if (object.countGen.compareTo(new BigDecimal(0)) > 0)
  		logic.checkForProhibitedTechCard(object.kartaRef.code, object.planRef.code, eType, "Роботи можливо тільки обнулити!");

        objectDAO.save(object);


        if ( Math.abs( oldItem.countGen.doubleValue() - object.countGen.doubleValue()) > 0.001)
        {
            // если есть счетчик - пока залочим изменение ВООБЩЕ ...
            if (plan.kind.code == ENPlanWorkKind.FACT){
                logic.checkInSCCounterByPlanCode(plan.code);
            }

            // пересчитаем смету ...
            EstimateLogic eLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            HumenLogic hLogic = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            // обнуляют !!!
            // а развязанные в резезрве материалы остаються !!!!!!!!!!
            if ( object.countGen.doubleValue() == 0){
                FINMaterialsShortList finList = eLogic.getFINMaterialsListByPlanItemCode(object.code , Integer.MIN_VALUE);

                if (finList.totalCount > 0){
                    throw new EnergyproSystemException("зачем резервировали материалы ??? а теперь обнуляете работы !!!");
                }

            }

            // пресчитаем ВРЕМЯ на работе ... для коэф ...
            new PlanWorkItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) ,getUserProfile()).updateCoef(object.code);

            // пропорционалный расчет мат-лов .. от колва работ ..

            // вначале запомним что было до перерасчета ...
            if ((( plan.kind.code == ENPlanWorkKind.NPW ) || ( plan.kind.code == ENPlanWorkKind.FACT )) && (plan.typeRef.code == ENPlanWorkType.AVR )) {
                eLogic.recalcENEstimateItemsByPlanItemCodeAVR(object.code);
            }
            else{
                eLogic.recalcENEstimateItemsByPlanItemCode(object.code);
            }

            // пересчитаем людей ...
            hLogic.recalcHumenItemsByPlanItemCode(object.code);
            // пересчитаем транспорт
            tLogic.recalcENTransportItemsByPlanItemCode(object.code);

            /////
            // NET-4440 Создаем запись в истории ГСМ по плану
            logic.generatePlanFuelHistory(object.planRef.code, plan.dateStart);
            /////
        }
        }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENPlanWorkItem%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
    }



	public int addForAVR(ENPlanWork object, ENPlanWorkItem[] planItems, String masterCode, String masterName,
			String mechanicCode, String mechanicName) {

		Connection enConn = null;

		try {

        	/** проверка подключения */
        	DBConnector dbConnector = new DBConnector();
			dbConnector.checkOracleConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			if (object.budgetRef.code == ENConsts.ENBUDGET_ODG) {
				throw new EnergyproSystemException("\n\nNET-4396 Додавати аварійни роботи для ОДГ заборонено керівництвом компанії.\n"
						+ "Використовуте CallCenter для складання таких планів!'");
			}

			PlanWorkLogic logic = new PlanWorkLogic(enConn, getUserProfile());

			return logic.addForAVR(object, planItems, masterCode, masterName, mechanicCode, mechanicName);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't addForAVR", e);
		} finally {
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}



	public int addForAVRFromCallCenter(int ccDamageLogCode, String objectName, int renCode, int ccExecutorCode,
			int planStateCode, String comment, ENPlanWorkItem[] planItems, int netObjectCode) {

        	///// TEST !!!!!

//        	ccDamageLogCode = 55555;
//
//            planItems = new ENPlanWorkItem[1];
//            planItems[0] = new ENPlanWorkItem();
//            planItems[0].kartaRef.code = 2017018082;
//            planItems[0].countGen = new BigDecimal(1);
//
//            objectName = "Какой-то узел";
//
//            renCode = 4;
//            ccExecutorCode = 5;
//            planStateCode = 3;
//
//            comment = "OVB_ABON_WORKS_FOR_CALL_CENTER";
//
//            netObjectCode = 58;
            /////


		Connection enConn = null;

		try {

			/** проверка подключения */
			DBConnector dbConnector = new DBConnector();
			dbConnector.checkOracleConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);


			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			PlanWorkLogic logic = new PlanWorkLogic(enConn, getUserProfile());

			return logic.addForAVRFromCallCenter(ccDamageLogCode, objectName, renCode, ccExecutorCode, planStateCode,
					comment, planItems, netObjectCode);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't addForAVRFromCallCenter", e);
		} finally {
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}



	public int addForAVRFromCallCenter(int ccDamageLogCode, String objectName, int renCode, int ccExecutorCode,
			int planStateCode, String comment, ENPlanWorkItem[] planItems, int netObjectCode,
			FINExecutor finExecutorObj, String masterMolCode, String masterMolName, String mechanicMolCode,
			String mechanicMolName, Date dateStart, Date dateFinal, int planReasonCode, int enDepCode, int enBudgCode, int enRespCode) {

    	//throw new EnergyproSystemException("TEST for CallCenter!");

    	///// TEST !!!!!
    	/*
        plan = new ENPlanWork();
        plan.commentGen = "TEST for CallCenter"; // damObj.commentgen;
        plan.dateStart = new java.util.Date();
        plan.dateFinal = new java.util.Date();
        plan.yearGen = new java.util.Date().getYear() + 1900;
        plan.monthGen = new java.util.Date().getMonth() + 1;

        plan.finExecutor = new FINExecutor();

        plan.budgetRef.code = 500000040;
        plan.responsibilityRef.code = 500000041;


        planItems = new ENPlanWorkItem[1];
        planItems[0] = new ENPlanWorkItem();
        planItems[0].kartaRef.code = 500019972;
        planItems[0].countGen = new BigDecimal(1);

        objectName = "Какой-то узел";
        */
        /////


		Connection enConn = null;

		try {

    		/** проверка подключения */
    		DBConnector dbConnector = new DBConnector();
    		dbConnector.checkOracleConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			PlanWorkLogic logic = new PlanWorkLogic(enConn, getUserProfile());

			return logic.addForAVRFromCallCenter(ccDamageLogCode, objectName, renCode, ccExecutorCode, planStateCode,
					comment, planItems, netObjectCode, finExecutorObj, masterMolCode, masterMolName, mechanicMolCode,
					mechanicMolName, dateStart, dateFinal, planReasonCode, enDepCode, enBudgCode, enRespCode);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't addForAVRFromCallCenter", e);
		} finally {
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}



    public int addForWorkOrderBytFromCallCenter(int ccDamageLogCode, int elementCode, int renCode, int planTypeCode,
    		String comment, ENPlanWorkItem[] planItems, FINExecutor finExecutor, int enDepCode, int enBudgCode, int enRespCode)
    {
        Connection enConn = null;

        try
        {
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

        	///// TEST !!!!!
            /*
            ccDamageLogCode = 55555;
            elementCode = 195038040;
            renCode = 16;
            planTypeCode = 109;

            comment = "TEST";

            planItems = new ENPlanWorkItem[1];
            planItems[0] = new ENPlanWorkItem();
            planItems[0].kartaRef.code = 75001326;
            planItems[0].countGen = new BigDecimal(1);
            */
            /////


            PlanWorkLogic logic = new PlanWorkLogic(enConn, getUserProfile());
            return logic.addForWorkOrderBytFromCallCenter(ccDamageLogCode, elementCode, renCode, planTypeCode, comment, planItems, finExecutor, enDepCode, enBudgCode, enRespCode);
        }
        catch (DatasourceConnectException e)
        {
            throw new EnergyproSystemException("Can't addForWorkOrderBytFromCallCenter", e);
        }
        finally
        {
            try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
        }
    }


    public int addPlanWorkItemsByClassificationForPriconnection(int tcsCode,
            ENPlanWork2ClassificationType object, BigDecimal distance,
            int codeRem, boolean priconnections) {
        try {

            int result = Integer.MIN_VALUE;

            addPlanWorkItemsByClassificationForPriconnection(object, distance,
                    ENPlanWorkKind.CALCULATION_SINGLE, priconnections, tcsCode, codeRem);
            result = addPlanWorkItemsByClassificationForPriconnection(object,
                    distance, ENPlanWorkKind.CALCULATION, priconnections, tcsCode, codeRem);

            return result;

        } finally {
            closeConnection();
        }
    }


    public int addPlanWorkItemsByClassificationForPriconnection(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            int planKindCode, boolean priconnections, int tcsCode, int codeRem) {
        try {

            TKTechCardDAO techCardDAO = new TKTechCardDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        	TKClassificationTypeDAO classDao = new TKClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            TKClassificationType tklObj = classDao.getObject(object.classificationTypeRef.code);

            setParametersOnDate(object, new Date());

            this.checkCurrentUserCanAddCalculationsFromTestSources(tklObj.code, tklObj.techcardsource.code);

            TKTechCardFilter techCardFilter = new TKTechCardFilter();
            techCardFilter.classificationType.code = object.classificationTypeRef.code;
            int[] techCardArr = techCardDAO.getFilteredCodeArray(techCardFilter, 0, -1);
            if (techCardArr.length == 0) {
                throw new EnergyproSystemException("\n " +
                        "\n Не знайдено операції(тех.карти) для класифікатора з кодом "+ object.classificationTypeRef.code);
            }

            if (priconnections) {
                object.planRef.code = Integer.MIN_VALUE;
            }

            ServicesLogic soLogic = new ServicesLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            soLogic.checkFinWorkTypes(object, priconnections);
            soLogic.checkClassificationTypePreCost(object);


            int piCode = Integer.MIN_VALUE;
            int planCode = object.planRef.code;
            for (int i = 0; i < techCardArr.length; i++) {
                ENPlanWorkItem piObj = new ENPlanWorkItem();
                piObj.planRef.code = planCode;
                piObj.kartaRef.code = techCardArr[i];
                piObj.countGen = object.countGen;
                piCode = this.addForCalculationByPriconnection(piObj, distance, planKindCode,
                        priconnections, tcsCode, codeRem);

                if (planCode == Integer.MIN_VALUE) {
                    planCode = piObj.planRef.code;
                }
            }

            if (piCode == Integer.MIN_VALUE) {
                throw new EnergyproSystemException("\n " +
                        " Не додано жодної операції (тех.карти)");
            }

            object.planRef.code = planCode;

            ENPlanWork2ClassificationTypeDAO dao = new ENPlanWork2ClassificationTypeDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            object.userGen = getUserProfile().userName;
            object.dateEdit = new Date();

            /** 26.04.2013 +++ для присоединений определяем вид работ */
            if (priconnections) {

                int workTU[] = TKClassificationType.PREPARED_TU;
                for (int i = 0; i < workTU.length; i++) {
                    if (workTU[i] == object.classificationTypeRef.code) {
                        object.connectionWorkTypeRef.code = ENConnectionWorkType.TU;
                    }
                }

                int workAgree[] = TKClassificationType.AGREEMENT;
                for (int i = 0; i < workAgree.length; i++) {
                    if (workAgree[i] == object.classificationTypeRef.code) {
                        object.connectionWorkTypeRef.code = ENConnectionWorkType.AGREEMENT;
                    }
                }

                int workConnections[] = TKClassificationType.CONNECTIONS;
                for (int i = 0; i < workConnections.length; i++) {
                    if (workConnections[i] == object.classificationTypeRef.code) {
                        object.connectionWorkTypeRef.code = ENConnectionWorkType.CONNECTIONS;
                    }
                }
            }

            int outCode = dao.add(object);

            ServicesLogic soLogic1 = new ServicesLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            soLogic1.createDistancesByPlanCodeByPriconnection(planCode, distance);

            // создадим доставку ...
            new HumenLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).createDeliveryTime(planCode);

            // обновим сумму договора БЕЗ НДС
            new ServicesCalculatorLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).calculateServices(object.planRef.code, true);

            ENPlanWorkDAO planDao = new ENPlanWorkDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENPlanWork newPlan = planDao.getObject(planCode);

            if (newPlan.kind.code == ENPlanWorkKind.CALCULATION) {
                newPlan.status.code = ENPlanWorkStatus.GOOD;
            } else {
                newPlan.status.code = ENPlanWorkStatus.LOCKED;
            }

            planDao.save(newPlan);

            /** генерим месячный план */
            if (newPlan.kind.code == ENPlanWorkKind.CALCULATION) {
                PlanWorkLogic logic = new PlanWorkLogic(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                logic.closePlan(newPlan.code);
            }

            return outCode;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't save {%com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public int addForCalculationByPriconnection(ENPlanWorkItem object,
            BigDecimal distance, int planKindCode, boolean priconnections,
            int tcsCode, int codeRem) {
        try {

            if (object.kartaRef.code == 0) {
                throw new EnergyproSystemException("\n " +
                        "Робота не знайдена ... код плана = " + object.planRef.code);
            }

            if (object.countGen.doubleValue() <= 0) {
                throw new EnergyproSystemException("\n " +
                        "Кількість робіт повинна бути більшою за 0!");
            }

            PlanWorkLogic logic = new PlanWorkLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENPlanWorkDAO planDao = new ENPlanWorkDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            if (object.planRef.code == Integer.MIN_VALUE) {

                ENTechConditionsServicesDAO tcsDao = new ENTechConditionsServicesDAO(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENTechConditionsServices tcsObject = tcsDao.getObject(tcsCode);

                new ServicesLogic(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                        getUserProfile()).addForCalculationByPriconnection(tcsObject, planKindCode, codeRem);

                ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
                planFilter.elementRef.code = tcsObject.element.code;

                if (priconnections) {
                    planFilter.kind.code = planKindCode;
                    planFilter.status.code = ENPlanWorkStatus.GOOD;
                } else {
                    planFilter.kind.code = planKindCode;
                }

                int[] planArr = planDao.getFilteredCodeArray(planFilter, 0, -1);
                if (planArr.length != 1) {
                    throw new EnergyproSystemException("\n" +
                            "Помилка у кількості кошторисів для договору!");
                }

                object.planRef.code = planArr[0];
            }

            new TechCardLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile()).validateNormOfTime(object.kartaRef.code);

            ENPlanWorkItemFilter f = new ENPlanWorkItemFilter();
            f.planRef.code = object.planRef.code;
            f.kartaRef.code = object.kartaRef.code;

            ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            int[] arr = dao.getFilteredCodeArray(f, null, null, 0, -1, null);
            if (arr.length > 0) {
                throw new EnergyproSystemException("\n " +
                        "Така робота вже є у Плані ... змінюйте кількість робіт ...");
            }

            ENPlanWork plan = logic.getPlanByCode(object.planRef.code);

            if (plan.kind.code != ENPlanWorkKind.CALCULATION
                    && plan.kind.code != ENPlanWorkKind.CALCULATION_SINGLE) {
                throw new EnergyproSystemException("Цей план не є КОШТОРИСОМ!");
            }

            ServicesLogic sLogic = new ServicesLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            sLogic.checkEditableCalculation(plan, true, priconnections);

            boolean isBudgetEmpty = false;

            if (plan.budgetRef == null) {
                isBudgetEmpty = true;
            }

            if (plan.budgetRef.code == Integer.MIN_VALUE) {
                isBudgetEmpty = true;
            }

            if (isBudgetEmpty) {
                TKTechCardDAO tcDao = new TKTechCardDAO(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                TKTechCard tc = tcDao.getObject(object.kartaRef.code);

                if (tc.budgetRef != null) {
                    if (tc.budgetRef.code > Integer.MIN_VALUE) {
                        plan.budgetRef.code = tc.budgetRef.code;
                        planDao.save(plan);
                    }
                }
            }

            if (planKindCode == ENPlanWorkKind.CALCULATION_SINGLE) {
                object.countGen = new BigDecimal(1);
            }

            int planItemOutCode = logic.addPlanWorkItem(object, plan);

            return planItemOutCode;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENPlanWorkItem%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    public void removePlanWorkItemsByClassificationTypeForConnection(
            int plan2classificationTypeCode) {
        ENPlanWork2ClassificationTypeDAO p2cDAO;
        try {

            p2cDAO = new ENPlanWork2ClassificationTypeDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            int plan2classificationTypeCodeSingleCalc = p2cDAO.getCodeSingleCalcPlan2ClassificationTypeByCalcPlan2ClassificationType(plan2classificationTypeCode);

            ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
            p2cFilter.code = plan2classificationTypeCode;
            ENPlanWork2ClassificationTypeShortList listClass = p2cDAO.getScrollableFilteredList(p2cFilter, 0, -1);
            int planCode = listClass.get(0).planRefCode;

            if (plan2classificationTypeCodeSingleCalc != Integer.MIN_VALUE) {
                removePlanWorkItemsByClassificationTypeForConnection_(plan2classificationTypeCodeSingleCalc);
            }

            removePlanWorkItemsByClassificationTypeForConnection_(plan2classificationTypeCode);

            ENPlanWork2ClassificationTypeFilter pw2ctFilter = new ENPlanWork2ClassificationTypeFilter();
            pw2ctFilter.planRef.code = planCode;
            ENPlanWork2ClassificationTypeShortList pw2ctList = p2cDAO.getScrollableFilteredList(pw2ctFilter, 0, -1);
            if (pw2ctList.totalCount == 0) {
                ElementLogic elLogic = new ElementLogic(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                int elementCode = elLogic.getElementCodeByPlanCode(planCode);

                ENPlanWorkDAO planDAO = new ENPlanWorkDAO(
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
                planFilter.elementRef.code = elementCode;

                ENPlanWorkShortList planList = planDAO.getScrollableFilteredList(planFilter, 0, -1);
                for (int i = 0; i < planList.totalCount; i++) {

                    ENCalcContractTotalDAO cctdao = new ENCalcContractTotalDAO(
                            getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                    ENCalcContractTotalFilter cctFilter = new ENCalcContractTotalFilter();
                    cctFilter.planRef.code = planList.get(i).code;
                    ENCalcContractTotalShortList cctList = cctdao.getScrollableFilteredList(cctFilter, 0, -1);
                    for (int icct = 0; icct < cctList.totalCount; icct++) {
                        cctdao.remove(cctList.get(icct).code);
                    }

                    planDAO.remove(planList.get(i).code);
                }
            }
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't removePlanWorkItemsByClassificationTypeForCalculation.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public void removePlanWorkItemsByClassificationTypeForConnection_(
            int plan2classificationTypeCode) {
        try {
            ENPlanWork2ClassificationTypeDAO dao = new ENPlanWork2ClassificationTypeDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENPlanWork2ClassificationType object = dao.getObject(plan2classificationTypeCode);

            ServicesCalculatorLogic calcLogic = new ServicesCalculatorLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            calcLogic.removeCalculationsFromPlanByClassification(object.planRef.code, plan2classificationTypeCode);

            ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
            piFilter.planRef.code = object.planRef.code;
            piFilter.conditionSQL = "enplanworkitem.kartarefcode in (select qq.code from tktechcard qq where qq.classificationtypecode = "
                    + object.classificationTypeRef.code + ")";
            int[] piArr = new ENPlanWorkItemDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
                    getUserProfile()).getFilteredCodeArray(piFilter, piFilter.conditionSQL, null, 0, -1, null);
            for (int i = 0; i < piArr.length; i++) {
                this.removeForCalculation(piArr[i], true);
            }

            dao.remove(object.code);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't removePlanWorkItemsByClassificationTypeForCalculation.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public void savePlanWorkItemsByClassificationTypeForConnection(
            ENPlanWork2ClassificationType object, BigDecimal distance,
            boolean priconnections) {
        try {

            ENPlanWork2ClassificationTypeDAO dao = new ENPlanWork2ClassificationTypeDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            // запомним план - Кошторис т.к начинать пересхранять бум с плана - кошторис единичный
            int planCalc = object.planRef.code;

            // ФИЛЬТР по работам из плана - кошториса , по коду плана кошториса
            ENPlanWorkItemFilter pi2Filter = new ENPlanWorkItemFilter();
            pi2Filter.planRef.code = planCalc;
            pi2Filter.conditionSQL = "enplanworkitem.kartarefcode in (select qq.code from tktechcard qq where qq.classificationtypecode = "
                    + object.classificationTypeRef.code + ")";
            ENPlanWorkItemDAO pi2DAO = new ENPlanWorkItemDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            int[] piArr2 = pi2DAO.getFilteredCodeArray(pi2Filter, pi2Filter.conditionSQL, null, 0, -1, null);
            for (int i = 0; i < piArr2.length; i++) {
                ENPlanWorkItem pi = pi2DAO.getObject(piArr2[i]);
                pi.countGen = object.countGen;

                this.saveForCalculation(pi, distance, priconnections);
            }
            // сохраним изминения в привязке
            object.dateEdit = new Date();
            object.userGen = getUserProfile().userName;
            dao.save(object);

            ServicesLogic sooLogic = new ServicesLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            sooLogic.recalculateCalculationsConnections(object, priconnections);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't savePlanWorkItemsByClassificationTypeForConnection ",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


	public int addPlanWorkItemsByClassificationTypeForRent(ENPlanWork2ClassificationType object, BigDecimal distance, int codeRem, Date customPlanDate) {
        try
        {
            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ServicesLogic soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            TKClassificationTypeDAO classDao = new TKClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

            TKClassificationType tklObj = classDao.getObject(object.classificationTypeRef.code);

            this.checkCurrentUserCanAddCalculationsFromTestSources(tklObj.code, tklObj.techcardsource.code);


            ENServicesObject soObj = new ENServicesObject();

            // 15.11.2018 сравним customPlanDate с текущей датой сервера , если customPlanDate меньше тольгда переприсвоим в customPlanDate текущей датой сервера
 			// ибо вылез бок когда дата на клиентских компьютерах сбивается
 			// входящий параметр customPlanDate убрать нельзя т.к она используется для создания тестовых калькуляций
            if(customPlanDate==null){
				customPlanDate = new Date();
			}
            long diffDate = Tools.getDaysDiff( new Date() , customPlanDate, TimeUnit.DAYS  );
 			if (diffDate<0){
 				customPlanDate = new Date();
 			}


            if (object.planRef.code != Integer.MIN_VALUE) {
                ENPlanWork2ClassificationTypeDAO pw2cltDAO = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWork2ClassificationTypeFilter pw2cltFilter = new ENPlanWork2ClassificationTypeFilter();
                pw2cltFilter.planRef.code = object.planRef.code;
                ENPlanWork2ClassificationTypeShortList pw2cltList = pw2cltDAO.getScrollableFilteredList(pw2cltFilter,0,-1);

                for (int i=0; i < pw2cltList.totalCount ; i++) {
                    int isJobsByTimeForList = pw2cltList.get(i).isJobsByTime;
                    int isJobsByTimeForObject =  object.isJobsByTime;
                    if (isJobsByTimeForList == Integer.MIN_VALUE )
                        isJobsByTimeForList = 0;
                    if (isJobsByTimeForObject == Integer.MIN_VALUE )
                        isJobsByTimeForObject = 0;

                    if ( isJobsByTimeForList != isJobsByTimeForObject ) {
                        throw new EnergyproSystemException("\n\n"
                        		+ "У калькуляції, що додається, признак резервування часу не співпадає з признаком тих калькуляцій, що вже включені у цей кошторис!!! ");
                    }
                }
            }



            int result = Integer.MIN_VALUE;
            result =  addPlanWorkItemsByClassificationTypeForCalculation(object, distance);
            // апдейт департмент на договоре и планах кошторис и кошторис единичый

                ENPlanWorkDAO plDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkFilter plFilter = new ENPlanWorkFilter();

                ENPlanWork2ClassificationTypeDAO pw2clDAO = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWork2ClassificationType pw2clObj = pw2clDAO.getObject(result);


                /**
                 *  SUPP-11965 +++ проверка на совпадение кодировок услуг (SS) в договоре!!!
                 */

                 ENPlanWork2ClassificationTypeFilter pla2siFilter = new ENPlanWork2ClassificationTypeFilter();
                 pla2siFilter.planRef.code = pw2clObj.planRef.code;
                 ENPlanWork2ClassificationTypeShortList pla2siList = pw2clDAO.getScrollableFilteredList(pla2siFilter, 0, -1);

                 String classCodesStr = "";

                 if (pla2siList.totalCount == 0)
                     throw new EnergyproSystemException(
                             "Помилка у кількості калькуляцій");

                 for (int i = 0; i < pla2siList.totalCount; i++) {
                     if (classCodesStr.length() == 0)
                         classCodesStr = pla2siList.get(i).classificationTypeRefCode + "";
                     else
                         classCodesStr = classCodesStr + ", " + pla2siList.get(i).classificationTypeRefCode + "";
                 }


                 TKClassificationTypeFilter classFilter = new TKClassificationTypeFilter();
                 classFilter.conditionSQL = " tk.code in (" + classCodesStr + ")";

                 classDao = new TKClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
                 TKClassificationTypeShortList classList = classDao.getScrollableFilteredList(classFilter, 0, -1);

                 if (classList.totalCount == 0)
                     throw new EnergyproSystemException(
                             "Помилка у кількості калькуляцій");

                 // Нахождение кода услуг из системы документооборота
                 int servicesListCode = Integer.MIN_VALUE;

                 servicesListCode = classList.get(0).servicesListCode;
//                 if (servicesListCode == Integer.MIN_VALUE)
//                     return Integer.MIN_VALUE;


                 if (classList.totalCount > 1) {
                     for (int i = 1; i < classList.totalCount; i++) {
                         if (classList.get(i).servicesListCode != servicesListCode
                                 && classList.get(i).servicesListCode != Integer.MIN_VALUE) {
                             if (classList.get(i).servicesListCode != Integer.MIN_VALUE)

                                 throw new EnergyproSystemException("\n" +
                                         "\n Заборонено використовувати в одному договорі калькуляції з різними видами послуг!!!" +
                                         "\n Kод послуги для калькуляції № " + classList.get(0).kod + " : " + classList.get(0).servicesListNumber +
                                         "\n Kод послуги для калькуляції № " + classList.get(i).kod + " : " + classList.get(i).servicesListNumber +
                                         "\n Зверніться у Відділ контролю за експлуатацією енергетичного обладнання до Парфьонова О.Ю. (тел. 12-84)!!!");
                             else
                                 throw new EnergyproSystemException("\n" +
                                         "\n Помилка: на калькуляції № " + classList.get(i).kod + " не проставлений код послуги з системи документообігу");
                         }
                     }
                 }


                soObj = soLogic.getServicesObjectByPlanCode(pw2clObj.planRef.code);
                if (soObj.code != Integer.MIN_VALUE) {
                    soObj.department.code = codeRem;


                    	soObj.regionalType = ENSettleType.VILLAGE;
                    	soObj.contractKindRef.code = ENServicesContractKind.OKSN_RENT;
                    	soObj.contractTypeRef.code = ENServicesContractType.OKSN;
                    	soObj.contractStatusRef.code = ENServicesContractStatus.BUDGETAPPROVED;
                    	soObj.contragentTypeRef.code = ENServicesContragentType.PHYSICAL;
                    	soObj.calcTypeRef.code = ENServicesObjectCalcType.BY_CALCULATION;

                    soDAO.save(soObj);
                }

                ENPlanWork plObj = new ENPlanWork();
                plFilter.elementRef.code = soObj.element.code;
                plFilter.conditionSQL = "ENPLANWORKKIND.CODE in ( " + ENPlanWorkKind.CALCULATION + " , " + ENPlanWorkKind.CALCULATION_SINGLE + ")";
                int[] plArr = plDAO.getFilteredCodeArray(plFilter, null, null, 0, -1, null);

                    for (int p=0; p < plArr.length; p++) {
                        plObj = plDAO.getObject(plArr[p]);
                        plObj.departmentRef.code = soObj.department.code;
                        plDAO.save(plObj);
                    }
                // апдейт РЕМ для объекта по коду департмента из услуг добираемся до РЕМ
                ENDepartment2EPRenDAO d2pDAO = new ENDepartment2EPRenDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENDepartment2EPRenFilter d2pFilter = new ENDepartment2EPRenFilter();
                d2pFilter.departmentRef.code = soObj.department.code;
                ENDepartment2EPRenShortList d2pList = d2pDAO.getScrollableFilteredList(d2pFilter,0,-1);
                if (d2pList.totalCount > 0 ) {
                    ENElementDAO elDAO = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                    ENElement elObj = elDAO.getObject(soObj.element.code);
                    elObj.renRef.code = d2pList.get(0).renRefCode;
                    elDAO.save(elObj);
                }


            	return result;


        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException(e.getMessage(),e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}


    }


	public void savePlanWorkItemsByClassificationTypeForRent(ENPlanWork2ClassificationType object, BigDecimal distance, int codeRem)
	    {
	        try
	        {
	            savePlanWorkItemsByClassificationTypeForCalculation(object, distance);
	            // апдейт департмент на договоре и планах кошторис и кошторис единичый

	                ServicesLogic soLogic;
	                ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                ENPlanWorkDAO plDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                ENPlanWorkFilter plFilter = new ENPlanWorkFilter();

	                // ENPlanWork2ClassificationTypeDAO pw2clDAO = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                //  ENPlanWork2ClassificationType pw2clObj = pw2clDAO.getObject(result);
	                soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                ENServicesObject    soObj =  soLogic.getServicesObjectByPlanCode(object.planRef.code);
	                if (soObj.code != Integer.MIN_VALUE) {
	                    soObj.department.code = codeRem;
	                    soDAO.save(soObj);
	                }

	                plFilter.elementRef.code = soObj.element.code;
	                plFilter.conditionSQL = "ENPLANWORKKIND.CODE in ( " + ENPlanWorkKind.CALCULATION + " , " + ENPlanWorkKind.CALCULATION_SINGLE + ")";
	                int[] plArr = plDAO.getFilteredCodeArray(plFilter, null, null, 0, -1, null);

	                    for (int p=0; p < plArr.length; p++) {
	                        ENPlanWork plObj = plDAO.getObject(plArr[p]);
	                        plObj.departmentRef.code = soObj.department.code;
	                        plDAO.save(plObj);
	                    }

	                    // апдейт РЕМ для объекта по коду департмента из услуг добираемся до РЕМ
	                    ENDepartment2EPRenDAO d2pDAO = new ENDepartment2EPRenDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                    ENDepartment2EPRenFilter d2pFilter = new ENDepartment2EPRenFilter();
	                    d2pFilter.departmentRef.code = soObj.department.code;
	                    ENDepartment2EPRenShortList d2pList = d2pDAO.getScrollableFilteredList(d2pFilter,0,-1);
	                    if (d2pList.totalCount > 0 ) {
	                        ENElementDAO elDAO = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                        ENElement elObj = elDAO.getObject(soObj.element.code);
	                        elObj.renRef.code = d2pList.get(0).renRefCode;
	                        elDAO.save(elObj);


	                    }


	        }
	        catch (DatasourceConnectException e) {throw new EnergyproSystemException(e.getMessage(),e);}
	        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	        finally                              {closeConnection();}


	    }

	/**
	 *
	 *
	 * Метод вытягивает процент общепроизводственных затрат из калькуляции и вставляет его в
	 * productionExpensesPercent заданного ENPlanWork2ClassificationType
	 *
	 * 27.06.2018 Также тут теперь присваивается метод расчета для калькуляции
	 * 13.12.2019 Теперь тут присваивается и процент административных затрат для транспорта и поэтому
	 * 	метод переименовывается на setParametersOnDate
	 *
	 * @param obj заданный ENPlanWork2ClassificationType
	 * @throws DatasourceConnectException при невозможности подключения
	 * @throws PersistenceException при ошибках в запросах
	 */
	private void setParametersOnDate(ENPlanWork2ClassificationType obj, Date date)
			throws DatasourceConnectException, PersistenceException {

		PlanWorkItemLogic planWorkItemLogic = new PlanWorkItemLogic(
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

		planWorkItemLogic.setParametersOnDate(obj, date);
	}

	/**
	 *
	 * Проверка, что пользователь может добавлять заданную калькуляцию из тестовых источников
	 *
	 * Вычитывает из настроек список пользователей кто может это делать.
	 *
	 * @param tkClassificationTypeCode код калькуляции
	 * @param techCardSourceCode код источника, что будет проверяться
	 * @throws PersistenceException
	 */
	private void checkCurrentUserCanAddCalculationsFromTestSources(int tkClassificationTypeCode, int techCardSourceCode) throws PersistenceException, DatasourceConnectException {
		PlanWorkItemLogic logic = new PlanWorkItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		logic.checkCurrentUserCanAddCalculationsFromTestSources(tkClassificationTypeCode, techCardSourceCode);
	}

	public int addPlanWorkItemsByClassificationTypeForProject(ENPlanWork2ClassificationType object, BigDecimal distance, int codeRem, Date customPlanDate) {
        try
        {
            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ServicesLogic soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            TKClassificationTypeDAO classDao = new TKClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

            TKClassificationType tklObj = classDao.getObject(object.classificationTypeRef.code);

            this.checkCurrentUserCanAddCalculationsFromTestSources(tklObj.code, tklObj.techcardsource.code);


            ENServicesObject soObj = new ENServicesObject();

            // 15.11.2018 сравним customPlanDate с текущей датой сервера , если customPlanDate меньше тольгда переприсвоим в customPlanDate текущей датой сервера
 			// ибо вылез бок когда дата на клиентских компьютерах сбивается
 			// входящий параметр customPlanDate убрать нельзя т.к она используется для создания тестовых калькуляций
            if(customPlanDate==null){
				customPlanDate = new Date();
			}
            long diffDate = Tools.getDaysDiff( new Date() , customPlanDate, TimeUnit.DAYS  );
 			if (diffDate<0){
 				customPlanDate = new Date();
 			}


            if (object.planRef.code != Integer.MIN_VALUE) {
                ENPlanWork2ClassificationTypeDAO pw2cltDAO = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWork2ClassificationTypeFilter pw2cltFilter = new ENPlanWork2ClassificationTypeFilter();
                pw2cltFilter.planRef.code = object.planRef.code;
                ENPlanWork2ClassificationTypeShortList pw2cltList = pw2cltDAO.getScrollableFilteredList(pw2cltFilter,0,-1);

                for (int i=0; i < pw2cltList.totalCount ; i++) {
                    int isJobsByTimeForList = pw2cltList.get(i).isJobsByTime;
                    int isJobsByTimeForObject =  object.isJobsByTime;
                    if (isJobsByTimeForList == Integer.MIN_VALUE )
                        isJobsByTimeForList = 0;
                    if (isJobsByTimeForObject == Integer.MIN_VALUE )
                        isJobsByTimeForObject = 0;

                    if ( isJobsByTimeForList != isJobsByTimeForObject ) {
                        throw new EnergyproSystemException("\n\n"
                        		+ "У калькуляції, що додається, признак резервування часу не співпадає з признаком тих калькуляцій, що вже включені у цей кошторис!!! ");
                    }
                }
            }



            int result = Integer.MIN_VALUE;
            result =  addPlanWorkItemsByClassificationTypeForCalculation(object, distance);
            // апдейт департмент на договоре и планах кошторис и кошторис единичый

                ENPlanWorkDAO plDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkFilter plFilter = new ENPlanWorkFilter();

                ENPlanWork2ClassificationTypeDAO pw2clDAO = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWork2ClassificationType pw2clObj = pw2clDAO.getObject(result);


                /**
                 *  SUPP-11965 +++ проверка на совпадение кодировок услуг (SS) в договоре!!!
                 */

                 ENPlanWork2ClassificationTypeFilter pla2siFilter = new ENPlanWork2ClassificationTypeFilter();
                 pla2siFilter.planRef.code = pw2clObj.planRef.code;
                 ENPlanWork2ClassificationTypeShortList pla2siList = pw2clDAO.getScrollableFilteredList(pla2siFilter, 0, -1);

                 String classCodesStr = "";

                 if (pla2siList.totalCount == 0)
                     throw new EnergyproSystemException(
                             "Помилка у кількості калькуляцій");

                 for (int i = 0; i < pla2siList.totalCount; i++) {
                     if (classCodesStr.length() == 0)
                         classCodesStr = pla2siList.get(i).classificationTypeRefCode + "";
                     else
                         classCodesStr = classCodesStr + ", " + pla2siList.get(i).classificationTypeRefCode + "";
                 }


                 TKClassificationTypeFilter classFilter = new TKClassificationTypeFilter();
                 classFilter.conditionSQL = " tk.code in (" + classCodesStr + ")";

                 classDao = new TKClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
                 TKClassificationTypeShortList classList = classDao.getScrollableFilteredList(classFilter, 0, -1);

                 if (classList.totalCount == 0)
                     throw new EnergyproSystemException(
                             "Помилка у кількості калькуляцій");

                 // Нахождение кода услуг из системы документооборота
                 int servicesListCode = Integer.MIN_VALUE;

                 servicesListCode = classList.get(0).servicesListCode;
//                 if (servicesListCode == Integer.MIN_VALUE)
//                     return Integer.MIN_VALUE;


                 if (classList.totalCount > 1) {
                     for (int i = 1; i < classList.totalCount; i++) {
                         if (classList.get(i).servicesListCode != servicesListCode
                                 && classList.get(i).servicesListCode != Integer.MIN_VALUE) {
                             if (classList.get(i).servicesListCode != Integer.MIN_VALUE)

                                 throw new EnergyproSystemException("\n" +
                                         "\n Заборонено використовувати в одному договорі калькуляції з різними видами послуг!!!" +
                                         "\n Kод послуги для калькуляції № " + classList.get(0).kod + " : " + classList.get(0).servicesListNumber +
                                         "\n Kод послуги для калькуляції № " + classList.get(i).kod + " : " + classList.get(i).servicesListNumber +
                                         "\n Зверніться у Відділ контролю за експлуатацією енергетичного обладнання до Парфьонова О.Ю. (тел. 12-84)!!!");
                             else
                                 throw new EnergyproSystemException("\n" +
                                         "\n Помилка: на калькуляції № " + classList.get(i).kod + " не проставлений код послуги з системи документообігу");
                         }
                     }
                 }


                soObj = soLogic.getServicesObjectByPlanCode(pw2clObj.planRef.code);
                if (soObj.code != Integer.MIN_VALUE) {
                    soObj.department.code = codeRem;


                    	soObj.regionalType = ENSettleType.VILLAGE;
                    	soObj.contractKindRef.code = ENServicesContractKind.PROJECT;
                    	soObj.contractTypeRef.code = ENServicesContractType.PROJECT;
                    	soObj.contractStatusRef.code = ENServicesContractStatus.GOOD;
                    	soObj.contragentTypeRef.code = ENServicesContragentType.PHYSICAL;
                    	soObj.calcTypeRef.code = ENServicesObjectCalcType.BY_CALCULATION;

                    soDAO.save(soObj);
                }

                ENPlanWork plObj = new ENPlanWork();
                plFilter.elementRef.code = soObj.element.code;
                plFilter.conditionSQL = "ENPLANWORKKIND.CODE in ( " + ENPlanWorkKind.CALCULATION + " , " + ENPlanWorkKind.CALCULATION_SINGLE + ")";
                int[] plArr = plDAO.getFilteredCodeArray(plFilter, null, null, 0, -1, null);

                    for (int p=0; p < plArr.length; p++) {
                        plObj = plDAO.getObject(plArr[p]);
                        plObj.departmentRef.code = soObj.department.code;
                        plDAO.save(plObj);
                    }
                // апдейт РЕМ для объекта по коду департмента из услуг добираемся до РЕМ
                ENDepartment2EPRenDAO d2pDAO = new ENDepartment2EPRenDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENDepartment2EPRenFilter d2pFilter = new ENDepartment2EPRenFilter();
                d2pFilter.departmentRef.code = soObj.department.code;
                ENDepartment2EPRenShortList d2pList = d2pDAO.getScrollableFilteredList(d2pFilter,0,-1);
                if (d2pList.totalCount > 0 ) {
                    ENElementDAO elDAO = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                    ENElement elObj = elDAO.getObject(soObj.element.code);
                    elObj.renRef.code = d2pList.get(0).renRefCode;
                    elDAO.save(elObj);
                }


            	return result;


        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException(e.getMessage(),e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}


    }


	public void savePlanWorkItemsByClassificationTypeForProject(ENPlanWork2ClassificationType object, BigDecimal distance, int codeRem)
	    {
	        try
	        {
	            savePlanWorkItemsByClassificationTypeForCalculation(object, distance);
	            // апдейт департмент на договоре и планах кошторис и кошторис единичый

	                ServicesLogic soLogic;
	                ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                ENPlanWorkDAO plDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                ENPlanWorkFilter plFilter = new ENPlanWorkFilter();

	                // ENPlanWork2ClassificationTypeDAO pw2clDAO = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                //  ENPlanWork2ClassificationType pw2clObj = pw2clDAO.getObject(result);
	                soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                ENServicesObject    soObj =  soLogic.getServicesObjectByPlanCode(object.planRef.code);
	                if (soObj.code != Integer.MIN_VALUE) {
	                    soObj.department.code = codeRem;
	                    soDAO.save(soObj);
	                }

	                plFilter.elementRef.code = soObj.element.code;
	                plFilter.conditionSQL = "ENPLANWORKKIND.CODE in ( " + ENPlanWorkKind.CALCULATION + " , " + ENPlanWorkKind.CALCULATION_SINGLE + ")";
	                int[] plArr = plDAO.getFilteredCodeArray(plFilter, null, null, 0, -1, null);

	                    for (int p=0; p < plArr.length; p++) {
	                        ENPlanWork plObj = plDAO.getObject(plArr[p]);
	                        plObj.departmentRef.code = soObj.department.code;
	                        plDAO.save(plObj);
	                    }

	                    // апдейт РЕМ для объекта по коду департмента из услуг добираемся до РЕМ
	                    ENDepartment2EPRenDAO d2pDAO = new ENDepartment2EPRenDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                    ENDepartment2EPRenFilter d2pFilter = new ENDepartment2EPRenFilter();
	                    d2pFilter.departmentRef.code = soObj.department.code;
	                    ENDepartment2EPRenShortList d2pList = d2pDAO.getScrollableFilteredList(d2pFilter,0,-1);
	                    if (d2pList.totalCount > 0 ) {
	                        ENElementDAO elDAO = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                        ENElement elObj = elDAO.getObject(soObj.element.code);
	                        elObj.renRef.code = d2pList.get(0).renRefCode;
	                        elDAO.save(elObj);


	                    }


	        }
	        catch (DatasourceConnectException e) {throw new EnergyproSystemException(e.getMessage(),e);}
	        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	        finally                              {closeConnection();}


	    }


	/**
	 *  Список работ с допустимым кол-вом для создания наряд-задания...
	 *
	 *  @param planCode - код плана
	 */
	public ENPlanWorkItemForClosePlanShortList getPlanWorkItemForClosePlanList(int planCode) {
		try {
			PlanWorkLogic planLogic = new PlanWorkLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			return planLogic.getPlanWorkItemForClosePlanList(planCode);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't getPlanWorkItemForClosePlanList...", e);
		} finally {
			closeConnection();
		}
	}

	public void moveWorkToAbstractPlan(int planItemCode)
	{
		try {
			PlanWorkItemLogic planItemLogic = new PlanWorkItemLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			  planItemLogic.moveWorkToAbstractPlan(planItemCode);

			  PlanWorkLogic planLogic = new PlanWorkLogic(
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			  ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			  ENPlanWorkItem pi = piDAO.getObject(planItemCode);
			  planLogic.recalcTotalTime(pi.oldPlanRef.code);

		} catch (PersistenceException e) {
			throw new SystemException(
					"Can't moveWorkToAbstractPlan...", e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't moveWorkToAbstractPlan...", e);
		}
		finally {
			closeConnection();
		}

	}

	public void moveWorkFromAbstractPlan(int planItemCode)
	{
		try {
			PlanWorkItemLogic planItemLogic = new PlanWorkItemLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			  planItemLogic.moveWorkFromAbstractPlan(planItemCode);

			  PlanWorkLogic planLogic = new PlanWorkLogic(
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			  ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			  ENPlanWorkItem pi = piDAO.getObject(planItemCode);
			  planLogic.recalcTotalTime(pi.planRef.code);


		} catch (PersistenceException e) {
			throw new SystemException(
					"Can't moveWorkToAbstractPlan...", e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't moveWorkToAbstractPlan...", e);
		}
		finally {
			closeConnection();
		}

	}

	public void moveTransportToSelectedWork(int planItemFromCode,int planItemToCode)
	{
		try {
			PlanWorkItemLogic planItemLogic = new PlanWorkItemLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			  planItemLogic.moveTransportToSelectedWork(planItemFromCode, planItemToCode);

		} catch (PersistenceException e) {
			throw new SystemException(
					"Can't moveTransportToSelectedWork...", e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't moveTransportToSelectedWork...", e);
		}
		finally {
			closeConnection();
		}

	}

	public int addPlanWorkItemsByClassificationTypeForGuard(ENPlanWork2ClassificationType object, int codeRem, Date customPlanDate) {
        try
        {
            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ServicesLogic soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            TKClassificationTypeDAO classDao = new TKClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

            TKClassificationType tklObj = classDao.getObject(object.classificationTypeRef.code);

            this.checkCurrentUserCanAddCalculationsFromTestSources(tklObj.code, tklObj.techcardsource.code);

            ENServicesObject soObj = new ENServicesObject();

            // 15.11.2018 сравним customPlanDate с текущей датой сервера , если customPlanDate меньше тольгда переприсвоим в customPlanDate текущей датой сервера
 			// ибо вылез бок когда дата на клиентских компьютерах сбивается
 			// входящий параметр customPlanDate убрать нельзя т.к она используется для создания тестовых калькуляций
            if(customPlanDate==null){
				customPlanDate = new Date();
			}
            long diffDate = Tools.getDaysDiff( new Date() , customPlanDate, TimeUnit.DAYS  );
 			if (diffDate<0){
 				customPlanDate = new Date();
 			}

            int result = Integer.MIN_VALUE;
            result =  addPlanWorkItemsByClassificationTypeForCalculation(object, new BigDecimal(0));
            // апдейт департмент на договоре и планах кошторис и кошторис единичый

                ENPlanWorkDAO plDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWorkFilter plFilter = new ENPlanWorkFilter();

                ENPlanWork2ClassificationTypeDAO pw2clDAO = new ENPlanWork2ClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENPlanWork2ClassificationType pw2clObj = pw2clDAO.getObject(result);


                /**
                 *  SUPP-11965 +++ проверка на совпадение кодировок услуг (SS) в договоре!!!
                 */

                 ENPlanWork2ClassificationTypeFilter pla2siFilter = new ENPlanWork2ClassificationTypeFilter();
                 pla2siFilter.planRef.code = pw2clObj.planRef.code;
                 ENPlanWork2ClassificationTypeShortList pla2siList = pw2clDAO.getScrollableFilteredList(pla2siFilter, 0, -1);

                 String classCodesStr = "";

                 if (pla2siList.totalCount == 0)
                     throw new EnergyproSystemException(
                             "Помилка у кількості калькуляцій");

                 for (int i = 0; i < pla2siList.totalCount; i++) {
                     if (classCodesStr.length() == 0)
                         classCodesStr = pla2siList.get(i).classificationTypeRefCode + "";
                     else
                         classCodesStr = classCodesStr + ", " + pla2siList.get(i).classificationTypeRefCode + "";
                 }


                 TKClassificationTypeFilter classFilter = new TKClassificationTypeFilter();
                 classFilter.conditionSQL = " tk.code in (" + classCodesStr + ")";

                 classDao = new TKClassificationTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
                 TKClassificationTypeShortList classList = classDao.getScrollableFilteredList(classFilter, 0, -1);

                 if (classList.totalCount == 0)
                     throw new EnergyproSystemException(
                             "Помилка у кількості калькуляцій");

                 // Нахождение кода услуг из системы документооборота
                 int servicesListCode = Integer.MIN_VALUE;
                 servicesListCode = classList.get(0).servicesListCode;

                 if (classList.totalCount > 1) {
                     for (int i = 1; i < classList.totalCount; i++) {
                         if (classList.get(i).servicesListCode != servicesListCode
                                 && classList.get(i).servicesListCode != Integer.MIN_VALUE) {
                             if (classList.get(i).servicesListCode != Integer.MIN_VALUE)

                                 throw new EnergyproSystemException("\n" +
                                         "\n Заборонено використовувати в одному договорі калькуляції з різними видами послуг!!!" +
                                         "\n Kод послуги для калькуляції № " + classList.get(0).kod + " : " + classList.get(0).servicesListNumber +
                                         "\n Kод послуги для калькуляції № " + classList.get(i).kod + " : " + classList.get(i).servicesListNumber +
                                         "\n Зверніться у Відділ контролю за експлуатацією енергетичного обладнання до Парфьонова О.Ю. (тел. 12-84)!!!");
                             else
                                 throw new EnergyproSystemException("\n" +
                                         "\n Помилка: на калькуляції № " + classList.get(i).kod + " не проставлений код послуги з системи документообігу");
                         }
                     }
                 }


                soObj = soLogic.getServicesObjectByPlanCode(pw2clObj.planRef.code);
                if (soObj.code != Integer.MIN_VALUE) {
                    soObj.department.code = codeRem;


                    	soObj.regionalType = ENSettleType.VILLAGE;
                    	soObj.contractKindRef.code = ENServicesContractKind.GUARD;
                    	soObj.contractTypeRef.code = ENServicesContractType.OHRINA;
                    	soObj.contractStatusRef.code = ENServicesContractStatus.BUDGETAPPROVED;
                    	soObj.contragentTypeRef.code = ENServicesContragentType.PHYSICAL;
                    	soObj.calcTypeRef.code = ENServicesObjectCalcType.BY_CALCULATION;

                    soDAO.save(soObj);
                }

                ENPlanWork plObj = new ENPlanWork();
                plFilter.elementRef.code = soObj.element.code;
                plFilter.conditionSQL = "ENPLANWORKKIND.CODE in ( " + ENPlanWorkKind.CALCULATION + " , " + ENPlanWorkKind.CALCULATION_SINGLE + ")";
                int[] plArr = plDAO.getFilteredCodeArray(plFilter, null, null, 0, -1, null);

                    for (int p=0; p < plArr.length; p++) {
                        plObj = plDAO.getObject(plArr[p]);
                        plObj.departmentRef.code = soObj.department.code;
                        plDAO.save(plObj);
                    }
                // апдейт РЕМ для объекта по коду департмента из услуг добираемся до РЕМ
                ENDepartment2EPRenDAO d2pDAO = new ENDepartment2EPRenDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENDepartment2EPRenFilter d2pFilter = new ENDepartment2EPRenFilter();
                d2pFilter.departmentRef.code = soObj.department.code;
                ENDepartment2EPRenShortList d2pList = d2pDAO.getScrollableFilteredList(d2pFilter,0,-1);
                if (d2pList.totalCount > 0 ) {
                    ENElementDAO elDAO = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                    ENElement elObj = elDAO.getObject(soObj.element.code);
                    elObj.renRef.code = d2pList.get(0).renRefCode;
                    elDAO.save(elObj);
                }


            	return result;


        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException(e.getMessage(),e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}


    }


	public void savePlanWorkItemsByClassificationTypeForGuard(ENPlanWork2ClassificationType object, int codeRem)
	    {
	        try
	        {
	            savePlanWorkItemsByClassificationTypeForCalculation(object, new BigDecimal(0));
	            // апдейт департмент на договоре и планах кошторис и кошторис единичый

	                ServicesLogic soLogic;
	                ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                ENPlanWorkDAO plDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                ENPlanWorkFilter plFilter = new ENPlanWorkFilter();

	                soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                ENServicesObject    soObj =  soLogic.getServicesObjectByPlanCode(object.planRef.code);
	                if (soObj.code != Integer.MIN_VALUE) {
	                    soObj.department.code = codeRem;
	                    soDAO.save(soObj);
	                }

	                plFilter.elementRef.code = soObj.element.code;
	                plFilter.conditionSQL = "ENPLANWORKKIND.CODE in ( " + ENPlanWorkKind.CALCULATION + " , " + ENPlanWorkKind.CALCULATION_SINGLE + ")";
	                int[] plArr = plDAO.getFilteredCodeArray(plFilter, null, null, 0, -1, null);

	                    for (int p=0; p < plArr.length; p++) {
	                        ENPlanWork plObj = plDAO.getObject(plArr[p]);
	                        plObj.departmentRef.code = soObj.department.code;
	                        plDAO.save(plObj);
	                    }

	                    // апдейт РЕМ для объекта по коду департмента из услуг добираемся до РЕМ
	                    ENDepartment2EPRenDAO d2pDAO = new ENDepartment2EPRenDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                    ENDepartment2EPRenFilter d2pFilter = new ENDepartment2EPRenFilter();
	                    d2pFilter.departmentRef.code = soObj.department.code;
	                    ENDepartment2EPRenShortList d2pList = d2pDAO.getScrollableFilteredList(d2pFilter,0,-1);
	                    if (d2pList.totalCount > 0 ) {
	                        ENElementDAO elDAO = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	                        ENElement elObj = elDAO.getObject(soObj.element.code);
	                        elObj.renRef.code = d2pList.get(0).renRefCode;
	                        elDAO.save(elObj);


	                    }


	        }
	        catch (DatasourceConnectException e) {throw new EnergyproSystemException(e.getMessage(),e);}
	        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	        finally                              {closeConnection();}


	    }
	
	public DSFstWorkResponse submitFstWork(DSFstWorkRequest request) {
		
		Connection connection = null;
		
		try {
			connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ENMolDAO molDao = new ENMolDAO(connection, getUserProfile());
			ENHumenItemDAO humenItemDao = new ENHumenItemDAO(connection, getUserProfile());
			ENTransportItemDAO transportItemDao = new ENTransportItemDAO(connection, getUserProfile());
			FINWorkerDAO finWorkerDao = new FINWorkerDAO(connection, getUserProfile());
			TKTransportRealDAO transportRealDao = new TKTransportRealDAO(connection, getUserProfile());
			ENTransportDepartmentDAO transportDepartmentDao = new ENTransportDepartmentDAO(connection, getUserProfile());
			ENTransportOrder2TransportItemDAO transportOrder2ItemDao = new ENTransportOrder2TransportItemDAO(connection, getUserProfile());
			ENPlanWorkItemDAO planWorkItemDao = new ENPlanWorkItemDAO(connection, getUserProfile());
			FINExecutorLogic finExecutorLogic = new FINExecutorLogic(connection, getUserProfile());
			ENTransportOrder2TravelDAO transportOrder2TravelSheetDao = new ENTransportOrder2TravelDAO(connection, getUserProfile());
			ENTravelSheetDAO travelSheetDao = new ENTravelSheetDAO(connection, getUserProfile());
			ENElementDAO elementDao = new ENElementDAO(connection, getUserProfile());
			GlobusLogic globusLogic = new GlobusLogic(connection, getUserProfile());
			WorkOrderLogic workOrderLogic = new WorkOrderLogic(connection, getUserProfile());
			FINMolDataDAO molDataDao = new FINMolDataDAO(connection, getUserProfile());
			TransportOrderLogic transportOrderLogic = new TransportOrderLogic(connection, getUserProfile());
			ENTravelSheetItemDAO travelSheetItemDao = new ENTravelSheetItemDAO(connection, getUserProfile());
			TransportLogic transportLogic = new TransportLogic(connection, getUserProfile());
			
			Context context = new InitialContext();
			Object objRef = context.lookup(ENPlanWorkController.JNDI_NAME);
			ENPlanWorkControllerHome planWorkHome =
				(ENPlanWorkControllerHome) PortableRemoteObject.narrow(objRef, ENPlanWorkControllerHome.class);
			ENPlanWorkController planWorkController = planWorkHome.create();
			objRef = context.lookup(ENPlanWorkItemController.JNDI_NAME);   
			ENPlanWorkItemControllerHome planWorkItemHome =
				(ENPlanWorkItemControllerHome) PortableRemoteObject.narrow(objRef, ENPlanWorkItemControllerHome.class);
			ENPlanWorkItemController planWorkItemController = planWorkItemHome.create();
			objRef = context.lookup(ENHumenItemController.JNDI_NAME);   
			ENHumenItemControllerHome humenItemHome =
				(ENHumenItemControllerHome) PortableRemoteObject.narrow(objRef, ENHumenItemControllerHome.class);
			ENHumenItemController humenItemController = humenItemHome.create();
			objRef = context.lookup(ENTransportOrderController.JNDI_NAME);   
			ENTransportOrderControllerHome transportOrderHome =
				(ENTransportOrderControllerHome) PortableRemoteObject.narrow(objRef, ENTransportOrderControllerHome.class);
			ENTransportOrderController transportOrderController = transportOrderHome.create();
			objRef = context.lookup(ENDistanceController.JNDI_NAME);   
			ENDistanceControllerHome distanceHome =
				(ENDistanceControllerHome) PortableRemoteObject.narrow(objRef, ENDistanceControllerHome.class);
			ENDistanceController distanceController = distanceHome.create();
			objRef = context.lookup(FINMolDataController.JNDI_NAME);   
			FINMolDataControllerHome molDataHome =
				(FINMolDataControllerHome) PortableRemoteObject.narrow(objRef, FINMolDataControllerHome.class);
			FINMolDataController molDataController = molDataHome.create();

			Vector<DSFstWork> works = request.getWorks();
			
			Date beginDate = works.stream().map(DSFstWork::getBeginTime).min(Date::compareTo).get();
			Date endDate = works.stream().map(DSFstWork::getEndTime).max(Date::compareTo).get();
			int planCode = request.getPlanCode();
			Set<String> travelSheetNumbers = new HashSet<String>();
			Integer npzCode = null;
			ENMol mol = molDao.getMolByFinCode(request.getMolCode());
			ENMol mechanicMol = null;
			TKTransportReal vehicle = null;
			
			if(request.getVehicleCode() != Integer.MIN_VALUE) {
				//vehicle = transportRealDao.getObject(transportCodeAndWorkCodes.keySet().stream().findFirst().get());
				vehicle = transportRealDao.getObject(request.getVehicleCode());
				mechanicMol = molDao.getMolByFinCode(vehicle.finMolCode);
			}
			
			String mechanicMolCode = null;
			String mechanicMolName = null;
			if(mechanicMol != null) {
				mechanicMolCode = mechanicMol.finCode;
				mechanicMolName = mechanicMol.name;
			}
			
			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			ENElement element = elementDao.getObject(request.getElementCode());
			
			planFilter.elementRef.code = request.getElementCode();
			planFilter.yearGen = request.getYearGen();
			planFilter.monthGen = request.getMonthGen();

			planFilter.formRef.code = ENPlanWorkForm.NOPLANNED;
			planFilter.typeRef.code = ENPlanWorkType.AVR;
			planFilter.stateRef.code = ENPlanWorkState.TO;
			planFilter.departmentRef.code = request.getDepartmentCode();
			planFilter.budgetRef.code = ENConsts.ENBUDGET_ODG;
			planFilter.responsibilityRef.code = ENConsts.ENRESPONSIBILITY_ODG;
			planFilter.kind.code = ENPlanWorkKind.CURRENT;
			planFilter.finExecutor = new FINExecutor();
			planFilter.finExecutor.axOrgId = request.getFinExecutorCode();
			planFilter.dateStart = Tools.getFirstDayOfMonth(beginDate);
			finExecutorLogic.setFinExecutorInPlan(planFilter, element);
			planFilter.dateStart = null;
			
			int[] planCodes = planWorkController.getFilteredCodeArray(planFilter);
			if(planCodes.length > 0) {
				planCode = planCodes[0];
				request.setPlanCode(planCode);
			}
			
			if(planCode == Integer.MIN_VALUE) {
				ENPlanWork plan = planFilter;
				plan.dateStart = Tools.getFirstDayOfMonth(beginDate);
				plan.dateFinal = Tools.getLastDayOfMonth(endDate);
				plan.commentGen = "План с работами ОВБ из электронного оперативного журнала Диспетчера";
				plan.status.code = ENPlanWorkStatus.GOOD;
				planCode = planWorkController.add(plan, false, true);
			} else {
				ENPlanCorrectHistoryDAO historyDao = new ENPlanCorrectHistoryDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
				ENPlanCorrectHistoryFilter historyFilter = new ENPlanCorrectHistoryFilter();
				historyFilter.planOldRef.code = planCode;
				historyFilter.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;
				historyFilter.conditionSQL = " EXISTS (SELECT FROM ENPLANWORK AS pw1 WHERE pw1.dateFinal = ? "
						+ "AND pw1.code = enplancorrecthistory.plannewrefcode)";
				Vector<Object> params = new Vector<>();
				params.add(endDate);
				ENPlanCorrectHistoryShortList historyList = historyDao.getScrollableFilteredList(historyFilter, 0, 1, params);
				if(historyList.totalCount != 1) {
					npzCode = planWorkController.closePlanWorkWithParams(planCode, works.get(0).getEndTime(), mol.finCode
							, mol.name, mechanicMolCode, mechanicMolName);
				} else {
					npzCode = historyList.get(0).planNewRefCode;					
				}				
				ENTransportOrderFilter orderFilter = new ENTransportOrderFilter();
				orderFilter.planRef.code = npzCode;
				ENTransportOrderShortList orderList = transportOrderController.getScrollableFilteredList(orderFilter, 0, -1);
				for(ENTransportOrderShort order : orderList.list) {
					String transportItemCodes = transportOrderLogic.getStringTransportItemCodes(order.code);
					
					ENTravelSheetItemFilter travelSheetItemFilter = new ENTravelSheetItemFilter();
					travelSheetItemFilter.conditionSQL = "EXISTS (SELECT FROM entravlshttm2trnsprttm tvti1 "
							+ "WHERE tvti1.transportitemrefcode in (" + transportItemCodes + ") "
							+ "AND tvti1.travelsheetitemrefcode = ENTRAVELSHEETITEM.CODE)";
					ENTravelSheetItemShortList travelSheetItemList = travelSheetItemDao.getScrollableFilteredList(travelSheetItemFilter, 0, -1); 
					transportOrderController.removeTransportOrderItemsFromTravelSheet(order.code);
					transportOrderController.removeTransportOrderWithTransportItems(order.code);
					for(ENTravelSheetItemShort item : travelSheetItemList.list) {
						ENTravelSheetItem travelSheetItem = travelSheetItemDao.getObject(item.code);
						if(travelSheetItem.statusRef.code == ENTravelSheetItemStatus.DELETED) {
							travelSheetItemDao.remove(travelSheetItem.code);
						}
					}
				}
				
				if(request.getVehicleCode() != Integer.MIN_VALUE) {
					ENWorkOrder wo = workOrderLogic.getWorkOrderByPlanCode(npzCode);
					FINMolDataFilter molDataFilter = new FINMolDataFilter();
					molDataFilter.finMolCode = mechanicMol.finCode;
					molDataFilter.workOrder.code = wo.code;
					
					int[] molDataCodes = molDataDao.getFilteredCodeArray(molDataFilter, 0, -1);
					if(molDataCodes.length == 0) {
						FINMolData molData = new FINMolData();
						molData.finMolCode = mechanicMol.finCode;
						molData.finMolName = mechanicMol.name;
						molData.molTypeRef.code = FINMolType.MECHANIC;
						molData.workOrder.code = wo.code;
						molData.code = molDataController.add(molData);
					}
				}
				
				ENPlanWorkItemFilter planItemFilter = new ENPlanWorkItemFilter();
				planItemFilter.planRef.code = npzCode;
				planItemFilter.conditionSQL = "countGen > 0";
				planItemFilter.conditionSQL = String.format("kartarefcode NOT IN (%s)", Tools.repeatSymbol("?", ",", works.size()));
				Vector<Object> bindedParams = new Vector<>(works.stream().map(DSFstWork::getWorkCode).collect(Collectors.toList()));
				ENPlanWorkItemShortList planItemList = planWorkItemDao.getScrollableFilteredList(planItemFilter, 0, -1, bindedParams);
				for(ENPlanWorkItemShort item : planItemList.list) {
					ENPlanWorkItem planItem = planWorkItemDao.getObject(item.code);
					planItem.countGen = BigDecimal.ZERO;
					planWorkItemController.save(planItem);
				}
				
				planItemFilter.planRef.code = npzCode;
				planItemFilter.conditionSQL = "countGen = 0";
				planItemFilter.conditionSQL = String.format("kartarefcode IN (%s)", Tools.repeatSymbol("?", ",", works.size()));
				
				planItemList = planWorkItemDao.getScrollableFilteredList(planItemFilter, 0, -1, bindedParams);
				for(ENPlanWorkItemShort item : planItemList.list) {
					ENPlanWorkItem planItem = planWorkItemDao.getObject(item.code);
					planItem.countGen = new BigDecimal(1).setScale(2, BigDecimal.ROUND_HALF_UP);
					planWorkItemController.save(planItem);
				}
				
				
				List<Integer> techCardCodes = planItemList.list.stream().map(ENPlanWorkItemShort::getKartaRefCode).collect(Collectors.toList());
				
				Predicate<DSFstWork> predicate = new Predicate<DSFstWork>() {
					@Override
					public boolean test(DSFstWork work) {
						return !techCardCodes.contains(work.getWorkCode());
					}
					
				};
				List<DSFstWork> absentWorks = works.stream().filter(predicate).collect(Collectors.toList());
				
				for(DSFstWork work : absentWorks) {
					ENPlanWorkItem planItem = new ENPlanWorkItem();
					planItem.planRef.code = npzCode;
					planItem.kartaRef.code = work.getWorkCode();
					planItem.countGen = new BigDecimal(1).setScale(2, BigDecimal.ROUND_HALF_UP);
					planWorkItemController.add(planItem);					
				}
			}
			
			/*Map<Integer, List<DSFstWork>> transportCodeAndWorkCodes = works.stream()
					.filter(w -> w.getVehicleCode() != Integer.MIN_VALUE)
					.collect(Collectors.groupingBy(DSFstWork::getVehicleCode));*/
			
			if(request.getPlanCode() == Integer.MIN_VALUE) {
				for(DSFstWork work : works) {
					ENPlanWorkItem planItem = new ENPlanWorkItem();
					planItem.planRef.code = planCode;
					planItem.kartaRef.code = work.getWorkCode();
					planItem.countGen = new BigDecimal(1).setScale(2, BigDecimal.ROUND_HALF_UP);
					planItem.code = planWorkItemController.add(planItem);
					planItem = planWorkItemController.getObject(planItem.code);
					planItem.countGen = BigDecimal.ZERO;
					planWorkItemController.save(planItem);
				}			
			}

			/*Утвердить месячный и создать наряд-задание*/
			planWorkController.confirm(planCode);
			
			if(request.getPlanCode() == Integer.MIN_VALUE) {
				 npzCode = planWorkController.closePlanWorkWithParams(planCode, works.get(0).getEndTime(), mol.finCode
						, mol.name, mechanicMolCode, mechanicMolName);
					
					for(DSFstWork work : works) {
						ENPlanWorkItem planItem = new ENPlanWorkItem();
						planItem.planRef.code = npzCode;
						planItem.kartaRef.code = work.getWorkCode();
						planItem.countGen = new BigDecimal(1).setScale(2, BigDecimal.ROUND_HALF_UP);
						planWorkItemController.add(planItem);
					}
			}
			
			for(DSFstWork work : works) {
				ENHumenItemFilter humenItemFilter = new ENHumenItemFilter();
				humenItemFilter.planRef.code = npzCode;
				humenItemFilter.conditionSQL = "EXISTS (SELECT FROM enplanworkitem pi1 WHERE pi1.kartarefcode = ? AND pi1.code = enhumenitem.planitemrefcode)";
				Vector<Integer> workBindedParams = new Vector<Integer>();
				workBindedParams.add(work.getWorkCode());
				ENHumenItemShortList humenItemList = humenItemDao.getScrollableFilteredList(humenItemFilter, 0, -1, workBindedParams);
				
				if(work.getTabNumbers() != null && work.getTabNumbers().size() > 0) {
					
					FINWorkerFilter finWorkerFilter = new FINWorkerFilter();
					int humenIndex = 0;
					
					for(ENHumenItemShort humenItem : humenItemList.list) {
						ENHumenItem humen = humenItemDao.getObject(humenItem.code);
						
						FINWorker finWorker = null;
						finWorkerFilter.tabNumber = work.getTabNumbers().get(humenIndex);
						FINWorkerShortList finWorkerList = finWorkerDao.getFINWorkerList(finWorkerFilter, 0, 1, false);
						if(finWorkerList.totalCount > 0) {
							finWorker = new FINWorker();
							finWorker.tabNumber = finWorkerList.get(0).tabNumber;
							finWorker.departmentName = finWorkerList.get(0).departmentName;
						}
						if(finWorker == null) throw new java.lang.NullPointerException();
						humen.finWorker = finWorker;
						if(humenIndex + 1 < finWorkerList.totalCount) humenIndex++; else humenIndex = 0;
						humenItemController.save(humen);
					}
				}				
			}
			
			Hashtable<Integer, Integer> transportOrdersVehicles = new Hashtable<>();
			Hashtable<Integer, String> transportOrdersDriverTabNumbers = new Hashtable<>();
			
			//if(transportCodeAndWorkCodes.size() > 0) {
			if(request.getVehicleCode() != Integer.MIN_VALUE) {
				//Set<Integer> transportCodes = transportCodeAndWorkCodes.keySet();
				//for(Integer transportCode : transportCodes) {
					//List<DSFstWork> transportWorks = transportCodeAndWorkCodes.get(transportCode);
				ENTransportItemFilter transportItemFilter = new ENTransportItemFilter();
				transportItemFilter.planRef.code = npzCode;
				transportItemFilter.conditionSQL = String.format("EXISTS (SELECT FROM enplanworkitem pi1 "
						+ "WHERE pi1.kartarefcode IN (%s) AND pi1.code = entransportitem.planitemrefcode)"
						, Tools.repeatSymbol("?", ",", works.size()));
				Vector<Object> workBindedParams = new Vector<>(works.stream().map(DSFstWork::getWorkCode).collect(Collectors.toList())); 
				ENTransportItemShortList transportItemList = transportItemDao.getScrollableFilteredList(transportItemFilter, 0, -1, workBindedParams);
					
					//Date beginTime = transportWorks.stream().map(DSFstWork::getBeginTime).min(Date::compareTo).get();
					//Date endTime = transportWorks.stream().map(DSFstWork::getEndTime).max(Date::compareTo).get();
				Date beginTime = request.getTransferStart();
				Date endTime = request.getTransferFinish();
				/*Set<String> driverTabNumbers = transportWorks.stream().map(DSFstWork::getDriverTabNumber)
							.filter(e -> e != null && e.trim().length() != 0).collect(Collectors.toSet());*/
				Set<String> driverTabNumbers = new HashSet<String>();
				if(request.getDriverNumber() != null && request.getDriverNumber().trim().length() > 0)
					driverTabNumbers.add(request.getDriverNumber());
					
				TKTransportReal transportReal = transportRealDao.getObject(request.getVehicleCode());
					
				if(driverTabNumbers == null || driverTabNumbers.size() == 0) {
					throw new SystemException(String.format("Не знайдено водіїв для транспортного засобу %s", transportReal.gosNumber));
				}
				if(driverTabNumbers.size() > 1) {
					throw new SystemException(String.format("Помилка у кількості водіїв (%d) для транспортного засобу %s"
							, driverTabNumbers.size(), transportReal.gosNumber));
				}
					
				if(transportItemList != null && transportItemList.totalCount > 0) {
					ENTransportItemShort[] transportItemArr = new ENTransportItemShort[transportItemList.totalCount];
					int count = 0;
					for(ENTransportItemShort transportItem : transportItemList.list) {
						transportLogic.removeDistanceForTransport(transportItem.code);
					}
					for(ENTransportItemShort transportItem : transportItemList.list) {
						if(count == 0) {
							transportLogic.removeDistanceForTransport(transportItem.code);
							ENDistance distance = new ENDistance();
							distance.distance = globusLogic.getDistanceByHydra(vehicle.reg_id, beginTime, endTime);
							distance.transportItemRef.code = transportItem.code;
							distance.roadType.code = ENRoadType.HIGHWAY;
							distance.typeRef.code = ENDistanceType.DISTANCE_TO;
							distanceController.add(distance);
						}
						transportItemArr[count++] = transportItem;
					}
						
					ENTransportDepartment transportDepartment = transportDepartmentDao.getByDepartmentCode(request.getDepartmentCode());
						
					transportOrderController.addTransportOrderWithTransportItems(transportItemArr
						, request.getArrivingOnObjectTime(), request.getArrivingOnObjectTime()
						, request.getDepartureFromObjectTime(), request.getDepartureFromObjectTime(), transportDepartment.code, 0);
							
					ENTransportOrder2TransportItemFilter transportOrder2ItemFilter = new ENTransportOrder2TransportItemFilter();
					transportOrder2ItemFilter.transportItem.code = transportItemArr[0].code;
					ENTransportOrder2TransportItemShortList transportOrder2ItemList = transportOrder2ItemDao
						.getScrollableFilteredList(transportOrder2ItemFilter, 0, 1);
						
					transportOrdersVehicles.put(transportOrder2ItemList.get(0).transportOrderCode, vehicle.code);
					transportOrdersDriverTabNumbers.put(transportOrder2ItemList.get(0).transportOrderCode, driverTabNumbers.stream().findFirst().get());
				}
				//}
				
				Set<Integer> transportOrderCodes = transportOrdersVehicles.keySet();
				for(Integer transportOrderCode : transportOrderCodes) {
					int vehicleCode = transportOrdersVehicles.get(transportOrderCode);
					String tabNumberDriver = transportOrdersDriverTabNumbers.get(transportOrderCode);
					transportOrderController.addTransportWithWorker(transportOrderCode, tabNumberDriver, vehicleCode);
					
					ENTransportOrder2TravelFilter transportOrder2TravelSheetFilter = new ENTransportOrder2TravelFilter();
					transportOrder2TravelSheetFilter.transportorder.code = transportOrderCode;
					ENTransportOrder2TravelShortList transportOrder2TravelList = 
							transportOrder2TravelSheetDao.getScrollableFilteredList(transportOrder2TravelSheetFilter, 0, -1);
					if(transportOrder2TravelList.totalCount > 0) {
						ENTravelSheet travelSheet = travelSheetDao.getObject(transportOrder2TravelList.get(0).getTravelsheetCode());
						travelSheetNumbers.add(travelSheet.numberGen);
					}
				}
			}
			
			DSFstWorkResponse response = new DSFstWorkResponse();
			response.setPlanCode(planCode);
			response.setTravelSheetNumber(travelSheetNumbers.stream().collect(Collectors.joining(",")));

			return response;
		} catch (RemoteException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} catch (NamingException e) {
			throw new SystemException(e);
		} catch (CreateException e) {
			throw new SystemException(e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			try {
				if (connection != null && !connection.isClosed()) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {}
		}
		

	}
	
	public void annulateFstWork(int planCode, Date date) {
		try {
			if(planCode == Integer.MIN_VALUE) throw new java.lang.NullPointerException();
			Context context = new InitialContext();
			Object objRef = context.lookup(ENPlanWorkController.JNDI_NAME);
			ENPlanWorkControllerHome planWorkHome =
				(ENPlanWorkControllerHome) PortableRemoteObject.narrow(objRef, ENPlanWorkControllerHome.class);
			ENPlanWorkController planWorkController = planWorkHome.create();
			ENPlanCorrectHistoryDAO historyDao = new ENPlanCorrectHistoryDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPlanCorrectHistoryFilter historyFilter = new ENPlanCorrectHistoryFilter();
			historyFilter.planOldRef.code = planCode;
			historyFilter.reason.code = ENPlanCorrectReason.MOVE_TO_NPW;
			ENPlanCorrectHistoryShortList historyListAll = historyDao.getScrollableFilteredList(historyFilter, 0, -1);
			historyFilter.conditionSQL = " EXISTS (SELECT FROM ENPLANWORK AS pw1 WHERE pw1.dateFinal = ? "
					+ "AND pw1.code = enplancorrecthistory.plannewrefcode)";
			Vector<Object> params = new Vector<>();
			params.add(date);
			ENPlanCorrectHistoryShortList historyList = historyDao.getScrollableFilteredList(historyFilter, 0, 1, params);
			if(historyList.totalCount != 1) {
				throw new SystemException(String.format("Помилка у кількості нпз (%d)", historyList.totalCount));
			}
			removeFstNpz(historyList.get(0).planNewRefCode);
			if(historyListAll.totalCount == 1) {
				planWorkController.remove(planCode);				
			}
		} catch (NamingException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} catch (RemoteException e) {
			throw new SystemException(e);
		} catch (CreateException e) {
			throw new SystemException(e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			this.closeConnection();
		}

	}
	
	private void removeFstNpz(int npzCode) {
		try {
			if(npzCode == Integer.MIN_VALUE) throw new java.lang.NullPointerException();
			Context context = new InitialContext();
			Object objRef = context.lookup(ENPlanWorkController.JNDI_NAME);
			ENPlanWorkControllerHome planWorkHome =
				(ENPlanWorkControllerHome) PortableRemoteObject.narrow(objRef, ENPlanWorkControllerHome.class);
			ENPlanWorkController planWorkController = planWorkHome.create();
			objRef = context.lookup(ENTransportOrderController.JNDI_NAME);
			ENTransportOrderControllerHome transportOrderHome =
				(ENTransportOrderControllerHome) PortableRemoteObject.narrow(objRef, ENTransportOrderControllerHome.class);
			ENTransportOrderController transportOrderController = transportOrderHome.create();

			ENTransportOrderFilter orderFilter = new ENTransportOrderFilter();
			orderFilter.planRef.code = npzCode;
			ENTransportOrderShortList orderList = transportOrderController.getScrollableFilteredList(orderFilter, 0, -1);
			for(ENTransportOrderShort order : orderList.list) {
				transportOrderController.removeTransportOrderItemsFromTravelSheet(order.code);
			}
			planWorkController.openPlanWork(npzCode);			
		} catch (NamingException e) {
			throw new SystemException(e);
		} catch (RemoteException e) {
			throw new SystemException(e);
		} catch (CreateException e) {
			throw new SystemException(e);
		} finally {
			
		}

	}

} // end of EJB Controller for ENPlanWorkItem