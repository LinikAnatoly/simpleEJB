
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSITEquipType;
import com.ksoe.energynet.valueobject.filter.ENSITEquipTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENSITEquipTypeShortList;

public interface ENSITEquipTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSITEquipTypeController";


  /*ENSITEquipType. Добавить*/
  public int add(ENSITEquipType aENSITEquipType) throws java.rmi.RemoteException;

  /*ENSITEquipType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITEquipType. Изменить*/
  public void save(ENSITEquipType aENSITEquipType) throws  java.rmi.RemoteException;

  /*ENSITEquipType. Получить объект*/
  public ENSITEquipType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITEquipType. Получить полный список*/
  public ENSITEquipTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENSITEquipType. Получить список по фильтру*/
  public ENSITEquipTypeShortList getFilteredList(ENSITEquipTypeFilter aENSITEquipTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENSITEquipType. Получить список для просмотра*/
  public ENSITEquipTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSITEquipType. Получить список для просмотра по фильтру*/
  public ENSITEquipTypeShortList getScrollableFilteredList(ENSITEquipTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSITEquipType. Получить список для просмотра по условию*/
  public ENSITEquipTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }