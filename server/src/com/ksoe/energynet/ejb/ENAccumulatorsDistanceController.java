
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAccumulatorsDistance;
import com.ksoe.energynet.valueobject.filter.ENAccumulatorsDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENAccumulatorsDistanceShortList;

public interface ENAccumulatorsDistanceController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAccumulatorsDistanceController";


  /*ENAccumulatorsDistance. Добавить*/
  public int add(ENAccumulatorsDistance aENAccumulatorsDistance) throws java.rmi.RemoteException;

  /*ENAccumulatorsDistance. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAccumulatorsDistance. Изменить*/
  public void save(ENAccumulatorsDistance aENAccumulatorsDistance) throws  java.rmi.RemoteException;

  /*ENAccumulatorsDistance. Получить объект*/
  public ENAccumulatorsDistance getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAccumulatorsDistance. Получить полный список*/
  public ENAccumulatorsDistanceShortList getList() throws  java.rmi.RemoteException;

  /*ENAccumulatorsDistance. Получить список по фильтру*/
  public ENAccumulatorsDistanceShortList getFilteredList(ENAccumulatorsDistanceFilter aENAccumulatorsDistanceFilter) throws  java.rmi.RemoteException;  
  
  /*ENAccumulatorsDistance. Получить список для просмотра*/
  public ENAccumulatorsDistanceShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAccumulatorsDistance. Получить список для просмотра по фильтру*/
  public ENAccumulatorsDistanceShortList getScrollableFilteredList(ENAccumulatorsDistanceFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAccumulatorsDistance. Получить список для просмотра по условию*/
  public ENAccumulatorsDistanceShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENAccumulatorsDistance. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENAccumulatorsDistanceFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }