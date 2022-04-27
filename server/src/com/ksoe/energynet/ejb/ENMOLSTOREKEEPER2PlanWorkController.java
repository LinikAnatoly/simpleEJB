
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENMOLSTOREKEEPER2PlanWork;
 *
 */

import com.ksoe.energynet.valueobject.ENMOLSTOREKEEPER2PlanWork;
import com.ksoe.energynet.valueobject.brief.ENMOLSTOREKEEPER2PlanWorkShort;
import com.ksoe.energynet.valueobject.filter.ENMOLSTOREKEEPER2PlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENMOLSTOREKEEPER2PlanWorkShortList;


public interface ENMOLSTOREKEEPER2PlanWorkController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENMOLSTOREKEEPER2PlanWorkController";

	/* ENMOLSTOREKEEPER2PlanWork. �������� */
	public int add(ENMOLSTOREKEEPER2PlanWork aENMOLSTOREKEEPER2PlanWork)
			throws java.rmi.RemoteException;

	/* ENMOLSTOREKEEPER2PlanWork. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENMOLSTOREKEEPER2PlanWork. �������� */
	public void save(ENMOLSTOREKEEPER2PlanWork aENMOLSTOREKEEPER2PlanWork)
			throws java.rmi.RemoteException;

	/* ENMOLSTOREKEEPER2PlanWork. �������� ������ */
	public ENMOLSTOREKEEPER2PlanWork getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENMOLSTOREKEEPER2PlanWork. �������� ������ ������ */
	public ENMOLSTOREKEEPER2PlanWorkShortList getList()
			throws java.rmi.RemoteException;

	/* ENMOLSTOREKEEPER2PlanWork. �������� ������ �� ������� */
	public ENMOLSTOREKEEPER2PlanWorkShortList getFilteredList(
			ENMOLSTOREKEEPER2PlanWorkFilter aENMOLSTOREKEEPER2PlanWorkFilter)
			throws java.rmi.RemoteException;

	/* ENMOLSTOREKEEPER2PlanWork. �������� ������ ��� ��������� */
	public ENMOLSTOREKEEPER2PlanWorkShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMOLSTOREKEEPER2PlanWork. �������� ������ ��� ��������� �� ������� */
	public ENMOLSTOREKEEPER2PlanWorkShortList getScrollableFilteredList(
			ENMOLSTOREKEEPER2PlanWorkFilter aENMOLSTOREKEEPER2PlanWorkFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENMOLSTOREKEEPER2PlanWork. �������� ������ ��� ��������� �� ������� */
	public ENMOLSTOREKEEPER2PlanWorkShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENMOLSTOREKEEPER2PlanWork. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENMOLSTOREKEEPER2PlanWorkFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENMOLSTOREKEEPER2PlanWork. �������� ������ �� ������ */
	public ENMOLSTOREKEEPER2PlanWorkShort getShortObject(int code)
			throws java.rmi.RemoteException;

}