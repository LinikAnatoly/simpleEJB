
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENSizObject;
  *
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENSizObjectDAO;
import com.ksoe.energynet.ejb.generated.ENSizObjectControllerEJBGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.SiZLogic;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENSizObject;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENSizObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENSizObjectShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENSizObjectControllerEJB extends ENSizObjectControllerEJBGen
 {

  public ENSizObjectControllerEJB() {}


    @Override
	public int add(ENSizObject object) {
        try {

            ENElement e = new ENElement();
            e.typeRef.code = ENElementType.SIZ;

            ENElementDAO elementDAO = new ENElementDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENSizObjectDAO objectDAO = new ENSizObjectDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENSizObjectFilter sFilter = new ENSizObjectFilter();

            // на одной должности - один работающий....
            sFilter.tabNumber = object.tabNumber;
            sFilter.statusCode = ENConsts.NO;

            ENSizObjectShortList sList = objectDAO.getScrollableFilteredList(sFilter,0,-1);

            if (sList.totalCount > 0){
                throw new EnergyproSystemException("\n"
                		+ "На цій посаді робітник існує!!! " + " таб.№ = " + sList.get(0).tabNumber);
            }


            if (object.element.renRef != null) {
                if (object.element.renRef.code != Integer.MIN_VALUE) {
                    e.renRef.code = object.element.renRef.code;
                }
            }


            if (object.element.elementInRef != null) {
                if (object.element.elementInRef.code != Integer.MIN_VALUE) {
                    ENElement inElement = elementDAO
                            .getObject(object.element.elementInRef.code);
                    e.elementInRef.code = inElement.code;
                    e.renRef.code = inElement.renRef.code;
                }
            }

            if (e.renRef.code == Integer.MIN_VALUE) {
                throw new EnergyproSystemException(
                        "Element not bound to EPRen.");
            }
            
  	      if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  e.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }


            e.code = elementDAO.add(e);

            object.element.code = e.code;


            if (object.fio != null && !object.fio.equals("")) {
                object.fio = object.fio.replaceAll("\n","").trim();
            }

            if (object.profesion != null && !object.profesion.equals("")) {
                object.profesion = object.profesion.replaceAll("\n","").trim();
            }

            return objectDAO.add(object);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENSizObject%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* ENSizObject. Удалять нельзя (статус уволен) */
    @Override
	public void remove(int code) {
        try {
            ENSizObjectDAO objectDAO = new ENSizObjectDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENSizObject object = objectDAO.getObject(code);

            /*
            * если были планы в САД ...
            */

            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
            planFilter.elementRef.code = object.element.code;
            int[] plArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);
            if (plArr.length > 0) {
                throw new EnergyproSystemException(
                        "Видаляти не можна!!! Використовуйте статус (звільнено)!!! ");
            }

            objectDAO.remove(code);

            /*
            *  удалить элемент
            */

            ENElementDAO elDAO = new ENElementDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            elDAO.remove(object.element.code);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't remove {%com.ksoe.energynet.valueobject.ENSizObject%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    /* ENSizObject. Изменить */
    @Override
	public void save(ENSizObject object) {
        try {

        	ENElementDAO elDao = new ENElementDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENSizObjectDAO objectDAO = new ENSizObjectDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            if (object.fio != null && !object.fio.equals("")) {
                object.fio = object.fio.replaceAll("\n","").trim();
            }

            if (object.profesion != null && !object.profesion.equals("")) {
                object.profesion = object.profesion.replaceAll("\n","").trim();
            }

            ENElement enElement = elDao.getObject(object.element.code, false);
			if (object.element.renRef != null) {
				if (object.element.renRef.code != Integer.MIN_VALUE) {
					
					enElement.renRef.code = object.element.renRef.code;
					
				 }
            }

			if (object.element.geoDepartmentRef != null) {
		    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
		    		  enElement.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
		    	  }
		    	  
		      }
			elDao.save(enElement);

            objectDAO.save(object);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't save {%com.ksoe.energynet.valueobject.ENSizObject%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


	/**
	 * обновление должности и подразделения по штатному
     *
     * @param soCode
     * @param tabNumber
     */
	public void updateStaffPosition(int soCode, String tabNumber) {
		try {

			SiZLogic siZLogic = new SiZLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			siZLogic.updateStaffPosition(soCode, tabNumber);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



} // end of EJB Controller for ENSizObject