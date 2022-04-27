
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPItem2ENIPItem;
 *
 */

import com.ksoe.energynet.valueobject.ENIPItem2ENIPItem;
import com.ksoe.energynet.valueobject.brief.ENIPItem2ENIPItemShort;
import com.ksoe.energynet.valueobject.filter.ENIPItem2ENIPItemFilter;
import com.ksoe.energynet.valueobject.lists.ENIPItem2ENIPItemShortList;


public interface ENIPItem2ENIPItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPItem2ENIPItemController";

	/* ENIPItem2ENIPItem. Добавить */
	public int add(ENIPItem2ENIPItem aENIPItem2ENIPItem)
			throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. Изменить */
	public void save(ENIPItem2ENIPItem aENIPItem2ENIPItem)
			throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. Получить объект */
	public ENIPItem2ENIPItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. Получить полный список */
	public ENIPItem2ENIPItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. Получить список по фильтру */
	public ENIPItem2ENIPItemShortList getFilteredList(
			ENIPItem2ENIPItemFilter aENIPItem2ENIPItemFilter)
			throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. Получить список для просмотра */
	public ENIPItem2ENIPItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. Получить список для просмотра по фильтру */
	public ENIPItem2ENIPItemShortList getScrollableFilteredList(
			ENIPItem2ENIPItemFilter aENIPItem2ENIPItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. Получить список для просмотра по условию */
	public ENIPItem2ENIPItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENIPItem2ENIPItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPItem2ENIPItem. Получить объект из списка */
	public ENIPItem2ENIPItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}