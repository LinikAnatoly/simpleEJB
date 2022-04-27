
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Mon Oct 05 15:21:12 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWorkMoveHistory;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkMoveHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkMoveHistoryShortList;

public interface ENPlanWorkMoveHistoryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWorkMoveHistoryController";


  /*ENPlanWorkMoveHistory. Добавить*/
  public int add(ENPlanWorkMoveHistory aENPlanWorkMoveHistory, boolean isChangeForm) throws java.rmi.RemoteException;

  /*ENPlanWorkMoveHistory. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkMoveHistory. Изменить*/
  public void save(ENPlanWorkMoveHistory aENPlanWorkMoveHistory) throws  java.rmi.RemoteException;

  /*ENPlanWorkMoveHistory. Получить объект*/
  public ENPlanWorkMoveHistory getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWorkMoveHistory. Получить полный список*/
  public ENPlanWorkMoveHistoryShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWorkMoveHistory. Получить список по фильтру*/
  public ENPlanWorkMoveHistoryShortList getFilteredList(ENPlanWorkMoveHistoryFilter aENPlanWorkMoveHistoryFilter) throws  java.rmi.RemoteException;

  /*ENPlanWorkMoveHistory. Получить список для просмотра*/
  public ENPlanWorkMoveHistoryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENPlanWorkMoveHistory. Получить список для просмотра по фильтру*/
  public ENPlanWorkMoveHistoryShortList getScrollableFilteredList(ENPlanWorkMoveHistoryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENPlanWorkMoveHistory. Получить список для просмотра по условию*/
  public ENPlanWorkMoveHistoryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;


  }