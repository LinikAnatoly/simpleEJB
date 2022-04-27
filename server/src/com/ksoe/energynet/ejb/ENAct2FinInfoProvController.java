
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAct2FinInfoProv;
 *
 */

import com.ksoe.energynet.valueobject.ENAct2FinInfoProv;
import com.ksoe.energynet.valueobject.lists.ENAct2FinInfoProvShortList;
import com.ksoe.energynet.valueobject.brief.ENAct2FinInfoProvShort;
import com.ksoe.energynet.valueobject.filter.ENAct2FinInfoProvFilter;


public interface ENAct2FinInfoProvController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAct2FinInfoProvController";

	/* ENAct2FinInfoProv. Добавить */
	public int add(ENAct2FinInfoProv aENAct2FinInfoProv)
			throws java.rmi.RemoteException;

	/* ENAct2FinInfoProv. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAct2FinInfoProv. Изменить */
	public void save(ENAct2FinInfoProv aENAct2FinInfoProv)
			throws java.rmi.RemoteException;

	/* ENAct2FinInfoProv. Получить объект */
	public ENAct2FinInfoProv getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAct2FinInfoProv. Получить полный список */
	public ENAct2FinInfoProvShortList getList()
			throws java.rmi.RemoteException;

	/* ENAct2FinInfoProv. Получить список по фильтру */
	public ENAct2FinInfoProvShortList getFilteredList(
			ENAct2FinInfoProvFilter aENAct2FinInfoProvFilter)
			throws java.rmi.RemoteException;

	/* ENAct2FinInfoProv. Получить список для просмотра */
	public ENAct2FinInfoProvShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2FinInfoProv. Получить список для просмотра по фильтру */
	public ENAct2FinInfoProvShortList getScrollableFilteredList(
			ENAct2FinInfoProvFilter aENAct2FinInfoProvFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2FinInfoProv. Получить список для просмотра по условию */
	public ENAct2FinInfoProvShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAct2FinInfoProv. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENAct2FinInfoProvFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAct2FinInfoProv. Получить объект из списка */
	public ENAct2FinInfoProvShort getShortObject(int code)
			throws java.rmi.RemoteException;

}