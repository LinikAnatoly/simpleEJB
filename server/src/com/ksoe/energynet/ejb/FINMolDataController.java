
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.lists.FINMolDataShortList;

public interface FINMolDataController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/FINMolDataController";


  /*FINMolData. Добавить*/
  public int add(FINMolData aFINMolData) throws java.rmi.RemoteException;

  // хитрый АДД, SAVE, REMOVE
  public int add(FINMolData object, int parentCode, int parentTypeCode) throws java.rmi.RemoteException;  
  public void save(FINMolData object, int parentCode, int parentTypeCode) throws java.rmi.RemoteException; 
  public void remove(int molDataCode, int parentCode, int parentTypeCode)  throws java.rmi.RemoteException; 
	  

  /*FINMolData. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINMolData. Изменить*/
  public void save(FINMolData aFINMolData) throws  java.rmi.RemoteException;

  /*FINMolData. Получить объект*/
  public FINMolData getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*FINMolData. Получить полный список*/
  public FINMolDataShortList getList() throws  java.rmi.RemoteException;

  /*FINMolData. Получить список по фильтру*/
  public FINMolDataShortList getFilteredList(FINMolDataFilter aFINMolDataFilter) throws  java.rmi.RemoteException;  
  
  /*FINMolData. Получить список для просмотра*/
  public FINMolDataShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*FINMolData. Получить список для просмотра по фильтру*/
  public FINMolDataShortList getScrollableFilteredList(FINMolDataFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*FINMolData. Получить список для просмотра по условию*/
  public FINMolDataShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;
  }