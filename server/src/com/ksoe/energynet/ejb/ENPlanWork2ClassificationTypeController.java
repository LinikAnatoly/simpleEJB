
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2ClassificationTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2ClassificationTypeShortList;

public interface ENPlanWork2ClassificationTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPlanWork2ClassificationTypeController";


  /*ENPlanWork2ClassificationType. ��������*/
  public int add(ENPlanWork2ClassificationType aENPlanWork2ClassificationType) throws java.rmi.RemoteException;

  /*ENPlanWork2ClassificationType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWork2ClassificationType. ��������*/
  public void save(ENPlanWork2ClassificationType aENPlanWork2ClassificationType) throws  java.rmi.RemoteException;

  /*ENPlanWork2ClassificationType. �������� ������*/
  public ENPlanWork2ClassificationType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPlanWork2ClassificationType. �������� ������ ������*/
  public ENPlanWork2ClassificationTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENPlanWork2ClassificationType. �������� ������ �� �������*/
  public ENPlanWork2ClassificationTypeShortList getFilteredList(ENPlanWork2ClassificationTypeFilter aENPlanWork2ClassificationTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENPlanWork2ClassificationType. �������� ������ ��� ���������*/
  public ENPlanWork2ClassificationTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPlanWork2ClassificationType. �������� ������ ��� ��������� �� �������*/
  public ENPlanWork2ClassificationTypeShortList getScrollableFilteredList(ENPlanWork2ClassificationTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPlanWork2ClassificationType. �������� ������ ��� ��������� �� �������*/
  public ENPlanWork2ClassificationTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENPlanWork2ClassificationType. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENPlanWork2ClassificationTypeFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }