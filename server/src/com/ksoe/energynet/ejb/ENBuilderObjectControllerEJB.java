
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENBuilderObject;
  *
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENBuilderObjectDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.ejb.generated.ENBuilderObjectControllerEJBGen;
import com.ksoe.energynet.valueobject.ENBuilderObject;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENBuilderObjectControllerEJB extends ENBuilderObjectControllerEJBGen
 {

	  public int add(ENBuilderObject object)
	   {
	    try
	     {
	      object.setDomain_info(null);

	      ENElement el = new ENElement();
	      ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      el.typeRef.code = ENElementType.BUILDER;
	      el.renRef.code = object.element.renRef.code;
	      
	      if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  el.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
	      el.code = elDAO.add(el);

	      object.element.code = el.code;

	      ENBuilderObjectDAO objectDAO = new ENBuilderObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.add(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENLine10%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }


	  public void save(ENBuilderObject object)
	   {
	    try
	     {
	      object.setDomain_info(null);
	      ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      ENElement el = new ENElement();
	      
	      el = elDAO.getObject(object.element.code);
	      
	      if (object.element.renRef.code != Integer.MIN_VALUE){
		      
		      el.renRef.code = object.element.renRef.code;
		      
	      }
	      
	      if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  el.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
	      elDAO.save(el);

	      ENBuilderObjectDAO objectDAO = new ENBuilderObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      objectDAO.save(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENLine10%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }


  public ENBuilderObjectControllerEJB() {}


} // end of EJB Controller for ENBuilderObject