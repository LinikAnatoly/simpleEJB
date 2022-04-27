
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENElement2ActType;
 *
 */

import com.ksoe.energynet.valueobject.ENElement2ActType;
import com.ksoe.energynet.valueobject.lists.ENElement2ActTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENElement2ActTypeShort;
import com.ksoe.energynet.valueobject.filter.ENElement2ActTypeFilter;


public interface ENElement2ActTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENElement2ActTypeController";

	/* ENElement2ActType. �������� */
	public int add(ENElement2ActType aENElement2ActType)
			throws java.rmi.RemoteException;

	/* ENElement2ActType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENElement2ActType. �������� */
	public void save(ENElement2ActType aENElement2ActType)
			throws java.rmi.RemoteException;

	/* ENElement2ActType. �������� ������ */
	public ENElement2ActType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENElement2ActType. �������� ������ ������ */
	public ENElement2ActTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENElement2ActType. �������� ������ �� ������� */
	public ENElement2ActTypeShortList getFilteredList(
			ENElement2ActTypeFilter aENElement2ActTypeFilter)
			throws java.rmi.RemoteException;

	/* ENElement2ActType. �������� ������ ��� ��������� */
	public ENElement2ActTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENElement2ActType. �������� ������ ��� ��������� �� ������� */
	public ENElement2ActTypeShortList getScrollableFilteredList(
			ENElement2ActTypeFilter aENElement2ActTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENElement2ActType. �������� ������ ��� ��������� �� ������� */
	public ENElement2ActTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENElement2ActType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENElement2ActTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENElement2ActType. �������� ������ �� ������ */
	public ENElement2ActTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}