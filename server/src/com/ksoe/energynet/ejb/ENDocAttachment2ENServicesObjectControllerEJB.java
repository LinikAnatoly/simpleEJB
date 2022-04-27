
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENDocAttachment2ENServicesObject;
 *
 */

import java.rmi.RemoteException;
import java.util.Calendar;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.logic.AttachmentsLogic;
import com.ksoe.energyWorkflow.dataminer.WFAttachmentDAO;
import com.ksoe.energyWorkflow.logic.WorkFlowLogic;
import com.ksoe.energyWorkflow.valueobject.WFAttachment;
import com.ksoe.energyWorkflow.valueobject.WFAttachmentStatus;
import com.ksoe.energyWorkflow.valueobject.WFPack;
import com.ksoe.energyWorkflow.valueobject.WFSubsystem;
import com.ksoe.energynet.dataminer.ENDocAttachment2ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENDocAttachmentDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENDocAttachment2ENServicesObjectControllerEJBGen;
import com.ksoe.energynet.valueobject.ENAttachment2ServicesKind;
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachment2ENServicesObject;
import com.ksoe.energynet.valueobject.ENDocAttachmentAction;
import com.ksoe.energynet.valueobject.filter.ENDocAttachment2ENServicesObjectFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENDocAttachment2ENServicesObjectControllerEJB extends
		ENDocAttachment2ENServicesObjectControllerEJBGen {

	public ENDocAttachment2ENServicesObjectControllerEJB() {
	}


	public int add(ENDocAttachment object, byte[] aFile, String fileName, int soCode) {
		return add(object, aFile, fileName, soCode, Integer.MIN_VALUE, false);
	}

    public int add(ENDocAttachment object, byte[] aFile, String fileName, int soCode, int kindCode)   {
		return add(object, aFile, fileName, soCode, kindCode, false);    	
    }

    public int add(ENDocAttachment object, byte[] aFile, String fileName, int soCode, int kindCode, boolean isForSiteFiles) {
    	return add(object, aFile, fileName, soCode, kindCode, isForSiteFiles, Integer.MIN_VALUE);
    }

    /*  Добавить */
    public int add(ENDocAttachment object, byte[] aFile, String fileName, int soCode, int kindCode, boolean isForSiteFiles, int atmCode) {
        try {
            ENServicesObjectDAO soDao = new ENServicesObjectDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            AttachmentsLogic attLogic = new AttachmentsLogic(getUserProfile(),
                    getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE));

            Boolean isChangeAtt = false;

            String contractNumberServices = soDao.getObject(soCode).contractNumberServices;

            if (atmCode == Integer.MIN_VALUE) {

                Calendar calendar = Calendar.getInstance();
                String date = String.format("%tY%tm", calendar, calendar);

                String dirToCreate = "EnergyNet/Services/" + date + "/" + contractNumberServices;

                try {
                    Context cnt = new InitialContext();
                    Object objRef = cnt.lookup(ENDocAttachmentController.JNDI_NAME);
                    ENDocAttachmentControllerHome reportHome = (ENDocAttachmentControllerHome) PortableRemoteObject
                            .narrow(objRef, ENDocAttachmentControllerHome.class);
                    ENDocAttachmentController attachmentController = reportHome.create();

                    atmCode = attachmentController.add(object, aFile, fileName, dirToCreate, isForSiteFiles);


                } catch (RemoteException e) {
                    throw new SystemException(e.getMessage(), e);
                } catch (CreateException e) {
                    throw new SystemException(e.getMessage(), e);
                } catch (NamingException e) {
                    throw new SystemException(e.getMessage(), e);
                }

            } else {
                //** если происходит замена вложения из писем, то связка уже есть
                // и нужно заменить только вложение в ВоркФлоу

            	// 14.06.2021 Нифига подобного - когда этот метод вызывается при добавлении
            	// супровидных листов, то он отрабатывает неправильно, и связка вложения
            	// с договором на присоединение не создается
                isChangeAtt = true;
            }



            /** связь с договором */
                ENDocAttachment2ENServicesObjectDAO da2soDao = new ENDocAttachment2ENServicesObjectDAO(
                        getUserProfile(),
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENDocAttachment2ENServicesObject da2so = new ENDocAttachment2ENServicesObject();
            da2so.docAttachmentRef.code = atmCode;
            da2so.servicesObjectRef.code = soCode;

            // связь с пакетом из WorkFlow
            WorkFlowLogic wfLogic = new WorkFlowLogic(getRemoteConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE),
                    getUserProfile());
            WFPack wPack = wfLogic.getWFPackByENServicesObjectCode(soCode);
            if (wPack != null) {
                ENDocAttachment dAtt = new ENDocAttachmentDAO(getUserProfile(),
                        getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)).getObject(atmCode);
                WFAttachment wAtt = new WFAttachment();
                wAtt.commentGen = dAtt.commentGen;
                wAtt.enDocCode = dAtt.code;
                wAtt.dateAdd = dAtt.dateAdd;
                wAtt.dateEdit = dAtt.dateEdit;
                wAtt.userAdd = dAtt.userAdd;
                wAtt.userGen = dAtt.userGen;
                wAtt.pack.code = wPack.code;
                wAtt.status.code = WFAttachmentStatus.ACTIVE;
                new WFAttachmentDAO(getRemoteConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE),
                        getUserProfile()).add(wAtt);

                if (wPack.subsystem.code == WFSubsystem.CONNECTION) {
                    int actionCode = attLogic.getForSiteAttachmentType(dAtt.typeRef.code);
                    if (actionCode != Integer.MIN_VALUE) {
                        if (actionCode == ENDocAttachmentAction.IS_FOR_SITE_COMPANY) {
                            int idDoc = wfLogic.getDocIdForCreateAttachmentLinkToSiteForConnection(wPack.code);
                            wfLogic.createAttachmentLinkToSiteForConnection(dAtt.typeRef.code + 100, idDoc, wPack.code, dAtt.fileLink, dAtt.typeRef.code);
                        }
                    }
                }

            }

            if (kindCode == Integer.MIN_VALUE) {
                da2so.kindRef.code = ENAttachment2ServicesKind.GENERAL_DOC;
            } else {
                da2so.kindRef.code = kindCode;
            }

            if (!isChangeAtt) {
            	da2soDao.add(da2so);
            } else {
            	if (atmCode != Integer.MIN_VALUE) {
	            	// Проверим, есть ли связка, и если нет, накинем
	                ENDocAttachment2ENServicesObjectFilter da2soFilter = new ENDocAttachment2ENServicesObjectFilter();
	                da2soFilter.docAttachmentRef.code = atmCode;
	                da2soFilter.servicesObjectRef.code = soCode;
	                int[] da2soCodes = da2soDao.getFilteredCodeArray(da2soFilter, 0, -1);
	                if (da2soCodes.length == 0) {
	                	da2soDao.add(da2so);
	                }
            	}
            }

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


} // end of EJB Controller for ENDocAttachment2ENServicesObject