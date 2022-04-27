
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENInvestProgramGroups;
import com.ksoe.energynet.valueobject.filter.ENInvestProgramGroupsFilter;
import com.ksoe.energynet.valueobject.lists.ENInvestProgramGroupsShortList;

public interface ENInvestProgramGroupsController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENInvestProgramGroupsController";


  /*ENInvestProgramGroups. Добавить*/
  public int add(ENInvestProgramGroups aENInvestProgramGroups) throws java.rmi.RemoteException;

  /*ENInvestProgramGroups. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENInvestProgramGroups. Изменить*/
  public void save(ENInvestProgramGroups aENInvestProgramGroups) throws  java.rmi.RemoteException;

  /*ENInvestProgramGroups. Получить объект*/
  public ENInvestProgramGroups getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENInvestProgramGroups. Получить полный список*/
  public ENInvestProgramGroupsShortList getList() throws  java.rmi.RemoteException;

  /*ENInvestProgramGroups. Получить список по фильтру*/
  public ENInvestProgramGroupsShortList getFilteredList(ENInvestProgramGroupsFilter aENInvestProgramGroupsFilter) throws  java.rmi.RemoteException;  
  
  /*ENInvestProgramGroups. Получить список для просмотра*/
  public ENInvestProgramGroupsShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENInvestProgramGroups. Получить список для просмотра по фильтру*/
  public ENInvestProgramGroupsShortList getScrollableFilteredList(ENInvestProgramGroupsFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENInvestProgramGroups. Получить список для просмотра по условию*/
  public ENInvestProgramGroupsShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENInvestProgramGroups. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENInvestProgramGroupsFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }