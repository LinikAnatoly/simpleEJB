
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanWorkItem2Graph;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanWorkItem2Graph;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItem2GraphShortList;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkItem2GraphShort;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItem2GraphFilter;


public interface ENPlanWorkItem2GraphController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkItem2GraphController";

	/* ENPlanWorkItem2Graph. �������� */
	public int add(ENPlanWorkItem2Graph aENPlanWorkItem2Graph)
			throws java.rmi.RemoteException;

	/* ENPlanWorkItem2Graph. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanWorkItem2Graph. �������� */
	public void save(ENPlanWorkItem2Graph aENPlanWorkItem2Graph)
			throws java.rmi.RemoteException;

	/* ENPlanWorkItem2Graph. �������� ������ */
	public ENPlanWorkItem2Graph getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanWorkItem2Graph. �������� ������ ������ */
	public ENPlanWorkItem2GraphShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanWorkItem2Graph. �������� ������ �� ������� */
	public ENPlanWorkItem2GraphShortList getFilteredList(
			ENPlanWorkItem2GraphFilter aENPlanWorkItem2GraphFilter)
			throws java.rmi.RemoteException;

	/* ENPlanWorkItem2Graph. �������� ������ ��� ��������� */
	public ENPlanWorkItem2GraphShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanWorkItem2Graph. �������� ������ ��� ��������� �� ������� */
	public ENPlanWorkItem2GraphShortList getScrollableFilteredList(
			ENPlanWorkItem2GraphFilter aENPlanWorkItem2GraphFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanWorkItem2Graph. �������� ������ ��� ��������� �� ������� */
	public ENPlanWorkItem2GraphShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanWorkItem2Graph. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPlanWorkItem2GraphFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanWorkItem2Graph. �������� ������ �� ������ */
	public ENPlanWorkItem2GraphShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENPlanWorkItem2Graph. �������� ������ ��� ��������� �� ������� */
	public ENPlanWorkItem2GraphShortList getScrollableFilteredListGraph(
			ENPlanWorkItem2GraphFilter aENPlanWorkItem2GraphFilter) throws java.rmi.RemoteException;
	
	// �������������� �������
    public void editENPlanWorkItem2Graph(ENPlanWorkItem2GraphShort[] pi2grList )throws java.rmi.RemoteException;
    
    // �������� ������� - ���� �� ������� ����� 
    public void  closePlanWorkWithParamsOnGraph(int planWorkRefCode,
            String masterCode,
            String masterName,
            String mechanicCode,
            String mechanicName)throws java.rmi.RemoteException;
    
}