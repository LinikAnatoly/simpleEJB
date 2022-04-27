
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENServicesContractKind;
import com.ksoe.energynet.valueobject.filter.ENServicesContractKindFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesContractKindShortList;

public interface ENServicesContractKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENServicesContractKindController";


  /*ENServicesContractKind. Добавить*/
  public int add(ENServicesContractKind aENServicesContractKind) throws java.rmi.RemoteException;

  /*ENServicesContractKind. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesContractKind. Изменить*/
  public void save(ENServicesContractKind aENServicesContractKind) throws  java.rmi.RemoteException;

  /*ENServicesContractKind. Получить объект*/
  public ENServicesContractKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENServicesContractKind. Получить полный список*/
  public ENServicesContractKindShortList getList() throws  java.rmi.RemoteException;

  /*ENServicesContractKind. Получить список по фильтру*/
  public ENServicesContractKindShortList getFilteredList(ENServicesContractKindFilter aENServicesContractKindFilter) throws  java.rmi.RemoteException;

  /*ENServicesContractKind. Получить список для просмотра*/
  public ENServicesContractKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENServicesContractKind. Получить список для просмотра по фильтру*/
  public ENServicesContractKindShortList getScrollableFilteredList(ENServicesContractKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENServicesContractKind. Получить список для просмотра по условию*/
  public ENServicesContractKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENServicesContractKind. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENServicesContractKindFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }