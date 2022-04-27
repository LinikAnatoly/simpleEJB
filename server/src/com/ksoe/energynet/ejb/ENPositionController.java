
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPosition;
import com.ksoe.energynet.valueobject.filter.ENPositionFilter;
import com.ksoe.energynet.valueobject.lists.ENPositionShortList;

public interface ENPositionController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPositionController";


  /*ENPosition. Добавить*/
  public int add(ENPosition aENPosition) throws java.rmi.RemoteException;

  /*ENPosition. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPosition. Изменить*/
  public void save(ENPosition aENPosition) throws  java.rmi.RemoteException;

  /*ENPosition. Получить объект*/
  public ENPosition getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPosition. Получить полный список*/
  public ENPositionShortList getList() throws  java.rmi.RemoteException;

  /*ENPosition. Получить список по фильтру*/
  public ENPositionShortList getFilteredList(ENPositionFilter aENPositionFilter) throws  java.rmi.RemoteException;  
  
  /*ENPosition. Получить список для просмотра*/
  public ENPositionShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPosition. Получить список для просмотра по фильтру*/
  public ENPositionShortList getScrollableFilteredList(ENPositionFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPosition. Получить список для просмотра по условию*/
  public ENPositionShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }