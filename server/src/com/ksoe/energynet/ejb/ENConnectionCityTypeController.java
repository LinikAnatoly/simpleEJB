
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENConnectionCityType;
 *
 */

import com.ksoe.energynet.valueobject.ENConnectionCityType;
import com.ksoe.energynet.valueobject.lists.ENConnectionCityTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENConnectionCityTypeShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionCityTypeFilter;


public interface ENConnectionCityTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENConnectionCityTypeController";

	/* ENConnectionCityType. �������� */
	public int add(ENConnectionCityType aENConnectionCityType)
			throws java.rmi.RemoteException;

	/* ENConnectionCityType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENConnectionCityType. �������� */
	public void save(ENConnectionCityType aENConnectionCityType)
			throws java.rmi.RemoteException;

	/* ENConnectionCityType. �������� ������ */
	public ENConnectionCityType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENConnectionCityType. �������� ������ ������ */
	public ENConnectionCityTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENConnectionCityType. �������� ������ �� ������� */
	public ENConnectionCityTypeShortList getFilteredList(
			ENConnectionCityTypeFilter aENConnectionCityTypeFilter)
			throws java.rmi.RemoteException;

	/* ENConnectionCityType. �������� ������ ��� ��������� */
	public ENConnectionCityTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionCityType. �������� ������ ��� ��������� �� ������� */
	public ENConnectionCityTypeShortList getScrollableFilteredList(
			ENConnectionCityTypeFilter aENConnectionCityTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionCityType. �������� ������ ��� ��������� �� ������� */
	public ENConnectionCityTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENConnectionCityType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENConnectionCityTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENConnectionCityType. �������� ������ �� ������ */
	public ENConnectionCityTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}