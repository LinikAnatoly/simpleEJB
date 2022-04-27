
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENGeneralContracts;
 *
 */

import com.ksoe.energynet.valueobject.ENGeneralContracts;
import com.ksoe.energynet.valueobject.brief.ENGeneralContractsShort;
import com.ksoe.energynet.valueobject.filter.ENGeneralContractsFilter;
import com.ksoe.energynet.valueobject.lists.ENGeneralContractsShortList;


public interface ENGeneralContractsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENGeneralContractsController";

	/* ENGeneralContracts. �������� */
	public int add(ENGeneralContracts aENGeneralContracts)
			throws java.rmi.RemoteException;

	/* ENGeneralContracts. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENGeneralContracts. �������� */
	public void save(ENGeneralContracts aENGeneralContracts)
			throws java.rmi.RemoteException;

	/* ENGeneralContracts. �������� ������ */
	public ENGeneralContracts getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENGeneralContracts. �������� ������ ������ */
	public ENGeneralContractsShortList getList()
			throws java.rmi.RemoteException;

	/* ENGeneralContracts. �������� ������ �� ������� */
	public ENGeneralContractsShortList getFilteredList(
			ENGeneralContractsFilter aENGeneralContractsFilter)
			throws java.rmi.RemoteException;

	/* ENGeneralContracts. �������� ������ ��� ��������� */
	public ENGeneralContractsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGeneralContracts. �������� ������ ��� ��������� �� ������� */
	public ENGeneralContractsShortList getScrollableFilteredList(
			ENGeneralContractsFilter aENGeneralContractsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENGeneralContracts. �������� ������ ��� ��������� �� ������� */
	public ENGeneralContractsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENGeneralContracts. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENGeneralContractsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENGeneralContracts. �������� ������ �� ������ */
	public ENGeneralContractsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}