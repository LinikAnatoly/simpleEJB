
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBonusList;
 *
 */

import com.ksoe.energynet.valueobject.ENBonusList;
import com.ksoe.energynet.valueobject.brief.ENBonusListShort;
import com.ksoe.energynet.valueobject.filter.ENBonusListFilter;
import com.ksoe.energynet.valueobject.lists.ENBonusListShortList;


public interface ENBonusListController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBonusListController";

	/* ENBonusList. �������� */
	public int add(ENBonusList aENBonusList)
			throws java.rmi.RemoteException;

	/* ENBonusList. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBonusList. �������� */
	public void save(ENBonusList aENBonusList)
			throws java.rmi.RemoteException;

	/* ENBonusList. �������� ������ */
	public ENBonusList getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBonusList. �������� ������ ������ */
	public ENBonusListShortList getList()
			throws java.rmi.RemoteException;

	/* ENBonusList. �������� ������ �� ������� */
	public ENBonusListShortList getFilteredList(
			ENBonusListFilter aENBonusListFilter)
			throws java.rmi.RemoteException;

	/* ENBonusList. �������� ������ ��� ��������� */
	public ENBonusListShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBonusList. �������� ������ ��� ��������� �� ������� */
	public ENBonusListShortList getScrollableFilteredList(
			ENBonusListFilter aENBonusListFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBonusList. �������� ������ ��� ��������� �� ������� */
	public ENBonusListShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBonusList. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENBonusListFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBonusList. �������� ������ �� ������ */
	public ENBonusListShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENBonusList. ���������  */
	public void approve(int objectCode)
			throws java.rmi.RemoteException;

	/* ENBonusList. �������� �����������   */
	public void unapprove(int objectCode)
			throws java.rmi.RemoteException;
}