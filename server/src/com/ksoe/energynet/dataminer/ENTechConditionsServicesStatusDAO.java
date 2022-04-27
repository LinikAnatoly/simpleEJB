
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTechConditionsServicesStatus;  
  * 	
  */

public class ENTechConditionsServicesStatusDAO extends ENTechConditionsServicesStatusDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTechConditionsServicesStatusDAO() {super();}
  //public ENTechConditionsServicesStatusDAO(Connection aConnection) {super(aConnection);}
  //public ENTechConditionsServicesStatusDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTechConditionsServicesStatusDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTechConditionsServicesStatusDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTechConditionsServicesStatusDAO

