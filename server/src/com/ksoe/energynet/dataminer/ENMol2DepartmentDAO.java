
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENMol2DepartmentDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENMol2Department;  
  * 	
  */

public class ENMol2DepartmentDAO extends ENMol2DepartmentDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENMol2DepartmentDAO() {super();}
  //public ENMol2DepartmentDAO(Connection aConnection) {super(aConnection);}
  //public ENMol2DepartmentDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENMol2DepartmentDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENMol2DepartmentDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENMol2DepartmentDAO

