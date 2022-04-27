
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPowerReliabilityCategory;
 *
 */

import com.ksoe.energynet.valueobject.ENPowerReliabilityCategory;
import com.ksoe.energynet.valueobject.lists.ENPowerReliabilityCategoryShortList;
import com.ksoe.energynet.valueobject.brief.ENPowerReliabilityCategoryShort;
import com.ksoe.energynet.valueobject.filter.ENPowerReliabilityCategoryFilter;


public interface ENPowerReliabilityCategoryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPowerReliabilityCategoryController";

	/* ENPowerReliabilityCategory. Добавить */
	public int add(ENPowerReliabilityCategory aENPowerReliabilityCategory)
			throws java.rmi.RemoteException;

	/* ENPowerReliabilityCategory. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPowerReliabilityCategory. Изменить */
	public void save(ENPowerReliabilityCategory aENPowerReliabilityCategory)
			throws java.rmi.RemoteException;

	/* ENPowerReliabilityCategory. Получить объект */
	public ENPowerReliabilityCategory getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPowerReliabilityCategory. Получить полный список */
	public ENPowerReliabilityCategoryShortList getList()
			throws java.rmi.RemoteException;

	/* ENPowerReliabilityCategory. Получить список по фильтру */
	public ENPowerReliabilityCategoryShortList getFilteredList(
			ENPowerReliabilityCategoryFilter aENPowerReliabilityCategoryFilter)
			throws java.rmi.RemoteException;

	/* ENPowerReliabilityCategory. Получить список для просмотра */
	public ENPowerReliabilityCategoryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPowerReliabilityCategory. Получить список для просмотра по фильтру */
	public ENPowerReliabilityCategoryShortList getScrollableFilteredList(
			ENPowerReliabilityCategoryFilter aENPowerReliabilityCategoryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPowerReliabilityCategory. Получить список для просмотра по условию */
	public ENPowerReliabilityCategoryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPowerReliabilityCategory. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENPowerReliabilityCategoryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPowerReliabilityCategory. Получить объект из списка */
	public ENPowerReliabilityCategoryShort getShortObject(int code)
			throws java.rmi.RemoteException;

}