
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINDoc2ENServicesObject;
import com.ksoe.energynet.valueobject.filter.FINDoc2ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.lists.FINDoc2ENServicesObjectShortList;

public interface FINDoc2ENServicesObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINDoc2ENServicesObjectController";


  /*FINDoc2ENServicesObject. Добавить*/
  public int add(FINDoc2ENServicesObject aFINDoc2ENServicesObject) throws java.rmi.RemoteException;

  /*FINDoc2ENServicesObject. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINDoc2ENServicesObject. Изменить*/
  public void save(FINDoc2ENServicesObject aFINDoc2ENServicesObject) throws  java.rmi.RemoteException;

  /*FINDoc2ENServicesObject. Получить объект*/
  public FINDoc2ENServicesObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINDoc2ENServicesObject. Получить полный список*/
  public FINDoc2ENServicesObjectShortList getList() throws  java.rmi.RemoteException;

  /*FINDoc2ENServicesObject. Получить список по фильтру*/
  public FINDoc2ENServicesObjectShortList getFilteredList(FINDoc2ENServicesObjectFilter aFINDoc2ENServicesObjectFilter) throws  java.rmi.RemoteException;  
  
  /*FINDoc2ENServicesObject. Получить список для просмотра*/
  public FINDoc2ENServicesObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINDoc2ENServicesObject. Получить список для просмотра по фильтру*/
  public FINDoc2ENServicesObjectShortList getScrollableFilteredList(FINDoc2ENServicesObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINDoc2ENServicesObject. Получить список для просмотра по условию*/
  public FINDoc2ENServicesObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EFINDoc2ENServicesObject. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(FINDoc2ENServicesObjectFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }