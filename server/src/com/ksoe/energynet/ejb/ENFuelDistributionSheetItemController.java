
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelDistributionSheetItem;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelDistributionSheetItem;
import com.ksoe.energynet.valueobject.brief.ENFuelDistributionSheetItemShort;
import com.ksoe.energynet.valueobject.filter.ENFuelDistributionSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelDistributionSheetItemShortList;


public interface ENFuelDistributionSheetItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelDistributionSheetItemController";

	/* ENFuelDistributionSheetItem. �������� */
	public int add(ENFuelDistributionSheetItem aENFuelDistributionSheetItem)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. �������� */
	public void save(ENFuelDistributionSheetItem aENFuelDistributionSheetItem)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. �������� ������ */
	public ENFuelDistributionSheetItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. �������� ������ ������ */
	public ENFuelDistributionSheetItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. �������� ������ �� ������� */
	public ENFuelDistributionSheetItemShortList getFilteredList(
			ENFuelDistributionSheetItemFilter aENFuelDistributionSheetItemFilter)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. �������� ������ ��� ��������� */
	public ENFuelDistributionSheetItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. �������� ������ ��� ��������� �� ������� */
	public ENFuelDistributionSheetItemShortList getScrollableFilteredList(
			ENFuelDistributionSheetItemFilter aENFuelDistributionSheetItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. �������� ������ ��� ��������� �� ������� */
	public ENFuelDistributionSheetItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENFuelDistributionSheetItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. �������� ������ �� ������ */
	public ENFuelDistributionSheetItemShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ���������� ���������� ������� �� ������� ��� ����� ������������ */
	public ENFuelDistributionSheetItemShortList getFreePMM(int ENFuelDistributionSheetCode)throws java.rmi.RemoteException;
	
	/**
	 * 
	 * ����������� ������ ������������� ������� 
	 * 
	 * @param isConfirmed true - �����������, false - ��������������
	 */
	public void setConfirmed(int itemCode, boolean isConfirmed) throws java.rmi.RemoteException;


}