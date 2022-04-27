
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENMetrologyDevice;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENMetrologyDeviceDAO;
import com.ksoe.energynet.ejb.generated.ENMetrologyDeviceControllerEJBGen;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENMetrologyDevice;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENMetrologyDeviceControllerEJB extends ENMetrologyDeviceControllerEJBGen
 {

	  public int add(ENMetrologyDevice object)
	  {
	   try
	    {
			  object.setDomain_info(null);  
			  ENElement el = new ENElement();
			  ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			  el.typeRef.code = ENElementType.METROLOGY_DEVICE;
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
			  ENMetrologyDeviceDAO objectDAO = new ENMetrologyDeviceDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			  return objectDAO.add(object);
	 }
	catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENMetrologyObject%} object.",e);}
	catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	finally                              {closeConnection();}
	}  

	  
	  public void save(ENMetrologyDevice object)
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
	     
		      ENMetrologyDeviceDAO objectDAO = new ENMetrologyDeviceDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		      objectDAO.save(object);
	    }
	   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENMetrologyObject%} object.",e);}
	   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	   finally                              {closeConnection();}
	  }
	   
  public ENMetrologyDeviceControllerEJB() {}

  

} // end of EJB Controller for ENMetrologyDevice