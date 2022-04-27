
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTravelSheetItemStatus;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemStatusShortList;

public interface ENTravelSheetItemStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetItemStatusController";


  /*ENTravelSheetItemStatus. Добавить*/
  public int add(ENTravelSheetItemStatus aENTravelSheetItemStatus) throws java.rmi.RemoteException;

  /*ENTravelSheetItemStatus. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemStatus. Изменить*/
  public void save(ENTravelSheetItemStatus aENTravelSheetItemStatus) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemStatus. Получить объект*/
  public ENTravelSheetItemStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemStatus. Получить полный список*/
  public ENTravelSheetItemStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheetItemStatus. Получить список по фильтру*/
  public ENTravelSheetItemStatusShortList getFilteredList(ENTravelSheetItemStatusFilter aENTravelSheetItemStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItemStatus. Получить список для просмотра*/
  public ENTravelSheetItemStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItemStatus. Получить список для просмотра по фильтру*/
  public ENTravelSheetItemStatusShortList getScrollableFilteredList(ENTravelSheetItemStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelSheetItemStatus. Получить список для просмотра по условию*/
  public ENTravelSheetItemStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }