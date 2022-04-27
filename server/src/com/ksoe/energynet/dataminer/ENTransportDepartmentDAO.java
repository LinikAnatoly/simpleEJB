
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTransportDepartmentDAOGen;
import com.ksoe.energynet.valueobject.ENTransportDepartment;
import com.ksoe.energynet.valueobject.filter.ENTransportDep2DepFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportDep2DepShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTransportDepartment;  
  * 	
  */

public class ENTransportDepartmentDAO extends ENTransportDepartmentDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportDepartmentDAO() {super();}
  //public ENTransportDepartmentDAO(Connection aConnection) {super(aConnection);}
  //public ENTransportDepartmentDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportDepartmentDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportDepartmentDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public ENTransportDepartment getByDepartmentCode(int departmentCode) throws PersistenceException {
	  if(departmentCode == Integer.MIN_VALUE) {
		  throw new java.lang.NullPointerException();
	  }
	  ENTransportDep2DepDAO dao = new ENTransportDep2DepDAO(this.getConnection(), this.getUserProfile());
	  ENTransportDep2DepFilter filter = new ENTransportDep2DepFilter();
	  filter.department.code = departmentCode;
	  ENTransportDep2DepShortList list = dao.getScrollableFilteredList(filter, 0, 1);
	  if(list != null && list.totalCount > 0) {
		  return this.getObject(list.get(0).transportDepartmentCode);
	  } else {
		  return null;
	  }
  }


} // end of ENTransportDepartmentDAO

