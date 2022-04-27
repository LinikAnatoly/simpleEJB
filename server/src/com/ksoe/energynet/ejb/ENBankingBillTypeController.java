
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBankingBillType;
 *
 */

import com.ksoe.energynet.valueobject.ENBankingBillType;
import com.ksoe.energynet.valueobject.brief.ENBankingBillTypeShort;
import com.ksoe.energynet.valueobject.filter.ENBankingBillTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENBankingBillTypeShortList;


public interface ENBankingBillTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBankingBillTypeController";

	/* ENBankingBillType. �������� */
	public int add(ENBankingBillType aENBankingBillType)
			throws java.rmi.RemoteException;

	/* ENBankingBillType. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBankingBillType. �������� */
	public void save(ENBankingBillType aENBankingBillType)
			throws java.rmi.RemoteException;

	/* ENBankingBillType. �������� ������ */
	public ENBankingBillType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBankingBillType. �������� ������ ������ */
	public ENBankingBillTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENBankingBillType. �������� ������ �� ������� */
	public ENBankingBillTypeShortList getFilteredList(
			ENBankingBillTypeFilter aENBankingBillTypeFilter)
			throws java.rmi.RemoteException;

	/* ENBankingBillType. �������� ������ ��� ��������� */
	public ENBankingBillTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBankingBillType. �������� ������ ��� ��������� �� ������� */
	public ENBankingBillTypeShortList getScrollableFilteredList(
			ENBankingBillTypeFilter aENBankingBillTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBankingBillType. �������� ������ ��� ��������� �� ������� */
	public ENBankingBillTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBankingBillType. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENBankingBillTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBankingBillType. �������� ������ �� ������ */
	public ENBankingBillTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}