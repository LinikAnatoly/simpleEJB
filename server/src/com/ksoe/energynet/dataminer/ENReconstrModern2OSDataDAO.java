
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENReconstrModern2OSDataDAOGen;

  /**
  *  DAO Object for ENReconstrModern2OSData;  
  * 	
  */

public class ENReconstrModern2OSDataDAO extends ENReconstrModern2OSDataDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENReconstrModern2OSDataDAO() {super();}
  //public ENReconstrModern2OSDataDAO(Connection aConnection) {super(aConnection);}
  //public ENReconstrModern2OSDataDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENReconstrModern2OSDataDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENReconstrModern2OSDataDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENReconstrModern2OSDataDAO

