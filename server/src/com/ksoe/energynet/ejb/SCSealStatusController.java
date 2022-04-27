
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for SCSealStatus;
 *
 */

import com.ksoe.energynet.valueobject.SCSealStatus;
import com.ksoe.energynet.valueobject.brief.SCSealStatusShort;
import com.ksoe.energynet.valueobject.filter.SCSealStatusFilter;
import com.ksoe.energynet.valueobject.lists.SCSealStatusShortList;


public interface SCSealStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/SCSealStatusController";

	/* SCSealStatus. Добавить */
	public int add(SCSealStatus aSCSealStatus)
			throws java.rmi.RemoteException;

	/* SCSealStatus. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* SCSealStatus. Изменить */
	public void save(SCSealStatus aSCSealStatus)
			throws java.rmi.RemoteException;

	/* SCSealStatus. Получить объект */
	public SCSealStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* SCSealStatus. Получить полный список */
	public SCSealStatusShortList getList()
			throws java.rmi.RemoteException;

	/* SCSealStatus. Получить список по фильтру */
	public SCSealStatusShortList getFilteredList(
			SCSealStatusFilter aSCSealStatusFilter)
			throws java.rmi.RemoteException;

	/* SCSealStatus. Получить список для просмотра */
	public SCSealStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSealStatus. Получить список для просмотра по фильтру */
	public SCSealStatusShortList getScrollableFilteredList(
			SCSealStatusFilter aSCSealStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSealStatus. Получить список для просмотра по условию */
	public SCSealStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* SCSealStatus. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			SCSealStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* SCSealStatus. Получить объект из списка */
	public SCSealStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}