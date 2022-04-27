
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkSource;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkSourceFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkSourceShortList;

public interface ENPlanWorkSourceController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkSourceController";


  /*ENPlanWorkSource. Добавить*/
  public int add(ENPlanWorkSource aENPlanWorkSource) throws java.rmi.RemoteException;

  /*ENPlanWorkSource. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkSource. Изменить*/
  public void save(ENPlanWorkSource aENPlanWorkSource) throws  java.rmi.RemoteException;

  /*ENPlanWorkSource. Получить объект*/
  public ENPlanWorkSource getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkSource. Получить полный список*/
  public ENPlanWorkSourceShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkSource. Получить список по фильтру*/
  public ENPlanWorkSourceShortList getFilteredList(ENPlanWorkSourceFilter aENPlanWorkSourceFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkSource. Получить список для просмотра*/
  public ENPlanWorkSourceShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWorkSource. Получить список для просмотра по фильтру*/
  public ENPlanWorkSourceShortList getScrollableFilteredList(ENPlanWorkSourceFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWorkSource. Получить список для просмотра по условию*/
  public ENPlanWorkSourceShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENPlanWorkSource. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENPlanWorkSourceFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }