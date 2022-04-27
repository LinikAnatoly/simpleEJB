
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanGraphFinancingFuelItem;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuelItem;
import com.ksoe.energynet.valueobject.brief.ENPlanGraphFinancingFuelItemShort;
import com.ksoe.energynet.valueobject.filter.ENPlanGraphFinancingFuelItemFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanGraphFinancingFuelItemShortList;


public interface ENPlanGraphFinancingFuelItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanGraphFinancingFuelItemController";

	/* ENPlanGraphFinancingFuelItem. �������� */
	public int add(ENPlanGraphFinancingFuelItem aENPlanGraphFinancingFuelItem)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. �������� */
	public void save(ENPlanGraphFinancingFuelItem aENPlanGraphFinancingFuelItem)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. �������� ������ */
	public ENPlanGraphFinancingFuelItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. �������� ������ ������ */
	public ENPlanGraphFinancingFuelItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. �������� ������ �� ������� */
	public ENPlanGraphFinancingFuelItemShortList getFilteredList(
			ENPlanGraphFinancingFuelItemFilter aENPlanGraphFinancingFuelItemFilter)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. �������� ������ ��� ��������� */
	public ENPlanGraphFinancingFuelItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. �������� ������ ��� ��������� �� ������� */
	public ENPlanGraphFinancingFuelItemShortList getScrollableFilteredList(
			ENPlanGraphFinancingFuelItemFilter aENPlanGraphFinancingFuelItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. �������� ������ ��� ��������� �� ������� */
	public ENPlanGraphFinancingFuelItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPlanGraphFinancingFuelItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuelItem. �������� ������ �� ������ */
	public ENPlanGraphFinancingFuelItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}