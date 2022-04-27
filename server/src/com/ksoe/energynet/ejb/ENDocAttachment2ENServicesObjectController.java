
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttachment2ENServicesObject;
 *
 */

import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachment2ENServicesObject;
import com.ksoe.energynet.valueobject.brief.ENDocAttachment2ENServicesObjectShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachment2ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENDocAttachment2ENServicesObjectShortList;


public interface ENDocAttachment2ENServicesObjectController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDocAttachment2ENServicesObjectController";

	/* ENDocAttachment2ENServicesObject. Добавить */
	public int add(ENDocAttachment object, byte[] aFile, String fileName,
			int soCode) throws java.rmi.RemoteException;

	public int add(ENDocAttachment object, byte[] aFile, String fileName,
			int soCode, int kindCode) throws java.rmi.RemoteException;
	
    public int add(ENDocAttachment object, byte[] aFile, String fileName, int soCode, int kindCode, boolean isForSiteFiles) 
    		throws java.rmi.RemoteException;

    public int add(ENDocAttachment object, byte[] aFile, String fileName, int soCode, int kindCode, boolean isForSiteFiles, int atmCode)
    		throws java.rmi.RemoteException;

	/* ENDocAttachment2ENServicesObject. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDocAttachment2ENServicesObject. Изменить */
	public void save(ENDocAttachment2ENServicesObject aENDocAttachment2ENServicesObject)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2ENServicesObject. Получить объект */
	public ENDocAttachment2ENServicesObject getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2ENServicesObject. Получить полный список */
	public ENDocAttachment2ENServicesObjectShortList getList()
			throws java.rmi.RemoteException;

	/* ENDocAttachment2ENServicesObject. Получить список по фильтру */
	public ENDocAttachment2ENServicesObjectShortList getFilteredList(
			ENDocAttachment2ENServicesObjectFilter aENDocAttachment2ENServicesObjectFilter)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2ENServicesObject. Получить список для просмотра */
	public ENDocAttachment2ENServicesObjectShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachment2ENServicesObject. Получить список для просмотра по фильтру */
	public ENDocAttachment2ENServicesObjectShortList getScrollableFilteredList(
			ENDocAttachment2ENServicesObjectFilter aENDocAttachment2ENServicesObjectFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachment2ENServicesObject. Получить список для просмотра по условию */
	public ENDocAttachment2ENServicesObjectShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2ENServicesObject. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENDocAttachment2ENServicesObjectFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttachment2ENServicesObject. Получить объект из списка */
	public ENDocAttachment2ENServicesObjectShort getShortObject(int code)
			throws java.rmi.RemoteException;

}