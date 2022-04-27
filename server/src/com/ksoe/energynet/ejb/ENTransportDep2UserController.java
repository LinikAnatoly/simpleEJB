
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENTransportDep2User;
 *
 */

import com.ksoe.energynet.valueobject.ENTransportDep2User;
import com.ksoe.energynet.valueobject.lists.ENTransportDep2UserShortList;
import com.ksoe.energynet.valueobject.brief.ENTransportDep2UserShort;
import com.ksoe.energynet.valueobject.filter.ENTransportDep2UserFilter;


public interface ENTransportDep2UserController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENTransportDep2UserController";

	/* ENTransportDep2User. Добавить */
	public int add(ENTransportDep2User aENTransportDep2User)
			throws java.rmi.RemoteException;

	/* ENTransportDep2User. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENTransportDep2User. Изменить */
	public void save(ENTransportDep2User aENTransportDep2User)
			throws java.rmi.RemoteException;

	/* ENTransportDep2User. Получить объект */
	public ENTransportDep2User getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENTransportDep2User. Получить полный список */
	public ENTransportDep2UserShortList getList()
			throws java.rmi.RemoteException;

	/* ENTransportDep2User. Получить список по фильтру */
	public ENTransportDep2UserShortList getFilteredList(
			ENTransportDep2UserFilter aENTransportDep2UserFilter)
			throws java.rmi.RemoteException;

	/* ENTransportDep2User. Получить список для просмотра */
	public ENTransportDep2UserShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTransportDep2User. Получить список для просмотра по фильтру */
	public ENTransportDep2UserShortList getScrollableFilteredList(
			ENTransportDep2UserFilter aENTransportDep2UserFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENTransportDep2User. Получить список для просмотра по условию */
	public ENTransportDep2UserShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENTransportDep2User. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENTransportDep2UserFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENTransportDep2User. Получить объект из списка */
	public ENTransportDep2UserShort getShortObject(int code)
			throws java.rmi.RemoteException;

}