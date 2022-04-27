
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSzBrigade;
import com.ksoe.energynet.valueobject.filter.ENSzBrigadeFilter;
import com.ksoe.energynet.valueobject.lists.ENSzBrigadeShortList;

public interface ENSzBrigadeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSzBrigadeController";


  /*ENSzBrigade. Добавить*/
  public int add(ENSzBrigade aENSzBrigade) throws java.rmi.RemoteException;

  /*ENSzBrigade. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSzBrigade. Изменить*/
  public void save(ENSzBrigade aENSzBrigade) throws  java.rmi.RemoteException;

  /*ENSzBrigade. Получить объект*/
  public ENSzBrigade getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSzBrigade. Получить полный список*/
  public ENSzBrigadeShortList getList() throws  java.rmi.RemoteException;

  /*ENSzBrigade. Получить список по фильтру*/
  public ENSzBrigadeShortList getFilteredList(ENSzBrigadeFilter aENSzBrigadeFilter) throws  java.rmi.RemoteException;  
  
  /*ENSzBrigade. Получить список для просмотра*/
  public ENSzBrigadeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSzBrigade. Получить список для просмотра по фильтру*/
  public ENSzBrigadeShortList getScrollableFilteredList(ENSzBrigadeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSzBrigade. Получить список для просмотра по условию*/
  public ENSzBrigadeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENSzBrigade. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENSzBrigadeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }