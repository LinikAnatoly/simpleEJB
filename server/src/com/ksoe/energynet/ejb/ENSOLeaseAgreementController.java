
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSOLeaseAgreement;
 *
 */

import com.ksoe.energynet.valueobject.ENSOLeaseAgreement;
import com.ksoe.energynet.valueobject.lists.ENSOLeaseAgreementShortList;
import com.ksoe.energynet.valueobject.brief.ENSOLeaseAgreementShort;
import com.ksoe.energynet.valueobject.filter.ENSOLeaseAgreementFilter;


public interface ENSOLeaseAgreementController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSOLeaseAgreementController";

	/* ENSOLeaseAgreement. �������� */
	public int add(ENSOLeaseAgreement aENSOLeaseAgreement)
			throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. �������� */
	public void save(ENSOLeaseAgreement aENSOLeaseAgreement)
			throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. �������� ������ */
	public ENSOLeaseAgreement getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. �������� ������ ������ */
	public ENSOLeaseAgreementShortList getList()
			throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. �������� ������ �� ������� */
	public ENSOLeaseAgreementShortList getFilteredList(
			ENSOLeaseAgreementFilter aENSOLeaseAgreementFilter)
			throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. �������� ������ ��� ��������� */
	public ENSOLeaseAgreementShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. �������� ������ ��� ��������� �� ������� */
	public ENSOLeaseAgreementShortList getScrollableFilteredList(
			ENSOLeaseAgreementFilter aENSOLeaseAgreementFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. �������� ������ ��� ��������� �� ������� */
	public ENSOLeaseAgreementShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENSOLeaseAgreementFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSOLeaseAgreement. �������� ������ �� ������ */
	public ENSOLeaseAgreementShort getShortObject(int code)
			throws java.rmi.RemoteException;

}