
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Sat Sep 26 14:38:30 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemTypeShortList;

public interface ENEstimateItemTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENEstimateItemTypeController";


  /*ENEstimateItemType. Добавить*/
  public int add(ENEstimateItemType aENEstimateItemType) throws java.rmi.RemoteException;

  /*ENEstimateItemType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItemType. Изменить*/
  public void save(ENEstimateItemType aENEstimateItemType) throws  java.rmi.RemoteException;

  /*ENEstimateItemType. Получить объект*/
  public ENEstimateItemType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItemType. Получить полный список*/
  public ENEstimateItemTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENEstimateItemType. Получить список по фильтру*/
  public ENEstimateItemTypeShortList getFilteredList(ENEstimateItemTypeFilter aENEstimateItemTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItemType. Получить список для просмотра*/
  public ENEstimateItemTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItemType. Получить список для просмотра по фильтру*/
  public ENEstimateItemTypeShortList getScrollableFilteredList(ENEstimateItemTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENEstimateItemType. Получить список для просмотра по условию*/
  public ENEstimateItemTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }