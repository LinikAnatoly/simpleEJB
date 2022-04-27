
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  import java.rmi.RemoteException;

/**
  * EJB Controller for ENRecordPointProm;
  *
  */



import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.ejb.CreateException;
import javax.naming.NamingException;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.contract.ejb.PersonalAccountController;
import com.ksoe.contract.ejb.PersonalAccountControllerHome;
import com.ksoe.contract.valueobject.PersonalAccount;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENRecordPointPromDAO;
import com.ksoe.energynet.ejb.generated.ENRecordPointPromControllerEJBGen;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.logic.TradeTaxInvoiceLogic;
import com.ksoe.energynet.logic.DepartmentLogic.BillingServerData;
import com.ksoe.energynet.util.BillingEjbCache;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENRecordPointProm;
import com.ksoe.energypro.dataminer.EPRenDAO;
import com.ksoe.energypro.ejb.EPCustomerController;
import com.ksoe.energypro.ejb.EPCustomerControllerHome;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.valueobject.EPCustomer;
import com.ksoe.energypro.valueobject.EPRen;
import com.ksoe.energypro.valueobject.brief.EPRenShort;
import com.ksoe.energypro.valueobject.filter.EPRenFilter;
import com.ksoe.energypro.valueobject.lists.EPRenShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;


public class ENRecordPointPromControllerEJB extends ENRecordPointPromControllerEJBGen
 {

	/*ENRecordPointProm. Изменить*/
	  public void save(ENRecordPointProm object)
	   {
	    try
	     {
	      object.setDomain_info(null);
	      
	      ENElement el = new ENElement();
	      ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      
	      el = elDAO.getObject(object.element.code);
	      
	      if ( el.renRef.code == Integer.MIN_VALUE){
	    	  throw new EnergyproSystemException("Element not bound to EPRen.");
		  }
		  
		  if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  el.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }
		      
		  elDAO.save(el);
	 
	      ENRecordPointPromDAO objectDAO = new ENRecordPointPromDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      objectDAO.save(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENRecordPointProm%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }
	
	
	/*ENRecordPointProm. Добавить*/
	  @Override
	public int add(ENRecordPointProm object)
	   {
	    try
	     {

	      object.setDomain_info(null);

	      ENElement e = new ENElement();
	      e.typeRef.code = ENElementType.TY_PROM;
	      // !!!!!!! Опачки !!!! а тут уже надо знать окуда(обьект АУТ И ИН ..)
	      // + РЭС !!!!!
	      //el.elementInRef.code = object.element.elementInRef.code;
	      //el.renRef.code = object.element.renRef.code;
	      //el.code = elDAO.add(el);

	      //значит только по ИН-элементу !!! а он вааще нужен???
	      // это пошли ХИТРЫЕ елементы ...
 	      ENElementDAO elementDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

 	      if (object.element.renRef != null ){
		    	 if ( object.element.renRef.code != Integer.MIN_VALUE ){
		    		 e.renRef.code = object.element.renRef.code;
		      }
	      }


		      if ( e.renRef.code == Integer.MIN_VALUE){
		    	  throw new EnergyproSystemException("Element not bound to EPRen.");
		      }
	      if (object.element.geoDepartmentRef != null) {
	    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
	    		  e.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
	    	  }
	    	  
	      }

	      e.code = elementDAO.add(e);

	      object.element.code = e.code;

	      ENRecordPointPromDAO objectDAO = new ENRecordPointPromDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.add(object);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENRecordPointProm%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }

  public ENRecordPointPromControllerEJB() {}


	public int[] getNextTaxinvoiceInfo(Date date, String department) {
		int result[] = { Integer.MIN_VALUE, Integer.MIN_VALUE };
		try {
			TradeTaxInvoiceLogic tradeTaxInvoiceLogic = new TradeTaxInvoiceLogic(
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			result = tradeTaxInvoiceLogic.getNextTaxinvoiceInfo(date, department);

		} catch (DatasourceConnectException e) {
			e.printStackTrace();
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}

		return result;
	}


	public void deleteTaxInvoiceInTrade(int tradeTaxIncoiceCode) {
		try {
			TradeTaxInvoiceLogic tradeTaxInvoiceLogic = new TradeTaxInvoiceLogic(
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			tradeTaxInvoiceLogic.deleteTaxInvoiceInTrade(tradeTaxIncoiceCode);

		} catch (DatasourceConnectException e) {
			e.printStackTrace();
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


  public void startTaxInvoiceMonthGeneration(int epRenCode){
	  Connection enConn = null;
	  try {
		  enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		  EPRenDAO epRenDAO = new EPRenDAO(enConn,getUserProfile());
		  EPRenShortList epRenShortList;
		  EPRenFilter epRenFilter = new EPRenFilter();
		  epRenFilter.taxMonthGenerationLock=1;
		  epRenShortList=epRenDAO.getScrollableFilteredList(epRenFilter,0,-1);
		  if (epRenShortList.size()>0){
			  for (int i = 0 ;i<epRenShortList.size();i++){
				  EPRenShort lockedRen = epRenShortList.get(i);
				  throw new EnergyproSystemException("\n"+"\n"+"Для уникнення дублювання податкових накладних в ПК'Трейд' "+"\n"+
						  							"одночасне формування з різних відділень заблоковано"+"\n"+"\n"+
						  							"Дочекайтесь доки завершиться формування податкових в "+lockedRen.name+"\n"+
						  							"Дата початку формування: "+lockedRen.taxMonthGenerationStart);
			  }
		  }

		  lockTaxInvoiceMonthGeneration(epRenCode);

	 } catch (PersistenceException ex){
		 ex.printStackTrace();
		 throw new EnergyproSystemException(ex.getMessage(),ex);
	 } catch (DatasourceConnectException ex){
		 ex.printStackTrace();
		 throw new EnergyproSystemException(ex.getMessage(),ex);
	 } finally {
		try{
			 if(enConn!=null && !enConn.isClosed()){
				 enConn.close();
			 }
	 	} catch (SQLException e) {}
	 }
  }


  public void lockTaxInvoiceMonthGeneration(int epRenCode){
	  Connection enConn = null;
	  try {
		  enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		  EPRenDAO epRenDAO = new EPRenDAO(enConn,getUserProfile());
		  EPRenShortList epRenShortList;
		  EPRenFilter epRenFilter = new EPRenFilter();
		  epRenFilter.code=epRenCode;
		  epRenShortList=epRenDAO.getScrollableFilteredList(epRenFilter,0,1);
		  EPRen epRen = epRenDAO.getObject(epRenShortList.get(0).code);
		  epRen.taxMonthGenerationLock=1;
		  epRen.taxMonthGenerationStart= new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").format(new Date()).toString();
		  epRenDAO.save(epRen);

  	 } catch (PersistenceException ex){
		 ex.printStackTrace();
		 throw new EnergyproSystemException(ex.getMessage(),ex);
	 } catch (DatasourceConnectException ex){
		 ex.printStackTrace();
		 throw new EnergyproSystemException(ex.getMessage(),ex);
	 } finally {
		 try {
			 if(enConn!=null && !enConn.isClosed()){
				 enConn.close();
			 }
		 } catch (SQLException e) {}
	 }
  }

  public void unlockTaxInvoiceMonthGeneration(int epRenCode){
	  	  Connection enConn = null;
	 try {
		  enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		  EPRenDAO epRenDAO = new EPRenDAO(enConn,getUserProfile());
		  EPRenShortList epRenShortList;
		  EPRenFilter epRenFilter = new EPRenFilter();
		  epRenFilter.code=epRenCode;
		  epRenShortList=epRenDAO.getScrollableFilteredList(epRenFilter,0,1);
		  EPRen epRen = epRenDAO.getObject(epRenShortList.get(0).code);
		  epRen.taxMonthGenerationLock=Integer.MIN_VALUE;
		  epRen.taxMonthGenerationEnd = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").format(new Date()).toString();
		  epRenDAO.save(epRen);

	 } catch (PersistenceException ex){
		 ex.printStackTrace();
		 throw new EnergyproSystemException(ex.getMessage(),ex);
	 } catch (DatasourceConnectException ex){
		 ex.printStackTrace();
		 throw new EnergyproSystemException(ex.getMessage(),ex);
	 } finally {
		 try {
			 if(enConn!=null && !enConn.isClosed()){
				 enConn.close();
			 }
	 	   } catch (SQLException e) {}
	 }

  }

	public String getPersonalAccountUidByCode(int code, int departmentCode) {
		
		try {
			DepartmentLogic departmentLogic = new DepartmentLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			BillingServerData serverData = departmentLogic.getServerDataByDepartmentCode(departmentCode);
            if (serverData.billingServerIp == null || serverData.billingServerIp.equals("")) {
            	throw new SystemException("\n \n"
                        + String.format("Помилка при визначенні РЕМ для особового рахунку з кодом %d та підрозділу %d", code, departmentCode));
            }
            EPCustomerControllerHome home = (EPCustomerControllerHome)BillingEjbCache.getHome("ksoe/energypro/EPCustomerController", "com.ksoe.energypro.ejb.EPCustomerControllerHome",
            		serverData.billingServerIp, serverData.billingServerJnpPort);
            EPCustomerController controller = home.create();
    		EPCustomer personalAccount = controller.getObject(code);
    		return (personalAccount == null) ? null : personalAccount.uid;
		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't get personal account uid by code = " + code);
		} catch (NamingException | CreateException | RemoteException  e) {
			throw new SystemException(e);
		}
	}


} // end of EJB Controller for ENRecordPointProm