
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTransportOrder2TravelDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTransportOrder2Travel;  
  * 	
  */

public class ENTransportOrder2TravelDAO extends ENTransportOrder2TravelDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportOrder2TravelDAO() {super();}
  //public ENTransportOrder2TravelDAO(Connection aConnection) {super(aConnection);}
  //public ENTransportOrder2TravelDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportOrder2TravelDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportOrder2TravelDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTransportOrder2TravelDAO

