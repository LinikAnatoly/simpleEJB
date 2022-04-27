
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportOrder2Travel;
import com.ksoe.energynet.valueobject.filter.ENTransportOrder2TravelFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportOrder2TravelShortList;

public interface ENTransportOrder2TravelController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportOrder2TravelController";


  /*ENTransportOrder2Travel. Добавить*/
  public int add(ENTransportOrder2Travel aENTransportOrder2Travel) throws java.rmi.RemoteException;

  /*ENTransportOrder2Travel. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportOrder2Travel. Изменить*/
  public void save(ENTransportOrder2Travel aENTransportOrder2Travel) throws  java.rmi.RemoteException;

  /*ENTransportOrder2Travel. Получить объект*/
  public ENTransportOrder2Travel getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportOrder2Travel. Получить полный список*/
  public ENTransportOrder2TravelShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportOrder2Travel. Получить список по фильтру*/
  public ENTransportOrder2TravelShortList getFilteredList(ENTransportOrder2TravelFilter aENTransportOrder2TravelFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportOrder2Travel. Получить список для просмотра*/
  public ENTransportOrder2TravelShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportOrder2Travel. Получить список для просмотра по фильтру*/
  public ENTransportOrder2TravelShortList getScrollableFilteredList(ENTransportOrder2TravelFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportOrder2Travel. Получить список для просмотра по условию*/
  public ENTransportOrder2TravelShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportOrder2Travel. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTransportOrder2TravelFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }