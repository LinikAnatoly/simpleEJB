
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTravelSheetType;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetTypeShortList;

public interface ENTravelSheetTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetTypeController";


  /*ENTravelSheetType. Добавить*/
  public int add(ENTravelSheetType aENTravelSheetType) throws java.rmi.RemoteException;

  /*ENTravelSheetType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetType. Изменить*/
  public void save(ENTravelSheetType aENTravelSheetType) throws  java.rmi.RemoteException;

  /*ENTravelSheetType. Получить объект*/
  public ENTravelSheetType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetType. Получить полный список*/
  public ENTravelSheetTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheetType. Получить список по фильтру*/
  public ENTravelSheetTypeShortList getFilteredList(ENTravelSheetTypeFilter aENTravelSheetTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetType. Получить список для просмотра*/
  public ENTravelSheetTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetType. Получить список для просмотра по фильтру*/
  public ENTravelSheetTypeShortList getScrollableFilteredList(ENTravelSheetTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelSheetType. Получить список для просмотра по условию*/
  public ENTravelSheetTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }