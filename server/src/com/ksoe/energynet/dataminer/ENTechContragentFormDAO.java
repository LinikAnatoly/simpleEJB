
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTechContragentFormDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTechContragentForm;  
  * 	
  */

public class ENTechContragentFormDAO extends ENTechContragentFormDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTechContragentFormDAO() {super();}
  //public ENTechContragentFormDAO(Connection aConnection) {super(aConnection);}
  //public ENTechContragentFormDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTechContragentFormDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTechContragentFormDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTechContragentFormDAO

