
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemKindFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemKindShortList;

public interface ENEstimateItemKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENEstimateItemKindController";


  /*ENEstimateItemKind. Добавить*/
  public int add(ENEstimateItemKind aENEstimateItemKind) throws java.rmi.RemoteException;

  /*ENEstimateItemKind. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItemKind. Изменить*/
  public void save(ENEstimateItemKind aENEstimateItemKind) throws  java.rmi.RemoteException;

  /*ENEstimateItemKind. Получить объект*/
  public ENEstimateItemKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItemKind. Получить полный список*/
  public ENEstimateItemKindShortList getList() throws  java.rmi.RemoteException;

  /*ENEstimateItemKind. Получить список по фильтру*/
  public ENEstimateItemKindShortList getFilteredList(ENEstimateItemKindFilter aENEstimateItemKindFilter) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItemKind. Получить список для просмотра*/
  public ENEstimateItemKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItemKind. Получить список для просмотра по фильтру*/
  public ENEstimateItemKindShortList getScrollableFilteredList(ENEstimateItemKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENEstimateItemKind. Получить список для просмотра по условию*/
  public ENEstimateItemKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }