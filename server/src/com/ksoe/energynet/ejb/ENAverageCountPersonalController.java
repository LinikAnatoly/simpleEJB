
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAverageCountPersonal;
import com.ksoe.energynet.valueobject.filter.ENAverageCountPersonalFilter;
import com.ksoe.energynet.valueobject.lists.ENAverageCountPersonalShortList;

public interface ENAverageCountPersonalController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAverageCountPersonalController";


  /*ENAverageCountPersonal. Добавить*/
  public int add(ENAverageCountPersonal aENAverageCountPersonal) throws java.rmi.RemoteException;

  /*ENAverageCountPersonal. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAverageCountPersonal. Изменить*/
  public void save(ENAverageCountPersonal aENAverageCountPersonal) throws  java.rmi.RemoteException;

  /*ENAverageCountPersonal. Получить объект*/
  public ENAverageCountPersonal getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAverageCountPersonal. Получить полный список*/
  public ENAverageCountPersonalShortList getList() throws  java.rmi.RemoteException;

  /*ENAverageCountPersonal. Получить список по фильтру*/
  public ENAverageCountPersonalShortList getFilteredList(ENAverageCountPersonalFilter aENAverageCountPersonalFilter) throws  java.rmi.RemoteException;  
  
  /*ENAverageCountPersonal. Получить список для просмотра*/
  public ENAverageCountPersonalShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAverageCountPersonal. Получить список для просмотра по фильтру*/
  public ENAverageCountPersonalShortList getScrollableFilteredList(ENAverageCountPersonalFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAverageCountPersonal. Получить список для просмотра по условию*/
  public ENAverageCountPersonalShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENAverageCountPersonal. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENAverageCountPersonalFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /*ENAverageCountPersonal. Расчет данных */
  public int calculateAverageCountPersonal(ENAverageCountPersonal aENAverageCountPersonal) throws java.rmi.RemoteException;

  /* перечень расчитаных периодов по средней численности персонала */
  public ENAverageCountPersonalShortList getListCalculatedPeriod() throws  java.rmi.RemoteException; 

  
  }