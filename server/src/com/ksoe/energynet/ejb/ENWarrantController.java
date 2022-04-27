
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDocAttachment;

/**
 * EJB Controller interface for ENWarrant;
 *
 */

import com.ksoe.energynet.valueobject.ENWarrant;
import com.ksoe.energynet.valueobject.brief.ENWarrantShort;
import com.ksoe.energynet.valueobject.filter.ENWarrantFilter;
import com.ksoe.energynet.valueobject.lists.ENWarrantShortList;


public interface ENWarrantController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWarrantController";

	/* ENWarrant. Добавить */
	public int add(ENWarrant aENWarrant)
			throws java.rmi.RemoteException;

	public int add(ENWarrant enWarrant, ENDocAttachment attachment, byte[] aFile, String fileName)
			throws java.rmi.RemoteException;

	/* ENWarrant. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENWarrant. Изменить */
	public void save(ENWarrant aENWarrant)
			throws java.rmi.RemoteException;

	/* ENWarrant. Получить объект */
	public ENWarrant getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENWarrant. Получить полный список */
	public ENWarrantShortList getList()
			throws java.rmi.RemoteException;

	/* ENWarrant. Получить список по фильтру */
	public ENWarrantShortList getFilteredList(
			ENWarrantFilter aENWarrantFilter)
			throws java.rmi.RemoteException;

	/* ENWarrant. Получить список для просмотра */
	public ENWarrantShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWarrant. Получить список для просмотра по фильтру */
	public ENWarrantShortList getScrollableFilteredList(
			ENWarrantFilter aENWarrantFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWarrant. Получить список для просмотра по условию */
	public ENWarrantShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	public ENWarrantShortList getScrollableFilteredList(
			ENWarrantFilter filterObject, int fromPosition,
			int quantity, int typeCode) throws java.rmi.RemoteException;

	/* ENWarrant. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENWarrantFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENWarrant. Получить объект из списка */
	public ENWarrantShort getShortObject(int code)
			throws java.rmi.RemoteException;



	/** Изменить доверенность */
	public void changeWarrant(int servicesObjectCode, int warrantCode) throws java.rmi.RemoteException;

}