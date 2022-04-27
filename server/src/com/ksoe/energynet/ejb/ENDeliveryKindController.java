
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDeliveryKind;
import com.ksoe.energynet.valueobject.filter.ENDeliveryKindFilter;
import com.ksoe.energynet.valueobject.lists.ENDeliveryKindShortList;

public interface ENDeliveryKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDeliveryKindController";


  /*ENDeliveryKind. Добавить*/
  public int add(ENDeliveryKind aENDeliveryKind) throws java.rmi.RemoteException;

  /*ENDeliveryKind. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDeliveryKind. Изменить*/
  public void save(ENDeliveryKind aENDeliveryKind) throws  java.rmi.RemoteException;

  /*ENDeliveryKind. Получить объект*/
  public ENDeliveryKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDeliveryKind. Получить полный список*/
  public ENDeliveryKindShortList getList() throws  java.rmi.RemoteException;

  /*ENDeliveryKind. Получить список по фильтру*/
  public ENDeliveryKindShortList getFilteredList(ENDeliveryKindFilter aENDeliveryKindFilter) throws  java.rmi.RemoteException;  
  
  /*ENDeliveryKind. Получить список для просмотра*/
  public ENDeliveryKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDeliveryKind. Получить список для просмотра по фильтру*/
  public ENDeliveryKindShortList getScrollableFilteredList(ENDeliveryKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDeliveryKind. Получить список для просмотра по условию*/
  public ENDeliveryKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }