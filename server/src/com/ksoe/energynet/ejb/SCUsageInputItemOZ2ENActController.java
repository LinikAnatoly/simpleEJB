
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2ENAct;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2ENActFilter;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZ2ENActShortList;

public interface SCUsageInputItemOZ2ENActController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCUsageInputItemOZ2ENActController";


  /*SCUsageInputItemOZ2ENAct. Добавить*/
  public int add(SCUsageInputItemOZ2ENAct aSCUsageInputItemOZ2ENAct) throws java.rmi.RemoteException;

  /*SCUsageInputItemOZ2ENAct. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ2ENAct. Изменить*/
  public void save(SCUsageInputItemOZ2ENAct aSCUsageInputItemOZ2ENAct) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ2ENAct. Получить объект*/
  public SCUsageInputItemOZ2ENAct getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ2ENAct. Получить полный список*/
  public SCUsageInputItemOZ2ENActShortList getList() throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ2ENAct. Получить список по фильтру*/
  public SCUsageInputItemOZ2ENActShortList getFilteredList(SCUsageInputItemOZ2ENActFilter aSCUsageInputItemOZ2ENActFilter) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemOZ2ENAct. Получить список для просмотра*/
  public SCUsageInputItemOZ2ENActShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemOZ2ENAct. Получить список для просмотра по фильтру*/
  public SCUsageInputItemOZ2ENActShortList getScrollableFilteredList(SCUsageInputItemOZ2ENActFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCUsageInputItemOZ2ENAct. Получить список для просмотра по условию*/
  public SCUsageInputItemOZ2ENActShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCUsageInputItemOZ2ENAct. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(SCUsageInputItemOZ2ENActFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }