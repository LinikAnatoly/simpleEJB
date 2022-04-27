
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDestinationOrder;
import com.ksoe.energynet.valueobject.filter.ENDestinationOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENDestinationOrderShortList;

public interface ENDestinationOrderController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDestinationOrderController";


  /*ENDestinationOrder. Добавить*/
  public int add(ENDestinationOrder aENDestinationOrder) throws java.rmi.RemoteException;

  /*ENDestinationOrder. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDestinationOrder. Изменить*/
  public void save(ENDestinationOrder aENDestinationOrder) throws  java.rmi.RemoteException;

  /*ENDestinationOrder. Получить объект*/
  public ENDestinationOrder getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDestinationOrder. Получить полный список*/
  public ENDestinationOrderShortList getList() throws  java.rmi.RemoteException;

  /*ENDestinationOrder. Получить список по фильтру*/
  public ENDestinationOrderShortList getFilteredList(ENDestinationOrderFilter aENDestinationOrderFilter) throws  java.rmi.RemoteException;  
  
  /*ENDestinationOrder. Получить список для просмотра*/
  public ENDestinationOrderShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDestinationOrder. Получить список для просмотра по фильтру*/
  public ENDestinationOrderShortList getScrollableFilteredList(ENDestinationOrderFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDestinationOrder. Получить список для просмотра по условию*/
  public ENDestinationOrderShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENDestinationOrder. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENDestinationOrderFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }