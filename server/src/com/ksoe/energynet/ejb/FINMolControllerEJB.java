
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for FINMol;
  *
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.FINMolDAO;
import com.ksoe.energynet.ejb.generated.FINMolControllerEJBGen;
import com.ksoe.energynet.valueobject.FINMol;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class FINMolControllerEJB extends FINMolControllerEJBGen
 {

  public FINMolControllerEJB() {}

  public FINMol getObject(String uid)
  {
   try
    {
	   FINMolDAO objectDAO = new FINMolDAO(getUserProfile(), getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));
	   return objectDAO.getObject(uid);
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get {%com.ksoe.energynet.valueobject.FINMol%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
  }


} // end of EJB Controller for FINMol