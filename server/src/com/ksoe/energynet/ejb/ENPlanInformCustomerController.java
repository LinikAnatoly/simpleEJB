
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanInformCustomer;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanInformCustomer;
import com.ksoe.energynet.valueobject.lists.ENPlanInformCustomerShortList;
import com.ksoe.energynet.valueobject.brief.ENPlanInformCustomerShort;
import com.ksoe.energynet.valueobject.filter.ENPlanInformCustomerFilter;


public interface ENPlanInformCustomerController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanInformCustomerController";

	/* ENPlanInformCustomer. �������� */
	public int add(ENPlanInformCustomer aENPlanInformCustomer)
			throws java.rmi.RemoteException;

	/* ENPlanInformCustomer. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanInformCustomer. �������� */
	public void save(ENPlanInformCustomer aENPlanInformCustomer)
			throws java.rmi.RemoteException;

	/* ENPlanInformCustomer. �������� ������ */
	public ENPlanInformCustomer getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanInformCustomer. �������� ������ ������ */
	public ENPlanInformCustomerShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanInformCustomer. �������� ������ �� ������� */
	public ENPlanInformCustomerShortList getFilteredList(
			ENPlanInformCustomerFilter aENPlanInformCustomerFilter)
			throws java.rmi.RemoteException;

	/* ENPlanInformCustomer. �������� ������ ��� ��������� */
	public ENPlanInformCustomerShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanInformCustomer. �������� ������ ��� ��������� �� ������� */
	public ENPlanInformCustomerShortList getScrollableFilteredList(
			ENPlanInformCustomerFilter aENPlanInformCustomerFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanInformCustomer. �������� ������ ��� ��������� �� ������� */
	public ENPlanInformCustomerShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanInformCustomer. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPlanInformCustomerFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanInformCustomer. �������� ������ �� ������ */
	public ENPlanInformCustomerShort getShortObject(int code)
			throws java.rmi.RemoteException;

}