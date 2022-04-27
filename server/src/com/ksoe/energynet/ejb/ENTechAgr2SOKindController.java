
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTechAgr2SOKind;
 *
 */

import com.ksoe.energynet.valueobject.ENTechAgr2SOKind;
import com.ksoe.energynet.valueobject.brief.ENTechAgr2SOKindShort;
import com.ksoe.energynet.valueobject.filter.ENTechAgr2SOKindFilter;
import com.ksoe.energynet.valueobject.lists.ENTechAgr2SOKindShortList;


public interface ENTechAgr2SOKindController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTechAgr2SOKindController";

	/* ENTechAgr2SOKind. Добавить */
	public int add(ENTechAgr2SOKind aENTechAgr2SOKind)
			throws java.rmi.RemoteException;

	/* ENTechAgr2SOKind. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTechAgr2SOKind. Изменить */
	public void save(ENTechAgr2SOKind aENTechAgr2SOKind)
			throws java.rmi.RemoteException;

	/* ENTechAgr2SOKind. Получить объект */
	public ENTechAgr2SOKind getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTechAgr2SOKind. Получить полный список */
	public ENTechAgr2SOKindShortList getList()
			throws java.rmi.RemoteException;

	/* ENTechAgr2SOKind. Получить список по фильтру */
	public ENTechAgr2SOKindShortList getFilteredList(
			ENTechAgr2SOKindFilter aENTechAgr2SOKindFilter)
			throws java.rmi.RemoteException;

	/* ENTechAgr2SOKind. Получить список для просмотра */
	public ENTechAgr2SOKindShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTechAgr2SOKind. Получить список для просмотра по фильтру */
	public ENTechAgr2SOKindShortList getScrollableFilteredList(
			ENTechAgr2SOKindFilter aENTechAgr2SOKindFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTechAgr2SOKind. Получить список для просмотра по условию */
	public ENTechAgr2SOKindShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTechAgr2SOKind. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENTechAgr2SOKindFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTechAgr2SOKind. Получить объект из списка */
	public ENTechAgr2SOKindShort getShortObject(int code)
			throws java.rmi.RemoteException;

}