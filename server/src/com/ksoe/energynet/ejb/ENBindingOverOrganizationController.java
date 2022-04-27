
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENBindingOverOrganization;
import com.ksoe.energynet.valueobject.filter.ENBindingOverOrganizationFilter;
import com.ksoe.energynet.valueobject.lists.ENBindingOverOrganizationShortList;

public interface ENBindingOverOrganizationController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENBindingOverOrganizationController";


  /*ENBindingOverOrganization. Добавить*/
  public int add(ENBindingOverOrganization aENBindingOverOrganization) throws java.rmi.RemoteException;

  /*ENBindingOverOrganization. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENBindingOverOrganization. Изменить*/
  public void save(ENBindingOverOrganization aENBindingOverOrganization) throws  java.rmi.RemoteException;

  /*ENBindingOverOrganization. Получить объект*/
  public ENBindingOverOrganization getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENBindingOverOrganization. Получить полный список*/
  public ENBindingOverOrganizationShortList getList() throws  java.rmi.RemoteException;

  /*ENBindingOverOrganization. Получить список по фильтру*/
  public ENBindingOverOrganizationShortList getFilteredList(ENBindingOverOrganizationFilter aENBindingOverOrganizationFilter) throws  java.rmi.RemoteException;  
  
  /*ENBindingOverOrganization. Получить список для просмотра*/
  public ENBindingOverOrganizationShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENBindingOverOrganization. Получить список для просмотра по фильтру*/
  public ENBindingOverOrganizationShortList getScrollableFilteredList(ENBindingOverOrganizationFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENBindingOverOrganization. Получить список для просмотра по условию*/
  public ENBindingOverOrganizationShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }