
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTransportTemperatureDAOGen;
import com.ksoe.energynet.valueobject.ENTransportTemperature;
import com.ksoe.energynet.valueobject.filter.ENTransportTemperatureFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportTemperatureShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;

  /**
  *  DAO Object for ENTransportTemperature;  
  * 	
  */

public class ENTransportTemperatureDAO extends ENTransportTemperatureDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportTemperatureDAO() {super();}
  //public ENTransportTemperatureDAO(Connection aConnection) {super(aConnection);}
  //public ENTransportTemperatureDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportTemperatureDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportTemperatureDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}
  
  /**
   * 
   * Возвращает заданный объект ENTransportTemperature по коду транспортного подразделения и дате
   * 
   * @param transportDepartmentCode код транспортного подразделения 
   * @param date дата прогноза
   * @return
   */
  public ENTransportTemperature getTemperature(int transportDepartmentCode, Date date) throws PersistenceException
  {
	  ENTransportTemperatureFilter filter = new ENTransportTemperatureFilter();
	  filter.dateGen = date;
	  filter.transportDepartmentRef.code = transportDepartmentCode;
	  ENTransportTemperatureShortList list = this.getScrollableFilteredList(filter, 0, -1);
	  
	  if(list.totalCount > 1)
		  throw new EnergyproSystemException("Неправильное кол-во прогнозов на дату " + date.toString());
	  else
		  if(list.totalCount == 1)
			  return this.getObject(list.get(0).code);
	  
	  return null;
	  
  }
  
  public int add(ENTransportTemperature obj) throws PersistenceException
  {
	Date now = new Date(System.currentTimeMillis());
	obj.userGen = getUserProfile().userName;
	obj.dateEdit = now; 
	return super.add(obj);  
  }




} // end of ENTransportTemperatureDAO

