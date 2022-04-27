
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENInvestProgramItem;
 *
 */

import com.ksoe.energynet.ejb.generated.ENInvestProgramItemControllerEJBGen;

public class ENInvestProgramItemControllerEJB extends
		ENInvestProgramItemControllerEJBGen {

	public ENInvestProgramItemControllerEJB() {
	}
	
	/*
	public ENInvestProgramItemShortList getMaterialsFromPlans(int investProgramCode) 
	{
		try 
		{
			ENInvestProgramItemDAO objectDAO = new ENInvestProgramItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

		    return objectDAO.getMaterialsFromPlans(investProgramCode);
		} 
		catch (DatasourceConnectException e) 
		{
			throw new SystemException(
					"Can't getMaterialsFromPlans for {%com.ksoe.energynet.valueobject.ENInvestProgram%} object.",
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

} // end of EJB Controller for ENInvestProgramItem