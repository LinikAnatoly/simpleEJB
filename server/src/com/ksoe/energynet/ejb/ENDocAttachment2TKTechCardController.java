
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDocAttachment2TKTechCard;
 *
 */

import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachment2TKTechCard;
import com.ksoe.energynet.valueobject.lists.ENDocAttachment2TKTechCardShortList;
import com.ksoe.energynet.valueobject.brief.ENDocAttachment2TKTechCardShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachment2TKTechCardFilter;


public interface ENDocAttachment2TKTechCardController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDocAttachment2TKTechCardController";

	/* ENDocAttachment2TKTechCard. Добавить */
	public int add(ENDocAttachment2TKTechCard aENDocAttachment2TKTechCard) throws java.rmi.RemoteException;
	public int add(ENDocAttachment object, byte[] aFile, String fileName, int tkTechCardCode) throws java.rmi.RemoteException;

	/* ENDocAttachment2TKTechCard. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDocAttachment2TKTechCard. Изменить */
	public void save(ENDocAttachment2TKTechCard aENDocAttachment2TKTechCard)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2TKTechCard. Получить объект */
	public ENDocAttachment2TKTechCard getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2TKTechCard. Получить полный список */
	public ENDocAttachment2TKTechCardShortList getList()
			throws java.rmi.RemoteException;

	/* ENDocAttachment2TKTechCard. Получить список по фильтру */
	public ENDocAttachment2TKTechCardShortList getFilteredList(
			ENDocAttachment2TKTechCardFilter aENDocAttachment2TKTechCardFilter)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2TKTechCard. Получить список для просмотра */
	public ENDocAttachment2TKTechCardShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachment2TKTechCard. Получить список для просмотра по фильтру */
	public ENDocAttachment2TKTechCardShortList getScrollableFilteredList(
			ENDocAttachment2TKTechCardFilter aENDocAttachment2TKTechCardFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDocAttachment2TKTechCard. Получить список для просмотра по условию */
	public ENDocAttachment2TKTechCardShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDocAttachment2TKTechCard. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENDocAttachment2TKTechCardFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDocAttachment2TKTechCard. Получить объект из списка */
	public ENDocAttachment2TKTechCardShort getShortObject(int code)
			throws java.rmi.RemoteException;

}