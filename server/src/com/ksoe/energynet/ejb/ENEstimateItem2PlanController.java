
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENEstimateItem2Plan;
 *
 */

import com.ksoe.energynet.valueobject.ENEstimateItem2Plan;
import com.ksoe.energynet.valueobject.brief.ENEstimateItem2PlanShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2PlanFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2PlanShortList;


public interface ENEstimateItem2PlanController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENEstimateItem2PlanController";

	/* ENEstimateItem2Plan. �������� */
	public int add(ENEstimateItem2Plan aENEstimateItem2Plan)
			throws java.rmi.RemoteException;

	/* ENEstimateItem2Plan. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENEstimateItem2Plan. �������� */
	public void save(ENEstimateItem2Plan aENEstimateItem2Plan)
			throws java.rmi.RemoteException;

	/* ENEstimateItem2Plan. �������� ������ */
	public ENEstimateItem2Plan getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENEstimateItem2Plan. �������� ������ ������ */
	public ENEstimateItem2PlanShortList getList()
			throws java.rmi.RemoteException;

	/* ENEstimateItem2Plan. �������� ������ �� ������� */
	public ENEstimateItem2PlanShortList getFilteredList(
			ENEstimateItem2PlanFilter aENEstimateItem2PlanFilter)
			throws java.rmi.RemoteException;

	/* ENEstimateItem2Plan. �������� ������ ��� ��������� */
	public ENEstimateItem2PlanShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENEstimateItem2Plan. �������� ������ ��� ��������� �� ������� */
	public ENEstimateItem2PlanShortList getScrollableFilteredList(
			ENEstimateItem2PlanFilter aENEstimateItem2PlanFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENEstimateItem2Plan. �������� ������ ��� ��������� �� ������� */
	public ENEstimateItem2PlanShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENEstimateItem2Plan. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENEstimateItem2PlanFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENEstimateItem2Plan. �������� ������ �� ������ */
	public ENEstimateItem2PlanShort getShortObject(int code)
			throws java.rmi.RemoteException;

}