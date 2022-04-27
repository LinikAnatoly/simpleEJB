
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENInvestProgram;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENInvestProgramDAO;
import com.ksoe.energynet.ejb.generated.ENInvestProgramControllerEJBGen;
import com.ksoe.energynet.valueobject.ENInvestProgram;
import com.ksoe.energynet.valueobject.ENInvestProgramStatus;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENInvestProgramControllerEJB extends
		ENInvestProgramControllerEJBGen {

	public ENInvestProgramControllerEJB() {
	}

    /**
     *  Перевод Инвестпрограммы в статус "Финансирование завершено"
     *
     *  @param code - код Инвестпрограммы (ENInvestProgram)
     *  
     */		
	public void setFinancingCompleted(int code)
	{
		try 
		{
			ENInvestProgramDAO objectDAO = new ENInvestProgramDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENInvestProgram object = objectDAO.getObject(code);

			if (object.statusRef.code == ENInvestProgramStatus.FINANCING_COMPLETED)
			{
				throw new SystemException("\n\nNET-4301 Ця Інвестпрограма вже знаходиться в статусі \"Фінансування завершено\"!");
			}

			if (object.statusRef.code == ENInvestProgramStatus.COMPLETED)
			{
				throw new SystemException("\n\nNET-4301 Ця Інвестпрограма вже знаходиться в статусі \"Виконано\"!");
			}
			
			object.statusRef.code = ENInvestProgramStatus.FINANCING_COMPLETED;
			objectDAO.save(object);
		} 
		catch (DatasourceConnectException e) 
		{
			throw new SystemException(
					"Can't do {%financingCompleted%} for {%com.ksoe.energynet.valueobject.ENInvestProgram%} object.",
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
	
/*	TODO: Перенести в Logic!!!
	public void fillItems(int investProgramCode) 
	{
		try 
		{
			ENInvestProgramItemDAO itemDAO = new ENInvestProgramItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENInvestProgramItemShortList itemList = itemDAO.getMaterialsFromPlans(investProgramCode);
			
			for (int i = 0; i < itemList.totalCount; i++)
			{
				ENInvestProgramItem item = new ENInvestProgramItem();
				
				item.code = Integer.MIN_VALUE;
				item.name = itemList.get(i).name;
				item.price = itemList.get(i).price;
				item.countGen = itemList.get(i).countGen;
				item.sumGen = itemList.get(i).sumGen;
				
				item.quarter1count = new BigDecimal(0);
				item.quarter1sum = new BigDecimal(0);
				item.quarter2count = new BigDecimal(0);
				item.quarter2sum = new BigDecimal(0);
				item.quarter3count = new BigDecimal(0);
				item.quarter3sum = new BigDecimal(0);
				item.quarter4count = new BigDecimal(0);
				item.quarter4sum = new BigDecimal(0);
				
				item.investProgramRef.code = investProgramCode;
				item.materialRef.code = itemList.get(i).materialRefCode;
				
				itemDAO.add(item);
			}
			
			// return itemList;
		} 
		catch (DatasourceConnectException e) 
		{
			throw new SystemException(
					"Can't fillItems for {%com.ksoe.energynet.valueobject.ENInvestProgram%} object.",
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
*/
	
} // end of EJB Controller for ENInvestProgram