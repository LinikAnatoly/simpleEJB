
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelDistributionSheetItem;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelDistributionSheetItem;
import com.ksoe.energynet.valueobject.brief.ENFuelDistributionSheetItemShort;
import com.ksoe.energynet.valueobject.filter.ENFuelDistributionSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelDistributionSheetItemShortList;


public interface ENFuelDistributionSheetItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelDistributionSheetItemController";

	/* ENFuelDistributionSheetItem. Добавить */
	public int add(ENFuelDistributionSheetItem aENFuelDistributionSheetItem)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. Изменить */
	public void save(ENFuelDistributionSheetItem aENFuelDistributionSheetItem)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. Получить объект */
	public ENFuelDistributionSheetItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. Получить полный список */
	public ENFuelDistributionSheetItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. Получить список по фильтру */
	public ENFuelDistributionSheetItemShortList getFilteredList(
			ENFuelDistributionSheetItemFilter aENFuelDistributionSheetItemFilter)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. Получить список для просмотра */
	public ENFuelDistributionSheetItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. Получить список для просмотра по фильтру */
	public ENFuelDistributionSheetItemShortList getScrollableFilteredList(
			ENFuelDistributionSheetItemFilter aENFuelDistributionSheetItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. Получить список для просмотра по условию */
	public ENFuelDistributionSheetItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENFuelDistributionSheetItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelDistributionSheetItem. Получить объект из списка */
	public ENFuelDistributionSheetItemShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* количество свободного топлива по декадам для видов деятельности */
	public ENFuelDistributionSheetItemShortList getFreePMM(int ENFuelDistributionSheetCode)throws java.rmi.RemoteException;
	
	/**
	 * 
	 * Утверждение объема поставляемого топлива 
	 * 
	 * @param isConfirmed true - утверждение, false - разутверждение
	 */
	public void setConfirmed(int itemCode, boolean isConfirmed) throws java.rmi.RemoteException;


}