
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENTimeLine;
import com.ksoe.energynet.valueobject.brief.ENTimeLineShort;
import com.ksoe.energynet.valueobject.filter.ENTimeLineFilter;
import com.ksoe.energynet.valueobject.lists.ENTimeLineShortList;

public interface ENTimeLineController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTimeLineController";


  /*ENTimeLine. Добавить*/
  public int add(ENTimeLine aENTimeLine) throws java.rmi.RemoteException;

  /*ENTimeLine. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTimeLine. Изменить*/
  public void save(ENTimeLine aENTimeLine) throws  java.rmi.RemoteException;

  /*ENTimeLine. Получить объект*/
  public ENTimeLine getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTimeLine. Получить полный список*/
  public ENTimeLineShortList getList() throws  java.rmi.RemoteException;

  /*ENTimeLine. Получить список по фильтру*/
  public ENTimeLineShortList getFilteredList(ENTimeLineFilter aENTimeLineFilter) throws  java.rmi.RemoteException;  
  
  /*ENTimeLine. Получить список для просмотра*/
  public ENTimeLineShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTimeLine. Получить список для просмотра по фильтру*/
  public ENTimeLineShortList getScrollableFilteredList(ENTimeLineFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTimeLine. Получить список для просмотра по фильтру (для планирования)*/
  public ENTimeLineShortList getScrollableFilteredListForPlanning(ENTimeLineFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  
  /*ENTimeLine. Получить список для просмотра по условию*/
  public ENTimeLineShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /*ENTimeLine. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTimeLineFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  public int addTimeLine(ENServicesObject servicesObject, ENTimeLineShort[] timeLineList)  throws java.rmi.RemoteException;
  
  public void removeTimeLine(ENServicesObject servicesObject)  throws java.rmi.RemoteException;
}