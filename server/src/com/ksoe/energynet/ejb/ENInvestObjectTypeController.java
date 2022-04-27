
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENInvestObjectType;
 *
 */

import com.ksoe.energynet.valueobject.ENInvestObjectType;
import com.ksoe.energynet.valueobject.brief.ENInvestObjectTypeShort;
import com.ksoe.energynet.valueobject.filter.ENInvestObjectTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENInvestObjectTypeShortList;


public interface ENInvestObjectTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENInvestObjectTypeController";

	/* ENInvestObjectType. �������� */
	public int add(ENInvestObjectType aENInvestObjectType)
			throws java.rmi.RemoteException;

	/* ENInvestObjectType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENInvestObjectType. �������� */
	public void save(ENInvestObjectType aENInvestObjectType)
			throws java.rmi.RemoteException;

	/* ENInvestObjectType. �������� ������ */
	public ENInvestObjectType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENInvestObjectType. �������� ������ ������ */
	public ENInvestObjectTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENInvestObjectType. �������� ������ �� ������� */
	public ENInvestObjectTypeShortList getFilteredList(
			ENInvestObjectTypeFilter aENInvestObjectTypeFilter)
			throws java.rmi.RemoteException;

	/* ENInvestObjectType. �������� ������ ��� ��������� */
	public ENInvestObjectTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestObjectType. �������� ������ ��� ��������� �� ������� */
	public ENInvestObjectTypeShortList getScrollableFilteredList(
			ENInvestObjectTypeFilter aENInvestObjectTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInvestObjectType. �������� ������ ��� ��������� �� ������� */
	public ENInvestObjectTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENInvestObjectType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENInvestObjectTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENInvestObjectType. �������� ������ �� ������ */
	public ENInvestObjectTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}