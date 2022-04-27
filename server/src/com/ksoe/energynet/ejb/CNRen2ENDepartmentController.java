
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.CNRen2ENDepartment;
import com.ksoe.energynet.valueobject.filter.CNRen2ENDepartmentFilter;
import com.ksoe.energynet.valueobject.lists.CNRen2ENDepartmentShortList;

public interface CNRen2ENDepartmentController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/CNRen2ENDepartmentController";


  /*CNRen2ENDepartment. Добавить*/
  public int add(CNRen2ENDepartment aCNRen2ENDepartment) throws java.rmi.RemoteException;

  /*CNRen2ENDepartment. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNRen2ENDepartment. Изменить*/
  public void save(CNRen2ENDepartment aCNRen2ENDepartment) throws  java.rmi.RemoteException;

  /*CNRen2ENDepartment. Получить объект*/
  public CNRen2ENDepartment getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNRen2ENDepartment. Получить полный список*/
  public CNRen2ENDepartmentShortList getList() throws  java.rmi.RemoteException;

  /*CNRen2ENDepartment. Получить список по фильтру*/
  public CNRen2ENDepartmentShortList getFilteredList(CNRen2ENDepartmentFilter aCNRen2ENDepartmentFilter) throws  java.rmi.RemoteException;  
  
  /*CNRen2ENDepartment. Получить список для просмотра*/
  public CNRen2ENDepartmentShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*CNRen2ENDepartment. Получить список для просмотра по фильтру*/
  public CNRen2ENDepartmentShortList getScrollableFilteredList(CNRen2ENDepartmentFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*CNRen2ENDepartment. Получить список для просмотра по условию*/
  public CNRen2ENDepartmentShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ECNRen2ENDepartment. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(CNRen2ENDepartmentFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }