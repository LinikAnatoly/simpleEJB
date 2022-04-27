
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for SCSealType;
 *
 */

import com.ksoe.energynet.valueobject.SCSealType;
import com.ksoe.energynet.valueobject.brief.SCSealTypeShort;
import com.ksoe.energynet.valueobject.filter.SCSealTypeFilter;
import com.ksoe.energynet.valueobject.lists.SCSealTypeShortList;


public interface SCSealTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/SCSealTypeController";

	/* SCSealType. Добавить */
	public int add(SCSealType aSCSealType)
			throws java.rmi.RemoteException;

	/* SCSealType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* SCSealType. Изменить */
	public void save(SCSealType aSCSealType)
			throws java.rmi.RemoteException;

	/* SCSealType. Получить объект */
	public SCSealType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* SCSealType. Получить полный список */
	public SCSealTypeShortList getList()
			throws java.rmi.RemoteException;

	/* SCSealType. Получить список по фильтру */
	public SCSealTypeShortList getFilteredList(
			SCSealTypeFilter aSCSealTypeFilter)
			throws java.rmi.RemoteException;

	/* SCSealType. Получить список для просмотра */
	public SCSealTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSealType. Получить список для просмотра по фильтру */
	public SCSealTypeShortList getScrollableFilteredList(
			SCSealTypeFilter aSCSealTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSealType. Получить список для просмотра по условию */
	public SCSealTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* SCSealType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			SCSealTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* SCSealType. Получить объект из списка */
	public SCSealTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}