
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENActIncomeStatus;
import com.ksoe.energynet.valueobject.filter.ENActIncomeStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENActIncomeStatusShortList;

public interface ENActIncomeStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENActIncomeStatusController";


  /*ENActIncomeStatus. Добавить*/
  public int add(ENActIncomeStatus aENActIncomeStatus) throws java.rmi.RemoteException;

  /*ENActIncomeStatus. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActIncomeStatus. Изменить*/
  public void save(ENActIncomeStatus aENActIncomeStatus) throws  java.rmi.RemoteException;

  /*ENActIncomeStatus. Получить объект*/
  public ENActIncomeStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActIncomeStatus. Получить полный список*/
  public ENActIncomeStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENActIncomeStatus. Получить список по фильтру*/
  public ENActIncomeStatusShortList getFilteredList(ENActIncomeStatusFilter aENActIncomeStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENActIncomeStatus. Получить список для просмотра*/
  public ENActIncomeStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENActIncomeStatus. Получить список для просмотра по фильтру*/
  public ENActIncomeStatusShortList getScrollableFilteredList(ENActIncomeStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENActIncomeStatus. Получить список для просмотра по условию*/
  public ENActIncomeStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENActIncomeStatus. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENActIncomeStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }