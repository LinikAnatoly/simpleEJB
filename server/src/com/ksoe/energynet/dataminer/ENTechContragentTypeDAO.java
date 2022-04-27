
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTechContragentTypeDAOGen;

  /**
  *  DAO Object for ENTechContragentType;  
  * 	
  */

public class ENTechContragentTypeDAO extends ENTechContragentTypeDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTechContragentTypeDAO() {super();}
  //public ENTechContragentTypeDAO(Connection aConnection) {super(aConnection);}
  //public ENTechContragentTypeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTechContragentTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTechContragentTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTechContragentTypeDAO

