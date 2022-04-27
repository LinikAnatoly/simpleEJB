
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENNormVolumeAVZItem;
 *
 */

import com.ksoe.energynet.valueobject.ENNormVolumeAVZItem;
import com.ksoe.energynet.valueobject.brief.ENNormVolumeAVZItemShort;
import com.ksoe.energynet.valueobject.filter.ENNormVolumeAVZItemFilter;
import com.ksoe.energynet.valueobject.lists.ENNormVolumeAVZItemShortList;


public interface ENNormVolumeAVZItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENNormVolumeAVZItemController";

	/* ENNormVolumeAVZItem. �������� */
	public int add(ENNormVolumeAVZItem aENNormVolumeAVZItem)
			throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. �������� */
	public void save(ENNormVolumeAVZItem aENNormVolumeAVZItem)
			throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. �������� ������ */
	public ENNormVolumeAVZItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. �������� ������ ������ */
	public ENNormVolumeAVZItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. �������� ������ �� ������� */
	public ENNormVolumeAVZItemShortList getFilteredList(
			ENNormVolumeAVZItemFilter aENNormVolumeAVZItemFilter)
			throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. �������� ������ ��� ��������� */
	public ENNormVolumeAVZItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. �������� ������ ��� ��������� �� ������� */
	public ENNormVolumeAVZItemShortList getScrollableFilteredList(
			ENNormVolumeAVZItemFilter aENNormVolumeAVZItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. �������� ������ ��� ��������� �� ������� */
	public ENNormVolumeAVZItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENNormVolumeAVZItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. �������� ������ �� ������ */
	public ENNormVolumeAVZItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}