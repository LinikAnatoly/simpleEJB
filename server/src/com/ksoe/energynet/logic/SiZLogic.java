package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENSizObjectDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENSizObject;
import com.ksoe.energynet.valueobject.filter.ENDepartmentFilter;
import com.ksoe.energynet.valueobject.filter.ENSizObjectFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.valueobject.TKElementType;
import com.ksoe.techcard.valueobject.TKMegaElementType;
import com.ksoe.techcard.valueobject.TKTechCardSource;
import com.ksoe.techcard.valueobject.brief.TKMaterials2TechCardShort;
import com.ksoe.techcard.valueobject.lists.TKMaterials2TechCardShortList;

public class SiZLogic extends LogicModule {

	public SiZLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}



	public TKMaterials2TechCardShortList getMaterialsBySizObject(int techCardCode, int sizElementCode) {

		TKMaterials2TechCardShortList result = new TKMaterials2TechCardShortList();
		TKMaterials2TechCardShort anObject;
		result.list = new Vector();

		String selectStr;
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = " select w.*, " +
				" coalesce( " +
				"  case when (presentdate is not null and isudate is not null and presentdate > isudate) " +
				"        then 'видано, не введено в експлуатацію: '||to_char(presentdate,'dd.mm.yyyy') " +
				"      when (isudate is not null and isudate > coalesce(orderdate,'01.01.2000')) " +
				"        then 'у робітника: '||_diffmonth(isudate, current_date)||' мес.' " +
				"     when orderdate is not null then 'в заявці: '||to_char(orderdate,'dd.mm.yyyy') end, 'не видано') as fact " +

				" from ( " +

				" select tt.sz2tkcode, tm.elementcode, tm.code, tm.name, tu.code, tu.name, t2e.kolvo, " +
				" t2e.isobligatory, tus.name, t2e.purchasestart, t2e.purchaseend, t2e.iseveryone, " +
				" tus.countmonth, tt.zmcode, tt.tname, tt.zmtcode as realmaterialcode, " +

				" get_sz_isudate_cl(s.elementcode::integer, tt.zmcode::integer) as isudate, " +
				" get_sz_orderdate_cl(s.elementcode::integer, tt.zmcode::integer) as orderdate, " +
				" get_sz_presentdate_cl(s.elementcode::integer, tt.zmcode::integer) as presentdate " +

				" from tkelement e, tkelement2techcard t2e, tktechcard tc, ensizobject s, tkmeasurement tu, tkmaterials tm " +

				" left join " +
				" (select tt.sizmaterialsrefcode as zmcode, m.name as tname, tt.tkmaterialsrefcode as zmtcode, tt.code as sz2tkcode " +
				"    from ensizmaterials2tkmtrls tt, tkmaterials m " +
				"   where m.code = tt.tkmaterialsrefcode " +
				"     and tt.code not in ( select distinct ensizmaterials2tkmtrls.parentrefcode from ensizmaterials2tkmtrls where parentrefcode is not null ) " +
				"     and tt.elementrefcode = ? ) tt on tt.zmcode = tm.code " +

				" left join tktimeuse tus on tus.code = tm.timeusecode " +

				" where e.code = t2e.elementcode " +
				"  and e.elementtypecode = " + TKElementType.TKMATHERIALS +
				"  and tm.elementcode = e.code and tm.measurementcode = tu.code " +
				"  and t2e.techkartcode = ? " +
				"  and t2e.techkartcode = tc.code " +
				"  and cast(tc.techkartnumber as integer) = s.sizcode " +
				"  and s.elementcode = ? ) w ";


        try {

			statement = connection.prepareStatement(selectStr);

			statement.setInt(1, sizElementCode);
			statement.setInt(2, techCardCode);
			statement.setInt(3, sizElementCode);


            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
                anObject = new TKMaterials2TechCardShort();

                anObject.code = set.getInt(1);
                if (set.wasNull())
                    anObject.code = Integer.MIN_VALUE;

                anObject.elementCode = set.getInt(2);
                if (set.wasNull())
                    anObject.elementCode = Integer.MIN_VALUE;

                anObject.materialCode = set.getInt(3);
                if (set.wasNull())
                    anObject.materialCode = Integer.MIN_VALUE;

                anObject.name = set.getString(4);

                anObject.measurementCode = set.getInt(5);
                if (set.wasNull())
                    anObject.measurementCode = Integer.MIN_VALUE;

                anObject.measurementName = set.getString(6);

                anObject.countGen = set.getBigDecimal(7);
                if (anObject.countGen != null) {
                    anObject.countGen = anObject.countGen.setScale(6,
                            BigDecimal.ROUND_HALF_UP);
                }

                anObject.isObligatory = set.getInt(8);
                if (set.wasNull())
                    anObject.isObligatory = Integer.MIN_VALUE;

                anObject.timeuseName = set.getString(9);

                anObject.purchaseStart = set.getInt(10);
                if (set.wasNull())
                    anObject.purchaseStart = Integer.MIN_VALUE;

                anObject.purchaseEnd = set.getInt(11);
                if (set.wasNull())
                    anObject.purchaseEnd = Integer.MIN_VALUE;

                anObject.isEveryOne = set.getInt(12);
                if (set.wasNull())
                    anObject.isEveryOne = Integer.MIN_VALUE;

                anObject.rootGroupRefCode = set.getInt(14);
                if (set.wasNull())
                    anObject.rootGroupRefCode = Integer.MIN_VALUE;

                /* реальный материал (для закупки) */
                anObject.numkatalog = set.getString(15);

                /* код реального материала (для закупки) */
				anObject.parentRefCode = set.getInt(16);
				if (set.wasNull())
					anObject.parentRefCode = Integer.MIN_VALUE;


                /* состояние (в заявке, в наличии, период использования) */
                anObject.identid = set.getString(20);

                result.list.add(anObject);

            }

            result.setTotalCount(i);
            return result;

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

		}
	}




	public int getKartaBySiz(int kartNumber) {

		PreparedStatement statement = null;
		ResultSet set = null;

		String SQL =
			" select tk.code from tktechcard tk " +
			" where tk.techcardsourcecode = " + TKTechCardSource.SIZ + // источник "Засоби захисту"
			" and tk.megaelementtypecode = " + TKMegaElementType.SIZ +
			" and tk.techkartnumber = '" + kartNumber + "'";

		int kartCode = Integer.MIN_VALUE;

		try {
			statement = connection.prepareStatement(SQL);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				kartCode = set.getInt(1);
				if (set.wasNull())
					kartCode = Integer.MIN_VALUE;
			}

			return kartCode;

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
		}
	}




	public int getKartaByBsz(int kartNumber) {

		PreparedStatement statement = null;
		ResultSet set = null;

		String SQL =
			" select tk.code from tktechcard tk " +
			" where tk.techcardsourcecode = " + TKTechCardSource.SIZ + // источник "Засоби захисту"
			" and tk.megaelementtypecode = " + TKMegaElementType.BSZ +
			" and tk.techkartnumber = '" + kartNumber + "'";

		int kartCode = Integer.MIN_VALUE;

		try {
			statement = connection.prepareStatement(SQL);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				kartCode = set.getInt(1);
				if (set.wasNull())
					kartCode = Integer.MIN_VALUE;
			}

			return kartCode;

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
		}
	}



	public int getKartaByTP(int kartNumber) {

		PreparedStatement statement = null;
		ResultSet set = null;

		String SQL =
			" select tk.code from tktechcard tk " +
			" where tk.techcardsourcecode = " + TKTechCardSource.SIZ + // источник "Засоби захисту"
			" and tk.classificationtypecode = 500002083 " +
			" and tk.techkartnumber = '" + kartNumber + "'";

		int kartCode = Integer.MIN_VALUE;

		try {
			statement = connection.prepareStatement(SQL);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				kartCode = set.getInt(1);
				if (set.wasNull())
					kartCode = Integer.MIN_VALUE;
			}

			return kartCode;

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
		}
	}



	/**
	 * возвращает дату ввода в эксплуатацию
	 *
	 * @param elementCode
	 * @param materialCode
	 *
	 * @return issueDate
	 */
	public Date getIssueDate(int elementCode, int materialCode) {

		PreparedStatement statement = null;
		ResultSet set = null;

		try {

			int techcardCode = getTechcardCode(elementCode);


			Calendar calendar = new GregorianCalendar(1991, 0 , 1);
			Date issueDate = calendar.getTime();

	        String sql = " select get_sz_isudate( " + elementCode + ", "

	        		+ " ( select s.sizmaterialsrefcode "
	        		+ "    from ensizmaterials2tkmtrls s "
	        		+ "   where s.elementrefcode = " + elementCode
	        		+ "     and s.code not in ( "
	        		+ "        select distinct ensizmaterials2tkmtrls.parentrefcode "
	        		+ "          from ensizmaterials2tkmtrls "
	        		+ "         where parentrefcode is not null "
	        		+ "           and ensizmaterials2tkmtrls.elementrefcode = s.elementrefcode "
	        		+ "           and ensizmaterials2tkmtrls.sizmaterialsrefcode = s.sizmaterialsrefcode ) "

	        		+ "     and s.tkmaterialsrefcode = " + materialCode

	        		/**  кроме старых нормативных материалов  */
	        		+ " and s.sizmaterialsrefcode in ( "
	        		+ " select distinct tm.code "
	        		+ " from tkelement e, tkelement2techcard t2e, tktechcard tc, ensizobject s, tkmeasurement tu, tkmaterials tm "

	        		+ " left join "
	        		+ " (select tt.sizmaterialsrefcode as zmcode, m.name as tname, tt.tkmaterialsrefcode as zmtcode, tt.code as sz2tkcode "
	        		+ " from ensizmaterials2tkmtrls tt, tkmaterials m "
	        		+ " where m.code = tt.tkmaterialsrefcode "
	        		+ " and tt.code not in ( select distinct ensizmaterials2tkmtrls.parentrefcode from ensizmaterials2tkmtrls where parentrefcode is not null ) "
	        		+ " and tt.elementrefcode = " + elementCode + " ) tt on tt.zmcode = tm.code "

	        		+ " left join tktimeuse tus on tus.code = tm.timeusecode "

	        		+ " where e.code = t2e.elementcode "
	        		+ " and e.elementtypecode = " + TKElementType.TKMATHERIALS
	        		+ " and tm.elementcode = e.code and tm.measurementcode = tu.code "
	        		+ " and t2e.techkartcode = " + techcardCode
	        		+ " and t2e.techkartcode = tc.code "
	        		+ " and cast(tc.techkartnumber as integer) = s.sizcode "
	        		+ " and s.elementcode = " + elementCode + " ) "

					+ " order by s.dateedit, s.code desc limit 1 "

	        		+ " )::integer ) ";


			statement = connection.prepareStatement(sql);
			set = statement.executeQuery();

			while(set.next()) {
				issueDate = set.getDate(1);

				if (set.wasNull())
					issueDate = calendar.getTime();
			}


			return issueDate;

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
		}
	}



	/**
	 * возвращает код техкарты норматива
	 *
	 * @param elementCode
	 * @return techcardCode
	 */
	private int getTechcardCode(int elementCode) {

		int techcardCode = Integer.MIN_VALUE;
		PreparedStatement statement = null;
		ResultSet set = null;

		try {

			String sql = " select t.code from tktechcard t "
					+ " where t.techcardsourcecode = " + TKTechCardSource.SIZ  // источник "Засоби захисту"
					+ "  and t.megaelementtypecode = " + TKMegaElementType.SIZ
					+ "  and t.techkartnumber = "
					+ " (select s.sizcode::text from ensizobject s where s.elementcode = " + elementCode + ") ";


			statement = connection.prepareStatement(sql);
			set = statement.executeQuery();

			while(set.next()) {
				techcardCode = set.getInt(1);
			}


			return techcardCode;

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
		}
	}



	/**
	 * возвращает дату включения материала в заявку
	 *
	 * @param elementCode
	 * @param materialCode
	 *
	 * @return orderDate
	 */
	public Date getOrderDate(int elementCode, int materialCode) {

		PreparedStatement statement = null;
		ResultSet set = null;

		int techcardCode = getTechcardCode(elementCode);


		Calendar calendar = new GregorianCalendar(1991, 0 , 1);
		Date orderDate = calendar.getTime();

        String sql = " select get_sz_orderdate( " + elementCode + ", "

        		// + " ( select distinct s.sizmaterialsrefcode "
        		+ " ( select s.sizmaterialsrefcode "
        		+ "    from ensizmaterials2tkmtrls s "
        		+ "   where s.elementrefcode = " + elementCode
        		+ "     and s.code not in ( "
        		+ "        select distinct ensizmaterials2tkmtrls.parentrefcode "
        		+ "          from ensizmaterials2tkmtrls "
        		+ "         where parentrefcode is not null "
        		+ "           and ensizmaterials2tkmtrls.elementrefcode = s.elementrefcode "
        		+ "           and ensizmaterials2tkmtrls.sizmaterialsrefcode = s.sizmaterialsrefcode ) "

        		+ "     and s.tkmaterialsrefcode = " + materialCode

        		/**  кроме старых нормативных материалов  */
        		+ " and s.sizmaterialsrefcode in ( "
        		+ " select distinct tm.code "
        		+ " from tkelement e, tkelement2techcard t2e, tktechcard tc, ensizobject s, tkmeasurement tu, tkmaterials tm "

        		+ " left join "
        		+ " (select tt.sizmaterialsrefcode as zmcode, m.name as tname, tt.tkmaterialsrefcode as zmtcode, tt.code as sz2tkcode "
        		+ " from ensizmaterials2tkmtrls tt, tkmaterials m "
        		+ " where m.code = tt.tkmaterialsrefcode "
        		+ " and tt.code not in ( select distinct ensizmaterials2tkmtrls.parentrefcode from ensizmaterials2tkmtrls where parentrefcode is not null ) "
        		+ " and tt.elementrefcode = " + elementCode + " ) tt on tt.zmcode = tm.code "

        		+ " left join tktimeuse tus on tus.code = tm.timeusecode "

        		+ " where e.code = t2e.elementcode "
        		+ " and e.elementtypecode = " + TKElementType.TKMATHERIALS
        		+ " and tm.elementcode = e.code and tm.measurementcode = tu.code "
        		+ " and t2e.techkartcode = " + techcardCode
        		+ " and t2e.techkartcode = tc.code "
        		+ " and cast(tc.techkartnumber as integer) = s.sizcode "
        		+ " and s.elementcode = " + elementCode + " ) "

        		+ " order by s.dateedit, s.code desc limit 1 "

        		+ ")::integer ) ";

		try {

			statement = connection.prepareStatement(sql);
			set = statement.executeQuery();

			while(set.next()) {

				orderDate = set.getDate(1);

				if (set.wasNull())
					orderDate = calendar.getTime();
			}


			return orderDate;


		} catch (Exception e) {
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




	/**
	 * возвращает требуемую дату закупки
	 *
	 * @param elementCode
	 * @param materialCode
	 *
	 * @return purchaseDate
	 */
	public Date getPurchaseDate(int elementCode, int materialCode) {

		PreparedStatement statement = null;
		ResultSet set = null;

		Calendar calendar = new GregorianCalendar(1991, 0 , 1);
		Date purchaseDate = calendar.getTime();

		String sql = " select " +
				" case when (isudate is not null) then add_months(isudate, countmonth::integer) end as purchasemonth " +

				" from ( " +

				" select tus.countmonth, get_sz_isudate(s.elementcode::integer, tt.zmcode::integer) as isudate " +

				" from tkelement e, tkelement2techcard t2e, tktechcard tc, ensizobject s, tkmeasurement tu, tkmaterials tm " +

				" left join " +
				" (select tt.sizmaterialsrefcode as zmcode, m.name as tname, tt.tkmaterialsrefcode as zmtcode, tt.code as sz2tkcode " +
				"    from ensizmaterials2tkmtrls tt, tkmaterials m " +
				"   where m.code = tt.tkmaterialsrefcode " +
				"     and tt.code not in ( select distinct ensizmaterials2tkmtrls.parentrefcode from ensizmaterials2tkmtrls where parentrefcode is not null ) " +
				"     and tt.elementrefcode = " + elementCode + " ) tt on tt.zmcode = tm.code " +

				" left join tktimeuse tus on tus.code = tm.timeusecode " +

				" where e.code = t2e.elementcode " +
				"  and e.elementtypecode = " + TKElementType.TKMATHERIALS +
				"  and tm.elementcode = e.code " +
				"  and tm.measurementcode = tu.code " +
				"  and tt.zmtcode = " + materialCode +
				"  and t2e.techkartcode = tc.code " +
				"  and cast(tc.techkartnumber as integer) = s.sizcode " +
				"  and s.elementcode = " + elementCode + " ) w ";

		try {
			statement = connection.prepareStatement(sql);
			set = statement.executeQuery();

			while(set.next()) {
				purchaseDate = set.getDate(1);

				if (set.wasNull())
					purchaseDate = calendar.getTime();
			}


			return purchaseDate;

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
		}
	}



	/**
	 * обновление должности и подразделения по штатному
     *
     * @param soCode
     * @param tabNumber
     */
	public void updateStaffPosition(int soCode, String tabNumber) {

		Connection fkConnection = null;

		try {

			fkConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            FINWorkerDAO finWorkerFKDAO = new FINWorkerDAO(fkConnection, userProfile);

            ENDepartmentDAO departmentDao = new ENDepartmentDAO(connection, userProfile);
			ENSizObjectDAO sizObjectDao = new ENSizObjectDAO(connection, userProfile);
			ENSizObject sizObject = sizObjectDao.getObject(soCode);


			FINWorkerFilter finWorkerFilter = new FINWorkerFilter();
			finWorkerFilter.tabNumber = tabNumber;

			FINWorkerShortList workerShortList = finWorkerFKDAO.getFINWorkerList(finWorkerFilter, 0, -1, new Date(), true);
			if (workerShortList.totalCount > 0) {

				int departmentCode = Integer.MIN_VALUE;
				ENDepartmentFilter departmentFilter = new ENDepartmentFilter();
				departmentFilter.hrmorganizationid = workerShortList.get(0).departmentCode;

				int[] dArr = departmentDao.getFilteredCodeArray(departmentFilter, 0, -1);
				if (dArr.length > 0) {

					ENDepartment department = departmentDao.getObject(dArr[0]);
					departmentCode = department.code;

				} else {

					ENDepartmentFilter department2Filter = new ENDepartmentFilter();
					department2Filter.hrmorganizationid = workerShortList.get(0).departmentCode.substring(0, 3);
					int[] d2Arr = departmentDao.getFilteredCodeArray(department2Filter, 0, -1);

					if (d2Arr.length > 0) {
						ENDepartment department = departmentDao.getObject(d2Arr[0]);
						departmentCode = department.code;

					}
				}


				if (departmentCode != Integer.MIN_VALUE ) {
					sizObject.departmentRef.code = departmentCode;
				}

				sizObject.profesion = workerShortList.get(0).positionName;

				sizObjectDao.save(sizObject);
			}


		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (fkConnection != null && !fkConnection.isClosed()) {
					fkConnection.close();
					fkConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}



	/**
	 * проверка материала на нормативе
	 *
	 * @param tkMaterialsCode
	 * @param szElementCode
	 */
	public void checkExistMaterials(int tkMaterialsCode, int szElementCode) {

		try {

			ENSizObjectDAO sizObjectDao = new ENSizObjectDAO(connection, userProfile);

			ENSizObjectFilter sizObjectFilter = new ENSizObjectFilter();
			sizObjectFilter.element.code = szElementCode;

			int[] sArr = sizObjectDao.getFilteredCodeArray(sizObjectFilter, 0, -1);
			if (sArr.length > 0) {
				ENSizObject sizObject = sizObjectDao.getObject(sArr[0]);

				int tkCode = getKartaBySiz(sizObject.sizCode);

				TKMaterials2TechCardShortList cardShortList = getMaterialsBySizObject(tkCode, szElementCode);
				for (int i = 0; i < cardShortList.totalCount; i++) {

					if (cardShortList.get(i).parentRefCode == tkMaterialsCode ) {
						throw new SystemException("\n\n"
								+ "Такий матеріал вже прив'язаний до нормативу - " + cardShortList.get(i).name + "!");
					}
				}
			}


		} catch (Exception e) {
			throw new SystemException(e.getMessage(), e);
		}
	}



}
