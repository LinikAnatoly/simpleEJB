
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAct2Humen;
import com.ksoe.energynet.valueobject.filter.ENAct2HumenFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2HumenShortList;

public interface ENAct2HumenController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAct2HumenController";


  /*ENAct2Humen. Добавить*/
  public int add(ENAct2Humen aENAct2Humen) throws java.rmi.RemoteException;

  /*ENAct2Humen. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAct2Humen. Изменить*/
  public void save(ENAct2Humen aENAct2Humen) throws  java.rmi.RemoteException;

  /*ENAct2Humen. Получить объект*/
  public ENAct2Humen getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAct2Humen. Получить полный список*/
  public ENAct2HumenShortList getList() throws  java.rmi.RemoteException;

  /*ENAct2Humen. Получить список по фильтру*/
  public ENAct2HumenShortList getFilteredList(ENAct2HumenFilter aENAct2HumenFilter) throws  java.rmi.RemoteException;  
  
  /*ENAct2Humen. Получить список для просмотра*/
  public ENAct2HumenShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAct2Humen. Получить список для просмотра по фильтру*/
  public ENAct2HumenShortList getScrollableFilteredList(ENAct2HumenFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAct2Humen. Получить список для просмотра по условию*/
  public ENAct2HumenShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }