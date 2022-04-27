package com.ksoe.energynet.logic;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.User2Staffing;
import com.ksoe.docflow.logic.signing.DocSigningLogic;
import com.ksoe.docflow.logic.signing.DocSigningProcessor;
import com.ksoe.docflow.valueobject.DFDoc;
import com.ksoe.docflow.valueobject.DFDocSignerType;
import com.ksoe.docflow.valueobject.lists.DFDocSubtype2SignerTypeShortList;
import com.ksoe.energyWorkflow.logic.WorkFlowLogic;
import com.ksoe.energynet.ejb.ENServicesObjectController;
import com.ksoe.energynet.ejb.ENServicesObjectControllerHome;
import com.ksoe.energynet.valueobject.ENActIncomeStatus;
import com.ksoe.energynet.valueobject.ENActIncomeTechConditions;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.valueobject.EPReportRequestEx;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class ENActIncomeTechConditionsDocSigningProcessor extends LogicModule implements DocSigningProcessor {

	public ENActIncomeTechConditionsDocSigningProcessor(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}

	@Override
	public String getDocName(Object object) {
		String docNamePrefix = "Повідомлення про надання послуги з приєднання";
		String docNum = getDocNum(object);
		String docDate = new SimpleDateFormat("dd.MM.yyyy").format(getDocDate(object));

		return String.format("%s №%s від %s", docNamePrefix, docNum, docDate);
	}

	@Override
	public String getDocNum(Object object) {
		ENActIncomeTechConditions act = getENActIncome(object);
		return act.numbergen;
	}

	@Override
	public Date getDocDate(Object object) {
		ENActIncomeTechConditions act = getENActIncome(object);
		return act.dategen;
	}

	@Override
	public String getDocDescription(Object object) {
		String docDescription = getDocName(object);
		return docDescription;
	}

	@Override
	public int getDocCode(Object object) {
		ENActIncomeTechConditions act = getENActIncome(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ActIncomeLogic actIncomeLogic = new ActIncomeLogic(netConnection, userProfile);
			return actIncomeLogic.getDFDocCodeForENActIncomeTech(act.code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (netConnection != null && !netConnection.isClosed()) {
					netConnection.close();
					netConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	@Override
	public int getObjectCode(Object object) {
		ENActIncomeTechConditions act = getENActIncome(object);
		return act.code;
	}

	@Override
	public String getStringMessageWithObjectCode(Object object) {
		return "Код прибуткового акту: " + getObjectCode(object);
	}

	@Override
	public DFDocSubtype2SignerTypeShortList getDocSignerTypes(Object object) {
		Connection docFlowConnection = null;

		try {
			docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			DocSigningLogic docSigningLogic = new DocSigningLogic(docFlowConnection, userProfile);
			return docSigningLogic.getDefaultDFDocSignerTypes(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	@Override
	public User2Staffing getDefaultDocSigner(Object object, int dfDocSignerType) {
		if (!DocSigningLogic.isReadyForSigning(object)) {
			return null;
		}

		// TODO: брать из настроек таб. № Кичиянца и по нему выбирать данные
		return null;
	}

	@Override
	public void addObject2Doc(Object object, DFDoc doc) {
		ENActIncomeTechConditions act = getENActIncome(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ActIncomeLogic actIncomeLogic = new ActIncomeLogic(netConnection, userProfile);
			actIncomeLogic.addENActIncomeTech2DFDoc(act, doc);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (netConnection != null && !netConnection.isClosed()) {
					netConnection.close();
					netConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	@Override
	public void removeObject2Doc(Object object) {
		int docCode = getDocCode(object);
		if (docCode < 0) {
			return;
		}

		ENActIncomeTechConditions act = getENActIncome(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ActIncomeLogic actIncomeLogic = new ActIncomeLogic(netConnection, userProfile);
			actIncomeLogic.removeENActIncomeTech2DFDoc(act.code, docCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (netConnection != null && !netConnection.isClosed()) {
					netConnection.close();
					netConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	@Override
	public boolean isDraft(Object object) {
		ENActIncomeTechConditions act = getENActIncome(object);
		return (act.statusRef.code == ENActIncomeStatus.GOOD);
	}

	@Override
	public EPReportRequestEx[] getReportsListForAttachments(Object object) {
		ENActIncomeTechConditions act = getENActIncome(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ReportPrintingLogic reportPrintingLogic = new ReportPrintingLogic(netConnection, userProfile);
			EPReportRequestEx[] reportRequests = reportPrintingLogic.getReportsListForENActIncomeTechConditions(act);
			if (reportRequests.length == 0) {
				throw new SystemException("\n\nNET-4596 Отримано пустий перелік параметрів для формування вкладень! Код акта: " + act.code + " !");
			}

			return reportRequests;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (netConnection != null && !netConnection.isClosed()) {
					netConnection.close();
					netConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	@Override
	public boolean isDocSignersCheckRequired(Object object) {
		return false;
	}

	@Override
	public boolean mustHaveAttachmentsForDocSignerType(int docCode, int dfDocSignerType) {
		return true;
	}

	@Override
	public void doAdditionalAction(int docCode, int dfDocSignerType) {
		if (dfDocSignerType != DFDocSignerType.APPROVED) {
			return;
		}

		if (docCode <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 Не заданий код документу!");
		}

		Connection netConnection = null;
		Connection workFlowConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ActIncomeLogic actIncomeLogic = new ActIncomeLogic(netConnection, userProfile);
			ENActIncomeTechConditions actIncome = actIncomeLogic.getENActIncomeTechByDFDocCode(docCode);
			if (actIncome == null) {
				throw new SystemException("\n\nNET-4596 Не вдалося знайти прибутковий акт за кодом документу " + docCode + " !");
			}

			int servicesObjectCode = actIncomeLogic.getENServicesObjectCodeByENActIncomeTechConditionsCode(actIncome.code);
			if (servicesObjectCode == Integer.MIN_VALUE) {
				throw new SystemException("\n\nNET-4596 Не знайдено договір для прибуткового акта з кодом " + actIncome.code + " !");
			}

			Context context = new InitialContext();
			Object objRef = context.lookup(ENServicesObjectController.JNDI_NAME);
			ENServicesObjectControllerHome servicesObjectControllerHome = (ENServicesObjectControllerHome) PortableRemoteObject.narrow(objRef, ENServicesObjectControllerHome.class);
			ENServicesObjectController servicesObjectController = servicesObjectControllerHome.create();

			// Проводим договор
			FKProvResult provResult = servicesObjectController.moveToFK(servicesObjectCode, null, Integer.MIN_VALUE, this);
			if (provResult == null || (provResult.partId <= 0 && provResult.badProvList != null)) {
				throw new SystemException("\n\nNET-4596 Помилка під час передачі проводок для прибуткового акта з кодом " + actIncome.code + " !");
			}

			// Добавляем связку пакета WorkFlow с созданным документом
			// (при этом подписанное вложение должно отобразиться в кабинете заказчика на сайте)
			actIncomeLogic.createWFPack2DFDocForENActIncomeTechConditions(actIncome.code);

			// Создаем сопроводительное письмо
			ServicesLogic servicesLogic = new ServicesLogic(netConnection, userProfile);
			servicesLogic.addENSheetForENActIncomeTechCond(servicesObjectCode);

			// Подготавливаем сообщение для отправки на e-mail
			workFlowConnection = getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);
			WorkFlowLogic workFlowLogic = new WorkFlowLogic(workFlowConnection, userProfile);
			workFlowLogic.makeWFMessages4NotificationAct(servicesObjectCode);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (netConnection != null && !netConnection.isClosed()) {
					netConnection.close();
					netConnection = null;
				}
			} catch (SQLException e) {
			}
			try {
				if (workFlowConnection != null && !workFlowConnection.isClosed()) {
					workFlowConnection.close();
					workFlowConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	private ENActIncomeTechConditions getENActIncome(Object object) {
		if (object == null) {
			throw new IllegalArgumentException("\n\nNET-4596 Не заданий об'єкт прибуткового акту!");
		}

		if (! (object instanceof ENActIncomeTechConditions)) {
			throw new IllegalArgumentException("\n\nNET-4596 Об'єкт не є прибутковим актом!");
		}
		ENActIncomeTechConditions actIncome = (ENActIncomeTechConditions)object;

		/*
		if (actIncome.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nNET-4596 Не заданий код прибуткового акту!");
		}
		*/

		return actIncome;
	}

}
