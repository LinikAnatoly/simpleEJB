
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENConnectionLineType;
 *
 */

import com.ksoe.energynet.valueobject.ENConnectionLineType;
import com.ksoe.energynet.valueobject.lists.ENConnectionLineTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENConnectionLineTypeShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionLineTypeFilter;


public interface ENConnectionLineTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENConnectionLineTypeController";

	/* ENConnectionLineType. Добавить */
	public int add(ENConnectionLineType aENConnectionLineType)
			throws java.rmi.RemoteException;

	/* ENConnectionLineType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENConnectionLineType. Изменить */
	public void save(ENConnectionLineType aENConnectionLineType)
			throws java.rmi.RemoteException;

	/* ENConnectionLineType. Получить объект */
	public ENConnectionLineType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENConnectionLineType. Получить полный список */
	public ENConnectionLineTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENConnectionLineType. Получить список по фильтру */
	public ENConnectionLineTypeShortList getFilteredList(
			ENConnectionLineTypeFilter aENConnectionLineTypeFilter)
			throws java.rmi.RemoteException;

	/* ENConnectionLineType. Получить список для просмотра */
	public ENConnectionLineTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionLineType. Получить список для просмотра по фильтру */
	public ENConnectionLineTypeShortList getScrollableFilteredList(
			ENConnectionLineTypeFilter aENConnectionLineTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENConnectionLineType. Получить список для просмотра по условию */
	public ENConnectionLineTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENConnectionLineType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENConnectionLineTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENConnectionLineType. Получить объект из списка */
	public ENConnectionLineTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}