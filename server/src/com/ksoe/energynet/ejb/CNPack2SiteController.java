
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for CNPack2Site;
 *
 */

import com.ksoe.energynet.valueobject.CNPack2Site;
import com.ksoe.energynet.valueobject.lists.CNPack2SiteShortList;
import com.ksoe.energynet.valueobject.brief.CNPack2SiteShort;
import com.ksoe.energynet.valueobject.filter.CNPack2SiteFilter;


public interface CNPack2SiteController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/CNPack2SiteController";

	/* CNPack2Site. �������� */
	public int add(CNPack2Site aCNPack2Site)
			throws java.rmi.RemoteException;

	/* CNPack2Site. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* CNPack2Site. �������� */
	public void save(CNPack2Site aCNPack2Site)
			throws java.rmi.RemoteException;

	/* CNPack2Site. �������� ������ */
	public CNPack2Site getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* CNPack2Site. �������� ������ ������ */
	public CNPack2SiteShortList getList()
			throws java.rmi.RemoteException;

	/* CNPack2Site. �������� ������ �� ������� */
	public CNPack2SiteShortList getFilteredList(
			CNPack2SiteFilter aCNPack2SiteFilter)
			throws java.rmi.RemoteException;

	/* CNPack2Site. �������� ������ ��� ��������� */
	public CNPack2SiteShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* CNPack2Site. �������� ������ ��� ��������� �� ������� */
	public CNPack2SiteShortList getScrollableFilteredList(
			CNPack2SiteFilter aCNPack2SiteFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* CNPack2Site. �������� ������ ��� ��������� �� ������� */
	public CNPack2SiteShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* CNPack2Site. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			CNPack2SiteFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* CNPack2Site. �������� ������ �� ������ */
	public CNPack2SiteShort getShortObject(int code)
			throws java.rmi.RemoteException;

}