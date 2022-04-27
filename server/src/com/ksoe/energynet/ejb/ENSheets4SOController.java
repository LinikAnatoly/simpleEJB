
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSheets4SO;
 *
 */

import java.util.Date;

import com.ksoe.energynet.valueobject.ENSheets4SO;
import com.ksoe.energynet.valueobject.ENSheets4SOItems;
import com.ksoe.energynet.valueobject.lists.ENSheets4SOShortList;
import com.ksoe.energynet.valueobject.brief.ENSheets4SOShort;
import com.ksoe.energynet.valueobject.filter.ENSheets4SOFilter;


public interface ENSheets4SOController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSheets4SOController";

	/* ENSheets4SO. Добавить */
	public int add(ENSheets4SO aENSheets4SO)
			throws java.rmi.RemoteException;

	/* ENSheets4SO. Добавить со строками*/
	public int add(ENSheets4SO object, ENSheets4SOItems[] items)
			throws java.rmi.RemoteException;

	/* ENSheets4SO. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSheets4SO. Изменить */
	public void save(ENSheets4SO aENSheets4SO)
			throws java.rmi.RemoteException;

	/* ENSheets4SO. Получить объект */
	public ENSheets4SO getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSheets4SO. Получить полный список */
	public ENSheets4SOShortList getList()
			throws java.rmi.RemoteException;

	/* ENSheets4SO. Получить список по фильтру */
	public ENSheets4SOShortList getFilteredList(
			ENSheets4SOFilter aENSheets4SOFilter)
			throws java.rmi.RemoteException;

	/* ENSheets4SO. Получить список для просмотра */
	public ENSheets4SOShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSheets4SO. Получить список для просмотра по фильтру */
	public ENSheets4SOShortList getScrollableFilteredList(
			ENSheets4SOFilter aENSheets4SOFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSheets4SO. Получить список для просмотра по условию */
	public ENSheets4SOShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSheets4SO. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSheets4SOFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSheets4SO. Получить объект из списка */
	public ENSheets4SOShort getShortObject(int code)
			throws java.rmi.RemoteException;

	public int generateNextLandSheets() throws java.rmi.RemoteException;
	public int generateNextLandSheets(Date generationDate) throws java.rmi.RemoteException;
	public int generateNextLandSheetsForToday() throws java.rmi.RemoteException;

	public void regenerateENSheets4SO(int sheet4SOCode) throws java.rmi.RemoteException;

	public String getSheetPostCode(int servicesobjectCode) throws java.rmi.RemoteException;

	public String getSheetPostCode(int servicesobjectCode, String previousSheetPostCode)
			throws java.rmi.RemoteException;

}