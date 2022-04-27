
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDisconnectInitiator;
 *
 */

import com.ksoe.energynet.valueobject.ENDisconnectInitiator;
import com.ksoe.energynet.valueobject.lists.ENDisconnectInitiatorShortList;
import com.ksoe.energynet.valueobject.brief.ENDisconnectInitiatorShort;
import com.ksoe.energynet.valueobject.filter.ENDisconnectInitiatorFilter;


public interface ENDisconnectInitiatorController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDisconnectInitiatorController";

	/* ENDisconnectInitiator. �������� */
	public int add(ENDisconnectInitiator aENDisconnectInitiator)
			throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. �������� */
	public void save(ENDisconnectInitiator aENDisconnectInitiator)
			throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. �������� ������ */
	public ENDisconnectInitiator getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. �������� ������ ������ */
	public ENDisconnectInitiatorShortList getList()
			throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. �������� ������ �� ������� */
	public ENDisconnectInitiatorShortList getFilteredList(
			ENDisconnectInitiatorFilter aENDisconnectInitiatorFilter)
			throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. �������� ������ ��� ��������� */
	public ENDisconnectInitiatorShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. �������� ������ ��� ��������� �� ������� */
	public ENDisconnectInitiatorShortList getScrollableFilteredList(
			ENDisconnectInitiatorFilter aENDisconnectInitiatorFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. �������� ������ ��� ��������� �� ������� */
	public ENDisconnectInitiatorShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENDisconnectInitiatorFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDisconnectInitiator. �������� ������ �� ������ */
	public ENDisconnectInitiatorShort getShortObject(int code)
			throws java.rmi.RemoteException;

}