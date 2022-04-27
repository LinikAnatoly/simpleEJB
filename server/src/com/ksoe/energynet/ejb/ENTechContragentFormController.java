
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTechContragentForm;
import com.ksoe.energynet.valueobject.filter.ENTechContragentFormFilter;
import com.ksoe.energynet.valueobject.lists.ENTechContragentFormShortList;

public interface ENTechContragentFormController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTechContragentFormController";


  /*ENTechContragentForm. Добавить*/
  public int add(ENTechContragentForm aENTechContragentForm) throws java.rmi.RemoteException;

  /*ENTechContragentForm. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechContragentForm. Изменить*/
  public void save(ENTechContragentForm aENTechContragentForm) throws  java.rmi.RemoteException;

  /*ENTechContragentForm. Получить объект*/
  public ENTechContragentForm getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechContragentForm. Получить полный список*/
  public ENTechContragentFormShortList getList() throws  java.rmi.RemoteException;

  /*ENTechContragentForm. Получить список по фильтру*/
  public ENTechContragentFormShortList getFilteredList(ENTechContragentFormFilter aENTechContragentFormFilter) throws  java.rmi.RemoteException;  
  
  /*ENTechContragentForm. Получить список для просмотра*/
  public ENTechContragentFormShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTechContragentForm. Получить список для просмотра по фильтру*/
  public ENTechContragentFormShortList getScrollableFilteredList(ENTechContragentFormFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTechContragentForm. Получить список для просмотра по условию*/
  public ENTechContragentFormShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTechContragentForm. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTechContragentFormFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }