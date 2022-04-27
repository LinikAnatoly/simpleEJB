
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelSheetVolumesStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelSheetVolumesStatus;
import com.ksoe.energynet.valueobject.brief.ENFuelSheetVolumesStatusShort;
import com.ksoe.energynet.valueobject.filter.ENFuelSheetVolumesStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolumesStatusShortList;


public interface ENFuelSheetVolumesStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelSheetVolumesStatusController";

	/* ENFuelSheetVolumesStatus. �������� */
	public int add(ENFuelSheetVolumesStatus aENFuelSheetVolumesStatus)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. �������� */
	public void save(ENFuelSheetVolumesStatus aENFuelSheetVolumesStatus)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. �������� ������ */
	public ENFuelSheetVolumesStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. �������� ������ ������ */
	public ENFuelSheetVolumesStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. �������� ������ �� ������� */
	public ENFuelSheetVolumesStatusShortList getFilteredList(
			ENFuelSheetVolumesStatusFilter aENFuelSheetVolumesStatusFilter)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. �������� ������ ��� ��������� */
	public ENFuelSheetVolumesStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. �������� ������ ��� ��������� �� ������� */
	public ENFuelSheetVolumesStatusShortList getScrollableFilteredList(
			ENFuelSheetVolumesStatusFilter aENFuelSheetVolumesStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. �������� ������ ��� ��������� �� ������� */
	public ENFuelSheetVolumesStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENFuelSheetVolumesStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. �������� ������ �� ������ */
	public ENFuelSheetVolumesStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}