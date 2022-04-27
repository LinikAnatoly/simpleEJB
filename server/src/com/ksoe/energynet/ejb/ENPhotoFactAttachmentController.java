
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENPhotoFactAttachment;
 *
 */

import com.ksoe.energynet.valueobject.ENPhotoFactAttachment;
import com.ksoe.energynet.valueobject.lists.ENPhotoFactAttachmentShortList;
import com.ksoe.energynet.valueobject.brief.ENPhotoFactAttachmentShort;
import com.ksoe.energynet.valueobject.filter.ENPhotoFactAttachmentFilter;


public interface ENPhotoFactAttachmentController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENPhotoFactAttachmentController";

	/* ENPhotoFactAttachment. Добавить */
	public int add(ENPhotoFactAttachment aENPhotoFactAttachment)
			throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. Изменить */
	public void save(ENPhotoFactAttachment aENPhotoFactAttachment)
			throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. Получить объект */
	public ENPhotoFactAttachment getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. Получить полный список */
	public ENPhotoFactAttachmentShortList getList()
			throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. Получить список по фильтру */
	public ENPhotoFactAttachmentShortList getFilteredList(
			ENPhotoFactAttachmentFilter aENPhotoFactAttachmentFilter)
			throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. Получить список для просмотра */
	public ENPhotoFactAttachmentShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. Получить список для просмотра по фильтру */
	public ENPhotoFactAttachmentShortList getScrollableFilteredList(
			ENPhotoFactAttachmentFilter aENPhotoFactAttachmentFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. Получить список для просмотра по условию */
	public ENPhotoFactAttachmentShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENPhotoFactAttachmentFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENPhotoFactAttachment. Получить объект из списка */
	public ENPhotoFactAttachmentShort getShortObject(int code)
			throws java.rmi.RemoteException;

}