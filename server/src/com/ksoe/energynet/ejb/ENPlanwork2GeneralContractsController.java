
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanwork2GeneralContracts;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanwork2GeneralContracts;
import com.ksoe.energynet.valueobject.lists.ENPlanwork2GeneralContractsShortList;
import com.ksoe.energynet.valueobject.brief.ENPlanwork2GeneralContractsShort;
import com.ksoe.energynet.valueobject.filter.ENPlanwork2GeneralContractsFilter;


public interface ENPlanwork2GeneralContractsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanwork2GeneralContractsController";

	/* ENPlanwork2GeneralContracts. �������� */
	public int add(ENPlanwork2GeneralContracts aENPlanwork2GeneralContracts)
			throws java.rmi.RemoteException;

	/* ENPlanwork2GeneralContracts. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanwork2GeneralContracts. �������� */
	public void save(ENPlanwork2GeneralContracts aENPlanwork2GeneralContracts)
			throws java.rmi.RemoteException;

	/* ENPlanwork2GeneralContracts. �������� ������ */
	public ENPlanwork2GeneralContracts getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanwork2GeneralContracts. �������� ������ ������ */
	public ENPlanwork2GeneralContractsShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanwork2GeneralContracts. �������� ������ �� ������� */
	public ENPlanwork2GeneralContractsShortList getFilteredList(
			ENPlanwork2GeneralContractsFilter aENPlanwork2GeneralContractsFilter)
			throws java.rmi.RemoteException;

	/* ENPlanwork2GeneralContracts. �������� ������ ��� ��������� */
	public ENPlanwork2GeneralContractsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanwork2GeneralContracts. �������� ������ ��� ��������� �� ������� */
	public ENPlanwork2GeneralContractsShortList getScrollableFilteredList(
			ENPlanwork2GeneralContractsFilter aENPlanwork2GeneralContractsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanwork2GeneralContracts. �������� ������ ��� ��������� �� ������� */
	public ENPlanwork2GeneralContractsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanwork2GeneralContracts. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPlanwork2GeneralContractsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanwork2GeneralContracts. �������� ������ �� ������ */
	public ENPlanwork2GeneralContractsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}