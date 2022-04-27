
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelSheetVolumesItem;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelSheetVolumesItem;
import com.ksoe.energynet.valueobject.brief.ENFuelSheetVolumesItemShort;
import com.ksoe.energynet.valueobject.filter.ENFuelSheetVolumesItemFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolumesItemShortList;


public interface ENFuelSheetVolumesItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelSheetVolumesItemController";

	/* ENFuelSheetVolumesItem. Добавить */
	public int add(ENFuelSheetVolumesItem aENFuelSheetVolumesItem)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. Изменить */
	public void save(ENFuelSheetVolumesItem aENFuelSheetVolumesItem)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. Получить объект */
	public ENFuelSheetVolumesItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. Получить полный список */
	public ENFuelSheetVolumesItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. Получить список по фильтру */
	public ENFuelSheetVolumesItemShortList getFilteredList(
			ENFuelSheetVolumesItemFilter aENFuelSheetVolumesItemFilter)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. Получить список для просмотра */
	public ENFuelSheetVolumesItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. Получить список для просмотра по фильтру */
	public ENFuelSheetVolumesItemShortList getScrollableFilteredList(
			ENFuelSheetVolumesItemFilter aENFuelSheetVolumesItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. Получить список для просмотра по условию */
	public ENFuelSheetVolumesItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENFuelSheetVolumesItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelSheetVolumesItem. Получить объект из списка */
	public ENFuelSheetVolumesItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}