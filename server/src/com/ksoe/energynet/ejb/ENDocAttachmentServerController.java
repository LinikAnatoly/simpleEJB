
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttachmentServer;
 *
 */

import com.ksoe.energynet.valueobject.ENDocAttachmentServer;
import com.ksoe.energynet.valueobject.lists.ENDocAttachmentServerShortList;
import com.ksoe.energynet.valueobject.brief.ENDocAttachmentServerShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachmentServerFilter;


public interface ENDocAttachmentServerController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDocAttachmentServerController";

	/* ENDocAttachmentServer. Добавить */
	public int add(ENDocAttachmentServer aENDocAttachmentServer)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. Изменить */
	public void save(ENDocAttachmentServer aENDocAttachmentServer)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. Получить объект */
	public ENDocAttachmentServer getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. Получить полный список */
	public ENDocAttachmentServerShortList getList()
			throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. Получить список по фильтру */
	public ENDocAttachmentServerShortList getFilteredList(
			ENDocAttachmentServerFilter aENDocAttachmentServerFilter)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. Получить список для просмотра */
	public ENDocAttachmentServerShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. Получить список для просмотра по фильтру */
	public ENDocAttachmentServerShortList getScrollableFilteredList(
			ENDocAttachmentServerFilter aENDocAttachmentServerFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. Получить список для просмотра по условию */
	public ENDocAttachmentServerShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENDocAttachmentServerFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentServer. Получить объект из списка */
	public ENDocAttachmentServerShort getShortObject(int code)
			throws java.rmi.RemoteException;

}