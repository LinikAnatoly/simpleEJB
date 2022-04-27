
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBankingDetails;
 *
 */

import com.ksoe.energynet.valueobject.ENBankingDetails;
import com.ksoe.energynet.valueobject.brief.ENBankingDetailsShort;
import com.ksoe.energynet.valueobject.filter.ENBankingDetailsFilter;
import com.ksoe.energynet.valueobject.lists.ENBankingDetailsShortList;


public interface ENBankingDetailsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBankingDetailsController";

	/* ENBankingDetails. �������� */
	public int add(ENBankingDetails aENBankingDetails)
			throws java.rmi.RemoteException;

	/* ENBankingDetails. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBankingDetails. �������� */
	public void save(ENBankingDetails aENBankingDetails)
			throws java.rmi.RemoteException;

	/* ENBankingDetails. �������� ������ */
	public ENBankingDetails getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBankingDetails. �������� ������ ������ */
	public ENBankingDetailsShortList getList()
			throws java.rmi.RemoteException;

	/* ENBankingDetails. �������� ������ �� ������� */
	public ENBankingDetailsShortList getFilteredList(
			ENBankingDetailsFilter aENBankingDetailsFilter)
			throws java.rmi.RemoteException;

	/* ENBankingDetails. �������� ������ ��� ��������� */
	public ENBankingDetailsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBankingDetails. �������� ������ ��� ��������� �� ������� */
	public ENBankingDetailsShortList getScrollableFilteredList(
			ENBankingDetailsFilter aENBankingDetailsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBankingDetails. �������� ������ ��� ��������� �� ������� */
	public ENBankingDetailsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBankingDetails. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENBankingDetailsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBankingDetails. �������� ������ �� ������ */
	public ENBankingDetailsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}