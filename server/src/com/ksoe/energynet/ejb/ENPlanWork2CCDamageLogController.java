
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPlanWork2CCDamageLog;
 *
 */

import com.ksoe.energynet.valueobject.ENPlanWork2CCDamageLog;
import com.ksoe.energynet.valueobject.brief.ENPlanWork2CCDamageLogShort;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2CCDamageLogFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2CCDamageLogShortList;


public interface ENPlanWork2CCDamageLogController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPlanWork2CCDamageLogController";

	/* ENPlanWork2CCDamageLog. �������� */
	public int add(ENPlanWork2CCDamageLog aENPlanWork2CCDamageLog)
			throws java.rmi.RemoteException;

	/* ENPlanWork2CCDamageLog. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPlanWork2CCDamageLog. �������� */
	public void save(ENPlanWork2CCDamageLog aENPlanWork2CCDamageLog)
			throws java.rmi.RemoteException;

	/* ENPlanWork2CCDamageLog. �������� ������ */
	public ENPlanWork2CCDamageLog getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPlanWork2CCDamageLog. �������� ������ ������ */
	public ENPlanWork2CCDamageLogShortList getList()
			throws java.rmi.RemoteException;

	/* ENPlanWork2CCDamageLog. �������� ������ �� ������� */
	public ENPlanWork2CCDamageLogShortList getFilteredList(
			ENPlanWork2CCDamageLogFilter aENPlanWork2CCDamageLogFilter)
			throws java.rmi.RemoteException;

	/* ENPlanWork2CCDamageLog. �������� ������ ��� ��������� */
	public ENPlanWork2CCDamageLogShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanWork2CCDamageLog. �������� ������ ��� ��������� �� ������� */
	public ENPlanWork2CCDamageLogShortList getScrollableFilteredList(
			ENPlanWork2CCDamageLogFilter aENPlanWork2CCDamageLogFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPlanWork2CCDamageLog. �������� ������ ��� ��������� �� ������� */
	public ENPlanWork2CCDamageLogShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPlanWork2CCDamageLog. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENPlanWork2CCDamageLogFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPlanWork2CCDamageLog. �������� ������ �� ������ */
	public ENPlanWork2CCDamageLogShort getShortObject(int code)
			throws java.rmi.RemoteException;

}