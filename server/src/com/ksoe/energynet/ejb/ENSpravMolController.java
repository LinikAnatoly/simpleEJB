
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSpravMol;
import com.ksoe.energynet.valueobject.filter.ENSpravMolFilter;
import com.ksoe.energynet.valueobject.lists.ENSpravMolShortList;

public interface ENSpravMolController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSpravMolController";


  /*ENSpravMol. Добавить*/
  public int add(ENSpravMol aENSpravMol) throws java.rmi.RemoteException;

  /*ENSpravMol. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSpravMol. Изменить*/
  public void save(ENSpravMol aENSpravMol) throws  java.rmi.RemoteException;

  /*ENSpravMol. Получить объект*/
  public ENSpravMol getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSpravMol. Получить полный список*/
  public ENSpravMolShortList getList() throws  java.rmi.RemoteException;

  /*ENSpravMol. Получить список по фильтру*/
  public ENSpravMolShortList getFilteredList(ENSpravMolFilter aENSpravMolFilter) throws  java.rmi.RemoteException;  
  
  /*ENSpravMol. Получить список для просмотра*/
  public ENSpravMolShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSpravMol. Получить список для просмотра по фильтру*/
  public ENSpravMolShortList getScrollableFilteredList(ENSpravMolFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSpravMol. Получить список для просмотра по условию*/
  public ENSpravMolShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENSpravMol. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENSpravMolFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }