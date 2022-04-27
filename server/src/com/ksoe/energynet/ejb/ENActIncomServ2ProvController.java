
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActIncomServ2Prov;
 *
 */

import com.ksoe.energynet.valueobject.ENActIncomServ2Prov;
import com.ksoe.energynet.valueobject.lists.ENActIncomServ2ProvShortList;
import com.ksoe.energynet.valueobject.brief.ENActIncomServ2ProvShort;
import com.ksoe.energynet.valueobject.filter.ENActIncomServ2ProvFilter;


public interface ENActIncomServ2ProvController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActIncomServ2ProvController";

	/* ENActIncomServ2Prov. Добавить */
	public int add(ENActIncomServ2Prov aENActIncomServ2Prov)
			throws java.rmi.RemoteException;

	/* ENActIncomServ2Prov. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActIncomServ2Prov. Изменить */
	public void save(ENActIncomServ2Prov aENActIncomServ2Prov)
			throws java.rmi.RemoteException;

	/* ENActIncomServ2Prov. Получить объект */
	public ENActIncomServ2Prov getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActIncomServ2Prov. Получить полный список */
	public ENActIncomServ2ProvShortList getList()
			throws java.rmi.RemoteException;

	/* ENActIncomServ2Prov. Получить список по фильтру */
	public ENActIncomServ2ProvShortList getFilteredList(
			ENActIncomServ2ProvFilter aENActIncomServ2ProvFilter)
			throws java.rmi.RemoteException;

	/* ENActIncomServ2Prov. Получить список для просмотра */
	public ENActIncomServ2ProvShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomServ2Prov. Получить список для просмотра по фильтру */
	public ENActIncomServ2ProvShortList getScrollableFilteredList(
			ENActIncomServ2ProvFilter aENActIncomServ2ProvFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActIncomServ2Prov. Получить список для просмотра по условию */
	public ENActIncomServ2ProvShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActIncomServ2Prov. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENActIncomServ2ProvFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActIncomServ2Prov. Получить объект из списка */
	public ENActIncomServ2ProvShort getShortObject(int code)
			throws java.rmi.RemoteException;

}