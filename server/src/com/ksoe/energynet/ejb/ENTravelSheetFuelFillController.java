
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTravelSheetFuelFill;
 *
 */

import com.ksoe.energynet.valueobject.ENTravelSheetFuelFill;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetFuelFillShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelFillFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelFillShortList;


public interface ENTravelSheetFuelFillController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetFuelFillController";

	/* ENTravelSheetFuelFill. Добавить */
	public int add(ENTravelSheetFuelFill aENTravelSheetFuelFill)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. Изменить */
	public void save(ENTravelSheetFuelFill aENTravelSheetFuelFill)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. Получить объект */
	public ENTravelSheetFuelFill getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. Получить полный список */
	public ENTravelSheetFuelFillShortList getList()
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. Получить список по фильтру */
	public ENTravelSheetFuelFillShortList getFilteredList(
			ENTravelSheetFuelFillFilter aENTravelSheetFuelFillFilter)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. Получить список для просмотра */
	public ENTravelSheetFuelFillShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. Получить список для просмотра по фильтру */
	public ENTravelSheetFuelFillShortList getScrollableFilteredList(
			ENTravelSheetFuelFillFilter aENTravelSheetFuelFillFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. Получить список для просмотра по условию */
	public ENTravelSheetFuelFillShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENTravelSheetFuelFillFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelFill. Получить объект из списка */
	public ENTravelSheetFuelFillShort getShortObject(int code)
			throws java.rmi.RemoteException;

}