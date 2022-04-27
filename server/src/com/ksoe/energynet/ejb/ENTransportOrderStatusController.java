
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportOrderStatus;
import com.ksoe.energynet.valueobject.filter.ENTransportOrderStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportOrderStatusShortList;

public interface ENTransportOrderStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportOrderStatusController";


  /*ENTransportOrderStatus. Добавить*/
  public int add(ENTransportOrderStatus aENTransportOrderStatus) throws java.rmi.RemoteException;

  /*ENTransportOrderStatus. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportOrderStatus. Изменить*/
  public void save(ENTransportOrderStatus aENTransportOrderStatus) throws  java.rmi.RemoteException;

  /*ENTransportOrderStatus. Получить объект*/
  public ENTransportOrderStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportOrderStatus. Получить полный список*/
  public ENTransportOrderStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportOrderStatus. Получить список по фильтру*/
  public ENTransportOrderStatusShortList getFilteredList(ENTransportOrderStatusFilter aENTransportOrderStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportOrderStatus. Получить список для просмотра*/
  public ENTransportOrderStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportOrderStatus. Получить список для просмотра по фильтру*/
  public ENTransportOrderStatusShortList getScrollableFilteredList(ENTransportOrderStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportOrderStatus. Получить список для просмотра по условию*/
  public ENTransportOrderStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportOrderStatus. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTransportOrderStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }