
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTransportRoute2RQFKOrderDAOGen;

  /**
  *  DAO Object for ENTransportRoute2RQFKOrder;  
  * 	
  */

public class ENTransportRoute2RQFKOrderDAO extends ENTransportRoute2RQFKOrderDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportRoute2RQFKOrderDAO() {super();}
  //public ENTransportRoute2RQFKOrderDAO(Connection aConnection) {super(aConnection);}
  //public ENTransportRoute2RQFKOrderDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportRoute2RQFKOrderDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportRoute2RQFKOrderDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTransportRoute2RQFKOrderDAO

