package com.ksoe.energynet.logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENMetrologyCounterDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderDAO;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.brief.ENMetrologyCounterShort;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENMetrologyCounterShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.valueobject.TKAccountingType;

public class CounterLogic extends LogicModule{

	// mode 1 - �������� .. 0 ��������� ;)
	public void unLockByActForMetrology(int actCode, int mode) throws PersistenceException
	{
		ENWorkOrderFilter f = new ENWorkOrderFilter();
		f.conditionSQL = " enworkorder.code in (" +
			" select enworkorder2enplanwork.workordercode from enworkorder2enplanwork, enact2enplanwork " +
			" where  " +
			"  " +
			" enact2enplanwork.plancode = enworkorder2enplanwork.plancode " +
			" and enact2enplanwork.actrefcode = " + actCode +
			")";

		ENWorkOrderDAO dao = new ENWorkOrderDAO(connection, userProfile);

		//ENMetrologyCounterDAO cntDAO = new ENMetrologyCounterDAO(connection, userProfile);

		PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);

		int[] arr = dao.getFilteredCodeArray(f, f.conditionSQL, null, 0, -1, null);
		for (int i=0; i < arr.length; i++){
			ENWorkOrder wo = dao.getObject(arr[i]);
			ENPlanWork pw = planLogic.getPlanByWorkOrderCode(wo.code);
			if (pw.code > Integer.MIN_VALUE){
			   ENMetrologyCounter cnt = getCounterByElementCode(pw.elementRef.code);
			   lockCounterForMetrology(cnt, wo, mode, pw.stateRef.code);
			}
		}
	}


	public void lockCounterForMetrology(ENMetrologyCounter obj, ENWorkOrder workOrder11, int mode, int planWorkState)
	{

		try
		{
			// �������� �������� �������� �� ����� �������������
			if(obj != null && obj.accountingTypeRef.code == TKAccountingType.OS) {
				return;
			}
			
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);

			ENWorkOrder workOrder = workOrder11;

			boolean isUsing = false;
			// ���� ��������� - �� ��������� ��� �� ��� � ������ ������ ...
			if (mode == 0){

				if (obj == null){
					throw new EnergyproSystemException("˳������� �� �������� ... " );
				}

				if (workOrder == null){
					// ���� �� ���� ��� ������ ���� ���� ����� ������� ����/����� ... !!!
					//throw new EnergyproSystemException("����� �� �������� ��� ������������� ˳�������� � ��� � " + (obj != null ? obj.invNumber : " ��� ������ "));
					isUsing = false;
					workOrder = new ENWorkOrder();
					workOrder.code = Integer.MIN_VALUE;
					workOrder.workOrderNumber = "-1";
					workOrder.dateGen = new Date();
				}


				ENWorkOrderFilter f = new ENWorkOrderFilter();
				f.conditionSQL = "enworkorder.code in (" +
					" select enworkorder.code from enworkorder , enworkorder2enplanwork, enplanwork " +
					" where  " +
					" enworkorder.code = enworkorder2enplanwork.workordercode " +
					" and enplanwork.code = enworkorder2enplanwork.plancode " +
					" and enplanwork.statuscode <> " + ENPlanWorkStatus.LOCKED +
					" and enworkorder.code <> " + workOrder.code +
					" and enplanwork.elementrefcode = " + obj.element.code +
					")";

				ENWorkOrderDAO dao = new ENWorkOrderDAO(connection, userProfile);
				int[] arr = dao.getFilteredCodeArray(f, f.conditionSQL, null, 0, -1, null);
				// ���� ��� ;) !!!!
				//isUsing = arr.length == 0 ? false : true;
				isUsing = arr.length <= 2 ? false : true;

				if (isUsing) throw new EnergyproSystemException("������ � ���-�� �������("+ workOrder.workOrderNumber +") �� ������� ... ������� � ���(qqq)");
			}
			else
			{
				// ��� ���������� �������� ���� �������� � ���� ��� ����� ...
				ENMetrologyCounterFilter cntFilter = new ENMetrologyCounterFilter();
				cntFilter.invNumber = obj.invNumber;
				//cntFilter.buildNumber
				ENMetrologyCounterShortList cntList = scLogic.getCountersListFromScanCounter(cntFilter, 0, -1);
				if (cntList.totalCount != 1){
					throw new EnergyproSystemException("ʳ������ ��������� �� ������� 1 (" + cntList.totalCount + "), ���.� " + obj.invNumber);
				}

				if (workOrder.finMolCode != null){
					//if ( ! workOrder.finMolCode.equals(cntList.get(0).molCode))
					if (( cntList.get(0).molCode.equals("2734") ) || ( cntList.get(0).molCode.equals("2737") ))
					{
						//throw new EnergyproSystemException("��� � �����(" + workOrder.finMolCode + ") �� ������� � ��� ���������("+ cntList.get(0).molCode +") ...");
						throw new EnergyproSystemException("� ����� ���("+ cntList.get(0).molCode +") ��������� ����������� �� ����� ...");
					}
				}
			}

			//new CounterLogic(connection, userProfile).lockCounter(obj, workOrder, mode);
			if ( ! isUsing){
				int lockMode;

				// 01.09.14 NET-4392 ��� ����� ���������� ���� ��� ����������
				if (planWorkState != ENPlanWorkState.COUNTERS_ACT_DEFECT)
				{
					lockMode = ((mode == 1) ? ENMetrologyCounter.METROLOGY_LOCK : (ENMetrologyCounter.METROLOGY_LOCK * (-1)));
				}
				else
				{
					lockMode = ((mode == 1) ? ENMetrologyCounter.ACT_DEFECT_LOCK : (ENMetrologyCounter.ACT_DEFECT_LOCK * (-1)));
				}

			   updateCounter( obj.scCode, workOrder.workOrderNumber, workOrder.dateGen, mode,  lockMode);

			}

		} catch (Exception e) {
			throw new EnergyproSystemException(e);
		}
	}

	public String lockCode2Text(int lockCode){
		String out = "������� ...";
		if (lockCode == ENMetrologyCounter.METROLOGY_LOCK ){
			out = "���������";
		}
		else
		if (lockCode == ENMetrologyCounter.MOVED_LOCK){
			out = "����������";
		}
		if (lockCode == ENMetrologyCounter.BILLING_LOCK){
			out = "������ � �����";
		}
		if (lockCode == ENMetrologyCounter.NEW_COUNTERS_LOCK){
			out = "���������� �� �����������";
		}
		if (lockCode == ENMetrologyCounter.WRITE_OFF_LOCK){
			out = "��������";
		}
		if (lockCode == ENMetrologyCounter.SERVICES_COUNTERS_LOCK){
			out = "������ ��� ������������ ���������";
		}
		if (lockCode == ENMetrologyCounter.ACT_DEFECT_LOCK){
			out = "��� ���������� ���������";
		}
		return out;
	}
	
	public void checkCounterLock(ENMetrologyCounter obj) {
		try {
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);
			ENMetrologyCounterFilter f = new ENMetrologyCounterFilter();
			f.scCode = obj.scCode;
			ENMetrologyCounterShortList scList = scLogic.getCountersListFromScanCounter(f, 0, -1);
			if (scList.totalCount != 1) {
				throw new EnergyproSystemException("������� �� ������ ��� ������ 1 ... ��� = " + f.scCode);
			}
			ENMetrologyCounterShort cnt = scList.get(0);
			if ( cnt.lockCode > 0) {
				String lockInfo = lockCode2Text(cnt.lockCode) + " � ��� " + cnt.lockReason + " �� " 
						+ ((cnt.lockDate != null) ? Tools.dateFormatDefault.format(cnt.lockDate) : " ������� ");
				System.out.println(String.format("COUNTER IS LOCKED (inventoryNumber %s for %s)", cnt.invNumber, lockInfo));
				throw new SystemException(String.format("˳������� ���. �%s ��� ������������: %s", cnt.invNumber, lockInfo));
			}			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			
		}

		
	}

	//mode = 1 - �����, 0 - �������� ...
	// lockCode - �� ���� �����/����������� ... (�� ENMetrologyCounter )
	// lockCode < 0 - ����������� �� ������ .. ������ 0 - ����� ..
	public void lockCounter(ENMetrologyCounter obj, String numberGen, Date dateGen, int lockCode)
	{
		Connection fkConnection = null;

		try
		{

			//���� �� ��� ���� ������ ...
			if (obj.scCode == Integer.MIN_VALUE){
				//throw new EnergyproSystemException("��� ���� �� �� ...");
				return;
			}

			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), userProfile);


			//f.invNumber = obj.invNumber;
			ENMetrologyCounterFilter f = new ENMetrologyCounterFilter();
			f.scCode = obj.scCode;
			ENMetrologyCounterShortList scList = scLogic.getCountersListFromScanCounter(f, 0, -1);
			if (scList.totalCount != 1) {
				throw new EnergyproSystemException("������� �� ������ ��� ������ 1 ... ��� = " + f.scCode);
			}

			ENMetrologyCounterShort cnt = scList.get(0);

			if ( lockCode > 0){

				// $) �� ��� ������������ � ������� ... ����� 10 ��� ;) .. � ��� ���� ����� ���� �������� :(if ( cnt.lockCode != Integer.MIN_VALUE){
				if (cnt.lockCode > 0){
					if ((cnt.lockCode + lockCode) != 0)
					{
						if ( cnt.lockCode != Integer.MIN_VALUE)
						{
							throw new EnergyproSystemException("˳������� (���="+ obj.scCode +") ��� ������������ : " + lockCode2Text(cnt.lockCode) + " � ��� " + cnt.lockReason + " �� " + ((cnt.lockDate != null) ? new SimpleDateFormat("dd.MM.yyyy").format(cnt.lockDate) : " ������� "));
						}
					}
				}

			}

			if ( lockCode < 0){
				// ���� ������������ .. � �� �� ������������ - ����� ...
				if (cnt.lockCode == Integer.MIN_VALUE) return;

				if ( Math.abs(lockCode) != cnt.lockCode && cnt.lockCode > 0){
					throw new EnergyproSystemException("˳������� (���="+ obj.scCode +") ������������ ��� ���� ���� : " + lockCode2Text(cnt.lockCode) + " � ��� " + cnt.lockReason + " �� " + ((cnt.lockDate != null) ? new SimpleDateFormat("dd.MM.yyyy").format(cnt.lockDate) : " ������� "));
				}
			}

			int mode = lockCode > 0 ? 1 : 0 ;
			updateCounter(obj.scCode, numberGen, dateGen, mode, lockCode);


		} catch (Exception e) {
			throw new EnergyproSystemException(e);
		} finally {

			try {
				if  ( (fkConnection != null) && ! fkConnection.isClosed() )
					fkConnection.close();
			} catch (SQLException e) {
			}
		}
	}


	public ENMetrologyCounter getCounterByElementCode(int elementCode) throws PersistenceException
	{
		ENMetrologyCounter cnt = null;
		ENMetrologyCounterFilter cntFilter = new ENMetrologyCounterFilter();
		cntFilter.element.code = elementCode;
		ENMetrologyCounterDAO cntDAO = new ENMetrologyCounterDAO(connection, userProfile);
		int[] cntArr = cntDAO.getFilteredCodeArray(cntFilter, null, null, 0, -1, null);

		if (cntArr.length != 1)
			throw new EnergyproSystemException("������ � ��������� ��������� ... ��� �������� = " + elementCode);

		cnt = cntDAO.getObject(cntArr[0]);

		return cnt;
	}

    /**
    * �������� ��� ������� ��������, ����������� � �������� ���, ��������� �� �� �� ���������� ���. �����
    *
    * @param actCode - ��� ����
    * @param allowedAccounts - ��������� ������ ����������� ���. ������
    * @param isException - ���������� �� ���������� (true - ��)
    *
    * @return true - ���� ��� �������� �� ���� ������ �������� �� ������, ����� - false
    */
	public boolean checkAccountsByActCode(int actCode, String[] allowedAccounts, boolean isException) throws PersistenceException
	{
		if (actCode == Integer.MIN_VALUE)
		{
			throw new EnergyproSystemException("\n\nNET-4392 �� ������� ��� ����!");
		}

		if (allowedAccounts.length == 0)
		{
			throw new EnergyproSystemException("\n\nNET-4392 �� ������� ������ ����������� ������� ��� ���������!");
		}

		ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
		planFilter.conditionSQL =
			" code in " +
			" (select ap.plancode " +
			"    from enact2enplanwork ap " +
			"   where ap.actrefcode = " + actCode + ")";

		ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

		int[] planArr = planDAO.getFilteredCodeArrayNOSEGR(planFilter, 0, -1);

		if (planArr.length == 0)
		{
			throw new EnergyproSystemException("\n\nNET-4392 �� ���� � ����� " + actCode + " �� �������� ������� �����!");
		}

		for (int i = 0; i < planArr.length; i++)
		{
			boolean isAccountCorrect = false;

			ENPlanWork plan = planDAO.getObjectNOSEGR(planArr[i]);

			if (plan != null)
			{
			   ENMetrologyCounter counter = getCounterByElementCode(plan.elementRef.code);

			   if (counter == null)
			   {
				   throw new EnergyproSystemException("\n\nNET-4392 ˳������� ��� ����� � ����� " + planArr[i] + " (��� �����) �� ��������!");
			   }

			   if (counter.invNumber == null)
			   {
				   throw new EnergyproSystemException("\n\nNET-4392 ˳������� ��� ����� � ����� " + planArr[i] + " (��� �����) �� �� ���. ������!");
			   }

			   for (int j = 0; j < allowedAccounts.length; j++)
			   {
				   if (counter.account.equals(allowedAccounts[j]))
				   {
					   isAccountCorrect = true;
					   break;
				   }
			   }

			   if (! isAccountCorrect)
			   {
				   if (! isException)
				   {
					   return false;
				   }
				   else
				   {
					   String strAccounts = "";

					   for (int j = 0; j < allowedAccounts.length; j++)
					   {
						   if (strAccounts.length() == 0)
						   {
							   strAccounts = allowedAccounts[j];
						   }
						   else
						   {
							   strAccounts = strAccounts + ", " + allowedAccounts[j];
						   }
					   }

					   throw new EnergyproSystemException("\n\nNET-4392 ˳������� � ���. � " + counter.invNumber + " ����������� �� �������������� ���. ������� (" + counter.account + ") !\n" +
							   "������ ����������� ���. �������: " + strAccounts);
				   }
			   }
			}
			else
			{
				throw new EnergyproSystemException("\n\nNET-4392 ���� � ����� " + planArr[i] + " �� ��������!");
			}
		}

		return true;
	}

    /**
    * �������� �� ���������� ���. ����� ��� ���� ���������, ���������� � �������� ���
    *
    * @param actCode - ��� ����
    * @param isException - ���������� �� ���������� (true - ��)
    *
    * @return true - ���� ��� �������� �� ���� ��������� �� ����� ���. �����, ����� - false
    */
	public boolean checkAccountsEqualityByActCode(int actCode, boolean isException) throws PersistenceException
	{
		if (actCode == Integer.MIN_VALUE)
		{
			throw new EnergyproSystemException("\n\nNET-4392 �� ������� ��� ����!");
		}

		ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
		planFilter.conditionSQL =
			" code in " +
			" (select ap.plancode " +
			"    from enact2enplanwork ap " +
			"   where ap.actrefcode = " + actCode + ")";

		ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);

		int[] planArr = planDAO.getFilteredCodeArrayNOSEGR(planFilter, 0, -1);

		if (planArr.length == 0)
		{
			throw new EnergyproSystemException("\n\nNET-4392 �� ���� � ����� " + actCode + " �� �������� ������� �����!");
		}

		ENPlanWork tmpPlan = planDAO.getObjectNOSEGR(planArr[0]);
		ENMetrologyCounter tmpCounter = null;

		if (tmpPlan != null)
		{
			tmpCounter = getCounterByElementCode(tmpPlan.elementRef.code);
			if (tmpCounter == null)
			{
				throw new EnergyproSystemException("\n\nNET-4392 ˳������� ��� ����� � ����� " + planArr[0] + " (��� �����) �� ��������!");
			}
		}
		else
		{
			throw new EnergyproSystemException("\n\nNET-4392 ���� � ����� " + planArr[0] + " �� ��������!");
		}

		for (int i = 1; i < planArr.length; i++)
		{
			ENPlanWork plan = planDAO.getObjectNOSEGR(planArr[i]);

			if (plan != null)
			{
			   ENMetrologyCounter counter = getCounterByElementCode(plan.elementRef.code);

			   if (counter == null)
			   {
				   throw new EnergyproSystemException("\n\nNET-4392 ˳������� ��� ����� � ����� " + planArr[i] + " (��� �����) �� ��������!");
			   }

			   if (counter.invNumber == null)
			   {
				   throw new EnergyproSystemException("\n\nNET-4392 ˳������� ��� ����� � ����� " + planArr[i] + " (��� �����) �� �� ���. ������!");
			   }

			   if (! counter.account.equals(tmpCounter.account))
			   {
				   if (! isException)
				   {
					   return false;
				   }
				   else
				   {
					   throw new EnergyproSystemException("\n\nNET-4392 ���. ������� ��������� � ���. � " + counter.invNumber +
							   " (" + counter.account + ") ����������� �� ������� ����� ��������� (" + tmpCounter.account + ") � ����� ���!");
				   }
			   }
			}
			else
			{
				throw new EnergyproSystemException("\n\nNET-4392 ���� � ����� " + planArr[i] + " �� ��������!");
			}
		}

		return true;
	}


	public CounterLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}

	// ����� ������� � ������������ ... 1 - �������� 0 - ������� �� ������
	public void updateCounter(int counterSCCode, String workOrderNumber,
			Date workOrderDate, int mode, int lockCode)
			throws PersistenceException {

		String sql = "";
        PreparedStatement statement = null;
        ResultSet  set = null;

		try {

			sql = "update countersread.ostable set energy_lock = ?, order_num = ?, order_date = ? where num_un = ?";

            Connection connection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

            statement = connection.prepareStatement(sql);

            // ��� �� ������������ +- ������ ...
            statement.setString(1, new Integer(lockCode).toString());

            if (workOrderNumber != null)
                statement.setString(2, workOrderNumber);
            else
                statement.setNull(2, java.sql.Types.VARCHAR);


            if (workOrderDate == null)
                statement.setNull(3, java.sql.Types.DATE);
            else
                statement.setDate(3,new java.sql.Date(workOrderDate.getTime()));

            statement.setInt(4, counterSCCode);

            statement.execute();

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + sql);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}

		}
	}




}
