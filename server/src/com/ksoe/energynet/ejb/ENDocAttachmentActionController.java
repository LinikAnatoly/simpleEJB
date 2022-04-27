
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttachmentAction;
 *
 */

import com.ksoe.energynet.valueobject.ENDocAttachmentAction;
import com.ksoe.energynet.valueobject.lists.ENDocAttachmentActionShortList;
import com.ksoe.energynet.valueobject.brief.ENDocAttachmentActionShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachmentActionFilter;


public interface ENDocAttachmentActionController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDocAttachmentActionController";

	/* ENDocAttachmentAction. Добавить */
	public int add(ENDocAttachmentAction aENDocAttachmentAction)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. Изменить */
	public void save(ENDocAttachmentAction aENDocAttachmentAction)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. Получить объект */
	public ENDocAttachmentAction getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. Получить полный список */
	public ENDocAttachmentActionShortList getList()
			throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. Получить список по фильтру */
	public ENDocAttachmentActionShortList getFilteredList(
			ENDocAttachmentActionFilter aENDocAttachmentActionFilter)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. Получить список для просмотра */
	public ENDocAttachmentActionShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. Получить список для просмотра по фильтру */
	public ENDocAttachmentActionShortList getScrollableFilteredList(
			ENDocAttachmentActionFilter aENDocAttachmentActionFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. Получить список для просмотра по условию */
	public ENDocAttachmentActionShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENDocAttachmentActionFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttachmentAction. Получить объект из списка */
	public ENDocAttachmentActionShort getShortObject(int code)
			throws java.rmi.RemoteException;

}