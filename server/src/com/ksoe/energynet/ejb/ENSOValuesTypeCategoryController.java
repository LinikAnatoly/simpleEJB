
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSOValuesTypeCategory;
 *
 */

import com.ksoe.energynet.valueobject.ENSOValuesTypeCategory;
import com.ksoe.energynet.valueobject.lists.ENSOValuesTypeCategoryShortList;
import com.ksoe.energynet.valueobject.brief.ENSOValuesTypeCategoryShort;
import com.ksoe.energynet.valueobject.filter.ENSOValuesTypeCategoryFilter;


public interface ENSOValuesTypeCategoryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSOValuesTypeCategoryController";

	/* ENSOValuesTypeCategory. Добавить */
	public int add(ENSOValuesTypeCategory aENSOValuesTypeCategory)
			throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. Изменить */
	public void save(ENSOValuesTypeCategory aENSOValuesTypeCategory)
			throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. Получить объект */
	public ENSOValuesTypeCategory getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. Получить полный список */
	public ENSOValuesTypeCategoryShortList getList()
			throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. Получить список по фильтру */
	public ENSOValuesTypeCategoryShortList getFilteredList(
			ENSOValuesTypeCategoryFilter aENSOValuesTypeCategoryFilter)
			throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. Получить список для просмотра */
	public ENSOValuesTypeCategoryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. Получить список для просмотра по фильтру */
	public ENSOValuesTypeCategoryShortList getScrollableFilteredList(
			ENSOValuesTypeCategoryFilter aENSOValuesTypeCategoryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. Получить список для просмотра по условию */
	public ENSOValuesTypeCategoryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSOValuesTypeCategoryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSOValuesTypeCategory. Получить объект из списка */
	public ENSOValuesTypeCategoryShort getShortObject(int code)
			throws java.rmi.RemoteException;

}