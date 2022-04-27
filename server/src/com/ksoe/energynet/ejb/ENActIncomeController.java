
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.util.Date;

import com.ksoe.energynet.valueobject.ENActIncome;
import com.ksoe.energynet.valueobject.filter.ENActIncomeFilter;
import com.ksoe.energynet.valueobject.lists.ENActIncomeShortList;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;

public interface ENActIncomeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENActIncomeController";


  /*ENActIncome. Добавить*/
  public int add(ENActIncome aENActIncome) throws java.rmi.RemoteException;

  /*ENActIncome. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActIncome. Изменить*/
  public void save(ENActIncome aENActIncome) throws  java.rmi.RemoteException;

  /*ENActIncome. Получить объект*/
  public ENActIncome getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENActIncome. Получить полный список*/
  public ENActIncomeShortList getList() throws  java.rmi.RemoteException;

  /*ENActIncome. Получить список по фильтру*/
  public ENActIncomeShortList getFilteredList(ENActIncomeFilter aENActIncomeFilter) throws  java.rmi.RemoteException;

  /*ENActIncome. Получить список для просмотра*/
  public ENActIncomeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENActIncome. Получить список для просмотра по фильтру*/
  public ENActIncomeShortList getScrollableFilteredList(ENActIncomeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENActIncome. Получить список для просмотра по условию*/
  public ENActIncomeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENActIncome. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENActIncomeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;


  /* проведение акта в ФинКол */
  public FKProvResult close(int code, int isClient , Date postingDate) throws java.rmi.RemoteException;

  /* отмена проведения акта в ФинКол */
  public void unClose(int code, int isClient) throws java.rmi.RemoteException;

  public void signatured(int actCode)  throws java.rmi.RemoteException;
  public void unSignatured(int actCode)  throws java.rmi.RemoteException;
  
  public FKProvResult moveToFK(ENActIncome actIncome , Date postingDate  ) throws java.rmi.RemoteException;
  
  public FKProvObjectShortList getPostingsList(int actIncomeCode) throws java.rmi.RemoteException;

}