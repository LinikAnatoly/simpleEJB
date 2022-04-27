
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkReason;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkReasonFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkReasonShortList;

public interface ENPlanWorkReasonController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkReasonController";


  /*ENPlanWorkReason. Добавить*/
  public int add(ENPlanWorkReason aENPlanWorkReason) throws java.rmi.RemoteException;

  /*ENPlanWorkReason. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkReason. Изменить*/
  public void save(ENPlanWorkReason aENPlanWorkReason) throws  java.rmi.RemoteException;

  /*ENPlanWorkReason. Получить объект*/
  public ENPlanWorkReason getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkReason. Получить полный список*/
  public ENPlanWorkReasonShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkReason. Получить список по фильтру*/
  public ENPlanWorkReasonShortList getFilteredList(ENPlanWorkReasonFilter aENPlanWorkReasonFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkReason. Получить список для просмотра*/
  public ENPlanWorkReasonShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkReason. Получить список для просмотра по фильтру*/
  public ENPlanWorkReasonShortList getScrollableFilteredList(ENPlanWorkReasonFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkReason. Получить список для просмотра по условию*/
  public ENPlanWorkReasonShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENPlanWorkReason. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENPlanWorkReasonFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }