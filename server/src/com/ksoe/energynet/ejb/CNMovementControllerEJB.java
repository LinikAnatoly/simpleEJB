
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for CNMovement;
  *
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.CNMovementDAO;
import com.ksoe.energynet.ejb.generated.CNMovementControllerEJBGen;
import com.ksoe.energynet.valueobject.CNMovement;
import com.ksoe.energynet.valueobject.filter.CNMovementFilter;
import com.ksoe.energynet.valueobject.lists.CNMovementShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
//import com.ksoe.energynet.valueobject.CNMovement;
//import com.ksoe.energynet.valueobject.CNMovement;
//import com.ksoe.energynet.valueobject.lists.CNMovementShortList;
//import com.ksoe.energynet.valueobject.filter.CNMovementFilter;

public class CNMovementControllerEJB extends CNMovementControllerEJBGen
 {

  public CNMovementControllerEJB() {}

  /*CNMovement. Добавить*/
  @Override
public int add(CNMovement object)
   {

    try
     {
/*
add validator here .....
      EnergyproValueObjectsValidator validator = new EnergyproValueObjectsValidator();
      if(!validator.isCNMovementValidForAdd(object))
       throw new EnergyproSystemException(validator.getLastErrorMessage());
*/
      CNMovementDAO objectDAO = new CNMovementDAO(getUserProfile(), getConnection(AuthorizationJNDINames.CN_DATASOURCE));
      return objectDAO.add(object);
     }
    catch (DatasourceConnectException e) {
    	throw new EnergyproSystemException("\n " +
                "\n Нет связи с EnergyWorkflow...", e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

  /*CNMovement. Удалить*/
  @Override
public void remove(int code)
   {
    try
     {
      CNMovementDAO objectDAO = new CNMovementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.CN_DATASOURCE));
      objectDAO.remove(code);
     }
    catch (DatasourceConnectException e) {
    	throw new EnergyproSystemException("\n " +
                "\n Нет связи с EnergyWorkflow...", e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }


  /*CNMovement. Изменить*/
  @Override
public void save(CNMovement object)
   {
    try
     {
/*
add validator here .....
      EnergyproValueObjectsValidator validator = new EnergyproValueObjectsValidator();
      if(!validator.isCNMovementValidForSave(object))
       throw new EnergyproSystemException(validator.getLastErrorMessage());
*/
      CNMovementDAO objectDAO = new CNMovementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.CN_DATASOURCE));
      objectDAO.save(object);
     }
    catch (DatasourceConnectException e) {
    	throw new EnergyproSystemException("\n " +
                "\n Нет связи с EnergyWorkflow...", e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

  /*CNMovement. Получить объект*/
  @Override
public CNMovement getObject(int code)
   {
    try
     {
      CNMovementDAO objectDAO = new CNMovementDAO(getUserProfile(),
    		  getConnection(AuthorizationJNDINames.CN_DATASOURCE));
      return objectDAO.getObject(code);
     }
    catch (DatasourceConnectException e) {
    	throw new EnergyproSystemException("\n " +
                "\n Нет связи с EnergyWorkflow...", e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

  /*CNMovement. Получить полный список*/
  @Override
public CNMovementShortList getList()
   {
    return getScrollableFilteredList(null,0,-1);
   }

  /*CNMovement. Получить список по фильтру*/
  @Override
public CNMovementShortList getFilteredList(CNMovementFilter filterObject)
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  /*CNMovement. Получить список для просмотра*/
  @Override
public CNMovementShortList getScrollableList(int fromPosition, int quantity)
   {
    return getScrollableFilteredList(null,fromPosition,quantity);
   }

  /*ECNMovement. Получить список для просмотра по фильтру*/
  @Override
public CNMovementShortList getScrollableFilteredList(CNMovementFilter filterObject, int fromPosition, int quantity)
   {
    try
     {
      CNMovementDAO objectDAO = new CNMovementDAO(getUserProfile(), getConnection(AuthorizationJNDINames.CN_DATASOURCE));
      return objectDAO.getScrollableFilteredList(filterObject, fromPosition, quantity, null);
     }
    catch (DatasourceConnectException e) {
    	throw new EnergyproSystemException("\n " +
                "\n Нет связи с EnergyWorkflow...", e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

  /*CNMovement. Получить список для просмотра по условию*/
  @Override
public CNMovementShortList getScrollableListByCondition(String aCondition, int fromPosition, int quantity)
   {
    CNMovementFilter filterObject = new CNMovementFilter();
    filterObject.conditionSQL = aCondition;
    return getScrollableFilteredList(filterObject,fromPosition,quantity);
   }

  /*ECNMovement. Получить список ПК-кодов по фильтру*/
  @Override
public int[] getScrollableFilteredCodeArray(CNMovementFilter filterObject, int fromPosition, int quantity)
   {
    try
     {
      CNMovementDAO objectDAO = new CNMovementDAO(getUserProfile(), getConnection(AuthorizationJNDINames.CN_DATASOURCE));
      return objectDAO.getFilteredCodeArray(filterObject, fromPosition, quantity);
     }
    catch (DatasourceConnectException e) {
    	throw new EnergyproSystemException("\n " +
                "\n Нет связи с EnergyWorkflow...", e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }


} // end of EJB Controller for CNMovement