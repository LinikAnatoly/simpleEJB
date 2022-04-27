
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMolStatus;
import com.ksoe.energynet.valueobject.filter.ENMolStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENMolStatusShortList;

public interface ENMolStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMolStatusController";


  /*ENMolStatus. Добавить*/
  public int add(ENMolStatus aENMolStatus) throws java.rmi.RemoteException;

  /*ENMolStatus. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMolStatus. Изменить*/
  public void save(ENMolStatus aENMolStatus) throws  java.rmi.RemoteException;

  /*ENMolStatus. Получить объект*/
  public ENMolStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMolStatus. Получить полный список*/
  public ENMolStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENMolStatus. Получить список по фильтру*/
  public ENMolStatusShortList getFilteredList(ENMolStatusFilter aENMolStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENMolStatus. Получить список для просмотра*/
  public ENMolStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMolStatus. Получить список для просмотра по фильтру*/
  public ENMolStatusShortList getScrollableFilteredList(ENMolStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMolStatus. Получить список для просмотра по условию*/
  public ENMolStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENMolStatus. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENMolStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }