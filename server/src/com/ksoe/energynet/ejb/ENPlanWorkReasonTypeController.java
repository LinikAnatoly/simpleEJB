
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkReasonType;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkReasonTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkReasonTypeShortList;

public interface ENPlanWorkReasonTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkReasonTypeController";


  /*ENPlanWorkReasonType. Добавить*/
  public int add(ENPlanWorkReasonType aENPlanWorkReasonType) throws java.rmi.RemoteException;

  /*ENPlanWorkReasonType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkReasonType. Изменить*/
  public void save(ENPlanWorkReasonType aENPlanWorkReasonType) throws  java.rmi.RemoteException;

  /*ENPlanWorkReasonType. Получить объект*/
  public ENPlanWorkReasonType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkReasonType. Получить полный список*/
  public ENPlanWorkReasonTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkReasonType. Получить список по фильтру*/
  public ENPlanWorkReasonTypeShortList getFilteredList(ENPlanWorkReasonTypeFilter aENPlanWorkReasonTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkReasonType. Получить список для просмотра*/
  public ENPlanWorkReasonTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkReasonType. Получить список для просмотра по фильтру*/
  public ENPlanWorkReasonTypeShortList getScrollableFilteredList(ENPlanWorkReasonTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkReasonType. Получить список для просмотра по условию*/
  public ENPlanWorkReasonTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENPlanWorkReasonType. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENPlanWorkReasonTypeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }