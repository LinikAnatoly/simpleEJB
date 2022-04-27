
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENEstimateItemPlanPay;
 *
 */

import com.ksoe.energynet.valueobject.ENEstimateItemPlanPay;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemPlanPayShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemPlanPayFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemPlanPayShortList;


public interface ENEstimateItemPlanPayController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENEstimateItemPlanPayController";

	/* ENEstimateItemPlanPay. �������� */
	public int add(ENEstimateItemPlanPay aENEstimateItemPlanPay)
			throws java.rmi.RemoteException;

	/* ENEstimateItemPlanPay. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENEstimateItemPlanPay. �������� */
	public void save(ENEstimateItemPlanPay aENEstimateItemPlanPay)
			throws java.rmi.RemoteException;

	/* ENEstimateItemPlanPay. �������� ������ */
	public ENEstimateItemPlanPay getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENEstimateItemPlanPay. �������� ������ ������ */
	public ENEstimateItemPlanPayShortList getList()
			throws java.rmi.RemoteException;

	/* ENEstimateItemPlanPay. �������� ������ �� ������� */
	public ENEstimateItemPlanPayShortList getFilteredList(
			ENEstimateItemPlanPayFilter aENEstimateItemPlanPayFilter)
			throws java.rmi.RemoteException;

	/* ENEstimateItemPlanPay. �������� ������ ��� ��������� */
	public ENEstimateItemPlanPayShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENEstimateItemPlanPay. �������� ������ ��� ��������� �� ������� */
	public ENEstimateItemPlanPayShortList getScrollableFilteredList(
			ENEstimateItemPlanPayFilter aENEstimateItemPlanPayFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENEstimateItemPlanPay. �������� ������ ��� ��������� �� ������� */
	public ENEstimateItemPlanPayShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENEstimateItemPlanPay. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENEstimateItemPlanPayFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENEstimateItemPlanPay. �������� ������ �� ������ */
	public ENEstimateItemPlanPayShort getShortObject(int code)
			throws java.rmi.RemoteException;

}