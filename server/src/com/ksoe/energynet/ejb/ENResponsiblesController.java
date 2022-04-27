
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENResponsibles;
import com.ksoe.energynet.valueobject.filter.ENResponsiblesFilter;
import com.ksoe.energynet.valueobject.lists.ENResponsiblesShortList;

public interface ENResponsiblesController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENResponsiblesController";


  /*ENResponsibles. Добавить*/
  public int add(ENResponsibles aENResponsibles) throws java.rmi.RemoteException;

  /*ENResponsibles. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENResponsibles. Изменить*/
  public void save(ENResponsibles aENResponsibles) throws  java.rmi.RemoteException;

  /*ENResponsibles. Получить объект*/
  public ENResponsibles getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENResponsibles. Получить полный список*/
  public ENResponsiblesShortList getList() throws  java.rmi.RemoteException;

  /*ENResponsibles. Получить список по фильтру*/
  public ENResponsiblesShortList getFilteredList(ENResponsiblesFilter aENResponsiblesFilter) throws  java.rmi.RemoteException;  
  
  /*ENResponsibles. Получить список для просмотра*/
  public ENResponsiblesShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENResponsibles. Получить список для просмотра по фильтру*/
  public ENResponsiblesShortList getScrollableFilteredList(ENResponsiblesFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENResponsibles. Получить список для просмотра по условию*/
  public ENResponsiblesShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENResponsibles. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENResponsiblesFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }