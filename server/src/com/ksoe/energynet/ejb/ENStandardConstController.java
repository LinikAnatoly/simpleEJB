
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENStandardConst;
import com.ksoe.energynet.valueobject.filter.ENStandardConstFilter;
import com.ksoe.energynet.valueobject.lists.ENStandardConstShortList;

public interface ENStandardConstController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENStandardConstController";


  /*ENStandardConst. Добавить*/
  public int add(ENStandardConst aENStandardConst) throws java.rmi.RemoteException;

  /*ENStandardConst. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENStandardConst. Изменить*/
  public void save(ENStandardConst aENStandardConst) throws  java.rmi.RemoteException;

  /*ENStandardConst. Получить объект*/
  public ENStandardConst getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENStandardConst. Получить полный список*/
  public ENStandardConstShortList getList() throws  java.rmi.RemoteException;

  /*ENStandardConst. Получить список по фильтру*/
  public ENStandardConstShortList getFilteredList(ENStandardConstFilter aENStandardConstFilter) throws  java.rmi.RemoteException;  
  
  /*ENStandardConst. Получить список для просмотра*/
  public ENStandardConstShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENStandardConst. Получить список для просмотра по фильтру*/
  public ENStandardConstShortList getScrollableFilteredList(ENStandardConstFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENStandardConst. Получить список для просмотра по условию*/
  public ENStandardConstShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENStandardConst. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENStandardConstFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }