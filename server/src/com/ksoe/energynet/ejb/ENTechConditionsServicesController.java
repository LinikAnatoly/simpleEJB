
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.CNPack;
import com.ksoe.energynet.valueobject.CNTechTerms;
import com.ksoe.energynet.valueobject.ENTechCondResponsibles;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsServicesShortList;

public interface ENTechConditionsServicesController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTechConditionsServicesController";


  /*ENTechConditionsServices. ��������*/
  public int add(ENTechConditionsServices aENTechConditionsServices) throws java.rmi.RemoteException;

  /*ENTechConditionsServices. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechConditionsServices. ��������*/
  public void save(ENTechConditionsServices aENTechConditionsServices) throws  java.rmi.RemoteException;

  /*ENTechConditionsServices. �������� ������*/
  public ENTechConditionsServices getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTechConditionsServices. �������� ������ ������*/
  public ENTechConditionsServicesShortList getList() throws  java.rmi.RemoteException;

  /*ENTechConditionsServices. �������� ������ �� �������*/
  public ENTechConditionsServicesShortList getFilteredList(ENTechConditionsServicesFilter aENTechConditionsServicesFilter) throws  java.rmi.RemoteException;

  /*ENTechConditionsServices. �������� ������ ��� ���������*/
  public ENTechConditionsServicesShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENTechConditionsServices. �������� ������ ��� ��������� �� �������*/
  public ENTechConditionsServicesShortList getScrollableFilteredList(ENTechConditionsServicesFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENTechConditionsServices. �������� ������ ��� ��������� �� �������*/
  public ENTechConditionsServicesShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /*ENTechConditionsServices. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTechConditionsServicesFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;


  public void signed(int code) throws  java.rmi.RemoteException;
  public void unSigned(int code) throws  java.rmi.RemoteException;
  public void completed(int code) throws  java.rmi.RemoteException;
  public void unCompleted(int code) throws  java.rmi.RemoteException;

  // public void bind2CNPack(int objectCode, int cnPackCode) throws java.rmi.RemoteException;
  public void bind2CNPack(int objectCode, int cnPackCode, int cnSubsystemCode) throws java.rmi.RemoteException;

  /* ������ ���������� ����� � �������� �� ���� ������ */
  public String getActsListByCnPackCode(int cnPackCode) throws java.rmi.RemoteException;
  public String getActsListByCnPackCode(int cnPackCode, int cnSubsystemCode) throws java.rmi.RemoteException;

  public ENTechCondResponsibles getResponsiblePerson(BigDecimal power, int departmentCode) throws java.rmi.RemoteException;
  public ENTechCondResponsibles getResponsiblePerson(ENTechConditionsServices techCondServices) throws java.rmi.RemoteException;

  /* �������� �������� � ������������� �� ������ �� EnergyWorkflow */
  public int addTechConditionsServicesByCNPack(CNPack pack, CNTechTerms techTerms) throws java.rmi.RemoteException;
  public int addTechConditionsServicesByCNPack(int soCode, CNPack pack) throws java.rmi.RemoteException;
  public int addTechConditionsServicesByCNPack(int soCode, CNPack pack, CNTechTerms techTerms) throws java.rmi.RemoteException;

}