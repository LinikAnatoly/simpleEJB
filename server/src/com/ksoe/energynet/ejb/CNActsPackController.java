
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for CNActsPack;
 *
 */

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.docflow.valueobject.DFPack;
import com.ksoe.energynet.valueobject.CNActsPack;
import com.ksoe.energynet.valueobject.brief.CNActsPackShort;
import com.ksoe.energynet.valueobject.filter.CNActsPackFilter;
import com.ksoe.energynet.valueobject.lists.CNActsPackShortList;


public interface CNActsPackController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/CNActsPackController";

	/* CNActsPack. Добавить */
	public int add(CNActsPack aCNActsPack)
			throws java.rmi.RemoteException;

	/* CNActsPack. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* CNActsPack. Изменить */
	public void save(CNActsPack aCNActsPack)
			throws java.rmi.RemoteException;

	/* CNActsPack. Получить объект */
	public CNActsPack getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* CNActsPack. Получить полный список */
	public CNActsPackShortList getList()
			throws java.rmi.RemoteException;

	/* CNActsPack. Получить список по фильтру */
	public CNActsPackShortList getFilteredList(
			CNActsPackFilter aCNActsPackFilter)
			throws java.rmi.RemoteException;

	/* CNActsPack. Получить список для просмотра */
	public CNActsPackShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* CNActsPack. Получить список для просмотра по фильтру */
	public CNActsPackShortList getScrollableFilteredList(
			CNActsPackFilter aCNActsPackFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* CNActsPack. Получить список для просмотра по условию */
	public CNActsPackShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* CNActsPack. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			CNActsPackFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* CNActsPack. Получить объект из списка */
	public CNActsPackShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	
	public int createPack(DFPack pack, int eprenCode) throws java.rmi.RemoteException;
	
	public int getRegisterServiceStage(int idPack) throws java.rmi.RemoteException;
	
	public String getRegisterServiceStageName(int idPack) throws java.rmi.RemoteException;
	
    public void switchMovementForActs(int packCode, int nextState) throws java.rmi.RemoteException;
	
    public void savePack(DFPack pack,Date actDate,BigDecimal actSum)  throws java.rmi.RemoteException;
}