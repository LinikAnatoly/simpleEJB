
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTechCondResponsibles2DepDAOGen;

  /**
  *  DAO Object for ENTechCondResponsibles2Dep;  
  * 	
  */

public class ENTechCondResponsibles2DepDAO extends ENTechCondResponsibles2DepDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTechCondResponsibles2DepDAO() {super();}
  //public ENTechCondResponsibles2DepDAO(Connection aConnection) {super(aConnection);}
  //public ENTechCondResponsibles2DepDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTechCondResponsibles2DepDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTechCondResponsibles2DepDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTechCondResponsibles2DepDAO

