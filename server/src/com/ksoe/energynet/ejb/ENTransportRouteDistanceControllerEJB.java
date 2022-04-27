
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENTransportRouteDistance;  
  * 	
  */



import java.math.BigDecimal;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENTransportRouteDAO;
import com.ksoe.energynet.dataminer.ENTransportRouteDistance2TKFuelKoefDAO;
import com.ksoe.energynet.dataminer.ENTransportRouteDistanceDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.ejb.generated.ENTransportRouteDistanceControllerEJBGen;
import com.ksoe.energynet.logic.TransportLogic;
//import com.ksoe.energynet.valueobject.ENTransportRouteDistance;
//import com.ksoe.energynet.valueobject.ENTransportRouteDistance;
//import com.ksoe.energynet.valueobject.lists.ENTransportRouteDistanceShortList;
//import com.ksoe.energynet.valueobject.filter.ENTransportRouteDistanceFilter;
import com.ksoe.energynet.valueobject.ENTransportRoute;
import com.ksoe.energynet.valueobject.ENTransportRouteDistance;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItemKind;
import com.ksoe.energynet.valueobject.ENTravelSheetItemStatus;
import com.ksoe.energynet.valueobject.ENTravelSheetStatus;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteDistance2TKFuelKoefFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.techcard.dataminer.TKTransportRealHistoryDAO;

public class ENTransportRouteDistanceControllerEJB extends ENTransportRouteDistanceControllerEJBGen
 {

  public ENTransportRouteDistanceControllerEJB() {}
  
  public int add(ENTransportRouteDistance object)
  {
	  try
	  {
		  ENTransportRouteDAO itemDAO = new ENTransportRouteDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetItemDAO tsItemDAO = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  TKTransportRealHistoryDAO trhDAO = new TKTransportRealHistoryDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

		  // �������� - ������ ��������� ��������� � ������� �����������
		  if(object.distance.compareTo(new BigDecimal(0)) == 0)
			  throw new EnergyproSystemException("������ ���������");
		  
		  if(object.transportRouteRef == null)
			  throw new EnergyproSystemException("Error in ENTransportRoute.code");
		  else
			  if(object.transportRouteRef.code == Integer.MIN_VALUE)
				  throw new EnergyproSystemException("Error in ENTransportRoute.code");
		  
		  ENTransportRoute itemRouteObj = itemDAO.getObject(object.transportRouteRef.code);
		  
		  // ����� ������ �������� �����
		  ENTravelSheetItemFilter tsItemFilter = new ENTravelSheetItemFilter();
		  tsItemFilter.planRef.code = itemRouteObj.planRef.code;
		  ENTravelSheetItemShortList tsItemList = tsItemDAO.getScrollableFilteredList(tsItemFilter, 0, -1);
		  if(tsItemList.totalCount != 1)
			  throw new EnergyproSystemException("������� � ������� ����� ������������ �����");
		  
		  
		  object.koef = new BigDecimal(1);
		  
		  // ���� ������ ��� ����������� ����� �������
		  ENTravelSheet tsObj = tsDAO.getObject(tsItemList.get(0).travelSheetRefCode);
		  
		  ENTravelSheetItem itemObj = tsItemDAO.getObject(tsItemList.get(0).code);
		  
		  // ��������� ����� ������ ��� ����������� �����
		  if(itemObj.kindRef.code != ENTravelSheetItemKind.FACT)
			  throw new EnergyproSystemException("������ ������������ ����� ������� ���� ��������� ��� ��������� �� �� ��������� � �������������");
		  
		  // ���� ������ �������� ����������� - �� ��������� ������
		  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CLOSED)
			  throw new EnergyproSystemException("������ ������������ ����� �����������");
		  
		  // ���� ������ �������� ���������� - �� �������� �� ������ �� ��������
		  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CALCULATED)
		  {
			  itemObj.statusRef.code = ENTravelSheetItemStatus.GOOD;
			  long oldModify_time = itemObj.modify_time;
			  tsItemDAO.save(itemObj);
			  // update modify_time �� ������, �.�. ��� ���� ��� ���������� � �������
			  // ������ �������� ����� ����� �������� optimisting locking
			  tsItemDAO.updateModify_time(itemObj.code, oldModify_time);
		  }
		  
		  if(tsObj.statusRef.code != ENTravelSheetStatus.FACT)
			  throw new EnergyproSystemException("��������� ��������� ����� ��� ��������� ����� � ������ \"���������� �����\"");
		  
		  TransportLogic transportLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
			
		  /*�������� - ������������� ������������ ������ ��� ����� � GPS*/
		  boolean isGPS = transportLogic.isGPS(tsObj.transportReal.code, tsObj.dateFinal);
		  if(!isGPS) throw new EnergyproSystemException("��������� � ������������� ���������� ����� �� ��������� � GPS");
		  
		  int out = super.add(object);
		  		  
		  return out;
		  
		  
	  }
	  catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTransportRouteDistance%} object.",e);}
	  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	  finally                              {closeConnection();}
  }
  
  public void save(ENTransportRouteDistance object)
  {
	  try
	  {
		  ENTransportRouteDistanceDAO itemDistanceDAO = new ENTransportRouteDistanceDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTransportRouteDAO itemDAO = new ENTransportRouteDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetItemDAO tsItemDAO = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

		  if(object.transportRouteRef == null)
			  throw new EnergyproSystemException("Error in ENTransportRoute.code");
		  else
			  if(object.transportRouteRef.code == Integer.MIN_VALUE)
				  throw new EnergyproSystemException("Error in ENTransportRoute.code");
		  
		  // �������� - ������ ��������� ��������� � ������� �����������
		  if(object.distance.compareTo(new BigDecimal(0)) == 0)
			  throw new EnergyproSystemException("������ ��������� ��� ������������");

		  
		  ENTransportRoute itemObj = itemDAO.getObject(object.transportRouteRef.code);
		  
		  // ����� ������ �������� �����
		  ENTravelSheetItemFilter tsItemFilter = new ENTravelSheetItemFilter();
		  tsItemFilter.planRef.code = itemObj.planRef.code;
		  ENTravelSheetItemShortList tsItemList = tsItemDAO.getScrollableFilteredList(tsItemFilter, 0, -1);
		  if(tsItemList.totalCount != 1)
			  throw new EnergyproSystemException("������� � ������� ����� ������������ �����");
		  
		  // ��������� ������ ��� ����������� ����� �������
		  ENTravelSheet tsObj = tsDAO.getObject(tsItemList.get(0).travelSheetRefCode);
		  
		  if(tsObj.statusRef.code != ENTravelSheetStatus.FACT)
			  throw new EnergyproSystemException("�������� ��������� ����� ����� ��� ��������� ����� � ������ \"���������� �����\"");


		  ENTravelSheetItem trItemObj = tsItemDAO.getObject(tsItemList.get(0).code);
		  
		  // ���� ������ �������� ����������� - �� ��������� ������
		  if(trItemObj.statusRef.code == ENTravelSheetItemStatus.CLOSED)
			  throw new EnergyproSystemException("������ ������������ ����� �����������");
		  
		  // ���� ������ �������� ���������� - �� �������� �� ������ �� ��������
		  if(trItemObj.statusRef.code == ENTravelSheetItemStatus.CALCULATED)
		  {
			  trItemObj.statusRef.code = ENTravelSheetItemStatus.GOOD;
			  long oldModify_time = trItemObj.modify_time;
			  tsItemDAO.save(trItemObj);
			  // update modify_time �� ������, �.�. ��� ���� ��� ���������� � �������
			  // ������ �������� ����� ����� �������� optimisting locking
			  tsItemDAO.updateModify_time(trItemObj.code, oldModify_time);
		  }

		  
		  object.koef = itemDistanceDAO.getAggregateSumOfKoefs(object.code);

		  super.save(object);
	  }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENTransportRouteDistance%} object.",e);}
		catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally {closeConnection();}
	  
  }

  public void remove(int code)
  {
	  try
	  {
		  ENTransportRouteDistance2TKFuelKoefDAO trd2fkDAO = new ENTransportRouteDistance2TKFuelKoefDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetItemDAO tsItemDAO = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTransportRouteDAO trDAO =  new ENTransportRouteDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTransportRouteDistanceDAO trdDAO =  new ENTransportRouteDistanceDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  
		  ENTransportRouteDistance object = trdDAO.getObject(code);
		  ENTransportRoute objectRoute = trDAO.getObject(object.transportRouteRef.code);
		  // �������� ���� ������������� �� ������
		  ENTransportRouteDistance2TKFuelKoefFilter trd2fkFilter = new ENTransportRouteDistance2TKFuelKoefFilter();
		  trd2fkFilter.transportRouteDistanceRef.code = code;
		  int[] tsid2fkCodes = trd2fkDAO.getFilteredCodeArray(trd2fkFilter, 0, -1);
		  
		  for(int i = 0; i < tsid2fkCodes.length; i++)
			  trd2fkDAO.remove(tsid2fkCodes[i]);
		  
		  // ����� ������ �������� �����
		  ENTravelSheetItemFilter tsItemFilter = new ENTravelSheetItemFilter();
		  tsItemFilter.planRef.code = objectRoute.planRef.code;
		  ENTravelSheetItemShortList tsItemList = tsItemDAO.getScrollableFilteredList(tsItemFilter, 0, -1);
		  if(tsItemList.totalCount != 1)
			  throw new EnergyproSystemException("������� � ������� ����� ������������ �����");
		  
		  //�������� ������ ��� ����������� ����� �������
		  ENTravelSheet tsObj = tsDAO.getObject(tsItemList.get(0).travelSheetRefCode);
		  
		  if(tsObj.statusRef.code != ENTravelSheetStatus.FACT)
			  throw new EnergyproSystemException("�������� ��������� ����� ����� ��� ��������� ����� � ������ \"���������� �����\"");

		  ENTravelSheetItem trItemObj = tsItemDAO.getObject(tsItemList.get(0).code);
		  
		  // ���� ������ �������� ����������� - �� ��������� ������
		  if(trItemObj.statusRef.code == ENTravelSheetItemStatus.CLOSED)
			  throw new EnergyproSystemException("������ ������������ ����� �����������");
		  
		  // ���� ������ �������� ���������� - �� �������� �� ������ �� ��������
		  if(trItemObj.statusRef.code == ENTravelSheetItemStatus.CALCULATED)
		  {
			  trItemObj.statusRef.code = ENTravelSheetItemStatus.GOOD;
			  long oldModify_time = trItemObj.modify_time;
			  tsItemDAO.save(trItemObj);
			  // update modify_time �� ������, �.�. ��� ���� ��� ���������� � �������
			  // ������ �������� ����� ����� �������� optimisting locking
			  tsItemDAO.updateModify_time(trItemObj.code, oldModify_time);
		  }
		  

		  super.remove(code);
	  }
	  catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTransportRouteDistance%} object.",e);}
	  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	  finally {closeConnection();}
  }
  
  public BigDecimal getAggregateSumOfKoefs(int code)
  {
	  try
	  {
		  ENTransportRouteDistanceDAO itemDistanceDAO = new ENTransportRouteDistanceDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  return itemDistanceDAO.getAggregateSumOfKoefs(code);
	  }
	  catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't execute getAggregateMultiplicationOfKoefs.",e);}
	  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	  finally {closeConnection();}
	  
  }

  


} // end of EJB Controller for ENTransportRouteDistance