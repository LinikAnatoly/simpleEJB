
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAct2CostRecovery;
import com.ksoe.energynet.valueobject.filter.ENAct2CostRecoveryFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2CostRecoveryShortList;

public interface ENAct2CostRecoveryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAct2CostRecoveryController";


  /*ENAct2CostRecovery. Добавить*/
  public int add(ENAct2CostRecovery aENAct2CostRecovery) throws java.rmi.RemoteException;

  /*ENAct2CostRecovery. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAct2CostRecovery. Изменить*/
  public void save(ENAct2CostRecovery aENAct2CostRecovery) throws  java.rmi.RemoteException;

  /*ENAct2CostRecovery. Получить объект*/
  public ENAct2CostRecovery getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAct2CostRecovery. Получить полный список*/
  public ENAct2CostRecoveryShortList getList() throws  java.rmi.RemoteException;

  /*ENAct2CostRecovery. Получить список по фильтру*/
  public ENAct2CostRecoveryShortList getFilteredList(ENAct2CostRecoveryFilter aENAct2CostRecoveryFilter) throws  java.rmi.RemoteException;  
  
  /*ENAct2CostRecovery. Получить список для просмотра*/
  public ENAct2CostRecoveryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAct2CostRecovery. Получить список для просмотра по фильтру*/
  public ENAct2CostRecoveryShortList getScrollableFilteredList(ENAct2CostRecoveryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAct2CostRecovery. Получить список для просмотра по условию*/
  public ENAct2CostRecoveryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENAct2CostRecovery. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENAct2CostRecoveryFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }