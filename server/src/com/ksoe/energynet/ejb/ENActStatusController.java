
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.filter.ENActStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENActStatusShortList;

public interface ENActStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENActStatusController";


  /*ENActStatus. Добавить*/
  public int add(ENActStatus aENActStatus) throws java.rmi.RemoteException;

  /*ENActStatus. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActStatus. Изменить*/
  public void save(ENActStatus aENActStatus) throws  java.rmi.RemoteException;

  /*ENActStatus. Получить объект*/
  public ENActStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActStatus. Получить полный список*/
  public ENActStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENActStatus. Получить список по фильтру*/
  public ENActStatusShortList getFilteredList(ENActStatusFilter aENActStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENActStatus. Получить список для просмотра*/
  public ENActStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENActStatus. Получить список для просмотра по фильтру*/
  public ENActStatusShortList getScrollableFilteredList(ENActStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENActStatus. Получить список для просмотра по условию*/
  public ENActStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }