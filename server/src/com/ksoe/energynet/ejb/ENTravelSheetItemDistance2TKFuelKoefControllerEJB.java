
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENTravelSheetItemDistance2TKFuelKoef;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDistance2TKFuelKoefDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDistanceDAO;
import com.ksoe.energynet.ejb.generated.ENTravelSheetItemDistance2TKFuelKoefControllerEJBGen;
//import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance2TKFuelKoef;
//import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance2TKFuelKoef;
//import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemDistance2TKFuelKoefShortList;
//import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistance2TKFuelKoefFilter;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance;
import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance2TKFuelKoef;
import com.ksoe.energynet.valueobject.ENTravelSheetItemStatus;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistance2TKFuelKoefFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemDistance2TKFuelKoefShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.techcard.dataminer.TKFuelKoefDAO;
import com.ksoe.techcard.valueobject.TKFuelKoef;
import com.ksoe.techcard.valueobject.TKFuelKoefType;

public class ENTravelSheetItemDistance2TKFuelKoefControllerEJB extends ENTravelSheetItemDistance2TKFuelKoefControllerEJBGen
 {

  public ENTravelSheetItemDistance2TKFuelKoefControllerEJB() {}
  
  public int add(ENTravelSheetItemDistance2TKFuelKoef object)
  {
	  try
	  {
		  ENTravelSheetItemDistance2TKFuelKoefDAO objDAO = new ENTravelSheetItemDistance2TKFuelKoefDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  TKFuelKoefDAO fkDAO = new TKFuelKoefDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetItemDistanceDAO itemDistanceDAO = new ENTravelSheetItemDistanceDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

		  
		  TKFuelKoef fkObj = fkDAO.getObject(object.tkFuelKoefRef.code);
		  ENTravelSheetItemDistance itemDistanceObj = itemDistanceDAO.getObject(object.travelSheetItemDistanceRef.code);
		  ENTravelSheetItem itemObj = itemDAO.getObject(itemDistanceObj.travelSheetItemRef.code);
	  
		  if(object.travelSheetItemDistanceRef == null)
			  throw new EnergyproSystemException("Error in ENTravelSheetItemDistance.code");
		  else
			  if(object.travelSheetItemDistanceRef.code == Integer.MIN_VALUE)
				  throw new EnergyproSystemException("Error in ENTravelSheetItemDistance.code");
	  
		  /*�������� ��� ���� ������ - ���� ����������� �������� ����������*/
		  ENTravelSheetItemDistance2TKFuelKoefFilter tsid2fkFilter = new ENTravelSheetItemDistance2TKFuelKoefFilter();
		  tsid2fkFilter.travelSheetItemDistanceRef.code = object.travelSheetItemDistanceRef.code;
		  tsid2fkFilter.tkFuelKoefRef.code = object.tkFuelKoefRef.code;
		  ENTravelSheetItemDistance2TKFuelKoefShortList tsid2fkList = objDAO.getScrollableFilteredList(tsid2fkFilter, 0, -1);
		  if(tsid2fkList.totalCount > 0)
		  		throw new EnergyproSystemException("��� ���� ��������� ��� � ���������� \"" + tsid2fkList.get(0).tkFuelKoefRefName+"\"");
		  
		  /*�������� ��� ���� ������ - ������ ��������� ������������ � ������� � ������������ ������� ������*/
		  if(object.tkFuelKoefRef.code == TKFuelKoef.TKFUELKOEF__HEAVY || object.tkFuelKoefRef.code == TKFuelKoef.TKFUELKOEF_EXTRA_HEAVY)
		  {
			  String condition = "TKFUELKOEFREFCODE IN (" + TKFuelKoef.TKFUELKOEF__HEAVY + "," + TKFuelKoef.TKFUELKOEF_EXTRA_HEAVY+")";
			  tsid2fkFilter = new ENTravelSheetItemDistance2TKFuelKoefFilter();
			  tsid2fkFilter.travelSheetItemDistanceRef.code = object.travelSheetItemDistanceRef.code;
			  tsid2fkFilter.conditionSQL = condition;
			  tsid2fkList = objDAO.getScrollableFilteredList(tsid2fkFilter, 0, -1);
			  if(tsid2fkList.totalCount > 0)
				  throw new EnergyproSystemException("��� ���� ��������� ��� � ���������� \"" + tsid2fkList.get(0).tkFuelKoefRefName+"\"");
		  }
		  
		  /*�������� - ������ �������� ������������ � ����� "��� ����������" */
		  if(fkObj.tkFuelKoefTypeRef.code != TKFuelKoefType.TRAVELSHEETITEM)
			  throw new EnergyproSystemException("����� ������� ����� ���������� � ����� \"��� ������ ������������ �����\"");
		  
		  
	  
		  int out = super.add(object);
	  
		  /*���������� ������ ��������� */
		  itemDistanceObj.koef = itemDistanceDAO.getAggregateSumOfKoefs(itemDistanceObj.code);
		  
		  // ���� ������ ����������� - �� ��������� ������
		  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CLOSED)
			  throw new EnergyproSystemException("������ ������������ ����� �����������");
		  
		  // ���� ������ �������� ���������� - �� �������� �� ������ �� ��������
		  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CALCULATED)
		  {
			  itemObj.statusRef.code = ENTravelSheetItemStatus.GOOD;
			  long oldModify_time = itemObj.modify_time;
			  itemDAO.save(itemObj);
			  // update modify_time �� ������, �.�. ��� ���� ��� ���������� � �������
			  // ������ �������� ����� ����� �������� optimisting locking
			  itemDAO.updateModify_time(itemObj.code, oldModify_time);

		  }

	  
		  itemDistanceDAO.save(itemDistanceObj);
	  
	  return out;
	  }
	  catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTravelSheetItemDistance2TKFuelKoef%} object.",e);}
	  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	  finally                              {closeConnection();}
  }
  
  public void save(ENTravelSheetItemDistance2TKFuelKoef object)
  {
	  try
	  {
		  ENTravelSheetItemDistance2TKFuelKoefDAO objDAO = new ENTravelSheetItemDistance2TKFuelKoefDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetItemDistanceDAO itemDistanceDAO = new ENTravelSheetItemDistanceDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

		  
		  ENTravelSheetItemDistance2TKFuelKoef oldObj = objDAO.getObject(object.code);
		  ENTravelSheetItemDistance itemDistanceObj = itemDistanceDAO.getObject(object.travelSheetItemDistanceRef.code);
		  ENTravelSheetItem itemObj = itemDAO.getObject(itemDistanceObj.travelSheetItemRef.code);

		  if(object.travelSheetItemDistanceRef == null)
			  throw new EnergyproSystemException("Error in ENTravelSheetItemDistance.code");
		  else
			  if(object.travelSheetItemDistanceRef.code == Integer.MIN_VALUE)
				  throw new EnergyproSystemException("Error in ENTravelSheetItemDistance.code");
		  
		  /*�������� ��� ���� ������ - ���� ����������� �������� ����������*/
		  ENTravelSheetItemDistance2TKFuelKoefFilter tsid2fkFilter = new ENTravelSheetItemDistance2TKFuelKoefFilter();
		  tsid2fkFilter.travelSheetItemDistanceRef.code = object.travelSheetItemDistanceRef.code;
		  tsid2fkFilter.tkFuelKoefRef.code = object.tkFuelKoefRef.code;
		  tsid2fkFilter.conditionSQL = ENTravelSheetItemDistance2TKFuelKoef.code_QFielld + " <> " + object.code;
		  ENTravelSheetItemDistance2TKFuelKoefShortList tsid2fkList = objDAO.getScrollableFilteredList(tsid2fkFilter, 0, -1);
		  if(tsid2fkList.totalCount > 0)
			  	throw new EnergyproSystemException("��� ���� ��������� ��� � ���������� \"" + tsid2fkList.get(0).tkFuelKoefRefName+"\"");
		  
		  /*�������� ��� ���� ������ - ������ ��������� ������������ � ������� � ������������ ������� ������*/
		  if(object.tkFuelKoefRef.code == TKFuelKoef.TKFUELKOEF__HEAVY || object.tkFuelKoefRef.code == TKFuelKoef.TKFUELKOEF_EXTRA_HEAVY)
		  {
			  String condition = "TKFUELKOEFREFCODE IN (" + TKFuelKoef.TKFUELKOEF__HEAVY + "," + TKFuelKoef.TKFUELKOEF_EXTRA_HEAVY+")" +
			  " AND " + ENTravelSheetItemDistance2TKFuelKoef.code_QFielld + " <> " + object.code;
			  tsid2fkFilter = new ENTravelSheetItemDistance2TKFuelKoefFilter();
			  tsid2fkFilter.travelSheetItemDistanceRef.code = object.travelSheetItemDistanceRef.code;
			  tsid2fkFilter.conditionSQL = condition;
			  tsid2fkList = objDAO.getScrollableFilteredList(tsid2fkFilter, 0, -1);
			  if(tsid2fkList.totalCount > 0)
				  throw new EnergyproSystemException("��� ���� ��������� ��� � ���������� \"" + tsid2fkList.get(0).tkFuelKoefRefName+"\"");
		  }
		  
		  if(object.tkFuelKoefRef.code != oldObj.tkFuelKoefRef.code)
		  {
			  // ���� ������ ����������� - �� ��������� ������
			  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CLOSED)
				  throw new EnergyproSystemException("������ ������������ ����� �����������");
			  
			  // ���� ������ �������� ���������� - �� �������� �� ������ �� ��������
			  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CALCULATED)
			  {
				  itemObj.statusRef.code = ENTravelSheetItemStatus.GOOD;
				  long oldModify_time = itemObj.modify_time;
				  itemDAO.save(itemObj);
				  // update modify_time �� ������, �.�. ��� ���� ��� ���������� � �������
				  // ������ �������� ����� ����� �������� optimisting locking
				  itemDAO.updateModify_time(itemObj.code, oldModify_time);

			  }

		  }


		  super.save(object);
		  
		  /*���������� ������ ��������� */
		  itemDistanceObj.koef = itemDistanceDAO.getAggregateSumOfKoefs(itemDistanceObj.code);
		  itemDistanceDAO.save(itemDistanceObj);
	  }
	  catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTravelSheetItemDistance2TKFuelKoef%} object.",e);}
	  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	  finally                              {closeConnection();}
  }
  
  public void remove(int code)
  {
	  try
	  {
		ENTravelSheetItemDistance2TKFuelKoefDAO objDAO = new ENTravelSheetItemDistance2TKFuelKoefDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
	  	ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
	  	ENTravelSheetItemDistanceDAO itemDistanceDAO = new ENTravelSheetItemDistanceDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

	  	ENTravelSheetItemDistance2TKFuelKoef obj = objDAO.getObject(code);
	  	ENTravelSheetItemDistance itemDistanceObj = itemDistanceDAO.getObject(obj.travelSheetItemDistanceRef.code);
	  	ENTravelSheetItem itemObj = itemDAO.getObject(itemDistanceObj.travelSheetItemRef.code);

	  	super.remove(code);
	  
	  	/*���������� ������ ��������� */
	  	itemDistanceObj.koef = itemDistanceDAO.getAggregateSumOfKoefs(itemDistanceObj.code);
	  	itemDistanceDAO.save(itemDistanceObj);
	  	
		  // ���� ������ ����������� - �� ��������� ������
		  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CLOSED)
			  throw new EnergyproSystemException("������ ������������ ����� �����������");
		  
		  // ���� ������ �������� ���������� - �� �������� �� ������ �� ��������
		  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CALCULATED)
		  {
			  itemObj.statusRef.code = ENTravelSheetItemStatus.GOOD;
			  long oldModify_time = itemObj.modify_time;
			  itemDAO.save(itemObj);
			  // update modify_time �� ������, �.�. ��� ���� ��� ���������� � �������
			  // ������ �������� ����� ����� �������� optimisting locking
			  itemDAO.updateModify_time(itemObj.code, oldModify_time);

		  }

	  }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTravelSheetItemDistance2TKFuelKoef%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
  }


} // end of EJB Controller for ENTravelSheetItemDistance2TKFuelKoef