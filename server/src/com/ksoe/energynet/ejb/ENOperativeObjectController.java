
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENOperativeObject;
import com.ksoe.energynet.valueobject.filter.ENOperativeObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENOperativeObjectShortList;

public interface ENOperativeObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENOperativeObjectController";


  /*ENOperativeObject. Добавить*/
  public int add(ENOperativeObject aENOperativeObject) throws java.rmi.RemoteException;

  /*ENOperativeObject. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOperativeObject. Изменить*/
  public void save(ENOperativeObject aENOperativeObject) throws  java.rmi.RemoteException;

  /*ENOperativeObject. Получить объект*/
  public ENOperativeObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOperativeObject. Получить полный список*/
  public ENOperativeObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENOperativeObject. Получить список по фильтру*/
  public ENOperativeObjectShortList getFilteredList(ENOperativeObjectFilter aENOperativeObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENOperativeObject. Получить список для просмотра*/
  public ENOperativeObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENOperativeObject. Получить список для просмотра по фильтру*/
  public ENOperativeObjectShortList getScrollableFilteredList(ENOperativeObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENOperativeObject. Получить список для просмотра по условию*/
  public ENOperativeObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENOperativeObject. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENOperativeObjectFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }