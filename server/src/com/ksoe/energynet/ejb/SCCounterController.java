
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.lists.SCCounterShortList;

public interface SCCounterController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCCounterController";


  /*SCCounter. ��������*/
  public int add(SCCounter aSCCounter) throws java.rmi.RemoteException;

  /*SCCounter. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCCounter. ��������*/
  public void save(SCCounter aSCCounter) throws  java.rmi.RemoteException;

  /*SCCounter. �������� ������*/
  public SCCounter getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCCounter. �������� ������ ������*/
  public SCCounterShortList getList() throws  java.rmi.RemoteException;

  /*SCCounter. �������� ������ �� �������*/
  public SCCounterShortList getFilteredList(SCCounterFilter aSCCounterFilter) throws  java.rmi.RemoteException;

  /*SCCounter. �������� ������ ��� ���������*/
  public SCCounterShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*SCCounter. �������� ������ ��� ��������� �� �������*/
  public SCCounterShortList getScrollableFilteredList(SCCounterFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*SCCounter. �������� ������ ��� ��������� �� �������*/
  public SCCounterShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCCounter. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(SCCounterFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;


  // ������ �� ���������� �� �������� ...
  public void installCounter(int planCode, int kartaRefCode, String tabNumber, SCCounter counter) throws java.rmi.RemoteException;

  public void undoInstallCounter(SCCounter counter) throws java.rmi.RemoteException;

  public void unInstallCounter(int planCode, int kartaRefCode, String tabNumber, SCCounter counter, int isPass) throws java.rmi.RemoteException;

  public void undoUnInstallCounter(SCCounter counter) throws java.rmi.RemoteException;

  public void replaceCounter(int planCode, int kartaRefCode, String tabNumber, SCCounter oldCounter, SCCounter newCounter, int isPass) throws java.rmi.RemoteException;

  public void undoReplaceCounter(SCCounter oldCounter, SCCounter newCounter, int isPass) throws java.rmi.RemoteException;

  public int  getNumUnZKU(String invCounter,String lschet) throws java.rmi.RemoteException;

  /**
   *
   * ���������� ��������� �� ��������
   *
   * @param counters ������ ���������
   */
  public void addCountersForWriteOff(ENMetrologyCounter[] counters) throws java.rmi.RemoteException;

  /**
   *
   * �������� �������� ��������� ��� ��������
   *
   * @param codes ���� SCCounter
   */
  public void removeCountersForWriteOff(int[] codes) throws java.rmi.RemoteException;
  
  /**
  *
  * �������� �������� ��������� ��� ����� �� ��������
  *
  * @param codes ���� SCCounter
  */
  public void removeCountersForBilling(int[] codes) throws java.rmi.RemoteException;

  /***
   *  �� �������� ����� �� ������� ���������� ������� ������� ���������� � ������
   *  @param soObjCode ��� �������� ������ �� �������
   ***/
  public SCCounterShortList getCounterForServicesObject(int soObjCode) throws java.rmi.RemoteException;

  /**
   * �� �������� ����� �� ������� ���������� �������, ������� ��������� � ������
   *
   * @param soObjCode - ��� ��������
   * @param showForCanceled - �������� �� ������� ��� ���������� ���������
   *
   **/
  public SCCounterShortList getCounterForServicesObject(int soObjCode, boolean showForCanceled) throws java.rmi.RemoteException;

  public int closePlanServiceObj(int planCode) throws java.rmi.RemoteException;
  
  /**
	 * 
	 * �������� �������� ������������ �� ������ ������� �� EnergyNet
	 * 
	 * @param code ��� {@link SCCounter}
	 */
	public void removeCounterUnmountedManually(int code) throws java.rmi.RemoteException;
	
	/**
	 * 
	 * �������� ������� �� ������ � ���� ������� �� EnergyNet
	 * 
	 * @param planCode ��� �����
	 * @param kartaRefCode ��� �������
	 * @param tabNumber ��������� �����
	 * @param counter �������
	 * @throws java.rmi.RemoteException
	 */
	public void unInstallCounterManually(int planCode, int kartaRefCode,
			String tabNumber, SCCounter counter) throws java.rmi.RemoteException;

  }