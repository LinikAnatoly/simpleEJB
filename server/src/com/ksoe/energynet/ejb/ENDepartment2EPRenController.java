
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDepartment2EPRen;
import com.ksoe.energynet.valueobject.filter.ENDepartment2EPRenFilter;
import com.ksoe.energynet.valueobject.lists.ENDepartment2EPRenShortList;

public interface ENDepartment2EPRenController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDepartment2EPRenController";


  /*ENDepartment2EPRen. Добавить*/
  public int add(ENDepartment2EPRen aENDepartment2EPRen) throws java.rmi.RemoteException;

  /*ENDepartment2EPRen. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDepartment2EPRen. Изменить*/
  public void save(ENDepartment2EPRen aENDepartment2EPRen) throws  java.rmi.RemoteException;

  /*ENDepartment2EPRen. Получить объект*/
  public ENDepartment2EPRen getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDepartment2EPRen. Получить полный список*/
  public ENDepartment2EPRenShortList getList() throws  java.rmi.RemoteException;

  /*ENDepartment2EPRen. Получить список по фильтру*/
  public ENDepartment2EPRenShortList getFilteredList(ENDepartment2EPRenFilter aENDepartment2EPRenFilter) throws  java.rmi.RemoteException;  
  
  /*ENDepartment2EPRen. Получить список для просмотра*/
  public ENDepartment2EPRenShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDepartment2EPRen. Получить список для просмотра по фильтру*/
  public ENDepartment2EPRenShortList getScrollableFilteredList(ENDepartment2EPRenFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDepartment2EPRen. Получить список для просмотра по условию*/
  public ENDepartment2EPRenShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENDepartment2EPRen. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENDepartment2EPRenFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }