
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENAct2DFDocDecree;
 *
 */

import com.ksoe.energynet.valueobject.ENAct2DFDocDecree;
import com.ksoe.energynet.valueobject.lists.ENAct2DFDocDecreeShortList;
import com.ksoe.energynet.valueobject.brief.ENAct2DFDocDecreeShort;
import com.ksoe.energynet.valueobject.filter.ENAct2DFDocDecreeFilter;


public interface ENAct2DFDocDecreeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENAct2DFDocDecreeController";

	/* ENAct2DFDocDecree. Добавить */
	public int add(ENAct2DFDocDecree aENAct2DFDocDecree)
			throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. Изменить */
	public void save(ENAct2DFDocDecree aENAct2DFDocDecree)
			throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. Получить объект */
	public ENAct2DFDocDecree getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. Получить полный список */
	public ENAct2DFDocDecreeShortList getList()
			throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. Получить список по фильтру */
	public ENAct2DFDocDecreeShortList getFilteredList(
			ENAct2DFDocDecreeFilter aENAct2DFDocDecreeFilter)
			throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. Получить список для просмотра */
	public ENAct2DFDocDecreeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. Получить список для просмотра по фильтру */
	public ENAct2DFDocDecreeShortList getScrollableFilteredList(
			ENAct2DFDocDecreeFilter aENAct2DFDocDecreeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. Получить список для просмотра по условию */
	public ENAct2DFDocDecreeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENAct2DFDocDecreeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENAct2DFDocDecree. Получить объект из списка */
	public ENAct2DFDocDecreeShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	/* ENAct2DFDocDecree. Добавить автоматически с данными из справочника по РЕСам*/
	public int addWithSetting(ENAct2DFDocDecree aENAct2DFDocDecree)
			throws java.rmi.RemoteException;
	
	/* ENAct2DFDocDecree. Удалить  */
	public void removeByObj(ENAct2DFDocDecree aENAct2DFDocDecree) throws java.rmi.RemoteException;

}