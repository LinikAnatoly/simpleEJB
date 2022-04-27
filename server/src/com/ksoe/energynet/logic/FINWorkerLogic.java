package com.ksoe.energynet.logic;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

public class FINWorkerLogic extends LogicModule {

	public FINWorkerLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}

	public FINWorker checkUnicFinWorker(FINWorker newFinWorker)
			throws PersistenceException {

		/**
		 * проверка уникальности по полям....
		 * name, tabnumber, positionname,
		 * positioncode, departmentname, departmentcode, pricegen,
		 * fincode, issentassignment, kindrefcode, chargepercent, chargerefcode, categorid, worktimeid, positionId
		 *
		 */

		FINWorkerFilter filter = new FINWorkerFilter();
		filter.name = newFinWorker.name;
		filter.tabNumber = newFinWorker.tabNumber;
		filter.positionName = newFinWorker.positionName;
		filter.positionCode = newFinWorker.positionCode;
		filter.departmentName = newFinWorker.departmentName;
		filter.departmentCode = newFinWorker.departmentCode;
		filter.priceGen = newFinWorker.priceGen;
		filter.finCode = newFinWorker.finCode;
		filter.isSentAssignment = newFinWorker.isSentAssignment;
		filter.kindRef.code = newFinWorker.kindRef.code;
		filter.chargePercent = newFinWorker.chargePercent;
		filter.chargeRef.code = newFinWorker.chargeRef.code;
		//26.02.2015 добавил поля с категорие персонала (робітник . керівник и т.д) и айди графика рабочего времени
		filter.categorId =  newFinWorker.categorId;
		filter.workTimeId = newFinWorker.workTimeId;

		filter.positionId = newFinWorker.positionId;


		FINWorkerDAO finWorkerDAO = new FINWorkerDAO(connection, userProfile);
		int[] workerArr = finWorkerDAO.getUnicFilteredCodeArray(filter, 0, 1);

		if (workerArr.length > 0) {
			FINWorker distFinWorker = finWorkerDAO.getObject(workerArr[0]);
			return distFinWorker;
		} else {
			return newFinWorker;
		}
	}



}
