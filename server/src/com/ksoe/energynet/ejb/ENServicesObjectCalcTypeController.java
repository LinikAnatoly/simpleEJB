
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServicesObjectCalcType;
 *
 */

import com.ksoe.energynet.valueobject.ENServicesObjectCalcType;
import com.ksoe.energynet.valueobject.brief.ENServicesObjectCalcTypeShort;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectCalcTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectCalcTypeShortList;


public interface ENServicesObjectCalcTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServicesObjectCalcTypeController";

	/* ENServicesObjectCalcType. Добавить */
	public int add(ENServicesObjectCalcType aENServicesObjectCalcType)
			throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. Изменить */
	public void save(ENServicesObjectCalcType aENServicesObjectCalcType)
			throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. Получить объект */
	public ENServicesObjectCalcType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. Получить полный список */
	public ENServicesObjectCalcTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. Получить список по фильтру */
	public ENServicesObjectCalcTypeShortList getFilteredList(
			ENServicesObjectCalcTypeFilter aENServicesObjectCalcTypeFilter)
			throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. Получить список для просмотра */
	public ENServicesObjectCalcTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. Получить список для просмотра по фильтру */
	public ENServicesObjectCalcTypeShortList getScrollableFilteredList(
			ENServicesObjectCalcTypeFilter aENServicesObjectCalcTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. Получить список для просмотра по условию */
	public ENServicesObjectCalcTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENServicesObjectCalcTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServicesObjectCalcType. Получить объект из списка */
	public ENServicesObjectCalcTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}