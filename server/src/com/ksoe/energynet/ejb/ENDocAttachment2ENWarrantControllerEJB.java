
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENDocAttachment2ENWarrant;
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
import com.ksoe.energynet.dataminer.ENDocAttachment2ENWarrantDAO;
import com.ksoe.energynet.ejb.generated.ENDocAttachment2ENWarrantControllerEJBGen;
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachment2ENWarrant;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENDocAttachment2ENWarrantControllerEJB extends
		ENDocAttachment2ENWarrantControllerEJBGen {

	public ENDocAttachment2ENWarrantControllerEJB() {
	}
	
	public int add(ENDocAttachment object, byte[] aFile, String fileName, int warCode) {
		return add(object, aFile, fileName, warCode, Integer.MIN_VALUE);
	}

    

	/* DFDocAttachment. Добавить */
    public int add(ENDocAttachment object, byte[] aFile, String fileName, int warCode, int kindCode) {
        try {


        	int atmCode = Integer.MIN_VALUE;

            Calendar calendar = Calendar.getInstance();
	        String date = String.format("%tY%tm", calendar, calendar);

            String dirToCreate = "EnergyNet/Warrant/" + date + "/" + warCode;
            
            
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


            /** связь с доверенностью */
            ENDocAttachment2ENWarrantDAO da2warDao = new ENDocAttachment2ENWarrantDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENDocAttachment2ENWarrant da2war = new ENDocAttachment2ENWarrant();
            da2war.docAttachmentRef.code = atmCode;
            da2war.warrantRef.code = warCode;

            da2warDao.add(da2war);

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
	

} // end of EJB Controller for ENDocAttachment2ENWarrant