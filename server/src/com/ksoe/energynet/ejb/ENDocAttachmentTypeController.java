
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttachmentType;
 *
 */

import com.ksoe.energynet.valueobject.ENDocAttachmentType;
import com.ksoe.energynet.valueobject.lists.ENDocAttachmentTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENDocAttachmentTypeShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachmentTypeFilter;


public interface ENDocAttachmentTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDocAttachmentTypeController";

	/* ENDocAttachmentType. Добавить */
	public int add(ENDocAttachmentType aENDocAttachmentType)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDocAttachmentType. Изменить */
	public void save(ENDocAttachmentType aENDocAttachmentType)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentType. Получить объект */
	public ENDocAttachmentType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentType. Получить полный список */
	public ENDocAttachmentTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENDocAttachmentType. Получить список по фильтру */
	public ENDocAttachmentTypeShortList getFilteredList(
			ENDocAttachmentTypeFilter aENDocAttachmentTypeFilter)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentType. Получить список для просмотра */
	public ENDocAttachmentTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentType. Получить список для просмотра по фильтру */
	public ENDocAttachmentTypeShortList getScrollableFilteredList(
			ENDocAttachmentTypeFilter aENDocAttachmentTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentType. Получить список для просмотра по условию */
	public ENDocAttachmentTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENDocAttachmentTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentType. Получить объект из списка */
	public ENDocAttachmentTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}