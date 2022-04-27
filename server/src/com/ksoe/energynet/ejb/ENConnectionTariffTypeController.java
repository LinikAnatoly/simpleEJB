
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENConnectionTariffType;
 *
 */

import com.ksoe.energynet.valueobject.ENConnectionTariffType;
import com.ksoe.energynet.valueobject.lists.ENConnectionTariffTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENConnectionTariffTypeShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionTariffTypeFilter;


public interface ENConnectionTariffTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENConnectionTariffTypeController";

	/* ENConnectionTariffType. Добавить */
	public int add(ENConnectionTariffType aENConnectionTariffType)
			throws java.rmi.RemoteException;

	/* ENConnectionTariffType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENConnectionTariffType. Изменить */
	public void save(ENConnectionTariffType aENConnectionTariffType)
			throws java.rmi.RemoteException;

	/* ENConnectionTariffType. Получить объект */
	public ENConnectionTariffType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENConnectionTariffType. Получить полный список */
	public ENConnectionTariffTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENConnectionTariffType. Получить список по фильтру */
	public ENConnectionTariffTypeShortList getFilteredList(
			ENConnectionTariffTypeFilter aENConnectionTariffTypeFilter)
			throws java.rmi.RemoteException;

	/* ENConnectionTariffType. Получить список для просмотра */
	public ENConnectionTariffTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionTariffType. Получить список для просмотра по фильтру */
	public ENConnectionTariffTypeShortList getScrollableFilteredList(
			ENConnectionTariffTypeFilter aENConnectionTariffTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionTariffType. Получить список для просмотра по условию */
	public ENConnectionTariffTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENConnectionTariffType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENConnectionTariffTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENConnectionTariffType. Получить объект из списка */
	public ENConnectionTariffTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}