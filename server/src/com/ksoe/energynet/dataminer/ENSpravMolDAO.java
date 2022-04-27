
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENSpravMolDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENSpravMol;  
  * 	
  */

public class ENSpravMolDAO extends ENSpravMolDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENSpravMolDAO() {super();}
 // public ENSpravMolDAO(Connection aConnection) {super(aConnection);}
 //  public ENSpravMolDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENSpravMolDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENSpravMolDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENSpravMolDAO

