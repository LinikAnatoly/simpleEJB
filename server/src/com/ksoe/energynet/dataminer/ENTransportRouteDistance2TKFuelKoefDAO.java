
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTransportRouteDistance2TKFuelKoefDAOGen;

  /**
  *  DAO Object for ENTransportRouteDistance2TKFuelKoef;  
  * 	
  */

public class ENTransportRouteDistance2TKFuelKoefDAO extends ENTransportRouteDistance2TKFuelKoefDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportRouteDistance2TKFuelKoefDAO() {super();}
  //public ENTransportRouteDistance2TKFuelKoefDAO(Connection aConnection) {super(aConnection);}
  //public ENTransportRouteDistance2TKFuelKoefDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportRouteDistance2TKFuelKoefDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportRouteDistance2TKFuelKoefDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTransportRouteDistance2TKFuelKoefDAO

