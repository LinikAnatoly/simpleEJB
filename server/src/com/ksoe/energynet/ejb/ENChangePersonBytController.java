
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENChangePersonByt;
 *
 */

import com.ksoe.energynet.valueobject.ENChangePersonByt;
import com.ksoe.energynet.valueobject.brief.ENChangePersonBytShort;
import com.ksoe.energynet.valueobject.filter.ENChangePersonBytFilter;
import com.ksoe.energynet.valueobject.lists.ENChangePersonBytShortList;


public interface ENChangePersonBytController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENChangePersonBytController";

	/* ENChangePersonByt. Добавить */
	public int add(ENChangePersonByt aENChangePersonByt)
			throws java.rmi.RemoteException;

	/* ENChangePersonByt. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENChangePersonByt. Изменить */
	public void save(ENChangePersonByt aENChangePersonByt)
			throws java.rmi.RemoteException;

	/* ENChangePersonByt. Получить объект */
	public ENChangePersonByt getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENChangePersonByt. Получить полный список */
	public ENChangePersonBytShortList getList()
			throws java.rmi.RemoteException;

	/* ENChangePersonByt. Получить список по фильтру */
	public ENChangePersonBytShortList getFilteredList(
			ENChangePersonBytFilter aENChangePersonBytFilter)
			throws java.rmi.RemoteException;

	/* ENChangePersonByt. Получить список для просмотра */
	public ENChangePersonBytShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENChangePersonByt. Получить список для просмотра по фильтру */
	public ENChangePersonBytShortList getScrollableFilteredList(
			ENChangePersonBytFilter aENChangePersonBytFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENChangePersonByt. Получить список для просмотра по условию */
	public ENChangePersonBytShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENChangePersonByt. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENChangePersonBytFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENChangePersonByt. Получить объект из списка */
	public ENChangePersonBytShort getShortObject(int code)
			throws java.rmi.RemoteException;

}