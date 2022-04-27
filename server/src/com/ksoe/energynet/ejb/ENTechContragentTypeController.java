
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTechContragentType;
import com.ksoe.energynet.valueobject.filter.ENTechContragentTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENTechContragentTypeShortList;

public interface ENTechContragentTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTechContragentTypeController";


  /*ENTechContragentType. Добавить*/
  public int add(ENTechContragentType aENTechContragentType) throws java.rmi.RemoteException;

  /*ENTechContragentType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechContragentType. Изменить*/
  public void save(ENTechContragentType aENTechContragentType) throws  java.rmi.RemoteException;

  /*ENTechContragentType. Получить объект*/
  public ENTechContragentType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechContragentType. Получить полный список*/
  public ENTechContragentTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENTechContragentType. Получить список по фильтру*/
  public ENTechContragentTypeShortList getFilteredList(ENTechContragentTypeFilter aENTechContragentTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENTechContragentType. Получить список для просмотра*/
  public ENTechContragentTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTechContragentType. Получить список для просмотра по фильтру*/
  public ENTechContragentTypeShortList getScrollableFilteredList(ENTechContragentTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTechContragentType. Получить список для просмотра по условию*/
  public ENTechContragentTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTechContragentType. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTechContragentTypeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }