
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENBindingOver;
  *
  */



import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENBindingOverDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.ejb.generated.ENBindingOverControllerEJBGen;
import com.ksoe.energynet.valueobject.ENBindingOver;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENBindingOverControllerEJB extends ENBindingOverControllerEJBGen
 {


	 /*ENBindingOver. Добавить*/
	  public int add(ENBindingOver object)
	   {
	    try
	     {
	    	if (object.dateGen == null) {
	    		object.dateGen = new Date();
	    	}

	      object.dateEdit = new Date();
	      object.userGen = getUserProfile().userName;

	      ENBindingOverDAO objectDAO = new ENBindingOverDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.add(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENBindingOver%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }


	  public void save(ENBindingOver object)
	   {
	    try
	     {

		  object.dateEdit = new Date();
		  object.userGen = getUserProfile().userName;

		  ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		  ENPlanWork plan = planDAO.getObject(object.planRef.code);

		  if (plan == null){
			  throw new EnergyproSystemException("План не найден ...");
		  }

		  if (
				  (plan.typeRef.code == ENPlanWorkType.PREDPISANIE)
				  &&
				  (plan.kind.code != ENPlanWorkKind.CURRENT)
			  )
		  {
			  throw new EnergyproSystemException("Дані про Припис коригуються на Черновом Поточном плані ... ");
		  }

	      ENBindingOverDAO objectDAO = new ENBindingOverDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      objectDAO.save(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENBindingOver%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }


  public ENBindingOverControllerEJB() {}


} // end of EJB Controller for ENBindingOver