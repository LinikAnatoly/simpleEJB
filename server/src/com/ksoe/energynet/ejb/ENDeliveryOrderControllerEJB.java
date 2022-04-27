
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENDeliveryOrder;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDeliveryOrderDAO;
import com.ksoe.energynet.ejb.generated.ENDeliveryOrderControllerEJBGen;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.TransportOrderLogic;
import com.ksoe.energynet.valueobject.ENDeliveryOrder;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENDeliveryOrderControllerEJB extends ENDeliveryOrderControllerEJBGen
 {

	
	  public int add(ENDeliveryOrder object, boolean isForTransportOrder)
	   {
	    try
	     {
	      // по идее пусть пока добавл€ют ... не всегда перезжает ( NET-314 ) 
	      //TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
          //tLogic.checkTransportItemInTravelSheet(object.transportInRef.code, true);
	    	
	      ENDeliveryOrderDAO objectDAO = new ENDeliveryOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      int code = objectDAO.add(object);
	      
	      	// NET-1184 ѕроверка транспорта в транспортных за€вках      
	    	TransportOrderLogic toLogic = new TransportOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	    	if(!isForTransportOrder)
	    	{
	    		toLogic.checkENTransportItemInTransportOrderByCode(object.transportInRef.code);
	    		toLogic.checkENTransportItemInTransportOrderByCode(object.transportOut.code);
	    	}
	      
	      new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).processDeliveryTimesByTransportCode(object.transportInRef.code);
	      
	      return code;
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENDeliveryOrder%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }
	  
	  public int add(ENDeliveryOrder object)
	  {
		  return add(object, false);
	  }
	  
	  public int addForTransportOrder(ENDeliveryOrder object)
	  {
		  return add(object, true);
	  }

	  /*ENDeliveryOrder. ”далить*/
	  public void remove(int code)
	   {
	    try
	     {
	      ENDeliveryOrderDAO objectDAO = new ENDeliveryOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      
	      ENDeliveryOrder obj = objectDAO.getObject(code);
	      //по идее пусть пока добавл€ют ... не всегда перезжает ( NET-314 )
	      //TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
          //tLogic.checkTransportItemInTravelSheet(obj.transportInRef.code, true);
	      
	      objectDAO.remove(code);
	      
	      new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).processDeliveryTimesByTransportCode(obj.transportInRef.code);
	      
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENDeliveryOrder%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }   

	   
	  /*ENDeliveryOrder. »зменить*/
	  public void save(ENDeliveryOrder object)
	   {
	    try
	     {
	      //по идее пусть пока добавл€ют ... не всегда перезжает ( NET-314 )
	      //TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
          //tLogic.checkTransportItemInTravelSheet(object.transportInRef.code, true);
	      
	      ENDeliveryOrderDAO objectDAO = new ENDeliveryOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      objectDAO.save(object);
	      
	      new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).processDeliveryTimesByTransportCode(object.transportInRef.code);

	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENDeliveryOrder%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }

	  
  public ENDeliveryOrderControllerEJB() {}


} // end of EJB Controller for ENDeliveryOrder