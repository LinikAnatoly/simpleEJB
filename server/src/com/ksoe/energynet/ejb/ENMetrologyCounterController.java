
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENMetrologyCounterShortList;

public interface ENMetrologyCounterController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMetrologyCounterController";


  /*ENMetrologyCounter. Добавить*/
  public int add(ENMetrologyCounter aENMetrologyCounter) throws java.rmi.RemoteException;

  /*ENMetrologyCounter. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyCounter. Изменить*/
  public void save(ENMetrologyCounter aENMetrologyCounter) throws  java.rmi.RemoteException;

  /*ENMetrologyCounter. Получить объект*/
  public ENMetrologyCounter getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyCounter. Получить полный список*/
  public ENMetrologyCounterShortList getList() throws  java.rmi.RemoteException;

  /*ENMetrologyCounter. Получить список по фильтру*/
  public ENMetrologyCounterShortList getFilteredList(ENMetrologyCounterFilter aENMetrologyCounterFilter) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyCounter. Получить список для просмотра*/
  public ENMetrologyCounterShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyCounter. Получить список для просмотра по фильтру*/
  public ENMetrologyCounterShortList getScrollableFilteredList(ENMetrologyCounterFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMetrologyCounter. Получить список для просмотра по условию*/
  public ENMetrologyCounterShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  // типа список счетчиков из СканСчетчик"ов ....
  public ENMetrologyCounterShortList getCountersList(ENMetrologyCounterFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /**
   * 
   * Выборка счетчиков из СканСчетчиков и Основных средств
   * 
   * Из-за того, что в oracle записи в выборке начинаются с 1го номера, то вызов метода с параметром fromPosition = 0
   * и fromPosition = 1 вернут одинаковый результат.
   * 
   * @param filterObject объект фильтра {@link ENMetrologyCounterFilter}
   * @param fromPosition с какой позиции выбирать
   * @param quantity количество записей или -1 если нужно выбрать все
   * @param accountingTypeCode код типа учета {@link com.ksoe.techcard.valueobject.TKAccountingType}
   * @return лист объектов {@link ENMetrologyCounterShortList}
   * @throws java.rmi.RemoteException
   */
  public ENMetrologyCounterShortList getCountersList(ENMetrologyCounterFilter filterObject, int fromPosition, int quantity, int accountingTypeCode) throws java.rmi.RemoteException;
  
  //типа список наименований счетчиков по DISTINCT из СканСчетчик"ов ....
  public ENMetrologyCounterShortList getCountersListDistinctName(ENMetrologyCounterFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  
  public ENMetrologyCounterShortList getSealsList(ENMetrologyCounterFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  public ENMetrologyCounterShortList getSealsList(ENMetrologyCounterFilter filterObject, int fromPosition, int quantity, boolean showAll) throws java.rmi.RemoteException;

  public boolean isAccountForParametrization(String account) throws java.rmi.RemoteException;
  public String getStringAccountsForParametrization() throws java.rmi.RemoteException;
  
}