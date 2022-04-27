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
import com.ksoe.energynet.ejb.ENAct2FinKodIstController;
import com.ksoe.energynet.ejb.ENAct2FinKodIstControllerHome;
import com.ksoe.energynet.ejb.SCUsageInputController;
import com.ksoe.energynet.ejb.SCUsageInputControllerHome;
import com.ksoe.energynet.valueobject.FinKodIst;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.SCUsageInputStatus;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.valueobject.EPReportRequestEx;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class SCUsageInputDocSigningProcessor extends LogicModule implements DocSigningProcessor {

	public SCUsageInputDocSigningProcessor(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}

	@Override
	public String getDocName(Object object) {
		SCUsageInput scUsageInput = getSCUsageInput(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			String docNamePrefix = "�������� � ������������ ���������";
			if (scUsageInput.iszku == 1) {
				docNamePrefix += " � ����� ���";
			}
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
		SCUsageInput scUsageInput = getSCUsageInput(object);
		return scUsageInput.numberDoc;
	}

	@Override
	public Date getDocDate(Object object) {
		SCUsageInput scUsageInput = getSCUsageInput(object);
		return scUsageInput.dateGen;
	}

	@Override
	public String getDocDescription(Object object) {
		String docDescription = getDocName(object);

		SCUsageInput scUsageInput = getSCUsageInput(object);

		if (scUsageInput.molCode != null && !scUsageInput.molCode.isEmpty()) {
			docDescription += String.format(" (%s / %s)", scUsageInput.molCode, scUsageInput.molName);
		}

		return docDescription;
	}

	@Override
	public int getDocCode(Object object) {
		SCUsageInput scUsageInput = getSCUsageInput(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			SCUsageInputLogic scUsageInputLogic = new SCUsageInputLogic(netConnection, userProfile);
			return scUsageInputLogic.getDFDocCodeForSCUsageInput(scUsageInput.code);
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
		SCUsageInput scUsageInput = getSCUsageInput(object);
		return scUsageInput.code;
	}

	@Override
	public String getStringMessageWithObjectCode(Object object) {
		return "��� ��������� �� �������� ��������� � ������������: " + getObjectCode(object);
	}

	@Override
	public DFDocSubtype2SignerTypeShortList getDocSignerTypes(Object object) {
		Connection docFlowConnection = null;

		try {
			docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			DocSigningLogic docSigningLogic = new DocSigningLogic(docFlowConnection, userProfile);
			return docSigningLogic.getDefaultDFDocSignerTypes(object, "");
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

		// ��� 3 ���������� - ����������?
		if (dfDocSignerType == DFDocSignerType.EXECUTOR
				|| dfDocSignerType == DFDocSignerType.SENT
				|| dfDocSignerType == DFDocSignerType.RECEIVED) {
			SCUsageInput scUsageInput = getSCUsageInput(object);
			if (scUsageInput == null) {
				return null;
			}

			DocSigningLogic docSigningLogic = new DocSigningLogic(connection, userProfile);
			return docSigningLogic.getUser2StaffingByMolCode(scUsageInput.molCode);
		}

		return null;
	}

	@Override
	public void addObject2Doc(Object object, DFDoc doc) {
		SCUsageInput scUsageInput = getSCUsageInput(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			SCUsageInputLogic scUsageInputLogic = new SCUsageInputLogic(netConnection, userProfile);
			scUsageInputLogic.addSCUsageInput2DFDoc(scUsageInput, doc);
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

		SCUsageInput scUsageInput = getSCUsageInput(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			SCUsageInputLogic scUsageInputLogic = new SCUsageInputLogic(netConnection, userProfile);
			scUsageInputLogic.removeSCUsageInput2DFDoc(scUsageInput.code, docCode);
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
		SCUsageInput scUsageInput = getSCUsageInput(object);
		return (scUsageInput.statusRef.code == SCUsageInputStatus.GOOD);
	}

	@Override
	public EPReportRequestEx[] getReportsListForAttachments(Object object) {
		SCUsageInput scUsageInput = getSCUsageInput(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ReportPrintingLogic reportPrintingLogic = new ReportPrintingLogic(netConnection, userProfile);
			EPReportRequestEx[] reportRequests = reportPrintingLogic.getReportsListForSCUsageInput(scUsageInput);
			if (reportRequests.length == 0) {
				throw new SystemException("\n\nNET-4596 �������� ������ ������ ��������� ��� ���������� ��������! " +
						getStringMessageWithObjectCode(object) + " !");
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
		// SUPP-105890
		// 24.12.2021 �.�.�. ������� �������� ����� (�����������) - ����������� ����� ��� ������
		return false;
	}

	@Override
	public boolean mustHaveAttachmentsForDocSignerType(int docCode, int dfDocSignerType) {
		if (docCode <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ���������!");
		}

		// SUPP-107947 ��� ��-���, � ������� ���� ������ ������ ��������, �� ����� ��������
		// � ����� ���������� "����������" (������ "����" � "�������" �� �� �� ������)
		if (dfDocSignerType != DFDocSignerType.EXECUTOR) {
			return true;
		}

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			SCUsageInputLogic usageInputLogic = new SCUsageInputLogic(netConnection, userProfile);
			SCUsageInput scUsageInput = usageInputLogic.getSCUsageInputByDFDocCode(docCode);
			if (scUsageInput == null) {
				throw new SystemException("\n\nNET-4596 �� ������� ������ �������� �� �������� ��������� � ������������ �� ����� ��������� " + docCode + " !");
			}

			return !usageInputLogic.containsOnlyUsageOut(scUsageInput.code);

		}  catch (DatasourceConnectException e) {
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
	public void doActionsForDocUnClosing(Object object) {
		int docCode = getDocCode(object);
		if (docCode < 0) {
			return;
		}

		Connection docFlowConnection = null;
		Connection netConnection = null;

		try {
			SCUsageInput scUsageInput = getSCUsageInput(object);

			docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			DocSigningLogic docSigningLogic = new DocSigningLogic(docFlowConnection, userProfile);

			int docSignerType = DFDocSignerType.RECEIVED;

			boolean isUserBuh = isUserBuh();

			docSigningLogic.openDFDocMovementBySignerType(docCode, docSignerType, !isUserBuh, null, null);

			// ��� ������ ���������� ������ ���������� �������� � �������� ������
			Context context = new InitialContext();
			Object objRef = context.lookup(SCUsageInputController.JNDI_NAME);
			SCUsageInputControllerHome usageInputControllerHome = (SCUsageInputControllerHome) PortableRemoteObject.narrow(objRef, SCUsageInputControllerHome.class);
			SCUsageInputController usageInputController = usageInputControllerHome.create();

			if (scUsageInput.iszku == 1) {
				usageInputController.undoFillUsageInputZKU(scUsageInput.code);
			} else {
				usageInputController.undoFillUsageInput(scUsageInput.code);
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
		if (dfDocSignerType != DFDocSignerType.RECEIVED) {
			return;
		}
		*/

		if (docCode <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ���������!");
		}

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			SCUsageInputLogic usageInputLogic = new SCUsageInputLogic(netConnection, userProfile);
			SCUsageInput scUsageInput = usageInputLogic.getSCUsageInputByDFDocCode(docCode);
			if (scUsageInput == null) {
				throw new SystemException("\n\nNET-4596 �� ������� ������ �������� �� �������� ��������� � ������������ �� ����� ��������� " + docCode + " !");
			}

			// SUPP-106296 �������� �����
			usageInputLogic.checkMolCodes(scUsageInput);

			if (dfDocSignerType != DFDocSignerType.RECEIVED) {
				return;
			}

			// �������� ����� ������� ���. ������ ��� ������� ��������� �� ���������
			usageInputLogic.checkOzInfo(scUsageInput.code);

			Context context = new InitialContext();

			// ���� � ��������� ���� ������ ������ ���������, �� ��������� ���� �� �����������,
			// � �������������� �������� ��� ����� ������������� ������
			if (! usageInputLogic.containsOnlyUsageOut(scUsageInput.code)) {
				Object act2FinKodIstRef = context.lookup(ENAct2FinKodIstController.JNDI_NAME);
				ENAct2FinKodIstControllerHome act2FinKodIstControllerHome =
						(ENAct2FinKodIstControllerHome) PortableRemoteObject.narrow(act2FinKodIstRef, ENAct2FinKodIstControllerHome.class);
				ENAct2FinKodIstController act2FinKodIstController = act2FinKodIstControllerHome.create();

				// ������������� �������� ��� ����� (������ "266 �������� ����� ��� ������� ��������� � ���" - ���������)
				act2FinKodIstController.setKodIst4Oz(FinKodIst.TECHNICAL_MAINTENANCE_WITH_COUNTERS_ZKU, scUsageInput.code);
			}

			Object objRef = context.lookup(SCUsageInputController.JNDI_NAME);
			SCUsageInputControllerHome usageInputControllerHome = (SCUsageInputControllerHome) PortableRemoteObject.narrow(objRef, SCUsageInputControllerHome.class);
			SCUsageInputController usageInputController = usageInputControllerHome.create();

			// ��������
			if (scUsageInput.iszku == 1) {
				usageInputController.processInSCZKU(scUsageInput.code, this);
			} else {
				usageInputController.processInSC(scUsageInput.code, this);
			}

		}  catch (DatasourceConnectException e) {
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

	private SCUsageInput getSCUsageInput(Object object) {
		if (object == null) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��'��� ��������� ��� �������� � ������������ ���������!");
		}

		if (! (object instanceof SCUsageInput)) {
			throw new IllegalArgumentException("\n\nNET-4596 ��'��� �� � ���������� ��� �������� � ������������ ���������!");
		}
		SCUsageInput scUsageInput = (SCUsageInput)object;

		/*
		if (scUsageInput.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ��������� ��� �������� � ������������ ���������!");
		}
		*/

		return scUsageInput;
	}

}
