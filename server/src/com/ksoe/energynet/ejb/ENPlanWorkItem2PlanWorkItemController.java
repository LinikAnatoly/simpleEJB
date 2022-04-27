
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkItem2PlanWorkItem;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItem2PlanWorkItemFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItem2PlanWorkItemShortList;

public interface ENPlanWorkItem2PlanWorkItemController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkItem2PlanWorkItemController";


  /*ENPlanWorkItem2PlanWorkItem. Добавить*/
  public int add(ENPlanWorkItem2PlanWorkItem aENPlanWorkItem2PlanWorkItem) throws java.rmi.RemoteException;

  /*ENPlanWorkItem2PlanWorkItem. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem2PlanWorkItem. Изменить*/
  public void save(ENPlanWorkItem2PlanWorkItem aENPlanWorkItem2PlanWorkItem) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem2PlanWorkItem. Получить объект*/
  public ENPlanWorkItem2PlanWorkItem getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkItem2PlanWorkItem. Получить полный список*/
  public ENPlanWorkItem2PlanWorkItemShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkItem2PlanWorkItem. Получить список по фильтру*/
  public ENPlanWorkItem2PlanWorkItemShortList getFilteredList(ENPlanWorkItem2PlanWorkItemFilter aENPlanWorkItem2PlanWorkItemFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkItem2PlanWorkItem. Получить список для просмотра*/
  public ENPlanWorkItem2PlanWorkItemShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkItem2PlanWorkItem. Получить список для просмотра по фильтру*/
  public ENPlanWorkItem2PlanWorkItemShortList getScrollableFilteredList(ENPlanWorkItem2PlanWorkItemFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkItem2PlanWorkItem. Получить список для просмотра по условию*/
  public ENPlanWorkItem2PlanWorkItemShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENPlanWorkItem2PlanWorkItem. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENPlanWorkItem2PlanWorkItemFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }