
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for FINContracts;
  *
  */



import javax.xml.ws.BindingProvider;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.FINContractsDAO;
import com.ksoe.energynet.ejb.generated.FINContractsControllerEJBGen;
import com.ksoe.energynet.valueobject.FINContracts;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.mdax.services.paymtermksservice.PaymTermFinder;
import com.ksoe.mdax.services.vendpaymmodetableksservice.VendPaymModeTableFinder;
import com.ksoe.mdax.util.WebServicesConsts;
import com.ksoe.mdax.valueobject.lists.AXPaymTermShortList;
import com.ksoe.mdax.valueobject.lists.AXVendPaymModeShortList;
import com.ksoe.rqorder.logic.OrderItemLogic;
import com.microsoft.schemas.dynamics._2008._01.services.PaymTermKSService;
import com.microsoft.schemas.dynamics._2008._01.services.PaymTermKSService_Service;
import com.microsoft.schemas.dynamics._2008._01.services.VendPaymModeTableKSService;
import com.microsoft.schemas.dynamics._2008._01.services.VendPaymModeTableKSService_Service;

public class FINContractsControllerEJB extends FINContractsControllerEJBGen
 {

  public FINContractsControllerEJB() {}

  @Override
public int add(FINContracts object)
  {
   try
    {
       	FINContractsDAO objectDAO = new FINContractsDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
       	OrderItemLogic itemLogic = new OrderItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

		if (object.org != null)
		{
			object.org.code = Integer.MIN_VALUE;
			object.org.code = itemLogic.copyOrg(object.org);
		}
		else
		{
			throw new EnergyproSystemException("Не знайдено даних про постачальника!");
		}

		return objectDAO.add(object);
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.FINContracts%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
  }

  /*FINContracts. Получить объект из ФК по id*/
  public FINContracts getObjectFromFK(int id)
  {
	  try
	  {
		  FINContractsDAO objectDAO = new FINContractsDAO(getUserProfile(), getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));
		  FINContracts finContract = objectDAO.getObjectFromFK(id);
		  
		  ///// Вытягиваем поля из AX
		  // Способ оплаты
		  if (finContract.summ_note != null && ! finContract.summ_note.equals("")) {
			  VendPaymModeTableKSService_Service vendPaymModeTableService = new VendPaymModeTableKSService_Service();
			  VendPaymModeTableKSService vendPaymModeTableProxy = vendPaymModeTableService.getBasicHttpBindingVendPaymModeTableKSService();
			  ((BindingProvider) vendPaymModeTableProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, WebServicesConsts.userName);
			  ((BindingProvider) vendPaymModeTableProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, WebServicesConsts.userPass);
	
			  VendPaymModeTableFinder vendPaymModeFinder = new VendPaymModeTableFinder(vendPaymModeTableProxy);
			  vendPaymModeFinder.parmCriteriaName(finContract.summ_note);
			  
			  AXVendPaymModeShortList vendPaymModeList = vendPaymModeFinder.getAXVendPaymModeList();
	
			  if (vendPaymModeList.list.size() > 0) {
				  finContract.axVendPaymMode = vendPaymModeList.list.get(0).id; 
			  }	
		  }
		  
		  // Условие оплаты
		  if (finContract.pay_after_event != null && ! finContract.pay_after_event.equals("")) {
			  PaymTermKSService_Service paymTermService = new PaymTermKSService_Service();
			  PaymTermKSService paymTermProxy = paymTermService.getBasicHttpBindingPaymTermKSService();
			  ((BindingProvider) paymTermProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, WebServicesConsts.userName);
			  ((BindingProvider) paymTermProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, WebServicesConsts.userPass);
	
			  PaymTermFinder paymTermFinder = new PaymTermFinder(paymTermProxy);
			  paymTermFinder.parmCriteriaDescription(finContract.pay_after_event);
				
			  AXPaymTermShortList paymTermList = paymTermFinder.getAXPaymTermList();
			  
			  if (paymTermList.list.size() > 0) {
				  finContract.axPaymTerm = paymTermList.list.get(0).id; 
			  }		  
		  }
		  /////
		  
		  return finContract;
	  }
	  catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...",e);}
	  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	  finally                              {closeConnection();}
  }  
  
} // end of EJB Controller for FINContracts