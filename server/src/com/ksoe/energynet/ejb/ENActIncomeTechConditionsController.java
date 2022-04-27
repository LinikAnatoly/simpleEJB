
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.docflow.valueobject.DFDocSigner;
import com.ksoe.energynet.valueobject.ENActIncomeTechConditions;
import com.ksoe.energynet.valueobject.filter.ENActIncomeTechConditionsFilter;
import com.ksoe.energynet.valueobject.lists.ENActIncomeTechConditionsShortList;

public interface ENActIncomeTechConditionsController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENActIncomeTechConditionsController";


  /*ENActIncomeTechConditions. Добавить*/
  public int add(ENActIncomeTechConditions aENActIncomeTechConditions) throws java.rmi.RemoteException;
  public int add(ENActIncomeTechConditions object, DFDocSigner[] dfDocSigners) throws java.rmi.RemoteException;

  /*ENActIncomeTechConditions. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActIncomeTechConditions. Изменить*/
  public void save(ENActIncomeTechConditions aENActIncomeTechConditions) throws java.rmi.RemoteException;
  public void save(ENActIncomeTechConditions object, DFDocSigner[] dfDocSigners) throws java.rmi.RemoteException;

  /*ENActIncomeTechConditions. Получить объект*/
  public ENActIncomeTechConditions getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActIncomeTechConditions. Получить полный список*/
  public ENActIncomeTechConditionsShortList getList() throws  java.rmi.RemoteException;

  /*ENActIncomeTechConditions. Получить список по фильтру*/
  public ENActIncomeTechConditionsShortList getFilteredList(ENActIncomeTechConditionsFilter aENActIncomeTechConditionsFilter) throws  java.rmi.RemoteException;  
  
  /*ENActIncomeTechConditions. Получить список для просмотра*/
  public ENActIncomeTechConditionsShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENActIncomeTechConditions. Получить список для просмотра по фильтру*/
  public ENActIncomeTechConditionsShortList getScrollableFilteredList(ENActIncomeTechConditionsFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENActIncomeTechConditions. Получить список для просмотра по условию*/
  public ENActIncomeTechConditionsShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENActIncomeTechConditions. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENActIncomeTechConditionsFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  
  /* проведение акта в ФинКол */
  public void closeTech(int code) throws java.rmi.RemoteException;
  /* отмена проведения акта в ФинКол */
  public void unCloseTech(int code) throws java.rmi.RemoteException;
  
  public void signaturedTech(int actCode)  throws java.rmi.RemoteException;
  public void unSignaturedTech(int actCode)  throws java.rmi.RemoteException;

  }