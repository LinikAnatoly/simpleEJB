
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActPostingKindItem;
 *
 */

import com.ksoe.energynet.valueobject.ENActPostingKindItem;
import com.ksoe.energynet.valueobject.lists.ENActPostingKindItemShortList;
import com.ksoe.energynet.valueobject.brief.ENActPostingKindItemShort;
import com.ksoe.energynet.valueobject.filter.ENActPostingKindItemFilter;


public interface ENActPostingKindItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActPostingKindItemController";

	/* ENActPostingKindItem. �������� */
	public int add(ENActPostingKindItem aENActPostingKindItem)
			throws java.rmi.RemoteException;

	/* ENActPostingKindItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActPostingKindItem. �������� */
	public void save(ENActPostingKindItem aENActPostingKindItem)
			throws java.rmi.RemoteException;

	/* ENActPostingKindItem. �������� ������ */
	public ENActPostingKindItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActPostingKindItem. �������� ������ ������ */
	public ENActPostingKindItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENActPostingKindItem. �������� ������ �� ������� */
	public ENActPostingKindItemShortList getFilteredList(
			ENActPostingKindItemFilter aENActPostingKindItemFilter)
			throws java.rmi.RemoteException;

	/* ENActPostingKindItem. �������� ������ ��� ��������� */
	public ENActPostingKindItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingKindItem. �������� ������ ��� ��������� �� ������� */
	public ENActPostingKindItemShortList getScrollableFilteredList(
			ENActPostingKindItemFilter aENActPostingKindItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingKindItem. �������� ������ ��� ��������� �� ������� */
	public ENActPostingKindItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActPostingKindItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENActPostingKindItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActPostingKindItem. �������� ������ �� ������ */
	public ENActPostingKindItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}