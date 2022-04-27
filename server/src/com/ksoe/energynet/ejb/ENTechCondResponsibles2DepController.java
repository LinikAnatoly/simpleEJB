
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTechCondResponsibles2Dep;
import com.ksoe.energynet.valueobject.filter.ENTechCondResponsibles2DepFilter;
import com.ksoe.energynet.valueobject.lists.ENTechCondResponsibles2DepShortList;

public interface ENTechCondResponsibles2DepController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTechCondResponsibles2DepController";


  /*ENTechCondResponsibles2Dep. Добавить*/
  public int add(ENTechCondResponsibles2Dep aENTechCondResponsibles2Dep) throws java.rmi.RemoteException;

  /*ENTechCondResponsibles2Dep. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechCondResponsibles2Dep. Изменить*/
  public void save(ENTechCondResponsibles2Dep aENTechCondResponsibles2Dep) throws  java.rmi.RemoteException;

  /*ENTechCondResponsibles2Dep. Получить объект*/
  public ENTechCondResponsibles2Dep getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechCondResponsibles2Dep. Получить полный список*/
  public ENTechCondResponsibles2DepShortList getList() throws  java.rmi.RemoteException;

  /*ENTechCondResponsibles2Dep. Получить список по фильтру*/
  public ENTechCondResponsibles2DepShortList getFilteredList(ENTechCondResponsibles2DepFilter aENTechCondResponsibles2DepFilter) throws  java.rmi.RemoteException;  
  
  /*ENTechCondResponsibles2Dep. Получить список для просмотра*/
  public ENTechCondResponsibles2DepShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTechCondResponsibles2Dep. Получить список для просмотра по фильтру*/
  public ENTechCondResponsibles2DepShortList getScrollableFilteredList(ENTechCondResponsibles2DepFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTechCondResponsibles2Dep. Получить список для просмотра по условию*/
  public ENTechCondResponsibles2DepShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTechCondResponsibles2Dep. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTechCondResponsibles2DepFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }