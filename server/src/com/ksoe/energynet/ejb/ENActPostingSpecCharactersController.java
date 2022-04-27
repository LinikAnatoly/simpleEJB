
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENActPostingSpecCharacters;
 *
 */

import com.ksoe.energynet.valueobject.ENActPostingSpecCharacters;
import com.ksoe.energynet.valueobject.lists.ENActPostingSpecCharactersShortList;
import com.ksoe.energynet.valueobject.brief.ENActPostingSpecCharactersShort;
import com.ksoe.energynet.valueobject.filter.ENActPostingSpecCharactersFilter;


public interface ENActPostingSpecCharactersController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENActPostingSpecCharactersController";

	/* ENActPostingSpecCharacters. Добавить */
	public int add(ENActPostingSpecCharacters aENActPostingSpecCharacters)
			throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. Изменить */
	public void save(ENActPostingSpecCharacters aENActPostingSpecCharacters)
			throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. Получить объект */
	public ENActPostingSpecCharacters getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. Получить полный список */
	public ENActPostingSpecCharactersShortList getList()
			throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. Получить список по фильтру */
	public ENActPostingSpecCharactersShortList getFilteredList(
			ENActPostingSpecCharactersFilter aENActPostingSpecCharactersFilter)
			throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. Получить список для просмотра */
	public ENActPostingSpecCharactersShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. Получить список для просмотра по фильтру */
	public ENActPostingSpecCharactersShortList getScrollableFilteredList(
			ENActPostingSpecCharactersFilter aENActPostingSpecCharactersFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. Получить список для просмотра по условию */
	public ENActPostingSpecCharactersShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENActPostingSpecCharactersFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENActPostingSpecCharacters. Получить объект из списка */
	public ENActPostingSpecCharactersShort getShortObject(int code)
			throws java.rmi.RemoteException;

}