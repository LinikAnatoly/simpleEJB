
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTrptGPS2TrptReal;
import com.ksoe.energynet.valueobject.filter.ENTrptGPS2TrptRealFilter;
import com.ksoe.energynet.valueobject.lists.ENTrptGPS2TrptRealShortList;

public interface ENTrptGPS2TrptRealController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTrptGPS2TrptRealController";


  /*ENTrptGPS2TrptReal. Добавить*/
  public int add(ENTrptGPS2TrptReal aENTrptGPS2TrptReal) throws java.rmi.RemoteException;

  /*ENTrptGPS2TrptReal. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTrptGPS2TrptReal. Изменить*/
  public void save(ENTrptGPS2TrptReal aENTrptGPS2TrptReal) throws  java.rmi.RemoteException;

  /*ENTrptGPS2TrptReal. Получить объект*/
  public ENTrptGPS2TrptReal getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTrptGPS2TrptReal. Получить полный список*/
  public ENTrptGPS2TrptRealShortList getList() throws  java.rmi.RemoteException;

  /*ENTrptGPS2TrptReal. Получить список по фильтру*/
  public ENTrptGPS2TrptRealShortList getFilteredList(ENTrptGPS2TrptRealFilter aENTrptGPS2TrptRealFilter) throws  java.rmi.RemoteException;  
  
  /*ENTrptGPS2TrptReal. Получить список для просмотра*/
  public ENTrptGPS2TrptRealShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTrptGPS2TrptReal. Получить список для просмотра по фильтру*/
  public ENTrptGPS2TrptRealShortList getScrollableFilteredList(ENTrptGPS2TrptRealFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTrptGPS2TrptReal. Получить список для просмотра по условию*/
  public ENTrptGPS2TrptRealShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTrptGPS2TrptReal. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTrptGPS2TrptRealFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }