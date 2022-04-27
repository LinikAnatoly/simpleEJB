
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENMolFuelMotionTypeDAOGen;

  /**
  *  DAO Object for ENMolFuelMotionType;  
  * 	
  */

public class ENMolFuelMotionTypeDAO extends ENMolFuelMotionTypeDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENMolFuelMotionTypeDAO() {super();}
  //public ENMolFuelMotionTypeDAO(Connection aConnection) {super(aConnection);}
  //public ENMolFuelMotionTypeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENMolFuelMotionTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENMolFuelMotionTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENMolFuelMotionTypeDAO

