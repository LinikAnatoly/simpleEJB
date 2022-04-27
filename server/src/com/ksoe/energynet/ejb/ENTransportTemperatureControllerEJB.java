
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENTransportTemperature;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENTransportDepartmentDAO;
import com.ksoe.energynet.dataminer.ENTransportTemperatureDAO;
import com.ksoe.energynet.ejb.generated.ENTransportTemperatureControllerEJBGen;
//import com.ksoe.energynet.valueobject.ENTransportTemperature;
//import com.ksoe.energynet.valueobject.ENTransportTemperature;
//import com.ksoe.energynet.valueobject.lists.ENTransportTemperatureShortList;
//import com.ksoe.energynet.valueobject.filter.ENTransportTemperatureFilter;
import com.ksoe.energynet.valueobject.ENTransportDepartment;
import com.ksoe.energynet.valueobject.ENTransportTemperature;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENTransportTemperatureControllerEJB extends ENTransportTemperatureControllerEJBGen
 {

  public ENTransportTemperatureControllerEJB() {}
  
  public int add(ENTransportTemperature obj)
  {
	  try
	  {
		ENTransportTemperatureDAO ttDAO = new ENTransportTemperatureDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		
	  	ENTransportTemperature temperature = ttDAO.getTemperature(obj.transportDepartmentRef.code, obj.dateGen);
	  	if(temperature != null)
	  	{
			ENTransportDepartmentDAO tdDAO = new ENTransportDepartmentDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENTransportDepartment objDepartment = tdDAO.getObject(obj.transportDepartmentRef.code);
	  		throw new EnergyproSystemException("Вже є значення температури для транспортного підрозділу " + objDepartment.name + " на дату " + obj.dateGen);
	  	}
	  	return super.add(obj);
	  }
	  catch(DatasourceConnectException e) {throw new EnergyproSystemException(e);}
	  catch(PersistenceException e){throw new EnergyproSystemException(e);}
	  finally {}
  }
  
  public void save(ENTransportTemperature obj)
  {
	  try
	  {
		ENTransportTemperatureDAO ttDAO = new ENTransportTemperatureDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		
	  	ENTransportTemperature temperature = ttDAO.getTemperature(obj.transportDepartmentRef.code, obj.dateGen);
	  	if(temperature != null && temperature.code != obj.code)
	  	{
			ENTransportDepartmentDAO tdDAO = new ENTransportDepartmentDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENTransportDepartment objDepartment = tdDAO.getObject(obj.transportDepartmentRef.code);
	  		throw new EnergyproSystemException("Вже є значення температури для транспортного підрозділу " + objDepartment.name + " на дату " + obj.dateGen);
	  	}
	  	
	  	super.save(obj);
	  	
	  }
	  catch(DatasourceConnectException e) {throw new EnergyproSystemException(e);}
	  catch(PersistenceException e){throw new EnergyproSystemException(e);}
	  finally {} 
  }


} // end of EJB Controller for ENTransportTemperature