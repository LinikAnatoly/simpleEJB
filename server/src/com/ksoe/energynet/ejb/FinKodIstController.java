
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for FinKodIst;
 *
 */

import com.ksoe.energynet.valueobject.FinKodIst;
import com.ksoe.energynet.valueobject.brief.FinKodIstShort;
import com.ksoe.energynet.valueobject.filter.FinKodIstFilter;
import com.ksoe.energynet.valueobject.lists.FinKodIstShortList;


public interface FinKodIstController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/FinKodIstController";

	/* FinKodIst. �������� */
	public int add(FinKodIst aFinKodIst)
			throws java.rmi.RemoteException;

	/* FinKodIst. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* FinKodIst. �������� */
	public void save(FinKodIst aFinKodIst)
			throws java.rmi.RemoteException;

	/* FinKodIst. �������� ������ */
	public FinKodIst getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* FinKodIst. �������� ������ ������ */
	public FinKodIstShortList getList()
			throws java.rmi.RemoteException;

	/* FinKodIst. �������� ������ �� ������� */
	public FinKodIstShortList getFilteredList(
			FinKodIstFilter aFinKodIstFilter)
			throws java.rmi.RemoteException;

	/* FinKodIst. �������� ������ ��� ��������� */
	public FinKodIstShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FinKodIst. �������� ������ ��� ��������� �� ������� */
	public FinKodIstShortList getScrollableFilteredList(
			FinKodIstFilter aFinKodIstFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FinKodIst. �������� ������ ��� ��������� �� ������� */
	public FinKodIstShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* FinKodIst. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			FinKodIstFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* FinKodIst. �������� ������ �� ������ */
	public FinKodIstShort getShortObject(int code)
			throws java.rmi.RemoteException;

}