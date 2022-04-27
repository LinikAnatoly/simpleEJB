
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Wed Oct 07 14:18:06 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanCorrectHistory;
import com.ksoe.energynet.valueobject.filter.ENPlanCorrectHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanCorrectHistoryShortList;

public interface ENPlanCorrectHistoryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanCorrectHistoryController";


  /*ENPlanCorrectHistory. Добавить*/
  public int add(ENPlanCorrectHistory aENPlanCorrectHistory) throws java.rmi.RemoteException;

  /*ENPlanCorrectHistory. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanCorrectHistory. Изменить*/
  public void save(ENPlanCorrectHistory aENPlanCorrectHistory) throws  java.rmi.RemoteException;

  /*ENPlanCorrectHistory. Получить объект*/
  public ENPlanCorrectHistory getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanCorrectHistory. Получить полный список*/
  public ENPlanCorrectHistoryShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanCorrectHistory. Получить список по фильтру*/
  public ENPlanCorrectHistoryShortList getFilteredList(ENPlanCorrectHistoryFilter aENPlanCorrectHistoryFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanCorrectHistory. Получить список для просмотра*/
  public ENPlanCorrectHistoryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanCorrectHistory. Получить список для просмотра по фильтру*/
  public ENPlanCorrectHistoryShortList getScrollableFilteredList(ENPlanCorrectHistoryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanCorrectHistory. Получить список для просмотра по условию*/
  public ENPlanCorrectHistoryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }