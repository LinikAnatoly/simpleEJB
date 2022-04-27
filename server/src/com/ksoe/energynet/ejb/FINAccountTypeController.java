
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for FINAccountType;
 *
 */

import com.ksoe.energynet.valueobject.FINAccountType;
import com.ksoe.energynet.valueobject.lists.FINAccountTypeShortList;
import com.ksoe.energynet.valueobject.brief.FINAccountTypeShort;
import com.ksoe.energynet.valueobject.filter.FINAccountTypeFilter;


public interface FINAccountTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/FINAccountTypeController";

	/* FINAccountType. �������� */
	public int add(FINAccountType aFINAccountType)
			throws java.rmi.RemoteException;

	/* FINAccountType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* FINAccountType. �������� */
	public void save(FINAccountType aFINAccountType)
			throws java.rmi.RemoteException;

	/* FINAccountType. �������� ������ */
	public FINAccountType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* FINAccountType. �������� ������ ������ */
	public FINAccountTypeShortList getList()
			throws java.rmi.RemoteException;

	/* FINAccountType. �������� ������ �� ������� */
	public FINAccountTypeShortList getFilteredList(
			FINAccountTypeFilter aFINAccountTypeFilter)
			throws java.rmi.RemoteException;

	/* FINAccountType. �������� ������ ��� ��������� */
	public FINAccountTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FINAccountType. �������� ������ ��� ��������� �� ������� */
	public FINAccountTypeShortList getScrollableFilteredList(
			FINAccountTypeFilter aFINAccountTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FINAccountType. �������� ������ ��� ��������� �� ������� */
	public FINAccountTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* FINAccountType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			FINAccountTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* FINAccountType. �������� ������ �� ������ */
	public FINAccountTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}