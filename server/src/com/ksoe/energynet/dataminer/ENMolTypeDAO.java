
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENMolTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENMolType;  
  * 	
  */

public class ENMolTypeDAO extends ENMolTypeDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENMolTypeDAO() {super();}
  //public ENMolTypeDAO(Connection aConnection) {super(aConnection);}
  //public ENMolTypeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENMolTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENMolTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENMolTypeDAO

