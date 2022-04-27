
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENConnectionLevel;
import com.ksoe.energynet.valueobject.filter.ENConnectionLevelFilter;
import com.ksoe.energynet.valueobject.lists.ENConnectionLevelShortList;

public interface ENConnectionLevelController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENConnectionLevelController";


  /*ENConnectionLevel. Добавить*/
  public int add(ENConnectionLevel aENConnectionLevel) throws java.rmi.RemoteException;

  /*ENConnectionLevel. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENConnectionLevel. Изменить*/
  public void save(ENConnectionLevel aENConnectionLevel) throws  java.rmi.RemoteException;

  /*ENConnectionLevel. Получить объект*/
  public ENConnectionLevel getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENConnectionLevel. Получить полный список*/
  public ENConnectionLevelShortList getList() throws  java.rmi.RemoteException;

  /*ENConnectionLevel. Получить список по фильтру*/
  public ENConnectionLevelShortList getFilteredList(ENConnectionLevelFilter aENConnectionLevelFilter) throws  java.rmi.RemoteException;  
  
  /*ENConnectionLevel. Получить список для просмотра*/
  public ENConnectionLevelShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENConnectionLevel. Получить список для просмотра по фильтру*/
  public ENConnectionLevelShortList getScrollableFilteredList(ENConnectionLevelFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENConnectionLevel. Получить список для просмотра по условию*/
  public ENConnectionLevelShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENConnectionLevel. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENConnectionLevelFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }