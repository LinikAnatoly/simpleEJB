
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCheckpointPassList;
 *
 */

import com.ksoe.energynet.valueobject.ENCheckpointPassList;
import com.ksoe.energynet.valueobject.brief.ENCheckpointPassListShort;
import com.ksoe.energynet.valueobject.filter.ENCheckpointPassListFilter;
import com.ksoe.energynet.valueobject.lists.ENCheckpointPassListShortList;


public interface ENCheckpointPassListController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCheckpointPassListController";

	/* ENCheckpointPassList. �������� */
	public int add(ENCheckpointPassList aENCheckpointPassList)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassList. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCheckpointPassList. �������� */
	public void save(ENCheckpointPassList aENCheckpointPassList)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassList. �������� ������ */
	public ENCheckpointPassList getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassList. �������� ������ ������ */
	public ENCheckpointPassListShortList getList()
			throws java.rmi.RemoteException;

	/* ENCheckpointPassList. �������� ������ �� ������� */
	public ENCheckpointPassListShortList getFilteredList(
			ENCheckpointPassListFilter aENCheckpointPassListFilter)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassList. �������� ������ ��� ��������� */
	public ENCheckpointPassListShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpointPassList. �������� ������ ��� ��������� �� ������� */
	public ENCheckpointPassListShortList getScrollableFilteredList(
			ENCheckpointPassListFilter aENCheckpointPassListFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpointPassList. �������� ������ ��� ��������� �� ������� */
	public ENCheckpointPassListShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassList. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENCheckpointPassListFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCheckpointPassList. �������� ������ �� ������ */
	public ENCheckpointPassListShort getShortObject(int code)
			throws java.rmi.RemoteException;

}