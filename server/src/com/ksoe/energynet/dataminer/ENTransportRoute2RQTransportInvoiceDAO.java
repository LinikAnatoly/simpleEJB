
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTransportRoute2RQTransportInvoiceDAOGen;

  /**
  *  DAO Object for ENTransportRoute2RQTransportInvoice;  
  * 	
  */

public class ENTransportRoute2RQTransportInvoiceDAO extends ENTransportRoute2RQTransportInvoiceDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportRoute2RQTransportInvoiceDAO() {super();}
  //public ENTransportRoute2RQTransportInvoiceDAO(Connection aConnection) {super(aConnection);}
  //public ENTransportRoute2RQTransportInvoiceDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportRoute2RQTransportInvoiceDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportRoute2RQTransportInvoiceDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTransportRoute2RQTransportInvoiceDAO

