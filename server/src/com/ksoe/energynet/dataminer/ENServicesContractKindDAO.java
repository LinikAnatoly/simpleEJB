
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENServicesContractKindDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENServicesContractKind;
  *
  */

public class ENServicesContractKindDAO extends ENServicesContractKindDAOGen {

  public ENServicesContractKindDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENServicesContractKindDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENServicesContractKindDAO

