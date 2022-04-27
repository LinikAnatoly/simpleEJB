
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkStateFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkStateShortList;

public interface ENPlanWorkStateController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkStateController";


  /*ENPlanWorkState. Добавить*/
  public int add(ENPlanWorkState aENPlanWorkState) throws java.rmi.RemoteException;

  /*ENPlanWorkState. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkState. Изменить*/
  public void save(ENPlanWorkState aENPlanWorkState) throws  java.rmi.RemoteException;

  /*ENPlanWorkState. Получить объект*/
  public ENPlanWorkState getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkState. Получить полный список*/
  public ENPlanWorkStateShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkState. Получить список по фильтру*/
  public ENPlanWorkStateShortList getFilteredList(ENPlanWorkStateFilter aENPlanWorkStateFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkState. Получить список для просмотра*/
  public ENPlanWorkStateShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkState. Получить список для просмотра по фильтру*/
  public ENPlanWorkStateShortList getScrollableFilteredList(ENPlanWorkStateFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkState. Получить список для просмотра по условию*/
  public ENPlanWorkStateShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }