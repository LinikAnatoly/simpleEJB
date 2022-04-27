package com.ksoe.energynet.logic;

import java.rmi.RemoteException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.xml.ws.BindingProvider;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.Config;
import com.ksoe.energynet.dataminer.ENGeneralContractsDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENSizObjectDAO;
import com.ksoe.energynet.dataminer.FINContractsDAO;
import com.ksoe.energynet.ejb.ENPlanWorkController;
import com.ksoe.energynet.ejb.ENPlanWorkControllerHome;
import com.ksoe.energynet.valueobject.ENGeneralContracts;
import com.ksoe.energynet.valueobject.FINContracts;
import com.ksoe.energynet.valueobject.brief.ENServicesObjectShort;
import com.ksoe.energynet.valueobject.filter.ENGeneralContractsFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.mdax.services.custvendservice.CustFinder;
import com.ksoe.mdax.services.custvendservice.VendFinder;
import com.ksoe.mdax.services.rcontracttableksservice.AXContractFinder;
import com.ksoe.mdax.util.WebServicesConsts;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.dataminer.RQOrgRschetDAO;
import com.ksoe.rqorder.valueobject.RQOrg;
import com.ksoe.rqorder.valueobject.RQOrgRschet;
import com.ksoe.rqorder.valueobject.filter.RQOrgFilter;
import com.ksoe.rqorder.valueobject.filter.RQOrgRschetFilter;
import com.ksoe.rqorder.valueobject.lists.RQOrgRschetShortList;
import com.ksoe.rqorder.valueobject.lists.RQOrgShortList;
import com.microsoft.schemas.dynamics._2006._02.documents.querycriteria.Operator;
import com.microsoft.schemas.dynamics._2008._01.documents.rcontracttablecreateks.AxdEnumCustVendRContractTypeUA;
import com.microsoft.schemas.dynamics._2008._01.services.CustomerService;
import com.microsoft.schemas.dynamics._2008._01.services.CustomerService_Service;
import com.microsoft.schemas.dynamics._2008._01.services.RContractTableKSService;
import com.microsoft.schemas.dynamics._2008._01.services.RContractTableKSService_Service;
import com.microsoft.schemas.dynamics._2008._01.services.VendTableService;
import com.microsoft.schemas.dynamics._2008._01.services.VendTableService_Service;
import com.sun.xml.internal.ws.policy.EffectiveAlternativeSelector;
import com.sun.xml.internal.ws.policy.privateutil.PolicyLogger;

public class ContractLogic extends LogicModule {

	public ContractLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}

	public ENGeneralContracts checkUnicContract(ENGeneralContracts newContract)
			throws PersistenceException {

		/**
		 *  проверка уникальности по полям....
		 *
		 *  finDocID, finDocCode, contractNumber, contractDate, commentGen, partnerId, partnerCode, partnerName
		 *  axcontractid, axcontractcode, axcontractnumber, axcontractdate, axcontractcommentgen,
		 *  axcontractgroupcode, axpartnercode, axpartnername, axcontractaccount
		 *
		 */

		ENGeneralContractsFilter filter = new ENGeneralContractsFilter();

		filter.finDocID = newContract.finDocID;
		filter.finDocCode = newContract.finDocCode;
		filter.contractNumber = newContract.contractNumber;
		filter.contractDate = newContract.contractDate;
		filter.commentGen = newContract.commentGen;
		filter.partnerId = newContract.partnerId;
		filter.partnerCode = newContract.partnerCode;
		filter.partnerName = newContract.partnerName;

		filter.axContractId = newContract.axContractId;
		filter.axContractCode = newContract.axContractCode;
		filter.axContractNumber = newContract.axContractNumber;
		filter.axContractDate = newContract.axContractDate;
		filter.axContractCommentGen = newContract.axContractCommentGen;
		filter.axContractGroupCode = newContract.axContractGroupCode;
		filter.axPartnerCode = newContract.axPartnerCode;
		filter.axPartnerName = newContract.axPartnerName;
		filter.axContractAccount = newContract.axContractAccount;


		ENGeneralContractsDAO contractsDAO = new ENGeneralContractsDAO(connection, userProfile);
		int[] contractsArr = contractsDAO.getUnicFilteredCodeArray(filter, 0, 1);

		if (contractsArr.length > 0) {
			ENGeneralContracts distContract = contractsDAO.getObject(contractsArr[0]);
			return distContract;
		} else {
			return newContract;
		}

	}



	public void startAddContracts() {

		runAddContracts runUpdate = new runAddContracts();
		Thread t = new Thread(runUpdate);
		t.start();

	}



	/**
	 *  добавление и проверка договора на наличие в АХ и ФК
	 *
	 *  @param contractNumber - номер договора
 	 *  @param partnerCode - партнер
     *  @param finDocCode - код договора
     *  @param isCustomer - по умолчанию клиенты
     *  @param isException - ругаемся или пропускаем без исключений
	 *
	 */
	public int addByContractNumber(String contractNumber, String partnerCode,
			String finDocCode, boolean isCustomer, boolean isException) {

		int contractCode = Integer.MIN_VALUE;

		try {

			Connection finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			AuthLogic netAuth = new AuthLogic(finConn, userProfile);
	    	boolean isAX = netAuth.checkUsesMDAXData(Config.CONFIG_USES_MDAX_CONTRACT);

			ENServicesObjectDAO finSoDao = new ENServicesObjectDAO(finConn, userProfile);

			ENGeneralContracts gContracts = new ENGeneralContracts();
			ENServicesObjectFilter contractFilter = new ENServicesObjectFilter();

			/*
			for (StackTraceElement ste : Thread.currentThread().getStackTrace()) {
				System.out.println(ste);
			}
			*/

			// Если мы переключились на AX, то во входящем параметре finDocCode будет код из AX (для всех ли сущностей??),
			// и в этом случае искать в ФК нужно не по нему, а по номеру договора и коду партнера
			if (isAX)
			{
				contractFilter.contractNumber = contractNumber;
			}
			else
			{
				contractFilter.finDocCode = finDocCode;
			}
			contractFilter.partnerCode = partnerCode;

			// SUPP-74050 Для привязки уже закрытых договоров
            contractFilter.isActive = 1;

			System.out.println("@@@@@@@@@@@@@@ custFinder start FK " + contractNumber + " :: " + partnerCode);


			// if (1 == 1)
			// throw new SystemException("\n\n @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
			//		+ "\n\n @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" );


			/** данные из ФК */
			ENServicesObjectShortList finContractList = finSoDao.getContractList(contractFilter, 0, -1, false, true);
			if (finContractList.totalCount > 0) {

				gContracts.finDocID = finContractList.get(0).finDocID;
				gContracts.finDocCode = finContractList.get(0).finDocCode;
				// Чтобы в finDocCode всегда был код из ФК (даже если туда зайдет код из AX, то тут мы его перебьем)
				finDocCode = gContracts.finDocCode;
				gContracts.contractNumber = finContractList.get(0).contractNumber;
				gContracts.contractDate = finContractList.get(0).contractDate;
				gContracts.contractStartDate = finContractList.get(0).contractStartDate;
				gContracts.contractEndDate = finContractList.get(0).dateEdit;
				gContracts.commentGen = finContractList.get(0).commentGen;
				gContracts.partnerId = finContractList.get(0).partnerId;
				gContracts.partnerCode = finContractList.get(0).partnerCode;
				gContracts.partnerName = finContractList.get(0).name;

			} else {

				if (!isException) {
					System.out.println("@@@@@@@@@@@@@@ --------------------- 1 ");
					return Integer.MIN_VALUE;

				} else {
					throw new SystemException("\n\n"
							+ "Договір не знайдено у Фін.коллекції!\n"
							+ "Перевірте наявність та правильність реєстрації.\n"
							+ "Договір № = " + contractNumber + ". \n"
							+ " finDocCode =  " + finDocCode + " \n"
							+ " partnerCode = " + partnerCode );
				}
			}



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


			/** данные из АХ */
            RQOrgShortList orgList = null;

			System.out.println("@@@@@@@@@@@@@@ custFinder start AX " + gContracts.partnerName + " :: " + gContracts.partnerCode);

			if (isCustomer) {
				/** клиенты */
				CustomerService_Service custService = new CustomerService_Service();
	            CustomerService custProxy = custService.getBasicHttpBindingCustomerService();
	            ((BindingProvider) custProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, WebServicesConsts.userName);
	            ((BindingProvider) custProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, WebServicesConsts.userPass);

	            CustFinder custFinder = new CustFinder(custProxy);
				custFinder.parmCriteriaFKPartnerCode(gContracts.partnerCode);

				orgList = custFinder.getAXCustomerList();

			} else {
				/** поставщики */
	            VendTableService_Service vendService = new VendTableService_Service();
	            VendTableService vendProxy = vendService.getBasicHttpBindingVendTableService();
	            ((BindingProvider) vendProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, WebServicesConsts.userName);
	            ((BindingProvider) vendProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, WebServicesConsts.userPass);

	            VendFinder vendFinder = new VendFinder(vendProxy);
	            vendFinder.parmCriteriaFKPartnerCode(gContracts.partnerCode);

				orgList = vendFinder.getAXVendorList();
			}


			System.out.println("@@@@@@@@@@@@@@ custFinder orgList totalCount " + orgList.totalCount);

			if (orgList.totalCount > 0) {

				ENServicesObjectFilter axContractFilter = new ENServicesObjectFilter();

				//axContractFilter.partnerCode = orgList.get(0).codeorg;
				axContractFilter.partnerCode = orgList.get(0).axOrgCode;

				// axContractFilter.contractNumber = contractNumber;
				/** finDocCode == ExtCode_UA  -- код договора из ФК */
				axContractFilter.finDocCode = finDocCode;


				System.out.println("@@@@@@@@@@@@@@ custFinder start axContractList " + orgList.get(0).codeorg);

				ENServicesObjectShortList axContractList = finSoDao.getContractList(axContractFilter, 0, -1, true);

				if (axContractList.totalCount > 0) {

					gContracts.axContractId = Integer.toString(axContractList.get(0).finDocID);
					gContracts.axContractCode = axContractList.get(0).finDocCode;
					gContracts.axContractNumber = axContractList.get(0).contractNumber;
					gContracts.axContractDate = axContractList.get(0).contractDate;
					gContracts.axContractCommentGen = axContractList.get(0).commentGen;
					gContracts.axContractGroupCode = axContractList.get(0).axContractGroupCode;
					gContracts.axPartnerCode = axContractList.get(0).partnerCode;
					gContracts.axPartnerName = axContractList.get(0).name;
					gContracts.axContractAccount = axContractList.get(0).axContractAccount;

					System.out.println("@@@@@@@@@@@@@@ --------------------- oK..."
							+ " axContractNumber = " + gContracts.axContractNumber + " :: axPartnerCode = " + gContracts.axPartnerCode);

				} else {

					if (!isException) {
						System.out.println("@@@@@@@@@@@@@@ --------------------- 2 ");
						return Integer.MIN_VALUE;

					} else {
						throw new SystemException("\n\n"
								+ "Договір не знайдено в Microsoft Dynamics Axapta!\n"
								+ "Перевірте наявність та правильність реєстрації.\n"
								+ "Договір № = " + contractNumber + ".\n"
								+ "Партнер = " + gContracts.partnerName + ".\n"
								+ "Код партнера = " + gContracts.partnerCode + ".");
					}
				}
			} else {

				if (!isException) {
					System.out.println("@@@@@@@@@@@@@@ --------------------- 3 ");
					return Integer.MIN_VALUE;

				} else {
					throw new SystemException("\n\n"
							+ "Договір не знайдено в Microsoft Dynamics Axapta!\n"
							+ "Перевірте наявність та правильність реєстрації.\n"
							+ "Договір № = " + contractNumber + ".\n"
							+ "Партнер = " + gContracts.partnerName + ".\n"
							+ "Код партнера = " + gContracts.partnerCode + ".");
				}
			}

			if (!gContracts.contractNumber.equals(gContracts.axContractNumber)) {
				throw new SystemException("\n\nMDAX-441 Не співпадають номери договорів з AX та ФК!\n"
						+ "Номер договору в ФК = " + gContracts.contractNumber + ".\n"
						+ "Номер договору в AX = " + gContracts.axContractNumber + ".\n"
						+ "Приведіть номера договорів у відповідність!");
			}


			finConn.close();

			Connection netConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ENGeneralContractsDAO contractsDao = new ENGeneralContractsDAO(netConn, userProfile);

			contractCode = contractsDao.add(gContracts);

			return contractCode;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public String addOrg(RQOrg org) throws PersistenceException
	{
		////////////////////////////////////////////////
		// 1
		String orgCode = "";

		String selectStr;
		PreparedStatement statement = null;
		ResultSet set = null;

		selectStr =
			" SELECT CODE " +
			" from " +
			" (select CODE " +
			" from SPRAV.ORG_CODE " +
			" minus " +
			" select CODE " +
			" from SPRAV.ORG) " +
			" order by NLSSORT(CODE,'NLS_SORT=BINARY') ";

		try {
			statement = connection.prepareStatement(selectStr);
			set = statement.executeQuery();
			if (set.next()) {
				orgCode = set.getString(1);
			}

			set.close();
			statement.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		}

		finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}

		if (orgCode == null) {
			throw new SystemException("\n\nПомилка при визначенні коду контрагента з ФК!");
		}

		if (orgCode.equals("")) {
			throw new SystemException("\n\nПомилка при визначенні коду контрагента з ФК!");
		}


		////////////////////////////////////////////////
		// 2
		String insertSQL = null;
		CallableStatement callStmt = null;

		try {

			insertSQL =
				" begin " +
				" 	SPRAV.ORG_INS(:ID, :CODE, :NAME, :UKR_NAME, :OKPO, :NALOG_NUM, :SVIDET_NUM, :DATE_SVIDET, " +
				" 	:LIKV_DATE, :ADR, :TEL, :COUNTRY, :REGION, :OWNERSHIP, :MINISTRY, :TYPE, :MASTER_CODE, " +
				" 	:PRIMECHAN, :Except_Flag, :likv_flag, :id_nalogform, :date_nalogform, " +
				" 	:budget_flag, :SHORT_NAME, :ADR_LEGAL, :PERSON_TYPE, :IS_PLAT_NDS, :NALOG_CODE_FILIAL); " +
				" end; ";

			callStmt = connection.prepareCall(insertSQL);

			callStmt.setNull(1, java.sql.Types.INTEGER);
			callStmt.setString(2, orgCode);
			callStmt.setString(3, org.name);
			callStmt.setString(4, org.ukr_name);
			callStmt.setString(5, org.okpo);
			callStmt.setString(6, org.nalog_num);
			callStmt.setString(7, org.svidet_num);

			if (org.date_svidet != null) {
				callStmt.setDate(8, new java.sql.Date(org.date_svidet.getTime()));
			} else {
				callStmt.setDate(8, null);
			}

			if (org.likv_date != null) {
				callStmt.setDate(9, new java.sql.Date(org.likv_date.getTime()));
			} else {
				callStmt.setDate(9, null);
			}

			callStmt.setString(10, org.adr);
			callStmt.setString(11, org.tel);
			//callStmt.setString(12, org.country);
			callStmt.setNull(12, java.sql.Types.INTEGER);
			//callStmt.setString(13, org.region);
			callStmt.setNull(13, java.sql.Types.INTEGER);

			callStmt.setInt(14, org.ownership);
			callStmt.setNull(15, java.sql.Types.INTEGER);

			callStmt.setString(16, org.type);

			callStmt.setString(17, org.master_code);

			callStmt.setString(18, org.Primechan);

			callStmt.setString(19, org.except_flag);
			callStmt.setString(20, org.likv_flag);

			callStmt.setInt(21, org.id_nalogform);
			if (org.date_nalogform != null) {
				callStmt.setDate(22, new java.sql.Date(org.date_nalogform.getTime()));
			} else {
				callStmt.setDate(22, null);
			}

			try {
				callStmt.setInt(23, Integer.parseInt(org.budget_flag));
			} catch (NumberFormatException nfe) {
				throw new SystemException("\n\nНе вказано ознаку приналежності до бюджетних/небюджетних організацій!");
			}

			callStmt.setNull(24, java.sql.Types.VARCHAR);

			callStmt.setString(25, org.adr_legal);

			callStmt.setInt(26, org.person_type);
			callStmt.setInt(27, org.is_plat_nds);
			if (org.nalog_code_filial != Integer.MIN_VALUE) {
				callStmt.setInt(28, org.nalog_code_filial);
			} else {
				callStmt.setNull(28, java.sql.Types.INTEGER);
			}

			callStmt.execute();

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + insertSQL);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		} finally {
			try {
				if (callStmt != null)
					callStmt.close();
			} catch (SQLException e) {
			}
		}

		return orgCode;
	}

	public boolean checkAccountExistsAndMakeIBAN(RQOrgRschet orgRschet) throws PersistenceException {
		RQOrgRschetDAO dao = new RQOrgRschetDAO(connection, userProfile);

		if(!orgRschet.isIBAN) {
			throw new SystemException(String.format("Рахунок \"%s\" не в форматі IBAN", orgRschet.rschet));
		}
		if(orgRschet.iBANAccountCode == null || orgRschet.iBANBankCode.trim().length() == 0) {
			throw new SystemException("Не заданий розрахунковий рахунок!");
		}
		if(orgRschet.iBANBankCode == null || orgRschet.iBANBankCode.trim().length() == 0) {
			throw new SystemException("Не задане МФО рахунку!");
		}
		if(orgRschet.currency_code == null || orgRschet.currency_code.trim().length() == 0) {
			throw new SystemException("Не заданий код валюти!");
		}

		RQOrgRschetFilter filter = new RQOrgRschetFilter();
		filter.mfo = orgRschet.iBANBankCode;
		filter.rschet = orgRschet.iBANAccountCode;
		filter.currency_code = orgRschet.currency_code;

		RQOrgRschetShortList list = dao.getRQOrgRschetList(filter, 0, -1);

		filter.rschet = orgRschet.rschet;
		filter.mfo = null;

		RQOrgRschetShortList checkList = dao.getRQOrgRschetList(filter, 0, -1);

		if(checkList.totalCount > 0) {
			throw new SystemException(String.format("Рахунок \"%s\" вже існує", orgRschet.rschet));
		}

		if(list.totalCount > 0) {
			if(list.totalCount > 1) {
				throw new SystemException(String.format("Помилка у кількості записів (%d) для рахунку № %s та МФО \"%s\" "
						+ "і коду валюти \"%s\" (IBAN %s)!"
						, list.totalCount, orgRschet.iBANAccountCode, orgRschet.iBANBankCode
						, orgRschet.currency_code, orgRschet.rschet));
			}
			int count = BaseDAOUtils.executeUpdate(connection, "UPDATE sprav.rschet SET rschet = ? WHERE id = ?"
					, java.util.Arrays.asList(orgRschet.rschet, list.get(0).id), false);
			if(count != 1) {
				throw new SystemException(String.format("Помилка у кількості записів (%d) для рахунку № %s та МФО \"%s\" "
						+ "і коду валюти \"%s\" (IBAN %s)!"
							, count, orgRschet.iBANAccountCode, orgRschet.iBANBankCode
							, orgRschet.currency_code, orgRschet.rschet));
			}
			return true;
		}
		return false;
	}

	public void addOrgRschet(RQOrgRschet orgRschet) throws PersistenceException
	{
		String insertSQL = null;
		CallableStatement callStmt = null;

		try {

			insertSQL =
				" begin " +
				"   SPRAV.RSCHET_ALL_INS(:RSCHET_TYPE, :ID, :ORG, :T_ID, :MFO, :RSCHET, :CURRENCY_CODE, :LIKV_DATE, :PRIMECHAN, :RSCHET_TYPE_ID); " +
				" end; ";

			callStmt = connection.prepareCall(insertSQL);

			callStmt.setInt(1, orgRschet.rschet_type);
			callStmt.setNull(2, java.sql.Types.INTEGER);
			callStmt.setString(3, orgRschet.orgCodeFK);

			// В случае транзитного счета его id будем передавать в поле orgRschet.id
			if (orgRschet.id != Integer.MIN_VALUE) {
				callStmt.setInt(4, orgRschet.id);
			} else {
				callStmt.setNull(4, java.sql.Types.INTEGER);
			}

			callStmt.setString(5, orgRschet.mfo);
			callStmt.setString(6, orgRschet.rschet);
			callStmt.setString(7, orgRschet.currency_code);

			if (orgRschet.likv_date != null) {
				callStmt.setDate(8, new java.sql.Date(orgRschet.likv_date.getTime()));
			} else {
				callStmt.setDate(8, null);
			}

			callStmt.setString(9, orgRschet.primechan);

			if (orgRschet.rschet_type_id != Integer.MIN_VALUE) {
				callStmt.setInt(10, orgRschet.rschet_type_id);
			} else {
				callStmt.setNull(10, java.sql.Types.INTEGER);
			}

			callStmt.execute();

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + insertSQL);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		} finally {
			try {
				if (callStmt != null)
					callStmt.close();
			} catch (SQLException e) {
			}
		}
	}

	public String getAgreeCode(int divId) throws PersistenceException
	{
		String sql = null;
		CallableStatement callStmt = null;

		String result = "";

		try {

	        sql = "begin ? := sprav.AGREE_BUISNESS_RULE.GET_AGREECODE(?); end;";

	        callStmt = connection.prepareCall(sql);

	        callStmt.registerOutParameter(1, java.sql.Types.VARCHAR);
	        callStmt.setInt(2, divId);

	        callStmt.execute();

	        result = callStmt.getString(1);

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + sql);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		} finally {
			try {
				if (callStmt != null)
					callStmt.close();
			} catch (SQLException e) {
			}
		}

		return result;
	}


	/**
	 * Создание договора в ФК
	 *
	 * @param finContract - договор
	 *
	 * @return код созданного договора
	 *
	 * @throws PersistenceException
	 */
	public int addAgree(FINContracts finContract /*String agreeCode,
						 int divId, int agree_group_id,
						 String in_num, Date in_date, String reg_num, Date reg_date,
						 Date start_date, Date end_date,
						 String status, BigDecimal summa, BigDecimal nums, String description,
						 Date close_date, String notes,
						 String io_flag,
						 int gk_category,
						 String currency_code*/) throws PersistenceException
	{
		if (finContract.finDocCode == null || finContract.finDocCode.trim().equals("")) {
			throw new SystemException("\n\nНе заданий код договору з ФК!");
		}

		int agree_id = Integer.MIN_VALUE;

		/*

				"  begin " +
				"    SPRAV.AGREE_INS( " +
				"      :ID, :CODE,  " +
				"      :DIVISION_ID, :AGREE_GROUP_ID,  " +
				"      :IN_NUM, :IN_DATE, :REG_NUM, :REG_DATE,  " +
				"      :START_DATE, :END_DATE,  " +
				"      :STATUS, :SUMMA, :NUMS, :DESCRIPTION,  " +
				"      :CLOSE_DATE, :NOTES,  " +
				"      :PARENT_ID, :EDIZM_ID,  " +
				"      :PAY_AFTER_EVENT, :PAY_PERIOD, :PAY_TYPE, " +
				"      :SUMM_NOTE, :NOTLIMITED,  " +
				"      :IO_FLAG, :DEAL_FLAG,  " +
				"      :GK_KATEGORY, :ACT_EXISTS, :SERVICE_ID, " +
				"      :ID_BuyConds, :ID_PayForm,  " +
				"      :Summ_ChangeMode, :ID_OtvLico,  " +
				"      :CURRENCY_CODE, " +
				"      :TENDER_DATE, :TENDER_NO,  " +
				"      :PROLONG_MONTH ,  " +
				"      :NOTE1, :NOTE2 " +
				"    ); " +
				"  end; ";

		begin
		  SPRAV.AGREE_INS(:ID, :CODE, :DIVISION_ID, :AGREE_GROUP_ID, :IN_NUM, :IN_DATE, :REG_NUM, :REG_DATE, :START_DATE,
		    :END_DATE, :STATUS, :SUMMA, :NUMS, :DESCRIPTION, :CLOSE_DATE, :NOTES, :PARENT_ID, :EDIZM_ID, :PAY_AFTER_EVENT, :PAY_PERIOD,
		    :PAY_TYPE,:SUMM_NOTE, :NOTLIMITED,:IO_FLAG, :DEAL_FLAG, :GK_KATEGORY, :ACT_EXISTS, :SERVICE_ID,
		    :ID_BuyConds, :ID_PayForm, :Summ_ChangeMode, :ID_OtvLico, :CURRENCY_CODE,
		    :TENDER_DATE, :TENDER_NO, :PROLONG_MONTH , :NOTE1, :NOTE2
		  );
		--                  :NDS_FLAG, :NDS_FIRST_EVENT, :NN_TYPE);
		end;

		:ID(FLOAT,IN)=<NULL>
		:CODE(VARCHAR[5],IN)='57284'
		:DIVISION_ID(INTEGER,IN)=1
		:AGREE_GROUP_ID(FLOAT,IN)=37
		:IN_NUM(VARCHAR[6],IN)='Test/1'
		:IN_DATE(DATE,IN)='05.06.2017'
		:REG_NUM(VARCHAR[10],IN)='Test/1-reg'
		:REG_DATE(DATE,IN)='09.06.2017'
		:START_DATE(DATE,IN)='01.06.2017'
		:END_DATE(DATE,IN)=<NULL>
		:STATUS(VARCHAR[1],IN)='A'
		:SUMMA(FLOAT,IN)=<NULL>
		:NUMS(FLOAT,IN)=<NULL>
		:DESCRIPTION(VARCHAR[4],IN)='Test'
		:CLOSE_DATE(DATE,IN)=<NULL>
		:NOTES(VARCHAR[0],IN)=<NULL>
		:PARENT_ID(FLOAT,IN)=<NULL>
		:EDIZM_ID(FLOAT,IN)=<NULL>
		:PAY_AFTER_EVENT(VARCHAR[0],IN)=<NULL>
		:PAY_PERIOD(INTEGER,IN)=0
		:PAY_TYPE(INTEGER,IN)=1
		:SUMM_NOTE(VARCHAR[0],IN)=<NULL>
		:NOTLIMITED(VARCHAR[0],IN)=<NULL>
		:IO_FLAG(VARCHAR[1],IN)='B'
		:DEAL_FLAG(VARCHAR[0],IN)=<NULL>
		:GK_KATEGORY(FLOAT,IN)=<NULL>
		:ACT_EXISTS(VARCHAR[0],IN)=<NULL>
		:SERVICE_ID(FLOAT,IN)=<NULL>
		:ID_BuyConds(FLOAT,IN)=<NULL>
		:ID_PayForm(FLOAT,IN)=<NULL>
		:Summ_ChangeMode(INTEGER,IN)=<NULL>
		:ID_OtvLico(FLOAT,IN)=<NULL>
		:CURRENCY_CODE(VARCHAR[3],IN)='980'
		:TENDER_DATE(DATE,IN)=<NULL>
		:TENDER_NO(VARCHAR[0],IN)=<NULL>
		:PROLONG_MONTH(FLOAT,IN)=<NULL>
		:NOTE1(VARCHAR[0],IN)=<NULL>
		:NOTE2(VARCHAR[0],IN)=<NULL>

		 */

		String insertSQL = null;
		CallableStatement callStmt = null;

		try {

			insertSQL =
				"  begin " +
				"    SPRAV.AGREE_INS( " +
				"      :ID, :CODE,  " +
				"      :DIVISION_ID, :AGREE_GROUP_ID,  " +
				"      :IN_NUM, :IN_DATE, :REG_NUM, :REG_DATE,  " +
				"      :START_DATE, :END_DATE,  " +
				"      :STATUS, :SUMMA, :NUMS, :DESCRIPTION,  " +
				"      :CLOSE_DATE, :NOTES,  " +
				"      :PARENT_ID, :EDIZM_ID,  " +
				"      :PAY_AFTER_EVENT, :PAY_PERIOD, :PAY_TYPE, " +
				"      :SUMM_NOTE, :NOTLIMITED,  " +
				"      :IO_FLAG, :DEAL_FLAG,  " +
				"      :GK_KATEGORY, :ACT_EXISTS, :SERVICE_ID, " +
				"      :ID_BuyConds, :ID_PayForm,  " +
				"      :Summ_ChangeMode, :ID_OtvLico,  " +
				"      :CURRENCY_CODE, " +
				"      :TENDER_DATE, :TENDER_NO,  " +
				"      :PROLONG_MONTH ,  " +
				"      :NOTE1, :NOTE2 " +
				"    ); " +
				"  end; ";

			callStmt = connection.prepareCall(insertSQL);

			//callStmt.setNull(1, java.sql.Types.INTEGER); // ID
			callStmt.registerOutParameter(1, java.sql.Types.INTEGER);

			callStmt.setString(2, finContract.finDocCode);

			if (finContract.division_id != Integer.MIN_VALUE) {
				callStmt.setInt(3, finContract.division_id);
			} else {
				callStmt.setNull(3, java.sql.Types.INTEGER);
			}

			if (finContract.agree_group_id != Integer.MIN_VALUE) {
				callStmt.setInt(4, finContract.agree_group_id);
			} else {
				callStmt.setNull(4, java.sql.Types.INTEGER);
			}

			callStmt.setString(5, finContract.contractNumber);

			if (finContract.contractDate != null) {
				callStmt.setDate(6, new java.sql.Date(finContract.contractDate.getTime()));
			} else {
				callStmt.setDate(6, null);
			}

			callStmt.setString(7, finContract.reg_num);

			if (finContract.reg_date != null) {
				callStmt.setDate(8, new java.sql.Date(finContract.reg_date.getTime()));
			} else {
				callStmt.setDate(8, null);
			}

			if (finContract.start_date != null) {
				callStmt.setDate(9, new java.sql.Date(finContract.start_date.getTime()));
			} else {
				callStmt.setDate(9, null);
			}

			if (finContract.end_date != null) {
				callStmt.setDate(10, new java.sql.Date(finContract.end_date.getTime()));
			} else {
				callStmt.setDate(10, null);
			}

			callStmt.setString(11, finContract.status);

			if (finContract.summa != null) {
				callStmt.setBigDecimal(12, finContract.summa);
			} else {
				callStmt.setBigDecimal(12, null);
			}

			if (finContract.nums != null) {
				callStmt.setBigDecimal(13, finContract.nums);
			} else {
				callStmt.setBigDecimal(13, null);
			}

			callStmt.setString(14, finContract.description);

			if (finContract.close_date != null) {
				callStmt.setDate(15, new java.sql.Date(finContract.close_date.getTime()));
			} else {
				callStmt.setDate(15, null);
			}

			callStmt.setString(16, finContract.notes);

			if (finContract.parent_id != Integer.MIN_VALUE) {
				callStmt.setInt(17, finContract.parent_id);
			} else {
				callStmt.setNull(17, java.sql.Types.INTEGER);
			}

			if (finContract.edizm_id != Integer.MIN_VALUE) {
				callStmt.setInt(18, finContract.edizm_id);
			} else {
				callStmt.setNull(18, java.sql.Types.INTEGER);
			}

			callStmt.setString(19, finContract.pay_after_event);

			//callStmt.setInt(20, 0);
			if (finContract.pay_period != Integer.MIN_VALUE) {
				callStmt.setInt(20, finContract.pay_period);
			} else {
				callStmt.setNull(20, java.sql.Types.INTEGER);
			}

			//callStmt.setInt(21, 1);
			if (finContract.pay_type != Integer.MIN_VALUE) {
				callStmt.setInt(21, finContract.pay_type);
			} else {
				callStmt.setNull(21, java.sql.Types.INTEGER);
			}

			callStmt.setString(22, finContract.summ_note);

			callStmt.setString(23, finContract.notlimited);

			callStmt.setString(24, finContract.io_flag);
			callStmt.setString(25, finContract.deal_flag);

			if (finContract.gk_kategory != Integer.MIN_VALUE) {
				callStmt.setInt(26, finContract.gk_kategory);
			} else {
				callStmt.setNull(26, java.sql.Types.INTEGER);
			}

			callStmt.setString(27, finContract.act_exists);

			if (finContract.service_id != Integer.MIN_VALUE) {
				callStmt.setInt(28, finContract.service_id);
			} else {
				callStmt.setNull(28, java.sql.Types.INTEGER);
			}

			if (finContract.id_buyconds != Integer.MIN_VALUE) {
				callStmt.setInt(29, finContract.id_buyconds);
			} else {
				callStmt.setNull(29, java.sql.Types.INTEGER);
			}

			if (finContract.id_payform != Integer.MIN_VALUE) {
				callStmt.setInt(30, finContract.id_payform);
			} else {
				callStmt.setNull(30, java.sql.Types.INTEGER);
			}

			if (finContract.summ_changemode != Integer.MIN_VALUE) {
				callStmt.setInt(31, finContract.summ_changemode);
			} else {
				callStmt.setNull(31, java.sql.Types.INTEGER);
			}

			///// Выберем id отв. лица
			finContract.id_otvlico = getIdKadryByTabNumber(finContract.tabn_otvlico);
			/////

			if (finContract.id_otvlico != Integer.MIN_VALUE) {
				callStmt.setInt(32, finContract.id_otvlico);
			} else {
				callStmt.setNull(32, java.sql.Types.INTEGER);
			}

			callStmt.setString(33, finContract.currency_code);

			if (finContract.tender_date != null) {
				callStmt.setDate(34, new java.sql.Date(finContract.tender_date.getTime()));
			} else {
				callStmt.setDate(34, null);
			}

			callStmt.setString(35, finContract.tender_no);

			if (finContract.prolong_month != Integer.MIN_VALUE) {
				callStmt.setInt(36, finContract.prolong_month);
			} else {
				callStmt.setNull(36, java.sql.Types.INTEGER);
			}

			callStmt.setString(37, finContract.note1);
			callStmt.setString(38, finContract.note2);

			callStmt.execute();

			agree_id = callStmt.getInt(1);

			//System.out.println("$$$ AGREE_ID: " + agree_id + " $$$");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + insertSQL);

			if (e.getMessage().contains("(SPRAV.UN_AGREE_CODE)")) {
				throw new SystemException("\n\nMDAX-441 Заданный код договора уже существует!\n" +
						"Нажмите кнопку \"Получить новый код\" и затем попробуйте создать договор еще раз.");
			}

			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		} finally {
			try {
				if (callStmt != null)
					callStmt.close();
			} catch (SQLException e) {
			}
		}

		return agree_id;
	}

	/**
	 * Создание связки договора с партнером в ФК
	 *
	 * @param agree_id - ID договора из справочника договоров в ФК
	 * @param partner_id - ID партнера из справочника партнеров в ФК
	 * @param partner_status - статус партнера ("S" - продавец (исполнитель), "C" - покупатель (заказчик),
	 *        "P" - соиспонитель (подрядчик), "U" - не определен)
	 * @param partner_rschet_id - ID р/счета партнера в ФК
	 *
	 * @throws PersistenceException
	 */
	public void addAgreePartnerLink(int agree_id, int partner_id, String partner_status, int partner_rschet_id) throws PersistenceException
	{
		if (agree_id == Integer.MIN_VALUE) {
			throw new SystemException("\n\nНе заданий код договору з ФК!");
		}

		if (partner_id == Integer.MIN_VALUE) {
			throw new SystemException("\n\nНе заданий код партнеру з ФК!");
		}

		if (partner_status == null || partner_status.trim().equals("")) {
			throw new SystemException("\n\nНе заданий статус партнера з ФК!");
		}

		/*
			begin
			  SPRAV.agree_partner_link_INS(:AGREE_ID, :PARTNER_ID, :PARTNER_STATUS, :PARTNER_RSCHET_ID);
			end;

			:AGREE_ID(FLOAT,IN)=59864
			:PARTNER_ID(FLOAT,IN)=119411
			:PARTNER_STATUS(VARCHAR[1],IN)='U'
			:PARTNER_RSCHET_ID(FLOAT,IN)=<NULL>
		 */

		String insertSQL = null;
		CallableStatement callStmt = null;

		try {

			insertSQL =
				" begin " +
				"   SPRAV.agree_partner_link_INS(:AGREE_ID, :PARTNER_ID, :PARTNER_STATUS, :PARTNER_RSCHET_ID); " +
				" end; ";

			callStmt = connection.prepareCall(insertSQL);

			callStmt.setInt(1, agree_id);
			callStmt.setInt(2, partner_id);
			callStmt.setString(3, partner_status);

			if (partner_rschet_id != Integer.MIN_VALUE) {
				callStmt.setInt(4, partner_rschet_id);
			} else {
				callStmt.setNull(4, java.sql.Types.INTEGER);
			}

			callStmt.execute();

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + insertSQL);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		} finally {
			try {
				if (callStmt != null)
					callStmt.close();
			} catch (SQLException e) {
			}
		}
	}

	/**
	 * Изменение Центра Ответственности для договора в ФК
	 *
	 * @param agree_id - код договора
	 *
	 * @throws PersistenceException
	 * @throws DatasourceConnectException
	 */
	public void updateAgreeRespCenter(int agree_id) throws PersistenceException, DatasourceConnectException {

		if (agree_id == Integer.MIN_VALUE) {
			throw new SystemException("\n\nНе заданий код договору з ФК!");
		}

        Connection connection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

        PreparedStatement statement = null;

        int rc_id = Integer.MIN_VALUE;

        try {

	        try {
	            String selectStr = "select r.rc_id from sprav.user_rc r where r.user_name = '" + userProfile.getUserName().toUpperCase() + "'";

	            statement = connection.prepareStatement(selectStr);

	            ResultSet resultSet = statement.executeQuery();

	            if (resultSet.next()) {
	            	rc_id = resultSet.getInt(1);
	            } else {
	            	throw new SystemException("\n\nMDAX-441 Не удалось определить Центр Ответственности из ФК для пользователя " +
	            			userProfile.getUserName() + " !");
	            }

	            resultSet.close();

	        } catch (SQLException e) {
	            throw new PersistenceException("Can't get rc_id from sprav.user_rc!", e);
	        } finally {
	            try {
	                if (statement != null)
	                    statement.close();
	            } catch (SQLException e) {
	            }
	        }

	        if (rc_id == Integer.MIN_VALUE) {
	        	throw new SystemException("\n\nMDAX-441 Не удалось определить Центр Ответственности из ФК для пользователя " +
	        			userProfile.getUserName() + " !");
	        }

			String updateSQL = null;
			CallableStatement callStmt = null;

			try {

				updateSQL =
					" update sprav.agree a " +
					"	set a.rc_id = :rc_id " +
					"	where a.id = :id ";

				callStmt = connection.prepareCall(updateSQL);

				callStmt.setInt(1, rc_id);
				callStmt.setInt(2, agree_id);

				callStmt.execute();

			} catch (SQLException e) {
				System.out.println(e.getMessage() + "\nstatement - " + updateSQL);
				EnergyproPersistenceExceptionAnalyzer.analyser
						.throwPersistenceException(e);
			} finally {
				try {
					if (callStmt != null)
						callStmt.close();
				} catch (SQLException e) {
				}
			}
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
	}

	public class AXContractGroup {

		public int ax_id = Integer.MIN_VALUE;
		public int is_priconnection = Integer.MIN_VALUE;
		public int is_request = Integer.MIN_VALUE;
		public int is_disable = Integer.MIN_VALUE;

	}

	public AXContractGroup getAXContractGroup(int agree_group_id) throws PersistenceException, DatasourceConnectException {

        Connection connection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

        PreparedStatement statement = null;

        try {
        	AXContractGroup axContractGroup = new AXContractGroup();

            String selectStr = "select ax_id, is_priconnection, is_request, is_disable from sprav.group2ax where id = " + agree_group_id;

            statement = connection.prepareStatement(selectStr);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
            	axContractGroup.ax_id = resultSet.getInt(1);
            	axContractGroup.is_priconnection = resultSet.getInt(2);
            	axContractGroup.is_request = resultSet.getInt(3);
            	axContractGroup.is_disable = resultSet.getInt(4);

            	if (axContractGroup.is_disable == 1) {
            		throw new SystemException("\n\nMDAX-441 Группу договоров из ФК с кодом " + agree_group_id + " запрещено использовать!");
            	}

            	return axContractGroup;
            }

            resultSet.close();

            return null;

        } catch (SQLException e) {
            throw new PersistenceException("Can't getAXContractGroup", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }

	}

	public AxdEnumCustVendRContractTypeUA getAXContractType(int gk_kategory) throws PersistenceException, DatasourceConnectException {

        Connection connection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

        PreparedStatement statement = null;

        try {
            //String selectStr = "select ax.ax_id from sprav.AAA_AGREE_AGREEAX ax where ax.FK_ID = " + gk_kategory;
        	//String selectStr = "select ax.AX_VALUE from sprav.AAA_AGREE_AGREEAX ax where ax.FK_ID = " + gk_kategory;
        	String selectStr = "select ax.AX_VALUE from sprav.FORM2AX ax where ax.FK_ID = " + gk_kategory;

            statement = connection.prepareStatement(selectStr);

            ResultSet resultSet = statement.executeQuery();

            AxdEnumCustVendRContractTypeUA result = AxdEnumCustVendRContractTypeUA.UNDEFINED;

            if (resultSet.next()) {
                //return resultSet.getString(1);

            	String value = resultSet.getString(1);

    	    	try {
    	    		result = AxdEnumCustVendRContractTypeUA.fromValue(value);
    	    	} catch (IllegalArgumentException e) {
    	    		result = AxdEnumCustVendRContractTypeUA.UNDEFINED;
    	    	}
            }

            resultSet.close();

            //return "";
            return result;

        } catch (SQLException e) {
            throw new PersistenceException("Can't getAXContractType", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }

	}

	public RQOrg fillRQOrgCodes(RQOrg org)
	{
		return fillRQOrgCodes(org, false);
	}

	public RQOrg fillRQOrgCodes(RQOrg org, boolean isCustomer)
	{
		if (org.codeorg == null)
		{
			throw new SystemException("\n\nНе заданий код контрагента з ФК! [codeorg = null]!");
		}

		if (org.codeorg.equals(""))
		{
			throw new SystemException("\n\nНе заданий код контрагента з ФК! [codeorg = \"\"]!");
		}

		if (org.id == Integer.MIN_VALUE && org.axOrgId == Integer.MIN_VALUE)
		{
			String codeOrg = "";
			if (org.codeorg != null)
			{
				codeOrg = org.codeorg;
			}

			throw new SystemException("\n\nДля контрагента не заданий ані код з ФК, ані код з AX! [codeorg = " + codeOrg + "] !");
		}

		// Если заходит из ФК, ищем в AX
		if (org.id != Integer.MIN_VALUE && org.axOrgId == Integer.MIN_VALUE)
		{
            RQOrgShortList orgList = null;

			if (isCustomer) {
				/** клиенты */
				CustomerService_Service custService = new CustomerService_Service();
	            CustomerService custProxy = custService.getBasicHttpBindingCustomerService();
	            ((BindingProvider) custProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, WebServicesConsts.userName);
	            ((BindingProvider) custProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, WebServicesConsts.userPass);

	            CustFinder custFinder = new CustFinder(custProxy);
				custFinder.parmCriteriaFKPartnerCode(org.codeorg);

				orgList = custFinder.getAXCustomerList();

				if (orgList.totalCount == 0)
				{
					throw new SystemException("\n\n"
							+ "Не знайдено клієнта в Microsoft Dynamics Axapta!\n"
							+ "Код з ФК: " + org.codeorg + " !");
				}
			} else {
				/** поставщики */
	            VendTableService_Service vendService = new VendTableService_Service();
	            VendTableService vendProxy = vendService.getBasicHttpBindingVendTableService();
	            ((BindingProvider) vendProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, WebServicesConsts.userName);
	            ((BindingProvider) vendProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, WebServicesConsts.userPass);

	            VendFinder vendFinder = new VendFinder(vendProxy);
	            vendFinder.parmCriteriaFKPartnerCode(org.codeorg);

				orgList = vendFinder.getAXVendorList();

				if (orgList.totalCount == 0)
				{
					throw new SystemException("\n\n"
							+ "Не знайдено постачальника в Microsoft Dynamics Axapta!\n"
							+ "Код з ФК: " + org.codeorg + " !");
				}
			}

			org.axOrgId = orgList.get(0).axOrgId;
			org.axOrgCode = orgList.get(0).axOrgCode;
		}
		// Если заходит из AX, ищем в ФК
		else if (org.axOrgId != Integer.MIN_VALUE && org.id == Integer.MIN_VALUE)
		{
			Connection finConn = null;

			try {
				finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

				RQOrgDAO orgDAO = new RQOrgDAO(finConn, userProfile);

				RQOrgFilter orgFilter = new RQOrgFilter();
				orgFilter.codeorg = org.codeorg;

				RQOrgShortList orgList = orgDAO.getRQOrgList(orgFilter, 0, -1, true);

				if (orgList.totalCount == 0)
				{
					throw new SystemException("\n\n"
							+ "Не знайдено контрагента в Фін.Колекції!\n"
							+ "Код з ФК: " + org.codeorg + " !");
				}

				org.id = orgList.get(0).id;

			} catch (DatasourceConnectException e) {
				throw new SystemException(e.getMessage(), e);
			} catch (PersistenceException e) {
				throw new SystemException(e.getMessage(), e);
			} finally {
	            if (finConn != null) {
	                try {
	                	finConn.close();
	                } catch (SQLException e) {
	                }
	            }
	        }

		}

		return org;
	}

	/**
	 * Определение кода контрагента в AX по коду (id) из ФК
	 *
	 * @param partner_id - id контрагента из ФК
	 * @param isCustomer - тип контрагента (true - клиент, false - поставщик)
	 *
	 * @return кода контрагента в AX
	 */
	public String getAXOrgCode(int partner_id, boolean isCustomer) {

		if (partner_id == Integer.MIN_VALUE) {
			throw new SystemException("\n\nНе заданий код контрагента з ФК!");
		}

		Connection finConn = null;

		try {
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			RQOrgDAO orgDAO = new RQOrgDAO(finConn, userProfile);

			RQOrgFilter orgFilter = new RQOrgFilter();
			orgFilter.id = partner_id;

			RQOrgShortList fkOrgList = orgDAO.getRQOrgList(orgFilter, 0, -1, true);

			if (fkOrgList.totalCount == 0) {
				throw new SystemException("\n\n"
						+ "Не знайдено контрагента в Фін. Колекції!\n"
						+ "Код з ФК (id): " + partner_id + " !");
			}

			String fkOrgCode = fkOrgList.get(0).codeorg;

			if (fkOrgCode == null || fkOrgCode.equals("")) {
				throw new SystemException("\n\n"
						+ "Не знайдено контрагента в Фін. Колекції!\n"
						+ "Код з ФК (id): " + partner_id + " !");
			}

			RQOrgShortList orgList = null;

			if (isCustomer) {
				/** клиенты */
				CustomerService_Service custService = new CustomerService_Service();
	            CustomerService custProxy = custService.getBasicHttpBindingCustomerService();
	            ((BindingProvider) custProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, WebServicesConsts.userName);
	            ((BindingProvider) custProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, WebServicesConsts.userPass);

	            CustFinder custFinder = new CustFinder(custProxy);
				custFinder.parmCriteriaFKPartnerCode(fkOrgCode);

				orgList = custFinder.getAXCustomerList();

				if (orgList.totalCount == 0)
				{
					throw new SystemException("\n\n"
							+ "Не знайдено клієнта в Microsoft Dynamics Axapta!\n"
							+ "Код з ФК: " + fkOrgCode + " !");
				}
			} else {
				/** поставщики */
	            VendTableService_Service vendService = new VendTableService_Service();
	            VendTableService vendProxy = vendService.getBasicHttpBindingVendTableService();
	            ((BindingProvider) vendProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, WebServicesConsts.userName);
	            ((BindingProvider) vendProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, WebServicesConsts.userPass);

	            VendFinder vendFinder = new VendFinder(vendProxy);
	            vendFinder.parmCriteriaFKPartnerCode(fkOrgCode);

				orgList = vendFinder.getAXVendorList();

				if (orgList.totalCount == 0)
				{
					throw new SystemException("\n\n"
							+ "Не знайдено постачальника в Microsoft Dynamics Axapta!\n"
							+ "Код з ФК: " + fkOrgCode + " !");
				}
			}

			return orgList.get(0).axOrgCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
            if (finConn != null) {
                try {
                	finConn.close();
                } catch (SQLException e) {
                }
            }
        }
	}

	/**
	 * Определение кода договора в AX по коду (id) из ФК
	 *
	 * @param agree_id - id договора из ФК
	 *
	 * @return кода договора в AX
	 */
	public String getAXContractCode(int agree_id) {

		if (agree_id == Integer.MIN_VALUE) {
			throw new SystemException("\n\nНе заданий код договора з ФК!");
		}

		Connection finConn = null;

		try {
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(finConn, userProfile);

			ENServicesObjectFilter contractFilter = new ENServicesObjectFilter();
			contractFilter.finDocID = agree_id;

			ENServicesObjectShortList fkContractList = servicesObjectDAO.getContractList(contractFilter, 0, -1, false, true);

			if (fkContractList.totalCount == 0) {
				throw new SystemException("\n\n"
						+ "Не знайдено договір в Фін. Колекції!\n"
						+ "Код з ФК (id): " + agree_id + " !");
			}

			String fkContractCode = fkContractList.get(0).finDocCode;

			if (fkContractCode == null || fkContractCode.equals("")) {
				throw new SystemException("\n\n"
						+ "Не знайдено контрагента в Фін. Колекції!\n"
						+ "Код з ФК (id): " + agree_id + " !");
			}

			String usr = WebServicesConsts.userName;
			String pwd = WebServicesConsts.userPass;

	        RContractTableKSService_Service rContractService = new RContractTableKSService_Service();
	        RContractTableKSService rContractProxy = rContractService.getBasicHttpBindingRContractTableKSService();
	        ((BindingProvider) rContractProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
	        ((BindingProvider) rContractProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

	        AXContractFinder contractFinder = new AXContractFinder(rContractProxy);

	        contractFinder.parmCriteria("RContractTable", "ExtCode_UA", Operator.EQUAL, fkContractCode, "");
	        /** не выбираем закрытые договора */
	        contractFinder.parmCriteria("RContractTable", "Stage_UA", Operator.EQUAL, "ACTIVE", "");

	        ENServicesObjectShortList contractList = contractFinder.getAXContractList();

	        if (contractList.totalCount > 0)
	        {
	        	return contractList.get(0).axContractAccount;
	        }
	        else
	        {
	        	throw new SystemException("\n\nВ AX не знайдено договір з кодом із ФК " + fkContractCode + " (або його вже закрито)!");
	        }

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
            if (finConn != null) {
                try {
                	finConn.close();
                } catch (SQLException e) {
                }
            }
        }
	}

	public ENServicesObjectShort getMainAgreementForFinContract(FINContracts finContract) {

		if (finContract == null) {
			throw new SystemException("\n\nНе заданий договір з ФК!");
		}

		Connection finConn = null;

		try {
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			///////////////////////////////////////////////////////////////////////////////////////////////////
	    	FINContractsDAO finContractsDAO = new FINContractsDAO(finConn, userProfile);
	    	FINContracts mainContract = finContractsDAO.getObjectFromFK(finContract.parent_id);

	    	if (mainContract == null) {
	        	throw new SystemException("\n\nMDAX-441 В ФК не найден родительский договор с кодом (id) " +
	        			finContract.parent_id + " !");
	    	}

			ENServicesObjectFilter axContractFilter = new ENServicesObjectFilter();

			//axContractFilter.partnerCode = orgList.get(0).codeorg;
			axContractFilter.partnerCode = finContract.org.axOrgCode;
			/** finDocCode == ExtCode_UA  -- код договора из ФК */
			axContractFilter.finDocCode = mainContract.finDocCode;

			ENServicesObjectDAO finSoDao = new ENServicesObjectDAO(finConn, userProfile);
			ENServicesObjectShortList axContractList = finSoDao.getContractList(axContractFilter, 0, -1, true);

	    	ENServicesObjectShort mainAgreement = new ENServicesObjectShort();

			if (axContractList.totalCount > 0) {
		    	mainAgreement.finDocCode = axContractList.get(0).finDocCode;
		    	mainAgreement.axContractAccount = axContractList.get(0).axContractAccount;
			} else {
					throw new SystemException("\n\n"
							+ "Договір не знайдено в Microsoft Dynamics Axapta!\n"
							+ "Перевірте наявність та правильність реєстрації!\n");
			}

			return mainAgreement;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
            if (finConn != null) {
                try {
                	finConn.close();
                } catch (SQLException e) {
                }
            }
        }

	}

	public int getIdKadryByTabNumber(String tabNumber) {

		if (tabNumber == null || tabNumber.equals("") || tabNumber.equals("0")) {
			//throw new SystemException("\n\nНе заданий таб. номер!");
			return Integer.MIN_VALUE;
		}

		Connection finConn = null;

		try {

			int tabNum;

			try {

				tabNum = Integer.parseInt(tabNumber.substring(1));

			} catch (NumberFormatException nfe) {

				return Integer.MIN_VALUE;

			}

			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			String selectStr;
			PreparedStatement statement = null;
			ResultSet set = null;

			selectStr =
				" select k.id from sprav.v_kadry k where k.tab_num = ? ";

			try {
				statement = finConn.prepareStatement(selectStr);

				statement.setInt(1, tabNum);

				set = statement.executeQuery();
				if (set.next()) {
					return set.getInt(1);
				}

				set.close();
				statement.close();

			} catch (SQLException e) {
				System.out.println(e.getMessage() + "\nstatement - " + selectStr);
				EnergyproPersistenceExceptionAnalyzer.analyser
						.throwPersistenceException(e);
			}

			finally {
				try {
					if (statement != null)
						statement.close();
				} catch (SQLException e) {
				}
			}

			return Integer.MIN_VALUE;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
            if (finConn != null) {
                try {
                	finConn.close();
                } catch (SQLException e) {
                }
            }
        }
	}

	/**
	 * Получить код подразделения из AX по таб. номеру сотрудника
	 *
	 * @param tabNumber - таб. номер сотрудника
	 *
	 * @return код подразделения из AX
	 *
	 */
	public String getHrmOrgIdByTabNumber(String tabNumber) {

		if (tabNumber == null || tabNumber.equals("")) {
			//throw new SystemException("\n\nНе заданий таб. номер!");
			return "";
		}

		mDaxLogic axLogic = new mDaxLogic(connection, userProfile);

		Date dateIn = new Date();

		FINWorkerFilter finWorkerFilter = new FINWorkerFilter();
		finWorkerFilter.tabNumber = tabNumber;

		FINWorkerShortList finWorkerList = axLogic.getFINWorkerList(finWorkerFilter, 0, -1, dateIn, true);

		if (finWorkerList.totalCount > 0) {
			return finWorkerList.get(0).departmentCode;
		} else {
			return "";
		}

	}

	public class runAddContracts implements Runnable {
		@Override
		public void run() {

			UserProfile userProfile = new UserProfile();
			userProfile.userName = "energynet";

			DomainInfo domainInfo = new DomainInfo();
			try {
				domainInfo = getDomainInfo(userProfile.userName);

				userProfile.domainInfo.domain = domainInfo.domainName;
				userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
				userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

				Connection netConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.MONTH, 2);
				int firstDay = cal.getActualMinimum(Calendar.DATE);
				cal.set(Calendar.DATE, firstDay);
				Date date = cal.getTime();

				int elementTypeCode = 30;
				/** средства защиты */
				ENSizObjectDAO enSizObjectDao = new ENSizObjectDAO(netConn, userProfile);
				enSizObjectDao.preparePlanBySizObject(date, elementTypeCode);


			} catch (PersistenceException e1) {
				e1.printStackTrace();
			} catch (DatasourceConnectException e1) {
				e1.printStackTrace();
			}
		}
	}


	public class DomainInfo {
		public String domainName;
		public int minCodeValue;
		public int maxCodeValue;
	}

	    public DomainInfo getDomainInfo(String userName)
	            throws PersistenceException, DatasourceConnectException {

	        // Connection connection = getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE);
	        Connection connection = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

	        PreparedStatement statement = null;
	        DomainInfo info = null;

	        try {
	            String selectStr = "select d.name, d.dinfmincodevalue, d.dinfmaxcodevalue"
	                    + " from auth_domain d"
	                    + " where d.name = (select user_domain"
	                    + " from auth_user"
	                    + " where user_name = " + "'" + userName + "')";

	            statement = connection.prepareStatement(selectStr);
	            ResultSet resultSet = statement.executeQuery();
	            if (resultSet.next()) {
	                info = new DomainInfo();
	                info.domainName = resultSet.getString(1);
	                info.minCodeValue = resultSet.getInt(2);
	                info.maxCodeValue = resultSet.getInt(3);
	            }
	            resultSet.close();

	            return info;
	        } catch (SQLException e) {
	            throw new PersistenceException("Can't get DomainInfo", e);
	        } finally {
	            try {
	                if (statement != null)
	                    statement.close();
	            } catch (SQLException e) {
	            }
	            if (connection != null) {
	                try {
	                    connection.close();
	                } catch (SQLException e) {
	                }
	            }
	        }
	    }



		public void startFinishPlanWork() {
			startFinishPlanWork startFinishPlanWork = new startFinishPlanWork();
			Thread t = new Thread(startFinishPlanWork);
			t.start();
		}

		public class startFinishPlanWork implements Runnable {
			@Override
			public void run() {

				UserProfile userProfile = new UserProfile();
				userProfile.userName = "energynet";

				DomainInfo domainInfo = new DomainInfo();
				try {
					domainInfo = getDomainInfo(userProfile.userName);

					userProfile.domainInfo.domain = domainInfo.domainName;
					userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
					userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

					Connection netConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

					ENPlanWorkDAO planDao = new ENPlanWorkDAO(netConn, userProfile);
					ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
					planFilter.conditionSQL = " enplanwork.code >= 1017425016 and enplanwork.code in (select distinct pw.code "
							+ " from enplanwork as pw "
							+ " inner join enplanworktype pt on pw.typerefcode = pt.code "
							+ " inner join enplanworkstate ps on pw.staterefcode = ps.code "
							+ " where pw.kindcode = 2 "
							+ " and pw.statuscode = 3 "
							+ " and pw.budgetrefcode not in (240000001, 500000000, 75000011, 500000003) "
							+ " and pw.typerefcode not in (8) "
							+ " and pw.code not in (1018058813, 0, 162188229) "
							+ " and pw.datefinal between '01.01.2014' and '31.12.2014' )";
					planFilter.orderBySQL = "enplanwork.code";


					int planArr[] = planDao.getFilteredCodeArray(planFilter, 0, -1);
					for (int i = 0; i < planArr.length; i++) {

						System.out.println("$$$$$ startFinishPlanWork: planWork " + (i + 1) + " of " + planArr.length + " $$$$$ planCode = " + planArr[i]);

						Context cnt = new InitialContext();
						Object objRef = cnt.lookup(ENPlanWorkController.JNDI_NAME);
						ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject
								.narrow(objRef, ENPlanWorkControllerHome.class);
						ENPlanWorkController planController = planHome.create();

						planController.finishPlanWork(planArr[i]);
					}


				} catch (PersistenceException e1) {
					e1.printStackTrace();
				} catch (DatasourceConnectException e1) {
					e1.printStackTrace();
				} catch (NamingException e) {
					e.printStackTrace();
				} catch (RemoteException e) {
					e.printStackTrace();
				} catch (CreateException e) {
					e.printStackTrace();
				}
			}
		}


}
