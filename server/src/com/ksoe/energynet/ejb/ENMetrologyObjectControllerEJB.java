
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENMetrologyObject;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENMetrologyObjectDAO;
import com.ksoe.energynet.ejb.generated.ENMetrologyObjectControllerEJBGen;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENMetrologyObject;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENMetrologyObjectControllerEJB extends ENMetrologyObjectControllerEJBGen
 {

  public ENMetrologyObjectControllerEJB() {}

  public int add(ENMetrologyObject object)
  {
   try
    {
		  object.setDomain_info(null);  
		  ENElement el = new ENElement();
		  ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		  el.typeRef.code = ENElementType.METROLOGY_OBJECT;
		  //el.elementInRef.code = object.element.elementInRef.code;
		  //el.elementOutRef.code = object.element.elementOutRef.code;
		  el.renRef.code = 0; // äëÿ íèõ ðýñ - ÕÎÅ object.element.renRef.code;
		  el.code = elDAO.add(el);
		  
		  object.element.code = el.code;
		  ENMetrologyObjectDAO objectDAO = new ENMetrologyObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		  return objectDAO.add(object);
 }
catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENMetrologyObject%} object.",e);}
catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
finally                              {closeConnection();}
}  

  
  public void save(ENMetrologyObject object)
  {
   try
    {
     object.setDomain_info(null);

	      ENElement el = new ENElement();
	      ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	
	      el = elDAO.getObject(object.element.code);
	      el.elementInRef.code = object.element.elementInRef.code;
	      el.elementOutRef.code = object.element.elementOutRef.code;
	      el.renRef.code = object.element.renRef.code;
	      elDAO.save(el);
     
     ENMetrologyObjectDAO objectDAO = new ENMetrologyObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
     objectDAO.save(object);
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENMetrologyObject%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
  }
  
} // end of EJB Controller for ENMetrologyObject