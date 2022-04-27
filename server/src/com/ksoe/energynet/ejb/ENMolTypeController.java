
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMolType;
import com.ksoe.energynet.valueobject.filter.ENMolTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENMolTypeShortList;

public interface ENMolTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMolTypeController";


  /*ENMolType. Добавить*/
  public int add(ENMolType aENMolType) throws java.rmi.RemoteException;

  /*ENMolType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMolType. Изменить*/
  public void save(ENMolType aENMolType) throws  java.rmi.RemoteException;

  /*ENMolType. Получить объект*/
  public ENMolType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMolType. Получить полный список*/
  public ENMolTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENMolType. Получить список по фильтру*/
  public ENMolTypeShortList getFilteredList(ENMolTypeFilter aENMolTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENMolType. Получить список для просмотра*/
  public ENMolTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMolType. Получить список для просмотра по фильтру*/
  public ENMolTypeShortList getScrollableFilteredList(ENMolTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMolType. Получить список для просмотра по условию*/
  public ENMolTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENMolType. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENMolTypeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }