
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDelayServices;
 *
 */

import com.ksoe.energynet.valueobject.ENDelayServices;
import com.ksoe.energynet.valueobject.brief.ENDelayServicesShort;
import com.ksoe.energynet.valueobject.filter.ENDelayServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENDelayServicesShortList;


public interface ENDelayServicesController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDelayServicesController";

	/* ENDelayServices. �������� */
	public int add(ENDelayServices aENDelayServices)
			throws java.rmi.RemoteException;

	/* ENDelayServices. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDelayServices. �������� */
	public void save(ENDelayServices aENDelayServices)
			throws java.rmi.RemoteException;

	/* ENDelayServices. �������� ������ */
	public ENDelayServices getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDelayServices. �������� ������ ������ */
	public ENDelayServicesShortList getList()
			throws java.rmi.RemoteException;

	/* ENDelayServices. �������� ������ �� ������� */
	public ENDelayServicesShortList getFilteredList(
			ENDelayServicesFilter aENDelayServicesFilter)
			throws java.rmi.RemoteException;

	/* ENDelayServices. �������� ������ ��� ��������� */
	public ENDelayServicesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDelayServices. �������� ������ ��� ��������� �� ������� */
	public ENDelayServicesShortList getScrollableFilteredList(
			ENDelayServicesFilter aENDelayServicesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDelayServices. �������� ������ ��� ��������� �� ������� */
	public ENDelayServicesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDelayServices. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENDelayServicesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDelayServices. �������� ������ �� ������ */
	public ENDelayServicesShort getShortObject(int code)
			throws java.rmi.RemoteException;

}