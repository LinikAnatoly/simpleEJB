
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINContracts;
import com.ksoe.energynet.valueobject.filter.FINContractsFilter;
import com.ksoe.energynet.valueobject.lists.FINContractsShortList;

public interface FINContractsController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINContractsController";


  /*FINContracts. Добавить*/
  public int add(FINContracts aFINContracts) throws java.rmi.RemoteException;

  /*FINContracts. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINContracts. Изменить*/
  public void save(FINContracts aFINContracts) throws  java.rmi.RemoteException;

  /*FINContracts. Получить объект*/
  public FINContracts getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINContracts. Получить полный список*/
  public FINContractsShortList getList() throws  java.rmi.RemoteException;

  /*FINContracts. Получить список по фильтру*/
  public FINContractsShortList getFilteredList(FINContractsFilter aFINContractsFilter) throws  java.rmi.RemoteException;  
  
  /*FINContracts. Получить список для просмотра*/
  public FINContractsShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINContracts. Получить список для просмотра по фильтру*/
  public FINContractsShortList getScrollableFilteredList(FINContractsFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINContracts. Получить список для просмотра по условию*/
  public FINContractsShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*FINContracts. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(FINContractsFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  
  /*FINContracts. Получить объект из ФК по id*/
  public FINContracts getObjectFromFK(int id) throws java.rmi.RemoteException; 

  }