
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENSORentItems;
 *
 */

import java.sql.Connection;
import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.callcenter.dataminer.CCJointLineContragentsDAO;
import com.ksoe.callcenter.dataminer.CCTower2JLCDAO;
import com.ksoe.callcenter.valueobject.CCTower2JLC;
import com.ksoe.callcenter.valueobject.filter.CCJointLineContragentsFilter;
import com.ksoe.callcenter.valueobject.filter.CCTower2JLCFilter;
import com.ksoe.callcenter.valueobject.lists.CCJointLineContragentsShortList;
import com.ksoe.callcenter.valueobject.lists.CCTower2JLCShortList;
import com.ksoe.callcenter.valueobject.brief.CCTower2JLCShort;
import com.ksoe.energynet.dataminer.ENSORentItemsDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENSORentItemsControllerEJBGen;
import com.ksoe.energynet.valueobject.ENSORentItems;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.brief.ENSORentItemsShort;
import com.ksoe.energynet.valueobject.filter.ENSORentItemsFilter;
import com.ksoe.energynet.valueobject.lists.ENSORentItemsShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class ENSORentItemsControllerEJB extends
		ENSORentItemsControllerEJBGen {

	public ENSORentItemsControllerEJB() {
	}
	
	public void insertContractToLeaseAgreementAndCallCenter(int fromCodeServicesObject, int toCodeServicesObject){
		try {
			ENSORentItemsDAO enSORentItemsDAO = new ENSORentItemsDAO(getUserProfile(),
			getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENServicesObjectDAO enServicesObjectDAO = new ENServicesObjectDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			Connection connection = getConnection(AuthorizationJNDINames.CALLCENTER_DATASOURCE);
			UserProfile userProfile = getUserProfile();		
			
			//Связка контрагентов совмесного подвеса и опоры
			CCTower2JLCDAO ccTower2JLCDAO = new CCTower2JLCDAO(userProfile, connection);			
			//Контрагенти сумісного підвісу
			CCJointLineContragentsDAO ccJointLineContragentsDAO = new CCJointLineContragentsDAO(userProfile, connection);
			
			//Договор который надо добавить
			ENServicesObject enServicesObjectFrom = enServicesObjectDAO.getObject(fromCodeServicesObject);
			//Договор к которому надо добавить 
			ENServicesObject enServicesObjectTo = enServicesObjectDAO.getObject(toCodeServicesObject);
			
			if (enServicesObjectFrom == null)
				throw new SystemException("Договору за такими кодом ("+fromCodeServicesObject+") не існує");
						
			if (enServicesObjectTo == null)
				throw new SystemException("Договору за такими кодом ("+toCodeServicesObject+") не існує");

			/*--------------------------------------------Insert to EN------------------------------------------------------------------*/
			
			ENSORentItemsFilter enSORentItemsFilterFrom = new ENSORentItemsFilter();
			enSORentItemsFilterFrom.servicesObjectRef.code = enServicesObjectFrom.code;		
			//Выбираем только тех которых нет у enServicesObjectTo.code
			enSORentItemsFilterFrom.conditionSQL = " ENSORENTITEMS.streetcode not in ( "+
												"   select sori.streetcode from net.ENSORentItems sori"+
												"	where "+
												"	sori.servicesobjectrefcode = "+enServicesObjectTo.code +")";
												/*"	and sori.rencode = ENSORENTITEMS.rencode )";		*/
					
			//Получить список ENSORentItems который будем добовлять к договору toCodeServicesObject
			ENSORentItemsShortList enSORentItemsShortListsFrom = enSORentItemsDAO.getScrollableFilteredList(enSORentItemsFilterFrom, 0 ,-1);
					
			for(int i=0; i<enSORentItemsShortListsFrom.size(); i++){				
				ENSORentItems enSORentItems = new ENSORentItems();
				
				enSORentItems.localityName = enSORentItemsShortListsFrom.get(i).localityName;
				enSORentItems.address = enSORentItemsShortListsFrom.get(i).address;
				enSORentItems.streetCode = enSORentItemsShortListsFrom.get(i).streetCode;
				enSORentItems.renCode = enSORentItemsShortListsFrom.get(i).renCode;
				enSORentItems.userGen = getUserProfile().userName;
				//enSORentItems.dateEdit = enSORentItemsShortListsFrom.get(i).dateEdit;	
				enSORentItems.dateEdit = new Date();
				enSORentItems.servicesObjectRef.code = toCodeServicesObject;
				
				enSORentItemsDAO.add(enSORentItems);
			}
			
			/*--------------------------------------------Insert to CallCenter------------------------------------------------------------------*/
			CCJointLineContragentsFilter ccJointLineContragentsFilterFrom = new CCJointLineContragentsFilter();
			ccJointLineContragentsFilterFrom.partnerCode = enServicesObjectFrom.partnerCode;
			//Получаем (контрагент сумісного підвісу)
			CCJointLineContragentsShortList ccJointLineContragentsShortListFrom = ccJointLineContragentsDAO
					.getScrollableFilteredList(ccJointLineContragentsFilterFrom,0,-1);

			CCJointLineContragentsFilter ccJointLineContragentsFilterTo = new CCJointLineContragentsFilter();
			ccJointLineContragentsFilterTo.partnerCode = enServicesObjectTo.partnerCode;			
			//Получаем (контрагент сумісного підвісу) который надо добавить в CCTower2JLC
			CCJointLineContragentsShortList ccJointLineContragentsShortListTo = ccJointLineContragentsDAO
																			.getScrollableFilteredList(ccJointLineContragentsFilterTo,0,-1);

			if(ccJointLineContragentsShortListFrom.size() == 0)
				throw new SystemException("Такий код контрагента ("+enServicesObjectFrom.partnerCode+") не існує");

			if(ccJointLineContragentsShortListTo.size() == 0)
				throw new SystemException("Такий код контрагента ("+enServicesObjectTo.partnerCode+") не існує");
			
			CCTower2JLCFilter ccTower2JLCFilterFrom = new CCTower2JLCFilter(); 
			ccTower2JLCFilterFrom.contractNumberServices = enServicesObjectFrom.contractNumberServices;
			ccTower2JLCFilterFrom.jlcRef.code = ccJointLineContragentsShortListFrom.get(0).code;

			ccTower2JLCFilterFrom.conditionSQL =    " CCTOWER2JLC.TOWERREFCODE not in (select cc1.towerrefcode from cctower2jlc cc1"+
													"		where "+
												    " 			 cc1.jlcrefcode = " + ccJointLineContragentsShortListTo.get(0).code + ") ";

			//Получаем список контрагентов совмесного подвеса и опоры, и по этим опорам будем добовлять новый договор
			CCTower2JLCShortList ccTower2JLCShortListFrom = ccTower2JLCDAO.getScrollableFilteredList(ccTower2JLCFilterFrom,0,-1);

			for(int i=0; i<ccTower2JLCShortListFrom.size(); i++){

				CCTower2JLC ccTower2JLC = new CCTower2JLC();

				ccTower2JLC.contractNumberServices = enServicesObjectTo.contractNumberServices;
				ccTower2JLC.isRealized = 0; //Не реализовано
				ccTower2JLC.res = ccTower2JLCShortListFrom.get(i).res;
				ccTower2JLC.towerRef.code = ccTower2JLCShortListFrom.get(i).towerRefCode;
				ccTower2JLC.jlcRef.code = ccJointLineContragentsShortListTo.get(0).code;

				ccTower2JLCDAO.add(ccTower2JLC);
			}
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENSORentItems%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
		
	}

} // end of EJB Controller for ENSORentItems