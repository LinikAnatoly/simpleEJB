
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDistributionAgree;
 *
 */

import com.ksoe.energynet.valueobject.ENDistributionAgree;
import com.ksoe.energynet.valueobject.lists.ENDistributionAgreeShortList;
import com.ksoe.energynet.valueobject.brief.ENDistributionAgreeShort;
import com.ksoe.energynet.valueobject.filter.ENDistributionAgreeFilter;


public interface ENDistributionAgreeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDistributionAgreeController";

	/* ENDistributionAgree. Добавить */
	public int add(ENDistributionAgree aENDistributionAgree)
			throws java.rmi.RemoteException;

	/* ENDistributionAgree. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDistributionAgree. Изменить */
	public void save(ENDistributionAgree aENDistributionAgree)
			throws java.rmi.RemoteException;

	/* ENDistributionAgree. Получить объект */
	public ENDistributionAgree getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDistributionAgree. Получить полный список */
	public ENDistributionAgreeShortList getList()
			throws java.rmi.RemoteException;

	/* ENDistributionAgree. Получить список по фильтру */
	public ENDistributionAgreeShortList getFilteredList(
			ENDistributionAgreeFilter aENDistributionAgreeFilter)
			throws java.rmi.RemoteException;

	/* ENDistributionAgree. Получить список для просмотра */
	public ENDistributionAgreeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDistributionAgree. Получить список для просмотра по фильтру */
	public ENDistributionAgreeShortList getScrollableFilteredList(
			ENDistributionAgreeFilter aENDistributionAgreeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDistributionAgree. Получить список для просмотра по условию */
	public ENDistributionAgreeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDistributionAgree. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENDistributionAgreeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDistributionAgree. Получить объект из списка */
	public ENDistributionAgreeShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENDistributionAgree. Добавить со связкой ServicesObject*/
	public int add(ENDistributionAgree aENDistributionAgree, int soCode)
			throws java.rmi.RemoteException;
	

}