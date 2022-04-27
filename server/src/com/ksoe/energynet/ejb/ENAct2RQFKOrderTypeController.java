
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAct2RQFKOrderType;
 *
 */

import com.ksoe.energynet.valueobject.ENAct2RQFKOrderType;
import com.ksoe.energynet.valueobject.brief.ENAct2RQFKOrderTypeShort;
import com.ksoe.energynet.valueobject.filter.ENAct2RQFKOrderTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2RQFKOrderTypeShortList;


public interface ENAct2RQFKOrderTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAct2RQFKOrderTypeController";

	/* ENAct2RQFKOrderType. �������� */
	public int add(ENAct2RQFKOrderType aENAct2RQFKOrderType)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. �������� */
	public void save(ENAct2RQFKOrderType aENAct2RQFKOrderType)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. �������� ������ */
	public ENAct2RQFKOrderType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. �������� ������ ������ */
	public ENAct2RQFKOrderTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. �������� ������ �� ������� */
	public ENAct2RQFKOrderTypeShortList getFilteredList(
			ENAct2RQFKOrderTypeFilter aENAct2RQFKOrderTypeFilter)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. �������� ������ ��� ��������� */
	public ENAct2RQFKOrderTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. �������� ������ ��� ��������� �� ������� */
	public ENAct2RQFKOrderTypeShortList getScrollableFilteredList(
			ENAct2RQFKOrderTypeFilter aENAct2RQFKOrderTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. �������� ������ ��� ��������� �� ������� */
	public ENAct2RQFKOrderTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENAct2RQFKOrderTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAct2RQFKOrderType. �������� ������ �� ������ */
	public ENAct2RQFKOrderTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}