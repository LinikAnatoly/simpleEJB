
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.lists.SCCounterShortList;

public interface SCCounterController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCCounterController";


  /*SCCounter. Добавить*/
  public int add(SCCounter aSCCounter) throws java.rmi.RemoteException;

  /*SCCounter. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCCounter. Изменить*/
  public void save(SCCounter aSCCounter) throws  java.rmi.RemoteException;

  /*SCCounter. Получить объект*/
  public SCCounter getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCCounter. Получить полный список*/
  public SCCounterShortList getList() throws  java.rmi.RemoteException;

  /*SCCounter. Получить список по фильтру*/
  public SCCounterShortList getFilteredList(SCCounterFilter aSCCounterFilter) throws  java.rmi.RemoteException;

  /*SCCounter. Получить список для просмотра*/
  public SCCounterShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*SCCounter. Получить список для просмотра по фильтру*/
  public SCCounterShortList getScrollableFilteredList(SCCounterFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*SCCounter. Получить список для просмотра по условию*/
  public SCCounterShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCCounter. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(SCCounterFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;


  // работа со счетчиками из Биллинга ...
  public void installCounter(int planCode, int kartaRefCode, String tabNumber, SCCounter counter) throws java.rmi.RemoteException;

  public void undoInstallCounter(SCCounter counter) throws java.rmi.RemoteException;

  public void unInstallCounter(int planCode, int kartaRefCode, String tabNumber, SCCounter counter, int isPass) throws java.rmi.RemoteException;

  public void undoUnInstallCounter(SCCounter counter) throws java.rmi.RemoteException;

  public void replaceCounter(int planCode, int kartaRefCode, String tabNumber, SCCounter oldCounter, SCCounter newCounter, int isPass) throws java.rmi.RemoteException;

  public void undoReplaceCounter(SCCounter oldCounter, SCCounter newCounter, int isPass) throws java.rmi.RemoteException;

  public int  getNumUnZKU(String invCounter,String lschet) throws java.rmi.RemoteException;

  /**
   *
   * Добавление счетчиков на списание
   *
   * @param counters массив счетчиков
   */
  public void addCountersForWriteOff(ENMetrologyCounter[] counters) throws java.rmi.RemoteException;

  /**
   *
   * Удаление привязки счетчиков для списания
   *
   * @param codes коды SCCounter
   */
  public void removeCountersForWriteOff(int[] codes) throws java.rmi.RemoteException;
  
  /**
  *
  * Удаление привязки счетчиков для работ из биллинга
  *
  * @param codes коды SCCounter
  */
  public void removeCountersForBilling(int[] codes) throws java.rmi.RemoteException;

  /***
   *  По договору услуг на сторону показываем счетчик который относитсяя к услуге
   *  @param soObjCode код Договора услуги на сторону
   ***/
  public SCCounterShortList getCounterForServicesObject(int soObjCode) throws java.rmi.RemoteException;

  /**
   * По договору услуг на сторону показываем счетчик, который относится к услуге
   *
   * @param soObjCode - код договора
   * @param showForCanceled - выбирать ли счетчик для отмененных договоров
   *
   **/
  public SCCounterShortList getCounterForServicesObject(int soObjCode, boolean showForCanceled) throws java.rmi.RemoteException;

  public int closePlanServiceObj(int planCode) throws java.rmi.RemoteException;
  
  /**
	 * 
	 * Удаление счетчика привязанного на снятие вручную из EnergyNet
	 * 
	 * @param code код {@link SCCounter}
	 */
	public void removeCounterUnmountedManually(int code) throws java.rmi.RemoteException;
	
	/**
	 * 
	 * Добавить счетчик на снятие в план вручную из EnergyNet
	 * 
	 * @param planCode код плана
	 * @param kartaRefCode код техкарті
	 * @param tabNumber табельный номер
	 * @param counter счетчик
	 * @throws java.rmi.RemoteException
	 */
	public void unInstallCounterManually(int planCode, int kartaRefCode,
			String tabNumber, SCCounter counter) throws java.rmi.RemoteException;

  }