
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENResponsiblesDAOGen;

  /**
  *  DAO Object for ENResponsibles;  
  * 	
  */

public class ENResponsiblesDAO extends ENResponsiblesDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENResponsiblesDAO() {super();}
  //public ENResponsiblesDAO(Connection aConnection) {super(aConnection);}
  //public ENResponsiblesDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENResponsiblesDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENResponsiblesDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENResponsiblesDAO

