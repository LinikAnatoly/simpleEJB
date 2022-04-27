
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for FKTrans2AXTransItem;
 *
 */

import com.ksoe.energynet.valueobject.FKTrans2AXTransItem;
import com.ksoe.energynet.valueobject.lists.FKTrans2AXTransItemShortList;
import com.ksoe.energynet.valueobject.brief.FKTrans2AXTransItemShort;
import com.ksoe.energynet.valueobject.filter.FKTrans2AXTransItemFilter;


public interface FKTrans2AXTransItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/FKTrans2AXTransItemController";

	/* FKTrans2AXTransItem. �������� */
	public int add(FKTrans2AXTransItem aFKTrans2AXTransItem)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. �������� */
	public void save(FKTrans2AXTransItem aFKTrans2AXTransItem)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. �������� ������ */
	public FKTrans2AXTransItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. �������� ������ ������ */
	public FKTrans2AXTransItemShortList getList()
			throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. �������� ������ �� ������� */
	public FKTrans2AXTransItemShortList getFilteredList(
			FKTrans2AXTransItemFilter aFKTrans2AXTransItemFilter)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. �������� ������ ��� ��������� */
	public FKTrans2AXTransItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. �������� ������ ��� ��������� �� ������� */
	public FKTrans2AXTransItemShortList getScrollableFilteredList(
			FKTrans2AXTransItemFilter aFKTrans2AXTransItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. �������� ������ ��� ��������� �� ������� */
	public FKTrans2AXTransItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			FKTrans2AXTransItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. �������� ������ �� ������ */
	public FKTrans2AXTransItemShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	
	public FKTrans2AXTransItemShortList getScrollableFilteredListGroup(	FKTrans2AXTransItemFilter filterObject, int fromPosition,	int quantity)
	   throws java.rmi.RemoteException;
	
	/* FKTrans2AXTransItem. ������������ �������� ��� �������� �� (�� ���)  */
	public void makeDimensionAX( int transCode , String transDate ) throws java.rmi.RemoteException; 
	
	
	/* FKTrans2AXTransItem. �������� ����� �������� � �� (�� ���)  */
	public void moveTrans2AX( int transCode , String transDate ) throws java.rmi.RemoteException;
	
	/* FKTrans2AXTransItem. �������� ����� �������� � �� (�� ���)  */
	public void exportTrans2AX( int transCode , String transDate ) throws java.rmi.RemoteException;
	
	/* FKTrans2AXTransItem. ��������� �������� � �� (�� ���/����)  */
	public void startCreatingPack( int transCode , String transDate ) throws java.rmi.RemoteException;
	
	

}