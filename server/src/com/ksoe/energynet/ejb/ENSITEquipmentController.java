
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSITEquipment;
import com.ksoe.energynet.valueobject.filter.ENSITEquipmentFilter;
import com.ksoe.energynet.valueobject.lists.ENSITEquipmentShortList;

public interface ENSITEquipmentController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSITEquipmentController";


  /*ENSITEquipment. Добавить*/
  public int add(ENSITEquipment aENSITEquipment) throws java.rmi.RemoteException;

  /*ENSITEquipment. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITEquipment. Изменить*/
  public void save(ENSITEquipment aENSITEquipment) throws  java.rmi.RemoteException;

  /*ENSITEquipment. Получить объект*/
  public ENSITEquipment getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITEquipment. Получить полный список*/
  public ENSITEquipmentShortList getList() throws  java.rmi.RemoteException;

  /*ENSITEquipment. Получить список по фильтру*/
  public ENSITEquipmentShortList getFilteredList(ENSITEquipmentFilter aENSITEquipmentFilter) throws  java.rmi.RemoteException;  
  
  /*ENSITEquipment. Получить список для просмотра*/
  public ENSITEquipmentShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSITEquipment. Получить список для просмотра по фильтру*/
  public ENSITEquipmentShortList getScrollableFilteredList(ENSITEquipmentFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSITEquipment. Получить список для просмотра по условию*/
  public ENSITEquipmentShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }