
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENOperativeObjectHistory;
import com.ksoe.energynet.valueobject.filter.ENOperativeObjectHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENOperativeObjectHistoryShortList;

public interface ENOperativeObjectHistoryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENOperativeObjectHistoryController";


  /*ENOperativeObjectHistory. Добавить*/
  public int add(ENOperativeObjectHistory aENOperativeObjectHistory) throws java.rmi.RemoteException;

  /*ENOperativeObjectHistory. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOperativeObjectHistory. Изменить*/
  public void save(ENOperativeObjectHistory aENOperativeObjectHistory) throws  java.rmi.RemoteException;

  /*ENOperativeObjectHistory. Получить объект*/
  public ENOperativeObjectHistory getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOperativeObjectHistory. Получить полный список*/
  public ENOperativeObjectHistoryShortList getList() throws  java.rmi.RemoteException;

  /*ENOperativeObjectHistory. Получить список по фильтру*/
  public ENOperativeObjectHistoryShortList getFilteredList(ENOperativeObjectHistoryFilter aENOperativeObjectHistoryFilter) throws  java.rmi.RemoteException;  
  
  /*ENOperativeObjectHistory. Получить список для просмотра*/
  public ENOperativeObjectHistoryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENOperativeObjectHistory. Получить список для просмотра по фильтру*/
  public ENOperativeObjectHistoryShortList getScrollableFilteredList(ENOperativeObjectHistoryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENOperativeObjectHistory. Получить список для просмотра по условию*/
  public ENOperativeObjectHistoryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENOperativeObjectHistory. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENOperativeObjectHistoryFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }