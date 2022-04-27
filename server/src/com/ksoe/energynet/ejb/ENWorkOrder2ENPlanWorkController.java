//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork;
import com.ksoe.energynet.valueobject.filter.ENWorkOrder2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrder2ENPlanWorkShortList;

public interface ENWorkOrder2ENPlanWorkController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWorkOrder2ENPlanWorkController";

	/* ENWorkOrder2ENPlanWork. Добавить */
	public int add(ENWorkOrder2ENPlanWork aENWorkOrder2ENPlanWork)
			throws java.rmi.RemoteException;

	/* ENWorkOrder2ENPlanWork. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENWorkOrder2ENPlanWork. Изменить */
	public void save(ENWorkOrder2ENPlanWork aENWorkOrder2ENPlanWork)
			throws java.rmi.RemoteException;

	/* ENWorkOrder2ENPlanWork. Получить объект */
	public ENWorkOrder2ENPlanWork getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENWorkOrder2ENPlanWork. Получить полный список */
	public ENWorkOrder2ENPlanWorkShortList getList()
			throws java.rmi.RemoteException;

	/* ENWorkOrder2ENPlanWork. Получить список по фильтру */
	public ENWorkOrder2ENPlanWorkShortList getFilteredList(
			ENWorkOrder2ENPlanWorkFilter aENWorkOrder2ENPlanWorkFilter)
			throws java.rmi.RemoteException;

	/* ENWorkOrder2ENPlanWork. Получить список для просмотра */
	public ENWorkOrder2ENPlanWorkShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrder2ENPlanWork. Получить список для просмотра по фильтру */
	public ENWorkOrder2ENPlanWorkShortList getScrollableFilteredList(
			ENWorkOrder2ENPlanWorkFilter aEPActFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrder2ENPlanWork. Получить список для просмотра по условию */
	public ENWorkOrder2ENPlanWorkShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENWorkOrder2ENPlanWork. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENWorkOrder2ENPlanWorkFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENWorkOrder2ENPlanWorkController. Получить список ПК-кодов планов по фильтру */
	public int[] getPlanCodeArray(ENWorkOrder2ENPlanWorkFilter filterObject,
			int fromPosition, int quantity) throws java.rmi.RemoteException;
	
	/* ENWorkOrder2ENPlanWork. Добавить с проверкой */
	public int addWithCheck(ENWorkOrder2ENPlanWork ENWorkOrder2ENPlanWork, boolean checkFinworkerTime)
			throws java.rmi.RemoteException;

}