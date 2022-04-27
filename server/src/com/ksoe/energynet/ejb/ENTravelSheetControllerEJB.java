
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENTravelSheet;
  *
  */



import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENCheckpointDAO;
import com.ksoe.energynet.dataminer.ENCheckpointPassListDAO;
import com.ksoe.energynet.dataminer.ENCheckpointPassListItemDAO;
import com.ksoe.energynet.dataminer.ENFuelInventarizationDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTransportItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuel2FINMaterialsDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuelDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuelFillDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuelRemainsDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.ejb.generated.ENTravelSheetControllerEJBGen;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.AuthLogic.FinConnectionData;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.logic.AutoTiresLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.logic.GlobusLogic;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.energynet.logic.TransportOrderLogic;
import com.ksoe.energynet.logic.TransportRouteLogic;
import com.ksoe.energynet.logic.TravelSheetFuelLogic;
import com.ksoe.energynet.logic.TravelSheetLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENCheckpoint;
import com.ksoe.energynet.valueobject.ENCheckpointPassList;
import com.ksoe.energynet.valueobject.ENCheckpointPassListItem;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENTransportOrderStatus;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetFuel;
import com.ksoe.energynet.valueobject.ENTravelSheetFuelFill;
import com.ksoe.energynet.valueobject.ENTravelSheetFuelRemains;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItem2TransportItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItemKind;
import com.ksoe.energynet.valueobject.ENTravelSheetItemStatus;
import com.ksoe.energynet.valueobject.ENTravelSheetStatus;
import com.ksoe.energynet.valueobject.ENTravelSheetType;
import com.ksoe.energynet.valueobject.FINChargeType;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.brief.ENTransportItemShort;
import com.ksoe.energynet.valueobject.filter.ENCheckpointPassListItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuel2FINMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelFillFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelRemainsFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelInventarizationShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItem2TransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuel2FINMaterialsShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelRemainsShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItem2TransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.ejb.TKTransportRealHistoryController;
import com.ksoe.techcard.ejb.TKTransportRealHistoryControllerHome;
import com.ksoe.techcard.valueobject.TKFuelCalcType;
import com.ksoe.techcard.valueobject.TKTransportClassification;
import com.ksoe.techcard.valueobject.TKTransportReal;
import com.ksoe.techcard.valueobject.TKTransportRealHistory;


public class ENTravelSheetControllerEJB extends ENTravelSheetControllerEJBGen
 {

    public ENTravelSheet getNextSheet(ENTravelSheet object)
    {
        try
        {
            return new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile()).getNextSheet(object);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("error connect to DB ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }

    public BigDecimal getSpeedometerFinalByGlobus(ENTravelSheet obj)
    {

            if(obj.dateStart == null)
                throw new EnergyproSystemException("Не знайдено часу початку для розрахунку кілометражу з СКТ \"Глобус\"");
            if(obj.dateFinal == null)
                throw new EnergyproSystemException("Не знайдено часу закінчення для розрахунку кілометражу з СКТ \"Глобус\"");

            if(obj.timeStart == null)
                throw new EnergyproSystemException("Не знайдено часу початку для розрахунку кілометражу з СКТ \"Глобус\"");
            if(obj.timeFinal == null)
                throw new EnergyproSystemException("Не знайдено часу закінчення для розрахунку кілометражу з СКТ \"Глобус\"");

            Date startTime = this.getFullTime(obj.dateStart, obj.timeStart);
            Date finalTime = this.getFullTime(obj.dateFinal, obj.timeFinal);

            BigDecimal speedometerStart = ((obj.speedometerStart != null) ? obj.speedometerStart : new BigDecimal(0));

            int regId = Integer.MIN_VALUE;
			try {

				Context context = new InitialContext();
	            Object objRef = null;
	            objRef = context.lookup(TKTransportRealHistoryController.JNDI_NAME);
	            TKTransportRealHistoryControllerHome transportRealHistoryHome = (TKTransportRealHistoryControllerHome) PortableRemoteObject.narrow(objRef, TKTransportRealHistoryControllerHome.class);
	            TKTransportRealHistoryController transportRealHistoryController = transportRealHistoryHome.create();

	            TKTransportRealHistory historyObj = transportRealHistoryController.getHistory(obj.transportReal.code, finalTime);

	            regId = historyObj.reg_id;

			} catch (NamingException e1) {
				throw new EnergyproSystemException(e1.getMessage(),e1);
			} catch (RemoteException e2) {
				throw new EnergyproSystemException(e2.getMessage(),e2);
			} catch (CreateException e3) {
				throw new EnergyproSystemException(e3.getMessage(),e3);
			}

            if (regId == Integer.MIN_VALUE) {
            	throw new EnergyproSystemException("\n\n" +
            			"Для транспорту з держ. номером: " + ((obj.transportReal.gosNumber != null) ? obj.transportReal.gosNumber : "Не визначено") +
                        " не визначен реєстраційний номер з СКТ \"Глобус\"");
            }


            /**
            * NET-3012 Служебная. 11.09.2012. РЕМ Гокин. Зробити заокруглення не цілих
            * показників GPS фактично пройденного маршруту в більшу сторону
            * до цілого числа ---- Ok. Поставлено .setScale(2,BigDecimal.ROUND_HALF_UP)
            * будем теперь считать километраж до сотых.
            * */

			BigDecimal globusDistance = new BigDecimal(0);
			Connection globusConn = null;
			try {
				globusConn = getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE);
				GlobusLogic globusLogic = new GlobusLogic(globusConn, getUserProfile());
				globusDistance = globusLogic.getDistance(regId, startTime, finalTime);

				/*  DEBUG!!!!
				System.out.println("### get globusDistance regId = " + regId);
				System.out.println("### get globusDistance startTime = " + startTime);
				System.out.println("### get globusDistance finalTime = " + finalTime);
				System.out.println("### globusDistance= " + globusDistance);
				*/

			} catch (DatasourceConnectException e) {
				throw new EnergyproSystemException("\n\n" +
						"Нет связи с СКТ \"Глобус\"!!!", e);
			} catch (PersistenceException e) {
				throw new EnergyproSystemException(e.getMessage(), e);
			} finally {
				try {
					if (globusConn != null && !globusConn.isClosed()) {
						globusConn.close();
						globusConn = null;
					}
				} catch (SQLException e) {
				}
			}

            return speedometerStart.add(globusDistance).setScale(2,BigDecimal.ROUND_HALF_UP);
    }

    private Date getFullTime(Date date, Date time) {
    	Calendar calendar = new Calendar.Builder().setInstant(Tools.clearTimeOfDate(date)).build();
    	Calendar calendarTime = new Calendar.Builder().setInstant(time).build();
    	calendar.set(Calendar.HOUR_OF_DAY, calendarTime.get(Calendar.HOUR_OF_DAY));
    	calendar.set(Calendar.MINUTE, calendarTime.get(Calendar.MINUTE));
    	return calendar.getTime();
    	
    }

    public BigDecimal getMachineHoursStopByGlobus(ENTravelSheet obj)
    {
        Connection enConn = null;
        Connection globusConn = null;

        try
        {
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            globusConn = getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE);

            if(obj.dateStart == null)
                throw new EnergyproSystemException("Не знайдено часу початку для розрахунку машиночасу з СКТ \"Глобус\"");
            if(obj.dateFinal == null)
                throw new EnergyproSystemException("Не знайдено часу закінчення для розрахунку машиночасу з СКТ \"Глобус\"");

            if(obj.timeStart == null)
                throw new EnergyproSystemException("Не знайдено часу початку для розрахунку машиночасу з СКТ \"Глобус\"");
            if(obj.timeFinal == null)
                throw new EnergyproSystemException("Не знайдено часу закінчення для розрахунку машиночасу з СКТ \"Глобус\"");

            Date startTime = this.getFullTime(obj.dateStart, obj.timeStart);
            Date finalTime = this.getFullTime(obj.dateFinal, obj.timeFinal);

            BigDecimal machineHoursStop;

            TravelSheetLogic tsLogic = new TravelSheetLogic(enConn, getUserProfile());
  		    TransportLogic transportLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		
            TKTransportRealHistory historyObj = transportLogic.getHistory(obj.transportReal.code, finalTime);

            if(historyObj.reg_id == Integer.MIN_VALUE)
                throw new EnergyproSystemException("Для транспорту з держ. номером: " + ((obj.transportReal.gosNumber != null) ? obj.transportReal.gosNumber : "Не визначено") +
                " не визначен реєстраційний номер з СКТ \"Глобус\"");


            machineHoursStop = new GlobusLogic(globusConn,getUserProfile()).getMachineHoursStop(historyObj.reg_id, startTime, finalTime);

            if (machineHoursStop == null) {machineHoursStop = new BigDecimal(0);}
            machineHoursStop = new GlobusLogic(globusConn,getUserProfile()).getMachineHoursStop(historyObj.reg_id, startTime, finalTime);

            //Плановые показатели машиночасов
            BigDecimal machineHoursByPlan = tsLogic.getMachineHours(obj.code, ENTravelSheetItemKind.PLAN, Integer.MIN_VALUE);

            if(machineHoursByPlan.setScale(2, BigDecimal.ROUND_HALF_UP).compareTo(machineHoursStop.setScale(2, BigDecimal.ROUND_HALF_UP)) == 1)
                return machineHoursStop;
            else
                return machineHoursByPlan;
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("error connect to DB ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally {
            try {
                if (globusConn != null && ! globusConn.isClosed()) {
                    globusConn.close();
                    globusConn = null;
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


    public BigDecimal getDistanceByGlobus(ENTravelSheet obj)
    {
        Connection enConn = null;
        Connection globusConn = null;

        try
        {
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            globusConn = getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE);

            if(obj.dateStart == null)
                throw new EnergyproSystemException("Не знайдено часу початку для розрахунку машиночасу з СКТ \"Глобус\"");
            if(obj.dateFinal == null)
                throw new EnergyproSystemException("Не знайдено часу закінчення для розрахунку машиночасу з СКТ \"Глобус\"");

            if(obj.timeStart == null)
                throw new EnergyproSystemException("Не знайдено часу початку для розрахунку машиночасу з СКТ \"Глобус\"");
            if(obj.timeFinal == null)
                throw new EnergyproSystemException("Не знайдено часу закінчення для розрахунку машиночасу з СКТ \"Глобус\"");

            Date startTime = this.getFullTime(obj.dateStart, obj.timeStart);
            Date finalTime = this.getFullTime(obj.dateFinal, obj.timeFinal);

            BigDecimal distance;

            TransportLogic transportLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
  			
            TKTransportRealHistory historyObj = transportLogic.getHistory(obj.transportReal.code, obj.dateFinal);

            if(historyObj.reg_id == Integer.MIN_VALUE)
                throw new EnergyproSystemException("Для транспорту з держ. номером: " + ((obj.transportReal.gosNumber != null) ? obj.transportReal.gosNumber : "Не визначено") +
                " не визначен реєстраційний номер з СКТ \"Глобус\"");


            distance = new GlobusLogic(globusConn,getUserProfile()).getDistance(historyObj.reg_id, startTime, finalTime);
            if (distance == null) {return new BigDecimal(0);}
            return distance;
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("error connect to DB ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        catch (Exception e) {throw new EnergyproSystemException(e);}
        finally {
                try {
                    if (globusConn != null && ! globusConn.isClosed()) {
                        globusConn.close();
                        globusConn = null;
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


    public ENTravelSheet getPrevSheet(ENTravelSheet object)
    {
        try
        {
            return new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile()).getPrevSheet(object);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("error connect to DB ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }

    public ENTravelSheet getLastSheet(ENTravelSheet object)
    {
        try
        {
            return new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile()).getLastSheet(object);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("error connect to DB ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }

    public void unCloseTravelSheet(int travelSheetCode) {
        try {
            ENTravelSheetDAO travelSheetDAO = new ENTravelSheetDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENFuelInventarizationDAO fuelInventarizationDao = new ENFuelInventarizationDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            
            ENTravelSheet travelSheet = travelSheetDAO.getObject(travelSheetCode);

            if (travelSheet.statusRef.code != ENTravelSheetStatus.CLOSED){
                throw new EnergyproSystemException("Подорожній лист з таким статусом НЕ може бути відмінений ..");
            }
            
            ENFuelInventarizationShortList fuelInventarizationList = fuelInventarizationDao.getListByTravelSheet(travelSheet);
            if(fuelInventarizationList != null && fuelInventarizationList.totalCount > 0) {
            	throw new SystemException(String.format("\n\nПодорожній лист № %s пов'язаний з інвентарізацією палива № %s від %s!\n"
            			+ "Для відміни затвердження подорожнього листа необхідно відмінити резервування цієї інвентаризації палива!\n\n"
            			, travelSheet.numberGen, fuelInventarizationList.get(0).numberGen
            			, Tools.dateFormatDefault.format(fuelInventarizationList.get(0).dateGen)));
            }
            

            // проверить насчет акта ... если есть в акте - заборт ...
            ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(
            		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENTravelSheetItemFilter f = new ENTravelSheetItemFilter();
            f.travelSheetRef.code = travelSheet.code;
            f.kindRef.code = ENTravelSheetItemKind.FACT;
            f.conditionSQL = " entravelsheetitem.statusrefcode <> " + ENTravelSheetItemStatus.DELETED;
            ENTravelSheetItemShortList itemList = itemDAO.getScrollableFilteredList(f, 0, -1);
            ActLogic actLogic = new ActLogic(
            		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            for (int i=0; i < itemList.totalCount; i++)
            {

                ENAct act = actLogic.getActByPlanCode(itemList.get(i).planRefCode, false);
                if (act != null){
                    throw new EnergyproSystemException("Факт з цього подорожного листа включено до акту № "+ act.numberGen +"... треба видалити Факт з акту ...");
                }

            }
            
            Date d261114 = Tools.localDateToDate(LocalDate.of(2014, 11, 26));

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(travelSheet.dateStart);

            Date startDate = calendar.getTime();


            if (startDate.before(d261114))
            {
            	throw new SystemException("Нельзя отменять ПЛ до 26.11.2014 г.!");
            }


            travelSheet.statusRef.code = ENTravelSheetStatus.WRITINGOFF_GSM ;//ENTravelSheetStatus.CLOSED;

            travelSheet.dateEdit = new Date();
            travelSheet.userGen = getUserProfile().userName;

            travelSheetDAO.save(travelSheet);



            //new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile()).generateGSMEstimateByTravelSheet(travelSheetCode);

            // снять пробег с покрышек и аккумуляторов
            AutoTiresLogic tiresLogic = new AutoTiresLogic(
            		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            tiresLogic.undoDistance(travelSheet);
            tiresLogic.undoDistanceAc(travelSheet);

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("error connect to DB ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }

    public void closeWritingOff(int travelSheetCode){
        try
        {
            ENTravelSheetDAO travelSheetDAO = new ENTravelSheetDAO(
            		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENTravelSheet travelSheet = travelSheetDAO.getObject(travelSheetCode);

            if (travelSheet.statusRef.code != ENTravelSheetStatus.WRITINGOFF_GSM){
                throw new EnergyproSystemException("Подорожній лист з таким статусом НЕ може бути Затверджений ..");
            }

            // проверить есть ли привязка .. без нее не закрывать ...
            // + сходимость кол-во в строке Естимэйта и ФК !!!
            TravelSheetFuelLogic fl = new TravelSheetFuelLogic(
            		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
            boolean isNotClosed = fl.validateWritingOff4Close(travelSheetCode);
            if ( ! isNotClosed )
            {
                throw new EnergyproSystemException("Є строки без фактичного списання ПММ ... або не співпадає кількість списання з розрахунковою кількістю");
            }

            TravelSheetLogic logic = new TravelSheetLogic(
            		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

            // закрываем в хронологии !!! - для пересчетов стоимостей и цен на след. ПЛ ...
            // может и не быть ... дальше создадим и посчитаем ... !!!
            ENTravelSheet prevSheet = logic.getPrevSheet(travelSheet);
            if ((prevSheet != null) && (prevSheet.statusRef.code != ENTravelSheetStatus.CLOSED))
            {
                throw new EnergyproSystemException("Необхідно затвердити попередній ПЛ № " + prevSheet.numberGen);
            }

            travelSheet.statusRef.code = ENTravelSheetStatus.CLOSED ;//ENTravelSheetStatus.CLOSED;


            travelSheet.dateEdit = new Date();
            travelSheet.userGen = getUserProfile().userName;

            travelSheetDAO.save(travelSheet);

            /*Если путевой лист переводится в статус Затверджений, то все связанные
            * с ним заявки станут утвержденными (еще раз если не утвердились при переводе путевого в СПИСАННЯ ПММ)*/
            TransportOrderLogic toLogic = new TransportOrderLogic(
            		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
            toLogic.updateTransportOrderStatusByTravelSheetCode(travelSheet.code, ENTransportOrderStatus.CLOSED);


            // шото страшное написанное с Димоном .. избавиться ;)
            // ОСТАТОК на следующий  креатится ..
            // там же НЕТУ выдача в созданный остаток !!!
            logic.updateNextSheet(travelSheet);


            //пока не будем их трогать ...
            //fuelLogic.updateTransportRealRemainder(travelSheet.transportReal.code, travelSheet.dateStart);

            //new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile()).generateGSMEstimateByTravelSheet(travelSheetCode);

            // пробег для покрышек и аккумуляторов
            AutoTiresLogic tiresLogic = new AutoTiresLogic(
            		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
            tiresLogic.addDistance(travelSheet);
            tiresLogic.addDistanceAc(travelSheet);

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("error connect to DB ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}

    }

    public void unCloseWritingOff(int travelSheetCode){
        try
        {
            ENTravelSheetDAO travelSheetDAO = new ENTravelSheetDAO(
            		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENTravelSheet travelSheet = travelSheetDAO.getObject(travelSheetCode);

            if (travelSheet.statusRef.code != ENTravelSheetStatus.WRITINGOFF_GSM){
                throw new EnergyproSystemException("Подорожній лист з таким статусом НЕ може бути відмінений ..");
            }

            //TravelSheetLogic tLogic = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
            //tLogic.checkIsLast(travelSheet, true);

            // если есть следующий ПЛ - в САД ...
            /*
            TravelSheetLogic logic = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
            ENTravelSheet nextTr = logic.getNextSheet(travelSheet);
            if (nextTr != null){
                throw new EnergyproSystemException("Вже є наступний подорожній лист № " + nextTr.numberGen + " ... видаляйте його для відміни ...");
            }
            */

            travelSheet.statusRef.code = ENTravelSheetStatus.FACT ;//ENTravelSheetStatus.CLOSED;

           /*
            TravelSheetLogic tLogic = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENTravelSheet trNext = tLogic.getNextSheet(travelSheet);
            if (trNext != null)
                throw new EnergyproSystemException("Вже є наступний подорожній лист " + trNext.numberGen + "... видаляйте його");
            */

            travelSheet.dateEdit = new Date();
            travelSheet.userGen = getUserProfile().userName;

            travelSheetDAO.save(travelSheet);

            /*Если путевой лист отменяется из статуса СПИСАННЯ ПММ, то все связанные
            * с ним заявки станут в роботе*/
            TransportOrderLogic toLogic = new TransportOrderLogic(
            		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
            toLogic.updateTransportOrderStatusByTravelSheetCode(travelSheet.code, ENTransportOrderStatus.IN_WORK);

            // 29.11.2011 NET-340 При возврате в план меняем статус строк на 3-Рассчитано
            ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(
            		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENTravelSheetItemFilter f = new ENTravelSheetItemFilter();
            f.travelSheetRef.code = travelSheet.code;
            f.kindRef.code = ENTravelSheetItemKind.FACT;
            f.conditionSQL = ENTravelSheetItem.statusRef_QFielld + " <> " + ENTravelSheetItemStatus.DELETED;

            int[] items = itemDAO.getFilteredCodeArray(f, 0, -1);

            for (int i=0; i < items.length; i++){
                ENTravelSheetItem item = itemDAO.getObject(items[i]);
                item.statusRef.code = ENTravelSheetItemStatus.CALCULATED;
                itemDAO.save(item);
            }

            // вынести все топливо ...

            //new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile()).generateGSMEstimateByTravelSheet(travelSheetCode);

            //вынесем ПММ и все что с ним есть .. если нет резерва ...
            //TravelSheetFuelLogic fl = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
            //fl.removeGSMEstimateItems(travelSheetCode);


        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("error connect to DB ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }

    public void closeFact(int travelSheetCode){
        try
        {
            ENTravelSheetDAO travelSheetDAO = new ENTravelSheetDAO(
            		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENTravelSheet travelSheet = travelSheetDAO.getObject(travelSheetCode);

            if (travelSheet.statusRef.code != ENTravelSheetStatus.FACT){
                throw new EnergyproSystemException("Подорожній лист з таким статусом НЕ може бути Затверджений ..");
            }
            
            // проверим выдачи на резервирование в Бак. Если нет связки с финматериалсом или количество не совпадает, то нужно перезавести выдачу
            ENTravelSheetFuelDAO tsFuelDAO = new ENTravelSheetFuelDAO(
            		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTravelSheetFuelFilter tsFuelFilter = new ENTravelSheetFuelFilter();
            tsFuelFilter.travelSheetRef.code = travelSheet.code;
            ENTravelSheetFuelShortList tsFuelList = tsFuelDAO.getScrollableFilteredList(tsFuelFilter, 0, -1);

            if (tsFuelList.totalCount > 0) {
            	for (int z=0;z<tsFuelList.totalCount;z++)
            	{
                    ENTravelSheetFuel fuel = tsFuelDAO.getObject(tsFuelList.get(z).code);
            		ENTravelSheetFuel2FINMaterialsDAO fuel2finDAO = new ENTravelSheetFuel2FINMaterialsDAO(
            				getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	            	ENTravelSheetFuel2FINMaterialsFilter fuel2finFilter = new ENTravelSheetFuel2FINMaterialsFilter();
                    fuel2finFilter.travelSheetFuelRef.code = fuel.code;
	            	ENTravelSheetFuel2FINMaterialsShortList fuel2finList = fuel2finDAO.getScrollableFilteredList(fuel2finFilter, 0, -1);

	            	BigDecimal q = new BigDecimal(0.0);

	            	if (fuel2finList.totalCount > 0)
	            	{
	            	 for (int x=0;x<fuel2finList.totalCount;x++)
		            	 {
		            		 FINMaterialsDAO finDAO = new FINMaterialsDAO(
		            				 getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		            		 FINMaterials fin = finDAO.getObject(fuel2finList.get(x).finMaterialsRefCode);
		            		 q = q.add(fin.quantity);
		            	 }
	            	 }

	            	if (fuel2finList.totalCount == 0 || q.compareTo(fuel.countGen) != 0)
		            	{
		            		// перезаведем выдачу
		          	      TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(
		          	    		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		          	      fuelLogic.removeRQFKOrderForTravelSheetFuel(fuel);
		          	      tsFuelDAO.remove(fuel.code);
		          	      fuel.code = Integer.MIN_VALUE;
		          	      tsFuelDAO.add(fuel);
		      	          fuelLogic.createRQFKOrderForTravelSheetFuel(fuel);
		      	         }
            	}
            }

            // проверим показания спидометра ...
            if (
                    (travelSheet.speedometerStart == null)
                    ||(travelSheet.speedometerFinal == null)
            )
            {
                throw new EnergyproSystemException("Не введені показники спидометра для ЗАТВЕРДЖЕННЯ подорожнього листу ...");
            }

            // проверим показания счетчика GSM ...
            if (
                    (travelSheet.transportReal.fuelCalcTypeRef.code == TKFuelCalcType.BY_COUNTER)
                    &&(
                            (travelSheet.fuelCounterStart == null)
                            ||(travelSheet.fuelCounterFinal == null)
                    )
            )
            {
                throw new EnergyproSystemException("Не введені показники лічільника палива для ЗАТВЕРДЖЕННЯ подорожнього листу ...");
            }

            ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENTravelSheetItemFilter f = new ENTravelSheetItemFilter();
            f.travelSheetRef.code = travelSheet.code;
            f.kindRef.code = ENTravelSheetItemKind.FACT;
            f.conditionSQL = ENTravelSheetItem.statusRef_QFielld + " <> " + ENTravelSheetItemStatus.DELETED;
            int[] items = itemDAO.getFilteredCodeArray(f, 0, -1);

            if (items.length == 0){
                throw new EnergyproSystemException("Немає строк маршруту ...");
            }

            // !!!!
            // проверить показания спидометра ..,
            // расстояния ...
            // показания из предыдущего тр. листа ...
            // время нач,оконч
            // и т.д.

            // 24.11.2011 NET-339 Проверяем соответствие фактических и плановых маршрутов:
            // пока решено закомментировать. До выяснения необходимости
            /*ENTravelSheetItemFilter f0 = new ENTravelSheetItemFilter();
            for (int i=0; i < items.length; i++){
                ENTravelSheetItem item = itemDAO.getObject(items[i]);
                f0.parentItemRef.code = item.code;
                f0.kindRef.code = ENTravelSheetItemKind.PLAN;

                int[] items0 = itemDAO.getFilteredCodeArray(f0, 0, -1);
                switch (items0.length){
                case 1: break;
                case 0: throw new EnergyproSystemException("Немає планового маршруту для строки " + item.code + " ПЛ № " + travelSheet.code);
                default: throw new EnergyproSystemException("Більше одного планового маршруту. Як це сталося? Номер строки: " + item.code + " ПЛ № " + travelSheet.code);
                }

                ENTravelSheetItem item0 = itemDAO.getObject(items0[0]);
                if( !item.sumDistances.equals(item0.sumDistances) ){
                    throw new EnergyproSystemException("Пробіг не співпадє з планом для строки " + item.code + " ПЛ № " + travelSheet.code);
                }
                if( !item.sumMachineHours.equals(item0.sumMachineHours) ){
                    throw new EnergyproSystemException("Машиногодини не співпадають з планом для строки " + item.code + " ПЛ № " + travelSheet.code);
                }
                if( !item.travelFrom.equals(item0.travelFrom) ){
                    throw new EnergyproSystemException("'Маршрут звідки' не співпадає з планом для строки " + item.code + " ПЛ № " + travelSheet.code);
                }
                if( !item.travelTo.equals(item0.travelTo) ){
                    throw new EnergyproSystemException("'Маршрут куди' не співпадає з планом для строки " + item.code + " ПЛ № " + travelSheet.code);
                }
            }*/
            // 29.11.2011 NET-340 Проверяем, что строки-факт были рассчитаны
            for (int i=0; i < items.length; i++){
                ENTravelSheetItem item = itemDAO.getObject(items[i]);
                if ((item.kindRef.code == ENTravelSheetItemKind.FACT) && (item.statusRef.code != ENTravelSheetItemStatus.CALCULATED)){
                    throw new EnergyproSystemException("Фактический маршрут " + item.code + " ПЛ № " + travelSheet.code + " не рассчитан. Откройте его на редактирование и сохраните.");
                }
            }

            for (int i=0; i < items.length; i++){
                ENTravelSheetItem item = itemDAO.getObject(items[i]);
                item.statusRef.code = ENTravelSheetItemStatus.CLOSED;
                itemDAO.save(item);


                /*  если перевезення, акт(списание), план(факт)
                *  и отличается машина
                *  меняем машину на факте
                *
                *  22.05.2014 // теперь меняем объект не только на факте, а еще и на плане (В.С.)
                */

                ENPlanWork plan = new PlanWorkLogic(
                		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).getPlanByCodeNOSEGR(item.planRef.code);

                // найдем парент итема ПЛ и соответственно его план
                // и проапдейтим и на нем объект, что бы планы совпадали с фактом,
                // а то, как оказалось, по прошествии 3 лет это ломает концепцию ;)
	                if (item.parentItemRef != null && item.parentItemRef.code != Integer.MIN_VALUE) {
	                
	                ENTravelSheetItem itemP = itemDAO.getObject(item.parentItemRef.code);
	                ENPlanWork planP = new PlanWorkLogic(
	                		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).getPlanByCodeNOSEGR(itemP.planRef.code);
	
	                if ((plan.typeRef.code == ENPlanWorkType.TRUCKING)
	                        && (plan.kind.code == ENPlanWorkKind.FACT)
	                        && (plan.stateRef.code == ENPlanWorkState.TRUCKING)
	                )
	                {
	                    if (travelSheet.transportReal.enelement.code != plan.elementRef.code || travelSheet.transportReal.enelement.code != planP.elementRef.code) {
	                        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(
	                        		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	                        plan.elementRef.code = travelSheet.transportReal.enelement.code;
	                        planDAO.save(plan);
	
	                        planP.elementRef.code = travelSheet.transportReal.enelement.code;
	                        planDAO.save(planP);
	                    }
	                }
	            }
            }

            travelSheet.statusRef.code = ENTravelSheetStatus.WRITINGOFF_GSM ;//ENTravelSheetStatus.CLOSED;

            travelSheet.dateEdit = new Date();
            travelSheet.userGen = getUserProfile().userName;

            TravelSheetLogic logic = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            //округлим остаток на конец
            logic.roundingFuelToTenth(travelSheet.code);

            travelSheetDAO.save(travelSheet);

            /*Если путевой лист переводится в статус СПИСАННЯ ПММ, то все связанные
            * с ним заявки станут утвержденными*/
            TransportOrderLogic toLogic = new TransportOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            toLogic.updateTransportOrderStatusByTravelSheetCode(travelSheet.code, ENTransportOrderStatus.CLOSED);


            //int materialCode = travelSheet.transportReal.fuelType.materialRef.code;

            // вытяним дату Плана ... посчитаем коэфф. для зимнего расхода ...
            // тянем дату гдето раньше !!! тормоза ...
            //ENPlanWork plan = new PlanWorkLogic(connection, userProfile).getPlanByCode(trItem.planRef.code);
            // (plan.dateStart);
            // можно дергать ДАТУ с планов внутри !! ;)

            TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            // тиам типа уже есть ...
            // разве сто перегенерить ... это долго
            //fuelLogic.generateGSMEstimateByTravelSheet(travelSheetCode, travelSheet.dateStart);

            // + пересчитать остатки и показания СЧЕТЧИКОВ для следующего листа ...
            //fuelLogic.updateNextRemainder(travelSheetCode);
            //updateNextSheet()

            /*NET-2962 Проверки для машин с установленным регистратором из СКТ "Глобус"*/

            {
            TransportLogic transportLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
            TKTransportRealHistory trhObj = transportLogic.getHistory(travelSheet.transportReal.code, travelSheet.dateFinal);
            boolean isGPS = false;
            if(trhObj !=null)
                if(trhObj.reg_id != Integer.MIN_VALUE)
                    isGPS = true;
            if(isGPS == true)
            {
                    BigDecimal machineHoursStopByGlobus = this.getMachineHoursStopByGlobus(travelSheet);
                    machineHoursStopByGlobus = (machineHoursStopByGlobus == null) ? new BigDecimal(0) : machineHoursStopByGlobus;
                    BigDecimal machineHoursTravelItems = logic.getMachineHours(travelSheet.code, ENTravelSheetItemKind.FACT, ENTravelSheetItemStatus.CALCULATED);
                    BigDecimal machineHoursTravelItemsPlan = logic.getMachineHours(travelSheet.code, ENTravelSheetItemKind.PLAN, Integer.MIN_VALUE);

                    if(machineHoursTravelItemsPlan.compareTo(machineHoursStopByGlobus) >= 0)
                    {
                        if(machineHoursStopByGlobus.compareTo(machineHoursTravelItems) == -1)
                            throw new EnergyproSystemException("Сума машиногодин на строках подорожнього ("+machineHoursTravelItems+") перевищує сумарні машиногодини пораховані за GPS (" + machineHoursStopByGlobus + ")");
                    }
                    else
                    {
                        if(machineHoursTravelItemsPlan.compareTo(machineHoursTravelItems) == -1)
                            throw new EnergyproSystemException("Сума машиногодин на строках ("+machineHoursTravelItems+") перевищує сумарні машиногодини пораховані за GPS (" + machineHoursTravelItemsPlan + ")");
                    }
            }}

            ENTravelSheet nextTravelSheet = logic.updateNextSheet(travelSheet);

            //ENTravelSheet nextTravelSheet = logic.getNextSheet(travelSheet);

            // для факта перебрасывать остатки ...
         fuelLogic.updateNextRemainder(travelSheet, nextTravelSheet);

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("error connect to DB ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}

    }

    public void unCloseFact(int travelSheetCode) {}



    public void closePlan(int travelSheetCode) {
        try {
            ENTravelSheetDAO travelSheetDAO = new ENTravelSheetDAO(
            		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTravelSheet travelSheet = travelSheetDAO.getObject(travelSheetCode);

            TravelSheetLogic logic = new TravelSheetLogic(
            		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            if ((travelSheet.statusRef.code != ENTravelSheetStatus.PLAN) && (travelSheet.statusRef.code != ENTravelSheetStatus.GOOD))
            {
                throw new EnergyproSystemException("Подорожній лист з таким статусом НЕ може бути складений у ФАКТ...");
            }


            // проверим выдачи на резервирование в Бак. Если нет связки с финматериалсом или количество не совпадает, то нужно перезавести выдачу
            ENTravelSheetFuelDAO tsFuelDAO = new ENTravelSheetFuelDAO(
            		getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTravelSheetFuelFilter tsFuelFilter = new ENTravelSheetFuelFilter();
            tsFuelFilter.travelSheetRef.code = travelSheet.code;
            ENTravelSheetFuelShortList tsFuelList = tsFuelDAO.getScrollableFilteredList(tsFuelFilter, 0, -1);

            if (tsFuelList.totalCount > 0) {
            	for (int z=0;z<tsFuelList.totalCount;z++)
            	{
                    ENTravelSheetFuel fuel = tsFuelDAO.getObject(tsFuelList.get(z).code);
            		ENTravelSheetFuel2FINMaterialsDAO fuel2finDAO = new ENTravelSheetFuel2FINMaterialsDAO(
            				getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	            	ENTravelSheetFuel2FINMaterialsFilter fuel2finFilter = new ENTravelSheetFuel2FINMaterialsFilter();
                    fuel2finFilter.travelSheetFuelRef.code = fuel.code;
	            	ENTravelSheetFuel2FINMaterialsShortList fuel2finList = fuel2finDAO.getScrollableFilteredList(fuel2finFilter, 0, -1);

	            	BigDecimal q = new BigDecimal(0.0);

	            	if (fuel2finList.totalCount > 0)
	            	{
	            	 for (int x=0;x<fuel2finList.totalCount;x++)
		            	 {
		            		 FINMaterialsDAO finDAO = new FINMaterialsDAO(
		            				 getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		            		 FINMaterials fin = finDAO.getObject(fuel2finList.get(x).finMaterialsRefCode);
		            		 q = q.add(fin.quantity);
		            	 }
	            	 }

	            	if (fuel2finList.totalCount == 0 || q.compareTo(fuel.countGen) != 0)
		            	{
		            		// перезаведем выдачу
		          	      TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(
		          	    		  getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		          	      fuelLogic.removeRQFKOrderForTravelSheetFuel(fuel);
		          	      tsFuelDAO.remove(fuel.code);
		          	      fuel.code = Integer.MIN_VALUE;
		          	      tsFuelDAO.add(fuel);
		      	          fuelLogic.createRQFKOrderForTravelSheetFuel(fuel);
                        }
            	}
            }

            ENTravelSheet prevSheet = logic.getPrevSheet(travelSheet);
            if (prevSheet != null){
                if (
                    (prevSheet.statusRef.code != ENTravelSheetStatus.WRITINGOFF_GSM)
                    && (prevSheet.statusRef.code != ENTravelSheetStatus.CLOSED)
                ){
                    throw new EnergyproSystemException("Закрийте спочатку попередній подорожній лист з № " + prevSheet.numberGen);
                }
            }

            PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENTransportItemDAO transportDAO = new ENTransportItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            FINWorkerDAO workerDAO = new FINWorkerDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTravelSheetItem2TransportItemDAO t2tDAO = new ENTravelSheetItem2TransportItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTransportItem2TransportItemDAO ti2tiDAO = new ENTransportItem2TransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENPlanWorkDAO planDao = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            int workerCode = travelSheet.finWorker.code;

            ENTravelSheetItemFilter travelItemFilter = new ENTravelSheetItemFilter();
            travelItemFilter.travelSheetRef.code = travelSheetCode;
            travelItemFilter.conditionSQL = ENTravelSheetItem.statusRef_QFielld + " <> " + ENTravelSheetItemStatus.DELETED;
            int factPlanCode = Integer.MIN_VALUE;
            int[] items = itemDAO.getFilteredCodeArray(travelItemFilter, 0, -1);

            if(items.length == 0) throw new EnergyproSystemException("Немає строк для переводу подорожнього листа № " + travelSheet.numberGen + " у факт");

            Hashtable<Integer, Integer> hashPlan2Fact = new Hashtable<Integer, Integer>();

            for (int i=0; i < items.length; i++){
                ENTravelSheetItem item = itemDAO.getObject(items[i]);

                ENTravelSheetItem newItem = new ENTravelSheetItem();
                newItem.sumDistances = newItem.sumMachineHours = new BigDecimal(0);
                newItem.parentItemRef.code = item.code;
                newItem.travelSheetRef.code = item.travelSheetRef.code;
  
                ENPlanWork plan = planDao.getObject(item.planRef.code);

                if(plan.kind.code == ENPlanWorkKind.NPW && plan.status.code == ENPlanWorkStatus.GOOD) {
                	// SUPP-42195
                	//factPlanCode = planLogic.closePlan(item.planRef.code, true);
                	factPlanCode = planLogic.closePlan(item.planRef.code, 1, true, true);
                } else {
                    factPlanCode = planLogic.getFactCode4NPZ(item.planRef.code);
                }

                if (factPlanCode == Integer.MIN_VALUE){
                    throw new EnergyproSystemException("План не найден для НПЗ, код плана=" + item.planRef.code);
                }

            	hashPlan2Fact.put(item.planRef.code, factPlanCode);

                newItem.planRef.code = factPlanCode;
                newItem.speedometerStart = null; //item.speedometerStart;
                newItem.speedometerFinal = null; //item.speedometerFinal;

                newItem.fuelCounterStart = null; //item.fuelCounterStart;
                newItem.fuelCounterFinal = null; //item.fuelCounterFinal;


                newItem.timeFinal = null; // item.timeFinal;
                newItem.timeStart = null; // item.timeStart;

                newItem.statusRef.code = ENTravelSheetItemStatus.GOOD;
                newItem.kindRef.code = ENTravelSheetItemKind.FACT;
                newItem.commentGen = item.commentGen;
                newItem.travelFrom = item.travelFrom;
                newItem.travelTo = item.travelTo;
                itemDAO.add(newItem);


                ENTravelSheetItem2TransportItemFilter t2tFilter = new ENTravelSheetItem2TransportItemFilter();
                t2tFilter.travelSheetItemRef.code = item.code;
                int[] t2tArr = t2tDAO.getFilteredCodeArray(t2tFilter, 0, -1);
                for (int j=0; j < t2tArr.length; j++){
                    ENTravelSheetItem2TransportItem t2t = t2tDAO.getObject(t2tArr[j]);

                    ENTransportItem2TransportItemFilter ti2tiFilter = new ENTransportItem2TransportItemFilter();
                    ti2tiFilter.inRef.code = t2t.transportItemRef.code;
                    ENTransportItem2TransportItemShortList ti2tiList = ti2tiDAO.getScrollableFilteredList(ti2tiFilter, 0, -1);
                    if (ti2tiList.totalCount != 1){
                        throw new EnergyproSystemException("Помилка у кількості транспорту при переході з НПЗ до Факту .. ");
                    }

                    // ENTransportItem на факте могли уже притулить к ДРУГОМУ ПЛ ;)
                    // просто НЕ будем создавать итем из плана ...
                    ENTravelSheetItem2TransportItemFilter t2tFilter2 = new ENTravelSheetItem2TransportItemFilter();
                    t2tFilter2.transportItemRef.code = ti2tiList.get(0).outRefCode;
                    int[] t2tArr2 = t2tDAO.getFilteredCodeArray(t2tFilter2, 0, -1);

                    if (t2tArr2.length == 0){

                        // обнуленные на факте работы !!!
                        ENTransportItemShort trShort = transportDAO.getShortObject(ti2tiList.get(0).outRefCode);
                        if (trShort.planItemRefCountGen.doubleValue() != 0)
                        {
                            // обновим реальные авто и воркеров ..
                            ENTransportItem tr = transportDAO.getObject(trShort.code);
                            tr.transportReal.code = travelSheet.transportReal.code;
                            tr.trailerTransportReal.code = travelSheet.trailer1.code;

                            // перекинем из НОРМАТИВНОГО в СКОРИГОВАНый ;)
                            //... кроме тех что небыло в Нормативах + если больше чем в нормативах ...
                            if (tr.countWorkGen.doubleValue() != 0)
                            {
                                if (tr.countWorkGen.doubleValue() < tr.countWorkFact.doubleValue()){
                                    tr.commentGen = (tr.commentGen == null ? " " : tr.commentGen) + " скор." + tr.countWorkFact;
                                    tr.countWorkFact = tr.countWorkGen;
                                }
                            }

                            // а куда деваеться воркер что был введен руками/скопирован с плана?? ВЫНЕСЛИ его ;) .. вынести наверно ...
                            int fWorker = Integer.MIN_VALUE;
                            if (tr.finWorker != null){
                                fWorker = tr.finWorker.code;
                            }

                            FINWorker w = travelSheet.finWorker;
                            tr.finWorker.code = workerDAO.add(w);
                            tr.numberList = travelSheet.numberGen;
                            transportDAO.save(tr);

                            if (fWorker != Integer.MIN_VALUE){
                                workerDAO.remove(fWorker);
                            }

                            // пересохраним свзяку н.тр-та и строки маршрута ..
                            t2t.transportItemRef.code = ti2tiList.get(0).outRefCode;
                            t2t.travelSheetItemRef.code = newItem.code;
                            t2tDAO.add(t2t);

                            // удалим расчет топлива на факте ...
                            tLogic.removeGSMByTransportItemCode(tr.code);

                        }
                        else{
                            // транспорт на обнуленных работах ОЧИСТИМ ...
                            logic.clearENTransportItem(trShort.code);
                        }

                    }
                }

                item.statusRef.code = ENTravelSheetItemStatus.CLOSED;
                itemDAO.save(item);


                // если ниче нету - нафиг строку листа ;)
                ENTravelSheetItem2TransportItemFilter f = new ENTravelSheetItem2TransportItemFilter();
                f.travelSheetItemRef.code = newItem.code;
                int[] arr = t2tDAO.getFilteredCodeArray(f, 0, -1);
                if (arr.length == 0){
                    itemDAO.remove(newItem.code);
                }
                else
                {
                    logic.recalcItems(newItem.code);
                }
            }

            // Сумісна доставка
            Enumeration<Integer> keysPlanCodes = hashPlan2Fact.keys();
            while(keysPlanCodes.hasMoreElements()) {
            	int planCode = keysPlanCodes.nextElement();
            	int factCode = hashPlan2Fact.get(planCode);
            	tLogic.makeDeliveryTimeForFact(planCode, factCode, travelSheet.transportReal.code );
            }

            // бляцкое копирование обьектов ;)))
            travelSheet.finWorker.code = workerCode;

            travelSheet.statusRef.code = ENTravelSheetStatus.FACT;

            travelSheet.dateEdit = new Date();
            travelSheet.userGen = getUserProfile().userName;

            travelSheetDAO.save(travelSheet);

            // накинем предварительный порядок
            tLogic.setOrder(travelSheetCode);
            
            //// закроем фактические строки по совместной доставке c начальными показателями спидометра Путевого Листа,
            //// при условии, если они уже не были расчитаны
            try {
            	logic.closeTravelItemsFactCreatedByDeliveryOrder(travelSheetCode);
            } catch (RemoteException e) {
            	throw new EnergyproSystemException(e.getMessage(),e);
            } catch (NamingException e) {
            	throw new EnergyproSystemException(e.getMessage(),e);
            } catch (CreateException e) {
            	throw new EnergyproSystemException(e.getMessage(),e);
            }
        } catch (DatasourceConnectException e) {
        	throw new EnergyproSystemException("error connect to DB ...",e);
        } catch (PersistenceException e)       {
        	throw new EnergyproSystemException(e.getMessage(),e);
        } finally {
        	closeConnection();
        }
    }


    public void unClosePlan(int travelSheetCode)
    {
        try
        {
            ENTravelSheetDAO travelSheetDAO = new ENTravelSheetDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENTravelSheet travelSheet = travelSheetDAO.getObject(travelSheetCode);

            if (travelSheet.statusRef.code != ENTravelSheetStatus.FACT){
                throw new EnergyproSystemException("Подорожній лист з таким статусом НЕ може бути повернений у ПЛАН...");
            }

            ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            TravelSheetLogic logic = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            //уже могут быть еще ... черновые или плановые ...
            //logic.checkIsLast(travelSheet, true);


            // удалим факты ...
            ENTravelSheetItemFilter f = new ENTravelSheetItemFilter();
            f.travelSheetRef.code = travelSheet.code;
            f.kindRef.code = ENTravelSheetItemKind.FACT;
            int[] items = itemDAO.getFilteredCodeArray(f, 0, -1);
            for (int i=0; i < items.length; i++){
                logic.removeItem(items[i]);
            }

            // ИЗМЕНИМ СТАТУСЫ У ПЛАНОВЫХ СТРОК
            f = new ENTravelSheetItemFilter();
            f.travelSheetRef.code = travelSheet.code;
            f.kindRef.code = ENTravelSheetItemKind.PLAN;
            f.conditionSQL = ENTravelSheetItem.statusRef_QFielld + " <> " + ENTravelSheetItemStatus.DELETED;
            items = itemDAO.getFilteredCodeArray(f, 0, -1);
            for (int i=0; i < items.length; i++){
                ENTravelSheetItem item = itemDAO.getObject(items[i]);
                item.statusRef.code = ENTravelSheetItemStatus.GOOD;
                itemDAO.save(item);
            }

            ///
            travelSheet.speedometerFinal = null;
            travelSheet.fuelCounterFinal = null;
            ///

            // если нет строк - в Черновой ... NET-318
            if (items.length == 0)
            {
                travelSheet.statusRef.code = ENTravelSheetStatus.GOOD;
            }
            else
            {
                travelSheet.statusRef.code = ENTravelSheetStatus.PLAN;
            }

            travelSheet.dateEdit = new Date();
            travelSheet.userGen = getUserProfile().userName;

            travelSheetDAO.save(travelSheet);
            // QQ
            ENTravelSheetFuelRemainsDAO remDAO = new ENTravelSheetFuelRemainsDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTravelSheetFuelRemainsFilter ff = new ENTravelSheetFuelRemainsFilter();
            ff.travelSheetRef.code = travelSheet.code;
            int[] remArr = remDAO.getFilteredCodeArray(ff, 0, -1);
            for (int i=0; i < remArr.length; i++){
                ENTravelSheetFuelRemains rem = remDAO.getObject(remArr[i]);
                rem.countGenOut = rem.priceGenOut = rem.sumGenOut =  new BigDecimal(0);
                rem.priceGenFinal = rem.sumGenFinal = new BigDecimal(0);
                rem.priceGenOut = rem.sumGenOut;
                rem.countGenFinal = rem.countGenStart.add(rem.countGenIn).setScale(2, BigDecimal.ROUND_HALF_UP);
                remDAO.save(rem);
            }

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("error connect to DB ...",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }


    // чисто КОДЫ транспортИтемов
    public void addItemsDetailed(int travelSheetCode, int[] transportItemCodes)
    {
        addItemsDetailed( travelSheetCode, transportItemCodes, false);
    }

    public void addItemsDetailedForTransportOrder(int travelSheetCode, int[] transportItemCodes)
    {
        addItemsDetailed(travelSheetCode, transportItemCodes, true);
    }

    public void addItemsDetailed(int travelSheetCode, int[] transportItemCodes, boolean forTransportOrder)
    {
        try
        {

            /*Проверка на транспортные заявки*/
            TransportOrderLogic toLogic = new TransportOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            toLogic.checkTravelSheet(transportItemCodes, travelSheetCode, forTransportOrder);

            if (transportItemCodes.length == 0){
                throw new EnergyproSystemException("Не обран транспорт у планах ...");
            }

            ENTravelSheetDAO travelSheetDAO = new ENTravelSheetDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENTravelSheet travelSheet = travelSheetDAO.getObject(travelSheetCode);

            if ((travelSheet.statusRef.code == ENTravelSheetStatus.WRITINGOFF_GSM) || (travelSheet.statusRef.code == ENTravelSheetStatus.CLOSED))
            {
                throw new EnergyproSystemException("Подорожній лист вже затверджений ...");
            }

            if (travelSheet.statusRef.code == ENTravelSheetStatus.GOOD){
                travelSheet.statusRef.code = ENTravelSheetStatus.PLAN;
                travelSheet.dateEdit = new Date();
                travelSheet.userGen = getUserProfile().userName;
                travelSheetDAO.save(travelSheet);
            }

            String trCodes = "";

            for (int i = 0; i < transportItemCodes.length; i++){
                //ENTravelSheetItemFilter itemFilter = new ENTravelSheetItemFilter();
                if (trCodes.length() == 0){
                    trCodes = "" + transportItemCodes[i];
                }
                else{
                    trCodes = trCodes + ", " + transportItemCodes[i];
                }
            }

            ENTransportItemFilter transportFilter = new ENTransportItemFilter();
            transportFilter.conditionSQL = "entransportitem.code in (" + trCodes + ")";
            transportFilter.orderBySQL = "entransportitem.planrefcode";

            ENTransportItemDAO transportDAO = new ENTransportItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTransportItemShortList trList = transportDAO.getScrollableFilteredList(transportFilter, 0, -1);

            ENTransportItemShort[] trShortArr = new ENTransportItemShort[trList.list.size()];
            for (int i=0; i < trList.list.size(); i++){
                trShortArr[i] = trList.get(i);
            }

            TravelSheetLogic logic = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            TransportLogic transpLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            logic.addItems(travelSheet, trShortArr , Integer.MIN_VALUE);
            TransportRouteLogic tRoutLogic = new TransportRouteLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENTransportItem objectTransportitem;
            for (int i=0; i < trList.list.size(); i++){

                objectTransportitem = transportDAO.getObject(trList.get(i).code);
                // расчитаем расходы !!! NET-1693
                boolean isRouteCalcul = tRoutLogic.isPresentRouteInPlan(objectTransportitem.code);
                // если есть на distance маршруты И классификация машин
                // по связке  (Грузовой автомобиль или автокарн) тогда считаем с маршрутов
                if (isRouteCalcul &&
                        (  objectTransportitem.transport.transportClassification.code == TKTransportClassification.AVTO_KRAN
                        ||
                        objectTransportitem.transport.transportClassification.code == TKTransportClassification.AVTO_CARGO ) ){
                tRoutLogic.generateGSMEstimateByRoute(objectTransportitem.code);
                } else
                {
                transpLogic.generateGSMEstimate_Forced(trList.get(i).code);
                }
            }
            logic.recalcTravelSheet(travelSheetCode, travelSheet.statusRef.code);

            ///// NET-4440 Сохраняем историю изменения объемов ГСМ по планам
            if (trList.list.size() > 0)
            {
            	PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            	int tmpPlanCode = Integer.MIN_VALUE;

            	for (int i = 0; i < trList.list.size(); i++)
            	{
            		if (trList.get(i).planRefCode != tmpPlanCode)
            		{
            			tmpPlanCode = trList.get(i).planRefCode;
            			planLogic.generatePlanFuelHistory(tmpPlanCode);
            		}
            	}
            }

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTravelSheet%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally
        {
            closeConnection();
        }
    }



    public void addItems(int travelSheetCode, ENTransportItemShort[] tList)
    {
        try
        {

            if (tList.length == 0){
                throw new EnergyproSystemException("Не обран транспорт у планах ...");
            }

            ENTravelSheetDAO travelSheetDAO = new ENTravelSheetDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENTravelSheet travelSheet = travelSheetDAO.getObject(travelSheetCode);

            if ((travelSheet.statusRef.code == ENTravelSheetStatus.WRITINGOFF_GSM) || (travelSheet.statusRef.code == ENTravelSheetStatus.CLOSED))
            {
                throw new EnergyproSystemException("Подорожній лист вже затверджений ...");
            }

            if (travelSheet.statusRef.code == ENTravelSheetStatus.GOOD){
                travelSheet.statusRef.code = ENTravelSheetStatus.PLAN;
                travelSheet.dateEdit = new Date();
                travelSheet.userGen = getUserProfile().userName;
                travelSheetDAO.save(travelSheet);
            }

            for (int i=0; i < tList.length; i++){
                tList[i].code = Integer.MIN_VALUE;
            }


            TravelSheetLogic logic = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            logic.addItems(travelSheet, tList, Integer.MIN_VALUE);

            logic.recalcTravelSheet(travelSheetCode, travelSheet.statusRef.code);

            //TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
            //fuelLogic.generateGSMEstimateByTravelSheet(travelSheetCode);


        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTravelSheet%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }


    @Override
	public int add(ENTravelSheet object)
    {

            Connection finConn = null;
            Connection enConn = null;
        try
        {
    		/////
       		AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
       		FinConnectionData finConnectionData = l.getFinConnectionData();
    		/////

            //finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
       		finConn = getConnection(finConnectionData.connectionString);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            
            object.timeStart = this.getFullTime(object.dateStart, object.timeStart);
            object.timeFinal = this.getFullTime(object.dateFinal, object.timeFinal);


            // 22.11.2011 NET-969 Для тракторов обнулять показания спидометра
            if (object.typeRef.code == ENTravelSheetType.TRAKTOR){
                object.setSpeedometerStart(new BigDecimal(0));
                object.setSpeedometerFinal(new BigDecimal(0));
            }

            if (object.timeStart.after(object.timeFinal)){
                throw new EnergyproSystemException("Дати та час повинні бути у хронологічній послідовності ..", getUserProfile());
            }

            TravelSheetLogic logic = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

            ENTravelSheetDAO objectDAO = new ENTravelSheetDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            TKTransportRealDAO transportRealDAO = new TKTransportRealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            TKTransportReal transportRealObj = transportRealDAO.getObject(object.transportReal.code);

            // NET-3213 Ограничение использования запрещенного транспорта
            if(transportRealObj.isNotUsed == ENConsts.TRANSPORT_REAL_ISNOTUSED)
                throw new EnergyproSystemException("Транспорт " + transportRealObj.name + " заборонено використовувати");

            if ((object.finWorker != null) && (object.finWorker.finCode != Integer.MIN_VALUE || object.finWorker.tabNumber != null))
            {
                FINWorkerDAO fwDAO = new FINWorkerDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                FINWorker w = new FINWorker();

                HumenLogic hLogic = new HumenLogic(enConn, getUserProfile());
//                    проверим является ли воркер инвалидом
                // дата среза проверки принимаем на дату старт плана
                Date date_srez;
                // ENPlanWork pw = logic.getPlanByCode(object.planRef.code);
                // date_srez = pw.getDateStart();
                date_srez = object.dateStart;

                FINLogic fLogicFin = new FINLogic(finConn, getUserProfile());

                w.code = Integer.MIN_VALUE;
                w.name = object.finWorker.name;
                w.tabNumber = object.finWorker.tabNumber;
                w.positionCode = object.finWorker.positionCode;
                w.positionName = object.finWorker.positionName;
                w.departmentCode = object.finWorker.departmentCode;
                w.departmentName = object.finWorker.departmentName;
                w.priceGen = object.finWorker.priceGen;
                w.categor = object.finWorker.categor;
                w.finCode = object.finWorker.finCode;
                // MDAX-441
                w.positionId = object.finWorker.positionId;


                //if ( ! object.dateStart.equals(object.dateFinal))

                ///// 07.12.11 Убираем признак "Командировочный" вообще, потому что с ним неправильно рассчитывается з/п
                /*
                if (logic.isSentAssignment(object))
                    w.isSentAssignment = 1;
                else
                    w.isSentAssignment = 0;
                */
                w.isSentAssignment = 0;
                /////

                w.kindRef.code = object.finWorker.kindRef.code;

                //    если инвалид тогда проставляем в финворкер процент отчислений со справочника FINCHARGEHISTORY и тип отчислений FINChargeType = 2
                // иначе процент отчислений также берем со справочника но только для обычных работников  FINChargeType = 1

                if (fLogicFin.getCheckIsInvalid(object.finWorker.tabNumber,date_srez) > 0 )
                {
                    // если инвалид
                    w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_INVALID,date_srez );
                    w.chargeRef.code = FINChargeType.IS_INVALID;
                }
                else
                {   // если НЕ инвалид
                    w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID,date_srez );
                    w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
                }

                object.finWorker.code = fwDAO.add(w);

            }
            else{
                new EnergyproSystemException("Оберіть водія ...");
            }

            // Вставка дополнительного водителя 1
            if ((object.finWorker_additional_1 != null) && (object.finWorker_additional_1.finCode != Integer.MIN_VALUE || object.finWorker_additional_1.tabNumber != null))
            {
                FINWorkerDAO fwDAO = new FINWorkerDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                FINWorker w = new FINWorker();

                HumenLogic hLogic = new HumenLogic(enConn, getUserProfile());
//                    проверим является ли воркер инвалидом
                // дата среза проверки принимаем на дату старт плана
                Date date_srez;
                // ENPlanWork pw = logic.getPlanByCode(object.planRef.code);
                // date_srez = pw.getDateStart();
                date_srez = object.dateStart;

                FINLogic fLogicFin = new FINLogic(finConn, getUserProfile());

                w.code = Integer.MIN_VALUE;
                w.name = object.finWorker_additional_1.name;
                w.tabNumber = object.finWorker_additional_1.tabNumber;
                w.positionCode = object.finWorker_additional_1.positionCode;
                w.positionName = object.finWorker_additional_1.positionName;
                w.departmentCode = object.finWorker_additional_1.departmentCode;
                w.departmentName = object.finWorker_additional_1.departmentName;
                w.priceGen = object.finWorker_additional_1.priceGen;
                w.categor = object.finWorker_additional_1.categor;
                w.finCode = object.finWorker_additional_1.finCode;
                // MDAX-441
                w.positionId = object.finWorker_additional_1.positionId;


                //if ( ! object.dateStart.equals(object.dateFinal))

                ///// 07.12.11 Убираем признак "Командировочный" вообще, потому что с ним неправильно рассчитывается з/п
                /*
                if (logic.isSentAssignment(object))
                    w.isSentAssignment = 1;
                else
                    w.isSentAssignment = 0;
                */
                w.isSentAssignment = 0;
                /////

                w.kindRef.code = object.finWorker_additional_1.kindRef.code;

                //    если инвалид тогда проставляем в финворкер процент отчислений со справочника FINCHARGEHISTORY и тип отчислений FINChargeType = 2
                // иначе процент отчислений также берем со справочника но только для обычных работников  FINChargeType = 1

                if (fLogicFin.getCheckIsInvalid(object.finWorker_additional_1.tabNumber,date_srez) > 0 )
                {
                    // если инвалид
                    w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_INVALID,date_srez );
                    w.chargeRef.code = FINChargeType.IS_INVALID;
                }
                else
                {   // если НЕ инвалид
                    w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID,date_srez );
                    w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
                }

                object.finWorker_additional_1.code = fwDAO.add(w);

            }
            else{
                new EnergyproSystemException("Оберіть водія ...");
            }

            // Вставка дополнительного водителя 2
            if ((object.finWorker_additional_2 != null) && (object.finWorker_additional_2.finCode != Integer.MIN_VALUE || object.finWorker_additional_2.tabNumber != null))
            {
                FINWorkerDAO fwDAO = new FINWorkerDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                FINWorker w = new FINWorker();

                HumenLogic hLogic = new HumenLogic(enConn, getUserProfile());
//                    проверим является ли воркер инвалидом
                // дата среза проверки принимаем на дату старт плана
                Date date_srez;
                // ENPlanWork pw = logic.getPlanByCode(object.planRef.code);
                // date_srez = pw.getDateStart();
                date_srez = object.dateStart;

                FINLogic fLogicFin = new FINLogic(finConn, getUserProfile());

                w.code = Integer.MIN_VALUE;
                w.name = object.finWorker_additional_2.name;
                w.tabNumber = object.finWorker_additional_2.tabNumber;
                w.positionCode = object.finWorker_additional_2.positionCode;
                w.positionName = object.finWorker_additional_2.positionName;
                w.departmentCode = object.finWorker_additional_2.departmentCode;
                w.departmentName = object.finWorker_additional_2.departmentName;
                w.priceGen = object.finWorker_additional_2.priceGen;
                w.categor = object.finWorker_additional_2.categor;
                w.finCode = object.finWorker_additional_2.finCode;
                // MDAX-441
                w.positionId = object.finWorker_additional_2.positionId;


                //if ( ! object.dateStart.equals(object.dateFinal))

                ///// 07.12.11 Убираем признак "Командировочный" вообще, потому что с ним неправильно рассчитывается з/п
                /*
                if (logic.isSentAssignment(object))
                    w.isSentAssignment = 1;
                else
                    w.isSentAssignment = 0;
                */
                w.isSentAssignment = 0;
                /////

                w.kindRef.code = object.finWorker_additional_2.kindRef.code;

                //    если инвалид тогда проставляем в финворкер процент отчислений со справочника FINCHARGEHISTORY и тип отчислений FINChargeType = 2
                // иначе процент отчислений также берем со справочника но только для обычных работников  FINChargeType = 1

                if (fLogicFin.getCheckIsInvalid(object.finWorker_additional_2.tabNumber,date_srez) > 0 )
                {
                    // если инвалид
                    w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_INVALID,date_srez );
                    w.chargeRef.code = FINChargeType.IS_INVALID;
                }
                else
                {   // если НЕ инвалид
                    w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID,date_srez );
                    w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
                }

                object.finWorker_additional_2.code = fwDAO.add(w);

            }
            else{
                new EnergyproSystemException("Оберіть водія ...");
            }

            //

            ENTravelSheet prevSheet = logic.getPrevSheet(object);
            if ( (prevSheet != null) && ((object.statusRef.code == ENTravelSheetStatus.GOOD) || (object.statusRef.code == ENTravelSheetStatus.PLAN)))
            {
                if ((prevSheet.statusRef.code != ENTravelSheetStatus.CLOSED) && (prevSheet.statusRef.code != ENTravelSheetStatus.WRITINGOFF_GSM))
                {
                    if (object.typeRef.code != ENTravelSheetType.TRAKTOR){
                        object.speedometerStart = null;}
                    object.fuelCounterStart = null;
                }
                else
                {
                    if (object.typeRef.code != ENTravelSheetType.TRAKTOR){
                        object.speedometerStart = prevSheet.speedometerFinal;}
                    object.fuelCounterStart = prevSheet.fuelCounterFinal;
                }
            }

            // если след. закрыт - тоже в сад ...
            //типа добавляют посредине ....
            ENTravelSheet nextSheet = logic.getNextSheet(object);
            if (nextSheet != null){
                //if ((nextSheet.statusRef.code != ENTravelSheetStatus.GOOD) || (nextSheet.statusRef.code != ENTravelSheetStatus.PLAN)){
                //    throw new EnergyproSystemException("Наступний ПЛ з № " + nextSheet.numberGen + " вже затверджено ... дата ПЛ повинна бути більша за " + new SimpleDateFormat("dd.MM.yyyy HH:mm").format(nextSheet.timeStart));
                //}

                //if (nextSheet.speedometerStart != null){
                    throw new EnergyproSystemException("Дата ПЛ повинна бути більша за " + new SimpleDateFormat("dd.MM.yyyy HH:mm").format(nextSheet.timeStart) + ", або видалить ПЛ № " + nextSheet.numberGen );
                //}
            }


            /*
            boolean isClosedLast = logic.isClosedLast(object, false);

            if ( ! isClosedLast ){
                object.speedometerStart = null;
            }
            else{
                logic.checkIsLast(object, true);
            }
            */

            logic.checkUniqueSheet(object);

            // время и показания спидометра ..

            // типа номер ..
            //object.numberGen = ""+new Date().getTime();
            object.numberGen = "" + objectDAO._collectAutoIncrementNumber();


            object.setDomain_info(null);
            object.statusRef.code = ENTravelSheetStatus.GOOD;
            object.dateEdit = new Date();
            object.userGen = getUserProfile().userName;

            int objCode = objectDAO.add(object);

            // отстаки ТОЛЬКО для закрытых предыдущих ...
            //if ( isClosedLast){
            // создадим остаток для Листа ...
            //ENTravelSheet prevList = logic.getPrevSheet(object);
            if ( prevSheet != null ){
                if ((prevSheet.statusRef.code == ENTravelSheetStatus.CLOSED) || (prevSheet.statusRef.code == ENTravelSheetStatus.WRITINGOFF_GSM))
                {
                ENTravelSheetFuelRemainsDAO remDAO = new ENTravelSheetFuelRemainsDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENTravelSheetFuelRemainsFilter remFilter = new ENTravelSheetFuelRemainsFilter();
                remFilter.realTransport.code = object.transportReal.code;
                //перекинем все остатки (может быть 80 и 92 )
                //remFilter.fuelTypeRef.code =
                remFilter.travelSheetRef.code = prevSheet.code;
                ENTravelSheetFuelRemainsShortList remList = remDAO.getScrollableFilteredList(remFilter, 0, -1);
                for (int j=0; j<remList.totalCount; j++){
                    ENTravelSheetFuelRemains fr = new ENTravelSheetFuelRemains();
                    fr.travelSheetRef.code = objCode;
                    fr.realTransport.code = object.transportReal.code;
                    fr.dateGen = object.dateStart;
                    fr.fuelTypeRef.code = remList.get(j).fuelTypeRefCode;
                    fr.travelSheetFuelTypeRef.code = remList.get(j).travelSheetFuelTypeRefCode;

                    fr.countGenStart = remList.get(j).countGenFinal;
                    fr.sumGenStart = remList.get(j).sumGenFinal;
                    fr.priceGenStart = remList.get(j).priceGenFinal;

                    fr.countGenIn = fr.countGenOut = fr.sumGenIn = fr.sumGenOut = fr.priceGenIn = fr.priceGenOut = new BigDecimal(0);

                    fr.countGenFinal = fr.countGenStart;
                    fr.sumGenFinal = fr.sumGenStart;
                    fr.priceGenFinal = fr.priceGenStart;

                    remDAO.add(fr);
                }
                }
            }
            //}

            if (object.numberGen.equals("Auto")){
                throw new EnergyproSystemException("########## - Auto - помилка з номером ПЛ ...");
            }

            return objCode;

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTravelSheet%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
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

    public void setIsPrinted(int code)
    {
    	Connection enConn = null;
    	try {
    	enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
        ENTravelSheetDAO objectDAO = new ENTravelSheetDAO(getUserProfile(),enConn);
        ENTravelSheet object = objectDAO.getObject(code);
        object.isPrinted = 1;
        objectDAO.save(object);
    	}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTravelSheet%} object.",e);}
    	 finally                              {
    		 try {
                 if (enConn != null && ! enConn.isClosed()) {
                     enConn.close();
                     enConn = null;
                 }
             } catch (SQLException e) {
             }
    	 }
    }




    /*ENTravelSheet. Изменить*/
    @Override
	public void save(ENTravelSheet object)
    {
            Connection finConn = null;
            Connection enConn = null;
            Connection globusConn = null;
        try
        {


            globusConn = getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

        	/////
       		AuthLogic l = new AuthLogic(enConn, getUserProfile());
       		FinConnectionData finConnectionData = l.getFinConnectionData();
    		/////
       		finConn = getConnection(finConnectionData.connectionString);

            if (object.numberGen.equals("Auto")){
                throw new EnergyproSystemException("########## - Auto - помилка з номером ПЛ ...");
            }

            object.timeStart = this.getFullTime(object.dateStart, object.timeStart);
            object.timeFinal = this.getFullTime(object.dateFinal, object.timeFinal);

            // 22.11.2011 NET-969 Для тракторов обнулять показания спидометра
            if (object.typeRef.code == ENTravelSheetType.TRAKTOR){
                object.setSpeedometerStart(new BigDecimal(0));
                object.setSpeedometerFinal(new BigDecimal(0));
            }

            if (object.timeStart.after(object.timeFinal)){
                throw new EnergyproSystemException("Дати повинні бути у хронологічній послідовності ..", getUserProfile());
            }

            if (object.statusRef.code == ENTravelSheetStatus.CLOSED){
                throw new EnergyproSystemException("Подорожній лист ЗАТВЕРДЖЕНО ...");
            }

            TravelSheetLogic logic = new TravelSheetLogic(enConn, getUserProfile());

            ENTravelSheetDAO objectDAO = new ENTravelSheetDAO(getUserProfile(), enConn);
            ENTravelSheet oldObject = objectDAO.getObject(object.code);



            if (object.transportReal.code != oldObject.transportReal.code)
                throw new EnergyproSystemException("Для зміни автомобіля видаліть цей подорожній лист та складіть новий!");

            ENTravelSheetFuelRemainsDAO remDAO = new ENTravelSheetFuelRemainsDAO(enConn, getUserProfile());

            // датой могут задвинуть куда хош ...
            if (
                    (oldObject.dateStart.getTime() != object.dateStart.getTime())
                    || (oldObject.dateFinal.getTime() != object.dateFinal.getTime())
            )
            {
                // если есть строки  - в сад ... // даем менять дату для черновых и Планов
                if (oldObject.statusRef.code != ENTravelSheetStatus.GOOD && oldObject.statusRef.code != ENTravelSheetStatus.PLAN){
                    throw new EnergyproSystemException("Змінювати дати можна тільки у Чернових подорожніх листах ... ");
                }

                ENTravelSheet prevOld = logic.getPrevSheet(oldObject);
                if (prevOld != null){
                    if ( (prevOld.timeStart.getTime() >= object.timeStart.getTime() ) || (prevOld.timeFinal.getTime() >= object.timeFinal.getTime()))
                    {
                        throw new EnergyproSystemException("Вже є подорожній лист № " + prevOld.numberGen + " з датою "
                                + new SimpleDateFormat("dd.MM.yyyy").format(prevOld.dateStart) ) ;
                    }
                }

                ENTravelSheet nextOld = logic.getNextSheet(oldObject);
                if (nextOld != null){
                    if ( (nextOld.timeStart.getTime() <= object.timeStart.getTime() ) || (nextOld.timeFinal.getTime() <= object.timeFinal.getTime()))
                    {
                        throw new EnergyproSystemException("Вже є подорожній лист № " + nextOld.numberGen + " з датою "
                                + new SimpleDateFormat("dd.MM.yyyy").format(nextOld.dateStart) ) ;
                    }
                }

                // а остаток обновить? ;))
                //TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

                ENTravelSheetFuelRemainsFilter remFilter = new ENTravelSheetFuelRemainsFilter();
                remFilter.travelSheetRef.code = object.code;
                int[] remArr = remDAO.getFilteredCodeArray(remFilter, 0, -1);
                for (int q = 0; q < remArr.length; q++)
                {
                    ENTravelSheetFuelRemains rem = remDAO.getObject(remArr[q]);
                    rem.dateGen = object.dateStart;
                    remDAO.save(rem);
                }
            }

            // последним ему быть не обязательно ..
            ENTravelSheet prevSheet = logic.getPrevSheet(object);
            if ( (prevSheet != null) && ((object.statusRef.code == ENTravelSheetStatus.GOOD) || (object.statusRef.code == ENTravelSheetStatus.PLAN)))
            {
                if ((prevSheet.statusRef.code != ENTravelSheetStatus.CLOSED) && (prevSheet.statusRef.code != ENTravelSheetStatus.WRITINGOFF_GSM))
                {
                    if (object.typeRef.code != ENTravelSheetType.TRAKTOR) {object.speedometerStart = null;}
                    object.fuelCounterStart = null;
                }
                else
                {
                    if (object.typeRef.code != ENTravelSheetType.TRAKTOR) {object.speedometerStart = prevSheet.speedometerFinal;}
                    object.fuelCounterStart = prevSheet.fuelCounterFinal;

                    // остатки .... ниже
                }
            }

            logic.checkUniqueSheet(object);

            if (object.statusRef.code == ENTravelSheetStatus.FACT){
                if ((object.speedometerStart == null) || (object.speedometerFinal == null)){
                    throw new EnergyproSystemException("Не введено показники спідометра ...");
                }

                logic.chkSpeedometer(object.speedometerStart, object.speedometerFinal, "спидометра", true);

                if (object.transportReal.fuelCalcTypeRef.code == TKFuelCalcType.BY_COUNTER){
                    logic.chkSpeedometer(object.fuelCounterStart, object.fuelCounterFinal, "лічільника палива", true);
                }

                if ((object.timeStart == null) || (object.timeFinal == null))
                {
                    throw new EnergyproSystemException("Не введено час виїзду або повернення ...");
                }

                logic.chkTimes(object.dateStart, object.dateFinal, true);
                //if (object.ti)

                // если перед сохранением ниче не было - сравнивать не надо ;)))
                if (oldObject.speedometerFinal != null){

                    if (oldObject.speedometerFinal.doubleValue() != object.speedometerFinal.doubleValue()){
                        ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getUserProfile(), enConn);
                        ENTravelSheetItemFilter itemFilter = new ENTravelSheetItemFilter();
                        itemFilter.kindRef.code = ENTravelSheetItemKind.FACT;
                        itemFilter.travelSheetRef.code = object.code;
                        itemFilter.conditionSQL = "speedometerfinal is not null";
                        int[] itemArr = itemDAO.getFilteredCodeArray(itemFilter, 0, 1);
                        if (itemArr.length != 0){
                            throw new EnergyproSystemException("Вже є показники у строках маршруту ... перезаведіть фактичний маршрут !!!");
                        }
                    }
                }
                if ((oldObject.fuelCounterFinal != null) && (oldObject.transportReal.fuelCalcTypeRef.code == TKFuelCalcType.BY_COUNTER))
                {

                    if (oldObject.fuelCounterFinal.doubleValue() != object.fuelCounterFinal.doubleValue()){
                        ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getUserProfile(), enConn);
                        ENTravelSheetItemFilter itemFilter = new ENTravelSheetItemFilter();
                        itemFilter.kindRef.code = ENTravelSheetItemKind.FACT;
                        itemFilter.travelSheetRef.code = object.code;
                        itemFilter.conditionSQL = "fuelcounterfinal is not null";
                        int[] itemArr = itemDAO.getFilteredCodeArray(itemFilter, 0, 1);
                        if (itemArr.length != 0){
                            throw new EnergyproSystemException("Вже є показники лічільника палива у строках маршруту ... перезаведіть фактичний маршрут !!!");
                        }
                    }
                }
            }


            if (object.finWorker != null){
                if (object.finWorker.tabNumber != null) {
                FINWorkerDAO wDAO = new FINWorkerDAO(getUserProfile(), enConn);
                FINWorker w = new FINWorker();
                ////
                if (!oldObject.finWorker.tabNumber.equals(object.finWorker.tabNumber))
                {
                	ENTravelSheetItemDAO tiDAO = new ENTravelSheetItemDAO(enConn, getUserProfile());
                	ENTravelSheetItemFilter tiFilter = new ENTravelSheetItemFilter();
                	tiFilter.travelSheetRef.code = object.code;
                	tiFilter.conditionSQL = ENTravelSheetItem.statusRef_QFielld + " <> " +  ENTravelSheetItemStatus.DELETED;
                	int[] arr = tiDAO.getFilteredCodeArray(tiFilter, 0, -1);
                	if (arr.length > 0) {
                		throw new EnergyproSystemException("На путевом листе есть наряд-задания. Водителя изменять нельзя! ");
                	}

                }
                ////
                if  (object.finWorker.code > Integer.MIN_VALUE){
                    w = wDAO.getObject(object.finWorker.code);
                }

//                проверим является ли воркер инвалидом
                // дата среза проверки принимаем на дату старт плана
                Date date_srez;
                // ENPlanWork pw = logic.getPlanByCode(object.planRef.code);
                // date_srez = pw.getDateStart();
                date_srez = object.dateStart;

                FINLogic fLogicFin = new FINLogic(finConn, getUserProfile());

                w.code = object.finWorker.code;
                w.name = object.finWorker.name;
                w.tabNumber = object.finWorker.tabNumber;
                w.positionCode = object.finWorker.positionCode;
                w.positionName = object.finWorker.positionName;
                w.departmentCode = object.finWorker.departmentCode;
                w.departmentName = object.finWorker.departmentName;
                w.priceGen = object.finWorker.priceGen;
                w.categor = object.finWorker.categor;
                w.finCode = object.finWorker.finCode;
                // MDAX-441
                w.positionId = object.finWorker.positionId;

                ///// 07.12.11 Убираем признак "Командировочный" вообще, потому что с ним неправильно рассчитывается з/п
                /*
                if (logic.isSentAssignment(object))
                    w.isSentAssignment = 1;
                else
                    w.isSentAssignment = 0;
                */
                w.isSentAssignment = 0;
                /////

                w.kindRef.code = object.finWorker.kindRef.code;

//                если инвалид тогда проставляем в финворкер процент отчислений со справочника FINCHARGEHISTORY и тип отчислений FINChargeType = 2
                // иначе процент отчислений также берем со справочника но только для обычных работников  FINChargeType = 1
                HumenLogic hLogic = new HumenLogic(enConn, getUserProfile());
                if (fLogicFin.getCheckIsInvalid(object.finWorker.tabNumber,date_srez) > 0 )
                {
                    // если инвалид
                    w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_INVALID,date_srez );
                    w.chargeRef.code = FINChargeType.IS_INVALID;
                }
                else
                {   // если НЕ инвалид
                    w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID,date_srez );
                    w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
                }

                object.finWorker.code = wDAO.add(w);

                /*
                if  (object.finWorker.code == Integer.MIN_VALUE){
                    object.finWorker.code = wDAO.add(w);
                }
                else
                {
                    wDAO.save(w);
                }*/

                }
            }
            else{
                throw new EnergyproSystemException("Введіть водія ...");
            }

            // Вставка/редактирование дополнительного водителя 1
            if (object.finWorker_additional_1 != null){
                    if (object.finWorker_additional_1.tabNumber != null) {
                    FINWorkerDAO wDAO = new FINWorkerDAO(getUserProfile(), enConn);
                    FINWorker w = new FINWorker();
                    if  (object.finWorker_additional_1.code > Integer.MIN_VALUE){
                        w = wDAO.getObject(object.finWorker_additional_1.code);
                    }

//                    проверим является ли воркер инвалидом
                    // дата среза проверки принимаем на дату старт плана
                    Date date_srez;
                    // ENPlanWork pw = logic.getPlanByCode(object.planRef.code);
                    // date_srez = pw.getDateStart();
                    date_srez = object.dateStart;

                    FINLogic fLogicFin = new FINLogic(finConn, getUserProfile());

                    w.code = object.finWorker_additional_1.code;
                    w.name = object.finWorker_additional_1.name;
                    w.tabNumber = object.finWorker_additional_1.tabNumber;
                    w.positionCode = object.finWorker_additional_1.positionCode;
                    w.positionName = object.finWorker_additional_1.positionName;
                    w.departmentCode = object.finWorker_additional_1.departmentCode;
                    w.departmentName = object.finWorker_additional_1.departmentName;
                    w.priceGen = object.finWorker_additional_1.priceGen;
                    w.categor = object.finWorker_additional_1.categor;
                    w.finCode = object.finWorker_additional_1.finCode;
                    // MDAX-441
                    w.positionId = object.finWorker_additional_1.positionId;

                    ///// 07.12.11 Убираем признак "Командировочный" вообще, потому что с ним неправильно рассчитывается з/п
                    /*
                    if (logic.isSentAssignment(object))
                        w.isSentAssignment = 1;
                    else
                        w.isSentAssignment = 0;
                    */
                    w.isSentAssignment = 0;
                    /////

                    w.kindRef.code = object.finWorker_additional_1.kindRef.code;

//                    если инвалид тогда проставляем в финворкер процент отчислений со справочника FINCHARGEHISTORY и тип отчислений FINChargeType = 2
                    // иначе процент отчислений также берем со справочника но только для обычных работников  FINChargeType = 1
                    HumenLogic hLogic = new HumenLogic(enConn, getUserProfile());
                    if (fLogicFin.getCheckIsInvalid(object.finWorker_additional_1.tabNumber,date_srez) > 0 )
                    {
                        // если инвалид
                        w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_INVALID,date_srez );
                        w.chargeRef.code = FINChargeType.IS_INVALID;
                    }
                    else
                    {   // если НЕ инвалид
                        w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID,date_srez );
                        w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
                    }

                    object.finWorker_additional_1.code = wDAO.add(w);

                    /*
                    if  (object.finWorker_additional_1.code == Integer.MIN_VALUE){
                        object.finWorker_additional_1.code = wDAO.add(w);
                    }
                    else
                    {
                        wDAO.save(w);
                    }
                    */

                    }
                }
                else{
                    throw new EnergyproSystemException("Введіть водія ...");
                }

            // Вставка/редактирование дополнительного водителя 2
            if (object.finWorker_additional_2 != null){
                    if (object.finWorker_additional_2.tabNumber != null) {
                    FINWorkerDAO wDAO = new FINWorkerDAO(getUserProfile(), enConn);
                    FINWorker w = new FINWorker();
                    if  (object.finWorker_additional_2.code > Integer.MIN_VALUE){
                        w = wDAO.getObject(object.finWorker_additional_2.code);
                    }

//                    проверим является ли воркер инвалидом
                    // дата среза проверки принимаем на дату старт плана
                    Date date_srez;
                    // ENPlanWork pw = logic.getPlanByCode(object.planRef.code);
                    // date_srez = pw.getDateStart();
                    date_srez = object.dateStart;

                    FINLogic fLogicFin = new FINLogic(finConn, getUserProfile());

                    w.code = object.finWorker_additional_2.code;
                    w.name = object.finWorker_additional_2.name;
                    w.tabNumber = object.finWorker_additional_2.tabNumber;
                    w.positionCode = object.finWorker_additional_2.positionCode;
                    w.positionName = object.finWorker_additional_2.positionName;
                    w.departmentCode = object.finWorker_additional_2.departmentCode;
                    w.departmentName = object.finWorker_additional_2.departmentName;
                    w.priceGen = object.finWorker_additional_2.priceGen;
                    w.categor = object.finWorker_additional_2.categor;
                    w.finCode = object.finWorker_additional_2.finCode;
                    // MDAX-441
                    w.positionId = object.finWorker_additional_2.positionId;

                    ///// 07.12.11 Убираем признак "Командировочный" вообще, потому что с ним неправильно рассчитывается з/п
                    /*
                    if (logic.isSentAssignment(object))
                        w.isSentAssignment = 1;
                    else
                        w.isSentAssignment = 0;
                    */
                    w.isSentAssignment = 0;
                    /////

                    w.kindRef.code = object.finWorker_additional_2.kindRef.code;

//                    если инвалид тогда проставляем в финворкер процент отчислений со справочника FINCHARGEHISTORY и тип отчислений FINChargeType = 2
                    // иначе процент отчислений также берем со справочника но только для обычных работников  FINChargeType = 1
                    HumenLogic hLogic = new HumenLogic(enConn, getUserProfile());
                    if (fLogicFin.getCheckIsInvalid(object.finWorker_additional_2.tabNumber,date_srez) > 0 )
                    {
                        // если инвалид
                        w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_INVALID,date_srez );
                        w.chargeRef.code = FINChargeType.IS_INVALID;
                    }
                    else
                    {   // если НЕ инвалид
                        w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID,date_srez );
                        w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
                    }

                    object.finWorker_additional_2.code = wDAO.add(w);

                    /*
                    if  (object.finWorker_additional_2.code == Integer.MIN_VALUE){
                        object.finWorker_additional_2.code = wDAO.add(w);
                    }
                    else
                    {
                        wDAO.save(w);
                    }
                    */


                    }
                }
                else{
                    throw new EnergyproSystemException("Введіть водія ...");
                }


        object.setDomain_info(null);

        object.dateEdit = new Date();
        object.userGen = getUserProfile().userName;


        if (object.trailer1.code != Integer.MIN_VALUE)
        {
            ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getUserProfile(), enConn);
            ENTravelSheetItemFilter itemFilter = new ENTravelSheetItemFilter();
            itemFilter.kindRef.code = ENTravelSheetItemKind.PLAN;
            itemFilter.travelSheetRef.code = object.code;
            int[] itemArr = itemDAO.getFilteredCodeArray(itemFilter, 0, 1);
            if (itemArr.length == 0){}

            for (int q = 0; q < itemArr.length; q++)
            {
                ENTravelSheetItem2TransportItemDAO tsi2tiDAO = new ENTravelSheetItem2TransportItemDAO(enConn, getUserProfile());
                ENTravelSheetItem2TransportItemFilter tsi2tiFilter = new ENTravelSheetItem2TransportItemFilter();
                tsi2tiFilter.travelSheetItemRef.code = itemArr[q];

                ENTravelSheetItem2TransportItemShortList tsi2tiList = tsi2tiDAO.getScrollableFilteredList(tsi2tiFilter, 0, -1);

                for (int o = 0; o < tsi2tiList.totalCount; o++)
                {

                ENTransportItemDAO tiDAO = new ENTransportItemDAO(enConn, getUserProfile());
                ENTransportItem ti = tiDAO.getObject(tsi2tiList.get(o).transportItemRefCode);

                ti.trailerTransportReal.code = object.trailer1.code;
                tiDAO.save(ti);
                }

            }

        }

        objectDAO.save(object);

        // Для GPS-навигаторов записываются показания датчиков топлива из СКТ "Глобус" относительно заправок или возможных сливов
        if(object.statusRef.code == ENTravelSheetStatus.FACT) {
        	GlobusLogic globusLogic = new GlobusLogic(globusConn, getUserProfile());
        	TransportLogic transportLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
        	boolean isGPS = transportLogic.isGPS(object.transportReal.code, object.dateFinal);
        	TKTransportRealHistory historyObj = transportLogic.getHistory(object.transportReal.code, object.dateFinal);
        	if(isGPS && globusLogic.checkExistFuelLevelSensor(historyObj.reg_id)) {
        		// Очистка данных (если были)
        		ENTravelSheetFuelFillDAO fuelFillDao = new ENTravelSheetFuelFillDAO(enConn, getUserProfile());
        		ENTravelSheetFuelFillFilter fuelFillFilter = new ENTravelSheetFuelFillFilter();
        		fuelFillFilter.travelSheetRef.code = object.code;
        		int[] fuelFillCodes = fuelFillDao.getFilteredCodeArray(fuelFillFilter, 0, -1);
        		for(int fuelFillCode : fuelFillCodes) {
        			fuelFillDao.remove(fuelFillCode);
        		}
        		// Вытягивание и запись новых показателей
        		ENTravelSheetFuelFill[] fuelFills = globusLogic.getFuelFills(object);
        		for(ENTravelSheetFuelFill fuelFill : fuelFills) {
        			fuelFillDao.add(fuelFill);
        		}
        	}
        }

        // потеряли остаток ...
        if ((object.statusRef.code == ENTravelSheetStatus.GOOD) || (object.statusRef.code == ENTravelSheetStatus.PLAN))
        {
            if (prevSheet != null){
            if ((prevSheet.statusRef.code == ENTravelSheetStatus.WRITINGOFF_GSM) || (prevSheet.statusRef.code == ENTravelSheetStatus.CLOSED))
            {
                // если на текущем нет остатка ... создать из предыдущего ...
                ENTravelSheetFuelRemainsFilter rFilter = new ENTravelSheetFuelRemainsFilter();
                rFilter.travelSheetRef.code = object.code;
                int[] rArr = remDAO.getFilteredCodeArray(rFilter, 0, -1);
                if (rArr.length == 0){

                    ENTravelSheetFuelRemainsFilter remFilter = new ENTravelSheetFuelRemainsFilter();
                    remFilter.realTransport.code = object.transportReal.code;
                    //перекинем все остатки (может быть 80 и 92 )
                    //remFilter.fuelTypeRef.code =
                    remFilter.travelSheetRef.code = prevSheet.code;
                    ENTravelSheetFuelRemainsShortList remList = remDAO.getScrollableFilteredList(remFilter, 0, -1);
                    for (int j=0; j<remList.totalCount; j++){
                        ENTravelSheetFuelRemains fr = new ENTravelSheetFuelRemains();
                        fr.travelSheetRef.code = object.code;
                        fr.realTransport.code = object.transportReal.code;
                        fr.dateGen = object.dateStart;
                        fr.fuelTypeRef.code = remList.get(j).fuelTypeRefCode;
                        fr.travelSheetFuelTypeRef.code = remList.get(j).travelSheetFuelTypeRefCode;

                        fr.countGenStart = remList.get(j).countGenFinal;
                        fr.sumGenStart = remList.get(j).sumGenFinal;
                        fr.priceGenStart = remList.get(j).priceGenFinal;

                        fr.countGenIn = fr.countGenOut = fr.sumGenIn = fr.sumGenOut = fr.priceGenIn = fr.priceGenOut = new BigDecimal(0);

                        fr.countGenFinal = fr.countGenStart;
                        fr.sumGenFinal = fr.sumGenStart;
                        fr.priceGenFinal = fr.priceGenStart;

                        remDAO.add(fr);
                        TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(enConn, getUserProfile());
                        fuelLogic.updateRemainderCountIn(object.code, fr.fuelTypeRef.code, fr.travelSheetFuelTypeRef.code, fr.checkIsThirdParty());
                    }


                }
            }
            }
        }

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENTravelSheet%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
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
            try {
                if (globusConn != null && ! globusConn.isClosed()) {
                	globusConn.close();
                	globusConn = null;
                }
            } catch (SQLException e) {
            }
    }
 }


    @Override
	public void remove(int code)
    {
        try
        {


        ENTravelSheetDAO objectDAO = new ENTravelSheetDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

        ENTravelSheet object = objectDAO.getObject(code);

        if (object.statusRef.code != ENTravelSheetStatus.GOOD && object.statusRef.code != ENTravelSheetStatus.PLAN){
            throw new EnergyproSystemException("Видаляти можна тільки Черновий подорожній лист або подорожній лист з видаленими нарядами...");
        }


        if (object.statusRef.code == ENTravelSheetStatus.PLAN)
        {
        ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        ENTravelSheetItemFilter itemFilter = new ENTravelSheetItemFilter();
        itemFilter.travelSheetRef.code = object.code;
        itemFilter.conditionSQL = ENTravelSheetItem.statusRef_QFielld + " <> " + ENTravelSheetItemStatus.DELETED;
        int[] itemArr = itemDAO.getFilteredCodeArray(itemFilter, 0, -1);
        if (itemArr.length > 0) {
        	throw new EnergyproSystemException("Есть не удаленные строки на путевом листе!");
        }

       itemFilter = new ENTravelSheetItemFilter();
       itemFilter.travelSheetRef.code = object.code;
       itemFilter.statusRef.code = ENTravelSheetItemStatus.DELETED;
       itemArr = itemDAO.getFilteredCodeArray(itemFilter, 0, -1);
       if (itemArr.length > 0) {
    	   for (int i=0; i < itemArr.length; i++)
    	   {
    		   itemDAO.remove(itemArr[i]);
    	   }
       }
       }

        //если была выдача в САД ...
        ENTravelSheetFuelDAO fuelDAO = new ENTravelSheetFuelDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        ENTravelSheetFuelFilter fuelFilter = new ENTravelSheetFuelFilter();
        fuelFilter.travelSheetRef.code = object.code;
        int[] fuelArr = fuelDAO.getFilteredCodeArray(fuelFilter, 0, -1);
        if (fuelArr.length > 0){
            throw new EnergyproSystemException("На цьому ПЛ є видача ПММ .. ");
        }


        TravelSheetLogic logic = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());


        // удалаять даем ... NET-307

        ENTravelSheet nextSheet = logic.getNextSheet(object);
        ENTravelSheet prevSheet = logic.getPrevSheet(object);

        if (nextSheet != null) {
            if ((nextSheet.statusRef.code != ENTravelSheetStatus.GOOD) && (nextSheet.statusRef.code != ENTravelSheetStatus.PLAN)){
                throw new EnergyproSystemException("Наступний подорожный лист № " + nextSheet.numberGen + " повинен бути у статусі Черновий або Формування планів");
            }
        }

        fuelLogic.deleteTravelSheetRemainder(code);

        if (prevSheet == null){
                fuelLogic.deleteTransportRealRemainder(object.transportReal.code);
        }


        /*
        logic.checkIsLast(object, true);

        // вынести ОСТАТКИ на этот пд. лист ...
        TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        fuelLogic.deleteTravelSheetRemainder(code);

        // если нету больше Пут. листов на этот АВТОМОБИЛЬ - выносим остаток на это авто ...
        if (logic.getPrevSheet(object) == null)
            fuelLogic.deleteTransportRealRemainder(object.transportReal.code);
        */

        /*SUPP-55312 Проверка на внесение путевого листа в Реестр КПП*/
        ENCheckpointPassListItemDAO checkPointItemDao = new ENCheckpointPassListItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        ENCheckpointPassListDAO checkPointPassListDao = new ENCheckpointPassListDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        ENCheckpointDAO checkPointDao = new ENCheckpointDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        ENCheckpointPassListItemFilter checkPointItemFilter = new ENCheckpointPassListItemFilter();
        checkPointItemFilter.travelSheetRef.code = code;
        int[] checkPointItemCodes = checkPointItemDao.getFilteredCodeArray(checkPointItemFilter, 0, 1);
        if(checkPointItemCodes.length > 0) {
        	ENCheckpointPassListItem item = checkPointItemDao.getObject(checkPointItemCodes[0]);
        	ENCheckpointPassList passList = checkPointPassListDao.getObject(item.checkpointPassListRef.code);
        	ENCheckpoint checkPoint = checkPointDao.getObject(passList.checkpointRef.code);
        	throw new EnergyproSystemException(String.format("Подорожній лист № %s внесений у реєстр %s від %s до %s. \n "
        			+ " Для видалення цього подорожнього листа необхідно його видалити із реєстру.", object.numberGen, checkPoint.name
        			, new SimpleDateFormat("dd.MM.yyyy HH:mm").format(passList.dateStart), new SimpleDateFormat("dd.MM.yyyy HH:mm").format(passList.dateFinal)));
        }

        objectDAO.remove(code);

        if ((nextSheet != null) && (prevSheet != null)){
            if ((prevSheet.statusRef.code == ENTravelSheetStatus.CLOSED) || (prevSheet.statusRef.code == ENTravelSheetStatus.WRITINGOFF_GSM)){
                logic.updateNextSheet(prevSheet);
                fuelLogic.updateNextRemainder(prevSheet, nextSheet);
            }
        }

        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTravelSheet%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }


    public void createNewTravelSheetForTransportOnDuty(int transportRealCode)
    {

            Connection finConn = null;
            Connection enConn = null;
        try
        {

        	ENTravelSheet object = new ENTravelSheet();
        	ENTravelSheet lastSheet = new ENTravelSheet();

        	TravelSheetLogic logic = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENTravelSheetDAO objectDAO = new ENTravelSheetDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            TKTransportRealDAO transportRealDAO = new TKTransportRealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            TKTransportReal transportRealObj = transportRealDAO.getObject(transportRealCode);

            lastSheet = logic.getLastSheet(transportRealCode, null, null);

        	 // время и дата
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(lastSheet.timeFinal);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
//            calendar.set(Calendar.HOUR, 7);
//            calendar.set(Calendar.MINUTE, 30);

            object.timeStart = calendar.getTime();
            object.dateStart = calendar.getTime();

            Calendar calendar1 = Calendar.getInstance();
            calendar1.setTime(lastSheet.timeFinal);

            calendar1.set(Calendar.SECOND, 0);
            calendar1.set(Calendar.MILLISECOND, 0);
//            calendar1.set(Calendar.HOUR, 16);
//            calendar1.set(Calendar.MINUTE, 30);
            calendar1.add(Calendar.DAY_OF_MONTH, +1);

            object.timeFinal = calendar1.getTime();
            object.dateFinal = calendar1.getTime();

            finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            // NET-3213 Ограничение использования запрещенного транспорта
            if(transportRealObj.isNotUsed == ENConsts.TRANSPORT_REAL_ISNOTUSED)
                throw new EnergyproSystemException("Транспорт " + transportRealObj.name + " заборонено використовувати");

            if(transportRealObj.isOnDuty != ENConsts.TRANSPORT_REAL_ISONDUTY)
                throw new EnergyproSystemException("Транспорт " + transportRealObj.name + " не є черговим. Ця функція доступна тільки для нього.");


            object.numberGen = "" + objectDAO._collectAutoIncrementNumber();
            object.transportReal.code = lastSheet.transportReal.code;
            object.finWorker.code = lastSheet.finWorker.code;
            object.department.code = lastSheet.department.code;
            object.workModeRef.code = lastSheet.workModeRef.code;
            object.setDomain_info(null);
            object.statusRef.code = ENTravelSheetStatus.GOOD;
            object.typeRef.code = lastSheet.typeRef.code;
            object.dateEdit = new Date();
            object.userGen = getUserProfile().userName;
            object.speedometerFinal = null;
            object.isPrinted = 0;

            logic.checkUniqueSheet(object);

            ENTravelSheet prevSheet = logic.getPrevSheet(object);
            if ( (prevSheet != null) && ((object.statusRef.code == ENTravelSheetStatus.GOOD) || (object.statusRef.code == ENTravelSheetStatus.PLAN)))
            {
                if ((prevSheet.statusRef.code != ENTravelSheetStatus.CLOSED) && (prevSheet.statusRef.code != ENTravelSheetStatus.WRITINGOFF_GSM))
                {
                    if (object.typeRef.code != ENTravelSheetType.TRAKTOR){
                        object.speedometerStart = null;}
                    object.fuelCounterStart = null;
                }
                else
                {
                    if (object.typeRef.code != ENTravelSheetType.TRAKTOR){
                        object.speedometerStart = prevSheet.speedometerFinal;}
                    object.fuelCounterStart = prevSheet.fuelCounterFinal;
                }
            }

            int objCode = objectDAO.add(object);


            if ( prevSheet != null ){
                if ((prevSheet.statusRef.code == ENTravelSheetStatus.CLOSED) || (prevSheet.statusRef.code == ENTravelSheetStatus.WRITINGOFF_GSM))
                {
                ENTravelSheetFuelRemainsDAO remDAO = new ENTravelSheetFuelRemainsDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                ENTravelSheetFuelRemainsFilter remFilter = new ENTravelSheetFuelRemainsFilter();
                remFilter.realTransport.code = object.transportReal.code;
                remFilter.travelSheetRef.code = prevSheet.code;
                ENTravelSheetFuelRemainsShortList remList = remDAO.getScrollableFilteredList(remFilter, 0, -1);
                for (int j=0; j<remList.totalCount; j++){
                    ENTravelSheetFuelRemains fr = new ENTravelSheetFuelRemains();
                    fr.travelSheetRef.code = objCode;
                    fr.realTransport.code = object.transportReal.code;
                    fr.dateGen = object.dateStart;
                    fr.fuelTypeRef.code = remList.get(j).fuelTypeRefCode;
                    fr.travelSheetFuelTypeRef.code = remList.get(j).travelSheetFuelTypeRefCode;

                    fr.countGenStart = remList.get(j).countGenFinal;
                    fr.sumGenStart = remList.get(j).sumGenFinal;
                    fr.priceGenStart = remList.get(j).priceGenFinal;

                    fr.countGenIn = fr.countGenOut = fr.sumGenIn = fr.sumGenOut = fr.priceGenIn = fr.priceGenOut = new BigDecimal(0);

                    fr.countGenFinal = fr.countGenStart;
                    fr.sumGenFinal = fr.sumGenStart;
                    fr.priceGenFinal = fr.priceGenStart;

                    remDAO.add(fr);
                }
                }
            }
            //}

            if (object.numberGen.equals("Auto")){
                throw new EnergyproSystemException("########## - Auto - помилка з номером ПЛ ...");
            }


        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTravelSheet%} object.",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {
            try {
                if (finConn != null && ! finConn.isClosed()) {
                    finConn.close();
                    finConn = null;
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



  public ENTravelSheetControllerEJB() {}


} // end of EJB Controller for ENTravelSheet