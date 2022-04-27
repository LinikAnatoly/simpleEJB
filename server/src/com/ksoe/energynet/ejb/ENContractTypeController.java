
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENContractType;
 *
 */

import com.ksoe.energynet.valueobject.ENContractType;
import com.ksoe.energynet.valueobject.brief.ENContractTypeShort;
import com.ksoe.energynet.valueobject.filter.ENContractTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENContractTypeShortList;


public interface ENContractTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENContractTypeController";

	/* ENContractType. �������� */
	public int add(ENContractType aENContractType)
			throws java.rmi.RemoteException;

	/* ENContractType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENContractType. �������� */
	public void save(ENContractType aENContractType)
			throws java.rmi.RemoteException;

	/* ENContractType. �������� ������ */
	public ENContractType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENContractType. �������� ������ ������ */
	public ENContractTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENContractType. �������� ������ �� ������� */
	public ENContractTypeShortList getFilteredList(
			ENContractTypeFilter aENContractTypeFilter)
			throws java.rmi.RemoteException;

	/* ENContractType. �������� ������ ��� ��������� */
	public ENContractTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENContractType. �������� ������ ��� ��������� �� ������� */
	public ENContractTypeShortList getScrollableFilteredList(
			ENContractTypeFilter aENContractTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENContractType. �������� ������ ��� ��������� �� ������� */
	public ENContractTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENContractType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENContractTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENContractType. �������� ������ �� ������ */
	public ENContractTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}