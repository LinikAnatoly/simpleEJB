
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActIncomServ2ENAct;
 *
 */

import com.ksoe.energynet.valueobject.ENActIncomServ2ENAct;
import com.ksoe.energynet.valueobject.lists.ENActIncomServ2ENActShortList;
import com.ksoe.energynet.valueobject.brief.ENActIncomServ2ENActShort;
import com.ksoe.energynet.valueobject.filter.ENActIncomServ2ENActFilter;


public interface ENActIncomServ2ENActController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActIncomServ2ENActController";

	/* ENActIncomServ2ENAct. �������� */
	public int add(ENActIncomServ2ENAct aENActIncomServ2ENAct)
			throws java.rmi.RemoteException;

	/* ENActIncomServ2ENAct. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActIncomServ2ENAct. �������� */
	public void save(ENActIncomServ2ENAct aENActIncomServ2ENAct)
			throws java.rmi.RemoteException;

	/* ENActIncomServ2ENAct. �������� ������ */
	public ENActIncomServ2ENAct getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActIncomServ2ENAct. �������� ������ ������ */
	public ENActIncomServ2ENActShortList getList()
			throws java.rmi.RemoteException;

	/* ENActIncomServ2ENAct. �������� ������ �� ������� */
	public ENActIncomServ2ENActShortList getFilteredList(
			ENActIncomServ2ENActFilter aENActIncomServ2ENActFilter)
			throws java.rmi.RemoteException;

	/* ENActIncomServ2ENAct. �������� ������ ��� ��������� */
	public ENActIncomServ2ENActShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomServ2ENAct. �������� ������ ��� ��������� �� ������� */
	public ENActIncomServ2ENActShortList getScrollableFilteredList(
			ENActIncomServ2ENActFilter aENActIncomServ2ENActFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomServ2ENAct. �������� ������ ��� ��������� �� ������� */
	public ENActIncomServ2ENActShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActIncomServ2ENAct. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENActIncomServ2ENActFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActIncomServ2ENAct. �������� ������ �� ������ */
	public ENActIncomServ2ENActShort getShortObject(int code)
			throws java.rmi.RemoteException;

}