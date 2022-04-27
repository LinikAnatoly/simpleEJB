
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMOL2PlanWork;
import com.ksoe.energynet.valueobject.filter.ENMOL2PlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENMOL2PlanWorkShortList;

public interface ENMOL2PlanWorkController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMOL2PlanWorkController";


  /*ENMOL2PlanWork. Добавить*/
  public int add(ENMOL2PlanWork aENMOL2PlanWork) throws java.rmi.RemoteException;

  /*ENMOL2PlanWork. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMOL2PlanWork. Изменить*/
  public void save(ENMOL2PlanWork aENMOL2PlanWork) throws  java.rmi.RemoteException;

  /*ENMOL2PlanWork. Получить объект*/
  public ENMOL2PlanWork getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMOL2PlanWork. Получить полный список*/
  public ENMOL2PlanWorkShortList getList() throws  java.rmi.RemoteException;

  /*ENMOL2PlanWork. Получить список по фильтру*/
  public ENMOL2PlanWorkShortList getFilteredList(ENMOL2PlanWorkFilter aENMOL2PlanWorkFilter) throws  java.rmi.RemoteException;  
  
  /*ENMOL2PlanWork. Получить список для просмотра*/
  public ENMOL2PlanWorkShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMOL2PlanWork. Получить список для просмотра по фильтру*/
  public ENMOL2PlanWorkShortList getScrollableFilteredList(ENMOL2PlanWorkFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMOL2PlanWork. Получить список для просмотра по условию*/
  public ENMOL2PlanWorkShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }