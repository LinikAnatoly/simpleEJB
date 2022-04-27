
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENOtherObject;
import com.ksoe.energynet.valueobject.filter.ENOtherObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENOtherObjectShortList;

public interface ENOtherObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENOtherObjectController";


  /*ENOtherObject. Добавить*/
  public int add(ENOtherObject aENOtherObject) throws java.rmi.RemoteException;

  /*ENOtherObject. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOtherObject. Изменить*/
  public void save(ENOtherObject aENOtherObject) throws  java.rmi.RemoteException;

  /*ENOtherObject. Получить объект*/
  public ENOtherObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOtherObject. Получить полный список*/
  public ENOtherObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENOtherObject. Получить список по фильтру*/
  public ENOtherObjectShortList getFilteredList(ENOtherObjectFilter aENOtherObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENOtherObject. Получить список для просмотра*/
  public ENOtherObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENOtherObject. Получить список для просмотра по фильтру*/
  public ENOtherObjectShortList getScrollableFilteredList(ENOtherObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENOtherObject. Получить список для просмотра по условию*/
  public ENOtherObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }