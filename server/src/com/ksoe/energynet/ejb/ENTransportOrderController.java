
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import java.rmi.RemoteException;
import java.util.Date;

import com.ksoe.energynet.valueobject.ENTransportOrder;
import com.ksoe.energynet.valueobject.brief.ENTransportItemShort;
import com.ksoe.energynet.valueobject.filter.ENTransportOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportOrderShortList;

public interface ENTransportOrderController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportOrderController";


  /*ENTransportOrder. ��������*/
  public int add(ENTransportOrder aENTransportOrder) throws java.rmi.RemoteException;

  /*ENTransportOrder. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportOrder. ��������*/
  public void save(ENTransportOrder aENTransportOrder) throws  java.rmi.RemoteException;

  /*ENTransportOrder. �������� ������*/
  public ENTransportOrder getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportOrder. �������� ������ ������*/
  public ENTransportOrderShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportOrder. �������� ������ �� �������*/
  public ENTransportOrderShortList getFilteredList(ENTransportOrderFilter aENTransportOrderFilter) throws  java.rmi.RemoteException;

  /*ENTransportOrder. �������� ������ �� �������*/
  public ENTransportOrderShortList getListOfNormTransport(ENTransportOrderFilter aFilterObject, int fromPosition,int quantity) throws RemoteException;

  /*ENTransportOrder. �������� ������ ��� ���������*/
  public ENTransportOrderShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENTransportOrder. �������� ������ ��� ��������� �� �������*/
  public ENTransportOrderShortList getScrollableFilteredList(ENTransportOrderFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENTransportOrder. �������� ������ ��� ��������� �� �������*/
  public ENTransportOrderShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ENTransportOrder. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTransportOrderFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  public void addTransportWithWorker(int transportOrderCode, String tabNumber, int transportReal) throws java.rmi.RemoteException;

  public void addTransportFromSideOnTransportOrder(int transportOrderCode, int transportReal) throws java.rmi.RemoteException;

  public ENTransportOrderShortList getGroupedTransportListByPlanCode(int planCode) throws java.rmi.RemoteException;

  public ENTransportOrderShortList getGroupedTransportListByTransportCode(int transportCode, Date orderDateStart, Date orderDateFinal, int transportDepartmentCode)  throws java.rmi.RemoteException;

  /**
   *
   * ��������� ����������� ������ �� ������ ���������� � ����
   *
   * @param transportItemList ������ ENTransportItemShort, ���. ����������� � ������
   * @param timeFrom ��� ������� ������
   * @param dateFrom ���� ������� ������
   * @param timeTill ��� ��������� ������
   * @param dateTill ���� ��������� ������
   * @param transportDepartmentCode ��� ������������� �������� ������
   * @param isAssignment �� � ������ ��������������� 1 (��� ��������� ENTransportOrder.isAssignment_true) - �������������� ������, 0 (��� ��������� ENTransportOrder.isAssignment_false) - ����������������
   * @throws java.rmi.RemoteException
   */
  public void addTransportOrderWithTransportItems(ENTransportItemShort[] transportItemList, Date timeFrom, Date dateFrom, Date timeTill, Date dateTill, int transportDepartmentCode, int isAssignment) throws java.rmi.RemoteException;

  public void addTransportOrderWithTransportItems(ENTransportItemShort[] transportItemList, Date timeFrom, Date dateFrom, Date timeTill, Date dateTill, int transportDepartmentCode, int isAssignment, 
		  	boolean isFromServices) throws java.rmi.RemoteException;
  
  public void removeTransportOrderWithTransportItems(int transportOrderCode) throws java.rmi.RemoteException;

  public void removeTransportOrderItemsFromTravelSheet(int transportOrderCode) throws java.rmi.RemoteException;

  public void setApprove(int transportOrderCode) throws java.rmi.RemoteException;

  public void setReject(int transportOrderCode) throws java.rmi.RemoteException;

  public void undoApprove(int transportOrderCode) throws java.rmi.RemoteException;

  public void undoReject(int transportOrderCode) throws java.rmi.RemoteException;
  
  public void setTransportRealToTransportOrder(int transportOrderCode, int transportRealCode) throws java.rmi.RemoteException;
  public void setNullTransportRealToTransportOrder(int transportOrderCode) throws java.rmi.RemoteException;

  
  public ENTransportOrderShortList getGroupedTransportListByDateAndDepartment(Date orderDateStart, Date orderDateFinal, int transportDepartmentCode)  throws java.rmi.RemoteException;
  }