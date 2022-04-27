
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  import com.ksoe.authorization.util.AuthorizationJNDINames;

/**
  * EJB Controller for ENMol;  
  * 	
  */



import com.ksoe.energynet.ejb.generated.ENMolControllerEJBGen;
import com.ksoe.energynet.logic.FINMolLogic;
import com.ksoe.energynet.valueobject.lists.ENMolShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENMolControllerEJB extends ENMolControllerEJBGen {

  public ENMolControllerEJB() {}
  
  public ENMolShortList synchronizeMols(boolean addOSMols) {
	  try {
		FINMolLogic finMolLogic = new FINMolLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		return finMolLogic.synchronizeENMolsWithFinCollection(addOSMols);
	} catch (DatasourceConnectException e) {
		throw new SystemException(e);
	} catch (PersistenceException e) {
		throw new SystemException(e);
	}
  }


} // end of EJB Controller for ENMol