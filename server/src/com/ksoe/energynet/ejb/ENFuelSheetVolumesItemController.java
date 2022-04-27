
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelSheetVolumesItem;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelSheetVolumesItem;
import com.ksoe.energynet.valueobject.brief.ENFuelSheetVolumesItemShort;
import com.ksoe.energynet.valueobject.filter.ENFuelSheetVolumesItemFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolumesItemShortList;


public interface ENFuelSheetVolumesItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelSheetVolumesItemController";

	/* ENFuelSheetVolumesItem. �������� */
	public int add(ENFuelSheetVolumesItem aENFuelSheetVolumesItem)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. �������� */
	public void save(ENFuelSheetVolumesItem aENFuelSheetVolumesItem)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. �������� ������ */
	public ENFuelSheetVolumesItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. �������� ������ ������ */
	public ENFuelSheetVolumesItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. �������� ������ �� ������� */
	public ENFuelSheetVolumesItemShortList getFilteredList(
			ENFuelSheetVolumesItemFilter aENFuelSheetVolumesItemFilter)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. �������� ������ ��� ��������� */
	public ENFuelSheetVolumesItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. �������� ������ ��� ��������� �� ������� */
	public ENFuelSheetVolumesItemShortList getScrollableFilteredList(
			ENFuelSheetVolumesItemFilter aENFuelSheetVolumesItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. �������� ������ ��� ��������� �� ������� */
	public ENFuelSheetVolumesItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENFuelSheetVolumesItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. �������� ������ �� ������ */
	public ENFuelSheetVolumesItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}