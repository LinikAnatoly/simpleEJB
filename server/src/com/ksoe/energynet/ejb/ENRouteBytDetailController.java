
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENRouteBytDetail;
import com.ksoe.energynet.valueobject.filter.ENRouteBytDetailFilter;
import com.ksoe.energynet.valueobject.lists.ENRouteBytDetailShortList;

public interface ENRouteBytDetailController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENRouteBytDetailController";


  /*ENRouteBytDetail. Добавить*/
  public int add(ENRouteBytDetail aENRouteBytDetail) throws java.rmi.RemoteException;

  /*ENRouteBytDetail. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRouteBytDetail. Изменить*/
  public void save(ENRouteBytDetail aENRouteBytDetail) throws  java.rmi.RemoteException;

  /*ENRouteBytDetail. Получить объект*/
  public ENRouteBytDetail getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRouteBytDetail. Получить полный список*/
  public ENRouteBytDetailShortList getList() throws  java.rmi.RemoteException;

  /*ENRouteBytDetail. Получить список по фильтру*/
  public ENRouteBytDetailShortList getFilteredList(ENRouteBytDetailFilter aENRouteBytDetailFilter) throws  java.rmi.RemoteException;  
  
  /*ENRouteBytDetail. Получить список для просмотра*/
  public ENRouteBytDetailShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENRouteBytDetail. Получить список для просмотра по фильтру*/
  public ENRouteBytDetailShortList getScrollableFilteredList(ENRouteBytDetailFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENRouteBytDetail. Получить список для просмотра по условию*/
  public ENRouteBytDetailShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENRouteBytDetail. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENRouteBytDetailFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }