
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDistributionAgree;
 *
 */

import com.ksoe.energynet.valueobject.ENDistributionAgree;
import com.ksoe.energynet.valueobject.lists.ENDistributionAgreeShortList;
import com.ksoe.energynet.valueobject.brief.ENDistributionAgreeShort;
import com.ksoe.energynet.valueobject.filter.ENDistributionAgreeFilter;


public interface ENDistributionAgreeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDistributionAgreeController";

	/* ENDistributionAgree. �������� */
	public int add(ENDistributionAgree aENDistributionAgree)
			throws java.rmi.RemoteException;

	/* ENDistributionAgree. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDistributionAgree. �������� */
	public void save(ENDistributionAgree aENDistributionAgree)
			throws java.rmi.RemoteException;

	/* ENDistributionAgree. �������� ������ */
	public ENDistributionAgree getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDistributionAgree. �������� ������ ������ */
	public ENDistributionAgreeShortList getList()
			throws java.rmi.RemoteException;

	/* ENDistributionAgree. �������� ������ �� ������� */
	public ENDistributionAgreeShortList getFilteredList(
			ENDistributionAgreeFilter aENDistributionAgreeFilter)
			throws java.rmi.RemoteException;

	/* ENDistributionAgree. �������� ������ ��� ��������� */
	public ENDistributionAgreeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDistributionAgree. �������� ������ ��� ��������� �� ������� */
	public ENDistributionAgreeShortList getScrollableFilteredList(
			ENDistributionAgreeFilter aENDistributionAgreeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDistributionAgree. �������� ������ ��� ��������� �� ������� */
	public ENDistributionAgreeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDistributionAgree. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENDistributionAgreeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDistributionAgree. �������� ������ �� ������ */
	public ENDistributionAgreeShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENDistributionAgree. �������� �� ������� ServicesObject*/
	public int add(ENDistributionAgree aENDistributionAgree, int soCode)
			throws java.rmi.RemoteException;
	

}