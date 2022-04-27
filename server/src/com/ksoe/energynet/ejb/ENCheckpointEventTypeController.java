
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCheckpointEventType;
 *
 */

import com.ksoe.energynet.valueobject.ENCheckpointEventType;
import com.ksoe.energynet.valueobject.brief.ENCheckpointEventTypeShort;
import com.ksoe.energynet.valueobject.filter.ENCheckpointEventTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENCheckpointEventTypeShortList;


public interface ENCheckpointEventTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCheckpointEventTypeController";

	/* ENCheckpointEventType. �������� */
	public int add(ENCheckpointEventType aENCheckpointEventType)
			throws java.rmi.RemoteException;

	/* ENCheckpointEventType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCheckpointEventType. �������� */
	public void save(ENCheckpointEventType aENCheckpointEventType)
			throws java.rmi.RemoteException;

	/* ENCheckpointEventType. �������� ������ */
	public ENCheckpointEventType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCheckpointEventType. �������� ������ ������ */
	public ENCheckpointEventTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENCheckpointEventType. �������� ������ �� ������� */
	public ENCheckpointEventTypeShortList getFilteredList(
			ENCheckpointEventTypeFilter aENCheckpointEventTypeFilter)
			throws java.rmi.RemoteException;

	/* ENCheckpointEventType. �������� ������ ��� ��������� */
	public ENCheckpointEventTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpointEventType. �������� ������ ��� ��������� �� ������� */
	public ENCheckpointEventTypeShortList getScrollableFilteredList(
			ENCheckpointEventTypeFilter aENCheckpointEventTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpointEventType. �������� ������ ��� ��������� �� ������� */
	public ENCheckpointEventTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCheckpointEventType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENCheckpointEventTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCheckpointEventType. �������� ������ �� ������ */
	public ENCheckpointEventTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}