
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSORentItems;
 *
 */

import com.ksoe.energynet.valueobject.ENSORentItems;
import com.ksoe.energynet.valueobject.brief.ENSORentItemsShort;
import com.ksoe.energynet.valueobject.filter.ENSORentItemsFilter;
import com.ksoe.energynet.valueobject.lists.ENSORentItemsShortList;


public interface ENSORentItemsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSORentItemsController";

	/* ENSORentItems. �������� */
	public int add(ENSORentItems aENSORentItems)
			throws java.rmi.RemoteException;

	/* ENSORentItems. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSORentItems. �������� */
	public void save(ENSORentItems aENSORentItems)
			throws java.rmi.RemoteException;

	/* ENSORentItems. �������� ������ */
	public ENSORentItems getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSORentItems. �������� ������ ������ */
	public ENSORentItemsShortList getList()
			throws java.rmi.RemoteException;

	/* ENSORentItems. �������� ������ �� ������� */
	public ENSORentItemsShortList getFilteredList(
			ENSORentItemsFilter aENSORentItemsFilter)
			throws java.rmi.RemoteException;

	/* ENSORentItems. �������� ������ ��� ��������� */
	public ENSORentItemsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSORentItems. �������� ������ ��� ��������� �� ������� */
	public ENSORentItemsShortList getScrollableFilteredList(
			ENSORentItemsFilter aENSORentItemsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSORentItems. �������� ������ ��� ��������� �� ������� */
	public ENSORentItemsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSORentItems. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSORentItemsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSORentItems. �������� ������ �� ������ */
	public ENSORentItemsShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public void insertContractToLeaseAgreementAndCallCenter(int fromCodeServicesObject, int toCodeServicesObject)
			throws java.rmi.RemoteException;

}