
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSOProj2SOConn;
 *
 */

import com.ksoe.energynet.valueobject.ENSOProj2SOConn;
import com.ksoe.energynet.valueobject.brief.ENSOProj2SOConnShort;
import com.ksoe.energynet.valueobject.filter.ENSOProj2SOConnFilter;
import com.ksoe.energynet.valueobject.lists.ENSOProj2SOConnShortList;


public interface ENSOProj2SOConnController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSOProj2SOConnController";

	/* ENSOProj2SOConn. Добавить */
	public int add(ENSOProj2SOConn aENSOProj2SOConn)
			throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. Изменить */
	public void save(ENSOProj2SOConn aENSOProj2SOConn)
			throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. Получить объект */
	public ENSOProj2SOConn getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. Получить полный список */
	public ENSOProj2SOConnShortList getList()
			throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. Получить список по фильтру */
	public ENSOProj2SOConnShortList getFilteredList(
			ENSOProj2SOConnFilter aENSOProj2SOConnFilter)
			throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. Получить список для просмотра */
	public ENSOProj2SOConnShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. Получить список для просмотра по фильтру */
	public ENSOProj2SOConnShortList getScrollableFilteredList(
			ENSOProj2SOConnFilter aENSOProj2SOConnFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. Получить список для просмотра по условию */
	public ENSOProj2SOConnShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSOProj2SOConnFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSOProj2SOConn. Получить объект из списка */
	public ENSOProj2SOConnShort getShortObject(int code)
			throws java.rmi.RemoteException;

}