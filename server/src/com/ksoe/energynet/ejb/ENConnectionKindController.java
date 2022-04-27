
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENConnectionKind;
import com.ksoe.energynet.valueobject.filter.ENConnectionKindFilter;
import com.ksoe.energynet.valueobject.lists.ENConnectionKindShortList;

public interface ENConnectionKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENConnectionKindController";


  /*ENConnectionKind. Добавить*/
  public int add(ENConnectionKind aENConnectionKind) throws java.rmi.RemoteException;

  /*ENConnectionKind. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENConnectionKind. Изменить*/
  public void save(ENConnectionKind aENConnectionKind) throws  java.rmi.RemoteException;

  /*ENConnectionKind. Получить объект*/
  public ENConnectionKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENConnectionKind. Получить полный список*/
  public ENConnectionKindShortList getList() throws  java.rmi.RemoteException;

  /*ENConnectionKind. Получить список по фильтру*/
  public ENConnectionKindShortList getFilteredList(ENConnectionKindFilter aENConnectionKindFilter) throws  java.rmi.RemoteException;  
  
  /*ENConnectionKind. Получить список для просмотра*/
  public ENConnectionKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENConnectionKind. Получить список для просмотра по фильтру*/
  public ENConnectionKindShortList getScrollableFilteredList(ENConnectionKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENConnectionKind. Получить список для просмотра по условию*/
  public ENConnectionKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENConnectionKind. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENConnectionKindFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }