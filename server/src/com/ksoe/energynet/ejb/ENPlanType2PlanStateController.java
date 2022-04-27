
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanType2PlanState;
import com.ksoe.energynet.valueobject.filter.ENPlanType2PlanStateFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanType2PlanStateShortList;

public interface ENPlanType2PlanStateController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanType2PlanStateController";


  /*ENPlanType2PlanState. Добавить*/
  public int add(ENPlanType2PlanState aENPlanType2PlanState) throws java.rmi.RemoteException;

  /*ENPlanType2PlanState. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanType2PlanState. Изменить*/
  public void save(ENPlanType2PlanState aENPlanType2PlanState) throws  java.rmi.RemoteException;

  /*ENPlanType2PlanState. Получить объект*/
  public ENPlanType2PlanState getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanType2PlanState. Получить полный список*/
  public ENPlanType2PlanStateShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanType2PlanState. Получить список по фильтру*/
  public ENPlanType2PlanStateShortList getFilteredList(ENPlanType2PlanStateFilter aENPlanType2PlanStateFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanType2PlanState. Получить список для просмотра*/
  public ENPlanType2PlanStateShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanType2PlanState. Получить список для просмотра по фильтру*/
  public ENPlanType2PlanStateShortList getScrollableFilteredList(ENPlanType2PlanStateFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanType2PlanState. Получить список для просмотра по условию*/
  public ENPlanType2PlanStateShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }