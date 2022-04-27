
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENIPItem;
 *
 */

import com.ksoe.energynet.valueobject.ENIPItem;
import com.ksoe.energynet.valueobject.brief.ENIPItemShort;
import com.ksoe.energynet.valueobject.filter.ENIPItemFilter;
import com.ksoe.energynet.valueobject.lists.ENIPItemShortList;


public interface ENIPItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENIPItemController";

	/* ENIPItem. Добавить */
	public int add(ENIPItem aENIPItem)
			throws java.rmi.RemoteException;

	/* ENIPItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENIPItem. Изменить */
	public void save(ENIPItem aENIPItem)
			throws java.rmi.RemoteException;

	/* ENIPItem. Получить объект */
	public ENIPItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENIPItem. Получить полный список */
	public ENIPItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENIPItem. Получить список по фильтру */
	public ENIPItemShortList getFilteredList(
			ENIPItemFilter aENIPItemFilter)
			throws java.rmi.RemoteException;

	/* ENIPItem. Получить список для просмотра */
	public ENIPItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem. Получить список для просмотра по фильтру */
	public ENIPItemShortList getScrollableFilteredList(
			ENIPItemFilter aENIPItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENIPItem. Получить список для просмотра по условию */
	public ENIPItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENIPItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENIPItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENIPItem. Получить объект из списка */
	public ENIPItemShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	
	/* ENIPItem. Изменить суммы для финансирования*/
	public void saveSumInside(ENIPItem aENIPItem)
			throws java.rmi.RemoteException;

	
	/* ENIPItem. Изменить информацию по торгам */
	public void saveinfoTenders(ENIPItem aENIPItem)
			throws java.rmi.RemoteException;
}