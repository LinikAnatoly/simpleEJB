
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENStandardConstEntry;
import com.ksoe.energynet.valueobject.filter.ENStandardConstEntryFilter;
import com.ksoe.energynet.valueobject.lists.ENStandardConstEntryShortList;

public interface ENStandardConstEntryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENStandardConstEntryController";


  /*ENStandardConstEntry. Добавить*/
  public int add(ENStandardConstEntry aENStandardConstEntry) throws java.rmi.RemoteException;

  /*ENStandardConstEntry. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENStandardConstEntry. Изменить*/
  public void save(ENStandardConstEntry aENStandardConstEntry) throws  java.rmi.RemoteException;

  /*ENStandardConstEntry. Получить объект*/
  public ENStandardConstEntry getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENStandardConstEntry. Получить полный список*/
  public ENStandardConstEntryShortList getList() throws  java.rmi.RemoteException;

  /*ENStandardConstEntry. Получить список по фильтру*/
  public ENStandardConstEntryShortList getFilteredList(ENStandardConstEntryFilter aENStandardConstEntryFilter) throws  java.rmi.RemoteException;  
  
  /*ENStandardConstEntry. Получить список для просмотра*/
  public ENStandardConstEntryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENStandardConstEntry. Получить список для просмотра по фильтру*/
  public ENStandardConstEntryShortList getScrollableFilteredList(ENStandardConstEntryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENStandardConstEntry. Получить список для просмотра по условию*/
  public ENStandardConstEntryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENStandardConstEntry. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENStandardConstEntryFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }