
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2022 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelCard;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelCard;
import com.ksoe.energynet.valueobject.lists.ENFuelCardShortList;
import com.ksoe.energynet.valueobject.brief.ENFuelCardShort;
import com.ksoe.energynet.valueobject.filter.ENFuelCardFilter;


public interface ENFuelCardController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelCardController";

	/* ENFuelCard. �������� */
	public int add(ENFuelCard aENFuelCard)
			throws java.rmi.RemoteException;

	/* ENFuelCard. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelCard. �������� */
	public void save(ENFuelCard aENFuelCard)
			throws java.rmi.RemoteException;

	/* ENFuelCard. �������� ������ */
	public ENFuelCard getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelCard. �������� ������ ������ */
	public ENFuelCardShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelCard. �������� ������ �� ������� */
	public ENFuelCardShortList getFilteredList(
			ENFuelCardFilter aENFuelCardFilter)
			throws java.rmi.RemoteException;

	/* ENFuelCard. �������� ������ ��� ��������� */
	public ENFuelCardShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelCard. �������� ������ ��� ��������� �� ������� */
	public ENFuelCardShortList getScrollableFilteredList(
			ENFuelCardFilter aENFuelCardFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelCard. �������� ������ ��� ��������� �� ������� */
	public ENFuelCardShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelCard. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENFuelCardFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelCard. �������� ������ �� ������ */
	public ENFuelCardShort getShortObject(int code)
			throws java.rmi.RemoteException;

}