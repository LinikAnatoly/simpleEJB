
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSheets4SOItems;
 *
 */

import com.ksoe.energynet.valueobject.ENSheets4SOItems;
import com.ksoe.energynet.valueobject.lists.ENSheets4SOItemsShortList;
import com.ksoe.energynet.valueobject.brief.ENSheets4SOItemsShort;
import com.ksoe.energynet.valueobject.filter.ENSheets4SOItemsFilter;


public interface ENSheets4SOItemsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSheets4SOItemsController";

	/* ENSheets4SOItems. �������� */
	public int add(ENSheets4SOItems aENSheets4SOItems)
			throws java.rmi.RemoteException;

	/* ENSheets4SOItems. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSheets4SOItems. �������� */
	public void save(ENSheets4SOItems aENSheets4SOItems)
			throws java.rmi.RemoteException;

	/* ENSheets4SOItems. �������� ������ */
	public ENSheets4SOItems getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSheets4SOItems. �������� ������ ������ */
	public ENSheets4SOItemsShortList getList()
			throws java.rmi.RemoteException;

	/* ENSheets4SOItems. �������� ������ �� ������� */
	public ENSheets4SOItemsShortList getFilteredList(
			ENSheets4SOItemsFilter aENSheets4SOItemsFilter)
			throws java.rmi.RemoteException;

	/* ENSheets4SOItems. �������� ������ ��� ��������� */
	public ENSheets4SOItemsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSheets4SOItems. �������� ������ ��� ��������� �� ������� */
	public ENSheets4SOItemsShortList getScrollableFilteredList(
			ENSheets4SOItemsFilter aENSheets4SOItemsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSheets4SOItems. �������� ������ ��� ��������� �� ������� */
	public ENSheets4SOItemsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSheets4SOItems. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSheets4SOItemsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSheets4SOItems. �������� ������ �� ������ */
	public ENSheets4SOItemsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}