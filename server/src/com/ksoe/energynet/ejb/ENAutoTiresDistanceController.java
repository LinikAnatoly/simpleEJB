
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAutoTiresDistance;
import com.ksoe.energynet.valueobject.filter.ENAutoTiresDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENAutoTiresDistanceShortList;

public interface ENAutoTiresDistanceController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAutoTiresDistanceController";


  /*ENAutoTiresDistance. Добавить*/
  public int add(ENAutoTiresDistance aENAutoTiresDistance) throws java.rmi.RemoteException;

  /*ENAutoTiresDistance. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAutoTiresDistance. Изменить*/
  public void save(ENAutoTiresDistance aENAutoTiresDistance) throws  java.rmi.RemoteException;

  /*ENAutoTiresDistance. Получить объект*/
  public ENAutoTiresDistance getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAutoTiresDistance. Получить полный список*/
  public ENAutoTiresDistanceShortList getList() throws  java.rmi.RemoteException;

  /*ENAutoTiresDistance. Получить список по фильтру*/
  public ENAutoTiresDistanceShortList getFilteredList(ENAutoTiresDistanceFilter aENAutoTiresDistanceFilter) throws  java.rmi.RemoteException;  
  
  /*ENAutoTiresDistance. Получить список для просмотра*/
  public ENAutoTiresDistanceShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAutoTiresDistance. Получить список для просмотра по фильтру*/
  public ENAutoTiresDistanceShortList getScrollableFilteredList(ENAutoTiresDistanceFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAutoTiresDistance. Получить список для просмотра по условию*/
  public ENAutoTiresDistanceShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENAutoTiresDistance. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENAutoTiresDistanceFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }