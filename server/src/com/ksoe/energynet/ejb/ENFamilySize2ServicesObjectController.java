
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFamilySize2ServicesObject;
 *
 */

import com.ksoe.energynet.valueobject.ENFamilySize2ServicesObject;
import com.ksoe.energynet.valueobject.brief.ENFamilySize2ServicesObjectShort;
import com.ksoe.energynet.valueobject.filter.ENFamilySize2ServicesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENFamilySize2ServicesObjectShortList;


public interface ENFamilySize2ServicesObjectController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFamilySize2ServicesObjectController";

	/* ENFamilySize2ServicesObject. �������� */
	public int add(ENFamilySize2ServicesObject aENFamilySize2ServicesObject)
			throws java.rmi.RemoteException;

	/* ENFamilySize2ServicesObject. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFamilySize2ServicesObject. �������� */
	public void save(ENFamilySize2ServicesObject aENFamilySize2ServicesObject)
			throws java.rmi.RemoteException;

	/* ENFamilySize2ServicesObject. �������� ������ */
	public ENFamilySize2ServicesObject getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFamilySize2ServicesObject. �������� ������ ������ */
	public ENFamilySize2ServicesObjectShortList getList()
			throws java.rmi.RemoteException;

	/* ENFamilySize2ServicesObject. �������� ������ �� ������� */
	public ENFamilySize2ServicesObjectShortList getFilteredList(
			ENFamilySize2ServicesObjectFilter aENFamilySize2ServicesObjectFilter)
			throws java.rmi.RemoteException;

	/* ENFamilySize2ServicesObject. �������� ������ ��� ��������� */
	public ENFamilySize2ServicesObjectShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFamilySize2ServicesObject. �������� ������ ��� ��������� �� ������� */
	public ENFamilySize2ServicesObjectShortList getScrollableFilteredList(
			ENFamilySize2ServicesObjectFilter aENFamilySize2ServicesObjectFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFamilySize2ServicesObject. �������� ������ ��� ��������� �� ������� */
	public ENFamilySize2ServicesObjectShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFamilySize2ServicesObject. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENFamilySize2ServicesObjectFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFamilySize2ServicesObject. �������� ������ �� ������ */
	public ENFamilySize2ServicesObjectShort getShortObject(int code)
			throws java.rmi.RemoteException;

}