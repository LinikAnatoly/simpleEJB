
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENLandSheetsDelays;
 *
 */

import com.ksoe.energynet.valueobject.ENLandSheetsDelays;
import com.ksoe.energynet.valueobject.lists.ENLandSheetsDelaysShortList;
import com.ksoe.energynet.valueobject.brief.ENLandSheetsDelaysShort;
import com.ksoe.energynet.valueobject.filter.ENLandSheetsDelaysFilter;


public interface ENLandSheetsDelaysController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENLandSheetsDelaysController";

	/* ENLandSheetsDelays. Добавить */
	public int add(ENLandSheetsDelays aENLandSheetsDelays)
			throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. Изменить */
	public void save(ENLandSheetsDelays aENLandSheetsDelays)
			throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. Получить объект */
	public ENLandSheetsDelays getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. Получить полный список */
	public ENLandSheetsDelaysShortList getList()
			throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. Получить список по фильтру */
	public ENLandSheetsDelaysShortList getFilteredList(
			ENLandSheetsDelaysFilter aENLandSheetsDelaysFilter)
			throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. Получить список для просмотра */
	public ENLandSheetsDelaysShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. Получить список для просмотра по фильтру */
	public ENLandSheetsDelaysShortList getScrollableFilteredList(
			ENLandSheetsDelaysFilter aENLandSheetsDelaysFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. Получить список для просмотра по условию */
	public ENLandSheetsDelaysShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENLandSheetsDelaysFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENLandSheetsDelays. Получить объект из списка */
	public ENLandSheetsDelaysShort getShortObject(int code)
			throws java.rmi.RemoteException;

}