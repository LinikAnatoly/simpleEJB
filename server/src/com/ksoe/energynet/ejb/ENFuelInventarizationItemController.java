
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelInventarizationItem;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelInventarizationItem;
import com.ksoe.energynet.valueobject.brief.ENFuelInventarizationItemShort;
import com.ksoe.energynet.valueobject.filter.ENFuelInventarizationItemFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelInventarizationItemShortList;


public interface ENFuelInventarizationItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelInventarizationItemController";

	/* ENFuelInventarizationItem. Добавить */
	public int add(ENFuelInventarizationItem aENFuelInventarizationItem)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. Изменить */
	public void save(ENFuelInventarizationItem aENFuelInventarizationItem)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. Получить объект */
	public ENFuelInventarizationItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. Получить полный список */
	public ENFuelInventarizationItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. Получить список по фильтру */
	public ENFuelInventarizationItemShortList getFilteredList(
			ENFuelInventarizationItemFilter aENFuelInventarizationItemFilter)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. Получить список для просмотра */
	public ENFuelInventarizationItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. Получить список для просмотра по фильтру */
	public ENFuelInventarizationItemShortList getScrollableFilteredList(
			ENFuelInventarizationItemFilter aENFuelInventarizationItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. Получить список для просмотра по условию */
	public ENFuelInventarizationItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENFuelInventarizationItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelInventarizationItem. Получить объект из списка */
	public ENFuelInventarizationItemShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* Сохранить фактическое количество по строкам ведомости */
	public void saveCountFact(ENFuelInventarizationItemShort[] aFuelInventarizationItemList)
	throws java.rmi.RemoteException;

}