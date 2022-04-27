
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENCalcAdditionalItemType;
 *
 */

import com.ksoe.energynet.valueobject.ENCalcAdditionalItemType;
import com.ksoe.energynet.valueobject.lists.ENCalcAdditionalItemTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENCalcAdditionalItemTypeShort;
import com.ksoe.energynet.valueobject.filter.ENCalcAdditionalItemTypeFilter;


public interface ENCalcAdditionalItemTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENCalcAdditionalItemTypeController";

	/* ENCalcAdditionalItemType. Добавить */
	public int add(ENCalcAdditionalItemType aENCalcAdditionalItemType)
			throws java.rmi.RemoteException;

	/* ENCalcAdditionalItemType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENCalcAdditionalItemType. Изменить */
	public void save(ENCalcAdditionalItemType aENCalcAdditionalItemType)
			throws java.rmi.RemoteException;

	/* ENCalcAdditionalItemType. Получить объект */
	public ENCalcAdditionalItemType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENCalcAdditionalItemType. Получить полный список */
	public ENCalcAdditionalItemTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENCalcAdditionalItemType. Получить список по фильтру */
	public ENCalcAdditionalItemTypeShortList getFilteredList(
			ENCalcAdditionalItemTypeFilter aENCalcAdditionalItemTypeFilter)
			throws java.rmi.RemoteException;

	/* ENCalcAdditionalItemType. Получить список для просмотра */
	public ENCalcAdditionalItemTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCalcAdditionalItemType. Получить список для просмотра по фильтру */
	public ENCalcAdditionalItemTypeShortList getScrollableFilteredList(
			ENCalcAdditionalItemTypeFilter aENCalcAdditionalItemTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENCalcAdditionalItemType. Получить список для просмотра по условию */
	public ENCalcAdditionalItemTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENCalcAdditionalItemType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENCalcAdditionalItemTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENCalcAdditionalItemType. Получить объект из списка */
	public ENCalcAdditionalItemTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}