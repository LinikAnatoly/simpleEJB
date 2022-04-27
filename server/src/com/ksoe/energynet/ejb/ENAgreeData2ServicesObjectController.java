
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAgreeData2ServicesObject;
 *
 */

import com.ksoe.energynet.valueobject.ENAgreeData2ServicesObject;
import com.ksoe.energynet.valueobject.brief.ENAgreeData2ServicesObjectShort;
import com.ksoe.energynet.valueobject.filter.ENAgreeData2ServicesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENAgreeData2ServicesObjectShortList;


public interface ENAgreeData2ServicesObjectController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAgreeData2ServicesObjectController";

	/* ENAgreeData2ServicesObject. �������� */
	public int add(ENAgreeData2ServicesObject aENAgreeData2ServicesObject)
			throws java.rmi.RemoteException;

	/* ENAgreeData2ServicesObject. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAgreeData2ServicesObject. �������� */
	public void save(ENAgreeData2ServicesObject aENAgreeData2ServicesObject)
			throws java.rmi.RemoteException;

	/* ENAgreeData2ServicesObject. �������� ������ */
	public ENAgreeData2ServicesObject getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAgreeData2ServicesObject. �������� ������ ������ */
	public ENAgreeData2ServicesObjectShortList getList()
			throws java.rmi.RemoteException;

	/* ENAgreeData2ServicesObject. �������� ������ �� ������� */
	public ENAgreeData2ServicesObjectShortList getFilteredList(
			ENAgreeData2ServicesObjectFilter aENAgreeData2ServicesObjectFilter)
			throws java.rmi.RemoteException;

	/* ENAgreeData2ServicesObject. �������� ������ ��� ��������� */
	public ENAgreeData2ServicesObjectShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAgreeData2ServicesObject. �������� ������ ��� ��������� �� ������� */
	public ENAgreeData2ServicesObjectShortList getScrollableFilteredList(
			ENAgreeData2ServicesObjectFilter aENAgreeData2ServicesObjectFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAgreeData2ServicesObject. �������� ������ ��� ��������� �� ������� */
	public ENAgreeData2ServicesObjectShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAgreeData2ServicesObject. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENAgreeData2ServicesObjectFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAgreeData2ServicesObject. �������� ������ �� ������ */
	public ENAgreeData2ServicesObjectShort getShortObject(int code)
			throws java.rmi.RemoteException;

}