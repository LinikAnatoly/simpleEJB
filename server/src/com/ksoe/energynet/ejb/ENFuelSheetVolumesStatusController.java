
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelSheetVolumesStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelSheetVolumesStatus;
import com.ksoe.energynet.valueobject.brief.ENFuelSheetVolumesStatusShort;
import com.ksoe.energynet.valueobject.filter.ENFuelSheetVolumesStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolumesStatusShortList;


public interface ENFuelSheetVolumesStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelSheetVolumesStatusController";

	/* ENFuelSheetVolumesStatus. Добавить */
	public int add(ENFuelSheetVolumesStatus aENFuelSheetVolumesStatus)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. Изменить */
	public void save(ENFuelSheetVolumesStatus aENFuelSheetVolumesStatus)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. Получить объект */
	public ENFuelSheetVolumesStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. Получить полный список */
	public ENFuelSheetVolumesStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. Получить список по фильтру */
	public ENFuelSheetVolumesStatusShortList getFilteredList(
			ENFuelSheetVolumesStatusFilter aENFuelSheetVolumesStatusFilter)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. Получить список для просмотра */
	public ENFuelSheetVolumesStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. Получить список для просмотра по фильтру */
	public ENFuelSheetVolumesStatusShortList getScrollableFilteredList(
			ENFuelSheetVolumesStatusFilter aENFuelSheetVolumesStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. Получить список для просмотра по условию */
	public ENFuelSheetVolumesStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENFuelSheetVolumesStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesStatus. Получить объект из списка */
	public ENFuelSheetVolumesStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}