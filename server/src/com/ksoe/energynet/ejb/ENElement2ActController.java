
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENElement2Act;
 *
 */

import com.ksoe.energynet.valueobject.ENElement2Act;
import com.ksoe.energynet.valueobject.lists.ENElement2ActShortList;
import com.ksoe.energynet.valueobject.brief.ENElement2ActShort;
import com.ksoe.energynet.valueobject.filter.ENElement2ActFilter;


public interface ENElement2ActController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENElement2ActController";

	/* ENElement2Act. Добавить */
	public int add(ENElement2Act aENElement2Act)
			throws java.rmi.RemoteException;

	/* ENElement2Act. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;
	
	public void remove(int elementCode, int actCode, int typeCode) throws java.rmi.RemoteException;

	/* ENElement2Act. Изменить */
	public void save(ENElement2Act aENElement2Act)
			throws java.rmi.RemoteException;

	/* ENElement2Act. Получить объект */
	public ENElement2Act getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENElement2Act. Получить полный список */
	public ENElement2ActShortList getList()
			throws java.rmi.RemoteException;

	/* ENElement2Act. Получить список по фильтру */
	public ENElement2ActShortList getFilteredList(
			ENElement2ActFilter aENElement2ActFilter)
			throws java.rmi.RemoteException;

	/* ENElement2Act. Получить список для просмотра */
	public ENElement2ActShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENElement2Act. Получить список для просмотра по фильтру */
	public ENElement2ActShortList getScrollableFilteredList(
			ENElement2ActFilter aENElement2ActFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENElement2Act. Получить список для просмотра по условию */
	public ENElement2ActShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENElement2Act. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENElement2ActFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENElement2Act. Получить объект из списка */
	public ENElement2ActShort getShortObject(int code)
			throws java.rmi.RemoteException;

}