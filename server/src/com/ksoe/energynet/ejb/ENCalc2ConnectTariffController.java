
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCalc2ConnectTariff;
 *
 */

import com.ksoe.energynet.valueobject.ENCalc2ConnectTariff;
import com.ksoe.energynet.valueobject.brief.ENCalc2ConnectTariffShort;
import com.ksoe.energynet.valueobject.filter.ENCalc2ConnectTariffFilter;
import com.ksoe.energynet.valueobject.lists.ENCalc2ConnectTariffShortList;


public interface ENCalc2ConnectTariffController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCalc2ConnectTariffController";

	/* ENCalc2ConnectTariff. �������� */
	public int add(ENCalc2ConnectTariff aENCalc2ConnectTariff)
			throws java.rmi.RemoteException;

	/* ENCalc2ConnectTariff. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCalc2ConnectTariff. �������� */
	public void save(ENCalc2ConnectTariff aENCalc2ConnectTariff)
			throws java.rmi.RemoteException;

	/* ENCalc2ConnectTariff. �������� ������ */
	public ENCalc2ConnectTariff getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCalc2ConnectTariff. �������� ������ ������ */
	public ENCalc2ConnectTariffShortList getList()
			throws java.rmi.RemoteException;

	/* ENCalc2ConnectTariff. �������� ������ �� ������� */
	public ENCalc2ConnectTariffShortList getFilteredList(
			ENCalc2ConnectTariffFilter aENCalc2ConnectTariffFilter)
			throws java.rmi.RemoteException;

	/* ENCalc2ConnectTariff. �������� ������ ��� ��������� */
	public ENCalc2ConnectTariffShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCalc2ConnectTariff. �������� ������ ��� ��������� �� ������� */
	public ENCalc2ConnectTariffShortList getScrollableFilteredList(
			ENCalc2ConnectTariffFilter aENCalc2ConnectTariffFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCalc2ConnectTariff. �������� ������ ��� ��������� �� ������� */
	public ENCalc2ConnectTariffShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCalc2ConnectTariff. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENCalc2ConnectTariffFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCalc2ConnectTariff. �������� ������ �� ������ */
	public ENCalc2ConnectTariffShort getShortObject(int code)
			throws java.rmi.RemoteException;

}