
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENSITEquipment;
  *
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENSITEquipmentDAO;
import com.ksoe.energynet.ejb.generated.ENSITEquipmentControllerEJBGen;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENSITEquipment;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENSITEquipmentControllerEJB extends ENSITEquipmentControllerEJBGen
 {

	  public int add(ENSITEquipment object)
	   {
	    try
	     {
	      object.setDomain_info(null);

	      ENElement e = new ENElement();
	      e.typeRef.code = ENElementType.SIT;

  	      if (object.element.renRef != null ){
		     if ( object.element.renRef.code != Integer.MIN_VALUE ){
		    		 e.renRef.code = object.element.renRef.code;
		      }
		     else
		    	 e.renRef.code = 0; // ÚËÔ‡ ’Œ≈
	      }
  	      else
  	    	e.renRef.code = 0; // ÚËÔ‡ ’Œ≈



	      ENElementDAO elementDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	     
	      if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  e.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
	      
	      e.code = elementDAO.add(e);
	      object.element.code = e.code;

	      ENSITEquipmentDAO objectDAO = new ENSITEquipmentDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.add(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENSITEquipment%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }

	  public void save(ENSITEquipment object)
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

	      /*
	      if (object.element.elementInRef != null){
		        if (object.element.elementInRef.code != Integer.MIN_VALUE){
			      ENElement inElement = elDAO.getObject(object.element.elementInRef.code);
			      el.elementInRef.code = inElement.code;
			      el.renRef.code = inElement.renRef.code;
		        }
		      }
		  */

		  if ( el.renRef.code == Integer.MIN_VALUE){
		    	  throw new EnergyproSystemException("Element not bound to EPRen.");
		  }
		  
		  if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  el.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }

		  elDAO.save(el);

		  ENSITEquipmentDAO objectDAO = new ENSITEquipmentDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      objectDAO.save(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENRZAObject%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }


  public ENSITEquipmentControllerEJB() {}


} // end of EJB Controller for ENSITEquipment