
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for SCSeal2WorkOrderBytKind;
 *
 */

import com.ksoe.energynet.valueobject.SCSeal2WorkOrderBytKind;
import com.ksoe.energynet.valueobject.brief.SCSeal2WorkOrderBytKindShort;
import com.ksoe.energynet.valueobject.filter.SCSeal2WorkOrderBytKindFilter;
import com.ksoe.energynet.valueobject.lists.SCSeal2WorkOrderBytKindShortList;


public interface SCSeal2WorkOrderBytKindController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/SCSeal2WorkOrderBytKindController";

	/* SCSeal2WorkOrderBytKind. Добавить */
	public int add(SCSeal2WorkOrderBytKind aSCSeal2WorkOrderBytKind)
			throws java.rmi.RemoteException;

	/* SCSeal2WorkOrderBytKind. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* SCSeal2WorkOrderBytKind. Изменить */
	public void save(SCSeal2WorkOrderBytKind aSCSeal2WorkOrderBytKind)
			throws java.rmi.RemoteException;

	/* SCSeal2WorkOrderBytKind. Получить объект */
	public SCSeal2WorkOrderBytKind getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* SCSeal2WorkOrderBytKind. Получить полный список */
	public SCSeal2WorkOrderBytKindShortList getList()
			throws java.rmi.RemoteException;

	/* SCSeal2WorkOrderBytKind. Получить список по фильтру */
	public SCSeal2WorkOrderBytKindShortList getFilteredList(
			SCSeal2WorkOrderBytKindFilter aSCSeal2WorkOrderBytKindFilter)
			throws java.rmi.RemoteException;

	/* SCSeal2WorkOrderBytKind. Получить список для просмотра */
	public SCSeal2WorkOrderBytKindShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSeal2WorkOrderBytKind. Получить список для просмотра по фильтру */
	public SCSeal2WorkOrderBytKindShortList getScrollableFilteredList(
			SCSeal2WorkOrderBytKindFilter aSCSeal2WorkOrderBytKindFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSeal2WorkOrderBytKind. Получить список для просмотра по условию */
	public SCSeal2WorkOrderBytKindShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* SCSeal2WorkOrderBytKind. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			SCSeal2WorkOrderBytKindFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* SCSeal2WorkOrderBytKind. Получить объект из списка */
	public SCSeal2WorkOrderBytKindShort getShortObject(int code)
			throws java.rmi.RemoteException;

}