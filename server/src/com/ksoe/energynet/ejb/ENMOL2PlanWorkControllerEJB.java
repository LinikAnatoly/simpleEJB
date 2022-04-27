
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENMOL2PlanWork;
  *
  */



import java.sql.Connection;
import java.sql.SQLException;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENMOL2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENMOL2PlanWorkControllerEJBGen;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENMOL2PlanWork;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObjectStatus;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENMOL2PlanWorkControllerEJB extends ENMOL2PlanWorkControllerEJBGen
 {

  public ENMOL2PlanWorkControllerEJB() {}


  @Override
public int add(ENMOL2PlanWork object)
  {
	  Connection enConn = null;

	  try
	  {
		 enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	     PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());

	     ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

	     if (plan.kind.code == ENPlanWorkKind.CURRENT && plan.stateRef.code == ENPlanWorkState.WORK_IN_OUT)
	     {
		   	  ENElementDAO elementDAO = new ENElementDAO(enConn, getUserProfile());
		   	  ENElement element = elementDAO.getObject(plan.elementRef.code);

		   	  if (element.typeRef.code == ENElementType.SERVICES_OBJECT)
		   	  {
		   		  ENServicesObjectDAO soDAO = new ENServicesObjectDAO(enConn, getUserProfile());
		   		  ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
		   		  soFilter.element.code = element.code;

		   		  int[] soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1);

		   		  if (soArr.length > 0)
		   		  {
		   			  ENServicesObject so = soDAO.getObject(soArr[0]);

		   			  if (so != null)
		   			  {
		    			  /////
		    			  if (so.statusRef.code == ENServicesObjectStatus.ACT_TRANSFER_CLOSED)
		    			  {
					    	  throw new EnergyproSystemException("\n \n NET-3079 За договором з послуг на сторону вже проведено Акт приймання-передачі! \n " +
					    			  "Додавати МВО для рознарядки заборонено (для цього потрібно спочатку відмінити Акт)!");
		    			  }
		    			  /////
		   			  }
		   		  }
		   	  }
	     }


	     return super.add(object);
	   }
	   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENMOL2PlanWork%} object.",e);}
	   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	   finally
	   {
			try {
				if (enConn != null && ! enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
	   }
  }

  @Override
public void save(ENMOL2PlanWork object)
  {
	  Connection enConn = null;

	  try
	  {
		 enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	     PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());

	     ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

	     if (plan.kind.code == ENPlanWorkKind.CURRENT && plan.stateRef.code == ENPlanWorkState.WORK_IN_OUT)
	     {
		   	  ENElementDAO elementDAO = new ENElementDAO(enConn, getUserProfile());
		   	  ENElement element = elementDAO.getObject(plan.elementRef.code);

		   	  if (element.typeRef.code == ENElementType.SERVICES_OBJECT)
		   	  {
		   		  ENServicesObjectDAO soDAO = new ENServicesObjectDAO(enConn, getUserProfile());
		   		  ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
		   		  soFilter.element.code = element.code;

		   		  int[] soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1);

		   		  if (soArr.length > 0)
		   		  {
		   			  ENServicesObject so = soDAO.getObject(soArr[0]);

		   			  if (so != null)
		   			  {
		    			  /////
		    			  if (so.statusRef.code == ENServicesObjectStatus.ACT_TRANSFER_CLOSED)
		    			  {
					    	  throw new EnergyproSystemException("\n \n NET-3079 За договором з послуг на сторону вже проведено Акт приймання-передачі! \n " +
					    			  "Змінювати МВО для рознарядки заборонено (для цього потрібно спочатку відмінити Акт)!");
		    			  }
		    			  /////
		   			  }
		   		  }
		   	  }
	     }


	     super.save(object);
	   }
	   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENMOL2PlanWork%} object.",e);}
	   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	   finally
	   {
			try {
				if (enConn != null && ! enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
	   }
  }


  @Override
public void remove(int code)
   {
	  Connection enConn = null;

	  try
	  {
		 enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

		 ENMOL2PlanWorkDAO objectDAO = new ENMOL2PlanWorkDAO(getUserProfile(), enConn);
	     PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());

	     ENMOL2PlanWork object = objectDAO.getObject(code);
	     ENPlanWork plan = planLogic.getPlanByCode(object.planRef.code);

	     if (plan.kind.code == ENPlanWorkKind.CURRENT && plan.stateRef.code == ENPlanWorkState.WORK_IN_OUT)
	     {
		   	  ENElementDAO elementDAO = new ENElementDAO(enConn, getUserProfile());
		   	  ENElement element = elementDAO.getObject(plan.elementRef.code);

		   	  if (element.typeRef.code == ENElementType.SERVICES_OBJECT)
		   	  {
		   		  ENServicesObjectDAO soDAO = new ENServicesObjectDAO(enConn, getUserProfile());
		   		  ENServicesObjectFilter soFilter = new ENServicesObjectFilter();
		   		  soFilter.element.code = element.code;

		   		  int[] soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1);

		   		  if (soArr.length > 0)
		   		  {
		   			  ENServicesObject so = soDAO.getObject(soArr[0]);

		   			  if (so != null)
		   			  {
		    			  /////
		    			  if (so.statusRef.code == ENServicesObjectStatus.ACT_TRANSFER_CLOSED)
		    			  {
					    	  throw new EnergyproSystemException("\n \n NET-3079 За договором з послуг на сторону вже проведено Акт приймання-передачі! \n " +
					    			  "Видаляти МВО для рознарядки заборонено (для цього потрібно спочатку відмінити Акт)!");
		    			  }
		    			  /////
		   			  }
		   		  }
		   	  }
	     }


	     super.remove(code);
	   }
	   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENMOL2PlanWork%} object.",e);}
	   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	   finally
	   {
			try {
				if (enConn != null && ! enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
	   }
   }
} // end of EJB Controller for ENMOL2PlanWork