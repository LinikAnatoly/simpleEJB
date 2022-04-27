
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for FKTrans2AXTrans;
 *
 */

import com.ksoe.energynet.valueobject.FKTrans2AXTrans;
import com.ksoe.energynet.valueobject.lists.FKTrans2AXTransShortList;
import com.ksoe.energynet.valueobject.brief.FKTrans2AXTransShort;
import com.ksoe.energynet.valueobject.filter.FKTrans2AXTransFilter;


public interface FKTrans2AXTransController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/FKTrans2AXTransController";

	/* FKTrans2AXTrans. �������� */
	public int add(FKTrans2AXTrans aFKTrans2AXTrans)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTrans. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* FKTrans2AXTrans. �������� */
	public void save(FKTrans2AXTrans aFKTrans2AXTrans)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTrans. �������� ������ */
	public FKTrans2AXTrans getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTrans. �������� ������ ������ */
	public FKTrans2AXTransShortList getList()
			throws java.rmi.RemoteException;

	/* FKTrans2AXTrans. �������� ������ �� ������� */
	public FKTrans2AXTransShortList getFilteredList(
			FKTrans2AXTransFilter aFKTrans2AXTransFilter)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTrans. �������� ������ ��� ��������� */
	public FKTrans2AXTransShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FKTrans2AXTrans. �������� ������ ��� ��������� �� ������� */
	public FKTrans2AXTransShortList getScrollableFilteredList(
			FKTrans2AXTransFilter aFKTrans2AXTransFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FKTrans2AXTrans. �������� ������ ��� ��������� �� ������� */
	public FKTrans2AXTransShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTrans. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			FKTrans2AXTransFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* FKTrans2AXTrans. �������� ������ �� ������ */
	public FKTrans2AXTransShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	//�������� �������� FK>>>EN
	public void addFKTrans2EN(int FKTrans2AXTransCode ) throws java.rmi.RemoteException;

}