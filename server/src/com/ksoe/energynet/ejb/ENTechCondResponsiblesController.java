
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTechCondResponsibles;
import com.ksoe.energynet.valueobject.filter.ENTechCondResponsiblesFilter;
import com.ksoe.energynet.valueobject.lists.ENTechCondResponsiblesShortList;

public interface ENTechCondResponsiblesController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTechCondResponsiblesController";


  /*ENTechCondResponsibles. ��������*/
  public int add(ENTechCondResponsibles aENTechCondResponsibles) throws java.rmi.RemoteException;

  /*ENTechCondResponsibles. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechCondResponsibles. ��������*/
  public void save(ENTechCondResponsibles aENTechCondResponsibles) throws  java.rmi.RemoteException;

  /*ENTechCondResponsibles. �������� ������*/
  public ENTechCondResponsibles getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechCondResponsibles. �������� ������ ������*/
  public ENTechCondResponsiblesShortList getList() throws  java.rmi.RemoteException;

  /*ENTechCondResponsibles. �������� ������ �� �������*/
  public ENTechCondResponsiblesShortList getFilteredList(ENTechCondResponsiblesFilter aENTechCondResponsiblesFilter) throws  java.rmi.RemoteException;  
  
  /*ENTechCondResponsibles. �������� ������ ��� ���������*/
  public ENTechCondResponsiblesShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTechCondResponsibles. �������� ������ ��� ��������� �� �������*/
  public ENTechCondResponsiblesShortList getScrollableFilteredList(ENTechCondResponsiblesFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTechCondResponsibles. �������� ������ ��� ��������� �� �������*/
  public ENTechCondResponsiblesShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTechCondResponsibles. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTechCondResponsiblesFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }