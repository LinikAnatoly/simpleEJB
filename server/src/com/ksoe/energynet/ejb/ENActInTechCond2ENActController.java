
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENActInTechCond2ENAct;
import com.ksoe.energynet.valueobject.filter.ENActInTechCond2ENActFilter;
import com.ksoe.energynet.valueobject.lists.ENActInTechCond2ENActShortList;

public interface ENActInTechCond2ENActController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENActInTechCond2ENActController";


  /*ENActInTechCond2ENAct. Добавить*/
  public int add(ENActInTechCond2ENAct aENActInTechCond2ENAct) throws java.rmi.RemoteException;

  /*ENActInTechCond2ENAct. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActInTechCond2ENAct. Изменить*/
  public void save(ENActInTechCond2ENAct aENActInTechCond2ENAct) throws  java.rmi.RemoteException;

  /*ENActInTechCond2ENAct. Получить объект*/
  public ENActInTechCond2ENAct getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActInTechCond2ENAct. Получить полный список*/
  public ENActInTechCond2ENActShortList getList() throws  java.rmi.RemoteException;

  /*ENActInTechCond2ENAct. Получить список по фильтру*/
  public ENActInTechCond2ENActShortList getFilteredList(ENActInTechCond2ENActFilter aENActInTechCond2ENActFilter) throws  java.rmi.RemoteException;  
  
  /*ENActInTechCond2ENAct. Получить список для просмотра*/
  public ENActInTechCond2ENActShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENActInTechCond2ENAct. Получить список для просмотра по фильтру*/
  public ENActInTechCond2ENActShortList getScrollableFilteredList(ENActInTechCond2ENActFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENActInTechCond2ENAct. Получить список для просмотра по условию*/
  public ENActInTechCond2ENActShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENActInTechCond2ENAct. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENActInTechCond2ENActFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }