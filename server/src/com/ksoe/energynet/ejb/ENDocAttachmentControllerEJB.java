
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENDocAttachment;
 *
 */

import java.rmi.RemoteException;
import java.sql.Connection;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.logic.AttachmentsLogic;
import com.ksoe.docflow.valueobject.DFDocAttachmentStatus;
import com.ksoe.energyWorkflow.logic.WFConsts;
import com.ksoe.energyWorkflow.logic.WorkFlowLogic;
import com.ksoe.energynet.dataminer.ENDocAttachmentDAO;
import com.ksoe.energynet.dataminer.ENDocAttachmentServerDAO;
import com.ksoe.energynet.ejb.generated.ENDocAttachmentControllerEJBGen;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachmentServer;
import com.ksoe.energynet.valueobject.ENDocAttachmentStatus;
import com.ksoe.energynet.valueobject.ENDocAttachmentType;
import com.ksoe.energynet.valueobject.brief.ENDocAttachmentShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachmentFilter;
import com.ksoe.energynet.valueobject.lists.ENDocAttachmentShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENDocAttachmentControllerEJB extends
		ENDocAttachmentControllerEJBGen {

	public ENDocAttachmentControllerEJB() {
	}

    /* ENDocAttachment. Получить(прочитать) объект */
    public String readObject(int code) {
        try {
            ENDocAttachmentDAO objectDAO = new ENDocAttachmentDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            
            ENDocAttachmentServerDAO attServerDAO = new ENDocAttachmentServerDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            
         
            String str = "";

            ENDocAttachment attachment = objectDAO.getObject(code);
            ENDocAttachmentServer attServ = attServerDAO.getObject(attachment.serverRef.code);
            String dir = attachment.fileLink;
            String fn = "";
            String ftpIp = attServ.serverIp;
            String ftpUn = attServ.userName;
            String ftpPw = attServ.userPass;
            

            try {
                Context cnt = new InitialContext();
                Object objRef = cnt.lookup(ENReportController.JNDI_NAME);
                ENReportControllerHome reportHome = (ENReportControllerHome) PortableRemoteObject
                        .narrow(objRef, ENReportControllerHome.class);
                ENReportController reportController = reportHome.create();

                str = reportController.readingByFTP(ftpUn, ftpPw, ftpIp, dir, fn);

            } catch (RemoteException e) {
                throw new SystemException(e.getMessage(), e);
            } catch (CreateException e) {
                throw new SystemException(e.getMessage(), e);
            } catch (NamingException e) {
                throw new SystemException(e.getMessage(), e);
            }

            return str;

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't get {%com.ksoe.energynet.valueobject.ENDocAttachment%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* ENDocAttachment. Удалить */
    @Override
	public void remove(int code) {
    	remove(code, Integer.MIN_VALUE);
    }

	public void remove(int code, int wfPackCode) {
        try {
        	ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());        	
        	
        	if (servicesLogic.checkENSheetForENAttachment(code)) {
        		throw new SystemException("\n\nSUPP-88605 Це вкладення сформовано автоматично з листа замовнику!" +
        				"\nДля його видалення потрібно видалити цей лист (вкладка \"Листи\" на договорі про приєднання)");
        	}

        	AttachmentsLogic attachmentsLogic = new AttachmentsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

        	boolean shouldDeleteENDocAttachment = true;
        	if (wfPackCode != Integer.MIN_VALUE) {
        		// Если вложение удаляется со стороны пакета WorkFlow,
        		// но при этом оно было создано из DocFlow (это стало возможным благодаря SUPP-90093), 
        		// то мы должны удалить только WFAttachment, не трогая при этом сам ENDocAttachment
        		if (attachmentsLogic.isENAttachmentCreatedByDFDocAttachment(code)) {
        			shouldDeleteENDocAttachment = false;
        		}
        	}

        	if (shouldDeleteENDocAttachment) {
	        	ENDocAttachmentDAO objectDAO = new ENDocAttachmentDAO(
	                    getUserProfile(),
	                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	        	ENDocAttachment attachment = objectDAO.getObject(code);

	            attachment.status.code = ENDocAttachmentStatus.DELETE;
	            attachment.userGen = getUserProfile().userName;
	            attachment.dateEdit = new Date();

	            objectDAO.save(attachment);
        	} else {
        		// Нужно удалить связки
        		if (wfPackCode != Integer.MIN_VALUE) {
        			attachmentsLogic.removeENDocAttachment2ENServicesObjectByWFPack(wfPackCode, code);
        		}
        	}

            attachmentsLogic.removeWFAttachmentsByENDocAttachment(code, wfPackCode);

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't remove {%com.ksoe.energynet.valueobject.ENDocAttachment%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }
    
    

	/* ENDocAttachment. Добавить */
    public int add(ENDocAttachment object, byte[] aFile, String fileName, String dirToCreate) {
    	return this.add(object, aFile, fileName, dirToCreate, false);
    }
    
	/* ENDocAttachment. Добавить */
    public int add(ENDocAttachment object, byte[] aFile, String fileName, String dirToCreate, boolean isForSiteFiles) {
        try {
        	ENDocAttachmentDAO objectDAO = new ENDocAttachmentDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENDocAttachmentServerDAO servDAO = new ENDocAttachmentServerDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        	
        	// засетим тип вложения по умолчанию, если не указан
        	if (object.typeRef == null || object.typeRef.code == Integer.MIN_VALUE){
        		object.typeRef.code = ENDocAttachmentType.DEFAULT;
        	}
        
            if (object.parentRef.code != Integer.MIN_VALUE) {
            	ENDocAttachment currentAttachment = objectDAO.getObject(object.parentRef.code);
            	currentAttachment.status.code = DFDocAttachmentStatus.CHANGED;

            	objectDAO.save(currentAttachment);
            }

            String transliterateFileName = transliterate(fileName, false, true);
            fileName = transliterateFileName;
            
            object.status.code = ENDocAttachmentStatus.ACTIVE;
            object.userAdd = getUserProfile().userName;
            object.dateAdd = new Date();
            object.userGen = getUserProfile().userName;
            object.dateEdit = new Date();

	        if (dirToCreate.length() == 0) {
	        	Calendar calendar = Calendar.getInstance();
	        	String date = String.format("%tY%tm", calendar, calendar);
		        
	        	dirToCreate = "EnergyNet/Documents/" + date;
	        }

			// Чтобы случайно при тестировании не зацепить реальные документы!!!
			String ipAddres = Tools.getInetAddress();
			if (! ipAddres.equals(Tools.ENERGY_NET_SERVER_IP)) {
				dirToCreate += "/TEST";
			}

	        object.filesize = aFile.length;
            object.fileLink = dirToCreate;
            object.serverRef.code = isForSiteFiles ? ENDocAttachmentServer.EXTERNAL_SERVER_CODE : ENDocAttachmentServer.PRIMARY_SERVER_CODE;

            ENDocAttachmentServer serv = servDAO.getObject(object.serverRef.code);

            int atmCode = objectDAO.add(object);

            dirToCreate = dirToCreate + "/" + atmCode;

            try {
                Context cnt = new InitialContext();
                Object objRef = cnt.lookup(ENReportController.JNDI_NAME);
                ENReportControllerHome reportHome = (ENReportControllerHome) PortableRemoteObject
                        .narrow(objRef, ENReportControllerHome.class);
                ENReportController reportController = reportHome.create();

                reportController.saveByFTP(aFile, serv.userName, serv.userPass, serv.serverIp, dirToCreate, fileName);

            } catch (RemoteException e) {
                throw new SystemException(e.getMessage(), e);
            } catch (CreateException e) {
                throw new SystemException(e.getMessage(), e);
            } catch (NamingException e) {
                throw new SystemException(e.getMessage(), e);
            }

            ENDocAttachment attachment = objectDAO.getObject(atmCode);
            attachment.fileLink = dirToCreate + "/" + fileName;
            objectDAO.save(attachment);

            return atmCode;

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENDocAttachment%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

   	/* ENDocAttachment. Изменить */
    @Override
	public void save(ENDocAttachment object) {
		try {
		    super.save(object);

		    // При изменении вложения будем удалять вложения из WorkFlow, связанные со старым (замененным) вложением
		    if (object.status.code == ENDocAttachmentStatus.CHANGED) {
	            AttachmentsLogic attachmentsLogic = new AttachmentsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	            attachmentsLogic.removeWFAttachmentsByENDocAttachment(object.code);
		    }

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENDocAttachment%} object.",
					e);
		} finally {
			closeConnection();
		}
	}

	/**
	 * Получение списка вложений для договора с учетом ограничения доступа для текущего пользователя
	 *
	 * @param servicesObjectCode - код договора
	 * @param filterObject
	 * @param fromPosition
	 * @param quantity
	 *
	 * @return список вложений
	 */
	public ENDocAttachmentShortList getScrollableFilteredListRestricted(int servicesObjectCode,
			ENDocAttachmentFilter filterObject, int fromPosition,
			int quantity) {
		if (servicesObjectCode <= 0) {
			throw new IllegalArgumentException("\n\nSUPP-102989 Не заданий код договора!");
		}

		try {
			Connection wfConnection = getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);
			WorkFlowLogic wfLogic = new WorkFlowLogic(wfConnection, getUserProfile());

			// Если у текущего пользователя ограниченный доступ к договору, вернем пустой список вложений
			if (wfLogic.accessToServicesObjectMustBeRestricted(servicesObjectCode)) {
				ENDocAttachmentShortList result = new ENDocAttachmentShortList();
				result.list = new Vector<>();
				ENDocAttachmentShort attach = new ENDocAttachmentShort();
				attach.commentGen = WFConsts.MESSAGE_FOR_VISIBILITY_RESTRICTION;
				result.list.add(attach);
				result.setTotalCount(1);
				return result;
			}

			ENDocAttachmentDAO objectDAO = new ENDocAttachmentDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getScrollableFilteredList(filterObject,
					fromPosition, quantity, null);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get list of {%com.ksoe.energynet.valueobject.ENDocAttachment%} objects.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public String transliterate(String str) {
        return Tools.transliterate(str);
    }
	
	public String transliterate(String str, boolean caseSensitive, boolean isStrict) {
		return Tools.transliterate(str, caseSensitive, isStrict);
	}
    


} // end of EJB Controller for ENDocAttachment