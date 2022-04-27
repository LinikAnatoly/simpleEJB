
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDestinationPoint;
import com.ksoe.energynet.valueobject.filter.ENDestinationPointFilter;
import com.ksoe.energynet.valueobject.lists.ENDestinationPointShortList;

public interface ENDestinationPointController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDestinationPointController";


  /*ENDestinationPoint. Добавить*/
  public int add(ENDestinationPoint aENDestinationPoint) throws java.rmi.RemoteException;

  /*ENDestinationPoint. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDestinationPoint. Изменить*/
  public void save(ENDestinationPoint aENDestinationPoint) throws  java.rmi.RemoteException;

  /*ENDestinationPoint. Получить объект*/
  public ENDestinationPoint getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDestinationPoint. Получить полный список*/
  public ENDestinationPointShortList getList() throws  java.rmi.RemoteException;

  /*ENDestinationPoint. Получить список по фильтру*/
  public ENDestinationPointShortList getFilteredList(ENDestinationPointFilter aENDestinationPointFilter) throws  java.rmi.RemoteException;  
  
  /*ENDestinationPoint. Получить список для просмотра*/
  public ENDestinationPointShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDestinationPoint. Получить список для просмотра по фильтру*/
  public ENDestinationPointShortList getScrollableFilteredList(ENDestinationPointFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDestinationPoint. Получить список для просмотра по условию*/
  public ENDestinationPointShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENDestinationPoint. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENDestinationPointFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }