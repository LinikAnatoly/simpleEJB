
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENCfoData;
import com.ksoe.energynet.valueobject.filter.ENCfoDataFilter;
import com.ksoe.energynet.valueobject.lists.ENCfoDataShortList;

public interface ENCfoDataController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENCfoDataController";


  /*ENCfoData. Добавить*/
  public int add(ENCfoData aENCfoData) throws java.rmi.RemoteException;

  /*ENCfoData. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENCfoData. Изменить*/
  public void save(ENCfoData aENCfoData) throws  java.rmi.RemoteException;

  /*ENCfoData. Получить объект*/
  public ENCfoData getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENCfoData. Получить полный список*/
  public ENCfoDataShortList getList() throws  java.rmi.RemoteException;

  /*ENCfoData. Получить список по фильтру*/
  public ENCfoDataShortList getFilteredList(ENCfoDataFilter aENCfoDataFilter) throws  java.rmi.RemoteException;  
  
  /*ENCfoData. Получить список для просмотра*/
  public ENCfoDataShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENCfoData. Получить список для просмотра по фильтру*/
  public ENCfoDataShortList getScrollableFilteredList(ENCfoDataFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENCfoData. Получить список для просмотра по условию*/
  public ENCfoDataShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }