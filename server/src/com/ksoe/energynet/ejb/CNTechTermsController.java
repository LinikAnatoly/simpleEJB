
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.CNTechTerms;
import com.ksoe.energynet.valueobject.filter.CNTechTermsFilter;
import com.ksoe.energynet.valueobject.lists.CNTechTermsShortList;

public interface CNTechTermsController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/CNTechTermsController";


  /*CNTechTerms. ��������*/
  public int add(CNTechTerms aCNTechTerms) throws java.rmi.RemoteException;

  /*CNTechTerms. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNTechTerms. ��������*/
  public void save(CNTechTerms aCNTechTerms) throws  java.rmi.RemoteException;

  /*CNTechTerms. �������� ������*/
  public CNTechTerms getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNTechTerms. �������� ������ �� ����� ������ � ����������*/
  public CNTechTerms getObjectByPackAndSubsystemID(int packID, int ssID) throws  java.rmi.RemoteException;

  /*CNTechTerms. �������� ������ ������*/
  public CNTechTermsShortList getList() throws  java.rmi.RemoteException;

  /*CNTechTerms. �������� ������ �� �������*/
  public CNTechTermsShortList getFilteredList(CNTechTermsFilter aCNTechTermsFilter) throws  java.rmi.RemoteException;

  /*CNTechTerms. �������� ������ ��� ���������*/
  public CNTechTermsShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*CNTechTerms. �������� ������ ��� ��������� �� �������*/
  public CNTechTermsShortList getScrollableFilteredList(CNTechTermsFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*CNTechTerms. �������� ������ ��� ��������� �� �������*/
  public CNTechTermsShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ECNTechTerms. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(CNTechTermsFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }