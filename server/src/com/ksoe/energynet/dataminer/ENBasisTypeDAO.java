
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENBasisTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENBasisType;  
  * 	
  */

public class ENBasisTypeDAO extends ENBasisTypeDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENBasisTypeDAO() {super();}
  //public ENBasisTypeDAO(Connection aConnection) {super(aConnection);}
  //public ENBasisTypeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENBasisTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENBasisTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENBasisTypeDAO

