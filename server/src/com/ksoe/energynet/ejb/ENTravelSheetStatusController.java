
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTravelSheetStatus;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetStatusShortList;

public interface ENTravelSheetStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetStatusController";


  /*ENTravelSheetStatus. Добавить*/
  public int add(ENTravelSheetStatus aENTravelSheetStatus) throws java.rmi.RemoteException;

  /*ENTravelSheetStatus. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetStatus. Изменить*/
  public void save(ENTravelSheetStatus aENTravelSheetStatus) throws  java.rmi.RemoteException;

  /*ENTravelSheetStatus. Получить объект*/
  public ENTravelSheetStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetStatus. Получить полный список*/
  public ENTravelSheetStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheetStatus. Получить список по фильтру*/
  public ENTravelSheetStatusShortList getFilteredList(ENTravelSheetStatusFilter aENTravelSheetStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetStatus. Получить список для просмотра*/
  public ENTravelSheetStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetStatus. Получить список для просмотра по фильтру*/
  public ENTravelSheetStatusShortList getScrollableFilteredList(ENTravelSheetStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelSheetStatus. Получить список для просмотра по условию*/
  public ENTravelSheetStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }