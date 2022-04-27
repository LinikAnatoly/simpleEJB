
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.filter.FINMaterialsStatusFilter;
import com.ksoe.energynet.valueobject.lists.FINMaterialsStatusShortList;

public interface FINMaterialsStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINMaterialsStatusController";


  /*FINMaterialsStatus. Добавить*/
  public int add(FINMaterialsStatus aFINMaterialsStatus) throws java.rmi.RemoteException;

  /*FINMaterialsStatus. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINMaterialsStatus. Изменить*/
  public void save(FINMaterialsStatus aFINMaterialsStatus) throws  java.rmi.RemoteException;

  /*FINMaterialsStatus. Получить объект*/
  public FINMaterialsStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINMaterialsStatus. Получить полный список*/
  public FINMaterialsStatusShortList getList() throws  java.rmi.RemoteException;

  /*FINMaterialsStatus. Получить список по фильтру*/
  public FINMaterialsStatusShortList getFilteredList(FINMaterialsStatusFilter aFINMaterialsStatusFilter) throws  java.rmi.RemoteException;  
  
  /*FINMaterialsStatus. Получить список для просмотра*/
  public FINMaterialsStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINMaterialsStatus. Получить список для просмотра по фильтру*/
  public FINMaterialsStatusShortList getScrollableFilteredList(FINMaterialsStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINMaterialsStatus. Получить список для просмотра по условию*/
  public FINMaterialsStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }