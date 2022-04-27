
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAccumulators;
import com.ksoe.energynet.valueobject.filter.ENAccumulatorsFilter;
import com.ksoe.energynet.valueobject.lists.ENAccumulatorsShortList;

public interface ENAccumulatorsController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAccumulatorsController";


  /*ENAccumulators. Добавить*/
  public int add(ENAccumulators aENAccumulators) throws java.rmi.RemoteException;

  /*ENAccumulators. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAccumulators. Изменить*/
  public void save(ENAccumulators aENAccumulators) throws  java.rmi.RemoteException;

  /*ENAccumulators. Получить объект*/
  public ENAccumulators getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAccumulators. Получить полный список*/
  public ENAccumulatorsShortList getList() throws  java.rmi.RemoteException;

  /*ENAccumulators. Получить список по фильтру*/
  public ENAccumulatorsShortList getFilteredList(ENAccumulatorsFilter aENAccumulatorsFilter) throws  java.rmi.RemoteException;  
  
  /*ENAccumulators. Получить список для просмотра*/
  public ENAccumulatorsShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAccumulators. Получить список для просмотра по фильтру*/
  public ENAccumulatorsShortList getScrollableFilteredList(ENAccumulatorsFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAccumulators. Получить список для просмотра по условию*/
  public ENAccumulatorsShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENAccumulators. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENAccumulatorsFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }