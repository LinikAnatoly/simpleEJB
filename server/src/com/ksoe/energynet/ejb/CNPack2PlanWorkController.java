
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.CNPack2PlanWork;
import com.ksoe.energynet.valueobject.filter.CNPack2PlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.CNPack2PlanWorkShortList;

public interface CNPack2PlanWorkController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/CNPack2PlanWorkController";


  /*CNPack2PlanWork. Добавить*/
  public int add(CNPack2PlanWork aCNPack2PlanWork) throws java.rmi.RemoteException;

  /*CNPack2PlanWork. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNPack2PlanWork. Изменить*/
  public void save(CNPack2PlanWork aCNPack2PlanWork) throws  java.rmi.RemoteException;

  /*CNPack2PlanWork. Получить объект*/
  public CNPack2PlanWork getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNPack2PlanWork. Получить полный список*/
  public CNPack2PlanWorkShortList getList() throws  java.rmi.RemoteException;

  /*CNPack2PlanWork. Получить список по фильтру*/
  public CNPack2PlanWorkShortList getFilteredList(CNPack2PlanWorkFilter aCNPack2PlanWorkFilter) throws  java.rmi.RemoteException;  
  
  /*CNPack2PlanWork. Получить список для просмотра*/
  public CNPack2PlanWorkShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*CNPack2PlanWork. Получить список для просмотра по фильтру*/
  public CNPack2PlanWorkShortList getScrollableFilteredList(CNPack2PlanWorkFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*CNPack2PlanWork. Получить список для просмотра по условию*/
  public CNPack2PlanWorkShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  public int createPack(CNPack2PlanWork object)  throws java.rmi.RemoteException;
  }