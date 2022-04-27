
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTiresInstallStatus;
import com.ksoe.energynet.valueobject.filter.ENTiresInstallStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENTiresInstallStatusShortList;

public interface ENTiresInstallStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTiresInstallStatusController";


  /*ENTiresInstallStatus. Добавить*/
  public int add(ENTiresInstallStatus aENTiresInstallStatus) throws java.rmi.RemoteException;

  /*ENTiresInstallStatus. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTiresInstallStatus. Изменить*/
  public void save(ENTiresInstallStatus aENTiresInstallStatus) throws  java.rmi.RemoteException;

  /*ENTiresInstallStatus. Получить объект*/
  public ENTiresInstallStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTiresInstallStatus. Получить полный список*/
  public ENTiresInstallStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENTiresInstallStatus. Получить список по фильтру*/
  public ENTiresInstallStatusShortList getFilteredList(ENTiresInstallStatusFilter aENTiresInstallStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENTiresInstallStatus. Получить список для просмотра*/
  public ENTiresInstallStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTiresInstallStatus. Получить список для просмотра по фильтру*/
  public ENTiresInstallStatusShortList getScrollableFilteredList(ENTiresInstallStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTiresInstallStatus. Получить список для просмотра по условию*/
  public ENTiresInstallStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTiresInstallStatus. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTiresInstallStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }