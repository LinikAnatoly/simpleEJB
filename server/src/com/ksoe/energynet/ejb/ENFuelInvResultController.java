
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFuelInvResult;
 *
 */

import com.ksoe.energynet.valueobject.ENFuelInvResult;
import com.ksoe.energynet.valueobject.brief.ENFuelInvResultShort;
import com.ksoe.energynet.valueobject.filter.ENFuelInvResultFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelInvResultShortList;


public interface ENFuelInvResultController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFuelInvResultController";

	/* ENFuelInvResult. Добавить */
	public int add(ENFuelInvResult aENFuelInvResult)
			throws java.rmi.RemoteException;

	/* ENFuelInvResult. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFuelInvResult. Изменить */
	public void save(ENFuelInvResult aENFuelInvResult)
			throws java.rmi.RemoteException;

	/* ENFuelInvResult. Получить объект */
	public ENFuelInvResult getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFuelInvResult. Получить полный список */
	public ENFuelInvResultShortList getList()
			throws java.rmi.RemoteException;

	/* ENFuelInvResult. Получить список по фильтру */
	public ENFuelInvResultShortList getFilteredList(
			ENFuelInvResultFilter aENFuelInvResultFilter)
			throws java.rmi.RemoteException;

	/* ENFuelInvResult. Получить список для просмотра */
	public ENFuelInvResultShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInvResult. Получить список для просмотра по фильтру */
	public ENFuelInvResultShortList getScrollableFilteredList(
			ENFuelInvResultFilter aENFuelInvResultFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFuelInvResult. Получить список для просмотра по условию */
	public ENFuelInvResultShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFuelInvResult. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENFuelInvResultFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFuelInvResult. Получить объект из списка */
	public ENFuelInvResultShort getShortObject(int code)
			throws java.rmi.RemoteException;

}