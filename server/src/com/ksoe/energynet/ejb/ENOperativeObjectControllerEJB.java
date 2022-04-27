
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENOperativeObject;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENOperativeObjectDAO;
import com.ksoe.energynet.ejb.generated.ENOperativeObjectControllerEJBGen;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENOperativeObject;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENOperativeObjectControllerEJB extends ENOperativeObjectControllerEJBGen
 {

  public ENOperativeObjectControllerEJB() {}

  public int add(ENOperativeObject object)
  {
   try
    {
		  object.setDomain_info(null);  
		  ENElement el = new ENElement();
		  ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		  el.typeRef.code = ENElementType.OPERATIVE_OBJECT;
		  el.elementInRef.code = object.element.elementInRef.code;
		  el.elementOutRef.code = object.element.elementOutRef.code;
		  el.renRef.code = object.element.renRef.code;
		  
		  if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  el.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
		  el.code = elDAO.add(el);
		  
		  object.element.code = el.code;
		  ENOperativeObjectDAO objectDAO = new ENOperativeObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		  return objectDAO.add(object);
 }
catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENOperativeObject%} object.",e);}
catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
finally                              {closeConnection();}
}  

  
  public void save(ENOperativeObject object)
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
       
       if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  el.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
       elDAO.save(el);
 
       ENOperativeObjectDAO objectDAO = new ENOperativeObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
       objectDAO.save(object);
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENOperativeObject%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
  }  

} // end of EJB Controller for ENOperativeObject