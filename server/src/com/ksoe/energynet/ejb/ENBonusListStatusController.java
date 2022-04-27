
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBonusListStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENBonusListStatus;
import com.ksoe.energynet.valueobject.brief.ENBonusListStatusShort;
import com.ksoe.energynet.valueobject.filter.ENBonusListStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENBonusListStatusShortList;


public interface ENBonusListStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBonusListStatusController";

	/* ENBonusListStatus. �������� */
	public int add(ENBonusListStatus aENBonusListStatus)
			throws java.rmi.RemoteException;

	/* ENBonusListStatus. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBonusListStatus. �������� */
	public void save(ENBonusListStatus aENBonusListStatus)
			throws java.rmi.RemoteException;

	/* ENBonusListStatus. �������� ������ */
	public ENBonusListStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBonusListStatus. �������� ������ ������ */
	public ENBonusListStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENBonusListStatus. �������� ������ �� ������� */
	public ENBonusListStatusShortList getFilteredList(
			ENBonusListStatusFilter aENBonusListStatusFilter)
			throws java.rmi.RemoteException;

	/* ENBonusListStatus. �������� ������ ��� ��������� */
	public ENBonusListStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBonusListStatus. �������� ������ ��� ��������� �� ������� */
	public ENBonusListStatusShortList getScrollableFilteredList(
			ENBonusListStatusFilter aENBonusListStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBonusListStatus. �������� ������ ��� ��������� �� ������� */
	public ENBonusListStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBonusListStatus. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENBonusListStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBonusListStatus. �������� ������ �� ������ */
	public ENBonusListStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}