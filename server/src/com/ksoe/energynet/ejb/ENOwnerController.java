
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Wed Sep 30 10:10:53 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENOwner;
import com.ksoe.energynet.valueobject.filter.ENOwnerFilter;
import com.ksoe.energynet.valueobject.lists.ENOwnerShortList;

public interface ENOwnerController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENOwnerController";


  /*ENOwner. Добавить*/
  public int add(ENOwner aENOwner) throws java.rmi.RemoteException;

  /*ENOwner. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOwner. Изменить*/
  public void save(ENOwner aENOwner) throws  java.rmi.RemoteException;

  /*ENOwner. Получить объект*/
  public ENOwner getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENOwner. Получить полный список*/
  public ENOwnerShortList getList() throws  java.rmi.RemoteException;

  /*ENOwner. Получить список по фильтру*/
  public ENOwnerShortList getFilteredList(ENOwnerFilter aENOwnerFilter) throws  java.rmi.RemoteException;  
  
  /*ENOwner. Получить список для просмотра*/
  public ENOwnerShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENOwner. Получить список для просмотра по фильтру*/
  public ENOwnerShortList getScrollableFilteredList(ENOwnerFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENOwner. Получить список для просмотра по условию*/
  public ENOwnerShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }