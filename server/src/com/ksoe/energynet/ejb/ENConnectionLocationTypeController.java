
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENConnectionLocationType;
 *
 */

import com.ksoe.energynet.valueobject.ENConnectionLocationType;
import com.ksoe.energynet.valueobject.lists.ENConnectionLocationTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENConnectionLocationTypeShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionLocationTypeFilter;


public interface ENConnectionLocationTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENConnectionLocationTypeController";

	/* ENConnectionLocationType. �������� */
	public int add(ENConnectionLocationType aENConnectionLocationType)
			throws java.rmi.RemoteException;

	/* ENConnectionLocationType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENConnectionLocationType. �������� */
	public void save(ENConnectionLocationType aENConnectionLocationType)
			throws java.rmi.RemoteException;

	/* ENConnectionLocationType. �������� ������ */
	public ENConnectionLocationType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENConnectionLocationType. �������� ������ ������ */
	public ENConnectionLocationTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENConnectionLocationType. �������� ������ �� ������� */
	public ENConnectionLocationTypeShortList getFilteredList(
			ENConnectionLocationTypeFilter aENConnectionLocationTypeFilter)
			throws java.rmi.RemoteException;

	/* ENConnectionLocationType. �������� ������ ��� ��������� */
	public ENConnectionLocationTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionLocationType. �������� ������ ��� ��������� �� ������� */
	public ENConnectionLocationTypeShortList getScrollableFilteredList(
			ENConnectionLocationTypeFilter aENConnectionLocationTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionLocationType. �������� ������ ��� ��������� �� ������� */
	public ENConnectionLocationTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENConnectionLocationType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENConnectionLocationTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENConnectionLocationType. �������� ������ �� ������ */
	public ENConnectionLocationTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}