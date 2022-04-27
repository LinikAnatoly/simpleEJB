
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENTransformerObject;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENTransformerObjectDAO;
import com.ksoe.energynet.ejb.generated.ENTransformerObjectControllerEJBGen;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENTransformerObject;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENTransformerObjectControllerEJB extends ENTransformerObjectControllerEJBGen
 {
	
	
	/*ENTransformerObject. Èçìåíèòü*/
	  public void save(ENTransformerObject object)
	   {
	    try
	     {
	      object.setDomain_info(null);
	      ENElement el = new ENElement();
	      ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      el = elDAO.getObject(object.element.code);
	
	      ENTransformerObjectDAO objectDAO = new ENTransformerObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      
	      if (object.element.elementInRef.code != Integer.MIN_VALUE){
		      el.elementInRef.code =  object.element.elementInRef.code;
		      }
		      el.renRef.code = object.element.renRef.code;
	      if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  el.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
	      
	      elDAO.save(el);
		      
	      objectDAO.save(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENTransformerObject%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }

	
	  public int add(ENTransformerObject object)
	   {
	    try
	     {
	      object.setDomain_info(null);

	      ENElement el = new ENElement();
	      ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      el.typeRef.code = ENElementType.TRANSFORMER_OBJECT;
	      //el.elementInRef.code = object.element.elementInRef.code;
	      el.renRef.code = 0; // òèïà ÂÑÅ â ÕÎÅ ...
	      
	      
	      if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  el.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
	      
	      el.code = elDAO.add(el);
	      
	      object.element.code = el.code;

	      
	      ENTransformerObjectDAO objectDAO = new ENTransformerObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.add(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTransformerObject%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }

   


	  
  public ENTransformerObjectControllerEJB() {}


} // end of EJB Controller for ENTransformerObject