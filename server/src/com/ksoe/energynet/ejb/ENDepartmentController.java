
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
// Generated at Thu Oct 08 13:57:38 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.filter.ENDepartmentFilter;
import com.ksoe.energynet.valueobject.lists.ENDepartmentShortList;

public interface ENDepartmentController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDepartmentController";

  public ENDepartmentShortList getDepartmentListFromSprav(ENDepartmentFilter f, int fromPosition, int quantity)  throws java.rmi.RemoteException;
  /*ENDepartment. ��������*/
  public int add(ENDepartment aENDepartment) throws java.rmi.RemoteException;

  /*ENDepartment. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDepartment. ��������*/
  public void save(ENDepartment aENDepartment) throws  java.rmi.RemoteException;

  /*ENDepartment. �������� ������*/
  public ENDepartment getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDepartment. �������� ������ ������*/
  public ENDepartmentShortList getList() throws  java.rmi.RemoteException;

  /*ENDepartment. �������� ������ �� �������*/
  public ENDepartmentShortList getFilteredList(ENDepartmentFilter aENDepartmentFilter) throws  java.rmi.RemoteException;  
  
  /*ENDepartment. �������� ������ ��� ���������*/
  public ENDepartmentShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDepartment. �������� ������ ��� ��������� �� �������*/
  public ENDepartmentShortList getScrollableFilteredList(ENDepartmentFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDepartment. �������� ������ ��� ��������� �� �������*/
  public ENDepartmentShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /* �������� ���� �������� ������������� ...*/
  public String getDepartmentCodesDown(int departmentCode) throws java.rmi.RemoteException;
  /* �������� ���� �������� ������������� �� AX */
  public String getAXDepartmentCodesDown(int departmentCode) throws java.rmi.RemoteException;
  
  /* �������� ��� ���� �� ���� ������������� */
  public int getRenCodeFromEndepartmentByCode(int codeDepartment) throws java.rmi.RemoteException;
  
  /**
   * 
   * ���������� ��������� ��� �� ����
   * 
   * @param departmentCode ��� �������������
   * @return ��������� (1-4)
   */
  public int getDepartmentCategory(int departmentCode) throws java.rmi.RemoteException;
  
  public String getDepartmentIdDownFromKadry(int departmentCode)throws java.rmi.RemoteException;
  
  }