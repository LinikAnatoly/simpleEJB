
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENReconstrModernOZStatus;
import com.ksoe.energynet.valueobject.filter.ENReconstrModernOZStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENReconstrModernOZStatusShortList;

public interface ENReconstrModernOZStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENReconstrModernOZStatusController";


  /*ENReconstrModernOZStatus. Добавить*/
  public int add(ENReconstrModernOZStatus aENReconstrModernOZStatus) throws java.rmi.RemoteException;

  /*ENReconstrModernOZStatus. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENReconstrModernOZStatus. Изменить*/
  public void save(ENReconstrModernOZStatus aENReconstrModernOZStatus) throws  java.rmi.RemoteException;

  /*ENReconstrModernOZStatus. Получить объект*/
  public ENReconstrModernOZStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENReconstrModernOZStatus. Получить полный список*/
  public ENReconstrModernOZStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENReconstrModernOZStatus. Получить список по фильтру*/
  public ENReconstrModernOZStatusShortList getFilteredList(ENReconstrModernOZStatusFilter aENReconstrModernOZStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENReconstrModernOZStatus. Получить список для просмотра*/
  public ENReconstrModernOZStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENReconstrModernOZStatus. Получить список для просмотра по фильтру*/
  public ENReconstrModernOZStatusShortList getScrollableFilteredList(ENReconstrModernOZStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENReconstrModernOZStatus. Получить список для просмотра по условию*/
  public ENReconstrModernOZStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENReconstrModernOZStatus. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENReconstrModernOZStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }