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
import com.ksoe.energynet.ejb.ENReconstrModernOZController;
import com.ksoe.energynet.ejb.ENReconstrModernOZControllerHome;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ;
import com.ksoe.energynet.valueobject.ENReconstrModernOZStatus;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.valueobject.EPReportRequestEx;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class ENReconstrModernOZDocSigningProcessor extends LogicModule implements DocSigningProcessor {

	public ENReconstrModernOZDocSigningProcessor(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}

	@Override
	public String getDocName(Object object) {
		String docNamePrefix = "Акт ОЗ-2";
		String docNum = getDocNum(object);
		String docDate = new SimpleDateFormat("dd.MM.yyyy").format(getDocDate(object));

		return String.format("%s №%s від %s", docNamePrefix, docNum, docDate);
	}

	@Override
	public String getDocNum(Object object) {
		ENReconstrModernOZ actOz = getENReconstrModernOZ(object);
		return actOz.numbergen;
	}

	@Override
	public Date getDocDate(Object object) {
		ENReconstrModernOZ actOz = getENReconstrModernOZ(object);
		return actOz.dateGen;
	}

	@Override
	public String getDocDescription(Object object) {
		String docDescription = getDocName(object);

		ENReconstrModernOZ actOz = getENReconstrModernOZ(object);

		if (actOz.nameOZ != null && actOz.invNumberOZ != null
				&& !actOz.nameOZ.isEmpty() && !actOz.invNumberOZ.isEmpty()) {
			docDescription += String.format(" (%s)", actOz.nameOZ + ", інв. №" + actOz.invNumberOZ);
		}

		return docDescription;
	}

	@Override
	public int getDocCode(Object object) {
		ENReconstrModernOZ actOz = getENReconstrModernOZ(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ReconstrModernizacLogic reconstrModernLogic = new ReconstrModernizacLogic(netConnection, userProfile);
			return reconstrModernLogic.getDFDocCodeForENReconstrModernOZ(actOz.code);
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
		ENReconstrModernOZ actOz = getENReconstrModernOZ(object);
		return actOz.code;
	}

	@Override
	public String getStringMessageWithObjectCode(Object object) {
		return "Код акту ОЗ-2: " + getObjectCode(object);
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

		if (//dfDocSignerType == DFDocSignerType.SENT ||
				dfDocSignerType == DFDocSignerType.RECEIVED) {
			ENReconstrModernOZ actOz = getENReconstrModernOZ(object);
			if (actOz == null) {
				return null;
			}

			DocSigningLogic docSigningLogic = new DocSigningLogic(connection, userProfile);
			return docSigningLogic.getUser2StaffingByMolCode(actOz.codeMol);
		}

		return null;
	}

	@Override
	public void addObject2Doc(Object object, DFDoc doc) {
		ENReconstrModernOZ actOz = getENReconstrModernOZ(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ReconstrModernizacLogic reconstrModernLogic = new ReconstrModernizacLogic(netConnection, userProfile);
			reconstrModernLogic.addENReconstrModernOZ2DFDoc(actOz, doc);
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

		ENReconstrModernOZ actOz = getENReconstrModernOZ(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ReconstrModernizacLogic reconstrModernLogic = new ReconstrModernizacLogic(netConnection, userProfile);
			reconstrModernLogic.removeENReconstrModernOZ2DFDoc(actOz.code, docCode);
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
		ENReconstrModernOZ actOz = getENReconstrModernOZ(object);
		return (actOz.statusRef.code == ENReconstrModernOZStatus.DRAFT);
	}

	@Override
	public EPReportRequestEx[] getReportsListForAttachments(Object object) {
		ENReconstrModernOZ actOz = getENReconstrModernOZ(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ReportPrintingLogic reportPrintingLogic = new ReportPrintingLogic(netConnection, userProfile);
			EPReportRequestEx[] reportRequests = reportPrintingLogic.getReportsListForENReconstrModernOZ(actOz);
			if (reportRequests.length == 0) {
				throw new SystemException("\n\nNET-4596 Отримано пустий перелік параметрів для формування вкладень! Код акта ОЗ-2: " + actOz.code + " !");
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
	public void doActionsForDocUnClosing(Object object) {
		int docCode = getDocCode(object);
		if (docCode < 0) {
			return;
		}

		Connection docFlowConnection = null;
		Connection netConnection = null;

		try {
			ENReconstrModernOZ actOz = getENReconstrModernOZ(object);

			docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			DocSigningLogic docSigningLogic = new DocSigningLogic(docFlowConnection, userProfile);

			int docSignerType = DFDocSignerType.RECEIVED;

			boolean isUserBuh = isUserBuh();

			docSigningLogic.openDFDocMovementBySignerType(docCode, docSignerType, !isUserBuh, null, null);

			// При отмене проведения вообще возвращаем документ в черновой статус
			Context context = new InitialContext();
			Object objRef = context.lookup(ENReconstrModernOZController.JNDI_NAME);
			ENReconstrModernOZControllerHome ozControllerHome = (ENReconstrModernOZControllerHome) PortableRemoteObject.narrow(objRef, ENReconstrModernOZControllerHome.class);
			ENReconstrModernOZController ozController = ozControllerHome.create();
			ozController.unCreateOZ(actOz.code);

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
		if (dfDocSignerType != DFDocSignerType.RECEIVED) {
			return;
		}

		if (docCode <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 Не заданий код документу!");
		}

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ReconstrModernizacLogic ozLogic = new ReconstrModernizacLogic(netConnection, userProfile);
			ENReconstrModernOZ actOz = ozLogic.getENReconstrModernOZByDFDocCode(docCode);
			if (actOz == null) {
				throw new SystemException("\n\nNET-4596 Не вдалося знайти документ акт ОЗ-2 за кодом документу " + docCode + " !");
			}

			// Проводим
			Context context = new InitialContext();
			Object objRef = context.lookup(ENReconstrModernOZController.JNDI_NAME);
			ENReconstrModernOZControllerHome ozControllerHome = (ENReconstrModernOZControllerHome) PortableRemoteObject.narrow(objRef, ENReconstrModernOZControllerHome.class);
			ENReconstrModernOZController ozController = ozControllerHome.create();
			ozController.moveToOS(actOz.code, this);

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

	private ENReconstrModernOZ getENReconstrModernOZ(Object object) {
		if (object == null) {
			throw new IllegalArgumentException("\n\nNET-4596 Не заданий об'єкт акту ОЗ-2!");
		}

		if (! (object instanceof ENReconstrModernOZ)) {
			throw new IllegalArgumentException("\n\nNET-4596 Об'єкт не є актом ОЗ-2!");
		}
		ENReconstrModernOZ actOz = (ENReconstrModernOZ)object;

		/*
		if (actOz.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nNET-4596 Не заданий код акту ОЗ-2!");
		}
		*/

		return actOz;
	}

}
