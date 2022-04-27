
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.dataminer.DFDocAgreementDAO;
import com.ksoe.docflow.logic.DocFlowLogic;
import com.ksoe.docflow.valueobject.DFDocAgreement;
import com.ksoe.docflow.valueobject.filter.DFDocAgreementFilter;
import com.ksoe.energynet.dataminer.ENContractDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2ContractDAO;
import com.ksoe.energynet.ejb.generated.ENContractControllerEJBGen;
import com.ksoe.energynet.valueobject.ENContract;
import com.ksoe.energynet.valueobject.ENContractType;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ContractFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.dataminer.RQPurchaseItemTender2EnContractDAO;
import com.ksoe.rqorder.logic.OrderItemLogic;
import com.ksoe.rqorder.valueobject.RQPurchaseItemTender2EnContract;
import com.ksoe.rqorder.valueobject.filter.RQPurchaseItemTender2EnContractFilter;

public class ENContractControllerEJB extends ENContractControllerEJBGen {

	public ENContractControllerEJB() {
	}


	@Override
	public void remove(int code) {
		try {

			ENContractDAO objectDAO = new ENContractDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQOrgDAO orgDAO = new RQOrgDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENEstimateItem2ContractDAO ei2ctDAO = new ENEstimateItem2ContractDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQPurchaseItemTender2EnContractDAO pItmTnd2CtDAO = new RQPurchaseItemTender2EnContractDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			DFDocAgreementDAO docAgreemDAO = new DFDocAgreementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE));
			DocFlowLogic dfl = new DocFlowLogic(getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE),
					getUserProfile());

			ENContract object = objectDAO.getObject(code);
			// если есть связанные материалы то не даем удалять
			ENEstimateItem2ContractFilter ei2ctFilter = new ENEstimateItem2ContractFilter();
			ei2ctFilter.finDocID = object.finDocID;
			int[] ei2ctArr = ei2ctDAO.getFilteredCodeArray(ei2ctFilter, 0, -1);

			if (ei2ctArr.length > 0) {
				throw new SystemException("\n \n Під договор прив`язані матеріали з планів для виконання робіт !");
			}



			// если удаляем проект договора то удалим его из док флов - с проверкой что б был черновой
			if (object.contractType.code == ENContractType.CONTRACT_PROJECT) {
				DFDocAgreementFilter docAgreemFil = new DFDocAgreementFilter();
				docAgreemFil.conditionSQL = " dfdocagreement.code in ( select d2a.agreerefcode from docflow.dfspecification2agree d2a where d2a.encontractcode = "
						+ code /* encontractcode */ + "  ) ";

				// DFDocAgreementShortList docAgreemList = docAgreemDAO.getScrollableFilteredList(docAgreemFil, 0, -1);
				int[] docAgreemArr = docAgreemDAO.getFilteredCodeArray(docAgreemFil, 0, -1);
				for (int i = 0; i < docAgreemArr.length; i++) {
					DFDocAgreement docAgreemObj = docAgreemDAO.getObject(docAgreemArr[i]);

					if (docAgreemObj.doc.code != Integer.MIN_VALUE) {
						dfl.removeDoc(docAgreemObj.doc.code, true/* boolean isFromNet*/);
					}
				}
			}

			// удалить связку договора со строкой публикации rqpurchstmtndr2ncntrct
			RQPurchaseItemTender2EnContractFilter pItmTnd2CtFilter = new RQPurchaseItemTender2EnContractFilter();
			pItmTnd2CtFilter.contractRef.code = code;
			int[] pItmTnd2CtArr = pItmTnd2CtDAO.getFilteredCodeArray(pItmTnd2CtFilter, 0, -1);
			for (int j = 0; j < pItmTnd2CtArr.length; j++) {
				pItmTnd2CtDAO.remove(pItmTnd2CtArr[j]);
			}

			objectDAO.remove(code);

			orgDAO.remove(object.org.code);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENContract%} object.", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



	/* ENContract. Добавить */
	@Override
	public int add(ENContract object) {
		try {
			OrderItemLogic itemLogic = new OrderItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENContractDAO objectDAO = new ENContractDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQPurchaseItemTender2EnContractDAO pi2contractDAO = new RQPurchaseItemTender2EnContractDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			int encontract = Integer.MIN_VALUE;
		    int purchaseItemTenderCode = object.purchaseItemTender.code;  // добавление договора должно быть связано со строкой плана закупки

	       	/* if (purchaseItemTenderCode == Integer.MIN_VALUE ){
	    	   		throw new SystemException("\n \n NET-4344 Немає прив`язки до строки плана закупівель !");
	       	}*/

			if (object.code == Integer.MIN_VALUE) {
				object.org.code = itemLogic.copyOrg(object.org);
				object.purchaseItemTender.code = Integer.MIN_VALUE; // сбросим код тендерной строки - на договоре он не нужен
				encontract = objectDAO.add(object);
			}


   	   		// связь договора со строкой  purchaseItemTender
			if (purchaseItemTenderCode != Integer.MIN_VALUE) {
				RQPurchaseItemTender2EnContract pi2contractObj = new RQPurchaseItemTender2EnContract();
				pi2contractObj.contractRef.code = encontract;
				pi2contractObj.purchaseItemTenderRef.code = purchaseItemTenderCode;
				pi2contractObj.userGen = getUserProfile().userName;
				pi2contractDAO.add(pi2contractObj);
			}

			return encontract;
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENContract%} object.", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


} // end of EJB Controller for ENContract