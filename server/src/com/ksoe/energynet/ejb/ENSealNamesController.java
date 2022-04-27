
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSealNames;
 *
 */

import com.ksoe.energynet.valueobject.ENSealNames;
import com.ksoe.energynet.valueobject.brief.ENSealNamesShort;
import com.ksoe.energynet.valueobject.filter.ENSealNamesFilter;
import com.ksoe.energynet.valueobject.lists.ENSealNamesShortList;


public interface ENSealNamesController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSealNamesController";

	/* ENSealNames. �������� */
	public int add(ENSealNames aENSealNames)
			throws java.rmi.RemoteException;

	/* ENSealNames. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSealNames. �������� */
	public void save(ENSealNames aENSealNames)
			throws java.rmi.RemoteException;

	/* ENSealNames. �������� ������ */
	public ENSealNames getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSealNames. �������� ������ ������ */
	public ENSealNamesShortList getList()
			throws java.rmi.RemoteException;

	/* ENSealNames. �������� ������ �� ������� */
	public ENSealNamesShortList getFilteredList(
			ENSealNamesFilter aENSealNamesFilter)
			throws java.rmi.RemoteException;

	/* ENSealNames. �������� ������ ��� ��������� */
	public ENSealNamesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSealNames. �������� ������ ��� ��������� �� ������� */
	public ENSealNamesShortList getScrollableFilteredList(
			ENSealNamesFilter aENSealNamesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSealNames. �������� ������ ��� ��������� �� ������� */
	public ENSealNamesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSealNames. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSealNamesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSealNames. �������� ������ �� ������ */
	public ENSealNamesShort getShortObject(int code)
			throws java.rmi.RemoteException;

}