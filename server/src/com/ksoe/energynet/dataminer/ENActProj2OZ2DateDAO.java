
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENActProj2OZ2DateDAOGen;

  /**
  *  DAO Object for ENActProj2OZ2Date;  
  * 	
  */

public class ENActProj2OZ2DateDAO extends ENActProj2OZ2DateDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENActProj2OZ2DateDAO() {super();}
  //public ENActProj2OZ2DateDAO(Connection aConnection) {super(aConnection);}
  //public ENActProj2OZ2DateDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENActProj2OZ2DateDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENActProj2OZ2DateDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENActProj2OZ2DateDAO

