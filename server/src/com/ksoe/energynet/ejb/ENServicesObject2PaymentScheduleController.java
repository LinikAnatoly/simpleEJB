
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENServicesObject2PaymentSchedule;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2PaymentScheduleFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2PaymentScheduleShortList;

public interface ENServicesObject2PaymentScheduleController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENServicesObject2PaymentScheduleController";


  /*ENServicesObject2PaymentSchedule. Добавить*/
  public int add(ENServicesObject2PaymentSchedule aENServicesObject2PaymentSchedule) throws java.rmi.RemoteException;

  /*ENServicesObject2PaymentSchedule. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesObject2PaymentSchedule. Изменить*/
  public void save(ENServicesObject2PaymentSchedule aENServicesObject2PaymentSchedule) throws  java.rmi.RemoteException;

  /*ENServicesObject2PaymentSchedule. Получить объект*/
  public ENServicesObject2PaymentSchedule getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesObject2PaymentSchedule. Получить полный список*/
  public ENServicesObject2PaymentScheduleShortList getList() throws  java.rmi.RemoteException;

  /*ENServicesObject2PaymentSchedule. Получить список по фильтру*/
  public ENServicesObject2PaymentScheduleShortList getFilteredList(ENServicesObject2PaymentScheduleFilter aENServicesObject2PaymentScheduleFilter) throws  java.rmi.RemoteException;  
  
  /*ENServicesObject2PaymentSchedule. Получить список для просмотра*/
  public ENServicesObject2PaymentScheduleShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENServicesObject2PaymentSchedule. Получить список для просмотра по фильтру*/
  public ENServicesObject2PaymentScheduleShortList getScrollableFilteredList(ENServicesObject2PaymentScheduleFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENServicesObject2PaymentSchedule. Получить список для просмотра по условию*/
  public ENServicesObject2PaymentScheduleShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENServicesObject2PaymentSchedule. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENServicesObject2PaymentScheduleFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }