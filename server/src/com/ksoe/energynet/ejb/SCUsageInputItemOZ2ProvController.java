
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for SCUsageInputItemOZ2Prov;
 *
 */

import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2Prov;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZ2ProvShortList;
import com.ksoe.energynet.valueobject.brief.SCUsageInputItemOZ2ProvShort;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2ProvFilter;


public interface SCUsageInputItemOZ2ProvController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/SCUsageInputItemOZ2ProvController";

	/* SCUsageInputItemOZ2Prov. Добавить */
	public int add(SCUsageInputItemOZ2Prov aSCUsageInputItemOZ2Prov)
			throws java.rmi.RemoteException;

	/* SCUsageInputItemOZ2Prov. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* SCUsageInputItemOZ2Prov. Изменить */
	public void save(SCUsageInputItemOZ2Prov aSCUsageInputItemOZ2Prov)
			throws java.rmi.RemoteException;

	/* SCUsageInputItemOZ2Prov. Получить объект */
	public SCUsageInputItemOZ2Prov getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* SCUsageInputItemOZ2Prov. Получить полный список */
	public SCUsageInputItemOZ2ProvShortList getList()
			throws java.rmi.RemoteException;

	/* SCUsageInputItemOZ2Prov. Получить список по фильтру */
	public SCUsageInputItemOZ2ProvShortList getFilteredList(
			SCUsageInputItemOZ2ProvFilter aSCUsageInputItemOZ2ProvFilter)
			throws java.rmi.RemoteException;

	/* SCUsageInputItemOZ2Prov. Получить список для просмотра */
	public SCUsageInputItemOZ2ProvShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCUsageInputItemOZ2Prov. Получить список для просмотра по фильтру */
	public SCUsageInputItemOZ2ProvShortList getScrollableFilteredList(
			SCUsageInputItemOZ2ProvFilter aSCUsageInputItemOZ2ProvFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCUsageInputItemOZ2Prov. Получить список для просмотра по условию */
	public SCUsageInputItemOZ2ProvShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* SCUsageInputItemOZ2Prov. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			SCUsageInputItemOZ2ProvFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* SCUsageInputItemOZ2Prov. Получить объект из списка */
	public SCUsageInputItemOZ2ProvShort getShortObject(int code)
			throws java.rmi.RemoteException;

}