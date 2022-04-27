
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSealColors;
 *
 */

import com.ksoe.energynet.valueobject.ENSealColors;
import com.ksoe.energynet.valueobject.brief.ENSealColorsShort;
import com.ksoe.energynet.valueobject.filter.ENSealColorsFilter;
import com.ksoe.energynet.valueobject.lists.ENSealColorsShortList;


public interface ENSealColorsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSealColorsController";

	/* ENSealColors. �������� */
	public int add(ENSealColors aENSealColors)
			throws java.rmi.RemoteException;

	/* ENSealColors. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSealColors. �������� */
	public void save(ENSealColors aENSealColors)
			throws java.rmi.RemoteException;

	/* ENSealColors. �������� ������ */
	public ENSealColors getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSealColors. �������� ������ ������ */
	public ENSealColorsShortList getList()
			throws java.rmi.RemoteException;

	/* ENSealColors. �������� ������ �� ������� */
	public ENSealColorsShortList getFilteredList(
			ENSealColorsFilter aENSealColorsFilter)
			throws java.rmi.RemoteException;

	/* ENSealColors. �������� ������ ��� ��������� */
	public ENSealColorsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSealColors. �������� ������ ��� ��������� �� ������� */
	public ENSealColorsShortList getScrollableFilteredList(
			ENSealColorsFilter aENSealColorsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSealColors. �������� ������ ��� ��������� �� ������� */
	public ENSealColorsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSealColors. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSealColorsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSealColors. �������� ������ �� ������ */
	public ENSealColorsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}