
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENInspectionSheet;
 *
 */

import com.ksoe.energynet.valueobject.ENInspectionSheet;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.brief.ENInspectionSheetShort;
import com.ksoe.energynet.valueobject.filter.ENInspectionSheetFilter;
import com.ksoe.energynet.valueobject.lists.ENInspectionSheetShortList;


public interface ENInspectionSheetController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENInspectionSheetController";

	/* ENInspectionSheet. �������� */
	public int add(ENInspectionSheet aENInspectionSheet)
			throws java.rmi.RemoteException;

	/* ENInspectionSheet. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENInspectionSheet. �������� */
	public void save(ENInspectionSheet aENInspectionSheet)
			throws java.rmi.RemoteException;

	/* ENInspectionSheet. �������� ������ */
	public ENInspectionSheet getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENInspectionSheet. �������� ������ ������ */
	public ENInspectionSheetShortList getList()
			throws java.rmi.RemoteException;

	/* ENInspectionSheet. �������� ������ �� ������� */
	public ENInspectionSheetShortList getFilteredList(
			ENInspectionSheetFilter aENInspectionSheetFilter)
			throws java.rmi.RemoteException;

	/* ENInspectionSheet. �������� ������ ��� ��������� */
	public ENInspectionSheetShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInspectionSheet. �������� ������ ��� ��������� �� ������� */
	public ENInspectionSheetShortList getScrollableFilteredList(
			ENInspectionSheetFilter aENInspectionSheetFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENInspectionSheet. �������� ������ ��� ��������� �� ������� */
	public ENInspectionSheetShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENInspectionSheet. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENInspectionSheetFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENInspectionSheet. �������� ������ �� ������ */
	public ENInspectionSheetShort getShortObject(int code)
			throws java.rmi.RemoteException;


	/** ENInspectionSheet. ��������� �� ����������. */
	public void sendToSigning(int code) throws java.rmi.RemoteException;

	/** ENInspectionSheet. ������� � ��������. */
	public void unSigning(int code) throws java.rmi.RemoteException;

	/** ENInspectionSheet. ���������. */
	public void signed(int code) throws java.rmi.RemoteException;

	/** ENInspectionSheet. ������ ����������. */
	public void unSigned(int code) throws java.rmi.RemoteException;

	/** ENInspectionSheet. �������� ����� �� ��������� ����� �������. */
	public int createPlanFromInspectionSheet(int inspectionSheetCode, ENPlanWork plan) throws java.rmi.RemoteException;

	/** ENInspectionSheet. ���������� ���� �������. */
	public int copySheet(int sheetCode) throws java.rmi.RemoteException;

	/** ENInspectionSheet. �������� ��� ������ ���������� �� ���� �������� ����������. */
	public int getVoltageClassCodeByVoltageNominalCode(int voltageNominalCode) throws java.rmi.RemoteException;
}