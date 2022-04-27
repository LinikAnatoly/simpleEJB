
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActIncome2Prov;
 *
 */

import com.ksoe.energynet.valueobject.ENActIncome2Prov;
import com.ksoe.energynet.valueobject.lists.ENActIncome2ProvShortList;
import com.ksoe.energynet.valueobject.brief.ENActIncome2ProvShort;
import com.ksoe.energynet.valueobject.filter.ENActIncome2ProvFilter;


public interface ENActIncome2ProvController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActIncome2ProvController";

	/* ENActIncome2Prov. Добавить */
	public int add(ENActIncome2Prov aENActIncome2Prov)
			throws java.rmi.RemoteException;

	/* ENActIncome2Prov. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActIncome2Prov. Изменить */
	public void save(ENActIncome2Prov aENActIncome2Prov)
			throws java.rmi.RemoteException;

	/* ENActIncome2Prov. Получить объект */
	public ENActIncome2Prov getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActIncome2Prov. Получить полный список */
	public ENActIncome2ProvShortList getList()
			throws java.rmi.RemoteException;

	/* ENActIncome2Prov. Получить список по фильтру */
	public ENActIncome2ProvShortList getFilteredList(
			ENActIncome2ProvFilter aENActIncome2ProvFilter)
			throws java.rmi.RemoteException;

	/* ENActIncome2Prov. Получить список для просмотра */
	public ENActIncome2ProvShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncome2Prov. Получить список для просмотра по фильтру */
	public ENActIncome2ProvShortList getScrollableFilteredList(
			ENActIncome2ProvFilter aENActIncome2ProvFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncome2Prov. Получить список для просмотра по условию */
	public ENActIncome2ProvShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActIncome2Prov. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENActIncome2ProvFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActIncome2Prov. Получить объект из списка */
	public ENActIncome2ProvShort getShortObject(int code)
			throws java.rmi.RemoteException;

}