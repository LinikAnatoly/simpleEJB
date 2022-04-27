
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENReconstrModern2OSData;
import com.ksoe.energynet.valueobject.filter.ENReconstrModern2OSDataFilter;
import com.ksoe.energynet.valueobject.lists.ENReconstrModern2OSDataShortList;

public interface ENReconstrModern2OSDataController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENReconstrModern2OSDataController";


  /*ENReconstrModern2OSData. Добавить*/
  public int add(ENReconstrModern2OSData aENReconstrModern2OSData) throws java.rmi.RemoteException;

  /*ENReconstrModern2OSData. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENReconstrModern2OSData. Изменить*/
  public void save(ENReconstrModern2OSData aENReconstrModern2OSData) throws  java.rmi.RemoteException;

  /*ENReconstrModern2OSData. Получить объект*/
  public ENReconstrModern2OSData getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENReconstrModern2OSData. Получить полный список*/
  public ENReconstrModern2OSDataShortList getList() throws  java.rmi.RemoteException;

  /*ENReconstrModern2OSData. Получить список по фильтру*/
  public ENReconstrModern2OSDataShortList getFilteredList(ENReconstrModern2OSDataFilter aENReconstrModern2OSDataFilter) throws  java.rmi.RemoteException;  
  
  /*ENReconstrModern2OSData. Получить список для просмотра*/
  public ENReconstrModern2OSDataShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENReconstrModern2OSData. Получить список для просмотра по фильтру*/
  public ENReconstrModern2OSDataShortList getScrollableFilteredList(ENReconstrModern2OSDataFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENReconstrModern2OSData. Получить список для просмотра по условию*/
  public ENReconstrModern2OSDataShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENReconstrModern2OSData. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENReconstrModern2OSDataFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }