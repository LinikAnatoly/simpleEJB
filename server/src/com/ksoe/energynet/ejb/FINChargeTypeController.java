
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINChargeType;
import com.ksoe.energynet.valueobject.filter.FINChargeTypeFilter;
import com.ksoe.energynet.valueobject.lists.FINChargeTypeShortList;

public interface FINChargeTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINChargeTypeController";


  /*FINChargeType. Добавить*/
  public int add(FINChargeType aFINChargeType) throws java.rmi.RemoteException;

  /*FINChargeType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINChargeType. Изменить*/
  public void save(FINChargeType aFINChargeType) throws  java.rmi.RemoteException;

  /*FINChargeType. Получить объект*/
  public FINChargeType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINChargeType. Получить полный список*/
  public FINChargeTypeShortList getList() throws  java.rmi.RemoteException;

  /*FINChargeType. Получить список по фильтру*/
  public FINChargeTypeShortList getFilteredList(FINChargeTypeFilter aFINChargeTypeFilter) throws  java.rmi.RemoteException;  
  
  /*FINChargeType. Получить список для просмотра*/
  public FINChargeTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINChargeType. Получить список для просмотра по фильтру*/
  public FINChargeTypeShortList getScrollableFilteredList(FINChargeTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINChargeType. Получить список для просмотра по условию*/
  public FINChargeTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EFINChargeType. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(FINChargeTypeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }