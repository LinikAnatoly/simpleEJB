
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPItemStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENIPItemStatus;
import com.ksoe.energynet.valueobject.brief.ENIPItemStatusShort;
import com.ksoe.energynet.valueobject.filter.ENIPItemStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENIPItemStatusShortList;


public interface ENIPItemStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPItemStatusController";

	/* ENIPItemStatus. Добавить */
	public int add(ENIPItemStatus aENIPItemStatus)
			throws java.rmi.RemoteException;

	/* ENIPItemStatus. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPItemStatus. Изменить */
	public void save(ENIPItemStatus aENIPItemStatus)
			throws java.rmi.RemoteException;

	/* ENIPItemStatus. Получить объект */
	public ENIPItemStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPItemStatus. Получить полный список */
	public ENIPItemStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPItemStatus. Получить список по фильтру */
	public ENIPItemStatusShortList getFilteredList(
			ENIPItemStatusFilter aENIPItemStatusFilter)
			throws java.rmi.RemoteException;

	/* ENIPItemStatus. Получить список для просмотра */
	public ENIPItemStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItemStatus. Получить список для просмотра по фильтру */
	public ENIPItemStatusShortList getScrollableFilteredList(
			ENIPItemStatusFilter aENIPItemStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItemStatus. Получить список для просмотра по условию */
	public ENIPItemStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPItemStatus. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENIPItemStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPItemStatus. Получить объект из списка */
	public ENIPItemStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}