
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.CNRole2DomainInfoDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for CNRole2DomainInfo;  
  * 	
  */

public class CNRole2DomainInfoDAO extends CNRole2DomainInfoDAOGen {

  public CNRole2DomainInfoDAO() {super();}
  public CNRole2DomainInfoDAO(Connection aConnection) {super(aConnection);}
  public CNRole2DomainInfoDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public CNRole2DomainInfoDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public CNRole2DomainInfoDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of CNRole2DomainInfoDAO

