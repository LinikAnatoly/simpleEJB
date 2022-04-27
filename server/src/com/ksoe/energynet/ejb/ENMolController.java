
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMol;
import com.ksoe.energynet.valueobject.filter.ENMolFilter;
import com.ksoe.energynet.valueobject.lists.ENMolShortList;

public interface ENMolController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMolController";


  /*ENMol. ��������*/
  public int add(ENMol aENMol) throws java.rmi.RemoteException;

  /*ENMol. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMol. ��������*/
  public void save(ENMol aENMol) throws  java.rmi.RemoteException;

  /*ENMol. �������� ������*/
  public ENMol getObject(int anObjectCode) throws  java.rmi.RemoteException;
  

  /*ENMol. �������� ������ ������*/
  public ENMolShortList getList() throws  java.rmi.RemoteException;

  /*ENMol. �������� ������ �� �������*/
  public ENMolShortList getFilteredList(ENMolFilter aENMolFilter) throws  java.rmi.RemoteException;  
  
  /*ENMol. �������� ������ ��� ���������*/
  public ENMolShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMol. �������� ������ ��� ��������� �� �������*/
  public ENMolShortList getScrollableFilteredList(ENMolFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMol. �������� ������ ��� ��������� �� �������*/
  public ENMolShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENMol. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENMolFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  public ENMolShortList synchronizeMols(boolean addOSMols) throws java.rmi.RemoteException;
  }