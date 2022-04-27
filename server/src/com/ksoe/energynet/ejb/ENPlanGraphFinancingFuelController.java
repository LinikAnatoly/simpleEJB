
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanGraphFinancingFuel;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuel;
import com.ksoe.energynet.valueobject.brief.ENPlanGraphFinancingFuelShort;
import com.ksoe.energynet.valueobject.filter.ENPlanGraphFinancingFuelFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanGraphFinancingFuelShortList;


public interface ENPlanGraphFinancingFuelController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanGraphFinancingFuelController";

	/* ENPlanGraphFinancingFuel. �������� */
	public int add(ENPlanGraphFinancingFuel aENPlanGraphFinancingFuel)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. �������� */
	public void save(ENPlanGraphFinancingFuel aENPlanGraphFinancingFuel)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. �������� ������ */
	public ENPlanGraphFinancingFuel getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. �������� ������ ������ */
	public ENPlanGraphFinancingFuelShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. �������� ������ �� ������� */
	public ENPlanGraphFinancingFuelShortList getFilteredList(
			ENPlanGraphFinancingFuelFilter aENPlanGraphFinancingFuelFilter)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. �������� ������ ��� ��������� */
	public ENPlanGraphFinancingFuelShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. �������� ������ ��� ��������� �� ������� */
	public ENPlanGraphFinancingFuelShortList getScrollableFilteredList(
			ENPlanGraphFinancingFuelFilter aENPlanGraphFinancingFuelFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. �������� ������ ��� ��������� �� ������� */
	public ENPlanGraphFinancingFuelShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPlanGraphFinancingFuelFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanGraphFinancingFuel. �������� ������ �� ������ */
	public ENPlanGraphFinancingFuelShort getShortObject(int code)
			throws java.rmi.RemoteException;

}