
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for CNAttachment;
 *
 */

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.CNAttachmentDAO;
import com.ksoe.energynet.dataminer.CNPackDAO;
import com.ksoe.energynet.ejb.generated.CNAttachmentControllerEJBGen;
import com.ksoe.energynet.logic.CNLogic;
import com.ksoe.energynet.valueobject.CNPack;
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.filter.CNAttachmentFilter;
import com.ksoe.energynet.valueobject.filter.CNPackFilter;
import com.ksoe.energynet.valueobject.lists.CNAttachmentShortList;
import com.ksoe.energynet.valueobject.lists.CNPackShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class CNAttachmentControllerEJB extends
		CNAttachmentControllerEJBGen {

	public CNAttachmentControllerEJB() {
	}

	  /* CNPack(Пакети документів з EnergyWorkflow). Получить список по фильтру для просмотра */
	  public CNAttachmentShortList getAttachmentList(CNAttachmentFilter f, int fromPosition, int quantity)
	  {
		    try
		     {
		    	CNAttachmentDAO objectDAO = new CNAttachmentDAO(getUserProfile(), getConnection(AuthorizationJNDINames.CN_DATASOURCE));
		        return objectDAO.getCNAttachmentsList(f, fromPosition, quantity);
		     }
		    catch (DatasourceConnectException e) {throw new SystemException("Нет связи с EnergyWokflow!",e);}
		    catch (PersistenceException e)       {throw new SystemException(e.getMessage(),e);}
		    finally                              {closeConnection();}
	  }
	  
	  public void convertAtt(int code)
	  {
		  try
		     {
		    	CNLogic cnLogic = new CNLogic(getConnection(AuthorizationJNDINames.CN_DATASOURCE),getUserProfile());
		        cnLogic.relocateAttachments();
		     }
		    catch (DatasourceConnectException e) {throw new SystemException("Нет связи с EnergyWokflow!",e);}
		    finally                              {closeConnection();}
	  }
	  
		public void convertAtt(int id, String prefix) 
		{
			  try
			     {
			    	CNLogic cnLogic = new CNLogic(getConnection(AuthorizationJNDINames.CN_DATASOURCE),getUserProfile());
			        cnLogic.convertAttachments(id, prefix);
			     }
			    catch (DatasourceConnectException e) {throw new SystemException("Нет связи с EnergyWokflow!",e);}
			    finally                              {closeConnection();}
		  }
	  
	  public void transliterateAtt(int code)
	  {
		  try
		     {
		    	CNLogic cnLogic = new CNLogic(getConnection(AuthorizationJNDINames.CN_DATASOURCE),getUserProfile());
		        cnLogic.transliterateAttachments(code);
		     }
		    catch (DatasourceConnectException e) {throw new SystemException("Нет связи с EnergyWokflow!",e);}
		    finally                              {closeConnection();}
	  }
	  
	  public void removeCN(String cnSubSystem, int id, int codeENDocAttachment){
		  CNAttachmentDAO objectDAO;		  
		try {
			objectDAO = new CNAttachmentDAO(getUserProfile(), getConnection(AuthorizationJNDINames.CN_DATASOURCE));
			objectDAO.removeCN(cnSubSystem, id);
			
			if (codeENDocAttachment != 0){
				Context cnt = new InitialContext();
		        Object objRef = cnt.lookup(ENDocAttachmentController.JNDI_NAME);	        
		        ENDocAttachmentControllerHome enDocAttachmentHome = (ENDocAttachmentControllerHome)PortableRemoteObject 
		        							.narrow(objRef, ENDocAttachmentControllerHome.class);
		        ENDocAttachmentController enDocAttachmentController = enDocAttachmentHome.create();
		        enDocAttachmentController.remove(codeENDocAttachment);	  
	        }   
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			 throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		}	      
	        
	  }

		public void addDocAttachments(String cnSubSystem, String attachDocName, int idPack,
				int idMovement, int idUser, ENDocAttachment object, byte[] aFile, String fileName, String dirToCreate){
			int codeENDocAttachment;		
			CNAttachmentDAO objectDAO;
			
			try {							
				Context cnt = new InitialContext();
			    Object objRef = cnt.lookup(ENDocAttachmentController.JNDI_NAME);	        
			    ENDocAttachmentControllerHome enDocAttachmentHome = (ENDocAttachmentControllerHome)PortableRemoteObject 
			      							.narrow(objRef, ENDocAttachmentControllerHome.class);
			    ENDocAttachmentController enDocAttachmentController = enDocAttachmentHome.create();
			    codeENDocAttachment = enDocAttachmentController.add(object, aFile, fileName, dirToCreate);	  			        
			        
			    objectDAO = new CNAttachmentDAO(getUserProfile(), getConnection(AuthorizationJNDINames.CN_DATASOURCE));
				objectDAO.addDocAttachments(cnSubSystem, attachDocName, idPack, idMovement,	idUser, codeENDocAttachment);				
			} catch (DatasourceConnectException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (PersistenceException e) {
				 throw new SystemException(e.getMessage(), e);
			} catch (RemoteException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (CreateException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (NamingException e) {
				throw new SystemException(e.getMessage(), e);
			}	 
			
		}

	
} // end of EJB Controller for CNAttachment