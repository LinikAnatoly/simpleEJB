
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTechAgreement2ServicesObject;
 *
 */

import com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject;
import com.ksoe.energynet.valueobject.brief.ENTechAgreement2ServicesObjectShort;
import com.ksoe.energynet.valueobject.filter.ENTechAgreement2ServicesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENTechAgreement2ServicesObjectShortList;


public interface ENTechAgreement2ServicesObjectController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTechAgreement2ServicesObjectController";

	/* ENTechAgreement2ServicesObject. �������� */
	public int add(ENTechAgreement2ServicesObject aENTechAgreement2ServicesObject)
			throws java.rmi.RemoteException;

	/* ENTechAgreement2ServicesObject. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTechAgreement2ServicesObject. �������� */
	public void save(ENTechAgreement2ServicesObject aENTechAgreement2ServicesObject)
			throws java.rmi.RemoteException;

	/* ENTechAgreement2ServicesObject. �������� ������ */
	public ENTechAgreement2ServicesObject getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTechAgreement2ServicesObject. �������� ������ ������ */
	public ENTechAgreement2ServicesObjectShortList getList()
			throws java.rmi.RemoteException;

	/* ENTechAgreement2ServicesObject. �������� ������ �� ������� */
	public ENTechAgreement2ServicesObjectShortList getFilteredList(
			ENTechAgreement2ServicesObjectFilter aENTechAgreement2ServicesObjectFilter)
			throws java.rmi.RemoteException;

	/* ENTechAgreement2ServicesObject. �������� ������ ��� ��������� */
	public ENTechAgreement2ServicesObjectShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTechAgreement2ServicesObject. �������� ������ ��� ��������� �� ������� */
	public ENTechAgreement2ServicesObjectShortList getScrollableFilteredList(
			ENTechAgreement2ServicesObjectFilter aENTechAgreement2ServicesObjectFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTechAgreement2ServicesObject. �������� ������ ��� ��������� �� ������� */
	public ENTechAgreement2ServicesObjectShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTechAgreement2ServicesObject. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENTechAgreement2ServicesObjectFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTechAgreement2ServicesObject. �������� ������ �� ������ */
	public ENTechAgreement2ServicesObjectShort getShortObject(int code)
			throws java.rmi.RemoteException;

}