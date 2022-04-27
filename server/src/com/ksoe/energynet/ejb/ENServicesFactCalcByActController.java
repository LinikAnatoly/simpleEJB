
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesFactCalcByAct;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesFactCalcByAct;
import com.ksoe.energynet.valueobject.brief.ENServicesFactCalcByActShort;
import com.ksoe.energynet.valueobject.filter.ENServicesFactCalcByActFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesFactCalcByActShortList;


public interface ENServicesFactCalcByActController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesFactCalcByActController";

	/* ENServicesFactCalcByAct. �������� */
	public int add(ENServicesFactCalcByAct aENServicesFactCalcByAct)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. �������� */
	public void save(ENServicesFactCalcByAct aENServicesFactCalcByAct)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. �������� ������ */
	public ENServicesFactCalcByAct getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. �������� ������ ������ */
	public ENServicesFactCalcByActShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. �������� ������ �� ������� */
	public ENServicesFactCalcByActShortList getFilteredList(
			ENServicesFactCalcByActFilter aENServicesFactCalcByActFilter)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. �������� ������ ��� ��������� */
	public ENServicesFactCalcByActShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. �������� ������ ��� ��������� �� ������� */
	public ENServicesFactCalcByActShortList getScrollableFilteredList(
			ENServicesFactCalcByActFilter aENServicesFactCalcByActFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. �������� ������ ��� ��������� �� ������� */
	public ENServicesFactCalcByActShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServicesFactCalcByActFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesFactCalcByAct. �������� ������ �� ������ */
	public ENServicesFactCalcByActShort getShortObject(int code)
			throws java.rmi.RemoteException;

}