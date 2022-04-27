
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for SCCounter;
  *
  */



import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.billing.util.BillingConst;
import com.ksoe.energynet.dataminer.ENEstimateItem2ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.ejb.generated.SCCounterControllerEJBGen;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.ElementLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.SCLogic;
import com.ksoe.energynet.logic.WorkOrderLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Type;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.SCCounterKind;
import com.ksoe.energynet.valueobject.SCCounterStatus;
import com.ksoe.energynet.valueobject.brief.SCCounterShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.SCCounterShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class SCCounterControllerEJB extends SCCounterControllerEJBGen
 {

  /**
	 *
	 */
	private static final long serialVersionUID = 1L;


public SCCounterControllerEJB() {}

  @Override
public int add(SCCounter object) {
	  try {
		SCLogic logic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
				getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());


		WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		ENWorkOrder workOrder = workOrderLogic.getWorkOrderByEstimateItemCode(object.estimateItemRef.code);
		ENPlanWork plan = planLogic.getPlanByWorkOrderCode(workOrder.code);
		if(object.invNumber != null) {
			logic.checkCounterLastMovementDateWithPlanDate(object, plan);
		}
		logic.lockCounterInSC_(object.scCode, workOrder.workOrderNumber, workOrder.dateGen, ENMetrologyCounter.BILLING_LOCK);
		return super.add(object);
	} catch (DatasourceConnectException e) {
		throw new SystemException(e);
	} catch (PersistenceException e) {
		throw new SystemException(e);
	}

  }



  	// работа со счетчиками из Биллинга ...
	public void installCounter(int planCode, int kartaRefCode,
			String tabNumber, SCCounter counter) {

		try {
			new SCLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
					getUserProfile()).installCounter(planCode, kartaRefCode,
					counter, 1, tabNumber);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't installCounter", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

  public int getNumUnZKU(String invCounter,String lschet)

  {
	   try
	     {
	    	SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
	    			getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
	    	return scLogic.getNumUnZKU(invCounter,lschet);

	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get num_un zku",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}

	    finally
	    {
	    	closeConnection();
	    }
  }



	public void undoInstallCounter(SCCounter counter) {
		try {
			new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
					getUserProfile()).undoInstallCounter(counter, 1, true);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't undoInstallCounter", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public void unInstallCounterManually(int planCode, int kartaRefCode,
			String tabNumber, SCCounter counter) {
		
		try {
			ENPlanWorkDAO planDao = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ElementLogic elementLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			SCCounterDAO counterDao = new SCCounterDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			ENPlanWork plan = planDao.getObject(planCode);
			int elementType = elementLogic.getElementTypeByPlan(plan);
			if(elementType == ENElementType.TY_BYT) {
				throw new SystemException("Зняття лічильника у ПК \"EnergyNet\" не можливо використовувати для побутових точок обліку!");
			}
			
			SCCounterShortList listUnmounted = counterDao.getListByPlan(plan, ENEstimateItemKind.UNMOUNT);
			for(SCCounterShort item : listUnmounted.list) {
				if(item.statusRefCode != SCCounterStatus.CANCELED) {
					throw new SystemException("Для цього плану вже є демонтований лічильник!");
				}
			}

			// Сделаем счетчик по-умолчанию 
			counter.setIsliquid(1);
			
			this.unInstallCounter(planCode, kartaRefCode, tabNumber, counter, 0);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		}
	}

	public void unInstallCounter(int planCode, int kartaRefCode,
			String tabNumber, SCCounter counter, int isPass) {
		try {

			if ((isPass == 1) || (counter.invNumber != null)) {
				new SCLogic(
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
						getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
						getUserProfile()).installCounter(planCode,
						kartaRefCode, counter, 0, tabNumber);
			} else {
				try {
					PlanWorkLogic planLogic = new PlanWorkLogic(
							getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
							getUserProfile());
					ENPlanWork plan = planLogic.getPlanByCode(planCode);

					if (!((plan.kind.code == ENPlanWorkKind.NPW)
							&& (plan.status.code == ENPlanWorkStatus.LOCKED))) {
						planLogic.closePlan(planCode);
					}

				} catch (Exception e) {
				}
			}
		}

		catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't unInstallCounter", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}

	}

	public void undoUnInstallCounter(SCCounter counter) {
		try {
			new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
					getUserProfile()).undoInstallCounter(counter, 0, true);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't undoUnInstallCounter", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public int closePlanServiceObj(int planCode) {

		try {
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			return scLogic.closePlanServiceObj(planCode);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		}
	}


	public void replaceCounter(int planCode, int kartaRefCode, String tabNumber,
			SCCounter oldCounter, SCCounter newCounter, int isPass) {

		int scPlanCode = Integer.MIN_VALUE;
		long replaceCounterStartTime = System.nanoTime();

		try {
			SCLogic scLogic = new SCLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			PlanWorkLogic planLogic = new PlanWorkLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ENPlanWork plan = planLogic.getPlanByCode(planCode);

			int typeCode = planLogic.getPlanByCode(planCode).typeRef.code;

			if ((oldCounter.invNumber != null)
					&& (newCounter.invNumber != null)) {
				if ((oldCounter.invNumber.equals(newCounter.invNumber))
						&& (typeCode == ENPlanWorkType.EZ_CHANGE_ZKU)
						&& (oldCounter.isMoveToZKU == 1)) {
					oldCounter.isMoveToZKU = 1;
					newCounter.isMoveToZKU = 1;
					
					boolean isExpertise = (oldCounter.actInvitationNumber != null 
							&& oldCounter.actInvitationNumber.equals(BillingConst.COUNTER_ACT_INVITATION_NUMBER_EXPERTISE));
					isExpertise = isExpertise || (newCounter.actInvitationNumber != null 
							&& newCounter.actInvitationNumber.equals(BillingConst.COUNTER_ACT_INVITATION_NUMBER_EXPERTISE));
					
					// SUPP-67493 Если происходит операция перенос счетчика в ЗКУ, значит признак "Экспертиза"
					// не может быть установлен
					if(isExpertise) {
						throw new SystemException("Неможливо встановлювати ознаку передачі лічильника "
								+ "на експертизу при перенесені його у ЗКУ");
					}
				}
			}
			

			System.out.println("after after get");

			long installCounterStartTime = System.nanoTime();

			// 22.12.11 Делаем снятие, только если счетчик наш, либо если
			// абонент передает его нам
			if ((isPass == 1) || (oldCounter.invNumber != null)) {
				if ((isPass == 1) || (!oldCounter.invNumber.equals(""))) {
					scPlanCode = scLogic.installCounter(planCode, kartaRefCode,
							oldCounter, 0, tabNumber);
				}
			} else {


				if ((plan.kind.code == ENPlanWorkKind.NPW)
						&& (plan.status.code == ENPlanWorkStatus.LOCKED)) {
					scPlanCode = planLogic.getFactCode4NPZ(planCode);
				} else {
					planLogic.closePlan(planCode);
				}
			}

			if(newCounter.isMoveToZKU == 1) scLogic.lockCounterInSC_(newCounter.scCode, "", null, -1 * ENMetrologyCounter.BILLING_LOCK);
			scPlanCode = scLogic.installCounter(planCode, kartaRefCode, newCounter, 1, tabNumber);

			long installCounterEndTime = System.nanoTime();
			long installCounterTime = (installCounterEndTime - installCounterStartTime) / 1000000;
			System.out.println("############# installCounterTime = " + installCounterTime);

			Context cnt = new InitialContext();
			Object objRef = cnt.lookup(ENPlanWorkController.JNDI_NAME);
			ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(objRef, ENPlanWorkControllerHome.class);
			ENPlanWorkController planController = planHome.create();


			long linkMaterialsStartTime = System.nanoTime();
			// привяжем трос и пломбу

			/*
			if (plan.typeRef.code != ENPlanWorkType.WORK_IN_OUT) {
				planController.linkMaterials(scPlanCode);
			}
			*/

			planController.linkMaterials(scPlanCode);


			long linkMaterialsEndTime = System.nanoTime();
			long linkMaterialsTime = (linkMaterialsEndTime - linkMaterialsStartTime) / 1000000;
			System.out.println("############# linkMaterialsTime = " + linkMaterialsTime);


			long replaceCounterEndTime = System.nanoTime();
			long replaceCounterTime = (replaceCounterEndTime - replaceCounterStartTime) / 1000000;
			System.out.println("############# replaceCounterTime = " + replaceCounterTime);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Не вдалося зв'язати матеріал з фінколлекції, код плану - "
							+ scPlanCode, e);
		} catch (PersistenceException e1) {
			throw new EnergyproSystemException(e1.getMessage(), e1);
		} catch (NamingException e2) {
			throw new EnergyproSystemException(e2.getMessage(), e2);
		} catch (RemoteException e3) {
			throw new EnergyproSystemException(e3.getMessage(), e3);
		} catch (CreateException e4) {
			throw new EnergyproSystemException(e4.getMessage(), e4);
		}
	}




  public void undoReplaceCounter(SCCounter oldCounter, SCCounter newCounter, int isPass)
  {
	    try
	     {
	    	SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
	    			getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

	    	scLogic.undoInstallCounter(newCounter, 1, false);

	    	// 22.12.11 Отменяем снятие, только если счетчик наш, либо если абонент передавал его нам
	    	if ((isPass == 1)||(oldCounter.invNumber!=null))
	    	{
	    	  if ((isPass == 1)||(oldCounter.invNumber!=""))
	    	  {
	    		  scLogic.undoInstallCounter(oldCounter, 0, true);
	    	  }
	    	}
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't undoReplaceCounter",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally
	    {
	    	closeConnection();
	    }
  }

  /**
   *
   * Добавление счетчиков на списание
   *
   * @param counters массив счетчиков
   */
  public void addCountersForWriteOff(ENMetrologyCounter[] counters)
  {
	  try
	  {
		  if(counters == null || counters.length == 0)
			  throw new EnergyproSystemException("Неправильний масив даних");

		  ENWorkOrder workOrder = null;

		  SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
				  getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

		  WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  ActLogic actLogic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

		  workOrder = workOrderLogic.getWorkOrderByEstimateItemCode(counters[0].element.code);
		  ENPlanWork plan = planLogic.getPlanByWorkOrderCode(workOrder.code);

		  // Проверка статуса
		  if(plan.status.code != ENPlanWorkStatus.GOOD)
			  throw new EnergyproSystemException("План, на який додається лічильник, вже не чорновий");

		  // Проверка на акт
		  ENAct act = actLogic.getActByPlanCode(plan.code, false);

		  if(act != null && act.statusRef.code != ENActStatus.GOOD)
		  {
			  throw new EnergyproSystemException("План, на який додається лічильник, прив'язан до акту № " + act.numberGen + ", що вже не чорновий");
		  }

		  SCCounterDAO cntDao = new SCCounterDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

		  for(int i = 0; i < counters.length; i++)
		  {
			  SCCounter cnt = scLogic.createSCCounterFromMetrologyCounter(counters[i], SCCounterKind.FOR_WRITEOFF);
  			  scLogic.lockCounterInSC_(counters[i].scCode, workOrder.workOrderNumber, workOrder.dateGen, ENMetrologyCounter.WRITE_OFF_LOCK);
			  cntDao.add(cnt);
		  }
	  }
	  catch (DatasourceConnectException e) {throw new EnergyproSystemException(e.getMessage(),e);}
	  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	  finally
	  {
	    	closeConnection();
	  }
  }

	/**
	 *
	 * Удаление привязки счетчиков для списания
	 *
	 * @param codes коды SCCounter
	 */
	public void removeCountersForWriteOff(int[] codes) {
		this.removeCounter(codes, ENMetrologyCounter.WRITE_OFF_LOCK);
	}
	
	/**
	 * 
	 * Удаление счетчика привязанного на снятие вручную из EnergyNet
	 * 
	 * @param code код {@link SCCounter}
	 */
	public void removeCounterUnmountedManually(int code) {
		try {
			SCCounterDAO counterDao = new SCCounterDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ElementLogic elementLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			SCCounter counter = counterDao.getObject(code);
			ENPlanWork plan = planLogic.getPlanByCodeNOSEGR(planLogic.getPlanCodeByEstimateNoSegr(counter.estimateItemRef.code));
			int elementType = elementLogic.getElementTypeByPlanNOSEGR(plan);
			if(elementType == ENElementType.TY_BYT) {
				throw new SystemException("Неможливо відмінити зняття лічильника у планах на побутові точки обліку!");
			}
			this.removeCountersForBilling(new int[] { code});
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		}
	}

	/**
	 *
	 * Удаление привязки счетчиков для работ из биллинга
	 *
	 * @param codes коды SCCounter
	 */
	public void removeCountersForBilling(int[] codes) {
		this.removeCounter(codes, ENMetrologyCounter.BILLING_LOCK);
	}

	private void removeCounter(int[] codes, int removeLock) {
		try {
			if (codes == null || codes.length == 0) {
				throw new EnergyproSystemException("Помилка у параметрах");
			}

			SCCounterDAO cntDao = new SCCounterDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ActLogic actLogic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENEstimateItem2ENEstimateItemDAO esesDao = new ENEstimateItem2ENEstimateItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENEstimateItemDAO estimateDao = new ENEstimateItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ENPlanWork plan = null;

			for (int i = 0; i < codes.length; i++) {
				SCCounter cnt = cntDao.getObject(codes[i]);
				// Разблокировка
				scLogic.lockCounterInSC_(cnt.scCode, null, null, (-1) * removeLock);

				// На всякий случай проверка
				if (cnt.statusRef.code != SCCounterStatus.GOOD)
					throw new EnergyproSystemException("Неправильний статус");

				// Проверка плана и акта
				if (plan == null) {
					plan = planLogic.getPlanByCode(planLogic.getPlanCodeByEstimate(cnt.estimateItemRef.code));

					if (plan.status.code != ENPlanWorkStatus.GOOD)
						throw new EnergyproSystemException("План, з якого видаляється лічильник вже не чорновий");

					if(plan.kind.code == ENPlanWorkKind.FACT) {
						/*Счетчик мог быть привязан еще в задании-план, его тоже нужно удалить и там */
						ENEstimateItem2ENEstimateItemFilter esesFilter = new ENEstimateItem2ENEstimateItemFilter();
						esesFilter.estimateItemOutRef.code = cnt.estimateItemRef.code;
						esesFilter.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
						ENEstimateItem2ENEstimateItemShortList esesList = esesDao.getScrollableFilteredList(esesFilter, 0, -1);
						if(esesList.totalCount > 0) {
							SCCounterFilter esesCoFilter = new SCCounterFilter();
							esesCoFilter.estimateItemRef.code = esesList.get(0).estimateItemInRefCode;
							int[] esesCoCodes = cntDao.getFilteredCodeArray(esesCoFilter, 0, -1);
							for(int esesCoCode : esesCoCodes) {
								SCCounter esesCo = cntDao.getObject(esesCoCode);
								if(esesCo.invNumber.equals(cnt.invNumber)) {
									cntDao.remove(esesCo.code);
									break;
								}
							}

						}
						
					}

					// Проверка на акт
					ENAct act = actLogic.getActByPlanCode(plan.code, false);

					if (act != null && act.statusRef.code != ENActStatus.GOOD) {
						throw new EnergyproSystemException("План, з якого видаляється лічильник, прив'язаний до акту № "
								+ act.numberGen + ", що вже не чорновий");
					}
				}

				// Удаление
				cntDao.remove(cnt.code);
				
				// SUPP-91619 Удалить счетчик из демонтированных
				ENEstimateItem estimate = estimateDao.getObjectNoSegr(cnt.estimateItemRef.code);
				if(plan.kind.code == ENPlanWorkKind.FACT 
						&& estimate.kindRef.code == ENEstimateItemKind.UNMOUNT) {
					estimateDao.remove(estimate.code);
				}

			}
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


  /***
   *  По договору услуг на сторону показываем счетчик который относитсяя к услуге
 * @throws DatasourceConnectException
   *
   * **/
  public SCCounterShortList getCounterForServicesObject(int soObjCode)
   {
	  SCCounterShortList scList= null;

	try {
		SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
				getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
		scList = scLogic.getCounterForServicesObject(soObjCode);
	} catch (DatasourceConnectException e) {
		throw new EnergyproSystemException(e.getMessage(), e);
	}
	finally{
		closeConnection();
	}


	return scList;
   }


  /**
   * По договору услуг на сторону показываем счетчик, который относится к услуге
   *
   * @param soObjCode - код договора
   * @param showForCanceled - выбирать ли счетчик для отмененных договоров
   *
   **/
  public SCCounterShortList getCounterForServicesObject(int soObjCode, boolean showForCanceled)
  {
	  SCCounterShortList scList = null;

	  try
	  {
		  SCLogic scLogic = new SCLogic(
				  getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
				  getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
				  getUserProfile());

		  scList = scLogic.getCounterForServicesObject(soObjCode, showForCanceled);
	  }
	  catch (DatasourceConnectException e)
	  {
		  throw new EnergyproSystemException(e.getMessage(), e);
	  }
	  finally
	  {
		  closeConnection();
	  }

	  return scList;
  }


} // end of EJB Controller for SCCounter