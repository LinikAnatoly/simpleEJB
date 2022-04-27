
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTechConditionsServicesStatus;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsServicesStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsServicesStatusShortList;

public interface ENTechConditionsServicesStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTechConditionsServicesStatusController";


  /*ENTechConditionsServicesStatus. ��������*/
  public int add(ENTechConditionsServicesStatus aENTechConditionsServicesStatus) throws java.rmi.RemoteException;

  /*ENTechConditionsServicesStatus. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechConditionsServicesStatus. ��������*/
  public void save(ENTechConditionsServicesStatus aENTechConditionsServicesStatus) throws  java.rmi.RemoteException;

  /*ENTechConditionsServicesStatus. �������� ������*/
  public ENTechConditionsServicesStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechConditionsServicesStatus. �������� ������ ������*/
  public ENTechConditionsServicesStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENTechConditionsServicesStatus. �������� ������ �� �������*/
  public ENTechConditionsServicesStatusShortList getFilteredList(ENTechConditionsServicesStatusFilter aENTechConditionsServicesStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENTechConditionsServicesStatus. �������� ������ ��� ���������*/
  public ENTechConditionsServicesStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTechConditionsServicesStatus. �������� ������ ��� ��������� �� �������*/
  public ENTechConditionsServicesStatusShortList getScrollableFilteredList(ENTechConditionsServicesStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTechConditionsServicesStatus. �������� ������ ��� ��������� �� �������*/
  public ENTechConditionsServicesStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTechConditionsServicesStatus. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTechConditionsServicesStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }