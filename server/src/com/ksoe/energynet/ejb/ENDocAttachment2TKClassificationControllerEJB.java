
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENDocAttachment2TKClassification;
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
import com.ksoe.energynet.dataminer.ENDocAttachment2TKClassificationDAO;
import com.ksoe.energynet.ejb.generated.ENDocAttachment2TKClassificationControllerEJBGen;
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachment2TKClassification;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENDocAttachment2TKClassificationControllerEJB extends
		ENDocAttachment2TKClassificationControllerEJBGen {

	public ENDocAttachment2TKClassificationControllerEJB() {
	}

	public int add(ENDocAttachment object, byte[] aFile, String fileName, int tkClassificationTypeCode) {
		if (tkClassificationTypeCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе задано код класифікації робіт!");
		}

        try {
        	int atmCode = Integer.MIN_VALUE;

            Calendar calendar = Calendar.getInstance();
	        String date = String.format("%tY%tm", calendar, calendar);

            String dirToCreate = "EnergyNet/TKClassificationType/" + date + "/" + tkClassificationTypeCode;

            try {
                Context cnt = new InitialContext();
                Object objRef = cnt.lookup(ENDocAttachmentController.JNDI_NAME);
                ENDocAttachmentControllerHome reportHome = (ENDocAttachmentControllerHome) PortableRemoteObject
                        .narrow(objRef, ENDocAttachmentControllerHome.class);
                ENDocAttachmentController attachmentController = reportHome.create();

                atmCode = attachmentController.add(object, aFile, fileName, dirToCreate);

            } catch (RemoteException e) {
                throw new SystemException(e.getMessage(), e);
            } catch (CreateException e) {
                throw new SystemException(e.getMessage(), e);
            } catch (NamingException e) {
                throw new SystemException(e.getMessage(), e);
            }

            /** связь с классификацией */
            ENDocAttachment2TKClassificationDAO docAttachment2TKClassificationDao = new ENDocAttachment2TKClassificationDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENDocAttachment2TKClassification docAttachment2TKClassification = new ENDocAttachment2TKClassification();
            docAttachment2TKClassification.docAttachmentRef.code = atmCode;
            docAttachment2TKClassification.classificationTypeRef.code = tkClassificationTypeCode;

            docAttachment2TKClassificationDao.add(docAttachment2TKClassification);

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

} // end of EJB Controller for ENDocAttachment2TKClassification