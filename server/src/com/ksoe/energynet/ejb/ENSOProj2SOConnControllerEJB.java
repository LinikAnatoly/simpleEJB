
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENSOProj2SOConn;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENSOProj2SOConnDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENSOProj2SOConnControllerEJBGen;
import com.ksoe.energynet.valueobject.ENSOProj2SOConn;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.filter.ENSOProj2SOConnFilter;
import com.ksoe.energynet.valueobject.lists.ENSOProj2SOConnShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENSOProj2SOConnControllerEJB extends
		ENSOProj2SOConnControllerEJBGen {

	public ENSOProj2SOConnControllerEJB() {
	}
	
	/* ENSOProj2SOConn. Добавить */
	public int add(ENSOProj2SOConn object) {
		try {
			ENSOProj2SOConnDAO objectDAO = new ENSOProj2SOConnDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENServicesObject connObj = new ENServicesObject();
			ENServicesObject projObj = new ENServicesObject();
			
			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENSOProj2SOConnFilter sp2scFilter = new ENSOProj2SOConnFilter();
			sp2scFilter.SOProjRef.code = object.SOProjRef.code;
			ENSOProj2SOConnShortList sp2scList =  objectDAO.getScrollableFilteredList(sp2scFilter, 0, -1);
			for (int i=0;i<sp2scList.totalCount;i++) {
				objectDAO.remove(sp2scList.get(i).code);
			}
			
			connObj = soDAO.getObject(object.SOConnRef.code);
			projObj = soDAO.getObject(object.SOProjRef.code);
			
			projObj.name = connObj.name;
			projObj.contragentName = connObj.contragentName;
			projObj.department.code = connObj.department.code;
			projObj.contragentTypeRef.code = connObj.contragentTypeRef.code;
			projObj.warrantRef.code = connObj.warrantRef.code;
			projObj.regionalType = connObj.regionalType;
			projObj.contragentOkpo = connObj.contragentOkpo;
			projObj.contragentAddress = connObj.contragentAddress;	
			projObj.contragentAddressWork = connObj.contragentAddressWork;			
			projObj.commentGen = "Договір проектування до договору про приєднання №" + connObj.contractNumberServices; 
			soDAO.save(projObj);
			
		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENSOProj2SOConn%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


} // end of EJB Controller for ENSOProj2SOConn