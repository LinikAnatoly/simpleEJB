
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkItem2TKKoef;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItem2TKKoefFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItem2TKKoefShortList;

public interface ENPlanWorkItem2TKKoefController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkItem2TKKoefController";


  /*ENPlanWorkItem2TKKoef. Добавить*/
  public int add(ENPlanWorkItem2TKKoef aENPlanWorkItem2TKKoef) throws java.rmi.RemoteException;

  /*ENPlanWorkItem2TKKoef. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem2TKKoef. Изменить*/
  public void save(ENPlanWorkItem2TKKoef aENPlanWorkItem2TKKoef) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem2TKKoef. Получить объект*/
  public ENPlanWorkItem2TKKoef getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem2TKKoef. Получить полный список*/
  public ENPlanWorkItem2TKKoefShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkItem2TKKoef. Получить список по фильтру*/
  public ENPlanWorkItem2TKKoefShortList getFilteredList(ENPlanWorkItem2TKKoefFilter aENPlanWorkItem2TKKoefFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkItem2TKKoef. Получить список для просмотра*/
  public ENPlanWorkItem2TKKoefShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkItem2TKKoef. Получить список для просмотра по фильтру*/
  public ENPlanWorkItem2TKKoefShortList getScrollableFilteredList(ENPlanWorkItem2TKKoefFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkItem2TKKoef. Получить список для просмотра по условию*/
  public ENPlanWorkItem2TKKoefShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }