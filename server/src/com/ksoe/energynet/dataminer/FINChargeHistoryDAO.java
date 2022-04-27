
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.FINChargeHistoryDAOGen;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for FINChargeHistory;  
  * 	
  */

public class FINChargeHistoryDAO extends FINChargeHistoryDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public FINChargeHistoryDAO() {super();}
  //public FINChargeHistoryDAO(Connection aConnection) {super(aConnection);}
  //public FINChargeHistoryDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public FINChargeHistoryDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINChargeHistoryDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}
  
	public BigDecimal getChargePercentByDate(int typeCharge, Date dateSrez) throws PersistenceException
	  {
     String sql =
  	   " Select fh.chargepercent from finchargehistory fh  \n" +
  	   " Where fh.chargerefcode = ? \n" +
  	   "   And fh.dategen = ( Select max(fhh.dategen)  from finchargehistory fhh \n" +
  	   "                       Where fhh.dategen <= ?  \n" +
  	   "                         and fhh.chargerefcode = ? \n" +
  	   "                       )   \n" +
  	   "  \n" ;
     
     Vector<Object> binded = new Vector<Object>();
     binded.add(typeCharge);
     binded.add(dateSrez);
     binded.add(typeCharge);
     
     BigDecimal result = BaseDAOUtils.executeStatementAndReadObject(this.getConnection()
    		 , sql, binded, new BaseDAOUtils.BigDecimalFromResultSetTransformator()
  		   , false);
     
     if(result == null) result = new BigDecimal(0).setScale(2, BigDecimal.ROUND_HALF_UP);
     return result;

	}




} // end of FINChargeHistoryDAO

