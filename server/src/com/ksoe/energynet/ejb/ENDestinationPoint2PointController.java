
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDestinationPoint2Point;
import com.ksoe.energynet.valueobject.filter.ENDestinationPoint2PointFilter;
import com.ksoe.energynet.valueobject.lists.ENDestinationPoint2PointShortList;

public interface ENDestinationPoint2PointController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDestinationPoint2PointController";


  /*ENDestinationPoint2Point. Добавить*/
  public int add(ENDestinationPoint2Point aENDestinationPoint2Point) throws java.rmi.RemoteException;

  /*ENDestinationPoint2Point. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDestinationPoint2Point. Изменить*/
  public void save(ENDestinationPoint2Point aENDestinationPoint2Point) throws  java.rmi.RemoteException;

  /*ENDestinationPoint2Point. Получить объект*/
  public ENDestinationPoint2Point getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDestinationPoint2Point. Получить полный список*/
  public ENDestinationPoint2PointShortList getList() throws  java.rmi.RemoteException;

  /*ENDestinationPoint2Point. Получить список по фильтру*/
  public ENDestinationPoint2PointShortList getFilteredList(ENDestinationPoint2PointFilter aENDestinationPoint2PointFilter) throws  java.rmi.RemoteException;  
  
  /*ENDestinationPoint2Point. Получить список для просмотра*/
  public ENDestinationPoint2PointShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDestinationPoint2Point. Получить список для просмотра по фильтру*/
  public ENDestinationPoint2PointShortList getScrollableFilteredList(ENDestinationPoint2PointFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDestinationPoint2Point. Получить список для просмотра по условию*/
  public ENDestinationPoint2PointShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENDestinationPoint2Point. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENDestinationPoint2PointFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }