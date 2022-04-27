
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDamageRecovery;
 *
 */

import com.ksoe.energynet.valueobject.ENDamageRecovery;
import com.ksoe.energynet.valueobject.brief.ENDamageRecoveryShort;
import com.ksoe.energynet.valueobject.filter.ENDamageRecoveryFilter;
import com.ksoe.energynet.valueobject.lists.ENDamageRecoveryShortList;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;


public interface ENDamageRecoveryController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDamageRecoveryController";

	/* ENDamageRecovery. Добавить */
	public int add(ENDamageRecovery aENDamageRecovery)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDamageRecovery. Изменить */
	public void save(ENDamageRecovery aENDamageRecovery)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery. Получить объект */
	public ENDamageRecovery getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery. Получить полный список */
	public ENDamageRecoveryShortList getList()
			throws java.rmi.RemoteException;

	/* ENDamageRecovery. Получить список по фильтру */
	public ENDamageRecoveryShortList getFilteredList(
			ENDamageRecoveryFilter aENDamageRecoveryFilter)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery. Получить список для просмотра */
	public ENDamageRecoveryShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDamageRecovery. Получить список для просмотра по фильтру */
	public ENDamageRecoveryShortList getScrollableFilteredList(
			ENDamageRecoveryFilter aENDamageRecoveryFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDamageRecovery. Получить список для просмотра по условию */
	public ENDamageRecoveryShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDamageRecovery. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENDamageRecoveryFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDamageRecovery. Получить объект из списка */
	public ENDamageRecoveryShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENDamageRecovery. Изменить дату проводок */
	public void changeDatePosting(ENDamageRecovery object) 
	        throws java.rmi.RemoteException;
	
	/* ENDamageRecovery, Удалить проводки из ФК */
	public void deletePostingFromFK(int damageRecoveryCode) 
	       throws java.rmi.RemoteException;
	
	/* получить лист с проводками из ФК */
	public FKProvObjectShortList getFKPostingsList(int damageRecoveryCode) 
	       throws java.rmi.RemoteException;
	
	/* создать проводки в ФК */
	public FKProvResult movePostingToFK(int damageRecoveryCode)
		   throws java.rmi.RemoteException;
}