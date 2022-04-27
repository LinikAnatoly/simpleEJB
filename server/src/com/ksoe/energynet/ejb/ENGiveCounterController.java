
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENGiveCounter;
import com.ksoe.energynet.valueobject.filter.ENGiveCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENGiveCounterShortList;

public interface ENGiveCounterController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENGiveCounterController";


  /*ENGiveCounter. Добавить*/
  public int add(ENGiveCounter aENGiveCounter) throws java.rmi.RemoteException;

  /*ENGiveCounter. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENGiveCounter. Изменить*/
  public void save(ENGiveCounter aENGiveCounter) throws  java.rmi.RemoteException;

  /*ENGiveCounter. Получить объект*/
  public ENGiveCounter getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENGiveCounter. Получить полный список*/
  public ENGiveCounterShortList getList() throws  java.rmi.RemoteException;

  /*ENGiveCounter. Получить список по фильтру*/
  public ENGiveCounterShortList getFilteredList(ENGiveCounterFilter aENGiveCounterFilter) throws  java.rmi.RemoteException;  
  
  /*ENGiveCounter. Получить список для просмотра*/
  public ENGiveCounterShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENGiveCounter. Получить список для просмотра по фильтру*/
  public ENGiveCounterShortList getScrollableFilteredList(ENGiveCounterFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENGiveCounter. Получить список для просмотра по условию*/
  public ENGiveCounterShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENGiveCounter. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENGiveCounterFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }