
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelSheetVolumes;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelSheetVolumes;
import com.ksoe.energynet.valueobject.brief.ENFuelSheetVolumesShort;
import com.ksoe.energynet.valueobject.filter.ENFuelSheetVolumesFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolumesShortList;


public interface ENFuelSheetVolumesController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelSheetVolumesController";

	/* ENFuelSheetVolumes. �������� */
	//public int add(ENFuelSheetVolumes aENFuelSheetVolumes)
	//		throws java.rmi.RemoteException;
	public int add(ENFuelSheetVolumes aENFuelSheetVolumes, 
			int year, int month, int decadeNumber)
			throws java.rmi.RemoteException;
	
	/* ENFuelSheetVolumes. ������� */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. �������� */
	public void save(ENFuelSheetVolumes aENFuelSheetVolumes)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. �������� ������ */
	public ENFuelSheetVolumes getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. �������� ������ ������ */
	public ENFuelSheetVolumesShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. �������� ������ �� ������� */
	public ENFuelSheetVolumesShortList getFilteredList(
			ENFuelSheetVolumesFilter aENFuelSheetVolumesFilter)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. �������� ������ ��� ��������� */
	public ENFuelSheetVolumesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. �������� ������ ��� ��������� �� ������� */
	public ENFuelSheetVolumesShortList getScrollableFilteredList(
			ENFuelSheetVolumesFilter aENFuelSheetVolumesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. �������� ������ ��� ��������� �� ������� */
	public ENFuelSheetVolumesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENFuelSheetVolumesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. �������� ������ �� ������ */
	public ENFuelSheetVolumesShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENFuelSheetVolumes. ��������� */
	public void approve(int sheetVolumesCode) throws java.rmi.RemoteException;
	/* ENFuelSheetVolumes. �������� ����������� */
	public void undoApprove(int sheetVolumesCode) throws java.rmi.RemoteException;

}