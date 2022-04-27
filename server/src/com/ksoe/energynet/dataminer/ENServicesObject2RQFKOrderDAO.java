
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.text.SimpleDateFormat;

import com.ksoe.energynet.dataminer.generated.ENServicesObject2RQFKOrderDAOGen;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObject2RQFKOrder;
import com.ksoe.energynet.valueobject.brief.ENServicesObject2RQFKOrderShort;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2RQFKOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2RQFKOrderShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;

  /**
  *  DAO Object for ENServicesObject2RQFKOrder;
  *
  */

public class ENServicesObject2RQFKOrderDAO extends ENServicesObject2RQFKOrderDAOGen {

  // ��� ��� ����� .. ����� �������� ������ !!!
  //public ENServicesObject2RQFKOrderDAO() {super();}
  //public ENServicesObject2RQFKOrderDAO(Connection aConnection) {super(aConnection);}
  //public ENServicesObject2RQFKOrderDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENServicesObject2RQFKOrderDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENServicesObject2RQFKOrderDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  /**
   * 
   * ��������, ��� ����� ������ � ���������
   * 
   * @param fkOrder �����
   * @return true ���� ������, false ���� ���
   * @throws PersistenceException
   */
  public boolean checkOrderIsLinkedWithServicesObject(RQFKOrder fkOrder) throws PersistenceException {
	  ENServicesObject2RQFKOrderFilter filter = this.getFilterByRQFKOrder(fkOrder);
	  return this.count(filter) > 0;
  }
  
  public void checkAndMakeErrorOrderIsLinkedWithServicesObject(RQFKOrder fkOrder) throws PersistenceException {
	  if(this.checkOrderIsLinkedWithServicesObject(fkOrder)) {
		  String kindName = (fkOrder.kind.code == RQFKOrderKind.PRIHOD_POSTAVKA) ? "�����������" : "����������";
		  ENServicesObject2RQFKOrderShort services2fkOrderShort =  this.getENServicesObject2RQFKOrderShortByRQFKOrder(fkOrder);
		  throw new EnergyproSystemException(String.format("��������� ������� %s ����� � %s �� %s, ��� �� �� ��'������ � ��������� � %s �� %s. "
		  		+ "\n ��� ����� ��������� ������ ��������� ������� ��������� ��������."
				  , kindName, fkOrder.numberDoc, new SimpleDateFormat("dd.MM.yyyy").format(fkOrder.dateGen)
				  , services2fkOrderShort.servicesObjectRefContractNumberServices, new SimpleDateFormat("dd.MM.yyyy").format(services2fkOrderShort.servicesObjectRefContractDateServices)));
	  }
  }
  
  public ENServicesObject2RQFKOrderShort getENServicesObject2RQFKOrderShortByRQFKOrder(RQFKOrder fkOrder) throws PersistenceException {
	  ENServicesObject2RQFKOrderFilter filter = this.getFilterByRQFKOrder(fkOrder);
	  ENServicesObject2RQFKOrderShortList list = this.getScrollableFilteredList(filter, 0, -1);
	  if(list.totalCount > 0) {
		  if(list.totalCount == 1) {
			  return list.get(0);
		  } else {
			  throw new EnergyproSystemException(String.format("������� � ������� ��� ������ � %s: %d", fkOrder.numberDoc, list.totalCount));
		  }
	  } else {
		  return null;
	  }
  }
  
  public ENServicesObject2RQFKOrderShortList getENServicesObject2RQFKOrderShortListByServicesObject(ENServicesObject servicesObject) throws PersistenceException {
	  ENServicesObject2RQFKOrderFilter filter = this.getFilterByENServicesObject(servicesObject);
	  ENServicesObject2RQFKOrderShortList list = this.getScrollableFilteredList(filter, 0, -1);
	  return list;
  }
  
  private int[] getCodesByServicesObjectCodeAndRQFKOrderCode(int servicesObjectCode, int fkOrderCode) throws PersistenceException {
	  if(servicesObjectCode == Integer.MIN_VALUE || fkOrderCode == Integer.MIN_VALUE) {
		  throw new java.lang.NullPointerException("�� ����� ����''����� ���������");
	  }
	  ENServicesObject2RQFKOrderFilter filter = new ENServicesObject2RQFKOrderFilter();
	  filter.fkOrderRef.code = fkOrderCode;
	  filter.servicesObjectRef.code = servicesObjectCode;
	  
	  return this.getFilteredCodeArray(filter, 0, -1);
  }
  
  public Integer createLink(int servicesObjectCode, int fkOrderCode) throws PersistenceException {
	  int[] codes = this.getCodesByServicesObjectCodeAndRQFKOrderCode(servicesObjectCode, fkOrderCode);
	  if(codes.length == 0) {
		  ENServicesObject2RQFKOrder object = new ENServicesObject2RQFKOrder();
		  object.fkOrderRef.code = fkOrderCode;
		  object.servicesObjectRef.code = servicesObjectCode;
		  
		  return this.add(object);
	  }
	  return null;
  }
  
  /**
   * 
   * ��������� ��''���� ������ �� �������� ������ �� ������� / ��������� ����
   * 
   * @param servicesObjectCode ��� �������� ������ �� ������� / ��������� ����
   * @param fkOrderCode ��� ������
   * @return {@code true} ��''���� ��� ���������, {@code false} ��''���� �� ����
   * @throws PersistenceException
   */
  public boolean removeLink(int servicesObjectCode, int fkOrderCode) throws PersistenceException {
	  int[] codes = this.getCodesByServicesObjectCodeAndRQFKOrderCode(servicesObjectCode, fkOrderCode);
	  if(codes.length > 0) {
		  if(codes.length != 1) {
			  throw new SystemException(String.format("������� � ������� ��� �������� � ����� %d �� ������ � ����� %d"
					  , servicesObjectCode, fkOrderCode));
		  }
		  this.remove(codes[0]);
	  }
	  return codes.length > 0;
	  
  }
  
  private ENServicesObject2RQFKOrderFilter getFilterByRQFKOrder(RQFKOrder fkOrder) {
	  ENServicesObject2RQFKOrderFilter filter = new ENServicesObject2RQFKOrderFilter();
	  filter.fkOrderRef.code = fkOrder.code;
	  return filter;
  }
  
  private ENServicesObject2RQFKOrderFilter getFilterByENServicesObject(ENServicesObject servicesObject) {
	  ENServicesObject2RQFKOrderFilter filter = new ENServicesObject2RQFKOrderFilter();
	  filter.servicesObjectRef.code = servicesObject.code;
	  return filter;
  }


} // end of ENServicesObject2RQFKOrderDAO

