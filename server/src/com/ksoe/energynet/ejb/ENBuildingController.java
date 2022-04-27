
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENBuilding;
 *
 */

import com.ksoe.energynet.valueobject.ENBuilding;
import com.ksoe.energynet.valueobject.lists.ENBuildingShortList;
import com.ksoe.energynet.valueobject.brief.ENBuildingShort;
import com.ksoe.energynet.valueobject.filter.ENBuildingFilter;


public interface ENBuildingController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENBuildingController";

	/* ENBuilding. Добавить */
	public int add(ENBuilding aENBuilding)
			throws java.rmi.RemoteException;

	/* ENBuilding. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENBuilding. Изменить */
	public void save(ENBuilding aENBuilding)
			throws java.rmi.RemoteException;

	/* ENBuilding. Получить объект */
	public ENBuilding getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENBuilding. Получить полный список */
	public ENBuildingShortList getList()
			throws java.rmi.RemoteException;

	/* ENBuilding. Получить список по фильтру */
	public ENBuildingShortList getFilteredList(
			ENBuildingFilter aENBuildingFilter)
			throws java.rmi.RemoteException;

	/* ENBuilding. Получить список для просмотра */
	public ENBuildingShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding. Получить список для просмотра по фильтру */
	public ENBuildingShortList getScrollableFilteredList(
			ENBuildingFilter aENBuildingFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENBuilding. Получить список для просмотра по условию */
	public ENBuildingShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENBuilding. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENBuildingFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENBuilding. Получить объект из списка */
	public ENBuildingShort getShortObject(int code)
			throws java.rmi.RemoteException;
	
	
	/*скласти*/
	  public void createOZ(int ozCode)  throws java.rmi.RemoteException;
	  /*відмінити складання*/
	  public void unCreateOZ(int ozCode)  throws java.rmi.RemoteException;
	  /*провести документ в Основні засоби*/
	  public void moveToOS(int ozCode)  throws java.rmi.RemoteException; 
	  /*відмінити проведення документу з Основних засобів */
	  public void unMoveToOS(int ozCode)  throws java.rmi.RemoteException;

}