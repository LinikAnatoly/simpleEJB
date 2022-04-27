
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSpravMol;
import com.ksoe.energynet.valueobject.filter.ENSpravMolFilter;
import com.ksoe.energynet.valueobject.lists.ENSpravMolShortList;

public interface ENSpravMolController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSpravMolController";


  /*ENSpravMol. ��������*/
  public int add(ENSpravMol aENSpravMol) throws java.rmi.RemoteException;

  /*ENSpravMol. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSpravMol. ��������*/
  public void save(ENSpravMol aENSpravMol) throws  java.rmi.RemoteException;

  /*ENSpravMol. �������� ������*/
  public ENSpravMol getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSpravMol. �������� ������ ������*/
  public ENSpravMolShortList getList() throws  java.rmi.RemoteException;

  /*ENSpravMol. �������� ������ �� �������*/
  public ENSpravMolShortList getFilteredList(ENSpravMolFilter aENSpravMolFilter) throws  java.rmi.RemoteException;  
  
  /*ENSpravMol. �������� ������ ��� ���������*/
  public ENSpravMolShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSpravMol. �������� ������ ��� ��������� �� �������*/
  public ENSpravMolShortList getScrollableFilteredList(ENSpravMolFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSpravMol. �������� ������ ��� ��������� �� �������*/
  public ENSpravMolShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENSpravMol. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENSpravMolFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }