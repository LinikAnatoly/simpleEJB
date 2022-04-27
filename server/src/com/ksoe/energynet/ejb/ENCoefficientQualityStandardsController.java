
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCoefficientQualityStandards;
 *
 */

import com.ksoe.energynet.valueobject.ENCoefficientQualityStandards;
import com.ksoe.energynet.valueobject.lists.ENCoefficientQualityStandardsShortList;
import com.ksoe.energynet.valueobject.brief.ENCoefficientQualityStandardsShort;
import com.ksoe.energynet.valueobject.filter.ENCoefficientQualityStandardsFilter;


public interface ENCoefficientQualityStandardsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCoefficientQualityStandardsController";

	/* ENCoefficientQualityStandards. �������� */
	public int add(ENCoefficientQualityStandards aENCoefficientQualityStandards)
			throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. �������� */
	public void save(ENCoefficientQualityStandards aENCoefficientQualityStandards)
			throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. �������� ������ */
	public ENCoefficientQualityStandards getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. �������� ������ ������ */
	public ENCoefficientQualityStandardsShortList getList()
			throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. �������� ������ �� ������� */
	public ENCoefficientQualityStandardsShortList getFilteredList(
			ENCoefficientQualityStandardsFilter aENCoefficientQualityStandardsFilter)
			throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. �������� ������ ��� ��������� */
	public ENCoefficientQualityStandardsShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. �������� ������ ��� ��������� �� ������� */
	public ENCoefficientQualityStandardsShortList getScrollableFilteredList(
			ENCoefficientQualityStandardsFilter aENCoefficientQualityStandardsFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. �������� ������ ��� ��������� �� ������� */
	public ENCoefficientQualityStandardsShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENCoefficientQualityStandardsFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCoefficientQualityStandards. �������� ������ �� ������ */
	public ENCoefficientQualityStandardsShort getShortObject(int code)
			throws java.rmi.RemoteException;

}