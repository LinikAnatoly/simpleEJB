
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.docflow.valueobject.DFDocSigner;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.filter.SCUsageInputFilter;
import com.ksoe.energynet.valueobject.lists.SCUsageInputShortList;

public interface SCUsageInputController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCUsageInputController";


  /*SCUsageInput. ��������*/
  public int add(SCUsageInput aSCUsageInput) throws java.rmi.RemoteException;
  public int add(SCUsageInput aSCUsageInput, DFDocSigner[] dfDocSigners) throws java.rmi.RemoteException;

  /*SCUsageInput. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInput. ��������*/
  public void save(SCUsageInput aSCUsageInput) throws java.rmi.RemoteException;
  public void save(SCUsageInput aSCUsageInput, DFDocSigner[] dfDocSigners) throws java.rmi.RemoteException;

  /*SCUsageInput. �������� ������*/
  public SCUsageInput getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInput. �������� ������ ������*/
  public SCUsageInputShortList getList() throws  java.rmi.RemoteException;

  /*SCUsageInput. �������� ������ �� �������*/
  public SCUsageInputShortList getFilteredList(SCUsageInputFilter aSCUsageInputFilter) throws  java.rmi.RemoteException;  
  
  /*SCUsageInput. �������� ������ ��� ���������*/
  public SCUsageInputShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCUsageInput. �������� ������ ��� ��������� �� �������*/
  public SCUsageInputShortList getScrollableFilteredList(SCUsageInputFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCUsageInput. �������� ������ ��� ��������� �� �������*/
  public SCUsageInputShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCUsageInput. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(SCUsageInputFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  public void fillUsageInput(int usageInputCode) throws  java.rmi.RemoteException;
  public void undoFillUsageInput(int usageInputCode) throws  java.rmi.RemoteException;
  
  public void processInSC(int usageInputCode) throws java.rmi.RemoteException;
  public void processInSC(int usageInputCode, Object caller) throws java.rmi.RemoteException;
  public void cancelProcessInSC(int usageInputCode) throws java.rmi.RemoteException;
  public void cancelProcessInSCByEcp(int usageInputCode) throws java.rmi.RemoteException;
  
  public void fillUsageInputZKU(int usageInputCode) throws  java.rmi.RemoteException;
  
  public void undoFillUsageInputZKU(int usageInputCode) throws  java.rmi.RemoteException;
  
  public void processInSCZKU(int usageInputCode) throws java.rmi.RemoteException;
  public void processInSCZKU(int usageInputCode, Object caller) throws java.rmi.RemoteException;
  public void cancelProcessInSCZKU(int usageInputCode) throws java.rmi.RemoteException;
  public void cancelProcessInSCZKUByEcp(int usageInputCode) throws java.rmi.RemoteException;

  public void isPrint(int usageInputCode) throws  java.rmi.RemoteException;

  public void setIsDocsReceived(int scUsageInputCode, int isDocsReceived) throws java.rmi.RemoteException;
}