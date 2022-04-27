
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDeliveryTimePlan;
import com.ksoe.energynet.valueobject.filter.ENDeliveryTimePlanFilter;
import com.ksoe.energynet.valueobject.lists.ENDeliveryTimePlanShortList;

public interface ENDeliveryTimePlanController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDeliveryTimePlanController";


  /*ENDeliveryTimePlan. Добавить*/
  public int add(ENDeliveryTimePlan aENDeliveryTimePlan) throws java.rmi.RemoteException;

  /*ENDeliveryTimePlan. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDeliveryTimePlan. Изменить*/
  public void save(ENDeliveryTimePlan aENDeliveryTimePlan) throws  java.rmi.RemoteException;

  /*ENDeliveryTimePlan. Получить объект*/
  public ENDeliveryTimePlan getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDeliveryTimePlan. Получить полный список*/
  public ENDeliveryTimePlanShortList getList() throws  java.rmi.RemoteException;

  /*ENDeliveryTimePlan. Получить список по фильтру*/
  public ENDeliveryTimePlanShortList getFilteredList(ENDeliveryTimePlanFilter aENDeliveryTimePlanFilter) throws  java.rmi.RemoteException;  
  
  /*ENDeliveryTimePlan. Получить список для просмотра*/
  public ENDeliveryTimePlanShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDeliveryTimePlan. Получить список для просмотра по фильтру*/
  public ENDeliveryTimePlanShortList getScrollableFilteredList(ENDeliveryTimePlanFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDeliveryTimePlan. Получить список для просмотра по условию*/
  public ENDeliveryTimePlanShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }