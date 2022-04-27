
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Wed Oct 07 14:18:06 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENPlanCorrectHistory;
  *
  */



import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.ejb.generated.ENPlanCorrectHistoryControllerEJBGen;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.valueobject.ENPlanCorrectHistory;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENPlanCorrectHistoryControllerEJB extends ENPlanCorrectHistoryControllerEJBGen
 {

	  @Override
	public int add(ENPlanCorrectHistory object)
	   {
	    try
	     {

	      object.dateEdit = new Date();
	      object.userGen = getUserProfile().userName;
	    /*
	      ENPlanCorrectHistoryFilter f = new ENPlanCorrectHistoryFilter();
	      f.planNewRef.code = object.planOldRef.code;

	      ENPlanCorrectHistoryDAO objectDAO = new ENPlanCorrectHistoryDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      ENPlanCorrectHistoryShortList l = objectDAO.getScrollableFilteredList(f,0,-1);

	      if (l.totalCount > 0 ){
	    	  object.planRef.code = l.get(0).planRefCode;
	      }
	      else{
	    	  object.planRef.code = object.planOldRef.code;
	      }

	      PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

	      int newPlanCode = planLogic.copyPlan(object.planOldRef.code, ENPlanWorkStatus.INCORRECTION, ENPlanWorkStatus.OLDER);

		    if (newPlanCode == Integer.MIN_VALUE){
		    	throw new EnergyproSystemException("Plan not corrected , code=" + object.planOldRef.code);
		    }

	      object.planNewRef.code = newPlanCode;

	      return objectDAO.add(object);
	      */
	    	PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	    	return planLogic.correctionPlan(object,ENPlanWorkStatus.INCORRECTION, ENPlanWorkStatus.OLDER );

	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENPlanCorrectHistory%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }

  public ENPlanCorrectHistoryControllerEJB() {}



} // end of EJB Controller for ENPlanCorrectHistory