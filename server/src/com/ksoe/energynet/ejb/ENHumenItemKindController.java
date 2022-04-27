
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENHumenItemKind;
import com.ksoe.energynet.valueobject.filter.ENHumenItemKindFilter;
import com.ksoe.energynet.valueobject.lists.ENHumenItemKindShortList;

public interface ENHumenItemKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENHumenItemKindController";


  /*ENHumenItemKind. Добавить*/
  public int add(ENHumenItemKind aENHumenItemKind) throws java.rmi.RemoteException;

  /*ENHumenItemKind. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENHumenItemKind. Изменить*/
  public void save(ENHumenItemKind aENHumenItemKind) throws  java.rmi.RemoteException;

  /*ENHumenItemKind. Получить объект*/
  public ENHumenItemKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENHumenItemKind. Получить полный список*/
  public ENHumenItemKindShortList getList() throws  java.rmi.RemoteException;

  /*ENHumenItemKind. Получить список по фильтру*/
  public ENHumenItemKindShortList getFilteredList(ENHumenItemKindFilter aENHumenItemKindFilter) throws  java.rmi.RemoteException;  
  
  /*ENHumenItemKind. Получить список для просмотра*/
  public ENHumenItemKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENHumenItemKind. Получить список для просмотра по фильтру*/
  public ENHumenItemKindShortList getScrollableFilteredList(ENHumenItemKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENHumenItemKind. Получить список для просмотра по условию*/
  public ENHumenItemKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }