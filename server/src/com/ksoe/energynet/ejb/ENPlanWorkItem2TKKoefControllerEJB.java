
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENPlanWorkItem2TKKoef;
  *
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENPlanWorkItem2TKKoefDAO;
import com.ksoe.energynet.ejb.generated.ENPlanWorkItem2TKKoefControllerEJBGen;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.PlanWorkItemLogic;
import com.ksoe.energynet.valueobject.ENPlanWorkItem2TKKoef;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;


public class ENPlanWorkItem2TKKoefControllerEJB extends ENPlanWorkItem2TKKoefControllerEJBGen {


	public ENPlanWorkItem2TKKoefControllerEJB() {
	}


	/* ENPlanWorkItem2TKKoef. Добавить */
	@Override
	public int add(ENPlanWorkItem2TKKoef planWorkItem2TKKoef) {
		try {

			PlanWorkItemLogic planWorkItemLogic = new PlanWorkItemLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			return planWorkItemLogic.addPlanWorkItem2TKKoef(planWorkItem2TKKoef);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENPlanWorkItem2TKKoef%} object.", e);
		} finally {
			closeConnection();
		}
	}


  /*ENPlanWorkItem2TKKoef. Удалить*/
  @Override
public void remove(int code)
   {
    try
     {
      ENPlanWorkItem2TKKoefDAO objectDAO = new ENPlanWorkItem2TKKoefDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

      ENPlanWorkItem2TKKoef cf = objectDAO.getObject(code);

      objectDAO.remove(code);

      new PlanWorkItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) ,getUserProfile()).updateCoef(cf.planWorkItemRef.code);
      // время на людях ..
      new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) ,getUserProfile()).recalcHumenItemsByPlanItemCode(cf.planWorkItemRef.code);

     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENPlanWorkItem2TKKoef%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }


  /*ENPlanWorkItem2TKKoef. Изменить*/
  @Override
public void save(ENPlanWorkItem2TKKoef object)
   {
    try
     {
      object.setDomain_info(null);

      ENPlanWorkItem2TKKoefDAO objectDAO = new ENPlanWorkItem2TKKoefDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      objectDAO.save(object);

      new PlanWorkItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) ,getUserProfile()).updateCoef(object.planWorkItemRef.code);

      // время на людях ..
      new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) ,getUserProfile()).recalcHumenItemsByPlanItemCode(object.planWorkItemRef.code);

     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENPlanWorkItem2TKKoef%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

} // end of EJB Controller for ENPlanWorkItem2TKKoef