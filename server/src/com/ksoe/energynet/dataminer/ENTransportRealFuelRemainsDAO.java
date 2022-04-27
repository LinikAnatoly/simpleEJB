
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTransportRealFuelRemainsDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTransportRealFuelRemains;  
  * 	
  */

public class ENTransportRealFuelRemainsDAO extends ENTransportRealFuelRemainsDAOGen {

  public ENTransportRealFuelRemainsDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportRealFuelRemainsDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTransportRealFuelRemainsDAO

