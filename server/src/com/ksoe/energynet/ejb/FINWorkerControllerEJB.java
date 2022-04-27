
//---------------------------------------------------------
// Application: Energy
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for FINWorker;
  *
  */



import java.sql.Connection;
import java.sql.SQLException;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.ejb.generated.FINWorkerControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.AuthLogic.FinConnectionData;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.logic.mDaxLogic;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class FINWorkerControllerEJB extends FINWorkerControllerEJBGen
 {

    /* FINWorker. Получить список для просмотра по фильтру */
    public FINWorkerShortList getWorkerList(FINWorkerFilter filterObject,
            int fromPosition, int quantity) {

        return getWorkerList(filterObject, fromPosition, quantity, false);
    }

    public FINWorkerShortList getWorkerList(FINWorkerFilter filterObject,
            int fromPosition, int quantity, java.util.Date dateGet) {

        return getWorkerList(filterObject, fromPosition, quantity, dateGet, false);
    }

	/* FINWorker. Получить список для просмотра по фильтру */
	public FINWorkerShortList getWorkerList(FINWorkerFilter filterObject,
			int fromPosition, int quantity, boolean isShowCEO) {

		String strDatasourceConnectException = "Нет связи!";
		Connection netConn = null;
		Connection finConn = null;

		try {
			/////
        	netConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	    	AuthLogic netAuth = new AuthLogic(netConn, getUserProfile());
	    	FinConnectionData finConnectionData = netAuth.getFinConnectionData();
	    	strDatasourceConnectException = finConnectionData.datasourceConnectExceptionString;

			try {
				if (netConn != null && !netConn.isClosed()) {
					netConn.close();
					netConn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

	    	finConn = getConnection(finConnectionData.connectionString);
			/////

	    	FINWorkerDAO objectDAO = new FINWorkerDAO(getUserProfile(), finConn);
	    	return objectDAO.getFINWorkerList(filterObject, fromPosition, quantity, isShowCEO);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(strDatasourceConnectException, e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			try {
                if (finConn != null && ! finConn.isClosed()) {
                	finConn.close();
                	finConn = null;
                }
            } catch (SQLException e) {
            }
		}
	}


	public FINWorkerShortList getWorkerList(FINWorkerFilter filterObject,
			int fromPosition, int quantity, java.util.Date dateGet,
			boolean isShowCEO) {

		String strDatasourceConnectException = "Нет связи!";
		Connection netConn = null;
		Connection finConn = null;

		try {
			/////
			netConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	    	AuthLogic netAuth = new AuthLogic(netConn, getUserProfile());
	    	FinConnectionData finConnectionData = netAuth.getFinConnectionData();
	    	strDatasourceConnectException = finConnectionData.datasourceConnectExceptionString;

			try {
				if (netConn != null && !netConn.isClosed()) {
					netConn.close();
					netConn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

	    	finConn = getConnection(finConnectionData.connectionString);
			/////

	    	FINWorkerDAO objectDAO = new FINWorkerDAO(getUserProfile(), finConn);

			if (dateGet == null) {
				return objectDAO.getFINWorkerList(filterObject, fromPosition, quantity, isShowCEO);
			} else {
				return objectDAO.getFINWorkerList(filterObject, fromPosition, quantity, dateGet, isShowCEO);
			}

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(strDatasourceConnectException, e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			try {
                if (finConn != null && ! finConn.isClosed()) {
                	finConn.close();
                	finConn = null;
                }
            } catch (SQLException e) {
            }
		}
	}




    public FINWorkerShortList getFINWorkerListWithWorkLoad(FINWorkerFilter filterObject, int fromPosition, int quantity, java.util.Date dateGet, boolean isShowCEO)
    {
    	String strDatasourceConnectException = "Нет связи!";
        try
        {
			/////
	    	AuthLogic netAuth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	    	FinConnectionData finConnectionData = netAuth.getFinConnectionData();
	    	strDatasourceConnectException = finConnectionData.datasourceConnectExceptionString;
			/////

        	//FINLogic finLogic = new FINLogic(getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
	    	FINLogic finLogic = new FINLogic(
	    			getConnection(finConnectionData.connectionString), getUserProfile());

        	if (dateGet == null)
        	{
    	 		throw new EnergyproSystemException("\n\nNET-4350 Не вказано дату для вибору планів!");
	    	}

            return finLogic.getFINWorkerListWithWorkLoad(filterObject, fromPosition, quantity, dateGet, isShowCEO);
        }
        catch (DatasourceConnectException e)
        {
        	//throw new EnergyproSystemException("Нет связи с ФинКоллекцией!", e);
        	throw new EnergyproSystemException(strDatasourceConnectException, e);
        }
        finally
        {
        	closeConnection();
        }
    }

    /* FINWorker. Список для выбора ответственных лиц за договорами на ТУ */
    public FINWorkerShortList getFINWorkerByTechCondResponsibleList(
            FINWorkerFilter filterObject, int fromPosition, int quantity)
    {
    	String strDatasourceConnectException = "Нет связи!";
        try {
			/////
	    	AuthLogic netAuth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	    	FinConnectionData finConnectionData = netAuth.getFinConnectionData();
	    	strDatasourceConnectException = finConnectionData.datasourceConnectExceptionString;
			/////

            //FINWorkerDAO objectDAO = new FINWorkerDAO(
            //        getUserProfile(), getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));
            FINWorkerDAO objectDAO = new FINWorkerDAO(
            		getUserProfile(), getConnection(finConnectionData.connectionString));

            return objectDAO.getFINWorkerList(filterObject, fromPosition, quantity, false);

        } catch (DatasourceConnectException e) {
            //throw new EnergyproSystemException(
            //        "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
            //        e);
        	throw new EnergyproSystemException(strDatasourceConnectException, e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    public FINWorkerShortList getFINWorkerByTechCondResponsibleList(
            FINWorkerFilter filterObject, int fromPosition, int quantity, java.util.Date dateGet)
    {
    	String strDatasourceConnectException = "Нет связи!";
        try {
			/////
	    	AuthLogic netAuth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	    	FinConnectionData finConnectionData = netAuth.getFinConnectionData();
	    	strDatasourceConnectException = finConnectionData.datasourceConnectExceptionString;
			/////

	    	//FINWorkerDAO objectDAO = new FINWorkerDAO(
            //        getUserProfile(), getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));
            FINWorkerDAO objectDAO = new FINWorkerDAO(
            		getUserProfile(), getConnection(finConnectionData.connectionString));

	    	// Если работаем на Аксапте, то используем обычный лист (этот хитрый getFINWorkerByTechCondResponsibleList
            // вообще ничем особо не отличается от обычного getFINWorkerList)
	    	if (netAuth.checkUsesMDAXData())
	    	{
	            if (dateGet == null) {
	                return objectDAO.getFINWorkerList(filterObject, fromPosition, quantity, false);
	            } else {
	                return objectDAO.getFINWorkerList(filterObject, fromPosition, quantity, dateGet, false);
	            }
	    	}
	    	else
	    	{
	            if (dateGet == null) {
	                return objectDAO.getFINWorkerByTechCondResponsibleList(filterObject, fromPosition, quantity);
	            } else {
	                return objectDAO.getFINWorkerByTechCondResponsibleList(filterObject, fromPosition, quantity, dateGet);
	            }
	    	}

        } catch (DatasourceConnectException e) {
            //throw new EnergyproSystemException(
            //        "Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",
            //        e);
        	throw new EnergyproSystemException(strDatasourceConnectException, e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /*EFINWorker. Получить список для просмотра по фильтру для отчета с выборко всех */
    public FINWorkerShortList getWorkerListForReport(FINWorkerFilter filterObject, int fromPosition, int quantity, boolean isShowCEO)
    {
    	String strDatasourceConnectException = "Нет связи!";
        try
        {
			/////
	    	AuthLogic netAuth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	    	FinConnectionData finConnectionData = netAuth.getFinConnectionData();
	    	strDatasourceConnectException = finConnectionData.datasourceConnectExceptionString;
			/////

	    	//FINWorkerDAO objectDAO = new FINWorkerDAO(getUserProfile(),getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));
	    	FINWorkerDAO objectDAO = new FINWorkerDAO(
	    			getUserProfile(), getConnection(finConnectionData.connectionString));

	    	// Если работаем на Аксапте, то используем обычный лист, т.к. аналога getFINWorkerListForReport (где выбираются все работники
	    	// без ограничения по датам) там нет (он особо и не нужен - только для случая, когда нужно сформировать отчет по уже уволенным)
	    	if (netAuth.checkUsesMDAXData())
	    	{
	    		return objectDAO.getFINWorkerList(filterObject, fromPosition, quantity, null, isShowCEO);
	    	}
	    	else
	    	{
	    		return objectDAO.getFINWorkerListForReport(filterObject, fromPosition, quantity, null, isShowCEO);
	    	}
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException(strDatasourceConnectException, e);} //{throw new EnergyproSystemException("Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }
    
    /*EFINWorker. паспортные данные, фио раздельно , сокращенно по табельному */
    public FINWorkerShortList getFINWorkerListForENWarrant(FINWorkerFilter filterObject)
    {
    	String strDatasourceConnectException = "Нет связи!";
        try
        {
			/////
	    	AuthLogic netAuth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	    	FinConnectionData finConnectionData = netAuth.getFinConnectionData();
	    	strDatasourceConnectException = finConnectionData.datasourceConnectExceptionString;
			/////

	    	
	    	mDaxLogic mdLogic = new mDaxLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	    	
	    	return mdLogic.getFINWorkerListForENWarrant(filterObject);
	    	
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException(strDatasourceConnectException, e);} 
        finally                              {closeConnection();}
    }

  public FINWorkerControllerEJB() {}


} // end of EJB Controller for FINWorker