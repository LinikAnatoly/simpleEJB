package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringJoiner;
import java.util.Vector;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDeliveryOrderDAO;
import com.ksoe.energynet.dataminer.ENDistanceDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTransportItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportOrder2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportOrder2TravelDAO;
import com.ksoe.energynet.dataminer.ENTransportOrderDAO;
import com.ksoe.energynet.dataminer.ENTransportRealRepairDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.ejb.ENDeliveryOrderController;
import com.ksoe.energynet.ejb.ENDeliveryOrderControllerHome;
import com.ksoe.energynet.ejb.ENTransportItemController;
import com.ksoe.energynet.ejb.ENTransportItemControllerHome;
import com.ksoe.energynet.ejb.ENTravelSheetController;
import com.ksoe.energynet.ejb.ENTravelSheetControllerHome;
import com.ksoe.energynet.ejb.ENTravelSheetItemController;
import com.ksoe.energynet.ejb.ENTravelSheetItemControllerHome;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.util.Tools.Transformator;
import com.ksoe.energynet.valueobject.ENDeliveryOrder;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENTransportOrder;
import com.ksoe.energynet.valueobject.ENTransportOrder2Travel;
import com.ksoe.energynet.valueobject.ENTransportOrderStatus;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.FINWorkerKind;
import com.ksoe.energynet.valueobject.brief.ENDeliveryOrderShort;
import com.ksoe.energynet.valueobject.brief.ENTransportItemShort;
import com.ksoe.energynet.valueobject.brief.ENTransportOrder2TransportItemShort;
import com.ksoe.energynet.valueobject.brief.ENTransportOrderShort;
import com.ksoe.energynet.valueobject.filter.ENDeliveryOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENDistanceFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportOrder2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportOrder2TravelFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRealRepairFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENDeliveryOrderShortList;
import com.ksoe.energynet.valueobject.lists.ENDistanceShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItem2TransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportOrder2TransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportOrder2TravelShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportOrderShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportRealRepairShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItem2TransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.dataminer.TKTransportDAO;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.valueobject.TKTransportReal;
import com.ksoe.techcard.valueobject.filter.TKTransportFilter;


public class TransportOrderLogic extends LogicModule{


    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public TransportOrderLogic(Connection connection, UserProfile userProfile)
    {
        super(connection, userProfile);
    }

    public void checkDates(ENTransportOrder object)
    {
        try
        {
            ElementLogic elemLogic = new ElementLogic(connection, userProfile);
            WorkOrderLogic woLogic = new WorkOrderLogic(connection, userProfile);
            ENWorkOrder woObj = woLogic.getWorkOrderByPlanCode(object.planRef.code);

            ENPlanWork pObj = this.getPlanWorkByTransportOrderCode(object.code);
            int etype = elemLogic.getElementTypeByPlan(pObj);

            if (object.timeStart.after(object.timeFinal) && object.dateFinal.equals(object.dateStart)){
                throw new EnergyproSystemException("\n\n"
                		+ "Дати транспортної заявки повинні бути у хронологічній послідовності. \n"
                		+ "Дата виїзду = " +  new SimpleDateFormat("dd.MM.yyyy::HH.mm.ss").format(object.timeStart) + ". \n"
                		+ "Дата повернення = " + new SimpleDateFormat("dd.MM.yyyy::HH.mm.ss").format(object.timeFinal) + ".");
            }
            /*Проверка - дата начала transportorder'a должна быть равна наряду*/

            Date dateStart = Tools.clearTimeOfDate(object.dateStart);
            Date dateFinal = Tools.clearTimeOfDate(object.dateFinal);
            Date woDate = Tools.clearTimeOfDate(woObj.dateGen);


            if(woDate.compareTo(dateStart) != 0)
            {
                throw new EnergyproSystemException("Дата початку повинна дорівнювати даті наряда-завдання");
            }

            /*Конечная дата должна быть в пределах одного дня от даты наряда*/
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(woObj.dateGen);
            calendar.add(Calendar.DATE, -1);

            Date beforeDate = Tools.clearTimeOfDate(calendar.getTime());

            /*NET-3300*/
            if(dateFinal.before(beforeDate) && (etype != ENElementType.CARGO_OBJECT && pObj.typeRef.code != ENPlanWorkType.TRUCKING))
                throw new EnergyproSystemException("Дата закінчення повинна бути в межах одного дня від дати плану");

            calendar.setTime(woObj.dateGen);
            calendar.add(Calendar.DATE, 1);

            Date afterDate = Tools.clearTimeOfDate(calendar.getTime());

            /*NET-3300*/
            if(dateFinal.after(afterDate) && (etype != ENElementType.CARGO_OBJECT && pObj.typeRef.code != ENPlanWorkType.TRUCKING))
                throw new EnergyproSystemException("Дата закінчення повинна бути в межах одного дня від дати плану");

        }
        catch(PersistenceException e)
        {
            throw new EnergyproSystemException(e);
        }



    }

    public BigDecimal getSumDistancesByTransportOrder(int transportOrderCode) throws PersistenceException
    {
        BigDecimal result = new BigDecimal(0.0);

        ENTransportOrder2TransportItemDAO totiDAO = new ENTransportOrder2TransportItemDAO(connection, userProfile);
        ENTransportOrder2TransportItemFilter totiFilter = new ENTransportOrder2TransportItemFilter();


        totiFilter.transportOrder.code = transportOrderCode;
        ENTransportOrder2TransportItemShortList totiList = totiDAO.getScrollableFilteredList(totiFilter, 0, -1);

        for(int i = 0; i < totiList.totalCount; i++)
        {
            result = result.add(getDistancesByTransportItem(totiList.get(i).transportItemCode));
        }

        return result;
    }

    public BigDecimal getDistancesByTransportItem(int transportItemCode) throws PersistenceException
    {
        BigDecimal distance_sum = new BigDecimal(0.0);

        ENDistanceDAO distanceDAO = new ENDistanceDAO(connection, userProfile);
        ENDistanceFilter distanceFilter = new ENDistanceFilter();

        distanceFilter.transportItemRef.code = transportItemCode;
        ENDistanceShortList distanceList = distanceDAO.getScrollableFilteredList(distanceFilter, 0, -1);

        for (int n = 0; n < distanceList.totalCount; n++ )
        {
            distance_sum = distance_sum.add(distanceList.get(n).distance);
        }
        return distance_sum;
    }

    public BigDecimal getSumMachineHoursByTransportOrder(int transportOrderCode) throws PersistenceException
    {
        BigDecimal result = new BigDecimal(0.0);

        ENTransportOrder2TransportItemDAO totiDAO = new ENTransportOrder2TransportItemDAO(connection, userProfile);
        ENTransportOrder2TransportItemFilter totiFilter = new ENTransportOrder2TransportItemFilter();
        totiFilter.transportOrder.code = transportOrderCode;
        ENTransportOrder2TransportItemShortList totiList = totiDAO.getScrollableFilteredList(totiFilter, 0, -1);

        for(int i = 0; i < totiList.totalCount; i++)
        {
            result = result.add( getSumMachineHoursByTransportItem(totiList.get(i).transportItemCode));
        }

        return result;
    }

    public BigDecimal getSumMachineHoursByTransportItem(int transportItemCode) throws PersistenceException
    {
        BigDecimal hours_sum = new BigDecimal(0.0);
        ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
        ENTransportItem tiObj = new ENTransportItem();
        tiObj = tiDAO.getObject(transportItemCode);
        hours_sum = tiObj.countWorkFact;
        return hours_sum;
    }



    public void checkTransportOrderInTravelSheet(int transportOrderCode) throws PersistenceException
    {

        ENTransportOrder2TravelDAO to2ts = new ENTransportOrder2TravelDAO(connection,userProfile);
        TKTransportRealDAO transportRealDAO = new TKTransportRealDAO(connection, userProfile);
        ENTransportOrder2TravelFilter to2tsFilter = new ENTransportOrder2TravelFilter();
        to2tsFilter.transportorder.code = transportOrderCode;
        ENTransportOrder2TravelShortList toList = to2ts.getScrollableFilteredList(to2tsFilter, 0, -1);

    if(toList.totalCount > 0){

            ENTransportOrderDAO tsDAO = new ENTransportOrderDAO(connection,userProfile);
            TKTransportReal trObj = transportRealDAO.getObject(tsDAO.getShortObjectWithoutSegregation(transportOrderCode).transportRealCode);

            throw new EnergyproSystemException("Заявка № "+toList.get(0).transportorderNumbergen+" зв'язана з подорожнім листом "+toList.get(0).travelsheetNumberGen +
                    " для транспорту "+trObj.name+" номер: "+trObj.gosNumber);}

    }

    public void checkDriverInTravelSheet(ENTransportOrder toObj, String driverTabNumber, Date travelSheetDate) throws PersistenceException
    {
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);
        ENTransportOrder prevObj = this.getPrevTransportOrderForDriver(toObj, driverTabNumber);
        ENTransportOrder nextObj = this.getNextTransportOrderForDriver(toObj, driverTabNumber);


        /*ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(connection, userProfile);
        ENTravelSheetFilter tsFilter = new ENTravelSheetFilter();
        tsFilter.conditionSQL = " ENTRAVELSHEET.FINWORKERCODE IN (SELECT CODE FROM FINWORKER WHERE TABNUMBER = " + driverTabNumber + ") and " +
                                " ENTRAVELSHEET.STATUSREFCODE IN (" + ENTravelSheetStatus.FACT + ", "+ ENTravelSheetStatus.GOOD + ", "+ ENTravelSheetStatus.PLAN + ")";
        tsFilter.dateStart = travelSheetDate;
        ENTravelSheetShortList tsList = tsDAO.getScrollableFilteredList(tsFilter, 0, -1);

        if( tsList.totalCount > 0){throw new EnergyproSystemException("Цей водій вже знаходиться в незакритому ПЛ " + tsList.get(0).numberGen);}*/

            /*Проверка периода времени для заявки относительно водителя*/
        String orderNames = "";
        String condition = " select entransportorder.code  \n" +
        " from entransportorder, entransportorder2travl, entravelsheet, finworker  \n" +
        " where to_timestamp(to_char(entransportorder.timestart, 'dd.mm.yyyy hh24:mi:ss'), 'dd.mm.yyyy hh24:mi:ss') >=  \n" +
        " to_timestamp('" +  new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(toObj.timeStart).toString() + "','dd.mm.yyyy hh24:mi:ss') \n" +
        " and to_timestamp(to_char(entransportorder.timefinal, 'dd.mm.yyyy hh24:mi:ss'), 'dd.mm.yyyy hh24:mi:ss') <= \n" +
        " to_timestamp('" +  new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(toObj.timeFinal).toString() + "','dd.mm.yyyy hh24:mi:ss') \n" +
        " and entransportorder2travl.transportordercode = entransportorder.code \n " +
        " and entravelsheet.code = entransportorder2travl.travelsheetcode \n" +
        " and entravelsheet.finworkercode = finworker.code \n" +
        " and entransportorder.code <> " + toObj.code + " \n " +
        " and finworker.tabnumber = '" + driverTabNumber + "' \n " +
        " and entransportorder.parentrefcode is null \n ";


        ENTransportOrderFilter toFilter = new ENTransportOrderFilter();


        toFilter.conditionSQL = "ENTRANSPORTORDER.CODE IN ("+condition+")";

        ENTransportOrderShortList toList = toDAO.getScrollableFilteredList(toFilter, 0, -1);

        if(toList.totalCount > 0)
        {
            for(int i = 0; i < toList.totalCount; i++)
            {
                if(orderNames.length() > 0)
                    orderNames = orderNames + ", " + toList.get(i).numbergen;
                else
                    orderNames = toList.get(i).numbergen;
            }

            throw new EnergyproSystemException("На час заявки № " + toObj.numbergen + " вже є заявки " + orderNames + ", де працює водій з табельним номером " + driverTabNumber);
        }


            if(prevObj != null)
            {
                if(prevObj.timeFinal.after(toObj.timeStart))
                    throw new EnergyproSystemException("Час початку заявки № " + toObj.numbergen + " повинно бути більше за час закінчення попередньої заявки з цим водієм № " + prevObj.numbergen);
            }

            if(nextObj != null)
            {
                if(nextObj.timeStart.before(toObj.timeFinal))
                    throw new EnergyproSystemException("Час закінчення заявки № " + toObj.numbergen + " повинно бути меньшим за час початку наступної заявки з цим водієм № " + nextObj.numbergen);
            }




    }
    public void removeTransportOrderItemsFromTravelSheet(int transportOrderCode) throws PersistenceException, NamingException, RemoteException, CreateException
    {
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection,userProfile);
        ENTransportOrder2TravelDAO totDAO = new ENTransportOrder2TravelDAO(connection, userProfile);
        ENTransportOrder2TransportItemDAO to2tiDAO = new ENTransportOrder2TransportItemDAO(connection,userProfile);
        ENTravelSheetItem2TransportItemDAO ts2tiDAO = new ENTravelSheetItem2TransportItemDAO(connection,userProfile);
        ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(connection, userProfile);
        ENTransportOrder2TransportItemFilter to2tiFilter = new ENTransportOrder2TransportItemFilter();
        ENTravelSheetItem2TransportItemFilter ts2tiFilter = new ENTravelSheetItem2TransportItemFilter();
        to2tiFilter.transportOrder.code = transportOrderCode;




        int travelSheetCode = Integer.MIN_VALUE;

        /*Удаление совместной доставки, созданной перекручиванием заявок (по parentrefcode)*/
        this.deleteDeliveryForTransportOrder(transportOrderCode);

        ENTransportOrder toObj = toDAO.getObject(transportOrderCode);
        /*Изменение статуса транспортной заявки*/
        toObj.transportOrderStatus.code = ENTransportOrderStatus.GOOD;
        /*Удаление привязки к реальному транспорту для заявки*/
        toObj.transportReal.code = Integer.MIN_VALUE;

        toDAO.save(toObj);

        if(toObj.parentRef.code != Integer.MIN_VALUE)
            throw new EnergyproSystemException("Заявка № "+toObj.numbergen + " зв'язана з іншою заявкою й буде опрацьована автоматично при опрацюванні тієї");
        else
            this.updateStatusForTransportOrder(toObj.code, ENTransportOrderStatus.GOOD);

        /*Update привязки к реальному транспорту в null*/
        this.updateTransportRealInTransportOrder(toObj.code, Integer.MIN_VALUE);

        Context context = new InitialContext();
        Object objRef = null;

        objRef = context.lookup(ENTravelSheetItemController.JNDI_NAME);
        ENTravelSheetItemControllerHome travelSheetItemHome = (ENTravelSheetItemControllerHome) PortableRemoteObject.narrow(objRef, ENTravelSheetItemControllerHome.class);
        ENTravelSheetItemController travelSheetItemController = travelSheetItemHome.create();

        ENTransportOrder2TransportItemShortList to2tiList = to2tiDAO.getScrollableFilteredList(to2tiFilter, 0, -1);
        if (to2tiList.totalCount == 0) {throw new EnergyproSystemException("В этой заявке нет ни одной строки!");}

        for(int i = 0; i < to2tiList.totalCount; i++){
        ts2tiFilter.transportItemRef.code = to2tiList.get(i).transportItemCode;
        ENTravelSheetItem2TransportItemShortList ts2tiList = ts2tiDAO.getScrollableFilteredList(ts2tiFilter, 0, -1);

        if (ts2tiList.totalCount > 0) {
            for(int j = 0; j < ts2tiList.totalCount; j++)
            {
                travelSheetItemController.removeForTransportOrder(ts2tiList.get(j).travelSheetItemRefCode);
                System.out.println("Deleting TransportOrderItemCode: " + to2tiList.get(i).transportItemCode +
                                ", Deleting TravelSheetItemCode: " + ts2tiList.get(j).travelSheetItemRefCode);}
            }
        }

        /*Удаление связки транспортная заявка - путевой*/
        ENTransportOrder2TravelFilter totFilter = new ENTransportOrder2TravelFilter();
        totFilter.transportorder.code = transportOrderCode;
        ENTransportOrder2TravelShortList totList = totDAO.getFilteredList(totFilter);

        if(totList.totalCount > 0)
            travelSheetCode = totList.get(0).travelsheetCode;

        for(int i = 0; i < totList.totalCount; i++)
        {
            totDAO.remove(totList.get(i).code);
        }

        this.removeTransportOrderItemsFromTravelByParent(transportOrderCode);

        /*Перебивание времени на путевом листе исходя из максимального времени завершения и минимального времени начала заявок в путевом*/

        //if (! userProfile.getUserName().toLowerCase().equals("energynet")) {
            objRef = context.lookup(ENTravelSheetController.JNDI_NAME);
            ENTravelSheetControllerHome travelSheetHome = (ENTravelSheetControllerHome) PortableRemoteObject.narrow(objRef, ENTravelSheetControllerHome.class);
            ENTravelSheetController travelSheetController = travelSheetHome.create();
            ENTransportOrderShortList tsList = this.getListsOfTransportOrderByTravelSheetCode(travelSheetCode);
            if(tsList.totalCount > 0)
            {
                ENTravelSheet tsObj = tsDAO.getObject(travelSheetCode);
                Date maxDateFinal = this.getMaxTimeFinal(tsList);
                Date minDateStart = this.getMinTimeStart(tsList);

                Calendar calendar = Calendar.getInstance();
                calendar.setTime(minDateStart);
                calendar.clear(Calendar.SECOND);
                calendar.clear(Calendar.MILLISECOND);
                calendar.clear(Calendar.HOUR);
                calendar.clear(Calendar.MINUTE);
                calendar.clear(Calendar.HOUR_OF_DAY);

                calendar.set(Calendar.HOUR, 0);
                calendar.set(Calendar.HOUR_OF_DAY,0);
                calendar.set(Calendar.MILLISECOND, 0);
                calendar.set(Calendar.MINUTE, 0);
                calendar.set(Calendar.SECOND, 0);


                tsObj.dateStart = calendar.getTime();

                Calendar cal = Calendar.getInstance();
                cal.setTime(maxDateFinal);
                cal.clear(Calendar.SECOND);
                cal.clear(Calendar.MILLISECOND);
                cal.clear(Calendar.HOUR);
                cal.clear(Calendar.MINUTE);
                cal.clear(Calendar.HOUR_OF_DAY);

                cal.set(Calendar.HOUR, 0);
                cal.set(Calendar.HOUR_OF_DAY,0);
                cal.set(Calendar.MILLISECOND, 0);
                cal.set(Calendar.MINUTE, 0);
                cal.set(Calendar.SECOND, 0);


                tsObj.dateFinal = cal.getTime();

                tsObj.timeStart = minDateStart;
                tsObj.timeFinal = maxDateFinal;
                travelSheetController.save(tsObj);
            }
        //}






    }


    public String getStringTransportItemCodes(int transportOrderCode) throws PersistenceException {
        /*Вытягивает коды entransporitem'ом по коду заявки entransportorder*/
        ENTransportOrder2TransportItemDAO totiDAO = new ENTransportOrder2TransportItemDAO(connection,userProfile);
        ENTransportOrder2TransportItemFilter totiFilter = new ENTransportOrder2TransportItemFilter();
        totiFilter.transportOrder.code = transportOrderCode;
        ENTransportOrder2TransportItemShortList totiList = totiDAO.getScrollableFilteredList(totiFilter, 0, -1);
        return totiList.list.stream().map(ENTransportOrder2TransportItemShort::getTransportItemCode).map(Object::toString).collect(Collectors.joining(","));
    }

    /**
    *
    * Вставляет совместные доставки для связанных транспортных заявок
    *
    * @param parentOrderCode код родительской транспортной заявки
    * @throws EnergyProSystemException если перед вставкой совместной доставки на транспортах уже была совместная доставка,
    * если как-то выбрали родительской заявкой саму заявку, если не найдена родительская заявкаб
    * Для бригадного транспорту кілометраж заноситься тільки на одну роботу
    * @throws PersistenceException
    * @throws NamingException
    * @throws RemoteException
    * @throws CreateException
    */
    public void insertDeliveryForTransportOrder(int parentOrderCode) throws PersistenceException, NamingException, RemoteException, CreateException
    {
        /*Вставка связки entransportitem'ом через endeliveryorder
        * по связкам транспортных заявок*/
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection,userProfile);
        ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
        ENDistanceDAO diDAO = new ENDistanceDAO(connection, userProfile);

        ENTransportOrder order = toDAO.getObject(parentOrderCode);

        /*1. Вытягивание всех child-овских заявок*/
        ENTransportOrderFilter childFilter = new ENTransportOrderFilter();
        childFilter.parentRef.code = order.code;
        ENTransportOrderShortList childList = toDAO.getScrollableFilteredList(childFilter, 0, -1);

        if(childList.totalCount > 0)
        {
            for(int i = 0; i < childList.totalCount; i++)
            {

                if(childList.get(i).code == order.code)
                    throw new EnergyproSystemException("Помилка у зв'язці заявок № "+childList.get(i).numbergen + " та № "+order.numbergen);

                this.insertDeliveryForTransportOrder(childList.get(i).code);
            }
        }
//          else
//          {
            if(order.parentRef.code != Integer.MIN_VALUE)
            {
            ENTransportOrderFilter parentFilter = new ENTransportOrderFilter();
            parentFilter.code = order.parentRef.code;

            ENTransportOrderShortList parentList = toDAO.getScrollableFilteredList(parentFilter, 0, -1);

            if(parentList.totalCount > 1)
            {
                throw new EnergyproSystemException("Помилка у кількості батьківських заявок для заявки № "+order.code);
            }

            if(parentList.totalCount == 1)
            {
                int transportItemChildCode = Integer.MIN_VALUE;

                boolean isMoreThanOneChild = false;

                ENTransportItemFilter childTiFilter = new ENTransportItemFilter();
                childTiFilter.conditionSQL = " ENTRANSPORTITEM.CODE IN ( "+
                    this.getStringTransportItemCodes(order.code)+ ")";
                ENTransportItemShortList childTiList = tiDAO.getScrollableFilteredList(childTiFilter, 0, -1);

                /*Выбор кода entransportitem'a child-овской заявки для совместной доставки*/
                for(int i = 0; i < childTiList.totalCount; i++)
                {
                    BigDecimal dist = getDistancesByTransportItem(childTiList.get(i).code);
                    if(dist.compareTo(new BigDecimal(0)) == 0)
                        {
                        }
                    else
                        {
                        if(isMoreThanOneChild)
                            {
                                throw new EnergyproSystemException("Для бригадного транспорту кілометраж заноситься тільки на одну роботу");
                            }
                            isMoreThanOneChild = true;

                            transportItemChildCode = childTiList.get(i).code;


                        }
                }

                /*Если есть entrasnportitem'ы с нулевыми дистанциями, но со связанными endistance'ами, то
                * привязывать к таким сумисну доставку*/
                for(int i = 0; i < childTiList.totalCount; i++)
                {
                    ENDistanceFilter childDiFilter = new ENDistanceFilter();
                    childDiFilter.transportItemRef.code = childTiList.get(i).code;

                    ENDistanceShortList childDiList = diDAO.getScrollableFilteredList(childDiFilter, 0, -1);

                    if(childDiList.totalCount > 0 && transportItemChildCode == Integer.MIN_VALUE)
                    {
                        transportItemChildCode = childTiList.get(i).code;
                    }

                }

                /*Выбор кода entransportitem'a родительсой заявки для совместной доставки*/
                int transportItemParentCode = Integer.MIN_VALUE;

                boolean isMoreThanOneParent = false;

                ENTransportItemFilter parentTiFilter = new ENTransportItemFilter();
                parentTiFilter.conditionSQL = " ENTRANSPORTITEM.CODE IN ( "+this.getStringTransportItemCodes(parentList.get(0).code)+")";
                ENTransportItemShortList parentTiList = tiDAO.getScrollableFilteredList(parentTiFilter, 0, -1);

                for(int i = 0; i < parentTiList.totalCount; i++)
                {
                    BigDecimal dist = getDistancesByTransportItem(parentTiList.get(i).code);
                    if(dist.compareTo(new BigDecimal(0)) == 0)
                        {
                        }
                    else
                        {
                        if(isMoreThanOneParent)
                            {
                                throw new EnergyproSystemException("Для бригадного транспорту кілометраж заноситься тільки на одну роботу");
                            }
                            isMoreThanOneParent = true;

                            transportItemParentCode = parentTiList.get(i).code;


                        }


                }

                /*Если есть entrasnportitem'ы с нулевыми дистанциями, но со связанными endistance'ами, то
                * привязывать к таким сумисну доставку (для parent-овских заявок у которых тоже есть parent
                * в свою очередь)*/
                for(int i = 0; i < parentTiList.totalCount; i++)
                {
                    ENDistanceFilter parentDiFilter = new ENDistanceFilter();
                    parentDiFilter.transportItemRef.code = parentTiList.get(i).code;

                    ENDistanceShortList parentDiList = diDAO.getScrollableFilteredList(parentDiFilter, 0, -1);

                    if(parentDiList.totalCount > 0 && transportItemParentCode == Integer.MIN_VALUE && parentList.get(0).parentRefCode != Integer.MIN_VALUE)
                    {
                    transportItemParentCode = parentTiList.get(i).code;
                    }
                }

                if(transportItemParentCode == Integer.MIN_VALUE || transportItemChildCode == Integer.MIN_VALUE)
                {
                    throw new EnergyproSystemException("Помилка у дистанціях для заявок! Перевірте відстані у плані!");
                }

                /*Вставка совместной доставки*/
                ENDeliveryOrder doObj = new ENDeliveryOrder();

                doObj.code = Integer.MIN_VALUE;
                doObj.transportInRef.code = transportItemChildCode;
                doObj.transportOut.code = transportItemParentCode;
                doObj.commentGen = "Из заявок childcode = "+order.code + " и parentcode = "+parentList.get(0).code;

                    Context context = new InitialContext();
                    Object objRef = null;
                    objRef = context.lookup(ENDeliveryOrderController.JNDI_NAME);
                    ENDeliveryOrderControllerHome deliveryOrderHome = (ENDeliveryOrderControllerHome) PortableRemoteObject.narrow(objRef, ENDeliveryOrderControllerHome.class);
                    ENDeliveryOrderController deliveryOrderController = deliveryOrderHome.create();

                    deliveryOrderController.addForTransportOrder(doObj);

            }
        }

        // }
    }

	public void deleteDeliveryForTransportOrder(int parentOrderCode)
			throws PersistenceException, NamingException, RemoteException, CreateException {
		/*
		 * Вставка связки entransportitem'ом через endeliveryorder по связкам
		 * транспортных заявок
		 */
		ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);
		ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
		ENDeliveryOrderDAO doDAO = new ENDeliveryOrderDAO(connection, userProfile);
		ENTransportItem2TransportItemDAO transportItem2TransportItemDao = new ENTransportItem2TransportItemDAO(
				connection, userProfile);

		ENTransportOrder order = toDAO.getObject(parentOrderCode);

		/* 1. Вытягивание всех child-овских заявок */
		ENTransportOrderFilter childFilter = new ENTransportOrderFilter();
		childFilter.parentRef.code = order.code;
		ENTransportOrderShortList childList = toDAO.getScrollableFilteredList(childFilter, 0, -1);

		if (childList.totalCount > 0) {
			for (ENTransportOrderShort childOrder : childList.list) {
				if (childOrder.code == order.code) {
					throw new EnergyproSystemException(
							"Помилка у зв'язці заявок № " + childOrder.numbergen + " та № " + order.numbergen);
				}
				this.deleteDeliveryForTransportOrder(childOrder.code);
			}
		}

		if (order.parentRef.code != Integer.MIN_VALUE) {
			ENTransportOrderFilter parentFilter = new ENTransportOrderFilter();
			parentFilter.code = order.parentRef.code;

			ENTransportOrderShortList parentList = toDAO.getScrollableFilteredList(parentFilter, 0, -1);

			if (parentList.totalCount > 1) {
				throw new EnergyproSystemException(
						"Помилка у кількості батьківських заявок для заявки № " + order.code);
			}

		}

		/* Удаление совместной доставки */
		Context context = new InitialContext();
		Object objRef = context.lookup(ENDeliveryOrderController.JNDI_NAME);
		ENDeliveryOrderControllerHome deliveryOrderHome = (ENDeliveryOrderControllerHome) PortableRemoteObject
				.narrow(objRef, ENDeliveryOrderControllerHome.class);
		ENDeliveryOrderController deliveryOrderController = deliveryOrderHome.create();

		ENTransportItemFilter tiFilter = new ENTransportItemFilter();
		tiFilter.conditionSQL = " ENTRANSPORTITEM.CODE IN ( " + this.getStringTransportItemCodes(order.code) + ")";
		ENTransportItemShortList tiList = tiDAO.getScrollableFilteredList(tiFilter, 0, -1);

		ENDeliveryOrderFilter doFilter = new ENDeliveryOrderFilter();

		for (ENTransportItemShort item : tiList.list) {
			doFilter.conditionSQL = " d.CODE IN (SELECT ENDELIVERYORDER.CODE FROM ENDELIVERYORDER WHERE "
					+ "TRANSPORTINREFCODE = " + item.code + " OR TRANSPORTOUTCODE = " + item.code + ")";

			ENDeliveryOrderShortList doList = doDAO.getScrollableFilteredList(doFilter, 0, -1);

			for (ENDeliveryOrderShort delivery : doList.list) {
				deliveryOrderController.remove(delivery.code);
			}

			// SUPP-108434 Проблема с совместной доставки из-за того, что она не удалялась на факте
			ENTransportItem2TransportItemFilter factItemFilter = new ENTransportItem2TransportItemFilter();
			factItemFilter.inRef.code = item.code;
			ENTransportItem2TransportItemShortList factTransportItemShortList = transportItem2TransportItemDao.getScrollableFilteredList(factItemFilter, 0, -1);
			if (factTransportItemShortList.totalCount > 1)
				throw new SystemException(String.format(
						"SUPP-108434 Помилка у кількості транспорту на факті для транспорту на плані (код %d - кількість %d) ",
						item.code, factTransportItemShortList.totalCount));
			if (factTransportItemShortList.totalCount > 0) {
				int factTransportItemCode = factTransportItemShortList.get(0).outRefCode;
				doFilter.conditionSQL = " d.CODE IN (SELECT ENDELIVERYORDER.CODE FROM ENDELIVERYORDER WHERE "
						+ "TRANSPORTINREFCODE = " + factTransportItemCode + " OR TRANSPORTOUTCODE = "
						+ factTransportItemCode + ")";
				doList = doDAO.getScrollableFilteredList(doFilter, 0, -1);
				for (ENDeliveryOrderShort delivery : doList.list) {
					deliveryOrderController.remove(delivery.code);
				}
			}
		}
	}

    public void updateTransportOrderStatusByTravelSheetCode(int travelSheetCode, int transportOrderStatusCode) throws PersistenceException
    {
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);

        ENTransportOrder2TravelDAO to2tsDAO = new ENTransportOrder2TravelDAO(connection, userProfile);
        ENTransportOrder2TravelFilter to2tsFilter = new ENTransportOrder2TravelFilter();
        to2tsFilter.travelsheet.code = travelSheetCode;
        ENTransportOrder2TravelShortList to2tsList = to2tsDAO.getScrollableFilteredList(to2tsFilter, 0, -1);
        if (to2tsList.totalCount > 0)
        {
        for (int i = 0; i < to2tsList.totalCount; i++)
            {
            ENTransportOrder toObj = toDAO.getObjectNOSEGR(to2tsList.get(i).transportorderCode);
            toObj.transportOrderStatus.code = transportOrderStatusCode;
            toDAO.save(toObj);
            }
        }
    }

    public void updateStatusForTransportOrder(int parentOrderCode, int statusCode) throws PersistenceException, NamingException, RemoteException, CreateException
    {
        /*изменение статусов всем child'овским заявкам
        * по коду главной заявки*/
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection,userProfile);
        ENTransportOrder order = toDAO.getObject(parentOrderCode);

        /*1. Вытягивание всех child-овских заявок*/
        ENTransportOrderFilter childFilter = new ENTransportOrderFilter();
        childFilter.parentRef.code = order.code;
        ENTransportOrderShortList childList = toDAO.getScrollableFilteredList(childFilter, 0, -1);

        if(childList.totalCount > 0)
        {
            for(int i = 0; i < childList.totalCount; i++)
            {

                if(childList.get(i).code == order.code)
                    throw new EnergyproSystemException("Помилка у зв'язці заявок № "+childList.get(i).numbergen + " та № "+order.numbergen);

                this.updateStatusForTransportOrder(childList.get(i).code, statusCode);
            }
        }
        //else
        //{
            if(order.parentRef.code != Integer.MIN_VALUE)
            {
                ENTransportOrderFilter parentFilter = new ENTransportOrderFilter();
                parentFilter.code = order.parentRef.code;

                ENTransportOrderShortList parentList = toDAO.getScrollableFilteredList(parentFilter, 0, -1);

                if(parentList.totalCount > 1)
                    {
                        throw new EnergyproSystemException("Помилка у кількості батьківських заявок для заявки № "+order.code);
                    }

                if(parentList.totalCount == 1)
                    {
                        order.transportOrderStatus.code = statusCode;
                        toDAO.save(order);
                    }
            }

        //}

    }


    public void updateTimeForTransportOrder(int parentOrderCode, Date dateStart, Date dateFinal, Date timeStart, Date timeFinal) throws PersistenceException, NamingException, RemoteException, CreateException
    {
        /*изменение времени всем child'овским заявкам
        * по коду главной заявки*/
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection,userProfile);
        ENTransportOrder order = toDAO.getObject(parentOrderCode);

        /*1. Вытягивание всех child-овских заявок*/
        ENTransportOrderFilter childFilter = new ENTransportOrderFilter();
        childFilter.parentRef.code = order.code;
        ENTransportOrderShortList childList = toDAO.getScrollableFilteredList(childFilter, 0, -1);

        if(childList.totalCount > 0)
        {
            for(int i = 0; i < childList.totalCount; i++)
            {

                if(childList.get(i).code == order.code)
                    throw new EnergyproSystemException("Помилка у зв'язці заявок № "+childList.get(i).numbergen + " та № "+order.numbergen);

                this.updateTimeForTransportOrder(childList.get(i).code, dateStart, dateFinal, timeStart, timeFinal);
            }
        }
        //else
        //{
            if(order.parentRef.code != Integer.MIN_VALUE)
            {
                ENTransportOrderFilter parentFilter = new ENTransportOrderFilter();
                parentFilter.code = order.parentRef.code;

                ENTransportOrderShortList parentList = toDAO.getScrollableFilteredList(parentFilter, 0, -1);

                if(parentList.totalCount > 1)
                    {
                        throw new EnergyproSystemException("Помилка у кількості батьківських заявок для заявки № "+order.code);
                    }

                if(parentList.totalCount == 1)
                    {
                    // 16.08.12 Из-за этого вылетает Optimistic locking !!!
                    /*
                        order.dateStart = dateStart;
                    order.dateFinal = dateFinal;
                    order.timeStart = timeStart;
                    order.timeFinal = timeFinal;

                        toDAO.save(order);
                        */
                    toDAO.updateTimeForTransportOrder(order.code, dateStart, dateFinal, timeStart, timeFinal);
                    }
            }

    //      }

    }

    public void insertTravelSheet2TransportOrder(int parentOrderCode, int travelSheetCode) throws PersistenceException, NamingException, RemoteException, CreateException
    {
        /*вставка связки Путевого Листа с Заявками
        * по коду главной заявки*/
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection,userProfile);
        ENTransportOrder2TravelDAO totDAO = new ENTransportOrder2TravelDAO(connection, userProfile);

        ENTransportOrder order = toDAO.getObject(parentOrderCode);

        /*1. Вытягивание всех child-овских заявок*/
        ENTransportOrderFilter childFilter = new ENTransportOrderFilter();
        childFilter.parentRef.code = order.code;
        ENTransportOrderShortList childList = toDAO.getScrollableFilteredList(childFilter, 0, -1);

        if(childList.totalCount > 0)
        {
            for(int i = 0; i < childList.totalCount; i++)
            {

                if(childList.get(i).code == order.code)
                    throw new EnergyproSystemException("Помилка у зв'язці заявок № "+childList.get(i).numbergen + " та № "+order.numbergen);

                this.insertTravelSheet2TransportOrder(childList.get(i).code, travelSheetCode);
            }
        }
        //else
        //{
            if(order.parentRef.code != Integer.MIN_VALUE)
            {
                ENTransportOrderFilter parentFilter = new ENTransportOrderFilter();
                parentFilter.code = order.parentRef.code;

                ENTransportOrderShortList parentList = toDAO.getScrollableFilteredList(parentFilter, 0, -1);

                if(parentList.totalCount > 1)
                    {
                        throw new EnergyproSystemException("Помилка у кількості батьківських заявок для заявки № "+order.code);
                    }

                if(parentList.totalCount == 1)
                    {
                    ENTransportOrder2Travel newTotObj = new ENTransportOrder2Travel();

                        newTotObj.code = Integer.MIN_VALUE;
                        newTotObj.transportorder.code = order.code;
                        newTotObj.travelsheet.code = travelSheetCode;

                        totDAO.add(newTotObj);

                    }
            }

        //}
    }
    public void updateTransportRealInTransportOrder(int parentOrderCode, int transportRealCode) throws PersistenceException, NamingException, RemoteException, CreateException
    {
        /*Вставка транспорта в заявки
        * по коду главной заявки*/
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection,userProfile);

        ENTransportOrder order = toDAO.getObject(parentOrderCode);

        /*1. Вытягивание всех child-овских заявок*/
        ENTransportOrderFilter childFilter = new ENTransportOrderFilter();
        childFilter.parentRef.code = order.code;
        ENTransportOrderShortList childList = toDAO.getScrollableFilteredList(childFilter, 0, -1);

        if(childList.totalCount > 0)
        {
            for(int i = 0; i < childList.totalCount; i++)
            {

                if(childList.get(i).code == order.code)
                    throw new EnergyproSystemException("Помилка у зв'язці заявок № "+childList.get(i).numbergen + " та № "+order.numbergen);

                this.updateTransportRealInTransportOrder(childList.get(i).code, transportRealCode);
            }
        }
        //else
        //{
            if(order.parentRef.code != Integer.MIN_VALUE)
            {
                ENTransportOrderFilter parentFilter = new ENTransportOrderFilter();
                parentFilter.code = order.parentRef.code;

                ENTransportOrderShortList parentList = toDAO.getScrollableFilteredList(parentFilter, 0, -1);

                if(parentList.totalCount > 1)
                    {
                        throw new EnergyproSystemException("Помилка у кількості батьківських заявок для заявки № "+order.code);
                    }

                if(parentList.totalCount == 1)
                {
                    order.transportReal.code = transportRealCode;
                    toDAO.save(order);
                    }
            }

        //}
    }

    public void setFINWorkerWithTransportReal(int parentOrderCode, FINWorker worker, int transportRealCode) throws PersistenceException, NamingException, RemoteException, CreateException
    {
        /*Вставка водителя и реального транспорта для entransportitem'ов для всех child-овских заявок
        * по коду главной заявки*/
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection,userProfile);
        ENTransportItemDAO transportItemDAO = new ENTransportItemDAO(connection, userProfile);

        ENTransportOrder order = toDAO.getObject(parentOrderCode);

            Context context = new InitialContext();
            Object objRef = context.lookup(ENTransportItemController.JNDI_NAME);
            ENTransportItemControllerHome transportItemHome = (ENTransportItemControllerHome) PortableRemoteObject.narrow(objRef, ENTransportItemControllerHome.class);
            ENTransportItemController transportItemController = transportItemHome.create();

        /*1. Вытягивание всех child-овских заявок*/
        ENTransportOrderFilter childFilter = new ENTransportOrderFilter();
        childFilter.parentRef.code = order.code;
        ENTransportOrderShortList childList = toDAO.getScrollableFilteredList(childFilter, 0, -1);

        if(childList.totalCount > 0)
        {
            for(int i = 0; i < childList.totalCount; i++)
            {

                if(childList.get(i).code == order.code)
                    throw new EnergyproSystemException("Помилка у зв'язці заявок № "+childList.get(i).numbergen + " та № "+order.numbergen);

                this.setFINWorkerWithTransportReal(childList.get(i).code, worker, transportRealCode);
            }
        }

        ENTransportItemFilter itemFilter = new ENTransportItemFilter();
        itemFilter.conditionSQL = "code in (SELECT transportitemcode from entrnsprtrdr2trnsprttm where transportordercode = " + order.code+")";
    int[] itemCodesList = transportItemDAO.getFilteredCodeArray(itemFilter, 0, -1);

        for(int i=0; i < itemCodesList.length; i++) {
            ENTransportItem tiObj = transportItemDAO.getObject(itemCodesList[i]);


            tiObj.finWorker.code = Integer.MIN_VALUE;
            tiObj.finWorker.name = worker.name;
            tiObj.finWorker.tabNumber = worker.tabNumber;
            tiObj.finWorker.positionCode = worker.positionCode;
            tiObj.finWorker.positionName = worker.positionName;
            tiObj.finWorker.departmentCode = worker.departmentCode;
            tiObj.finWorker.departmentName = worker.departmentName;
            tiObj.finWorker.priceGen = worker.priceGen;
            tiObj.finWorker.categor = worker.categor;
            tiObj.finWorker.finCode = worker.finCode;
            tiObj.finWorker.kindRef.code = FINWorkerKind.OTHER;
            // MDAX-441
            tiObj.finWorker.positionId = worker.positionId;

            tiObj.transportReal.code = transportRealCode;

            transportItemController.saveForTransportOrder(tiObj);



        }
    }

    public boolean checkPlanCompability(int transportOrderCodeIn, int transportOrderCodeOut) throws PersistenceException
    {
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);
        ENPlanWorkDAO pwDAO = new ENPlanWorkDAO(connection, userProfile);

        ENTransportOrder transportOrderObjIn = toDAO.getObject(transportOrderCodeIn);
        ENTransportOrder transportOrderObjOut = toDAO.getObject(transportOrderCodeOut);

        ENPlanWork planWorkObjIn = pwDAO.getObject(transportOrderObjIn.planRef.code);
        ENPlanWork planWorkObjOut = pwDAO.getObject(transportOrderObjOut.planRef.code);


        boolean result = true;


        if(planWorkObjIn.kind.code != planWorkObjOut.kind.code)
        {
            result = false;
        }


        return result;
    }

    public ENPlanWork getPlanWorkByTransportOrderCode(int transportOrderCode) throws PersistenceException
    {
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);
        ENPlanWorkDAO pwDAO = new ENPlanWorkDAO(connection, userProfile);

        ENTransportOrder transportOrderObj = toDAO.getObject(transportOrderCode);

        ENPlanWork planWorkObj = pwDAO.getObject(transportOrderObj.planRef.code);


        return planWorkObj;
    }

    public void removeTransportOrderItemsFromTravelByParent(int parentOrderCode) throws PersistenceException, NamingException, RemoteException, CreateException
    {
        /*удаление связки Путевого Листа с Заявками
        * по коду главной заявки*/
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection,userProfile);
        ENTransportOrder2TravelDAO totDAO = new ENTransportOrder2TravelDAO(connection, userProfile);
        ENTransportOrder2TransportItemDAO to2tiDAO = new ENTransportOrder2TransportItemDAO(connection,userProfile);
        ENTravelSheetItem2TransportItemDAO ts2tiDAO = new ENTravelSheetItem2TransportItemDAO(connection,userProfile);
        ENTransportOrder2TransportItemFilter to2tiFilter = new ENTransportOrder2TransportItemFilter();
        ENTravelSheetItem2TransportItemFilter ts2tiFilter = new ENTravelSheetItem2TransportItemFilter();


        ENTransportOrder order = toDAO.getObject(parentOrderCode);

        to2tiFilter.transportOrder.code = order.code;

        /*1. Вытягивание всех child-овских заявок*/
        ENTransportOrderFilter childFilter = new ENTransportOrderFilter();
        childFilter.parentRef.code = order.code;
        ENTransportOrderShortList childList = toDAO.getScrollableFilteredList(childFilter, 0, -1);

        if(childList.totalCount > 0)
        {
            for(int i = 0; i < childList.totalCount; i++)
            {

                if(childList.get(i).code == order.code)
                    throw new EnergyproSystemException("Помилка у зв'язці заявок № "+childList.get(i).numbergen + " та № "+order.numbergen);

                this.removeTransportOrderItemsFromTravelByParent(childList.get(i).code);
            }
        }
        //else
        //{
            if(order.parentRef.code != Integer.MIN_VALUE)
            {
                    /*Удаление связки транспортная заявка - путевой*/
                    ENTransportOrder2TravelFilter totFilter = new ENTransportOrder2TravelFilter();
                    totFilter.transportorder.code = order.code;
                    ENTransportOrder2TravelShortList totList = totDAO.getFilteredList(totFilter);

                    for(int i = 0; i < totList.totalCount; i++)
                    {
                        totDAO.remove(totList.get(i).code);
                    }

                ENTransportOrderFilter parentFilter = new ENTransportOrderFilter();
                parentFilter.code = order.parentRef.code;

                ENTransportOrderShortList parentList = toDAO.getScrollableFilteredList(parentFilter, 0, -1);

                if(parentList.totalCount > 1)
                    {
                        throw new EnergyproSystemException("Помилка у кількості батьківських заявок для заявки № "+order.code);
                    }

                if(parentList.totalCount == 1)
                    {

                    ENTransportOrder2TransportItemShortList to2tiList = to2tiDAO.getScrollableFilteredList(to2tiFilter, 0, -1);

                    if (to2tiList.totalCount == 0) {throw new EnergyproSystemException("В этой заявке нет ни одной строки!");}


                    ts2tiFilter.transportItemRef.code = to2tiList.get(0).transportItemCode;

                    ENTravelSheetItem2TransportItemShortList ts2tiList = ts2tiDAO.getScrollableFilteredList(ts2tiFilter, 0, -1);

                    if (ts2tiList.totalCount == 0) {throw new EnergyproSystemException("Строки этой заявки не включены в путевой лист!");}

                    Context context = new InitialContext();
                    Object objRef = null;

                    objRef = context.lookup(ENTravelSheetItemController.JNDI_NAME);
                    ENTravelSheetItemControllerHome travelSheetItemHome = (ENTravelSheetItemControllerHome) PortableRemoteObject.narrow(objRef, ENTravelSheetItemControllerHome.class);
                    ENTravelSheetItemController travelSheetItemController = travelSheetItemHome.create();

                    travelSheetItemController.removeForTransportOrder(ts2tiList.get(0).travelSheetItemRefCode);



                    }
            }

        //}
    }

    /**
    *
    * Включены ли строки заявки в путевой лист
    *
    * @param transportOrderCode код транспортной заявки
    * @return <b>true</b> - включены, <b>false</b> - не включены
    */
    public boolean isTransportItemsInTravelByTransportOrderCode(int transportOrderCode) throws PersistenceException
    {
        boolean result = false;
        ENTransportOrder2TransportItemDAO totiDAO = new ENTransportOrder2TransportItemDAO(connection, userProfile);
        ENTravelSheetItem2TransportItemDAO iDAO = new ENTravelSheetItem2TransportItemDAO(connection, userProfile);

        ENTransportOrder2TransportItemFilter totiFilter = new ENTransportOrder2TransportItemFilter();
        totiFilter.transportOrder.code = transportOrderCode;

        ENTransportOrder2TransportItemShortList totiList = totiDAO.getScrollableFilteredList(totiFilter, 0, -1);

        for(int i = 0; i < totiList.totalCount; i++)
        {
            ENTravelSheetItem2TransportItemFilter tvtiFilter = new ENTravelSheetItem2TransportItemFilter();
            tvtiFilter.transportItemRef.code = totiList.get(i).transportItemCode;

            int[] codes = iDAO.getFilteredCodeArray(tvtiFilter, 0, -1);

            if(codes.length >0)
            {
                result = true;
                break;
            }
        }

        return result;
    }

    public ENTransportOrder getPrevTransportOrder(ENTransportOrder toObj) throws PersistenceException
    {
        /*Ф-ция возвращает предыдущую заявку заявке с кодом transportOrderCode*/
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);
        ENTransportOrder toPrevObj = null;

        ENTransportOrderFilter toFilter = new ENTransportOrderFilter();
        toFilter.conditionSQL = " entransportorder.code =  \n" +
        " (select entransportorder.code  \n" +
        " from entransportorder, entransportorder2travl \n" +
        " where  \n" +
        " entransportorder.parentrefcode is null \n " +
        " and entransportorder.transportrealcode = " + toObj.transportReal.code + " \n " +
        " and entransportorder.code = entransportorder2travl.transportordercode \n" +
        " and entransportorder.timestart = (select  \n" +
        " max(entransportorder.timestart) \n" +
        " from entransportorder, entransportorder2travl  \n" +
        " where  \n" +
        " entransportorder.transportrealcode = " + toObj.transportReal.code + " \n " +
        " and entransportorder.code = entransportorder2travl.transportordercode  \n" +
        " and to_timestamp(to_char(entransportorder.timestart, 'dd.mm.yyyy hh24:mi:ss'), 'dd.mm.yyyy hh24:mi:ss') " +
        " < to_timestamp('" + new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(toObj.timeStart).toString() + "','dd.mm.yyyy hh24:mi:ss'))) \n";

        ENTransportOrderShortList toList = toDAO.getScrollableFilteredList(toFilter, 0, -1);

        if(toList.totalCount > 1)
        {
            throw new EnergyproSystemException("Помилка у кількості минулих заявок");
        }

        for(int i = 0; i < toList.totalCount; i ++)
        {
            toPrevObj = toDAO.getObject(toList.get(i).code);
        }

        return toPrevObj;
    }
    public ENTransportOrder getPrevTransportOrderForDriver(ENTransportOrder toObj, String driverTabNumber) throws PersistenceException
    {
        /*Ф-ция возвращает предыдущую заявку заявке с кодом transportOrderCode (по водителю с таб. № driverTabNumber) */
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);
        ENTransportOrder toPrevObj = null;

        ENTransportOrderFilter toFilter = new ENTransportOrderFilter();
        toFilter.conditionSQL = " entransportorder.code =  \n" +
        " (select entransportorder.code  \n" +
        " from entransportorder, entransportorder2travl, entravelsheet, finworker \n" +
        " where  \n" +
        " entransportorder.parentrefcode is null \n " +
        " and finworker.tabnumber = '" + driverTabNumber + "' \n" +
        " and entransportorder.code = entransportorder2travl.transportordercode \n" +
        " and entravelsheet.code = entransportorder2travl.travelsheetcode \n" +
        " and entravelsheet.finworkercode = finworker.code \n" +
        " and entransportorder.timestart = (select  \n" +
        " max(entransportorder.timestart) \n" +
        " from entransportorder, entransportorder2travl, entravelsheet, finworker  \n" +
        " where  \n" +
        " finworker.tabnumber = '" + driverTabNumber + "' \n" +
        " and entransportorder.parentrefcode is null \n " +
        " and entransportorder.code = entransportorder2travl.transportordercode  \n" +
        " and entravelsheet.code = entransportorder2travl.travelsheetcode \n" +
        " and entravelsheet.finworkercode = finworker.code \n" +
        " and to_timestamp(to_char(entransportorder.timestart, 'dd.mm.yyyy hh24:mi:ss'), 'dd.mm.yyyy hh24:mi:ss') " +
        " < to_timestamp('" + new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(toObj.timeStart).toString() + "','dd.mm.yyyy hh24:mi:ss'))) \n";

        ENTransportOrderShortList toList = toDAO.getScrollableFilteredList(toFilter, 0, -1);

        if(toList.totalCount > 1)
        {
            throw new EnergyproSystemException("Помилка у кількості минулих заявок");
        }

        for(int i = 0; i < toList.totalCount; i ++)
        {
            toPrevObj = toDAO.getObject(toList.get(i).code);
        }

        return toPrevObj;
    }

    public ENTransportOrder getNextTransportOrder(ENTransportOrder toObj) throws PersistenceException
    {
        /*Ф-ция возвращает следующую заявку заявке с кодом transportOrderCode*/
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);
        ENTransportOrder toNextObj = null;

        ENTransportOrderFilter toFilter = new ENTransportOrderFilter();
        toFilter.conditionSQL = " entransportorder.code =  \n" +
        " (select entransportorder.code  \n" +
        " from entransportorder, entransportorder2travl \n" +
        " where  \n" +
        " entransportorder.parentrefcode is null \n " +
        " and entransportorder.transportrealcode = " + toObj.transportReal.code + " \n " +
        " and entransportorder.code = entransportorder2travl.transportordercode \n" +
        " and entransportorder.timefinal = (select  \n" +
        " min(entransportorder.timefinal) \n" +
        " from entransportorder, entransportorder2travl  \n" +
        " where  \n" +
        " entransportorder.transportrealcode = " + toObj.transportReal.code + " \n " +
        " and entransportorder.code = entransportorder2travl.transportordercode  \n" +
        " and to_timestamp(to_char(entransportorder.timefinal, 'dd.mm.yyyy hh24:mi:ss'), 'dd.mm.yyyy hh24:mi:ss') " +
        " > to_timestamp('" + new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(toObj.timeStart).toString() + "','dd.mm.yyyy hh24:mi:ss'))) ";

        ENTransportOrderShortList toList = toDAO.getScrollableFilteredList(toFilter, 0, -1);

        if(toList.totalCount > 1)
        {
            throw new EnergyproSystemException("Помилка у кількості майбутніх заявок");
        }

        for(int i = 0; i < toList.totalCount; i ++)
        {
            toNextObj = toDAO.getObject(toList.get(i).code);
        }


        return toNextObj;
    }

    public ENTransportOrder getNextTransportOrderForDriver(ENTransportOrder toObj, String driverTabNumber) throws PersistenceException
    {
        /*Ф-ция возвращает следующую заявку заявке с кодом transportOrderCode (по водителю с таб. № driverTabNumber)*/
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);
        ENTransportOrder toNextObj = null;

        ENTransportOrderFilter toFilter = new ENTransportOrderFilter();
        toFilter.conditionSQL = " entransportorder.code =  \n" +
        " (select entransportorder.code  \n" +
        " from entransportorder, entransportorder2travl, entravelsheet, finworker \n" +
        " where  \n" +
        " entransportorder.parentrefcode is null \n " +
        " and finworker.tabnumber = '" + driverTabNumber + "' \n" +
        " and entransportorder.code = entransportorder2travl.transportordercode \n" +
        " and entravelsheet.code = entransportorder2travl.travelsheetcode \n" +
        " and entravelsheet.finworkercode = finworker.code \n" +
        " and entransportorder.timefinal = (select  \n" +
        " min(entransportorder.timefinal) \n" +
        " from entransportorder, entransportorder2travl, entravelsheet, finworker  \n" +
        " where  \n" +
        " finworker.tabnumber = '" + driverTabNumber + "' \n" +
        " and entransportorder.parentrefcode is null \n " +
        " and entransportorder.code = entransportorder2travl.transportordercode  \n" +
        " and entravelsheet.code = entransportorder2travl.travelsheetcode \n" +
        " and entravelsheet.finworkercode = finworker.code \n" +
        " and to_timestamp(to_char(entransportorder.timefinal, 'dd.mm.yyyy hh24:mi:ss'), 'dd.mm.yyyy hh24:mi:ss') " +
        " > to_timestamp('" + new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(toObj.timeStart).toString() + "','dd.mm.yyyy hh24:mi:ss'))) ";

        ENTransportOrderShortList toList = toDAO.getScrollableFilteredList(toFilter, 0, -1);

        if(toList.totalCount > 1)
        {
            throw new EnergyproSystemException("Помилка у кількості майбутніх заявок");
        }

        for(int i = 0; i < toList.totalCount; i ++)
        {
            toNextObj = toDAO.getObject(toList.get(i).code);
        }


        return toNextObj;
    }

    public void checkTimePeriod(ENTransportOrder toObj) throws PersistenceException {
    	this.checkTimePeriod(toObj, null, true);
    }
    
    public void checkTimePeriod(ENTransportOrder toObj, String tabNumber, Boolean isForTravelSheet) throws PersistenceException {

        String sqlDateStart = "to_timestamp('" +  new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(toObj.timeStart).toString() + "','dd.mm.yyyy hh24:mi:ss')";
        String sqlDateFinal = "to_timestamp('" +  new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(toObj.timeFinal).toString() + "','dd.mm.yyyy hh24:mi:ss')";

        String condition =String.format("  exists (select 1 from   \n "+
        		"  entransportorder as tor  \n "+
        		"  left join entransportorder2travl as tortv on tortv.transportordercode = tor.code \n "+
        		"  left join entravelsheet as ts  on ts.code = tortv.travelsheetcode \n" +
        		"  left join finworker as fi on ts.finworkercode = fi.code \n "+
        		"  where  \n "+
        		"  (tor.transportrealcode = ? " + ((tabNumber != null) ? " or fi.tabnumber = ?" : "") + ")  \n "+
        		"  and tor.code <> ? \n "+
        		  ((isForTravelSheet) ? " and tortv.code is not null " : "") +
        		"  and tor.parentrefcode is null \n "+
        		"  and ((tor.timestart >= %s and tor.timefinal <= %s) or \n "+
        		"  (tor.timestart <= %s and tor.timefinal >= %s)) \n "+
        		"  and tor.code = ENTRANSPORTORDER.CODE) \n ", sqlDateStart, sqlDateFinal, sqlDateStart, sqlDateFinal);

        Vector<Object> bindedObjects = new Vector<Object>();
    	bindedObjects.add(toObj.transportReal.code);
    	if(tabNumber != null) {
    		bindedObjects.add(tabNumber);
    	}
    	bindedObjects.add(toObj.code);

        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);
        ENTransportOrder prevObj = this.getPrevTransportOrder(toObj);
        ENTransportOrder nextObj = this.getNextTransportOrder(toObj);

        ENTransportOrderFilter toFilter = new ENTransportOrderFilter();


        toFilter.conditionSQL = condition;

        ENTransportOrderShortList toList = toDAO.getScrollableFilteredList(toFilter, 0, -1, bindedObjects);

        if(toList.totalCount > 0) {

        	String orderNames = Tools.arrayToStr(Tools.transformToArray(toList.list, new Transformator<String, ENTransportOrderShort>() {
				@Override
				public String transform(ENTransportOrderShort value) {
					return (value == null) ? "" : value.numbergen;
				}

        	}), ",");

            throw new EnergyproSystemException("На час заявки № " + toObj.numbergen + " вже є заявки " + orderNames);
        }
            if(prevObj != null) {
                if(prevObj.timeFinal.after(toObj.timeStart))
                    throw new EnergyproSystemException("Час початку заявки № " + toObj.numbergen + " повинно бути більше за час закінчення попередньої заявки на цей транспорт № " + prevObj.numbergen);
            }

            if(nextObj != null) {
                if(nextObj.timeStart.before(toObj.timeFinal))
                    throw new EnergyproSystemException("Час закінчення заявки № " + toObj.numbergen + " повинно бути меньшим за час початку наступної заявки на цей транспорт № " + nextObj.numbergen);
            }
    }

    public void checkENTransportItemInTransportOrderByTravelSheetItemCode(int travelSheetItemCode) throws PersistenceException
    {
        ENTravelSheetItem2TransportItemDAO tstiDAO = new ENTravelSheetItem2TransportItemDAO(connection, userProfile);

        ENTravelSheetItem2TransportItemFilter tstiFilter = new ENTravelSheetItem2TransportItemFilter();
        tstiFilter.travelSheetItemRef.code = travelSheetItemCode;

        ENTravelSheetItem2TransportItemShortList tstiList = tstiDAO.getScrollableFilteredList(tstiFilter, 0, -1);

        for(int i = 0; i < tstiList.totalCount; i++)
        {
            this.checkENTransportItemInTransportOrderByCode(tstiList.get(i).transportItemRefCode);
        }

    }

    /**
    * Проверяет, что строка транспорта связана с заявкой.
    *
    * @param transportItemCode код транспорта на плане
    *
    * @throws EnergyproSystemException если транспорт найден в заявке
    */
    public void checkENTransportItemInTransportOrderByCode(int transportItemCode) throws PersistenceException
    {
        /*       * Если entransportitem с кодом transportItemCode найден в заявке, то генерится исключение, что
    * транспорт связан с транспортной заявкой, изменять его через иной механизм невозможно*/

        ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);

        ENTransportItem tiObj = tiDAO.getObject(transportItemCode);

        ENTransportOrder2TransportItemDAO totiDAO = new ENTransportOrder2TransportItemDAO(connection, userProfile);
        ENTransportOrder2TransportItemFilter totiFilter = new ENTransportOrder2TransportItemFilter();
        totiFilter.transportItem.code = tiObj.code;
        ENTransportOrder2TransportItemShortList totiList = totiDAO.getScrollableFilteredList(totiFilter, 0, -1);

        if(totiList.totalCount > 0)
        {

            ENTransportOrder toObj = toDAO.getObject(totiList.get(0).transportOrderCode);

            if(toObj != null)
                throw new EnergyproSystemException("Строка для транспорту зв'язана із транспортною заявкою № " + toObj.numbergen);
            else throw new EnergyproSystemException("Строка для транспорту зв'язана із транспортною заявкою");

        }

        ENTransportItem2TransportItemDAO ti2tiDAO = new ENTransportItem2TransportItemDAO(connection, userProfile);
        ENTransportItem2TransportItemFilter ti2tiFilter = new ENTransportItem2TransportItemFilter();
        ti2tiFilter.outRef.code = transportItemCode;
        ENTransportItem2TransportItemShortList ti2tiList = ti2tiDAO.getScrollableFilteredList(ti2tiFilter, 0, -1);

        if (ti2tiList.totalCount > 0 )
        {
            ENTransportItem ti4planObj = tiDAO.getObject(ti2tiList.get(0).inRefCode);
            totiFilter.transportItem.code = ti4planObj.code;
            ENTransportOrder2TransportItemShortList toti4planList = totiDAO.getScrollableFilteredList(totiFilter, 0, -1);

            if (toti4planList.totalCount > 0)
            {
              ENTransportOrder toObj = toDAO.getObject(toti4planList.get(0).transportOrderCode);

              if(toObj != null)
                throw new EnergyproSystemException("Для цієї строки транспорту вже була на Плані заявка  № " + toObj.numbergen);
              else
                throw new EnergyproSystemException("Для цієї строки транспорту вже була на Плані заявка");
            }
        }

    }

    public boolean isENTransportItemInTransportOrderByCode(int transportItemCode) throws PersistenceException
    {
        /*Если entransportitem с кодом transportItemCode найден в заявке, то функция возвращает true*/
        ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);

        ENTransportItem tiObj = tiDAO.getObject(transportItemCode);

        ENTransportOrder2TransportItemDAO totiDAO = new ENTransportOrder2TransportItemDAO(connection, userProfile);

        ENTransportOrder2TransportItemFilter totiFilter = new ENTransportOrder2TransportItemFilter();

        totiFilter.transportItem.code = tiObj.code;

        ENTransportOrder2TransportItemShortList totiList = totiDAO.getScrollableFilteredList(totiFilter, 0, -1);

        if(totiList.totalCount > 0)
        {
            return true;
        }

        return false;

    }

    public boolean isENTransportItemInTransportOrderByList(ENTransportItemShort[] tiList) throws PersistenceException
    {
        /*Если entransportitem с кодом transportItemCode найден в заявке, то функция возвращает true*/
        for(int i = 0; i < tiList.length; i++)
        {
                if(tiList[i].code == Integer.MIN_VALUE)
                {
                    throw new EnergyproSystemException("Нема коду для перевірки строки транспорту в заявці");
                }
                if(!isENTransportItemInTransportOrderByCode(tiList[i].code))
                {
                    return false;
                }
        }

        return true;

    }

//      public boolean isENTransportItemInTransportOrderByTravelSheetItemCode(int travelSheetItemCode) throws PersistenceException
//      {
//          return
//      }

    public boolean isENTransportItemInTransportOrderByCodes(int[] transportItemCodes) throws PersistenceException
    {
        /*Если entransportitem с кодом transportItemCodes найден в заявке, то функция возвращает true*/
        for(int i = 0; i < transportItemCodes.length; i++)
        {
            if(!isENTransportItemInTransportOrderByCode(transportItemCodes[i]))
            {
                return false;
            }
        }

        return true;

    }



    public boolean isENTransportItemInTransportOrderByTravelSheetCode(int travelSheetCode) throws PersistenceException
    {
        /*Если все entransportitem'е связанные с путевым с кодом travelSheetCode найден в заявке,
        * то функция возвращает true*/
        ENTravelSheetItemDAO tsDAO = new ENTravelSheetItemDAO(connection, userProfile);
        ENTravelSheetItem2TransportItemDAO tstiDAO = new ENTravelSheetItem2TransportItemDAO(connection, userProfile);

        boolean result = true;

        // При пустых путевых листах на всяк случай будет генериться exception
        // так что isENTransportItemInTransportOrderByTravelSheetCode нужно вызывать аккуратно
        ENTravelSheetItemFilter tsFilter = new ENTravelSheetItemFilter();
        tsFilter.travelSheetRef.code = travelSheetCode;
        ENTravelSheetItemShortList tsList = tsDAO.getScrollableFilteredList(tsFilter, 0, -1);

        if(tsList.totalCount == 0)
            throw new EnergyproSystemException("В путьовому немає строк");

        ENTravelSheetItem2TransportItemFilter tstiFilter = new ENTravelSheetItem2TransportItemFilter();

        for(int i = 0; i < tsList.totalCount; i++)
        {
            tstiFilter.travelSheetItemRef.code = tsList.get(i).code;

            ENTravelSheetItem2TransportItemShortList tstiList = tstiDAO.getScrollableFilteredList(tstiFilter, 0, -1);

            for(int j = 0; j < tstiList.totalCount; j++)
            {
                if(!isENTransportItemInTransportOrderByCode(tstiList.get(j).transportItemRefCode))
                {
                    result = false;
                    return result;
                }
            }



        }

        return result;

    }

    public void checkENTransportItemInTransportOrderByENPlanWorkCode(int planWorkCode) throws PersistenceException
    {
        /*Если один из entransportitem'ов в плане с кодом planWorkCode связан с транспортной заявкой, то
        * генерится исключение*/
        ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
        ENTransportItemFilter tiFilter = new ENTransportItemFilter();
        tiFilter.planRef.code = planWorkCode;

        ENTransportItemShortList tiList = tiDAO.getScrollableFilteredList(tiFilter, 0, -1);

        for(int i = 0; i < tiList.totalCount; i++)
        {
            this.checkENTransportItemInTransportOrderByCode(tiList.get(i).code);
        }
    }

    /**
    *
    * Проверяет включенность строк транспорта в транспортные заявки по коду работы,
    * если одна строка включена, то генерится exception
    *
    * @param planWorkItemCode код работы
    * @throws PersistenceException
    */
    public void checkENTransportItemInTransportOrderByENPlanWorkItemCode(int planWorkItemCode) throws PersistenceException
    {
        /*Если один из entransportitem'ов в плане с кодом planWorkCode связан с транспортной заявкой, то
        * генерится исключение*/
        ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
        ENTransportItemFilter tiFilter = new ENTransportItemFilter();
        tiFilter.planItemRef.code = planWorkItemCode;

        ENTransportItemShortList tiList = tiDAO.getScrollableFilteredList(tiFilter, 0, -1);

        for(int i = 0; i < tiList.totalCount; i++)
        {
            this.checkENTransportItemInTransportOrderByCode(tiList.get(i).code);
        }
    }

    public void checkTravelSheet(ENTransportItemShort[] tList, int travelSheetCode) throws PersistenceException
    {
        /*Процедура для проверки чтобы не перемешивались строки путевых листов заявленные
        * и обычные строки */
        ENTravelSheetItemDAO tsDAO = new ENTravelSheetItemDAO(connection, userProfile);

        ENTravelSheetItemFilter tsFilter = new ENTravelSheetItemFilter();
        tsFilter.travelSheetRef.code = travelSheetCode;
        ENTravelSheetItemShortList tsList = tsDAO.getScrollableFilteredList(tsFilter, 0, -1);

        for(int i = 0; i < tList.length; i++)
            if(tList[i].code == Integer.MIN_VALUE)
                return;

        if(tsList.totalCount == 0)
            return;

//        if(isENTransportItemInTransportOrderByTravelSheetCode(travelSheetCode) != isENTransportItemInTransportOrderByList(tList))
//        {
//            throw new EnergyproSystemException("У подорожньому листі повинні бути окремо або заявлені строки або незаявлені");
//        }
    }

    public void checkTravelSheet(int[] transportItemCodes, int travelSheetCode, boolean forTransportOrder) throws PersistenceException
    {
        /*Процедура для проверки чтобы не перемешивались строки путевых листов заявленные
        * и обычные строки */
        ENTravelSheetItemDAO tsDAO = new ENTravelSheetItemDAO(connection, userProfile);

        ENTravelSheetItemFilter tsFilter = new ENTravelSheetItemFilter();
        tsFilter.travelSheetRef.code = travelSheetCode;
        ENTravelSheetItemShortList tsList = tsDAO.getScrollableFilteredList(tsFilter, 0, -1);

        for(int i = 0; i < transportItemCodes.length; i++)
        {
            if(this.isENTransportItemInTransportOrderByCode(transportItemCodes[i]) && (!forTransportOrder))
                throw new EnergyproSystemException("Ця строка є заявленою");

            if(!this.isENTransportItemInTransportOrderByCode(transportItemCodes[i]) && (forTransportOrder))
            {                  throw new EnergyproSystemException("Ця строка не є заявленою");}
        }

        if(tsList.totalCount == 0)
            return;

//        if(isENTransportItemInTransportOrderByTravelSheetCode(travelSheetCode) != isENTransportItemInTransportOrderByCodes(transportItemCodes))
//        {
//            throw new EnergyproSystemException("У подорожньому листі повинні бути окремо або заявлені строки або незаявлені");
//        }
    }

    public ENTransportOrderShortList getListsOfTransportOrderByTravelSheetCode(int travelSheetCode) throws PersistenceException
    {
        /*Функция возвращает ENTransportOrderShortList транспортных заявок по коду путевого листа*/
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);
        ENTransportOrderFilter toFilter = new ENTransportOrderFilter();
        String condition = "select entransportorder2travl.transportordercode from entransportorder2travl where entransportorder2travl.travelsheetcode = "+travelSheetCode;
        toFilter.conditionSQL = "ENTRANSPORTORDER.CODE IN ("+condition+")";
        ENTransportOrderShortList toList = toDAO.getScrollableFilteredList(toFilter, 0, -1);

        return toList;


    }

    public Date getMaxTimeFinal(ENTransportOrderShortList toList)
    {
        /*Возвращает максимальное время завершения из списка транспортных заявок*/
        if(toList.totalCount == 0)
            return null;

        Date result = toList.get(0).timeFinal;
        for(int i = 0; i < toList.totalCount; i++)
        {
            if(result.before(toList.get(i).timeFinal))
                result = toList.get(i).timeFinal;

        }

        return result;
    }

        public Date getMinTimeStart(ENTransportOrderShortList toList)
        {
            /*Возвращает минимальное время начала из списка транспортных заявок*/
            if(toList.totalCount == 0)
                return null;

            Date result = toList.get(0).timeStart;
            for(int i = 0; i < toList.totalCount; i++)
            {
                if(result.after(toList.get(i).timeStart))
                    result = toList.get(i).timeStart;

            }

            return result;
        }

        public ENTransportOrder getTransportOrderByTravelSheetItemCode(int travelSheetCode) throws PersistenceException
        {
            // Возвращает транспортную заявку по коду строки путевого листа
            ENTransportOrder toObj = null;
            ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);
            ENTransportOrderFilter toFilter = new ENTransportOrderFilter();
            String condition = "select entrnsprtrdr2trnsprttm.transportordercode from entravlshttm2trnsprttm, entrnsprtrdr2trnsprttm where " +
                                    " entravlshttm2trnsprttm.transportitemrefcode = entrnsprtrdr2trnsprttm.transportitemcode " +
                                    " and entravlshttm2trnsprttm.travelsheetitemrefcode = " + travelSheetCode;
            toFilter.conditionSQL = "ENTRANSPORTORDER.CODE IN ("+condition+")";

            ENTransportOrderShortList toList = toDAO.getScrollableFilteredList(toFilter, 0, -1);

            for(int i = 0; i < toList.totalCount; i++)
            {
                toObj = toDAO.getObject(toList.get(i).code);
            }

            return toObj;

        }

    public ENTransportOrder getTransportOrderByPlanCode(int planCode) throws PersistenceException
    {
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);
        ENTransportOrderFilter toFilter = new ENTransportOrderFilter();
        toFilter.planRef.code = planCode;

        ENTransportOrderShortList toList = toDAO.getScrollableFilteredList(toFilter,0,-1);

        ENTransportOrder transportOrderObj = null;
        if (toList.totalCount > 0 ) {

        transportOrderObj = toDAO.getObject(toList.get(0).code);
        }
        return transportOrderObj;
    }

    public ENTransportOrder getTransportOrderByTransportItemCode(int transportItemCode) throws PersistenceException
    {
        ENTransportOrder transportOrderObj = null;

        ENTransportOrder2TransportItemDAO totrDAO = new ENTransportOrder2TransportItemDAO(connection, userProfile);
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(connection, userProfile);

        ENTransportOrder2TransportItemFilter totrFilter = new ENTransportOrder2TransportItemFilter();
        totrFilter.transportItem.code = transportItemCode;

        ENTransportOrder2TransportItemShortList totrList = totrDAO.getScrollableFilteredList(totrFilter, 0, -1);

        if(totrList.totalCount > 1)
            throw new EnergyproSystemException("Помилка у кількості транспортних заявок");
        else
        {
            if(totrList.totalCount > 0)
                transportOrderObj = toDAO.getObject(totrList.get(0).transportOrderCode);
        }

        return transportOrderObj;
    }
    /**
    *
    * Возвращает количество запланированного транспорта для использования в нарядах на заданный период и по заданному транспортному подразделению
    *
    * @param transportCode код транспорта
    * @param orderDateStart дата начала периода
    * @param orderDateFinal дата конца периода
    * @param transportDepartmentCode код транспортного подразделения
    * @return int
    * @throws PersistenceException
    */
    public int getUnOrderedQty(int transportCode, Date orderDateStart, Date orderDateFinal, int transportDepartmentCode) throws PersistenceException
    {
        int out = 0;

        ENTransportOrderDAO tsDAO = new ENTransportOrderDAO(connection,userProfile);

        ENTransportOrderShortList tsList = tsDAO.getGroupedTransportListByTransportCode(transportCode, orderDateStart, orderDateFinal, transportDepartmentCode);

        for(int i = 0; i < tsList.totalCount; i++)
        {
            out = out + 1;
        }

        ENTransportOrderFilter tsFilter = new ENTransportOrderFilter();
        tsFilter.transport.code = transportCode;
        tsFilter.transportDepartment.code = transportDepartmentCode;
        tsFilter.conditionSQL = "to_date(to_char(ENTRANSPORTORDER.DATESTART,'dd.mm.yyyy'),'dd.mm.yyyy') >= '" +new SimpleDateFormat("dd.MM.yyyy").format(orderDateStart).toString()+"'" +
        " AND to_date(to_char(ENTRANSPORTORDER.DATEFINAL,'dd.mm.yyyy'),'dd.mm.yyyy') <= '" +new SimpleDateFormat("dd.MM.yyyy").format(orderDateFinal).toString()+"'";

        tsList = tsDAO.getScrollableFilteredList(tsFilter, 0, -1);

        for(int i = 0; i < tsList.totalCount; i++)
        {
            out = out + 1;
        }

        return out;
    }

    /**
    *
    * Возвращает количество выполненных заявок по нормативному транспорту за конкертный период в транспортном подразделении
    *
    * @param transportCode код транспорта
    * @param orderDateStart дата начала периода
    * @param orderDateFinal дата конца периода
    * @param transportDepartmentCode код транспортного подразделения
    * @return int
    * @throws PersistenceException
    */
    public int getOrderedQty(int transportCode, Date orderDateStart, Date orderDateFinal, int transportDepartmentCode) throws PersistenceException
    {
        int out = 0;

        ENTransportOrderDAO tsDAO = new ENTransportOrderDAO(connection,userProfile);

        ENTransportOrderFilter tsFilter = new ENTransportOrderFilter();
        tsFilter.transport.code = transportCode;
        tsFilter.transportDepartment.code = transportDepartmentCode;
        tsFilter.conditionSQL = "to_date(to_char(ENTRANSPORTORDER.DATESTART,'dd.mm.yyyy'),'dd.mm.yyyy') >= '" +new SimpleDateFormat("dd.MM.yyyy").format(orderDateStart).toString()+"'" +
        " AND to_date(to_char(ENTRANSPORTORDER.DATEFINAL,'dd.mm.yyyy'),'dd.mm.yyyy') <= '" +new SimpleDateFormat("dd.MM.yyyy").format(orderDateFinal).toString()+"'" +
        " AND ENTRANSPORTORDER.transportrealcode is not null ";
        ENTransportOrderShortList tsList = tsDAO.getScrollableFilteredList(tsFilter, 0, -1);

        for(int i = 0; i < tsList.totalCount; i++)
        {
            out = out + 1;
        }

        return out;
    }

    /**
    * Возвращает количество child-овских заявок по коду родительской
    * @param parentCode код родительской заявки
    * @return int
    */
    private int getCountChildTransportByParent(int parentCode) throws PersistenceException
    {
        ENTransportOrderDAO tsDAO = new ENTransportOrderDAO(connection, userProfile);

        ENTransportOrderFilter tsFilter = new ENTransportOrderFilter();
        tsFilter.parentRef.code = parentCode;
        int[] tsArr = tsDAO.getFilteredCodeArray(tsFilter, 0, -1);

        return tsArr.length;
    }

    /**
    * Возвращает количество всех child-овских заявок (включая child-овских для тех) по коду родительской
    * @param parentCode код родительской заявки
    * @return int
    */
    private int getCountAllChildTransportOrdersByParent(int parentCode) throws PersistenceException
    {
        ENTransportOrderDAO tsDAO = new ENTransportOrderDAO(connection, userProfile);

        int countChildTransportByParent = 0;



        ENTransportOrderFilter tsFilter = new ENTransportOrderFilter();
        tsFilter.parentRef.code = parentCode;
        int[] tsArr = tsDAO.getFilteredCodeArray(tsFilter, 0, -1);

        int out = tsArr.length;

        for(int i = 0; i < tsArr.length; i++)
        {
            countChildTransportByParent = this.getCountChildTransportByParent(tsArr[i]);

            if(countChildTransportByParent > 0)
            {
                out = out + this.getCountAllChildTransportOrdersByParent(tsArr[i]);
            }
        }

        return out;
    }

    /**
    *
    * Возвращает коды всех child-овских (включая child-овских для этих child-овских) заявок по коду родительской
    *
    * @param parentCode код родительской заявки
    * @return int[]
    */
    public int[] getCodesAllTransportOrdersByParent(int parentCode) throws PersistenceException
    {

        int length = this.getCountAllChildTransportOrdersByParent(parentCode);

        int[] tsOutArr = new int[length];

        ENTransportOrderDAO tsDAO = new ENTransportOrderDAO(connection, userProfile);

        ENTransportOrderFilter tsFilter = new ENTransportOrderFilter();
        tsFilter.parentRef.code = parentCode;
        int[] tsArr = tsDAO.getFilteredCodeArray(tsFilter, 0, -1);

        int count = 0;

        for(int i = 0; i < tsArr.length; i++)
        {
            int[] tsChildArr = this.getCodesAllTransportOrdersByParent(tsArr[i]);
            for(int j = 0; j < tsChildArr.length; j++)
            {
                tsOutArr[count] = tsChildArr[j];
                count = count + 1;
            }
        }

        for(int j = 0; j < tsArr.length; j++)
        {
            tsOutArr[count] = tsArr[j];
            count += 1;
        }

        return tsOutArr;
    }

    /**
    *
    * Возвращает массив кодов транспорта на плане по коду заявки
    *
    * @param transportOrderCode код заявки
    * @return int[]
    */
    public int[] getTransportItemCodesByTransportOrderCode(int transportOrderCode) throws PersistenceException
    {
        ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);

        String condition = " select entrnsprtrdr2trnsprttm.transportitemcode from entrnsprtrdr2trnsprttm where  entrnsprtrdr2trnsprttm.transportordercode = " + transportOrderCode;
        ENTransportItemFilter tiFilter = new ENTransportItemFilter();
        tiFilter.conditionSQL = "ENTRANSPORTITEM.CODE IN (" + condition + ")";

        return tiDAO.getFilteredCodeArray(tiFilter, 0, -1);
    }


    public boolean checkTransportOut(int planCode) throws PersistenceException {
        Connection connect = null;
        boolean isCalculate = false;

        try {
            connect = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            TKTransportDAO trDAO = new TKTransportDAO(connect, userProfile);
            TKTransportFilter trFilter = new TKTransportFilter();
            trFilter.conditionSQL = " tktransport.code in ( "
                    + " select distinct tr.code from tkelement2techcard e2t , tktransport tr , entransportitem tri "
                    + " where e2t.elementcode = 1008001048 "
                    + // транспорт заказчика
                    " and e2t.elementcode = tr.elementcode "
                    + " and tri.transportcode = tr.code "
                    + " and tri.planrefcode = " + planCode + " )";
            int trArr[] = trDAO.getFilteredCodeArray(trFilter, 0, -1);
            if (trArr.length > 0) {
                isCalculate = true;
            }

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(e.getMessage(),e);
        } finally {
            try {
                if ((connect != null) && !connect.isClosed())
                    connect.close();
            } catch (SQLException e) {
            }
        }
        return isCalculate;
    }
    
    public void checkRepairPeriodForTransport(int transportRealCode, int transportOrderCode) throws PersistenceException {


    	ENTransportOrderDAO trOrderDAO = new ENTransportOrderDAO(connection, userProfile);
    	ENTransportRealRepairDAO repairDAO = new ENTransportRealRepairDAO(connection, userProfile);
    	TKTransportRealDAO transportDAO = new TKTransportRealDAO(connection, userProfile);
    	TKTransportReal transportObj = transportDAO.getObject(transportRealCode);

        ENTransportOrder toObj = trOrderDAO.getObject(transportOrderCode);
        String sqlDateStart = "to_timestamp('" +  new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(toObj.timeStart).toString() + "','dd.mm.yyyy hh24:mi:ss')";
        String sqlDateFinal = "to_timestamp('" +  new SimpleDateFormat("dd.MM.yyyy H:mm:ss").format(toObj.timeFinal).toString() + "','dd.mm.yyyy hh24:mi:ss')";

        ENTransportRealRepairFilter repairFilter = new ENTransportRealRepairFilter();
        repairFilter.realTransport.code = transportRealCode;
        repairFilter.conditionSQL = " (ENTRANSPORTREALREPAIR.DATESTART between " + sqlDateStart + " and " + sqlDateFinal + 
        		                    " OR ENTRANSPORTREALREPAIR.DATEFINAL between " + sqlDateStart + " and " + sqlDateFinal + ")"; 
        
        ENTransportRealRepairShortList repairList = repairDAO.getScrollableFilteredList(repairFilter, 0, -1);
        
        if (repairList.totalCount > 0) {
        	throw new SystemException("На час заявки для транспорту " + transportObj.buhName + " гос.№" + transportObj.gosNumber + 
        			" є встановлений період ремонту:" + repairList.get(0).dateStart + " - " + repairList.get(0).dateFinal);
        }
        

    }


}


