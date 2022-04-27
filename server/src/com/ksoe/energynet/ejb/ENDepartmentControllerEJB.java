
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Thu Oct 08 13:57:38 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENDepartment;
  *
  */



import java.sql.Connection;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.ejb.generated.ENDepartmentControllerEJBGen;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.logic.ManningTableLogic;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.filter.ENDepartmentFilter;
import com.ksoe.energynet.valueobject.lists.ENDepartmentShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENDepartmentControllerEJB extends ENDepartmentControllerEJBGen
 {

  public ENDepartmentControllerEJB() {}

  public ENDepartmentShortList getDepartmentListFromSprav(ENDepartmentFilter f, int fromPosition, int quantity)
  {
	    try
	     {
	    	ENDepartmentDAO objectDAO = new ENDepartmentDAO(getUserProfile(),
	    			getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));
	        return objectDAO.getDepartmentListFromSprav(f, "" , "" , fromPosition, quantity , null);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
  }

  public String getDepartmentCodesDown(int departmentCode){
	   {
		   String codes="";
		   try
		     {
		    	codes = new ManningTableLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).getDepartmentCodesDown(departmentCode);
		    	return codes;
		     }
		    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getDepartmentCodesDown",e);}
		    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
		    finally                              {closeConnection();}
		   }
  }

  public String getAXDepartmentCodesDown(int departmentCode){
	   {
		   String codes="";
		   try
		     {
		    	codes = new ManningTableLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).getAXDepartmentCodesDown(departmentCode);
		    	return codes;
		     }
		    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getAXDepartmentCodesDown",e);}
		    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
		    finally                              {closeConnection();}
		   }
 }

  public int getRenCodeFromEndepartmentByCode(int codeDepartment){

	 int sizCode = Integer.MIN_VALUE;
	  try {

	 ENDepartmentDAO depDAO = new ENDepartmentDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	  sizCode = depDAO.getRenCodeFromEndepartmentByCode(codeDepartment);
	 return sizCode;
		   }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getRenCodeFromEndepartmentByCode",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
}

  /**
   *
   * Возвращает категорию РЭС по коду
   *
   * @param departmentCode код подразделения
   * @return категория (1-4)
   */
public int getDepartmentCategory(int departmentCode) {
	try {
		ENDepartmentDAO depDAO = new ENDepartmentDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		ENDepartment dep = depDAO.getObject(departmentCode);
		if(dep == null) {
			throw new EnergyproSystemException(String.format("Не існує підрозділу з кодом = %d", departmentCode));
		}

		for(int temp : ENDepartment.REN_I_CATEGORY) {
			if(departmentCode == temp) {
				return 1;
			}
		}
		for(int temp : ENDepartment.REN_II_CATEGORY) {
			if(departmentCode == temp) {
				return 2;
			}
		}
		for(int temp : ENDepartment.REN_III_CATEGORY) {
			if(departmentCode == temp) {
				return 3;
			}
		}
		for(int temp : ENDepartment.REN_IV_CATEGORY) {
			if(departmentCode == temp) {
				return 4;
			}
		}
		throw new EnergyproSystemException(String.format("Не знайдено категорію для РЕМ %s", dep.name));

	} catch (DatasourceConnectException e) {
		throw new EnergyproSystemException(e);
	} catch (PersistenceException e) {
		throw new EnergyproSystemException(e);
	}
}

public String getDepartmentIdDownFromKadry(int departmentCode){
	   {
		   String codes="";
		   Connection finConn = null;
		   try
		     {
			   try {
					finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
				} catch (DatasourceConnectException e) {
					throw new EnergyproSystemException(
							"Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
							e);
				}

			   FINLogic finLogic = new FINLogic(finConn, getUserProfile());

			   codes = finLogic.getDepartmentIdDownFromKadry(departmentCode);


			   codes = codes.replace( '\'', ' ' );

		    	return codes;
		     }
		    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
		    finally                              {closeConnection();}
		   }
}

} // end of EJB Controller for ENDepartment