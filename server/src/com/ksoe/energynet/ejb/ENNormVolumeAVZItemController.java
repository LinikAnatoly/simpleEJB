
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENNormVolumeAVZItem;
 *
 */

import com.ksoe.energynet.valueobject.ENNormVolumeAVZItem;
import com.ksoe.energynet.valueobject.brief.ENNormVolumeAVZItemShort;
import com.ksoe.energynet.valueobject.filter.ENNormVolumeAVZItemFilter;
import com.ksoe.energynet.valueobject.lists.ENNormVolumeAVZItemShortList;


public interface ENNormVolumeAVZItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENNormVolumeAVZItemController";

	/* ENNormVolumeAVZItem. Добавить */
	public int add(ENNormVolumeAVZItem aENNormVolumeAVZItem)
			throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. Изменить */
	public void save(ENNormVolumeAVZItem aENNormVolumeAVZItem)
			throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. Получить объект */
	public ENNormVolumeAVZItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. Получить полный список */
	public ENNormVolumeAVZItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. Получить список по фильтру */
	public ENNormVolumeAVZItemShortList getFilteredList(
			ENNormVolumeAVZItemFilter aENNormVolumeAVZItemFilter)
			throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. Получить список для просмотра */
	public ENNormVolumeAVZItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. Получить список для просмотра по фильтру */
	public ENNormVolumeAVZItemShortList getScrollableFilteredList(
			ENNormVolumeAVZItemFilter aENNormVolumeAVZItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. Получить список для просмотра по условию */
	public ENNormVolumeAVZItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENNormVolumeAVZItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENNormVolumeAVZItem. Получить объект из списка */
	public ENNormVolumeAVZItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}