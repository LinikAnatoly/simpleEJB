
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for FINCurrency;
 *
 */

import com.ksoe.energynet.valueobject.FINCurrency;
import com.ksoe.energynet.valueobject.lists.FINCurrencyShortList;
import com.ksoe.energynet.valueobject.brief.FINCurrencyShort;
import com.ksoe.energynet.valueobject.filter.FINCurrencyFilter;


public interface FINCurrencyController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/FINCurrencyController";

	/* FINCurrency. �������� */
	public int add(FINCurrency aFINCurrency)
			throws java.rmi.RemoteException;

	/* FINCurrency. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* FINCurrency. �������� */
	public void save(FINCurrency aFINCurrency)
			throws java.rmi.RemoteException;

	/* FINCurrency. �������� ������ */
	public FINCurrency getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* FINCurrency. �������� ������ ������ */
	public FINCurrencyShortList getList()
			throws java.rmi.RemoteException;

	/* FINCurrency. �������� ������ �� ������� */
	public FINCurrencyShortList getFilteredList(
			FINCurrencyFilter aFINCurrencyFilter)
			throws java.rmi.RemoteException;

	/* FINCurrency. �������� ������ ��� ��������� */
	public FINCurrencyShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FINCurrency. �������� ������ ��� ��������� �� ������� */
	public FINCurrencyShortList getScrollableFilteredList(
			FINCurrencyFilter aFINCurrencyFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FINCurrency. �������� ������ ��� ��������� �� ������� */
	public FINCurrencyShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* FINCurrency. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			FINCurrencyFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* FINCurrency. �������� ������ �� ������ */
	public FINCurrencyShort getShortObject(int code)
			throws java.rmi.RemoteException;

}