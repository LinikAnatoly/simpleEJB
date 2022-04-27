package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.ksoe.energynet.dataminer.ENAdditionalAgreementDAO;
import com.ksoe.energynet.dataminer.ENCalcContractTotalDAO;
import com.ksoe.energynet.dataminer.ENCalcCostDAO;
import com.ksoe.energynet.dataminer.ENCalcHumenDeliveryDAO;
import com.ksoe.energynet.dataminer.ENCalcHumenSalaryDAO;
import com.ksoe.energynet.dataminer.ENCalcMaterialsUsageDAO;
import com.ksoe.energynet.dataminer.ENCalcTotalCostDAO;
import com.ksoe.energynet.dataminer.ENCalcTransportUsageDAO;
import com.ksoe.energynet.dataminer.ENCalcTransportUsageHourDAO;
import com.ksoe.energynet.dataminer.ENPlanWork2ClassificationTypeDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENServices2CalcAdditionalItemsDAO;
import com.ksoe.energynet.dataminer.ENServicesContractStatusDAO;
import com.ksoe.energynet.dataminer.ENServicesCostDAO;
import com.ksoe.energynet.dataminer.ENServicesDeliveryDAO;
import com.ksoe.energynet.dataminer.ENServicesHumenSalaryDAO;
import com.ksoe.energynet.dataminer.ENServicesMaterialsDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENServicesTransportDAO;
import com.ksoe.energynet.dataminer.ENStandardConstDAO;
import com.ksoe.energynet.dataminer.FINChargeHistoryDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAdditionalAgreement;
import com.ksoe.energynet.valueobject.ENCalcContractTotal;
import com.ksoe.energynet.valueobject.ENCalcCost;
import com.ksoe.energynet.valueobject.ENCalcHumenDelivery;
import com.ksoe.energynet.valueobject.ENCalcHumenSalary;
import com.ksoe.energynet.valueobject.ENCalcMaterialsUsage;
import com.ksoe.energynet.valueobject.ENCalcTotalCost;
import com.ksoe.energynet.valueobject.ENCalcTransportUsage;
import com.ksoe.energynet.valueobject.ENCalcTransportUsageHour;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENServices2CalcAdditionalItems;
import com.ksoe.energynet.valueobject.ENServicesContractKind;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesCost;
import com.ksoe.energynet.valueobject.ENServicesDelivery;
import com.ksoe.energynet.valueobject.ENServicesHumenSalary;
import com.ksoe.energynet.valueobject.ENServicesMaterials;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesTransport;
import com.ksoe.energynet.valueobject.ENStandardConst;
import com.ksoe.energynet.valueobject.FINChargeType;
import com.ksoe.energynet.valueobject.brief.ENCalcCostShort;
import com.ksoe.energynet.valueobject.brief.ENCalcHumenDeliveryShort;
import com.ksoe.energynet.valueobject.brief.ENCalcHumenSalaryShort;
import com.ksoe.energynet.valueobject.brief.ENCalcMaterialsUsageShort;
import com.ksoe.energynet.valueobject.brief.ENCalcTotalCostShort;
import com.ksoe.energynet.valueobject.brief.ENCalcTransportUsageHourShort;
import com.ksoe.energynet.valueobject.brief.ENCalcTransportUsageShort;
import com.ksoe.energynet.valueobject.brief.ENPlanWork2ClassificationTypeShort;
import com.ksoe.energynet.valueobject.brief.ENServicesCostShort;
import com.ksoe.energynet.valueobject.filter.ENCalcContractTotalFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcCostFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcHumenDeliveryFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcHumenSalaryFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcMaterialsUsageFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcTotalCostFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcTransportUsageFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcTransportUsageHourFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2ClassificationTypeFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENAdditionalAgreementShortList;
import com.ksoe.energynet.valueobject.lists.ENCalcCostShortList;
import com.ksoe.energynet.valueobject.lists.ENCalcHumenDeliveryShortList;
import com.ksoe.energynet.valueobject.lists.ENCalcHumenSalaryShortList;
import com.ksoe.energynet.valueobject.lists.ENCalcMaterialsUsageShortList;
import com.ksoe.energynet.valueobject.lists.ENCalcTotalCostShortList;
import com.ksoe.energynet.valueobject.lists.ENCalcTransportUsageHourShortList;
import com.ksoe.energynet.valueobject.lists.ENCalcTransportUsageShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2ClassificationTypeShortList;
import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.dataminer.TKCalcCostDAO;
import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;
import com.ksoe.techcard.dataminer.TKClassificationTypeParamsOnDateDAO;
import com.ksoe.techcard.dataminer.TKTechCardDAO;
import com.ksoe.techcard.logic.CalculationLogic;
import com.ksoe.techcard.logic.TKConsts;
import com.ksoe.techcard.valueobject.TKCalcCost;
import com.ksoe.techcard.valueobject.TKCalcDelivery;
import com.ksoe.techcard.valueobject.TKCalcHumenSalary;
import com.ksoe.techcard.valueobject.TKCalcKind;
import com.ksoe.techcard.valueobject.TKCalcMaterials;
import com.ksoe.techcard.valueobject.TKCalcTransport;
import com.ksoe.techcard.valueobject.TKClassificationType;
import com.ksoe.techcard.valueobject.TKClassificationTypeParamsOnDate;
import com.ksoe.techcard.valueobject.TKTransportType;
import com.ksoe.techcard.valueobject.filter.TKClassificationTypeFilter;
import com.ksoe.techcard.valueobject.lists.TKClassificationTypeShortList;

public class ServicesCalculatorLogic extends LogicModule{

    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public ServicesCalculatorLogic(Connection connection, UserProfile userProfile)
    {
        super(connection, userProfile);
    }

    public static final BigDecimal AVG_SPEED = new BigDecimal(45);

    public static final int CARS_PASSENGER = 500000028; //�����!!���-21074 (����) � ���� ��� ��� ��������� 75000000 ;
    public static final int CARS_BRIGADIER_CAR = 75000010; //�����!!���-2206  ;
    public static final int CARS_LABORATORY = 75000184; //�����! ���-3307 ���

    public ENServicesObject getServicesObjectByPlanCode(int planCode) throws PersistenceException
    {
        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
        ENPlanWork plan = planDAO.getObjectNoRefNoSegr(planCode);
        return getServicesObjectByElementCode(plan.elementRef.code);
    }

    public ENServicesObject getServicesObjectByElementCode(int elementCode) throws PersistenceException
    {
        if (elementCode == Integer.MIN_VALUE)
        {
            throw new EnergyproSystemException("ElementCode is NULL!!!");
        }

        ENServicesObjectDAO objDAO = new ENServicesObjectDAO(connection, userProfile);
        ENServicesObjectFilter f = new ENServicesObjectFilter();
        f.element.code = elementCode;
        int[] arr = objDAO.getFilteredCodeArray(f, 0, -1);
        if (arr.length != 1)
        {
            throw new EnergyproSystemException("Element count != 1 (ENServicesObject)");
        }

        return   objDAO.getObject(arr[0]);
    }

    public BigDecimal calculateServices(int planCalculationCode) throws PersistenceException {
        return calculateServices(planCalculationCode, false);
    }

    public BigDecimal calculateServices(int planCalculationCode, boolean priconnection) throws PersistenceException
    {
        ENPlanWork2ClassificationTypeDAO p2cDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
        ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
        p2cFilter.planRef.code = planCalculationCode;
        ENPlanWork2ClassificationTypeShortList p2cList = p2cDAO.getScrollableFilteredList(p2cFilter, 0, -1);


        TKClassificationTypeDAO clTypeDAO = new TKClassificationTypeDAO(connection, userProfile);
        TKClassificationTypeFilter clTypeFilter = new TKClassificationTypeFilter();


        // ��������� ��� ������������� (�������������� ������ ��� ��� ) ���� ���������������� ����� ������ ���������
        if (p2cList.totalCount == 0) return new BigDecimal(0); //!!????

        clTypeFilter.code = p2cList.get(0).classificationTypeRefCode;
        TKClassificationTypeShortList clTypeList = clTypeDAO.getScrollableFilteredList(clTypeFilter,0,-1);

        if (clTypeList.get(0).isnotlicensedactivity == 1.0 )
        {
            calculateTransportUsageHourNotLicensed(planCalculationCode);
            calculateTransportUsageNotLicensed(planCalculationCode);
        }
        else
        {
        // � �� ����� ���� �� ��� ����������� ..
        calculateTransportUsageHour(planCalculationCode);
        calculateTransportUsage(planCalculationCode);
        }

        for(ENPlanWork2ClassificationTypeShort p2c : p2cList.list) {
            calculateMaterials(p2c.planRefCode, p2c.classificationTypeRefCode , p2c.code, p2c.calcKindRefCode == TKCalcKind.NEW);
            calculateHumenDelivery(p2c.planRefCode, p2c.classificationTypeRefCode , p2c.code);
            calculateCalcHumenSalary(p2c.planRefCode, p2c.classificationTypeRefCode , p2c.code);
            calculateCost(p2c.planRefCode, p2c.classificationTypeRefCode , p2c.code);
            calculateTotalCost(p2c.planRefCode, p2c.classificationTypeRefCode , p2c.code);
        }

        for (int i=0; i < p2cList.totalCount; i++){

        }
        return calculateContractCost(planCalculationCode, priconnection);
    }

    public BigDecimal calculateContractCost(int planCode) throws PersistenceException {
        return calculateContractCost(planCode, false);
    }

    public BigDecimal calculateContractCost(int planCode, boolean priconnection) throws PersistenceException
    {
        ENCalcContractTotalDAO dao = new ENCalcContractTotalDAO(connection, userProfile);
        ENCalcContractTotalFilter f = new ENCalcContractTotalFilter();
        f.planRef.code = planCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }

        ENCalcContractTotal obj = new ENCalcContractTotal();
        obj.planRef.code = planCode;

        ENServicesObject soObj = getServicesObjectByPlanCode(planCode);

    	ENStandardConstDAO standardConstDao = new ENStandardConstDAO(connection, userProfile);
    	BigDecimal nds = standardConstDao.getENStandardConstEntryOnDate(ENStandardConst.PDV, soObj.contractDate);
    	BigDecimal nds_koef = nds.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);

        obj.costWithoutVAT = dao.getCostByPlan(planCode, false);
        obj.costVAT = obj.costWithoutVAT.multiply(nds_koef).setScale(2, BigDecimal.ROUND_HALF_UP);
        //obj.costVAT = dao.getCostByPlan(planCode, true);


        obj.totalCost = obj.costWithoutVAT.add(obj.costVAT).setScale(2, BigDecimal.ROUND_HALF_UP);


        dao.add(obj);

        if (!priconnection) {
            ///////////////////////////////////////////////////////////////////////////////////
            // NET-2491 ������� ����� �������� ��� ���
            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
            soDAO.updateContractServicesSum(soObj.code, obj.costWithoutVAT);
            ///////////////////////////////////////////////////////////////////////////////////
        }

        return obj.costWithoutVAT;
    }

    public void calculateTotalCost(int planCode, int classificationCode, int plan2classificationCode) throws PersistenceException
    {
    	BigDecimal zeroValue = new BigDecimal(0).setScale(2, BigDecimal.ROUND_HALF_UP);
        ENCalcTotalCostDAO dao = new ENCalcTotalCostDAO(connection, userProfile);
        TKClassificationTypeDAO clTypeDAO = new TKClassificationTypeDAO(connection, userProfile);
        TKClassificationType clType = clTypeDAO.getObject(classificationCode);

        ENPlanWork2ClassificationTypeDAO epcDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
        ENPlanWork2ClassificationType epct = epcDAO.getObject(plan2classificationCode);

        ENServicesObject so = this.getServicesObjectByPlanCode(planCode);


        ENCalcTotalCostFilter f = new ENCalcTotalCostFilter();
        f.planRef.code = planCode;
        f.plan2CTypeRef.code = plan2classificationCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++) {
            dao.remove(arr[i]);
        }

        ENCalcTotalCost obj = new ENCalcTotalCost();
        obj.planRef.code = planCode;
        obj.plan2CTypeRef.code = plan2classificationCode;

        ENCalcCostDAO costDAO = new ENCalcCostDAO(connection, userProfile);
        obj.calculationCost = costDAO.getCostCalculationByPlan2ClassificationType(plan2classificationCode);

        // 25.06.2018 �� ����� �������� ������� � ����� �����������
        // �� ����������� ������������ (����� ��������) � ������������ �������

        ENCalcMaterialsUsageDAO matDAO = new ENCalcMaterialsUsageDAO(connection, userProfile);
        obj.materialExpenses = matDAO.getCostMaterialsByPlan2ClassificationType(plan2classificationCode);

        if(epct.calcKindRef.code == TKCalcKind.NEW) {
        	obj.transportExpenses = zeroValue;
        	obj.deliveryCost = zeroValue;
        } else {

            ENCalcTransportUsageDAO trDAO = new ENCalcTransportUsageDAO(connection, userProfile);
            obj.transportExpenses = trDAO.getCostTransportByPlan2ClassificationType(plan2classificationCode);

            ENCalcHumenDeliveryDAO delDAO = new ENCalcHumenDeliveryDAO(connection, userProfile);
            obj.deliveryCost = delDAO.getCostDeliveryByPlan2ClassificationType(plan2classificationCode);
        }

        obj.costWithoutVAT = obj.calculationCost.add(obj.materialExpenses).setScale(2, BigDecimal.ROUND_HALF_UP)
                                                .add(obj.transportExpenses).setScale(2, BigDecimal.ROUND_HALF_UP)
                                                .add(obj.deliveryCost).setScale(2, BigDecimal.ROUND_HALF_UP);

    	ENStandardConstDAO standardConstDao = new ENStandardConstDAO(connection, userProfile);
    	BigDecimal nds = standardConstDao.getENStandardConstEntryOnDate(ENStandardConst.PDV, so.contractDate);
    	BigDecimal nds_koef = nds.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);

        // 25.06.2018 � ����� �������� ������� ������������� ��� �� ����� �����������
        if(epct.calcKindRef.code == TKCalcKind.NEW || epct.calcKindRef.code == TKCalcKind.NEW2) {
        	obj.costVAT = obj.costWithoutVAT.multiply(nds_koef).setScale(2, BigDecimal.ROUND_HALF_UP);

        } else {
            obj.costVAT =  new BigDecimal(0); // ��� ���������� �� ��� ����������� !!!
        }

        obj.totalCost = obj.costWithoutVAT.add(obj.costVAT);

        if((clType.isnotlicensedactivity == 3) && (clType.costWorksContractor != null) && (clType.costWorksContractor.doubleValue()!=0))
        {
            obj.materialExpenses = new BigDecimal(0);
            obj.transportExpenses = new BigDecimal(0);
            obj.deliveryCost = new BigDecimal(0);
            obj.calculationCost = clType.costWorksContractor.multiply(epct.countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
            obj.costWithoutVAT = clType.costWorksContractor.multiply(epct.countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
        }

        dao.add(obj);
    }

    public void calculateCost(int planCode, int classificationCode, int plan2classificationCode) throws PersistenceException {
    	ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
    	HumenLogic hLogic = new HumenLogic(connection, userProfile);
        TKClassificationTypeDAO clTypeDAO = new TKClassificationTypeDAO(connection, userProfile);
        TKClassificationType clType = clTypeDAO.getObject(classificationCode);


    	ENPlanWork plan = pDAO.getObjectNoRefNoSegr(planCode);

        ENPlanWork2ClassificationTypeDAO epcDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
        ENPlanWork2ClassificationType epct = epcDAO.getObject(plan2classificationCode);
        BigDecimal productionExpenses = null;
        if(epct.productionExpensesPercent == null) {
        	// SUPP-68898 ���� � ������������� �� ����� ������� �������������������� ������, �� �������
        	// ������� �� �������� ����
        	ServicesLogic servicesLogic = new ServicesLogic(connection, userProfile);
        	ActLogic actLogic = new ActLogic(connection, userProfile);
        	ENServicesObject services = servicesLogic.getServicesObjectByElementCode(plan.elementRef.code);
        	productionExpenses = actLogic.getProductionExpencesRateByDate(services.contractDateServices);
        } else {
        	productionExpenses = epct.productionExpensesPercent.divide(new BigDecimal(100)).setScale(2, BigDecimal.ROUND_HALF_UP);
        }

    	ENCalcCostDAO dao = new ENCalcCostDAO(connection, userProfile);
        ENCalcCostFilter f = new ENCalcCostFilter();
        f.planRef.code = planCode;
        f.plan2CTypeRef.code = plan2classificationCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }

        ENCalcCost obj = new ENCalcCost();
        obj.planRef.code = planCode;
        obj.plan2CTypeRef.code = plan2classificationCode;

        ENCalcHumenSalaryDAO hsDAO = new ENCalcHumenSalaryDAO(connection, userProfile);
        obj.salaryExpenses = hsDAO.getSalaryByPlan2ClassificationType(plan2classificationCode);


    	BigDecimal chargePercent = hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID,  plan.dateStart).divide(new BigDecimal(100), 4, BigDecimal.ROUND_HALF_UP);
        obj.socialCharges = obj.salaryExpenses.multiply(chargePercent).setScale(2, BigDecimal.ROUND_HALF_UP);
        obj.directExpenses = obj.salaryExpenses.add(obj.socialCharges).setScale(2, BigDecimal.ROUND_HALF_UP);

        obj.productionExpenses = obj.salaryExpenses.multiply(productionExpenses).setScale(2, BigDecimal.ROUND_HALF_UP);

        /** SUPP-21313 */
        BigDecimal NORM_INCOME = new BigDecimal(0.1);
        if (clType.percentProfitRate != null) {
        	NORM_INCOME = clType.percentProfitRate.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);
        }


        obj.totalExpenses = obj.directExpenses.add(obj.productionExpenses).setScale(2, BigDecimal.ROUND_HALF_UP);
        obj.normIncome = obj.totalExpenses.multiply(NORM_INCOME).setScale(2, BigDecimal.ROUND_HALF_UP);
        obj.calculationCost = obj.totalExpenses.add(obj.normIncome).setScale(2, BigDecimal.ROUND_HALF_UP);


        /*21.10.2011 - ���� ������ ����������, �� �������� ��� ���������� � ������� ������ ������� �����
        * ��� � ������ */
        if((clType.isnotlicensedactivity == 3) && (clType.costWorksContractor != null) && (clType.costWorksContractor.doubleValue()!=0))
        {
            obj.salaryExpenses = new BigDecimal(0);
            obj.socialCharges = new BigDecimal(0);
            obj.directExpenses = new BigDecimal(0);
            obj.productionExpenses = new BigDecimal(0);
            obj.totalExpenses = new BigDecimal(0);
            obj.normIncome = new BigDecimal(0);
            obj.calculationCost = clType.costWorksContractor.multiply(epct.countGen).setScale(2, BigDecimal.ROUND_HALF_UP);

        }

        dao.add(obj);
    }

    public void calculateCalcHumenSalary(int planCode, int classificationCode, int plan2classificationCode) throws PersistenceException {
        ENCalcHumenSalaryDAO dao = new ENCalcHumenSalaryDAO(connection, userProfile);
        ENPlanWork2ClassificationTypeDAO pl2clDao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);

        ENPlanWork2ClassificationType pl2cl = pl2clDao.getObject(plan2classificationCode);

        ENCalcHumenSalaryFilter f = new ENCalcHumenSalaryFilter();
        f.planRef.code = planCode;
        f.plan2CTypeRef.code = plan2classificationCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }

        ENCalcHumenSalaryShortList dList = dao.getList4Calculation(plan2classificationCode);
        for (int i=0; i < dList.totalCount; i++){
            ENCalcHumenSalary obj = new ENCalcHumenSalary();
            obj.planRef.code = planCode;
            obj.plan2CTypeRef.code = plan2classificationCode;

            ENCalcHumenSalaryShort shortObj = dList.get(i);

            if (shortObj.timeGenMonth == null){
                throw new EnergyproSystemException("�� ������� ���� �������� ���� ��� ������ \"" + shortObj.positionName + "\"");
            }

            if (shortObj.salaryMonth == null){
                throw new EnergyproSystemException("�� ������� ������� ����� ��� ������ \"" + shortObj.positionName + "\"");
            }

            if (shortObj.timeGen == null){
                throw new EnergyproSystemException("�� ������� ����� ���� ��� ������ \"" + shortObj.positionName + "\"");
            }

            if (shortObj.bonusPercent == null){
                throw new EnergyproSystemException("�� ������� ������� ���쳿 ��� ������ \"" + shortObj.positionName + "\"");
            }

            if(pl2cl.calcKindRef != null
            		&& pl2cl.calcKindRef.code == TKCalcKind.NEW) {
            	if(shortObj.salaryAdditional == null || shortObj.salaryPremium == null || shortObj.salarySurcharge == null) {
            		throw new SystemException(String.format("�� ��������� ������������ ���� ��� ����������� � ����� %d "
            				+ "��� ��������� \"%s\" ��� %d", classificationCode, shortObj.positionName, shortObj.positionRefCode));
            	}
            }

            obj.numberGen = shortObj.numberGen;
            obj.classificationTypeNumber = shortObj.classificationTypeNumber;
            obj.positionName = shortObj.positionName;
            obj.timeGenMonth = shortObj.timeGenMonth;
            obj.timeGen = shortObj.timeGen;
            obj.salaryMonth = shortObj.salaryMonth;
            obj.priceHour = obj.salaryMonth.divide(obj.timeGenMonth, 2, BigDecimal.ROUND_HALF_UP);

            obj.salaryHour = obj.priceHour.multiply(obj.timeGen).setScale(2, BigDecimal.ROUND_HALF_UP);
            obj.salaryBonus = obj.salaryHour.multiply(
                                                            (shortObj.bonusPercent.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP) )
                                                        ).setScale(2, BigDecimal.ROUND_HALF_UP);
            obj.percentBonus = shortObj.bonusPercent;
            obj.percentAdditional= shortObj.salaryAdditional;
            obj.percentPremium = shortObj.salaryPremium;
            obj.percentSurcharge = shortObj.salarySurcharge;

            // ��� �� ����� ;)
            obj.salaryTotalBonus = obj.salaryBonus;

            if(shortObj.salaryAdditional != null) {
            	obj.salaryAdditional = obj.salaryHour.multiply(
                        (shortObj.salaryAdditional.divide(new BigDecimal(100), 5, BigDecimal.ROUND_HALF_UP) )
                    ).setScale(2, BigDecimal.ROUND_HALF_UP);
            	obj.salaryTotalBonus = obj.salaryTotalBonus.add(obj.salaryAdditional);
            }
            if(shortObj.salaryPremium != null) {
            	obj.salaryPremium = obj.salaryHour.multiply(
                        (shortObj.salaryPremium.divide(new BigDecimal(100), 5, BigDecimal.ROUND_HALF_UP) )
                    ).setScale(2, BigDecimal.ROUND_HALF_UP);
            	obj.salaryTotalBonus = obj.salaryTotalBonus.add(obj.salaryPremium);
            }
            if(shortObj.salarySurcharge != null) {
            	obj.salarySurcharge = obj.salaryHour.multiply(
                        (shortObj.salarySurcharge.divide(new BigDecimal(100), 5, BigDecimal.ROUND_HALF_UP) )
                    ).setScale(2, BigDecimal.ROUND_HALF_UP);
            	obj.salaryTotalBonus = obj.salaryTotalBonus.add(obj.salarySurcharge);
            }

            obj.salaryTotal = obj.salaryHour.add(obj.salaryTotalBonus).setScale(2, BigDecimal.ROUND_HALF_UP);

            obj.positionRef.code = shortObj.positionRefCode;

            dao.add(obj);
        }
    }


    public void calculateTransportUsage(int planCode) throws PersistenceException
    {
          BigDecimal fuelexpensesmachine; // ������� �� ������ ��� ���� �����

        ENCalcTransportUsageDAO dao = new ENCalcTransportUsageDAO(connection, userProfile);
        ENCalcTransportUsageFilter f = new ENCalcTransportUsageFilter();
        f.planRef.code = planCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }

        TKTechCardDAO tkDao = new TKTechCardDAO(connection, userProfile);

        ENCalcTransportUsageShortList dList = dao.getList4Calculation(planCode);
        for (int i=0; i < dList.totalCount; i++){
            ENCalcTransportUsage obj = new ENCalcTransportUsage();
            obj.planRef.code = planCode;

            ENCalcTransportUsageShort shortObj = dList.get(i);
            fuelexpensesmachine = shortObj.costDistance;
            obj.plan2CTypeRef.code = shortObj.plan2CTypeRefCode;
            obj.numberGen = shortObj.numberGen;
            obj.classificationTypeNumber = shortObj.classificationTypeNumber;

            obj.tkTransportRef.code = shortObj.tkTransportRefCode;
            obj.transportName = shortObj.transportName;

            /*
            // + �/� � + ����� �
            ENCalcTransportUsageHourFilter tuhFilter = new ENCalcTransportUsageHourFilter();
            tuhFilter.planRef.code = planCode;
            tuhFilter.tkTransportRef.code = obj.tkTransportRef.code;

            ENCalcTransportUsageHourShortList tuhList = tuhDAO.getScrollableFilteredList(tuhFilter, 0, -1);
            if (tuhList.totalCount != 1){
                throw new EnergyproSystemException("������� � ������� ���������� ������� ������ ������ ���� ... " + obj.transportName);
            }
            */

            if (shortObj.priceMachineHours != null){
                obj.priceMachineHours = shortObj.priceMachineHours;
            }
            else{
                throw new EnergyproSystemException("�� ������� ������� ������-������ ��� " + shortObj.transportName);
            }

            /* ��� ��� ��������� ���� ...
                .add(tuhList.get(0).amortizationHourMachine).setScale(2, BigDecimal.ROUND_HALF_UP)
                                        .add(tuhList.get(0).salaryTotalHourDriver).setScale(2, BigDecimal.ROUND_HALF_UP);
            */
            obj.normMachineHours = shortObj.normMachineHours;
            obj.costMachineHours = obj.priceMachineHours.multiply(obj.normMachineHours).setScale(2, BigDecimal.ROUND_HALF_UP);


            if (shortObj.normDistance != null){
                // ������ ������ ������ �� ���������� ....
                obj.normDistance = shortObj.normDistance ;
            }
            else{
                // ��� ��� �����, � ������� ���������� ������������ ������ �� ���� ������
                obj.normDistance = new BigDecimal(0);
                //throw new EnergyproSystemException("�� ������� ������ ��� " + shortObj.transportName);
            }



            if (shortObj.fuelByDistance == null){
                throw new EnergyproSystemException("�� ������� ����� ������ ������ ��� " + shortObj.transportName);
            }


            if ( shortObj.tkTransportTypeRefCode == CARS_PASSENGER  ||  shortObj.tkTransportTypeRefCode == CARS_BRIGADIER_CAR ||
                shortObj.tkTransportTypeRefCode == CARS_LABORATORY) {
                // ��� �������� ...
                /* obj.priceDistance = obj.priceMachineHours.divide(AVG_SPEED, 2, BigDecimal.ROUND_HALF_UP)
                                        .add(
                                            (tuhList.get(0).costMachine.divide(tuhList.get(0).amortizationYearMachine, 2, BigDecimal.ROUND_HALF_UP)
                                            .divide(new BigDecimal(100), 2 , BigDecimal.ROUND_HALF_UP).setScale(2, BigDecimal.ROUND_HALF_UP)
                                            ).multiply(shortObj.fuelPrice).setScale(2, BigDecimal.ROUND_HALF_UP)).setScale(2, BigDecimal.ROUND_HALF_UP);
                  */
                    obj.priceDistance = obj.priceMachineHours.divide(AVG_SPEED, 10 , BigDecimal.ROUND_HALF_UP)
                    .add(
                            (shortObj.fuelByDistance.divide(new BigDecimal(100), 10 , BigDecimal.ROUND_HALF_UP)
                        ).multiply(shortObj.fuelPrice)).setScale(2, BigDecimal.ROUND_HALF_UP);

                    obj.commentPriceDistance = " ����� �� ����� = " + obj.priceMachineHours.toString() + "[������� 1 ���.���]" +
                                                "/" + AVG_SPEED + "[������� �������� ����]" + " + " + shortObj.fuelByDistance.toString() +
                                                "[������� ������ �� 100��]" + "/" + new BigDecimal(100).toString() + "*" +
                                                shortObj.fuelPrice.toString() + "[������� ���� ������]" + " = " + obj.priceDistance.setScale(2, BigDecimal.ROUND_HALF_UP) ;
            }
            else{
                // ��� ���� ���������
                obj.priceDistance = (((obj.priceMachineHours).subtract(fuelexpensesmachine)).divide(AVG_SPEED, 10 , BigDecimal.ROUND_HALF_UP)).add(
                                    shortObj.fuelByDistance.divide(new BigDecimal(100), 10, BigDecimal.ROUND_HALF_UP)
                                    .multiply(shortObj.fuelPrice).setScale(2, BigDecimal.ROUND_HALF_UP));

                obj.priceDistance = obj.priceDistance.setScale(2 , BigDecimal.ROUND_HALF_UP);

                obj.commentPriceDistance = " ����� �� ����� = (" + obj.priceMachineHours.toString() + "[������� 1 ���.���.]" + " - " +
                fuelexpensesmachine + "[������� �� ������ ��� ���������]" +  ")" +  "/" + AVG_SPEED + "[������� �������� ����]" + " + " +
                shortObj.fuelByDistance.toString() + "[������� ������ �� 100��]" +  "/" + new BigDecimal(100).toString() + "*" +
                shortObj.fuelPrice.toString() + "[������� ���� ������]" + " = " + obj.priceDistance.setScale(2, BigDecimal.ROUND_HALF_UP);
            }
            //obj.costDistance = shortObj.normDistance.multiply(obj.priceDistance).setScale(2, BigDecimal.ROUND_HALF_UP);


            // ���� ���� �� �����  �������� �� ������������ ����� ������� ��������� ��������� ������� ��� ���������� �� ����������� �������� ����� ���.
            if ( ( tkDao.chkIsPayRun(shortObj.plan2CTypeRefCode)) > 0  ) {
                obj.costDistance = obj.normDistance.multiply(obj.priceDistance).setScale(2, BigDecimal.ROUND_HALF_UP);
            }
            else {
                obj.costDistance = new BigDecimal(0);
                obj.normDistance = new BigDecimal(0);
            }
            obj.costTotal = obj.costDistance.add(obj.costMachineHours).setScale(2, BigDecimal.ROUND_HALF_UP);
            // ��������� ������ ���������� �� ���� ���������� �������� priceDistance
            ;

            dao.add(obj);


        }
    }

    public void calculateTransportUsageNotLicensed(int planCode) throws PersistenceException
    {
          BigDecimal profitrate;
          BigDecimal costperkilometer;

        ENCalcTransportUsageDAO dao = new ENCalcTransportUsageDAO(connection, userProfile);
        ENCalcTransportUsageFilter f = new ENCalcTransportUsageFilter();
        f.planRef.code = planCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }

        ENCalcTransportUsageShortList dList = dao.getList4Calculation(planCode);
        for (int i=0; i < dList.totalCount; i++){
            ENCalcTransportUsage obj = new ENCalcTransportUsage();
            obj.planRef.code = planCode;

            ENCalcTransportUsageShort shortObj = dList.get(i);
            profitrate = shortObj.plan2CTypeRefCountGen; // ����� �������� 10 % �� ���� ������
            costperkilometer = shortObj.costTotal;       // ������� 1 �� ������

            obj.plan2CTypeRef.code = shortObj.plan2CTypeRefCode;
            obj.numberGen = shortObj.numberGen;
            obj.classificationTypeNumber = shortObj.classificationTypeNumber;

            obj.tkTransportRef.code = shortObj.tkTransportRefCode;
            obj.transportName = shortObj.transportName;

            /*
            // + �/� � + ����� �
            ENCalcTransportUsageHourFilter tuhFilter = new ENCalcTransportUsageHourFilter();
            tuhFilter.planRef.code = planCode;
            tuhFilter.tkTransportRef.code = obj.tkTransportRef.code;

            ENCalcTransportUsageHourShortList tuhList = tuhDAO.getScrollableFilteredList(tuhFilter, 0, -1);
            if (tuhList.totalCount != 1){
                throw new EnergyproSystemException("������� � ������� ���������� ������� ������ ������ ���� ... " + obj.transportName);
            }
            */

            obj.priceMachineHours = shortObj.priceMachineHours.add(profitrate); // ��������� ���������� + ����� �������� 10 % �� ���� ������
            /* ��� ��� ��������� ���� ...
                .add(tuhList.get(0).amortizationHourMachine).setScale(2, BigDecimal.ROUND_HALF_UP)
                                        .add(tuhList.get(0).salaryTotalHourDriver).setScale(2, BigDecimal.ROUND_HALF_UP);
            */
            obj.normMachineHours = shortObj.normMachineHours;
            obj.costMachineHours = obj.priceMachineHours.multiply(obj.normMachineHours).setScale(2, BigDecimal.ROUND_HALF_UP);


            // ������ ������ ������ �� ���������� ....
            obj.normDistance = shortObj.normDistance ;
            obj.priceDistance = costperkilometer; // ����� ���./1 ��
            // �������� �������� ������� ������ �� ������ � ���� ENCalcTransportUsageHR
            obj.commentPriceDistance = shortObj.commentPriceDistance;
            obj.costDistance = shortObj.normDistance.multiply(obj.priceDistance).setScale(2, BigDecimal.ROUND_HALF_UP);

            obj.costTotal = obj.costDistance.add(obj.costMachineHours).setScale(2, BigDecimal.ROUND_HALF_UP);

            dao.add(obj);


        }
    }


    public void calculateTransportUsageHour(int planCode) throws PersistenceException
    {
        BigDecimal monthCount = new BigDecimal(12);

        ENCalcTransportUsageHourDAO dao = new ENCalcTransportUsageHourDAO(connection, userProfile);
        ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
        HumenLogic hLogic = new HumenLogic(connection, userProfile);

        ENCalcTransportUsageHourFilter f = new ENCalcTransportUsageHourFilter();
        f.planRef.code = planCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }

        ENPlanWork plan = planDao.getObjectNoRefNoSegr(planCode);

        ENCalcTransportUsageHourShortList dList = dao.getList4Calculation(planCode);
        for (int i=0; i < dList.totalCount; i++){
            ENCalcTransportUsageHour obj = new ENCalcTransportUsageHour();
            obj.planRef.code = planCode;


            ENCalcTransportUsageHourShort shortObj = dList.get(i);
            obj.tkTransportRef.code = shortObj.tkTransportRefCode;

            if (shortObj.amortizationYearMachine != null){
                obj.amortizationYearMachine = shortObj.amortizationYearMachine;
            }
            else{
                throw new EnergyproSystemException("�� ������� ���� ����������� �� ��������� " + shortObj.tkTransportRefName);
            }

            if (shortObj.salaryMonthDriver != null){
                obj.salaryMonthDriver = shortObj.salaryMonthDriver;
            }
            else{
                throw new EnergyproSystemException("�� ������� �������� ����� ���� " + shortObj.tkTransportRefName);
            }

            if (shortObj.normWorkTimeMonth != null){
            	// SUPP-45521 �.�. ���� �� ����� �� ��� ��������, ����� ���������, � �� �������� ������ ������� �� 0!!!
                if (shortObj.normWorkTimeMonth.doubleValue() == 0) {
                	throw new EnergyproSystemException("\n\n�� ������� ����� ��������� �������� ���� �� ����� �� ��������� " + shortObj.tkTransportRefName);
                }
                else {
                	obj.normWorkTimeMonth = shortObj.normWorkTimeMonth;
                }
            }
            else{
                throw new EnergyproSystemException("\n\n�� ������� ����� ��������� �������� ���� �� ����� �� ��������� " + shortObj.tkTransportRefName);
            }

            obj.costMachine = shortObj.costMachine;
            obj.fuelExpensesMachine = shortObj.fuelExpensesMachine;

            obj.salaryHourDriver = obj.salaryMonthDriver.divide(obj.normWorkTimeMonth, 2 , BigDecimal.ROUND_HALF_UP);


            BigDecimal chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID, plan.dateStart).divide(new BigDecimal(100), 4, BigDecimal.ROUND_HALF_UP);

            obj.salaryChargeHourDriver = obj.salaryHourDriver.multiply(chargePercent).setScale(2, BigDecimal.ROUND_HALF_UP);

            obj.salaryTotalHourDriver = obj.salaryHourDriver.add(obj.salaryChargeHourDriver).setScale(2, BigDecimal.ROUND_HALF_UP);


            obj.amortizationHourMachine = obj.amortizationYearMachine.divide(monthCount, 2, BigDecimal.ROUND_HALF_UP)
                                            .divide(obj.normWorkTimeMonth, 2, BigDecimal.ROUND_HALF_UP);
            obj.costTotalHourMachine = obj.amortizationHourMachine.add(obj.salaryHourDriver).setScale(2, BigDecimal.ROUND_HALF_UP)
                                        .add(obj.salaryChargeHourDriver).setScale(2, BigDecimal.ROUND_HALF_UP)
                                        .add(obj.fuelExpensesMachine).setScale(2, BigDecimal.ROUND_HALF_UP);
            dao.add(obj);
        }
    }

    public void calculateTransportUsageHourNotLicensed(int planCode) throws PersistenceException
    {
        BigDecimal monthCount = new BigDecimal(12);
        BigDecimal basicspeed;
        BigDecimal fuelcostnkre;
        BigDecimal rashodprobeg;
        int typetransport;


    	ENPlanWorkDAO pDAO = new ENPlanWorkDAO(connection, userProfile);
    	ENPlanWork2ClassificationTypeDAO pl2clTypeDao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
    	FINChargeHistoryDAO chargeHistoryDAO = new FINChargeHistoryDAO(connection, userProfile);

    	ENPlanWork plan = pDAO.getObject(planCode);

        BigDecimal chargePercent =  chargeHistoryDAO.getChargePercentByDate(FINChargeType.IS_NOT_INVALID, plan.dateStart).divide(new BigDecimal(100), 4, BigDecimal.ROUND_HALF_UP);




    	BigDecimal productionExpenses = null;
    	BigDecimal administrativeExpenses = null;
    	BigDecimal profitRate = null;
    	TKClassificationTypeDAO ctDAO = new TKClassificationTypeDAO(connection, userProfile);
    	ENPlanWork2ClassificationTypeShortList clList = pl2clTypeDao.getClassificationTypeListByPlanCode(planCode);
    	Set<BigDecimal> productionExpensesSet = new HashSet<BigDecimal>();
    	Set<BigDecimal> administrativeExpensesPercentSet = new HashSet<BigDecimal>();

    	if(clList.totalCount > 0) {
    		for(ENPlanWork2ClassificationTypeShort pl2cl : clList.getList()) {
    			productionExpensesSet.add(pl2cl.productionExpensesPercent);
    			if(pl2cl.administrativeExpensesPercent != null) {
    				administrativeExpensesPercentSet.add(pl2cl.administrativeExpensesPercent);
    			}
    			profitRate = ctDAO.getObject(pl2cl.classificationTypeRefCode).percentProfitRate.divide(new BigDecimal(100)).setScale(2, BigDecimal.ROUND_HALF_UP);
    		}
    		if(productionExpensesSet.size() != 1) {
    			throw new SystemException("������� � ���������� �������� ���������� ������ �� �������������");
    		}
    		if(administrativeExpensesPercentSet.size() > 1) {
    			throw new SystemException("������� � ���������� �������� ������������� ������ �� �������������");
    		}
    		productionExpenses = productionExpensesSet.iterator().next().divide(new BigDecimal(100)).setScale(2, BigDecimal.ROUND_HALF_UP);
    		if(administrativeExpensesPercentSet.size() > 0)
    			administrativeExpenses = administrativeExpensesPercentSet.iterator().next().divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);
    	}

    	if(productionExpenses == null) {
    		throw new SystemException("������� � ���������� �������� ���������� ������ �� �������������");
    	}
    	if(administrativeExpenses == null) {
    		administrativeExpenses = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
    	}

    	if(profitRate == null) {
    		throw new SystemException("������� � ���������� �������� �������� �� �������������");
    	}



        ENCalcTransportUsageHourDAO dao = new ENCalcTransportUsageHourDAO(connection, userProfile);
        ENCalcTransportUsageHourFilter f = new ENCalcTransportUsageHourFilter();

        f.planRef.code = planCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }

        ENCalcTransportUsageHourShortList dList = dao.getList4Calculation(planCode);
        for (int i=0; i < dList.totalCount; i++){
            ENCalcTransportUsageHour obj = new ENCalcTransportUsageHour();
            obj.planRef.code = planCode;


            ENCalcTransportUsageHourShort shortObj = dList.get(i);
            obj.tkTransportRef.code = shortObj.tkTransportRefCode;

            if (shortObj.amortizationYearMachine != null){
                obj.amortizationYearMachine = shortObj.amortizationYearMachine;
            }
            else{
                throw new EnergyproSystemException("�� ������� ���� ����������� �� ��������� " + shortObj.tkTransportRefName);
            }

            if (shortObj.salaryMonthDriver != null){
                obj.salaryMonthDriver = shortObj.salaryMonthDriver;
            }
            else{
                throw new EnergyproSystemException("�� ������� �������� ����� ���� " + shortObj.tkTransportRefName);
            }

            basicspeed = shortObj.productionCosts;
            // NET-1864 � ����� ��� ������� ���� ��� �������������� ������ ����� ����� ��������� ������� �� ������� costnkre ����� costalternative
            fuelcostnkre = shortObj.costPerKilometer;
            rashodprobeg = shortObj.salaryTotalHourDriver;
            typetransport = shortObj.planRefMonthGen;

            obj.normWorkTimeMonth = shortObj.normWorkTimeMonth;
            obj.costMachine = shortObj.costMachine;
            obj.fuelExpensesMachine = shortObj.fuelExpensesMachine;

            obj.salaryHourDriver = obj.salaryMonthDriver.divide(obj.normWorkTimeMonth, 2 , BigDecimal.ROUND_HALF_UP);

            obj.salaryChargeHourDriver = obj.salaryHourDriver.multiply(chargePercent).setScale(2, BigDecimal.ROUND_HALF_UP);

            obj.salaryTotalHourDriver = obj.salaryHourDriver.add(obj.salaryChargeHourDriver).setScale(2, BigDecimal.ROUND_HALF_UP);

            // ��������� �������������������� ������
            obj.productionCosts = obj.salaryHourDriver.multiply(productionExpenses).setScale(2, BigDecimal.ROUND_HALF_UP);

            // SUPP-87969 ���������������� �������
            obj.administrativeCosts = obj.salaryHourDriver.multiply(administrativeExpenses).setScale(2, BigDecimal.ROUND_HALF_UP);

            obj.amortizationHourMachine = obj.amortizationYearMachine.divide(monthCount, 2, BigDecimal.ROUND_HALF_UP)
                                            .divide(obj.normWorkTimeMonth, 2, BigDecimal.ROUND_HALF_UP);

            obj.annualRepairCostsPercent = shortObj.annualRepairCostsPercent;

            obj.annualRepairCosts = (obj.annualRepairCostsPercent == null ? BigDecimal.ZERO : obj.annualRepairCostsPercent)
            		.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP)
            		.multiply(obj.costMachine).setScale(2, BigDecimal.ROUND_HALF_UP);

            obj.repairCostsPerHour = ((obj.annualRepairCosts == null) ? BigDecimal.ZERO : obj.annualRepairCosts)
            		.divide(monthCount, 2, BigDecimal.ROUND_HALF_UP)
                    .divide(obj.normWorkTimeMonth, 2, BigDecimal.ROUND_HALF_UP);


            obj.costTotalHourMachine = obj.amortizationHourMachine.add(obj.salaryHourDriver).setScale(2, BigDecimal.ROUND_HALF_UP)
                                        .add(obj.salaryChargeHourDriver).setScale(2, BigDecimal.ROUND_HALF_UP)
                                        .add(obj.fuelExpensesMachine).setScale(2, BigDecimal.ROUND_HALF_UP)
                                        .add(obj.productionCosts).setScale(2, BigDecimal.ROUND_HALF_UP)
                                        .add(obj.administrativeCosts).setScale(2, BigDecimal.ROUND_HALF_UP)
            							.add(obj.repairCostsPerHour).setScale(2, BigDecimal.ROUND_HALF_UP);

            obj.profitRate = obj.costTotalHourMachine.multiply(profitRate).setScale(2, BigDecimal.ROUND_HALF_UP);


            /*  ��������� �����,  ����. ��������, ��������, ��������� */
            if (typetransport == TKTransportType.TRACTORTRAILER || typetransport == TKTransportType.BOARD || typetransport == TKTransportType.TRUCK){
                obj.costPerKilometer =  (rashodprobeg.divide(new BigDecimal(100), 10 , BigDecimal.ROUND_HALF_UP).multiply(fuelcostnkre)).setScale(2, BigDecimal.ROUND_HALF_UP);
                obj.commentPerKilometer = " ����� �� ����� = " + rashodprobeg.toString() + "[������� ������ �� 100��]"+"/" + new BigDecimal(100).toString() + "*"
                + fuelcostnkre.toString() + "[������� ���� ������]" + " = " + obj.costPerKilometer.toString(); ;
            /*SUPP-48476 ��������� ���������� ������ ������ ������� ��� �������� ��� � ������� �� �������*/
            } else if (typetransport == TKTransportType.BUS || typetransport == 8) {
            	obj.costPerKilometer =  (rashodprobeg.divide(new BigDecimal(100), 10 , BigDecimal.ROUND_HALF_UP).multiply(fuelcostnkre)).setScale(2, BigDecimal.ROUND_HALF_UP);
                obj.commentPerKilometer = " ����� �� ����� = " + rashodprobeg.toString() + "[������� ������ �� 100��]"+"/" + new BigDecimal(100).toString() + "*"
                + fuelcostnkre.toString() + "[������� ���� ������]";
                obj.costPerKilometer = obj.costPerKilometer.add((((obj.costTotalHourMachine.add(obj.profitRate)).divide(basicspeed, 10 , BigDecimal.ROUND_HALF_UP))).setScale(2, BigDecimal.ROUND_HALF_UP));
                obj.commentPerKilometer = " ����� �� ����� = " + rashodprobeg.toString() + "[������� ������ �� 100��]"+"/" + new BigDecimal(100).toString() + "*"
                + fuelcostnkre.toString() + "[������� ���� ������]";
                obj.commentPerKilometer += " + (" + obj.costTotalHourMachine.toString() + "[������� 1 ���.���. �.�5]" + " + "+ obj.profitRate.toString() + "[" + profitRate.multiply(new BigDecimal(100)).toString() + "% �� ���� ������ �.�5] )" +
                                            "/" + basicspeed.toString() + "[���.�����.]" + " = " + obj.costPerKilometer.toString();
                                            ;
            } else
            /*{
                obj.costPerKilometer = (((obj.costTotalHourMachine.add(obj.profitRate)).divide(basicspeed,BigDecimal.ROUND_HALF_UP))
                            .add((rashodprobeg).divide(new BigDecimal(100),BigDecimal.ROUND_HALF_UP).multiply(fuelcostnkre))).setScale(2, BigDecimal.ROUND_HALF_UP);
            }*/
            {
            	if(basicspeed == null || basicspeed.compareTo(new BigDecimal(0)) == 0) {
            		throw new SystemException("������� ��� ����������: �� ����� ������ �� ������ ������ ��������");
            	}
                obj.costPerKilometer = (((obj.costTotalHourMachine.add(obj.profitRate)).divide(basicspeed, 10 , BigDecimal.ROUND_HALF_UP))).setScale(2, BigDecimal.ROUND_HALF_UP);
                obj.commentPerKilometer = " ����� �� ����� = (" + obj.costTotalHourMachine.toString() + "[������� 1 ���.���. �.�5]" + " + "+ obj.profitRate.toString() + "[" + profitRate.multiply(new BigDecimal(100)).toString() + "% �� ���� ������ �.�5] )" +
                                            "/" + basicspeed.toString() + "[���.�����.]" + " = " + obj.costPerKilometer.toString();
                                            ;
            }
            dao.add(obj);
        }
    }



    public void calculateHumenDelivery(int planCode, int classificationCode, int plan2classificationCode) throws PersistenceException
    {
        //BigDecimal avgSpeed = new BigDecimal(45);

        ENCalcHumenDeliveryDAO dao = new ENCalcHumenDeliveryDAO(connection, userProfile);
        ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
        HumenLogic hLogic = new HumenLogic(connection, userProfile);

        ENPlanWork plan = planDao.getObjectNoRefNoSegr(planCode);


        ENCalcHumenDeliveryFilter f = new ENCalcHumenDeliveryFilter();
        f.planRef.code = planCode;
        f.plan2CTypeRef.code = plan2classificationCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }

        ENCalcHumenDeliveryShortList dList = dao.getList4Calculation(plan2classificationCode);
        for (int i=0; i < dList.totalCount; i++){
            ENCalcHumenDelivery obj = new ENCalcHumenDelivery();
            obj.planRef.code = planCode;
            obj.plan2CTypeRef.code = plan2classificationCode;

            ENCalcHumenDeliveryShort shortObj = dList.get(i);
            obj.numberGen = shortObj.numberGen;
            obj.classificationTypeNumber = shortObj.classificationTypeNumber;

            obj.priceHour = shortObj.priceHour;
            // ���� ����� �� �������� 45 ��/�
            obj.timeGen = shortObj.distance.divide(AVG_SPEED, 2, BigDecimal.ROUND_HALF_UP);
            obj.costGen = obj.priceHour.multiply(obj.timeGen).setScale(2, BigDecimal.ROUND_HALF_UP);


            BigDecimal chargePercent = hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID, plan.dateStart).divide(new BigDecimal(100), 4, BigDecimal.ROUND_HALF_UP);
            obj.chargeCostGen = obj.costGen.multiply(chargePercent).setScale(2, BigDecimal.ROUND_HALF_UP);

            obj.costTotal = obj.costGen.add(obj.chargeCostGen).setScale(2, BigDecimal.ROUND_HALF_UP);
            dao.add(obj);
        }
    }

    public void calculateMaterials(int planCode, int classificationCode, int plan2classificationCode, boolean onlyCounter) throws PersistenceException
    {

        ENCalcMaterialsUsageDAO dao = new ENCalcMaterialsUsageDAO(connection, userProfile);
        ENCalcMaterialsUsageFilter f = new ENCalcMaterialsUsageFilter();
        f.planRef.code = planCode;
        f.plan2CTypeRef.code = plan2classificationCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }

        ENCalcMaterialsUsageShortList mList = dao.getList4Calculation(plan2classificationCode, onlyCounter);
        for (int i=0; i < mList.totalCount; i++){
            ENCalcMaterialsUsage obj = new ENCalcMaterialsUsage();
            obj.planRef.code = planCode;
            obj.plan2CTypeRef.code = plan2classificationCode;
            ENCalcMaterialsUsageShort shortObj = mList.get(i);

            if (shortObj.priceGen == null)
            {
                throw new EnergyproSystemException("�� ������� ������� ���-�� " + shortObj.materialName);
            }

            obj.numberGen = shortObj.numberGen;
            obj.classificationTypeNumber = shortObj.classificationTypeNumber;

            obj.materialName = shortObj.materialName;
            obj.measureUnitName = shortObj.measureUnitName;

            obj.priceGen = shortObj.priceGen;
            obj.countGen = shortObj.countGen;
            obj.sumGen = obj.priceGen.multiply(obj.countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
            dao.add(obj);
        }
    }

    public void removeMaterials(int planCode, int plan2classificationCode) throws PersistenceException
    {
        ENCalcMaterialsUsageDAO dao = new ENCalcMaterialsUsageDAO(connection, userProfile);
        ENCalcMaterialsUsageFilter f = new ENCalcMaterialsUsageFilter();
        f.planRef.code = planCode;
        f.plan2CTypeRef.code = plan2classificationCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }
    }

    public void removeHumenDelivery(int planCode, int plan2classificationCode) throws PersistenceException
    {
        ENCalcHumenDeliveryDAO dao = new ENCalcHumenDeliveryDAO(connection, userProfile);
        ENCalcHumenDeliveryFilter f = new ENCalcHumenDeliveryFilter();
        f.planRef.code = planCode;
        f.plan2CTypeRef.code = plan2classificationCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }
    }

    public void removeCalcHumenSalary(int planCode, int plan2classificationCode) throws PersistenceException
    {
        ENCalcHumenSalaryDAO dao = new ENCalcHumenSalaryDAO(connection, userProfile);
        ENCalcHumenSalaryFilter f = new ENCalcHumenSalaryFilter();
        f.planRef.code = planCode;
        f.plan2CTypeRef.code = plan2classificationCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }
    }

    public void removeCost(int planCode, int plan2classificationCode) throws PersistenceException
    {
        ENCalcCostDAO dao = new ENCalcCostDAO(connection, userProfile);
        ENCalcCostFilter f = new ENCalcCostFilter();
        f.planRef.code = planCode;
        f.plan2CTypeRef.code = plan2classificationCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }
    }

    public void removeTotalCost(int planCode, int plan2classificationCode) throws PersistenceException
    {
        ENCalcTotalCostDAO dao = new ENCalcTotalCostDAO(connection, userProfile);
        ENCalcTotalCostFilter f = new ENCalcTotalCostFilter();
        f.planRef.code = planCode;
        f.plan2CTypeRef.code = plan2classificationCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }
    }


    public void removeTransportUsage(int planCode) throws PersistenceException
    {
        ENCalcTransportUsageDAO dao = new ENCalcTransportUsageDAO(connection, userProfile);
        ENCalcTransportUsageFilter f = new ENCalcTransportUsageFilter();
        f.planRef.code = planCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }
    }


    public void removeTransportUsageHour(int planCode) throws PersistenceException
    {
        ENCalcTransportUsageHourDAO dao = new ENCalcTransportUsageHourDAO(connection, userProfile);
        ENCalcTransportUsageHourFilter f = new ENCalcTransportUsageHourFilter();
        f.planRef.code = planCode;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }
    }


    public void removeCalculationsFromPlanByClassification(int planCode, int plan2classificationCode) throws PersistenceException
    {
        removeTransportUsage(planCode);
        removeTransportUsageHour(planCode);
        removeMaterials(planCode, plan2classificationCode);
        removeHumenDelivery(planCode, plan2classificationCode);
        removeCalcHumenSalary(planCode, plan2classificationCode);
        removeCost(planCode, plan2classificationCode);
        removeTotalCost(planCode, plan2classificationCode);
    }

    public void reCalculateCalcHumenSalary(int planCalcSingle, int planCalc) throws PersistenceException
    {

        // ������� ������ enplanwork2classfctntp �� ����������� ��������� � �����




        ENCalcHumenSalaryDAO dao = new ENCalcHumenSalaryDAO(connection, userProfile);
        ENCalcHumenSalaryFilter f = new ENCalcHumenSalaryFilter();
        f.planRef.code = planCalc;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }

        ENPlanWork2ClassificationTypeDAO p2cDAO = new ENPlanWork2ClassificationTypeDAO(connection , userProfile);


        ENCalcHumenSalaryDAO planCalcSingleDAO = new ENCalcHumenSalaryDAO(connection, userProfile);
        ENCalcHumenSalaryFilter planCalcSingleFilter = new ENCalcHumenSalaryFilter();
        planCalcSingleFilter.planRef.code = planCalcSingle;
        ENCalcHumenSalaryShortList dList = planCalcSingleDAO.getScrollableFilteredList(planCalcSingleFilter, 0, -1);
        for (int i=0; i < dList.totalCount; i++){
                // ��� ������ �� ������� ENPlanWork2ClassificationType ��� �� ������������ ��� �  ENCalcHumenSalary
                ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
                p2cFilter.planRef.code = planCalc;
                // p2cFilter.conditionSQL = " tkclassificationtype.code = " +
                //                           " (select p2c2.classificationtyperfcd /*��� ������������� �� ������ �� human ��������� �����������*/  " +
                    //                       " from enplanwork2classfctntp p2c2 " +
                        //                   " where p2c2.code = " +  dList.get(i).plan2CTypeRefCode + " )";

                p2cFilter.conditionSQL = " ENPLANWORK.CODE = " + planCalc +
                " and TKCLASSIFICATIONTYPE.CODE = ( select p2c.classificationtyperfcd from enplanwork2classfctntp p2c where "  +
                " p2c.code = " + dList.get(i).plan2CTypeRefCode + ")" ;
                ENPlanWork2ClassificationTypeShortList p2cList = p2cDAO.getScrollableFilteredList(p2cFilter, 0, -1);
                int p2ccode = Integer.MIN_VALUE;
                if ( p2cList.totalCount != 0 ) {
                p2ccode = p2cList.get(0).code;
                }

                // ��� ������������� �� ���������� �����  ��� ����������� ���-�� ����� �� ����� ������������� � ����� ��������


                // ����������� ����� �� ���� ������ ENPlanWork2ClassificationType �������  �� ������� ���� ��� ���������

                p2cFilter.code = p2ccode;
                p2cList = p2cDAO.getScrollableFilteredList(p2cFilter, 0, -1);
                BigDecimal countWork;
                if ( p2cList.totalCount != 0 ) {
                countWork = p2cList.get(0).countGen;
                }
                else {
                countWork = new BigDecimal(1);
                }

                //
            ENCalcHumenSalary obj = new ENCalcHumenSalary();
            obj.planRef.code = planCalc;
            obj.plan2CTypeRef.code = p2ccode ;

            ENCalcHumenSalaryShort shortObj = dList.get(i);


            obj.numberGen = shortObj.numberGen;
            obj.classificationTypeNumber = shortObj.classificationTypeNumber;
            obj.positionName = shortObj.positionName;
            obj.timeGenMonth = shortObj.timeGenMonth;
            obj.timeGen = shortObj.timeGen.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
            obj.salaryMonth = shortObj.salaryMonth;
            obj.priceHour = obj.salaryMonth.divide(obj.timeGenMonth, 2, BigDecimal.ROUND_HALF_UP);

            obj.salaryHour = shortObj.salaryHour.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
            obj.salaryBonus = shortObj.salaryBonus.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);

            // ��� �� ����� ;)
            obj.salaryTotalBonus = obj.salaryBonus;

            if(shortObj.salaryAdditional != null) {
            	obj.salaryAdditional = shortObj.salaryAdditional.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
            	obj.salaryTotalBonus = obj.salaryTotalBonus.add(obj.salaryAdditional);
            }
            if(shortObj.salaryPremium != null) {
            	obj.salaryPremium = shortObj.salaryPremium.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
            	obj.salaryTotalBonus = obj.salaryTotalBonus.add(obj.salaryPremium);
            }
            if(shortObj.salarySurcharge != null) {
            	obj.salarySurcharge = shortObj.salarySurcharge.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
            	obj.salaryTotalBonus = obj.salaryTotalBonus.add(obj.salarySurcharge);
            }

            obj.percentBonus = shortObj.percentBonus;
            obj.percentAdditional= shortObj.percentAdditional;
            obj.percentPremium = shortObj.percentPremium;
            obj.percentSurcharge = shortObj.percentSurcharge;

            obj.salaryTotal = shortObj.salaryTotal.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);

            obj.positionRef.code = shortObj.positionRefCode;

            planCalcSingleDAO.add(obj);
        }
    }


    public void recalculateMaterials(int planCalcSingle, int planCalc) throws PersistenceException
    {

        ENCalcMaterialsUsageDAO dao = new ENCalcMaterialsUsageDAO(connection, userProfile);
        ENCalcMaterialsUsageFilter f = new ENCalcMaterialsUsageFilter();
        f.planRef.code = planCalc;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }

        ENPlanWork2ClassificationTypeDAO p2cDAO = new ENPlanWork2ClassificationTypeDAO(connection , userProfile);


        ENCalcMaterialsUsageDAO calcMaterialsDAO = new ENCalcMaterialsUsageDAO(connection, userProfile);
        ENCalcMaterialsUsageFilter calcMaterialsFilter = new ENCalcMaterialsUsageFilter();
        calcMaterialsFilter.planRef.code = planCalcSingle;
        ENCalcMaterialsUsageShortList mList = calcMaterialsDAO.getScrollableFilteredList(calcMaterialsFilter, 0, -1);

        for (int i=0; i < mList.totalCount; i++){

//             ��� ������ �� ������� ENPlanWork2ClassificationType ��� �� ������������ ��� �  ENCalcMaterialsUsage
            ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
            p2cFilter.planRef.code = planCalc;
            p2cFilter.conditionSQL = " tkclassificationtype.code = " +
                                    " (select p2c2.classificationtyperfcd /*��� ������������� �� ������ �� human ��������� �����������*/  " +
                                    " from enplanwork2classfctntp p2c2 " +
                                    " where p2c2.code = " +  mList.get(i).plan2CTypeRefCode + " )";
            ENPlanWork2ClassificationTypeShortList p2cList = p2cDAO.getScrollableFilteredList(p2cFilter, 0, -1);
            int p2ccode = Integer.MIN_VALUE;
            if ( p2cList.totalCount != 0 ) {
            p2ccode = p2cList.get(0).code;
            }

            // ��� ������������� �� ���������� �����  ��� ����������� ���-�� ����� �� ����� ������������� � ����� ��������


            // ����������� ����� �� ���� ������ ENPlanWork2ClassificationType �������  �� ������� ���� ��� ���������

            p2cFilter.code = p2ccode;
            p2cList = p2cDAO.getScrollableFilteredList(p2cFilter, 0, -1);
            BigDecimal countWork;
            if ( p2cList.totalCount != 0 ) {
            countWork = p2cList.get(0).countGen;
            }
            else {
            countWork = new BigDecimal(1);
            }

            //
            ENCalcMaterialsUsage obj = new ENCalcMaterialsUsage();
            obj.planRef.code = planCalc;
            obj.plan2CTypeRef.code = p2ccode ;
            ENCalcMaterialsUsageShort shortObj = mList.get(i);

            if (shortObj.priceGen == null)
            {
                throw new EnergyproSystemException("�� ������� ������� ���-�� " + shortObj.materialName);
            }

            obj.numberGen = shortObj.numberGen;
            obj.classificationTypeNumber = shortObj.classificationTypeNumber;

            obj.materialName = shortObj.materialName;
            obj.measureUnitName = shortObj.measureUnitName;

            obj.priceGen = shortObj.priceGen;
            obj.countGen = (shortObj.countGen).multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
            obj.sumGen = obj.priceGen.multiply(obj.countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
            calcMaterialsDAO.add(obj);
        }
    }

    public void recalculateCost(int planCalcSingle, int planCalc) throws PersistenceException {
    	recalculateCost(planCalcSingle, planCalc, false);
    }

    public void recalculateCost(int planCalcSingle, int planCalc, boolean priconnections) throws PersistenceException
    {
    	ENServicesObject so = this.getServicesObjectByPlanCode(planCalc);
        ENCalcCostDAO dao = new ENCalcCostDAO(connection, userProfile);
        ENCalcCostFilter f = new ENCalcCostFilter();
        f.planRef.code = planCalc;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++)
        {
            dao.remove(arr[i]);
        }

        ENPlanWork2ClassificationTypeDAO p2cDAO = new ENPlanWork2ClassificationTypeDAO(connection , userProfile);
        TKClassificationTypeParamsOnDateDAO classificationTypeParamsOnDateDao = new TKClassificationTypeParamsOnDateDAO(connection, userProfile);


        ENCalcCostDAO calcCostDAO = new ENCalcCostDAO(connection, userProfile);
        ENCalcCostFilter calcCostFilter = new ENCalcCostFilter();
        calcCostFilter.planRef.code = planCalcSingle;
        ENCalcCostShortList calcCostList = calcCostDAO.getScrollableFilteredList(calcCostFilter, 0, -1);

        for (int i=0; i < calcCostList.totalCount; i++){


            ENCalcCostShort shortObj = calcCostList.get(i);

//             ��� ������ �� ������� ENPlanWork2ClassificationType ��� �� ������������ ��� �  ENCalcCost
            ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
            p2cFilter.planRef.code = planCalc;
            p2cFilter.conditionSQL = " tkclassificationtype.code = " +
                                    " (select p2c2.classificationtyperfcd /*��� ������������� �� ������ �� human ��������� �����������*/  " +
                                    " from enplanwork2classfctntp p2c2 " +
                                    " where p2c2.code = " +  shortObj.plan2CTypeRefCode + " )";
            ENPlanWork2ClassificationTypeShortList p2cList = p2cDAO.getScrollableFilteredList(p2cFilter, 0, -1);
            int p2ccode = Integer.MIN_VALUE;
            if ( p2cList.totalCount != 0 ) {
            p2ccode = p2cList.get(0).code;
            }

            ENPlanWork2ClassificationType p2cObj = p2cDAO.getObject(shortObj.plan2CTypeRefCode);

            Date paramsDate = (so.contractDateServices != null) ? so.contractDateServices : so.contractDate;
            TKClassificationTypeParamsOnDate classificationTypeParamsOnDate = classificationTypeParamsOnDateDao.getLast(paramsDate,
            		p2cObj.classificationTypeRef.code);

            if (classificationTypeParamsOnDate == null) {
	            // SUPP-89948 ��� ������������� � ������, ���� �� ���� �������� ���������� ���, ���� �� ������� ����
	        	if (priconnections) {
	        		paramsDate = new Date();
	                classificationTypeParamsOnDate = classificationTypeParamsOnDateDao.getLast(paramsDate,
	                		p2cObj.classificationTypeRef.code);
	            }
            }

            if (classificationTypeParamsOnDate == null) {
            	TKClassificationTypeDAO classificationTypeDao = new TKClassificationTypeDAO(connection, userProfile);
            	TKClassificationType classificationType = classificationTypeDao.getObject(p2cObj.classificationTypeRef.code);
            	throw new SystemException(String.format("��� ����������� %s �� �������� ��������� �� ���� %s"
            			, (classificationType != null ? "� " + classificationType.kod : "� ����� " + p2cObj.classificationTypeRef.code )
            			, Tools.dateFormatDefault.format(paramsDate)));
            }


            // ����������� ����� �� ���� ������ ENPlanWork2ClassificationType �������  �� ������� ���� ��� ���������

            p2cFilter.code = p2ccode;
            p2cList = p2cDAO.getScrollableFilteredList(p2cFilter, 0, -1);
            BigDecimal countWork;
            if ( p2cList.totalCount != 0 ) {
            countWork = p2cList.get(0).countGen;
            }
            else {
            countWork = new BigDecimal(1);
            }

        ENCalcCost obj = new ENCalcCost();
        obj.planRef.code = planCalc;
        obj.plan2CTypeRef.code = p2ccode;



        obj.salaryExpenses = shortObj.salaryExpenses.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
        obj.socialCharges = shortObj.socialCharges.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
        obj.directExpenses = shortObj.directExpenses.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
        obj.productionExpenses = shortObj.productionExpenses.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
        obj.totalExpenses = shortObj.totalExpenses.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
        obj.normIncome = shortObj.normIncome.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);

        if(classificationTypeParamsOnDate.limitedSum != null
        		&& classificationTypeParamsOnDate.limitedSum.compareTo(shortObj.calculationCost) == -1) {
            ENCalcCost calc1 = calcCostDAO.getObject(shortObj.code);
            calc1.calculationCost = classificationTypeParamsOnDate.limitedSum;
            calcCostDAO.save(calc1);
            obj.calculationCost = classificationTypeParamsOnDate.limitedSum.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);

        } else {
        	obj.calculationCost = shortObj.calculationCost.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
        }
        calcCostDAO.add(obj);
    }
    }

    public void recalculateTotalCost(int planCalcSingle, int planCalc) throws PersistenceException
    {
    	recalculateTotalCost(planCalcSingle, planCalc, false);
    }

    public void recalculateTotalCost(int planCalcSingle, int planCalc, boolean priconnections) throws PersistenceException
    {
    	BigDecimal zeroValue = new BigDecimal(0).setScale(2, BigDecimal.ROUND_HALF_UP);

        ENServicesObject so = this.getServicesObjectByPlanCode(planCalc);

    	ENStandardConstDAO standardConstDao = new ENStandardConstDAO(connection, userProfile);
    	BigDecimal nds = standardConstDao.getENStandardConstEntryOnDate(ENStandardConst.PDV, so.contractDate);
    	BigDecimal nds_koef = nds.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);

        ENCalcTotalCostDAO dao = new ENCalcTotalCostDAO(connection, userProfile);
        ENCalcTotalCostFilter f = new ENCalcTotalCostFilter();
        f.planRef.code = planCalc;
        int[] arr = dao.getFilteredCodeArray(f,0,-1);
        for (int i = 0; i < arr.length; i++) {
            dao.remove(arr[i]);
        }

        ENPlanWork2ClassificationTypeDAO p2cDAO = new ENPlanWork2ClassificationTypeDAO(connection , userProfile);
        ENCalcMaterialsUsageDAO calcMatUsageDAO = new ENCalcMaterialsUsageDAO(connection, userProfile);
        TKClassificationTypeParamsOnDateDAO classificationTypeParamsOnDateDao = new TKClassificationTypeParamsOnDateDAO(connection, userProfile);

        ENCalcTotalCostDAO calcTotalCostDAO = new ENCalcTotalCostDAO(connection, userProfile);
        ENCalcTotalCostFilter calcTotalCostFilter = new ENCalcTotalCostFilter();
        calcTotalCostFilter.planRef.code = planCalcSingle;
        ENCalcTotalCostShortList calcTotalCostList = calcTotalCostDAO.getScrollableFilteredList(calcTotalCostFilter, 0, -1);

        for (ENCalcTotalCostShort shortObj : calcTotalCostList.list) {

//             ��� ������ �� ������� ENPlanWork2ClassificationType ��� �� ������������ ��� �  ENCalcTotalCost
            ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
            p2cFilter.planRef.code = planCalc;
            p2cFilter.conditionSQL = " tkclassificationtype.code = " +
                                    " (select p2c2.classificationtyperfcd /*��� ������������� �� ������ �� human ��������� �����������*/  " +
                                    " from enplanwork2classfctntp p2c2 " +
                                    " where p2c2.code = " +  shortObj.plan2CTypeRefCode + " )";
            ENPlanWork2ClassificationTypeShortList p2cList = p2cDAO.getScrollableFilteredList(p2cFilter, 0, -1);
            int p2ccode = Integer.MIN_VALUE;
            if ( p2cList.totalCount != 0 ) {
            p2ccode = p2cList.get(0).code;
            }

            // ����������� ����� �� ���� ������ ENPlanWork2ClassificationType �������  �� ������� ���� ��� ���������
            p2cFilter.code = p2ccode;
            p2cList = p2cDAO.getScrollableFilteredList(p2cFilter, 0, -1);
            BigDecimal countWork;
            if ( p2cList.totalCount != 0 ) {
            	countWork = p2cList.get(0).countGen;
            }
            else {
            countWork = new BigDecimal(1);
            }

            ENPlanWork2ClassificationType p2cObj = p2cDAO.getObject(shortObj.plan2CTypeRefCode);


            /////////////////////////////////
            Date paramsDate = so.contractDateServices != null ? so.contractDateServices : so.contractDate;
            TKClassificationTypeParamsOnDate classificationTypeParamsOnDate = classificationTypeParamsOnDateDao.getLast(paramsDate,
            		p2cObj.classificationTypeRef.code);

            if (classificationTypeParamsOnDate == null) {
	            // SUPP-89948 ��� ������������� � ������, ���� �� ���� �������� ���������� ���, ���� �� ������� ����
	        	if (priconnections) {
	        		paramsDate = new Date();
	                classificationTypeParamsOnDate = classificationTypeParamsOnDateDao.getLast(paramsDate,
	                		p2cObj.classificationTypeRef.code);
	            }
            }

            if (classificationTypeParamsOnDate == null) {
            	TKClassificationTypeDAO classificationTypeDao = new TKClassificationTypeDAO(connection, userProfile);
            	TKClassificationType classificationType = classificationTypeDao.getObject(p2cObj.classificationTypeRef.code);
            	throw new SystemException(String.format("��� ����������� %s �� �������� ��������� �� ���� %s"
            			, (classificationType != null ? "� " + classificationType.kod : "� ����� " + p2cObj.classificationTypeRef.code )
            			, Tools.dateFormatDefault.format(paramsDate)));
            }
            /////////////////////////////////

        ENCalcTotalCost obj = new ENCalcTotalCost();
        obj.planRef.code = planCalc;
        obj.plan2CTypeRef.code = p2ccode;
        // �������� ���� ��� �������������� ������ � ����� � ��������� ����������� ������ 112 ���. (�� ��������� ���� �2005 )
        // �� ����� �������� ���������  �� ������������� ���� ���. � ��������� ����������� ��  ����� ������������� ����,
        // � � ����������� ������� ���������� �� ���-��

        // 18.07.2018 �������������� ������ ���������� �� ������������� ��������� �����
        if(classificationTypeParamsOnDate.limitedSum != null
        		&& classificationTypeParamsOnDate.limitedSum.compareTo(shortObj.calculationCost) == -1) {
            ENCalcTotalCost calcTotal1 =  calcTotalCostDAO.getObject(shortObj.code);
            calcTotal1.limitedSum = classificationTypeParamsOnDate.limitedSum;
            calcTotal1.calculationCost = classificationTypeParamsOnDate.limitedSum;
            obj.calculationCost = classificationTypeParamsOnDate.limitedSum.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
            obj.limitedSum = obj.calculationCost;

            calcTotal1.costWithoutVAT = calcTotal1.totalCost = calcTotal1.calculationCost.add(calcTotal1.materialExpenses).setScale(2, BigDecimal.ROUND_HALF_UP)
                    .add(calcTotal1.transportExpenses).setScale(2, BigDecimal.ROUND_HALF_UP)
                    .add(calcTotal1.deliveryCost).setScale(2, BigDecimal.ROUND_HALF_UP);

                // 25.06.2018 �� ����� �������� �� ��������� ����������� ������������ ���
                if(p2cList.totalCount != 0 && (p2cList.get(0).calcKindRefCode == TKCalcKind.NEW
                		|| p2cList.get(0).calcKindRefCode == TKCalcKind.NEW2)) {
                	calcTotal1.costVAT = calcTotal1.costWithoutVAT.multiply(nds_koef).setScale(2, BigDecimal.ROUND_HALF_UP);

                } else {
                	calcTotal1.costVAT =  new BigDecimal(0); // ��� ���������� �� ��� ����������� !!!
                }

                calcTotal1.totalCost = calcTotal1.costWithoutVAT.add(calcTotal1.costVAT);

                // �������� ��������� ��������
                calcTotalCostDAO.save(calcTotal1);

        } else {
        	// ����� ���� �� �������������� ������ ��� ����� �� ��������� ��������� ����� ������������� ����
        	obj.calculationCost = shortObj.calculationCost.multiply(countWork).setScale(2, BigDecimal.ROUND_HALF_UP);
        }


        // 25.06.2018 �� ����� �������� ������� ����������� ��������� � ������������ ������� (����� ��������) ��
        // ����������� � �����������

        // ������� �� ����� � ���� ������ ��������2������������ ����� �� ���������� � ����
        ENCalcMaterialsUsageFilter calcMatUsageFilter = new ENCalcMaterialsUsageFilter();
        calcMatUsageFilter.planRef.code = obj.planRef.code;
        calcMatUsageFilter.plan2CTypeRef.code = obj.plan2CTypeRef.code;
        ENCalcMaterialsUsageShortList calcMatUsageList = calcMatUsageDAO.getScrollableFilteredList(calcMatUsageFilter, 0, -1);
        BigDecimal varSumMaterialExpenses = new BigDecimal(0);
        if (calcMatUsageList.totalCount != 0 ) {
        	for (int s=0; s < calcMatUsageList.totalCount; s++){
            	varSumMaterialExpenses = varSumMaterialExpenses.add(calcMatUsageList.get(s).sumGen);
        	}
        }

        obj.materialExpenses = varSumMaterialExpenses;

        if(p2cList.totalCount != 0 && p2cList.get(0).calcKindRefCode == TKCalcKind.NEW) {
            obj.transportExpenses = zeroValue;
            obj.deliveryCost = zeroValue;
        } else {

            ENCalcTransportUsageDAO trDAO = new ENCalcTransportUsageDAO(connection, userProfile);
            obj.transportExpenses = trDAO.getCostTransportByPlan2ClassificationType(p2ccode);

            ENCalcHumenDeliveryDAO delDAO = new ENCalcHumenDeliveryDAO(connection, userProfile);
            obj.deliveryCost = delDAO.getCostDeliveryByPlan2ClassificationType(p2ccode);

        }

        obj.costWithoutVAT = obj.calculationCost.add(obj.materialExpenses).setScale(2, BigDecimal.ROUND_HALF_UP)
                                                .add(obj.transportExpenses).setScale(2, BigDecimal.ROUND_HALF_UP)
                                                .add(obj.deliveryCost).setScale(2, BigDecimal.ROUND_HALF_UP);

        // 25.06.2018 �� ����� �������� �� ��������� ����������� ������������ ���
        if(p2cList.totalCount != 0 && (p2cList.get(0).calcKindRefCode == TKCalcKind.NEW
        		|| p2cList.get(0).calcKindRefCode == TKCalcKind.NEW2)) {
        	obj.costVAT = obj.costWithoutVAT.multiply(nds_koef).setScale(2, BigDecimal.ROUND_HALF_UP);

        } else {
            obj.costVAT =  new BigDecimal(0); // ��� ���������� �� ��� ����������� !!!
        }

        obj.totalCost = obj.costWithoutVAT.add(obj.costVAT);

        calcTotalCostDAO.add(obj);
    }
    }

    public void removeServicesCost(ENServicesCost servicesCost) throws PersistenceException {
    	this.removeServicesCost(servicesCost, true, true);
    }

	/**
	 *
	 * NET-4572 ������� ������ ��������
	 *
	 * @param servicesCost ������ ������� {@link ENServicesCost}
	 * @param removeServicesCost {@code true} ������� ��� {@code false} ��� ����� {@link ENServicesCost}
	 * ��������� ������ ������ � ���� ������
	 * @throws PersistenceException
	 */
    public void removeServicesCost(ENServicesCost servicesCost, boolean removeServicesCost, boolean removeMaterials) throws PersistenceException {

    	if(removeServicesCost && !removeMaterials) {
    		// ������ ������� ������ � �������� ������ ���������
    		throw new SystemException("������� � ����������!");
    	}

    	ENServicesMaterialsDAO materialsDao = new ENServicesMaterialsDAO(connection, userProfile);
		ENServicesHumenSalaryDAO humenSalaryDao = new ENServicesHumenSalaryDAO(connection, userProfile);
		ENServicesTransportDAO transportDao = new ENServicesTransportDAO(connection, userProfile);
		ENServicesDeliveryDAO deliveryDao = new ENServicesDeliveryDAO(connection, userProfile);
		ENServicesCostDAO servicesCostDao = new ENServicesCostDAO(connection, userProfile);
		ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);

		ENServicesObject servicesObject = servicesObjectDao.getObject(servicesCost.servicesObjectRef.code);

		ENServicesCost servicesCostOld = servicesCostDao.getObject(servicesCost.code);

		if(servicesCostOld.planRef.code != Integer.MIN_VALUE) {
			ENServicesCostShort temp = servicesCostDao.getShortObject(servicesCost.code);
			throw new SystemException(String.format("��� ���������� ����������� � %s �� %s ��� ���������� ����!"
					+ "\n ��������� ���������!"
					, temp.tkClassificationTypeRefKod, Tools.dateFormatDefault.format(temp.dateGen)));
		}

		if(removeMaterials) materialsDao.removeByENServicesCost(servicesCost);
		humenSalaryDao.removeByENServicesCost(servicesCost);
		transportDao.removeByENServicesCost(servicesCost);
		deliveryDao.removeByENServicesCost(servicesCost);
		if(removeServicesCost) {
			servicesCostDao.remove(servicesCost.code);
			this.evaluateSumsByENServicesCost(servicesObject);
		}
    }

    /**
     *
     * ���������� ������ �������� � ����������� ��������� ��������� � ����������
     *
     * @param servicesCost ������ ������� {@link ENServicesCost}
     * @throws PersistenceException
     */
    public void evaluateServicesCost(ENServicesCost servicesCost) throws PersistenceException {

    	BigDecimal distance = null;

    	ENServicesTransportDAO servicesTransportDao = new ENServicesTransportDAO(connection, userProfile);

    	int[] transportCodes = servicesTransportDao.getArrayOfCodesByENServicesCost(servicesCost);

    	if(transportCodes.length > 0) {
    		ENServicesTransport servicesTransport = servicesTransportDao.getObject(transportCodes[0]);

    		distance = servicesTransport.distance;
    	}

    	this.evaluateServicesCost(servicesCost, distance, null);
    }

    /**
     *
     * ���������� ������ ��������
     *
     * @param servicesCost ������ ������� {@link ENServicesCost}
     * @param distance ��������� � ��
     * @param machineHoursQuantity ���-�� �����������
     * @throws PersistenceException
     */
    public void evaluateServicesCost(ENServicesCost servicesCost, BigDecimal distance
    		, BigDecimal machineHoursQuantity) throws PersistenceException {
    	this.evaluateServicesCost(servicesCost, distance, machineHoursQuantity, true);
    }

    /**
     *
     * ���������� ������ ��������
     *
     * @param servicesCost ������ ������� {@link ENServicesCost}
     * @param distance ��������� � ��
     * @param machineHoursQuantity ���-�� �����������
     * @param preserveMaterials ��������� ������� ������ �� ����������
     * @throws PersistenceException
     *
     * @return ��� ������� ������� {@link ENServicesCost}
     */
    public int evaluateServicesCost(ENServicesCost servicesCost, BigDecimal distance
    		, BigDecimal machineHoursQuantity, boolean preserveMaterials) throws PersistenceException {
    	// �������� �������� �� null � ������ ��������
    	if(servicesCost == null || servicesCost.tkCalcCostRef.code == Integer.MIN_VALUE
    			|| servicesCost.servicesObjectRef.code == Integer.MIN_VALUE
    			|| servicesCost.dateGen == null
    			|| servicesCost.countGen == null) {
    		throw new java.lang.NullPointerException();
    	}

    	int newServicesCostCode = Integer.MIN_VALUE;

    	BigDecimal zero = new BigDecimal(0).setScale(0, BigDecimal.ROUND_HALF_UP);

    	CalculationLogic calculationLogic = new CalculationLogic(connection, userProfile);

    	TKCalcCostDAO calcCostDao = new TKCalcCostDAO(connection, userProfile);

    	ENServicesCostDAO servicesCostDao = new ENServicesCostDAO(connection, userProfile);
    	ENServicesMaterialsDAO servicesMaterialsDao = new ENServicesMaterialsDAO(connection, userProfile);
    	ENServicesHumenSalaryDAO servicesHumenSalaryDao = new ENServicesHumenSalaryDAO(connection, userProfile);
    	ENServicesTransportDAO servicesTransportDao = new ENServicesTransportDAO(connection, userProfile);
    	ENServicesDeliveryDAO servicesDeliveryDao = new ENServicesDeliveryDAO(connection, userProfile);
    	TKClassificationTypeDAO classificationTypeDao = new TKClassificationTypeDAO(connection, userProfile);
    	ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);

    	TKCalcCost calcCost = calcCostDao.getObject(servicesCost.tkCalcCostRef.code);

    	TKClassificationType classificationType = classificationTypeDao.getObject(calcCost.classificationTypeRef.code);
    	ENServicesObject servicesObject = servicesObjectDao.getObject(servicesCost.servicesObjectRef.code);

    	if(servicesCost.code != Integer.MIN_VALUE) {

    		ENServicesCost servicesCostOld = servicesCostDao.getObject(servicesCost.code);

    		if(servicesCostOld.planRef.code != Integer.MIN_VALUE) {
    			ENServicesCostShort temp = servicesCostDao.getShortObject(servicesCost.code);
    			throw new SystemException(String.format("��� ���������� ����������� � %s �� %s ��� ���������� ����!"
    					+ "\n ���� ���������� ���������!"
    					, temp.tkClassificationTypeRefKod, Tools.dateFormatDefault.format(temp.dateGen)));
    		}

    		removeServicesCost(servicesCost, false, !preserveMaterials);
    	} else {
    		if(preserveMaterials) {
    			// ������ ��������� ������ �� ���������� ���� ������ ����� � �� ����
    			// ��� ������� ���������
    			throw new SystemException("������� � ����������!");
    		}
    	}

    	// ��������, ��� � ���� ������� �� ������� ������������ � �������������� ������
    	int[] servicesCostCodes = servicesCostDao.getCodesbyENServicesObjectRef(servicesCost.servicesObjectRef);

    	/* ������ �� ���� ��������, ���� ����� ������ ������ ����������� ���������!?
    	 * �� �������� � �����������, � ������� ����������� ��� ������, ������ ������� �� ���� �����...
    	for(int servicesCostCode : servicesCostCodes) {
    		ENServicesCost servicesCostTemp = servicesCostDao.getObject(servicesCostCode);
    		TKCalcCost calcCostTemp = calcCostDao.getObject(servicesCostTemp.tkCalcCostRef.code);
    		TKClassificationType clsTypeTemp = classificationTypeDao.getObject(calcCostTemp.classificationTypeRef.code);

    		boolean clsTypeIsLicensed = clsTypeTemp.isnotlicensedactivity == TKConsts.ISNOTLICENSEDACTIVITY_NKRE;
    		boolean classificationTypeIsLicensed = classificationType.isnotlicensedactivity == TKConsts.ISNOTLICENSEDACTIVITY_NKRE;

    		if(clsTypeIsLicensed != classificationTypeIsLicensed) {
    			throw new SystemException("��������� �������� � ���� ������ ��������� �� ����������� ������!");
    		}
    	}
    	*/
    	if(servicesCostCodes.length > 0) {
    		ENServicesCost servicesCostTemp = servicesCostDao.getObject(servicesCostCodes[0]);
    		TKCalcCost calcCostTemp = calcCostDao.getObject(servicesCostTemp.tkCalcCostRef.code);
    		TKClassificationType clsTypeTemp = classificationTypeDao.getObject(calcCostTemp.classificationTypeRef.code);

    		boolean clsTypeIsLicensed = clsTypeTemp.isnotlicensedactivity == TKConsts.ISNOTLICENSEDACTIVITY_NKRE;
    		boolean classificationTypeIsLicensed = classificationType.isnotlicensedactivity == TKConsts.ISNOTLICENSEDACTIVITY_NKRE;

    		if(clsTypeIsLicensed != classificationTypeIsLicensed) {
    			throw new SystemException("��������� �������� � ���� ������ ��������� �� ����������� ������!");
    		}
    	}

    	calcCost.multiplier = servicesCost.countGen;

    	BigDecimal sumMaterials = (preserveMaterials) ? servicesMaterialsDao.getSumByENServicesCost(servicesCost) : null;

    	calculationLogic.evaluateCalculation(calcCost, distance, machineHoursQuantity, sumMaterials);

    	// ����������� ��� � ������ ��� �������� ����� �������
    	servicesCost.materialExpenses = calcCost.materialExpenses;
    	servicesCost.transportExpenses = calcCost.transportExpenses;
    	servicesCost.deliveryCost = calcCost.deliveryCost;
    	servicesCost.salaryExpenses = calcCost.salaryExpenses;
    	servicesCost.socialCharges = calcCost.socialCharges;
    	servicesCost.directExpenses = calcCost.directExpenses;
    	servicesCost.productionExpenses = calcCost.productionExpenses;
    	servicesCost.totalExpenses = calcCost.totalExpenses;
    	servicesCost.normIncome = calcCost.normIncome;
    	servicesCost.calculationCost = calcCost.calculationCost;
    	servicesCost.costWithoutVAT = calcCost.costWithoutVAT;
    	servicesCost.costVAT = calcCost.costVAT;
    	servicesCost.costWithVAT = calcCost.costWithVAT;

    	if(servicesCost.code == Integer.MIN_VALUE) {
    		newServicesCostCode = servicesCostDao.add(servicesCost);
    	} else {
    		newServicesCostCode = servicesCost.code;
    		servicesCostDao.save(servicesCost);
    	}

    	// ����������� ����������
    	if(!preserveMaterials) {
        	for(TKCalcMaterials calcMaterial : calcCost.materials) {
        		ENServicesMaterials servicesMaterial = new ENServicesMaterials();
        		servicesMaterial.countGen = calcMaterial.countGen;
        		servicesMaterial.sumGen = calcMaterial.sumGen;
        		servicesMaterial.servicesCostRef.code = servicesCost.code;
        		servicesMaterial.calcMaterialsRef.code = calcMaterial.code;
        		servicesMaterial.priceGen = calcMaterial.priceGen;
        		servicesMaterial.materialRef.code = calcMaterial.materialRef.code;
        		servicesMaterial.materialName = calcMaterial.materialName;
        		servicesMaterial.measureUnitName = calcMaterial.measureUnitName;

        		servicesMaterialsDao.add(servicesMaterial);
        	}
    	}

    	for(TKCalcHumenSalary calcHumenSalary : calcCost.humenSalaries) {

    		ENServicesHumenSalary servicesHumenSalary = new ENServicesHumenSalary();
    		servicesHumenSalary.timeGen = calcHumenSalary.timeGen;
    		servicesHumenSalary.salary = calcHumenSalary.salary;
    		servicesHumenSalary.salaryBonus = calcHumenSalary.salaryBonus;
    		servicesHumenSalary.salarySurcharge = calcHumenSalary.salarySurcharge;
    		servicesHumenSalary.salaryPremium = calcHumenSalary.salaryPremium;
    		servicesHumenSalary.salaryAdditional = calcHumenSalary.salaryAdditional;
    		servicesHumenSalary.salaryTotalBonus = calcHumenSalary.salaryTotalBonus;
    		servicesHumenSalary.salaryTotal = calcHumenSalary.salaryTotal;
    		servicesHumenSalary.servicesCostRef.code = servicesCost.code;
    		servicesHumenSalary.calcHumenSalaryRef.code = calcHumenSalary.code;

    		servicesHumenSalaryDao.add(servicesHumenSalary);
    	}

    	boolean calculateDistance = !(distance == null || distance.compareTo(zero) == 0);
    	boolean calculateMachineHours = !(machineHoursQuantity == null || machineHoursQuantity.compareTo(zero) == 0);

    	// ���������� ���������� - ��������� ������������� ���������� ����������������� ������ �� �������� ���������
    	// � ���������� �����������
    	if(calculateDistance || calculateMachineHours) {
        	if(calcCost.transports.size() == 0) {
        		throw new SystemException(String.format("��� ����������� � %s � ���������� �� \"%s\" ���� ����������.\n"
        				+ "��������� ���������� ��������� ��� ������������. ��������� ��� ������ ��������� � ����������,\n"
        				+ " ��� �������� ���������� ��� ��������� �� ����������."
        				, calcCost.clsType.kod, Tools.dateFormatDefault.format(servicesCost.dateGen)));
        	}
    	}

    	if(calcCost.transports != null) {
        	for(TKCalcTransport calcTransport : calcCost.transports) {

        		ENServicesTransport servicesTransport = new ENServicesTransport();
        		servicesTransport.distance = (distance == null) ? zero : distance;
        		servicesTransport.machineHoursCount = calcTransport.machineHoursCount;
        		servicesTransport.costMachineHours = calcTransport.costMachineHours;
        		servicesTransport.costDistance = calcTransport.costDistance;
        		servicesTransport.costTotal = calcTransport.costTotal;
        		servicesTransport.servicesCostRef.code = servicesCost.code;
        		servicesTransport.calcTransportRef.code = calcTransport.code;
        		servicesTransportDao.add(servicesTransport);
        	}
    	}

    	if(calcCost.deliveries != null) {
    		for(TKCalcDelivery calcDelivery : calcCost.deliveries) {
    			ENServicesDelivery servicesDelivery = new ENServicesDelivery();
    			servicesDelivery.timeGen = calcDelivery.timeGen;
    			servicesDelivery.costGen = calcDelivery.costGen;
    			servicesDelivery.chargeCostGen = calcDelivery.chargeCostGen;
    			servicesDelivery.costTotal = calcDelivery.costTotal;
    			servicesDelivery.servicesCostRef.code = servicesCost.code;
    			servicesDelivery.calcDeliveryRef.code = calcDelivery.code;

    			servicesDeliveryDao.add(servicesDelivery);
    		}
    	}

    	this.evaluateSumsByENServicesCost(servicesObject);

    	return newServicesCostCode;
    }

    public void evaluateSumsByENServicesCost(ENServicesObject pServicesObject) throws PersistenceException {
    	ENServicesObjectDAO servicesObjectDao  = new ENServicesObjectDAO(connection, userProfile);
    	ENServices2CalcAdditionalItemsDAO additionalItemsDao = new ENServices2CalcAdditionalItemsDAO(connection, userProfile);
    	ENServicesCostDAO servicesCostDao = new ENServicesCostDAO(connection, userProfile);
    	FINMaterialsDAO finMatDao = new FINMaterialsDAO(connection, userProfile);
    	ENAdditionalAgreementDAO additionalAgreementDao = new ENAdditionalAgreementDAO(connection, userProfile);

    	ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();

    	ENServicesObject servicesObject = servicesObjectDao.getObject(pServicesObject.code);

    	servicesObjectRef.code = servicesObject.code;

		ENStandardConstDAO standardConstDao = new ENStandardConstDAO(connection, userProfile);
		BigDecimal vatCoeff = standardConstDao.getENStandardConstEntryOnDate(ENStandardConst.PDV, (servicesObject.contractDateServices == null
				? servicesObject.contractDate : servicesObject.contractDateServices));
		vatCoeff = vatCoeff.divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);

    	// ���������� ����� �� ��������, ���� ��� ����� �������, ��� ������������ ����� �� ������������
    	// ������ ����� ������� � �������� �������� ��� �������� ������������
    	if(servicesObject.calcSumsByCalculations != null && servicesObject.calcSumsByCalculations) {

    		BigDecimal sumWithoutVat = new BigDecimal(0).setScale(0, BigDecimal.ROUND_HALF_UP);
    		BigDecimal sumVat = sumWithoutVat;
    		int[] servicesCostCodesForSumRecalculation = servicesCostDao.getCodesbyENServicesObjectRef(servicesObjectRef);
    		for(int code : servicesCostCodesForSumRecalculation) {
    			ENServicesCost temp = servicesCostDao.getObject(code);
    			sumWithoutVat = sumWithoutVat.add(temp.costWithoutVAT);
    			sumVat = sumVat.add(temp.costVAT);
    		}
    		int[] additionalItemsForSumRecalculation = additionalItemsDao.getCodesbyENServicesObjectRef(servicesObjectRef);

    		for(int code : additionalItemsForSumRecalculation) {
    			ENServices2CalcAdditionalItems temp = additionalItemsDao.getObject(code);
    			if(temp.summa != null) {
        			sumWithoutVat = sumWithoutVat.add(temp.summa);
        			sumVat = sumVat.add(temp.summa.multiply(vatCoeff).setScale(2, BigDecimal.ROUND_HALF_UP));
    			}
    		}


    		// SUPP-80411 ������� ���������� ��������� �� ����� ��������
    		BigDecimal customerMaterialsSum = finMatDao.getSumOfCustomerMaterials(servicesObject);

    		if(customerMaterialsSum.compareTo(sumWithoutVat) == 1) {
    			throw new SystemException(String.format("���� ��� ��� �� ��������� � %s (%s ���.) ������ "
    					+ "�� ���� �������� ��������� ���������� (%s ���.)"
    					, servicesObject.contractNumberServices
    					, sumWithoutVat
    					, customerMaterialsSum));
    		}

    		BigDecimal customerMaterialsSumVAT = customerMaterialsSum.multiply(vatCoeff).setScale(2, BigDecimal.ROUND_HALF_UP);

    		sumWithoutVat = sumWithoutVat.subtract(customerMaterialsSum);
    		sumVat = sumVat.subtract(customerMaterialsSumVAT);

    		// SUPP-108388 ��-�� optimistic-locking ���������� ������ ��� ��� �����
    		servicesObject = servicesObjectDao.getObject(pServicesObject.code);
    		if(servicesObject.contractStatusRef.code == ENServicesContractStatus.GOOD
        			|| servicesObject.contractStatusRef.code == ENServicesContractStatus.BUDGETAPPROVED
        			|| (servicesObject.contractStatusRef.code == ENServicesContractStatus.SIGNED &&
        			    servicesObject.contractKindRef.code == ENServicesContractKind.SUPPLIER_CONTRACT)) {
        	    servicesObject.contractServicesSumma = sumWithoutVat;
        	    servicesObject.contractServicesSummaVAT = sumVat;
        		servicesObjectDao.save(servicesObject);
    		} else if(servicesObject.contractStatusRef.code == ENServicesContractStatus.SIGNED) {
    			ENAdditionalAgreementShortList additionalAgreementList = additionalAgreementDao.getList(servicesObject.code, null, false);
    			if(additionalAgreementList.totalCount == 0) {
    				throw new SystemException(String.format("������ � %s �� %s � ��������� �� ���� �������� ���������� ���� ��� ����� �������!\n"
    						+ " ��� ������ ��������� ��������, ��� ������� ��������� ����� ��� ��������� �����������!"
    						, servicesObject.contractNumberServices
    						, Tools.dateFormatDefault.format(servicesObject.contractDateServices)));
    			} else {
    				ENAdditionalAgreement additionalAgreement = additionalAgreementDao.getObject(additionalAgreementList.get(0).code);
    				additionalAgreement.sumWithoutVAT = sumWithoutVat;
    				additionalAgreement.sumVAT = sumVat;
    				additionalAgreementDao.save(additionalAgreement);
    			}

    		} else {
    			ENServicesContractStatusDAO contractStatusDao = new ENServicesContractStatusDAO(connection, userProfile);
    			ENServicesContractStatus contractStatus = contractStatusDao.getObject(servicesObject.contractStatusRef.code);
    			throw new SystemException(String.format("������� � ������!\n������ � %s �� %s �������� � ������ \"%s\"."
    					, servicesObject.contractNumberServices
    					, Tools.dateFormatDefault.format(servicesObject.contractDateServices)
    					, contractStatus.name));
    		}
    	}
    }

    /**
     *
     * �������� ����������� �� ����������� �/� �������� �� ������ �����
     * ������ �� ��������
     *
     * SUPP-84181
     *
     * @param servicesObject ��� �������� {@link ENServicesObject}
     * @return ����������� �� ����������� �/� �������� �� ������ ����� ������ �� ��������
     * @throws PersistenceException
     */
    public BigDecimal getCalculatedOverallSalaryDriver(ENServicesObject servicesObject) throws PersistenceException {
    	BigDecimal result = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);

    	ENPlanWork2ClassificationTypeDAO dao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
    	ENCalcTransportUsageHourDAO calcTransportUsageHourDao = new ENCalcTransportUsageHourDAO(connection, userProfile);
    	ENCalcTransportUsageDAO calcTransportUsageDao = new ENCalcTransportUsageDAO(connection, userProfile);

    	ENPlanWork2ClassificationTypeShortList list = dao.getListByElementCode(servicesObject.element.code
    			, ENPlanWorkKind.CALCULATION);

    	for(ENPlanWork2ClassificationTypeShort pw : list.list) {
    		ENCalcTransportUsageShortList calcTransportUsageList = calcTransportUsageDao.getListByPlan2ClassificationType(pw.code);

    		for(ENCalcTransportUsageShort transportUsage : calcTransportUsageList.list) {
        		ENCalcTransportUsageHourShortList calcTransportUsageHourList
        			= calcTransportUsageHourDao.getListByPlanAndTransportCode(pw.planRefCode, transportUsage.tkTransportRefCode);

        		if(calcTransportUsageHourList == null || calcTransportUsageHourList.totalCount == 0) {
        			throw new SystemException("������� ��� ���������� ������� �������� ����� ���� � �������� �� �������!");
        		}

        		BigDecimal countWorkHours = transportUsage.normMachineHours
        				.add(transportUsage.normDistance.divide(AVG_SPEED, 2, BigDecimal.ROUND_HALF_UP));

        		result = result.add(countWorkHours
        				.multiply(calcTransportUsageHourList.get(0).salaryTotalHourDriver)
        				.setScale(2, BigDecimal.ROUND_HALF_UP));
    		}


    	}

    	return result;
    }

}
