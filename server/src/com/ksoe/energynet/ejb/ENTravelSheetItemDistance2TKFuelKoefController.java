
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance2TKFuelKoef;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistance2TKFuelKoefFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemDistance2TKFuelKoefShortList;

public interface ENTravelSheetItemDistance2TKFuelKoefController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetItemDistance2TKFuelKoefController";


  /*ENTravelSheetItemDistance2TKFuelKoef. Добавить*/
  public int add(ENTravelSheetItemDistance2TKFuelKoef aENTravelSheetItemDistance2TKFuelKoef) throws java.rmi.RemoteException;

  /*ENTravelSheetItemDistance2TKFuelKoef. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemDistance2TKFuelKoef. Изменить*/
  public void save(ENTravelSheetItemDistance2TKFuelKoef aENTravelSheetItemDistance2TKFuelKoef) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemDistance2TKFuelKoef. Получить объект*/
  public ENTravelSheetItemDistance2TKFuelKoef getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheetItemDistance2TKFuelKoef. Получить полный список*/
  public ENTravelSheetItemDistance2TKFuelKoefShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheetItemDistance2TKFuelKoef. Получить список по фильтру*/
  public ENTravelSheetItemDistance2TKFuelKoefShortList getFilteredList(ENTravelSheetItemDistance2TKFuelKoefFilter aENTravelSheetItemDistance2TKFuelKoefFilter) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItemDistance2TKFuelKoef. Получить список для просмотра*/
  public ENTravelSheetItemDistance2TKFuelKoefShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTravelSheetItemDistance2TKFuelKoef. Получить список для просмотра по фильтру*/
  public ENTravelSheetItemDistance2TKFuelKoefShortList getScrollableFilteredList(ENTravelSheetItemDistance2TKFuelKoefFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTravelSheetItemDistance2TKFuelKoef. Получить список для просмотра по условию*/
  public ENTravelSheetItemDistance2TKFuelKoefShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTravelSheetItemDistance2TKFuelKoef. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTravelSheetItemDistance2TKFuelKoefFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }