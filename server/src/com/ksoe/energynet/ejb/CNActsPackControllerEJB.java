
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for CNActsPack;
 *
 */

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.dataminer.DFPackDAO;
import com.ksoe.docflow.dataminer.DFServicesRegCurrentDAO;
import com.ksoe.docflow.logic.DocFlowLogic;
import com.ksoe.docflow.valueobject.DFInfoSources;
import com.ksoe.docflow.valueobject.DFMovement;
import com.ksoe.docflow.valueobject.DFPack;
import com.ksoe.docflow.valueobject.DFPackStatus;
import com.ksoe.docflow.valueobject.DFPackType;
import com.ksoe.docflow.valueobject.DFServicesRegCurrent;
import com.ksoe.docflow.valueobject.filter.DFServicesRegCurrentFilter;
import com.ksoe.docflow.valueobject.lists.DFServicesRegCurrentShortList;
import com.ksoe.energynet.ejb.generated.CNActsPackControllerEJBGen;
import com.ksoe.energynet.logic.CNLogic;
import com.ksoe.energynet.valueobject.CNActsPack;
import com.ksoe.energynet.valueobject.CNSubsystemType;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class CNActsPackControllerEJB extends
		CNActsPackControllerEJBGen {


	public CNActsPackControllerEJB() {
	}


	public int getCNDepartmentByDomain() {
		UserProfile profile = getUserProfile();
		String domain = profile.domainInfo.domain;
		int department = 0;

		if (domain.equals("root.blz")) {department = 1;
		} else if (domain.equals("root.ber")) {department = 2;
		} else if (domain.equals("root.ale")) {department = 3;
		} else if (domain.equals("root.vsp")) {department = 4;
		} else if (domain.equals("root.gp")) {department = 5;
		} else if (domain.equals("root.var")) {department = 6;
		} else if (domain.equals("root.sk")) {department = 7;
		} else if (domain.equals("root.cr")) {department = 8;
		} else if (domain.equals("root.hges")) {department = 9;
		} else if (domain.equals("root.lep")) {department = 10;
		} else if (domain.equals("root.gn")) {department = 12;
		} else if (domain.equals("root.gor")) {department = 15;
		} else if (domain.equals("root.iva")) {department = 14;
		} else if (domain.equals("root.kal")) {department = 16;
		} else if (domain.equals("root.kah")) {department = 16;
		} else if (domain.equals("root.nkah")) {department = 17;
		} else if (domain.equals("root.nt")) {department = 19;
		} else if (domain.equals("root.cha")) {department = 20;
		}
		return department;
	}

	public int getRegisterServiceStage(int dfPackCode) {
		int out = Integer.MIN_VALUE;
		try {
			CNLogic cnLogic = new CNLogic(
					getConnection(AuthorizationJNDINames.CN_DATASOURCE),
					getUserProfile());
			out = cnLogic.getStateByDFPackId(dfPackCode);
			return out;

		} catch (DatasourceConnectException e) {
			throw new SystemException("Нет связи с DocWokflow!", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	public String getRegisterServiceStageName(int dfPackCode) {
		String out = "";
		try {
			CNLogic cnLogic = new CNLogic(
					getConnection(AuthorizationJNDINames.CN_DATASOURCE),
					getUserProfile());
			out = cnLogic.getStateNameByDFPackId(dfPackCode);

			return out;

		} catch (DatasourceConnectException e) {
			throw new SystemException("Нет связи с DocWokflow!", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public void switchMovementForActs(int packCode, int nextState) {
		try {
			CNLogic cnLogic = new CNLogic(
					getConnection(AuthorizationJNDINames.CN_DATASOURCE),
					getUserProfile());

			int cnPackID = cnLogic.getCNPackIDByDFPackId(packCode);
			cnLogic.switchMovementForActs(cnPackID, nextState);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Нет связи с EnergyWokflow!", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public int createPack(DFPack pack, int eprenCode) {
		try {
			DFMovement movement = new DFMovement();
			movement.dateStart = pack.dateRegistration;
			movement.stateName = "Бланк выдан";
			//По состоянию на 1 августа 2017 г. коды РЭС в комплексах
			int id_ren = eprenCode; //WorkFlow и EnergyPro совпадают
			pack.typeRef.code = Integer.MIN_VALUE;

			DocFlowLogic docFlowLogic = new DocFlowLogic(
					getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE), getUserProfile());
					//pack.departmentRef.code = docFlowLogic
					//		.getDFDepartmentCodeByENDepartmentCode(pack.departmentRef.code, true);

		switch (id_ren) {
          case 1: //Белозерский РЭС
             {pack.departmentRef.code = 1;
			 break;}
          case 2: //Бериславский РЭС
             {pack.departmentRef.code = 2;
			 break;}
          case 3: //В.Александровский РЭС
             {pack.departmentRef.code = 3;
			 break;}
          case 4: //Высокопольский РЭС
             {pack.departmentRef.code = 6;
			 break;}
          case 5: //Голопристанский РЭС
             {pack.departmentRef.code = 8;
			 break;}
          case 6: //Н.Воронцовский РЭС
             {pack.departmentRef.code = 13;
			 break;}
          case 7: //Скадовский РЭС
             {pack.departmentRef.code = 17;
			 break;}
          case 8: //Олешковский РЭС
             {pack.departmentRef.code = 19;
			 break;}
          case 9: //ХГЭС
             {pack.departmentRef.code = 1;
			 break;}
          case 10: //В.Лепетихский РЭС
             {pack.departmentRef.code = 1;
			 break;}
          case 11: //В.Рогачикский РЭС
             {pack.departmentRef.code = 1;
			 break;}
          case 12: //Генический РЭС
             {pack.departmentRef.code = 7;
			 break;}
          case 13: //Горностаевский РЭС
             {pack.departmentRef.code = 12;
			 break;}
          case 14: //Ивановский РЭС
             {pack.departmentRef.code = 10;
			 break;}
          case 15: //Каланчакский РЭС
             {pack.departmentRef.code = 20;
			 break;}
          case 20: //Чаплынский РЭС
             {pack.departmentRef.code = 20;
			 break;}
          case 16: //Каховский РЭС
             {pack.departmentRef.code = 12;
			 break;}
          case 17: //Н.Каховский РЭС
             {pack.departmentRef.code = 14;
			 break;}
          case 19: //Н.Троицкий РЭС
             {pack.departmentRef.code = 16;
			 break;}
          case 1001: //Херсоноблэнерго
             {pack.departmentRef.code = 0;
			 break;}
          default:
             {pack.departmentRef.code = 0;
			 break;}
         }


		    pack.typeRef.code=DFPackType.ACTS_BILLING;
		    pack.customerName=pack.name;
		    pack.customerAddress=pack.name;
		    pack.infoSourcesRef.code=DFInfoSources.E;
		    pack.statusRef.code=DFPackStatus.ACTIVE;
		    //pack.servicesListRef.code=DFServicesList.BillingActs;
		    int dfPackCode=docFlowLogic.registerServiceStart(pack,movement);

		    CNLogic cnLogic = new CNLogic(getConnection(AuthorizationJNDINames.CN_DATASOURCE), getUserProfile());
		    CNActsPack cnPack=new CNActsPack();

		    cnPack.name=pack.name;
		    cnPack.blank_number=pack.name;
		    if (pack.organizationName.equals("Быт"))
		    {
		    //  cnPack.is_ksoe=0;
		      cnPack.status=1;
		    }
		    else
		    {
		     if (pack.organizationName.equals("Пром"))
		    {
		    //  cnPack.is_ksoe=0;
		      cnPack.status=0;
		    } else {
		    //  cnPack.is_ksoe=1;
		       cnPack.status=0;
		    }
		    }

		    cnPack.id_ren = id_ren;

		    cnPack.subsystemRef.code = CNSubsystemType.SS_ACTS;
		    cnPack.dfPackRef.code = dfPackCode;

		    /** без него пакет не отображается в клиенте... */
		    cnPack.id_pack_status = DFPackStatus.ACTIVE;


			cnLogic.addActsPackAndStartMovement(cnPack);

			return dfPackCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException("Нет связи с EnergyWokflow!", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public void savePack(DFPack pack, Date actDate, BigDecimal actSum) {
		try {

			DFPackDAO dfPackDAO = new DFPackDAO(
					getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE), getUserProfile());
			DFPack dfPackObj = dfPackDAO.getObject(pack.code);
			String blankNumber = dfPackObj.name;
			dfPackObj.customerName = pack.customerName;
			dfPackObj.customerAddress = pack.customerAddress;
			dfPackObj.customerPhone = pack.customerPhone;

			dfPackDAO.save(dfPackObj);

			DFServicesRegCurrentDAO regCurrentDAO = new DFServicesRegCurrentDAO(
					getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE), getUserProfile());
			DFServicesRegCurrentFilter regFilter = new DFServicesRegCurrentFilter();
			regFilter.packRef.code=pack.code;
			DFServicesRegCurrentShortList regList=regCurrentDAO.getScrollableFilteredList(regFilter, 0, -1);
			DFServicesRegCurrent serviceRegObj;
			for (int i=0; i < regList.totalCount; i++){
				serviceRegObj=regCurrentDAO.getObject(regList.get(i).code);
				serviceRegObj.customerName=pack.customerName;
				serviceRegObj.address=pack.customerAddress;
				serviceRegObj.phone=pack.customerPhone;
				regCurrentDAO.save(serviceRegObj);
			}


		    CNLogic cnLogic = new CNLogic(getConnection(AuthorizationJNDINames.CN_DATASOURCE), getUserProfile());
		    int idCNActsPack=cnLogic.getCNPackIDByDFPackId(pack.code);

			CNActsPack cnActsPack = new CNActsPack();
			cnActsPack.act_number = blankNumber;
			cnActsPack.act_number = blankNumber;
			cnActsPack.act_date = actDate;
			cnActsPack.act_sum = actSum;
			cnActsPack.code = idCNActsPack;
			cnActsPack.name = pack.customerName;
			cnActsPack.address_jur = pack.customerAddress;

		    /**
		     *  без него пакет не отображается в клиенте...
		     */
			cnActsPack.id_pack_status = DFPackStatus.ACTIVE;


			cnLogic.saveActsPack(cnActsPack);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Нет связи с EnergyWokflow!", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}




} // end of EJB Controller for CNActsPack