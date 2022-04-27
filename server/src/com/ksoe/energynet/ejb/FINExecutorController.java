
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINExecutor;
import com.ksoe.energynet.valueobject.filter.FINExecutorFilter;
import com.ksoe.energynet.valueobject.lists.FINExecutorShortList;

public interface FINExecutorController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINExecutorController";


  /*FINExecutor. Добавить*/
  public int add(FINExecutor aFINExecutor) throws java.rmi.RemoteException;

  /*FINExecutor. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINExecutor. Изменить*/
  public void save(FINExecutor aFINExecutor) throws  java.rmi.RemoteException;

  /*FINExecutor. Получить объект*/
  public FINExecutor getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINExecutor. Получить полный список*/
  public FINExecutorShortList getList() throws  java.rmi.RemoteException;

  /*FINExecutor. Получить список по фильтру*/
  public FINExecutorShortList getFilteredList(FINExecutorFilter aFINExecutorFilter) throws  java.rmi.RemoteException;

  /*FINExecutor. Получить список для просмотра*/
  public FINExecutorShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*FINExecutor. Получить список для просмотра по фильтру*/
  public FINExecutorShortList getScrollableFilteredList(FINExecutorFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*FINExecutor. Получить список для просмотра по условию*/
  public FINExecutorShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /* список из ФинКол ...*/
  public FINExecutorShortList getFINExecutorList(FINExecutorFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  public FINExecutorShortList getFINExecutorList(FINExecutorFilter filterObject, int fromPosition, int quantity, boolean reloadFinExecutor) throws java.rmi.RemoteException;

  /* по коду подразделения выбирает все айди подразделений из кадров которые имеют признак  НВЗ_Е */
  public String getPodrIdFromKadryByDepartmentCodeNVZ_E( int departmentCode ,  String dateSrez) throws java.rmi.RemoteException;

  /* по коду подразделения выбирает все айди подразделений из кадров которые имеют признак НВЗ */
  public String getPodrIdFromKadryByDepartmentCodeNVZ( int departmentCode ,  String dateSrez) throws java.rmi.RemoteException;

  /*  // возвращает строку fincode из finexecutor (код подразделения из кадров) по коду подразделения из аксапты */
  public String getpodrFinCodeBypodrAxCodeFromFinexecutor(String podrAxCode) throws java.rmi.RemoteException;
  
  public String[] getAllIdsByParent(String parent, boolean isMDAX) throws java.rmi.RemoteException;
  public String[] getAllIdsByParent(String parent) throws java.rmi.RemoteException;
  }