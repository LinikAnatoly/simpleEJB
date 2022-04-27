
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanWork2RQAllocationList;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanWork2RQAllocationList;
import com.ksoe.energynet.valueobject.brief.ENPlanWork2RQAllocationListShort;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2RQAllocationListFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2RQAllocationListShortList;


public interface ENPlanWork2RQAllocationListController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanWork2RQAllocationListController";

	/* ENPlanWork2RQAllocationList. �������� */
	public int add(ENPlanWork2RQAllocationList aENPlanWork2RQAllocationList)
			throws java.rmi.RemoteException;

	/* ENPlanWork2RQAllocationList. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanWork2RQAllocationList. �������� */
	public void save(ENPlanWork2RQAllocationList aENPlanWork2RQAllocationList)
			throws java.rmi.RemoteException;

	/* ENPlanWork2RQAllocationList. �������� ������ */
	public ENPlanWork2RQAllocationList getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanWork2RQAllocationList. �������� ������ ������ */
	public ENPlanWork2RQAllocationListShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanWork2RQAllocationList. �������� ������ �� ������� */
	public ENPlanWork2RQAllocationListShortList getFilteredList(
			ENPlanWork2RQAllocationListFilter aENPlanWork2RQAllocationListFilter)
			throws java.rmi.RemoteException;

	/* ENPlanWork2RQAllocationList. �������� ������ ��� ��������� */
	public ENPlanWork2RQAllocationListShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanWork2RQAllocationList. �������� ������ ��� ��������� �� ������� */
	public ENPlanWork2RQAllocationListShortList getScrollableFilteredList(
			ENPlanWork2RQAllocationListFilter aENPlanWork2RQAllocationListFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanWork2RQAllocationList. �������� ������ ��� ��������� �� ������� */
	public ENPlanWork2RQAllocationListShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanWork2RQAllocationList. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPlanWork2RQAllocationListFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanWork2RQAllocationList. �������� ������ �� ������ */
	public ENPlanWork2RQAllocationListShort getShortObject(int code)
			throws java.rmi.RemoteException;

}