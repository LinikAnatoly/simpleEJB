
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENManagement;
import com.ksoe.energynet.valueobject.filter.ENManagementFilter;
import com.ksoe.energynet.valueobject.lists.ENManagementShortList;

public interface ENManagementController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENManagementController";


  /*ENManagement. Добавить*/
  public int add(ENManagement aENManagement) throws java.rmi.RemoteException;

  /*ENManagement. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENManagement. Изменить*/
  public void save(ENManagement aENManagement) throws  java.rmi.RemoteException;

  /*ENManagement. Получить объект*/
  public ENManagement getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENManagement. Получить полный список*/
  public ENManagementShortList getList() throws  java.rmi.RemoteException;

  /*ENManagement. Получить список по фильтру*/
  public ENManagementShortList getFilteredList(ENManagementFilter aENManagementFilter) throws  java.rmi.RemoteException;  
  
  /*ENManagement. Получить список для просмотра*/
  public ENManagementShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENManagement. Получить список для просмотра по фильтру*/
  public ENManagementShortList getScrollableFilteredList(ENManagementFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENManagement. Получить список для просмотра по условию*/
  public ENManagementShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENManagement. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENManagementFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }