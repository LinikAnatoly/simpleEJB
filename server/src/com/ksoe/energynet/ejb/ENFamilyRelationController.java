
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENFamilyRelation;
 *
 */

import com.ksoe.energynet.valueobject.ENFamilyRelation;
import com.ksoe.energynet.valueobject.brief.ENFamilyRelationShort;
import com.ksoe.energynet.valueobject.filter.ENFamilyRelationFilter;
import com.ksoe.energynet.valueobject.lists.ENFamilyRelationShortList;


public interface ENFamilyRelationController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENFamilyRelationController";

	/* ENFamilyRelation. Добавить */
	public int add(ENFamilyRelation aENFamilyRelation)
			throws java.rmi.RemoteException;

	/* ENFamilyRelation. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENFamilyRelation. Изменить */
	public void save(ENFamilyRelation aENFamilyRelation)
			throws java.rmi.RemoteException;

	/* ENFamilyRelation. Получить объект */
	public ENFamilyRelation getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENFamilyRelation. Получить полный список */
	public ENFamilyRelationShortList getList()
			throws java.rmi.RemoteException;

	/* ENFamilyRelation. Получить список по фильтру */
	public ENFamilyRelationShortList getFilteredList(
			ENFamilyRelationFilter aENFamilyRelationFilter)
			throws java.rmi.RemoteException;

	/* ENFamilyRelation. Получить список для просмотра */
	public ENFamilyRelationShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFamilyRelation. Получить список для просмотра по фильтру */
	public ENFamilyRelationShortList getScrollableFilteredList(
			ENFamilyRelationFilter aENFamilyRelationFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENFamilyRelation. Получить список для просмотра по условию */
	public ENFamilyRelationShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENFamilyRelation. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENFamilyRelationFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENFamilyRelation. Получить объект из списка */
	public ENFamilyRelationShort getShortObject(int code)
			throws java.rmi.RemoteException;

}