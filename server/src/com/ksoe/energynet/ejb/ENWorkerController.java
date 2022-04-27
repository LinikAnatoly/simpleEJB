
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENWorker;
import com.ksoe.energynet.valueobject.filter.ENWorkerFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkerShortList;

public interface ENWorkerController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENWorkerController";


  /*ENWorker. Добавить*/
  public int add(ENWorker aENWorker) throws java.rmi.RemoteException;

  /*ENWorker. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENWorker. Изменить*/
  public void save(ENWorker aENWorker) throws  java.rmi.RemoteException;

  /*ENWorker. Получить объект*/
  public ENWorker getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENWorker. Получить полный список*/
  public ENWorkerShortList getList() throws  java.rmi.RemoteException;

  /*ENWorker. Получить список по фильтру*/
  public ENWorkerShortList getFilteredList(ENWorkerFilter aENWorkerFilter) throws  java.rmi.RemoteException;  
  
  /*ENWorker. Получить список для просмотра*/
  public ENWorkerShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENWorker. Получить список для просмотра по фильтру*/
  public ENWorkerShortList getScrollableFilteredList(ENWorkerFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENWorker. Получить список для просмотра по условию*/
  public ENWorkerShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }