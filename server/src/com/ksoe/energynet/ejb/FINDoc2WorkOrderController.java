
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINDoc2WorkOrder;
import com.ksoe.energynet.valueobject.filter.FINDoc2WorkOrderFilter;
import com.ksoe.energynet.valueobject.lists.FINDoc2WorkOrderShortList;

public interface FINDoc2WorkOrderController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINDoc2WorkOrderController";


  /*FINDoc2WorkOrder. Добавить*/
  public int add(FINDoc2WorkOrder aFINDoc2WorkOrder) throws java.rmi.RemoteException;

  /*FINDoc2WorkOrder. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINDoc2WorkOrder. Изменить*/
  public void save(FINDoc2WorkOrder aFINDoc2WorkOrder) throws  java.rmi.RemoteException;

  /*FINDoc2WorkOrder. Получить объект*/
  public FINDoc2WorkOrder getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINDoc2WorkOrder. Получить полный список*/
  public FINDoc2WorkOrderShortList getList() throws  java.rmi.RemoteException;

  /*FINDoc2WorkOrder. Получить список по фильтру*/
  public FINDoc2WorkOrderShortList getFilteredList(FINDoc2WorkOrderFilter aFINDoc2WorkOrderFilter) throws  java.rmi.RemoteException;  
  
  /*FINDoc2WorkOrder. Получить список для просмотра*/
  public FINDoc2WorkOrderShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINDoc2WorkOrder. Получить список для просмотра по фильтру*/
  public FINDoc2WorkOrderShortList getScrollableFilteredList(FINDoc2WorkOrderFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINDoc2WorkOrder. Получить список для просмотра по условию*/
  public FINDoc2WorkOrderShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }