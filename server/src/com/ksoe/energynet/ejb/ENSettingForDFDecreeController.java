
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSettingForDFDecree;
 *
 */

import com.ksoe.energynet.valueobject.ENSettingForDFDecree;
import com.ksoe.energynet.valueobject.lists.ENSettingForDFDecreeShortList;
import com.ksoe.energynet.valueobject.brief.ENSettingForDFDecreeShort;
import com.ksoe.energynet.valueobject.filter.ENSettingForDFDecreeFilter;


public interface ENSettingForDFDecreeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSettingForDFDecreeController";

	/* ENSettingForDFDecree. Добавить */
	public int add(ENSettingForDFDecree aENSettingForDFDecree)
			throws java.rmi.RemoteException;

	/* ENSettingForDFDecree. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSettingForDFDecree. Изменить */
	public void save(ENSettingForDFDecree aENSettingForDFDecree)
			throws java.rmi.RemoteException;

	/* ENSettingForDFDecree. Получить объект */
	public ENSettingForDFDecree getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSettingForDFDecree. Получить полный список */
	public ENSettingForDFDecreeShortList getList()
			throws java.rmi.RemoteException;

	/* ENSettingForDFDecree. Получить список по фильтру */
	public ENSettingForDFDecreeShortList getFilteredList(
			ENSettingForDFDecreeFilter aENSettingForDFDecreeFilter)
			throws java.rmi.RemoteException;

	/* ENSettingForDFDecree. Получить список для просмотра */
	public ENSettingForDFDecreeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSettingForDFDecree. Получить список для просмотра по фильтру */
	public ENSettingForDFDecreeShortList getScrollableFilteredList(
			ENSettingForDFDecreeFilter aENSettingForDFDecreeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSettingForDFDecree. Получить список для просмотра по условию */
	public ENSettingForDFDecreeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSettingForDFDecree. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSettingForDFDecreeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSettingForDFDecree. Получить объект из списка */
	public ENSettingForDFDecreeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}