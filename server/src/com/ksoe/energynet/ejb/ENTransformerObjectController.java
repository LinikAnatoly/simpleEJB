
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransformerObject;
import com.ksoe.energynet.valueobject.filter.ENTransformerObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENTransformerObjectShortList;

public interface ENTransformerObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransformerObjectController";


  /*ENTransformerObject. Добавить*/
  public int add(ENTransformerObject aENTransformerObject) throws java.rmi.RemoteException;

  /*ENTransformerObject. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransformerObject. Изменить*/
  public void save(ENTransformerObject aENTransformerObject) throws  java.rmi.RemoteException;

  /*ENTransformerObject. Получить объект*/
  public ENTransformerObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransformerObject. Получить полный список*/
  public ENTransformerObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENTransformerObject. Получить список по фильтру*/
  public ENTransformerObjectShortList getFilteredList(ENTransformerObjectFilter aENTransformerObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransformerObject. Получить список для просмотра*/
  public ENTransformerObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransformerObject. Получить список для просмотра по фильтру*/
  public ENTransformerObjectShortList getScrollableFilteredList(ENTransformerObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransformerObject. Получить список для просмотра по условию*/
  public ENTransformerObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }