
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENWorkOrderByt;
 *
 */

import com.ksoe.energynet.valueobject.ENWorkOrderByt;
import com.ksoe.energynet.valueobject.brief.ENMetrologyCounterShort;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderBytShort;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytShortList;


public interface ENWorkOrderBytController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWorkOrderBytController";

	/* ENWorkOrderByt. �������� */
	public int add(ENWorkOrderByt aENWorkOrderByt)
			throws java.rmi.RemoteException;
	/* ENWorkOrderByt. �������� �� �������� (��� �������� ������) */
	public int addForRaid(ENWorkOrderByt object) 
			throws java.rmi.RemoteException;
	/* ENWorkOrderByt. �������� �� �������� (��� ������ ���������) */
	public int addForControl(ENWorkOrderByt object)	
			throws java.rmi.RemoteException;
	
	/* ENWorkOrderByt. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;
	public void remove(int anObjectCode, boolean isFromBilling) throws java.rmi.RemoteException;
	/* ENWorkOrderByt. ������� �� �������� (��� �������� ������) */
	public void removeForRaid(int code) throws java.rmi.RemoteException;
	/* ENWorkOrderByt. ������� �� �������� (��� ������ ���������) */
	public void removeForControl(int code) throws java.rmi.RemoteException;	
	/* ENWorkOrderByt. ������� ������ ������� ������� ��� �������� ������� */
	public void removeBadRaid(int code) throws java.rmi.RemoteException;

	/* ENWorkOrderByt. �������� */
	public void save(ENWorkOrderByt aENWorkOrderByt)
			throws java.rmi.RemoteException;

	/* ENWorkOrderByt. �������� ������ */
	public ENWorkOrderByt getObject(int anObjectCode) throws java.rmi.RemoteException;
	public ENWorkOrderByt getObjectForRaid(int anObjectCode) throws java.rmi.RemoteException;

	/* ENWorkOrderByt. �������� ������ ������ */
	public ENWorkOrderBytShortList getList()
			throws java.rmi.RemoteException;

	/* ENWorkOrderByt. �������� ������ �� ������� */
	public ENWorkOrderBytShortList getFilteredList(
			ENWorkOrderBytFilter aENWorkOrderBytFilter)
			throws java.rmi.RemoteException;

	/* ENWorkOrderByt. �������� ������ ��� ��������� */
	public ENWorkOrderBytShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderByt. �������� ������ ��� ��������� �� ������� */
	public ENWorkOrderBytShortList getScrollableFilteredList(
			ENWorkOrderBytFilter aENWorkOrderBytFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;
	public ENWorkOrderBytShortList getScrollableFilteredListForRaid(
			ENWorkOrderBytFilter aENWorkOrderBytFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderByt. �������� ������ ��� ��������� �� ������� */
	public ENWorkOrderBytShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENWorkOrderByt. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENWorkOrderBytFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENWorkOrderByt. �������� ������ �� ������ */
	public ENWorkOrderBytShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	public void addSeals(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode) throws java.rmi.RemoteException;
	public void addSeals(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans) 
			throws java.rmi.RemoteException;
	public void addSealsForRaid(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans)
			throws java.rmi.RemoteException;
	public void addSealsByFact(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode) throws java.rmi.RemoteException;
	public void addSealsByFact(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans) 
			throws java.rmi.RemoteException;
	public void addSealsForRaidByFact(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans)
			throws java.rmi.RemoteException;
	public void removeSeals(int workOrderBytCode, int[] sealCodes) throws java.rmi.RemoteException;
	public void removeSealsByFact(int workOrderBytCode, int[] sealCodes) throws java.rmi.RemoteException;
	
	public void makeFormed(int workOrderBytCode) throws java.rmi.RemoteException;
	public void undoMakeFormed(int workOrderBytCode) throws java.rmi.RemoteException;
	public void makeApproved(int workOrderBytCode) throws java.rmi.RemoteException;
	public void undoMakeApproved(int workOrderBytCode) throws java.rmi.RemoteException;
	public void makeCompleted(int workOrderBytCode) throws java.rmi.RemoteException;
	public void undoMakeCompleted(int workOrderBytCode) throws java.rmi.RemoteException;
	public void makeClosed(int workOrderBytCode) throws java.rmi.RemoteException;
	public void undoMakeClosed(int workOrderBytCode) throws java.rmi.RemoteException;
	
	public boolean checkWorkOrderBytForStatus(int workOrderBytCode, int statusCode, boolean isException) throws java.rmi.RemoteException;	
	public boolean checkWorkOrderBytForStatus(ENWorkOrderByt workOrderByt, int statusCode, boolean isException) throws java.rmi.RemoteException;

}