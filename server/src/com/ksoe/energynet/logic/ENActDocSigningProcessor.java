package com.ksoe.energynet.logic;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.User2Staffing;
import com.ksoe.docflow.logic.DFConsts;
import com.ksoe.docflow.logic.signing.DocSigningLogic;
import com.ksoe.docflow.logic.signing.DocSigningProcessor;
import com.ksoe.docflow.valueobject.DFDoc;
import com.ksoe.docflow.valueobject.DFDocSigner;
import com.ksoe.docflow.valueobject.DFDocSignerType;
import com.ksoe.docflow.valueobject.lists.DFDocSubtype2SignerTypeShortList;
import com.ksoe.energynet.dataminer.SCUsageInputDAO;
import com.ksoe.energynet.ejb.ENActController;
import com.ksoe.energynet.ejb.ENActControllerHome;
import com.ksoe.energynet.ejb.ENServicesObjectController;
import com.ksoe.energynet.ejb.ENServicesObjectControllerHome;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.valueobject.EPReportRequestEx;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class ENActDocSigningProcessor extends LogicModule implements DocSigningProcessor {

	public ENActDocSigningProcessor(Connection connection,
			UserProfile userProfile) {
		super(connection, userProfile);
	}

	@Override
	public String getDocName(Object object) {
		ENAct act = getENAct(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ActLogic actLogic = new ActLogic(netConnection, userProfile);

			String docNamePrefix = "��� (" + actLogic.getActTypeShortName(act.actTypeRef.code) + ")";
			String docNum = getDocNum(object);
			String docDate = new SimpleDateFormat("dd.MM.yyyy").format(getDocDate(object));

			return String.format("%s �%s �� %s", docNamePrefix, docNum, docDate);

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
	public String getDocNum(Object object) {
		ENAct act = getENAct(object);
		return act.numberGen;
	}

	@Override
	public Date getDocDate(Object object) {
		ENAct act = getENAct(object);
		return act.dateAct;
	}

	@Override
	public String getDocDescription(Object object) {
		String docDescription = getDocName(object);

		ENAct act = getENAct(object);

		if (act.finMolCode != null && !act.finMolCode.isEmpty()) {
			docDescription += String.format(" (%s / %s)", act.finMolCode, act.finMolName);
		}

		return docDescription;
	}

	@Override
	public int getDocCode(Object object) {
		ENAct act = getENAct(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ActLogic actLogic = new ActLogic(netConnection, userProfile);
			return actLogic.getDFDocCodeForENAct(act.code);
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
		ENAct act = getENAct(object);
		return act.code;
	}

	@Override
	public String getStringMessageWithObjectCode(Object object) {
		return "��� ����: " + getObjectCode(object);
	}

	@Override
	public DFDocSubtype2SignerTypeShortList getDocSignerTypes(Object object) {
		Connection docFlowConnection = null;
		Connection netConnection = null;

		try {
			docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			DocSigningLogic docSigningLogic = new DocSigningLogic(docFlowConnection, userProfile);

			String additionalCondition = "";
			ENAct act = getENAct(object);

			// ���� ���� ����� ���������� ������ ��� ��� �������� ����, ������ null, 
			// ������ ��� ��� ���������� �������� (���� checkZKUMountingByAct) ����� ��������, 
			// ����� ����� �������� � ��� - � ����� ������ �� �����, ���� ��� ���� = Integer.MIN_VALUE
			if (act.code <= 0) {
				return null;
			}

			if (act.actTypeRef.code != ENPlanWorkState.WRITINGS_BUFET_REALIZATION &&
					act.actTypeRef.code != ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL) {

				netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
				ActLogic actLogic = new ActLogic(netConnection, userProfile);

				if (! actLogic.actMustHaveSentAndReceivedSigners(act)) {
					// ��� ��������� �����, �������� ��� ����� � ������� "�� - ��������� ���"
					// ����������� ��� �� �� ���� � ������������ � ���������� ������������
					// ("����", "�������"), ��� ��������� - ������ ���� ��������� ("����������")
					additionalCondition = "DFDOCSUBTYPE2SIGNERTYP.SIGNERTYPEREFCODE = " + DFDocSignerType.EXECUTOR;
				}

			}

			return docSigningLogic.getDefaultDFDocSignerTypes(object, additionalCondition);

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
	public User2Staffing getDefaultDocSigner(Object object, int dfDocSignerType) {
		if (!DocSigningLogic.isReadyForSigning(object)) {
			return null;
		}

		if (dfDocSignerType == DFDocSignerType.EXECUTOR ||
				dfDocSignerType == DFDocSignerType.SOLD ||
				dfDocSignerType == DFDocSignerType.SENT ||
				dfDocSignerType == DFDocSignerType.RECEIVED) {
			ENAct act = getENAct(object);
			if (act == null) {
				return null;
			}

			DocSigningLogic docSigningLogic = new DocSigningLogic(connection, userProfile);
			return docSigningLogic.getUser2StaffingByMolCode(act.finMolCode);
		}

		return null;
	}

	@Override
	public void addObject2Doc(Object object, DFDoc doc) {
		ENAct act = getENAct(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ActLogic actLogic = new ActLogic(netConnection, userProfile);
			actLogic.addENAct2DFDoc(act, doc);
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

		ENAct act = getENAct(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ActLogic actLogic = new ActLogic(netConnection, userProfile);
			actLogic.removeENAct2DFDoc(act.code, docCode);
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
		ENAct act = getENAct(object);
		return (act.statusRef.code == ENActStatus.GOOD);
	}

	@Override
	public EPReportRequestEx[] getReportsListForAttachments(Object object) {
		ENAct act = getENAct(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ReportPrintingLogic reportPrintingLogic = new ReportPrintingLogic(netConnection, userProfile);
			EPReportRequestEx[] reportRequests = reportPrintingLogic.getReportsListForENAct(act);
			if (reportRequests.length == 0) {
				throw new SystemException("\n\nNET-4596 �������� ������ ������ ��������� ��� ���������� ��������! ��� ����: " + act.code + " !");
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
	public void doActionsForDocUnClosing(Object object) {
		int docCode = getDocCode(object);
		if (docCode < 0) {
			return;
		}

		Connection docFlowConnection = null;
		Connection netConnection = null;

		try {
			ENAct act = getENAct(object);

			docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			DocSigningLogic docSigningLogic = new DocSigningLogic(docFlowConnection, userProfile);

			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ActLogic actLogic = new ActLogic(netConnection, userProfile);

			int docSignerType = getDfDocSignerTypeForActClosing(act);

			boolean isUserBuh = isUserBuh();

			boolean isServices = false;
			if (act.actTypeRef.code == ENPlanWorkState.WORK_IN_OUT &&
					act.element.typeRef.code == ENElementType.SERVICES_OBJECT) {
				isServices = true;
			}

			checkIfUnclosingIsAllowed(act, isUserBuh);

			docSigningLogic.openDFDocMovementBySignerType(docCode, docSignerType, !isUserBuh, null, null);

			// ��� ����� �� ������� �� ������� ������� �������� ������� �������� � ������ "������ ���������"
			if (isServices) {
				ServicesLogic servicesLogic = new ServicesLogic(netConnection, userProfile);
				// ������ ��� ������� �����
				if (servicesLogic.checkIfStandardServicesObjectByAct(act)) {
					servicesLogic.undoFinishWorksForServicesObject(act);
				}
			}

			if (actLogic.checkCountersStateVerificationForAct(act.code)) {
				// ��� ����� ���������� ������� ������ � ����� �� ������� �� �������
				actLogic.removeENAct2RQFKOrder(act.code);
			}

			// 10.03.2021 ��� ������ ���������� ������ ���������� ��� � �������� ������ (�.�. ����� �� �������� ����������)
			Context context = new InitialContext();
			Object objRef = context.lookup(ENActController.JNDI_NAME);
			ENActControllerHome actControllerHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef, ENActControllerHome.class);
			ENActController actController = actControllerHome.create();

			actController.unSignatured(act.code);

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
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}
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
	public void doAdditionalAction(int docCode, int dfDocSignerType) {
		/*
		if (dfDocSignerType != DFDocSignerType.EXECUTOR &&
				dfDocSignerType != DFDocSignerType.SOLD &&
				dfDocSignerType != DFDocSignerType.RECEIVED) {
			return;
		}
		*/

		if (docCode <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ���������!");
		}

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ActLogic actLogic = new ActLogic(netConnection, userProfile);
			ENAct act = actLogic.getENActByDFDocCode(docCode);
			if (act == null) {
				throw new SystemException("\n\nNET-4596 �� ������� ������ ��� �� ����� ��������� " + docCode + " !");
			}

			// 24.12.2021 �.�.�. ������� �������� �����
			// SUPP-106296 �������� ����� �� ��-��� (���� ��� ������ � ��������� ��-1 �� ��������� ��������)
			// checkMolCodesForScUsageInput(act);

			int dfDocSignerTypeForActClosing = getDfDocSignerTypeForActClosing(act);

			if (dfDocSignerType != dfDocSignerTypeForActClosing) {
				return;
			}

			Context context = new InitialContext();
			Object objRef = context.lookup(ENActController.JNDI_NAME);
			ENActControllerHome actControllerHome = (ENActControllerHome) PortableRemoteObject.narrow(objRef, ENActControllerHome.class);
			ENActController actController = actControllerHome.create();

			actController.close(act.code, 1, true, this);

			// SUPP-102789 ��� ����� �� ������� �� ������� �������� �������� ��� ����� ���������� ����������
			if (act.actTypeRef.code == ENPlanWorkState.WORK_IN_OUT &&
					act.element.typeRef.code == ENElementType.SERVICES_OBJECT) {
				ServicesLogic servicesLogic = new ServicesLogic(netConnection, userProfile);
				// ������ ��� ������� �����
				if (servicesLogic.checkIfStandardServicesObjectByAct(act)) {
					moveServicesObjectToFK(act);
				}
			}

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
		}
	}

	private void checkMolCodesForScUsageInput(ENAct act) {
		if (act == null) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��'��� ����!");
		}

		if (act.dateAct.compareTo(DFConsts.SCUSAGEINPUT_SIGNING_START) < 0) {
			return;
		}

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ActLogic actLogic = new ActLogic(netConnection, userProfile);

			int[] scUsageInputCodes = actLogic.getSCUsageInputCodesForENAct(act.code);

			// ���� ��� ��������� ��-���, �������
			if (scUsageInputCodes.length == 0) {
				return;
			}

			SCUsageInputDAO scUsageInputDao = new SCUsageInputDAO(userProfile, netConnection);
			SCUsageInputLogic scUsageInputLogic = new SCUsageInputLogic(netConnection, userProfile);

			for (int scUsageInputCode : scUsageInputCodes) {
				SCUsageInput scUsageInput = scUsageInputDao.getObjectNOSEGR(scUsageInputCode);
				// SUPP-106296 �������� �����
				scUsageInputLogic.checkMolCodes(scUsageInput);
			}
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
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

	/**
	 * ���������� ��� ����������, ��� ���������� ������� �������� ��� ������ �����������
	 *
	 * @param act - ��� ({@link com.ksoe.energynet.valueobject.ENAct})
	 *
	 * @return ��� ���� ����������, ������� �������� ���
	 */
	private int getDfDocSignerTypeForActClosing(ENAct act) {
		if (act == null) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��'��� ����!");
		}

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ActLogic actLogic = new ActLogic(netConnection, userProfile);

			// �� ��������� ��� ���������� ��� ���������� ������� ����������� � ����� "����������"
			int docSignerType = DFDocSignerType.EXECUTOR;

			if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION ||
					act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL) {

				// �������� ��� (�����)
				docSignerType = DFDocSignerType.SOLD;

			} else if (actLogic.actMustHaveSentAndReceivedSigners(act)) {

				// ��� ��� ���� �������� ��� ��������� �� ���������� ��� �� �������� ���������
				// (�.�. �� ��� ����� ���� ������ 1 ��������� - "����������").
				// ������� ��������, ����� ���������� ���������� ���� �� ����
				DFDocSigner[] docSigners = actLogic.getDFDocSigners(act);
				List<Integer> docSignersList = Arrays.asList(docSigners).stream()
						.map(s -> s.signerTypeRef.code).collect(Collectors.toList());
				if (docSignersList.contains(DFDocSignerType.RECEIVED)) {
					// ��������� ��� � ������ � ������������ ���� "����" � "�������"
					docSignerType = DFDocSignerType.RECEIVED;
				}

			}

			return docSignerType;

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

	private void checkIfUnclosingIsAllowed(ENAct act, boolean isUserBuh) {
		if (act == null) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��'��� ����!");
		}

		boolean isServices = false;
		if (act.actTypeRef.code == ENPlanWorkState.WORK_IN_OUT &&
				act.element.typeRef.code == ENElementType.SERVICES_OBJECT) {
			isServices = true;
		}

		if (! isUserBuh) {
			// 18.10.2021 ��������: �������� ���������� ����� �� ������� �� ������� ����� ������ ����������!
			if (isServices) {
				throw new SystemException("\n\nNET-4596 ³������ ���������� ���� ��� ������ �� ������� ���� ���� ���������!\n" +
						"��������� �� ���������� ���������!");
			}

			// SUPP-106608 ���������� ����� ����������� ���� ���� ����������� ������ ���������� � ��������𳿻
			// (����, ����� �����������)
			if (act.actTypeRef.code == ENPlanWorkState.RECONSTRUCTION_MODERNIZATION) {
				if (act.checkedByAccountant != null && act.checkedByAccountant == true) {
					throw new SystemException("\n\nSUPP-106608 ³������ ���������� ���� ������������� �� ����������� " +
							"���� �������� � ��������� ���� ���� ���������!\n" +
							"��������� �� ���������� ���������!");
				}
			}
		}
	}

	private boolean isUserBuh() {
		Connection authConnection = null;

		try {
			authConnection = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
			AuthLogic authLogic = new AuthLogic(authConnection, userProfile);

			return authLogic.isUserBuh();

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (authConnection != null && !authConnection.isClosed()) {
					authConnection.close();
					authConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	private void moveServicesObjectToFK(ENAct act) {
		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ServicesLogic servicesLogic = new ServicesLogic(netConnection, userProfile);
			ENServicesObject servicesObject = servicesLogic.getServicesObjectByAct(act);

			// ���� ��� ������� �� �������������, �������, ������ ��� �� ���������� ���
			// ���������� ������� � ���������� ����� (����������� ��� ��������� ����)
			if (servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION) {
				return;
			}

			Context context = new InitialContext();
			Object objRef = context.lookup(ENServicesObjectController.JNDI_NAME);
			ENServicesObjectControllerHome servicesObjectControllerHome = (ENServicesObjectControllerHome) PortableRemoteObject.narrow(objRef, ENServicesObjectControllerHome.class);
			ENServicesObjectController servicesObjectController = servicesObjectControllerHome.create();

			// �������� �������
			FKProvResult provResult = servicesObjectController.moveToFK(servicesObject.code, null, Integer.MIN_VALUE, this);
			if (provResult == null || (provResult.partId <= 0 && provResult.badProvList != null)) {
				String errorMessage = "\n\nNET-4596 ������� �� ��� �������� �������� ��� �������� ������ �� ������� � ����� " + servicesObject.code + " !";
				if (provResult != null && provResult.badProvList != null) {
					errorMessage += "\n\n������ �������:\n\n" + provResult.badProvList;
				}
				throw new SystemException(errorMessage);
			}
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
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

	private ENAct getENAct(Object object) {
		if (object == null) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��'��� ����!");
		}

		if (! (object instanceof ENAct)) {
			throw new IllegalArgumentException("\n\nNET-4596 ��'��� �� � �����!");
		}
		ENAct act = (ENAct)object;

		/*
		if (act.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ����!");
		}
		*/

		return act;
	}

}
