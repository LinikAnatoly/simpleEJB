
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelInventarizationItem;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelInventarizationItem;
import com.ksoe.energynet.valueobject.brief.ENFuelInventarizationItemShort;
import com.ksoe.energynet.valueobject.filter.ENFuelInventarizationItemFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelInventarizationItemShortList;


public interface ENFuelInventarizationItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelInventarizationItemController";

	/* ENFuelInventarizationItem. �������� */
	public int add(ENFuelInventarizationItem aENFuelInventarizationItem)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. �������� */
	public void save(ENFuelInventarizationItem aENFuelInventarizationItem)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. �������� ������ */
	public ENFuelInventarizationItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. �������� ������ ������ */
	public ENFuelInventarizationItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. �������� ������ �� ������� */
	public ENFuelInventarizationItemShortList getFilteredList(
			ENFuelInventarizationItemFilter aENFuelInventarizationItemFilter)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. �������� ������ ��� ��������� */
	public ENFuelInventarizationItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. �������� ������ ��� ��������� �� ������� */
	public ENFuelInventarizationItemShortList getScrollableFilteredList(
			ENFuelInventarizationItemFilter aENFuelInventarizationItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. �������� ������ ��� ��������� �� ������� */
	public ENFuelInventarizationItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENFuelInventarizationItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. �������� ������ �� ������ */
	public ENFuelInventarizationItemShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ��������� ����������� ���������� �� ������� ��������� */
	public void saveCountFact(ENFuelInventarizationItemShort[] aFuelInventarizationItemList)
	throws java.rmi.RemoteException;

}