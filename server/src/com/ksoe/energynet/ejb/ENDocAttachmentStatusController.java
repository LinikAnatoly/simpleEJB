
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttachmentStatus;
 *
 */

import com.ksoe.energynet.valueobject.ENDocAttachmentStatus;
import com.ksoe.energynet.valueobject.brief.ENDocAttachmentStatusShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachmentStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENDocAttachmentStatusShortList;


public interface ENDocAttachmentStatusController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDocAttachmentStatusController";

	/* ENDocAttachmentStatus. Добавить */
	public int add(ENDocAttachmentStatus aENDocAttachmentStatus)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentStatus. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDocAttachmentStatus. Изменить */
	public void save(ENDocAttachmentStatus aENDocAttachmentStatus)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentStatus. Получить объект */
	public ENDocAttachmentStatus getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentStatus. Получить полный список */
	public ENDocAttachmentStatusShortList getList()
			throws java.rmi.RemoteException;

	/* ENDocAttachmentStatus. Получить список по фильтру */
	public ENDocAttachmentStatusShortList getFilteredList(
			ENDocAttachmentStatusFilter aENDocAttachmentStatusFilter)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentStatus. Получить список для просмотра */
	public ENDocAttachmentStatusShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentStatus. Получить список для просмотра по фильтру */
	public ENDocAttachmentStatusShortList getScrollableFilteredList(
			ENDocAttachmentStatusFilter aENDocAttachmentStatusFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentStatus. Получить список для просмотра по условию */
	public ENDocAttachmentStatusShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentStatus. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENDocAttachmentStatusFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentStatus. Получить объект из списка */
	public ENDocAttachmentStatusShort getShortObject(int code)
			throws java.rmi.RemoteException;

}