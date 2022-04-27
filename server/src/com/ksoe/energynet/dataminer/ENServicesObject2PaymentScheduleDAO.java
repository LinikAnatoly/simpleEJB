
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENServicesObject2PaymentScheduleDAOGen;

  /**
  *  DAO Object for ENServicesObject2PaymentSchedule;  
  * 	
  */

public class ENServicesObject2PaymentScheduleDAO extends ENServicesObject2PaymentScheduleDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENServicesObject2PaymentScheduleDAO() {super();}
  //public ENServicesObject2PaymentScheduleDAO(Connection aConnection) {super(aConnection);}
  //public ENServicesObject2PaymentScheduleDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENServicesObject2PaymentScheduleDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENServicesObject2PaymentScheduleDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENServicesObject2PaymentScheduleDAO

