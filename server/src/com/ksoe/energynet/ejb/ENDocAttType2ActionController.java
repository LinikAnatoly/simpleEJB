
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttType2Action;
 *
 */

import com.ksoe.energynet.valueobject.ENDocAttType2Action;
import com.ksoe.energynet.valueobject.lists.ENDocAttType2ActionShortList;
import com.ksoe.energynet.valueobject.brief.ENDocAttType2ActionShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttType2ActionFilter;


public interface ENDocAttType2ActionController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDocAttType2ActionController";

	/* ENDocAttType2Action. �������� */
	public int add(ENDocAttType2Action aENDocAttType2Action)
			throws java.rmi.RemoteException;

	/* ENDocAttType2Action. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDocAttType2Action. �������� */
	public void save(ENDocAttType2Action aENDocAttType2Action)
			throws java.rmi.RemoteException;

	/* ENDocAttType2Action. �������� ������ */
	public ENDocAttType2Action getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDocAttType2Action. �������� ������ ������ */
	public ENDocAttType2ActionShortList getList()
			throws java.rmi.RemoteException;

	/* ENDocAttType2Action. �������� ������ �� ������� */
	public ENDocAttType2ActionShortList getFilteredList(
			ENDocAttType2ActionFilter aENDocAttType2ActionFilter)
			throws java.rmi.RemoteException;

	/* ENDocAttType2Action. �������� ������ ��� ��������� */
	public ENDocAttType2ActionShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttType2Action. �������� ������ ��� ��������� �� ������� */
	public ENDocAttType2ActionShortList getScrollableFilteredList(
			ENDocAttType2ActionFilter aENDocAttType2ActionFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttType2Action. �������� ������ ��� ��������� �� ������� */
	public ENDocAttType2ActionShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDocAttType2Action. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENDocAttType2ActionFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttType2Action. �������� ������ �� ������ */
	public ENDocAttType2ActionShort getShortObject(int code)
			throws java.rmi.RemoteException;

}