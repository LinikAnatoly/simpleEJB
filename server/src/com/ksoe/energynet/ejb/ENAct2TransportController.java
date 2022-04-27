
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAct2Transport;
import com.ksoe.energynet.valueobject.filter.ENAct2TransportFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2TransportShortList;

public interface ENAct2TransportController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAct2TransportController";


  /*ENAct2Transport. Добавить*/
  public int add(ENAct2Transport aENAct2Transport) throws java.rmi.RemoteException;

  /*ENAct2Transport. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAct2Transport. Изменить*/
  public void save(ENAct2Transport aENAct2Transport) throws  java.rmi.RemoteException;

  /*ENAct2Transport. Получить объект*/
  public ENAct2Transport getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAct2Transport. Получить полный список*/
  public ENAct2TransportShortList getList() throws  java.rmi.RemoteException;

  /*ENAct2Transport. Получить список по фильтру*/
  public ENAct2TransportShortList getFilteredList(ENAct2TransportFilter aENAct2TransportFilter) throws  java.rmi.RemoteException;  
  
  /*ENAct2Transport. Получить список для просмотра*/
  public ENAct2TransportShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAct2Transport. Получить список для просмотра по фильтру*/
  public ENAct2TransportShortList getScrollableFilteredList(ENAct2TransportFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAct2Transport. Получить список для просмотра по условию*/
  public ENAct2TransportShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }