
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.logic.signing.DocSigningLogic;
import com.ksoe.docflow.logic.signing.DocSigningProcessor;
import com.ksoe.docflow.logic.signing.DocSigningProcessorImpl;
import com.ksoe.docflow.valueobject.DFDocSigner;
import com.ksoe.energynet.dataminer.ENActProj2OZ2DAO;
import com.ksoe.energynet.dataminer.ENActProj2OZ2DateDAO;
import com.ksoe.energynet.dataminer.ENReconstrModern2OSDataDAO;
import com.ksoe.energynet.dataminer.ENReconstrModernOZDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENReconstrModernOZControllerEJBGen;
import com.ksoe.energynet.logic.ReconstrModernizacLogic;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ;
import com.ksoe.energynet.valueobject.ENReconstrModernOZStatus;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.filter.ENActProj2OZ2DateFilter;
import com.ksoe.energynet.valueobject.filter.ENActProj2OZ2Filter;
import com.ksoe.energynet.valueobject.filter.ENReconstrModern2OSDataFilter;
import com.ksoe.energynet.valueobject.lists.ENReconstrModern2OSDataShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.fin.logic.FKOSLogic;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENReconstrModernOZControllerEJB extends ENReconstrModernOZControllerEJBGen
 {

  public ENReconstrModernOZControllerEJB() {}

  /*ENReconstrModernOZ. Добавить*/
  @Override
public int add(ENReconstrModernOZ object)
   {
    try
     {
      object.setDomain_info(null);
/*
add validator here .....
      EnergyproValueObjectsValidator validator = new EnergyproValueObjectsValidator();
      if(!validator.isENReconstrModernOZValidForAdd(object))
       throw new EnergyproSystemException(validator.getLastErrorMessage());
*/
      ENReconstrModernOZDAO objectDAO = new ENReconstrModernOZDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      object.statusRef.code = ENReconstrModernOZStatus.DRAFT;
      object.userGen = getUserProfile().userName;
      object.dateEdit = new Date();
      // проверка на резервирование объекта для операций ()

      // согласно служебке SUPP-3499 по согласованию с Черепиной А было решено не резервировать основное при создании документа ОЗ_2
      // что бы можно было создавать несколько ОЗ_2 по одному инвентарному даже если они не проведены
      /*ReconstrModernizacLogic logic = new ReconstrModernizacLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) , getUserProfile());
      logic.checkReserveByInv(object.invNumberOZ);
      // резервируем ОС
      logic.makeReserveRMByInv(object); */
      
      if (object.servicesobject.code != Integer.MIN_VALUE){
    	  ENServicesObject soObj = soDAO.getObject(object.servicesobject.code);
    	  object.finContractNumber = soObj.contractNumber; 
    	  object.finContractDate = soObj.contractDate;
    	  object.partnerName = soObj.name;
    	  object.partnerCode = soObj.partnerCode;
      }

      return objectDAO.add(object);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENReconstrModernOZ%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

  /*ENReconstrModernOZ. Изменить*/
  @Override
  public void save(ENReconstrModernOZ object) {
	  save(object, null);
  }

  /*ENReconstrModernOZ. Изменить*/
  public void save(ENReconstrModernOZ object, DFDocSigner[] dfDocSigners)
   {
	  Connection docFlowConn = null;

    try
     {
      object.setDomain_info(null);

      ENReconstrModernOZDAO objectDAO = new ENReconstrModernOZDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

      object.userGen = getUserProfile().userName;
      object.dateEdit = new Date();
     // if (object.characteristic != null) {
     //     object.characteristic = object.characteristic.replaceAll("\n","\n\r").trim();
     // }
      
      
      
      
      if (object.servicesobject.code != Integer.MIN_VALUE){
    	  ENServicesObject soObj = soDAO.getObject(object.servicesobject.code);
    	  object.finContractNumber = soObj.contractNumber; 
    	  object.finContractDate = soObj.contractDate;
    	  object.partnerName = soObj.name;
    	  object.partnerCode = soObj.partnerCode;
      }

	  	if (object.statusRef.code == ENReconstrModernOZStatus.DRAFT) {
			if (DocSigningLogic.isSignable(object)) {
				docFlowConn = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
				DocSigningLogic docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConn, getUserProfile(), object);
				if (DocSigningLogic.isReadyForSigning(object) || docSigningLogic.getDocCodeForObject(object) > 0) {
					docSigningLogic.createOrRemoveDocWithSigners(object, dfDocSigners);
				}
			}
		}

      objectDAO.save(object);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENReconstrModernOZ%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally {
        try {
            if (docFlowConn != null && ! docFlowConn.isClosed()) {
            	docFlowConn.close();
            	docFlowConn = null;
            }
        } catch (SQLException e) {
        }
    	closeConnection();
    }
   }


  public void createOZ(int ozCode)
  {
	  Connection docFlowConnection = null;
	  
	   try {

		   ENReconstrModernOZDAO objectDAO = new ENReconstrModernOZDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		   ENReconstrModernOZ obj = objectDAO.getObject(ozCode);

		   if (obj.statusRef.code == ENReconstrModernOZStatus.DRAFT) {
			   obj.statusRef.code = ENReconstrModernOZStatus.SIGNED;
			   objectDAO.save(obj);
		   } else {
			   throw new EnergyproSystemException("\n\nДокумент ОЗ повинен бути зі статусом Черновий !!!");
		   }

			DocSigningLogic docSigningLogic = null;

			// NET-4596 Проверим сразу наличие подписантов
			if (DocSigningLogic.isSignable(obj)) {
				docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
				docSigningLogic = DocSigningLogic.getInstanceForObject(docFlowConnection, getUserProfile(), obj);
				//if (checkDocCode) {
					docSigningLogic.checkDocCodeForObject(obj);
				//}
				docSigningLogic.checkIfSigningStartIsPossible(obj);
			}

		   // проверка на то что если завели ручные акты то были под них указаны даты выполенния работ

		   ENActProj2OZ2DateDAO ap2ozDateDAO = new ENActProj2OZ2DateDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

		   ENActProj2OZ2DAO ap2ozDAO = new ENActProj2OZ2DAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		   ENActProj2OZ2Filter ap2ozFilter = new ENActProj2OZ2Filter();
		   ap2ozFilter.ENReconstrModernOZRef.code = ozCode;
		   int[] ap2ozArr = ap2ozDAO.getFilteredCodeArray(ap2ozFilter, 0, -1);
           
		   FKOSLogic logic = new FKOSLogic(getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),getUserProfile());
		   
		   // проверка скв при переводе в статус складений 
		    logic.calculateTermUsefulOS( obj.termUseful ,  obj.invNumberOZ , obj.dateGen  );

		   for (int i = 0; i < ap2ozArr.length; i++ ){

			   ENActProj2OZ2DateFilter  ap2ozDateFilter = new ENActProj2OZ2DateFilter();
			   ap2ozDateFilter.ENActProjRef.code = ap2ozArr[i];
			   int[] ap2ozDateArr = ap2ozDateDAO.getFilteredCodeArray(ap2ozDateFilter, 0, -1);
			   if (ap2ozDateArr.length == 0 ){
				   throw new EnergyproSystemException("Необхідно вказати період(и) виконання робіт по актам проектування !!!");
			   }
		   }

			// NET-4596 Подписание документа
			if (docSigningLogic != null) {
				docSigningLogic.createFirstDocMovementForSigning(obj);
			}
	   }
	   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENReconstrModernOZ%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {
	        try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}

	    	closeConnection();
	    }

  }

  public void unCreateOZ(int ozCode)
  {
	   try {

		   ENReconstrModernOZDAO objectDAO = new ENReconstrModernOZDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		   ENReconstrModern2OSDataDAO ozDataDAO = new ENReconstrModern2OSDataDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		   ENReconstrModern2OSDataFilter ozDataFilter = new ENReconstrModern2OSDataFilter();
		   ozDataFilter.ENReconstrModernOZRef.code = ozCode;
		   ENReconstrModern2OSDataShortList ozDataList = ozDataDAO.getScrollableFilteredList(ozDataFilter, 0, -1);

		   ENReconstrModernOZ obj = objectDAO.getObject(ozCode);

		   if (obj.statusRef.code == ENReconstrModernOZStatus.SIGNED ) {
		   obj.statusRef.code = ENReconstrModernOZStatus.DRAFT;
		   objectDAO.save(obj);
		   // удаляем данные бух
		   if (ozDataList.totalCount != 0){
			   ozDataDAO.remove(ozDataList.get(0).code);
		   }

		   } else
		   {
			   throw new EnergyproSystemException("Документ ОЗ повинен бути складеним!!!");
		   }

		   // NET-4596 Отменяем связанный документ в документообороте
           ReconstrModernizacLogic logic = new ReconstrModernizacLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
           logic.cancelDFDoc(ozCode);

	   }
	   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENReconstrModernOZ%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}

  }

  public void moveToOS(int ozCode) {
	  moveToOS(ozCode, null);
  }

  public void moveToOS(int ozCode, Object caller)
  {
	   try {

		   ENReconstrModernOZDAO objectDAO = new ENReconstrModernOZDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		   ENReconstrModernOZ obj = objectDAO.getObject(ozCode);

		   ReconstrModernizacLogic logic = new ReconstrModernizacLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

		   if (obj.statusRef.code == ENReconstrModernOZStatus.SIGNED ) {

			   // создадим документы в ОС при проведении ОЗ-2
			   
			   logic.moveDovvodToOS(obj);

			   obj.statusRef.code = ENReconstrModernOZStatus.CLOSE;
			   objectDAO.save(obj);
		   } else {
			   throw new EnergyproSystemException("\n\nДокумент ОЗ повинен бути складеним!!!");
		   }

	        int dfDocCode = logic.getDFDocCodeForENReconstrModernOZ(ozCode);
	        if (dfDocCode > 0) {
	        	// Т.к. при проведении со стороны документооборота вызывается этот же метод, будем передавать при вызове оттуда 
	        	// доп. параметр caller, чтобы понимать, откуда вызов (если не передан, значит, проводят по-старому со стороны документа на ввод в экспл.)
	        	if (caller == null) {
	            	throw new SystemException("\n\nNET-4596 Для проведення цього акту ОЗ-2 потрібно завершити " + 
	            			"пов'язане завдання в документообігу!\n" + "Код документу: " + dfDocCode);
	        	}
	        }

	   }
	   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENReconstrModernOZ%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}

  }

	/**
	 * Метод для отмены проведения документов, подписанных с помощью ЭЦП
	 * (для отдельных прав)
	 *
	 * @param ozCode
	 */
  	public void unMoveToOSByEcp(int ozCode) {
  		unMoveToOS(ozCode);
  	}

	public void unMoveToOS(int ozCode) {
		Connection docFlowConn = null;

		try {

			ENReconstrModernOZDAO objectDAO = new ENReconstrModernOZDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENReconstrModernOZ obj = objectDAO.getObject(ozCode);

			ReconstrModernizacLogic logic = new ReconstrModernizacLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());

			if (obj.statusRef.code == ENReconstrModernOZStatus.CLOSE) {
				// удалим доввод в ОС для основного
				logic.unMoveDovvodToOS(obj);
				obj.statusRef.code = ENReconstrModernOZStatus.SIGNED;
				objectDAO.save(obj);
			} else {
				throw new EnergyproSystemException(
						"Документ ОЗ повинен бути проведеним!!!");
			}

            // NET-4596 Отменяем закрытие связанного движения в документообороте
            int dfDocCode = logic.getDFDocCodeForENReconstrModernOZ(ozCode);
            if (dfDocCode > 0) {
            	docFlowConn = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
    			DocSigningProcessor docSigningProcessor = new DocSigningProcessorImpl(obj, docFlowConn, getUserProfile());
    			docSigningProcessor.doActionsForDocUnClosing(obj);
            }

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't unMoveToOS {%com.ksoe.energynet.valueobject.ENReconstrModernOZ%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
            try {
                if (docFlowConn != null && ! docFlowConn.isClosed()) {
                	docFlowConn.close();
                	docFlowConn = null;
                }
            } catch (SQLException e) {
            }
			closeConnection();
		}

	}

  /* Возвращает текущую бухгалтерскую дату из ОС */
	public Date getCurrentBuhDateOS() {
		try {
			FKOSLogic logic = new FKOSLogic(
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
					getUserProfile());

			return logic.getCurrentBuhDate();

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"\n \n Нет связи с Фин коллекцией...");
		} finally {
			closeConnection();
		}
	}

	 /*ENReconstrModernOZ. Удалить*/
	  @Override
	public void remove(int code)
	   {
	    try
	     {
	      ENReconstrModernOZDAO objectDAO = new ENReconstrModernOZDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      ENReconstrModernOZ object = objectDAO.getObject(code);
	      if (object.statusRef.code != ENReconstrModernOZStatus.DRAFT) {
	    	  throw new EnergyproSystemException(
				"\n \n Видаляти можна тількі чорнові документи ...");
	      }
	      // отменим резирвирование в ОС_T для основного при удалении документа ОЗ
	      ReconstrModernizacLogic logic = new ReconstrModernizacLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) , getUserProfile());
	      logic.unMakeReserveRMByKodInv(object.invNumberOZ);

	      // NET-4596 Отменяем связанный документ в документообороте
	      logic.cancelDFDoc(code);
	      logic.removeENReconstrModernOZ2DFDoc(code, Integer.MIN_VALUE, true);

	      objectDAO.remove(code);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENReconstrModernOZ%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }

	/* Возвращает строку характеристки для объекта из ОС */
	public String getObjectCharacteristicsFromOS(String inv_kod) {
		try {
			FKOSLogic logic = new FKOSLogic(
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
					getUserProfile());

			return logic.getObjectCharacteristicsFromOS(inv_kod);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"\n \n Нет связи с Фин коллекцией...");
		} finally {
			closeConnection();
		}
	}
	
	
	public int[] getNalogAndBuhUseLimitByInv(String inv_kod , Date p_date_oz){
		try {
			FKOSLogic logic = new FKOSLogic(
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE),
					getUserProfile());

			return  logic.getNalogAndBuhUseLimitByInv(inv_kod , p_date_oz);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"\n \n Нет связи с Фин коллекцией...");
		} finally {
			closeConnection();
		}	
	}


} // end of EJB Controller for ENReconstrModernOZ