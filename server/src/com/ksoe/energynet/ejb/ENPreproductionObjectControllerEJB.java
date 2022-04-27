
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENPreproductionObject;  
  * 	
  */



import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENPreproductionObjectDAO;
import com.ksoe.energynet.ejb.generated.ENPreproductionObjectControllerEJBGen;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPreproductionObject;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENPreproductionObjectControllerEJB extends ENPreproductionObjectControllerEJBGen
 {

	  public int add(ENPreproductionObject object)
	   {
	    try
	     {
	      object.setDomain_info(null);
	      
	      object.dateEdit = new Date();
	      object.userGen = getUserProfile().userName;

	      ENElement e = new ENElement();
	      e.typeRef.code = ENElementType.PREPRODUCTION_OBJECT;
	      
 	      if (object.element.renRef != null ){
		    	 if ( object.element.renRef.code != Integer.MIN_VALUE ){
		    		 e.renRef.code = object.element.renRef.code;
		      }
	      }	      
	      
 	      // по идее может кидать таку фигню в ХОЕ ???
	      if ( e.renRef.code == Integer.MIN_VALUE){
	    	  //throw new EnergyproSystemException("Element not bound to EPRen.");
	    	  e.renRef.code = 0; // типа ХОЕ ...
	      }
	      
	      ENElementDAO eDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
	      
	      if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  e.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
	      object.element.code =  eDAO.add(e);
	      
	      
	      ENPreproductionObjectDAO objectDAO = new ENPreproductionObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.add(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENPreproductionObject%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }

	  /*ENPreproductionObject. Удалить*/
	  public void remove(int code)
	   {
	    try
	     {
	      ENPreproductionObjectDAO objectDAO = new ENPreproductionObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      objectDAO.remove(code);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENPreproductionObject%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }   

	   
	  /*ENPreproductionObject. Изменить*/
	  public void save(ENPreproductionObject object)
	   {
	    try
	     {
	      object.setDomain_info(null);
	      
	      object.dateEdit = new Date();
	      object.userGen = getUserProfile().userName;
	      
	      ENPreproductionObjectDAO objectDAO = new ENPreproductionObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	      ENElement el = new ENElement();
	      ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	
	      el = elDAO.getObject(object.element.code);
	      
	      if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  el.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
	      elDAO.save(el);
	      
	      objectDAO.save(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENPreproductionObject%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }
	
	
	
  public ENPreproductionObjectControllerEJB() {}


} // end of EJB Controller for ENPreproductionObject