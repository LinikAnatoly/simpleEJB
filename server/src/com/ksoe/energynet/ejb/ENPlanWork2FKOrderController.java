
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWork2FKOrder;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2FKOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2FKOrderShortList;

public interface ENPlanWork2FKOrderController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWork2FKOrderController";


  /*ENPlanWork2FKOrder. Добавить*/
  public int add(ENPlanWork2FKOrder aENPlanWork2FKOrder) throws java.rmi.RemoteException;

  /*ENPlanWork2FKOrder. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWork2FKOrder. Изменить*/
  public void save(ENPlanWork2FKOrder aENPlanWork2FKOrder) throws  java.rmi.RemoteException;

  /*ENPlanWork2FKOrder. Получить объект*/
  public ENPlanWork2FKOrder getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWork2FKOrder. Получить полный список*/
  public ENPlanWork2FKOrderShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWork2FKOrder. Получить список по фильтру*/
  public ENPlanWork2FKOrderShortList getFilteredList(ENPlanWork2FKOrderFilter aENPlanWork2FKOrderFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWork2FKOrder. Получить список для просмотра*/
  public ENPlanWork2FKOrderShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWork2FKOrder. Получить список для просмотра по фильтру*/
  public ENPlanWork2FKOrderShortList getScrollableFilteredList(ENPlanWork2FKOrderFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWork2FKOrder. Получить список для просмотра по условию*/
  public ENPlanWork2FKOrderShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENPlanWork2FKOrder. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENPlanWork2FKOrderFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }