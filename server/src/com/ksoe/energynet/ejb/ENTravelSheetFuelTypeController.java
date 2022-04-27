
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTravelSheetFuelType;
 *
 */

import com.ksoe.energynet.valueobject.ENTravelSheetFuelType;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetFuelTypeShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelTypeShortList;


public interface ENTravelSheetFuelTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetFuelTypeController";

	/* ENTravelSheetFuelType. Добавить */
	public int add(ENTravelSheetFuelType aENTravelSheetFuelType)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. Изменить */
	public void save(ENTravelSheetFuelType aENTravelSheetFuelType)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. Получить объект */
	public ENTravelSheetFuelType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. Получить полный список */
	public ENTravelSheetFuelTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. Получить список по фильтру */
	public ENTravelSheetFuelTypeShortList getFilteredList(
			ENTravelSheetFuelTypeFilter aENTravelSheetFuelTypeFilter)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. Получить список для просмотра */
	public ENTravelSheetFuelTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. Получить список для просмотра по фильтру */
	public ENTravelSheetFuelTypeShortList getScrollableFilteredList(
			ENTravelSheetFuelTypeFilter aENTravelSheetFuelTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. Получить список для просмотра по условию */
	public ENTravelSheetFuelTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENTravelSheetFuelTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTravelSheetFuelType. Получить объект из списка */
	public ENTravelSheetFuelTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}