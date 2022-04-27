
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportDepartment;
import com.ksoe.energynet.valueobject.filter.ENTransportDepartmentFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportDepartmentShortList;

public interface ENTransportDepartmentController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportDepartmentController";


  /*ENTransportDepartment. Добавить*/
  public int add(ENTransportDepartment aENTransportDepartment) throws java.rmi.RemoteException;

  /*ENTransportDepartment. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportDepartment. Изменить*/
  public void save(ENTransportDepartment aENTransportDepartment) throws  java.rmi.RemoteException;

  /*ENTransportDepartment. Получить объект*/
  public ENTransportDepartment getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportDepartment. Получить полный список*/
  public ENTransportDepartmentShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportDepartment. Получить список по фильтру*/
  public ENTransportDepartmentShortList getFilteredList(ENTransportDepartmentFilter aENTransportDepartmentFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportDepartment. Получить список для просмотра*/
  public ENTransportDepartmentShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportDepartment. Получить список для просмотра по фильтру*/
  public ENTransportDepartmentShortList getScrollableFilteredList(ENTransportDepartmentFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportDepartment. Получить список для просмотра по условию*/
  public ENTransportDepartmentShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportDepartment. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTransportDepartmentFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }