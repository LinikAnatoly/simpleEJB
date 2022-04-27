
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPImplementationType;
 *
 */

import com.ksoe.energynet.valueobject.ENIPImplementationType;
import com.ksoe.energynet.valueobject.brief.ENIPImplementationTypeShort;
import com.ksoe.energynet.valueobject.filter.ENIPImplementationTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENIPImplementationTypeShortList;


public interface ENIPImplementationTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPImplementationTypeController";

	/* ENIPImplementationType. �������� */
	public int add(ENIPImplementationType aENIPImplementationType)
			throws java.rmi.RemoteException;

	/* ENIPImplementationType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPImplementationType. �������� */
	public void save(ENIPImplementationType aENIPImplementationType)
			throws java.rmi.RemoteException;

	/* ENIPImplementationType. �������� ������ */
	public ENIPImplementationType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPImplementationType. �������� ������ ������ */
	public ENIPImplementationTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPImplementationType. �������� ������ �� ������� */
	public ENIPImplementationTypeShortList getFilteredList(
			ENIPImplementationTypeFilter aENIPImplementationTypeFilter)
			throws java.rmi.RemoteException;

	/* ENIPImplementationType. �������� ������ ��� ��������� */
	public ENIPImplementationTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPImplementationType. �������� ������ ��� ��������� �� ������� */
	public ENIPImplementationTypeShortList getScrollableFilteredList(
			ENIPImplementationTypeFilter aENIPImplementationTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPImplementationType. �������� ������ ��� ��������� �� ������� */
	public ENIPImplementationTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPImplementationType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENIPImplementationTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPImplementationType. �������� ������ �� ������ */
	public ENIPImplementationTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}