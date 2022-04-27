
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.FINDoc2ENServicesObjectDAOGen;

  /**
  *  DAO Object for FINDoc2ENServicesObject;  
  * 	
  */

public class FINDoc2ENServicesObjectDAO extends FINDoc2ENServicesObjectDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public FINDoc2ENServicesObjectDAO() {super();}
  //public FINDoc2ENServicesObjectDAO(Connection aConnection) {super(aConnection);}
  //public FINDoc2ENServicesObjectDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public FINDoc2ENServicesObjectDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINDoc2ENServicesObjectDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of FINDoc2ENServicesObjectDAO

