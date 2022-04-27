
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENOtherObjectType;
import com.ksoe.energynet.valueobject.filter.ENOtherObjectTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENOtherObjectTypeShortList;

public interface ENOtherObjectTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENOtherObjectTypeController";


  /*ENOtherObjectType. Добавить*/
  public int add(ENOtherObjectType aENOtherObjectType) throws java.rmi.RemoteException;

  /*ENOtherObjectType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOtherObjectType. Изменить*/
  public void save(ENOtherObjectType aENOtherObjectType) throws  java.rmi.RemoteException;

  /*ENOtherObjectType. Получить объект*/
  public ENOtherObjectType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOtherObjectType. Получить полный список*/
  public ENOtherObjectTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENOtherObjectType. Получить список по фильтру*/
  public ENOtherObjectTypeShortList getFilteredList(ENOtherObjectTypeFilter aENOtherObjectTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENOtherObjectType. Получить список для просмотра*/
  public ENOtherObjectTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENOtherObjectType. Получить список для просмотра по фильтру*/
  public ENOtherObjectTypeShortList getScrollableFilteredList(ENOtherObjectTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENOtherObjectType. Получить список для просмотра по условию*/
  public ENOtherObjectTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }