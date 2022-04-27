
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENNormativeVolumeAVZ;
 *
 */

import com.ksoe.energynet.valueobject.ENNormativeVolumeAVZ;
import com.ksoe.energynet.valueobject.brief.ENNormativeVolumeAVZShort;
import com.ksoe.energynet.valueobject.filter.ENNormativeVolumeAVZFilter;
import com.ksoe.energynet.valueobject.lists.ENNormativeVolumeAVZShortList;


public interface ENNormativeVolumeAVZController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENNormativeVolumeAVZController";

	/* ENNormativeVolumeAVZ. Добавить */
	public int add(ENNormativeVolumeAVZ aENNormativeVolumeAVZ)
			throws java.rmi.RemoteException;

	/* ENNormativeVolumeAVZ. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENNormativeVolumeAVZ. Изменить */
	public void save(ENNormativeVolumeAVZ aENNormativeVolumeAVZ)
			throws java.rmi.RemoteException;

	/* ENNormativeVolumeAVZ. Получить объект */
	public ENNormativeVolumeAVZ getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENNormativeVolumeAVZ. Получить полный список */
	public ENNormativeVolumeAVZShortList getList()
			throws java.rmi.RemoteException;

	/* ENNormativeVolumeAVZ. Получить список по фильтру */
	public ENNormativeVolumeAVZShortList getFilteredList(
			ENNormativeVolumeAVZFilter aENNormativeVolumeAVZFilter)
			throws java.rmi.RemoteException;

	/* ENNormativeVolumeAVZ. Получить список для просмотра */
	public ENNormativeVolumeAVZShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENNormativeVolumeAVZ. Получить список для просмотра по фильтру */
	public ENNormativeVolumeAVZShortList getScrollableFilteredList(
			ENNormativeVolumeAVZFilter aENNormativeVolumeAVZFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENNormativeVolumeAVZ. Получить список для просмотра по условию */
	public ENNormativeVolumeAVZShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENNormativeVolumeAVZ. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENNormativeVolumeAVZFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENNormativeVolumeAVZ. Получить объект из списка */
	public ENNormativeVolumeAVZShort getShortObject(int code)
			throws java.rmi.RemoteException;

}