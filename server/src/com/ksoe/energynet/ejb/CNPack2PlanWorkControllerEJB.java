
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for CNPack2PlanWork;
  *
  */



import java.sql.Connection;
import java.sql.SQLException;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.CNPack2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.ejb.generated.CNPack2PlanWorkControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.CNLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.valueobject.CNPack2PlanWork;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class CNPack2PlanWorkControllerEJB extends CNPack2PlanWorkControllerEJBGen
 {


	  public int createPack(CNPack2PlanWork object)
	  {
		  int out = Integer.MIN_VALUE;
		  Connection cnConn = null;
		  Connection enConn = null;

		  try
		  {
			  cnConn = getConnection(AuthorizationJNDINames.CN_DATASOURCE);
			  enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			  AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			  if ( ! l.checkPermission4PlanItems(object.planRef.code) ){
				  throw new EnergyproSystemException("Acces denied for method addBy... from method ENPlanWork.save()");
			  }

			  // изменим статус у плана !!!
			  // рэсы типа отсылают на утверждение !!!

			  ENPlanWorkDAO objDAO = new ENPlanWorkDAO(enConn, getUserProfile());

			  ENPlanWork obj1 = objDAO.getObject(object.planRef.code);

			  PlanWorkLogic pLogic = new PlanWorkLogic(enConn, getUserProfile());

			  if (( obj1.kind.code != ENPlanWorkKind.NPW ) || pLogic.isNotEditablePlan(obj1)){
				  throw new EnergyproSystemException("PlanWork not Editable or not NPZ , code="+object.planRef.code);
			  }

			  obj1.status.code = ENPlanWorkStatus.PRECONFIRMED;

			  objDAO.save(obj1);


			  // создаем пакет ....
			  String s = null;
			  s=s+" ";
			  CNLogic cnLogic = new CNLogic( cnConn, getUserProfile() );
			  //cnLogic.energyNetConnection = enConn;

			  out = cnLogic.addPack(object);

			  if (out == Integer.MIN_VALUE){
				  throw new EnergyproSystemException("Pack not created for plan. Plan code=" + object.planRef.code);
			  }

			  object.packCode = out;

			  // сохраним развязку с Пакетом и планом ...
			  CNPack2PlanWorkDAO objectDAO = new CNPack2PlanWorkDAO(enConn, getUserProfile());

			  objectDAO.add(object);


			  return out;
		     }
		    catch (DatasourceConnectException e) {throw new EnergyproSystemException("",e); }
		    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
		    finally                              {
				try {
					if (cnConn != null && ! cnConn.isClosed()) {
						cnConn.close();
						cnConn = null;
					}
				} catch (SQLException e) {
				}
				try {
					if (enConn != null && ! enConn.isClosed()) {
						enConn.close();
						enConn = null;
					}
				} catch (SQLException e) {
				}
		    }
	  }


  public CNPack2PlanWorkControllerEJB() {}


} // end of EJB Controller for CNPack2PlanWork