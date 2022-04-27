
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENBankingBillTypeDAOGen;

  /**
  *  DAO Object for ENBankingBillType;  
  * 	
  */

public class ENBankingBillTypeDAO extends ENBankingBillTypeDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENBankingBillTypeDAO() {super();}
  //public ENBankingBillTypeDAO(Connection aConnection) {super(aConnection);}
  //public ENBankingBillTypeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENBankingBillTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENBankingBillTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENBankingBillTypeDAO

