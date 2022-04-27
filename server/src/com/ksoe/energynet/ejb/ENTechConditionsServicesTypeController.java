
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTechConditionsServicesType;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsServicesTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsServicesTypeShortList;

public interface ENTechConditionsServicesTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTechConditionsServicesTypeController";


  /*ENTechConditionsServicesType. Добавить*/
  public int add(ENTechConditionsServicesType aENTechConditionsServicesType) throws java.rmi.RemoteException;

  /*ENTechConditionsServicesType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechConditionsServicesType. Изменить*/
  public void save(ENTechConditionsServicesType aENTechConditionsServicesType) throws  java.rmi.RemoteException;

  /*ENTechConditionsServicesType. Получить объект*/
  public ENTechConditionsServicesType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechConditionsServicesType. Получить полный список*/
  public ENTechConditionsServicesTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENTechConditionsServicesType. Получить список по фильтру*/
  public ENTechConditionsServicesTypeShortList getFilteredList(ENTechConditionsServicesTypeFilter aENTechConditionsServicesTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENTechConditionsServicesType. Получить список для просмотра*/
  public ENTechConditionsServicesTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTechConditionsServicesType. Получить список для просмотра по фильтру*/
  public ENTechConditionsServicesTypeShortList getScrollableFilteredList(ENTechConditionsServicesTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTechConditionsServicesType. Получить список для просмотра по условию*/
  public ENTechConditionsServicesTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTechConditionsServicesType. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTechConditionsServicesTypeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }