
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENPayment2SO;
 *
 */

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.util.Date;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENCalcTotalCostDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENMOL2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPayment2SODAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENServicesFactCalcDAO;
import com.ksoe.energynet.dataminer.ENServicesObject2ProvDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.ejb.generated.ENPayment2SOControllerEJBGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENMOL2PlanWork;
import com.ksoe.energynet.valueobject.ENPayment2SO;
import com.ksoe.energynet.valueobject.ENPayment2SOType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENServicesContractKind;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesFactCalc;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObject2Prov;
import com.ksoe.energynet.valueobject.ENServicesObjectCalcType;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.filter.*;
import com.ksoe.energynet.valueobject.lists.ENCalcTotalCostShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENMOL2PlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.rqorder.dataminer.RQOrderDAO;
import com.ksoe.rqorder.dataminer.RQOrderItem2ENEstimateItemDAO;
import com.ksoe.rqorder.dataminer.RQOrderItemDAO;
import com.ksoe.rqorder.ejb.RQOrderController;
import com.ksoe.rqorder.ejb.RQOrderControllerHome;
import com.ksoe.rqorder.ejb.RQOrderItemController;
import com.ksoe.rqorder.ejb.RQOrderItemControllerHome;
import com.ksoe.rqorder.valueobject.RQOrder;
import com.ksoe.rqorder.valueobject.RQOrderStatus;
import com.ksoe.rqorder.valueobject.filter.RQOrderItem2ENEstimateItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQOrderItemFilter;
import com.ksoe.rqorder.valueobject.lists.RQOrderItem2ENEstimateItemShortList;
import com.ksoe.rqorder.valueobject.lists.RQOrderItemShortList;
import com.ksoe.techcard.dataminer.TKElement2TechCardDAO;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.valueobject.TKMaterials;
import com.ksoe.techcard.valueobject.filter.TKElement2TechCardFilter;
import com.ksoe.techcard.valueobject.lists.TKElement2TechCardShortList;

public class ENPayment2SOControllerEJB extends
        ENPayment2SOControllerEJBGen {

    public ENPayment2SOControllerEJB() {
    }

    /* ENPayment2SO. �������� */
    @Override
	public int add(ENPayment2SO object)  {
        try {
            ENPayment2SODAO objectDAO = new ENPayment2SODAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENServicesObject2ProvDAO so2provDAO = new ENServicesObject2ProvDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


            if (object.dateGen == null) {
                object.dateGen = new Date();
            }

            object.dateEdit = new Date();
            object.userGen = getUserProfile().userName;


            ENServicesObject serviceobj = servicesObjectDAO.getObject(object.servicesObjectRef.code);

			if (!object.userGen.equals("energynet")) {

				if (serviceobj.contractStatusRef.code == ENServicesContractStatus.GOOD
						|| serviceobj.contractStatusRef.code == ENServicesContractStatus.CANCELED
						|| serviceobj.contractStatusRef.code == ENServicesContractStatus.BUDGETAPPROVED) {
					throw new EnergyproSystemException("\n "
							+ "���������� ������� ������, ���� ������ �� ������ \"��������\" ��� \"�������� ������������\"!!!");
				}

				// �������� ���� �������� ���������� �� ��������
				if (object.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT) {

					if (serviceobj.contractStatusRef.code == ENServicesContractStatus.PAID
							|| serviceobj.contractStatusRef.code == ENServicesContractStatus.COMPLETED
							|| serviceobj.contractStatusRef.code == ENServicesContractStatus.CLOSED
							|| serviceobj.contractStatusRef.code == ENServicesContractStatus.PREPAID) {
						throw new EnergyproSystemException("\n SUPP-4100...\n \n "
								+ "���������� ������� �����������, ������� ��������� ��� ������ �������, ��� ��������, ��� ���� ��������� ������ !!!");
					}
				}
			}


			/** ������ ��������� ������ �� ��������, ��������� � �����, ������� ���� ������� �� ��������� 15-�� �������� ����� ������... */
			if (serviceobj.contractStatusRef.code == ENServicesContractStatus.TERMINATED
					&& serviceobj.createdFromSite == ENConsts.CREATED_FROM_SITE_YES) {
				throw new EnergyproSystemException("\n\n "
						+ "���������� ������� ������ �� ���������� ������, ��������� � �����!");
			}
			
			/** SUPP-77213 ����������  �������� ����� �� ��������� ��������  */
			if (serviceobj.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY ) {
				throw new EnergyproSystemException("\n\n "
						+ "���������� �������� ����� �� ��������� ��������!!!");
			}

			/** 19.10.2015 +++ ������� ������ ���� ������.... */
			/** NET-4508... 26.10.2015 +++ ��� �������� ������ �� ���������� �������, �������� ������ �� "��������"... */
			if (serviceobj.contractStatusRef.code == ENServicesContractStatus.TERMINATED) {

				/** 29.08.2017 +++ ��� ����� ������� ������ ���� ������ � ����� ������� ����.... */
				if (serviceobj.finDocID == Integer.MIN_VALUE) {
					throw new EnergyproSystemException("\n\n "
							+ "�� ���������� �������� ������ �� ������, ���� �� ���� ��������!\n"
							+ "�������� �������� �������.");

				} else {
					serviceobj.contractStatusRef.code = ENServicesContractStatus.SIGNED;

					int soCode = serviceobj.code;
					servicesObjectDAO.save(serviceobj);

					serviceobj = null;
					serviceobj = servicesObjectDAO.getObject(soCode);
				}

			} else {
				if (serviceobj.contractStatusRef.code == ENServicesContractStatus.CANCELED
						/** SUPP-72553.... 14.05.2018... || serviceobj.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES */
						|| serviceobj.contractStatusRef.code == ENServicesContractStatus.CLOSED) {

					throw new EnergyproSystemException("\n\n "
							+ "������ ����������� � ������������ ������!!!");
				}
			}



			int payment2SoCode = objectDAO.add(object);


			/**  SUPP-72553.... 14.05.2018...
			 *   ���� ������� ��������� � ������� "����� ��������� �� ������", �������� ������ ��� ���������� ������...
			 */
			if (serviceobj.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES) {
				return payment2SoCode;
			}

			ENServicesObject2ProvFilter so2provFilter = new ENServicesObject2ProvFilter();
			so2provFilter.servicesObjectRef.code = object.servicesObjectRef.code;
			int so2provArr[] = so2provDAO.getFilteredCodeArray(so2provFilter, 0, -1);

			// ����� �� ��������� ���� ������
			ENServicesFactCalcDAO factCalcDAO = new ENServicesFactCalcDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServicesFactCalcFilter factCalcFilter = new ENServicesFactCalcFilter();
			factCalcFilter.servicesObjectRef.code = object.servicesObjectRef.code;

			BigDecimal totalSum = new BigDecimal(0); // ����� � ��� � ��������� ����
			int factCalcArr[] = factCalcDAO.getFilteredCodeArray(factCalcFilter, 0, -1);

			for (int i = 0; i < factCalcArr.length; i++) {
				ENServicesFactCalc factCalcObj = factCalcDAO.getObject(factCalcArr[i]);
				if (factCalcObj.totalSum != null) {
					totalSum = totalSum.add(factCalcObj.totalSum);
				}
			}

			// ����� ����������� ����� �� �������� (���������� + ��������� ������������� - �������� ) ������
			ENPayment2SODAO paymentDAO = new ENPayment2SODAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPayment2SOFilter paymentFilter = new ENPayment2SOFilter();
			paymentFilter.servicesObjectRef.code = object.servicesObjectRef.code;

			BigDecimal totalSumPay = new BigDecimal(0); // ����� � ��� �� ����������� ����������� ������� ��������� �������
			int paymentArr[] = paymentDAO.getFilteredCodeArray(paymentFilter, 0, -1);
			for (int i = 0; i < paymentArr.length; i++) {
				ENPayment2SO paymentObj = paymentDAO.getObject(paymentArr[i]);
				// ���������� � ��������� ������������ ������� , �������� ����� �������
				if (paymentObj.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT
						|| paymentObj.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_REPAYMENT) {
					totalSumPay = totalSumPay.add(paymentObj.sumTotal);
				} else if (paymentObj.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_RETURN_PAY) {
					totalSumPay = totalSumPay.subtract(paymentObj.sumTotal);
				}
			}



        // ��������� ������� � ������ "��������" ���� ����� ���������(� ���) = ����� �� ��������� ����(� ���) � �������� ����������
        // ��� ( ������� ����������� � �������� �����)
        // ��� ( ���������� �� ����� � �������� �����)
        if (
                (so2provArr.length >0 &&
                        serviceobj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT &&
                totalSum.doubleValue() > 0 && // ����� �������� ������ 0
                totalSum.doubleValue() == totalSumPay.doubleValue() ) // ����� � ��������� ���� ����� ��� ���������� ����������
                || (serviceobj.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY && serviceobj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT )  // ����������� �������
                || (serviceobj.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES && serviceobj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) // �������� ��������� �� ����� (
                )
        {
            // �������� ������� ������ �������� (���� ����������� �������� ������ "��������")
            serviceobj.prevContractStatus = serviceobj.contractStatusRef.code;
            serviceobj.contractStatusRef.code = ENServicesContractStatus.CLOSED;
            servicesObjectDAO.save(serviceobj);
        }


        // ��� ������
        if (object.soBillRef.code != Integer.MIN_VALUE &&
        		serviceobj.contractTypeRef.code == ENServicesContractType.OKSN &&
        		serviceobj.contractKindRef.code == ENServicesContractKind.OKSN_WORK) {

            String strCodes = "";
        	// ������ �������� ����, �� �������� ����� ����������� ������
        	int planCode = Integer.MIN_VALUE;
        	ENPlanWorkDAO pwDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
        	ENPlanWorkFilter pwFilter = new ENPlanWorkFilter();
        	pwFilter.elementRef.code = serviceobj.element.code;
        	pwFilter.kind.code = ENPlanWorkKind.CURRENT;
        	ENPlanWorkShortList pwList = pwDAO.getScrollableFilteredList(pwFilter, 0, -1);
        	if (pwList.totalCount != 1) {
        		throw new SystemException("������ � ����������� ��������� ����� �����!");
        	}
        	else {
        		planCode = pwList.get(0).code;
        		ENPlanWork plan = pwDAO.getObject(planCode);
        	    plan.budgetRef.code = ENConsts.ENBUDGET_SRS;
        	    plan.responsibilityRef.code = ENConsts.ENRESPONSIBILITY_SRS;
        	    pwDAO.save(plan);


        	    ENMOL2PlanWorkDAO m2pDAO = new ENMOL2PlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
				ENMOL2PlanWorkFilter m2pFilter = new ENMOL2PlanWorkFilter();
        	    m2pFilter.planRef.code = planCode;
				ENMOL2PlanWorkShortList m2pList = m2pDAO.getScrollableFilteredList(m2pFilter,0,1);

        	    if (m2pList.totalCount == 0) {
        	    	ENMOL2PlanWork m2p = new ENMOL2PlanWork();
					m2p.molCode = "0000";
					m2p.molName = "��������� ��� EnergyNET";
					m2p.planRef.code = planCode;
					m2pDAO.add(m2p);
				}

        	}

        	BigDecimal workCount4Payment = new BigDecimal(0.0);
        	int singleCalculationPlanCode = Integer.MIN_VALUE;
        	pwFilter.kind.code = ENPlanWorkKind.CALCULATION_SINGLE;
        	pwList = pwDAO.getScrollableFilteredList(pwFilter, 0, -1);
        	if (pwList.totalCount != 1) {
        		throw new SystemException("������ � ����������� ����� � ��������� ������������");
        	}
        	else {
        		// ������ ���� � ��������� ������������
        		singleCalculationPlanCode = pwList.get(0).code;
        		ENCalcTotalCostDAO ctcDAO = new ENCalcTotalCostDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
        		ENCalcTotalCostFilter ctcFilter = new ENCalcTotalCostFilter();
        		ctcFilter.planRef.code = singleCalculationPlanCode;
        		ENCalcTotalCostShortList ctcList = ctcDAO.getScrollableFilteredList(ctcFilter, 0, -1);
        		// ������ ������������ ��������� ���������� ��� ����� �����������
        		BigDecimal materialCost = new BigDecimal(0.0);
        		materialCost = (ctcList.get(0).materialExpenses.multiply(new BigDecimal(1.2))).setScale(2, RoundingMode.HALF_UP);
        		// ������ ���������� ����� �� ������� ������� ������
                workCount4Payment = object.sumTotal.divide(materialCost, 0, RoundingMode.DOWN);

        	}

        	// ������� ��������������� ���������
        	ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
        	ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
        	eiFilter.planRef.code = planCode;
        	eiFilter.kindRef.code = ENEstimateItemKind.MATERIALS;
        	eiFilter.statusRef.code = ENEstimateItemStatus.PLANNED;
        	ENEstimateItemShortList eiList = eiDAO.getScrollableFilteredList(eiFilter, 0, -1);

        	for (int z=0;z<eiList.totalCount;z++){
        		// ������ ��� ������� ��������� ����������� ���-�� �� ��������
        		ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        		ENPlanWorkItem pwi = pwiDAO.getObject(eiList.get(z).planItemRefCode);
        		TKMaterialsDAO matDAO = new TKMaterialsDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        		TKMaterials mat = matDAO.getObject(eiList.get(z).materialRefCode);
        		TKElement2TechCardDAO e2tDAO = new  TKElement2TechCardDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        		TKElement2TechCardFilter e2tFilter = new TKElement2TechCardFilter();
        		e2tFilter.techKart.code = pwi.kartaRef.code;
        		e2tFilter.element.code = mat.element.code;
        		TKElement2TechCardShortList e2tList = e2tDAO.getScrollableFilteredList(e2tFilter, 0, -1);
        		BigDecimal materialNormCount = e2tList.get(0).kolvo;

        		BigDecimal neededQuantity = materialNormCount.multiply(workCount4Payment);

        		// �������� ����� EstimateItem � �����������, ������� ����� � ������
        		ENEstimateItem newEst = new ENEstimateItem();
        		newEst.accountingTypeRef.code = eiList.get(z).accountingTypeRefCode;
        		newEst.commentGen = "����������� ��� ������ �� ������ " + payment2SoCode + " � �������: " + object.sumTotal;
        		newEst.cost = (neededQuantity.multiply(mat.cost)).setScale(2,RoundingMode.HALF_UP);
        		newEst.countFact = neededQuantity;
        		newEst.countGen = neededQuantity;
        		newEst.dateEdit = new Date();
        		newEst.deliveryTime = eiList.get(z).deliveryTime;
        		newEst.isUseVAT = eiList.get(z).isUseVAT;
        		newEst.kindRef.code = eiList.get(z).kindRefCode;
        		newEst.materialRef.code = eiList.get(z).materialRefCode;
        		newEst.modify_time = 0L;
        		newEst.oldStatusRef.code = Integer.MIN_VALUE;
        		newEst.planItemRef.code = eiList.get(z).planItemRefCode;
        		newEst.planRef.code = eiList.get(z).planRefCode;
        		newEst.price = eiList.get(z).price;
        		newEst.statusRef.code = eiList.get(z).statusRefCode;
        		newEst.typeRef.code = eiList.get(z).typeRefCode;
        		newEst.userGen = getUserProfile().userName;
        		newEst.useWorkTime = eiList.get(z).useWorkTime;

        		if (strCodes.length() == 0) {
        		strCodes = "" + eiDAO.add(newEst);}
        		else
        			strCodes = strCodes + ", " + eiDAO.add(newEst);
        		//
        		ENEstimateItem oldEst = eiDAO.getObject(eiList.get(z).code);
        		oldEst.countFact = oldEst.countFact.subtract(neededQuantity);
        		oldEst.cost = (oldEst.countFact.multiply(mat.cost)).setScale(2, RoundingMode.HALF_UP);
        		eiDAO.save(oldEst);

        	}

        	Context context = new InitialContext();
            Object orderRef = context.lookup(RQOrderController.JNDI_NAME);
            RQOrderControllerHome orderHome = (RQOrderControllerHome) PortableRemoteObject
                    .narrow(orderRef, RQOrderControllerHome.class);
            RQOrderController orderController = orderHome.create();

           object.orderRef.code = orderController.createOrderByPlan(planCode, strCodes, true);
           objectDAO.save(object);

        }

		/**
		 *  NET-4406...  ��� ������� ����� �������� � ���������� ����������� ���� ������ �� ��������...
		 *
		 */
        ServicesLogic soLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		soLogic.setPaymentDateByServicesConsumer(serviceobj.code, object.dateGen);
		
		makeConnectionPaid(object);
		
		// SUPP-88724 ���� ������� �� ������������� �� ������������ � �������� ���� ������
		// �� ����� ����������� ������� �������� �������������� ��������
		serviceobj = servicesObjectDAO.getObject(serviceobj.code);
		soLogic.calculateENSOValuesTermsIfNeeded(serviceobj);


            return payment2SoCode;
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENPayment2SO%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* ENPayment2SO. ������� */
    @Override
	public void remove(int code) {
        try {
            ENPayment2SODAO objectDAO = new ENPayment2SODAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENPayment2SO p2soObject = objectDAO.getObject(code);
            ENServicesObject soObject = soDAO.getObject(p2soObject.servicesObjectRef.code);
            ENEstimateItemDAO estimateDao = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            RQOrderItem2ENEstimateItemDAO oiesDao = new RQOrderItem2ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

            if (soObject.contractStatusRef.code == ENServicesContractStatus.CLOSED ) {
                throw new EnergyproSystemException("\n SUPP-4100..."
                        + "\n \n ������� ��������. �������� ���� ������� ���������� !!!");
            }


            /** 19.10.2015 +++ ������� ������ ���� ������.... */
			if (soObject.contractStatusRef.code == ENServicesContractStatus.CANCELED
					|| soObject.contractStatusRef.code == ENServicesContractStatus.TERMINATED
					|| soObject.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES
					|| soObject.contractStatusRef.code == ENServicesContractStatus.CLOSED) {

				throw new EnergyproSystemException("\n\n "
						+ "������ ����������� � ������������ ������!!!");
			}


            int partId = Integer.MIN_VALUE;
            // ��������� ������������ �� �������� �� ��������
            ENServicesObject2ProvDAO so2provDAO = new ENServicesObject2ProvDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesObject2ProvFilter so2provFilter = new ENServicesObject2ProvFilter();
            so2provFilter.servicesObjectRef.code = soObject.code;
            int[] so2provArr = so2provDAO.getFilteredCodeArray(so2provFilter, 0, -1);
            if (so2provArr.length > 0 ) {
                ENServicesObject2Prov so2provObj =  so2provDAO.getObject(so2provArr[0]);
                partId = so2provObj.partId;
            }
            // ���� �������� �������� � ����� ������� ���������� - ������ ��� ��� ���������� ����� ����� � ��������
            if (partId != Integer.MIN_VALUE && p2soObject.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT
            		 && soObject.contractTypeRef.code != ENServicesContractType.OKSN  ) {
                throw new EnergyproSystemException("\n SUPP-4100..."
                        + "\n \n �������� �������. �������� ���������� ��������� !!! \n partId = " + partId );
            }

            // �������� ������ �������� ����� ������ � ����������� ensopaybillprov
            /** SUPP-75279... +++ ������ �� ���������...
            if (soObject.contractTypeRef.code == ENServicesContractType.OKSN) {
            	 ENSOPayBillProvFilter spbpFilter = new ENSOPayBillProvFilter();
            	 spbpFilter.soBillRef.code = p2soObject.soBillRef.code;
            	 spbpFilter.soRef.code = soObject.code;
            	 int[] spbpArr = spbpDAO.getFilteredCodeArray(spbpFilter, 0, -1);
            	 if (spbpArr.length > 0 ) {
            		 throw new EnergyproSystemException("\n "
                             + "\n \n ENSOPayBillProv \n �������� �������. �������� ������ ��������� !!!  " );
            	 }
            }
            */


         // �������� ���� ��������� ���������� �� ��������     ������� � �������� : ��������� , ������ ���������, ��������, ����������
            if (p2soObject.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT) {

                if (soObject.contractStatusRef.code == ENServicesContractStatus.PAID ||
                    soObject.contractStatusRef.code == ENServicesContractStatus.COMPLETED ||
                    soObject.contractStatusRef.code == ENServicesContractStatus.CLOSED  ||
                    soObject.contractStatusRef.code == ENServicesContractStatus.PREPAID ){
                    throw new EnergyproSystemException("\n SUPP-4100..."
                            + "\n \n ���������� �������� �����������, �������  ��������� ��� ������ �������, ��� ��������, ��� ���� ��������� ������ !!!");
                }
            }


            // ��� ������
            if (p2soObject.soBillRef.code != Integer.MIN_VALUE &&
            		soObject.contractTypeRef.code == ENServicesContractType.OKSN &&
            				soObject.contractKindRef.code == ENServicesContractKind.OKSN_WORK) {

            	Context context = new InitialContext();
                Object orderRef = context.lookup(RQOrderController.JNDI_NAME);
                RQOrderControllerHome orderHome = (RQOrderControllerHome) PortableRemoteObject
                        .narrow(orderRef, RQOrderControllerHome.class);
                RQOrderController orderController = orderHome.create();


                Object orderItemRef = context.lookup(RQOrderItemController.JNDI_NAME);
                RQOrderItemControllerHome orderItemHome = (RQOrderItemControllerHome) PortableRemoteObject
                        .narrow(orderItemRef, RQOrderItemControllerHome.class);
                RQOrderItemController orderItemController = orderItemHome.create();

            	RQOrderDAO ordDAO = new RQOrderDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            	RQOrder ord = ordDAO.getObject(p2soObject.orderRef.code);

            	if (ord.statusRef.code == RQOrderStatus.WORK_IN_MTS) {
            		throw new SystemException("������ �������� ��� ���������� � ������ ���!");
            	}

            	RQOrderItemDAO ordItemDAO = new RQOrderItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            	RQOrderItemFilter ordItemFilter = new RQOrderItemFilter();
            	ordItemFilter.orderRef.code = ord.code;
            	RQOrderItemShortList orderItemList = ordItemDAO.getScrollableFilteredList(ordItemFilter, 0, -1);
            	Vector<Integer> est4remove = new Vector<Integer>();

            	for (int g=0;g<orderItemList.totalCount;g++)
            	{
            		// ��������������� ������ �������� � ������� �����������, ������� ���� �� ������
            		RQOrderItem2ENEstimateItemFilter oiesFilter = new RQOrderItem2ENEstimateItemFilter();
            		oiesFilter.orderItem.code = orderItemList.get(g).code;
            		RQOrderItem2ENEstimateItemShortList oiesList = oiesDao.getScrollableFilteredList(oiesFilter, 0, -1);
            		if(oiesList.totalCount == 0) throw new SystemException("������ � ������ ������ - ���������");
            		ENEstimateItem orderedEstimate = estimateDao.getObject(oiesList.get(0).estimateItemCode);

            		for(int i = 0; i < oiesList.totalCount; i++) {
            			ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
            			eiFilter.materialRef.code = orderedEstimate.materialRef.code;
            			eiFilter.planRef.code = orderedEstimate.planRef.code;
            			eiFilter.planItemRef.code = orderedEstimate.planItemRef.code;
            			eiFilter.statusRef.code = ENEstimateItemStatus.PLANNED;
            			ENEstimateItemShortList eiList = estimateDao.getScrollableFilteredList(eiFilter, 0, -1);
            			if (eiList.totalCount > 0) {
            				ENEstimateItem planedItem = estimateDao.getObject(eiList.get(0).code);
            				planedItem.countFact = planedItem.countFact.add(oiesList.get(i).countGen);
            				estimateDao.save(planedItem);
            				est4remove.add(oiesList.get(i).estimateItemCode);
            			}
            		}

            		orderItemController.remove(orderItemList.get(g).code);
            	}

        		for (Integer item : est4remove) {
        			estimateDao.remove(item);
        		}

        		objectDAO.remove(code);
            	orderController.remove(ord.code);
            } else {
                objectDAO.remove(code);
            }
            
            makeConnectionPaid(p2soObject);
            servicesLogic.calculateENSOValuesTermsIfNeeded(soObject);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't remove {%com.ksoe.energynet.valueobject.ENPayment2SO%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
		} catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
		} catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
            closeConnection();
        }
    }

    /* ENPayment2SO. �������� */
    @Override
	public void save(ENPayment2SO object) {
        try {
            ENPayment2SODAO objectDAO = new ENPayment2SODAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENPayment2SO p2soObject = objectDAO.getObject(object.code);

            ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENServicesObject soObject = soDAO.getObject(p2soObject.servicesObjectRef.code);
            ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());




            // �������� ���� �������� ���������� �� ��������
            if (object.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT) {

                if (
                    soObject.contractStatusRef.code == ENServicesContractStatus.CLOSED  ||
                    soObject.contractStatusRef.code == ENServicesContractStatus.PREPAID ){
                    throw new EnergyproSystemException("\n SUPP-4100..."
                            + "\n \n ���������� �������� �����������, �������  ��������� ��� ������ �������, ��� ��������, ��� ���� ��������� ������ !!!");
                }
            }

            // �������� ������ ��� �����
            ENPayment2SO paymentObjectOld = objectDAO.getObject(object.code);
            if (paymentObjectOld.paymentTypeRef.code != object.paymentTypeRef.code ) {
                throw new EnergyproSystemException("\n SUPP-4100..."
                        + "\n \n ���������� �������� ��� ����� !!!");
            }


            /** 19.10.2015 +++ ������� ������ ���� ������.... */
			if (soObject.contractStatusRef.code == ENServicesContractStatus.CANCELED
					|| soObject.contractStatusRef.code == ENServicesContractStatus.TERMINATED
					|| soObject.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES
					|| soObject.contractStatusRef.code == ENServicesContractStatus.CLOSED) {

				throw new EnergyproSystemException("\n\n "
						+ "������ ����������� � ������������ ������!!!");
			}


            ENServicesObject serviceobj = servicesObjectDAO.getObject(object.servicesObjectRef.code);
            if (soObject.contractStatusRef.code == ENServicesContractStatus.CLOSED ) {
                throw new EnergyproSystemException("\n SUPP-4100..."
                        + "\n \n ������� ��������. �������� ���� ������� ���������� !!!");
            }

            // ��� ������
            if (object.soBillRef.code != Integer.MIN_VALUE &&
            		serviceobj.contractTypeRef.code == ENServicesContractType.OKSN &&
            		serviceobj.contractKindRef.code == ENServicesContractKind.OKSN_WORK) {
            	throw new SystemException("���������� ������ ��� �������� �� �������� ����� ����������! \n "
            			                + "��������� �� ��������� �� �����.");

            }

            int partId = Integer.MIN_VALUE;
            // ��������� ������������ �� �������� �� ��������
            ENServicesObject2ProvDAO so2provDAO = new ENServicesObject2ProvDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesObject2ProvFilter so2provFilter = new ENServicesObject2ProvFilter();
            so2provFilter.servicesObjectRef.code = soObject.code;
            int[] so2provArr = so2provDAO.getFilteredCodeArray(so2provFilter, 0, -1);
            if (so2provArr.length > 0 ) {
                ENServicesObject2Prov so2provObj =  so2provDAO.getObject(so2provArr[0]);
                partId = so2provObj.partId;
            }
            // ���� �������� �������� � ����� �������� ���������� - ������ ��� ��� ���������� ����� ����� � ��������
            if (partId != Integer.MIN_VALUE && p2soObject.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT ) {
                throw new EnergyproSystemException("\n SUPP-4100..."
                        + "\n \n �������� �������. ������ ���������� ��������� !!!");
            }

            // ����� �� ��������� ���� ������
            ENServicesFactCalcDAO factCalcDAO = new ENServicesFactCalcDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENServicesFactCalcFilter factCalcFilter = new ENServicesFactCalcFilter();
            factCalcFilter.servicesObjectRef.code = object.servicesObjectRef.code;

            BigDecimal totalSum = new BigDecimal(0); // ����� � ��� � ��������� ����
            int factCalcArr[] = factCalcDAO.getFilteredCodeArray(factCalcFilter, 0, -1);
            for (int i = 0; i < factCalcArr.length; i++) {
               ENServicesFactCalc factCalcObj = factCalcDAO.getObject(factCalcArr[i]);
               if (factCalcObj != null)
               {
            	   if (factCalcObj.totalSum != null)
            	   {
            		   totalSum = totalSum.add(factCalcObj.totalSum);
            	   }
               }
            }

         // ����� ����������� ����� �� �������� (���������� + ��������� ������������� - �������� ) ������
            ENPayment2SODAO paymentDAO = new ENPayment2SODAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENPayment2SOFilter paymentFilter = new ENPayment2SOFilter();
            paymentFilter.servicesObjectRef.code = object.servicesObjectRef.code;

            objectDAO.save(object);

            BigDecimal totalSumPay = new BigDecimal(0); // ����� � ��� �� ����������� ����������� ������� ��������� �������
            int paymentArr[] = paymentDAO.getFilteredCodeArray(paymentFilter, 0, -1);
            for (int i = 0; i < paymentArr.length; i++) {
               ENPayment2SO paymentObj = paymentDAO.getObject(paymentArr[i]);
               // ���������� � ��������� ������������ ������� , �������� ����� �������
               if (paymentObj.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_PREPAYMENT ||
                paymentObj.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_REPAYMENT   ) {
                   totalSumPay = totalSumPay.add(paymentObj.sumTotal); }
               else if (paymentObj.paymentTypeRef.code == ENPayment2SOType.ENPAYMENT2SOTYPE_RETURN_PAY ){
                totalSumPay = totalSumPay.subtract(paymentObj.sumTotal);
               }
            }



            // ��������� ������� � ������ "��������" ���� ����� ���������(� ���) = ����� �� ��������� ����(� ���) � �������� ����������
            // ��� ( ������� ����������� � �������� �����)
            // ��� ( ���������� �� ����� � �������� �����)
            if (
                    (so2provArr.length >0 &&
                            serviceobj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT &&
                    totalSum.doubleValue() > 0 && // ����� �������� ������ 0
                    totalSum.doubleValue() == totalSumPay.doubleValue() ) // ����� � ��������� ���� ����� ��� ���������� ����������
                    || (serviceobj.isNoPay == ENConsts.ENSERVICES_OBJECT_ISNOPAY && serviceobj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT )  // ����������� �������
                    || (serviceobj.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES && serviceobj.calcTypeRef.code == ENServicesObjectCalcType.BY_FACT) // �������� ��������� �� ����� (
                    )
            {
                // �������� ������� ������ �������� (���� ����������� �������� ������ "��������")
                serviceobj.prevContractStatus = serviceobj.contractStatusRef.code;
                serviceobj.contractStatusRef.code = ENServicesContractStatus.CLOSED;
                servicesObjectDAO.save(serviceobj);
            }
            
            makeConnectionPaid(p2soObject);
            servicesLogic.calculateENSOValuesTermsIfNeeded(serviceobj);


        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't save {%com.ksoe.energynet.valueobject.ENPayment2SO%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }
    
    /**
     * 
     * SUPP-88724 ������������ ������� ���������� � �������� �� ������������� � ����������� �� ������
     * 
     * ����� ������ ��� ��������� �� �������������.
     * ������ ���������� � ����� �����.
     * 
     * @param object {@link ENPayment2SO} ������ ������
     * @throws DatasourceConnectException 
     * @throws PersistenceException 
     */
    private void makeConnectionPaid(ENPayment2SO object) throws DatasourceConnectException, PersistenceException {
    	Connection enConn = null;
    	try {
    		enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
        	ENPayment2SODAO objectDao = new ENPayment2SODAO(getUserProfile(), enConn);
        	ENServicesObjectDAO soDao = new ENServicesObjectDAO(getUserProfile(), enConn);
        	ENTechConditionsServicesDAO techCondDao = new ENTechConditionsServicesDAO(getUserProfile(), enConn);
        	
        	ENServicesObject so = soDao.getObject(object.servicesObjectRef.code);
        	
        	if(so.contractTypeRef.code != ENServicesContractType.CONNECTION) {
        		return;
        	}
        	
        	if(so.contractStatusRef.code == ENServicesContractStatus.GOOD
        			|| so.contractStatusRef.code == ENServicesContractStatus.DISCLAIMER_CUSTOMER_SERVICES
        			|| so.contractStatusRef.code == ENServicesContractStatus.CANCELED) {
        		throw new SystemException(String.format("������ � %s �� %s �� ���� ���������", so.contractNumberServices
        				, Tools.dateFormatDefault.format(so.contractDateServices)));
        	}
        	
        	ENTechConditionsServices techCond = techCondDao.getObjectByENEServicesObject(so);
        	
        	if(techCond == null || techCond.tySummaGen == null) {
        		return;
        	}
        	
        	// ������������ ������� �������� �������� ���������� �����
        	// ���� ����� ���� ����� ������ ����� ��������, �� �������� ������ ������� ��������������� ����
        	// ����� ������ ����������
        	// ����� ����� = 0 - ������ ������ �������� �������� � �����������
        	BigDecimal sumPayments = objectDao.getOverallSumByENServicesObject(so);
        	
        	if(sumPayments.compareTo(BigDecimal.ZERO) == 0) {
        		so.contractStatusRef.code = ENServicesContractStatus.SIGNED;
        	} else {
            	if(techCond.tySummaGen.compareTo(sumPayments) > 0) {
            		so.contractStatusRef.code = ENServicesContractStatus.PREPAID;
            	} else {
            		so.contractStatusRef.code = ENServicesContractStatus.PAID;
            	}       		
        	}

        	
        	soDao.save(so);
        	
        	
    	} finally {
    		
    	}
    }


} // end of EJB Controller for ENPayment2SO