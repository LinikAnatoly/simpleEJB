
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemDistanceShortList;

public interface ENTravelSheetItemDistanceController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetItemDistanceController";


  /*ENTravelSheetItemDistance. Добавить*/
  public int add(ENTravelSheetItemDistance aENTravelSheetItemDistance) throws java.rmi.RemoteException;

  /*ENTravelSheetItemDistance. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemDistance. Изменить*/
  public void save(ENTravelSheetItemDistance aENTravelSheetItemDistance) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemDistance. Получить объект*/
  public ENTravelSheetItemDistance getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemDistance. Получить полный список*/
  public ENTravelSheetItemDistanceShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheetItemDistance. Получить список по фильтру*/
  public ENTravelSheetItemDistanceShortList getFilteredList(ENTravelSheetItemDistanceFilter aENTravelSheetItemDistanceFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItemDistance. Получить список для просмотра*/
  public ENTravelSheetItemDistanceShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItemDistance. Получить список для просмотра по фильтру*/
  public ENTravelSheetItemDistanceShortList getScrollableFilteredList(ENTravelSheetItemDistanceFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelSheetItemDistance. Получить список для просмотра по условию*/
  public ENTravelSheetItemDistanceShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ENTravelSheetItemDistance. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTravelSheetItemDistanceFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  
  public BigDecimal getAggregateSumOfKoefs(int code) throws java.rmi.RemoteException;
  
  }