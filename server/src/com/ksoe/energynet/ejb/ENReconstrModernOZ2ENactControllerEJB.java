
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENReconstrModernOZ2ENact;
  *
  */



import java.math.BigDecimal;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENReconstrModernOZ2ENactDAO;
import com.ksoe.energynet.dataminer.ENReconstrModernOZDAO;
import com.ksoe.energynet.ejb.generated.ENReconstrModernOZ2ENactControllerEJBGen;
import com.ksoe.energynet.logic.ReconstrModernizacLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENRecoModTypeWork;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact;
import com.ksoe.energynet.valueobject.filter.ENReconstrModernOZ2ENactFilter;
import com.ksoe.energynet.valueobject.lists.ENReconstrModernOZ2ENactShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENReconstrModernOZ2ENactControllerEJB extends ENReconstrModernOZ2ENactControllerEJBGen
 {

  public ENReconstrModernOZ2ENactControllerEJB() {}

  /*ENReconstrModernOZ2ENact. Добавить*/
  public int add(ENReconstrModernOZ2ENact object)
   {
    try
     {

      ENReconstrModernOZ2ENactDAO objectDAO = new ENReconstrModernOZ2ENactDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      // при добавлении акта в ОЗ-2 проверяем расходный акт по договору(усл на сторону и тд) или нет
      // (наши работы) если по договору тогда в ОЗ-2 проставим номер договора фин, и код партнера
      // учесть что могут быть акты по работам со стороны
      ReconstrModernizacLogic logic = new ReconstrModernizacLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
      // определим какого типа акты в ОЗ
      ENActDAO aDAO = new ENActDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
      ENAct aObj = aDAO.getObject(object.actRef.code);
      
      ENReconstrModernOZ2ENactFilter m2aFil = new ENReconstrModernOZ2ENactFilter();
      m2aFil.ENReconstrModernOZRef.code = object.ENReconstrModernOZRef.code;
      m2aFil.actRef.code = object.actRef.code;
      
      int[] m2aArr = objectDAO.getFilteredCodeArray(m2aFil, 0, -1);
      
      if( m2aArr.length > 0 ){
    	  return m2aArr[0] ; 
      }
      
      int typeWorkInOZ = Integer.MIN_VALUE;
      if (aObj.actTypeRef.code == ENPlanWorkState.TMC_TRANSFER) {
    	  typeWorkInOZ = ENRecoModTypeWork.ONSIDEWORK; 
      } else
    	  typeWorkInOZ = logic.validateExpenceActContract(object);

      object.isCalculationDate = 1; // ставим признак что бы учитывались даты с наряд заданий при печати оз_2
      int r2aCode = objectDAO.add(object);
   // пересчитаем сумму по добавляемому акту
      ENReconstrModernOZ2ENact newObjectr2a =  objectDAO.getObject(r2aCode);
	  logic.calculationSumByAct(newObjectr2a , typeWorkInOZ);
	// пересчитаем общую сумму по всем актам относящихся к документу ОЗ2.
	  logic.recalcSumInOZ2(newObjectr2a.ENReconstrModernOZRef.code);
	  return r2aCode;
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

  /*ENReconstrModernOZ2ENact. Удалить*/
  public void remove(int code)
   {
    try
     {
      ENReconstrModernOZ2ENactDAO objectDAO = new ENReconstrModernOZ2ENactDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      ENReconstrModernOZDAO ozDAO = new ENReconstrModernOZDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      ENReconstrModernOZ2ENact oz2actObject =  objectDAO.getObject(code);
      ENReconstrModernOZ ozObject = ozDAO.getObject(oz2actObject.ENReconstrModernOZRef.code);

     // если удаляется строка подвязки акта в документом ОЗ то обнуляем поля в документе ОЗ некоторые .
      objectDAO.remove(code);
      ENReconstrModernOZ2ENactFilter oz2actFilter = new ENReconstrModernOZ2ENactFilter();
      oz2actFilter.ENReconstrModernOZRef.code = ozObject.code;
      ENReconstrModernOZ2ENactShortList oz2actList = objectDAO.getScrollableFilteredList(oz2actFilter, 0, -1);
      if (oz2actList.totalCount == 0 ) {
    	  ozObject.finContractDate = null;
    	  ozObject.finContractNumber = null;
    	  ozObject.summaGen = new BigDecimal(0);
    	  ozObject.summaNDS = new BigDecimal(0);
    	  ozObject.partnerCode = null;
    	  ozObject.partnerName = null;
    	  ozObject.typeRef.code = ENRecoModTypeWork.OWNERWORK; // Integer.MIN_VALUE;


    	  // ozDAO.save(ozObject);
    	  ozDAO.updateContractPartnerType(ozObject);
    	  ozDAO.updateSumGenAndNDS(ozObject);
      }

    // пересчитаем общую сумму по всем актам относящихся к документу ОЗ2.
      ReconstrModernizacLogic logic = new ReconstrModernizacLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
      logic.recalcSumInOZ2(ozObject.code);


      // после удаление из привязки всех актов под ОЗ почистим поля (fincontractnumber , fincontractdate) на ОЗ-хе

     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }


  /*ENReconstrModernOZ2ENact. Изменить*/
  public void save(ENReconstrModernOZ2ENact object)
   {
    try
     {
/*
add validator here .....
      EnergyproValueObjectsValidator validator = new EnergyproValueObjectsValidator();
      if(!validator.isENReconstrModernOZ2ENactValidForSave(object))
       throw new EnergyproSystemException(validator.getLastErrorMessage());
*/
      ENReconstrModernOZ2ENactDAO objectDAO = new ENReconstrModernOZ2ENactDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      objectDAO.save(object);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }
  
  
  /*EENReconstrModernOZ2ENact. Получить список для просмотра по фильтру*/
  public ENReconstrModernOZ2ENactShortList getScrollableFilteredListForRM(ENReconstrModernOZ2ENactFilter filterObject, int fromPosition, int quantity)
                                                                          
  {
    try
     {
      ENReconstrModernOZ2ENactDAO objectDAO = new ENReconstrModernOZ2ENactDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      return objectDAO.getScrollableFilteredListForRM(filterObject, filterObject.conditionSQL, null, 0, -1);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get list of {%com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact%} objects.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }
  
  
  /*ENReconstrModernOZ2ENact. апдейт признака учета дат по наряд заданиям акта в этой оз*/
  public void updateIsCalculationDate(int actCode, int ozCode , int isCalculationDate)
   {
    try
     {

      ENReconstrModernOZ2ENactDAO objectDAO = new ENReconstrModernOZ2ENactDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
 
    	  objectDAO.updateIsCalculationDate(actCode, ozCode , isCalculationDate);
    
    	  
      
      
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }





} // end of EJB Controller for ENReconstrModernOZ2ENact