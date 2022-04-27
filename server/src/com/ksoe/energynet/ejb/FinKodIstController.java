
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for FinKodIst;
 *
 */

import com.ksoe.energynet.valueobject.FinKodIst;
import com.ksoe.energynet.valueobject.brief.FinKodIstShort;
import com.ksoe.energynet.valueobject.filter.FinKodIstFilter;
import com.ksoe.energynet.valueobject.lists.FinKodIstShortList;


public interface FinKodIstController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/FinKodIstController";

	/* FinKodIst. Добавить */
	public int add(FinKodIst aFinKodIst)
			throws java.rmi.RemoteException;

	/* FinKodIst. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* FinKodIst. Изменить */
	public void save(FinKodIst aFinKodIst)
			throws java.rmi.RemoteException;

	/* FinKodIst. Получить объект */
	public FinKodIst getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* FinKodIst. Получить полный список */
	public FinKodIstShortList getList()
			throws java.rmi.RemoteException;

	/* FinKodIst. Получить список по фильтру */
	public FinKodIstShortList getFilteredList(
			FinKodIstFilter aFinKodIstFilter)
			throws java.rmi.RemoteException;

	/* FinKodIst. Получить список для просмотра */
	public FinKodIstShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FinKodIst. Получить список для просмотра по фильтру */
	public FinKodIstShortList getScrollableFilteredList(
			FinKodIstFilter aFinKodIstFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FinKodIst. Получить список для просмотра по условию */
	public FinKodIstShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* FinKodIst. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			FinKodIstFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* FinKodIst. Получить объект из списка */
	public FinKodIstShort getShortObject(int code)
			throws java.rmi.RemoteException;

}