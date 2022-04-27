
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENServFromSide2PlanWork;
 *
 */

import com.ksoe.energynet.valueobject.ENServFromSide2PlanWork;
import com.ksoe.energynet.valueobject.lists.ENServFromSide2PlanWorkShortList;
import com.ksoe.energynet.valueobject.brief.ENServFromSide2PlanWorkShort;
import com.ksoe.energynet.valueobject.filter.ENServFromSide2PlanWorkFilter;


public interface ENServFromSide2PlanWorkController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENServFromSide2PlanWorkController";

	/* ENServFromSide2PlanWork. Добавить */
	public int add(ENServFromSide2PlanWork aENServFromSide2PlanWork)
			throws java.rmi.RemoteException;

	/* ENServFromSide2PlanWork. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENServFromSide2PlanWork. Изменить */
	public void save(ENServFromSide2PlanWork aENServFromSide2PlanWork)
			throws java.rmi.RemoteException;

	/* ENServFromSide2PlanWork. Получить объект */
	public ENServFromSide2PlanWork getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENServFromSide2PlanWork. Получить полный список */
	public ENServFromSide2PlanWorkShortList getList()
			throws java.rmi.RemoteException;

	/* ENServFromSide2PlanWork. Получить список по фильтру */
	public ENServFromSide2PlanWorkShortList getFilteredList(
			ENServFromSide2PlanWorkFilter aENServFromSide2PlanWorkFilter)
			throws java.rmi.RemoteException;

	/* ENServFromSide2PlanWork. Получить список для просмотра */
	public ENServFromSide2PlanWorkShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServFromSide2PlanWork. Получить список для просмотра по фильтру */
	public ENServFromSide2PlanWorkShortList getScrollableFilteredList(
			ENServFromSide2PlanWorkFilter aENServFromSide2PlanWorkFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENServFromSide2PlanWork. Получить список для просмотра по условию */
	public ENServFromSide2PlanWorkShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENServFromSide2PlanWork. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENServFromSide2PlanWorkFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENServFromSide2PlanWork. Получить объект из списка */
	public ENServFromSide2PlanWorkShort getShortObject(int code)
			throws java.rmi.RemoteException;

}