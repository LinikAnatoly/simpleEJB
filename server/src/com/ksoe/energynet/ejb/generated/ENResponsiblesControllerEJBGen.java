
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb.generated;

import com.ksoe.authorization.util.AuthorizationJNDINames;

import com.ksoe.energynet.dataminer.ENResponsiblesDAO;
import com.ksoe.energynet.valueobject.ENResponsibles;
import com.ksoe.energynet.valueobject.lists.ENResponsiblesShortList;
import com.ksoe.energynet.valueobject.filter.ENResponsiblesFilter;

import com.ksoe.energypro.exception.EnergyproSystemException;
//������ ��������� import com.ksoe.energypro.validation.EnergyproValueObjectsValidator;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.GenericSessionStatelessBean;

  /**
  * EJB controller for ENResponsibles;  
  * 	
  */

public abstract class ENResponsiblesControllerEJBGen extends GenericSessionStatelessBean
{
  public ENResponsiblesControllerEJBGen() {}

  /*ENResponsibles. ��������*/
  public int add(ENResponsibles object)
   {
    try
     {
/*
add validator here .....
      EnergyproValueObjectsValidator validator = new EnergyproValueObjectsValidator();
      if(!validator.isENResponsiblesValidForAdd(object))
       throw new EnergyproSystemException(validator.getLastErrorMessage());
*/
      ENResponsiblesDAO objectDAO = new ENResponsiblesDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      return objectDAO.add(object);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENResponsibles%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

  /*ENResponsibles. �������*/
  public void remove(int code)
   {
    try
     {
      ENResponsiblesDAO objectDAO = new ENResponsiblesDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      objectDAO.remove(code);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENResponsibles%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }   

   
  /*ENResponsibles. ��������*/
  public void save(ENResponsibles object)
   {
    try
     {
/*
add validator here .....
      EnergyproValueObjectsValidator validator = new EnergyproValueObjectsValidator();
      if(!validator.isENResponsiblesValidForSave(object))
       throw new EnergyproSystemException(validator.getLastErrorMessage());
*/
      ENResponsiblesDAO objectDAO = new ENResponsiblesDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      objectDAO.save(object);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENResponsibles%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

  /*ENResponsibles. �������� ������*/
  public ENResponsibles getObject(int code)
   {
    try
     {
      ENResponsiblesDAO objectDAO = new ENResponsiblesDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      return objectDAO.getObject(code);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get {%com.ksoe.energynet.valueobject.ENResponsibles%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

  /*ENResponsibles. �������� ������ ������*/
  public ENResponsiblesShortList getList()
   {
    return getScrollableFilteredList(null,0,-1);
   }

  /*ENResponsibles. �������� ������ �� �������*/
  public ENResponsiblesShortList getFilteredList(ENResponsiblesFilter filterObject)
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  /*ENResponsibles. �������� ������ ��� ���������*/
  public ENResponsiblesShortList getScrollableList(int fromPosition, int quantity)
   {
    return getScrollableFilteredList(null,fromPosition,quantity);
   }

  /*EENResponsibles. �������� ������ ��� ��������� �� �������*/
  public ENResponsiblesShortList getScrollableFilteredList(ENResponsiblesFilter filterObject, int fromPosition, int quantity)
   {
    try
     {
      ENResponsiblesDAO objectDAO = new ENResponsiblesDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      return objectDAO.getScrollableFilteredList(filterObject, fromPosition, quantity, null);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get list of {%com.ksoe.energynet.valueobject.ENResponsibles%} objects.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

  /*ENResponsibles. �������� ������ ��� ��������� �� �������*/
  public ENResponsiblesShortList getScrollableListByCondition(String aCondition, int fromPosition, int quantity)
   {
    ENResponsiblesFilter filterObject = new ENResponsiblesFilter();
    filterObject.conditionSQL = aCondition;
    return getScrollableFilteredList(filterObject,fromPosition,quantity);
   }

  /*EENResponsibles. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENResponsiblesFilter filterObject, int fromPosition, int quantity)
   {
    try
     {
      ENResponsiblesDAO objectDAO = new ENResponsiblesDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      return objectDAO.getFilteredCodeArray(filterObject, fromPosition, quantity);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get code array of {%com.ksoe.energynet.valueobject.ENResponsibles%} objects.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

   
}