
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAct2FinKodIst;
 *
 */

import com.ksoe.energynet.valueobject.ENAct2FinKodIst;
import com.ksoe.energynet.valueobject.brief.ENAct2FinKodIstShort;
import com.ksoe.energynet.valueobject.filter.ENAct2FinKodIstFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2FinKodIstShortList;


public interface ENAct2FinKodIstController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAct2FinKodIstController";

	/* ENAct2FinKodIst. Добавить */
	public int add(ENAct2FinKodIst aENAct2FinKodIst)
			throws java.rmi.RemoteException;

	/* ENAct2FinKodIst. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAct2FinKodIst. Изменить */
	public void save(ENAct2FinKodIst aENAct2FinKodIst)
			throws java.rmi.RemoteException;

	/* ENAct2FinKodIst. Получить объект */
	public ENAct2FinKodIst getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAct2FinKodIst. Получить полный список */
	public ENAct2FinKodIstShortList getList()
			throws java.rmi.RemoteException;

	/* ENAct2FinKodIst. Получить список по фильтру */
	public ENAct2FinKodIstShortList getFilteredList(
			ENAct2FinKodIstFilter aENAct2FinKodIstFilter)
			throws java.rmi.RemoteException;

	/* ENAct2FinKodIst. Получить список для просмотра */
	public ENAct2FinKodIstShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2FinKodIst. Получить список для просмотра по фильтру */
	public ENAct2FinKodIstShortList getScrollableFilteredList(
			ENAct2FinKodIstFilter aENAct2FinKodIstFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2FinKodIst. Получить список для просмотра по условию */
	public ENAct2FinKodIstShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAct2FinKodIst. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENAct2FinKodIstFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAct2FinKodIst. Получить объект из списка */
	public ENAct2FinKodIstShort getShortObject(int code)
			throws java.rmi.RemoteException;

	/* Установить источник для ОЗ */
	public  void setKodIst4Oz(int kodIstCode, int ozCode) 
	        throws java.rmi.RemoteException;
	
}