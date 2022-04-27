
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENPayment2SOTypeDAOGen;

  /**
  *  DAO Object for ENPayment2SOType;  
  * 	
  */

public class ENPayment2SOTypeDAO extends ENPayment2SOTypeDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENPayment2SOTypeDAO() {super();}
  //public ENPayment2SOTypeDAO(Connection aConnection) {super(aConnection);}
  //public ENPayment2SOTypeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENPayment2SOTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENPayment2SOTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENPayment2SOTypeDAO

