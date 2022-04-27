
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMark;
import com.ksoe.energynet.valueobject.filter.ENMarkFilter;
import com.ksoe.energynet.valueobject.lists.ENMarkShortList;

public interface ENMarkController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMarkController";


  /*ENMark. Добавить*/
  public int add(ENMark aENMark) throws java.rmi.RemoteException;

  /*ENMark. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMark. Изменить*/
  public void save(ENMark aENMark) throws  java.rmi.RemoteException;

  /*ENMark. Получить объект*/
  public ENMark getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMark. Получить полный список*/
  public ENMarkShortList getList() throws  java.rmi.RemoteException;

  /*ENMark. Получить список по фильтру*/
  public ENMarkShortList getFilteredList(ENMarkFilter aENMarkFilter) throws  java.rmi.RemoteException;  
  
  /*ENMark. Получить список для просмотра*/
  public ENMarkShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMark. Получить список для просмотра по фильтру*/
  public ENMarkShortList getScrollableFilteredList(ENMarkFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMark. Получить список для просмотра по условию*/
  public ENMarkShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }