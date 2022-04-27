
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENTransportRealRepair;
 *
 */

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENTransportRealRepairDAO;
import com.ksoe.energynet.ejb.generated.ENTransportRealRepairControllerEJBGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENTransportRealRepair;
import com.ksoe.energynet.valueobject.filter.ENTransportRealRepairFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRealRepairShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENTransportRealRepairControllerEJB extends
		ENTransportRealRepairControllerEJBGen {
	


	public ENTransportRealRepairControllerEJB() {
	}
	
	/* ENTransportRealRepair. Изменить */
	public void save(ENTransportRealRepair object) {
		try {
			ENTransportRealRepairDAO objectDAO = new ENTransportRealRepairDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        
	        ENTransportRealRepairFilter rrFil = new ENTransportRealRepairFilter();
	        rrFil.realTransport.code = object.realTransport.code;
	        rrFil.conditionSQL = " ENTRANSPORTREALREPAIR.CODE IN (select rr.code from entransportrealrepair rr where rr.code <> " + object.code + ")";
	        
	        int[] rrArr = getScrollableFilteredCodeArray(rrFil, 0, -1);
	        for (int i = 0; i < rrArr.length; i++) {
				ENTransportRealRepair rrObj = objectDAO.getObject(rrArr[i]);
				if( rrObj.dateStart == null ||  rrObj.dateFinal == null ){
					throw new SystemException(
							"По транспорту є незакриті попередні періоди!!!");	
				}
			}
	        
	        ENTransportRealRepairFilter rrFil2 = new ENTransportRealRepairFilter();
	        rrFil2.realTransport.code = object.realTransport.code;
	        rrFil2.conditionSQL = " code <>  " + object.code ;
	        ENTransportRealRepairShortList rrList = objectDAO.getScrollableFilteredList(rrFil2, 0, -1);
	        
	        for (int i = 0; i < rrList.totalCount; i++) {
			  if ( object.dateStart.compareTo(rrList.get(i).dateStart) >=0 && object.dateStart.compareTo(rrList.get(i).dateFinal)<=0 ){
				   throw new SystemException( " На дату " + new SimpleDateFormat("dd.MM.yyyy").format(object.dateStart) +" транспорт вже знаходиться  ремонті !!!");
			  }	
			  if ( object.dateFinal.compareTo(rrList.get(i).dateStart) >=0 && object.dateFinal.compareTo(rrList.get(i).dateFinal)<=0 ){
				   throw new SystemException( " На дату " + new SimpleDateFormat("dd.MM.yyyy").format(object.dateFinal) +" транспорт вже знаходиться  ремонті !!!");
			  }
			}

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENTransportRealRepair%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	 private Date makeDate3000() {
	    	Calendar c = Calendar.getInstance();
	    	c.set(Calendar.YEAR, 3000);
	    	c.set(Calendar.MONTH, Calendar.JANUARY);
	    	c.set(Calendar.DATE, 1);
	    	return Tools.clearTimeOfDate(c.getTime());
	    }
	
	/* ENTransportRealRepair. Добавить */
	public int add(ENTransportRealRepair object) {
		try {
			ENTransportRealRepairDAO objectDAO = new ENTransportRealRepairDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        
	        if(object.dateStart == null ){
	        	throw new SystemException("Не вказана дата початку ремонту !!!");
	        }
	        
	        if(object.dateFinal == null ){
	        	object.dateFinal =makeDate3000();
	        }
	        ENTransportRealRepairFilter rrFil = new ENTransportRealRepairFilter();
	        rrFil.realTransport.code = object.realTransport.code;
	        ENTransportRealRepairShortList rrList = objectDAO.getScrollableFilteredList(rrFil, 0, -1);
	        
	        for (int i = 0; i < rrList.totalCount; i++) {
			  if ( object.dateStart.compareTo(rrList.get(i).dateStart) >=0 && object.dateStart.compareTo(rrList.get(i).dateFinal)<=0 ){
				   throw new SystemException( " На дату " + new SimpleDateFormat("dd.MM.yyyy").format(object.dateStart) +" транспорт вже знаходиться  ремонті !!!");
			  }	
			  if ( object.dateFinal.compareTo(rrList.get(i).dateStart) >=0 && object.dateFinal.compareTo(rrList.get(i).dateFinal)<=0 ){
				   throw new SystemException( " На дату " + new SimpleDateFormat("dd.MM.yyyy").format(object.dateFinal) +" транспорт вже знаходиться  ремонті !!!");
			  }
			}
	        

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENTransportRealRepair%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENTransportRealRepair