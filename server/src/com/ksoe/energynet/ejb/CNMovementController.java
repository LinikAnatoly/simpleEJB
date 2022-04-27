
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.CNMovement;
import com.ksoe.energynet.valueobject.filter.CNMovementFilter;
import com.ksoe.energynet.valueobject.lists.CNMovementShortList;

public interface CNMovementController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/CNMovementController";


  /*CNMovement. Добавить*/
  public int add(CNMovement aCNMovement) throws java.rmi.RemoteException;

  /*CNMovement. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNMovement. Изменить*/
  public void save(CNMovement aCNMovement) throws  java.rmi.RemoteException;

  /*CNMovement. Получить объект*/
  public CNMovement getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNMovement. Получить полный список*/
  public CNMovementShortList getList() throws  java.rmi.RemoteException;

  /*CNMovement. Получить список по фильтру*/
  public CNMovementShortList getFilteredList(CNMovementFilter aCNMovementFilter) throws  java.rmi.RemoteException;  
  
  /*CNMovement. Получить список для просмотра*/
  public CNMovementShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*CNMovement. Получить список для просмотра по фильтру*/
  public CNMovementShortList getScrollableFilteredList(CNMovementFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*CNMovement. Получить список для просмотра по условию*/
  public CNMovementShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ECNMovement. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(CNMovementFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }