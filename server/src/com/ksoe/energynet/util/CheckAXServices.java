package com.ksoe.energynet.util;

import java.util.TimerTask;
import java.util.logging.Level;

import javax.xml.ws.BindingProvider;

import com.ksoe.mdax.util.WebServicesConsts;
import com.microsoft.schemas.dynamics._2008._01.services.CustomerService;
import com.microsoft.schemas.dynamics._2008._01.services.CustomerService_Service;
import com.microsoft.schemas.dynamics._2008._01.services.InventItemGroupKSService;
import com.microsoft.schemas.dynamics._2008._01.services.InventItemGroupKSService_Service;
import com.microsoft.schemas.dynamics._2008._01.services.RContractTableKSService;
import com.microsoft.schemas.dynamics._2008._01.services.RContractTableKSService_Service;
import com.microsoft.schemas.dynamics._2008._01.services.UnitKSService;
import com.microsoft.schemas.dynamics._2008._01.services.UnitKSService_Service;
import com.microsoft.schemas.dynamics._2008._01.services.VendTableService;
import com.microsoft.schemas.dynamics._2008._01.services.VendTableService_Service;
import com.sun.xml.internal.ws.policy.EffectiveAlternativeSelector;
import com.sun.xml.internal.ws.policy.privateutil.PolicyLogger;

public class CheckAXServices extends TimerTask {

	@Override
	public void run() {
		/* работаем только на указанном серваке */
        String ipAddres = Tools.getInetAddress();

        if (!ipAddres.equals(Tools.ENERGY_NET_SERVER_IP)) return;


        /**
		 *  заглушка вывода предупреждений....
		 *  com.sun.xml.internal.ws.policy.EffectiveAlternativeSelector
		 *  BasicAuthentication was evaluated as "UNKNOWN"
		 *  WARNING: WSP0019
		 *  WARNING: WSP0075
		 */
		PolicyLogger logger = PolicyLogger.getLogger(EffectiveAlternativeSelector.class);
        logger.setLevel(Level.OFF);
        /**  **********************************************  */



        System.out.println("#############  Check AX Services is Start!!!");

    	String usr = WebServicesConsts.userName;
		String pwd = WebServicesConsts.userPass;

		/** Выборка списка договоров */
        RContractTableKSService_Service rContractService = new RContractTableKSService_Service();
        RContractTableKSService rContractProxy = rContractService.getBasicHttpBindingRContractTableKSService();
        ((BindingProvider) rContractProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
        ((BindingProvider) rContractProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

        /** Выборка списка контрагентов */
        CustomerService_Service custService = new CustomerService_Service();
        CustomerService custProxy = custService.getBasicHttpBindingCustomerService();
        ((BindingProvider) custProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
        ((BindingProvider) custProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

        VendTableService_Service vendService = new VendTableService_Service();
        VendTableService vendProxy = vendService.getBasicHttpBindingVendTableService();
        ((BindingProvider) vendProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
        ((BindingProvider) vendProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

        /** единицы измерения */
        UnitKSService_Service unitService = new UnitKSService_Service();
        UnitKSService unitProxy = unitService.getBasicHttpBindingUnitKSService();
        ((BindingProvider) unitProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
        ((BindingProvider) unitProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

        /** группы номенклатур из Axapta */
        InventItemGroupKSService_Service itemGroupService = new InventItemGroupKSService_Service();
		InventItemGroupKSService itemGroupProxy = itemGroupService.getBasicHttpBindingInventItemGroupKSService();
		((BindingProvider) itemGroupProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
		((BindingProvider) itemGroupProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);


        System.out.println("#############  Check AX Services is Done!!!");

	}


}