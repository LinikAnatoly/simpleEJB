
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSITFeature;
import com.ksoe.energynet.valueobject.filter.ENSITFeatureFilter;
import com.ksoe.energynet.valueobject.lists.ENSITFeatureShortList;

public interface ENSITFeatureController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSITFeatureController";


  /*ENSITFeature. Добавить*/
  public int add(ENSITFeature aENSITFeature) throws java.rmi.RemoteException;

  /*ENSITFeature. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITFeature. Изменить*/
  public void save(ENSITFeature aENSITFeature) throws  java.rmi.RemoteException;

  /*ENSITFeature. Получить объект*/
  public ENSITFeature getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITFeature. Получить полный список*/
  public ENSITFeatureShortList getList() throws  java.rmi.RemoteException;

  /*ENSITFeature. Получить список по фильтру*/
  public ENSITFeatureShortList getFilteredList(ENSITFeatureFilter aENSITFeatureFilter) throws  java.rmi.RemoteException;  
  
  /*ENSITFeature. Получить список для просмотра*/
  public ENSITFeatureShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSITFeature. Получить список для просмотра по фильтру*/
  public ENSITFeatureShortList getScrollableFilteredList(ENSITFeatureFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSITFeature. Получить список для просмотра по условию*/
  public ENSITFeatureShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }