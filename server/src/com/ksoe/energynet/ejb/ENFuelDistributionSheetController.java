
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelDistributionSheet;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelDistributionSheet;
import com.ksoe.energynet.valueobject.brief.ENFuelDistributionSheetShort;
import com.ksoe.energynet.valueobject.filter.ENFuelDistributionSheetFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelDistributionSheetShortList;


public interface ENFuelDistributionSheetController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelDistributionSheetController";

	/* ENFuelDistributionSheet. �������� */
	public int add(ENFuelDistributionSheet aENFuelDistributionSheet)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. �������� */
	public void save(ENFuelDistributionSheet aENFuelDistributionSheet)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. �������� ������ */
	public ENFuelDistributionSheet getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. �������� ������ ������ */
	public ENFuelDistributionSheetShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. �������� ������ �� ������� */
	public ENFuelDistributionSheetShortList getFilteredList(
			ENFuelDistributionSheetFilter aENFuelDistributionSheetFilter)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. �������� ������ ��� ��������� */
	public ENFuelDistributionSheetShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. �������� ������ ��� ��������� �� ������� */
	public ENFuelDistributionSheetShortList getScrollableFilteredList(
			ENFuelDistributionSheetFilter aENFuelDistributionSheetFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. �������� ������ ��� ��������� �� ������� */
	public ENFuelDistributionSheetShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENFuelDistributionSheetFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheet. �������� ������ �� ������ */
	public ENFuelDistributionSheetShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/*���������� ��� � ������ �� �������������� � ����������� �� ������������ ����� (�� ����� ������������)*/
	public ENFuelDistributionSheet recalcApprovedPmmByTypeActivity(ENFuelDistributionSheet object , int typeActivity, int[] decadesToCalculate)throws java.rmi.RemoteException;
	
	
}