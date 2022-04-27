
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTravelWorkMode;
import com.ksoe.energynet.valueobject.filter.ENTravelWorkModeFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelWorkModeShortList;

public interface ENTravelWorkModeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelWorkModeController";


  /*ENTravelWorkMode. Добавить*/
  public int add(ENTravelWorkMode aENTravelWorkMode) throws java.rmi.RemoteException;

  /*ENTravelWorkMode. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelWorkMode. Изменить*/
  public void save(ENTravelWorkMode aENTravelWorkMode) throws  java.rmi.RemoteException;

  /*ENTravelWorkMode. Получить объект*/
  public ENTravelWorkMode getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelWorkMode. Получить полный список*/
  public ENTravelWorkModeShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelWorkMode. Получить список по фильтру*/
  public ENTravelWorkModeShortList getFilteredList(ENTravelWorkModeFilter aENTravelWorkModeFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelWorkMode. Получить список для просмотра*/
  public ENTravelWorkModeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelWorkMode. Получить список для просмотра по фильтру*/
  public ENTravelWorkModeShortList getScrollableFilteredList(ENTravelWorkModeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelWorkMode. Получить список для просмотра по условию*/
  public ENTravelWorkModeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }