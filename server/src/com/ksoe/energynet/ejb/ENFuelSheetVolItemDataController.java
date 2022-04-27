
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelSheetVolItemData;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelSheetVolItemData;
import com.ksoe.energynet.valueobject.brief.ENFuelSheetVolItemDataShort;
import com.ksoe.energynet.valueobject.filter.ENFuelSheetVolItemDataFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolItemDataShortList;


public interface ENFuelSheetVolItemDataController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelSheetVolItemDataController";

	/* ENFuelSheetVolItemData. �������� */
	public int add(ENFuelSheetVolItemData aENFuelSheetVolItemData)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolItemData. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelSheetVolItemData. �������� */
	public void save(ENFuelSheetVolItemData aENFuelSheetVolItemData)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolItemData. �������� ������ */
	public ENFuelSheetVolItemData getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolItemData. �������� ������ ������ */
	public ENFuelSheetVolItemDataShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolItemData. �������� ������ �� ������� */
	public ENFuelSheetVolItemDataShortList getFilteredList(
			ENFuelSheetVolItemDataFilter aENFuelSheetVolItemDataFilter)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolItemData. �������� ������ ��� ��������� */
	public ENFuelSheetVolItemDataShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolItemData. �������� ������ ��� ��������� �� ������� */
	public ENFuelSheetVolItemDataShortList getScrollableFilteredList(
			ENFuelSheetVolItemDataFilter aENFuelSheetVolItemDataFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolItemData. �������� ������ ��� ��������� �� ������� */
	public ENFuelSheetVolItemDataShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolItemData. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENFuelSheetVolItemDataFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolItemData. �������� ������ �� ������ */
	public ENFuelSheetVolItemDataShort getShortObject(int code)
			throws java.rmi.RemoteException;

}