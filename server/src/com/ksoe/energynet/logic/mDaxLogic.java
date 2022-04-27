package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.ws.BindingProvider;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.contract.valueobject.PersonalServicesInfo;
import com.ksoe.energynet.dataminer.AXOrgTypeDAO;
import com.ksoe.energynet.dataminer.FINDoc2MolDataDAO;
import com.ksoe.energynet.dataminer.FINExecutorDAO;
import com.ksoe.energynet.dataminer.FINExecutorDAO.FINExecutorCache;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINWorkerKind;
import com.ksoe.energynet.valueobject.brief.AXOrgTypeShort;
import com.ksoe.energynet.valueobject.brief.ENAverageCountPersonalShort;
import com.ksoe.energynet.valueobject.brief.FINExecutorShort;
import com.ksoe.energynet.valueobject.brief.FINWorkerShort;
import com.ksoe.energynet.valueobject.filter.FINDoc2MolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINExecutorFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.AXOrgTypeShortList;
import com.ksoe.energynet.valueobject.lists.ENAverageCountPersonalShortList;
import com.ksoe.energynet.valueobject.lists.FINDoc2MolDataShortList;
import com.ksoe.energynet.valueobject.lists.FINExecutorShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.mdax.dataminer.AXDataDAO;
import com.ksoe.mdax.logic.AXTransactionsLogic;
import com.ksoe.mdax.services.inventmovementksservice.MovementJournalCreate;
import com.ksoe.mdax.services.inventmovementlinesksservice.MovementJournalLinesCreate;
import com.ksoe.mdax.services.journalactionks.JournalAction;
import com.ksoe.mdax.valueobject.brief.AXPodrWithEmplidStrShort;
import com.ksoe.mdax.valueobject.lists.AXPodrWithEmplidStrShortList;
import com.microsoft.schemas.dynamics._2008._01.services.InventMovementKSService;
import com.microsoft.schemas.dynamics._2008._01.services.InventMovementKSServiceCreateAifFaultFaultFaultMessage;
import com.microsoft.schemas.dynamics._2008._01.services.InventMovementKSService_Service;
import com.microsoft.schemas.dynamics._2008._01.services.InventMovementLinesKSService;
import com.microsoft.schemas.dynamics._2008._01.services.InventMovementLinesKSServiceCreateAifFaultFaultFaultMessage;
import com.microsoft.schemas.dynamics._2008._01.services.InventMovementLinesKSServiceUpdateJournalTransAifFaultFaultFaultMessage;
import com.microsoft.schemas.dynamics._2008._01.services.InventMovementLinesKSService_Service;

@SuppressWarnings("restriction")
public class mDaxLogic extends LogicModule {
	private static final long serialVersionUID = 1L;


	public mDaxLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}


	private static Vector<FINWorkerCache> finWorkerCacheHash = new Vector<>();

	private class FINWorkerCache {
		public FINWorkerShort finWorker;
	}


	private static Vector<AXOrgTypeCache> axOrgTypeCacheHash = new Vector<>();

	private class AXOrgTypeCache {
		public AXOrgTypeShort axOrgType;
	}

	private void reloadAXOrgTypes()
	{
		Connection netConnection = null;

		try
		{
			try
			{
				netConnection = super.getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			}
			catch (DatasourceConnectException e)
			{
				throw new SystemException(e.getMessage(), e);
			}

			axOrgTypeCacheHash.clear();
			AXOrgTypeCache axOrgTypeCache = null;

			AXOrgTypeDAO axOrgTypeDAO = new AXOrgTypeDAO(netConnection, userProfile);
			AXOrgTypeShortList axOrgTypeList = axOrgTypeDAO.getList();

			for (int i = 0; i < axOrgTypeList.totalCount; i++)
			{
				axOrgTypeCache = new AXOrgTypeCache();
				axOrgTypeCache.axOrgType = axOrgTypeList.get(i);

				axOrgTypeCacheHash.add(axOrgTypeCache);
			}
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			if (netConnection != null)
			{
				try
				{
					netConnection.close();
				}
				catch (SQLException e)
				{
				}
			}
		}
	}

	private String getAXOrgTypeByCode(int axOrgTypeCode)
	{
		for (int i = 0; i < axOrgTypeCacheHash.size(); i++)
		{
			AXOrgTypeCache axOrgTypeCache = (AXOrgTypeCache) axOrgTypeCacheHash.get(i);

			if (axOrgTypeCache.axOrgType.code == axOrgTypeCode)
			{
				return axOrgTypeCache.axOrgType.name;
			}
		}

		return "";
	}

	public Date getResignedDate(String tabNumber) {
		String sql = "SELECT payresigneddate_ru FROM empltable WHERE emplid = ?";
		List<String> params = Arrays.asList(tabNumber);

        Connection connection = null;
        try {
            connection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
    		Date date = BaseDAOUtils.executeStatementAndReadObject(connection, sql, params
    				, new BaseDAOUtils.DateFromResultSetTransformator(), true);

            Calendar cal = Calendar.getInstance();
            cal.setTime(Tools.clearTimeOfDate(new Date()));
            cal.set(Calendar.YEAR, 1900);
            cal.set(Calendar.MONTH, Calendar.JANUARY);
            cal.set(Calendar.DATE, 1);

            // В Axapta дата 1900-01-01 используется как null
            Date nullDate = cal.getTime();

            if(date != null  && date.compareTo(nullDate) == 0) {
                date = null;
            }

            return date;


        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
		} finally {
			try {
	            if  ( (connection != null && !connection.isClosed())){
	            	connection.close();
	            }
	        } catch (SQLException e) {
	        }
		}


	}

	/**
	 *
	 * Получить дату увольнения сотрудника
	 *
	 * @param tabNumber табельный номер
	 * @param dt дата для выборки
	 * @return {@code null} если сотрудник уволен позже даты {@code dt} или
	 *  не уволен вообще
	 *  и дату увольнения если сотрудник уволен
	 */
	public Date getResignedDate(String tabNumber, Date dt)
	{
        Connection connection = null;
        try {
            connection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
            ////connection = mDaxConnection;

        } catch (DatasourceConnectException e) {
            throw new SystemException(e.getMessage(), e);
        }

        String sql = "select PAYRESIGNEDDATE_RU"

                + " from dbo.ENERGYNET_FN_STAFFLIST ("
                + " 'ksoe' "
                + ", '" + new SimpleDateFormat("dd.MM.yyyy").format(dt) + "' "
                + ", ''"
                + ",1 "
                + (tabNumber.length() > 0 ? ", '" + tabNumber + "'" : ", '' ")
                + ", '', '', '' ) ";



        Date date = BaseDAOUtils.executeStatementAndReadObject(connection, sql, null
                , new BaseDAOUtils.DateFromResultSetTransformator(), true);


        Calendar cal = Calendar.getInstance();
        cal.setTime(Tools.clearTimeOfDate(new Date()));
        cal.set(Calendar.YEAR, 1900);
        cal.set(Calendar.MONTH, Calendar.JANUARY);
        cal.set(Calendar.DATE, 1);

        // В Axapta дата 1900-01-01 используется как null
        Date nullDate = cal.getTime();

        if(date != null  && date.compareTo(nullDate) == 0) {
            date = null;
        }

        return date;
	}



	/**
	 *  Выборка всех штатных единиц с назначенными сотрудниками на дату (MS Dynamics AX)
	 *
	 *  @param DATAAREAID - компания
	 *  @param ACTUALITYDATE - дата
	 *  @param ORGANIZATIONLIST - подразделение или список подразделений, разделитель - ;
	 *  @param ORGCHILD - учитывать дочерние подразделения (да/нет)
	 *  @param EMPLOYMENTLIST - табельный или список табельных, разделитель - ;
	 *  @param EMPLOYMENTNAMELIST - ФИО
	 *  @param STAFFPOSITIONLIST - наименование штатной должности
	 *
	 *  @return - FINWorkerShortList
	 */
	public synchronized FINWorkerShortList getFINWorkerList(FINWorkerFilter aFilterObject,
			int fromPosition, int quantity, java.util.Date dateIn, boolean isShowCEO) {

		// FINWorkerCache finWorkerCache = null;

		FINWorkerShortList result = new FINWorkerShortList();
		FINWorkerShort anObject;
		result.list = new Vector<>();

		if (quantity < 0)
			quantity = Integer.MAX_VALUE / 2;

		String selectStr;
		Connection connection = null;
		try {
			connection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}

		PreparedStatement statement = null;
		ResultSet set = null;

		//String whereStr = " ";

		String condition = aFilterObject.conditionSQL == null ? "" : aFilterObject.conditionSQL;
		String orderBy = aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL;

		if(orderBy.length() != 0) {
			orderBy = "";
		}

		if(orderBy.length() == 0)
			orderBy = "[name], emplid";

		// Выбирать ли работников из всех дочерних подразделений рекурсивно (1 - да, 0 - нет)
		int withChildren = 1;

		String tabNumber = "";
		if (aFilterObject != null
				&& aFilterObject.tabNumber != null) {

			tabNumber = aFilterObject.tabNumber;

			StringBuffer likeStr = new StringBuffer();
			likeStr.append(tabNumber);
			for (int i = 0; i < likeStr.length(); i++) {
				if (likeStr.charAt(i) == '*')
					likeStr.setCharAt(i, '%');
				if (likeStr.charAt(i) == '?')
					likeStr.setCharAt(i, '_');
			}

			tabNumber = likeStr.toString();
		}

		String departmentCode = "";
		if (aFilterObject != null
				&& aFilterObject.departmentCode != null) {

			departmentCode = aFilterObject.departmentCode;

			// Если фильтруем по конкретному подразделению, то работников нужно выбирать
			// только из него (не учитывая его дочерние подразделения)
			if (departmentCode.length() > 0)
			{
				withChildren = 0;
			}
		}

		String positionId = "";
		if (aFilterObject != null
				&& aFilterObject.positionId != null) {

			positionId = aFilterObject.positionId;
		}

		if (dateIn == null) {
			dateIn = new Date();
		}

		String name = "";
		if (aFilterObject != null && aFilterObject.name != null) {

			StringBuffer likeStr = new StringBuffer();
			likeStr.append(aFilterObject.name);
			for (int i = 0; i < likeStr.length(); i++) {
				if (likeStr.charAt(i) == '*')
					likeStr.setCharAt(i, '%');
				if (likeStr.charAt(i) == '?')
					likeStr.setCharAt(i, '_');
			}

			name = likeStr.toString();
			name = name.replace("'", "''");
		}


		// finWorkerCacheHash.clear();
		// System.out.println("################ finWorkerCacheHash = " + finWorkerCacheHash.size());

		/*
		if (aFilterObject != null
				&& aFilterObject.tabNumber != null
				&& aFilterObject.tabNumber.length() > 0) {

			synchronized (finWorkerCacheHash) {

				// System.out.println("################ finWorkerCacheHash = " + finWorkerCacheHash.size());

				Iterator<FINWorkerCache> itrIterator = finWorkerCacheHash.iterator();
				while (itrIterator.hasNext()) {
					FINWorkerCache finWorkerCache = itrIterator.next();

					if (finWorkerCache.finWorker.tabNumber.equals(aFilterObject.tabNumber)
							&& finWorkerCache.finWorker.existenceDate.compareTo(dateIn) == 0) {

						anObject = new FINWorkerShort();
						anObject = finWorkerCache.finWorker;
						result.list.add(anObject);
						result.setTotalCount(result.list.size());

						// System.out.println("################ finWorkerCacheHash... result = " + anObject.tabNumber);

						return result;
					}
				}
			}
		}
		*/



		/*
		DATAAREAID NVARCHAR(4)
		,@ACTUALITYDATE DATE
		,@ORGANIZATIONLIST NVARCHAR(MAX)
		,@ORGCHILD BINARY
		,@EMPLOYMENTNUMLIST NVARCHAR(MAX)
		,@EMPLOYMENTNAMELIST NVARCHAR(MAX)
		,@STAFFPOSITIONLIST NVARCHAR(MAX)
		,@RATELIST NVARCHAR(MAX)
		 */

		/*
		SELECT * FROM dbo.ENERGYNET_FN_STAFFLIST
		('KSOE'
		,'31-10-2015'
		,''
		,1
		,''--071391'
		,'%ВОЛОДИМИР %;%ВАСИЛ%'
		,'ВОД%СПЕЦ%'
		,'')--НВЗ_Д3;НВЗ_ДТУ_Д3')
		*/


		selectStr = "select r_in.* " +
				",  ( select q.AZT_MAINORGANIZATIONID \n" +
				"		 from dbo.RPAYHRMORGANIZATION q \n" +
			    "		where q.DATAAREAID = 'KSOE' \n" +
				"		  and q.HRMORGANIZATIONID = r_in.HRMORGANIZATIONID \n" +
				"		  and q.AZT_STARTDATE = \n" +
				"		(SELECT TOP 1 AZT_STARTDATE \n" +
				"		 	FROM RPAYHRMORGANIZATION \n" +
				"			WHERE DATAAREAID = 'KSOE' \n" +
				"		AND AZT_STARTDATE <= '" + new SimpleDateFormat("dd.MM.yyyy").format(dateIn) + "' \n" +
				"		ORDER BY AZT_STARTDATE DESC)) as cehid \n" +
				" , ( select (CASE WHEN q.AZT_MAINORGANIZATIONID = '' THEN '' \n" +
				"	       ELSE (SELECT DESCRIPTION FROM dbo.ENERGYNET_FN_ORGANIZATION_STRUCTURE('KSOE', '" + new SimpleDateFormat("dd.MM.yyyy").format(dateIn) + "' , q.AZT_MAINORGANIZATIONID, 0)) END) \n" +
				"       	AZT_MAINORGANIZATIONNAME \n" +
				"		 from dbo.RPAYHRMORGANIZATION q \n" +
				"		where q.DATAAREAID = 'KSOE' \n" +
				"		  and q.HRMORGANIZATIONID = r_in.HRMORGANIZATIONID \n" +
				"		  and q.AZT_STARTDATE = \n" +
				"		(SELECT TOP 1 AZT_STARTDATE \n" +
				"		 	FROM RPAYHRMORGANIZATION \n" +
				"			WHERE DATAAREAID = 'KSOE' \n" +
				"		AND AZT_STARTDATE <= '" + new SimpleDateFormat("dd.MM.yyyy").format(dateIn) + "' \n" +
				"		ORDER BY AZT_STARTDATE DESC)) as cehname \n"
				/*
				",  ( SELECT TOP 1 ph.TERRITORIALORGANIZATIONID_KSOE \n" +
				"		 FROM dbo.RPAYHISTORY ph \n" +
			    "		WHERE ph.NUMBER_ = r_in.EMPLID \n" +
				"		ORDER BY ph.RECID DESC ) as territorialid \n"
				*/

		        //+ " from dbo.ENERGYNET_FN_STAFFLIST ("
		        + " from dbo.ENERGYNET_FN_STAFFLIST_WITH_TERR ("

				+ " 'ksoe' " // @DATAAREAID NVARCHAR(4)
				+ ", '" + new SimpleDateFormat("dd.MM.yyyy").format(dateIn) + "' " // @ACTUALITYDATE DATE
				+ (departmentCode.length() > 0 ? ", '" + departmentCode + "'" : ", '' ") // @ORGANIZATIONLIST NVARCHAR(MAX)
				+ ", " + withChildren + " " // @ORGCHILD BINARY
				+ (tabNumber.length() > 0 ? ", '" + tabNumber + "'" : ", '' ") // @EMPLOYMENTNUMLIST NVARCHAR(MAX)
				+ (name.length() > 0 ? ", '" + name + "'" : ", '' ")  // @EMPLOYMENTNAMELIST NVARCHAR(MAX)
				+ (positionId.length() > 0 ? ", '" + positionId + "'" : ", '' ") // @STAFFPOSITIONLIST NVARCHAR(MAX)
				+ ", '"
				+ "' ) as r_in  "; // @RATELIST NVARCHAR(MAX)
				//+ "ORDER BY [name]";

		String whereStr = "";

	    if(aFilterObject != null)
	    {
	    	if (aFilterObject.positionName != null) {
	            if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";
	            if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
	                whereStr = whereStr + " UPPER(title) = UPPER(?)";
	            else
	                whereStr = whereStr + " UPPER(title) LIKE UPPER(?)";
	        }
	    }

	    // Если не нужно показывать директоров
	    if (! isShowCEO)
	    {
	    	// hrmorganizationid <> '065'
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + " hrmorganizationid <> '" + AXConsts.AX_DEPARTMENT_MANAGEMENT_ID + "' ";
	    }

	     if(condition.length() != 0)
	     {
	        if(whereStr.length() != 0)
	           whereStr = whereStr + " AND ";

	        whereStr = whereStr + " (" + condition + ")";
	     }

	    if(whereStr.length() != 0)
	    	selectStr = selectStr + " WHERE " + whereStr;

	    selectStr = selectStr + " ORDER BY " + orderBy;

		try {
			statement = connection.prepareStatement(selectStr);

			int number = 0;

			if(aFilterObject != null) {

		          if(aFilterObject.positionName != null) {
		        	  number++;
		              StringBuffer likeStr = new StringBuffer();
		              likeStr.append(aFilterObject.positionName);
		              for(int i = 0;i < likeStr.length();i++){
		                   if(likeStr.charAt(i) == '*')
		                        likeStr.setCharAt(i,'%');
		                   if(likeStr.charAt(i) == '?')
		                        likeStr.setCharAt(i,'_');
		              }
		              statement.setString(number,likeStr.toString());
		          }

		    }

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				if (i < fromPosition)
					continue;
				else if (i >= fromPosition + quantity) {
					i++;
					break;
				}

				anObject = new FINWorkerShort();

				anObject.finCode = Integer.MIN_VALUE;

				anObject.tabNumber = set.getString("EMPLID");

				anObject.positionId = set.getString("POSITIONID");
				anObject.positionName = set.getString("TITLE");
				anObject.positionCode = Integer.MIN_VALUE;
				anObject.departmentName = set.getString("DESCRIPTION");
				anObject.departmentCode = set.getString("HRMORGANIZATIONID");

				anObject.priceGen = set.getBigDecimal("AZT_FIXEDSALARY");
				if (anObject.priceGen != null)
					anObject.priceGen = anObject.priceGen.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);


				if (checkHiddenPosition(anObject.positionId)) {
					if (! anObject.tabNumber.equals("002872")) { // SUPP-96874
						anObject.priceGen = new BigDecimal(1).setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
				}


				anObject.categor = Integer.MIN_VALUE;

				if (set.getString("RATE") != null) {
					if (set.getString("RATE").toUpperCase().contains("НВЗ_Е")) {
						anObject.categor = FINWorkerKind.ESBYT;
					} else if (set.getString("RATE").toUpperCase().contains("НВЗ")) {
						anObject.categor = FINWorkerKind.PROM;
					}
				}

				anObject.doljnostid = Integer.MIN_VALUE;
				anObject.cehid = Integer.MIN_VALUE;
				anObject.cehNazv = set.getString("PARENTDESCRIPTION");
				String PERSONNELCATEGORYID = set.getString("PERSONNELCATEGORYID");
				anObject.categorId =  !(PERSONNELCATEGORYID == null || PERSONNELCATEGORYID.equals("")) ? new Integer(set.getString("PERSONNELCATEGORYID")) : Integer.MIN_VALUE  ;
				anObject.categorName = set.getString("PERSONNELCATEGORY");;
				anObject.workTimeId = set.getString("AZT_PAYCALENDARID");
				anObject.nvz = set.getString("RATE");

				anObject.payCalendarType = set.getInt("PAYCALENDARTYPE");

				anObject.balans  = set.getString("RPAYTITLEPOSTING");
				anObject.tradeCategoryId = set.getString("TRADECATEGORYID");
				anObject.name  = set.getString("NAME");
				anObject.positionName = set.getString("TITLE") + new String(anObject.tradeCategoryId == null ? "" : " " + anObject.tradeCategoryId  ) ;

				anObject.mainCehid = set.getString("cehid");
				anObject.mainCehNazv = set.getString("cehname");
				anObject.chargeRefCode = set.getInt("GROUPDISABILITY") != Integer.MIN_VALUE ? (set.getInt("GROUPDISABILITY") > 0 ? 1 : 0) : 0 ;

				//anObject.territorialOrgId = set.getString("territorialid");
				anObject.territorialOrgId = set.getString("TERRITORIALORGANIZATIONID_KSOE");

				result.list.add(anObject);



				/**  ********************************* */
				synchronized (finWorkerCacheHash) {
					FINWorkerCache finWorkerCache = new FINWorkerCache();
					anObject.existenceDate = dateIn;
					finWorkerCache.finWorker = anObject;

					finWorkerCacheHash.add(finWorkerCache);
				}
				/**  ******************************** */

			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			try {
				EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			} catch (PersistenceException e1) {
				throw new SystemException(e.getMessage(), e);
			}
			return null;
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
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}
	
	/**
	 * EFINWorker. паспортные данные, фио раздельно , сокращенно по табельному
	 */
	public  FINWorkerShortList getFINWorkerListForENWarrant(FINWorkerFilter aFilterObject) {


		FINWorkerShortList result = new FINWorkerShortList();
		FINWorkerShort anObject;
		result.list = new Vector<>();

		
		String selectStr;
		Connection connection = null;
		try {
			connection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}

		PreparedStatement statement = null;
		ResultSet set = null;

		String condition = aFilterObject.conditionSQL == null ? "" : aFilterObject.conditionSQL;
		String orderBy = aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL;

		if(orderBy.length() != 0) {
			orderBy = "";
		}

		if(orderBy.length() == 0)
			orderBy = "[name], emplid";

		
		String tabNumber = "";
		if (aFilterObject != null
				&& aFilterObject.tabNumber != null) {

			tabNumber = aFilterObject.tabNumber;

			StringBuffer likeStr = new StringBuffer();
			likeStr.append(tabNumber);
			for (int i = 0; i < likeStr.length(); i++) {
				if (likeStr.charAt(i) == '*')
					likeStr.setCharAt(i, '%');
				if (likeStr.charAt(i) == '?')
					likeStr.setCharAt(i, '_');
			}

			tabNumber = likeStr.toString();
		}

		String positionId = "";
		if (aFilterObject != null
				&& aFilterObject.positionId != null) {

			positionId = aFilterObject.positionId;
		}

		

		selectStr = " SELECT IdentityCardCode_RU   , /*тип документа */ \n" +
				"  IdentityCardSeries_RU ,        /*паспорт серия */ \n" +
				"  IdentityCardNumber_RU , /*паспорт номер */	  \n" +
				"  convert(varchar, IdentityCardIssueDate_RU , 104) as IdentityCardIssueDate_RU ,  /*дата выдачи*/  \n" +
				"  IdentityCardIssueBy_RU , /*кем выдано*/ \n" +
				"  (select NameAlias from DirPartyTable where PARTYID = empltable.PARTYID) as NameAlias, /*фио скорочено*/ \n" +
				"  (select LastName from DirPartyTable where PARTYID = empltable.PARTYID) as LastName, /*фамилия */ \n" +
				"  (select FirstName from DirPartyTable where PARTYID = empltable.PARTYID) as FirstName, /*имя */ \n" +
				"  (select MiddleName from DirPartyTable where PARTYID = empltable.PARTYID) as MiddleName /*имя */ \n" +
				"  FROM empltable   \n" +
				"  WHERE emplid = '" + tabNumber+"'";


		String whereStr = "";

	   

		try {
			statement = connection.prepareStatement(selectStr);

			int number = 0;			

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				

				anObject = new FINWorkerShort();

				anObject.tabNumber = tabNumber;
				anObject.identityCardCode_RU = set.getString(1);  /*тип документа удостоверяющий личность */
				anObject.identityCardSeries_RU = set.getString("IdentityCardSeries_RU"); /*паспорт серия */
				anObject.identityCardNumber_RU = set.getString("IdentityCardNumber_RU"); /*паспорт номер */	 
				anObject.identityCardIssueDate_RU = set.getString("IdentityCardIssueDate_RU");  /*дата выдачи*/
				anObject.identityCardIssueBy_RU = set.getString("IdentityCardIssueBy_RU"); /*кем выдано*/
				anObject.nameAlias = set.getString("NameAlias");  /*фио скорочено*/
				anObject.lastName = set.getString("LastName");  /*фамилия */
				anObject.firstName = set.getString("FirstName");  /*имя */
				anObject.middleName = set.getString("MiddleName");  /*отчество */

				
				result.list.add(anObject);



				

			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			try {
				EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			} catch (PersistenceException e1) {
				throw new SystemException(e.getMessage(), e);
			}
			return null;
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
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public FINExecutorCache reloadFinExecutor()
	{
		FINExecutorShort anObject;
		FINExecutorCache finExecutorCache = null;

		String selectStr;
		Connection connection = null;
		try {
			connection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(),e);
		}

		/////
		if (axOrgTypeCacheHash.size() == 0)
		{
			reloadAXOrgTypes();
		}
		/////

		FINExecutorDAO finExecutorDAO = new FINExecutorDAO(connection, userProfile);

		PreparedStatement statement = null;
		ResultSet set = null;

		/*
		selectStr = "EXECUTE dbo.ENERGYNET_ORGANIZATION_STRUCTURE "
			  + " @DATAAREAID = 'ODOE' "
			  + " ,@ACTUALITYDATE = '22-09-2015' "
			  + " ,@ORGANIZATIONLIST = '' "
			  + " ,@ORGCHILD = 0 ";
		 */

		// Переделали на функцию
		/*
		selectStr = "EXECUTE dbo.ENERGYNET_ORGANIZATION_STRUCTURE "
				  + " @DATAAREAID = 'KSOE' "
				  + ", @ACTUALITYDATE = '" + new SimpleDateFormat("dd.MM.yyyy").format(new Date()) + "' "
				  + " ,@ORGANIZATIONLIST = '' "
				  + " ,@ORGCHILD = 1 ";
		*/
		selectStr = "SELECT * FROM dbo.ENERGYNET_FN_ORGANIZATION_STRUCTURE ( "
				  + " 'KSOE' "
				  + ", '" + new SimpleDateFormat("dd.MM.yyyy").format(new Date()) + "' "
				  + ", '' "
				  + ", 1 ) "
				  + "ORDER BY [description]";

		try {
			statement = connection.prepareStatement(selectStr);

			for (set = statement.executeQuery(); set.next();) {

				anObject = new FINExecutorShort();

				anObject.code = Integer.MIN_VALUE;

				/*
                anObject.finCode = set.getInt(1);
                if ( set.wasNull() )
                    anObject.finCode = Integer.MIN_VALUE;

                anObject.name = set.getString(2);
                anObject.finKindName = set.getString("PODR_VID_NAZV");

                anObject.finKindCode = set.getInt("PODR_VID_ID");
                if ( set.wasNull() )
                    anObject.finKindCode = Integer.MIN_VALUE;

                anObject.finTypeName = set.getString("PROM_NAZV");

                anObject.finTypeCode = set.getInt("PROM_ID");
                if ( set.wasNull() )
                    anObject.finTypeCode = Integer.MIN_VALUE;

                anObject.finCehName = set.getString("CEH_NAZV");

                anObject.finCehCode = set.getInt("CEH_ID");
                if ( set.wasNull() )
                    anObject.finCehCode = Integer.MIN_VALUE;

                anObject.main_podr_id = set.getInt("MAIN_PODR_ID");
                if ( set.wasNull() )
                    anObject.main_podr_id = Integer.MIN_VALUE;

                anObject.podr_id = set.getInt("PODR_ID");
                if ( set.wasNull() )
                    anObject.podr_id = Integer.MIN_VALUE;
				*/

				anObject.axOrgId = set.getString("HRMORGANIZATIONID");
				anObject.axParentOrgId = set.getString("PARENTORGANIZATIONID");
				anObject.axParentOrgName = set.getString("PARENTDESCRIPTION");
				anObject.axOrgTypeId = set.getInt("AZT_RHRMORGANIZATIONTYPE");
				anObject.axOrgTypeName = getAXOrgTypeByCode(anObject.axOrgTypeId); //"" + anObject.axOrgTypeId; // TEMP!!!

				anObject.name = set.getString("DESCRIPTION");

                //anObject.finCehName = set.getString("PARENTDESCRIPTION");
                //anObject.finTypeName = set.getString("HRMORGANIZATIONID");

				finExecutorCache = finExecutorDAO.new FINExecutorCache();
				finExecutorCache.finExecutor = anObject;

				FINExecutorDAO.finExecutorCacheHash.add(finExecutorCache);

			}

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			try {
				EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			} catch (PersistenceException e1) {
				throw new SystemException(e1.getMessage(),e1);
			}
			return null;
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
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

		return finExecutorCache;
	}

	/**
	 *
	 * @param startDate
	 * @param ednDate
	 * @param workTimeId -- график рабочего времени
	 * @return
	 */
	public BigDecimal[] getWorkingTimePlan( java.util.Date startDate , java.util.Date endDate , String workTimeId) {

		BigDecimal[] result = { new BigDecimal(0), new BigDecimal(0) };

		String selectStr;
		Connection mDaxConnection = null;
		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}

		PreparedStatement statement = null;
		ResultSet set = null;
		selectStr = " select AZT_PAYCALENDARID,	WORKDAYS	, round(WORKHOURS,2)  from VSE_FN_WORKING_TIME_PLAN " +
				" ( " +
						" 'KSOE' "+
						" ,? "+
						" ,? "+
						" ,? "+
						" ,'ENET_FACT' "+
						" ) ";

		try {



			statement = mDaxConnection.prepareStatement(selectStr);
			statement.setDate(1, new java.sql.Date(startDate.getTime()) );
			statement.setDate(2, new java.sql.Date(endDate.getTime())) ;
			statement.setString(3, workTimeId);

			System.out.println(statement.toString());

			set = statement.executeQuery();

			if (set.next()) {
				result[0] = set.getBigDecimal(2); // дни

				if (result[0] != null)
					result[0] = result[0].setScale(2, BigDecimal.ROUND_HALF_UP);

				result[1] = set.getBigDecimal(3);  // часы

				if (result[1] != null)
					result[1] = result[1].setScale(2, BigDecimal.ROUND_HALF_UP);
			}
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			try {
				EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			} catch (PersistenceException e1) {
				throw new SystemException(e.getMessage(), e);
			}
			return null;
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
			if (mDaxConnection != null) { //super.getConnection(EnergyNetJNDINames.MDAX_DATASOURCE_DS)) {
				try {
		            if  ( (mDaxConnection != null && !mDaxConnection.isClosed())){
		            	   mDaxConnection.close();
		            }
		        } catch (SQLException e) {
		        }
			}
		}
	}

	public BigDecimal getCountActualWorkHoursByEmployee(String tabNumber, Date dateStart, Date dateFinal) {
		if(tabNumber == null || tabNumber.length() == 0) {
			throw new java.lang.IllegalArgumentException("Не задан табельний номер");
		}
		if(dateStart == null || dateFinal == null) {
			throw new java.lang.IllegalArgumentException("Не задані дати");
		}
		
		

		dateStart = Tools.clearTimeOfDate(dateStart);
		dateFinal = Tools.clearTimeOfDate(dateFinal);

		if(dateStart.compareTo(dateFinal) == 1) {
			throw new SystemException(String.format("Дати повинні бути в хронологічному порядку (%s > %s)"
					, Tools.dateFormatDefault.format(dateStart)
					, Tools.dateFormatDefault.format(dateFinal)));
		}

		if(dateStart.compareTo(dateFinal) != 0) {
			Date resignedDate = this.getResignedDate(tabNumber);
			if(resignedDate != null && resignedDate.compareTo(dateFinal) == -1) {
				dateFinal = resignedDate;
			}
		}

		Connection mDaxConnection = null;

		String sql = "SELECT sum(totalhours) from [dbo].[ENERGYNET_FN_WORKING_TIME](?,?,?,?,?,?,?,?,?,?)";

		String code_time_vihod = this.getPayCalendarTimeCodes("ТабФакт");
		String code_time_vihod2 = this.getPayCalendarTimeCodes("ТабКоманд");
		String code_time_vihod3 = this.getPayCalendarTimeCodes("ТабСверхур");

		  if (!code_time_vihod2.equals("")){
			  code_time_vihod = code_time_vihod+";"+code_time_vihod2;
		  }
		  if (!code_time_vihod3.equals("")){
			  code_time_vihod = code_time_vihod+";"+code_time_vihod3;
		  }

		List<Object> params = new Vector<>();
		params.add("KSOE");
		params.add(dateStart);
		params.add(dateFinal);
		params.add("");
		params.add(1);
		params.add(tabNumber);
		params.add("");
		params.add("");
		params.add(code_time_vihod);
		params.add("");

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
			BigDecimal result = BaseDAOUtils.executeStatementAndReadObject(mDaxConnection, sql, params
					, new BaseDAOUtils.BigDecimalFromResultSetTransformator(), true);
			if(result != null) {
				result = result.setScale(2, BigDecimal.ROUND_HALF_UP);
			} else {
				result = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
			}
			return result;
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			try {
	            if  ( (mDaxConnection != null && !mDaxConnection.isClosed())){
	            	   mDaxConnection.close();
	            }
	        } catch (SQLException e) {
	        }
		}
	}

	public String getPayCalendarTimeCodes(String GROUP_CODE) {
		//String GROUP_CODE = "ТабФакт"; // перенес во входящий параметр
		String sql = "SELECT DISTINCT paycalendartimecode FROM RPayTimeGroupMember WHERE timegroup = ?";
		List<String> params = new Vector<>();
		params.add(GROUP_CODE);
		Connection mDaxConnection = null;
		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
			List<String> payCalendarTimeCodes = BaseDAOUtils.executeStatementAndReadObjects(mDaxConnection, sql, params
					, new BaseDAOUtils.StringFromResultSetTransformator(), true);
			return com.ksoe.energynet.util.Tools.collection2String(payCalendarTimeCodes, ";");
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			try {
	            if  ( (mDaxConnection != null && !mDaxConnection.isClosed())){
	            	   mDaxConnection.close();
	            }
	        } catch (SQLException e) {
	        }
		}
	}

	/**
	 * //  выборка количества  часов отпуска по сотрудникам (отпуска заведенные по приказам , т.е не фактические часы отпуска которые отгулял сотрудник )
	 * @param datestart начальная дата периода
	 * @param dateend конечная дата периода
	 * @param stringEmplid строка с табельными сотрудников
	 * @return кол-во часов отпуска
	 * @throws PersistenceException
	 */

	public BigDecimal getCountHoursOtpuskByEmplString(String datestart,	String dateend , String	stringEmplid) throws PersistenceException
	{

		BigDecimal allOtpHoursByEmpl = new BigDecimal(0);
		PreparedStatement sttm = null;
	    ResultSet  rs = null;
	    Connection mDaxConnection = null;
		try{

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}

		String strEmplId =  stringEmplid.replaceAll(",", ";");

        System.out.print("get otpusk by Emplid = " + strEmplId );

			// выберем отпуска по работнику  из axapta ( невыход с названием отпуска)
			/* String sql_otpusk = " SELECT TOTALHOURS , RPAYCALENDARTIMECODE  FROM dbo.[ENERGYNET_FN_WORKING_TIME] " +
								" ('KSOE' " +
								",'"+ datestart +"' " +
								",'"+ dateend +"' " +
								",'' " +
								",0 " +
								",'"+ strEmplId +"' " +
								",''" +
								",''" +
								",''" +
								") "; */


			String sql_otpusk = " SELECT  coalesce(sum(cast(VACHOURSCNTINPERIOD as numeric(15,2) )),0) from  [dbo].[ENERGYNET_FN_EMPL_VACATION_TIME_PLAN]( \n" +
			  " /* DATAAREAID */ 'KSOE', \n" +
			  " /* FROMDATE */ '"+ datestart +"', \n" +
			  " /* TODATE */ '"+ dateend +"', \n" +
			  " /* EMPLOYMENTLIST */ '"+ strEmplId +"' , \n" +
			  " /* VACATIONTYPELIST */ '', \n" +
			  " /* TIMEGROUP_FACT */ 'ENET_FACT') ";

	        sttm = mDaxConnection.prepareStatement(sql_otpusk);
	        rs = sttm.executeQuery();

	        BigDecimal allOtpHours = new BigDecimal(0);

	        while(rs.next())
	        {
	        	 allOtpHours = allOtpHours.add(rs.getBigDecimal(1));

	        }
	        allOtpHoursByEmpl = allOtpHoursByEmpl.add(allOtpHours);

		}

		catch (Exception e) {
			System.out.println(e.getMessage()
					+ " getCountHoursOtpuskByEmplString ");
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
			}
			try {
				if (sttm != null)
					sttm.close();
			} catch (SQLException e) {
			}
			if (mDaxConnection != null) { //super.getConnection(EnergyNetJNDINames.MDAX_DATASOURCE_DS)) {
				try {
		            if  ( (mDaxConnection != null && !mDaxConnection.isClosed())){
		            	   mDaxConnection.close();
		            }
		        } catch (SQLException e) {
		        }
			}
		}

		return allOtpHoursByEmpl;
	}


	/**
	 * //  выборка признака инвалидности сотрудника на дату
	 * @param tabn табельный сотрудника
	 * @param dateIn дата
	 * @return признак : 0-нет;1-1 группа;2-2группа;3-3группа
	 * @throws PersistenceException
	 */

	public int getCheckIsInvalid(String tabn, Date dateIn) throws PersistenceException
	{

		int out = 0; // 0 - нет инвалидности
		PreparedStatement sttm = null;
		ResultSet rs = null;
		try{

			Connection mDaxConnection = null;
			try {
				mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
			} catch (DatasourceConnectException e) {
				throw new SystemException(e.getMessage(), e);
			}

//			String sql_empl_history = " SELECT top 1  coalesce(GROUPDISABILITY,0)  FROM [dbo].[ENERGYNET_FN_EMPL_HISTORY]( \n " +
//					  " /* DATAAREAID */ 'KSOE', \n " +
//					  " /* FROMDATE */ ? , \n " +
//					  " /* TODATE */ ? , \n " +
//					  " /* ORGANIZATIONLIST */ '', \n " +
//					  " /* CHILDORG */ 0, \n " +
//					  " /* EMPLOYMENTLIST */ ? , \n " +
//					  " /* EMPLOYMENTNAMELIST */ '' , \n " +
//					  " /* STAFFPOSITIONLIST */ '', \n " +
//					  " /* RATELIST */ '', \n " +
//					  " /* ONLYLAST */ 0)";  параметр ONLYLAST тут должно быть 0 - выборка учитывая периоды .. ( если 1 то это просто выборка карточки сотрудника без учета периода )

			String sql_empl_history =  " select groupdisability from \n " +
					             " dbo.ENERGYNET_FN_STAFFLIST( \n " +
			                     " /*@DATAAREAID =*/ 'KSOE' \n " +
			                    ", /*@ACTUALITYDATE =*/  ? \n " +
			                    ", /*@ORGANIZATIONLIST =*/  '' \n " +
			                    ", /*@ORGCHILD = */ 0 \n " +
			                    ", /*@EMPLOYMENTLIST =*/ ? \n " +
			                    ", /*@EMPLOYMENTNAMELIST =*/ '' \n " +
			                    ", /*@STAFFPOSITIONLIST =*/ '' \n " +
			                    ", '' \n " +
			    " ) as r_in ";

			sttm = mDaxConnection.prepareStatement(sql_empl_history);
			sttm.setDate(1, new java.sql.Date(dateIn.getTime()));
//			sttm.setDate(2, new java.sql.Date(dateIn.getTime()));
			sttm.setString(2, tabn);
			rs = sttm.executeQuery();
			while (rs.next()) {
				out = rs.getInt(1);
			}

		}
		catch (Exception e) {
			System.out.println(e.getMessage() + " getCheckIsInvalid ");
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
			}
			try {
				if (sttm != null)
					sttm.close();
			} catch (SQLException e) {
			}
		}

		return out;
	}


	/** тип календаря */
	/** 10 - Гос.норма */
	public static final int calendarTypeGosNorma = 10;
	/** 11 - План */
	public static final int calendarTypePlan = 11;
	/** 12 - Сотрудник */
	public static final int calendarTypeEmployees = 12;

	public static final String basicGraphicId = "Смена 8.2 часа Пн-Пт";
	public static final String gosNormaGraphicId = "Госнорма 8 часов";


	/**
     *  Возвращает кол-во рабочих часов/дней в месяце на дату расчета акта по табельному номеру
     *
     *  @param dateAct - дата акта
     *  @param tabNumber - табельный номер
     *  @return BigDecimal[] - кол-во рабочих часов/дней в месяце на дату расчета акта
     *
     */
	public BigDecimal[] getWorkTime(Date dateAct, String tabNumber) {

		Connection mDaxConnection = null;
		BigDecimal[] out = { new BigDecimal(0), new BigDecimal(0) };

		FINWorkerFilter workerFilter = new FINWorkerFilter();
		workerFilter.tabNumber = tabNumber;

		FINWorkerShortList workerList = this.getFINWorkerList(workerFilter, 0, -1, dateAct, false);
		if (workerList.totalCount == 1) {

			try {
				mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);

			} catch (DatasourceConnectException e) {
				throw new SystemException(e.getMessage(), e);
			}

			AXDataDAO axDataDao = new AXDataDAO(mDaxConnection, userProfile);

			// SUPP-68959 Если workTimeId равно "", то возможно человек
			// в этот день работал и был уволен, поэтому его характеристики
			// нужно выбрать на предыдущий день
			Date resignedDate = this.getResignedDate(tabNumber, dateAct);
			if(resignedDate != null && resignedDate.compareTo(dateAct) == 0
					&& workerList.get(0).workTimeId.equals("")) {
				Calendar c = Calendar.getInstance();
				c.setTime(dateAct);
				c.add(Calendar.DATE, -1);
				workerList = this.getFINWorkerList(workerFilter, 0, -1, c.getTime(), false);
			}


			if (!workerList.get(0).workTimeId.equals("")) {

				/**
				 *  тип календаря
				 *   0 - 5 дней;
				 *   1 - 6 дней;
				 *   2 - Прочие;
				 *   3 - 7 дней;
				 *   10 - Гос.норма; +++
				 *   11 - План;      +++
				 *   12 - Сотрудник; +++
				 *
				 *  для типа календаря ??? - используем основной график работы
				 *
				 */
				if (workerList.get(0).payCalendarType == calendarTypeEmployees) {
					out = axDataDao.getWorkTime(dateAct, gosNormaGraphicId);

				} else {
					out = axDataDao.getWorkTime(dateAct, workerList.get(0).workTimeId);
				}
			}
		}

		return out;
	}


	/**
     *  Возвращает кол-во рабочих часов/дней в месяце на дату для основного графика работы
     *
     *  @param dateAct - дата акта
     *  @return BigDecimal[] - кол-во рабочих часов/дней в месяце на дату расчета акта
     *
     */
	public BigDecimal[] getWorkTime(Date dateAct) {

		Connection mDaxConnection = null;
		BigDecimal[] out = { new BigDecimal(0), new BigDecimal(0) };
		String basicGraphic = "Смена 8.2 часа Пн-Пт";

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}

		AXDataDAO axDataDao = new AXDataDAO(mDaxConnection, userProfile);
		out = axDataDao.getWorkTime(dateAct, basicGraphic);

		return out;
	}


	/**
     *  Возвращает сумму рабочих часов за два предыдущих месяца на дату для основного графика работы
     *
     *  @param date - дата акта
     *  @return BigDecimal[] - кол-во рабочих часов/дней в месяце
     *
     */
	public BigDecimal getWorkTimeTwoPreviousMonth(Date date) {

		Connection mDaxConnection = null;
		BigDecimal out = new BigDecimal(0);

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}

		Calendar cal1 = Calendar.getInstance();
	    cal1.setTime(date);
	    cal1.add(Calendar.MONTH, -1);
	    Date month1 = cal1.getTime();

		Calendar cal2 = Calendar.getInstance();
	    cal2.setTime(date);
	    cal2.add(Calendar.MONTH, -2);
	    Date month2 = cal2.getTime();


		AXDataDAO axDataDao = new AXDataDAO(mDaxConnection, userProfile);
		out = axDataDao.getWorkTime(month1, basicGraphicId)[0].add(axDataDao.getWorkTime(month2, basicGraphicId)[0]);

		return out;
	}

	/**
	 * 	!!!! 16.12.2015 ?????? пока под вопросом!!!!!! в АХ нет данных по зарплате!!!!!!!!!
	 *  процедура расчета начислений по работнику за два предыдущих месяца (шифр 500 из ЗП)
	 */
	public BigDecimal getMiddlePayTwoPreviousMonth(Date firstDay, String tabNumber) {

		BigDecimal out = new BigDecimal(0);
		Connection mDaxConnection = null;
		PreparedStatement statement = null;
		ResultSet set = null;

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);

			Calendar cal1 = Calendar.getInstance();
		    cal1.setTime(firstDay);
		    cal1.add(Calendar.MONTH, -1);
		    Date month1 = cal1.getTime();

			Calendar cal2 = Calendar.getInstance();
		    cal2.setTime(firstDay);
		    cal2.add(Calendar.MONTH, -2);
		    Date month2 = cal2.getTime();

		    /** Выборка видов зарплаты входящих в рассчет среднего (для командировок) */
		    String payCodes = getPayCodeCondition();


			String sql = "SELECT coalesce(SUM(AMOUNT), 0) FROM dbo.ENERGYNET_FN_EMPL_PAY ("
					+ " 'KSOE', "
					+ " ?, "
					+ " ?, "
					+ " '" + tabNumber + "' ,"
					+ " ? "
					+ ")";

			statement = mDaxConnection.prepareStatement(sql);
			statement.setDate(1, new java.sql.Date(month1.getTime()));
			statement.setDate(2, new java.sql.Date(month2.getTime()));
			statement.setString(3, payCodes);

			set = statement.executeQuery();

			while (set.next()) {
				out = set.getBigDecimal(1);
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return out;
	}



	/**
	 * 	Выборка видов зарплаты входящих в рассчет среднего (для командировок)
	 *
	 *	@return payCodes - строка в виде - 013;014;030;
	 */
	private String getPayCodeCondition() {
		String payCodes = "";
		Connection mDaxConnection = null;
		PreparedStatement statement = null;
		ResultSet set = null;

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);

			String sql = " select m.PAYCOSTTYPE "
					+ " from dbo.RPAYFUNDMEMBER m "
					+ " where upper(m.DATAAREAID) = 'KSOE' "
					+ " and upper(m.COUNTERUNIT) = 'SREDNY' ";

			statement = mDaxConnection.prepareStatement(sql);
			set = statement.executeQuery();

			while (set.next()) {
				if (payCodes.length() <= 0) {
					payCodes = set.getString(1);
				} else {
					payCodes = payCodes + "; " + set.getString(1);
				}
			}


		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return payCodes;
	}


	public FINExecutorShortList getAXExecutorList(FINExecutorFilter aFilterObject, int fromPosition, int quantity)
			throws PersistenceException {

		int includeChild = ENConsts.NO;
		return getAXExecutorList(aFilterObject, fromPosition, quantity, includeChild);
	}

	public FINExecutorShortList getAXExecutorList(
			FINExecutorFilter aFilterObject, int fromPosition, int quantity, int includeChild)
			throws PersistenceException {

		FINExecutorShortList result = new FINExecutorShortList();

		FINExecutorShort anObject;
		result.list = new Vector<>();

		String selectStr;
		Connection connection = null;
		try {
			connection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(),e);
		}


		PreparedStatement statement = null;
		ResultSet set = null;

		String axOrgId = "";
		if (aFilterObject != null
				&& aFilterObject.axOrgId != null) {

			axOrgId = aFilterObject.axOrgId;
		}


		// Переделали на функцию
		/*
		selectStr = "EXECUTE dbo.ENERGYNET_ORGANIZATION_STRUCTURE "
				  + " @DATAAREAID = 'KSOE' "
				  + ", @ACTUALITYDATE = '" + new SimpleDateFormat("dd.MM.yyyy").format(new Date()) + "' "
				  + " ,@ORGANIZATIONLIST = '' "
				  + " ,@ORGCHILD = 1 ";
		*/
		selectStr = "SELECT * FROM dbo.ENERGYNET_FN_ORGANIZATION_STRUCTURE ( "
				  + " 'KSOE' "
				  + ", '" + new SimpleDateFormat("dd.MM.yyyy").format(new Date()) + "' "
				  + (axOrgId.length() > 0 ? ", '" + axOrgId + "'" : ", '' ")
				  + ", " + includeChild + " ) "
				  + "ORDER BY [description]";

		try {
			statement = connection.prepareStatement(selectStr);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {

				anObject = new FINExecutorShort();

				anObject.code = Integer.MIN_VALUE;

				anObject.axOrgId = set.getString("HRMORGANIZATIONID");
				anObject.axParentOrgId = set.getString("PARENTORGANIZATIONID");
				anObject.axParentOrgName = set.getString("PARENTDESCRIPTION");
				anObject.axOrgTypeId = set.getInt("AZT_RHRMORGANIZATIONTYPE");
				anObject.axOrgTypeName = getAXOrgTypeByCode(anObject.axOrgTypeId);

				anObject.name = set.getString("DESCRIPTION");

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			try {
				EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			} catch (PersistenceException e1) {
				throw new SystemException(e1.getMessage(),e1);
			}

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
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
		return result;
	}

	public static String string2report(String str) {
		if (str == null)
			str = "";
		return str;
	}

	/**
	 *  Возвращает контактные данные по табельному №
	 *
	 *  @param tabNumber
	 *
	 */
	public PersonalServicesInfo getPersonalInfo(String tabNumber) {

		CallableStatement stmt = null;
		PreparedStatement statement = null;
        PersonalServicesInfo info = null;
        String selectStr = "";

        try {
        	selectStr = " select * FROM dbo.ENERGYNET_FN_EMPL_HISTORY \n"+
                    "( \n"+
				    " /*@DATAAREAID*/ 'KSOE' \n"+
				    ",/*@FROMDATE*/ '"+ new SimpleDateFormat("dd.MM.yyyy").format(new Date()) +"'\n"+
				    ",/*@TODATE*/ '"+ new SimpleDateFormat("dd.MM.yyyy").format(new Date()) +"' \n"+
				    ",/*@ORGANIZATIONLIST*/ '' \n"+
				    ",/*@CHILDORG*/ 1 \n"+
				    ",/*@EMPLOYMENTLIST*/  ? \n"+
				    ",/*@EMPLOYMENTNAMELIST*/ '' \n"+
				    ",/*@STAFFPOSITIONLIST*/ '' \n"+
				    ",/*@RATELIST*/ '' \n"+
				    ",/*@ONLYLAST*/ 1 /*1- карточка типа */\n"+
                    ") ";

        	Connection connection = null;
    		try {
    			connection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
    		} catch (DatasourceConnectException e) {
    			throw new SystemException(e.getMessage(),e);
    		}

            statement = connection.prepareStatement(selectStr);
            statement.setString(1, tabNumber);

			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				info = new PersonalServicesInfo();

				info.fioLine = resultSet.getString("NAME");
				info.addressLine = resultSet.getString("ADDRESS");
				info.passportLine = string2report(resultSet.getString("PASSPORT_SERIES")) + " "
						+ string2report(resultSet.getString("PASSPORT_NUMBER"));

				resultSet.getDate("PASSPORT_DATE");
				if (!resultSet.wasNull()) {
					info.passportLine = info.passportLine
							+ " "
							+ string2report(new SimpleDateFormat("dd.MM.yyyy")
									.format(resultSet.getDate("PASSPORT_DATE")).toString());
				}

				info.passportLine = info.passportLine + " "
						+ string2report(resultSet.getString("PASSPORT_ISSUEDBY"));
			}

            resultSet.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            try {
				EnergyproPersistenceExceptionAnalyzer.analyser
				        .throwPersistenceException(e);
			} catch (PersistenceException e1) {
				throw new SystemException(e.getMessage(), e);
			}
        } finally {
            try {
                if (statement != null)
                    statement.close();
                if (stmt != null)
                	stmt.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }

        return info;
    }


	/**
	 *  проверка принадлежности дожности к скрытой группе
	 *
	 *  @param - positionId
	 *  @return - true, усли должность находится в скрытой группе
	 */
	public boolean checkHiddenPosition(String positionId) {

		boolean hiddenPosition = false;
		String selectStr;
		Connection mDaxConnection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}

		selectStr = "select m.POSITIONID "
				+ " from dbo.STFPOSITIONGROUPTABLE_UA s, dbo.STFPOSITIONGROUPMEMBER_UA m "
				+ " where upper(m.DATAAREAID) = 'KSOE' "
				+ " and s.GROUPCODE = 'ЭНАкт' "
				+ " and upper(s.DATAAREAID) = 'KSOE' "
				+ " and s.GROUPCODE = m.GROUPCODE "
				+ " and m.POSITIONID = ?";

		try {
			statement = mDaxConnection.prepareStatement(selectStr);
			statement.setString(1, positionId);

			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				hiddenPosition = true;
			}

		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			/*
			if (mDaxConnection != null) {
				try {
					mDaxConnection.close();
				} catch (SQLException e) {
				}
			}
			*/
		}

		return hiddenPosition;
	}

	/**
	 *
	 * @param pdate_srez Дата
	 * @param hrmorganizationid id подразделения
	 * @param orgchild -- учитывать вложенные (1-да , 0-нет )
	 * @return количество людей в подразделении
	 * @throws PersistenceException
	 */
	public BigDecimal getCountPersonalInPodrAx(Date pdate_srez , String hrmorganizationid , boolean orgchild ) throws PersistenceException
	{
	    boolean isDebug = false;
	    if (isDebug)
	        System.out.println("start getCountPersonalInPodrAx:" + new Date());


	    BigDecimal count = new BigDecimal(0);

	    PreparedStatement statement = null;
	    ResultSet  resultSet = null;

	    try {

	    String	sql = " select \n" +
	    " count(*) \n" +
	    " from dbo.ENERGYNET_FN_STAFFLIST ( \n" +
	    "                   /*@DATAAREAID =*/ 'KSOE' \n" +
		"			, /*@ACTUALITYDATE =*/ '"+new SimpleDateFormat("dd-MM-yyyy").format(pdate_srez)+"' \n" +
		"			, /*@ORGANIZATIONLIST =*/ '"+ hrmorganizationid +"' \n" +
		"			, /*@ORGCHILD = */ "+ (orgchild ? 1 : 0) +" \n" +
		"			, /*@EMPLOYMENTLIST =*/ '' \n" +
		"			, /*@EMPLOYMENTNAMELIST =*/ '' \n" +
		"			, /*@STAFFPOSITIONLIST =*/ '' \n" +
		"           , '' " +
	    " ) as r_in \n";


	        statement = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE).prepareStatement(sql);
	        resultSet = statement.executeQuery();
	     if (resultSet.next()) {
	    	 count = resultSet.getBigDecimal(1) ;
	     }


	        return  count ;
	    } catch (Exception e) {
	        System.out.println(    e.getMessage() + "  getCountPersonalInPodrAx");
	        throw new EnergyproSystemException(e);
	    } finally {

	    	try {if (resultSet != null) resultSet.close();}             catch (SQLException e) {}
	        try {if (statement != null) statement.close();} catch (SQLException e) {}

	    }

	}

	/**
	 *  Выборка всех штатных единиц с назначенными сотрудниками или без таких на дату (MS Dynamics AX)
	 *   +++ выборка с цехом и названия цеха
	 *  @param DATAAREAID - компания
	 *  @param ACTUALITYDATE - дата
	 *  @param ORGANIZATIONLIST - подразделение или список подразделений, разделитель - ;
	 *  @param ORGCHILD - учитывать дочерние подразделения (да/нет)
	 *  @param EMPLOYMENTLIST - табельный или список табельных, разделитель - ;
	 *  @param EMPLOYMENTNAMELIST - ФИО
	 *  @param STAFFPOSITIONLIST - наименование штатной должности
	 *
	 *  @return - FINWorkerShortList
	 */
	public AXPodrWithEmplidStrShortList getAXPodrWithEmplidStrList(String hrmorganizationid , String dateStart,
			String dateFinal, String RateList) {

		AXPodrWithEmplidStrShortList result = new AXPodrWithEmplidStrShortList();
		AXPodrWithEmplidStrShort anObject;
		result.list = new Vector<>();

		String selectStr;
		Connection connection = null;
		try {
			connection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}

		PreparedStatement statement = null;
		ResultSet set = null;

	   selectStr = " select distinct r_in.HRMORGANIZATIONID as podr_id , r_in.DESCRIPTION as podr_nazv , \n" +
			   " r_in.PARENTORGANIZATIONID as main_podr_id,  r_in.PARENTDESCRIPTION as podr_nazv_main \n" +
			   "  , coalesce( LEFT(empidlstr,LEN(empidlstr) - 1) ,'000000')  AS empidlstr \n" +
			   " , ( select q.AZT_MAINORGANIZATIONID \n" +
			   " 		 from dbo.RPAYHRMORGANIZATION q \n" +
			   " 		where q.DATAAREAID = 'KSOE' \n" +
			   " 		  and q.HRMORGANIZATIONID = r_in.HRMORGANIZATIONID \n" +
			   " 		  and q.AZT_STARTDATE = \n" +
			   " 		(SELECT TOP 1 AZT_STARTDATE \n" +
			   " 		 	FROM RPAYHRMORGANIZATION \n" +
			   " 			WHERE DATAAREAID = 'KSOE' \n" +
			   " 		AND AZT_STARTDATE <= '"+ dateFinal+"' \n" +
			   " 		ORDER BY AZT_STARTDATE DESC)) as cehid \n" +
			   " , ( select (CASE WHEN q.AZT_MAINORGANIZATIONID = '' THEN '' \n" +
			   " 	       ELSE (SELECT DESCRIPTION FROM dbo.ENERGYNET_FN_ORGANIZATION_STRUCTURE('KSOE', '"+ dateFinal+"',  \n" +
			   " q.AZT_MAINORGANIZATIONID, 0)) END) \n" +
			   "        	AZT_MAINORGANIZATIONNAME \n" +
			   " 		 from dbo.RPAYHRMORGANIZATION q \n" +
			   " 		where q.DATAAREAID = 'KSOE' \n" +
			   " 		  and q.HRMORGANIZATIONID = r_in.HRMORGANIZATIONID \n" +
			   " 		  and q.AZT_STARTDATE = \n" +
			   " 		(SELECT TOP 1 AZT_STARTDATE \n" +
			   " 		 	FROM RPAYHRMORGANIZATION \n" +
			   " 			WHERE DATAAREAID = 'KSOE' \n" +
			   " 		AND AZT_STARTDATE <= '"+ dateFinal+"' \n" +
			   " 		ORDER BY AZT_STARTDATE DESC)) as cehname \n" +
			   " from dbo.ENERGYNET_FN_STAFFLIST_ALL( \n" +
			   " 	                      /*@DATAAREAID =*/ 'KSOE' \n" +
			   " 	                    , /*@ACTUALITYDATE =*/ '"+ dateFinal+"' \n" +
			   " 	                    , /*@ORGANIZATIONLIST =*/ '"+hrmorganizationid+"' \n" +
			   " 	                    , /*@ORGCHILD = */ 1 \n" +
			   " 	                    , /*@EMPLOYMENTLIST =*/ '' \n" +
			   " 	                    , /*@EMPLOYMENTNAMELIST =*/ '' \n" +
			   " 	                    , /*@STAFFPOSITIONLIST =*/ '' \n" +
			   " 	                    , /*@RATELIST*/ '"+RateList+"' \n" +
			   " 	                    , /*@SHOWVACANCY*/ 1 \n" +
			   " 	    ) as r_in \n" +
			   " 	    CROSS APPLY (select distinct emplid + ',' \n" +
			   " 				  FROM dbo.ENERGYNET_FN_EMPL_HISTORY( \n" +
			   " 				    /*@DATAAREAID*/ 'KSOE' \n" +
			   " 				   ,/*@FROMDATE*/ '"+ dateStart+"' \n" +
			   " 				   ,/*@TODATE*/ '"+ dateFinal+"' \n" +
			   " 				   ,/*@ORGANIZATIONLIST*/ r_in.HRMORGANIZATIONID \n" +
			   " 				   ,/*@CHILDORG*/ 0 \n" +
			   " 				   ,/*@EMPLOYMENTLIST*/  '' \n" +
			   " 				   ,/*@EMPLOYMENTNAMELIST*/ '' \n" +
			   " 				   ,/*@STAFFPOSITIONLIST*/'' \n" +
			   " 				   ,/*@RATELIST*/   '"+RateList+"' \n" +
			   " 				   ,/*@ONLYLAST*/ 1 ) as intern \n" +
			   "                     where ( PAYRESIGNEDDATE_RU = '01.01.1900'  or  PAYRESIGNEDDATE_RU >'"+ dateFinal+"' ) -- не уволенные \n" +
			   " 				   FOR XML PATH('') \n" +
			   "                    ) r_empl (empidlstr) \n" +
			   "  group by r_in.HRMORGANIZATIONID , r_in.DESCRIPTION , r_in.PARENTORGANIZATIONID ,  r_in.PARENTDESCRIPTION , empidlstr \n" +
			   "  order by cehid , r_in.PARENTDESCRIPTION , r_in.DESCRIPTION \n" +
			   "  \n" ;

	   try {
			statement = connection.prepareStatement(selectStr);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {

				anObject = new AXPodrWithEmplidStrShort();

				anObject.podrId = set.getString("podr_id");
				anObject.podrName = set.getString("podr_nazv");
				anObject.mainPodrId = set.getString("main_podr_id");
				anObject.mainPodrName = set.getString("podr_nazv_main");
				anObject.emplIdString = set.getString("empidlstr");
				anObject.cehId = set.getString("cehid");
				anObject.cehName = set.getString("cehname");

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			try {
				EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			} catch (PersistenceException e1) {
				throw new SystemException(e.getMessage(), e);
			}
			return null;
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
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}




	/**
	 *  виды отпусков, которые являются уважительной причиной
	 *  для невыполнения служебных заданий
	 */
	public static final String ALLOWED_VACATION = "ВідБ/ОплОб;ВідгВихідн;ВідпБ/Опл;ВідпБ/оплА;ВідпБОгод;ВідпВагПол;ВідпДКтаК;"
			+ "ВідпДог6р;ВідпДогДит;ВідпНавчБО;ВідпНавчОп;ВідпОсновн;ВідпСоцДПД;ВідпСоціал;ВідпУБД;ВідпЧАЕС;МобВійськС;ВідпСпорт;"
			+ "Відряджен;"
			+ "Лікарняний;КурсиСредн;ДодОснВідп;";
	/**
	 *  виды отпусков, для проверки рабочего времени при планировании 
	 *   
	 */
	public static final String  VACATION = "ВідБ/ОплОб;ВідгВихідн;ВідпБ/Опл;ВідпБ/оплА;ВідпБОгод;ВідпВагПол;ВідпДКтаК;"
			+ "ВідпДог6р;ВідпДогДит;ВідпНавчБО;ВідпНавчОп;ВідпОсновн;ВідпСоцДПД;ВідпСоціал;ВідпУБД;ВідпЧАЕС;МобВійськС;ВідпСпорт;"
			+ "Лікарняний;КурсиСредн;ДодОснВідп;";

    /**
    *
    * Возвращает значение является ли сотрудник с табельным номером в отпуске на заданную дату
    *
    * @param tabNumber табельный номер
    * @param date дата для проверки
    *
    */
	public boolean isWorkerOnHolidays(String tabNumber, Date date) {
		return isWorkerOnHolidays(tabNumber, date, true , ALLOWED_VACATION );
	}

    /**
     *
     * Возвращает значение является ли сотрудник с табельным номером в отпуске на заданную дату
     *
     * @param tabNumber табельный номер
     * @param date дата для проверки
     * @param isException - если {@code true}, то в случае, если человек в отпуске, выкинет исключение
     *
     */
	public boolean isWorkerOnHolidays(String tabNumber, Date date, boolean isException , String typeVacation) {

		Connection mDaxConnection = null;
		PreparedStatement statement = null;
		ResultSet set = null;

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);

			String fio = "";
			String vacationType = "";
			String outVacation = "";

			String sql = "SELECT * FROM dbo.[ENERGYNET_FN_WORKING_TIME] "
					+ " ('KSOE', "
					+ " '" + new SimpleDateFormat("dd.MM.yyyy").format(date) + "', "
					+ " '" + new SimpleDateFormat("dd.MM.yyyy").format(date) + "', "
					+ " '', "
					+ " 0, "
					+ " ?, "    /* 000200 */
					+ " '', "
					+ " '', "
					+ " ?, "    /* виды отпусков */
					+ " '' ) ";

			statement = mDaxConnection.prepareStatement(sql);
			statement.setString(1, tabNumber);
			statement.setString(2, typeVacation /*ALLOWED_VACATION*/);

			set = statement.executeQuery();

			while (set.next()) {
				fio = set.getString(1);
				vacationType = set.getString(8);
			}

			if (!vacationType.equals("")) {

				if (vacationType.equals("Лікарняний")) {
					outVacation = "на лікарняному";
				} else if (vacationType.equals("Відряджен")) {
					outVacation = "у відрядженні";
				} else outVacation = "у відпустці";

				if (isException) {
					throw new SystemException("\n\n"
							+ fio + " перебуває " + outVacation + ".\n"
							+ "Оберіть іншого виконавця.");
				} else {
					return true;
				}
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return false;
	}

	public String isWorkerOnHolidaysDescriptive(String tabNumber) {
		return isWorkerOnHolidaysDescriptive(tabNumber, new Date());
	}

    /**
    *
    * Если сотрудник с табельным номером на заданную дату находится в отпуске (или на больничном и т.п.),
    * вернет строку с описанием статуса сотрудника, иначе вернет пустую строку
    *
    * @param tabNumber табельный номер
    * @param date дата для проверки
    *
    * @return описание статуса сотрудника в виде {@code "Станом на 12.07.2021 Левін Д.М. буде перебувати у відпустці"} или пустую строку
    *
    */
	public String isWorkerOnHolidaysDescriptive(String tabNumber, Date date) {

		Connection mDaxConnection = null;
		PreparedStatement statement = null;
		ResultSet set = null;

		date = Tools.clearTimeOfDate(date);

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);

			String fio = "";
			String vacationType = "";
			String outVacation = "";

			String sql = "SELECT * FROM dbo.[ENERGYNET_FN_WORKING_TIME] "
					+ " ('KSOE', "
					+ " '" + new SimpleDateFormat("dd.MM.yyyy").format(date) + "', "
					+ " '" + new SimpleDateFormat("dd.MM.yyyy").format(date) + "', "
					+ " '', "
					+ " 0, "
					+ " ?, "    /* 000200 */
					+ " '', "
					+ " '', "
					+ " ?, "    /* виды отпусков */
					+ " '' ) ";

			statement = mDaxConnection.prepareStatement(sql);
			statement.setString(1, tabNumber);
			statement.setString(2, ALLOWED_VACATION);

			set = statement.executeQuery();

			while (set.next()) {
				fio = set.getString(1);
				vacationType = set.getString(8);
			}

			if (!vacationType.equals("")) {

				if (vacationType.equals("Лікарняний")) {
					outVacation = "на лікарняному";
				} else if (vacationType.equals("Відряджен")) {
					outVacation = "у відрядженні";
				} else outVacation = "у відпустці";

				Date today = Tools.clearTimeOfDate(new Date());
				String state = " перебуває ";
				if (date.after(today)) {
					state = " буде перебувати ";
				} else if (date.before(today)) {
					state = " перебував ";
				}

				String result = fio + state + outVacation + ".\n";
				if (! date.equals(today)) {
					result = "Станом на " + Tools.dateFormatDefault.format(date) + " " + result;
				}

				return result;

			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return "";
	}

	public int getWorkDaysBetweenDates(Date dateStart, Date dateEnd) {
		return getWorkDaysBetweenDates(dateStart, dateEnd, false);
	}

    /**
     *  Возвращает количество рабочих дней между двумя датами
     *
     *  @param dateStart - дата начала периода
     *  @param dateEnd - дата окончания периода
     *  @param isException - выкидывать ли исключение, если функция из AX ничего не вернет
     *
     *  @return количество рабочих дней между dateStart и dateEnd
     */
	public int getWorkDaysBetweenDates(Date dateStart, Date dateEnd, boolean isException) {
		int total = 0;
		Connection mDaxConnection = null;
		PreparedStatement statement = null;
		ResultSet set = null;

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);

			String sql = " select round(WORKHOURS,2), WORKDAYS  "
					+ " from VSE_FN_WORKING_TIME_PLAN ( "
					+ "  'KSOE' "
					+ ", '" + new SimpleDateFormat("dd.MM.yyyy").format(dateStart) + "'"
					+ ", '" + new SimpleDateFormat("dd.MM.yyyy").format(dateEnd) + "'"
					+ ", '" + basicGraphicId + "'"
					+ ", 'ENET_FACT' ) ";

			statement = mDaxConnection.prepareStatement(sql);
			set = statement.executeQuery();

			while (set.next()) {
				total = set.getInt(2);
				if (set.wasNull() && isException) {
					throw new SystemException("\n\nПомилка визначення кількості робочих днів з Axapta!\n" +
							"Інтервал дат: " +
							new SimpleDateFormat("dd.MM.yyyy").format(dateStart) + " - " +
							new SimpleDateFormat("dd.MM.yyyy").format(dateEnd));
				}
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if(set != null) {
					set.close();
				}
				if(statement != null) {
					statement.close();
				}
				if(mDaxConnection != null && !mDaxConnection.isClosed()) {
					mDaxConnection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return total;
	}

	/**
	 * Проверяет, является ли заданная дата выходным или праздничным днем
	 *
	 * @param date - дата
	 *
	 * @return <b>true</b> - если дата является выходным или праздничным днем, иначе <b>false</b>
	 */
	public boolean isHoliday(Date date) {
		if (date == null) {
			throw new IllegalArgumentException("\n\nНе задано дату!");
		}

		int workDays = getWorkDaysBetweenDates(date, date, true);
		return (workDays == 0);
	}

	/**
	 * №
	 *
	 *  @param tabNumber
	 *
	 */
	public ENAverageCountPersonalShortList getAverageCountFromMDAX( String tabstring , String startDate , String endDate ) {

		ENAverageCountPersonalShortList result = new ENAverageCountPersonalShortList();

		CallableStatement stmt = null;
		PreparedStatement statement = null;
        String selectStr = "";


        ENAverageCountPersonalShort anObject;
        result.list = new Vector<>();
        if ( tabstring.equalsIgnoreCase("") ) {
        	result.setTotalCount(0);
        	return result;
        	}
        ResultSet  set = null;

        try {
        	selectStr =
        			" select    PERSONNELCATEGORYID   \n" +
        			"          ,PERSONNELCATEGORY   \n" +
        			"          ,HRMORGANIZATIONID  \n" +
        			"          ,HRMORGANIZATIONNAME \n" +
        			"          ,CEHCODE \n" +
        			"          ,CEHNAME \n" +
        			"          ,sum(resultcount) as resultcount \n" +
        			" from (        \n" +
        			"  select   NAME   \n" +
        			"          ,EMPLID   \n" +
        			"          ,PERSONNELCATEGORYID   \n" +
        			"          ,PERSONNELCATEGORY   \n" +
        			"          ,HRMORGANIZATIONID  \n" +
        			"          ,HRMORGANIZATIONNAME \n" +
        			"          ,CEHCODE  \n" +
        			"          ,CEHNAME \n" +
        			"          ,STARTDATE \n" +
        			"          ,ENDDATE \n" +
        			"          ,resultcount \n" +
        			"       from (    \n" +
        			" 		SELECT   \n" +
        			" 		          NAME   \n" +
        			" 		         ,EMPLID   \n" +
        			" 		         ,PERSONNELCATEGORYID   \n" +
        			" 		         ,PERSONNELCATEGORY   \n" +
        			" 		         ,COALESCE(qqq.HRMORGANIZATIONID  , '' ) as HRMORGANIZATIONID \n" +
        			" 		         ,COALESCE(qqq.DESCRIPTION , '' ) as HRMORGANIZATIONNAME \n" +
        			" 		         ,STARTDATE \n" +
        			" 		         ,ENDDATE \n" +
        			" 		         ,datediff(day , STARTDATE , ENDDATE) + 1  as datediff \n" +
        			" 		         ,cast ( cast (datediff(day , STARTDATE , ENDDATE) + 1 as NUMERIC )   \n" +
        			" 		           / /* kol-vo dney v mesyace */  \n" +
        			" 		           (SELECT DAY(DATEADD(DD,-1,DATEADD(MM,DATEDIFF(MM,-1,'"+startDate+"'),0)))) as NUMERIC )     as resultcount  \n" +
        			"                  ,ceha.CEHCODE  \n" +
        			"                  ,ceha.CEHNAME \n" +
        			" 		from ( \n" +
        			" 							SELECT   \n" +
        			" 							          NAME   \n" +
        			" 							         ,EMPLID   \n" +
        			" 							         ,PERSONNELCATEGORYID   \n" +
        			" 							         ,PERSONNELCATEGORY   \n" +
        			" 							         ,HRMORGANIZATIONID   \n" +
        			" 		                             ,DESCRIPTION \n" +
        			" 							         ,PARENTORGANIZATIONID   \n" +
        			" 							         ,PARENTDESCRIPTION   \n" +
        			" 							         ,case when STARTDATE < '"+startDate+"' then '"+startDate+"' else STARTDATE end  \n" +
        			" as    STARTDATE  \n" +
        			" 							         ,case when ENDDATE = '01.01.1900' or ENDDATE > '"+endDate+"' then   \n" +
        			" '"+endDate+"' else ENDDATE END as  ENDDATE					         \n" +
        			" 							  FROM dbo.ENERGYNET_FN_EMPL_HISTORY  \n" +
        			" 							                                     (  \n" +
        			" 							                      /*@DATAAREAID*/ 'KSOE'  \n" +
        			" 							                     ,/*@FROMDATE*/ /*$P{pdate1}*/ '"+startDate+"'  \n" +
        			" 							                     ,/*@TODATE*/ /*$P{pdate2}*/ '"+endDate+"'  \n" +
        			" 							                     ,/*@ORGANIZATIONLIST*/ ''  \n" +
        			" 							                     ,/*@CHILDORG*/ 1  \n" +
        			" 							                     ,/*@EMPLOYMENTLIST*/ '"+tabstring+"'  \n" +
        			" 							                     ,/*@EMPLOYMENTNAMELIST*/ ''  \n" +
        			" 							                     ,/*@STAFFPOSITIONLIST*/ '' \n" +
        			" 							                     ,/*@RATELIST*/  \n" +
        			" 'НВЗ_Д3;НВЗ_ДТУ_Д3;НВЗ_ДТУ_ПРЕМ;НВЗ_Е_Д3;НВЗ_Е_ПРЕМ;НВЗ_ІЗ_Д3;НВЗ_ІЗ_ПРЕМ;НВЗ_ПРЕМ;НВЗ_РЗА_Д3;НВЗ_РЗА_ПРЕМ' \n" +
        			" 							                     ,/*@ONLYLAST*/ 0  \n" +
        			" 							                                     )  \n" +
        			" 		)  as qqq  left join (                                 \n" +
        			" 							select hrm.HRMORGANIZATIONID   \n" +
        			" 							   ,CAST(hrm.AZT_MainOrganizationId AS NVARCHAR(200)) cehCode  /*цех код*/ \n" +
        			" 							   ,(CASE WHEN hrm.AZT_MainOrganizationId = '' THEN '' \n" +
        			" 							   ELSE (SELECT DESCRIPTION FROM  \n" +
        			" ENERGYNET_FN_ORGANIZATION_STRUCTURE(/*@DATAAREAID*/'KSOE',/*@ACTUALITYDATE*/'"+endDate+"' , hrm.AZT_MainOrganizationId, 0)) END)  \n" +
        			" cehName /*цех наименование*/ \n" +
        			" 							FROM RPAYHRMORGANIZATION hrm \n" +
        			" 							WHERE hrm.DATAAREAID = /*@DATAAREAID*/'KSOE' \n" +
        			" 							--AND hrm.HRMORGANIZATIONID = '010' \n" +
        			" 							AND hrm.AZT_STARTDATE = (SELECT TOP 1 AZT_STARTDATE \n" +
        			" 												FROM RPAYHRMORGANIZATION \n" +
        			" 												WHERE DATAAREAID = 'KSOE' \n" +
        			" 							AND AZT_STARTDATE <= '"+startDate+"'/*@ACTUALITYDATE*/ \n" +
        			" 							ORDER BY AZT_STARTDATE DESC) \n" +
        			" 		      )	as ceha on (qqq.HRMORGANIZATIONID = ceha.HRMORGANIZATIONID) \n" +
        			" ) as sel2		       \n" +
        			" ) as sel3	 \n" +
        			" group by  PERSONNELCATEGORYID  ,PERSONNELCATEGORY ,HRMORGANIZATIONID ,HRMORGANIZATIONNAME ,CEHCODE ,CEHNAME \n" +
        			" order by  CEHCODE ,CEHNAME,PERSONNELCATEGORYID,PERSONNELCATEGORY \n" ;



        	Connection connection = null;
    		try {
    			connection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
    		} catch (DatasourceConnectException e) {
    			throw new SystemException(e.getMessage(),e);
    		}

    		statement = connection.prepareStatement(selectStr);
    	     set = statement.executeQuery();
    		     int i;
    		     for(i = 0;set.next();i++)
    		      {

    		       anObject = new ENAverageCountPersonalShort();

    		       anObject.code = Integer.MIN_VALUE ;
    		       anObject.codeCeh = set.getString("CEHCODE");
    		       anObject.nameCeh = set.getString("CEHNAME");
    		       anObject.codePodr = set.getString("HRMORGANIZATIONID");
    		       anObject.namePodr = set.getString("HRMORGANIZATIONNAME");
    		       anObject.personalVidId = set.getString("PERSONNELCATEGORYID");
    		       anObject.personalVidName = set.getString("PERSONNELCATEGORY");
    		       anObject.countGen = set.getBigDecimal("resultcount");
    		       if(anObject.countGen != null)
    		           anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
    		       result.list.add(anObject);
    		      }

    		     result.setTotalCount(i);


    		    }
    		   catch(SQLException e)
    		    {
    		     System.out.println(e.getMessage()+"\nstatement - "+selectStr);

    		     return null;
    		    }
        finally {
            try {
                if (statement != null)
                    statement.close();
                if (stmt != null)
                	stmt.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }

        return result;
	}


	/**
	 * Списание материалов MDAX. Создание шапки журнала
	 * */
	 public String  createDocumentForWriteOffTMC(
			 String documentNum ,
			 Date dateGen ,
			 String operationType ,
			 String molCode
			 )
	    {
		 String journalId = "";
		 try {
			AXTransactionsLogic axLogic = new AXTransactionsLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
			String usr = axLogic.getUserSecurity().domainUserName;
			String pwd = axLogic.getUserSecurity().userPass;

			//usr = "axapta\\student1"; // / tezzzt пока по student1
			//pwd = "qazwsx2@";

			InventMovementKSService_Service service = new InventMovementKSService_Service();
			InventMovementKSService proxy = service
					.getBasicHttpBindingInventMovementKSService();
			((BindingProvider) proxy).getRequestContext().put(
					BindingProvider.USERNAME_PROPERTY, usr);
			((BindingProvider) proxy).getRequestContext().put(
					BindingProvider.PASSWORD_PROPERTY, pwd);

			 MovementJournalCreate creator = new MovementJournalCreate(proxy);
			 String siteId = "";
			 if (molCode.equals("0000")) {
				 siteId = "000";

			 }else {
				 mDaxLogic daxLogic = new mDaxLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
				 siteId = daxLogic.getAxDepartmentByMol(molCode);
			 }


			 if(siteId.equals("")) {
				 throw new EnergyproSystemException("Помилка siteId by mol_code " + molCode  +  "  не знайдено !!!!!  ");
			 }

			 journalId = creator.createInventMovement(operationType, dateGen,
					 documentNum , "", null, "", molCode, "" , usr , siteId , "RW"  );

		} catch (InventMovementKSServiceCreateAifFaultFaultFaultMessage e) {
			e.printStackTrace();
			throw new EnergyproSystemException("Error executing CreateDocumentForWriteOffTMC   \n " + e.getMessage());
		} catch (DatatypeConfigurationException e) {
			e.printStackTrace();
			throw new EnergyproSystemException("Error executing CreateDocumentForWriteOffTMC   \n " + e.getMessage());
		} catch (DatasourceConnectException e1) {
			e1.printStackTrace();
			throw new EnergyproSystemException("Error executing CreateDocumentForWriteOffTMC   \n " + e1.getMessage());
		}

		 return journalId;


	    }


	 /**
		 * Списание материалов MDAX. Добавление строк addLinesForWriteOffTMC
		 * */
		 public String[] addLinesForWriteOffTMC(FINMaterials finmatObject , String axJournalId , Date transDate)
		    {
			 //String journalLinesId = ""; // код строки журнала
			 String[] result = {"","",""}; // RECID	Код строки	InventJournalTrans.RecId
			 								  // costPrice	Мгновенная себестоимость	InventJournalTrans.costPriceInstantaneousInventDim_UA()
			 								  // costAmount	Мгновенная сумма затрат	InventJournalTrans.costAmountInstantaneous_UA()

			 try {
				if(finmatObject.axInventDimFinId == null || finmatObject.axInventDimFinId.equals("") ) {
					throw new EnergyproSystemException("Помилка при додаванні строк в журнал AX!!! \n Не вказаний Код фін. аналітик ");
				}
				if(finmatObject.price.doubleValue() == 0 ) {
					throw new EnergyproSystemException("Помилка при додаванні строк в журнал AX!!! \n Не вказана ціна матеріалу ");
				}


				mDaxLogic daxLogic = new mDaxLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);


				AXTransactionsLogic axLogic = new AXTransactionsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),userProfile);
				String usr = axLogic.getUserSecurity().domainUserName;
				String pwd = axLogic.getUserSecurity().userPass;

				//usr = "axapta\\student1"; // / tezzzt пока по student1
				//pwd = "qazwsx2@";

				InventMovementLinesKSService_Service service = new InventMovementLinesKSService_Service();
				InventMovementLinesKSService proxy = service.getBasicHttpBindingInventMovementLinesKSService();
				((BindingProvider) proxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
				((BindingProvider) proxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

				 MovementJournalLinesCreate creator = new MovementJournalLinesCreate(proxy);



				 String siteId = daxLogic.getAxDepartmentByMol(finmatObject.div_code);
				 if(siteId.equals("")) {
					 throw new EnergyproSystemException("Помилка siteId by mol_code " + finmatObject.div_code  +  "  not found !!!!!  ");
				 }

				 result = creator.createInventMovementLines( axJournalId , // (InventJournalTable).JournalNameId
						 finmatObject.ax_frc_code , // цфо  DimensionOffset[6]
						 finmatObject.ax_rest_purpose_typeid, // назначение  DimensionOffset[9]
						 finmatObject.ax_frc_code , // цфо корр DimensionOffset[6]
						 finmatObject.ax_rest_purpose_typeid, // назначение корр DimensionOffset[9]
						 finmatObject.nn , // Идентификатор мате-риала  ItemId
						 siteId ,// Код сайта	InventDimIssue.InventSiteId
						 finmatObject.div_code, // Код организации-получателя	InventDimReceipt.InventLocationId
						 finmatObject.bal_sch ,  // Балалансовый счет InventDimIssue.InventProfileId_RU
						 "", // InventJournalTrans.LedgerAccountIdOffset
						 finmatObject.quantity , // Количество	InventJournalTrans.QtyInUnitOpr_UA
						 finmatObject.mu_name , // Ед. изм	InventJournalTrans.UnitIdOpr_UA
						 finmatObject.ax_party_id , //  Идентификатор партии	InventDimIssue.inventBatchId
						 finmatObject.ax_rest_purpose_id , // InventDimIssue.wMSLocationId
						 transDate ,
						 finmatObject.axInventDimFinId , // код фин аналитики
						 finmatObject.price ,  // цена
						 true // кол-во отрицательное (списание )
				    		);

			} catch (InventMovementLinesKSServiceCreateAifFaultFaultFaultMessage e) {
				e.printStackTrace();
				throw new EnergyproSystemException("Error executing addLinesForWriteOffTMC   \n " + e.getMessage());
			} catch (DatatypeConfigurationException e) {
				e.printStackTrace();
				throw new EnergyproSystemException("Error executing addLinesForWriteOffTMC   \n " + e.getMessage());
			} catch (DatasourceConnectException e1) {
				e1.printStackTrace();
				throw new EnergyproSystemException("Error executing addLinesForWriteOffTMC   \n " + e1.getMessage());
			}

			 return result;


		    }

	 /**
	 * Списание материалов MDAX. Копирование строк из документа в документ
	 * */
	 public void updateJournalTrans(String axJournalIdFrom , String axJournalIdTo , String RecId)
	    {

	 try {
		if(axJournalIdFrom == null || axJournalIdFrom.equals("") ) {
			throw new EnergyproSystemException("Код журнала \"З\" не визначено!!!! " );
		}
		if(axJournalIdTo == null || axJournalIdTo.equals("") ) {
			throw new EnergyproSystemException("Код журнала \"В\" не визначено!!!! " );
		}


		AXTransactionsLogic axLogic = new AXTransactionsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
		String usr = axLogic.getUserSecurity().domainUserName;
		String pwd = axLogic.getUserSecurity().userPass;

		InventMovementLinesKSService_Service service = new InventMovementLinesKSService_Service();
		InventMovementLinesKSService proxy = service.getBasicHttpBindingInventMovementLinesKSService();
		((BindingProvider) proxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
		((BindingProvider) proxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

		System.out.println(" domainUser for updateJournalTrans = " + usr);
		MovementJournalLinesCreate creator = new MovementJournalLinesCreate(proxy);

		creator.updateJournalTrans(axJournalIdFrom, axJournalIdTo, RecId);

	} catch (InventMovementLinesKSServiceUpdateJournalTransAifFaultFaultFaultMessage e) {
		e.printStackTrace();
		throw new EnergyproSystemException("Error executing updateJournalTrans   \n " + e.getMessage());
	} catch (DatatypeConfigurationException e) {
		e.printStackTrace();
		throw new EnergyproSystemException("Error executing updateJournalTrans   \n " + e.getMessage());
	} catch (DatasourceConnectException e1) {
		e1.printStackTrace();
		throw new EnergyproSystemException("Error executing updateJournalTrans   \n " + e1.getMessage());
	}




	}

	/**
	 *  Возвращает код подразденения в АХ
	 *
	 *  @param molCode - код МОЛа
	 *
	 *  @return axDepartment - код подразденения в АХ
	 *
	 */
	public String getAxDepartmentByMol(String molCode) {

		String axDepartment = "";
		Connection mDaxConnection = null;
		PreparedStatement statement = null;
		ResultSet set = null;

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);

			String site = "0"+molCode.substring(0,2);

			String sql = "select s.dimension from dbo.inventsite s "
					+ " where upper(s.dataareaid) = upper('ksoe') "
					+ " and s.siteid = '" + site + "'";

			statement = mDaxConnection.prepareStatement(sql);
			set = statement.executeQuery();

			while (set.next()) {
				axDepartment = set.getString(1);
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
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
			if (mDaxConnection != null) {
				try {
					if ((mDaxConnection != null && !mDaxConnection.isClosed())) {
						mDaxConnection.close();
					}
				} catch (SQLException e) {
				}
			}
		}

		return axDepartment;
	}


	 public boolean isPostingAxJournalByEnAct(ENAct act)
	    {
		 try {
		  boolean isPostingAxJournal = false;

		  FINDoc2MolDataDAO f2mDAO = new FINDoc2MolDataDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
		  AXTransactionsLogic axLogic = new AXTransactionsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

		    FINDoc2MolDataFilter f2mFilter = new FINDoc2MolDataFilter();
	        f2mFilter.conditionSQL = "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = "+ act.code+")";
	        FINDoc2MolDataShortList f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
	        JournalAction jAction = new JournalAction();
	        int j;
			for (j = 0; j < f2mList.totalCount; j++) {

				if (f2mList.get(j).axJournalId != null
						&& !f2mList.get(j).axJournalId.equals("")) {
					/** проверка разноски журнала АКТ */
					isPostingAxJournal = jAction.checkPostingJournal(
							f2mList.get(j).axJournalId,
							axLogic.getUserSecurity().domainUserName,
							axLogic.getUserSecurity().userPass);
					if (isPostingAxJournal) {
						return isPostingAxJournal;
					}
				}
			}

	      return isPostingAxJournal;
		 } catch (DatasourceConnectException e) {
				throw new SystemException(e);
			}
		 catch (PersistenceException e) {
				throw new SystemException(e);
			}
	    }


	 /**
     *
     * Возвращает количество строк в журнале
     *
     * @param axJournalId код журнала
     *
     */
	public int getInventJournalTransCount(String axJournalId) {

		Connection mDaxConnection = null;
		PreparedStatement statement = null;
		ResultSet set = null;

		int count = Integer.MIN_VALUE;
		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);


			String sql = " select coalesce(count(q.JOURNALID),0) from InventJournalTrans q where q.DATAAREAID = 'KSOE' and q.journalid = ? ";

			statement = mDaxConnection.prepareStatement(sql);
			statement.setString(1, axJournalId);

			set = statement.executeQuery();

			while (set.next()) {
				count = set.getInt(1);
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		}

		return count;
	}


	/**
	 * Создание документа на движение материалов MDAX. Создание шапки журнала
	 * */
	 public String  createDocument(
			 String documentNum ,
			 Date dateGen ,
			 String operationType ,
			 String molCode ,
			 String inventDocType /*(RW- внутр выдача( минус ставит)  PW - внутр приход ( плюс ставит ) )*/
			 )
	    {
		 String journalId = "";
		 try {
			AXTransactionsLogic axLogic = new AXTransactionsLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					userProfile);
			String usr = axLogic.getUserSecurity().domainUserName;
			String pwd = axLogic.getUserSecurity().userPass;

			//usr = "axapta\\student1"; // / tezzzt пока по student1
			//pwd = "qazwsx2@";

			InventMovementKSService_Service service = new InventMovementKSService_Service();
			InventMovementKSService proxy = service
					.getBasicHttpBindingInventMovementKSService();
			((BindingProvider) proxy).getRequestContext().put(
					BindingProvider.USERNAME_PROPERTY, usr);
			((BindingProvider) proxy).getRequestContext().put(
					BindingProvider.PASSWORD_PROPERTY, pwd);

			 MovementJournalCreate creator = new MovementJournalCreate(proxy);

			 mDaxLogic daxLogic = new mDaxLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
			 String siteId = daxLogic.getAxDepartmentByMol(molCode);

			 if(siteId.equals("")) {
				 throw new EnergyproSystemException("Помилка siteId by mol_code " + molCode  +  "  not found !!!!!  ");
			 }

			 journalId = creator.createInventMovement(operationType, dateGen,
					 documentNum , "", null, "", molCode, "" , usr , siteId , inventDocType  );

		} catch (InventMovementKSServiceCreateAifFaultFaultFaultMessage e) {
			e.printStackTrace();
			throw new EnergyproSystemException("Error executing CreateDocumentForWriteOffTMC   \n " + e.getMessage());
		} catch (DatatypeConfigurationException e) {
			e.printStackTrace();
			throw new EnergyproSystemException("Error executing CreateDocumentForWriteOffTMC   \n " + e.getMessage());
		} catch (DatasourceConnectException e1) {
			e1.printStackTrace();
			throw new EnergyproSystemException("Error executing CreateDocumentForWriteOffTMC   \n " + e1.getMessage());
		}

		 return journalId;


	    }


	 /**
		 *  Выборка кода цеха по коду подразделения (MS Dynamics AX)
		 *
		 *  @param HRMORGANIZATIONID - код подразделения
         *  @param dateIn - дата
		 *  @return - AZT_MAINORGANIZATIONID - код цеха
		 */
		public String getMAINORGANIZATIONIDByHRMORGANIZATIONID(String HRMORGANIZATIONID, java.util.Date dateIn) {
			String AZT_MAINORGANIZATIONID = "";

			String selectStr;
			Connection connection = null;
			try {
				connection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
			} catch (DatasourceConnectException e) {
				throw new SystemException(e.getMessage(), e);
			}

			PreparedStatement statement = null;
			ResultSet set = null;

			/*selectStr = " select q.AZT_MAINORGANIZATIONID \n"+
					" from dbo.RPAYHRMORGANIZATION q \n"+
					" where q.DATAAREAID = 'KSOE' \n"+
					" and q.HRMORGANIZATIONID = '" + HRMORGANIZATIONID +"' \n"+
					" and q.AZT_STARTDATE <= (SELECT TOP 1 AZT_STARTDATE \n"+
					" 			 	FROM RPAYHRMORGANIZATION \n"+
					" 					WHERE DATAAREAID = 'KSOE' \n"+
					" 				AND AZT_STARTDATE <= '"+ new SimpleDateFormat("dd.MM.yyyy").format(dateIn) + "' \n" +
					" 				ORDER BY AZT_STARTDATE DESC) order by q.AZT_STARTDATE desc " ;*/
			
			selectStr = "  WITH tree (HRMORGANIZATIONID, DESCRIPTION, PARENTORGANIZATIONID ,AZT_STARTDATE , AZT_RHRMORGANIZATIONTYPE ) \n" +
					"  AS ( \n" +
					"      SELECT q.HRMORGANIZATIONID , cast(q.DESCRIPTION as varchar) DESCRIPTION   , cast(q.PARENTORGANIZATIONID as varchar) PARENTORGANIZATIONID , q.AZT_STARTDATE , q.AZT_RHRMORGANIZATIONTYPE \n" +
					"      FROM dbo.RPAYHRMORGANIZATION q \n" +
					"        where q.HRMORGANIZATIONID ='" + HRMORGANIZATIONID +"' \n"+
					"      UNION all \n" +
					"      select  q.HRMORGANIZATIONID , cast(q.DESCRIPTION as varchar) DESCRIPTION , cast(q.PARENTORGANIZATIONID as varchar) PARENTORGANIZATIONID , q.AZT_STARTDATE , q.AZT_RHRMORGANIZATIONTYPE \n" +
					"               from dbo.RPAYHRMORGANIZATION q \n" +
					"                   INNER JOIN tree ON tree.PARENTORGANIZATIONID = q.HRMORGANIZATIONID \n" +
					"               where q.DATAAREAID = 'KSOE'  \n" +
					"   \n" +
					"   \n" +
					"  ) \n" +
					"  SELECT t.HRMORGANIZATIONID as AZT_MAINORGANIZATIONID  , t.DESCRIPTION , t.PARENTORGANIZATIONID  , t.AZT_STARTDATE , t.AZT_RHRMORGANIZATIONTYPE \n" +
					"  FROM tree T \n" +
					"  where t.AZT_RHRMORGANIZATIONTYPE in (17 /*- Подразделение*/ , 11/* - Отделение*/ ) \n" +
					"  and t.AZT_STARTDATE <= (SELECT TOP 1 AZT_STARTDATE \n" +
					"                    FROM RPAYHRMORGANIZATION \n" +
					"                       WHERE DATAAREAID = 'KSOE' \n" +
					"                   AND AZT_STARTDATE <= '"+ new SimpleDateFormat("dd.MM.yyyy").format(dateIn) + "' \n" +
					"                   ORDER BY AZT_STARTDATE DESC) ";
			
			
			try {
				statement = connection.prepareStatement(selectStr);

				for (set = statement.executeQuery(); set.next();) {

					AZT_MAINORGANIZATIONID = set.getString("AZT_MAINORGANIZATIONID");
					return AZT_MAINORGANIZATIONID;

				}

				return AZT_MAINORGANIZATIONID;
			} catch (SQLException e) {
				System.out.println(e.getMessage() + "\nstatement - " + selectStr);
				try {
					EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
				} catch (PersistenceException e1) {
					throw new SystemException(e.getMessage(), e);
				}
				return null;
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
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
					}
				}
			}
		}

		private boolean updateAccountToIBANIfExists(String account, String bankCode, String iban, String[] dbInfo) {
			String updateSql = String.format("UPDATE %s SET %s = ? WHERE %s = ? AND %s = ?", dbInfo[0], dbInfo[1], dbInfo[2], dbInfo[3]);

			int count = BaseDAOUtils.executeUpdate(connection, updateSql, java.util.Arrays.asList(iban, account, bankCode), false);
			if(count > 1) {
				throw new SystemException(String.format("Помилка у кількості змінених записів (%d) для рахунку \"%s\" та мфо \"%s\" (IBAN %s)"
						, account, bankCode, iban));
			}
			return count > 0;
		}

		/**
		 *
		 * Обновление кода IBAN по расчетному счету и МФО банка для счетов клієнтов
		 *
		 * Если будет найдено более одной записи, то будет
		 * сгенерировано исключение
		 *
		 * @param account счет
		 * @param bankCode мфо банка
		 * @param iban счет в формате IBAN
		 * @return {@code true} - обновление произведено, {@code false} - счет не был найден
		 */
		public boolean updateCustBankAccountToIBANIfExists(String account, String bankCode, String iban) {
			return this.updateAccountToIBANIfExists(account, bankCode, iban
					, new String[] {"custBankAccount", "accountNum", "accountId", "bankGroupId"});
		}

		/**
		 *
		 * Обновление кода IBAN по расчетному счету и МФО банка для счетов поставщиков
		 *
		 * Если будет найдено более одной записи, то будет
		 * сгенерировано исключение
		 *
		 * @param account счет
		 * @param bankCode мфо банка
		 * @param iban счет в формате IBAN
		 * @return {@code true} - обновление произведено, {@code false} - счет не был найден
		 */
		public boolean updateVendBankAccountToIBANIfExists(String account, String bankCode, String iban) {
			return this.updateAccountToIBANIfExists(account, bankCode, iban
					, new String[] {"vendBankAccount", "accountId", "accountNum", "bankGroupId"});
		}

		/**
		 * Определение территориального подразделения из AX по таб. номеру
		 *
		 * @param tabNumber - таб. номер
		 * @return код терр. подразделения из AX, к которому привязан работник
		 */
		public String getTerritorialOrganizationId(String tabNumber) {
			if (tabNumber == null || tabNumber.trim().isEmpty()) {
				throw new SystemException("\n\nНе заданий таб. номер користувача!");
			}

			String orgId = "";
			String selectStr;
			Connection mDaxConnection = null;
			PreparedStatement statement = null;
			ResultSet resultSet = null;

			try {
				mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
			} catch (DatasourceConnectException e) {
				throw new SystemException(e.getMessage(), e);
			}

			selectStr =
				" select top 1 ph.TERRITORIALORGANIZATIONID_KSOE " +
				"   from RPAYHISTORY ph " +
				"  where ph.NUMBER_ = ? " +
				"  order by ph.RECID desc";

			try {
				statement = mDaxConnection.prepareStatement(selectStr);
				statement.setString(1, tabNumber);

				resultSet = statement.executeQuery();
				if (resultSet.next()) {
					orgId = resultSet.getString(1);
				}

				if (orgId == null) {
					orgId = "";
				}

			} catch (SQLException e) {
				throw new SystemException(e.getMessage(), e);
			} finally {
				try {
					if (resultSet != null)
						resultSet.close();
					if (statement != null)
						statement.close();
				} catch (SQLException e) {
				}
			}

			return orgId;
		}

		public String getPodrName(String id, Date date) {
			Connection mDaxConnection = null;
			if(date == null) {
				date = Tools.clearTimeOfDate(new Date());
			}
			String sql = "SELECT TOP 1 description FROM dbo.RPAYHRMORGANIZATION WHERE hrmorganizationid = ? "
					+ "AND azt_startdate <= ? AND dataareaid = ? ORDER BY azt_startdate DESC";
			List<Object> params = new Vector<>();
			params.add(id);
			params.add(date);
			params.add("KSOE");
			try {
				mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
				return BaseDAOUtils.executeStatementAndReadObject(mDaxConnection, sql, params
						, new BaseDAOUtils.StringFromResultSetTransformator(), true);
			} catch (DatasourceConnectException e) {
				throw new SystemException(e);
			} finally {
				try {
					if (mDaxConnection != null && !mDaxConnection.isClosed()) {
						try {
							connection.close();
						} catch (SQLException e) {
						}
					}
				} catch (SQLException e) {}
			}
		}

	public String getEmailByTabnumber(String tabNumber) {
		Connection mDaxConnection = null;

		String sql = 
				" select c.EMAIL " + 
				" from EMPLTABLE et, DIRECOMMTELEMAILVIEW_UA c " +
				" where et.PARTYID = c.PARTYID " +
				"   and c.ECOMMTYPEID = 'Email' " +
				"   and et.EMPLID = ?";

		List<Object> params = new Vector<>();
		params.add(tabNumber);

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
			return BaseDAOUtils.executeStatementAndReadObject(mDaxConnection, sql, params
					, new BaseDAOUtils.StringFromResultSetTransformator(), true);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			try {
				if (mDaxConnection != null && !mDaxConnection.isClosed()) {
					try {
						connection.close();
					} catch (SQLException e) {
					}
				}
			} catch (SQLException e) {}
		}
	}

	public List<String> getPhoneNumbersByTabnumber(String tabNumber) {
		Connection mDaxConnection = null;

		String sql = 
				" select c.PHONE " + 
				" from EMPLTABLE et, DIRECOMMTELEMAILVIEW_UA c " +
				" where et.PARTYID = c.PARTYID " +
				"   and c.ECOMMTYPEID = 'CellularPhone' " +
				"   and et.EMPLID = ?";

		List<Object> params = new Vector<>();
		params.add(tabNumber);

		try {
			mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
			return BaseDAOUtils.executeStatementAndReadObjects(mDaxConnection, sql, params
					, new BaseDAOUtils.StringFromResultSetTransformator(), true);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			try {
				if (mDaxConnection != null && !mDaxConnection.isClosed()) {
					try {
						connection.close();
					} catch (SQLException e) {
					}
				}
			} catch (SQLException e) {}
		}
	}

}