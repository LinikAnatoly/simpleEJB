
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENServicesObjectCalcTypeDAOGen;

  /**
  *  DAO Object for ENServicesObjectCalcType;  
  * 	
  */

public class ENServicesObjectCalcTypeDAO extends ENServicesObjectCalcTypeDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENServicesObjectCalcTypeDAO() {super();}
  //public ENServicesObjectCalcTypeDAO(Connection aConnection) {super(aConnection);}
  //public ENServicesObjectCalcTypeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENServicesObjectCalcTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENServicesObjectCalcTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENServicesObjectCalcTypeDAO

