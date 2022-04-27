
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDamageRecovery;
 *
 */

import com.ksoe.energynet.valueobject.ENDamageRecovery;
import com.ksoe.energynet.valueobject.brief.ENDamageRecoveryShort;
import com.ksoe.energynet.valueobject.filter.ENDamageRecoveryFilter;
import com.ksoe.energynet.valueobject.lists.ENDamageRecoveryShortList;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;


public interface ENDamageRecoveryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDamageRecoveryController";

	/* ENDamageRecovery. �������� */
	public int add(ENDamageRecovery aENDamageRecovery)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDamageRecovery. �������� */
	public void save(ENDamageRecovery aENDamageRecovery)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery. �������� ������ */
	public ENDamageRecovery getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery. �������� ������ ������ */
	public ENDamageRecoveryShortList getList()
			throws java.rmi.RemoteException;

	/* ENDamageRecovery. �������� ������ �� ������� */
	public ENDamageRecoveryShortList getFilteredList(
			ENDamageRecoveryFilter aENDamageRecoveryFilter)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery. �������� ������ ��� ��������� */
	public ENDamageRecoveryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDamageRecovery. �������� ������ ��� ��������� �� ������� */
	public ENDamageRecoveryShortList getScrollableFilteredList(
			ENDamageRecoveryFilter aENDamageRecoveryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDamageRecovery. �������� ������ ��� ��������� �� ������� */
	public ENDamageRecoveryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENDamageRecoveryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDamageRecovery. �������� ������ �� ������ */
	public ENDamageRecoveryShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENDamageRecovery. �������� ���� �������� */
	public void changeDatePosting(ENDamageRecovery object) 
	        throws java.rmi.RemoteException;
	
	/* ENDamageRecovery, ������� �������� �� �� */
	public void deletePostingFromFK(int damageRecoveryCode) 
	       throws java.rmi.RemoteException;
	
	/* �������� ���� � ���������� �� �� */
	public FKProvObjectShortList getFKPostingsList(int damageRecoveryCode) 
	       throws java.rmi.RemoteException;
	
	/* ������� �������� � �� */
	public FKProvResult movePostingToFK(int damageRecoveryCode)
		   throws java.rmi.RemoteException;
}