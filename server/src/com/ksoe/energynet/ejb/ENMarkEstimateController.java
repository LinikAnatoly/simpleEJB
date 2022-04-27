
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMarkEstimate;
import com.ksoe.energynet.valueobject.filter.ENMarkEstimateFilter;
import com.ksoe.energynet.valueobject.lists.ENMarkEstimateShortList;

public interface ENMarkEstimateController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMarkEstimateController";


  /*ENMarkEstimate. Добавить*/
  public int add(ENMarkEstimate aENMarkEstimate) throws java.rmi.RemoteException;

  /*ENMarkEstimate. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMarkEstimate. Изменить*/
  public void save(ENMarkEstimate aENMarkEstimate) throws  java.rmi.RemoteException;

  /*ENMarkEstimate. Получить объект*/
  public ENMarkEstimate getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMarkEstimate. Получить полный список*/
  public ENMarkEstimateShortList getList() throws  java.rmi.RemoteException;

  /*ENMarkEstimate. Получить список по фильтру*/
  public ENMarkEstimateShortList getFilteredList(ENMarkEstimateFilter aENMarkEstimateFilter) throws  java.rmi.RemoteException;  
  
  /*ENMarkEstimate. Получить список для просмотра*/
  public ENMarkEstimateShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMarkEstimate. Получить список для просмотра по фильтру*/
  public ENMarkEstimateShortList getScrollableFilteredList(ENMarkEstimateFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMarkEstimate. Получить список для просмотра по условию*/
  public ENMarkEstimateShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }