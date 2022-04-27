
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSite;
 *
 */

import com.ksoe.energynet.valueobject.ENSite;
import com.ksoe.energynet.valueobject.brief.ENSiteShort;
import com.ksoe.energynet.valueobject.filter.ENSiteFilter;
import com.ksoe.energynet.valueobject.lists.ENSiteShortList;


public interface ENSiteController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSiteController";

	/* ENSite. �������� */
	public int add(ENSite aENSite)
			throws java.rmi.RemoteException;

	/* ENSite. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSite. �������� */
	public void save(ENSite aENSite)
			throws java.rmi.RemoteException;

	/* ENSite. �������� ������ */
	public ENSite getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSite. �������� ������ ������ */
	public ENSiteShortList getList()
			throws java.rmi.RemoteException;

	/* ENSite. �������� ������ �� ������� */
	public ENSiteShortList getFilteredList(
			ENSiteFilter aENSiteFilter)
			throws java.rmi.RemoteException;

	/* ENSite. �������� ������ ��� ��������� */
	public ENSiteShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSite. �������� ������ ��� ��������� �� ������� */
	public ENSiteShortList getScrollableFilteredList(
			ENSiteFilter aENSiteFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSite. �������� ������ ��� ��������� �� ������� */
	public ENSiteShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSite. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSiteFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSite. �������� ������ �� ������ */
	public ENSiteShort getShortObject(int code)
			throws java.rmi.RemoteException;

}