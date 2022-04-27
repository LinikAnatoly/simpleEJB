
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttachment;
 *
 */

import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.brief.ENDocAttachmentShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachmentFilter;
import com.ksoe.energynet.valueobject.lists.ENDocAttachmentShortList;


public interface ENDocAttachmentController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDocAttachmentController";

	/* ENDocAttachment. Добавить */
	public int add(ENDocAttachment aENDocAttachment)
			throws java.rmi.RemoteException;

	/* ENDocAttachment. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;
	public void remove(int code, int wfPackCode) throws java.rmi.RemoteException;

	/* ENDocAttachment. Изменить */
	public void save(ENDocAttachment aENDocAttachment)
			throws java.rmi.RemoteException;

	/* ENDocAttachment. Получить объект */
	public ENDocAttachment getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDocAttachment. Получить полный список */
	public ENDocAttachmentShortList getList()
			throws java.rmi.RemoteException;

	/* ENDocAttachment. Получить список по фильтру */
	public ENDocAttachmentShortList getFilteredList(
			ENDocAttachmentFilter aENDocAttachmentFilter)
			throws java.rmi.RemoteException;

	/* ENDocAttachment. Получить список для просмотра */
	public ENDocAttachmentShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachment. Получить список для просмотра по фильтру */
	public ENDocAttachmentShortList getScrollableFilteredList(
			ENDocAttachmentFilter aENDocAttachmentFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;
	public ENDocAttachmentShortList getScrollableFilteredListRestricted(
			int servicesObjectCode,
			ENDocAttachmentFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttachment. Получить список для просмотра по условию */
	public ENDocAttachmentShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDocAttachment. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENDocAttachmentFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttachment. Получить объект из списка */
	public ENDocAttachmentShort getShortObject(int code)
			throws java.rmi.RemoteException;

    /* ENDocAttachment. Получить(прочитать) объект */
    public String readObject(int anObjectCode)
            throws java.rmi.RemoteException;
    
	/* ENDocAttachment. Добавить */
    public int add(ENDocAttachment object, byte[] aFile, String fileName, String dirToCreate)  
    		throws java.rmi.RemoteException;

	/* ENDocAttachment. Добавить */
    public int add(ENDocAttachment object, byte[] aFile, String fileName, String dirToCreate, boolean isForSiteFiles)     		
    		throws java.rmi.RemoteException;
    

}