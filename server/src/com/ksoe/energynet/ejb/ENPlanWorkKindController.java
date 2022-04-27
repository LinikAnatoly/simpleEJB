
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkKindFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkKindShortList;

public interface ENPlanWorkKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkKindController";


  /*ENPlanWorkKind. Добавить*/
  public int add(ENPlanWorkKind aENPlanWorkKind) throws java.rmi.RemoteException;

  /*ENPlanWorkKind. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkKind. Изменить*/
  public void save(ENPlanWorkKind aENPlanWorkKind) throws  java.rmi.RemoteException;

  /*ENPlanWorkKind. Получить объект*/
  public ENPlanWorkKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkKind. Получить полный список*/
  public ENPlanWorkKindShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkKind. Получить список по фильтру*/
  public ENPlanWorkKindShortList getFilteredList(ENPlanWorkKindFilter aENPlanWorkKindFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkKind. Получить список для просмотра*/
  public ENPlanWorkKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkKind. Получить список для просмотра по фильтру*/
  public ENPlanWorkKindShortList getScrollableFilteredList(ENPlanWorkKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkKind. Получить список для просмотра по условию*/
  public ENPlanWorkKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }