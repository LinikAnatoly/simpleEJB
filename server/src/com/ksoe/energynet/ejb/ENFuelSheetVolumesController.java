
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
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

	/* ENFuelSheetVolumes. Добавить */
	//public int add(ENFuelSheetVolumes aENFuelSheetVolumes)
	//		throws java.rmi.RemoteException;
	public int add(ENFuelSheetVolumes aENFuelSheetVolumes, 
			int year, int month, int decadeNumber)
			throws java.rmi.RemoteException;
	
	/* ENFuelSheetVolumes. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. Изменить */
	public void save(ENFuelSheetVolumes aENFuelSheetVolumes)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. Получить объект */
	public ENFuelSheetVolumes getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. Получить полный список */
	public ENFuelSheetVolumesShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. Получить список по фильтру */
	public ENFuelSheetVolumesShortList getFilteredList(
			ENFuelSheetVolumesFilter aENFuelSheetVolumesFilter)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. Получить список для просмотра */
	public ENFuelSheetVolumesShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. Получить список для просмотра по фильтру */
	public ENFuelSheetVolumesShortList getScrollableFilteredList(
			ENFuelSheetVolumesFilter aENFuelSheetVolumesFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. Получить список для просмотра по условию */
	public ENFuelSheetVolumesShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENFuelSheetVolumesFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumes. Получить объект из списка */
	public ENFuelSheetVolumesShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENFuelSheetVolumes. Утвердить */
	public void approve(int sheetVolumesCode) throws java.rmi.RemoteException;
	/* ENFuelSheetVolumes. Отменить утверждение */
	public void undoApprove(int sheetVolumesCode) throws java.rmi.RemoteException;

}