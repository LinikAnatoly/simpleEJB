
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENRouteByt;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENRouteBytDAO;
import com.ksoe.energynet.ejb.generated.ENRouteBytControllerEJBGen;
//import com.ksoe.energynet.valueobject.ENRouteByt;
//import com.ksoe.energynet.valueobject.ENRouteByt;
//import com.ksoe.energynet.valueobject.lists.ENRouteBytShortList;
//import com.ksoe.energynet.valueobject.filter.ENRouteBytFilter;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENRouteByt;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENRouteBytControllerEJB extends ENRouteBytControllerEJBGen
 {

  public ENRouteBytControllerEJB() {}

  public int add(ENRouteByt object)
  {
   try
    {

     ENElement e = new ENElement();
     e.typeRef.code = ENElementType.ROUTE_BYT;
      ENElementDAO elementDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

      if (object.element.renRef != null ){
	    	 if ( object.element.renRef.code != Integer.MIN_VALUE ){
	    		 e.renRef.code = object.element.renRef.code;
	      }
     }


	      if ( e.renRef.code == Integer.MIN_VALUE){
	    	  throw new EnergyproSystemException("Element not bound to EPRen.");
	      }


     e.code = elementDAO.add(e);

     object.element.code = e.code;


     ENRouteBytDAO objectDAO = new ENRouteBytDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
     return objectDAO.add(object);
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENRecordPointByt%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
  }

} // end of EJB Controller for ENRouteByt