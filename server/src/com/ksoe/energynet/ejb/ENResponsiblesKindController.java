
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENResponsiblesKind;
import com.ksoe.energynet.valueobject.filter.ENResponsiblesKindFilter;
import com.ksoe.energynet.valueobject.lists.ENResponsiblesKindShortList;

public interface ENResponsiblesKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENResponsiblesKindController";


  /*ENResponsiblesKind. Добавить*/
  public int add(ENResponsiblesKind aENResponsiblesKind) throws java.rmi.RemoteException;

  /*ENResponsiblesKind. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENResponsiblesKind. Изменить*/
  public void save(ENResponsiblesKind aENResponsiblesKind) throws  java.rmi.RemoteException;

  /*ENResponsiblesKind. Получить объект*/
  public ENResponsiblesKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENResponsiblesKind. Получить полный список*/
  public ENResponsiblesKindShortList getList() throws  java.rmi.RemoteException;

  /*ENResponsiblesKind. Получить список по фильтру*/
  public ENResponsiblesKindShortList getFilteredList(ENResponsiblesKindFilter aENResponsiblesKindFilter) throws  java.rmi.RemoteException;  
  
  /*ENResponsiblesKind. Получить список для просмотра*/
  public ENResponsiblesKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENResponsiblesKind. Получить список для просмотра по фильтру*/
  public ENResponsiblesKindShortList getScrollableFilteredList(ENResponsiblesKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENResponsiblesKind. Получить список для просмотра по условию*/
  public ENResponsiblesKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENResponsiblesKind. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENResponsiblesKindFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }