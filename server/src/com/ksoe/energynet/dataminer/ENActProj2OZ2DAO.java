
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENActProj2OZ2DAOGen;

  /**
  *  DAO Object for ENActProj2OZ2;  
  * 	
  */

public class ENActProj2OZ2DAO extends ENActProj2OZ2DAOGen {

  // ��� ��� ����� .. ����� �������� ������ !!!
  //public ENActProj2OZ2DAO() {super();}
  //public ENActProj2OZ2DAO(Connection aConnection) {super(aConnection);}
  //public ENActProj2OZ2DAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENActProj2OZ2DAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENActProj2OZ2DAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENActProj2OZ2DAO

