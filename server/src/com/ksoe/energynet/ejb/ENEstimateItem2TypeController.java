
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENEstimateItem2Type;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2TypeFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2TypeShortList;

public interface ENEstimateItem2TypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENEstimateItem2TypeController";


  /*ENEstimateItem2Type. Добавить*/
  public int add(ENEstimateItem2Type aENEstimateItem2Type) throws java.rmi.RemoteException;

  /*ENEstimateItem2Type. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItem2Type. Изменить*/
  public void save(ENEstimateItem2Type aENEstimateItem2Type) throws  java.rmi.RemoteException;

  /*ENEstimateItem2Type. Получить объект*/
  public ENEstimateItem2Type getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItem2Type. Получить полный список*/
  public ENEstimateItem2TypeShortList getList() throws  java.rmi.RemoteException;

  /*ENEstimateItem2Type. Получить список по фильтру*/
  public ENEstimateItem2TypeShortList getFilteredList(ENEstimateItem2TypeFilter aENEstimateItem2TypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItem2Type. Получить список для просмотра*/
  public ENEstimateItem2TypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItem2Type. Получить список для просмотра по фильтру*/
  public ENEstimateItem2TypeShortList getScrollableFilteredList(ENEstimateItem2TypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENEstimateItem2Type. Получить список для просмотра по условию*/
  public ENEstimateItem2TypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }