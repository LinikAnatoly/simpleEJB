
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.docflow.valueobject.DFDocSigner;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ;
import com.ksoe.energynet.valueobject.filter.ENReconstrModernOZFilter;
import com.ksoe.energynet.valueobject.lists.ENReconstrModernOZShortList;

public interface ENReconstrModernOZController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENReconstrModernOZController";


  /*ENReconstrModernOZ. Добавить*/
  public int add(ENReconstrModernOZ aENReconstrModernOZ) throws java.rmi.RemoteException;

  /*ENReconstrModernOZ. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENReconstrModernOZ. Изменить*/
  public void save(ENReconstrModernOZ aENReconstrModernOZ) throws java.rmi.RemoteException;
  public void save(ENReconstrModernOZ object, DFDocSigner[] dfDocSigners) throws java.rmi.RemoteException;

  /*ENReconstrModernOZ. Получить объект*/
  public ENReconstrModernOZ getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENReconstrModernOZ. Получить полный список*/
  public ENReconstrModernOZShortList getList() throws  java.rmi.RemoteException;

  /*ENReconstrModernOZ. Получить список по фильтру*/
  public ENReconstrModernOZShortList getFilteredList(ENReconstrModernOZFilter aENReconstrModernOZFilter) throws  java.rmi.RemoteException;  
  
  /*ENReconstrModernOZ. Получить список для просмотра*/
  public ENReconstrModernOZShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENReconstrModernOZ. Получить список для просмотра по фильтру*/
  public ENReconstrModernOZShortList getScrollableFilteredList(ENReconstrModernOZFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENReconstrModernOZ. Получить список для просмотра по условию*/
  public ENReconstrModernOZShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENReconstrModernOZ. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENReconstrModernOZFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  /*скласти*/
  public void createOZ(int ozCode)  throws java.rmi.RemoteException;
  /*відмінити складання*/
  public void unCreateOZ(int ozCode)  throws java.rmi.RemoteException;

  /*провести документ в Основні засоби*/
  public void moveToOS(int ozCode) throws java.rmi.RemoteException;
  public void moveToOS(int ozCode, Object caller) throws java.rmi.RemoteException;

  /*відмінити проведення документу з Основних засобів */
  public void unMoveToOS(int ozCode) throws java.rmi.RemoteException;
  public void unMoveToOSByEcp(int ozCode) throws java.rmi.RemoteException;
  
  /* Возвращает текущую бухгалтерскую дату из ОС */
  public Date getCurrentBuhDateOS() throws java.rmi.RemoteException;
  /* Возвращает строку характеристики объекта из ОС по инвентарному*/
  public String getObjectCharacteristicsFromOS(String inv_kod) throws java.rmi.RemoteException;
  
  public int[] getNalogAndBuhUseLimitByInv(String inv_kod , Date p_date_oz) throws java.rmi.RemoteException;

  
  }