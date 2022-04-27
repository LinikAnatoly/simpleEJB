
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTechContragentForm;
import com.ksoe.energynet.valueobject.filter.ENTechContragentFormFilter;
import com.ksoe.energynet.valueobject.lists.ENTechContragentFormShortList;

public interface ENTechContragentFormController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTechContragentFormController";


  /*ENTechContragentForm. ��������*/
  public int add(ENTechContragentForm aENTechContragentForm) throws java.rmi.RemoteException;

  /*ENTechContragentForm. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechContragentForm. ��������*/
  public void save(ENTechContragentForm aENTechContragentForm) throws  java.rmi.RemoteException;

  /*ENTechContragentForm. �������� ������*/
  public ENTechContragentForm getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechContragentForm. �������� ������ ������*/
  public ENTechContragentFormShortList getList() throws  java.rmi.RemoteException;

  /*ENTechContragentForm. �������� ������ �� �������*/
  public ENTechContragentFormShortList getFilteredList(ENTechContragentFormFilter aENTechContragentFormFilter) throws  java.rmi.RemoteException;  
  
  /*ENTechContragentForm. �������� ������ ��� ���������*/
  public ENTechContragentFormShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTechContragentForm. �������� ������ ��� ��������� �� �������*/
  public ENTechContragentFormShortList getScrollableFilteredList(ENTechContragentFormFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTechContragentForm. �������� ������ ��� ��������� �� �������*/
  public ENTechContragentFormShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTechContragentForm. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTechContragentFormFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }