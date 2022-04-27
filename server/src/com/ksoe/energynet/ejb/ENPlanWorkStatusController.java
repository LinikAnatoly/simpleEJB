
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Sat Sep 26 14:38:30 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkStatusShortList;

public interface ENPlanWorkStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkStatusController";


  /*ENPlanWorkStatus. Добавить*/
  public int add(ENPlanWorkStatus aENPlanWorkStatus) throws java.rmi.RemoteException;

  /*ENPlanWorkStatus. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkStatus. Изменить*/
  public void save(ENPlanWorkStatus aENPlanWorkStatus) throws  java.rmi.RemoteException;

  /*ENPlanWorkStatus. Получить объект*/
  public ENPlanWorkStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkStatus. Получить полный список*/
  public ENPlanWorkStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkStatus. Получить список по фильтру*/
  public ENPlanWorkStatusShortList getFilteredList(ENPlanWorkStatusFilter aENPlanWorkStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkStatus. Получить список для просмотра*/
  public ENPlanWorkStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkStatus. Получить список для просмотра по фильтру*/
  public ENPlanWorkStatusShortList getScrollableFilteredList(ENPlanWorkStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkStatus. Получить список для просмотра по условию*/
  public ENPlanWorkStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }