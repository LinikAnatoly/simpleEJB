
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.docflow.valueobject.DFDocSigner;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ;
import com.ksoe.energynet.valueobject.filter.ENReconstrModernOZFilter;
import com.ksoe.energynet.valueobject.lists.ENReconstrModernOZShortList;

public interface ENReconstrModernOZController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENReconstrModernOZController";


  /*ENReconstrModernOZ. ��������*/
  public int add(ENReconstrModernOZ aENReconstrModernOZ) throws java.rmi.RemoteException;

  /*ENReconstrModernOZ. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENReconstrModernOZ. ��������*/
  public void save(ENReconstrModernOZ aENReconstrModernOZ) throws java.rmi.RemoteException;
  public void save(ENReconstrModernOZ object, DFDocSigner[] dfDocSigners) throws java.rmi.RemoteException;

  /*ENReconstrModernOZ. �������� ������*/
  public ENReconstrModernOZ getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENReconstrModernOZ. �������� ������ ������*/
  public ENReconstrModernOZShortList getList() throws  java.rmi.RemoteException;

  /*ENReconstrModernOZ. �������� ������ �� �������*/
  public ENReconstrModernOZShortList getFilteredList(ENReconstrModernOZFilter aENReconstrModernOZFilter) throws  java.rmi.RemoteException;  
  
  /*ENReconstrModernOZ. �������� ������ ��� ���������*/
  public ENReconstrModernOZShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENReconstrModernOZ. �������� ������ ��� ��������� �� �������*/
  public ENReconstrModernOZShortList getScrollableFilteredList(ENReconstrModernOZFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENReconstrModernOZ. �������� ������ ��� ��������� �� �������*/
  public ENReconstrModernOZShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENReconstrModernOZ. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENReconstrModernOZFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;
  /*�������*/
  public void createOZ(int ozCode)  throws java.rmi.RemoteException;
  /*������� ���������*/
  public void unCreateOZ(int ozCode)  throws java.rmi.RemoteException;

  /*�������� �������� � ������ ������*/
  public void moveToOS(int ozCode) throws java.rmi.RemoteException;
  public void moveToOS(int ozCode, Object caller) throws java.rmi.RemoteException;

  /*������� ���������� ��������� � �������� ������ */
  public void unMoveToOS(int ozCode) throws java.rmi.RemoteException;
  public void unMoveToOSByEcp(int ozCode) throws java.rmi.RemoteException;
  
  /* ���������� ������� ������������� ���� �� �� */
  public Date getCurrentBuhDateOS() throws java.rmi.RemoteException;
  /* ���������� ������ �������������� ������� �� �� �� ������������*/
  public String getObjectCharacteristicsFromOS(String inv_kod) throws java.rmi.RemoteException;
  
  public int[] getNalogAndBuhUseLimitByInv(String inv_kod , Date p_date_oz) throws java.rmi.RemoteException;

  
  }