
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTrafficGPS;
import com.ksoe.energynet.valueobject.filter.ENTrafficGPSFilter;
import com.ksoe.energynet.valueobject.lists.ENTrafficGPSShortList;

public interface ENTrafficGPSController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTrafficGPSController";


  /*ENTrafficGPS. Добавить*/
  public int add(ENTrafficGPS aENTrafficGPS) throws java.rmi.RemoteException;

  /*ENTrafficGPS. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTrafficGPS. Изменить*/
  public void save(ENTrafficGPS aENTrafficGPS) throws  java.rmi.RemoteException;

  /*ENTrafficGPS. Получить объект*/
  public ENTrafficGPS getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTrafficGPS. Получить полный список*/
  public ENTrafficGPSShortList getList() throws  java.rmi.RemoteException;

  /*ENTrafficGPS. Получить список по фильтру*/
  public ENTrafficGPSShortList getFilteredList(ENTrafficGPSFilter aENTrafficGPSFilter) throws  java.rmi.RemoteException;  
  
  /*ENTrafficGPS. Получить список для просмотра*/
  public ENTrafficGPSShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTrafficGPS. Получить список для просмотра по фильтру*/
  public ENTrafficGPSShortList getScrollableFilteredList(ENTrafficGPSFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTrafficGPS. Получить список для просмотра по условию*/
  public ENTrafficGPSShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTrafficGPS. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTrafficGPSFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }