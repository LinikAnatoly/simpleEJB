
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanWork2Decree;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanWork2Decree;
import com.ksoe.energynet.valueobject.brief.ENPlanWork2DecreeShort;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2DecreeFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2DecreeShortList;


public interface ENPlanWork2DecreeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanWork2DecreeController";

	/* ENPlanWork2Decree. �������� */
	public int add(ENPlanWork2Decree aENPlanWork2Decree)
			throws java.rmi.RemoteException;

	/* ENPlanWork2Decree. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanWork2Decree. �������� */
	public void save(ENPlanWork2Decree aENPlanWork2Decree)
			throws java.rmi.RemoteException;

	/* ENPlanWork2Decree. �������� ������ */
	public ENPlanWork2Decree getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanWork2Decree. �������� ������ ������ */
	public ENPlanWork2DecreeShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanWork2Decree. �������� ������ �� ������� */
	public ENPlanWork2DecreeShortList getFilteredList(
			ENPlanWork2DecreeFilter aENPlanWork2DecreeFilter)
			throws java.rmi.RemoteException;

	/* ENPlanWork2Decree. �������� ������ ��� ��������� */
	public ENPlanWork2DecreeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanWork2Decree. �������� ������ ��� ��������� �� ������� */
	public ENPlanWork2DecreeShortList getScrollableFilteredList(
			ENPlanWork2DecreeFilter aENPlanWork2DecreeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanWork2Decree. �������� ������ ��� ��������� �� ������� */
	public ENPlanWork2DecreeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanWork2Decree. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPlanWork2DecreeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanWork2Decree. �������� ������ �� ������ */
	public ENPlanWork2DecreeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}