
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSOValuesType;
 *
 */

import com.ksoe.energynet.valueobject.ENSOValuesType;
import com.ksoe.energynet.valueobject.lists.ENSOValuesTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENSOValuesTypeShort;
import com.ksoe.energynet.valueobject.filter.ENSOValuesTypeFilter;


public interface ENSOValuesTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSOValuesTypeController";

	/* ENSOValuesType. �������� */
	public int add(ENSOValuesType aENSOValuesType)
			throws java.rmi.RemoteException;

	/* ENSOValuesType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSOValuesType. �������� */
	public void save(ENSOValuesType aENSOValuesType)
			throws java.rmi.RemoteException;

	/* ENSOValuesType. �������� ������ */
	public ENSOValuesType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSOValuesType. �������� ������ ������ */
	public ENSOValuesTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENSOValuesType. �������� ������ �� ������� */
	public ENSOValuesTypeShortList getFilteredList(
			ENSOValuesTypeFilter aENSOValuesTypeFilter)
			throws java.rmi.RemoteException;

	/* ENSOValuesType. �������� ������ ��� ��������� */
	public ENSOValuesTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOValuesType. �������� ������ ��� ��������� �� ������� */
	public ENSOValuesTypeShortList getScrollableFilteredList(
			ENSOValuesTypeFilter aENSOValuesTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOValuesType. �������� ������ ��� ��������� �� ������� */
	public ENSOValuesTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSOValuesType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSOValuesTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSOValuesType. �������� ������ �� ������ */
	public ENSOValuesTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}