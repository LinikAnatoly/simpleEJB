
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENContragent;
import com.ksoe.energynet.valueobject.filter.ENContragentFilter;
import com.ksoe.energynet.valueobject.lists.ENContragentShortList;

public interface ENContragentController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENContragentController";


  /*ENContragent. Добавить*/
  public int add(ENContragent aENContragent) throws java.rmi.RemoteException;

  /*ENContragent. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENContragent. Изменить*/
  public void save(ENContragent aENContragent) throws  java.rmi.RemoteException;

  /*ENContragent. Получить объект*/
  public ENContragent getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENContragent. Получить полный список*/
  public ENContragentShortList getList() throws  java.rmi.RemoteException;

  /*ENContragent. Получить список по фильтру*/
  public ENContragentShortList getFilteredList(ENContragentFilter aENContragentFilter) throws  java.rmi.RemoteException;

  /*ENContragent. Получить список для просмотра*/
  public ENContragentShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENContragent. Получить список для просмотра по фильтру*/
  public ENContragentShortList getScrollableFilteredList(ENContragentFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENContragent. Получить список для просмотра по условию*/
  public ENContragentShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /*ENContragent. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENContragentFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

}