
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Fri Sep 18 11:06:01 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;

/**
  * EJB Controller for ENElement;  
  * 	
  */



import com.ksoe.energynet.ejb.generated.ENElementControllerEJBGen;
import com.ksoe.energynet.valueobject.brief.ENElementShort;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENElementControllerEJB extends ENElementControllerEJBGen
 {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public ENElementControllerEJB() {}
  
  public ENElementShort getShortObject(int code)
  {
	try {
		  ENElementDAO dao = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  return dao.getShortObject(code);
	  } catch (DatasourceConnectException e) {
		  throw new SystemException(e);
	} catch (PersistenceException e) {
		  throw new SystemException(e);
	} finally {
		  closeConnection();
	  }
  }


} // end of EJB Controller for ENElement