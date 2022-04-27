
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENContract;
import com.ksoe.energynet.valueobject.filter.ENContractFilter;
import com.ksoe.energynet.valueobject.lists.ENContractShortList;

public interface ENContractController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENContractController";


  /*ENContract. Добавить*/
  public int add(ENContract aENContract) throws java.rmi.RemoteException;

  /*ENContract. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENContract. Изменить*/
  public void save(ENContract aENContract) throws  java.rmi.RemoteException;

  /*ENContract. Получить объект*/
  public ENContract getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENContract. Получить полный список*/
  public ENContractShortList getList() throws  java.rmi.RemoteException;

  /*ENContract. Получить список по фильтру*/
  public ENContractShortList getFilteredList(ENContractFilter aENContractFilter) throws  java.rmi.RemoteException;  
  
  /*ENContract. Получить список для просмотра*/
  public ENContractShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENContract. Получить список для просмотра по фильтру*/
  public ENContractShortList getScrollableFilteredList(ENContractFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENContract. Получить список для просмотра по условию*/
  public ENContractShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }