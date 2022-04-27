
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActIncomeCreatMetod;
 *
 */

import com.ksoe.energynet.valueobject.ENActIncomeCreatMetod;
import com.ksoe.energynet.valueobject.lists.ENActIncomeCreatMetodShortList;
import com.ksoe.energynet.valueobject.brief.ENActIncomeCreatMetodShort;
import com.ksoe.energynet.valueobject.filter.ENActIncomeCreatMetodFilter;


public interface ENActIncomeCreatMetodController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActIncomeCreatMetodController";

	/* ENActIncomeCreatMetod. �������� */
	public int add(ENActIncomeCreatMetod aENActIncomeCreatMetod)
			throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. �������� */
	public void save(ENActIncomeCreatMetod aENActIncomeCreatMetod)
			throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. �������� ������ */
	public ENActIncomeCreatMetod getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. �������� ������ ������ */
	public ENActIncomeCreatMetodShortList getList()
			throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. �������� ������ �� ������� */
	public ENActIncomeCreatMetodShortList getFilteredList(
			ENActIncomeCreatMetodFilter aENActIncomeCreatMetodFilter)
			throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. �������� ������ ��� ��������� */
	public ENActIncomeCreatMetodShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. �������� ������ ��� ��������� �� ������� */
	public ENActIncomeCreatMetodShortList getScrollableFilteredList(
			ENActIncomeCreatMetodFilter aENActIncomeCreatMetodFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. �������� ������ ��� ��������� �� ������� */
	public ENActIncomeCreatMetodShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENActIncomeCreatMetodFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActIncomeCreatMetod. �������� ������ �� ������ */
	public ENActIncomeCreatMetodShort getShortObject(int code)
			throws java.rmi.RemoteException;

}