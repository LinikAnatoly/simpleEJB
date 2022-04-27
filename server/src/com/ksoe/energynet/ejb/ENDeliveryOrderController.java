
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDeliveryOrder;
import com.ksoe.energynet.valueobject.filter.ENDeliveryOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENDeliveryOrderShortList;

public interface ENDeliveryOrderController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDeliveryOrderController";


  /*ENDeliveryOrder. Добавить*/
  public int add(ENDeliveryOrder aENDeliveryOrder) throws java.rmi.RemoteException;

  /*ENDeliveryOrder. Добавить*/
  public int addForTransportOrder(ENDeliveryOrder aENDeliveryOrder) throws java.rmi.RemoteException;

  /*ENDeliveryOrder. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDeliveryOrder. Изменить*/
  public void save(ENDeliveryOrder aENDeliveryOrder) throws  java.rmi.RemoteException;

  /*ENDeliveryOrder. Получить объект*/
  public ENDeliveryOrder getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDeliveryOrder. Получить полный список*/
  public ENDeliveryOrderShortList getList() throws  java.rmi.RemoteException;

  /*ENDeliveryOrder. Получить список по фильтру*/
  public ENDeliveryOrderShortList getFilteredList(ENDeliveryOrderFilter aENDeliveryOrderFilter) throws  java.rmi.RemoteException;  
  
  /*ENDeliveryOrder. Получить список для просмотра*/
  public ENDeliveryOrderShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDeliveryOrder. Получить список для просмотра по фильтру*/
  public ENDeliveryOrderShortList getScrollableFilteredList(ENDeliveryOrderFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDeliveryOrder. Получить список для просмотра по условию*/
  public ENDeliveryOrderShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }