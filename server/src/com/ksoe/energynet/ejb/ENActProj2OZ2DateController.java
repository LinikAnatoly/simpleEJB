
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActProj2OZ2Date;
 *
 */

import com.ksoe.energynet.valueobject.ENActProj2OZ2Date;
import com.ksoe.energynet.valueobject.brief.ENActProj2OZ2DateShort;
import com.ksoe.energynet.valueobject.filter.ENActProj2OZ2DateFilter;
import com.ksoe.energynet.valueobject.lists.ENActProj2OZ2DateShortList;


public interface ENActProj2OZ2DateController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActProj2OZ2DateController";

	/* ENActProj2OZ2Date. Добавить */
	public int add(ENActProj2OZ2Date aENActProj2OZ2Date)
			throws java.rmi.RemoteException;

	/* ENActProj2OZ2Date. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActProj2OZ2Date. Изменить */
	public void save(ENActProj2OZ2Date aENActProj2OZ2Date)
			throws java.rmi.RemoteException;

	/* ENActProj2OZ2Date. Получить объект */
	public ENActProj2OZ2Date getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActProj2OZ2Date. Получить полный список */
	public ENActProj2OZ2DateShortList getList()
			throws java.rmi.RemoteException;

	/* ENActProj2OZ2Date. Получить список по фильтру */
	public ENActProj2OZ2DateShortList getFilteredList(
			ENActProj2OZ2DateFilter aENActProj2OZ2DateFilter)
			throws java.rmi.RemoteException;

	/* ENActProj2OZ2Date. Получить список для просмотра */
	public ENActProj2OZ2DateShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActProj2OZ2Date. Получить список для просмотра по фильтру */
	public ENActProj2OZ2DateShortList getScrollableFilteredList(
			ENActProj2OZ2DateFilter aENActProj2OZ2DateFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActProj2OZ2Date. Получить список для просмотра по условию */
	public ENActProj2OZ2DateShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActProj2OZ2Date. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENActProj2OZ2DateFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActProj2OZ2Date. Получить объект из списка */
	public ENActProj2OZ2DateShort getShortObject(int code)
			throws java.rmi.RemoteException;

}