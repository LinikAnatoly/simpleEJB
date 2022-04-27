
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2ENEstimateItemShortList;

public interface ENEstimateItem2ENEstimateItemController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENEstimateItem2ENEstimateItemController";


  /*ENEstimateItem2ENEstimateItem. Добавить*/
  public int add(ENEstimateItem2ENEstimateItem aENEstimateItem2ENEstimateItem) throws java.rmi.RemoteException;

  /*ENEstimateItem2ENEstimateItem. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItem2ENEstimateItem. Изменить*/
  public void save(ENEstimateItem2ENEstimateItem aENEstimateItem2ENEstimateItem) throws  java.rmi.RemoteException;

  /*ENEstimateItem2ENEstimateItem. Получить объект*/
  public ENEstimateItem2ENEstimateItem getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItem2ENEstimateItem. Получить полный список*/
  public ENEstimateItem2ENEstimateItemShortList getList() throws  java.rmi.RemoteException;

  /*ENEstimateItem2ENEstimateItem. Получить список по фильтру*/
  public ENEstimateItem2ENEstimateItemShortList getFilteredList(ENEstimateItem2ENEstimateItemFilter aENEstimateItem2ENEstimateItemFilter) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItem2ENEstimateItem. Получить список для просмотра*/
  public ENEstimateItem2ENEstimateItemShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItem2ENEstimateItem. Получить список для просмотра по фильтру*/
  public ENEstimateItem2ENEstimateItemShortList getScrollableFilteredList(ENEstimateItem2ENEstimateItemFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENEstimateItem2ENEstimateItem. Получить список для просмотра по условию*/
  public ENEstimateItem2ENEstimateItemShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  public int add(ENEstimateItem2ENEstimateItem aENEstimateItem2ENEstimateItem, int finCode, BigDecimal finCount) throws java.rmi.RemoteException;
  
  public int addMoveSCCounter(ENEstimateItem2ENEstimateItem aENEstimateItem2ENEstimateItem) throws java.rmi.RemoteException;
  
  public void removeMoveSCCounter(int code) throws java.rmi.RemoteException;
  
  public boolean getChangeBudegt()  throws java.rmi.RemoteException;
  }