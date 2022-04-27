
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINDoc2Act;
import com.ksoe.energynet.valueobject.filter.FINDoc2ActFilter;
import com.ksoe.energynet.valueobject.lists.FINDoc2ActShortList;

public interface FINDoc2ActController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINDoc2ActController";


  /*FINDoc2Act. Добавить*/
  public int add(FINDoc2Act aFINDoc2Act) throws java.rmi.RemoteException;

  /*FINDoc2Act. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINDoc2Act. Изменить*/
  public void save(FINDoc2Act aFINDoc2Act) throws  java.rmi.RemoteException;

  /*FINDoc2Act. Получить объект*/
  public FINDoc2Act getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINDoc2Act. Получить полный список*/
  public FINDoc2ActShortList getList() throws  java.rmi.RemoteException;

  /*FINDoc2Act. Получить список по фильтру*/
  public FINDoc2ActShortList getFilteredList(FINDoc2ActFilter aFINDoc2ActFilter) throws  java.rmi.RemoteException;  
  
  /*FINDoc2Act. Получить список для просмотра*/
  public FINDoc2ActShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINDoc2Act. Получить список для просмотра по фильтру*/
  public FINDoc2ActShortList getScrollableFilteredList(FINDoc2ActFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINDoc2Act. Получить список для просмотра по условию*/
  public FINDoc2ActShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }