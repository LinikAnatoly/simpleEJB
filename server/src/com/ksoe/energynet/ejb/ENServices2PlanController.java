
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServices2Plan;
 *
 */

import com.ksoe.energynet.valueobject.ENServices2Plan;
import com.ksoe.energynet.valueobject.lists.ENServices2PlanShortList;
import com.ksoe.energynet.valueobject.brief.ENServices2PlanShort;
import com.ksoe.energynet.valueobject.filter.ENServices2PlanFilter;


public interface ENServices2PlanController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServices2PlanController";

	/* ENServices2Plan. �������� */
	public int add(ENServices2Plan aENServices2Plan)
			throws java.rmi.RemoteException;

	/* ENServices2Plan. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServices2Plan. �������� */
	public void save(ENServices2Plan aENServices2Plan)
			throws java.rmi.RemoteException;

	/* ENServices2Plan. �������� ������ */
	public ENServices2Plan getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServices2Plan. �������� ������ ������ */
	public ENServices2PlanShortList getList()
			throws java.rmi.RemoteException;

	/* ENServices2Plan. �������� ������ �� ������� */
	public ENServices2PlanShortList getFilteredList(
			ENServices2PlanFilter aENServices2PlanFilter)
			throws java.rmi.RemoteException;

	/* ENServices2Plan. �������� ������ ��� ��������� */
	public ENServices2PlanShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServices2Plan. �������� ������ ��� ��������� �� ������� */
	public ENServices2PlanShortList getScrollableFilteredList(
			ENServices2PlanFilter aENServices2PlanFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServices2Plan. �������� ������ ��� ��������� �� ������� */
	public ENServices2PlanShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServices2Plan. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServices2PlanFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServices2Plan. �������� ������ �� ������ */
	public ENServices2PlanShort getShortObject(int code)
			throws java.rmi.RemoteException;

}