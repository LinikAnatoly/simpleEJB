
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTransportOrderStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTransportOrderStatus;  
  * 	
  */

public class ENTransportOrderStatusDAO extends ENTransportOrderStatusDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportOrderStatusDAO() {super();}
  //public ENTransportOrderStatusDAO(Connection aConnection) {super(aConnection);}
  //public ENTransportOrderStatusDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportOrderStatusDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportOrderStatusDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTransportOrderStatusDAO

