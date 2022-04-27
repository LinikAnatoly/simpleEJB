
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPreproductionObject;
import com.ksoe.energynet.valueobject.filter.ENPreproductionObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENPreproductionObjectShortList;

public interface ENPreproductionObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPreproductionObjectController";


  /*ENPreproductionObject. Добавить*/
  public int add(ENPreproductionObject aENPreproductionObject) throws java.rmi.RemoteException;

  /*ENPreproductionObject. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPreproductionObject. Изменить*/
  public void save(ENPreproductionObject aENPreproductionObject) throws  java.rmi.RemoteException;

  /*ENPreproductionObject. Получить объект*/
  public ENPreproductionObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPreproductionObject. Получить полный список*/
  public ENPreproductionObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENPreproductionObject. Получить список по фильтру*/
  public ENPreproductionObjectShortList getFilteredList(ENPreproductionObjectFilter aENPreproductionObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENPreproductionObject. Получить список для просмотра*/
  public ENPreproductionObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPreproductionObject. Получить список для просмотра по фильтру*/
  public ENPreproductionObjectShortList getScrollableFilteredList(ENPreproductionObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPreproductionObject. Получить список для просмотра по условию*/
  public ENPreproductionObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }