
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSITEquipState;
import com.ksoe.energynet.valueobject.filter.ENSITEquipStateFilter;
import com.ksoe.energynet.valueobject.lists.ENSITEquipStateShortList;

public interface ENSITEquipStateController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSITEquipStateController";


  /*ENSITEquipState. Добавить*/
  public int add(ENSITEquipState aENSITEquipState) throws java.rmi.RemoteException;

  /*ENSITEquipState. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITEquipState. Изменить*/
  public void save(ENSITEquipState aENSITEquipState) throws  java.rmi.RemoteException;

  /*ENSITEquipState. Получить объект*/
  public ENSITEquipState getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITEquipState. Получить полный список*/
  public ENSITEquipStateShortList getList() throws  java.rmi.RemoteException;

  /*ENSITEquipState. Получить список по фильтру*/
  public ENSITEquipStateShortList getFilteredList(ENSITEquipStateFilter aENSITEquipStateFilter) throws  java.rmi.RemoteException;  
  
  /*ENSITEquipState. Получить список для просмотра*/
  public ENSITEquipStateShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSITEquipState. Получить список для просмотра по фильтру*/
  public ENSITEquipStateShortList getScrollableFilteredList(ENSITEquipStateFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSITEquipState. Получить список для просмотра по условию*/
  public ENSITEquipStateShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }