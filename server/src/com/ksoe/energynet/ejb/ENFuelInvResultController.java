
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelInvResult;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelInvResult;
import com.ksoe.energynet.valueobject.brief.ENFuelInvResultShort;
import com.ksoe.energynet.valueobject.filter.ENFuelInvResultFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelInvResultShortList;


public interface ENFuelInvResultController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelInvResultController";

	/* ENFuelInvResult. �������� */
	public int add(ENFuelInvResult aENFuelInvResult)
			throws java.rmi.RemoteException;

	/* ENFuelInvResult. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelInvResult. �������� */
	public void save(ENFuelInvResult aENFuelInvResult)
			throws java.rmi.RemoteException;

	/* ENFuelInvResult. �������� ������ */
	public ENFuelInvResult getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelInvResult. �������� ������ ������ */
	public ENFuelInvResultShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelInvResult. �������� ������ �� ������� */
	public ENFuelInvResultShortList getFilteredList(
			ENFuelInvResultFilter aENFuelInvResultFilter)
			throws java.rmi.RemoteException;

	/* ENFuelInvResult. �������� ������ ��� ��������� */
	public ENFuelInvResultShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInvResult. �������� ������ ��� ��������� �� ������� */
	public ENFuelInvResultShortList getScrollableFilteredList(
			ENFuelInvResultFilter aENFuelInvResultFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInvResult. �������� ������ ��� ��������� �� ������� */
	public ENFuelInvResultShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelInvResult. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENFuelInvResultFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelInvResult. �������� ������ �� ������ */
	public ENFuelInvResultShort getShortObject(int code)
			throws java.rmi.RemoteException;

}