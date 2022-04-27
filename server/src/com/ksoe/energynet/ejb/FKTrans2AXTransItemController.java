
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for FKTrans2AXTransItem;
 *
 */

import com.ksoe.energynet.valueobject.FKTrans2AXTransItem;
import com.ksoe.energynet.valueobject.lists.FKTrans2AXTransItemShortList;
import com.ksoe.energynet.valueobject.brief.FKTrans2AXTransItemShort;
import com.ksoe.energynet.valueobject.filter.FKTrans2AXTransItemFilter;


public interface FKTrans2AXTransItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/FKTrans2AXTransItemController";

	/* FKTrans2AXTransItem. Добавить */
	public int add(FKTrans2AXTransItem aFKTrans2AXTransItem)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. Изменить */
	public void save(FKTrans2AXTransItem aFKTrans2AXTransItem)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. Получить объект */
	public FKTrans2AXTransItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. Получить полный список */
	public FKTrans2AXTransItemShortList getList()
			throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. Получить список по фильтру */
	public FKTrans2AXTransItemShortList getFilteredList(
			FKTrans2AXTransItemFilter aFKTrans2AXTransItemFilter)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. Получить список для просмотра */
	public FKTrans2AXTransItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. Получить список для просмотра по фильтру */
	public FKTrans2AXTransItemShortList getScrollableFilteredList(
			FKTrans2AXTransItemFilter aFKTrans2AXTransItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. Получить список для просмотра по условию */
	public FKTrans2AXTransItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			FKTrans2AXTransItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* FKTrans2AXTransItem. Получить объект из списка */
	public FKTrans2AXTransItemShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	
	public FKTrans2AXTransItemShortList getScrollableFilteredListGroup(	FKTrans2AXTransItemFilter filterObject, int fromPosition,	int quantity)
	   throws java.rmi.RemoteException;
	
	/* FKTrans2AXTransItem. Формирование аналитик для проводок АХ (по дню)  */
	public void makeDimensionAX( int transCode , String transDate ) throws java.rmi.RemoteException; 
	
	
	/* FKTrans2AXTransItem. Провести пачку проводок в АХ (по дню)  */
	public void moveTrans2AX( int transCode , String transDate ) throws java.rmi.RemoteException;
	
	/* FKTrans2AXTransItem. Передать пачку проводок в АХ (по дню)  */
	public void exportTrans2AX( int transCode , String transDate ) throws java.rmi.RemoteException;
	
	/* FKTrans2AXTransItem. Генерация проводок в АХ (по дню/дням)  */
	public void startCreatingPack( int transCode , String transDate ) throws java.rmi.RemoteException;
	
	

}