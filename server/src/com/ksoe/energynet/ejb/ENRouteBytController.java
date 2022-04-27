
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENRouteByt;
import com.ksoe.energynet.valueobject.filter.ENRouteBytFilter;
import com.ksoe.energynet.valueobject.lists.ENRouteBytShortList;

public interface ENRouteBytController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENRouteBytController";


  /*ENRouteByt. Добавить*/
  public int add(ENRouteByt aENRouteByt) throws java.rmi.RemoteException;

  /*ENRouteByt. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRouteByt. Изменить*/
  public void save(ENRouteByt aENRouteByt) throws  java.rmi.RemoteException;

  /*ENRouteByt. Получить объект*/
  public ENRouteByt getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRouteByt. Получить полный список*/
  public ENRouteBytShortList getList() throws  java.rmi.RemoteException;

  /*ENRouteByt. Получить список по фильтру*/
  public ENRouteBytShortList getFilteredList(ENRouteBytFilter aENRouteBytFilter) throws  java.rmi.RemoteException;  
  
  /*ENRouteByt. Получить список для просмотра*/
  public ENRouteBytShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENRouteByt. Получить список для просмотра по фильтру*/
  public ENRouteBytShortList getScrollableFilteredList(ENRouteBytFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENRouteByt. Получить список для просмотра по условию*/
  public ENRouteBytShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENRouteByt. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENRouteBytFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }