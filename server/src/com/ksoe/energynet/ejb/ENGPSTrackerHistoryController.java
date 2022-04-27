
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENGPSTrackerHistory;
 *
 */

import com.ksoe.energynet.valueobject.ENGPSTrackerHistory;
import com.ksoe.energynet.valueobject.lists.ENGPSTrackerHistoryShortList;
import com.ksoe.energynet.valueobject.brief.ENGPSTrackerHistoryShort;
import com.ksoe.energynet.valueobject.filter.ENGPSTrackerHistoryFilter;


public interface ENGPSTrackerHistoryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENGPSTrackerHistoryController";

	/* ENGPSTrackerHistory. �������� */
	public int add(ENGPSTrackerHistory aENGPSTrackerHistory)
			throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. �������� */
	public void save(ENGPSTrackerHistory aENGPSTrackerHistory)
			throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. �������� ������ */
	public ENGPSTrackerHistory getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. �������� ������ ������ */
	public ENGPSTrackerHistoryShortList getList()
			throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. �������� ������ �� ������� */
	public ENGPSTrackerHistoryShortList getFilteredList(
			ENGPSTrackerHistoryFilter aENGPSTrackerHistoryFilter)
			throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. �������� ������ ��� ��������� */
	public ENGPSTrackerHistoryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. �������� ������ ��� ��������� �� ������� */
	public ENGPSTrackerHistoryShortList getScrollableFilteredList(
			ENGPSTrackerHistoryFilter aENGPSTrackerHistoryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. �������� ������ ��� ��������� �� ������� */
	public ENGPSTrackerHistoryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENGPSTrackerHistoryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENGPSTrackerHistory. �������� ������ �� ������ */
	public ENGPSTrackerHistoryShort getShortObject(int code)
			throws java.rmi.RemoteException;

}