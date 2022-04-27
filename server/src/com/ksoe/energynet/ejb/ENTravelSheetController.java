
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.brief.ENTransportItemShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetShortList;

public interface ENTravelSheetController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTravelSheetController";


  /*ENTravelSheet. Добавить*/
  public int add(ENTravelSheet aENTravelSheet) throws java.rmi.RemoteException;

  /*ENTravelSheet. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheet. Изменить*/
  public void save(ENTravelSheet aENTravelSheet) throws  java.rmi.RemoteException;

  /*ENTravelSheet. Получить объект*/
  public ENTravelSheet getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTravelSheet. Получить полный список*/
  public ENTravelSheetShortList getList() throws  java.rmi.RemoteException;

  /*ENTravelSheet. Получить список по фильтру*/
  public ENTravelSheetShortList getFilteredList(ENTravelSheetFilter aENTravelSheetFilter) throws  java.rmi.RemoteException;

  /*ENTravelSheet. Получить список для просмотра*/
  public ENTravelSheetShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENTravelSheet. Получить список для просмотра по фильтру*/
  public ENTravelSheetShortList getScrollableFilteredList(ENTravelSheetFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENTravelSheet. Получить список для просмотра по условию*/
  public ENTravelSheetShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  //public void addItems(int travelSheetCode, int[] transportItemCodes)  throws java.rmi.RemoteException;
  public void addItems(int travelSheetCode, ENTransportItemShort[] tList)  throws java.rmi.RemoteException;
  // чисто КОДЫ транспортИтемов
  public void addItemsDetailed(int travelSheetCode, int[] transportItemCodes)  throws java.rmi.RemoteException;

  // чисто КОДЫ транспортИтемов с транспортной заявки
  public void addItemsDetailedForTransportOrder(int travelSheetCode, int[] transportItemCodes)  throws java.rmi.RemoteException;



  public void closePlan(int travelSheetCode)   throws java.rmi.RemoteException;
  public void unClosePlan(int travelSheetCode)   throws java.rmi.RemoteException;

  public void closeFact(int travelSheetCode)   throws java.rmi.RemoteException;
  public void unCloseFact(int travelSheetCode)   throws java.rmi.RemoteException;

  public void closeWritingOff(int travelSheetCode)   throws java.rmi.RemoteException;
  public void unCloseWritingOff(int travelSheetCode)   throws java.rmi.RemoteException;
  public void unCloseTravelSheet(int travelSheetCode)   throws java.rmi.RemoteException;

  public ENTravelSheet getNextSheet(ENTravelSheet object) throws java.rmi.RemoteException;
  public ENTravelSheet getPrevSheet(ENTravelSheet object) throws java.rmi.RemoteException;
  public ENTravelSheet getLastSheet(ENTravelSheet object) throws java.rmi.RemoteException;

  // Взять пройденный километраж из СКТ "Глобус"
  public BigDecimal getSpeedometerFinalByGlobus(ENTravelSheet obj) throws java.rmi.RemoteException;

  public void setIsPrinted(int code) throws java.rmi.RemoteException;

  public void createNewTravelSheetForTransportOnDuty(int transportRealCode) throws java.rmi.RemoteException;

  }