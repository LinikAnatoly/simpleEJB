
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesFactCalc;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesFactCalc;
import com.ksoe.energynet.valueobject.brief.ENServicesFactCalcShort;
import com.ksoe.energynet.valueobject.filter.ENServicesFactCalcFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesFactCalcShortList;


public interface ENServicesFactCalcController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesFactCalcController";

	/* ENServicesFactCalc. �������� */
	public int add(ENServicesFactCalc aENServicesFactCalc)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalc. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesFactCalc. �������� */
	public void save(ENServicesFactCalc aENServicesFactCalc)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalc. �������� ������ */
	public ENServicesFactCalc getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalc. �������� ������ ������ */
	public ENServicesFactCalcShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesFactCalc. �������� ������ �� ������� */
	public ENServicesFactCalcShortList getFilteredList(
			ENServicesFactCalcFilter aENServicesFactCalcFilter)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalc. �������� ������ ��� ��������� */
	public ENServicesFactCalcShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesFactCalc. �������� ������ ��� ��������� �� ������� */
	public ENServicesFactCalcShortList getScrollableFilteredList(
			ENServicesFactCalcFilter aENServicesFactCalcFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesFactCalc. �������� ������ ��� ��������� �� ������� */
	public ENServicesFactCalcShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesFactCalc. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENServicesFactCalcFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesFactCalc. �������� ������ �� ������ */
	public ENServicesFactCalcShort getShortObject(int code)
			throws java.rmi.RemoteException;

}