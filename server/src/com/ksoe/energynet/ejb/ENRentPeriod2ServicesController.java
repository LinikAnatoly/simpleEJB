
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENRentPeriod2Services;
 *
 */

import com.ksoe.energynet.valueobject.ENRentPeriod2Services;
import com.ksoe.energynet.valueobject.brief.ENRentPeriod2ServicesShort;
import com.ksoe.energynet.valueobject.filter.ENRentPeriod2ServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENRentPeriod2ServicesShortList;


public interface ENRentPeriod2ServicesController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENRentPeriod2ServicesController";

	/* ENRentPeriod2Services. �������� */
	public int add(ENRentPeriod2Services aENRentPeriod2Services)
			throws java.rmi.RemoteException;

	/* ENRentPeriod2Services. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENRentPeriod2Services. �������� */
	public void save(ENRentPeriod2Services aENRentPeriod2Services)
			throws java.rmi.RemoteException;

	/* ENRentPeriod2Services. �������� ������ */
	public ENRentPeriod2Services getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENRentPeriod2Services. �������� ������ ������ */
	public ENRentPeriod2ServicesShortList getList()
			throws java.rmi.RemoteException;

	/* ENRentPeriod2Services. �������� ������ �� ������� */
	public ENRentPeriod2ServicesShortList getFilteredList(
			ENRentPeriod2ServicesFilter aENRentPeriod2ServicesFilter)
			throws java.rmi.RemoteException;

	/* ENRentPeriod2Services. �������� ������ ��� ��������� */
	public ENRentPeriod2ServicesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRentPeriod2Services. �������� ������ ��� ��������� �� ������� */
	public ENRentPeriod2ServicesShortList getScrollableFilteredList(
			ENRentPeriod2ServicesFilter aENRentPeriod2ServicesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRentPeriod2Services. �������� ������ ��� ��������� �� ������� */
	public ENRentPeriod2ServicesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENRentPeriod2Services. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENRentPeriod2ServicesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENRentPeriod2Services. �������� ������ �� ������ */
	public ENRentPeriod2ServicesShort getShortObject(int code)
			throws java.rmi.RemoteException;

}