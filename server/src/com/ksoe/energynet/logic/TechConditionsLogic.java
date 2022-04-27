package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.ksoe.energynet.dataminer.ENActIncomeTechConditionsDAO;
import com.ksoe.energynet.dataminer.ENCalc2ConnectTariffDAO;
import com.ksoe.energynet.dataminer.ENCalcPowerReserveDAO;
import com.ksoe.energynet.dataminer.ENCalcPowerReserveItemDAO;
import com.ksoe.energynet.dataminer.ENConnectionTariffDAO;
import com.ksoe.energynet.dataminer.ENSO2NodeDAO;
import com.ksoe.energynet.dataminer.ENSOTechParamsDAO;
import com.ksoe.energynet.dataminer.ENSOValuesDAO;
import com.ksoe.energynet.dataminer.ENServicesObject2TechCondtnsServicesDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENStandardConstDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsObjectsDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.dataminer.ENUnitedGroup2TechCondServicesDAO;
import com.ksoe.energynet.ejb.ENUnitedGroup2TechCondServicesControllerEJB.groupType;
import com.ksoe.energynet.valueobject.ENActIncomeStatus;
import com.ksoe.energynet.valueobject.ENActIncomeTechConditions;
import com.ksoe.energynet.valueobject.ENCalc2ConnectTariff;
import com.ksoe.energynet.valueobject.ENCalcPowerReserve;
import com.ksoe.energynet.valueobject.ENCalcPowerReserveItem;
import com.ksoe.energynet.valueobject.ENConnectionKind;
import com.ksoe.energynet.valueobject.ENConnectionTariffType;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENSOTechParams;
import com.ksoe.energynet.valueobject.ENSOValuesType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENStandardConst;
import com.ksoe.energynet.valueobject.ENTechConditionsObjects;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices;
import com.ksoe.energynet.valueobject.filter.ENActIncomeTechConditionsFilter;
import com.ksoe.energynet.valueobject.filter.ENCalc2ConnectTariffFilter;
import com.ksoe.energynet.valueobject.filter.ENConnectionTariffFilter;
import com.ksoe.energynet.valueobject.filter.ENSO2NodeFilter;
import com.ksoe.energynet.valueobject.filter.ENSOTechParamsFilter;
import com.ksoe.energynet.valueobject.filter.ENSOValuesFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2TechCondtnsServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsObjectsFilter;
import com.ksoe.energynet.valueobject.filter.ENUnitedGroup2TechCondServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENCalc2ConnectTariffShortList;
import com.ksoe.energynet.valueobject.lists.ENConnectionTariffShortList;
import com.ksoe.energynet.valueobject.lists.ENSO2NodeShortList;
import com.ksoe.energynet.valueobject.references.*;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsObjectsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.netobjects.dataminer.ENFiderGuageDAO;
import com.ksoe.netobjects.valueobject.ENFiderGuage;

public class TechConditionsLogic extends LogicModule {

    public TechConditionsLogic(Connection connection, UserProfile userProfile) {
        super(connection, userProfile);
    }

    public static final String IDENT_TECH_CONDITION_OSR_CODE = "21";

    public void checkLines(ENUnitedGroup2TechCondServices object, int groupTypeCode) {
        try {
            ENTechConditionsServicesDAO tcsDao = new ENTechConditionsServicesDAO(connection, userProfile);
            ENUnitedGroup2TechCondServicesDAO objectDAO = new ENUnitedGroup2TechCondServicesDAO(connection, userProfile);
            ENUnitedGroup2TechCondServicesFilter linesFilter = new ENUnitedGroup2TechCondServicesFilter();
            int lineCode = Integer.MIN_VALUE;

            switch (groupTypeCode) {
            case groupType.unitedGroupL04D1 : {
                lineCode = tcsDao.getObject(object.techCondServRef.code).airLine04Ref.code;
                linesFilter.unitedGroupL04D1Ref.code = object.unitedGroupL04D1Ref.code;
                break;
            }
            case groupType.unitedGroupL04D2 : {
                lineCode = tcsDao.getObject(object.techCondServRef.code).airLine04Ref.code;
                linesFilter.unitedGroupL04D2Ref.code = object.unitedGroupL04D2Ref.code;
                break;
            }
            case groupType.unitedGroupL04D3 : {
                lineCode = tcsDao.getObject(object.techCondServRef.code).airLine04Ref.code;
                linesFilter.unitedGroupL04D3Ref.code = object.unitedGroupL04D3Ref.code;
                break;
            }

            case groupType.unitedGroupL10D1 : {
                lineCode = tcsDao.getObject(object.techCondServRef.code).airLine10Ref.code;
                linesFilter.unitedGroupL10D1Ref.code = object.unitedGroupL10D1Ref.code;
                break;
            }
            case groupType.unitedGroupL10D2 : {
                lineCode = tcsDao.getObject(object.techCondServRef.code).airLine10Ref.code;
                linesFilter.unitedGroupL10D2Ref.code = object.unitedGroupL10D2Ref.code;
                break;
            }
            case groupType.unitedGroupL10D3 : {
                lineCode = tcsDao.getObject(object.techCondServRef.code).airLine10Ref.code;
                linesFilter.unitedGroupL10D3Ref.code = object.unitedGroupL10D3Ref.code;
                break;
            }
            case groupType.unitedGroupL10D4 : {
                lineCode = tcsDao.getObject(object.techCondServRef.code).airLine10Ref.code;
                linesFilter.unitedGroupL10D4Ref.code = object.unitedGroupL10D4Ref.code;
                break;
            }
            }

            int linesArr[] = objectDAO.getFilteredCodeArray(linesFilter, 0, -1);
            for (int j = 0; j < linesArr.length; j++) {
                int tcsCode = objectDAO.getObject(linesArr[j]).techCondServRef.code;

                if (groupTypeCode == groupType.unitedGroupL04D1
                        || groupTypeCode == groupType.unitedGroupL04D2
                        || groupTypeCode == groupType.unitedGroupL04D3) {

                    if (lineCode != tcsDao.getObject(tcsCode).airLine04Ref.code) {
                        throw new EnergyproSystemException("\n"
                                + "\n ����� ������� ���������� �� �� ���� ��!!!");
                    }
                } else {
                    if (lineCode != tcsDao.getObject(tcsCode).airLine10Ref.code) {
                        throw new EnergyproSystemException("\n"
                                + "\n ����� ������� ���������� �� �� ���� ��!!!");
                    }
                }
            }

        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }
    }

    public void checkSubstations(ENUnitedGroup2TechCondServices object, int elementType) {
        try {
            ENTechConditionsServicesDAO tcsDao = new ENTechConditionsServicesDAO(connection, userProfile);
            ENUnitedGroup2TechCondServicesDAO objectDAO = new ENUnitedGroup2TechCondServicesDAO(connection, userProfile);

            if (elementType == ENElementType.SUBSTATION04) {

                int s04Code = tcsDao.getObject(object.techCondServRef.code).s04Ref.code;
                ENUnitedGroup2TechCondServicesFilter tp04Filter = new ENUnitedGroup2TechCondServicesFilter();
                tp04Filter.unitedGroupTP04Ref.code = object.unitedGroupTP04Ref.code;

                int tp04Arr[] = objectDAO.getFilteredCodeArray(tp04Filter, 0, -1);
                for (int j = 0; j < tp04Arr.length; j++) {
                    int tcsCode = objectDAO.getObject(tp04Arr[j]).techCondServRef.code;
                    if (s04Code != tcsDao.getObject(tcsCode).s04Ref.code) {
                        throw new EnergyproSystemException("\n"
                                + "\n ����� ������� ���������� �� �� ���� ���������!!!");
                    }
                }
            } else {
                int ps35Code = tcsDao.getObject(object.techCondServRef.code).s35Ref.code;
                ENUnitedGroup2TechCondServicesFilter ps35Filter = new ENUnitedGroup2TechCondServicesFilter();
                ps35Filter.unitedGroupPS35Ref.code = object.unitedGroupPS35Ref.code;

                int ps35Arr[] = objectDAO.getFilteredCodeArray(ps35Filter, 0, -1);
                for (int j = 0; j < ps35Arr.length; j++) {
                    int tcsCode = objectDAO.getObject(ps35Arr[j]).techCondServRef.code;
                    if (ps35Code != tcsDao.getObject(tcsCode).s35Ref.code) {
                        throw new EnergyproSystemException("\n"
                                + "\n ����� ������� ���������� �� �� ���� ���������!!!");
                    }
                }
            }

        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        }
    }

    /**
     *  ����������� ���� �������� �� ���������� �� ���� �������� �� ������
     *
     *  @param soCode - ��� �������� �� ������
     *  @return tcsCode - ��� �������� �� ����������
     *
     */
    public int getTechCodeBySoCode(int soCode) throws PersistenceException
    {
        int tcsCode = Integer.MIN_VALUE;
        ENServicesObject2TechCondtnsServicesDAO s2tDao = new ENServicesObject2TechCondtnsServicesDAO(connection, userProfile);
        ENServicesObject2TechCondtnsServicesFilter s2tFilter = new ENServicesObject2TechCondtnsServicesFilter();
        s2tFilter.servicesObjectRef.code = soCode;

        int s2tArr[] = s2tDao.getFilteredCodeArray(s2tFilter, 0, -1);
        if (s2tArr.length > 0) {
            tcsCode = s2tDao.getObject(s2tArr[0]).techCondServRef.code;
        }

        return tcsCode;
    }

	/**
	 *  ����������� ���� �������� �� ���������� �� ���� �������� �� ������
	 *
	 *  @param techCondObjCode - ��� ����������
	 *  @return soCode - ��� �������� �� ������
	 *
	 */
	public int getServicesCodeByTechCondObjCode(int techCondObjCode) throws PersistenceException
	{
		int soCode = Integer.MIN_VALUE;
		ENServicesObjectDAO sDao = new ENServicesObjectDAO(connection, userProfile);
		ENServicesObjectFilter sFilter = new ENServicesObjectFilter();
		sFilter.techConObjects.code = techCondObjCode;

		int sArr[] = sDao.getFilteredCodeArray(sFilter, 0, -1);
		if (sArr.length > 0) {
			soCode = sArr[0];
		}

		return soCode;
	}


	/**
	 *  ����������� ������ � ������ ����� �������������
	 *
	 *  @param soCode - ��� �������� �� ������
	 *
	 */
	public void calcTarif(int soCode) throws PersistenceException
	{

		ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection,userProfile);
		ENServicesObject soObj = soDAO.getObject(soCode);
		ENTechConditionsServicesDAO tcsDAO = new ENTechConditionsServicesDAO(connection, userProfile);
		ENSOValuesDAO valuesDao = new ENSOValuesDAO(connection, userProfile);


		/** SUPP-88624... +++ ����������� ������ �� ���� ���������... */
		// java.util.Date dateTY = techConObj.dateGen;

		/** ����������� ���� ��������� */
		Date controlDate = new Date(119,11,31);
		java.util.Date dateTY = null;

		ENSOValuesFilter valuesFilter =  new ENSOValuesFilter();
		valuesFilter.servicesobject.code = soCode;
		valuesFilter.soValuesType.code = ENSOValuesType.CONTRACT_REGISTRATION_DATE;

		int sArr[] = valuesDao.getFilteredCodeArray(valuesFilter, 0, -1);
		if (sArr.length > 0) {
			Date regDate = valuesDao.getObject(sArr[0]).dateVal;

			if (regDate == null) {
				throw new SystemException("\n\n"
						+ "��� ���������� ������� ��������� ��������� ���� ��������� ����� � ���������� ���������.");
			}

			if (regDate.after(controlDate)) {
				dateTY = regDate;
			} else {
				dateTY = controlDate;
			}

		} else {
			throw new SystemException("\n\n"
					+ "��� ���������� ������� ��������� ��������� ���� ��������� ����� � ���������� ���������.");
		}
		ENTechConditionsServices tcs = tcsDAO.getObject(this.getTechCodeBySoCode(soCode));

		int connectionKind = tcs.connectionKindRef.code;
		//int departmentCode = tcs.department.code;
		int departmentCode = soObj.techConObjects.department.code;


		if (connectionKind == ENConnectionKind.UNDEFINED) {
			throw new SystemException("�� ��������� ��� ���������!");
		}

		ENSOTechParamsDAO techParamDAO = new ENSOTechParamsDAO(connection,userProfile);
		ENSOTechParamsFilter techParamFilter =  new ENSOTechParamsFilter();
		ENSOTechParams techParam = new ENSOTechParams();
		techParamFilter.servicesobject.code = soObj.code;
		int[] techParamArr = techParamDAO.getFilteredCodeArray(techParamFilter, 0, -1);
		if (techParamArr.length > 0) {
			techParam = techParamDAO.getObject(techParamArr[0]);
		} else
		{
			throw new SystemException("��� ����� �������� �� ������� ������ ��������� ��� ����������!");
		}

		ENStandardConstDAO stDAO = new ENStandardConstDAO(connection,userProfile);

		// ��� ������������ ������������� ��������� ���� �����
		if (connectionKind == ENConnectionKind.STANDART || connectionKind == ENConnectionKind.NO_STANDART) {
			/// ������ ��� ������������ �������������
			tcs = this.getConnectionCost(dateTY,connectionKind,departmentCode,techParam.categoryRef,techParam.levelRef,
					techParam.powerPointRef,techParam.phasityRef,techParam.installationTypeRef,techParam.lineTypeRef,
					techParam.locationTypeRef,tcs.tyServicesPower,0,0,soCode);
			tcsDAO.save(tcs);
		}

		if (connectionKind == ENConnectionKind.READY_MADE)
		{
			tcs = this.getConnectionCost(dateTY,connectionKind,departmentCode,techParam.categoryRef,techParam.levelRef,
					techParam.powerPointRef,techParam.phasityRef,techParam.installationTypeRef,techParam.lineTypeRef,
					techParam.locationTypeRef,tcs.tyServicesPower,
					techParam.closestDistance == Integer.MIN_VALUE ? new Integer(0) : techParam.closestDistance,
					techParam.closestDistance2 == Integer.MIN_VALUE ? new Integer(0) : techParam.closestDistance2,
					soCode);
			tcsDAO.save(tcs);
		}

	}

	/**
	 *  ����������� ������ � ������ ����� �������������
	 *
	 *  @param regDate - ���� ���������
	 *  @param connectionKind - ��� ����������
	 *  @param departmentCode - �������������
	 *  @param categoryRef - �������� ��������
	 *  @param levelRef -  ������ ������
	 *  @param powerPointRef - ������ ������� � ����� ���������
	 *  @param phasityRef - ��� �������
	 *  @param installationTypeRef - ��� ���������������� ���������
	 *  @param lineTypeRef - ��� �� ���������
	 *  @param locationTypeRef - ������������ ����� ���������
	 *  @param tyServicesPower - ���������
	 *  @param closestDistance - �������
	 *  @param closestDistance2 - �������2
	 *  @param soCode - ��� �������� �� ������
	 *
	 */
	public ENTechConditionsServices getConnectionCost(Date regDate, int connectionKind, int departmentCode, ENPowerReliabilityCategoryRef categoryRef,
													  ENConnectionLevelRef levelRef, ENConnectionPowerPointRef powerPointRef, ENConnectionPhasityRef phasityRef,
													  ENConnectionInstallationTypeRef installationTypeRef, ENConnectionLineTypeRef lineTypeRef,
													  ENConnectionLocationTypeRef locationTypeRef, BigDecimal tyServicesPower,
													  int  closestDistance, int  closestDistance2, int soCode) throws PersistenceException
	{

		ENTechConditionsServicesDAO tcsDAO = new ENTechConditionsServicesDAO(connection, userProfile);
		ENSOTechParams techParam = new ENSOTechParams();
		ENTechConditionsServices tcs = new ENTechConditionsServices();

		if(soCode != Integer.MIN_VALUE){
			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection,userProfile);
			ENServicesObject soObj = soDAO.getObject(soCode);
			ENSOTechParamsDAO techParamDAO = new ENSOTechParamsDAO(connection,userProfile);
			ENSOTechParamsFilter techParamFilter =  new ENSOTechParamsFilter();
			techParamFilter.servicesobject.code = soObj.code;
			int[] techParamArr = techParamDAO.getFilteredCodeArray(techParamFilter, 0, -1);
			if (techParamArr.length > 0) {
				techParam = techParamDAO.getObject(techParamArr[0]);
			} else
			{
				throw new SystemException("��� ����� �������� �� ������� ������ ��������� ��� ����������!");
			}
			tcs = tcsDAO.getObject(this.getTechCodeBySoCode(soCode));
		}

		/** ����������� ���� ��������� */
		Date controlDate = new Date(119,11,31);
		java.util.Date dateTY = null;

		if (regDate == null) {
			throw new SystemException("\n\n"
					+ "��� ���������� ������� ��������� ��������� ���� ��������� ����� � ���������� ���������.");
		}

		if (regDate.after(controlDate)) {
			dateTY = regDate;
		} else {
			dateTY = controlDate;
		}

		if (connectionKind == ENConnectionKind.UNDEFINED) {
			throw new SystemException("�� ��������� ��� ���������!");
		}


		ENConnectionTariffDAO connTarDAO = new ENConnectionTariffDAO(connection, userProfile);
		ENConnectionTariffFilter connTarFilter = new ENConnectionTariffFilter();
		ENConnectionTariffFilter connTarLineFilter = new ENConnectionTariffFilter();

		if (connectionKind == ENConnectionKind.STANDART) {

			if ((categoryRef == null) || (categoryRef.code == Integer.MIN_VALUE)) {
				throw new SystemException("��� ���������� �������� �������� ��������!");
			}
			if ((levelRef == null) || (levelRef.code == Integer.MIN_VALUE)) {
				throw new SystemException("��� ���������� �������� ������ ������!");
			}
			if ((powerPointRef == null) || (powerPointRef.code == Integer.MIN_VALUE)) {
				throw new SystemException("��� ���������� �������� ������ ������� � ����� ���������!");
			}
			if ((phasityRef == null) || (phasityRef.code == Integer.MIN_VALUE)) {
				throw new SystemException("��� ���������� �������� ��� �������!");
			}

			connTarFilter.tarifTypeRef.code = ENConnectionTariffType.STANDART;
			connTarFilter.categoryRef.code = categoryRef.code;
			connTarFilter.levelRef.code = levelRef.code;
			connTarFilter.powerPointRef.code = powerPointRef.code;
			connTarFilter.phasityRef.code = phasityRef.code;
		}


		if (connectionKind == ENConnectionKind.NO_STANDART ||
				connectionKind == ENConnectionKind.READY_MADE) {

			if ((categoryRef == null) || (categoryRef.code == Integer.MIN_VALUE)) {
				throw new SystemException("��� ���������� �������� �������� ��������!");
			}
			if ((powerPointRef == null) || (powerPointRef.code == Integer.MIN_VALUE)) {
				throw new SystemException("��� ���������� �������� ������ ������� � ����� ���������!");
			}
			if ((installationTypeRef == null) || (installationTypeRef.code == Integer.MIN_VALUE)) {
				throw new SystemException("��� ���������� �������� ��� ���������������� ���������!");
			}

			connTarFilter.tarifTypeRef.code = ENConnectionTariffType.NO_STANDART;
			connTarFilter.categoryRef.code = categoryRef.code;
			connTarFilter.installationTypeRef.code = installationTypeRef.code;
			connTarFilter.powerPointRef.code = powerPointRef.code;
			connTarFilter.departmentRef.code = departmentCode;
		}

		/// �������� ��� ��������� ������
		if (connectionKind == ENConnectionKind.READY_MADE) {
			if ((lineTypeRef == null) || (lineTypeRef.code == Integer.MIN_VALUE)) {
				throw new SystemException("��� ���������� �������� ��� �� ���������!");
			}
			if ((powerPointRef == null) || (powerPointRef.code == Integer.MIN_VALUE)) {
				throw new SystemException("��� ���������� �������� ������ ������� � ����� ���������!");
			}
			if ((locationTypeRef == null) || (locationTypeRef.code == Integer.MIN_VALUE)) {
				throw new SystemException("��� ���������� �������� ������������ ����� ���������!");
			}

			connTarLineFilter.tarifTypeRef.code = ENConnectionTariffType.LINEAR;
			connTarLineFilter.locationTypeRef.code = locationTypeRef.code;
			connTarLineFilter.lineTypeRef.code = lineTypeRef.code;
			connTarLineFilter.powerPointRef.code = powerPointRef.code;

		}

		ENConnectionTariffShortList connTarList = connTarDAO.getScrollableFilteredList(connTarFilter, null, null,
				0, -1, null, dateTY);

		if (connTarList.totalCount <= 0) {
			throw new SystemException("�� ������� ���������� ����� ��� �������!");
		}

		if (connTarList.get(0).value == null) {
			throw new SystemException("�� ������� �������� ��� ������!");
		}

		ENStandardConstDAO stDAO = new ENStandardConstDAO(connection,userProfile);
		BigDecimal nds_val = stDAO.getENStandardConstEntryOnDate(ENStandardConst.PDV, dateTY, true).divide(new BigDecimal(100)).add(new BigDecimal(1));

		// ��� ������������ ������������� ��������� ���� �����
		if (connectionKind == ENConnectionKind.STANDART || connectionKind == ENConnectionKind.NO_STANDART) {
			/// ������ ��� ������������ �������������
			BigDecimal power = tyServicesPower;
			BigDecimal tarifEntry = connTarList.get(0).value.multiply(new BigDecimal(1000));
			BigDecimal summa = power.multiply(tarifEntry);
			if (connectionKind == ENConnectionKind.NO_STANDART) {
				BigDecimal calcSum = techParam.calculationSum == null ? new BigDecimal(0) : techParam.calculationSum;
				BigDecimal substSum = techParam.substationBuildSum == null ? new BigDecimal(0) : techParam.substationBuildSum;
				summa = summa.add(calcSum).add(substSum);
			}
			BigDecimal summaWithPDV = summa.multiply(nds_val);
			BigDecimal summaPDV = summaWithPDV.subtract(summa);
			tcs.tySummaGen = summaWithPDV;
			tcs.tySummaVat = summaPDV;
			tcs.tyServicesSumma = summaWithPDV;
			if (tcs.isSea == 1 || tcs.buildersArea == 1 || tcs.baseStation == 1)
			{
				tcs.tySummaGen = new BigDecimal(0);
				tcs.tySummaVat = new BigDecimal(0);
				tcs.tyServicesSumma = new BigDecimal(0);
			}
			tcs.tariffEntryRef.code = connTarList.get(0).tariffEntryCode;
			//tcsDAO.save(tcs);
		}

		if (connectionKind == ENConnectionKind.READY_MADE)
		{

			ENConnectionTariffShortList  connTarLineList = connTarDAO.getScrollableFilteredList(connTarLineFilter, null, null,0, -1, null, dateTY);
			if (connTarLineList.totalCount <= 0 && connectionKind == ENConnectionKind.READY_MADE) {
				throw new SystemException("�� ������� ���������� ����� ��� ������� �������� ������������!");
			}

			ENCalc2ConnectTariffDAO calc2tariffDAO = new ENCalc2ConnectTariffDAO(connection, userProfile);
			ENCalc2ConnectTariff calc2tariff = new ENCalc2ConnectTariff();
			calc2tariff.tariffEntry1Ref.code = connTarList.get(0).tariffEntryCode;
			calc2tariff.tariffEntry2Ref.code = connTarLineList.get(0).tariffEntryCode;
			calc2tariff.techCondServRef.code = tcs.code;
			calc2tariff.tariff1value = connTarList.get(0).value;
			calc2tariff.tariff2value = connTarLineList.get(0).value;

			BigDecimal power = tyServicesPower;
			int closestDistanceSum = closestDistance + closestDistance2;
			BigDecimal tarifEntry = connTarList.get(0).value.multiply(new BigDecimal(1000));
			BigDecimal tarifLineEntry = connTarLineList.get(0).value.multiply(new BigDecimal(1000));
			calc2tariff.summa1Tariff = power.multiply(tarifEntry);
			calc2tariff.summa2Tariff = new BigDecimal(closestDistanceSum).multiply(tarifLineEntry);
			BigDecimal summa = (power.multiply(tarifEntry)).add(new BigDecimal(closestDistanceSum).multiply(tarifLineEntry));
			calc2tariff.summaTotal = summa;
			BigDecimal summaWithPDV = summa.multiply(nds_val);
			BigDecimal summaPDV = summaWithPDV.subtract(summa);
			tcs.tySummaGen = summaWithPDV;
			tcs.tySummaVat = summaPDV;
			tcs.tyServicesSumma = summaWithPDV;
			tcs.isUse2Tariffs = 1;

			if (tcs.isSea == 1 || tcs.buildersArea == 1 || tcs.baseStation == 1)
			{
				tcs.tySummaGen = new BigDecimal(0);
				tcs.tySummaVat = new BigDecimal(0);
				tcs.tyServicesSumma = new BigDecimal(0);
			}
			//tcsDAO.save(tcs);
			if(tcs.code != Integer.MIN_VALUE) {
				calc2tariff.userGen = userProfile.userName;
				calc2tariff.dateEdit = new Date();

				ENCalc2ConnectTariffFilter c2tFilter = new ENCalc2ConnectTariffFilter();
				c2tFilter.techCondServRef.code = tcs.code;
				ENCalc2ConnectTariffShortList c2tList = calc2tariffDAO.getScrollableFilteredList(c2tFilter, 0, -1);
				if (c2tList.totalCount > 0) {
					calc2tariffDAO.remove(c2tList.get(0).code);
				}
				if (soCode != Integer.MIN_VALUE) {
					calc2tariffDAO.add(calc2tariff);
				}
			}

		}
		return tcs;
	}

    /**
     *  ��������� ����� ������� �������
     *
     *  @param powerReserveCode
     *
     */
    public void generatePowerReserveItems(int powerReserveCode) throws PersistenceException
    {

    	ENCalcPowerReserveDAO prDAO = new ENCalcPowerReserveDAO(connection,userProfile);
    	ENSO2NodeDAO s2nDAO = new ENSO2NodeDAO(connection, userProfile);
    	ENCalcPowerReserveItemDAO priDAO = new ENCalcPowerReserveItemDAO(connection, userProfile);
    	ENCalcPowerReserve prObj = prDAO.getObject(powerReserveCode);
    	ENFiderGuageDAO figDAO = new ENFiderGuageDAO(connection,userProfile);
    	ENFiderGuage figObj = figDAO.getObject(prObj.gaugeRef.code);

    	ENSO2NodeFilter s2nFilter = new ENSO2NodeFilter();
    	s2nFilter.conditionSQL = " ccnodecode in " +
                         " (select  nodewithallchildren_normal(coalesce(ced.code,-1)) " +
                         " from enfiderguage g, entransformer t " +
                         " left join ccelementdata ced on (t.elementcode = ced.elementcode ) " +
                         " where g.transformercode = t.code " +
                         " and g.code = " + prObj.gaugeRef.code + ")" +
                         " and servicesobjectcode <> " + prObj.servicesobjectRef.code;

    	ENSO2NodeShortList s2nList = s2nDAO.getScrollableFilteredList(s2nFilter, 0, -1);
    	for (int pr=0;pr<s2nList.totalCount;pr++) {
    		Date factConnDate = (s2nList.get(pr).fact_conn_date == null ? new Date() : s2nList.get(pr).fact_conn_date);
    		 if (factConnDate.after(figObj.dateGuage)) {
    		ENCalcPowerReserveItem prItem = new ENCalcPowerReserveItem();
    		prItem.calcPowerReserveRef.code = powerReserveCode;
    		prItem.so2nodeRef.code = s2nList.get(pr).code;
    		priDAO.add(prItem);
    		}
    	}

    	/// ������� ����������� �������� � ������� ���������� ������
    	s2nFilter = new ENSO2NodeFilter();
    	s2nFilter.servicesobject.code = prObj.servicesobjectRef.code;
    	s2nList = s2nDAO.getScrollableFilteredList(s2nFilter, 0, -1);

    	for (int spr=0;spr<s2nList.totalCount;spr++) {
    	ENCalcPowerReserveItem prItem = new ENCalcPowerReserveItem();
		prItem.calcPowerReserveRef.code = powerReserveCode;
		prItem.so2nodeRef.code = s2nList.get(spr).code;
		priDAO.add(prItem);
        }


    }


	/**
	 *  ��������� ����������� �������������� ����������
	 *
	 *  @param techConditionObjectCode - ��� ����������
	 *
	 */
	public void resetIdentNumber(int techConditionObjectCode) throws PersistenceException {
		if (techConditionObjectCode == Integer.MIN_VALUE) {
			throw new SystemException("�� ������� ��� �������!");
		}

		ENTechConditionsObjectsDAO techConObjDAO = new ENTechConditionsObjectsDAO(connection, userProfile);
		ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
		ENTechConditionsObjects techConObj = techConObjDAO.getObject(techConditionObjectCode);
		int soCode = getServicesCodeByTechCondObjCode(techConditionObjectCode);
		if (soCode == Integer.MIN_VALUE) {
			throw new SystemException("�� �������� ������ �� �������!");
		}
		ENServicesObject soObj = soDAO.getObject(soCode);

		techConObj.identNumber = Integer.MIN_VALUE;
		techConObj.numberGen = soObj.contractNumberServices;
		techConObjDAO.save(techConObj);

	}

	/**
	 *  ��������� ����������� �������������� ����������
	 *
	 *  @param techConditionObjectCode - ��� ����������
	 *
	 */
	public void generateIdentNumber(int techConditionObjectCode) throws PersistenceException {
		if (techConditionObjectCode == Integer.MIN_VALUE) {
			throw new SystemException("�� ������� ��� �������!");
		}

		ENTechConditionsObjectsDAO techConObjDAO = new ENTechConditionsObjectsDAO(connection, userProfile);
		ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
		ENTechConditionsObjects techConObj = techConObjDAO.getObject(techConditionObjectCode);
		ENTechConditionsServicesDAO tcsDAO = new ENTechConditionsServicesDAO(connection, userProfile);

		if (techConObj.dateGen == null) {
			throw new SystemException("�� ������� ���� ������� ��� ���������� ��������������!");
		}

		int soCode = getServicesCodeByTechCondObjCode(techConditionObjectCode);
		if (soCode == Integer.MIN_VALUE) {
			throw new SystemException("�� �������� ������ �� �������!");
		}

		int tcsCode = getTechCodeBySoCode(soCode);
		if (tcsCode == Integer.MIN_VALUE) {
			throw new SystemException("�� �������� ������ �� ���������!");
		}

		ENServicesObject soObj = soDAO.getObject(soCode);
		ENTechConditionsServices tcsObj = tcsDAO.getObject(tcsCode);

		int connectionKind = tcsObj.connectionKindRef.code;

		if (connectionKind == ENConnectionKind.UNDEFINED ||
				connectionKind == ENConnectionKind.GENERAL_CONNECTION) {
			throw new SystemException("�� ��������� ��� ���������!");
		}

		ENSOTechParamsDAO techParamDAO = new ENSOTechParamsDAO(connection, userProfile);
		ENSOTechParamsFilter techParamFilter = new ENSOTechParamsFilter();
		ENSOTechParams techParam = new ENSOTechParams();
		techParamFilter.servicesobject.code = soObj.code;
		int[] techParamArr = techParamDAO.getFilteredCodeArray(techParamFilter, 0, -1);
		if (techParamArr.length > 0) {
			techParam = techParamDAO.getObject(techParamArr[0]);
		} else {
			throw new SystemException("��� ����� �������� �� ������� ������ ��������� ��� ��������� �������������� �������!");
		}

		String ident_1_2_symbols = "��";
		techConObj.identNumber = techConObjDAO.getFreeIdentNumber();
		String ident_3_8_symbols = String.format("%06d", techConObj.identNumber); // ���������� ����� ��
		String ident_9_14_symbols = String.format("%td", techConObj.dateGen).concat(String.format("%tm", techConObj.dateGen)).concat(String.format("%ty", techConObj.dateGen)); // ���� ������ ��


		if (techParam.installationTypeRef.code == Integer.MIN_VALUE) {
			throw new SystemException("\n\n"
					+ "�� ������� ��� ���������������� ���������!");
		}

		String ident_15_symbol = String.format("%d", techParam.installationTypeRef.code); // ��� ����������� ����� ���������:


		String ident_16_17_symbols = IDENT_TECH_CONDITION_OSR_CODE; // ���������� ����� ��� � ����� ����
		String ident_18_19_symbols = getDepartmentForIdentByDepartment(techConObj.department.code); // ���������� ������������ ������� ���
		String ident_20_symbol = getConnectionKindForIdentByConnectionKind(tcsObj.connectionKindRef.code); // ��� ���������

		String identNumber = "";
		identNumber = identNumber.concat(ident_1_2_symbols).concat(ident_3_8_symbols).concat(ident_9_14_symbols)
				.concat(ident_15_symbol).concat(ident_16_17_symbols).concat(ident_18_19_symbols).concat(ident_20_symbol);

		if (techConObj.dateChangeTU != null) {
			String ident_21_26_symbols = String.format("%td", techConObj.dateChangeTU).concat(String.format("%tm", techConObj.dateChangeTU)).concat(String.format("%ty", techConObj.dateChangeTU)); // ���� �������� ��� � ��
			String ident_27_symbol =  "2";
			identNumber = identNumber.concat(ident_21_26_symbols).concat(ident_27_symbol);
		} else {
			String ident_21_27_symbols = "0000001";
			identNumber = identNumber.concat(ident_21_27_symbols);
		}

		techConObj.numberGen = identNumber;
		techConObjDAO.save(techConObj);

	}



	public String getDepartmentForIdentByDepartment(int depCode) {
		String identDepartment = "00";
		switch(depCode){
			case 500000143 : identDepartment = "01"; break;
			case 500000145 : identDepartment = "02"; break;
			case 500000144 : identDepartment = "03"; break;
			case 500000285 : identDepartment = "04"; break;
			case 500000142 : identDepartment = "05"; break;
			case 500000146 : identDepartment = "06"; break;
			case 500000282 : identDepartment = "07"; break;
			case 500000147 : identDepartment = "08"; break;
			case 500000283 : identDepartment = "09"; break;
			case 500000286 : identDepartment = "10"; break;
			case 500000284 : identDepartment = "11"; break;
			case 500000281 : identDepartment = "12"; break;

			default: identDepartment = "00";
		}
		return identDepartment;
	}


	public String getConnectionKindForIdentByConnectionKind(int connectionKind) {

		String identConnectionKind = "0";

		switch (connectionKind) {
		case ENConnectionKind.STANDART:
			identConnectionKind = "1";
			break;
		case ENConnectionKind.NO_STANDART:
			identConnectionKind = "3";
			break;
		case ENConnectionKind.READY_MADE:
			identConnectionKind = "2";
			break;
		default:
			identConnectionKind = "0";
		}

		return identConnectionKind;
	}




    /**
     * �������� ������ ���.������� ��� �����
     *
     * @param filterObject
     * @return ENTechConditionsObjectsShortList
     */
	public ENTechConditionsObjectsShortList getPublicListTechConditions(ENTechConditionsObjectsFilter filterObject) {

		ENTechConditionsObjectsDAO techConditionsObjectsDao = new ENTechConditionsObjectsDAO(userProfile, connection);

		return techConditionsObjectsDao.getPublicListTechConditions(filterObject);
	}



	/**
	 *
	 * @param techCondServicesCode
	 */
	public void checkActIncone(int techCondServicesCode) {
		try {

			ENActIncomeTechConditionsDAO actIncomeTechConditionsDao = new ENActIncomeTechConditionsDAO(connection, userProfile);

			ENActIncomeTechConditionsFilter actIncomeTechConditionsFilter = new ENActIncomeTechConditionsFilter();
			actIncomeTechConditionsFilter.techCondServicesRef.code = techCondServicesCode;

			int[] actArr = actIncomeTechConditionsDao.getFilteredCodeArray(actIncomeTechConditionsFilter, 0, -1);
			for (int actCode : actArr) {

				ENActIncomeTechConditions actIncomeTechConditions = actIncomeTechConditionsDao.getObject(actCode);

				if (actIncomeTechConditions.statusRef.code != ENActIncomeStatus.GOOD) {

					throw new SystemException("\n\n"
							+ "���������� ��������� ����� �� ������ � ��������� �� ����� �������� �� ����� ����������� ��� ��������� ����!\n"
							+ "�� ���������� ����������� ��������� �� ���������� ����.\n"
							+ "����������� ��� �= " + actIncomeTechConditions.numbergen + " �� "
							+ new SimpleDateFormat("dd.MM.yyyy").format(actIncomeTechConditions.dategen).toString() + "�. ��� �� ��������.");
				}
			}

		} catch (Exception e) {
			throw new SystemException(e.getMessage(), e);
		}
	}



}