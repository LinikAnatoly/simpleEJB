
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanXqtnHistory;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanXqtnHistory;
import com.ksoe.energynet.valueobject.lists.ENPlanXqtnHistoryShortList;
import com.ksoe.energynet.valueobject.brief.ENPlanXqtnHistoryShort;
import com.ksoe.energynet.valueobject.filter.ENPlanXqtnHistoryFilter;


public interface ENPlanXqtnHistoryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanXqtnHistoryController";

	/* ENPlanXqtnHistory. �������� */
	public int add(ENPlanXqtnHistory aENPlanXqtnHistory)
			throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. �������� */
	public void save(ENPlanXqtnHistory aENPlanXqtnHistory)
			throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. �������� ������ */
	public ENPlanXqtnHistory getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. �������� ������ ������ */
	public ENPlanXqtnHistoryShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. �������� ������ �� ������� */
	public ENPlanXqtnHistoryShortList getFilteredList(
			ENPlanXqtnHistoryFilter aENPlanXqtnHistoryFilter)
			throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. �������� ������ ��� ��������� */
	public ENPlanXqtnHistoryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. �������� ������ ��� ��������� �� ������� */
	public ENPlanXqtnHistoryShortList getScrollableFilteredList(
			ENPlanXqtnHistoryFilter aENPlanXqtnHistoryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. �������� ������ ��� ��������� �� ������� */
	public ENPlanXqtnHistoryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPlanXqtnHistoryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanXqtnHistory. �������� ������ �� ������ */
	public ENPlanXqtnHistoryShort getShortObject(int code)
			throws java.rmi.RemoteException;

}