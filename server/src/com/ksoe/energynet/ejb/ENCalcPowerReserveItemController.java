
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCalcPowerReserveItem;
 *
 */

import com.ksoe.energynet.valueobject.ENCalcPowerReserveItem;
import com.ksoe.energynet.valueobject.lists.ENCalcPowerReserveItemShortList;
import com.ksoe.energynet.valueobject.brief.ENCalcPowerReserveItemShort;
import com.ksoe.energynet.valueobject.filter.ENCalcPowerReserveItemFilter;


public interface ENCalcPowerReserveItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCalcPowerReserveItemController";

	/* ENCalcPowerReserveItem. �������� */
	public int add(ENCalcPowerReserveItem aENCalcPowerReserveItem)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. �������� */
	public void save(ENCalcPowerReserveItem aENCalcPowerReserveItem)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. �������� ������ */
	public ENCalcPowerReserveItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. �������� ������ ������ */
	public ENCalcPowerReserveItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. �������� ������ �� ������� */
	public ENCalcPowerReserveItemShortList getFilteredList(
			ENCalcPowerReserveItemFilter aENCalcPowerReserveItemFilter)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. �������� ������ ��� ��������� */
	public ENCalcPowerReserveItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. �������� ������ ��� ��������� �� ������� */
	public ENCalcPowerReserveItemShortList getScrollableFilteredList(
			ENCalcPowerReserveItemFilter aENCalcPowerReserveItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. �������� ������ ��� ��������� �� ������� */
	public ENCalcPowerReserveItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENCalcPowerReserveItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCalcPowerReserveItem. �������� ������ �� ������ */
	public ENCalcPowerReserveItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}