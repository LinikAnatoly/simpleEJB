
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENSzBrigadeDAO;
/**
  * EJB Controller for ENSzBrigade;
  *
  */
import com.ksoe.energynet.ejb.generated.ENSzBrigadeControllerEJBGen;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.logic.ElementLogic;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENSzBrigade;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENSzBrigadeControllerEJB extends ENSzBrigadeControllerEJBGen
 {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public int add(ENSzBrigade object) {
		try {
			checkDepartment(object);

			ElementLogic eLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENSzBrigadeDAO dao = new ENSzBrigadeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENElementDAO eDao = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			setDepartment(object);
			object.element.code = eLogic.addElement(object.departmentRef.code, ENElementType.BSZ);

			if (object.element.geoDepartmentRef != null) {
		    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
		    		  ENElement e = eDao.getObject(object.element.code);
		    		  e.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
		    		  eDao.save(e);
		    	  }
		    	  
		      }
			
			
			
			object.statusCode = ENSzBrigade.WORKING;

			return dao.add(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}


	private void checkDepartment(ENSzBrigade object) {
		if(object.departmentRef == null || object.departmentRef.code == Integer.MIN_VALUE) {
			throw new SystemException("Не заданий підрозділ");
		}
	}

	private void setDepartment(ENSzBrigade object) throws DatasourceConnectException, PersistenceException {
		ENDepartmentDAO depDao = new ENDepartmentDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		ENDepartment department = depDao.getObject(object.departmentRef.code);
		object.ceh_nazv = department.name;
		object.cehId = department.code;
	}

	  @Override
	public void remove(int code)
	   {
	    try
	     {
	      ENSzBrigadeDAO objectDAO = new ENSzBrigadeDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      ENElementDAO elementDao = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	      ENSzBrigade object = objectDAO.getObject(code);
	      objectDAO.remove(code);
	      elementDao.remove(object.element.code);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENSzBrigade%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }


	  /*ENSzBrigade. Изменить*/
	  @Override
	public void save(ENSzBrigade object)
	   {
	    try {
	    	checkDepartment(object);
	      ENSzBrigadeDAO objectDAO = new ENSzBrigadeDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      ENElementDAO elDao = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      DepartmentLogic dLogic = new DepartmentLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
	      ENElement element = elDao.getObject(object.element.code);
	      element.renRef.code = dLogic.getEPRen2Department(object.departmentRef.code);
	      
	      if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  element.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
	      
	      elDao.save(element);
	      setDepartment(object);

	      objectDAO.save(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENSzBrigade%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }
  public ENSzBrigadeControllerEJB() {}


} // end of EJB Controller for ENSzBrigade