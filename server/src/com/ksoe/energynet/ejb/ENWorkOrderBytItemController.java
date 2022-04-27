
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENWorkOrderBytItem;
 *
 */

import java.util.Vector;

import com.ksoe.energynet.valueobject.ENHumenItem;
import com.ksoe.energynet.valueobject.ENWorkOrderBytItem;
import com.ksoe.energynet.valueobject.ENWorkOrderBytItem2Mark;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderBytItemShort;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItemFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytItemShortList;


public interface ENWorkOrderBytItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENWorkOrderBytItemController";

	/* ENWorkOrderBytItem. Добавить */
	public int add(ENWorkOrderBytItem aENWorkOrderBytItem) throws java.rmi.RemoteException;
	public int add(ENWorkOrderBytItem aENWorkOrderBytItem, boolean isFromBilling) throws java.rmi.RemoteException;
	public void addFromShort(ENWorkOrderBytItem object, ENWorkOrderBytItemShort shortObject) throws java.rmi.RemoteException;
	public int addWithMarks(ENWorkOrderBytItem object, ENWorkOrderBytItem2Mark[] marks) throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;
	public void remove(int anObjectCode, boolean isFromBilling) throws java.rmi.RemoteException;
	public void removeWithMarks(int anObjectCode) throws java.rmi.RemoteException;
	public void removeForRaidByElement(int workOrderBytCode, int planCode, int elementCode) throws java.rmi.RemoteException;
	
	/* ENWorkOrderBytItem. Изменить */
	public void save(ENWorkOrderBytItem aENWorkOrderBytItem)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem. Получить объект */
	public ENWorkOrderBytItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem. Получить полный список */
	public ENWorkOrderBytItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem. Получить список по фильтру */
	public ENWorkOrderBytItemShortList getFilteredList(
			ENWorkOrderBytItemFilter aENWorkOrderBytItemFilter)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem. Получить список для просмотра */
	public ENWorkOrderBytItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem. Получить список для просмотра по фильтру */
	public ENWorkOrderBytItemShortList getScrollableFilteredList(
			ENWorkOrderBytItemFilter aENWorkOrderBytItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem. Получить список для просмотра по условию */
	public ENWorkOrderBytItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENWorkOrderBytItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem. Получить объект из списка */
	public ENWorkOrderBytItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

	/* ENWorkOrderBytItem. Получить список из планов */
	public ENWorkOrderBytItemShortList getScrollableFilteredListForAdd(
			ENWorkOrderBytItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	public ENWorkOrderBytItemShortList getScrollableFilteredListForAdd2(
			ENWorkOrderBytItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	public ENWorkOrderBytItemShortList getScrollableFilteredListForPlanning(
			ENWorkOrderBytItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;
	public ENWorkOrderBytItemShortList getScrollableFilteredListForPlanning(
			ENWorkOrderBytItemFilter filterObject, int fromPosition,
			int quantity, int elementType) throws java.rmi.RemoteException;

	public int bindCounter(int workOrderBytItemCode, SCCounter counter) throws java.rmi.RemoteException;

	public int updateFinWorker(int workOrderBytItemCode, FINWorker finWorker) throws java.rmi.RemoteException;


	public int addForRaidByFeeder(int planCode, ENHumenItem ENHumenItemObj,
			ENHumenItem ENHumenItem2Obj, ENHumenItem ENHumenItem3Obj,
			int elementCodeArr[], Vector rpCodes, int routeCode, int woBytMainCode) throws java.rmi.RemoteException;


}