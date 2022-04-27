
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDamageRecovery2ENAct;
 *
 */

import com.ksoe.energynet.valueobject.ENDamageRecovery2ENAct;
import com.ksoe.energynet.valueobject.brief.ENDamageRecovery2ENActShort;
import com.ksoe.energynet.valueobject.filter.ENDamageRecovery2ENActFilter;
import com.ksoe.energynet.valueobject.lists.ENDamageRecovery2ENActShortList;


public interface ENDamageRecovery2ENActController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDamageRecovery2ENActController";

	/* ENDamageRecovery2ENAct. Добавить */
	public int add(ENDamageRecovery2ENAct aENDamageRecovery2ENAct)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery2ENAct. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;
	
	/* ENDamageRecovery2ENAct. Удалить */
	public void remove(int actCode, int damageCode) throws java.rmi.RemoteException;

	/* ENDamageRecovery2ENAct. Изменить */
	public void save(ENDamageRecovery2ENAct aENDamageRecovery2ENAct)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery2ENAct. Получить объект */
	public ENDamageRecovery2ENAct getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery2ENAct. Получить полный список */
	public ENDamageRecovery2ENActShortList getList()
			throws java.rmi.RemoteException;

	/* ENDamageRecovery2ENAct. Получить список по фильтру */
	public ENDamageRecovery2ENActShortList getFilteredList(
			ENDamageRecovery2ENActFilter aENDamageRecovery2ENActFilter)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery2ENAct. Получить список для просмотра */
	public ENDamageRecovery2ENActShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDamageRecovery2ENAct. Получить список для просмотра по фильтру */
	public ENDamageRecovery2ENActShortList getScrollableFilteredList(
			ENDamageRecovery2ENActFilter aENDamageRecovery2ENActFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDamageRecovery2ENAct. Получить список для просмотра по условию */
	public ENDamageRecovery2ENActShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery2ENAct. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENDamageRecovery2ENActFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDamageRecovery2ENAct. Получить объект из списка */
	public ENDamageRecovery2ENActShort getShortObject(int code)
			throws java.rmi.RemoteException;

}