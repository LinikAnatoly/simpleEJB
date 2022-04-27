
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENFuelSheetVolumes;
 *
 */

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENFuelDistributionSheetItemDAO;
import com.ksoe.energynet.dataminer.ENFuelSheetVolItemDataDAO;
import com.ksoe.energynet.dataminer.ENFuelSheetVolumesDAO;
import com.ksoe.energynet.dataminer.ENFuelSheetVolumesItemDAO;
import com.ksoe.energynet.ejb.generated.ENFuelSheetVolumesControllerEJBGen;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENFuelSheetVolItemData;
import com.ksoe.energynet.valueobject.ENFuelSheetVolumes;
import com.ksoe.energynet.valueobject.ENFuelSheetVolumesItem;
import com.ksoe.energynet.valueobject.ENFuelSheetVolumesStatus;
import com.ksoe.energynet.valueobject.filter.ENFuelDistributionSheetItemFilter;
import com.ksoe.energynet.valueobject.filter.ENFuelSheetVolItemDataFilter;
import com.ksoe.energynet.valueobject.filter.ENFuelSheetVolumesFilter;
import com.ksoe.energynet.valueobject.filter.ENFuelSheetVolumesItemFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolItemDataShortList;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolumesItemShortList;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolumesShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENFuelSheetVolumesControllerEJB extends
		ENFuelSheetVolumesControllerEJBGen {

	public ENFuelSheetVolumesControllerEJB() {
	}

	/* ENFuelSheetVolumes. Добавить */
	public int add(ENFuelSheetVolumes object, int year, int month, int decadeNumber) {

		Connection fkConnection = null;
		try {
			ENFuelSheetVolumesDAO objectDAO = new ENFuelSheetVolumesDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			fkConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			FINLogic finLogic = new FINLogic(fkConnection, getUserProfile());

			object.userGen = getUserProfile().userName;
			object.dateGen = new Date();
	        object.dateEdit = new Date();
	        object.statusRef.code = ENFuelSheetVolumesStatus.DRAFT;

	        ///// Засетим даты, исходя из заданной декады
	        object.startDate = Tools.getDecadeStart(year, month, decadeNumber);
	        object.endDate = Tools.getDecadeEnd(year, month, decadeNumber);
	        /////

	        ///// Проверим, нет ли уже сформированных ведомостей за такой же период (у которых периоды пересекаются с нашей)
	        ENFuelSheetVolumesFilter fuelSheetVolumesFilter = new ENFuelSheetVolumesFilter();
	        fuelSheetVolumesFilter.fuelType = object.fuelType;
	        fuelSheetVolumesFilter.conditionSQL =
	        		"(to_date('" + new SimpleDateFormat("dd.MM.yyyy").format(object.startDate) + "', 'dd.MM.yyyy')" +
	        		" between ENFUELSHEETVOLUMES.STARTDATE and ENFUELSHEETVOLUMES.ENDDATE) OR " +
	        		"(to_date('" + new SimpleDateFormat("dd.MM.yyyy").format(object.endDate) + "', 'dd.MM.yyyy')" +
	        		" between ENFUELSHEETVOLUMES.STARTDATE and ENFUELSHEETVOLUMES.ENDDATE)";
	        ENFuelSheetVolumesShortList fuelSheetVolumesList = objectDAO.getScrollableFilteredList(fuelSheetVolumesFilter, 0, -1);

	        if (fuelSheetVolumesList.totalCount > 0)
	        {
	        	throw new SystemException("\n\nNET-4440 Вже є сформовані відомості за такий же період (" +
	        			"\"" + fuelSheetVolumesList.get(0).name + "\", код: " + fuelSheetVolumesList.get(0).code + ") !");
	        }
	        /////


			String fuelType = "";
			switch (object.fuelType) {
				case FuelType.A92: {
					fuelType = "500000120,500002447";
					break;
				}
				case FuelType.A95: {
					fuelType = "75000844";
					break;
				}
				case FuelType.DT: {
					fuelType = "75000843";
					break;
				}
			}


	        ///// Проверим, есть ли утвержденные лимиты выдачи ГСМ на нужный нам период
	        ENFuelDistributionSheetItemDAO fuelDistributionSheetItemDAO = new ENFuelDistributionSheetItemDAO(
	        		getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        ENFuelDistributionSheetItemFilter fuelDistributionSheetItemFilter = new ENFuelDistributionSheetItemFilter();
	        fuelDistributionSheetItemFilter.decadeNumber = decadeNumber;
	        fuelDistributionSheetItemFilter.conditionSQL =
	        	"ENFUELDISTRIBUTINSHTTM.FUELDISTRIBUTIONREFCOD in " +
        		" ( " +
        		"  select fds.code " +
				"  from ENFUELDISTRIBUTIONSHET fds " +
				"  where fds.monthgen = " + month +
				"    and fds.yeargen = " + year +
				"    and fds.fueltyperefcode in " +
				"    (select ft.code " +
				"     from tkfueltype ft " +
				"     where ft.materialrefcode in (" + fuelType + ")) " +
				" )";

	        int[] fuelDistributionSheetItemArr = fuelDistributionSheetItemDAO.getFilteredCodeArray(fuelDistributionSheetItemFilter, 0, -1);

	  //      if (fuelDistributionSheetItemArr.length == 0)
	     //   {
	  //      	throw new SystemException("\n\nNET-4440 Не знайдено затверджених обсягів видачі палива за вказаний період!");
	 //       }
	        /////


	        int sheetCode = objectDAO.add(object);

	        /** заполнение данных для ведомости */
			ENFuelSheetVolItemDataDAO dataDao = new ENFuelSheetVolItemDataDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENFuelSheetVolItemDataShortList dataList = dataDao.getDataList(object.startDate, object.endDate, fuelType);
			for (int i = 0; i < dataList.totalCount; i++) {
				ENFuelSheetVolItemData sheetData =  new ENFuelSheetVolItemData();

				sheetData.code = Integer.MIN_VALUE;
				sheetData.plan_code = dataList.get(i).plan_code;
				sheetData.datestart = dataList.get(i).datestart;
				sheetData.countfact = dataList.get(i).countfact;
				sheetData.kindcode = dataList.get(i).kindcode;
				sheetData.staterefcode = dataList.get(i).staterefcode;
				sheetData.typerefcode = dataList.get(i).typerefcode;
				sheetData.budgetrefcode = dataList.get(i).budgetrefcode;
				sheetData.materialrefcode = dataList.get(i).materialrefcode;
				sheetData.transport_department = dataList.get(i).transport_department;
				sheetData.departmentrefcode = dataList.get(i).departmentrefcode;
				sheetData.eikindcode = dataList.get(i).eikindcode;
				sheetData.sheetVolumesRef.code = sheetCode;

				dataDao.add(sheetData);
			}

	        /** формирование строк ведомости */
			ENFuelSheetVolumesItemDAO itemDao = new ENFuelSheetVolumesItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENFuelSheetVolumesItemShortList itemList = itemDao.getItemList(sheetCode, year, month, decadeNumber, object.startDate, object.endDate);
			for (int g = 0; g < itemList.totalCount; g++) {
				ENFuelSheetVolumesItem item = new ENFuelSheetVolumesItem();

				item.code = Integer.MIN_VALUE;

		        item.depname = itemList.get(g).depname;
		        item.pmm_count_on_start = itemList.get(g).pmm_count_on_start;
		        item.pmm_count_on_start_all = itemList.get(g).pmm_count_on_start_all;
		        item.services_plan = itemList.get(g).services_plan;
		        item.current_repair_plan = itemList.get(g).current_repair_plan;
		        item.capital_repair_plan = itemList.get(g).capital_repair_plan;
		        item.maintenance_plan = itemList.get(g).maintenance_plan;
		        item.sbyt_plan = itemList.get(g).sbyt_plan;
		        item.other_plan = itemList.get(g).other_plan;
		        item.cap_build_ip_plan = itemList.get(g).cap_build_ip_plan;
		        item.cap_build_other_plan = itemList.get(g).cap_build_other_plan;
		        item.vrtu_plan = itemList.get(g).vrtu_plan;
		        item.avr_plan = itemList.get(g).avr_plan;
		        item.odg_plan = itemList.get(g).odg_plan;
		        item.mol_codes = itemList.get(g).mol_codes;
		        item.datestart = itemList.get(g).datestart;
		        item.datefinal = itemList.get(g).datefinal;
		        item.ord = itemList.get(g).ord;
		        item.all_plan = itemList.get(g).all_plan;
		        item.eikindcode = itemList.get(g).eikindcode;

		        item.sheetVolumesRef.code = sheetCode;

		        item.userGen = getUserProfile().userName;
		        item.dateEdit = new Date();


	            if (item.mol_codes.compareTo("") != 0)
		         	item.rest_from_fk = finLogic.getFuelRestByMOLAndTypeOnDate(
						item.mol_codes, object.fuelType, new SimpleDateFormat("dd.MM.yyyy").format(object.startDate).toString(), 0);


		        itemDao.add(item);
			}


	        return sheetCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENFuelSheetVolumes%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
			try {
				if (fkConnection != null && !fkConnection.isClosed()) {
					fkConnection.close();
					fkConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	public class FuelType {
        public static final int A92 = 1;
        public static final int A95 = 2;
        public static final int DT = 3;
	}


	protected java.sql.Connection getNEWConnection(String dataSourceName)
			throws DatasourceConnectException {
		java.sql.Connection _connection = null;
		try {

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource) initialContext
					.lookup(dataSourceName);
			_connection = dataSource.getConnection();

			return _connection;
		} catch (NamingException e) {
			throw new DatasourceConnectException(dataSourceName, e);
		} catch (SQLException e) {
			throw new DatasourceConnectException(dataSourceName, e);
		}
	}

   	/* ENFuelSheetVolumes. Изменить */
	@Override
	public void save(ENFuelSheetVolumes object)
	{
		///// Проверим статус ведомости
		if (object.statusRef.code != ENFuelSheetVolumesStatus.DRAFT)
		{
			throw new SystemException("\n\nNET-4440 Відомість видачі ПММ з кодом " + object.code + " вже затверджена! Редагування заборонено!");
		}
		/////

		super.save(object);
	}

	/* ENFuelSheetVolumes. Удалить */
	@Override
	public void remove(int sheetVolumesCode) {
		try {
			ENFuelSheetVolumesDAO objectDAO = new ENFuelSheetVolumesDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			///// Проверим статус ведомости
			ENFuelSheetVolumes fuelSheetVolumes = objectDAO.getObject(sheetVolumesCode);

			if (fuelSheetVolumes == null)
			{
				throw new SystemException("\n\nNET-4440 Не знайдено відомість видачі ПММ з кодом " + sheetVolumesCode + " !");
			}

			if (fuelSheetVolumes.statusRef.code != ENFuelSheetVolumesStatus.DRAFT)
			{
				throw new SystemException("\n\nNET-4440 Відомість видачі ПММ з кодом " + sheetVolumesCode + " вже затверджена! Видалення заборонено!");
			}
			/////

			 /** удаление данных для ведомости */
			ENFuelSheetVolItemDataDAO dataDao = new ENFuelSheetVolItemDataDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENFuelSheetVolItemDataFilter dataFilter = new ENFuelSheetVolItemDataFilter();
			dataFilter.sheetVolumesRef.code = sheetVolumesCode;

			int dataArr[] = dataDao.getFilteredCodeArray(dataFilter, 0, -1);
			for (int i = 0; i < dataArr.length; i++) {
				dataDao.remove(dataArr[i]);
			}


			 /** удаление строк ведомости */
			ENFuelSheetVolumesItemDAO itemDao = new ENFuelSheetVolumesItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENFuelSheetVolumesItemFilter itemFilter = new ENFuelSheetVolumesItemFilter();
			itemFilter.sheetVolumesRef.code = sheetVolumesCode;

			int itemArr[] = itemDao.getFilteredCodeArray(itemFilter, 0, -1);
			for (int j = 0; j < itemArr.length; j++) {
				itemDao.remove(itemArr[j]);
			}


			objectDAO.remove(sheetVolumesCode);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENFuelSheetVolumes%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENFuelSheetVolumes. Утвердить */
	public void approve(int sheetVolumesCode) {
		try {
			ENFuelSheetVolumesDAO objectDAO = new ENFuelSheetVolumesDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			///// Проверим статус ведомости
			ENFuelSheetVolumes fuelSheetVolumes = objectDAO.getObject(sheetVolumesCode);

			if (fuelSheetVolumes == null)
			{
				throw new SystemException("\n\nNET-4440 Не знайдено відомість видачі ПММ з кодом " + sheetVolumesCode + " !");
			}

			if (fuelSheetVolumes.statusRef.code != ENFuelSheetVolumesStatus.DRAFT)
			{
				throw new SystemException("\n\nNET-4440 Відомість видачі ПММ з кодом " + sheetVolumesCode + " вже затверджена!");
			}
			/////

			fuelSheetVolumes.statusRef.code = ENFuelSheetVolumesStatus.APPROVED;

			objectDAO.save(fuelSheetVolumes);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't approve {%com.ksoe.energynet.valueobject.ENFuelSheetVolumes%}",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENFuelSheetVolumes. Отменить утверждение */
	public void undoApprove(int sheetVolumesCode) {
		try {
			ENFuelSheetVolumesDAO objectDAO = new ENFuelSheetVolumesDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			///// Проверим статус ведомости
			ENFuelSheetVolumes fuelSheetVolumes = objectDAO.getObject(sheetVolumesCode);

			if (fuelSheetVolumes == null)
			{
				throw new SystemException("\n\nNET-4440 Не знайдено відомість видачі ПММ з кодом " + sheetVolumesCode + " !");
			}

			if (fuelSheetVolumes.statusRef.code != ENFuelSheetVolumesStatus.APPROVED)
			{
				throw new SystemException("\n\nNET-4440 Відомість видачі ПММ з кодом " + sheetVolumesCode + " не затверджена!");
			}
			/////

			fuelSheetVolumes.statusRef.code = ENFuelSheetVolumesStatus.DRAFT;

			objectDAO.save(fuelSheetVolumes);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't undoApprove {%com.ksoe.energynet.valueobject.ENFuelSheetVolumes%}",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
} // end of EJB Controller for ENFuelSheetVolumes