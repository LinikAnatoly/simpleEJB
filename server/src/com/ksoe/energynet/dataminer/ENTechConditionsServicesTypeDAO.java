
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTechConditionsServicesType;  
  * 	
  */

public class ENTechConditionsServicesTypeDAO extends ENTechConditionsServicesTypeDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTechConditionsServicesTypeDAO() {super();}
  //public ENTechConditionsServicesTypeDAO(Connection aConnection) {super(aConnection);}
  //public ENTechConditionsServicesTypeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTechConditionsServicesTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTechConditionsServicesTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTechConditionsServicesTypeDAO

