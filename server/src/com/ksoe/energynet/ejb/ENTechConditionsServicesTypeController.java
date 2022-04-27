
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTechConditionsServicesType;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsServicesTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsServicesTypeShortList;

public interface ENTechConditionsServicesTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTechConditionsServicesTypeController";


  /*ENTechConditionsServicesType. ��������*/
  public int add(ENTechConditionsServicesType aENTechConditionsServicesType) throws java.rmi.RemoteException;

  /*ENTechConditionsServicesType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechConditionsServicesType. ��������*/
  public void save(ENTechConditionsServicesType aENTechConditionsServicesType) throws  java.rmi.RemoteException;

  /*ENTechConditionsServicesType. �������� ������*/
  public ENTechConditionsServicesType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechConditionsServicesType. �������� ������ ������*/
  public ENTechConditionsServicesTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENTechConditionsServicesType. �������� ������ �� �������*/
  public ENTechConditionsServicesTypeShortList getFilteredList(ENTechConditionsServicesTypeFilter aENTechConditionsServicesTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENTechConditionsServicesType. �������� ������ ��� ���������*/
  public ENTechConditionsServicesTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTechConditionsServicesType. �������� ������ ��� ��������� �� �������*/
  public ENTechConditionsServicesTypeShortList getScrollableFilteredList(ENTechConditionsServicesTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTechConditionsServicesType. �������� ������ ��� ��������� �� �������*/
  public ENTechConditionsServicesTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTechConditionsServicesType. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTechConditionsServicesTypeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }