
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBonusListItem;
 *
 */

import com.ksoe.energynet.valueobject.ENBonusListItem;
import com.ksoe.energynet.valueobject.brief.ENBonusListItemShort;
import com.ksoe.energynet.valueobject.filter.ENBonusListItemFilter;
import com.ksoe.energynet.valueobject.lists.ENBonusListItemShortList;


public interface ENBonusListItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBonusListItemController";

	/* ENBonusListItem. �������� */
	public int add(ENBonusListItem aENBonusListItem)
			throws java.rmi.RemoteException;

	/* ENBonusListItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBonusListItem. �������� */
	public void save(ENBonusListItem aENBonusListItem)
			throws java.rmi.RemoteException;

	/* ENBonusListItem. �������� ������ */
	public ENBonusListItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBonusListItem. �������� ������ ������ */
	public ENBonusListItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENBonusListItem. �������� ������ �� ������� */
	public ENBonusListItemShortList getFilteredList(
			ENBonusListItemFilter aENBonusListItemFilter)
			throws java.rmi.RemoteException;

	/* ENBonusListItem. �������� ������ ��� ��������� */
	public ENBonusListItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBonusListItem. �������� ������ ��� ��������� �� ������� */
	public ENBonusListItemShortList getScrollableFilteredList(
			ENBonusListItemFilter aENBonusListItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBonusListItem. �������� ������ ��� ��������� �� ������� */
	public ENBonusListItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBonusListItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENBonusListItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBonusListItem. �������� ������ �� ������ */
	public ENBonusListItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

	/* ������ ������� ���� ��� ������ ��������� �� �������������*/
	public void SetBonusItemInvalid(ENBonusListItem aENBonusListItem)throws java.rmi.RemoteException;
	/* ������� ������� ���� ��� ������ ��������� �� �������������*/
	public void UnSetBonusItemInvalid(ENBonusListItem aENBonusListItem)throws java.rmi.RemoteException;
	
}