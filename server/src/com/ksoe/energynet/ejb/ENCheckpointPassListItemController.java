
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCheckpointPassListItem;
 *
 */

import com.ksoe.energynet.valueobject.ENCheckpointPassListItem;
import com.ksoe.energynet.valueobject.brief.ENCheckpointPassListItemShort;
import com.ksoe.energynet.valueobject.filter.ENCheckpointPassListItemFilter;
import com.ksoe.energynet.valueobject.lists.ENCheckpointPassListItemShortList;


public interface ENCheckpointPassListItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCheckpointPassListItemController";

	/* ENCheckpointPassListItem. �������� */
// SUPP-25511 ����������� ��������� ����� ����� � �����	public int add(ENCheckpointPassListItem aENCheckpointPassListItem)
//			throws java.rmi.RemoteException;
	public int add(ENCheckpointPassListItemShort[] aENCheckpointPassListItem)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. �������� */
	public void save(ENCheckpointPassListItem aENCheckpointPassListItem)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. �������� ������ */
	public ENCheckpointPassListItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. �������� ������ ������ */
	public ENCheckpointPassListItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. �������� ������ �� ������� */
	public ENCheckpointPassListItemShortList getFilteredList(
			ENCheckpointPassListItemFilter aENCheckpointPassListItemFilter)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. �������� ������ ��� ��������� */
	public ENCheckpointPassListItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. �������� ������ ��� ��������� �� ������� */
	public ENCheckpointPassListItemShortList getScrollableFilteredList(
			ENCheckpointPassListItemFilter aENCheckpointPassListItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. �������� ������ ��� ��������� �� ������� */
	public ENCheckpointPassListItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENCheckpointPassListItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCheckpointPassListItem. �������� ������ �� ������ */
	public ENCheckpointPassListItemShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public void addRideIn( ENCheckpointPassListItem object) throws java.rmi.RemoteException;
	public void addRideOut( ENCheckpointPassListItem object) throws java.rmi.RemoteException;

}