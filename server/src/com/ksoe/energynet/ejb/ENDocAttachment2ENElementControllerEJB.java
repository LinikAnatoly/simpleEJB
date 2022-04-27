
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENDocAttachment2ENElement;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDocAttachment2ENElementDAO;
import com.ksoe.energynet.ejb.generated.ENDocAttachment2ENElementControllerEJBGen;
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachment2ENElement;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.rmi.RemoteException;
import java.util.Calendar;

public class ENDocAttachment2ENElementControllerEJB extends
		ENDocAttachment2ENElementControllerEJBGen {

	public ENDocAttachment2ENElementControllerEJB() {
	}

	public int add(ENDocAttachment object, byte[] aFile, String fileName, int elementCode) {
		if (elementCode == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nНе задано код елемента мережі!");
		}

		try {
			int atmCode = Integer.MIN_VALUE;

			Calendar calendar = Calendar.getInstance();
			String date = String.format("%tY%tm", calendar, calendar);

			String dirToCreate = "EnergyNet/Element/" + date + "/" + elementCode;

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

			/** связь с элементом сети */
			ENDocAttachment2ENElementDAO docAttachment2ENElementDAO = new ENDocAttachment2ENElementDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENDocAttachment2ENElement docAttachment2ENElement = new ENDocAttachment2ENElement();
			docAttachment2ENElement.docAttachmentRef.code = atmCode;
			docAttachment2ENElement.elementRef.code = elementCode;

			docAttachment2ENElementDAO.add(docAttachment2ENElement);

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

} // end of EJB Controller for ENDocAttachment2ENElement