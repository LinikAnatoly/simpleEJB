
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENEstimateItemPlanPay;
 *
 */

import java.math.BigDecimal;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENEstimateItemPlanPayDAO;
import com.ksoe.energynet.ejb.generated.ENEstimateItemPlanPayControllerEJBGen;
import com.ksoe.energynet.logic.EstimateLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.valueobject.ENEstimateItemPlanPay;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemPlanPayFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemPlanPayShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.rqorder.valueobject.RQOrderItemTypePay;

public class ENEstimateItemPlanPayControllerEJB extends
		ENEstimateItemPlanPayControllerEJBGen {

	public ENEstimateItemPlanPayControllerEJB() {
	}
	
	public int add(ENEstimateItemPlanPay object) 
	{
		try 
		{
	        if (object.percentPay.doubleValue() > 100 || object.percentPay.doubleValue() <= 0) 
	        {
	        	throw new SystemException("\n\nNET-4303 Неприпустиме значення для відсотка сплати!");
	        }
	        
			ENEstimateItemPlanPayDAO objectDAO = new ENEstimateItemPlanPayDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENEstimateItemPlanPayFilter planPayFilter = new ENEstimateItemPlanPayFilter();
			planPayFilter.estimateItemRef.code = object.estimateItemRef.code;
			ENEstimateItemPlanPayShortList planPayList = objectDAO.getScrollableFilteredList(planPayFilter, 0, -1);
			
			for (int i = 0; i < planPayList.totalCount; i++)
			{
				if (object.typePayRef.code == planPayList.get(i).typePayRefCode)
				{
					throw new SystemException("\n\nNET-4303 Значення для виду сплати \"" + planPayList.get(i).typePayRefName + "\" вже заведено!");
				}
			}

			if (planPayList.totalCount > 1)
			{
				throw new SystemException("\n\nNET-4303 Вже заведені можливі значення! Для введення нових спочатку видаліть старі!");
			}
			
		    int newCode = super.add(object);
		    
		    if (object.typePayRef.code == RQOrderItemTypePay.PREPAYMENT && object.percentPay.doubleValue() < 100 && planPayList.totalCount == 0)
		    {
		    	PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		    	int planCode = planLogic.getPlanCodeByEstimateNoSegr(object.estimateItemRef.code);
		    	ENPlanWork plan = planLogic.getPlanByCodeNOSEGR(planCode);
		    	
		    	if (plan.dateStart.after(object.datePay))
		    	{
			    	ENEstimateItemPlanPay planPayByFact = new ENEstimateItemPlanPay();
			    	planPayByFact.estimateItemRef.code = object.estimateItemRef.code;
			    	planPayByFact.typePayRef.code = RQOrderItemTypePay.BY_FACT;
			    	planPayByFact.percentPay = new BigDecimal(100).subtract(object.percentPay).setScale(2, BigDecimal.ROUND_HALF_UP);
			    	planPayByFact.datePay = plan.dateStart;
			    	objectDAO.add(planPayByFact);
		    	}
		    	else
		    	{
		    		// TODO: Добавить запись с какой-то датой, большей, чем дата object.datePay ??
		    	}
		    }
		    /////
		    else
		    {
				planPayFilter = new ENEstimateItemPlanPayFilter();
				planPayFilter.estimateItemRef.code = object.estimateItemRef.code;
				planPayFilter.conditionSQL = "code <> " + newCode;
				int[] planPayArr = objectDAO.getFilteredCodeArray(planPayFilter, 0, -1);
				
				if (planPayArr.length > 1)
				{
					throw new SystemException("\n\nNET-4303 Вже заведені можливі значення! Для введення нових спочатку видаліть старі!");
				}			
				
				if (planPayArr.length == 1)
				{
					ENEstimateItemPlanPay planPay = objectDAO.getObject(planPayArr[0]);

					if (object.typePayRef.code == RQOrderItemTypePay.BY_FACT && planPay.typePayRef.code == RQOrderItemTypePay.PREPAYMENT)
					{
						if (object.datePay.before(planPay.datePay))
						{
							throw new SystemException("\n\nNET-4303 Дата кінцевого розрахунку повинна перевищувати дату передплати!");
						}
					}
					
					if (object.typePayRef.code == RQOrderItemTypePay.PREPAYMENT && planPay.typePayRef.code == RQOrderItemTypePay.BY_FACT)
					{
						if (planPay.datePay.before(object.datePay))
						{
							throw new SystemException("\n\nNET-4303 Дата кінцевого розрахунку повинна перевищувати дату передплати!");
						}
					}				
					
					planPay.percentPay = new BigDecimal(100).subtract(object.percentPay).setScale(2, BigDecimal.ROUND_HALF_UP);
					objectDAO.save(planPay);
				}		    	
		    }
		    /////
		    
		    EstimateLogic estimateLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		    estimateLogic.validateEstimateItemPlanPay(object.estimateItemRef.code, true);
		    
		    return newCode;
		} 
		catch (DatasourceConnectException e) 
		{
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENEstimateItemPlanPay%} object.",
					e);
		} 
		catch (PersistenceException e) 
		{
			throw new SystemException(e.getMessage(), e);
		} 
		finally 
		{
			closeConnection();
		}
	}	


	public void remove(int code) 
	{
		try 
		{
			ENEstimateItemPlanPayDAO objectDAO = new ENEstimateItemPlanPayDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENEstimateItemPlanPay object = objectDAO.getObject(code);
			
			ENEstimateItemPlanPayFilter planPayFilter = new ENEstimateItemPlanPayFilter();
			planPayFilter.estimateItemRef.code = object.estimateItemRef.code;
			planPayFilter.conditionSQL = "code <> " + code;
			int[] planPayArr = objectDAO.getFilteredCodeArray(planPayFilter, 0, -1);
			
			if (planPayArr.length > 1)
			{
				throw new SystemException("\n\nNET-4303 Кількість можливих значень не повинна перевищувати 2!");
			}			
			
			super.remove(code);
			
			if (planPayArr.length == 1)
			{
				ENEstimateItemPlanPay planPay = objectDAO.getObject(planPayArr[0]);
				//planPay.percentPay = new BigDecimal(100).subtract(object.percentPay).setScale(2, BigDecimal.ROUND_HALF_UP);
				planPay.percentPay = new BigDecimal(100);
				objectDAO.save(planPay);
			}
			
		    //EstimateLogic estimateLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		    //estimateLogic.validateEstimateItemPlanPay(object.estimateItemRef.code, true);		    
		} 
		catch (DatasourceConnectException e) 
		{
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENEstimateItemPlanPay%} object.",
					e);
		} 
		catch (PersistenceException e) 
		{
			throw new SystemException(e.getMessage(), e);
		} 
		finally 
		{
			closeConnection();
		}
	}


	public void save(ENEstimateItemPlanPay object) 
	{
		try 
		{
	        if (object.percentPay.doubleValue() > 100 || object.percentPay.doubleValue() <= 0) 
	        {
	        	throw new SystemException("\n\nNET-4303 Неприпустиме значення для відсотка сплати!");
	        }
	        
			ENEstimateItemPlanPayDAO objectDAO = new ENEstimateItemPlanPayDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENEstimateItemPlanPay oldObject = objectDAO.getObject(object.code);
			
			if (object.typePayRef.code != oldObject.typePayRef.code)
			{
				throw new SystemException("\n\nNET-4303 Для зміни виду сплати видаліть старий запис та додайте новий!");
			}

			ENEstimateItemPlanPayFilter planPayFilter = new ENEstimateItemPlanPayFilter();
			planPayFilter.estimateItemRef.code = object.estimateItemRef.code;
			planPayFilter.conditionSQL = "code <> " + object.code;
			int[] planPayArr = objectDAO.getFilteredCodeArray(planPayFilter, 0, -1);
			
			if (planPayArr.length > 1)
			{
				throw new SystemException("\n\nNET-4303 Вже заведені можливі значення! Для введення нових спочатку видаліть старі!");
			}			
			
			super.save(object);
			
			if (planPayArr.length == 1)
			{
				ENEstimateItemPlanPay planPay = objectDAO.getObject(planPayArr[0]);

				if (object.typePayRef.code == RQOrderItemTypePay.BY_FACT && planPay.typePayRef.code == RQOrderItemTypePay.PREPAYMENT)
				{
					if (object.datePay.before(planPay.datePay))
					{
						throw new SystemException("\n\nNET-4303 Дата кінцевого розрахунку повинна перевищувати дату передплати!");
					}
				}
				
				if (object.typePayRef.code == RQOrderItemTypePay.PREPAYMENT && planPay.typePayRef.code == RQOrderItemTypePay.BY_FACT)
				{
					if (planPay.datePay.before(object.datePay))
					{
						throw new SystemException("\n\nNET-4303 Дата кінцевого розрахунку повинна перевищувати дату передплати!");
					}
				}				
				
				planPay.percentPay = new BigDecimal(100).subtract(object.percentPay).setScale(2, BigDecimal.ROUND_HALF_UP);
				objectDAO.save(planPay);
				
			    EstimateLogic estimateLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			    estimateLogic.validateEstimateItemPlanPay(object.estimateItemRef.code, true);		    
			}
			else
			{
				object = objectDAO.getObject(object.code);
				object.percentPay = new BigDecimal(100);
				objectDAO.save(object);
			}
		} 
		catch (DatasourceConnectException e) 
		{
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENEstimateItemPlanPay%} object.",
					e);
		} 
		catch (PersistenceException e) 
		{
			throw new SystemException(e.getMessage(), e);
		} 
		finally 
		{
			closeConnection();
		}
	}	
} // end of EJB Controller for ENEstimateItemPlanPay