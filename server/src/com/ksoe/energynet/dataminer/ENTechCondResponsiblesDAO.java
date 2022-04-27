
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTechCondResponsiblesDAOGen;

  /**
  *  DAO Object for ENTechCondResponsibles;  
  * 	
  */

public class ENTechCondResponsiblesDAO extends ENTechCondResponsiblesDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTechCondResponsiblesDAO() {super();}
  //public ENTechCondResponsiblesDAO(Connection aConnection) {super(aConnection);}
  //public ENTechCondResponsiblesDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTechCondResponsiblesDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTechCondResponsiblesDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTechCondResponsiblesDAO

