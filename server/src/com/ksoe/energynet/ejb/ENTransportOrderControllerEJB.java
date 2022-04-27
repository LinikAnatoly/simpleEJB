//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENTransportOrder;
 *
 */

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDeliveryOrderDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENTransportDep2DepDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportOrder2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportOrder2TravelDAO;
import com.ksoe.energynet.dataminer.ENTransportOrderDAO;
import com.ksoe.energynet.dataminer.ENTransportRouteDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENWorkOrder2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.ejb.generated.ENTransportOrderControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.AuthLogic.FinConnectionData;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.energynet.logic.TransportOrderLogic;
import com.ksoe.energynet.logic.TravelSheetLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENTransportOrder;
import com.ksoe.energynet.valueobject.ENTransportOrder2TransportItem;
import com.ksoe.energynet.valueobject.ENTransportOrder2Travel;
import com.ksoe.energynet.valueobject.ENTransportOrderStatus;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetStatus;
import com.ksoe.energynet.valueobject.ENTravelWorkMode;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.FINWorkerKind;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkItemShort;
import com.ksoe.energynet.valueobject.brief.ENTransportItemShort;
import com.ksoe.energynet.valueobject.filter.ENDeliveryOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportDep2DepFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportOrder2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportOrder2TravelFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrder2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.ENDeliveryOrderShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportDep2DepShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportOrder2TransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportOrder2TravelShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportOrderShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrder2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.fin.logic.FKOSLogic;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKTransportClassificationDAO;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.logic.TKConsts;
import com.ksoe.techcard.valueobject.TKTransportReal;
import com.ksoe.techcard.valueobject.TKTransportStatus;
import com.ksoe.techcard.valueobject.TKTransportType;
import com.ksoe.techcard.valueobject.filter.TKTransportClassificationFilter;
import com.ksoe.techcard.valueobject.lists.TKTransportClassificationShortList;

public class ENTransportOrderControllerEJB extends ENTransportOrderControllerEJBGen
 {

  public ENTransportOrderControllerEJB() {}


  public void setTransportRealToTransportOrder(int transportOrderCode, int transportRealCode) throws java.rmi.RemoteException
  {
    try
    {
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        ENTransportOrder2TravelDAO totDAO = new ENTransportOrder2TravelDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        ENTransportOrder transportOrderObj = toDAO.getObject(transportOrderCode);

            ENTransportOrder2TravelFilter totFilter = new ENTransportOrder2TravelFilter();
            totFilter.transportorder.code = transportOrderCode;
            ENTransportOrder2TravelShortList totList = totDAO.getFilteredList(totFilter);

            if(totList.totalCount > 0)
            throw new SystemException("������ � "+transportOrderObj.numbergen + " ��� ����������� � ������������ ���� � "+totList.get(0).travelsheetNumberGen);

            if (transportOrderObj.transportOrderStatus.code != ENTransportOrderStatus.GOOD) {
            	throw new SystemException("������ � "+transportOrderObj.numbergen + " ������� ���� ������ \"�������\"! ");
            }
            
            transportOrderObj.transportReal.code = transportRealCode;

	        TransportOrderLogic toLogic = new TransportOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            /*�������� ������� ������� ������*/
            toLogic.checkTimePeriod(transportOrderObj, null, false);
            /*�������� �� ������ ������� �� ������� ������*/
            toLogic.checkRepairPeriodForTransport(transportRealCode, transportOrderCode);
            
            toDAO.save(transportOrderObj);


    }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getGroupedTransportListByTransportCode ;)",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
  }

  
  public void setNullTransportRealToTransportOrder(int transportOrderCode) throws java.rmi.RemoteException
  {
    try
    {
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        ENTransportOrder2TravelDAO totDAO = new ENTransportOrder2TravelDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        ENTransportOrder transportOrderObj = toDAO.getObject(transportOrderCode);

            ENTransportOrder2TravelFilter totFilter = new ENTransportOrder2TravelFilter();
            totFilter.transportorder.code = transportOrderCode;
            ENTransportOrder2TravelShortList totList = totDAO.getFilteredList(totFilter);

            if(totList.totalCount > 0)
            throw new SystemException("������ � "+transportOrderObj.numbergen + " ��� ����������� � ������������ ���� � "+totList.get(0).travelsheetNumberGen);

            if (transportOrderObj.transportOrderStatus.code != ENTransportOrderStatus.GOOD) {
            	throw new SystemException("������ � "+transportOrderObj.numbergen + " ������� ���� ������ \"�������\"! ");
            }
            
            transportOrderObj.transportReal.code = Integer.MIN_VALUE;
            transportOrderObj.transportReal = null;
            
            toDAO.save(transportOrderObj);


    }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getGroupedTransportListByTransportCode ;)",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
  }

  
  

  public ENTransportOrderShortList getGroupedTransportListByPlanCode(int planCode) throws java.rmi.RemoteException
  {
  try
  {
   ENTransportOrderDAO objectDAO = new ENTransportOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
   return objectDAO.getGroupedTransportListByPlanCode(planCode);
  }
 catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getGroupedTransportListByPlanCode ;)",e);}
 catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
 finally                              {closeConnection();}
  }

  public ENTransportOrderShortList getListOfNormTransport(ENTransportOrderFilter aFilterObject, int fromPosition,int quantity) throws java.rmi.RemoteException
  {
    try
    {
        ENTransportOrderDAO tsDAO = new ENTransportOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        // ��������� ����� � ����������� ����������� ��� ������������ ������ �� ������ �� aFilterObject
        return tsDAO.getListOfNormTransport(aFilterObject, fromPosition, quantity);

    }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getGroupedTransportListByTransportCode ;)",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
  }

  public ENTransportOrderShortList getGroupedTransportListByTransportCode(int transportCode, Date orderDateStart, Date orderDateFinal, int transportDepartmentCode)  throws java.rmi.RemoteException
  {
  try
  {
   ENTransportOrderDAO objectDAO = new ENTransportOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
   return objectDAO.getGroupedTransportListByTransportCode(transportCode, orderDateStart, orderDateFinal, transportDepartmentCode);
  }
 catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getGroupedTransportListByTransportCode ;)",e);}
 catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
 finally                              {closeConnection();}
  }

  public ENTransportOrderShortList getGroupedTransportListByDateAndDepartment(Date orderDateStart, Date orderDateFinal, int transportDepartmentCode)  throws java.rmi.RemoteException
  {
  try
  {
   ENTransportOrderDAO objectDAO = new ENTransportOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
   return objectDAO.getGroupedTransportListByDateAndDepartment(orderDateStart, orderDateFinal, transportDepartmentCode);
  }
 catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getGroupedTransportListByDateAndDepartment ;)",e);}
 catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
 finally                              {closeConnection();}
  }


  public void setApprove(int transportOrderCode) throws java.rmi.RemoteException
  {
    try
    {
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        ENTransportOrder2TravelDAO totDAO = new ENTransportOrder2TravelDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        ENTransportOrder transportOrderObj = toDAO.getObject(transportOrderCode);


            ENTransportOrder2TravelFilter totFilter = new ENTransportOrder2TravelFilter();
            totFilter.transportorder.code = transportOrderCode;
            ENTransportOrder2TravelShortList totList = totDAO.getFilteredList(totFilter);

            if(totList.totalCount > 0)
            throw new EnergyproSystemException("������ � "+transportOrderObj.numbergen + " ��� ����������� � ������������ ���� � "+totList.get(0).travelsheetNumberGen);

            transportOrderObj.isApproved = 1;
            transportOrderObj.isRejected = 0;

            toDAO.save(transportOrderObj);


    }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getGroupedTransportListByTransportCode ;)",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
  }


  public void undoApprove(int transportOrderCode) throws java.rmi.RemoteException
  {
    try
    {
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        ENTransportOrder2TravelDAO totDAO = new ENTransportOrder2TravelDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        ENTransportOrder transportOrderObj = toDAO.getObject(transportOrderCode);


            ENTransportOrder2TravelFilter totFilter = new ENTransportOrder2TravelFilter();
            totFilter.transportorder.code = transportOrderCode;
            ENTransportOrder2TravelShortList totList = totDAO.getFilteredList(totFilter);

            if(totList.totalCount > 0)
            throw new EnergyproSystemException("������ � "+transportOrderObj.numbergen + " ��� ����������� � ������������ ���� � "+totList.get(0).travelsheetNumberGen);

            transportOrderObj.isApproved = 0;
            transportOrderObj.isRejected = 0;

            toDAO.save(transportOrderObj);


    }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getGroupedTransportListByTransportCode ;)",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
  }

  public void setReject(int transportOrderCode) throws java.rmi.RemoteException
  {
    try
    {
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        ENTransportOrder2TravelDAO totDAO = new ENTransportOrder2TravelDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        ENTransportOrder transportOrderObj = toDAO.getObject(transportOrderCode);


            ENTransportOrder2TravelFilter totFilter = new ENTransportOrder2TravelFilter();
            totFilter.transportorder.code = transportOrderCode;
            ENTransportOrder2TravelShortList totList = totDAO.getFilteredList(totFilter);

            if(totList.totalCount > 0)
            throw new EnergyproSystemException("������ � "+transportOrderObj.numbergen + " ��� ����������� � ������������ ���� � "+totList.get(0).travelsheetNumberGen);

            transportOrderObj.isApproved = 0;
            transportOrderObj.isRejected = 1;

            toDAO.save(transportOrderObj);


    }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getGroupedTransportListByTransportCode ;)",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
  }


  public void undoReject(int transportOrderCode) throws java.rmi.RemoteException
  {
    try
    {
        ENTransportOrderDAO toDAO = new ENTransportOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        ENTransportOrder2TravelDAO totDAO = new ENTransportOrder2TravelDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        ENTransportOrder transportOrderObj = toDAO.getObject(transportOrderCode);


            ENTransportOrder2TravelFilter totFilter = new ENTransportOrder2TravelFilter();
            totFilter.transportorder.code = transportOrderCode;
            ENTransportOrder2TravelShortList totList = totDAO.getFilteredList(totFilter);

            if(totList.totalCount > 0)
            throw new EnergyproSystemException("������ � "+transportOrderObj.numbergen + " ��� ����������� � ������������ ���� � "+totList.get(0).travelsheetNumberGen);

            transportOrderObj.isApproved = 0;
            transportOrderObj.isRejected = 0;

            toDAO.save(transportOrderObj);


    }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getGroupedTransportListByTransportCode ;)",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
  }

  /*** ��������� � ������� ���� ��������� ������������ ������
   *
   * @param transportOrderCode
   * @param tabNumber
   * @param transportReal
   * @throws java.rmi.RemoteException
   */

	public void addTransportWithWorker(int transportOrderCode,
			String tabNumber, int transportReal) throws java.rmi.RemoteException {

		Connection authConn = null;
		Connection netConn = null;
		Connection finConn = null;
		Connection finOsConn = null;

		try {

			authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
			AuthLogic l = new AuthLogic(authConn, getUserProfile());

			try {
				if (authConn != null && !authConn.isClosed()) {
					authConn.close();
					authConn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}


			FinConnectionData finConnectionData = l.getFinConnectionData();

			finConn = getConnection(finConnectionData.connectionString);
			finOsConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			netConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	        ENElementDAO elementDAO = new ENElementDAO(netConn, getUserProfile());
	        ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(netConn, getUserProfile());
	        ENTransportOrderDAO trDAO = new ENTransportOrderDAO(netConn, getUserProfile());
	        ENTravelSheetDAO travelSheetDAO = new ENTravelSheetDAO(netConn, getUserProfile());
	        ENPlanWorkDAO planWorkDAO = new ENPlanWorkDAO(netConn, getUserProfile());
	        TKTransportRealDAO trealDAO = new TKTransportRealDAO(netConn, getUserProfile());
	        TransportOrderLogic toLogic = new TransportOrderLogic(netConn, getUserProfile());
	        TravelSheetLogic travelSheetLogic = new TravelSheetLogic(netConn, getUserProfile());
	        TransportLogic tLogic = new TransportLogic(netConn, getUserProfile());
	        ENTransportOrder2TravelDAO totDAO = new ENTransportOrder2TravelDAO(netConn, getUserProfile());
	        ENTransportItemDAO transportItemDAO = new ENTransportItemDAO(netConn, getUserProfile());


	   		FINWorkerDAO fDAO = new FINWorkerDAO(finConn, getUserProfile());
	   		FKOSLogic fkOsLogic = new FKOSLogic(finOsConn, getUserProfile());


	        /*�������� �� ����������� ������� ���������� ��������*/
	        int[] tsArr = toLogic.getCodesAllTransportOrdersByParent(transportOrderCode);
	        for (int i = 0; i < tsArr.length; i++) {
	            int[] tsTransportArray = toLogic.getTransportItemCodesByTransportOrderCode(tsArr[i]);
	            for (int j = 0; j < tsTransportArray.length; j++) {
	                tLogic.validateDeliveryOrder(tsTransportArray[j]);
	            }
	        }

	        tsArr = toLogic.getTransportItemCodesByTransportOrderCode(transportOrderCode);
	        for(int tsItem : tsArr) {
	            tLogic.validateDeliveryOrder(tsItem);
	            tLogic.validateTracktorOrKran(tsItem, transportReal);
	        }

            Context context = new InitialContext();
            Object objRef = null;

           /*
            * ����� ������� - ��������� ����� ������� ���� ��� ��������� ������
            * �������� � ��� ������������
            */
	        ENTransportOrder transportOrderObj = trDAO.getObject(transportOrderCode);
	        ENPlanWork planWorkObj = planWorkDAO.getObjectNOSEGR(transportOrderObj.planRef.code);
	        TKTransportReal tRealObj = trealDAO.getObject(transportReal);

            /*�������� �� ������ ������� �� ������� ������*/
            toLogic.checkRepairPeriodForTransport(tRealObj.code, transportOrderCode);
	        
	        /* ����� ���������� � ��������� tabNumber */
	        FINWorkerFilter fFilter = new FINWorkerFilter();
	        fFilter.tabNumber = tabNumber;

	        FINWorkerShortList fList = fDAO.getFINWorkerList(fFilter,0,-1, transportOrderObj.dateStart, true);
	        
	        if(fList.totalCount != 1) {
	        	throw new EnergyproSystemException("������� � ������� �������� � ��������� �������: " + tabNumber);
	        }
	        
	        /*  NET-4396
	         *  ������ �� �������� �� � ������, ���� ������ � ��������� ���, � ���� - ���
	         */
	        if (tRealObj.isOVB == 1 && planWorkObj.budgetRef.code != ENConsts.ENBUDGET_ODG)
	        {
        	if (transportOrderObj.isApproved != Integer.MIN_VALUE) {
        		if (transportOrderObj.isApproved == 0) {
        			throw new EnergyproSystemException("��������� ��� ���������� ��������������� �� ����� ������� ��� ���� ���! ������ �� ������������!");
        		}
        	}

        	if (transportOrderObj.isRejected != Integer.MIN_VALUE) {
        		if (transportOrderObj.isRejected == 1) {
        			throw new EnergyproSystemException("��������� ��� ���������� ��������������� �� ����� ������� ��� ���� ���! ������ ��������!");
        		}
        	}

        	if (transportOrderObj.isApproved == Integer.MIN_VALUE && transportOrderObj.isRejected ==  Integer.MIN_VALUE)  {
        	   throw new EnergyproSystemException("��������� ��� ���������� ��������������� �� ����� ������� ��� ���� ���!");
        	}

        }

        // �������� �� ������� � �������������� ���� �������� �����,
        //���� ���, �� ��������� ����� �� ��������� ��� � �� ����������
        // ����� � EditENTravelSheet.pas � ������ spbTKTransportRealTransportRealClick
        if(tRealObj.travelSheetTypeRef.code == Integer.MIN_VALUE)
            throw new EnergyproSystemException("��������� + "+((tRealObj != null) ? tRealObj.buhName: "") + " ������� ��������������� ���� �� ������");

        // NET-3213 ����������� ������������� ��������������
        if(tRealObj.isNotUsed == ENConsts.TRANSPORT_REAL_ISNOTUSED)
            throw new EnergyproSystemException("��������� " + tRealObj.name + " ���������� ���������������");

        // NET-2938
   //     if(tRealObj.transportstatus.code != TKTransportStatus.TKTRANSPORTSTATUS_FROM_SIDE)
  //      {
           boolean isInService = fkOsLogic.isInService(tRealObj.invNumber);
  //          if(!isInService)
   //             throw new EnergyproSystemException("������������ ���� � " + tRealObj.buhName + " �� �������� � ������������");
   //     }


        /* 14.05.2012 +++ ��� ��������� ������ �������� ����������� */
        if (planWorkObj.typeRef.code == ENPlanWorkType.TRUCKING) {
            ENElement element = elementDAO.getObject(planWorkObj.elementRef.code);

            if (element.typeRef.code == ENElementType.CARGO_OBJECT) {
                ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
                routeFilter.planRef.code = planWorkObj.code;
                int routeArr[] = routeDAO.getFilteredCodeArray(routeFilter, 0, -1);

                if (routeArr.length == 0) {
                    throw new EnergyproSystemException(
                            "���������� �������� ����� �� ����������� ������� ��� ��������!!!");
                }
            }
        }

        if (transportOrderObj.isApproved != ENTransportOrder.isApproved_true) {
        	throw new EnergyproSystemException("������ �� ������������!");
        }

        transportOrderObj.transportReal.code = transportReal;

        /*�������� �� ��, ��� ������ ��� �������� � �����-�� ������� ����*/
            ENTransportOrder2TravelFilter totFilter = new ENTransportOrder2TravelFilter();
            totFilter.transportorder.code = transportOrderCode;
            ENTransportOrder2TravelShortList totList = totDAO.getFilteredList(totFilter);

            if(totList.totalCount > 0)
                throw new EnergyproSystemException("������ � "+transportOrderObj.numbergen + " ��� ����������� � ������������ ���� � "+totList.get(0).travelsheetNumberGen);

            /*�������� ������� ������� ������*/
            toLogic.checkTimePeriod(transportOrderObj, tabNumber, true);


        ENTravelSheetFilter travelSheetFilter = new ENTravelSheetFilter();

        travelSheetFilter.transportReal.code = transportReal;
        travelSheetFilter.conditionSQL = "ENTRAVELSHEETSTATUS.CODE IN (" + ENTravelSheetStatus.GOOD +", "
                                                                        + ENTravelSheetStatus.PLAN + ", " +
                                                                        ENTravelSheetStatus.FACT + ")" +
                                            " AND (ENTRAVELSHEET.DATESTART <= '" + new SimpleDateFormat("dd.MM.yyyy").format(transportOrderObj.dateStart) + "'" +
                                            " AND ENTRAVELSHEET.DATEFINAL >= '" + new SimpleDateFormat("dd.MM.yyyy").format(transportOrderObj.dateFinal) +  "')";


        ENTravelSheetShortList travelSheetList = travelSheetDAO.getScrollableFilteredList(travelSheetFilter, 0, -1);

        boolean isThere = false; // ��� ����������� ���� �� ����������
                                    // ������� ���� �� ���� ������ ������ �
                                    // ����� transportOrderCode � �������
                                    // transportReal

        int travelSheetCode = Integer.MIN_VALUE;
        int newTravelSheetCode = Integer.MIN_VALUE;

        for(int i = 0; i < travelSheetList.totalCount; i++)
        {
            if(travelSheetList.get(i).finWorkerTabNumber.equals(tabNumber))
            {
                isThere = true;
                travelSheetCode = travelSheetList.get(i).code;
                break;
            }
        }

        FINWorker fWorker = new FINWorker();
        fWorker.name = fList.get(0).name;
        fWorker.tabNumber = fList.get(0).tabNumber;
        fWorker.positionCode = fList.get(0).positionCode;
        fWorker.positionName = fList.get(0).positionName;
        fWorker.departmentCode = fList.get(0).departmentCode;
        fWorker.departmentName = fList.get(0).departmentName;
        fWorker.priceGen = fList.get(0).priceGen;
        fWorker.categor = fList.get(0).categor;
        fWorker.finCode = fList.get(0).finCode;
        fWorker.kindRef.code = FINWorkerKind.OTHER;
        // MDAX-441
        fWorker.positionId = fList.get(0).positionId;

        toLogic.setFINWorkerWithTransportReal(transportOrderCode, fWorker, tRealObj.code);

        /*��������� ������������ � child-������ ������ (������� �������� ��������)*/
        if(transportOrderObj.parentRef.code != Integer.MIN_VALUE)
            throw new EnergyproSystemException("������ � "+transportOrderObj.numbergen + " ��'����� � ����� ������� � ���� ����������� ����������� ��� ���������� 򳺿");
        else
        toLogic.insertDeliveryForTransportOrder(transportOrderObj.code);

        if(isThere)
        {

            /* ��������� ������� ������ � �������� ����� */

                objRef = context.lookup(ENTravelSheetController.JNDI_NAME);
                ENTravelSheetControllerHome travelSheetHome = (ENTravelSheetControllerHome) PortableRemoteObject.narrow(objRef, ENTravelSheetControllerHome.class);
                ENTravelSheetController travelSheetController = travelSheetHome.create();

                // NET-3346 �������� ������� �� �������� � ������ �� �������� ��
                toLogic.checkDriverInTravelSheet(transportOrderObj, tabNumber, transportOrderObj.dateStart);


                /*�������� ����� ����� ��� �������� �����*/
                ENTransportItemFilter itemFilter = new ENTransportItemFilter();
                itemFilter.conditionSQL = "code in (SELECT transportitemcode from entrnsprtrdr2trnsprttm where transportordercode = " + transportOrderCode+")";
                int[] itemCodesList = transportItemDAO.getFilteredCodeArray(itemFilter, 0, -1);



                BigDecimal sumdist = new BigDecimal(0.0);
                BigDecimal sumhours = new BigDecimal(0.0);
                for(int i=0; i < itemCodesList.length; i++)
                {
                    sumdist = sumdist.add(toLogic.getDistancesByTransportItem(itemCodesList[i]));
                    sumhours = sumhours.add(toLogic.getSumMachineHoursByTransportItem(itemCodesList[i]));
                }
                if ((sumdist.compareTo(new BigDecimal(0)) == 0) && (sumhours.compareTo(new BigDecimal(0)) == 0))
                {throw new EnergyproSystemException("������ � ������� ������������ � ������������ ����� ��������� ������ ��� ���������� �������� �� ��������� ������!");}

                ENTravelSheet travelSheetObj =  travelSheetDAO.getObject(travelSheetCode);

                ////

                // NET-2757 �� ���� ����� �������� NullPointerException, ���� ������ �� ���� �� ��������!!!
                // ENTravelSheet prevSheetObj = travelSheetDAO.getObject(travelSheetLogic.getPrevSheet(travelSheetObj).code);
                ENTravelSheet prevSheetObj = travelSheetLogic.getPrevSheet(travelSheetObj);

                ////


            if  ((travelSheetObj.statusRef.code == ENTravelSheetStatus.PLAN) ||  (travelSheetObj.statusRef.code == ENTravelSheetStatus.GOOD))
            {
                if  (planWorkObj.kind.code != ENPlanWorkKind.NPW)
                {
                    throw new EnergyproSystemException("������ �� ���� ����� ������ ����� � ��������� ���� � �������� '���������� �����'! ������������ ��������� ���� ��� ��������� ���� ������!");
                }

            }

            /*��������� ����� �������� ����� - ���� ����� ������ �� ��������� � �������� ������ �������� ����� - ��������� ���*/
            boolean isChange = false; // ���� ���������� ���� �������� - ������������ �� true, ����� ������, ��� ������� ���� ���������� �������������
            if(transportOrderObj.timeStart.before(travelSheetObj.timeStart))
            {
                travelSheetObj.dateStart = Tools.clearTimeOfDate(transportOrderObj.timeStart);
                travelSheetObj.timeStart = transportOrderObj.timeStart;
                isChange = true;
            }


            if(transportOrderObj.timeFinal.after(travelSheetObj.timeFinal))
            {
                travelSheetObj.dateFinal = Tools.clearTimeOfDate(transportOrderObj.timeFinal);
                travelSheetObj.timeFinal = transportOrderObj.timeFinal;
                isChange = true;

            }

            if(isChange)
            {
                travelSheetController.save(travelSheetObj);
            }

                /*������� finworker'a*/
                objRef = context.lookup(ENTransportItemController.JNDI_NAME);
                ENTransportItemControllerHome transportItemHome = (ENTransportItemControllerHome) PortableRemoteObject.narrow(objRef, ENTransportItemControllerHome.class);
                ENTransportItemController transportItemController = transportItemHome.create();

                for(int i=0; i < itemCodesList.length; i++)
                {
                    ENTransportItem tiObj = transportItemDAO.getObject(itemCodesList[i]);


                    tiObj.finWorker.code = Integer.MIN_VALUE;
                    tiObj.finWorker.name = fList.get(0).name;
                    tiObj.finWorker.tabNumber = fList.get(0).tabNumber;
                    tiObj.finWorker.positionCode = fList.get(0).positionCode;
                    tiObj.finWorker.positionName = fList.get(0).positionName;
                    tiObj.finWorker.departmentCode = fList.get(0).departmentCode;
                    tiObj.finWorker.departmentName = fList.get(0).departmentName;
                    tiObj.finWorker.priceGen = fList.get(0).priceGen;
                    tiObj.finWorker.categor = fList.get(0).categor;
                    tiObj.finWorker.finCode = fList.get(0).finCode;
                    tiObj.finWorker.kindRef.code = FINWorkerKind.OTHER;
                    // MDAX-441
                    tiObj.finWorker.positionId = fList.get(0).positionId;

                    tiObj.transportReal.code = tRealObj.code;

                    transportItemController.saveForTransportOrder(tiObj);
                }

                travelSheetController.addItemsDetailedForTransportOrder(travelSheetCode, itemCodesList);

                /*������� ������ ������������ ������ � �������� �����*/
                ENTransportOrder2Travel totObj = new ENTransportOrder2Travel();

                totObj.code = Integer.MIN_VALUE;
                totObj.transportorder.code = transportOrderCode;
                totObj.travelsheet.code = travelSheetCode;

                totDAO.add(totObj);

                toLogic.insertTravelSheet2TransportOrder(transportOrderCode, travelSheetCode);

        }
        else
        {
                objRef = context.lookup(ENTravelSheetController.JNDI_NAME);
                ENTravelSheetControllerHome travelSheetHome = (ENTravelSheetControllerHome) PortableRemoteObject.narrow(objRef, ENTravelSheetControllerHome.class);
                ENTravelSheetController travelSheetController = travelSheetHome.create();

                // �������� ������� �� �������� � ������ �� �������� ��
                toLogic.checkDriverInTravelSheet(transportOrderObj, tabNumber, transportOrderObj.dateStart);



                ENTravelSheet newTravelSheetObj = new ENTravelSheet();

                newTravelSheetObj.timeStart = transportOrderObj.timeStart;
                newTravelSheetObj.timeFinal = transportOrderObj.timeFinal;
                newTravelSheetObj.dateStart = transportOrderObj.dateStart;
                newTravelSheetObj.dateFinal = transportOrderObj.dateFinal;
                newTravelSheetObj.department.code =  tRealObj.departmentRef.code; //  planWorkObj.departmentRef.code; /// --- ���� ������������ ����� ������������� ������� ��� �����������
                newTravelSheetObj.typeRef.code = tRealObj.travelSheetTypeRef.code;
                newTravelSheetObj.workModeRef.code = ENTravelWorkMode.BY_UNRATIONED;
                newTravelSheetObj.statusRef.code = ENTravelSheetStatus.GOOD;

                newTravelSheetObj.finWorker.code = Integer.MIN_VALUE;
                newTravelSheetObj.finWorker.name = fList.get(0).name;
                newTravelSheetObj.finWorker.tabNumber = fList.get(0).tabNumber;
                newTravelSheetObj.finWorker.positionCode = fList.get(0).positionCode;
                newTravelSheetObj.finWorker.positionName = fList.get(0).positionName;
                newTravelSheetObj.finWorker.departmentCode = fList.get(0).departmentCode;
                newTravelSheetObj.finWorker.departmentName = fList.get(0).departmentName;
                newTravelSheetObj.finWorker.priceGen = fList.get(0).priceGen;
                newTravelSheetObj.finWorker.categor = fList.get(0).categor;
                newTravelSheetObj.finWorker.finCode = fList.get(0).finCode;
                newTravelSheetObj.finWorker.kindRef.code = FINWorkerKind.OTHER;
                // MDAX-441
                newTravelSheetObj.finWorker.positionId = fList.get(0).positionId;

                newTravelSheetObj.transportReal.code = transportReal;

                newTravelSheetCode = travelSheetController.add(newTravelSheetObj);


                /*�������� ����� ����� ��� �������� �����*/
                ENTransportItemFilter itemFilter = new ENTransportItemFilter();
                itemFilter.conditionSQL = "code in (SELECT transportitemcode from entrnsprtrdr2trnsprttm where transportordercode = " + transportOrderCode+")";
                int[] itemCodesList = transportItemDAO.getFilteredCodeArray(itemFilter, 0, -1);

                BigDecimal sumdist = new BigDecimal(0.0);
                BigDecimal sumhours = new BigDecimal(0.0);
                for(int i=0; i < itemCodesList.length; i++)
                {
                    sumdist = sumdist.add(toLogic.getDistancesByTransportItem(itemCodesList[i]));
                    sumhours = sumhours.add(toLogic.getSumMachineHoursByTransportItem(itemCodesList[i]));
                }
                if ((sumdist.compareTo(new BigDecimal(0)) == 0) && (sumhours.compareTo(new BigDecimal(0)) == 0))
                {throw new EnergyproSystemException("������ � ������� ������������ � ������������ ����� ��������� ������ ��� ���������� �������� �� ��������� ������!");}

                if  ((newTravelSheetObj.statusRef.code == ENTravelSheetStatus.PLAN) ||  (newTravelSheetObj.statusRef.code == ENTravelSheetStatus.GOOD))
                {
                    if  (planWorkObj.kind.code != ENPlanWorkKind.NPW)
                    {
                        throw new EnergyproSystemException("��������� �������� ��������� ����! �� ������ ����� ������ ����� � ��������� ���� � �������� '���������� �����'!");
                    }
                }

                /*������� finworker'a � transportReal*/
                objRef = context.lookup(ENTransportItemController.JNDI_NAME);
                ENTransportItemControllerHome transportItemHome = (ENTransportItemControllerHome) PortableRemoteObject.narrow(objRef, ENTransportItemControllerHome.class);
                ENTransportItemController transportItemController = transportItemHome.create();

                for(int i=0; i < itemCodesList.length; i++)
                {
                    ENTransportItem tiObj = transportItemDAO.getObject(itemCodesList[i]);


                    tiObj.finWorker.code = Integer.MIN_VALUE;
                    tiObj.finWorker.name = newTravelSheetObj.finWorker.name;
                    tiObj.finWorker.tabNumber = newTravelSheetObj.finWorker.tabNumber;
                    tiObj.finWorker.positionCode = newTravelSheetObj.finWorker.positionCode;
                    tiObj.finWorker.positionName = newTravelSheetObj.finWorker.positionName;
                    tiObj.finWorker.departmentCode = newTravelSheetObj.finWorker.departmentCode;
                    tiObj.finWorker.departmentName = newTravelSheetObj.finWorker.departmentName;
                    tiObj.finWorker.priceGen = newTravelSheetObj.finWorker.priceGen;
                    tiObj.finWorker.categor = newTravelSheetObj.finWorker.categor;
                    tiObj.finWorker.finCode = newTravelSheetObj.finWorker.finCode;
                    tiObj.finWorker.kindRef.code = FINWorkerKind.OTHER;
    				// MDAX-441
    				tiObj.finWorker.positionId = newTravelSheetObj.finWorker.positionId;

                    tiObj.transportReal.code = tRealObj.code;



                    transportItemController.saveForTransportOrder(tiObj);

                }

                travelSheetController.addItemsDetailedForTransportOrder(newTravelSheetCode, itemCodesList);

                /*������� ������ ������������ ������ � �������� �����*/
                ENTransportOrder2Travel newTotObj = new ENTransportOrder2Travel();

                newTotObj.code = Integer.MIN_VALUE;
                newTotObj.transportorder.code = transportOrderCode;
                newTotObj.travelsheet.code = newTravelSheetCode;

                totDAO.add(newTotObj);

                toLogic.insertTravelSheet2TransportOrder(transportOrderObj.code, newTravelSheetCode);


        }

        // �������������� �������� - ����� ������ ������ ����������� ���� �������� � ������� ���� �� ���������� ������� (������� ��������)
        if(!toLogic.isTransportItemsInTravelByTransportOrderCode(transportOrderCode))
            throw new EnergyproSystemException("������ ������ (��� " + transportOrderCode + ") �� ���������� � ��������� ����. ��������� �� ���!");

        int[] childCodes = toLogic.getCodesAllTransportOrdersByParent(transportOrderCode);
        for(int i = 0; i < childCodes.length; i++)
        {
            if(!toLogic.isTransportItemsInTravelByTransportOrderCode(childCodes[i]))
                throw new EnergyproSystemException("������ ������ (��� " + childCodes[i] + ") �� ���������� � ��������� ����. ��������� �� ���!");
        }


	        transportOrderObj.transportOrderStatus.code = ENTransportOrderStatus.IN_WORK;
	        toLogic.updateStatusForTransportOrder(transportOrderObj.code, ENTransportOrderStatus.IN_WORK);


	        toLogic.updateTransportRealInTransportOrder(transportOrderObj.code, transportReal);

			trDAO.save(transportOrderObj);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENTravelSheet%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (NamingException e) {
			e.printStackTrace();
			throw new EnergyproSystemException("NamingException :"
					+ e.getMessage(), e);
		} catch (CreateException e) {
			e.printStackTrace();
			throw new EnergyproSystemException("CreateException :"
					+ e.getMessage(), e);
		} catch (RemoteException e) {
			throw new EnergyproSystemException(e);
		} finally {

			try {
                if (finOsConn != null && ! finOsConn.isClosed()) {
                	finOsConn.close();
                	finOsConn = null;
                }
            } catch (SQLException e) {
            }
			try {
                if (finConn != null && ! finConn.isClosed()) {
                	finConn.close();
                	finConn = null;
                }
            } catch (SQLException e) {
            }
			try {
                if (netConn != null && ! netConn.isClosed()) {
                	netConn.close();
                	netConn = null;
                }
            } catch (SQLException e) {
            }
		}
	}



  public void addTransportFromSideOnTransportOrder(int transportOrderCode, int transportReal) throws java.rmi.RemoteException
  {
    try
    {

        ENTransportOrderDAO trDAO = new ENTransportOrderDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        TKTransportRealDAO trealDAO = new TKTransportRealDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        TransportOrderLogic toLogic = new TransportOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        ENTransportItemDAO transportItemDAO = new ENTransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        Context context = new InitialContext();
            Object objRef = null;

        /*�������� �� ����������� ������� ���������� ��������*/
        int[] tsArr = toLogic.getCodesAllTransportOrdersByParent(transportOrderCode);
        for(int i = 0; i < tsArr.length; i++)
        {
            int[] tsTransportArray = toLogic.getTransportItemCodesByTransportOrderCode(tsArr[i]);
            for(int j = 0; j < tsTransportArray.length; j++)
                tLogic.validateDeliveryOrder(tsTransportArray[j]);
        }
        tsArr = toLogic.getTransportItemCodesByTransportOrderCode(transportOrderCode);
        for(int i = 0; i < tsArr.length; i++)
            tLogic.validateDeliveryOrder(tsArr[i]);

        ENTransportOrder transportOrderObj = trDAO.getObject(transportOrderCode);
        TKTransportReal tRealObj = trealDAO.getObject(transportReal);

        if (tRealObj.isVerified == TKConsts.TKTRANSPORTREAL_ISVERIFIED_TRUE)
            {
            if (transportOrderObj.isApproved != ENTransportOrder.isApproved_true)
            {throw new EnergyproSystemException("������ �� ������������!");}
            }

        transportOrderObj.transportReal.code = transportReal;

            /*�������� ������� ������� ������*/
            toLogic.checkTimePeriod(transportOrderObj);

                /*�������� ����� ����� ��� �������� �����*/
                ENTransportItemFilter itemFilter = new ENTransportItemFilter();
                itemFilter.conditionSQL = "code in (SELECT transportitemcode from entrnsprtrdr2trnsprttm where transportordercode = " + transportOrderCode+")";
                int[] itemCodesList = transportItemDAO.getFilteredCodeArray(itemFilter, 0, -1);

                BigDecimal sumdist = new BigDecimal(0.0);
                BigDecimal sumhours = new BigDecimal(0.0);
                for(int i=0; i < itemCodesList.length; i++)
                {
                    sumdist = sumdist.add(toLogic.getDistancesByTransportItem(itemCodesList[i]));
                    sumhours = sumhours.add(toLogic.getSumMachineHoursByTransportItem(itemCodesList[i]));
                }
                if ((sumdist.compareTo(new BigDecimal(0)) == 0) && (sumhours.compareTo(new BigDecimal(0)) == 0))
                {throw new EnergyproSystemException("������ � ������� ������������ � ������������ ����� ��������� ������ ��� ���������� �������� �� ��������� ������!");}

                /*������  TransportItem'a*/
                objRef = context.lookup(ENTransportItemController.JNDI_NAME);
                ENTransportItemControllerHome transportItemHome = (ENTransportItemControllerHome) PortableRemoteObject.narrow(objRef, ENTransportItemControllerHome.class);
                ENTransportItemController transportItemController = transportItemHome.create();

                for(int i=0; i < itemCodesList.length; i++)
                {
                    ENTransportItem tiObj = transportItemDAO.getObject(itemCodesList[i]);

                        tiObj.transportReal.code = tRealObj.code;
                        tiObj.finWorker.code = Integer.MIN_VALUE;
                        tiObj.finWorker.tabNumber = null;

                    int transportItemFact;
                    transportItemFact = tLogic.getTransportItemCodeFactByTransportItemPlan(tiObj.code);
                    if (transportItemFact != Integer.MIN_VALUE)
                    {
                        ENTransportItem tiObjFact = transportItemDAO.getObject(transportItemFact);
                        tiObjFact.transportReal.code = tRealObj.code;
                        tiObjFact.finWorker.code = Integer.MIN_VALUE;
                        tiObjFact.finWorker.tabNumber = null;
                        transportItemController.saveForTransportOrder(tiObjFact);
                    }

                    transportItemController.saveForTransportOrder(tiObj);

        }

        transportOrderObj.transportOrderStatus.code = ENTransportOrderStatus.IN_WORK;
        // toLogic.updateStatusForTransportOrder(transportOrderObj.code, ENTransportOrderStatus.IN_WORK);
        // toLogic.updateTransportRealInTransportOrder(transportOrderObj.code, transportReal);

        trDAO.save(transportOrderObj);
    }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTravelSheet%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    catch (NamingException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("NamingException :" + e.getMessage(), e);
        } catch (CreateException e) {
            e.printStackTrace();
            throw new EnergyproSystemException("CreateException :" + e.getMessage(), e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e);
        }
    finally                              {closeConnection();}
  }

  public void addTransportOrderWithTransportItems(ENTransportItemShort[] transportItemList, Date timeFrom, Date dateFrom, Date timeTill, Date dateTill, int transportDepartmentCode, int isAssignment)
  {
	  addTransportOrderWithTransportItems(transportItemList, timeFrom, dateFrom, timeTill, dateTill, transportDepartmentCode, isAssignment, false);
  }

/** ��������� ������ �� ��������� ����������������
 *
 * @param transportItemList
 * @param timeFrom
 * @param dateFrom
 * @param timeTill
 * @param dateTill
 * @param transportDepartmentCode
 * @param isAssignment
 * @param isFromServices
 */


  public void addTransportOrderWithTransportItems(ENTransportItemShort[] transportItemList, Date timeFrom, Date dateFrom, Date timeTill, Date dateTill, int transportDepartmentCode, int isAssignment,
		  	boolean isFromServices)
    {
        try
        {
            TransportOrderLogic toLogic = new TransportOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENTransportItemDAO triDAO = new ENTransportItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENDeliveryOrderDAO doDAO = new ENDeliveryOrderDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENWorkOrder2ENPlanWorkDAO w2pDAO = new ENWorkOrder2ENPlanWorkDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            //TKTechCardDAO tcDAO = new TKTechCardDAO();

            ENWorkOrder2ENPlanWorkFilter w2pFilter = new ENWorkOrder2ENPlanWorkFilter();
            w2pFilter.plan.code = transportItemList[0].planRefCode;

            ENWorkOrder2ENPlanWorkShortList w2oShort = w2pDAO.getScrollableFilteredList(w2pFilter, 0, -1);

            ENTransportItem triObj = triDAO.getObject(transportItemList[0].code);
            String transportClassificationName = "";

            /*�������� ��� ��������-���� ��������� ��������-����� �� ������*/
            for(int i = 0; i < transportItemList.length; i++)
            {
                toLogic.checkENTransportItemInTransportOrderByCode(transportItemList[i].code);
            }

            /*�������� ��������� ������ ENTransportItem �� ������� ��������, ���� ���� - �������� exception*/
            ENDeliveryOrderFilter doFilter = new ENDeliveryOrderFilter();
            for(int i = 0; i < transportItemList.length; i++)
            {
                doFilter.conditionSQL = " d.code IN (SELECT ENDELIVERYORDER.CODE FROM ENDELIVERYORDER " +
                                        " WHERE ENDELIVERYORDER.TRANSPORTINREFCODE = " + transportItemList[i].code +
                                        "OR ENDELIVERYORDER.TRANSPORTOUTCODE = " + transportItemList[i].code+")";

                ENDeliveryOrderShortList doList = doDAO.getScrollableFilteredList(doFilter, 0, -1);

                if(doList.totalCount > 0)
                {
                    throw new EnergyproSystemException("��������� ������� ����������� ��������� � ������� ���������");
                }

            }

            /*�������� �� ��, ��� ��� ���������� ���������� ���������� ��������� ������ ��� ������ entransportitem'a*/
            if(triObj.tktransportType.code == TKTransportType.BRIGADE)
            {
                boolean isMoreThanOne = false;
                for(int i = 0; i < transportItemList.length; i++)
                {
                    BigDecimal dist = toLogic.getDistancesByTransportItem(transportItemList[i].code);
                    if(dist.compareTo(new BigDecimal(0)) == 0)
                    {
                    }
                    else
                    {
                        if(isMoreThanOne)
                        {
                            throw new EnergyproSystemException("��� ���������� ���������� ��������� ���������� ����� �� ���� ������");
                        }
                        isMoreThanOne = true;
                    }
                }
            }

            /*�������� ��� ������ �� ���. ��������� ��������� �� ��������*/
            if(triObj.planItemRef.code != Integer.MIN_VALUE)
            {
                ENPlanWorkItemShort piObj = piDAO.getShortObject(triObj.planItemRef.code);
                if(piObj.countGen.doubleValue() <= 0)
                    throw new EnergyproSystemException("������ " + piObj.kartaNum + " " + piObj.kartaRefName + " �������");
            }

            if (w2oShort.totalCount < 1)
            {
                throw new EnergyproSystemException("�� ���� ������� ���� �����-�������� ��� ��������� ���� ���� ��������������...", getUserProfile());
            }

            ENWorkOrderDAO wDAO = new ENWorkOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENPlanWork plan = new ENPlanWork();
            plan = planDAO.getObject(transportItemList[0].planRefCode);

            /////
            // �� ����� ������� ������������ ������ �� �������-�����, ���� � ��� ���� ������, � ������ � ���� �� �������� � ������� �������
            // (����� �����, ������ ���, ����� �������� ������, ��������� �������-���� � ������������ ������ ���������)
            if (plan.kind.code == ENPlanWorkKind.NPW && !isFromServices)
            {
	            PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	            planLogic.checkSealsInWorkOrderByt(plan.code);
            }
            /////

            ENWorkOrder w = new ENWorkOrder();
                w = wDAO.getObject(w2oShort.get(0).workOrderCode);

            ENTransportOrderDAO trOrderDAO = new ENTransportOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENTransportDep2DepDAO trDep2DepDAO = new ENTransportDep2DepDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTransportDep2DepFilter trDep2DepFilter = new ENTransportDep2DepFilter();

            trDep2DepFilter.department.code = plan.departmentRef.code;
            ENTransportDep2DepShortList trDep2DepShortList =  trDep2DepDAO.getFilteredList(trDep2DepFilter);


            ENTransportOrder torder = new ENTransportOrder();

            if(isAssignment != ENTransportOrder.isAssignment_false && isAssignment != ENTransportOrder.isAssignment_true)
                throw new EnergyproSystemException("������������ ������� �������������� ������");

            torder.isAssignment = isAssignment;

            /*����� ������������ �������������*/
            if(transportClassificationName.length() == 0)
            {
                TKTransportClassificationDAO trcDAO = new TKTransportClassificationDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                TKTransportClassificationShortList trcList = new TKTransportClassificationShortList();
                String condition = " select tktransport.transportclassifictncd from tktransport where tktransport.code = " + transportItemList[0].transportCode;
                TKTransportClassificationFilter trcFilter = new TKTransportClassificationFilter();
                trcFilter.conditionSQL = TKTransportClassificationFilter.code_QFielld + " = (" + condition + ")";
                trcList = trcDAO.getScrollableFilteredList(trcFilter, 0, -1);
                if(trcList.totalCount > 0)
                    transportClassificationName = trcList.get(0).name;
            }




            torder.code = Integer.MIN_VALUE;
            torder.numbergen =  w.workOrderNumber +  " (" + transportClassificationName + ")";
            torder.timeStart = timeFrom;
            torder.timeFinal = timeTill;
            torder.dateStart = dateFrom;
            torder.dateFinal = dateTill;
            torder.dateEdit =  new Date();
            torder.transportOrderStatus.code = ENTransportOrderStatus.GOOD;
            torder.planRef.code = transportItemList[0].planRefCode;
            torder.transport.code = transportItemList[0].transportCode;
            if(transportDepartmentCode == Integer.MIN_VALUE) {
                if (trDep2DepShortList.totalCount < 1) {
                    throw new EnergyproSystemException("������� � ����� ��������... ʳ������ 0!!!", getUserProfile());
                }
                torder.transportDepartment.code = trDep2DepShortList.get(0).transportDepartmentCode;
            } else {
                torder.transportDepartment.code = transportDepartmentCode;
            }
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(torder.dateStart);

            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            calendar.set(Calendar.HOUR_OF_DAY, torder.timeStart.getHours());
            calendar.set(Calendar.MINUTE, torder.timeStart.getMinutes());
            torder.timeStart = calendar.getTime();

            Calendar calendar1 = Calendar.getInstance();
            calendar1.setTime(torder.dateFinal);

            calendar1.set(Calendar.SECOND, 0);
            calendar1.set(Calendar.MILLISECOND, 0);
            calendar1.set(Calendar.HOUR_OF_DAY,  torder.timeFinal.getHours());
            calendar1.set(Calendar.MINUTE,  torder.timeFinal.getMinutes());
            torder.timeFinal = calendar1.getTime();


            if (torder.dateStart.after(w.dateGen)) {

            }


            int trordercode = trOrderDAO.add(torder);

            toLogic.checkDates(torder);

            ENTransportOrder2TransportItemDAO to2tiDAO = new ENTransportOrder2TransportItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENTransportOrder2TransportItem to2ti = new ENTransportOrder2TransportItem();

            for (int i=0; i < transportItemList.length; i++){
                to2ti.code = Integer.MIN_VALUE;
                to2ti.transportOrder.code = trordercode;
                to2ti.transportItem.code = transportItemList[i].code;
                to2tiDAO.add(to2ti);
            }

  }
  catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTransportOrder%} object.",e);}
  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
  finally                              {closeConnection();}

    }


@Override
public void save(ENTransportOrder object)
  {
    Connection enConn = null;

   try
    {
    enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

    TransportOrderLogic toLogic = new TransportOrderLogic(enConn, getUserProfile());
    ENTransportItemDAO triDAO = new ENTransportItemDAO(getUserProfile(),enConn);
    ENTransportOrderDAO toDAO = new ENTransportOrderDAO(enConn, getUserProfile());
    ENTransportOrder2TransportItemDAO totiDAO = new ENTransportOrder2TransportItemDAO(enConn, getUserProfile());


    ENTransportOrder2TransportItemFilter totiFilter = new ENTransportOrder2TransportItemFilter();
    totiFilter.transportOrder.code = object.code;
    ENTransportOrder2TransportItemShortList totiList = totiDAO.getScrollableFilteredList(totiFilter, 0, -1);

    object.dateStart = Tools.clearTimeOfDate(object.dateStart);
    object.dateFinal = Tools.clearTimeOfDate(object.dateFinal);

    Calendar calendar = Calendar.getInstance();
      calendar.setTime(object.dateStart);
      calendar.set(Calendar.SECOND, 0);
      calendar.set(Calendar.MILLISECOND, 0);
      calendar.set(Calendar.HOUR, object.timeStart.getHours());
      calendar.set(Calendar.MINUTE, object.timeStart.getMinutes());
      object.timeStart = calendar.getTime();

      Calendar calendar1 = Calendar.getInstance();
      calendar1.setTime(object.dateFinal);

      calendar1.set(Calendar.SECOND, 0);
      calendar1.set(Calendar.MILLISECOND, 0);
      calendar1.set(Calendar.HOUR, object.timeFinal.getHours());
      calendar1.set(Calendar.MINUTE, object.timeFinal.getMinutes());
      object.timeFinal = calendar1.getTime();

      toLogic.checkDates(object);

      if (object.transportOrderStatus.code != ENTransportOrderStatus.GOOD)
      {
        throw new EnergyproSystemException("���������� ����� ����� ������ ������!");
      }

      toLogic.checkTransportOrderInTravelSheet(object.code);

      ENTransportItem triObj = triDAO.getObject(totiList.get(0).transportItemCode);

        /*���� �� ��������� ���������� - � ������� ������������ ������ - �� �������� exception*/
        if(triObj.tktransportType.code != TKTransportType.BRIGADE && object.parentRef.code != Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("������ ������ ������� �������� ����� ��� ���������� ����������");
        }

        /*����������� �� ������ ������*/
        if(object.parentRef.code != Integer.MIN_VALUE)
        {
            /*���� �� ������������ ������ - �� ��������� ��������� - �� ������� exception*/
            ENTransportOrder2TransportItemFilter parentTotiFilter = new ENTransportOrder2TransportItemFilter();
            parentTotiFilter.transportOrder.code = object.parentRef.code;
            ENTransportOrder2TransportItemShortList parentTotiList = totiDAO.getScrollableFilteredList(parentTotiFilter, 0, -1);
            ENTransportItem parentTriObj = triDAO.getObject(parentTotiList.get(0).transportItemCode);

            /*���� ������ �� ���. �������� ������ ������ ���������*/
            if(!toLogic.checkPlanCompability(object.code, object.parentRef.code))
            {
                throw new EnergyproSystemException("�� ���������� ���� ����� ������ (��������-���� �� �������� ����)");
            }

            ENTransportOrder parentObj = toDAO.getObject(object.parentRef.code);

            if(parentTriObj.tktransportType.code != TKTransportType.BRIGADE)
            {
                throw new EnergyproSystemException("������ ������ ������� �������� ����� ��� ���������� ����������");
            }

            /*���� ���� �� ������ - �� �������� - �������� exception*/
            if(object.transportOrderStatus.code != ENTransportOrderStatus.GOOD)
            {
                throw new EnergyproSystemException("�������� ������ ������ ����� ����� ��� ������ � �������� '��������'");
            }

            if(parentObj.transportOrderStatus.code != ENTransportOrderStatus.GOOD)
            {
                throw new EnergyproSystemException("�������� ������ ������ ����� ����� ��� ������ � �������� '��������'");
            }

            /*����� ��� ���������� ������ ������ ���� �������*/
            if(parentObj.planRef.code == object.planRef.code)
            {
                throw new EnergyproSystemException("ֳ �� ������ �������� �� ���� � ��� �� ����");
            }

            /*19.04.2012 ������ �������� ������ � ������*/
            int[] childCodes = toLogic.getCodesAllTransportOrdersByParent(object.code);
            for(int i = 0; i < childCodes.length; i++)
            {
                if(parentObj.code == childCodes[i])
                {
                    throw new EnergyproSystemException("������ � "+parentObj.numbergen + " ���  ��'����� �� ������� � " + object.numbergen + " ����� ���� ����� ������");
                }

            }


            /*���������� ������ - ������ ��� �������� ������*/
            ENPlanWork pwObjIn = toLogic.getPlanWorkByTransportOrderCode(object.code);

            if(pwObjIn.kind.code == ENPlanWorkKind.FACT)
            {
                throw new EnergyproSystemException("����� ������ ��������� ����� ��� ����� ���� '��������-����'");
            }

            /*18.05.2012 ��������, ��� ��������� ������������ ������ ��� �� �������� �� ��� ���� ������������*/
            {
                ENTransportOrderFilter parentCodesFilter = new ENTransportOrderFilter();
                parentCodesFilter.parentRef.code = parentObj.code;
                parentCodesFilter.conditionSQL = " ENTRANSPORTORDER.CODE <> " + object.code;
                int[] parentCodes = toDAO.getFilteredCodeArray(parentCodesFilter, 0, -1);
                if(parentCodes.length > 0)
                {
                    ENTransportOrder anotherChildObj = toDAO.getObject(parentCodes[0]);
                    throw new EnergyproSystemException("������ � "+parentObj.numbergen+" ��� ��'����� � ����� ������� � " + anotherChildObj.numbergen);
                }
            }

            /*�������� ������ ����� ����������� ������������ ������*/
            object.dateStart = parentObj.dateStart;
            object.dateFinal = parentObj.dateFinal;
            object.timeStart = parentObj.timeStart;
            object.timeFinal = parentObj.timeFinal;

        }

        /*����������� ����� ���� �������� ������� �� ������� ������������ ������*/
        ENTransportOrderFilter childTrOrdFilter = new ENTransportOrderFilter();
        childTrOrdFilter.conditionSQL = "ENTRANSPORTORDER.PARENTREFCODE = " + object.code;
        ENTransportOrderShortList childTrOrdList = toDAO.getScrollableFilteredList(childTrOrdFilter, 0, -1);
        if (childTrOrdList.totalCount > 0)
        {
        toLogic.updateTimeForTransportOrder(object.code, object.dateStart, object.dateFinal, object.timeStart, object.timeFinal);
        }


     ENTransportOrderDAO objectDAO = new ENTransportOrderDAO(getUserProfile(),enConn);
     objectDAO.save(object);
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENTransportOrder%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);} catch (RemoteException e) {
    e.printStackTrace();
} catch (NamingException e) {
    e.printStackTrace();
    throw new EnergyproSystemException(e);
} catch (CreateException e) {
    e.printStackTrace();
    throw new EnergyproSystemException(e);
}
   finally                              {closeConnection();}
  }

  public void removeTransportOrderWithTransportItems(int transportOrderCode)
    {
        try
        {

            ENTransportOrderDAO trOrderDAO = new ENTransportOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTransportOrder2TransportItemDAO to2tiDAO = new ENTransportOrder2TransportItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            TransportOrderLogic toLogic = new TransportOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENTransportOrder2TransportItemFilter to2tiFilter = new ENTransportOrder2TransportItemFilter();
            to2tiFilter.transportOrder.code = transportOrderCode;
            ENTransportOrder2TransportItemShortList to2tiList = to2tiDAO.getFilteredList(to2tiFilter);

            ENTransportOrderFilter toFilter = new ENTransportOrderFilter();
            toFilter.parentRef.code = transportOrderCode;
            ENTransportOrderShortList toList = trOrderDAO.getScrollableFilteredListWithoutSegregation(toFilter, 0, -1);
            if (toList.totalCount > 0) {
                String childNumbers = "";

                for(int i = 0; i < toList.totalCount; i++)
                {
                    if(childNumbers.length() == 0)
                        childNumbers = toList.get(i).numbergen + "�����-�������� � " + toList.get(i).planRefWorkOrderNumber + ".";
                    else
                        childNumbers = childNumbers + ", " + toList.get(i).numbergen + "�����-�������� � " + toList.get(i).planRefWorkOrderNumber + ".";
                }

                throw new EnergyproSystemException("�� ������ ��'����� � ������ (��������) ��������: " + childNumbers +
                        "\n ������� �� �� ������ �� ��������� ��'���� � ���� ������� (�� ������� \"��� ������ ����������\" � �������-����)!");
            }

            /*������������ ������*/

            ENTransportOrder toObj = trOrderDAO.getObjectNOSEGR(transportOrderCode);

            if(toObj.parentRef.code != Integer.MIN_VALUE)
            {
            	ENTransportOrder torParent = trOrderDAO.getObject(toObj.parentRef.code);
                throw new EnergyproSystemException("�� ������ ��'����� � ����� (�����������) ������� � " + torParent.numbergen +
                        "\n ��������� ��'���� �� ������� \"��� ������ ����������\" � ����� �������-����!");
            }

            toLogic.checkTransportOrderInTravelSheet(transportOrderCode);

            if (toObj.transportOrderStatus.code != ENTransportOrderStatus.GOOD)
            {
                throw new EnergyproSystemException("�������� ����� ����� ������ ������!");
            }

            for (int i=0; i < to2tiList.totalCount ; i++){
                to2tiDAO.remove(to2tiList.get(i).code);
            }

            trOrderDAO.removeWithoutSegregation(transportOrderCode);



}
catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTransportOrder%} object.",e);}
catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
finally                              {closeConnection();}

    }

  public void removeTransportOrderItemsFromTravelSheet(int transportOrderCode) throws java.rmi.RemoteException
  {
    try
    {
        TransportOrderLogic toLogic = new TransportOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        try {
            toLogic.removeTransportOrderItemsFromTravelSheet(transportOrderCode);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e);
        }
    }
 catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTransportOrder%} object.",e);}
 catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
 finally                              {closeConnection();}

  }

} // end of EJB Controller for ENTransportOrder
