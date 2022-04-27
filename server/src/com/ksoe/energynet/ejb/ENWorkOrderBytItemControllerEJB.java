
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENWorkOrderBytItem;
 *
 */

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENHumenItemDAO;
import com.ksoe.energynet.dataminer.ENMetrologyCounterDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENRecordPointBytDAO;
import com.ksoe.energynet.dataminer.ENRecordPointPromDAO;
import com.ksoe.energynet.dataminer.ENRouteBytDAO;
import com.ksoe.energynet.dataminer.ENRouteBytDetailDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytItem2MarkDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytItemDAO;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.ejb.generated.ENWorkOrderBytItemControllerEJBGen;
import com.ksoe.energynet.logic.ElementLogic;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.SCLogic;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.logic.WorkOrderLogic;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENHumenItem;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENRecordPointByt;
import com.ksoe.energynet.valueobject.ENRecordPointProm;
import com.ksoe.energynet.valueobject.ENRouteByt;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENWorkOrderByt;
import com.ksoe.energynet.valueobject.ENWorkOrderBytItem;
import com.ksoe.energynet.valueobject.ENWorkOrderBytItem2Mark;
import com.ksoe.energynet.valueobject.ENWorkOrderBytStatus;
import com.ksoe.energynet.valueobject.ENWorkOrderBytType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderBytItemShort;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.filter.ENRecordPointBytFilter;
import com.ksoe.energynet.valueobject.filter.ENRecordPointPromFilter;
import com.ksoe.energynet.valueobject.filter.ENRouteBytDetailFilter;
import com.ksoe.energynet.valueobject.filter.ENRouteBytFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItem2MarkFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItemFilter;
import com.ksoe.energynet.valueobject.lists.ENHumenItemShortList;
import com.ksoe.energynet.valueobject.lists.ENRecordPointBytShortList;
import com.ksoe.energynet.valueobject.lists.ENRecordPointPromShortList;
import com.ksoe.energynet.valueobject.lists.ENRouteBytShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENWorkOrderBytItemControllerEJB extends
		ENWorkOrderBytItemControllerEJBGen {

	public ENWorkOrderBytItemControllerEJB() {
	}

	@Override
	public int add(ENWorkOrderBytItem object)
	{
		return add(object, false);
	}

	public int add(ENWorkOrderBytItem object, boolean isFromBilling)
	{
		Connection enConn = null;

		try
		{
			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			if (object.humenItemRef == null)
			{
				throw new SystemException("\n\nNET-4350 �� ������� ��� ������������ ���������� � �����!");
			}

			if (object.humenItemRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4350 �� ������� ��� ������������ ���������� � �����!");
			}


			ENWorkOrderBytItemDAO objectDAO = new ENWorkOrderBytItemDAO(getUserProfile(), enConn);
			ENHumenItemDAO humenItemDAO = new ENHumenItemDAO(getUserProfile(), enConn);
			ElementLogic elementLogic = new ElementLogic(enConn, getUserProfile());
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), enConn);
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), enConn);
			ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(getUserProfile(), enConn);
			ENWorkOrderBytItem2MarkDAO markDAO = new ENWorkOrderBytItem2MarkDAO(getUserProfile(), enConn);
	        ENRecordPointBytDAO recordPointBytDAO = new ENRecordPointBytDAO(getUserProfile(), enConn);
	        ENRecordPointPromDAO recordPointPromDAO = new ENRecordPointPromDAO(getUserProfile(), enConn);
	        ENRouteBytDAO routeBytDAO = new ENRouteBytDAO(getUserProfile(), enConn);
	        ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(getUserProfile(), enConn);
	        ServicesLogic servicesLogic = new ServicesLogic(enConn, getUserProfile());



			ENHumenItem humenItem = humenItemDAO.getObject(object.humenItemRef.code);

	        int elementType = elementLogic.getElementTypeByPlanCode(humenItem.planRef.code);

	        if (elementType != ENElementType.TY_BYT &&
	        	elementType != ENElementType.TY_PROM &&
	        	elementType != ENElementType.SERVICES_OBJECT &&
	        	elementType != ENElementType.ROUTE_BYT &&
	        	// 05.06.16 ��� �������� ����� � ������ ����
	        	elementType != ENElementType.LINE04 &&
	        	elementType != ENElementType.LINE_CABLE &&
	        	elementType != ENElementType.SUBSTATION04 &&
	        	/*��� ���� � ���������� */
	        	elementType != ENElementType.METROLOGY_COUNTER)
	        {
	        	throw new SystemException("\n\nNET-4350 �������� ��� ���� ��''���� ���������� (" + elementType + ")!");
	        }

    		ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(object.workOrderBytRef.code);

    		if (workOrderByt == null)
    		{
    			throw new SystemException("\n\nNET-4350 �� �������� ����� ��������! ��� = " + object.workOrderBytRef.code);
    		}

			if ((workOrderByt.typeRef.code == ENWorkOrderBytType.RAID_BY_BILLING || workOrderByt.typeRef.code == ENWorkOrderBytType.CONTROL)
					&& !isFromBilling)
			{
				throw new SystemException("\n\nNET-4431 �� �������� ���� ���������� � �����! ��������� ����� � ����� ������� ����� ���� � �����!");
			}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.BY_ENERGYNET && !isFromBilling)
			{
				throw new SystemException("\n\nNET-4431 ������������ ��� ������� ��������! ��� ��������: " + object.workOrderBytRef.code +
						", ��� ����: " + workOrderByt.typeRef.code);
			}

			// �������� ������� �������� ������� (���� � ������� ������� ���� ������,
			// �� ������ � ���� ����� ��������� ������, ���� ��� ��������)
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			if (scLogic.isWorkOrderBytWithSeals(object.workOrderBytRef.code))
			{
				scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.DRAFT, true);
			}

	        ///// SUPP-16785 ����������� ������ ������ �� ���� �����
	        ENPlanWork plan = planDAO.getObject(humenItem.planRef.code);

	        if (plan == null)
	        {
	        	throw new SystemException("\n\nNET-4350 �� �������� ���� � ����� " + humenItem.planRef.code + " !");
	        }

	        if (plan.kind.code != ENPlanWorkKind.NPW || plan.status.code != ENPlanWorkStatus.GOOD)
	        {
	        	throw new SystemException("\n\nNET-4350 � ���� �������� ������������ �������� ����� �����² ��������-�����!\n" +
	        			"���� � ����� " + plan.code + " �� � �������� ���������-������!");
	        }

	        ENPlanWorkItem planItem = planItemDAO.getObject(humenItem.planItemRef.code);

	        if (planItem == null)
	        {
	        	throw new SystemException("\n\nNET-4350 �� �������� ������ � ����� " + humenItem.planItemRef.code + " !");
	        }

	        if (planItem.countGen.compareTo(new BigDecimal(0)) == 0)
	        {
	        	throw new SystemException("\n\nNET-4350 � ���� �������� ���������� �������� ������ � ������� 0!");
	        }

	        // ���� ���� ����� ���������� �� ���� �������� �������, �������� ���� ����� �� ���� �������
	        if (! plan.dateStart.equals(workOrderByt.dateGen))
	        {
	            PlanWorkLogic planLogic = new PlanWorkLogic(enConn, getUserProfile());

	            plan.dateStart = workOrderByt.dateGen;
	            plan.dateFinal = workOrderByt.dateGen;

	            planLogic.save(plan, true);
	        }
	        /////

	        ///// ��������, ����� �������� humenItem �� ��� ������� � ������ ������� �� ��� �� ����
	        ENWorkOrderBytItemFilter itemFilter = new ENWorkOrderBytItemFilter();
	        itemFilter.humenItemRef.code = object.humenItemRef.code;
	        //itemFilter.conditionSQL = "ENWORKORDERBYTITEM.CODE not in (select bi.code from enworkorderbytitem bi where bi.workorderbytrefcode = " + object.workOrderBytRef.code + ")";
	        itemFilter.conditionSQL = "ENWORKORDERBYTITEM.workorderbytrefcode <> " + object.workOrderBytRef.code;
	        //int itemArr[] = objectDAO.getFilteredCodeArray(itemFilter, 0, -1);
	        ENWorkOrderBytItemShortList itemList = objectDAO.getScrollableFilteredList(itemFilter, 0, -1);

        	//if (itemArr.length > 1)
	        /*
	        if (itemList.totalCount > 1)
        	{
        		throw new SystemException("\n\nNET-4350 �������� ������� (" + itemList.totalCount +
        				") ����� ������� ��� ������ ���������� �������! [humenItem.code = " + object.humenItemRef.code + "]");
        	}
        	else */
	        //if (itemList.totalCount == 1)
	        if (itemList.totalCount > 0)
        	{
        		/* 29.04.14 ������� �� �����, ����� ������ ������� ���������� � ��� �� ����, � ����� ��� ����!

        		// �������� ������� ������
        		// TODO: �������� ������� ��� ������� � ��������� ��� �������������� ?
        		this.remove(itemArr[0]);
        		// ����� ����������, ������ ��� ��� �������� ��������������� humenItem
        		humenItem = humenItemDAO.getObject(object.humenItemRef.code);

        		*/

        		for (int i = 0; i < itemList.totalCount; i++)
        		{
            		if (itemList.get(i).workOrderBytRefDateGen.equals(workOrderByt.dateGen))
            		{
            			throw new SystemException("\n\nNET-4350 ����� ������������ ���������� (��� ����) ��� �������� � ����� �������� � " +
                                                  itemList.get(i).workOrderBytRefNumberGen + " �� " +
                                                  new SimpleDateFormat("dd.MM.yyyy").format(itemList.get(i).workOrderBytRefDateGen) +
                                                  " (���: " + itemList.get(i).workOrderBytRefCode + ") !" +
                                                  "\n\n������������ ���������� ������� �������� ����� �� ������ �������� �� ����!"
    		                                     );
            		}
        		}

        	}
	        /////

	        /////
	        // ���� ������ humenItem ��� ������� � ��� �� �������
	        // (�.�. ��� �������� ������������� - ��������, �������� ���������),
	        // �� ������� �� ��� �������, � ����� ��������� ��� ���
	        itemFilter = new ENWorkOrderBytItemFilter();
	        itemFilter.humenItemRef.code = object.humenItemRef.code;
	        itemFilter.workOrderBytRef.code = object.workOrderBytRef.code;
	        // 13.01.15 ��� ������� �� ��������� ����� ��� � �� ����� ����� �����������
	        if (object.recordPointBytRef != null)
	        {
	        	if (object.recordPointBytRef.code != Integer.MIN_VALUE)
	        	{
	        		itemFilter.recordPointBytRef.code = object.recordPointBytRef.code;
	        	}
	        }
	        if (object.recordPointPromRef != null)
	        {
	        	if (object.recordPointPromRef.code != Integer.MIN_VALUE)
	        	{
	        		itemFilter.recordPointPromRef.code = object.recordPointPromRef.code;
	        	}
	        }

	        int itemArr[] = objectDAO.getFilteredCodeArray(itemFilter, 0, -1);

	        if (itemArr.length > 1)
        	{
        		throw new SystemException("\n\nNET-4350 �������� ������� (" + itemArr.length +
        				") ����� ������� ��� ������ ���������� �������! [humenItem.code = " + object.humenItemRef.code + "]");
        	}
	        else
	        if (itemArr.length == 1)
	        {
	        	boolean canRemove = true;

	        	if (object.routeBytRef != null)
	        	{
	        		if (object.routeBytRef.code != Integer.MIN_VALUE)
	        		{
	        			ENWorkOrderBytItem item = objectDAO.getObject(itemArr[0]);

	        			if (item.recordPointBytRef != null && object.recordPointBytRef != null)
	        			{
	        				// ���� humenItem ������� � ������� �� �������, �� �� ������ ����� �����, �� �� ������� ������
		        			if (item.recordPointBytRef.code != object.recordPointBytRef.code)
		        			{
		        				canRemove = false;
		        			}
		        			else
		        			{
		        				// ���� ����� ������� ������, � ������ ����� ��������� ������ � ���������
		        				ENWorkOrderBytItem2MarkFilter markFilter = new ENWorkOrderBytItem2MarkFilter();
		        				markFilter.workOrderBytItemRef.code = itemArr[0];
		        				int[] markArr = markDAO.getFilteredCodeArray(markFilter, 0, -1);

		        				for (int i = 0; i < markArr.length; i++)
		        				{
		        					markDAO.remove(markArr[i]);
		        				}
		        			}
	        			}

	        			if (item.recordPointPromRef != null && object.recordPointPromRef != null)
	        			{
	        				// ���� humenItem ������� � ������� �� �������, �� �� ������ ����� �����, �� �� ������� ������
		        			if (item.recordPointPromRef.code != object.recordPointPromRef.code)
		        			{
		        				canRemove = false;
		        			}
		        			else
		        			{
		        				// ���� ����� ������� ������, � ������ ����� ��������� ������ � ���������
		        				ENWorkOrderBytItem2MarkFilter markFilter = new ENWorkOrderBytItem2MarkFilter();
		        				markFilter.workOrderBytItemRef.code = itemArr[0];
		        				int[] markArr = markDAO.getFilteredCodeArray(markFilter, 0, -1);

		        				for (int i = 0; i < markArr.length; i++)
		        				{
		        					markDAO.remove(markArr[i]);
		        				}
		        			}
	        			}
	        		}
	        	}

	        	if (canRemove)
	        	{
	        		// �������� ������� ������
	        		this.remove(itemArr[0], isFromBilling);

	        		// ����� ����������, ������ ��� ��� �������� ��������������� humenItem
	        		humenItem = humenItemDAO.getObject(object.humenItemRef.code);
	        	}
	        }
	        /////

	        object.planRef.code = humenItem.planRef.code;
	        object.planItemRef.code = humenItem.planItemRef.code;

	        int elementCode = elementLogic.getElementCodeByPlanCode(humenItem.planRef.code);

	        if (elementType == ENElementType.TY_BYT)
	        {
	        	ENRecordPointBytFilter recordPointBytFilter = new ENRecordPointBytFilter();
	        	recordPointBytFilter.element.code = elementCode;

	        	int recordPointBytArr[] = recordPointBytDAO.getFilteredCodeArray(recordPointBytFilter, 0, -1);

	        	if (recordPointBytArr.length == 0)
	        	{
	        		throw new SystemException("\n\nNET-4350 �� �������� ����� �����! [elementCode = " + elementCode + "]");
	        	}

	        	if (recordPointBytArr.length > 1)
	        	{
	        		throw new SystemException("\n\nNET-4350 �������� ������� (" + recordPointBytArr.length +
	        				") ����� �����! [elementCode = " + elementCode + "]");
	        	}

	        	//ENRecordPointByt recordPointByt = recordPointBytDAO.getObject(recordPointBytArr[0]);
	        	ENRecordPointByt recordPointByt = recordPointBytDAO.getObjectNoSegr(recordPointBytArr[0]);

	        	if (recordPointByt == null)
	        	{
	        		throw new SystemException("\n\nNET-4350 �� �������� ����� �����! [elementCode = " + elementCode + "]");
	        	}

	        	object.recordPointBytRef.code = recordPointByt.code;
	        	object.accountNumber = recordPointByt.accountNumber;
	        	object.address = recordPointByt.address;
	        	object.name = recordPointByt.name;
	        	object.customerName = recordPointByt.name;
	        	object.invNumber = recordPointByt.invNumber;
	        	object.serialNumber = recordPointByt.serialNumber;
	        	object.phone = recordPointByt.phone;
	        	object.seal = recordPointByt.seal;
	        	///// 10.06.14 ���. ���� �� ENRecordPointByt
	            object.rpCode = recordPointByt.rpCode;
	            object.dateCounterInst = recordPointByt.dateCounterInst;
	            object.dateCounterCheck = recordPointByt.dateCounterCheck;
	            object.counterType = recordPointByt.counterType;
	            object.classAccuracy = recordPointByt.classAccuracy;
	            object.checkperiod = recordPointByt.checkperiod;
	            object.rpStatusCode = recordPointByt.statuscode;
	            object.phasity = recordPointByt.phasity;
	            object.datecheck = recordPointByt.datecheck;
	            object.checkperiod1 = recordPointByt.checkperiod1;
	            object.placecounter = recordPointByt.placecounter;
	            object.rpIsWorking = recordPointByt.isworking;
	            object.counterCapacity = recordPointByt.counterCapacity;
	            object.counterVoltageNominal = recordPointByt.counterVoltageNominal;
	            object.counterDateProduct = recordPointByt.counterDateProduct;
	            /////
	        }
	        else if (elementType == ENElementType.TY_PROM)
	        {
	        	ENRecordPointPromFilter recordPointPromFilter = new ENRecordPointPromFilter();
	        	recordPointPromFilter.element.code = elementCode;

	        	int recordPointPromArr[] = recordPointPromDAO.getFilteredCodeArray(recordPointPromFilter, 0, -1);

	        	if (recordPointPromArr.length == 0)
	        	{
	        		throw new SystemException("\n\nNET-4350 �� �������� ����� �����! [elementCode = " + elementCode + "]");
	        	}

	        	if (recordPointPromArr.length > 1)
	        	{
	        		throw new SystemException("\n\nNET-4350 �������� ������� (" + recordPointPromArr.length +
	        				") ����� �����! [elementCode = " + elementCode + "]");
	        	}

	        	//ENRecordPointProm recordPointProm = recordPointPromDAO.getObject(recordPointPromArr[0]);
	        	ENRecordPointProm recordPointProm = recordPointPromDAO.getObjectNoSegr(recordPointPromArr[0]);

	        	if (recordPointProm == null)
	        	{
	        		throw new SystemException("\n\nNET-4350 �� �������� ����� �����! [elementCode = " + elementCode + "]");
	        	}

	        	object.recordPointPromRef.code = recordPointProm.code;
	        	object.accountNumber = recordPointProm.accountNumber;
	        	object.address = recordPointProm.recordPointAddr;
	        	object.name = recordPointProm.accountName;
	        	object.customerName = recordPointProm.accountName;
	        	object.invNumber = recordPointProm.invNumber;
	        	object.serialNumber = recordPointProm.counterNumber;
	        	object.phone = recordPointProm.phone;
	        	object.seal = recordPointProm.seal;
	        	///// 12.11.14 ���. ���� �� ENRecordPointProm
	            object.rpCode = recordPointProm.recordPointCode;
	            object.dateCounterInst = recordPointProm.dateCounterInst;
	            object.dateCounterCheck = recordPointProm.dateCounterCheck;
	            object.counterType = recordPointProm.counterType;
	            object.classAccuracy = recordPointProm.classAccuracy;
	            object.checkperiod = recordPointProm.checkperiod;
	            object.rpStatusCode = recordPointProm.statuscode;
	            object.phasity = recordPointProm.phasity;
	            //object.datecheck = recordPointProm.datecheck;
	            //object.checkperiod1 = recordPointProm.checkperiod1;
	            object.placecounter = recordPointProm.placecounter;
	            object.rpIsWorking = recordPointProm.isworking;
	            object.recordPointName = recordPointProm.recordPointName;
	            object.counterCapacity = recordPointProm.counterCapacity;
	            object.counterVoltageNominal = recordPointProm.counterVoltageNominal;
	            object.counterDateProduct = recordPointProm.counterDateProduct;
	        }
	        else if (elementType == ENElementType.ROUTE_BYT)
	        {
	        	boolean isByt = false;
	        	boolean isProm = false;

	        	if (object.recordPointBytRef == null && object.recordPointPromRef == null)
	        	{
	        		throw new SystemException("\n\nNET-4431 �� ������� ��� ����� �����!");
	        	}

	        	if (object.recordPointBytRef != null)
	        	{
	        		if (object.recordPointBytRef.code != Integer.MIN_VALUE)
	        		{
	        			isByt = true;
	        		}
	        	}

	        	if (object.recordPointPromRef != null)
	        	{
	        		if (object.recordPointPromRef.code != Integer.MIN_VALUE)
	        		{
	        			isProm = true;
	        		}
	        	}

	        	/*
	        	if (object.recordPointBytRef.code == Integer.MIN_VALUE)
	        	{
	        		throw new SystemException("\n\nNET-4431 �� ������� ��� ����� �����!");
	        	}
	        	*/
	        	if ( (! isByt) && (! isProm) )
	        	{
	        		throw new SystemException("\n\nNET-4431 �� ������� ��� ����� �����!");
	        	}

	        	if (isByt && isProm)
	        	{
	        		throw new SystemException("\n\nNET-4431 ����� ����� ������� ���� ��� ���������, ��� �����������!");
	        	}

	        	if (object.routeBytRef == null)
	        	{
	        		throw new SystemException("\n\nNET-4431 �� ������� ��� ��������!");
	        	}

	        	if (object.routeBytRef.code == Integer.MIN_VALUE)
	        	{
	        		throw new SystemException("\n\nNET-4431 �� ������� ��� ��������!");
	        	}

	        	ENRouteByt routeByt = routeBytDAO.getObject(object.routeBytRef.code);

	        	if (routeByt == null)
	        	{
	        		throw new SystemException("\n\nNET-4431 �� �������� ������� � ����� " + object.routeBytRef.code + " !");
	        	}

	        	if (isByt)
	        	{
		        	ENRecordPointByt recordPointByt = recordPointBytDAO.getObject(object.recordPointBytRef.code);

		        	if (recordPointByt == null)
		        	{
		        		throw new SystemException("\n\nNET-4431 �� �������� �������� ����� ����� � ����� " + object.recordPointBytRef.code + " !");
		        	}

		        	object.recordPointBytRef.code = recordPointByt.code;
		        	object.accountNumber = recordPointByt.accountNumber;
		        	object.address = recordPointByt.address;
		        	object.name = recordPointByt.name;
		        	object.customerName = recordPointByt.name;
		        	object.invNumber = recordPointByt.invNumber;
		        	object.serialNumber = recordPointByt.serialNumber;
		        	object.phone = recordPointByt.phone;
		        	object.seal = recordPointByt.seal;
		        	//object.routeBytName = routeByt.name + " (� " + routeByt.numbergen + ")";
		        	object.routeBytName = routeByt.name;
		        	object.routeBytNumbergen = routeByt.numbergen;
		        	///// 10.06.14 ���. ���� �� ENRecordPointByt
		            object.rpCode = recordPointByt.rpCode;
		            object.dateCounterInst = recordPointByt.dateCounterInst;
		            object.dateCounterCheck = recordPointByt.dateCounterCheck;
		            object.counterType = recordPointByt.counterType;
		            object.classAccuracy = recordPointByt.classAccuracy;
		            object.checkperiod = recordPointByt.checkperiod;
		            object.rpStatusCode = recordPointByt.statuscode;
		            object.phasity = recordPointByt.phasity;
		            object.datecheck = recordPointByt.datecheck;
		            object.checkperiod1 = recordPointByt.checkperiod1;
		            object.placecounter = recordPointByt.placecounter;
		            object.rpIsWorking = recordPointByt.isworking;
		            object.counterCapacity = recordPointByt.counterCapacity;
		            object.counterVoltageNominal = recordPointByt.counterVoltageNominal;
		            object.counterDateProduct = recordPointByt.counterDateProduct;
		            /////
	        	}
	        	else if (isProm)
	        	{
		        	ENRecordPointProm recordPointProm = recordPointPromDAO.getObject(object.recordPointPromRef.code);

		        	if (recordPointProm == null)
		        	{
		        		throw new SystemException("\n\nNET-4431 �� �������� ���������� ����� ����� � ����� " + object.recordPointPromRef.code + " !");
		        	}

		        	object.recordPointPromRef.code = recordPointProm.code;
		        	object.accountNumber = recordPointProm.accountNumber;
		        	object.address = recordPointProm.recordPointAddr;
		        	object.name = recordPointProm.accountName;
		        	object.customerName = recordPointProm.accountName;
		        	object.invNumber = recordPointProm.invNumber;
		        	object.serialNumber = recordPointProm.counterNumber;
		        	object.phone = recordPointProm.phone;
		        	object.seal = recordPointProm.seal;
		        	///// 12.11.14 ���. ���� �� ENRecordPointProm
		            object.rpCode = recordPointProm.recordPointCode;
		            object.dateCounterInst = recordPointProm.dateCounterInst;
		            object.dateCounterCheck = recordPointProm.dateCounterCheck;
		            object.counterType = recordPointProm.counterType;
		            object.classAccuracy = recordPointProm.classAccuracy;
		            object.checkperiod = recordPointProm.checkperiod;
		            object.rpStatusCode = recordPointProm.statuscode;
		            object.phasity = recordPointProm.phasity;
		            //object.datecheck = recordPointProm.datecheck;
		            //object.checkperiod1 = recordPointProm.checkperiod1;
		            object.placecounter = recordPointProm.placecounter;
		            object.rpIsWorking = recordPointProm.isworking;
		            object.recordPointName = recordPointProm.recordPointName;
		            object.counterCapacity = recordPointProm.counterCapacity;
		            object.counterVoltageNominal = recordPointProm.counterVoltageNominal;
		            object.counterDateProduct = recordPointProm.counterDateProduct;
	        	}
	        	else
	        	{
	        		throw new SystemException("\n\nNET-4431 ������� � ��� ����� �����!");
	        	}
	        }
	        else if (elementType == ENElementType.SERVICES_OBJECT)
	        {
	        	ENServicesObjectFilter servicesObjectFilter = new ENServicesObjectFilter();
	        	servicesObjectFilter.element.code = elementCode;

	        	int servicesObjectArr[] = servicesObjectDAO.getFilteredCodeArray(servicesObjectFilter, 0, -1);

	        	if (servicesObjectArr.length == 0)
	        	{
	        		throw new SystemException("\n\nNET-4350 �� �������� ������ � ������ �� �������! [elementCode = " + elementCode + "]");
	        	}

	        	if (servicesObjectArr.length > 1)
	        	{
	        		throw new SystemException("\n\nNET-4350 �������� ������� (" + servicesObjectArr.length +
	        				") �������� � ������ �� �������! [elementCode = " + elementCode + "]");
	        	}

	        	ENServicesObject servicesObject = servicesObjectDAO.getObject(servicesObjectArr[0]);

	        	if (servicesObject == null)
	        	{
	        		throw new SystemException("\n\nNET-4350 �� �������� ������ � ������ �� �������! [elementCode = " + elementCode + "]");
	        	}

	        	object.servicesObjectRef.code = servicesObject.code;
	        	object.contractNumberServices = servicesObject.contractNumberServices;
	        	object.address = servicesObject.contragentAddressWork;
	        	object.name = servicesObject.contragentName;
	        	object.customerName = servicesObject.contragentName;
	        	object.phone = servicesObject.contragentPhoneNumber;

	        	/////////
	        	// 28.04.15 SUPP-33009 ���� ������� �� ��������� �������������� ��������, ����� ����� ����������� � �������� �������
	        	// � ��������� ��� � ������ �������� �������
	        	int scCounterCode = servicesLogic.createSCCounterForWorkOrderBytItem(servicesObject, object.workOrderBytRef.code);

	        	// �������� ���������� sccounter'� � ������ �������� �������
	            object.scCounterRef.code = scCounterCode;
	        	/////////

	        	// ���� �� �������� ���� �������� � ��������, ���������� �������� ������ �� ����� �����
	        	if (servicesObject.personalAccountCode != Integer.MIN_VALUE)
	        	{
	        		// 11.11.14 ��� ����� ���� � ������� �� ����� !!! � ���� ������ ����� ���������� ������ �� ENRecordPointProm
	        		// (������������ �� ���� ���./��. ���� �� ��������).
	        		// 12.11.14 ��� �� ���������, ������ ��� �� �������� �������� ��� ����������� ���. �����, �� �� ����� ����� �����,
	        		// �.�. ���������� ���������� ����� ����� �� �� ����� - ������ �������.

	        		ENRecordPointBytFilter recordPointBytFilter = new ENRecordPointBytFilter();
	        		recordPointBytFilter.conditionSQL =
	        				" code in " +
	        				" ( " +
	        				"   select rb.code " +
	        				"   from enservicesobject so, endepartment2epren dr, enrecordpointbyt rb, enelement e " +
	        				"   where so.code =  " + servicesObject.code +
	        				"     and so.departmentcode = dr.departmentrefcode " +
	        				"     and rb.elementcode = e.code " +
	        				"     and e.renrefcode = dr.renrefcode " +
	        				"     and rb.accountnumber = so.personalaccountnumber " +
	        				"     and rb.rpcode = so.personalaccountcode " +
	        				" ) ";

	        		ENRecordPointBytShortList recordPointBytList = recordPointBytDAO.getScrollableFilteredList(recordPointBytFilter, 0, -1);
	        		if (recordPointBytList.totalCount > 0)
	        		{
	    	        	object.recordPointBytRef.code = recordPointBytList.get(0).code;
	    	        	object.accountNumber = recordPointBytList.get(0).accountNumber;
	    	        	object.invNumber = recordPointBytList.get(0).invNumber;
	    	        	object.serialNumber = recordPointBytList.get(0).serialNumber;
	    	        	object.seal = recordPointBytList.get(0).seal;
	    	        	///// 10.06.14 ���. ���� �� ENRecordPointByt
	    	            object.rpCode = recordPointBytList.get(0).rpCode;
	    	            object.dateCounterInst = recordPointBytList.get(0).dateCounterInst;
	    	            object.dateCounterCheck = recordPointBytList.get(0).dateCounterCheck;
	    	            object.counterType = recordPointBytList.get(0).counterType;
	    	            object.classAccuracy = recordPointBytList.get(0).classAccuracy;
	    	            object.checkperiod = recordPointBytList.get(0).checkperiod;
	    	            object.rpStatusCode = recordPointBytList.get(0).statuscode;
	    	            object.phasity = recordPointBytList.get(0).phasity;
	    	            object.datecheck = recordPointBytList.get(0).datecheck;
	    	            object.checkperiod1 = recordPointBytList.get(0).checkperiod1;
	    	            object.placecounter = recordPointBytList.get(0).placecounter;
	    	            object.rpIsWorking = recordPointBytList.get(0).isworking;
			            object.counterCapacity = recordPointBytList.get(0).counterCapacity;
			            object.counterVoltageNominal = recordPointBytList.get(0).counterVoltageNominal;
			            object.counterDateProduct = recordPointBytList.get(0).counterDateProduct;
	    	            /////
	        		}
	        	}
	        }
	        else if (elementType == ENElementType.LINE04 ||
	        		 elementType == ENElementType.LINE_CABLE ||
	        		 elementType == ENElementType.SUBSTATION04)
	        {
	        	ENServicesObjectFilter servicesObjectFilter = new ENServicesObjectFilter();
	        	servicesObjectFilter.conditionSQL =
	        			" code in " +
	        			" ( " +
	        			"   select so2tc.servicesobjectrefcode " +
	        			"   from enservicesobject2techcondtnsservices so2tc, entechcond2planwork tcp " +
	        			"   where so2tc.techcondservrefcode = tcp.techconservicesrefcode " +
	        			"     and tcp.planrefcode = " + plan.code +
	        			" ) ";

	        	int servicesObjectArr[] = servicesObjectDAO.getFilteredCodeArray(servicesObjectFilter, 0, -1);

	        	if (servicesObjectArr.length == 0)
	        	{
	        		throw new SystemException("\n\nNET-4350 �� �������� ������ � ���������! ��� �����: " + plan.code);
	        	}

	        	if (servicesObjectArr.length > 1)
	        	{
	        		throw new SystemException("\n\nNET-4350 �������� ������� (" + servicesObjectArr.length +
	        				") �������� � ���������! ��� �����: " + plan.code);
	        	}

	        	ENServicesObject servicesObject = servicesObjectDAO.getObject(servicesObjectArr[0]);

	        	if (servicesObject == null)
	        	{
	        		throw new SystemException("\n\nNET-4350 �� �������� ������ � ���������! ��� �����: " + plan.code);
	        	}

	        	object.servicesObjectRef.code = servicesObject.code;
	        	object.contractNumberServices = servicesObject.contractNumberServices;
	        	object.address = servicesObject.contragentAddressWork;
	        	object.name = servicesObject.contragentName;
	        	object.customerName = servicesObject.contragentName;
	        	object.phone = servicesObject.contragentPhoneNumber;
	        }
	        else if (elementType == ENElementType.METROLOGY_COUNTER)
	        {
	        	ENMetrologyCounterDAO metrologyCounterDao = new ENMetrologyCounterDAO(getUserProfile(), enConn);
	        	ENMetrologyCounterFilter metrologyCounterFilter = new ENMetrologyCounterFilter();
	        	metrologyCounterFilter.conditionSQL = String.format("EXISTS (select 1 from enplanwork as pw1 where pw1.elementrefcode = ENMETROLOGYCOUNTER.ELEMENTCODE and pw1.code = %d)", plan.code);
	        	int[] metrologyCounterCodes = metrologyCounterDao.getFilteredCodeArray(metrologyCounterFilter, 0, -1);
	        	if(metrologyCounterCodes.length == 0) {
	        		throw new EnergyproSystemException("�� �������� ���������");
	        	}

	        	ENMetrologyCounter counter = metrologyCounterDao.getObject(metrologyCounterCodes[0]);
	        	object.recordPointBytRef.code = Integer.MIN_VALUE;
	        	object.accountNumber = counter.invNumber;
	        	object.address = counter.name;
	        	object.name = counter.name;
	        	object.customerName = counter.name;
	        	object.invNumber = counter.invNumber;
	        	object.serialNumber = counter.buildNumber;
	        	object.phone = null;
	        	object.seal = null;
	        	//object.routeBytName = routeByt.name + " (� " + routeByt.numbergen + ")";
	        	object.routeBytName = null;
	        	object.routeBytNumbergen = null;
	            if(counter.phasity == 1 || counter.phasity == 3) {
		        	object.phasity = new BigDecimal(counter.phasity);
	            }

	        }

	        ///// �������� ��������� �� �����
	        //humenItem.finWorker = object.finWorker;
	        humenItem.finWorker = new FINWorker();
	        humenItem.finWorker.code = Integer.MIN_VALUE;
            humenItem.finWorker.name = object.finWorker.name;
            humenItem.finWorker.tabNumber = object.finWorker.tabNumber;
            humenItem.finWorker.positionName = object.finWorker.positionName;
            humenItem.finWorker.positionCode = object.finWorker.positionCode;
            humenItem.finWorker.departmentName = object.finWorker.departmentName;
            humenItem.finWorker.departmentCode = object.finWorker.departmentCode;
            if (object.finWorker.priceGen == null) {
            	throw new SystemException("\n\n�� ������� ��������� ��������� ����� ��� ���������� � ���. � " + object.finWorker.tabNumber + " !");
            }
            humenItem.finWorker.priceGen = new BigDecimal(object.finWorker.priceGen.doubleValue());
            humenItem.finWorker.categor = object.finWorker.categor;
            humenItem.finWorker.kindRef.code = object.finWorker.kindRef.code;
            humenItem.finWorker.finCode = object.finWorker.finCode;
            /////
            humenItem.finWorker.categorId = object.finWorker.categorId;
            humenItem.finWorker.categorName = object.finWorker.categorName;
            humenItem.finWorker.workTimeId = object.finWorker.workTimeId;
            /////
            // MDAX-441
            humenItem.finWorker.positionId = object.finWorker.positionId;

            HumenLogic humenLogic = new HumenLogic(enConn, getUserProfile());
            humenLogic.save(humenItem, true);

            humenItem = humenItemDAO.getObject(humenItem.code);
            object.finWorker.code = humenItem.finWorker.code;
	        /////


            /*
            /// NET-4376 ���� �������� ��������
            /// ���� ���� (�� - ������� ����� ��������� ��� �� - ��������� ��� ��� �� - ��������� ��� � �������(���������) �������� ��� �� - ������ �������� � ������� ��� )
            ////  � ��� ����� = ��������
            if (plan.formRef.code == ENPlanWorkForm.PLANNED
            		&& ( plan.typeRef.code == ENPlanWorkType.EZ_PLANED_CHANGE_COUNTER
            		     ||
            		     plan.typeRef.code == ENPlanWorkType.EZ_SETUP_ZKU
            		     ||
            		     plan.typeRef.code == ENPlanWorkType.EZ_CHANGE_ZKU
            		     ||
            		     plan.typeRef.code == ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU
            		   )
            	)
            {
            	SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            	int scCounterCode = Integer.MIN_VALUE;

	            ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
	            eiFilter.accountingTypeRef.code = TKAccountingType.COUNTERS;
	            eiFilter.planItemRef.code = humenItem.planItemRef.code;
	            eiFilter.conditionSQL = "ENESTIMATEITEM.COUNTFACT > 0";

	             int[] eiArr = eiDAO.getFilteredCodeArray(eiFilter, 0, -1);
	             // ��� ������-�� ������ ���� ������ 1 �������!!!
	             for (int ei = 0; ei < eiArr.length; ei++)
	             {
	            	 ENEstimateItem eiObj = eiDAO.getObject(eiArr[ei]);
	            	 // �������� � ������� ����
	            	 scCounterCode = scLogic.autoBindingCounterOnNPZPlan(eiObj);
	             }

             	 // �������� ���������� sccounter'� � ������ �������� �������!!!
	             object.scCounterRef.code = scCounterCode;
            }
            */

            object.customerName = object.customerName.replace('*', ' ');
            object.customerName = object.customerName.replace('?', ' ');
		    return objectDAO.add(object);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't add {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem%} object.", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}

		finally
		{
			try {
                if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {
            }
		}
	}


	public void addFromShort(ENWorkOrderBytItem object, ENWorkOrderBytItemShort shortObject)
	{
		try
		{
			//if (shortObject.planRefCode == Integer.MIN_VALUE)
			if (shortObject.planRefCode <= 0)
			{
				throw new SystemException("\n\nNET-4350 �� ������� ��� �����!");
			}

			//if (shortObject.kartaRefCode == Integer.MIN_VALUE)
			if (shortObject.kartaRefCode <= 0)
			{
				throw new SystemException("\n\nNET-4350 �� ������� ��� ���. �����!");
			}

			//if (shortObject.positionCode == Integer.MIN_VALUE)
			if (shortObject.positionCode <= 0)
			{
				throw new SystemException("\n\nNET-4350 �� ������� ��� ���������� ������!");
			}

			// ���� humenItem'� �� ���� ���������, ���� ����� � ���� ��������
			ENHumenItemDAO humenItemDAO = new ENHumenItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENHumenItemFilter humenItemFilter = new ENHumenItemFilter();

			humenItemFilter.planRef.code = shortObject.planRefCode;
			humenItemFilter.positionGen.code = shortObject.positionCode;
			humenItemFilter.conditionSQL =
					" ENHUMENITEM.planitemrefcode in " +
			        "  (select pwi.code " +
					"     from enplanworkitem pwi, tktechcard tc " +
			        "    where pwi.planrefcode = " + shortObject.planRefCode +
			        "      and pwi.kartarefcode = tc.code " +
			        "      and tc.classificationtypecode = " + shortObject.kartaRefCode + ")";

			int humenItemArr[] = humenItemDAO.getFilteredCodeArray(humenItemFilter, 0, -1);

			if (humenItemArr.length == 0)
			{
				throw new SystemException("\n\nNET-4350 �� ��������� ��������� ������ �� �������� ������� ������������ ����������!");
			}

			// ��� ������� �� ��������� humenItem'�� �������� ������� add
			for (int i = 0; i < humenItemArr.length; i++)
			{
				object.code = Integer.MIN_VALUE;
				object.humenItemRef.code = humenItemArr[i];
				this.add(object);
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

	public int addWithMarks(ENWorkOrderBytItem object, ENWorkOrderBytItem2Mark[] marks)
	{
		/* SUPP-40706 ������� ������� ��� �������� ������ ����� ������������� �� �� ��������, � �� ���������� �������
		if (marks == null)
		{
			throw new SystemException("\n\nNET-4431 �� ������� ������ �������!");
		}

		if (marks.length == 0)
		{
			throw new SystemException("\n\nNET-4431 �� ������� ������ �������!");
		}
		*/

		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(object.workOrderBytRef.code);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4431 �� �������� ����� ��������! ��� = " + object.workOrderBytRef.code);
			}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.RAID_BY_BILLING && workOrderByt.typeRef.code != ENWorkOrderBytType.CONTROL)
			{
				throw new SystemException("\n\nNET-4431 ������������ ��� ������� ��������! ��� ��������: " + object.workOrderBytRef.code +
						", ��� ����: " + workOrderByt.typeRef.code);
			}

			int bytItemCode = add(object, true);

			if (bytItemCode == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4431 ������� �� ��� ��������� ������ ������� ��������!");
			}

			if (marks != null)
			{
				ENWorkOrderBytItem2MarkDAO markDAO = new ENWorkOrderBytItem2MarkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

				for (int i = 0; i < marks.length; i++)
				{
					ENWorkOrderBytItem2Mark mark = new ENWorkOrderBytItem2Mark();
					mark.markCode = marks[i].markCode;
					mark.markName = marks[i].markName;
					mark.workOrderBytItemRef.code = bytItemCode;
					markDAO.add(mark);
				}
			}

			return bytItemCode;
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

	@Override
	public void save(ENWorkOrderBytItem object)
	{
		try
		{
			//throw new SystemException("\n\nNET-4350 ����������� �� ���������������!");

			super.save(object);

			if (object.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4350 �� ������� ��� ������ ��������!");
			}

			// ���� �������� ��� ��������� �� ����� ������ �������,
			// ������� ��� �� ���� ������� ����� �� �������, ��������� � ��� �� ������, ��� � ������� ������
			ENWorkOrderBytItemFilter itemFilter = new ENWorkOrderBytItemFilter();

			itemFilter.workOrderBytRef.code = object.workOrderBytRef.code;
			itemFilter.planRef.code = object.planRef.code;
			itemFilter.conditionSQL = "code <> " + object.code;

	        // 10.01.16 ��� ������� �� ��������� ����� ��� � �� ����� ����� �����������
	        if (object.recordPointBytRef != null)
	        {
	        	if (object.recordPointBytRef.code != Integer.MIN_VALUE)
	        	{
	        		itemFilter.recordPointBytRef.code = object.recordPointBytRef.code;
	        	}
	        }
	        if (object.recordPointPromRef != null)
	        {
	        	if (object.recordPointPromRef.code != Integer.MIN_VALUE)
	        	{
	        		itemFilter.recordPointPromRef.code = object.recordPointPromRef.code;
	        	}
	        }

			ENWorkOrderBytItemDAO objectDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			int[] itemArr = objectDAO.getFilteredCodeArray(itemFilter, 0, -1);

			for (int i = 0; i < itemArr.length; i++)
			{
				ENWorkOrderBytItem item = objectDAO.getObject(itemArr[i]);
				item.customerName = object.customerName;
				//item.commentGen = object.commentGen; // ���������� ��������� �� �����
				objectDAO.save(item);
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't save {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem%} object.", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

	@Override
	public void remove(int code)
	{
		remove(code, false);
	}

	public void remove(int code, boolean isFromBilling)
	{
		try
		{
			ENWorkOrderBytItemDAO objectDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderBytItem object = objectDAO.getObject(code);

			if (object.humenItemRef == null)
			{
				throw new SystemException("\n\nNET-4350 �� �������� ��� ������������ ���������� � �����!");
			}

			HumenLogic humenLogic = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENHumenItemDAO humenItemDAO = new ENHumenItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENHumenItem humenItem = humenItemDAO.getObject(object.humenItemRef.code);

			if (humenItem == null)
			{
				throw new SystemException("\n\nNET-4350 �� �������� ��� ������������ ���������� � �����!");
			}

			///// 26.01.15 ���������, ������� �� ������� �� ��������
    		ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
    		ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(object.workOrderBytRef.code);

    		if (workOrderByt == null)
    		{
    			throw new SystemException("\n\nNET-4350 �� �������� ����� ��������! ��� = " + object.workOrderBytRef.code);
    		}

			if ((workOrderByt.typeRef.code == ENWorkOrderBytType.RAID_BY_BILLING || workOrderByt.typeRef.code == ENWorkOrderBytType.CONTROL)
					&& !isFromBilling)
			{
				throw new SystemException("\n\nNET-4431 �� �������� ���� ���������� � �����! ��������� ����� � ����� ������� ����� ���� � �����!");
			}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.BY_ENERGYNET && !isFromBilling)
			{
				throw new SystemException("\n\nNET-4431 ������������ ��� ������� ��������! ��� ��������: " + object.workOrderBytRef.code +
						", ��� ����: " + workOrderByt.typeRef.code);
			}
			/////

			// �������� ������� �������� ������� (���� � ������� ������� ���� ������,
			// �� ������ �� ���� ����� ������� ������, ���� ��� ��������)
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			if (scLogic.isWorkOrderBytWithSeals(object.workOrderBytRef.code))
			{
				// ���������, ���� �� � ����� ������
				boolean isSealsInPlan = scLogic.checkSealsInPlan(humenItem.planRef.code);

				if (isSealsInPlan)
				{
					scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.DRAFT, true);
				}
				else
				{
					/* ������ ������� ��� ����� ������� - �������, ����� ���� ��� �������� (����������� ����)
					if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.DRAFT &&
						workOrderByt.statusRef.code != ENWorkOrderBytStatus.FORMED &&
						workOrderByt.statusRef.code != ENWorkOrderBytStatus.APPROVED)
					{
						throw new SystemException("\n\nNET-4530 ����� �������� � ����� " + workOrderByt.code +
								" ��� �� ����� ���������� !");
					}
					*/

					ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

					ENPlanWork plan = planDAO.getObject(humenItem.planRef.code);

			        if (plan == null)
			        {
			        	throw new SystemException("\n\nNET-4530 �� �������� ���� � ����� " + humenItem.planRef.code + " !");
			        }

			        if (plan.kind.code != ENPlanWorkKind.NPW || plan.status.code != ENPlanWorkStatus.GOOD)
			        {
			        	throw new SystemException("\n\nNET-4530 ������ ������� �������� ������� ��������, ���� ���� ��'����� � �������� ���������-������!\n" +
			        			"���� � ����� " + plan.code + " �� � �������� ���������-������!");
			        }
				}
			}

			///// 17.01.15
			// �������� �� ������� ��������� �� ������� ��������.
			// ���� ��� ����, ������, �������� ������� �� EnergyNet ������ �������, ���������� �� ��������. ���� ��� ��������� �����!
			ENWorkOrderBytItem2MarkDAO markDAO = new ENWorkOrderBytItem2MarkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderBytItem2MarkFilter markFilter = new ENWorkOrderBytItem2MarkFilter();
			markFilter.workOrderBytItemRef.code = code;
			int[] markArr = markDAO.getFilteredCodeArray(markFilter, 0, -1);

			if (markArr.length > 0)
			{
				throw new SystemException("\n\nNET-4431 �� �������� ���� ���������� � �����! ��������� ����� � ����� ������� ����� ���� � �����!");
			}
			/////

			objectDAO.remove(code);

			// 06.05.15 ���� ���� ������ �� sccounter, ������ ��� (�� ������ ���� �� ���� ��� ������ � ������ ����� �������)
			if (object.scCounterRef != null)
			{
				if (object.scCounterRef.code != Integer.MIN_VALUE)
				{
		        	ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		        	servicesLogic.removeSCCounterForWorkOrderBytItem(object.scCounterRef.code);
				}
			}

			///// ���������� �������� � ��������� �� �����
			// 02.12.14 SUPP-26761 ������, ���� humenitem �� ������ � ������� �������� ���������
			// (������ ��� humenItemController.save ��� ���������� �������� � ���������� �������� ������� humenItem - �����������)
			ENWorkOrderBytItemFilter bytItemFilter = new ENWorkOrderBytItemFilter();
			bytItemFilter.humenItemRef.code = humenItem.code;
			bytItemFilter.conditionSQL = "code <> " + code;

			int[] bytItemArr = objectDAO.getFilteredCodeArray(bytItemFilter, 0, -1);

			if (bytItemArr.length == 0)
			{
				humenItem.finWorker.code = Integer.MIN_VALUE;
				humenItem.finWorker.tabNumber = null;

	            humenLogic.save(humenItem, true);
			}
			/////
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't remove {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem%} object.", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public void removeWithMarks(int code)
	{
		try
		{
			// � ������ ����� ��������� ������ � ���������
			ENWorkOrderBytItem2MarkDAO markDAO = new ENWorkOrderBytItem2MarkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderBytItem2MarkFilter markFilter = new ENWorkOrderBytItem2MarkFilter();
			markFilter.workOrderBytItemRef.code = code;
			int[] markArr = markDAO.getFilteredCodeArray(markFilter, 0, -1);

			for (int i = 0; i < markArr.length; i++)
			{
				markDAO.remove(markArr[i]);
			}

			remove(code, true);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't remove {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem%} object.", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}
	
	/**
	 * �������� ����� �� �������� ������� ��� �������� ������
	 * @param workOrderBytCode - ��� �������� �������
	 * @param planCode - ��� �������-�����
	 * @param elementCode - ��� �������� ��� ����� ����� (���/����)
	 */
	public void removeForRaidByElement(int workOrderBytCode, int planCode, int elementCode) {
		if (workOrderBytCode <= 0) {
			throw new SystemException("\n\n�� ������� ��� ������� ��������!");
		}
		
		if (planCode <= 0) {
			throw new SystemException("\n\n�� ������� ��� ��������-�����!");
		}
		
		if (elementCode <= 0) {
			throw new SystemException("\n\n�� ������� ��� ����� ����� (elementCode)!");
		}

		try {
			ElementLogic elementLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENElement element = elementLogic.getElementByCode(elementCode);
			
			if (element == null) {
				throw new SystemException("\n\n�� �������� ��'��� EnergyNet! (elementCode: " + elementCode + ")!");
			}
			
			if (element.typeRef.code != ENElementType.TY_BYT && element.typeRef.code != ENElementType.TY_PROM) {
				throw new SystemException("\n\n��'��� EnergyNet �� � ������ �����! (elementCode: " + elementCode + ")!");
			}
	
			int recordPointBytCode = Integer.MIN_VALUE;
			int recordPointPromCode = Integer.MIN_VALUE;
	
			if (element.typeRef.code == ENElementType.TY_BYT) {
				ENRecordPointBytDAO recordPointBytDAO = new ENRecordPointBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				ENRecordPointBytFilter recordPointBytFilter = new ENRecordPointBytFilter();
				recordPointBytFilter.element.code = elementCode;
				
				int[] recordPointBytArr = recordPointBytDAO.getFilteredCodeArray(recordPointBytFilter, 0, -1);
				
				if (recordPointBytArr.length == 0) {
					throw new SystemException("\n\n�� �������� �������� ����� ����� � EnergyNet! (elementCode: " + elementCode + ")!");
				}
				
				recordPointBytCode = recordPointBytArr[0];
			} else if (element.typeRef.code == ENElementType.TY_PROM) {
				ENRecordPointPromDAO recordPointPromDAO = new ENRecordPointPromDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				ENRecordPointPromFilter recordPointPromFilter = new ENRecordPointPromFilter();
				recordPointPromFilter.element.code = elementCode;
				
				int[] recordPointPromArr = recordPointPromDAO.getFilteredCodeArray(recordPointPromFilter, 0, -1);
				
				if (recordPointPromArr.length == 0) {
					throw new SystemException("\n\n�� �������� �������� ����� ����� � EnergyNet! (elementCode: " + elementCode + ")!");
				}
				
				recordPointPromCode = recordPointPromArr[0];
			}
			
			if (recordPointBytCode == Integer.MIN_VALUE && recordPointPromCode == Integer.MIN_VALUE) {
				throw new SystemException("\n\n�� ������� ��������� ����� ����� � EnergyNet! (elementCode: " + elementCode + ")!");
			}
					
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	
			ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
			workOrderBytItemFilter.workOrderBytRef.code = workOrderBytCode;
			workOrderBytItemFilter.planRef.code = planCode;
			workOrderBytItemFilter.recordPointBytRef.code = recordPointBytCode;
			workOrderBytItemFilter.recordPointPromRef.code = recordPointPromCode;

			int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

			if (workOrderBytItemArr.length == 0)
			{
				throw new SystemException("\n\n�� �������� ��������� ������ �� �������� ����� ������ ������� ��������!");
			}

			ENRouteBytDetailDAO routeBytDetailDAO = new ENRouteBytDetailDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			for (int itemCode : workOrderBytItemArr) {
				ENWorkOrderBytItem item = workOrderBytItemDAO.getObject(itemCode);
				if (item == null) {
					throw new SystemException("\n\n�� �������� ������ ������� �������� � ����� " + itemCode + " !");
				}

				if (item.rpCode == Integer.MIN_VALUE) {
					throw new SystemException("\n\n�� ������� ��� ����� ����� ��� ������ ������� �������� � ����� " + itemCode + " !");
				}

				// ������� �� ����� "��'���� � �����"
				ENRouteBytDetailFilter routeBytDetailFilter = new ENRouteBytDetailFilter();
				routeBytDetailFilter.planRef.code = planCode;
				routeBytDetailFilter.rpCode = item.rpCode;

				int[] routeBytDetailArr = routeBytDetailDAO.getFilteredCodeArray(routeBytDetailFilter, 0, -1);
				for (int routeBytDetailCode : routeBytDetailArr) {
					routeBytDetailDAO.remove(routeBytDetailCode);
				}

				// ������� ������ �������� �������
				removeWithMarks(itemCode);				
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't removeForRaidByElement", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}		
	}	

	public ENWorkOrderBytItemShortList getScrollableFilteredListForAdd(ENWorkOrderBytItemFilter filterObject, int fromPosition, int quantity)
	{
		try
		{
			ENWorkOrderBytItemDAO objectDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			return objectDAO.getScrollableFilteredListForAdd(filterObject, fromPosition, quantity);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't getScrollableFilteredListForAdd", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public ENWorkOrderBytItemShortList getScrollableFilteredListForAdd2(ENWorkOrderBytItemFilter filterObject, int fromPosition, int quantity)
	{
		try
		{
			ENWorkOrderBytItemDAO objectDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			return objectDAO.getScrollableFilteredListForAdd2(filterObject, fromPosition, quantity);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't getScrollableFilteredListForAdd2", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

    public ENWorkOrderBytItemShortList getScrollableFilteredListForPlanning(ENWorkOrderBytItemFilter filterObject, int fromPosition, int quantity)
    {
	    try
	    {
		    ENWorkOrderBytItemDAO objectDAO = new ENWorkOrderBytItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        return objectDAO.getScrollableFilteredListForPlanning(filterObject, fromPosition, quantity);
	    }
        catch (DatasourceConnectException e)
        {
    	    throw new SystemException("Can't getScrollableFilteredListForPlanning", e);
        }
	    catch (PersistenceException e)
	    {
		    throw new SystemException(e.getMessage(), e);
	    }
	    finally
	    {
		    closeConnection();
	    }
    }

    public ENWorkOrderBytItemShortList getScrollableFilteredListForPlanning(ENWorkOrderBytItemFilter filterObject, int fromPosition, int quantity, int elementType)
    {
	    try
	    {
		    ENWorkOrderBytItemDAO objectDAO = new ENWorkOrderBytItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        return objectDAO.getScrollableFilteredListForPlanning(filterObject, fromPosition, quantity, elementType);
	    }
        catch (DatasourceConnectException e)
        {
    	    throw new SystemException("Can't getScrollableFilteredListForPlanning", e);
        }
	    catch (PersistenceException e)
	    {
		    throw new SystemException(e.getMessage(), e);
	    }
	    finally
	    {
		    closeConnection();
	    }
    }

    public int bindCounter(int workOrderBytItemCode, SCCounter counter)
    {
    	if (workOrderBytItemCode == Integer.MIN_VALUE)
    	{
    		throw new SystemException("\n\nNET-4376 �� ������� ��� ������ ������� ��������!");
    	}

    	if (counter == null)
    	{
    		throw new SystemException("\n\nNET-4376 �� ������� ��������!");
    	}

    	if (counter.invNumber == null)
    	{
    		throw new SystemException("\n\nNET-4376 �� ������� �������� (���. �)!");
    	}

    	if (counter.invNumber.equals(""))
    	{
    		throw new SystemException("\n\nNET-4376 �� ������� �������� (���. �)!");
    	}

	    try
	    {
		    ENWorkOrderBytItemDAO itemDAO = new ENWorkOrderBytItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

		    ENWorkOrderBytItem item = itemDAO.getObject(workOrderBytItemCode);

		    if (item == null)
		    {
		    	throw new SystemException("\n\nNET-4376 �� �������� ������ ������� ��������! ��� = " + workOrderBytItemCode);
		    }

		    if (item.scCounterRef != null)
		    {
		    	if (item.scCounterRef.code > Integer.MIN_VALUE)
		    	{
		    		SCCounterDAO scCounterDAO = new SCCounterDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

		    		SCCounter currentCounter = scCounterDAO.getObject(item.scCounterRef.code);

		    		if (currentCounter == null)
		    		{
		    			throw new SystemException("\n\nNET-4376 �� �������� �������� (sccounter)! ��� = " + item.scCounterRef.code);
		    		}

		        	if (currentCounter.invNumber == null)
		        	{
		        		throw new SystemException("\n\nNET-4376 �� �������� �������� - ���. � (sccounter)! ��� = " + item.scCounterRef.code);
		        	}

		        	if (currentCounter.invNumber.equals(""))
		        	{
		        		throw new SystemException("\n\nNET-4376 �� �������� �������� - ���. � (sccounter)! ��� = " + item.scCounterRef.code);
		        	}

		    		if (! counter.invNumber.equals(currentCounter.invNumber))
		    		{
		    			// ������� ������� !!!
		    		}
		    	}
		    }


		    return Integer.MIN_VALUE;
	    }
        catch (DatasourceConnectException e)
        {
    	    throw new SystemException("Can't bindCounter", e);
        }
	    catch (PersistenceException e)
	    {
		    throw new SystemException(e.getMessage(), e);
	    }
	    finally
	    {
		    closeConnection();
	    }
    }

    /**
     * ����� ��� ��������� ����������� �� ������ �������� ������� � � ��������� � ��� ����� (ENHumenItem'�)
     *
     * @param workOrderBytItemCode - ��� ������ �������� �������
     * @param finWorker - ����������� (������ FINWorker)
     *
     * @return ��� finWorker'�
     */
    public int updateFinWorker(int workOrderBytItemCode, FINWorker finWorker)
    {
  	  	//Connection finConn = null;
  	  	Connection enConn = null;

    	try
    	{
    	  	//finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
    	  	enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	    	if (workOrderBytItemCode == Integer.MIN_VALUE)
	    	{
	    		throw new SystemException("\n\nNET-4350 �� ������� ��� ������ ��������!");
	    	}

	    	if (finWorker == null)
	    	{
	    		throw new SystemException("\n\nNET-4350 �� ������ ����������!");
	    	}

	    	if (finWorker.finCode == Integer.MIN_VALUE && finWorker.tabNumber == null)
	    	{
	    		throw new SystemException("\n\nNET-4350 �� ������ ����������!");
	    	}

	    	ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), enConn);
	    	ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), enConn);

	    	ENWorkOrderBytItem workOrderBytItem = workOrderBytItemDAO.getObject(workOrderBytItemCode);

	    	if (workOrderBytItem == null)
	    	{
	    		throw new SystemException("\n\nNET-4350 �� �������� ������ ������� �������� � ����� " + workOrderBytItemCode + " !");
	    	}

	    	ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytItem.workOrderBytRef.code);

	    	if (workOrderByt == null)
	    	{
	    		throw new SystemException("\n\nNET-4350 �� �������� ����� �������� � ����� " + workOrderBytItem.workOrderBytRef.code + " !");
	    	}

    		ENHumenItemDAO humenItemDAO = new ENHumenItemDAO(getUserProfile(), enConn);

    		ENHumenItem humenItem = humenItemDAO.getObject(workOrderBytItem.humenItemRef.code);

	    	if (humenItem == null)
	    	{
	    		throw new SystemException("\n\nNET-4350 �� �������� ������������ ���������� � ���� (��� ����������: " +
	    				workOrderBytItem.humenItemRef.code + " !");
	    	}

	    	///// �������� ������ �����
	        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), enConn);
	        ENPlanWork plan = planDAO.getObject(humenItem.planRef.code);

	        if (plan == null)
	        {
	        	throw new SystemException("\n\nNET-4350 �� �������� ���� � ����� " + humenItem.planRef.code + " !");
	        }

	        if (plan.status.code != ENPlanWorkStatus.GOOD)
	        {
	        	throw new SystemException("\n\nNET-4350 ������������ ���������� ����� �����² ��������-�����!\n" +
	        			"���� � ����� " + plan.code + " �� � ��������!");
	        }
	    	/////

    		// �������� enhumenitem
    		humenItem.finWorker = new FINWorker();
	        humenItem.finWorker.code = Integer.MIN_VALUE;
            humenItem.finWorker.name = finWorker.name;
            humenItem.finWorker.tabNumber = finWorker.tabNumber;
            humenItem.finWorker.positionName = finWorker.positionName;
            humenItem.finWorker.positionCode = finWorker.positionCode;
            humenItem.finWorker.departmentName = finWorker.departmentName;
            humenItem.finWorker.departmentCode = finWorker.departmentCode;
            humenItem.finWorker.priceGen = new BigDecimal(finWorker.priceGen.doubleValue());
            humenItem.finWorker.categor = finWorker.categor;
            humenItem.finWorker.kindRef.code = finWorker.kindRef.code;
            humenItem.finWorker.finCode = finWorker.finCode;
            /////
            humenItem.finWorker.categorId = finWorker.categorId;
            humenItem.finWorker.categorName = finWorker.categorName;
            humenItem.finWorker.workTimeId = finWorker.workTimeId;
            /////
            // MDAX-441
            humenItem.finWorker.positionId = finWorker.positionId;

            Context humenItemCnt = new InitialContext();
            Object humenItemRef = humenItemCnt.lookup(ENHumenItemController.JNDI_NAME);
            ENHumenItemControllerHome humenItemHome = (ENHumenItemControllerHome) PortableRemoteObject.narrow(humenItemRef, ENHumenItemControllerHome.class);
            ENHumenItemController humenItemController = humenItemHome.create();
            humenItemController.save(humenItem, true);

            humenItem = humenItemDAO.getObject(humenItem.code);
            workOrderBytItem.finWorker.code = humenItem.finWorker.code;
            workOrderBytItemDAO.save(workOrderBytItem);

	    	if (workOrderByt.typeRef.code == ENWorkOrderBytType.RAID_BY_BILLING)
	    	{
		    	// �.�. � ������� �������� ��� �������� ������ � ��� ���� ���� �� �������, � ������ ������� ���������� �� ������ �����,
		    	// �� ��� ��������� ����������� (finWorker'�) ����� �������� ��� �� ���� ������� �������, ������� ��������� �� ���� ��
		    	// enhumenitem'�, ��� � ������� ���������� ������

	    		ENWorkOrderBytItemFilter itemFilter = new ENWorkOrderBytItemFilter();

				itemFilter.workOrderBytRef.code = workOrderBytItem.workOrderBytRef.code;
				itemFilter.humenItemRef.code = workOrderBytItem.humenItemRef.code;
				itemFilter.conditionSQL = "code <> " + workOrderBytItem.code;

				int[] itemArr = workOrderBytItemDAO.getFilteredCodeArray(itemFilter, 0, -1);

				for (int i = 0; i < itemArr.length; i++)
				{
					ENWorkOrderBytItem item = workOrderBytItemDAO.getObject(itemArr[i]);
					item.finWorker.code = workOrderBytItem.finWorker.code;
					workOrderBytItemDAO.save(item);
				}
	    	}

	    	return workOrderBytItem.finWorker.code;
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't updateFinWorker!", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (NamingException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (RemoteException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (CreateException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			/*
			try {
				if (finConn != null && ! finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}
			*/
			try {
				if (enConn != null && ! enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}
    }



	public int addForRaidByFeeder(int planCode, ENHumenItem ENHumenItemObj,
			ENHumenItem ENHumenItem2Obj, ENHumenItem ENHumenItem3Obj,
			int elementCodeArr[], Vector rpCodes, int routeCode, int woBytMainCode) {

		try {

			int woBytCode = Integer.MIN_VALUE;

			ENPlanWorkDAO planDao = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENRouteBytDAO routeBytDao = new ENRouteBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENHumenItemDAO humenItemDao = new ENHumenItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENRecordPointBytDAO recordPointBytDao = new ENRecordPointBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENRecordPointPromDAO recordPointProm = new ENRecordPointPromDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENElementDAO eDao = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ENWorkOrderByt object = new ENWorkOrderByt();

			ENRouteBytFilter enRouteBytFilter = new ENRouteBytFilter();
			ENRouteBytShortList enRouteBytShortList;

			ENRecordPointBytShortList enRecordPointBytList;
			ENRecordPointPromShortList enRecordPointPromList;

			ENPlanWork plan = planDao.getObject(planCode);

			enRouteBytFilter.element.code = plan.elementRef.code;
			enRouteBytShortList = routeBytDao.getScrollableFilteredList(enRouteBytFilter, 0, -1);

			int enRouteCode = enRouteBytShortList.get(0).code;

			object.dateGen = plan.dateStart;
			object.numberGen = "" + plan.code;
			object.departmentRef.code = plan.departmentRef.code;
			object.finWorker = ENHumenItemObj.finWorker;


			if (woBytMainCode == Integer.MIN_VALUE) {
				object.typeRef.code = ENWorkOrderBytType.RAID_BY_BILLING;
				object.statusRef.code = ENWorkOrderBytStatus.DRAFT;
				woBytCode = workOrderLogic.addWorkOrderByt(object);
			} else {
				// �������� ������� �������� ������� (���� � ������� ������� ���� ������,
				// �� ������ � ���� ����� ��������� ������, ���� ��� ��������)
				SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
						getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
				if (scLogic.isWorkOrderBytWithSeals(woBytMainCode))
				{
					scLogic.checkWorkOrderBytForStatus(woBytMainCode, ENWorkOrderBytStatus.DRAFT, true);
				}

				woBytCode = woBytMainCode;
			}


			ENHumenItemFilter enHumenItemFilter = new ENHumenItemFilter();
			enHumenItemFilter.planRef.code = planCode;

			ENHumenItemShortList enHumenItemList = humenItemDao.getScrollableFilteredList(enHumenItemFilter, 0, -1);


			System.out.println("#######################  start addForRaidByFeeder elementCodeArr.length = " + elementCodeArr.length);

			for (int i = 0; i < elementCodeArr.length; i++) {

				int typeRP = eDao.getObject(elementCodeArr[i]).typeRef.code;

				ENRecordPointBytFilter enRecordPointBytFilter = new ENRecordPointBytFilter();
				ENRecordPointPromFilter enRecordPointPromFilter = new ENRecordPointPromFilter();

				ENWorkOrderBytItem objectItem = new ENWorkOrderBytItem();
				objectItem.workOrderBytRef.code = woBytCode;
				objectItem.routeBytRef.code = enRouteCode;
				objectItem.statuscode = 0;


				if (typeRP == ENElementType.TY_BYT) {
					enRecordPointBytFilter.element.code = elementCodeArr[i];
					enRecordPointBytList = recordPointBytDao.getScrollableFilteredList(enRecordPointBytFilter, 0, -1);

					if (enRecordPointBytList.totalCount > 0) {
						objectItem.recordPointBytRef.code = enRecordPointBytList.get(0).code;

						ENWorkOrderBytItem2Mark[] marks = new ENWorkOrderBytItem2Mark[0];
						for (int h = 0; h < enHumenItemList.totalCount; h++) {
							objectItem.humenItemRef.code = enHumenItemList.get(h).code;

							ENHumenItem humenItem = humenItemDao.getObject(objectItem.humenItemRef.code);
							objectItem.finWorker = humenItem.finWorker;

							System.out.println("#######################  addForRaidByFeeder bytElCode = " + elementCodeArr[i]);

							this.addWithMarks(objectItem, marks);
						}
					}

				} else {
					enRecordPointPromFilter.element.code = elementCodeArr[i];
					enRecordPointPromList = recordPointProm.getScrollableFilteredList(enRecordPointPromFilter, 0, -1);

					if (enRecordPointPromList.totalCount > 0) {
						objectItem.recordPointPromRef.code = enRecordPointPromList.get(0).code;

						ENWorkOrderBytItem2Mark[] marks = new ENWorkOrderBytItem2Mark[0];
						for (int h = 0; h < enHumenItemList.totalCount; h++) {
							objectItem.humenItemRef.code = enHumenItemList.get(h).code;

							ENHumenItem humenItem = humenItemDao.getObject(objectItem.humenItemRef.code);
							objectItem.finWorker = humenItem.finWorker;

							System.out.println("#######################  addForRaidByFeeder promElCode = " + elementCodeArr[i]);

							this.addWithMarks(objectItem, marks);
						}
					}
				}
			}

			System.out.println("#######################  end addForRaidByFeeder elementCodeArr.length = " + elementCodeArr.length + " :: " + getUserProfile().userName);


			return woBytCode;

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


} // end of EJB Controller for ENWorkOrderBytItem