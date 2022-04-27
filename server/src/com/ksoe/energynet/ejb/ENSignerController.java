
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSigner;
 *
 */

import com.ksoe.energynet.valueobject.ENSigner;
import com.ksoe.energynet.valueobject.lists.ENSignerShortList;
import com.ksoe.energynet.valueobject.brief.ENSignerShort;
import com.ksoe.energynet.valueobject.filter.ENSignerFilter;


public interface ENSignerController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSignerController";

	/* ENSigner. �������� */
	public int add(ENSigner aENSigner)
			throws java.rmi.RemoteException;

	/* ENSigner. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSigner. �������� */
	public void save(ENSigner aENSigner)
			throws java.rmi.RemoteException;

	/* ENSigner. �������� ������ */
	public ENSigner getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSigner. �������� ������ ������ */
	public ENSignerShortList getList()
			throws java.rmi.RemoteException;

	/* ENSigner. �������� ������ �� ������� */
	public ENSignerShortList getFilteredList(
			ENSignerFilter aENSignerFilter)
			throws java.rmi.RemoteException;

	/* ENSigner. �������� ������ ��� ��������� */
	public ENSignerShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSigner. �������� ������ ��� ��������� �� ������� */
	public ENSignerShortList getScrollableFilteredList(
			ENSignerFilter aENSignerFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSigner. �������� ������ ��� ��������� �� ������� */
	public ENSignerShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSigner. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSignerFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSigner. �������� ������ �� ������ */
	public ENSignerShort getShortObject(int code)
			throws java.rmi.RemoteException;

}