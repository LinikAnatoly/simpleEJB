
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTransportOrder2TransportItemDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTransportOrder2TransportItem;  
  * 	
  */

public class ENTransportOrder2TransportItemDAO extends ENTransportOrder2TransportItemDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportOrder2TransportItemDAO() {super();}
  //public ENTransportOrder2TransportItemDAO(Connection aConnection) {super(aConnection);}
  //public ENTransportOrder2TransportItemDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportOrder2TransportItemDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportOrder2TransportItemDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTransportOrder2TransportItemDAO

