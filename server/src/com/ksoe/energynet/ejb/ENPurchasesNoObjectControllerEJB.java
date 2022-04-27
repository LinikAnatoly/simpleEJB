
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENPurchasesNoObject;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENPurchasesNoObjectDAO;
import com.ksoe.energynet.ejb.generated.ENPurchasesNoObjectControllerEJBGen;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPurchasesNoObject;
import com.ksoe.energynet.valueobject.ENPurchasesNoObjectType;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENPurchasesNoObjectControllerEJB extends ENPurchasesNoObjectControllerEJBGen
 {

	  public int add(ENPurchasesNoObject object)
	   {
	    try
	     {
	      object.setDomain_info(null);

	      ENElement e = new ENElement();
	      
	      if (object.typeRef.code == ENPurchasesNoObjectType.PURCHASES)
	    		e.typeRef.code = ENElementType.PURCHASES_NO_OBJECT;
	      
	      if (object.typeRef.code == ENPurchasesNoObjectType.WRITING)
	    		e.typeRef.code = ENElementType.WRITING_NO_OBJECT;
	      
	      if (object.typeRef.code == ENPurchasesNoObjectType.RESTOCKING)
	    		e.typeRef.code = ENElementType.NO_OBJECT_RESTOCKING;
	      
	      if (object.typeRef.code == ENPurchasesNoObjectType.GIFT)
	    		e.typeRef.code = ENElementType.NO_OBJECT_GIFT;
	      
	      if (object.typeRef.code == ENPurchasesNoObjectType.AVR16)
	    		e.typeRef.code = ENElementType.NO_OBJECT_AVR16;
	      
	      if (object.typeRef.code == ENPurchasesNoObjectType.AVZ)
	    		e.typeRef.code = ENElementType.NO_OBJECT_AVZ;	      
	      
 	      if (object.element.renRef != null ){
		    	 if ( object.element.renRef.code != Integer.MIN_VALUE ){
		    		 e.renRef.code = object.element.renRef.code;
		      }
	      }	      
	      
 	      // по идее может кидать таку фигню в ХОЕ ???
	      if ( e.renRef.code == Integer.MIN_VALUE){
	    	  throw new EnergyproSystemException("Element not bound to EPRen.");
	      }
	      
	      ENElementDAO eDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
	     
	      if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  e.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
	      
	      object.element.code =  eDAO.add(e);
	      
	      ENPurchasesNoObjectDAO objectDAO = new ENPurchasesNoObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.add(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENPurchasesObject%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }

	  public void save(ENPurchasesNoObject object)
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
		      
		  if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  el.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
		  
		  elDAO.save(el);
		      
		  ENPurchasesNoObjectDAO objectDAO = new ENPurchasesNoObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      objectDAO.save(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENRZAObject%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }

	  
  public ENPurchasesNoObjectControllerEJB() {}


} // end of EJB Controller for ENPurchasesNoObject