
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAutoTires;
import com.ksoe.energynet.valueobject.ENAutoTiresInstallInfo;
import com.ksoe.energynet.valueobject.filter.ENAutoTiresFilter;
import com.ksoe.energynet.valueobject.lists.ENAutoTiresShortList;

public interface ENAutoTiresController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAutoTiresController";


  /*ENAutoTires. Добавить*/
  public int add(ENAutoTires aENAutoTires) throws java.rmi.RemoteException;

  /*ENAutoTires. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAutoTires. Изменить*/
  public void save(ENAutoTires aENAutoTires) throws  java.rmi.RemoteException;

  /*ENAutoTires. Получить объект*/
  public ENAutoTires getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAutoTires. Получить полный список*/
  public ENAutoTiresShortList getList() throws  java.rmi.RemoteException;

  /*ENAutoTires. Получить список по фильтру*/
  public ENAutoTiresShortList getFilteredList(ENAutoTiresFilter aENAutoTiresFilter) throws  java.rmi.RemoteException;

  /*ENAutoTires. Получить список для просмотра*/
  public ENAutoTiresShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENAutoTires. Получить список для просмотра по фильтру*/
  public ENAutoTiresShortList getScrollableFilteredList(ENAutoTiresFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENAutoTires. Получить список для просмотра по условию*/
  public ENAutoTiresShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENAutoTires. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENAutoTiresFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /*ENAutoTires. Информацио об установке*/
  public ENAutoTiresInstallInfo getInstallInfo(int tiresCode) throws java.rmi.RemoteException;

}