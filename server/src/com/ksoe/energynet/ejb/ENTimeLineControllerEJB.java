
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENTimeLine;
  *
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTimeLineDAO;
import com.ksoe.energynet.ejb.generated.ENTimeLineControllerEJBGen;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENTimeLine;
import com.ksoe.energynet.valueobject.brief.ENTimeLineShort;
import com.ksoe.energynet.valueobject.filter.ENDepartmentFilter;
import com.ksoe.energynet.valueobject.filter.ENTimeLineFilter;
import com.ksoe.energynet.valueobject.lists.ENDepartmentShortList;
import com.ksoe.energynet.valueobject.lists.ENTimeLineShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENTimeLineControllerEJB extends ENTimeLineControllerEJBGen
 {

  private static final int[] Array = null;

public ENTimeLineControllerEJB() {}

  public int addTimeLine(ENServicesObject servicesObject, ENTimeLineShort[] timeLineList) {
    try {

        // выносим все записи из тайм лайн по коду сервис обжекта
            ENTimeLineDAO tlDAO = new ENTimeLineDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTimeLineFilter tlFilter = new ENTimeLineFilter();
            tlFilter.servicesObjectRef.code = servicesObject.code;
            int tlArr[] = tlDAO.getFilteredCodeArray(tlFilter,0,-1);
            if (tlArr.length > 0 ) {
                for (int i = 0; i < tlArr.length; i++) {
                    tlDAO.remove(tlArr[i]);
                }
            }
            // проверим что бы для одного объекта резервировали время не более чем для одной бригады с подразделения
            // - пройдемся по листу сформируем массив с кодами подразделений
            ENDepartmentDAO depDAO = new ENDepartmentDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENDepartmentFilter depFilter;
            ENDepartmentShortList depList;
    // int mArr[] = null;
    // var someArray = [];
    int mArr[] = new int[timeLineList.length];

    for (int i = 0; i < timeLineList.length; i++) {
        // для вирт бригады определим к какому подразделению она относится и запихнем в массив
        depFilter = new  ENDepartmentFilter();
        depFilter.conditionSQL = " endepartment.code in ( select vb.endepartmentrefcode from tkvirtualbrigade vb where vb.code = " + timeLineList[i].virtualBrigadeRefCode  + " limit 1 ) " ;
        depList = depDAO.getScrollableFilteredList(depFilter , 0 ,-1);
        if ( depList.totalCount > 0 ) {
        mArr[i] = depList.get(0).code;
        }
    }
    if (method(mArr) > 1) {
        throw new EnergyproSystemException(
            "Заборонено резервувати час для декількох бригад одночасно з одного підрозділу. !!!");
    }
            // добавим
    for (int j = 0; j < timeLineList.length; j++) {

            ENTimeLine tlObj = new ENTimeLine();
            tlObj.dateGen = timeLineList[j].dateGen;
            tlObj.servicesObjectRef.code = servicesObject.code;
            tlObj.timeStart = timeLineList[j].timeStart;
            tlObj.timeFinal = timeLineList[j].timeFinal;
            tlObj.timeMoveToObject = timeLineList[j].timeMoveToObject;
            tlObj.timeMoveOfObject = timeLineList[j].timeMoveOfObject;
            tlObj.virtualBrigadeRef.code = timeLineList[j].virtualBrigadeRefCode;
            tlDAO.add(tlObj);
        }

    // запишем дату виконання час прибуття в договор

    if (timeLineList.length > Integer.MIN_VALUE ) {
        ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        ENServicesObject so = soDAO.getObject(servicesObject.code);

        so.executeWorkDate =     timeLineList[0].dateGen;
        so.timeStart = timeLineList[0].timeStart;
        so.timeFinal = timeLineList[0].timeFinal;
        // soDAO.save(so);
        soDAO.updateDateStartDateFinalWorkingByService(so);
    }



    } catch (DatasourceConnectException e) {
            e.printStackTrace();
            throw new EnergyproSystemException(e);
        } catch (PersistenceException e) {
        e.printStackTrace();
        throw new EnergyproSystemException(e);
    }
    return 1;
  }

  /*ENTimeLine. Удалить*/
  public void removeTimeLine(ENServicesObject servicesObject)
   {
    try
     {
        ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        ENTimeLineDAO tlDAO = new ENTimeLineDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

        // удаляем timeLine по сервис обжекту
        ENTimeLineFilter tlFilter = new ENTimeLineFilter();
        tlFilter.servicesObjectRef.code = servicesObject.code;
        int tlArr[] = tlDAO.getFilteredCodeArray(tlFilter,0,-1);
        if (tlArr.length > 0 ) {
            for (int i = 0; i < tlArr.length; i++) {
                tlDAO.remove(tlArr[i]);
            }
        }

        servicesObject.executeWorkDate = null;
        servicesObject.timeStart = null;
        servicesObject.timeFinal = null;
        // soDAO.save(servicesObject);
        soDAO.updateDateStartDateFinalWorkingByService(servicesObject);

     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTimeLine%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

  static int method(int[] arr) {
            if (arr == null) {
                return 0;
            }
            int maxNum = 0, num = 0, maxCount = 0, count = 0;
            arr: for (int i = 0; i < arr.length; i++) {
                num = arr[i];
                count = 1;
                for (int backnum = i - 1; backnum >= 0; backnum--) {
                    if (backnum == num) {
                        continue arr;
                    }
                }
                for (int fornum = i+1; fornum < arr.length; fornum++) {
                    if (arr[fornum] == num) {
                        count++;
                    }
                }

                if (count > maxCount) {
                    maxNum = num;
                    maxCount = count;
                }
            }

            return maxCount;
        }


  public ENTimeLineShortList getScrollableFilteredListForPlanning(ENTimeLineFilter filterObject, int fromPosition, int quantity)
  {
	  try
	  {
		  ENTimeLineDAO objectDAO = new ENTimeLineDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.getScrollableFilteredListForPlanning(filterObject, fromPosition, quantity);
	  }
      catch (DatasourceConnectException e) 
      {
    	  throw new EnergyproSystemException("Can't get list of {%com.ksoe.energynet.valueobject.ENTimeLine%} objects", e);
      }
	  catch (PersistenceException e)
	  {
		  throw new EnergyproSystemException(e.getMessage(), e);
	  }
	  finally 
	  {
		  closeConnection();
	  }
  }



} // end of EJB Controller for ENTimeLine