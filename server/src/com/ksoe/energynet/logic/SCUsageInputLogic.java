package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.logic.DFConsts;
import com.ksoe.docflow.logic.DocFlowLogic;
import com.ksoe.docflow.valueobject.DFDoc;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.dataminer.SCUsageInput2DFDocDAO;
import com.ksoe.energynet.dataminer.SCUsageInputDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZ2SCCounterDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZInfoDAO;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.SCUsageInput2DFDoc;
import com.ksoe.energynet.valueobject.SCUsageInputItem;
import com.ksoe.energynet.valueobject.SCUsageInputItemKind;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZInfo;
import com.ksoe.energynet.valueobject.SCUsageInputStatus;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInput2DFDocFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2SCCounterFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZInfoFilter;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.logic.TKConsts;

public class SCUsageInputLogic extends LogicModule {

	private static final long serialVersionUID = 1L;

    public SCUsageInputLogic(Connection connection, UserProfile userProfile) {
        super(connection, userProfile);
    }

	public int getDFDocCodeForSCUsageInput(int scUsageInputCode) {
		if (scUsageInputCode <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ��������� �� �������� ��������� � ������������!");
		}

		Connection dfConnection = null;

		try {
			SCUsageInput2DFDocDAO scUsageInput2DocDao = new SCUsageInput2DFDocDAO(connection, userProfile);
			SCUsageInput2DFDocFilter scUsageInput2DocFilter = new SCUsageInput2DFDocFilter();
			scUsageInput2DocFilter.scUsageInputRef.code = scUsageInputCode;
			int[] scUsageInput2DocCodes = scUsageInput2DocDao.getFilteredCodeArray(scUsageInput2DocFilter, 0, -1);

			if (scUsageInput2DocCodes.length == 0) {
				return Integer.MIN_VALUE;
			}

			String dfDocCodes = "";
			for (int scUsageInput2DocCode : scUsageInput2DocCodes) {
				SCUsageInput2DFDoc scUsageInput2DFDoc = scUsageInput2DocDao.getObject(scUsageInput2DocCode);
				dfDocCodes += (dfDocCodes.isEmpty() ? "" + scUsageInput2DFDoc.dfDocCode : ", " + scUsageInput2DFDoc.dfDocCode); 
			}

			dfConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			DocFlowLogic docFlowLogic = new DocFlowLogic(dfConnection, userProfile);
			return docFlowLogic.getActiveDocCode(dfDocCodes);

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (dfConnection != null && !dfConnection.isClosed()) {
					dfConnection.close();
					dfConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	public void addSCUsageInput2DFDoc(SCUsageInput scUsageInput, DFDoc doc) {
		if (scUsageInput == null || scUsageInput.code <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��'��� ��������� �� �������� ��������� � ������������!");
		}
		if (doc == null || doc.code <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��'��� ���������!");
		}

		try {
			SCUsageInput2DFDocDAO scUsageInput2DocDao = new SCUsageInput2DFDocDAO(connection, userProfile);
			SCUsageInput2DFDoc scUsageInput2DFDoc = new SCUsageInput2DFDoc();
			scUsageInput2DFDoc.scUsageInputRef.code = scUsageInput.code;
			scUsageInput2DFDoc.dfDocCode = doc.code;
			scUsageInput2DFDoc.dfDocDate = doc.dateRegistration;
			scUsageInput2DFDoc.dfDocDescription = doc.description;
			scUsageInput2DFDoc.dfDocNumber = doc.docNum;
			scUsageInput2DFDoc.dfDocSubtypeCode = doc.docSubTypeRef.code;
			scUsageInput2DFDoc.dfDocTypeCode = doc.docTypeRef.code;
			scUsageInput2DocDao.add(scUsageInput2DFDoc);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public SCUsageInput getSCUsageInputByDFDocCode(int dfDocCode) {
		if (dfDocCode <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ���������!");
		}

		try {
			SCUsageInput2DFDocDAO scUsageInput2DocDao = new SCUsageInput2DFDocDAO(connection, userProfile);
			SCUsageInput2DFDocFilter scUsageInput2DocFilter = new SCUsageInput2DFDocFilter();
			scUsageInput2DocFilter.dfDocCode = dfDocCode;
			int[] scUsageInput2DocCodes = scUsageInput2DocDao.getFilteredCodeArray(scUsageInput2DocFilter, 0, -1);

			if (scUsageInput2DocCodes.length == 0) {
				return null;
			}

			SCUsageInput2DFDoc scUsageInput2DFDoc = scUsageInput2DocDao.getObject(scUsageInput2DocCodes[0]);
			SCUsageInputDAO scUsageInputDao = new SCUsageInputDAO(connection, userProfile);
			return scUsageInputDao.getObjectNOSEGR(scUsageInput2DFDoc.scUsageInputRef.code);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void removeSCUsageInput2DFDoc(int scUsageInputCode, int docCode) {
		removeSCUsageInput2DFDoc(scUsageInputCode, docCode, false);
	}

	public void removeSCUsageInput2DFDoc(int scUsageInputCode, int docCode, boolean removeAll) {
		if (scUsageInputCode <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ��������� �� �������� ��������� � ������������!");
		}
		if (docCode <= 0 && !removeAll) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ���������!");
		}

		try {
			SCUsageInput2DFDocDAO scUsageInput2DocDao = new SCUsageInput2DFDocDAO(connection, userProfile);
			SCUsageInput2DFDocFilter scUsageInput2DocFilter = new SCUsageInput2DFDocFilter();
			scUsageInput2DocFilter.scUsageInputRef.code = scUsageInputCode;
			scUsageInput2DocFilter.dfDocCode = docCode;
			int[] scUsageInput2DocCodes = scUsageInput2DocDao.getFilteredCodeArray(scUsageInput2DocFilter, 0, -1);			

			if (scUsageInput2DocCodes.length > 0) {
				SCUsageInputDAO scUsageInputDao = new SCUsageInputDAO(connection, userProfile);
				SCUsageInput scUsageInput = scUsageInputDao.getObjectNOSEGR(scUsageInputCode);
				if (scUsageInput.statusRef.code != SCUsageInputStatus.GOOD) {
					throw new SystemException("\n\nNET-4596 �������� �� �������� ��������� � ������������ ������� ���� ��������! " +
							"�������� � ����� " + scUsageInput.code + " �� � ��������!");
				}
			}

			for (int scUsageInput2DocCode : scUsageInput2DocCodes) {
				scUsageInput2DocDao.remove(scUsageInput2DocCode);
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void cancelDFDoc(int scUsageInputCode) {
		if (scUsageInputCode <= 0) {
			throw new IllegalArgumentException("\n\nNET-4596 �� ������� ��� ��������� �� �������� ��������� � ������������!");
		}

		int docCode = getDFDocCodeForSCUsageInput(scUsageInputCode);
		if (docCode <= 0) {
			return;
		}

		Connection dfConnection = null;

		try {
			dfConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			DocFlowLogic docFlowLogic = new DocFlowLogic(dfConnection, userProfile);
			docFlowLogic.setCancel(docCode, true);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (dfConnection != null && !dfConnection.isClosed()) {
					dfConnection.close();
					dfConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

    public String getUserNameForFKBySCUsageInput(int scUsageInputCode) {
		if (scUsageInputCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��������� �� �������� ��������� � ������������!");
		}

		String userName = userProfile.userName;

		int dfDocCode = getDFDocCodeForSCUsageInput(scUsageInputCode);
		// ��� ���������� � ������� ��� ����� ��������� �������� � �� ��� ������ "energynet"
		if (dfDocCode > 0) {
			userName = "energynet";
		}

		return userName;
    }

    public int getSCUsageInputCodeByActCode(int actCode) {
		if (actCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ����!");
		}

		try {
			SCUsageInputDAO scUsageInputDao = new SCUsageInputDAO(connection, userProfile);
			SCUsageInputFilter scUsageInputFilter = new SCUsageInputFilter();
			scUsageInputFilter.conditionSQL =
					" code in ( " +
					"  select uii.usageinputrefcode " +
					"  from scusageinputitem uii, scusageinputitemoz oz, scusageinputitemoz2nct iia " +
					"  where iia.usageinputitemozrefcod = oz.code " +
					"    and oz.usageinputitemrefcode = uii.code " +
					"    and iia.enactrefcode = " + actCode +
					" )";
			int[] scUsageInputCodes = scUsageInputDao.getFilteredCodeArray(scUsageInputFilter, 0, -1);
			if (scUsageInputCodes.length > 0) {
				return scUsageInputCodes[0];
			} else {
				return Integer.MIN_VALUE;
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
    }

	public void checkOzInfo(int scUsageInputCode) {
		if (scUsageInputCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��������� �� �������� ��������� � ������������!");
		}

		try {
			int[] ozCodes = getOzCodes(scUsageInputCode, SCUsageInputItemKind.InputUsing);

			if (ozCodes.length == 0) {
				return;
			}

			SCUsageInputItemOZInfoDAO ozInfoDao = new SCUsageInputItemOZInfoDAO(connection, userProfile);
			for (int ozCode : ozCodes) {
				SCUsageInputItemOZInfoFilter ozInfoFilter = new SCUsageInputItemOZInfoFilter();
				ozInfoFilter.usageInputItemOZRef.code = ozCode;

				int[] ozInfoArr = ozInfoDao.getFilteredCodeArray(ozInfoFilter, 0, -1);
				if (ozInfoArr.length == 0) {
					throw new SystemException("\n\n"
							+ "�� �������� ���. ���������� ��� ���������� ������� �/� ��������� �� ��������!\n"
							+ "��������� ��������� ��������� ���������� �� ��-1!\n"
							+ "��� ��: " + ozCode);
				}
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void addOzInfo(int scUsageInputCode) {
		if (scUsageInputCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��������� �� �������� ��������� � ������������!");
		}

		try {
			int[] ozCodes = getOzCodes(scUsageInputCode, SCUsageInputItemKind.InputUsing);

			if (ozCodes.length == 0) {
				return;
			}

			ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);
			SCUsageInputItemOZInfoDAO ozInfoDao = new SCUsageInputItemOZInfoDAO(connection, userProfile);

			for (int ozCode : ozCodes) {
				int tkMaterialCode = getTKMaterialCodeForSCUsageInputItemOZ(ozCode);

				BigDecimal cost = getCounterCostForIncome(tkMaterialCode);

				// ���� �� ������� ���������� �����, ������� - 
				// ������������ ����� ����� ������� ��� ������ �������
				if (cost == null || cost.compareTo(new BigDecimal(0)) <= 0) {
					return;
				}

				SCUsageInputItemOZInfoFilter ozInfoFilter = new SCUsageInputItemOZInfoFilter();
				ozInfoFilter.usageInputItemOZRef.code = ozCode;

				SCUsageInputItemOZInfo ozInfo;

				int[] ozInfoArr = ozInfoDao.getFilteredCodeArray(ozInfoFilter, 0, -1);
				if (ozInfoArr.length == 0) {
					ozInfo = new SCUsageInputItemOZInfo();
					ozInfo.usageInputItemOZRef.code = ozCode;
				} else {
					ozInfo = ozInfoDao.getObject(ozInfoArr[0]);
				}

				ozInfo.sourceCode = "34";
				ozInfo.account = settingsLogic.getValue(ENSettingsKeysConsts.ACCOUNT_FOR_COUNTER_INCOME);
				ozInfo.expensesCode = "000000000000000";
				ozInfo.sumGen = cost;
				ozInfo.sumNds = new BigDecimal(0);
				ozInfo.sumWithNds = cost;

				if (ozInfoArr.length == 0) {
					ozInfoDao.add(ozInfo);
				} else {
					ozInfoDao.save(ozInfo);
				}
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * COMMENT from client:
	 * ���� �� �������� ��������, ��� ��������� ���� "��� ����������� (�� ����������)",
	 * �� ������� ����� �������, ��� ��� �� � ���������� �� ����������,
	 * � ��������� ������ (���� �� �� ��������), �������� ������������� ���������
	 *
	 * @param ozCode
	 * @return
	 */
	public boolean isForExpertise(int ozCode) {
		if (ozCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��!");
		}

		try {
			SCUsageInputItemOZ2SCCounterDAO ozCounterDao = new SCUsageInputItemOZ2SCCounterDAO(connection, userProfile);
			SCUsageInputItemOZ2SCCounterFilter ozCounterFilter = new SCUsageInputItemOZ2SCCounterFilter();
			ozCounterFilter.ozRef.code = ozCode;
			ozCounterFilter.conditionSQL = " exists (select 1 from sccounter as co1 " +
					" where co1.actinvitationnumber is not null " +
					" and co1.code = scusageinputtmz2sccntr.sccounterrefcode)";

			int[] ozCounterCodes = ozCounterDao.getFilteredCodeArray(ozCounterFilter, 0, -1);

			return (ozCounterCodes.length > 0);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	public void checkMolCodes(SCUsageInput scUsageInput) {
		// 24.12.2021 �.�.�. ������� �������� �����
		if (1 == 1) {
			return;
		}

		if (scUsageInput == null) {
			throw new IllegalArgumentException("\n\n�� ������� �������� �� �������� ��������� � ������������!");
		}
		if (scUsageInput.dateGen == null) {
			throw new IllegalArgumentException("\n\n�� ������ ���� ��������� �� �������� ��������� � ������������!");
		}

		if (scUsageInput.dateGen.compareTo(DFConsts.SCUSAGEINPUT_SIGNING_START) < 0) {
			return;
		}

		/* ����� �� ��������� ��� ������������� ���������? ���� ����� ���������
		if (scUsageInput.autoCreated == SCUsageInputAutoCreated.YES) {
			return;
		}
		*/

		if (scUsageInput.molCode == null || scUsageInput.molCodeCounter == null
				|| scUsageInput.molCode.trim().isEmpty() || scUsageInput.molCodeCounter.trim().isEmpty()) {
			throw new SystemException("\n\n�� ������ ��� ��� ��������� �� �������� ��������� � ������������ � ����� " +
					scUsageInput.code + " !");
		}

		if (! scUsageInput.molCode.equals(scUsageInput.molCodeCounter)) {
			throw new SystemException(String.format(ENConsts.SCUSAGEINPUT_CHECK_MOL_ERROR_MESSAGE +
					"��� ��� ���������: %s, ��� �� ������: %s.\n" +
					"��� ��������� ������� ������� ���������� ���������.",
					scUsageInput.molCode, scUsageInput.molCodeCounter));
		}

		// ��� ���������� ������ ��� ������ ���������
		if (scUsageInput.code == Integer.MIN_VALUE) {
			return;
		}

		try {
			SCUsageInputItemDAO scUsageInputItemDao = new SCUsageInputItemDAO(connection, userProfile);
			SCUsageInputItemFilter scUsageInputItemFilter = new SCUsageInputItemFilter();
			scUsageInputItemFilter.usageInputRef.code = scUsageInput.code;

			int[] scUsageInputItemCodes = scUsageInputItemDao.getFilteredCodeArray(scUsageInputItemFilter, 0, -1);

			for (int scUsageInputItemCode : scUsageInputItemCodes) {
				SCUsageInputItem scUsageInputItem = scUsageInputItemDao.getObject(scUsageInputItemCode);

				if (scUsageInputItem.molCode == null || scUsageInputItem.molCode.trim().isEmpty()) {
					throw new SystemException("\n\n�� ������ ��� ��� �������� � ����� " +
							scUsageInputItem.code + " !");
				}

				if (! scUsageInputItem.molCode.equals(scUsageInput.molCode)) {
					throw new SystemException(String.format(ENConsts.SCUSAGEINPUT_CHECK_MOL_ERROR_MESSAGE +
							"��� �� ��������: %s, ��� �� ��������: %s (����� ��������: %s).\n" +
							"��� ��������� ������� ������� ���������� ��������� �� ��� %s.\n" +
							"��� ��������� �� �������� � ������������ ���������: %d (� %s).",
							scUsageInput.molCode, scUsageInputItem.molCode, scUsageInputItem.numberDoc,
							scUsageInput.molCode, 
							scUsageInput.code, scUsageInput.numberDoc));
				}
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 * ��������, �������� �� �� �� ���� ��������� � ������������ ������ ��������� ��������
	 * ��� ��������, ����������� �� �������� (�.�. ������ ������ � ������ 
	 * "��������� � ������������" � "������ �/� � ��")
	 *
	 * @param scUsageInputCode - ��� ��������� �� ���� ��������� � ������������
	 *
	 * @return {@code true}, ���� �������� �������� ������ ��������� ��������, ����� {@code false}
	 */
	public boolean containsOnlyUsageOut(int scUsageInputCode) {
		if (scUsageInputCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��������� �� �������� ��������� � ������������!");
		}

		try {
			SCUsageInputItemDAO scUsageInputItemDAO = new SCUsageInputItemDAO(userProfile, connection);
			SCUsageInputItemFilter scUsageInputItemFilter = new SCUsageInputItemFilter();
			scUsageInputItemFilter.usageInputRef.code = scUsageInputCode;

			int[] scUsageInputItemCodes = scUsageInputItemDAO.getFilteredCodeArray(scUsageInputItemFilter, 0, -1);
			if (scUsageInputItemCodes.length == 0) {
				return false;
			}

			for (int scUsageInputItemCode : scUsageInputItemCodes) {
				SCUsageInputItem scUsageInputItem = scUsageInputItemDAO.getObject(scUsageInputItemCode);
				if (scUsageInputItem.kindRef.code != SCUsageInputItemKind.UsageOut && 
						scUsageInputItem.kindRef.code != SCUsageInputItemKind.InputUsing) {
					return false;
				}
			}

			return true;
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	private int getTKMaterialCodeForSCUsageInputItemOZ(int ozCode) {
		if (ozCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��!");
		}

		try {
			SCCounterDAO scCounterDao = new SCCounterDAO(connection, userProfile);
			SCCounterFilter scCounterFilter = new SCCounterFilter();
			scCounterFilter.conditionSQL = "sccounter.code in " +
					"(select scusageinputtmz2sccntr.sccounterrefcode from scusageinputtmz2sccntr " +
					"  where scusageinputtmz2sccntr.ozrefcode = " + ozCode + ")";

			int[] scCounterCodes = scCounterDao.getFilteredCodeArray(scCounterFilter, 0, -1);

			if (scCounterCodes.length == 0) {
				throw new SystemException("\n\n�� �������� ��������� ��� �� � ����� " + ozCode + " !");
			}

			SCCounter scCounter = scCounterDao.getObject(scCounterCodes[0]);

			ENEstimateItemDAO estimateItemDao = new ENEstimateItemDAO(connection, userProfile);
			ENEstimateItem estimateItem = estimateItemDao.getObject(scCounter.estimateItemRef.code);
			return estimateItem.materialRef.code;
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	private BigDecimal getCounterCostForIncome(int tkMaterialCode) {
		if (tkMaterialCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ������������ �������� ��� ���������� ������� ���������!");
		}

		// ����������
		if (Tools.checkValueInArray(tkMaterialCode, new int[] {
				TKConsts.TKMATERIALS_COUNTER_1F_OLD,
				TKConsts.TKMATERIALS_COUNTER_1F,
				TKConsts.TKMATERIALS_COUNTER_1FService})) {

			return new BigDecimal(0.30).setScale(2, BigDecimal.ROUND_HALF_UP);

		}

		// ����������
		else if (Tools.checkValueInArray(tkMaterialCode, new int[] {
				TKConsts.TKMATERIALS_COUNTER_3F_OLD,
				TKConsts.TKMATERIALS_COUNTER_3F,
				TKConsts.TKMATERIALS_COUNTER_3FService})) {

			return new BigDecimal(0.69).setScale(2, BigDecimal.ROUND_HALF_UP);

		}

		return null;
	}

	private int[] getOzCodes(int scUsageInputCode, int scUsageInputItemKind) {
		if (scUsageInputCode <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� ��������� �� �������� ��������� � ������������!");
		}
		if (scUsageInputItemKind <= 0) {
			throw new IllegalArgumentException("\n\n�� ������� ��� �������� �� �������� ��������� � ������������!");
		}

		try {
			SCUsageInputItemOZDAO ozDao = new SCUsageInputItemOZDAO(connection, userProfile);
			SCUsageInputItemOZFilter ozFilter = new SCUsageInputItemOZFilter();
			ozFilter.conditionSQL =
					"code in (" +
					" select oz.code " +
					" from scusageinputitemoz oz, scusageinputitem ii " +
					" where oz.usageinputitemrefcode = ii.code " +
					"   and ii.kindrefcode = " + scUsageInputItemKind +
					"   and ii.usageinputrefcode = " + scUsageInputCode + ")";

			return ozDao.getFilteredCodeArray(ozFilter, 0, -1);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

}
