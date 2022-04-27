
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.ENEstimateItem2Contract;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ContractFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2ContractShortList;

public interface ENEstimateItem2ContractController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENEstimateItem2ContractController";


  /*ENEstimateItem2Contract. ��������*/
  public int add(ENEstimateItem2Contract aENEstimateItem2Contract) throws java.rmi.RemoteException;

  /*ENEstimateItem2Contract. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItem2Contract. ��������*/
  public void save(ENEstimateItem2Contract aENEstimateItem2Contract) throws  java.rmi.RemoteException;

  /*ENEstimateItem2Contract. �������� ������*/
  public ENEstimateItem2Contract getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItem2Contract. �������� ������ ������*/
  public ENEstimateItem2ContractShortList getList() throws  java.rmi.RemoteException;

  /*ENEstimateItem2Contract. �������� ������ �� �������*/
  public ENEstimateItem2ContractShortList getFilteredList(ENEstimateItem2ContractFilter aENEstimateItem2ContractFilter) throws  java.rmi.RemoteException;

  /*ENEstimateItem2Contract. �������� ������ ��� ���������*/
  public ENEstimateItem2ContractShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENEstimateItem2Contract. �������� ������ ��� ��������� �� �������*/
  public ENEstimateItem2ContractShortList getScrollableFilteredList(ENEstimateItem2ContractFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENEstimateItem2Contract. �������� ������ ��� ��������� �� �������*/
  public ENEstimateItem2ContractShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  public int addWithEstimateList(ENEstimateItem2Contract object, ENEstimateItemShort[] estimateList)  throws java.rmi.RemoteException;
  
  public void removeByEstimateCode(int estimateItemCode)   throws java.rmi.RemoteException;
  
  public BigDecimal getRestCountByContract(String finDocCode, int materialCode) throws java.rmi.RemoteException;
  
  public void removeByOrderItemCode(int estimateItemCode)   throws java.rmi.RemoteException;
}