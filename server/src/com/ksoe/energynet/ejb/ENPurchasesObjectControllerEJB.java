
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENPurchasesObject;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENPurchasesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENPurchasesObjectControllerEJBGen;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPurchasesObject;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENPurchasesObjectControllerEJB extends ENPurchasesObjectControllerEJBGen
 {

	  public int add(ENPurchasesObject object)
	   {
	    try
	     {
	      object.setDomain_info(null);

	      ENElement e = new ENElement();
	      e.typeRef.code = ENElementType.PURCHASES_OBJECT;
	      
	      if (object.element.renRef != null ){
		    	 if ( object.element.renRef.code != Integer.MIN_VALUE ){
		    		 e.renRef.code = object.element.renRef.code;
		      }
	      }	      
	      
	      // по идее может кидать таку фигню в ХОЕ ???
	      if ( e.renRef.code == Integer.MIN_VALUE){
	    	  throw new EnergyproSystemException("Element not bound to EPRen.");
	      }
	      
	      if ( object.expandMaterialsIP == Integer.MIN_VALUE){
	    	  throw new EnergyproSystemException("NET-4301. Неуказан признак на объекте. \"планирование ИП: разворачивать по материалам\"  ");
	      }
	      
	      ENElementDAO eDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
	      
	      if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  e.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
	      
	      object.element.code =  eDAO.add(e);
	      
	      ENPurchasesObjectDAO objectDAO = new ENPurchasesObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.add(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENPurchasesObject%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }
	

	  public void save(ENPurchasesObject object)
	   {
	    try
	     {
	      object.setDomain_info(null);

	      ENElement el = new ENElement();
	      ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      
	      el = elDAO.getObject(object.element.code);

	      if (object.element.renRef != null ){
		    	 if ( object.element.renRef.code != Integer.MIN_VALUE ){
		    		 el.renRef.code = object.element.renRef.code;
		      }
	      }
		      
		  if ( el.renRef.code == Integer.MIN_VALUE){
		    	  throw new EnergyproSystemException("Element not bound to EPRen.");
		  }
		  
		  if ( object.expandMaterialsIP == Integer.MIN_VALUE){
	    	  throw new EnergyproSystemException("NET-4301. Неуказан признак на объекте. \"планирование ИП: разворачивать по материалам\"  ");
	      }
		  
		  if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  el.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
		      
		  elDAO.save(el);
		      
		  ENPurchasesObjectDAO objectDAO = new ENPurchasesObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      objectDAO.save(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENRZAObject%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }
	  
	  
  public ENPurchasesObjectControllerEJB() {}


} // end of EJB Controller for ENPurchasesObject