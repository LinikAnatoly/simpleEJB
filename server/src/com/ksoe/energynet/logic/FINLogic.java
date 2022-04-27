package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.AbstractMap;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;
import javax.xml.ws.BindingProvider;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.contract.valueobject.PersonalServicesInfo;
import com.ksoe.energynet.dataminer.ENAct2ProvDAO;
import com.ksoe.energynet.dataminer.ENAct2RQFKOrderDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2PlanDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENHumenItemDAO;
import com.ksoe.energynet.dataminer.ENMOL2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENNomenclaturesOperativeDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENSpravMolDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderDAO;
import com.ksoe.energynet.dataminer.FINDoc2Act2WorkOrderDAO;
import com.ksoe.energynet.dataminer.FINDoc2ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.FINDoc2MolDataDAO;
import com.ksoe.energynet.dataminer.FINDoc2WorkOrderDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.dataminer.FINMolDAO;
import com.ksoe.energynet.dataminer.FINMolDataDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZDAO;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.util.Tools.Transformator;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2Humen;
import com.ksoe.energynet.valueobject.ENAct2RQFKOrder;
import com.ksoe.energynet.valueobject.ENAct2RQFKOrderType;
import com.ksoe.energynet.valueobject.ENActPostingKind;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Plan;
import com.ksoe.energynet.valueobject.ENEstimateItem2PlanType;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENMark;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENStandardConst;
import com.ksoe.energynet.valueobject.ENTravelSheetFuel;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.ENWorkOrderStatus;
import com.ksoe.energynet.valueobject.FINDoc2Act2WorkOrder;
import com.ksoe.energynet.valueobject.FINDoc2ENServicesObject;
import com.ksoe.energynet.valueobject.FINDoc2MolData;
import com.ksoe.energynet.valueobject.FINDoc2WorkOrder;
import com.ksoe.energynet.valueobject.FINDocType;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.SCUsageInputItem;
import com.ksoe.energynet.valueobject.SCUsageInputItemKind;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ;
import com.ksoe.energynet.valueobject.brief.ENElementShort;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkShort;
import com.ksoe.energynet.valueobject.brief.FINWorkerShort;
import com.ksoe.energynet.valueobject.filter.ENAct2RQFKOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2PlanFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.filter.ENMOL2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENNomenclaturesOperativeFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENSpravMolFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderFilter;
import com.ksoe.energynet.valueobject.filter.FINDoc2Act2WorkOrderFilter;
import com.ksoe.energynet.valueobject.filter.FINDoc2ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.FINDoc2MolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2ProvShortList;
import com.ksoe.energynet.valueobject.lists.ENAct2RQFKOrderShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2PlanShortList;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;
import com.ksoe.energynet.valueobject.lists.ENHumenItemShortList;
import com.ksoe.energynet.valueobject.lists.ENMOL2PlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENSpravMolShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderShortList;
import com.ksoe.energynet.valueobject.lists.FINDoc2ENServicesObjectShortList;
import com.ksoe.energynet.valueobject.lists.FINDoc2MolDataShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energynet.valueobject.lists.FINMolDataShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.fin.dataminer.PartyDAO;
import com.ksoe.fin.logic.FKConsts;
import com.ksoe.fin.logic.FKLogic;
import com.ksoe.fin.logic.FKLogic2;
import com.ksoe.fin.logic.FKOSLogic;
import com.ksoe.fin.valueobject.TStringAdditionalParams;
import com.ksoe.fin.valueobject.filter.PartyFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.reporting.exception.ReportMakerException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.mdax.logic.AXTransactionsLogic;
import com.ksoe.mdax.services.inventmovementlinesksservice.MovementJournalLinesCreate;
import com.ksoe.mdax.services.journalactionks.JournalAction;
import com.ksoe.mdax.services.journalactionks.NoYes;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItem2ENEstimateItemDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItemDAO;
import com.ksoe.rqorder.dataminer.SCInvoiceDAO;
import com.ksoe.rqorder.ejb.RQFKOrderController;
import com.ksoe.rqorder.ejb.RQFKOrderControllerHome;
import com.ksoe.rqorder.logic.FKOrderLogic;
import com.ksoe.rqorder.logic.OrderLogic;
import com.ksoe.rqorder.logic.RQConsts;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderItem;
import com.ksoe.rqorder.valueobject.RQFKOrderItem2ENEstimateItem;
import com.ksoe.rqorder.valueobject.RQFKOrderKind;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;
import com.ksoe.rqorder.valueobject.brief.RQFKOrderShort;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItem2ENEstimateItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItemFilter;
import com.ksoe.rqorder.valueobject.filter.SCInvoiceFilter;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderItem2ENEstimateItemShortList;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderShortList;
import com.ksoe.rqorder.valueobject.lists.SCInvoiceShortList;
import com.ksoe.techcard.dataminer.OSTableDAO;
import com.ksoe.techcard.dataminer.TEMPNomenclaturesDAO;
import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKTechCardSource;
import com.ksoe.techcard.valueobject.filter.OSTableFilter;
import com.ksoe.techcard.valueobject.filter.TEMPNomenclaturesFilter;
import com.ksoe.techcard.valueobject.lists.OSTableShortList;
import com.ksoe.techcard.valueobject.lists.TEMPNomenclaturesShortList;
import com.ksoe.techcard.valueobject.lists.TKClassificationTypeShortList;
import com.microsoft.schemas.dynamics._2008._01.documents.inventmovementlinesks.AxdEntityInventJournalTrans;
import com.microsoft.schemas.dynamics._2008._01.services.InventMovementLinesKSService;
import com.microsoft.schemas.dynamics._2008._01.services.InventMovementLinesKSService_Service;

public class FINLogic  extends LogicModule {

    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private java.sql.Connection energyNetConnection = null;

    protected java.sql.Connection getConnection_(String dataSourceName) throws DatasourceConnectException
    {
    try {
    if (energyNetConnection != null && ! energyNetConnection.isClosed()) {
        return energyNetConnection;
    }

    InitialContext initialContext = new InitialContext();
    DataSource dataSource = (DataSource) initialContext
            .lookup(dataSourceName);
    energyNetConnection = dataSource.getConnection();
    return energyNetConnection;
    } catch (NamingException e) {
    throw new DatasourceConnectException(dataSourceName, e);
    } catch (SQLException e) {
    throw new DatasourceConnectException(dataSourceName, e);
    }
    }


    public boolean getIsNalog(String inv_num) throws PersistenceException
    {
        String sql =
            " /* выбираем налог не налог */" +
            " SELECT oo.f_amort " +
            "  FROM os_t.ostable oo " +
            " where " +
            "   oo.kod_inv = ? " +
            "  and oo.show_ = 'Y' " ;

        PreparedStatement statement = null;
        ResultSet  resultSet = null;

        try {

            String strOut = "";
            boolean boolOut = false;

            statement = connection.prepareStatement(sql);

            statement.setString(1, inv_num);

            resultSet = statement.executeQuery();

            while(resultSet.next())
            {
                strOut = resultSet.getString(1);
            }

            if(strOut.equals("Y"))
                boolOut = true;
            if(strOut.equals("N"))
                boolOut = false;

            if((!strOut.equals("Y")) && (!strOut.equals("N")))
                throw new EnergyproSystemException("Помилка для інвентарного: "+inv_num);

            return boolOut;
        }
        catch (SQLException e) {
                System.out.println(    e.getMessage());
                throw new PersistenceException(e.getMessage());
        }
            finally {
            try {if (resultSet != null) resultSet.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }

    }

    public boolean getInvNumberIsExist(String inv_num) throws PersistenceException
    {
        String sql =
            " /* выбираем активные записи */" +
            " SELECT * " +
            "  FROM os_t.ostable oo " +
            " where " +
            "   oo.kod_inv = ? " +
            "  and oo.show_ = 'Y' " ;

        PreparedStatement statement = null;
        ResultSet  resultSet = null;

        try {

            boolean boolOut = false;

            statement = connection.prepareStatement(sql);

            statement.setString(1, inv_num);

            resultSet = statement.executeQuery();

            boolOut = resultSet.next();

            return boolOut;
        }
        catch (SQLException e) {
                System.out.println(    e.getMessage());
                throw new PersistenceException(e.getMessage());
        }
            finally {
            try {if (resultSet != null) resultSet.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }

    }

    public boolean isDepreciations(String inv_num) throws PersistenceException
    {
        String sql =
            " /* выбираем суммарный износ по бухучету на указанный месяц */" +
            " SELECT a.num_un " +
            "  FROM os_t.izn_nachisl a , os_t.ostable oo " +
            " where a.num_un = oo.num_un " +
            "   and oo.kod_inv = ? " +
            "  group by  a.num_un " ;

        PreparedStatement statement = null;
        ResultSet  resultSet = null;

        try {


            statement = connection.prepareStatement(sql);

            statement.setString(1, inv_num);

            resultSet = statement.executeQuery();

            return resultSet.next();

        }
        catch (SQLException e) {
                System.out.println(    e.getMessage());
                throw new PersistenceException(e.getMessage());
        }
            finally {
            try {if (resultSet != null) resultSet.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }

    }
    public BigDecimal getDepreciation(String inv_num , Date dd) throws PersistenceException
    {

        Date firstDay = Tools.getFirstDayOfMonth(dd);

        // 11.06.2013 SUPP-4369 Исправлена хитрая ошибка с неправильной сортировкой результатов юниона
        String sql =
            " select num_un, sum_izn_b " +
            "   from " +
            " ( " +
            " /* выбираем суммарный износ по бухучету на указанный месяц */ " +
            " SELECT 1 rn, a.num_un, sum(a.sum_izn_b) sum_izn_b " +
            " FROM os_t.izn_nachisl a , os_t.ostable oo " +
            " where a.num_un = oo.num_un " +
            " and oo.kod_inv = ? " +
            " and a.dt_nachisl = ? " +
            " and a.spr_prizn_id <> 7 " + // 19.04.13 SUPP-2817 Временно в связи с переоценкой ОС (+ 06.06.13 SUPP-2888 То же самое)
            " group by  a.num_un " +
            "  " +
            " union " +
            "  " +
            " /*-- выбираем суммарный износ по бухучету на текущий месяц, */" +
            " /*--если месяц выборки больше бухгалтерского месяца */" +
            " SELECT 2 rn, a.num_un, sum(a.sum_izn_b) sum_izn_b " +
            " FROM os_t.izn_nachisl a , os_t.ostable oo " +
            " where a.num_un = oo.num_un " +
            " and oo.kod_inv = ? " +
            // SUPP-4821 " and a.dt_nachisl = (select dt_current from os_t.osdate) " +
            /*SUPP-4821*/" and a.dt_nachisl = (select max(dt_nachisl) from os_t.izn_nachisl  where a.num_un = num_un  /* SUPP-78841 -- хитрое условие сюда */ ) " +
            " and a.spr_prizn_id <> 7 " + // 19.04.13 SUPP-2817 Временно в связи с переоценкой ОС (+ 06.06.13 SUPP-2888 То же самое)
            " group by  a.num_un " +
            " ) " +
            " order by rn, num_un desc ";


        /*
        String sql =
            " SELECT a.num_un, sum(a.sum_izn_b) sum_izn_b " +
            "  FROM os_t.izn_nachisl a , os_t.ostable oo " +
            " where a.num_un = oo.num_un " +
            "   and oo.kod_inv = ? " +
            "   and a.dt_nachisl = ? " +
            "   and a.spr_prizn_id <> 7 " + // 19.04.13 SUPP-2817 Временно в связи с переоценкой ОС (+ 06.06.13 SUPP-2888 То же самое)
            "  group by  a.num_un " +
            "  " +
            " union " +
            "  " +
            " SELECT a.num_un, sum(a.sum_izn_b) sum_izn_b " +
            "   FROM os_t.izn_nachisl a , os_t.ostable oo " +
            "  where a.num_un = oo.num_un " +
            "    and oo.kod_inv = ? " +
            "    and a.dt_nachisl = (select dt_current from os_t.osdate) " +
            "    and (select dt_current from os_t.osdate) < ? " +
            "    and a.spr_prizn_id <> 7 " + // 19.04.13 SUPP-2817 Временно в связи с переоценкой ОС (+ 06.06.13 SUPP-2888 То же самое)
            "  group by  a.num_un " ;
        */

// опачки ... перестало работать .. Андрюха кидал почтой ...

//        String sql =  //"    /* селект амортизации из данных за последний квартал*/ " +
//     " Select cast(sum_izn_b as numeric(15,2)) as qq From( " +
//                  " SELECT max(a.num_un) as num_un, a.sum_izn_b " +
//                  "  FROM os_t.izn_nachisl a , os_t.ostable oo " +
//                  " Where a.num_un = oo.num_un " +
//                  "   And oo.kod_inv = ? " +
//                  "   And a.dt_nachisl = ? " +
//                  "   Group by  a.sum_izn_b ) " +
//        " UNION " +
//
//        " Select sum_izn_b From ( " +
//                  " SELECT max(rb.num_un) as num_un, rb.sum_izn_b " +
//                  "  FROM os_t.izn_nachisl_rb rb , os_t.ostable oo " +
//                  " Where rb.num_un = oo.num_un " +
//                  "   And oo.kod_inv = ? " +
//                  "    And rb.dt_nachisl = ? " +
//                  "   Group by  rb.sum_izn_b ) " +
//        " UNION " +
//              //  " /* селект амортизации (если нет амортизации за тек квартал и за предыдущие ) если выбирается амортизац за дату большую чем в бух учете  */ " +
//        " Select sum_izn_b From ( " +
//                  " SELECT max(inc.num_un) as num_un, inc.sum_izn_b " +
//                  "  FROM os_t.izn_nachisl inc , os_t.ostable oo " +
//                  " Where inc.num_un = oo.num_un " +
//                  "   And oo.kod_inv = ? " +
//                  "   And inc.dt_nachisl = Trunc((Select dt_current from os_t.osdate),'mm') " +
//                  "   and Trunc((Select dt_current from os_t.osdate),'mm') < ? " +
//                  "   Group by  inc.sum_izn_b ) " ;

        // sql = "select 1 from dual " ;



        PreparedStatement statement = null;
        ResultSet  resultSet = null;

        BigDecimal out = new BigDecimal(0);

        try {


            statement = connection.prepareStatement(sql);

            statement.setString(1, inv_num);
            statement.setDate(2, new java.sql.Date(firstDay.getTime()));
            statement.setString(3, inv_num);
            //statement.setDate(4,  new java.sql.Date(firstDay.getTime()));


            resultSet = statement.executeQuery();

            if (resultSet.next()){
            out = resultSet.getBigDecimal(2);
            }
            else{
                if ( ! isDepreciations(inv_num) ){
                    throw new EnergyproSystemException("Авто с инв № "+ inv_num +" не найдено ... или нет данных про износ");
                }
                out = new BigDecimal(0);
            }

            // 30.12.10 Амортизация может быть отрицательной - в этом случае в акте нужно выводить 0
            if (out.doubleValue() < 0)
                out = new BigDecimal(0);

            return out;
        }
        catch (SQLException e) {
                System.out.println(    e.getMessage());
                throw new PersistenceException(e.getMessage());
        }
            finally {
            try {if (resultSet != null) resultSet.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }
    }


	public BigDecimal getWorkTimeTwoPreviousMonth(Date d)
			throws PersistenceException {

		Date firstDay = Tools.getFirstDayOfMonth(d);
		BigDecimal out = new BigDecimal(0);


        boolean usesMDAXData = false;
        mDaxLogic mdLogic = new mDaxLogic(connection, userProfile);
    	AuthLogic netAuth = new AuthLogic(connection, userProfile);
    	usesMDAXData = netAuth.checkUsesMDAXData();

    	// System.out.println("############  usesMDAXData = " + usesMDAXData);

    	if (usesMDAXData) {
    		return mdLogic.getWorkTimeTwoPreviousMonth(firstDay);
    	}


        /* запрос выбора суммы рабочих часов за два предыдущих месяца. */
        /** nv.grafik_id = 1 -- график рабочего времени (типа общий) */
        String sql = " select sum(a_hours) from ( "
                        + " select a_hours from trud.norma_vrem nv where nv.grafik_id = 1 and nv.date_rasch = ADD_MONTHS( ? , -1) "
                        + " UNION ALL"
                        + " select a_hours from trud.norma_vrem nv where nv.grafik_id = 1 and nv.date_rasch = ADD_MONTHS( ? , -2) "
                        + " ) " ;

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {

			statement = connection.prepareStatement(sql);

			statement.setDate(1, new java.sql.Date(firstDay.getTime()));
			statement.setDate(2, new java.sql.Date(firstDay.getTime()));

			resultSet = statement.executeQuery();

			if (resultSet.next())
				out = resultSet.getBigDecimal(1);
			return out;


		} catch (SQLException e) {
			throw new EnergyproSystemException("Error on run sql:" + sql, e);
		} finally {

			try {
				if (resultSet != null)
					resultSet.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}

		}
	}


	/* процедура расчета начислений по работнику за два предыдущих месяца (шифр 500 из ЗП) */
	public BigDecimal getMiddlePayTwoPreviousMonth(Date d, String tabnum)
			throws PersistenceException, Exception {

		Date firstDay = Tools.getFirstDayOfMonth(d);

        boolean usesMDAXData = false;
        mDaxLogic mdLogic = new mDaxLogic(connection, userProfile);
    	AuthLogic netAuth = new AuthLogic(connection, userProfile);
    	usesMDAXData = netAuth.checkUsesMDAXData();

    	System.out.println("############  getMiddlePayTwoPreviousMonth...  date = " + d + " :: tabnum = " + tabnum);


		if (usesMDAXData) {
			return mdLogic.getMiddlePayTwoPreviousMonth(firstDay, tabnum);
		}

		/* запрос выбора суммы рабочих часов за два предыдущих месяца. */
		String sql = " select sum(summa) from ( "
                    + " select al.summa from zarpherson.arhiv_list al, zarpherson.kadry_day_view kdv "
                    + " where al.idkadry = kdv.idkadry "
                    + "   and kdv.tabn = to_number(?) "
                    + "   and al.shifr = '500' "
                    + "   and al.date_rasch = ADD_MONTHS( ? , -1) "
                    + " UNION ALL "
                    + " select al.summa from zarpherson.arhiv_list al, zarpherson.kadry_day_view kdv "
                    + " where al.idkadry = kdv.idkadry "
                    + " and kdv.tabn = to_number(?) "
                    + " and al.shifr = '500' "
                    + " and al.date_rasch = ADD_MONTHS( ? , -2) "
                    + " ) ";


		BigDecimal out = new BigDecimal(Integer.MIN_VALUE);

		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {
			statement = connection.prepareStatement(sql);

			statement.setString(1, tabnum);
			statement.setDate(2, new java.sql.Date(firstDay.getTime()));
			statement.setString(3, tabnum);
			statement.setDate(4, new java.sql.Date(firstDay.getTime()));

			resultSet = statement.executeQuery();

			if (resultSet.next())
				out = resultSet.getBigDecimal(1);
			else
				System.out.println("resultSet clear getMiddlePayTwoPreviousMonth");

			return out;
		} catch (SQLException e) {
			throw new EnergyproSystemException("error on run SQL : " + sql, e);
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}
	}


/*
    public BigDecimal getWorkTimeInMonth(Date inDate) throws PersistenceException
    {
        Date firstDay = getFirstDayInMonth(inDate);
        String sql = " select a_hours from trud.norma_vrem nv where nv.date_rasch = ? ";

        PreparedStatement statement = null;
        ResultSet  resultSet = null;

        BigDecimal out = new BigDecimal(0);
        try {


            statement = connection.prepareStatement(sql);

            statement.setDate(1, new java.sql.Date(firstDay.getTime()));

            resultSet = statement.executeQuery();

            if (resultSet.next())
            out = resultSet.getBigDecimal(1);

            return out;
        } catch (Exception e) {
            System.out.println(    e.getMessage());
            return out;
        } finally {

            try {if (resultSet != null) resultSet.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}

        }


    }
*/

        public BigDecimal getWorkTimeInMonth(Date inDate) throws PersistenceException
        {
            return getWorkTime(inDate)[0];
        }

    public void validateOS(String invNumber) throws PersistenceException
    {
        OSTableDAO osDAO = new OSTableDAO(connection, userProfile);
        OSTableFilter osFilter = new OSTableFilter();
        if ( invNumber == null ) return;

        osFilter.kod_inv = invNumber.trim();
        osFilter.conditionSQL = " OSTABLE.SHOW_ = 'Y'";
        OSTableShortList osList = osDAO.getScrollableFilteredList(osFilter, 0, -1);
        if (osList.totalCount != 1){
            throw new EnergyproSystemException("Основний засіб з инвентарним номером " + invNumber + " вже ліквідовано ...");
        }
    }

    public FINMaterials getInDate(FINMaterials fin, int finDocCode, Date dateIn) throws PersistenceException
    {
        return getInDate(fin, finDocCode, dateIn, false);
    }

    public FINMaterials getInDate(FINMaterials fin, int finDocCode, Date dateIn, boolean useWearDate) throws PersistenceException
    {
        FINMaterials out = new FINMaterials();

        FINMaterialsFilter finMaterialFilter = new FINMaterialsFilter();
        FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(connection, userProfile);

        finMaterialFilter.bal_sch = fin.bal_sch;
        finMaterialFilter.budget_core_id = fin.budget_core_id;

        // на этом тормоза ...
        //finMaterialFilter.div_code = fin.div_code;

        //finMaterialFilter.div_name = fin.div_name;
        //finMaterialFilter.doc_date = fin.doc_date;
        //finMaterialFilter.doc_num = fin.doc_num;

        //finMaterialFilter.frc_code = fin.frc_code;
        //finMaterialFilter.frc_name = fin.frc_name;

        finMaterialFilter.mat_id = fin.mat_id;

        //finMaterialFilter.mat_name = fin.mat_name;

        //finMaterialFilter.mu_id = fin.mu_id;

        //finMaterialFilter.mu_name = fin.mu_name;
        //finMaterialFilter.nn = fin.nn;
        //finMaterialFilter.partner = fin.partner;
        //finMaterialFilter.partner_name = fin.partner_name;

        finMaterialFilter.party_id = fin.party_id;

        //finMaterialFilter.party_discription = fin.party_discription;

        finMaterialFilter.rest_purpose_id = fin.rest_purpose_id;

        //finMaterialFilter.rest_purpose_name = fin.rest_purpose_name;
        //finMaterialFilter.rest_purpose_type_id = fin.rest_purpose_type_id;

        //if (useWearDate)
    	if (fin.wear_date != null)
    	{
    		finMaterialFilter.wear_date = fin.wear_date;
    	}

        //finMaterialFilter.code = Integer.MIN_VALUE;

        FINMaterialsList list = finMaterialsLogic.getMaterialsList(finMaterialFilter, "", fin.div_code , "", dateIn, finDocCode , ENConsts.SOURCE_SELECTION_RESTS_FK );
        if ( list.totalCount > 1){
            throw new EnergyproSystemException("Unable to validate count FINMaterials");
        }

        if ( list.totalCount == 0 ){
            out.price = out.calc_price = out.quantity = out.cost = new BigDecimal(0);
            return out;
        }

        //if ( (list.get(0).quantity.doubleValue() - fin.quantity.doubleValue()) < 0 )
        out = list.get(0) ;

        return out;

    }

    public FINMaterials getIn3000(FINMaterials fin, int finDocCode) throws PersistenceException
    {
        /*
        Date date3k = new Date(1100,0,1);

        return getInDate(fin, finDocCode, date3k);
        */

        return getIn3000(fin, finDocCode, false);
    }

    public FINMaterials getIn3000(FINMaterials fin, int finDocCode, boolean useWearDate) throws PersistenceException {
        return getInDate(fin, finDocCode, makeDate3000(), useWearDate);
    }

    public BigDecimal checkCountInDate(FINMaterials fin, int finDocCode, Date dateIn) throws PersistenceException
    {

        BigDecimal out = new BigDecimal(0);

        FINMaterialsFilter finMaterialFilter = new FINMaterialsFilter();
        FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(connection, userProfile);

        finMaterialFilter.bal_sch = fin.bal_sch;
        finMaterialFilter.budget_core_id = fin.budget_core_id;
        finMaterialFilter.div_code = fin.div_code;
        finMaterialFilter.div_name = fin.div_name;
        finMaterialFilter.doc_date = fin.doc_date;
        finMaterialFilter.doc_num = fin.doc_num;
        finMaterialFilter.frc_code = fin.frc_code;
        finMaterialFilter.frc_name = fin.frc_name;
        finMaterialFilter.mat_id = fin.mat_id;
        finMaterialFilter.mat_name = fin.mat_name;
        finMaterialFilter.mu_id = fin.mu_id;
        finMaterialFilter.mu_name = fin.mu_name;
        finMaterialFilter.nn = fin.nn;
        finMaterialFilter.partner = fin.partner;
        finMaterialFilter.partner_name = fin.partner_name;
        finMaterialFilter.party_id = fin.party_id;
        finMaterialFilter.party_discription = fin.party_discription;
        finMaterialFilter.rest_purpose_id = fin.rest_purpose_id;
        finMaterialFilter.rest_purpose_name = fin.rest_purpose_name;
        finMaterialFilter.rest_purpose_type_id = fin.rest_purpose_type_id;



        //finMaterialFilter.code = Integer.MIN_VALUE;

        FINMaterialsList list = finMaterialsLogic.getMaterialsList(finMaterialFilter, "", finMaterialFilter.div_code , "", dateIn, finDocCode );
        if ( list.totalCount > 1){
            throw new EnergyproSystemException("Unable to validate count FINMaterials");
        }

        if ( list.totalCount == 0 ) return out;

        //if ( (list.get(0).quantity.doubleValue() - fin.quantity.doubleValue()) < 0 )
        out = list.get(0).quantity ;

        return out;


    }

    private Date makeDate3000() {
    	Calendar c = Calendar.getInstance();
    	c.set(Calendar.YEAR, 3000);
    	c.set(Calendar.MONTH, Calendar.JANUARY);
    	c.set(Calendar.DATE, 1);
    	return Tools.clearTimeOfDate(c.getTime());
    }

    public BigDecimal checkCountIn3000(FINMaterials fin, int finDocCode) throws PersistenceException {
        return checkCountInDate(fin, finDocCode, makeDate3000());
    }

    /**
    *
    * Процедура отмены проведения акта без документа вывода материалов из резерва
    * В отличии от <b>removeDOCFromAct2</b> создает наряд, что был удален при
    * проведении и не удаляет документа по выводу материалов из резерва
    *
    * @param act Акт, проведение которого отменяется
    * @throws PersistenceException
    * @throws DatasourceConnectException
    */
    public void removeDOCFromActWithoutVivod(ENAct act) throws PersistenceException, DatasourceConnectException
    {

        try
        {
        FINMaterialsDAO mDAO = new FINMaterialsDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINDoc2MolDataDAO f2mDAO = new FINDoc2MolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINMolDataDAO molDAO = new FINMolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

        AuthLogic netAuth = new AuthLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        mDaxLogic mdLogic = new mDaxLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        AXTransactionsLogic axLogic = new AXTransactionsLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);
        int writeOffTmcConf = netAuth.checkUsesDataForWriteOff();


        int j;

        // mdaxwriteOff собираем перечень журналов Актов из Аксапты
        Vector<FINDoc2MolData> FINDoc2MolDataWithAxJournalID = new Vector<FINDoc2MolData>();

        FINDoc2MolDataFilter f2mFilter = new FINDoc2MolDataFilter();
        f2mFilter.finDocTypeRef.code = FINDocType.MOVE_300;
        f2mFilter.conditionSQL = "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = "+ act.code+")";
        FINDoc2MolDataShortList f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        JournalAction jAction = new JournalAction();
        for (j=0; j<f2mList.totalCount; j++){
        	this.checkDocForRedRestAndFormDetailedException(f2mList.get(j).finDocCode, false, 1);
            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
            f2mDAO.remove(f2mList.get(j).code);

            if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
            	if (f2mList.get(j).axJournalId != null && !f2mList.get(j).axJournalId.equals("") ) {
            		FINDoc2MolData fd2mdObj = new FINDoc2MolData();
            		fd2mdObj.axJournalId = f2mList.get(j).axJournalId;
            		fd2mdObj.molCode = f2mList.get(j).molDataFinMolCode;
            		fd2mdObj.isPostingJournal = jAction.checkPostingJournal(
					            				fd2mdObj.axJournalId,
												axLogic.getUserSecurity().domainUserName,
												axLogic.getUserSecurity().userPass);
            		fd2mdObj.molTypeCode =  f2mList.get(j).molDataTypeRefCode; // вроди как тип МОЛа !!!!!!!??????

            		FINDoc2MolDataWithAxJournalID.add(fd2mdObj);
            	}

            }

        }

        // 380-ый для списания по инвентаризации
        f2mFilter.finDocTypeRef.code = FINDocType.MOVE_380;
        f2mFilter.conditionSQL = "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = "+ act.code+")";
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (j=0; j<f2mList.totalCount; j++){
        	this.checkDocForRedRestAndFormDetailedException(f2mList.get(j).finDocCode, false, 1);
            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
            f2mDAO.remove(f2mList.get(j).code);

            if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
            	if (f2mList.get(j).axJournalId != null && !f2mList.get(j).axJournalId.equals("") ) {
            		FINDoc2MolData fd2mdObj = new FINDoc2MolData();
            		fd2mdObj.axJournalId = f2mList.get(j).axJournalId;
            		fd2mdObj.molCode = f2mList.get(j).molDataFinMolCode;
            		fd2mdObj.isPostingJournal = jAction.checkPostingJournal(
            				fd2mdObj.axJournalId,
							axLogic.getUserSecurity().domainUserName,
							axLogic.getUserSecurity().userPass);
            		fd2mdObj.molTypeCode =  f2mList.get(j).molDataTypeRefCode; // вроди как тип МОЛа !!!!!!!??????

            		FINDoc2MolDataWithAxJournalID.add(fd2mdObj);
            	}

            }
        }
        
        // 66, 267, 87, 181, 61, 74, 90, 122, 77, 266
        f2mFilter.finDocTypeRef.code = Integer.MIN_VALUE;
        f2mFilter.conditionSQL = "findoc2moldata.findoctyperefcode IN (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) AND "
        		+ "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = ?)";
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1
        		, new Vector<>(Arrays.asList(FINDocType.MOVE_66, FINDocType.MOVE_267, FINDocType.MOVE_87
        				, FINDocType.MOVE_181, FINDocType.MOVE_61, FINDocType.MOVE_74
        				, FINDocType.MOVE_90,FINDocType.MOVE_122, FINDocType.MOVE_77, FINDocType.MOVE_266, act.code)));
        for (j=0; j<f2mList.totalCount; j++){
        	this.checkDocForRedRestAndFormDetailedException(f2mList.get(j).finDocCode, false, 1);
            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
            f2mDAO.remove(f2mList.get(j).code);

            if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
            	if (f2mList.get(j).axJournalId != null && !f2mList.get(j).axJournalId.equals("") ) {
            		FINDoc2MolData fd2mdObj = new FINDoc2MolData();
            		fd2mdObj.axJournalId = f2mList.get(j).axJournalId;
            		fd2mdObj.molCode = f2mList.get(j).molDataFinMolCode;
            		fd2mdObj.isPostingJournal = jAction.checkPostingJournal(
            				fd2mdObj.axJournalId,
							axLogic.getUserSecurity().domainUserName,
							axLogic.getUserSecurity().userPass);
            		fd2mdObj.molTypeCode =  f2mList.get(j).molDataTypeRefCode; // вроди как тип МОЛа !!!!!!!??????

            		FINDoc2MolDataWithAxJournalID.add(fd2mdObj);
            	}

            }
        }

        /*01.12.2011 - выносим неналог (виды операции 298, 299)*/
        f2mFilter.finDocTypeRef.code = FINDocType.MOVE_298;
        f2mFilter.conditionSQL = "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = "+ act.code+")";
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (j=0; j<f2mList.totalCount; j++){
        	this.checkDocForRedRestAndFormDetailedException(f2mList.get(j).finDocCode, false, 1);
            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);

            f2mDAO.remove(f2mList.get(j).code);

            if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
            	if (f2mList.get(j).axJournalId != null && !f2mList.get(j).axJournalId.equals("") ) {
            		FINDoc2MolData fd2mdObj = new FINDoc2MolData();
            		fd2mdObj.axJournalId = f2mList.get(j).axJournalId;
            		fd2mdObj.molCode = f2mList.get(j).molDataFinMolCode;
            		fd2mdObj.isPostingJournal = jAction.checkPostingJournal(
            				fd2mdObj.axJournalId,
							axLogic.getUserSecurity().domainUserName,
							axLogic.getUserSecurity().userPass);
            		fd2mdObj.molTypeCode =  f2mList.get(j).molDataTypeRefCode; // вроди как тип МОЛа !!!!!!!??????

            		FINDoc2MolDataWithAxJournalID.add(fd2mdObj);
            	}

            }
        }

        // выносоим документы по списанию спец средств 330  и 331
        f2mFilter.finDocTypeRef.code = FINDocType.MOVE_330;
        f2mFilter.conditionSQL = "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = "+ act.code+")";
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (j=0; j<f2mList.totalCount; j++){
        	this.checkDocForRedRestAndFormDetailedException(f2mList.get(j).finDocCode, false, 1);
            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);

            f2mDAO.remove(f2mList.get(j).code);

            if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
            	if (f2mList.get(j).axJournalId != null && !f2mList.get(j).axJournalId.equals("") ) {
            		FINDoc2MolData fd2mdObj = new FINDoc2MolData();
            		fd2mdObj.axJournalId = f2mList.get(j).axJournalId;
            		fd2mdObj.molCode = f2mList.get(j).molDataFinMolCode;
            		fd2mdObj.isPostingJournal = jAction.checkPostingJournal(
            				fd2mdObj.axJournalId,
							axLogic.getUserSecurity().domainUserName,
							axLogic.getUserSecurity().userPass);
            		fd2mdObj.molTypeCode =  f2mList.get(j).molDataTypeRefCode; // вроди как тип МОЛа !!!!!!!??????

            		FINDoc2MolDataWithAxJournalID.add(fd2mdObj);
            	}

            }
        }


        f2mFilter.finDocTypeRef.code = FINDocType.MOVE_331;
        f2mFilter.conditionSQL = "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = "+ act.code+")";
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (j=0; j<f2mList.totalCount; j++){
        	this.checkDocForRedRestAndFormDetailedException(f2mList.get(j).finDocCode, false, 1);
            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);

            f2mDAO.remove(f2mList.get(j).code);

            if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
            	if (f2mList.get(j).axJournalId != null && !f2mList.get(j).axJournalId.equals("") ) {
            		FINDoc2MolData fd2mdObj = new FINDoc2MolData();
            		fd2mdObj.axJournalId = f2mList.get(j).axJournalId;
            		fd2mdObj.molCode = f2mList.get(j).molDataFinMolCode;
            		fd2mdObj.isPostingJournal = jAction.checkPostingJournal(
            				fd2mdObj.axJournalId,
							axLogic.getUserSecurity().domainUserName,
							axLogic.getUserSecurity().userPass);
            		fd2mdObj.molTypeCode =  f2mList.get(j).molDataTypeRefCode; // вроди как тип МОЛа !!!!!!!??????

            		FINDoc2MolDataWithAxJournalID.add(fd2mdObj);
            	}

            }
        }



        // вынесем 400 и 40 вые опериции + МАКЕТ ...
        f2mFilter.finDocTypeRef.code = FINDocType.MAKET_ADD_COST;
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (j=0; j<f2mList.totalCount; j++){
        	this.checkDocForRedRestAndFormDetailedException(f2mList.get(j).finDocCode, false, 1);
            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
            f2mDAO.remove(f2mList.get(j).code);

            if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
            	if (f2mList.get(j).axJournalId != null && !f2mList.get(j).axJournalId.equals("") ) {
            		FINDoc2MolData fd2mdObj = new FINDoc2MolData();
            		fd2mdObj.axJournalId = f2mList.get(j).axJournalId;
            		fd2mdObj.molCode = f2mList.get(j).molDataFinMolCode;
            		fd2mdObj.isPostingJournal = jAction.checkPostingJournal(
            				fd2mdObj.axJournalId,
							axLogic.getUserSecurity().domainUserName,
							axLogic.getUserSecurity().userPass);
            		fd2mdObj.molTypeCode =  f2mList.get(j).molDataTypeRefCode; // вроди как тип МОЛа !!!!!!!??????

            		FINDoc2MolDataWithAxJournalID.add(fd2mdObj);
            	}

            }
        }

        f2mFilter.finDocTypeRef.code = FINDocType.MOVE_40;
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (j=0; j<f2mList.totalCount; j++){
        	this.checkDocForRedRestAndFormDetailedException(f2mList.get(j).finDocCode, false, 1);
            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
            f2mDAO.remove(f2mList.get(j).code);

            if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
            	if (f2mList.get(j).axJournalId != null && !f2mList.get(j).axJournalId.equals("") ) {
            		FINDoc2MolData fd2mdObj = new FINDoc2MolData();
            		fd2mdObj.axJournalId = f2mList.get(j).axJournalId;
            		fd2mdObj.molCode = f2mList.get(j).molDataFinMolCode;
            		fd2mdObj.isPostingJournal = jAction.checkPostingJournal(
            				fd2mdObj.axJournalId,
							axLogic.getUserSecurity().domainUserName,
							axLogic.getUserSecurity().userPass);
            		fd2mdObj.molTypeCode =  f2mList.get(j).molDataTypeRefCode; // вроди как тип МОЛа !!!!!!!??????

            		fd2mdObj.finDocTypeRef.code = FINDocType.MOVE_40; //!!!!  признак что не нужно материалы с журнала резирвировать при отмене проведения акта ?
            		                                                 // буду по нему определять материалы копировать назад или нет

            		FINDoc2MolDataWithAxJournalID.add(fd2mdObj);
            	}

            }
        }

        f2mFilter.finDocTypeRef.code = FINDocType.MOVE_400;
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (j=0; j<f2mList.totalCount; j++){
        	this.checkDocForRedRestAndFormDetailedException(f2mList.get(j).finDocCode, false, 1);
            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
            f2mDAO.remove(f2mList.get(j).code);

            if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
            	if (f2mList.get(j).axJournalId != null && !f2mList.get(j).axJournalId.equals("") ) {
            		FINDoc2MolData fd2mdObj = new FINDoc2MolData();
            		fd2mdObj.axJournalId = f2mList.get(j).axJournalId;
            		fd2mdObj.molCode = f2mList.get(j).molDataFinMolCode;
            		fd2mdObj.isPostingJournal = jAction.checkPostingJournal(
            				fd2mdObj.axJournalId,
							axLogic.getUserSecurity().domainUserName,
							axLogic.getUserSecurity().userPass);
            		fd2mdObj.molTypeCode =  f2mList.get(j).molDataTypeRefCode; // вроди как тип МОЛа !!!!!!!??????

            		FINDoc2MolDataWithAxJournalID.add(fd2mdObj);
            	}

            }
        }

        /*************************************************** БУФЕТ ************************************************************/
        if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        {
            if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
            {
                f2mFilter.finDocTypeRef.code = FINDocType.MOVE_290;
            }
            else
            if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION)
            {
                f2mFilter.finDocTypeRef.code = FINDocType.MOVE_291;
            }
            else
                throw new EnergyproSystemException("UNKNOWN ACT TYPE!!!"); // Это так, на всякий случай (до этого типа никогда не дойдет) ;)

            f2mFilter.conditionSQL = "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = "+ act.code+")";
            f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
            for (j=0; j<f2mList.totalCount; j++){
            	this.checkDocForRedRestAndFormDetailedException(f2mList.get(j).finDocCode, false, FKConsts.CHECK_RED_REST_IS_DELETE);
                fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
                f2mDAO.remove(f2mList.get(j).code);

                if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
                	if (f2mList.get(j).axJournalId != null && !f2mList.get(j).axJournalId.equals("") ) {
                		FINDoc2MolData fd2mdObj = new FINDoc2MolData();
                		fd2mdObj.axJournalId = f2mList.get(j).axJournalId;
                		fd2mdObj.molCode = f2mList.get(j).molDataFinMolCode;
                		fd2mdObj.isPostingJournal = jAction.checkPostingJournal(
	            				fd2mdObj.axJournalId,
								axLogic.getUserSecurity().domainUserName,
								axLogic.getUserSecurity().userPass);
                		fd2mdObj.molTypeCode =  f2mList.get(j).molDataTypeRefCode; // вроди как тип МОЛа !!!!!!!??????

                		FINDoc2MolDataWithAxJournalID.add(fd2mdObj);
                	}

                }

            }
        }
        /**********************************************************************************************************************/


        validateDocDate(act.dateGen); // проверим даты ..

        // вынесем хитрую развязку актов-нарядов-доковФК


        FINDoc2Act2WorkOrderDAO a2wDAO = new FINDoc2Act2WorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINDoc2Act2WorkOrderFilter a2wFilter = new FINDoc2Act2WorkOrderFilter();
        a2wFilter.actRef.code = act.code;
        int[] a2wArr = a2wDAO.getFilteredCodeArray(a2wFilter,0,-1);
        for (int a2=0; a2 < a2wArr.length; a2++){
            a2wDAO.remove(a2wArr[a2]);
        }

        ENWorkOrderDAO woDAO = new ENWorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        ENWorkOrderFilter woFilter = new ENWorkOrderFilter();
        woFilter.statusWorkOrder.code = ENWorkOrderStatus.GOOD;
        woFilter.conditionSQL = " enworkorder.code in ("+
        " select enworkorder2enplanwork.workordercode from enworkorder2enplanwork where enworkorder2enplanwork.plancode in ("+
        "select enact2enplanwork.plancode from enact2enplanwork where actrefcode = "+ act.code +
        "))";




        ENWorkOrderShortList woList = woDAO.getScrollableFilteredList(woFilter, 0,-1);

        PlanWorkLogic planWorkLogic = new PlanWorkLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);


        /*<<<<<< аксаптовые журналы акты проверим на разноску и если что сторно делаем тут */
        // mdaxwriteoff найти журнал аксаптовый акт по молу и проверить разнесен ли он
			if (writeOffTmcConf == 1 || writeOffTmcConf == 2) {
				for (int u = 0; u < FINDoc2MolDataWithAxJournalID.size(); u++) {
					/** проверка разноски журнала АКТ */
					boolean isPostingAxJournal = false;
					isPostingAxJournal = FINDoc2MolDataWithAxJournalID.get(u).isPostingJournal;

					if (isPostingAxJournal) {
						if (axLogic.aifttsCheckOpen()) {
							/*** копируем в отрицательный журнал если журнал акта разнесен	 */
							String stornoJournalId = jAction
									.copyJournal(
											FINDoc2MolDataWithAxJournalID
													.get(u).axJournalId,
											NoYes.YES,
											NoYes.YES,
											axLogic.getUserSecurity().domainUserName,
											axLogic.getUserSecurity().userPass);

							if (stornoJournalId == null
									|| stornoJournalId.equals("")) {
								throw new SystemException("\n\n"
												+ "Помилка при копіюванні складського журналу № = "
												+ FINDoc2MolDataWithAxJournalID
														.get(u).axJournalId);
							}

							/** физ/фин разноска */
							jAction.checkPostMovement(stornoJournalId,
									axLogic.getUserSecurity().domainUserName,
									axLogic.getUserSecurity().userPass);



						} else {
							throw new EnergyproSystemException(
									"\n Не найдена активная транзакция для пользователя "
											+ axLogic.getUserSecurity().userName
											+ " !!! ");
						}
					}
				}
			}
        /*>>>>>>*/


        for (int n = 0; n < woList.totalCount; n++)
        {


            FINMolDataFilter moFilter = new FINMolDataFilter();
            moFilter.workOrder.code = woList.get(n).code;
            FINMolDataShortList moList = molDAO.getScrollableFilteredList(moFilter, 0, -1);
            for(int nn = 0; nn < moList.totalCount; nn++)
            {
                FINMolData molObj = molDAO.getObject(moList.get(nn).code);
                ENWorkOrder orderObj = woDAO.getObject(woList.get(n).code);

                ENPlanWork plan = planWorkLogic.getPlanByWorkOrderCode(orderObj.code);

                int operationType = -1;
                int operationType28 = -1;

                // Определение вида операции
                if (plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP
                		|| plan.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
                		|| plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS)
                {
                    operationType = FINDocType.MOVE_332;    // если списание МБП или МНМА
                    operationType28 = FINDocType.MOVE_28_332;
                }
                else
                if (plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
                {
                    operationType = FINDocType.MOVE_292;
                    operationType28 = FINDocType.MOVE_28_292;
                }
                else
                {
                    operationType = FINDocType.MOVE_302;
                    operationType28 = FINDocType.MOVE_28_302;
                }


                    if(operationType == -1)
                        throw new EnergyproSystemException("Неопределенный вид операции для ввода резерва");

                    if(operationType28 == -1)
                        throw new EnergyproSystemException("Неопределенный вид операции для ввода резерва");

                // Для старых актов вынесем развязку с findoc2moldata
                // т.к. она вставиться в процедуре createDOCFromENWorkOrder2
                FINDoc2MolDataFilter d2mFilter = new FINDoc2MolDataFilter();
                d2mFilter.molData.code = molObj.code;
                d2mFilter.finDocTypeRef.code = operationType;

                FINDoc2MolDataShortList d2mList = f2mDAO.getScrollableFilteredList(d2mFilter, 0, -1);
                for(int nnn = 0; nnn < d2mList.totalCount; nnn++)
                {
                    f2mDAO.remove(d2mList.get(nnn).code);
                }

                // 28 в/о
                d2mFilter = new FINDoc2MolDataFilter();
                d2mFilter.molData.code = molObj.code;
                d2mFilter.finDocTypeRef.code = operationType28;

                d2mList = f2mDAO.getScrollableFilteredList(d2mFilter, 0, -1);

                for(int nnn = 0; nnn < d2mList.totalCount; nnn++)
                {
                    f2mDAO.remove(d2mList.get(nnn).code);
                }

					boolean isPostingAxJournal = false;
					String AxJournalIdAct = "";
					// mdaxwriteoff найти соответствующий журнал аксаптовый акт по МОЛу и по типу МОЛа
					// и проверить разнесен ли он
					for (int u = 0; u < FINDoc2MolDataWithAxJournalID.size(); u++) {
						if (moList.get(nn).finMolCode.equals(FINDoc2MolDataWithAxJournalID.get(u).molCode)
								&& moList.get(nn).molTypeRefCode ==  FINDoc2MolDataWithAxJournalID.get(u).molTypeCode
								&& FINDoc2MolDataWithAxJournalID.get(u).finDocTypeRef.code != FINDocType.MOVE_40 // c этих журналов материалы не переносить назад
								) {
							AxJournalIdAct = FINDoc2MolDataWithAxJournalID
									.get(u).axJournalId;
							/** проверка разноски журнала АКТ */
							isPostingAxJournal = FINDoc2MolDataWithAxJournalID.get(u).isPostingJournal;

						}
					}

                // вновь создание документа на резервирование createDOCFromENWorkOrder2
                this.createDOCFromENWorkOrder2(orderObj, molObj, true);

                // вставка материалов в документ на резервирование
                d2mFilter = new FINDoc2MolDataFilter();
                d2mFilter.molData.code = molObj.code;
                d2mFilter.finDocTypeRef.code = operationType;
                d2mList = f2mDAO.getScrollableFilteredList(d2mFilter, 0, -1);
                for(int nnn = 0; nnn < d2mList.totalCount; nnn++)
                {



                    FINMaterialsFilter mFilter = new FINMaterialsFilter();
                    mFilter.molDataRef.code = molObj.code;
                    mFilter.statusRef.code = FINMaterialsStatus.GOOD;
                    String condition = "select e.code from enestimateitem e where e.kindrefcode = "+ ENEstimateItemKind.GSM+
                                    " or e.kindrefcode = "+ENEstimateItemKind.MATERIALS +
                                    " or e.kindrefcode = "+ENEstimateItemKind.CUSTOMER_MATERIALS + " ";
                    mFilter.conditionSQL = " finmaterials.estimateitemrefcode in ("+condition+")";
                    FINMaterialsShortList mList = mDAO.getScrollableFilteredList(mFilter, 0, -1);




                    boolean isErr = true;
                    try
                    {
                        fkLogic2.setCreator("E");
                        fkLogic2.OpenDocument(d2mList.get(0).finDocCode);
                        for(int nnnn = 0; nnnn < mList.totalCount; nnnn++)
                        {
                            FINMaterials m = mDAO.getObject(mList.get(nnnn).code);

                            // mdaxwriteoff
                            // если журнал акта не был разнесен то скопировать строку в журнал на резерв
                            // если журнал акта был разнесен то скреатить строку в журнале на резерв ( обновить цену сумму в финматериалсе) , и акт нужно перевести в статус "Черновой"
                            if (isPostingAxJournal == false
                            		&& !AxJournalIdAct.equals("")
                            		&& !d2mList.get(0).axJournalId.equals("")  ) {
                            	 if (axLogic.aifttsCheckOpen()) {
	       							 mdLogic.updateJournalTrans(AxJournalIdAct , d2mList.get(0).axJournalId, m.axInventTransferLinesCode);
	       						 } else
	       						 {
	       							 throw new EnergyproSystemException("\n Не найдена активная транзакция для пользователя " + axLogic.getUserSecurity().userName + " !!! ");
	       						 }
                            } else
                            	// если журнал разнесен то нужно создавать строки в журнале резерва по новой  с апдейтом цены в финматериалсе
                            	if (isPostingAxJournal == true && !AxJournalIdAct.equals("") && !d2mList.get(0).axJournalId.equals("")  ) {
                            		String[] createdStringBack = {"","",""};

                            		createdStringBack = mdLogic.addLinesForWriteOffTMC(m , d2mList.get(0).axJournalId , woList.get(n).dateGen );

                					// код строки журнала из AX
                					m.axInventTransferLinesCode = createdStringBack[0];
                					m.price = new BigDecimal(createdStringBack[1]);
                					m.cost = new BigDecimal(createdStringBack[2]);
                					// save finmaterials
                					mDAO.save(m);
                            	}
                            
                            int tstringCode = fkLogic2.addString(m, m.rest_purpose_id, RQConsts.REST_PURPOSE_ID_RESERVE);

                            if(tstringCode != m.finDocItemCode)
                            {
                                long old_modify_time = m.modify_time;
                                m.finDocItemCode = tstringCode;
                                mDAO.save(m);
                                mDAO.updateModify_time(m.code, old_modify_time);
                            }

                            // Проверка красных остатков
                            int red_rest = fkLogic2.check_red_rest(d2mList.get(0).finDocCode, tstringCode, FKConsts.CHECK_RED_REST_IS_UPDATE);
                            if (red_rest != 0 )
                                throw new EnergyproSystemException("Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!! Номенклатура " + m.nn + " № наряд-завдання " + woList.get(n).workOrderNumber);


                        }

                        // Сумма строк открытого документа
                        BigDecimal docSum = fkLogic2.getDocStrings();

                        String Via_who = userProfile.userName.toUpperCase() + " (" + new SimpleDateFormat("dd.MM.yyyy").format(woList.get(n).dateGen).toString() +")" ;

                        int opTypeForReserv = getFINOperationCodeByTypeCode( d2mList.get(0).finDocTypeRefCode, d2mList.get(0).molDataTypeRefCode );

                        fkLogic2.setCreatorTHead(d2mList.get(0).finDocCode, "E", false);
                        fkLogic2.UpdateDocumentShort(woList.get(n).workOrderNumber,
                                                opTypeForReserv,
                                                molObj.finMolCode,
                                                molObj.finMolCode,
                                                woList.get(n).dateGen,
                                                docSum,
                                                Via_who);
                        fkLogic2.SaveDocument(d2mList.get(0).finDocCode);
                        isErr = false; // если было достигнуто это место, значит ошибки не было
                    }
                    catch(Exception e)
                    {
                      throw new EnergyproSystemException("Обратное создание документа на резервирование: "+e.getMessage());
                    }
                    finally
                    {
                        fkLogic2.CancelDocumentHackFK(isErr);
                        fkLogic2.setCreator("2");
                        fkLogic2.setCreatorTHead(d2mList.get(0).finDocCode, "2");
                    }
                }
            }


        }

     // нужно удалить журналы если они не разнесены в аксапте на списание c проверкой что бы в журналах не было строк
		for (int u = 0; u < FINDoc2MolDataWithAxJournalID.size(); u++) {

			if (!FINDoc2MolDataWithAxJournalID.get(u).isPostingJournal) {
				int countInventJournalTrans = mdLogic.getInventJournalTransCount(FINDoc2MolDataWithAxJournalID.get(u).axJournalId);
				if (countInventJournalTrans == Integer.MIN_VALUE) {
					throw new EnergyproSystemException("Помилка при визначенні строк у журналі "+ FINDoc2MolDataWithAxJournalID.get(u).axJournalId);
				}

				// удаляем документы если в них нет строк
				// или это неразнесенный документ по доработке
				if (countInventJournalTrans == 0
						|| FINDoc2MolDataWithAxJournalID.get(u).finDocTypeRef.code == FINDocType.MOVE_40
						) {
					// удаление журнала !!!
					if (axLogic.aifttsCheckOpen()) {
							JournalAction journalAction = new JournalAction();
							journalAction
									.journalTableDelete(
											FINDoc2MolDataWithAxJournalID
													.get(u).axJournalId,
											axLogic.getUserSecurity().domainUserName,
											axLogic.getUserSecurity().userPass);
					} else {
						throw new EnergyproSystemException(
								"\n Ошибка при удалении журнала акта. Нет открытой транзакции !!!(AX)");
					}
              }
			}
		}

        }
        finally{
            try
            {
                if (energyNetConnection != null && ! energyNetConnection.isClosed()){
                    energyNetConnection.close();
                    energyNetConnection = null;
                }
            } catch (SQLException e) {}
        }


    }


    public void removeDOCFromActWithoutVivodZKU(ENAct act) throws PersistenceException, DatasourceConnectException
    {

        try
        {
        FINMaterialsDAO mDAO = new FINMaterialsDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINDoc2MolDataDAO f2mDAO = new FINDoc2MolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINMolDataDAO molDAO = new FINMolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);



        int j;

        FINDoc2MolDataFilter f2mFilter = new FINDoc2MolDataFilter();
        f2mFilter.finDocTypeRef.code = FINDocType.MOVE_300;
        f2mFilter.conditionSQL = "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = "+ act.code+")";
        FINDoc2MolDataShortList f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);
        for (j=0; j<f2mList.totalCount; j++){
            //opType = getFINOperationCodeByTypeCode( f2mList.get(j).finDocTypeRefCode, f2mList.get(j).molDataTypeRefCode );
            //int rr = fkLogic2.check_red_rest(f2mList.get(j).finDocCode, 1);
            //if (rr != 0 ){
            //     throw new EnergyproSystemException("Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!!");
            // }

            //-------

            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
            f2mDAO.remove(f2mList.get(j).code);

                }

        /*01.12.2011 - выносим неналог (виды операции 298, 299)*/
        f2mFilter.finDocTypeRef.code = FINDocType.MOVE_298;
        f2mFilter.conditionSQL = "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = "+ act.code+")";
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (j=0; j<f2mList.totalCount; j++){
            //opType = getFINOperationCodeByTypeCode( f2mList.get(j).finDocTypeRefCode, f2mList.get(j).molDataTypeRefCode );
            //removeDoc(f2mList.get(j).finDocCode, opType);
            //int rr = fkLogic2.check_red_rest(f2mList.get(j).finDocCode, 1);
            //if (rr != 0 ){
            //     throw new EnergyproSystemException("Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!!");
            // }


              fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
              f2mDAO.remove(f2mList.get(j).code);

        }

        // выносоим документы по списанию спец средств 330  и 331
        f2mFilter.finDocTypeRef.code = FINDocType.MOVE_330;
        f2mFilter.conditionSQL = "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = "+ act.code+")";
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (j=0; j<f2mList.totalCount; j++){
            //opType = getFINOperationCodeByTypeCode( f2mList.get(j).finDocTypeRefCode, f2mList.get(j).molDataTypeRefCode );
            //removeDoc(f2mList.get(j).finDocCode, opType);
            //int rr = fkLogic2.check_red_rest(f2mList.get(j).finDocCode, 1);
            //if (rr != 0 ){
            //     throw new EnergyproSystemException("Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!!");
            // }

            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
            f2mDAO.remove(f2mList.get(j).code);
        }
        
        // 66, 267, 87, 181, 61, 74, 90, 122, 77, 266
        f2mFilter.finDocTypeRef.code = Integer.MIN_VALUE;
        f2mFilter.conditionSQL = "findoc2moldata.findoctyperefcode IN (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) AND "
        		+ "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = ?)";
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1
        		, new Vector<>(Arrays.asList(FINDocType.MOVE_66, FINDocType.MOVE_267, FINDocType.MOVE_87
        				, FINDocType.MOVE_181, FINDocType.MOVE_61, FINDocType.MOVE_74
        				, FINDocType.MOVE_90,FINDocType.MOVE_122, FINDocType.MOVE_77, FINDocType.MOVE_266, act.code)));
        for (j=0; j<f2mList.totalCount; j++){
        	this.checkDocForRedRestAndFormDetailedException(f2mList.get(j).finDocCode, false, 1);
            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
            f2mDAO.remove(f2mList.get(j).code);
        }

        f2mFilter.finDocTypeRef.code = FINDocType.MOVE_331;
        f2mFilter.conditionSQL = "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = "+ act.code+")";
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (j=0; j<f2mList.totalCount; j++){
            //opType = getFINOperationCodeByTypeCode( f2mList.get(j).finDocTypeRefCode, f2mList.get(j).molDataTypeRefCode );
            //removeDoc(f2mList.get(j).finDocCode, opType);
            //int rr = fkLogic2.check_red_rest(f2mList.get(j).finDocCode, 1);
            //if (rr != 0 ){
            //     throw new EnergyproSystemException("Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!!");
            //}

            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
            f2mDAO.remove(f2mList.get(j).code);
          }



        // вынесем 400 и 40 вые опериции + МАКЕТ ...
        f2mFilter.finDocTypeRef.code = FINDocType.MAKET_ADD_COST;
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (j=0; j<f2mList.totalCount; j++){
            //opType = getFINOperationCodeByTypeCode( f2mList.get(j).finDocTypeRefCode, f2mList.get(j).molDataTypeRefCode );
            //removeDoc(f2mList.get(j).finDocCode, opType);
            int rr = fkLogic2.check_red_rest(f2mList.get(j).finDocCode, 1);
            if (rr != 0 ){
                throw new EnergyproSystemException("Ошибка в резервировании материала(уд Макет доб.стоимости). Операция приведет к образованию КРАСНОГО остатка!!!");
            }

            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
            f2mDAO.remove(f2mList.get(j).code);
        }

        f2mFilter.finDocTypeRef.code = FINDocType.MOVE_40;
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (j=0; j<f2mList.totalCount; j++){
            //opType = getFINOperationCodeByTypeCode( f2mList.get(j).finDocTypeRefCode, f2mList.get(j).molDataTypeRefCode );
            //removeDoc(f2mList.get(j).finDocCode, opType);
            int rr = fkLogic2.check_red_rest(f2mList.get(j).finDocCode, 1);
            if (rr != 0 ){
                throw new EnergyproSystemException("Ошибка в резервировании материала(уд 40 во). Операция приведет к образованию КРАСНОГО остатка!!!");
            }

            fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
            f2mDAO.remove(f2mList.get(j).code);
        }

        f2mFilter.finDocTypeRef.code = FINDocType.MOVE_400;
        f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
        for (j=0; j<f2mList.totalCount; j++){
            //opType = getFINOperationCodeByTypeCode( f2mList.get(j).finDocTypeRefCode, f2mList.get(j).molDataTypeRefCode );
            //removeDoc(f2mList.get(j).finDocCode, opType);
            //int rr = fkLogic2.check_red_rest(f2mList.get(j).finDocCode, 1);
            //if (rr != 0 ){
            //     throw new EnergyproSystemException("Ошибка в резервировании материала(уд 400 во). Операция приведет к образованию КРАСНОГО остатка!!!");
            // }

        	fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
            f2mDAO.remove(f2mList.get(j).code);
        }

        /*************************************************** БУФЕТ ************************************************************/
        if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        {
            if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
            {
                f2mFilter.finDocTypeRef.code = FINDocType.MOVE_290;
            }
            else
            if (act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION)
            {
                f2mFilter.finDocTypeRef.code = FINDocType.MOVE_291;
            }
            else
                throw new EnergyproSystemException("UNKNOWN ACT TYPE!!!"); // Это так, на всякий случай (до этого типа никогда не дойдет) ;)

            f2mFilter.conditionSQL = "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.actcode = "+ act.code+")";
            f2mList = f2mDAO.getScrollableFilteredList(f2mFilter, 0, -1);
            for (j=0; j<f2mList.totalCount; j++){
                //opType = getFINOperationCodeByTypeCode( f2mList.get(j).finDocTypeRefCode, f2mList.get(j).molDataTypeRefCode );
                //removeDoc(f2mList.get(j).finDocCode, opType);
                //int rr = fkLogic2.check_red_rest(f2mList.get(j).finDocCode, 1);
                //if (rr != 0 ){
                //     throw new EnergyproSystemException("Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!!");
                // }

                fkLogic2.Drop_Document(f2mList.get(j).finDocCode);
                f2mDAO.remove(f2mList.get(j).code);

            }
        }
        /**********************************************************************************************************************/


        validateDocDate(act.dateGen); // проверим даты ..

        // вынесем хитрую развязку актов-нарядов-доковФК


        FINDoc2Act2WorkOrderDAO a2wDAO = new FINDoc2Act2WorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINDoc2Act2WorkOrderFilter a2wFilter = new FINDoc2Act2WorkOrderFilter();
        a2wFilter.actRef.code = act.code;
        int[] a2wArr = a2wDAO.getFilteredCodeArray(a2wFilter,0,-1);
        for (int a2=0; a2 < a2wArr.length; a2++){
            a2wDAO.remove(a2wArr[a2]);
        }

        ENWorkOrderDAO woDAO = new ENWorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        ENWorkOrderFilter woFilter = new ENWorkOrderFilter();
        woFilter.statusWorkOrder.code = ENWorkOrderStatus.GOOD;
        woFilter.conditionSQL = " enworkorder.code in ("+
        " select enworkorder2enplanwork.workordercode from enworkorder2enplanwork where enworkorder2enplanwork.plancode in ("+
        "select enact2enplanwork.plancode from enact2enplanwork where actrefcode = "+ act.code +
        "))";




        ENWorkOrderShortList woList = woDAO.getScrollableFilteredList(woFilter, 0,-1);

        PlanWorkLogic planWorkLogic = new PlanWorkLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

        for (int n = 0; n < woList.totalCount; n++)
        {


            FINMolDataFilter moFilter = new FINMolDataFilter();
            moFilter.workOrder.code = woList.get(n).code;
            FINMolDataShortList moList = molDAO.getScrollableFilteredList(moFilter, 0, -1);
            for(int nn = 0; nn < moList.totalCount; nn++)
            {
                FINMolData molObj = molDAO.getObject(moList.get(nn).code);
                ENWorkOrder orderObj = woDAO.getObject(woList.get(n).code);

                ENPlanWork plan = planWorkLogic.getPlanByWorkOrderCode(orderObj.code);

                int operationType = -1;
                int operationType28 = -1;

                // Определение вида операции
                if (plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP
                		|| plan.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
                		|| plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/)
                {
                    operationType = FINDocType.MOVE_332;    // если списание МБП или МНМА
                    operationType28 = FINDocType.MOVE_28_332;
                }
                else
                if (plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
                {
                    operationType = FINDocType.MOVE_292;
                    operationType28 = FINDocType.MOVE_28_292;
                }
                else
                {
                    operationType = FINDocType.MOVE_302;
                    operationType28 = FINDocType.MOVE_28_302;
                }


                    if(operationType == -1)
                        throw new EnergyproSystemException("Неопределенный вид операции для ввода резерва");

                    if(operationType28 == -1)
                        throw new EnergyproSystemException("Неопределенный вид операции для ввода резерва");

                // Для старых актов вынесем развязку с findoc2moldata
                // т.к. она вставиться в процедуре createDOCFromENWorkOrder2
                FINDoc2MolDataFilter d2mFilter = new FINDoc2MolDataFilter();
                d2mFilter.molData.code = molObj.code;
                d2mFilter.finDocTypeRef.code = operationType;

                FINDoc2MolDataShortList d2mList = f2mDAO.getScrollableFilteredList(d2mFilter, 0, -1);
                for(int nnn = 0; nnn < d2mList.totalCount; nnn++)
                {
         	       f2mDAO.remove(d2mList.get(nnn).code);
                }

                // 28 в/о
                d2mFilter = new FINDoc2MolDataFilter();
                d2mFilter.molData.code = molObj.code;
                d2mFilter.finDocTypeRef.code = operationType28;

                d2mList = f2mDAO.getScrollableFilteredList(d2mFilter, 0, -1);

                for(int nnn = 0; nnn < d2mList.totalCount; nnn++)
                {
                	    f2mDAO.remove(d2mList.get(nnn).code);
                }

                // вновь создание документа на резервирование
                this.createDOCFromENWorkOrder2(orderObj, molObj, true);

                // вставка материалов в документ на резервирование
                d2mFilter = new FINDoc2MolDataFilter();
                d2mFilter.molData.code = molObj.code;
                d2mFilter.finDocTypeRef.code = operationType;
                d2mList = f2mDAO.getScrollableFilteredList(d2mFilter, 0, -1);

                for(int nnn = 0; nnn < d2mList.totalCount; nnn++)
                {
                    FINMaterialsFilter mFilter = new FINMaterialsFilter();
                    mFilter.molDataRef.code = molObj.code;
                    mFilter.statusRef.code = FINMaterialsStatus.GOOD;
                    String condition = "select e.code from enestimateitem e where e.kindrefcode = "+ ENEstimateItemKind.GSM+
                                    " or e.kindrefcode = "+ENEstimateItemKind.MATERIALS +
                                    " or e.kindrefcode = "+ENEstimateItemKind.CUSTOMER_MATERIALS + " ";
                    mFilter.conditionSQL = " finmaterials.estimateitemrefcode in ("+condition+")";

                    FINMaterialsShortList mList = mDAO.getScrollableFilteredList(mFilter, 0, -1);

                    boolean isErr = true;
                    try
                    {
                        fkLogic2.setCreator("E");

                        fkLogic2.OpenDocument(d2mList.get(0).finDocCode);


                        for(int nnnn = 0; nnnn < mList.totalCount; nnnn++)
                        {
                            FINMaterials m = mDAO.getObject(mList.get(nnnn).code);
                            int tstringCode = fkLogic2.addString(m, m.rest_purpose_id, RQConsts.REST_PURPOSE_ID_RESERVE);

                            if(tstringCode != m.finDocItemCode)
                            {
                                long old_modify_time = m.modify_time;
                                m.finDocItemCode = tstringCode;
                                mDAO.save(m);
                                mDAO.updateModify_time(m.code, old_modify_time);
                            }

                            // Проверка красных остатков
                            int red_rest = fkLogic2.check_red_rest(d2mList.get(0).finDocCode, tstringCode, 0);

                            if (red_rest != 0 )
                                throw new EnergyproSystemException("Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!! Номенклатура " + m.nn + " № наряд-завдання " + woList.get(n).workOrderNumber);


                        }

                        // Сумма строк открытого документа
                        BigDecimal docSum = fkLogic2.getDocStrings();

                        String Via_who = userProfile.userName.toUpperCase() + " (" + new SimpleDateFormat("dd.MM.yyyy").format(woList.get(n).dateGen).toString() +")" ;

                        int opTypeForReserv = getFINOperationCodeByTypeCode( d2mList.get(0).finDocTypeRefCode, d2mList.get(0).molDataTypeRefCode );

                        fkLogic2.setCreatorTHead(d2mList.get(0).finDocCode, "E", false);

                        fkLogic2.UpdateDocumentShort(woList.get(n).workOrderNumber,
                                                opTypeForReserv,
                                                molObj.finMolCode,
                                                molObj.finMolCode,
                                                woList.get(n).dateGen,
                                                docSum,
                                                Via_who);
                        fkLogic2.SaveDocument(d2mList.get(0).finDocCode);

                        isErr = false; // если было достигнуто это место, значит ошибки не было
                    }
                    catch(Exception e)
                    {
                        throw new EnergyproSystemException("Обратное создание документа на резервирование: "+e.getMessage());
                    }
                    finally
                    {
                    	fkLogic2.CancelDocumentHackFK(isErr);
                        fkLogic2.setCreator("2");
                        fkLogic2.setCreatorTHead(d2mList.get(0).finDocCode, "2");
                    }



                }
            }
        }

        }
        finally{
            try
            {
                if (energyNetConnection != null && ! energyNetConnection.isClosed()){
                    energyNetConnection.close();
                    energyNetConnection = null;
                }
            } catch (SQLException e) {}
        }


    }

    /**
    *
    * Процедура для создания документов в фин. коллекции по акту в отличии от
    * <b>createDOCFromAct2</b> не создает документ по выводу из резерва, а
    * удаляет документ по вводу из резерва
    *
    * @param act
    *            Акт, по кот. создаются документы
    * @throws PersistenceException
    * @throws DatasourceConnectException
     * @throws ReportMakerException
     * @throws SQLException
    */
    public void createDOCFromActWithoutVivod(ENAct act) throws PersistenceException, DatasourceConnectException, ReportMakerException, SQLException
    {

        System.out.println("START createDOCFromActWithoutVivod, actCode = " + act.code);

        try {
            ActLogic actLogic = new ActLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            FINMolDataDAO molDAO = new FINMolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);
            ENWorkOrderDAO woDAO = new ENWorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            FINMaterialsDAO mDAO = new FINMaterialsDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            FINDoc2MolDataDAO d2mDAO = new FINDoc2MolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            PlanWorkLogic planWorkLogic = new PlanWorkLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            PartyDAO partyDAO = new PartyDAO(connection, userProfile);
            OrderLogic ol = new OrderLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            AXTransactionsLogic axLogic = new AXTransactionsLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            AuthLogic netAuth = new AuthLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            mDaxLogic mdLogic = new mDaxLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            ElementLogic eLogic = new ElementLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            FKOSLogic fkOsLogic = new FKOSLogic(connection, userProfile);
            ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            ENTechConditionsServicesDAO techCondServicesDao = new ENTechConditionsServicesDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            ENSettingsLogic settingsLogic = new ENSettingsLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile); 
            TKClassificationTypeDAO classificationTypeDao = new TKClassificationTypeDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            ENAct2ProvDAO provDao = new ENAct2ProvDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            FuelInventarizationLogic fuelInventarizationLogic = new FuelInventarizationLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            SCUsageInputItemOZDAO ozDao = new SCUsageInputItemOZDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            SCUsageInputItemDAO usageInputItemDao = new SCUsageInputItemDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            ServicesLogic servicesLogic = new ServicesLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);


            
            int writeOffTmcConf = netAuth.checkUsesDataForWriteOff();

            int stringCode;
            int opType;
            
            /** обрезать номер акта до 10 символов */
            if (act.numberGen != null && !act.numberGen.equals("")) {
            	if (act.numberGen.length() > 10) {
            		act.numberGen = act.numberGen.substring(0,10);
            	}
            }
            
            ENServicesObject servicesObject = servicesObjectDao.getObjectByENAct(act);
            TKClassificationTypeShortList classificationTypesInAct =  classificationTypeDao.getListByActCode(act.code);
        	ENAct2ProvShortList provList = provDao.getListByAct(act, false);
        	SCUsageInputItemOZ oz = ozDao.getObjectByAct(act);
            
            boolean isUsingMaterials = false;
            boolean isTechnicalMaintenance = (act != null && act.actTypeRef != null && act.actTypeRef.code == ENPlanWorkState.TO)
            		&& actLogic.checkInSCCounterByActCode(act.code, false, null, false) == 0;
            boolean isZKU = actLogic.checkZKUMountingByAct(act);
            boolean isCounters = (act != null && act.actTypeRef != null && act.actTypeRef.code == ENPlanWorkState.TO)
            		&& actLogic.checkInSCCounterByActCode(act.code, false, null, false) > 0;
            boolean isConnection = (servicesObject != null 
            		&& servicesObject.contractTypeRef.code == ENServicesContractType.CONNECTION)
            		|| techCondServicesDao.getObjectsByENAct(act).size() > 0;
            boolean isReconstructionOrModernization = (act != null && act.actTypeRef != null 
            		&& act.actTypeRef.code == ENPlanWorkState.RECONSTRUCTION_MODERNIZATION);
            boolean isRepairing = (act != null && act.actTypeRef != null 
            		&& (act.actTypeRef.code == ENPlanWorkState.CURRENT_REPAIR || act.actTypeRef.code == ENPlanWorkState.CAPITAL_REPAIR));
            
            
            // Договір на відшкодування з постачальниками е/е (может быть null если акт не связан)
            boolean servicesObjectForSupplier = servicesLogic.isActForServicesObjectSupplierContract(act.code);
            
            String invNumber = eLogic.getElementInvNumber(act.element.code);
            if(invNumber.length() == 5)
                invNumber = "0" + invNumber;


            /*проверка на то, что основное - это основное */
            boolean isAsset = invNumber.length() == 6 && getInvNumberIsExist(invNumber);

            boolean isMNMA = true;
            boolean isByt = false;

            if (Tools.checkValueInArray(act.element.typeRef.code, 
            		new int[] {ENElementType.TY_BYT, ENElementType.TY_PROM, ENElementType.ROUTE_BYT})) {
            	isByt = true;
            }

            if (Tools.checkValueInArray(act.element.typeRef.code, 
            		new int[] {ENElementType.TY_BYT, ENElementType.TY_PROM, ENElementType.ROUTE_BYT,
            				   ENElementType.SERVICES_OBJECT, ENElementType.SERVICES_FROM_SIDE_OBJECT,
            				   ENElementType.METROLOGY_COUNTER, ENElementType.METROLOGY_DEVICE, 
            				   ENElementType.METROLOGY_OBJECT})) {
            	isAsset = isMNMA = false;
            } else {
            	checkIfOSIsLiquidated(invNumber);
            }

            boolean isTaxableAsset = isAsset && getIsNalog(invNumber);
            
            isMNMA = isMNMA && !isAsset && invNumber.length() > 6;
            
            String molOwnerObject = null;
    		ENAct2Humen balansMNMA = null;
            
            if(isAsset) {
            	molOwnerObject = fkOsLogic.getMolCode(invNumber);
            }
            if(isMNMA && isTechnicalMaintenance) {
            	 balansMNMA = actLogic.getBalansWithMainCeh(act, connection);
            	 molOwnerObject = act.molCodeObject;
            }

            // выборка кодов заданий-фактов
            String plansInAct = actLogic.getPlanCodesByAct(act.code);

            String Via_who = "";
            String errText = "";

            validateDocDate(act.dateGen); // проверим даты ..

            //String[] axJournalIdArray = null; // документы AX по резерву

            // Выборка нарядов по кодам фактов
            ENWorkOrderFilter woFilter = new ENWorkOrderFilter();
            woFilter.statusWorkOrder.code = ENWorkOrderStatus.GOOD;
            woFilter.conditionSQL = " enworkorder.code in ("+
            " select enworkorder2enplanwork.workordercode from enworkorder2enplanwork where enworkorder2enplanwork.plancode in ("+
            plansInAct +"))";

            Vector<FINDoc2MolData> FINDoc2MolDataWithAxJournalID = new Vector<FINDoc2MolData>();

            // Проверка наличия материалов в нарядах - если нет, то
            // осуществляется
            // выход из процедуры без создания документа на списание
            ENWorkOrderShortList woList = woDAO.getScrollableFilteredList(woFilter, 0,-1);
            for (int n = 0; n < woList.totalCount; n++) {
                ENPlanWork planWork = planWorkLogic.getPlanByWorkOrderCode(woList.get(n).code);

                int operationType = -1;
                int operationType28 = -1;

                    // Определение вида операции
                    if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
                    		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
                    		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/) {
                        operationType = FINDocType.MOVE_332;    // если списание МБП или МНМА
                        operationType28 = FINDocType.MOVE_28_332;
                    }
                    else
                    if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION 
                    || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL) {
                        operationType = FINDocType.MOVE_292;
                        operationType28 = FINDocType.MOVE_28_292;
                    } else {
                        operationType = FINDocType.MOVE_302;
                        operationType28 = FINDocType.MOVE_28_302;
                    }

                    if(operationType == -1)
                        throw new EnergyproSystemException("Не визначений вид операції");

                FINMolDataFilter molFilter = new FINMolDataFilter();
                molFilter.workOrder.code = woList.get(n).code;
                FINMolDataShortList molList = molDAO.getScrollableFilteredList(molFilter, 0, -1);



                for (int nn = 0; nn < molList.totalCount; nn++) {
                    FINMaterialsFilter finMatFilter = new FINMaterialsFilter();
                    finMatFilter.molDataRef.code = molList.get(nn).code;
                    finMatFilter.statusRef.code = FINMaterialsStatus.GOOD;
                    String condition = "select e.code from enestimateitem e where e.kindrefcode = "+ ENEstimateItemKind.GSM+
                                        " or e.kindrefcode = "+ENEstimateItemKind.MATERIALS +
                                        " or e.kindrefcode = " + ENEstimateItemKind.CUSTOMER_MATERIALS;
                    finMatFilter.conditionSQL = " finmaterials.estimateitemrefcode in ("+condition+")";
                    int[] finMatArr = mDAO.getFilteredCodeArray(finMatFilter,0,-1);
                    if (finMatArr.length != 0)
                            isUsingMaterials = true;

                }

                // Удаление ввода в резерв
                for(int nn = 0; nn < molList.totalCount; nn++) {
                    FINDoc2MolDataFilter d2mFilter = new FINDoc2MolDataFilter();
                    d2mFilter.molData.code = molList.get(nn).code;
                    d2mFilter.finDocTypeRef.code = operationType;

                    FINDoc2MolDataShortList d2mList = d2mDAO.getScrollableFilteredList(d2mFilter, 0, -1);



                    for(int nnn = 0; nnn < d2mList.totalCount; nnn++) {
                        // Поменяем дату открытости периода в ФК
                        Date fk_date = getCurrentPeriodInFK();

                        if ((act.actTypeRef.code == ENPlanWorkState.WORK_IN_OUT) && fk_date.after(woList.get(n).dateGen)){
                          fkLogic2.updateDateTHead(d2mList.get(nnn).finDocCode, fk_date);
                        }


                        fkLogic2.setCreator("E");
                        fkLogic2.setCreatorTHead(d2mList.get(nnn).finDocCode,"E");
                        try {
                        	fkLogic2.Drop_Document(d2mList.get(nnn).finDocCode, false);
                        } catch(Exception e){
                        	throw new EnergyproSystemException(e);
                        } finally{
                        	fkLogic2.setCreator("2");
                        }

                        d2mDAO.remove(d2mList.get(nnn).code);

                        // &&&&&&&&&&&&&&mdax список документов резерва с аксапты
                        if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
                        	if (d2mList.get(nnn).axJournalId != null && !d2mList.get(nnn).axJournalId.equals("") ) {
                        		FINDoc2MolData fd2mdObj = new FINDoc2MolData();
                        		fd2mdObj.axJournalId = d2mList.get(nnn).axJournalId;
                        		fd2mdObj.molCode = molList.get(nn).finMolCode;
                        		fd2mdObj.isRemoveJournal = false;
                        		fd2mdObj.molTypeCode = molList.get(nn).molTypeRefCode;

                        		FINDoc2MolDataWithAxJournalID.add(fd2mdObj);
                        	}

                        }
                    }


                    // Таких документов замечено не было, но все равно на всякий случай необходимо поставить
                    // отчистку таблицы FINDoc2FKOrder
                    d2mFilter = new FINDoc2MolDataFilter();
                    d2mFilter.molData.code = molList.get(nn).code;
                    d2mFilter.finDocTypeRef.code = operationType28;

                    d2mList = d2mDAO.getScrollableFilteredList(d2mFilter, 0, -1);

                    for(int nnn = 0; nnn < d2mList.totalCount; nnn++) {
                        d2mDAO.remove(d2mList.get(nnn).code);
                    }
                }
            }

           /* axJournalIdArray = new String[axJournalIdVector.size()];
            for(int axV = 0;axV < axJournalIdVector.size();axV++)
            	axJournalIdArray[axV] = ((String)axJournalIdVector.get(axV));*/

            if(!isUsingMaterials)
                return;

        // списание !!! 300 в/о или 330 или 331

        System.out.println("START doc_300 or 330 or 331 ");

        FINDoc2Act2WorkOrderDAO a2wDAO = new FINDoc2Act2WorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        int a2wCode = Integer.MIN_VALUE;
        int[] a2wCodes = new int[0];

        boolean actMaterials = false;
        stringCode = Integer.MIN_VALUE;
        Via_who = "инв.№ ";
        int prevEcode = Integer.MIN_VALUE;
        ENPlanWorkFilter pf = new ENPlanWorkFilter();
        // AS 28.01.2011
        //pf.conditionSQL = "enplanwork.code in (select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = "+ act.code+")";
        pf.conditionSQL = "enplanwork.code in (" + plansInAct + ")";

        //pf.orderBySQL = "ENELEMENTDATA.INVNUMBER";
        pf.orderBySQL = " 27 ";  /**  номер колонки INVNUMBER...  */

        ENPlanWorkDAO pDAO = new ENPlanWorkDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        //ENPlanWorkShortList pl = pDAO.getScrollableFilteredList(pf, 0, -1);
        //ENPlanWorkShortList pl = pDAO.getScrollableFilteredListWithOutDomain(pf, 0, -1);
        ENPlanWorkShortList pl = pDAO.getScrollableFilteredListNOSEGR(pf, 0, -1);

        if (pl.totalCount == 0){
            throw new EnergyproSystemException("Plan not found for ENAct.code=" + act.code);
        }else
        {
            //prevEcode = pl.get(0).elementRefCode;
        }

        boolean isFirstTimeForMetrology = true; // NET-4306 "Заглушка" для метрологии

        for (int i = 0; i < pl.totalCount; i++)
        {
        if (prevEcode != pl.get(i).elementRefCode && isFirstTimeForMetrology){
                //else
                prevEcode = pl.get(i).elementRefCode; // для МЕТРОЛОГИИ - один акт на абстр. эл. - и куча планов на разные Элементы

                System.out.println("START FOR planList, planCode = " + pl.get(i).code);

                /////// 10.08.10

                int eType = eLogic.getElementTypeByCode(prevEcode);
                //if (eType == ENElementType.METROLOGY_COUNTER)
                ///////

                if(eType == ENElementType.METROLOGY_COUNTER)
                {
                	// NET-4306 Для того, чтобы эта часть кода выполнилась один раз
                	// для метрологических счетчиков
                	isFirstTimeForMetrology = false;
                }

                if (eType == ENElementType.TY_BYT){
                    // для БЫТа инв номер в акте ...
                    Via_who = "л/с " + act.invNumber;
                }
                else
                {
                	if(eType != ENElementType.METROLOGY_COUNTER)
                		Via_who = "инв.№ " + pl.get(i).invNumber;
                	else
                	{
                		// NET-4306 Для метрологических счетчиков будет кучу инвентарных
                		Via_who = "";
                	}
                }
                FINMolDataFilter molFilter = new FINMolDataFilter();
                molFilter.act.code = act.code;
                FINMolDataShortList molList = molDAO.getScrollableFilteredList(molFilter,0,-1);
                String estimateKindCode = "" + Integer.MIN_VALUE;
                for (int n = 0; n < molList.totalCount; n++){
                    actMaterials = false;
                    FINMolDataFilter molFilter_ = new FINMolDataFilter();
                    molFilter_.finMolCode = molList.get(n).finMolCode;
                    molFilter_.workOrder.code = pl.get(i).workOrderCode;

                    System.out.println("START FOR molDataList, finMolCode = " + molList.get(n).finMolCode);

                    //AS 28.01.2011 FINMolDataShortList molList_ = molDAO.getScrollableFilteredList(molFilter_,0,-1);
                    int[] molListArr_ = molDAO.getFilteredCodeArray(molFilter_,0,-1);

                    //if (molList_.totalCount > 0)
                    if (molListArr_.length > 0 || eType != ENElementType.METROLOGY_COUNTER) // <- забиваем на molList_ здесь (10.08.10)
                    {
                        int molDOC_300 = Integer.MIN_VALUE;
                        String journalIdmDAX_300 = "";
                        //int molDOC_330 = Integer.MIN_VALUE;
                        //int molDOC_331 = Integer.MIN_VALUE;
                        if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_REALIZATION 
                        		|| pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL) {
                        	opType = getFINOperationCodeByTypeCode((act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION ? FINDocType.MOVE_118 : FINDocType.MOVE_117)
                        			, molList.get(n).molTypeRefCode);
                        } else if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION)
                        {
                            opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_291, molList.get(n).molTypeRefCode);
                        } else if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MBP || pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS) {
                            opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_61, molList.get(n).molTypeRefCode);
                        } else if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MNMA) {
                            opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_74, molList.get(n).molTypeRefCode);
                        } else if(isZKU) {
                        	opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_266, molList.get(n).molTypeRefCode);
                        } else if(isTechnicalMaintenance) {
                        	opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_66, molList.get(n).molTypeRefCode);
                        } else if(isReconstructionOrModernization) {
                        	opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_267, molList.get(n).molTypeRefCode);
                        } else if(isRepairing) {
                        	opType = getFINOperationCodeByTypeCode((eType != ENElementType.METROLOGY_COUNTER) 
                        				? (eType != ENElementType.METROLOGY_DEVICE) ? FINDocType.MOVE_87 : FINDocType.MOVE_66 
                        						: FINDocType.MOVE_181, molList.get(n).molTypeRefCode);
                        } else if(isCounters) {
                        	if(oz == null) {
                        		throw new SystemException(String.format("Не вдалося визначити ОЗ для акту з кодом %d", act.code));
                        	}
                        	boolean isAbonCounter = (oz.account == null || oz.account.trim().length() == 0);
                        	opType = getFINOperationCodeByTypeCode((isAbonCounter ? FINDocType.MOVE_66 : FINDocType.MOVE_266) , molList.get(n).molTypeRefCode);
                        } else if(pl.get(i).stateRefCode == ENPlanWorkState.WORK_IN_OUT && eType == ENElementType.SERVICES_OBJECT) {
                        	String correspondingAccount = null;
                        	/*15.06.2021 SUPP-100547 согласовали устно с ЦБ Материальный сектор если в акте услуг 
                        	 * есть калькуляции начинающиеся с 01 или 0201 с заданным шаблоном проводок
                        	 * , то кор. счет = 2320, а кор. КАУ = 10509000001*/
                        	if(classificationTypesInAct.totalCount > 0 
                        			&& classificationTypesInAct.get(0).techcardsourceCode == TKTechCardSource.CALCULATIONS
                        			&& provList != null && provList.totalCount > 0
                        			&& provList.get(0).actPostingKindRefCode == ENActPostingKind.SERVICES_CONTRACT
                        			&& (classificationTypesInAct.get(0).kod.startsWith("01")
                        					|| classificationTypesInAct.get(0).kod.startsWith("0201"))) {
                        		correspondingAccount = "2320";
                        	} else {
                        		correspondingAccount = actLogic.getCorrespondingAccountForServices(act);
                        	}
                        	if(correspondingAccount.startsWith("237")) {
                        		opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_122, molList.get(n).molTypeRefCode);
                        	} else if(correspondingAccount.startsWith("23") || correspondingAccount.startsWith("903")) {
                        		opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_90, molList.get(n).molTypeRefCode);
                        	} else throw new SystemException("Неможливо визначити вид операції для акту с послуг та балансового рахунку " 
                        		+ correspondingAccount);
                        } else if(pl.get(i).stateRefCode == ENPlanWorkState.TRUCKING) {
                        	opType = getFINOperationCodeByTypeCode((fuelInventarizationLogic.checkActForInventarization(act)) ? FINDocType.MOVE_77 
                        			: FINDocType.MOVE_66, molList.get(n).molTypeRefCode);
                        } else if(servicesObjectForSupplier) {
                        	opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_90, molList.get(n).molTypeRefCode);
                        } else
                        {
                            opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_300, molList.get(n).molTypeRefCode);
                        }

                        if(isTechnicalMaintenance) {
                        	
                            /*09.11.2011 Для неналога в актах техобслуживания теперь перебьем виды операции - 301 будет 299,
                            * 300 - 298, согласно служебке от 26.10.2011*/

                            if(invNumber.length() == 5)
                                invNumber = "0" + invNumber;

                            // Добавим ограничение, чтобы при добавлении новых типов элементов сразу тут прописать их при необходимости ;)
                            //if(act.element.typeRef.code > 43)
                            //    throw new EnergyproSystemException("Невідомий тип елементу");
                            if(isAsset) {
                                if(isTaxableAsset) {
                                    switch(opType) {
                                    case FINDocType.v300:
                                        opType = FINDocType.v298;
                                        break;
                                    case FINDocType.v301:
                                        opType = FINDocType.v299;
                                        break;
                                    default:
                                        break;
                                    }
                                }
                            }

                        }


                        //AS 18.03.2011 molDOC_300 = createDocThead(act.numberGen, act.dateGen, opType, molList.get(n).finMolCode, Integer.MIN_VALUE, userProfile.userName.toUpperCase(), Via_who);
                        molDOC_300 = fkLogic2.CreateDocument();

            		    // ympMDAX MDAXWriteOff создание журнала на списание
            	        if (writeOffTmcConf == 1 || writeOffTmcConf == 2) {
            	         journalIdmDAX_300 = mdLogic.createDocumentForWriteOffTMC(act.numberGen , act.dateGen ,  ""+opType , molList.get(n).finMolCode );
            	        }
                        boolean isErr = true;

                        try
                        {
                            BigDecimal docSum = fkLogic2.getDocStrings();

                            if (Arrays.asList(FINDocType.v290, FINDocType.v117, FINDocType.v118).contains(opType)) //буфет
                            {
                            	/**NET-4284 USE_NDS */	BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, act.dateGen);
                            	fkLogic2.UpdateDocumentBufet(act.numberGen, opType, molList.get(n).finMolCode, molList.get(n).finMolCode, act.dateGen, docSum, Via_who,nds);
                            } else {
                            	if (molOwnerObject != null) {
	                            	FKLogic fkLogic = new FKLogic(connection, userProfile);
	                            	if (! fkLogic.isMolActive(molOwnerObject, false)) {
	                            		throw new SystemException("\n\nОсновний засіб (інв. №" + invNumber + "), на який сформовано акт, " +
	                            				"знаходиться на підзвіті МВО " + molOwnerObject + ", який закрито в Обліку матеріалів!\n" +
	                            				"Зверніться до Центральної Бухгалтерії!");
	                            	}
                            	}
                            	fkLogic2.UpdateDocumentShort(act.numberGen, opType, molList.get(n).finMolCode, (molOwnerObject != null) ? molOwnerObject : molList.get(n).finMolCode, act.dateGen, docSum, Via_who);
                            }
                            fkLogic2.SaveDocument(molDOC_300);
                            isErr = false;
                        }
                        catch (Exception e){
                            //fkLogic2.Drop_Document(molDOC_300);
                            throw new EnergyproSystemException(e.getMessage());
                        }
                        finally
                        {
                            fkLogic2.CancelDocumentHackFK(isErr);
                        }

                        ////////// 10.08.10
                       // if (eType != ENElementType.METROLOGY_COUNTER)
                        //{
                            // т.к. кода плана у нас нет, вытягиваем коды нарядов по МОЛу
                            ENWorkOrderFilter wFilter = new ENWorkOrderFilter();
                            wFilter.statusWorkOrder.code = ENWorkOrderStatus.GOOD;
                            wFilter.conditionSQL = " enworkorder.code in (" +

                            "select enworkorder2enplanwork.workordercode from "+
                            " enworkorder2enplanwork, enact2enplanwork, finmoldata "+
                            "   where enworkorder2enplanwork.plancode = enact2enplanwork.plancode "+
                            "   and  enact2enplanwork.actrefcode = " + act.code +
                            "   and finmoldata.workordercode = enworkorder2enplanwork.workordercode "+
                            "   and finmoldata.finmolcode = '" + molList.get(n).finMolCode + "')";

                            System.out.println("START FOR workOrderList2, finMolCode = " + molList.get(n).finMolCode);

                            ENWorkOrderShortList wList = woDAO.getScrollableFilteredList(wFilter, 0,-1);
                            a2wCodes = new int[wList.totalCount];
                            for (int nnn = 0; nnn < wList.totalCount; nnn++){
                                FINDoc2Act2WorkOrder a2w = new FINDoc2Act2WorkOrder();
                                a2w.actRef.code = act.code;
                                a2w.workOrderRef.code = wList.get(nnn).code;
                                a2w.finDocCode300 = molDOC_300;
                                a2w.axJournalId = journalIdmDAX_300;
                                // тут надо закидывать коды в массив !!!
                                //a2wCode = a2wDAO.add(a2w);
                                a2wCode = a2wDAO.addNOSEGR(a2w);
                                a2wCodes[nnn] = a2wCode;
                            }

                            System.out.println("END FOR workOrderList2, finMolCode = " + molList.get(n).finMolCode);

                        {
                            FINMaterialsFilter mFilter = new FINMaterialsFilter();

                            // один и тот же код МОЛА может быть у механика и мастера ...
                            if (molList.get(n).molTypeRefCode == FINMolType.MASTER){
                                estimateKindCode = ENEstimateItemKind.MATERIALS + ", " + ENEstimateItemKind.CUSTOMER_MATERIALS;
                            }
                            else
                            if (molList.get(n).molTypeRefCode == FINMolType.MECHANIC){
                                estimateKindCode = "" + ENEstimateItemKind.GSM;
                            }
                            else{
                                // шоб левак не заехал .. пока
                                estimateKindCode = "" + Integer.MIN_VALUE;
                            }


                            mFilter.div_code = molList.get(n).finMolCode;


                            mFilter.statusRef.code = FINMaterialsStatus.GOOD;
                            mFilter.conditionSQL =
                            " finmaterials.estimateitemrefcode in ("+
                            //!!! пересмотреть ...
                            " select enestimateitem.code from enestimateitem where enestimateitem.kindrefcode in ("+ estimateKindCode +") and enestimateitem.planrefcode in ( "+
                            "  select enact2enplanwork.plancode from enact2enplanwork, enplanwork where enact2enplanwork.actrefcode = "+ act.code +
                            "    and enplanwork.code = enact2enplanwork.plancode " +
                            //NET-4306
                            ((eType != ENElementType.METROLOGY_COUNTER) ? " and enplanwork.elementrefcode = " + prevEcode : "") +
                            // доработанные заборт ...
                            (( act.actTypeRef.code == ENPlanWorkState.REFINEMENT_BY_CONTRACT ) ? " and enestimateitem.code not in (select eee.estimateitemcode from enmarkestimate eee where eee.markcode = " + ENMark.FOR_REFINEMENT + ")" : "" )+

                            "))" +
                            ""
                            ;

                            mFilter.orderBySQL = "finmaterials.nn, finmaterials.cost asc";

                            System.out.println("START FOR finMaterialsList2, finMolCode = " + molList.get(n).finMolCode);

                            FINMaterialsShortList mList = mDAO.getScrollableFilteredList(mFilter, 0, -1);

                            fkLogic2.OpenDocument(molDOC_300);
                            isErr = true;
                            try{

                            for (int j = 0; j < mList.totalCount; j++){
                                FINMaterials m = mDAO.getObject(mList.get(j).code);
                                ENEstimateItem ei = eDAO.getObject(m.estimateItemRef.code);
                                //ENPlanWorkItem planItem = ei.planItemRef.code != Integer.MIN_VALUE ? planItemDao.getObject(ei.planItemRef.code) : null;
                                		
                                String kor_sch = m.bal_sch;
                                StringBuilder kor_kau = new StringBuilder(11);
                                kor_kau.append("00000000000");
                                if(isTechnicalMaintenance) {
                                	if(!isZKU) {
                                    	kor_kau.replace(2, 6, "5033");	
                                	}
                                    if(isAsset) {
                                    	if(isTaxableAsset) kor_kau.setCharAt(10, '1');
                                    	kor_sch = fkOsLogic.getLastKodZatrat(invNumber).substring(0, 4);
                                    } else {
                                    	if(isMNMA) {                              		
                                        	kor_sch = balansMNMA.balans.substring(0,4);
                                    	} else if(isZKU) {
                                    		/*SUPP-89150*/
                                    		kor_sch = "1531";
                                    		kor_kau.replace(0, 2, (isConnection) ? "25" : "24");
                                    	} else if(isByt) {
                                    		kor_sch = "2320";
                                    	/*SUPP-102170*/
                                    	} else if((invNumber.equals("000000") || invNumber.equals("111111")) 
                                    			&& pl.get(i).budgetRefCode == ENConsts.ENBUDGET_IZOLATION) {
                                    		kor_sch = "2321";
                                    		kor_kau.replace(0, 11, "10503300001");
                                    	} else if(invNumber.equals("000000")) {
                                    		// Устно договорились с бухгалтерией про корреспондирующий счет для объекта 000000
                                    		kor_sch = "9100";
                                    		kor_kau.replace(0, 11, "00100200101");
                                    	}
                                    }	
                                }
                                if(isCounters) {
                                	/*SUPP-106087*/
                                	SCUsageInputItem usageInputItem = usageInputItemDao.getObject(oz.usageInputItemRef.code);
                                    SCUsageInputItemOZ ozZku = (usageInputItem.kindRef.code != SCUsageInputItemKind.UsageInputZKU) ? ozDao.getOZForUsageInputZKUByUsageInputOZ(oz) : oz;
                                    
                                	kor_sch = actLogic.getCorrespondingAccountForOZ((ozZku != null ? ozZku : oz));
                                	kor_kau = new StringBuilder(actLogic.getCorrespondingCAAForOZ((ozZku != null ? ozZku : oz), actLogic.getConnectionKind(act.code) != Integer.MIN_VALUE));  
                                }
                                if(isReconstructionOrModernization) {
                                	kor_sch = actLogic.getCorrespondingAccountForReconstructionAndModernization(act, invNumber);
                                	kor_kau = new StringBuilder(actLogic.getCorrespondingCAAForReconstructionAndModernization(act
                                			, invNumber, kor_sch));
                                }
                                if(isRepairing) {
                                	switch(eType) {
                                	case ENElementType.METROLOGY_COUNTER:
                                		kor_sch = settingsLogic.getValue(ENSettingsKeysConsts.COUNTER_REPAIRING_CORRESPONDING_ACCOUNT);
                                		kor_kau = new StringBuilder(settingsLogic.getValue(ENSettingsKeysConsts.COUNTER_REPAIRING_CORRESPONDING_CAA));
                                		break;
                                	case ENElementType.METROLOGY_DEVICE:
                                		kor_sch = "2320";
                                		kor_kau = new StringBuilder("10503300001");
                                		break;
                                		default:
                                			kor_sch = "2361";
                                			if(!isAsset) {
                                				String errorText = String.format("\n\nПомилка при формуванні проводок!\n"
                                						+ "Об'єкт \"%s\" не є основним засобом! Можливо необхідно зробити акт на псевдооб'єкт.\n"
                                						+ "Для подальших розяснень зверніться в Центральну бухгалтерію!\n\n", eLogic.getNameByCode(act.element.code, act.element.typeRef.code)[0]);
                                				throw new SystemException(errorText);
                                			}
                                			kor_kau = new StringBuilder(actLogic.getCorrespondingCAAForRepairing(act,  invNumber)); 
                                			break;
                                	}
                                }
                                if(act.actTypeRef.code == ENPlanWorkState.WORK_IN_OUT && eType == ENElementType.SERVICES_OBJECT) {
                                	/*15.06.2021 SUPP-100547 согласовали устно с ЦБ Материальный сектор если в акте услуг 
                                	 * есть калькуляции начианющиеся с 01 или 0201, то кор. счет = 2320, а кор. КАУ = 10509000001*/
                                	if(classificationTypesInAct.totalCount > 0 
                                			&& classificationTypesInAct.get(0).techcardsourceCode == TKTechCardSource.CALCULATIONS
                                        	&& provList != null && provList.totalCount > 0
                                        	&& provList.get(0).actPostingKindRefCode == ENActPostingKind.SERVICES_CONTRACT
                                			&& (classificationTypesInAct.get(0).kod.startsWith("01")
                                					|| classificationTypesInAct.get(0).kod.startsWith("0201"))) {
                                		kor_sch = "2320";
                                		kor_kau = new StringBuilder("10509000001");
                                	} else {
                                    	kor_sch = actLogic.getCorrespondingAccountForServices(act);
                                    	kor_kau = new StringBuilder(actLogic.getCorrespondingCAAForServices(act));
                                    	
                                    	if(provList != null && provList.totalCount > 0 
                                    			&& provList.get(0).actPostingKindRefCode < ENActPostingKind.SERVICES_CONTRACT_INSTALL_COUNTER) {
                                    		kor_kau.replace(5, 6, "0");
                                    	}
                                	}
                                }
                                if(servicesObjectForSupplier) {
                                	kor_sch = "2320";
                                	kor_kau = new StringBuilder("10509000001");
                                }
                                if(act.actTypeRef.code == ENPlanWorkState.TRUCKING) {
                                	if(fuelInventarizationLogic.checkActForInventarization(act)) {
                                		kor_sch = "9471";
                                		kor_kau = new StringBuilder("00902000001");
                                	} else {
                                    	kor_sch = "9100";
                                    	kor_kau = new StringBuilder("10100200101");  
                                	}
                                }
                                if(act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION
                                		|| act.actTypeRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL) {
                                	kor_sch = act.numberGen.toLowerCase().contains("кухня") ? "9028" : "9029";
                                	kor_kau = new StringBuilder("00777700001");
                                }
                                

                                //mdax writeoff - если работаем с аксаптой то проверим что бы на финматериалсах были recid аксаптовые
                                if ((writeOffTmcConf == 1 || writeOffTmcConf == 2) && (mList.get(j).axInventTransferLinesCode == null || mList.get(j).axInventTransferLinesCode.equals("") )) {
                                	throw new EnergyproSystemException(" Не визначена строка залишку для списання в АХ!!!! \n finmaterialscode = " + mList.get(j).code + " ( " + m.mat_name + "  МОЛ = "+ m.div_code +") "    );
                                }

                                // материалы заказчика проводим тем же 300-м
                                if (ei.kindRef.code == ENEstimateItemKind.CUSTOMER_MATERIALS) opType = 300;
                                
                                errText = "(создание " + opType + ") ... № акта " + act.numberGen + " , номенклатура " + m.nn + ", кол-во " + m.quantity + "\n " +
                                		"балансовий рахунок: " + m.bal_sch + " кореспондуючий рахунок: " + kor_sch;

                                    BigDecimal sumDoc = fkLogic2.getDocStrings();


                                  //буфет
                                if (Arrays.asList(FINDocType.v290, FINDocType.v117, FINDocType.v118).contains(opType)) {
                                	/**NET-4284 USE_NDS */	BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, act.dateGen);
                                    fkLogic2.UpdateDocumentBufet(
                                                act.numberGen,
                                                opType,
                                                m.div_code,
                                                m.div_code,
                                                act.dateGen,
                                                sumDoc,
                                                Via_who,
                                                nds
                                                );
                                    } else {
                                        fkLogic2.UpdateDocumentShort(
                                                act.numberGen,
                                                opType,
                                                m.div_code,
                                                (molOwnerObject != null) ? molOwnerObject : m.div_code,
                                                act.dateGen,
                                                sumDoc,
                                                Via_who
                                                );
                                    }
                                
                                TStringAdditionalParams params = new TStringAdditionalParams();
                                params.setRest_purpose_id_from(m.rest_purpose_id);
                                params.setRest_purpose_id_to(m.rest_purpose_id);
                                params.setKor_kau(kor_kau.toString());
                                params.setKor_sch(kor_sch);
                                
                                // Проверка корреспонденции балансового и корреспондирующего счета для заданного вида операции 
                                if(!fkLogic2.checkCorrespondence(opType, m.bal_sch, kor_sch)) {
                                	errText = "";
                                	String opName = fkLogic2.getOperationKindName(opType);
                                	throw new SystemException(String.format("\n\nДля заданої операції виду \"%d %s\" відсутня кореспонденція балансового рахунку \"%s\" "
                                			+ "із кореспондуючим рахунком \"%s\".\n\n", opType, opName, m.bal_sch, kor_sch));
                                }
                                stringCode = fkLogic2.addString(m, params);
                                int red_rest = fkLogic2.check_red_rest(molDOC_300, stringCode, FKConsts.CHECK_RED_REST_IS_UPDATE);

                                if (red_rest != 0 ){
                                    throw new EnergyproSystemException("Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!! Ном. номер " + m.nn);
                                    //errText = "Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!! Залишок на кінець місяця " + matLastDay.quantity;
                                }


                                //}
                                //catch (Exception e){
                                    //fkLogic2.CancelDocument();
                                //    throw new EnergyproSystemException(e.getMessage());
                                //}

                                actMaterials = true;
                            }


                            /* !!!!!!!!!! &&&&&&mdax materialsWriteOff
                             * */
            				if ((writeOffTmcConf == 1 || writeOffTmcConf == 2 ) 	&& FINDoc2MolDataWithAxJournalID.size() != 0 ) {
            					for (int u = 0; u < FINDoc2MolDataWithAxJournalID.size(); u++) {


            						//!!!!!!!!!! &&&&&& если мол документа на резерв совпадает с молом в акте -  копируем строки из документов на резервирование в документ на списание
            						if ( molList.get(n).finMolCode.equals(FINDoc2MolDataWithAxJournalID.get(u).molCode)
            								&& !FINDoc2MolDataWithAxJournalID.get(u).isRemoveJournal // если журнал не удалили
            								&& FINDoc2MolDataWithAxJournalID.get(u).molTypeCode == molList.get(n).molTypeRefCode // при совпадении типов молов
            								) {
            							 /*проверка на открытую транзакцию по пользователю */
            							 if (axLogic.aifttsCheckOpen()) {
            								 mdLogic.updateJournalTrans(FINDoc2MolDataWithAxJournalID.get(u).axJournalId , journalIdmDAX_300, /*RecId*/"");
            							 } else
            							 {
            								 throw new EnergyproSystemException("\n Ошибка при копировании строк из журнала по резерву в журнал на списание!!!(AX)");
            							 }


                  						/// !!!!!mdax проверить что бы внутри не было строк тогда можно удалять
              							int countInventJournalTrans = mdLogic.getInventJournalTransCount(FINDoc2MolDataWithAxJournalID .get(u).axJournalId);
              							if (countInventJournalTrans == Integer.MIN_VALUE) {
              								throw new EnergyproSystemException("Помилка при визначенні строк у журналі " + FINDoc2MolDataWithAxJournalID	.get(u).axJournalId);
              							}

            							 if (axLogic.aifttsCheckOpen()) {
            								// удаляем документы наряд-задания
                      							if (countInventJournalTrans == 0) {
                     								JournalAction journalAction = new JournalAction();
                             	  					journalAction.journalTableDelete(FINDoc2MolDataWithAxJournalID.get(u).axJournalId ,axLogic.getUserSecurity().domainUserName,axLogic.getUserSecurity().userPass);
                             	  					// ставим признак что журнал удален
                             	  					FINDoc2MolData fd2mdObject = new FINDoc2MolData();
                             	  					fd2mdObject.axJournalId = FINDoc2MolDataWithAxJournalID.get(u).axJournalId;
                             	  					fd2mdObject.molCode = FINDoc2MolDataWithAxJournalID.get(u).molCode;
                             	  					fd2mdObject.isRemoveJournal = true;
                             	  					FINDoc2MolDataWithAxJournalID.set(u, fd2mdObject);
                     							}
            							 }else
            							 {
            								 throw new EnergyproSystemException("\n Ошибка при копировании строк из журнала по резерву в журнал на списание.Нет открытой транзакции !!!(AX)");
            							 }

            						}


								}
            				}

                            /* типа проверили при формировании Вывода
                            int red_rest = fkLogic2.check_red_rest(molDOC_300, Integer.MIN_VALUE, 0);

                            if (red_rest != 0 ){
                                throw new EnergyproSystemException("Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!!");
                                //errText = "Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!! Залишок на кінець місяця " + matLastDay.quantity;
                            }
                            */


                            BigDecimal sumDoc = fkLogic2.getDocStrings();

                            //буфет
                            if (Arrays.asList(FINDocType.v290, FINDocType.v117, FINDocType.v118).contains(opType)) {

                                FINMaterialsFilter fmFilter = new FINMaterialsFilter();
                                fmFilter.conditionSQL=" finmaterials.estimateitemrefcode in ( "+
                                " select ei.code "+
                                " from enestimateitem ei,enact2enplanwork ap "+
                                " where ei.planrefcode=ap.plancode "+
                                " and ap.actrefcode="+act.code+
                                " )    and finmaterials.statusrefcode=1 ";

                                FINMaterialsShortList fmList = mDAO.getScrollableFilteredList(fmFilter, 0, -1);
                                BigDecimal docSumNDS= new BigDecimal(0);

                                for (int k=0; k<fmList.totalCount; k++){
                                    docSumNDS=docSumNDS.add(fmList.get(k).cost_ext_nds);
                                }
                                /**NET-4284 USE_NDS */	BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, act.dateGen);
                                fkLogic2.UpdateDocumentBufetLast(
                                        act.numberGen,
                                        opType,
                                        molList.get(n).finMolCode,
                                        molList.get(n).finMolCode,
                                        act.dateGen,
                                        sumDoc,
                                        Via_who,
                                        docSumNDS,
                                        nds
                                        );
                            } else if(opType == FINDocType.v122) {
                                fkLogic2.UpdateDocumentShort(
                                        act.numberGen,
                                        opType,
                                        molList.get(n).finMolCode,
                                        (molOwnerObject != null) ? molOwnerObject : molList.get(n).finMolCode,
                                        act.dateGen,
                                        sumDoc,
                                        Via_who,
                                        "000"
                                        );                            	
                            } else {
                            fkLogic2.UpdateDocumentShort(
                                act.numberGen,
                                opType,
                                molList.get(n).finMolCode,
                                (molOwnerObject != null) ? molOwnerObject : molList.get(n).finMolCode,
                                act.dateGen,
                                sumDoc,
                                Via_who
                                );
                            }

                            fkLogic2.SaveDocument(molDOC_300);
                            
                            isErr = false;
                            }
                            catch (Exception e){
                            	e.printStackTrace();
                            	throw new SystemException(errText + " \n " + e.getMessage(), e);
                            }
                            finally
                            {
                                fkLogic2.CancelDocumentHackFK(isErr);
                            }

                    	    // Если акт проводится с применением ЭЦП, будем проводить под юзером energynet
                    		String userName = actLogic.getUserNameForFK(act.code);
                            fkLogic2.setUser4DOC(molDOC_300, userName);

                        	fkLogic2.alterSession(connection);
                        	fkLogic2.createRealtimeProv(molDOC_300);

                            System.out.println("END FOR finMaterialsList2, finMolCode = " + molList.get(n).finMolCode);
                        }


                        System.out.println("START removeDoc, finMolCode = " + molList.get(n).finMolCode);

                        if (actMaterials){
                            FINDoc2MolData f2m = new FINDoc2MolData();
                            f2m.finDocCode = molDOC_300;
                            f2m.axJournalId = journalIdmDAX_300;
                            if(/*( pl.get(i).typeRefCode == ENPlanWorkType.WRITINGOFFPROTECTION ) &&*/
                                    ( pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MBP || pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/))
                            {
                                f2m.finDocTypeRef.code = FINDocType.MOVE_61;
                            }
                            else
                            if(/*( pl.get(i).typeRefCode == ENPlanWorkType.WRITINGOFFPROTECTION ) &&*/
                                    ( pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MNMA ))
                            {
                                f2m.finDocTypeRef.code = FINDocType.MOVE_74;
                            }

                            else
                            if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
                            {
                                f2m.finDocTypeRef.code = FINDocType.MOVE_290;
                            }
                            else
                            if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION)
                            {
                                f2m.finDocTypeRef.code = FINDocType.MOVE_291;
                            }
                            else
                            if (pl.get(i).elementRefCode == ENElement.INVENTARIZATION_WRITEOFF_OBJECT)
                            {
                            	f2m.finDocTypeRef.code = FINDocType.MOVE_380;
                            }
                            else if (isTechnicalMaintenance)
                            {
                            	f2m.finDocTypeRef.code = FINDocType.MOVE_66;
                            }
                            else if(isReconstructionOrModernization) {
                            	f2m.finDocTypeRef.code = FINDocType.MOVE_267;
                            }
                            else if(isRepairing) {
                            	f2m.finDocTypeRef.code = (eType != ENElementType.METROLOGY_COUNTER) 
                        				? (eType != ENElementType.METROLOGY_DEVICE) ? FINDocType.MOVE_87 : FINDocType.MOVE_66 
                        						: FINDocType.MOVE_181;
                            }
                            else
                            {
                                // 01.12.2011 - разделим неналог (298, 299 виды операций - должны сохраняться FINDocType.MOVE_298)
                                if(opType == FINDocType.v298 || opType == FINDocType.v299)
                                    f2m.finDocTypeRef.code = FINDocType.MOVE_298;
                                else
                                    f2m.finDocTypeRef.code = FINDocType.MOVE_300;
                            }
                            f2m.molData.code = molList.get(n).code;
                            d2mDAO.add(f2m);
                        }
                        else{
                            if(/*( pl.get(i).typeRefCode == ENPlanWorkType.WRITINGOFFPROTECTION ) &&*/
                                    ( pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MBP || pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/))
                            {
                                opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_330, molList.get(n).molTypeRefCode);
                            }
                            else
                            if(/*( pl.get(i).typeRefCode == ENPlanWorkType.WRITINGOFFPROTECTION ) &&*/
                                    ( pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MNMA ))
                            {
                                opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_331, molList.get(n).molTypeRefCode);
                            }

                            else
                            if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
                            {
                                opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_290, molList.get(n).molTypeRefCode);
                            }
                            else
                            if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION)
                            {
                                opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_291, molList.get(n).molTypeRefCode);
                            }
                            else
                            if (pl.get(i).elementRefCode == ENElement.INVENTARIZATION_WRITEOFF_OBJECT)
                            {
                                opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_380, molList.get(n).molTypeRefCode);
                            }
                            else
                            {
                                opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_300, molList.get(n).molTypeRefCode);
                            }

                            if (opType != 28) {
                                //AS 18.03.2011 removeDoc(molDOC_300, opType);
                                Date fk_date = getCurrentPeriodInFK();
                                if ((act.actTypeRef.code == ENPlanWorkState.WORK_IN_OUT) && fk_date.after(act.dateGen)) {
                                    fkLogic2.updateDateTHead(molDOC_300, fk_date);
                                }
                                fkLogic2.Drop_Document(molDOC_300);

                              if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
                            	// удаление пустого аксаптового журнала акта !!!!! если нету материалов нем
                                  if (axLogic.aifttsCheckOpen() && !journalIdmDAX_300.equals( "") ) {
               						/// !!!!!mdax проверить что бы внутри не было строк тогда можно удалять
               							int countInventJournalTrans = mdLogic
               									.getInventJournalTransCount(journalIdmDAX_300);
               							if (countInventJournalTrans == Integer.MIN_VALUE) {
               								throw new EnergyproSystemException("Помилка при визначенні строк у журналі " + journalIdmDAX_300);
               							}

               							if (countInventJournalTrans == 0) {
               								JournalAction journalAction = new JournalAction();
                       	  					journalAction.journalTableDelete(journalIdmDAX_300 ,axLogic.getUserSecurity().domainUserName,axLogic.getUserSecurity().userPass);
               							}


      							 }else
      							 {
      								 throw new EnergyproSystemException("\n Ошибка при копировании строк из журнала по резерву в журнал на списание.Нет открытой транзакции !!!(AX)");
      							 }
                              }



                            }

                            for (int a = 0; a < a2wCodes.length; a++){
                                    //a2wDAO.remove(a2wCodes[a]);
                                    a2wDAO.removeNOSEGR(a2wCodes[a]);
                            }

                        }

                        System.out.println("END removeDoc, finMolCode = " + molList.get(n).finMolCode);

                    }

                    System.out.println("END FOR molDataList, finMolCode = " + molList.get(n).finMolCode);
                }
        } // если коды елеметов НЕ равны ...
        } // пока планы на акте


        ///////////////////////
        //
        // доработанные мат-лы ....
        //
        int doc40 = Integer.MIN_VALUE;
        //???????mdax -- доработанные материалы тоже нужно создавать в аксапте
         String doc40_AX = "";
        int finMolDataCode = Integer.MIN_VALUE;


        ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
        eFilter.kindRef.code = ENEstimateItemKind.REFINEMENT;
        eFilter.conditionSQL = "enestimateitem.planrefcode in (" + plansInAct + ") and enestimateitem.countfact <> 0";
        ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter, 0, -1);

        if(eList.totalCount == 0 && act.actTypeRef.code == ENPlanWorkState.REFINEMENT && act.element.typeRef.code != ENElementType.METROLOGY_OBJECT)
            throw new EnergyproSystemException("Не знайдено дороблених матеріалів");

        if (eList.totalCount > 0)
        {
            FINMolDataFilter fmdFilter = new FINMolDataFilter();
            fmdFilter.act.code = act.code;
            fmdFilter.molTypeRef.code = FINMolType.MASTER;
            int[] fmdArr = molDAO.getFilteredCodeArray(fmdFilter, 0, -1);
            if (fmdArr.length != 1){
                throw new EnergyproSystemException("Не знайдено данних про МВО при 400-40 операціях ...");
            }
            finMolDataCode = fmdArr[0];
        }

        for (int i=0; i < eList.totalCount; i++){

            FINMaterialsFilter fmFilter = new FINMaterialsFilter();
            fmFilter.estimateItemRef.code = eList.get(i).code;
            fmFilter.statusRef.code = FINMaterialsStatus.GOOD;
            int[] fmArr = mDAO.getFilteredCodeArray(fmFilter, 0, -1);
            if (fmArr.length != 1){
                throw new EnergyproSystemException("Не знайдено матеріал ПІСЛЯ ДОРОБКИ ...");
            }

            ENEstimateItemFilter eFilter1 = new ENEstimateItemFilter();
            eFilter1.kindRef.code = ENEstimateItemKind.MATERIALS;
            eFilter1.planRef.code = eList.get(i).planRefCode;
            eFilter1.planItemRef.code = eList.get(i).planItemRefCode;
            eFilter1.materialRef.code = eList.get(i).materialRefCode;
            eFilter1.conditionSQL = "enestimateitem.countfact <> 0";
            // еще бы по чемунибудь искать .. шоб поточнее было ;))
            int[] e1Arr = eDAO.getFilteredCodeArray(eFilter1, 0, -1);
            if (e1Arr.length != 1){
                if (e1Arr.length > 1) {
                throw new EnergyproSystemException(
                    "Знайдено декілька однакових нормативних матеріалів " + "\n" +
                    "ДО ДОРОБКИ: " + eList.get(i).materialRefName);
                };
                throw new EnergyproSystemException("Не знайдено матеріал ДО ДОРОБКИ ...");
            }

            FINMaterialsFilter fmFilter1 = new FINMaterialsFilter();
            fmFilter1.estimateItemRef.code = e1Arr[0];
            fmFilter1.statusRef.code = FINMaterialsStatus.GOOD;
            int[] fmArr1 = mDAO.getFilteredCodeArray(fmFilter1, 0, -1);
            if (fmArr1.length != 1){
                throw new EnergyproSystemException("Не знайдено матеріал до ДОРОБКИ ...");
            }

            FINMaterials fm = mDAO.getObject(fmArr[0]);
            FINMaterials fm1 = mDAO.getObject(fmArr1[0]);

            if (fm.quantity.doubleValue() != fm1.quantity.doubleValue()){
                throw new EnergyproSystemException("Не співпадає кількість матеріалу до та після доробки ...");
            }



            // Создание документа 40го вида операции

                    FINDoc2MolData d2m = new FINDoc2MolData();

                    doc40 = fkLogic2.CreateDocument();

                    opType = FINDocType.V_40;
                    // ympMDAX MDAXWriteOff создание журнала на приход доработанных материалов
        	        if (writeOffTmcConf == 1 || writeOffTmcConf == 2) {
        	        	doc40_AX = mdLogic.createDocument(act.numberGen , act.dateGen ,  ""+opType , fm.div_code  , "PW");
        	        }

                    boolean isErr = true;
                    try
                    {

                        BigDecimal docSum = fkLogic2.getDocStrings();
                        fkLogic2.UpdateDocumentShort(act.numberGen, opType, fm.partner, fm.div_code, act.dateGen, docSum, Via_who);
                        fkLogic2.SaveDocument(doc40);
                        isErr = false;
                    }
                    catch (Exception e){
                        //fkLogic2.Drop_Document(molDOC_300);
                        throw new EnergyproSystemException(e.getMessage());
                    }
                    finally
                    {
                        fkLogic2.CancelDocumentHackFK(isErr);
                    }

                    d2m = new FINDoc2MolData();
                    d2m.molData.code = finMolDataCode;
                    d2m.finDocCode = doc40;
                    d2m.axJournalId = doc40_AX;
                    d2m.finDocTypeRef.code = FINDocType.MOVE_40;
                    d2mDAO.add(d2m);


                // добавим строки 40го документа

                fkLogic2.OpenDocument(doc40);
                isErr = true;
                try{

                    BigDecimal sumDoc = fkLogic2.getDocStrings();


                  if (writeOffTmcConf == 1 || writeOffTmcConf == 2) {
    				String usr = axLogic.getUserSecurity().domainUserName;
    				String pwd = axLogic.getUserSecurity().userPass;

    				InventMovementLinesKSService_Service service = new InventMovementLinesKSService_Service();
    				InventMovementLinesKSService proxy = service.getBasicHttpBindingInventMovementLinesKSService();
    				((BindingProvider) proxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
    				((BindingProvider) proxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

    				 MovementJournalLinesCreate movementJournalLinescreator = new MovementJournalLinesCreate(proxy);

                     String[] result = {"","",""};

                     String siteId = mdLogic.getAxDepartmentByMol(fm.div_code);
	   				 if(siteId.equals("")) {
	   					 throw new EnergyproSystemException("Помилка siteId by mol_code " + fm.div_code  +  "  not found !!!!!  ");
	   				 }

                    result = movementJournalLinescreator.createInventMovementLines( doc40_AX , // (InventJournalTable).JournalNameId
                    		fm.ax_frc_code , // цфо  DimensionOffset[6]
                    		fm.ax_rest_purpose_typeid, // назначение  DimensionOffset[9]
                    		fm.ax_frc_code , // цфо корр DimensionOffset[6]
                    		fm.ax_rest_purpose_typeid, // назначение корр DimensionOffset[9]
                    		fm.nn , // Идентификатор мате-риала  ItemId
   						    siteId ,// Код сайта	InventDimIssue.InventSiteId
   						    fm.div_code, // Код организации-получателя	InventDimReceipt.InventLocationId
   						    fm.bal_sch ,  // Балалансовый счет InventDimIssue.InventProfileId_RU
   						 "", // InventJournalTrans.LedgerAccountIdOffset
   						    fm.quantity , // Количество	InventJournalTrans.QtyInUnitOpr_UA
   						    fm.mu_name , // Ед. изм	InventJournalTrans.UnitIdOpr_UA
   						    "" /*fm.ax_party_id*/ , //  Идентификатор партии	InventDimIssue.inventBatchId
   						    fm.ax_rest_purpose_id , // InventDimIssue.wMSLocationId
   						    act.dateGen ,
   						    fm.axInventDimFinId , // код фин аналитики
   						    fm.price , // цена
   						    false // кол-во положиельно ( получение )
   				    		);

                    // айдишник аксаптовый строки fm

                    	fm.axInventTransferLinesCode = result[0];
                        fm.price = new BigDecimal(result[1]);
                        fm.cost = new BigDecimal(result[2]);
                        /*!!!! mdax по RecId вытянем строку журнала и возьмем оттуда партию */

                        List<AxdEntityInventJournalTrans> retInventJournalTransList = movementJournalLinescreator.FindInventJournalTrans(fm.axInventTransferLinesCode);
                        AxdEntityInventJournalTrans retInventJournalTrans = retInventJournalTransList.get(0);

                        String axPatryId = retInventJournalTrans.getInventDim().get(0).getInventBatchId().getValue();
                        if (axPatryId== null || axPatryId.equals("")) {
                        	throw new EnergyproSystemException( " Помилка при визначенні партії в Axapta!!!!" );
                        }

                        fm.ax_party_id =  axPatryId;
                        fm.party_id = Integer.parseInt(fm.ax_party_id);
                        mDAO.save(fm);
                    }


                    stringCode = fkLogic2.addString(fm, fm.rest_purpose_id, fm.rest_purpose_id );




                    sumDoc = fkLogic2.getDocStrings();
                    opType = FINDocType.V_40;
                    fkLogic2.UpdateDocumentShort(
                        act.numberGen,
                        opType,
                        fm.partner,
                        fm.div_code,
                        act.dateGen,
                        sumDoc,
                        Via_who
                        );

                    fkLogic2.SaveDocument(doc40);
                    isErr = false;
                }
                catch (Exception e){
                    //fkLogic2.Drop_Document(molDOC_300);
                    throw new EnergyproSystemException(e.getMessage());
                }
                finally
                {
                    fkLogic2.CancelDocumentHackFK(isErr);
                }

                PartyFilter partyFilter = new PartyFilter();
                partyFilter.doc_id = doc40;
                partyFilter.Doc_str_id = stringCode;
                int[] partyArr = partyDAO.getFilteredCodeArray(partyFilter, 0, -1);
                if (partyArr.length != 1){
                    throw new EnergyproSystemException("Партія не знайдена ...");
                }
        }

	    // Если акт проводится с применением ЭЦП, будем проводить под юзером energynet
		String userName = actLogic.getUserNameForFK(act.code);
        fkLogic2.setUser4DOC(doc40, userName);


        System.out.println("END createDOCFromActWithoutVivod, actCode = " + act.code);

        // System.gc();

        }
        finally{
            try
            {
                if (energyNetConnection != null && ! energyNetConnection.isClosed()){
                    energyNetConnection.close();
                    energyNetConnection = null;
                }
            } catch (SQLException e) {}
        }
    }


    public void createDOCFromActWithoutVivodZKU(ENAct act) throws PersistenceException, DatasourceConnectException
    {

        System.out.println("START createDOCFromActWithoutVivodZKU, actCode = " + act.code);

        try
        {

            ActLogic actLogic = new ActLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            FINMolDataDAO molDAO = new FINMolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);
            FKOSLogic fkOsLogic = new FKOSLogic(connection, userProfile);
            FINMolDAO molDao = new FINMolDAO(connection, userProfile);
            ENWorkOrderDAO woDAO = new ENWorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            FINMaterialsDAO mDAO = new FINMaterialsDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            FINDoc2MolDataDAO d2mDAO = new FINDoc2MolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            FINDoc2MolDataFilter d2mFilter = new FINDoc2MolDataFilter();
            FINDoc2MolDataShortList d2mList;

            PlanWorkLogic planWorkLogic = new PlanWorkLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            ENEstimateItemDAO eDAO = new ENEstimateItemDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            PartyDAO partyDAO = new PartyDAO(connection, userProfile);
            OrderLogic ol = new OrderLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            ElementLogic eLogic = new ElementLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            SCUsageInputItemOZDAO ozDao = new SCUsageInputItemOZDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            SCUsageInputItemDAO usageInputItemDao = new SCUsageInputItemDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            
            int stringCode;
            int opType;

            /** обрезать номер акта до 10 символов */
            if (act.numberGen != null && !act.numberGen.equals("")) {
            	if (act.numberGen.length() > 10) {
            		act.numberGen = act.numberGen.substring(0,10);
            	}
            }

            // выборка кодов заданий-фактов
            String plansInAct = actLogic.getPlanCodesByAct(act.code);
            SCUsageInputItemOZ oz = ozDao.getObjectByAct(act);

            String Via_who = "";
            String errText = "";

            validateDocDate(act.dateGen); // проверим даты ..

            boolean isUsingMaterials = false;
            boolean isTechnicalMaintenance = (act != null && act.actTypeRef != null && act.actTypeRef.code == ENPlanWorkState.TO)
            		&& actLogic.checkInSCCounterByActCode(act.code, false, null, false) == 0;
            boolean isCounters = (act != null && act.actTypeRef != null && act.actTypeRef.code == ENPlanWorkState.TO)
            		&& actLogic.checkInSCCounterByActCode(act.code, false, null, false) > 0;
            
            String invNumber = eLogic.getElementInvNumber(act.element.code);



            if(invNumber.length() == 5)
                invNumber = "0" + invNumber;


            /*проверка на то, что основное - это основное */
            boolean isAsset = invNumber.length() == 6 && getInvNumberIsExist(invNumber);
            boolean isMNMA = true;
            boolean isByt = false;
            
            if(act.element.typeRef.code == ENElementType.TY_BYT || act.element.typeRef.code == ENElementType.TY_PROM
            		|| act.element.typeRef.code == ENElementType.ROUTE_BYT)
                isAsset = isMNMA = !(isByt = true);
            if(act.element.typeRef.code == ENElementType.SERVICES_OBJECT
            		|| act.element.typeRef.code == ENElementType.SERVICES_FROM_SIDE_OBJECT)
                isAsset = isMNMA = false;
            if(act.element.typeRef.code == ENElementType.METROLOGY_COUNTER || act.element.typeRef.code == ENElementType.METROLOGY_DEVICE || act.element.typeRef.code == ENElementType.METROLOGY_OBJECT)
                isAsset = isMNMA = false;

            
            boolean isTaxableAsset = isAsset && getIsNalog(invNumber);
            
            isMNMA = isMNMA && !isAsset && invNumber.length() > 6;
            
            String molOwnerObject = null;
    		ENAct2Humen balansMNMA = null;
            
            if(isAsset) {
            	molOwnerObject = fkOsLogic.getMolCode(invNumber);
            }
            if(isMNMA && isTechnicalMaintenance) {
            	 balansMNMA = actLogic.getBalansWithMainCeh(act, connection);
            	 molOwnerObject = act.molCodeObject;
            }


            // Выборка нарядов по кодам фактов
            ENWorkOrderFilter woFilter = new ENWorkOrderFilter();
            woFilter.statusWorkOrder.code = ENWorkOrderStatus.GOOD;
            woFilter.conditionSQL = " enworkorder.code in ("+
            " select enworkorder2enplanwork.workordercode from enworkorder2enplanwork where enworkorder2enplanwork.plancode in ("+
            plansInAct +"))";

            // Проверка наличия материалов в нарядах - если нет, то
            // осуществляется
            // выход из процедуры без создания документа на списание
            ENWorkOrderShortList woList = woDAO.getScrollableFilteredList(woFilter, 0,-1);
            for (int n = 0; n < woList.totalCount; n++)
            {
                ENPlanWork planWork = planWorkLogic.getPlanByWorkOrderCode(woList.get(n).code);

                int operationType = -1;
                int operationType28 = -1;

                    // Определение вида операции
                    if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
                    		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
                    		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/)
                    {
                        operationType = FINDocType.MOVE_332;    // если списание МБП или МНМА
                        operationType28 = FINDocType.MOVE_28_332;
                    }
                    else
                    if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
                    {
                        operationType = FINDocType.MOVE_292;
                        operationType28 = FINDocType.MOVE_28_292;
                    } else
                    {
                        operationType = FINDocType.MOVE_302;
                        operationType28 = FINDocType.MOVE_28_302;
                    }

                    if(operationType == -1)
                        throw new EnergyproSystemException("Не визначений вид операції");

                FINMolDataFilter molFilter = new FINMolDataFilter();
                molFilter.workOrder.code = woList.get(n).code;
                FINMolDataShortList molList = molDAO.getScrollableFilteredList(molFilter, 0, -1);

                for (int nn = 0; nn < molList.totalCount; nn++)
                {
                    FINMaterialsFilter finMatFilter = new FINMaterialsFilter();
                    finMatFilter.molDataRef.code = molList.get(nn).code;
                    finMatFilter.statusRef.code = FINMaterialsStatus.GOOD;
                    String condition = "select e.code from enestimateitem e where e.kindrefcode = "+ ENEstimateItemKind.GSM+
                                        " or e.kindrefcode = "+ENEstimateItemKind.MATERIALS +
                                        " or e.kindrefcode = " + ENEstimateItemKind.CUSTOMER_MATERIALS;
                    finMatFilter.conditionSQL = " finmaterials.estimateitemrefcode in ("+condition+")";
                    int[] finMatArr = mDAO.getFilteredCodeArray(finMatFilter,0,-1);
                    if (finMatArr.length != 0)
                            isUsingMaterials = true;

                }

                // Удаление ввода в резерв
                for(int nn = 0; nn < molList.totalCount; nn++)
                {
                    d2mFilter = new FINDoc2MolDataFilter();
                    d2mFilter.molData.code = molList.get(nn).code;
                    d2mFilter.finDocTypeRef.code = operationType;

                    d2mList = d2mDAO.getScrollableFilteredList(d2mFilter, 0, -1);

                    for(int nnn = 0; nnn < d2mList.totalCount; nnn++)
                    {
                        // Поменяем дату открытости периода в ФК
                        Date fk_date = getCurrentPeriodInFK();

                            if ((act.actTypeRef.code == ENPlanWorkState.WORK_IN_OUT) && fk_date.after(woList.get(n).dateGen)){
                                fkLogic2.updateDateTHead(d2mList.get(nnn).finDocCode, fk_date);
                            }


                            fkLogic2.setCreator("E");
                            fkLogic2.setCreatorTHead(d2mList.get(nnn).finDocCode,"E");
                            try    {fkLogic2.Drop_Document(d2mList.get(nnn).finDocCode, false);}
                            catch(Exception e){throw new EnergyproSystemException(e);}
                            finally{fkLogic2.setCreator("2");}

                        d2mDAO.remove(d2mList.get(nnn).code);
                    }

                    // Таких документов замечено не было, но все равно на всякий случай необходимо поставить
                    // отчистку таблицы FINDoc2FKOrder
                    d2mFilter = new FINDoc2MolDataFilter();
                    d2mFilter.molData.code = molList.get(nn).code;
                    d2mFilter.finDocTypeRef.code = operationType28;

                    d2mList = d2mDAO.getScrollableFilteredList(d2mFilter, 0, -1);

                    for(int nnn = 0; nnn < d2mList.totalCount; nnn++)
                    {
                        d2mDAO.remove(d2mList.get(nnn).code);
                    }
                }
            }

            if(!isUsingMaterials)
                return;

        // списание !!! 300 в/о или 330 или 331

        System.out.println("START doc_300 or 330 or 331 ");

        FINDoc2Act2WorkOrderDAO a2wDAO = new FINDoc2Act2WorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        int a2wCode = Integer.MIN_VALUE;
        int[] a2wCodes = new int[0];

        boolean actMaterials = false;
        stringCode = Integer.MIN_VALUE;
        Via_who = "инв.№...";
        int prevEcode = Integer.MIN_VALUE;
        ENPlanWorkFilter pf = new ENPlanWorkFilter();
        // AS 28.01.2011
        //pf.conditionSQL = "enplanwork.code in (select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = "+ act.code+")";
        pf.conditionSQL = "enplanwork.code in (" + plansInAct + ")";

        //pf.orderBySQL = "ENELEMENTDATA.INVNUMBER";
        pf.orderBySQL = " 27 ";  /**  номер колонки INVNUMBER...  */

        ENPlanWorkDAO pDAO = new ENPlanWorkDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        //ENPlanWorkShortList pl = pDAO.getScrollableFilteredList(pf, 0, -1);
        //ENPlanWorkShortList pl = pDAO.getScrollableFilteredListWithOutDomain(pf, 0, -1);
        ENPlanWorkShortList pl = pDAO.getScrollableFilteredListNOSEGR(pf, 0, -1);

        if (pl.totalCount == 0){
            throw new EnergyproSystemException("Plan not found for ENAct.code=" + act.code);
        }else
        {
            //prevEcode = pl.get(0).elementRefCode;
        }

        for (int i = 0; i < pl.totalCount; i++)
        {
        if (prevEcode != pl.get(i).elementRefCode){
                //else
                prevEcode = pl.get(i).elementRefCode; // для МЕТРОЛОГИИ - один акт на абстр. эл. - и куча планов на разные Элементы

                System.out.println("START FOR planList, planCode = " + pl.get(i).code);

                /////// 10.08.10
                int eType = eLogic.getElementTypeByCode(prevEcode);
                //if (eType == ENElementType.METROLOGY_COUNTER)
                ///////

                if (eType == ENElementType.TY_BYT){
                    // для БЫТа инв номер в акте ...
                    Via_who = "инв.№ " + act.invNumber;
                }
                else
                {
                    Via_who = "инв.№ " + pl.get(i).invNumber;
                }
                FINMolDataFilter molFilter = new FINMolDataFilter();
                molFilter.act.code = act.code;
                FINMolDataShortList molList = molDAO.getScrollableFilteredList(molFilter,0,-1);
                String estimateKindCode = "" + Integer.MIN_VALUE;
                for (int n = 0; n < molList.totalCount; n++){

                	 int countDoc=1;
                     if (molList.get(n).molTypeRefCode == FINMolType.MASTER){
                         countDoc=2;
                     }

                    for (int cnt = 0;cnt < countDoc;cnt++)
                     {

                    actMaterials = false;
                    FINMolDataFilter molFilter_ = new FINMolDataFilter();
                    molFilter_.finMolCode = molList.get(n).finMolCode;
                    molFilter_.workOrder.code = pl.get(i).workOrderCode;

                    ///// 10.08.10
                    // !!! для всех, кроме метрологии, этот кусок кода будет выполняться только для первого из планов
                    // (pl.get(i).code - i всегда будет = 0) !!!
                    // а если еще в первом из планов нету МОЛа с кодом molList.get(n).finMolCode, то документ не создастся... !!!!!!!!!!
                    // Поэтому, если это не метрологический акт, то на molList_ вообще забиваем... ;-)
                    /////
                    // !!! пересмотреть ...
                    //molFilter_.conditionSQL = "finmoldata.workordercode in "+
                    //AS 28.01.2011 "(select p2.workordercode from enworkorder2enplanwork p2, enplanwork p where p.code = p2.plancode and p.code = "+
                    //"(select p2.workordercode from enworkorder2enplanwork p2 where p2.plancode = " + pl.get(i).code + " )";
                    //" and p.kindcode = " + ENPlanWorkKind.FACT + " )";

                    System.out.println("START FOR molDataList, finMolCode = " + molList.get(n).finMolCode);

                    //AS 28.01.2011 FINMolDataShortList molList_ = molDAO.getScrollableFilteredList(molFilter_,0,-1);
                    int[] molListArr_ = molDAO.getFilteredCodeArray(molFilter_,0,-1);

                    //if (molList_.totalCount > 0)
                    if (molListArr_.length > 0 || eType != ENElementType.METROLOGY_COUNTER) // <- забиваем на molList_ здесь (10.08.10)
                    {
                        int molDOC_300 = Integer.MIN_VALUE;
                        //int molDOC_330 = Integer.MIN_VALUE;
                        //int molDOC_331 = Integer.MIN_VALUE;
                        if(/*( pl.get(i).typeRefCode == ENPlanWorkType.WRITINGOFFPROTECTION ) &&*/
                        ( pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MBP || pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS))
                        {
                            opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_330, molList.get(n).molTypeRefCode);
                        }
                        else
                        if(/*( pl.get(i).typeRefCode == ENPlanWorkType.WRITINGOFFPROTECTION ) &&*/
                        ( pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MNMA ))
                        {
                            opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_331, molList.get(n).molTypeRefCode);
                        }
                        else
                        if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
                        {
                            opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_290, molList.get(n).molTypeRefCode);
                        } 
                        else
                        if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION)
                        {
                            opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_291, molList.get(n).molTypeRefCode);
                        } else if(isTechnicalMaintenance) {
                        	opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_66, molList.get(n).molTypeRefCode);
                        } else if(isCounters) {
                        	if(oz == null) {
                        		throw new SystemException(String.format("Не вдалося визначити ОЗ для акту з кодом %d", act.code));
                        	}
                        	boolean isAbonCounter = (oz.account == null || oz.account.trim().length() == 0);
                        	opType = getFINOperationCodeByTypeCode((isAbonCounter ? FINDocType.MOVE_66 : FINDocType.MOVE_266) , molList.get(n).molTypeRefCode);                        	
                        } else
                        {
                            opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_300, molList.get(n).molTypeRefCode);
                        }

                        if(isTechnicalMaintenance) {
                            /*09.11.2011 Для неналога в актах техобслуживания теперь перебьем виды операции - 301 будет 299,
                            * 300 - 298, согласно служебке от 26.10.2011*/

                            if(isAsset) {
                                if(!isTaxableAsset)
                                {
                                    switch(opType)
                                    {
                                    case FINDocType.v300:
                                        opType = FINDocType.v298;
                                        break;
                                    case FINDocType.v301:
                                        opType = FINDocType.v299;
                                        break;
                                    default:
                                        break;
                                    }
                                }
                            }

                        }

                        String condition;
                        String condition2;


                  //      {
                        //AS 18.03.2011 molDOC_300 = createDocThead(act.numberGen, act.dateGen, opType, molList.get(n).finMolCode, Integer.MIN_VALUE, userProfile.userName.toUpperCase(), Via_who);
                        molDOC_300 = fkLogic2.CreateDocument();
                        boolean isErr = true;
                        try
                        {
                            BigDecimal docSum = fkLogic2.getDocStrings();

                            if ((opType==com.ksoe.fin.valueobject.FINDocType.v290)&&(act.actTypeRef.code==com.ksoe.energynet.valueobject.ENPlanWorkState.WRITINGS_BUFET_REALIZATION || act.actTypeRef.code==com.ksoe.energynet.valueobject.ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)) //буфет
                            {
                            	/**NET-4284 USE_NDS */	BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, act.dateGen);
                            	fkLogic2.UpdateDocumentBufet(act.numberGen, opType, molList.get(n).finMolCode, molList.get(n).finMolCode, act.dateGen, docSum, Via_who,nds);
                            }
                            else
                            {
                            fkLogic2.UpdateDocumentShort(act.numberGen, opType, molList.get(n).finMolCode, molList.get(n).finMolCode, act.dateGen, docSum, Via_who);
                            }
                            fkLogic2.SaveDocument(molDOC_300);
                            isErr = false;
                        }
                        catch (Exception e){
                            //fkLogic2.Drop_Document(molDOC_300);
                            throw new EnergyproSystemException(e.getMessage());
                        }
                        finally
                        {
                            fkLogic2.CancelDocumentHackFK(isErr);
                        }

                        ////////// 10.08.10
                        if (eType != ENElementType.METROLOGY_COUNTER)
                        {
                            // т.к. кода плана у нас нет, вытягиваем коды нарядов по МОЛу
                            ENWorkOrderFilter wFilter = new ENWorkOrderFilter();
                            wFilter.statusWorkOrder.code = ENWorkOrderStatus.GOOD;
                            wFilter.conditionSQL = " enworkorder.code in (" +

                            // все такие ЕГО надо было оптимизировать ;) ....
                            //" select enworkorder2enplanwork.workordercode from enworkorder2enplanwork where enworkorder2enplanwork.plancode in " +
                            //" (select enact2enplanwork.plancode from enact2enplanwork where actrefcode = " + act.code + ")) " +
                            //" and enworkorder.code in " +
                            //" (select finmoldata.workordercode from finmoldata where finmoldata.finmolcode = '" + molList.get(n).finMolCode + "')";

                            "select enworkorder2enplanwork.workordercode from "+
                            " enworkorder2enplanwork, enact2enplanwork, finmoldata "+
                            "   where enworkorder2enplanwork.plancode = enact2enplanwork.plancode "+
                            "   and  enact2enplanwork.actrefcode = " + act.code +
                            "   and finmoldata.workordercode = enworkorder2enplanwork.workordercode "+
                            "   and finmoldata.finmolcode = '" + molList.get(n).finMolCode + "')";

                            System.out.println("START FOR workOrderList2, finMolCode = " + molList.get(n).finMolCode);

                            ENWorkOrderShortList wList = woDAO.getScrollableFilteredList(wFilter, 0,-1);
                            a2wCodes = new int[wList.totalCount];
                            for (int nnn = 0; nnn < wList.totalCount; nnn++){
                                FINDoc2Act2WorkOrder a2w = new FINDoc2Act2WorkOrder();
                                a2w.actRef.code = act.code;
                                a2w.workOrderRef.code = wList.get(nnn).code;
                                a2w.finDocCode300 = molDOC_300;
                                // тут надо закидывать коды в массив !!!
                                //a2wCode = a2wDAO.add(a2w);
                                a2wCode = a2wDAO.addNOSEGR(a2w);
                                a2wCodes[nnn] = a2wCode;
                            }

                            System.out.println("END FOR workOrderList2, finMolCode = " + molList.get(n).finMolCode);
                        } else {
                            FINDoc2Act2WorkOrder a2w = new FINDoc2Act2WorkOrder();
                            a2w.actRef.code = act.code;
                            a2w.workOrderRef.code = pl.get(i).workOrderCode;
                            a2w.finDocCode300 = molDOC_300;
                            //a2wCode = a2wDAO.add(a2w);
                            a2wCode = a2wDAO.addNOSEGR(a2w);
                        }
                        //////////

                        /* 10.08.10
                        FINDoc2Act2WorkOrder a2w = new FINDoc2Act2WorkOrder();
                        a2w.actRef.code = act.code;
                        a2w.workOrderRef.code = pl.get(i).workOrderCode;
                        a2w.finDocCode300 = molDOC_300;
                        a2wCode = a2wDAO.add(a2w);
                        */

                        //int docCode_300;

                        {
                            FINMaterialsFilter mFilter = new FINMaterialsFilter();

                            // один и тот же код МОЛА может быть у механика и мастера ...


                            if (molList.get(n).molTypeRefCode == FINMolType.MASTER){
                                estimateKindCode = ENEstimateItemKind.MATERIALS + ", " + ENEstimateItemKind.CUSTOMER_MATERIALS;
                            }
                            else if (molList.get(n).molTypeRefCode == FINMolType.MECHANIC){
                                estimateKindCode = "" + ENEstimateItemKind.GSM;
                            }
                            else {
                                // шоб левак не заехал .. пока
                                estimateKindCode = "" + Integer.MIN_VALUE;
                            }


                            mFilter.div_code = molList.get(n).finMolCode;


                            if (cnt==0) {
                            	condition=" where pi.kartarefcode in (" + ENConsts.TECHCARDS_CONSTS_ZKU + ") ";
                            	condition2=" and ((ei.planitemrefcode=pi.code and ei.kindrefcode<>"+ENEstimateItemKind.GSM+") or (ei.kindrefcode="+ENEstimateItemKind.GSM+")) ";
                            } else {
                            	condition=" where pi.kartarefcode not in (" + ENConsts.TECHCARDS_CONSTS_ZKU + ") ";
                            	condition2=" and ei.planitemrefcode=pi.code and ei.kindrefcode<>"+ENEstimateItemKind.GSM;
                            }

                            mFilter.statusRef.code = FINMaterialsStatus.GOOD;
                            mFilter.conditionSQL =
                            " finmaterials.estimateitemrefcode in ("+
                            //!!! пересмотреть ...
                            " select enestimateitem.code from enestimateitem where enestimateitem.kindrefcode in ("+ estimateKindCode +") and enestimateitem.planrefcode in ( "+
                            "  select enact2enplanwork.plancode from enact2enplanwork, enplanwork where enact2enplanwork.actrefcode = "+ act.code +
                            "    and enplanwork.code = enact2enplanwork.plancode and enplanwork.elementrefcode = " + prevEcode +
                            // доработанные заборт ...
                            (( act.actTypeRef.code == ENPlanWorkState.REFINEMENT_BY_CONTRACT ) ? " and enestimateitem.code not in (select eee.estimateitemcode from enmarkestimate eee where eee.markcode = " + ENMark.FOR_REFINEMENT + ")" : "" )+

                            ")"+
                            //разбивка на 2 документа
                            " and enestimateitem.code in ("+

                            " select ei.code "+
                            " from enestimateitem ei,enplanworkitem pi "+
                            " left join enact2enplanwork a2p on pi.planrefcode = a2p.plancode "+
                              condition +
                            " and pi.planrefcode=ei.planrefcode "+
                              condition2+
                            " and ei.countfact>0 "+
                            " and  a2p.actrefcode =  "+act.code+

                            ")"+

                            ")" +
                            ""
                            ;

                            mFilter.orderBySQL = "finmaterials.nn, finmaterials.code";

                            System.out.println("START FOR finMaterialsList2, finMolCode = " + molList.get(n).finMolCode);

                            FINMaterialsShortList mList = mDAO.getScrollableFilteredList(mFilter, 0, -1);

                            fkLogic2.OpenDocument(molDOC_300);
                            isErr = true;
                            try{

                            for (int j = 0; j < mList.totalCount; j++){
                                FINMaterials m = mDAO.getObject(mList.get(j).code);
                                ENEstimateItem ei = eDAO.getObject(m.estimateItemRef.code);

                                if (ei.kindRef.code == ENEstimateItemKind.CUSTOMER_MATERIALS) /* материалы заказчика проводим тем же 300-м */ {
                                    opType = 300;
                                }
                                errText = "(создание " + opType + ") ... № акта " + act.numberGen + " , номенклатура " + m.nn + ", кол-во " + m.quantity;
                                

                                    BigDecimal sumDoc = fkLogic2.getDocStrings();
                                    
                                    if(opType == FINDocType.v66) {
                                    	if(molOwnerObject != null && molDao.checkMolExists(molOwnerObject)) {
                                    		throw new SystemException(String.format("МВО з номером \"%s\" у підзвіті якого знаходиться "
                                    				+ "об'єкт виконаних робіт цього акту не знайдено у довіднику МВО програми \"Облік матеріалів\""
                                    				, molOwnerObject));
                                    	}
                                    }


                                if ((opType==com.ksoe.fin.valueobject.FINDocType.v290)&&(act.actTypeRef.code==com.ksoe.energynet.valueobject.ENPlanWorkState.WRITINGS_BUFET_REALIZATION || act.actTypeRef.code==com.ksoe.energynet.valueobject.ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)) //буфет
                                    {
                                	/**NET-4284 USE_NDS */	BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, act.dateGen);
                                    fkLogic2.UpdateDocumentBufet(
                                                act.numberGen,
                                                opType,
                                                m.div_code,
                                                m.div_code,
                                                act.dateGen,
                                                sumDoc,
                                                Via_who,
                                                nds
                                                );
                                    }
                                    else
                                    {
                                        fkLogic2.UpdateDocumentShort(
                                                act.numberGen,
                                                opType,
                                                m.div_code,
                                                (molOwnerObject != null) ? molOwnerObject : m.div_code,
                                                act.dateGen,
                                                sumDoc,
                                                Via_who
                                                );
                                    }
                                
                                
                                String kor_sch = m.bal_sch;
                                StringBuilder kor_kau = new StringBuilder(11);
                                kor_kau.append("00000000000");
                                if(isTechnicalMaintenance) {
                                	kor_kau.replace(2, 6, "5033");
                                    if(isAsset) {
                                    	if(isTaxableAsset) kor_kau.setCharAt(10, '1');
                                    	kor_sch = fkOsLogic.getLastKodZatrat(invNumber).substring(0, 4);
                                    } else {
                                    	if(isMNMA) {                              		
                                        	kor_sch = balansMNMA.balans.substring(0,4);
                                    	} else if(isByt) {
                                    		kor_sch = "2320";
                                    	}
                                    }	
                                }
                                if(isCounters) {
                                	SCUsageInputItem ozItem = usageInputItemDao.getObject(oz.usageInputItemRef.code);
                                	SCUsageInputItemOZ ozZku = null;
                                	if(ozItem.kindRef.code != SCUsageInputItemKind.UsageInputZKU) {
                                		ozZku = ozDao.getOZForUsageInputZKUByUsageInputOZ(oz);
                                	}
                                	kor_sch = actLogic.getCorrespondingAccountForOZ((ozZku != null && cnt == 0 ? ozZku : oz));
                                	kor_kau = new StringBuilder(actLogic.getCorrespondingCAAForOZ((ozZku != null && cnt == 0 ? ozZku : oz), actLogic.getConnectionKind(act.code) != Integer.MIN_VALUE));                     	
                                }
                                
                                TStringAdditionalParams params = new TStringAdditionalParams();
                                params.setKor_kau(kor_kau.toString());
                                params.setKor_sch(kor_sch);
                                params.setRest_purpose_id_from(m.rest_purpose_id);
                                params.setRest_purpose_id_to(m.rest_purpose_id);
                                

                                    stringCode = fkLogic2.addString(m, params);
                                    int red_rest = fkLogic2.check_red_rest(molDOC_300, stringCode, 0);

                                    if (red_rest != 0 ){
                                        throw new EnergyproSystemException("Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!! Ном. номер " + m.nn);
                                        //errText = "Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!! Залишок на кінець місяця " + matLastDay.quantity;
                                    }


                                //}
                                //catch (Exception e){
                                    //fkLogic2.CancelDocument();
                                //    throw new EnergyproSystemException(e.getMessage());
                                //}

                                actMaterials = true;
                            }

                            /* типа проверили при формировании Вывода
                            int red_rest = fkLogic2.check_red_rest(molDOC_300, Integer.MIN_VALUE, 0);

                            if (red_rest != 0 ){
                                throw new EnergyproSystemException("Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!!");
                                //errText = "Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!! Залишок на кінець місяця " + matLastDay.quantity;
                            }
                            */


                            BigDecimal sumDoc = fkLogic2.getDocStrings();


                            if ((opType==com.ksoe.fin.valueobject.FINDocType.v290)&&(act.actTypeRef.code==com.ksoe.energynet.valueobject.ENPlanWorkState.WRITINGS_BUFET_REALIZATION || act.actTypeRef.code==com.ksoe.energynet.valueobject.ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)) //буфет
                            {

                                FINMaterialsFilter fmFilter = new FINMaterialsFilter();
                                fmFilter.conditionSQL=" finmaterials.estimateitemrefcode in ( "+
                                " select ei.code "+
                                " from enestimateitem ei,enact2enplanwork ap "+
                                " where ei.planrefcode=ap.plancode "+
                                " and ap.actrefcode="+act.code+
                                " )    and finmaterials.statusrefcode=1 ";

                                FINMaterialsShortList fmList = mDAO.getScrollableFilteredList(fmFilter, 0, -1);
                                BigDecimal docSumNDS= new BigDecimal(0);

                                for (int k=0; k<fmList.totalCount; k++){
                                    docSumNDS=docSumNDS.add(fmList.get(k).cost_ext_nds);
                                }
                                /**NET-4284 USE_NDS */	BigDecimal nds = ol.getStandartKoefInPeriod(ENStandardConst.PDV, act.dateGen);
                                fkLogic2.UpdateDocumentBufetLast(
                                        act.numberGen,
                                        opType,
                                        molList.get(n).finMolCode,
                                        molList.get(n).finMolCode,
                                        act.dateGen,
                                        sumDoc,
                                        Via_who,
                                        docSumNDS,
                                        nds
                                        );


                            }
                            else
                            {

                            fkLogic2.UpdateDocumentShort(
                                act.numberGen,
                                opType,
                                molList.get(n).finMolCode,
                                (molOwnerObject != null) ? molOwnerObject : molList.get(n).finMolCode,
                                act.dateGen,
                                sumDoc,
                                Via_who
                                );
                            }

                            fkLogic2.SaveDocument(molDOC_300);

                            isErr = false;
                            }
                            catch (Exception e){
                            //fkLogic2.CancelDocument();
                            throw new EnergyproSystemException(errText + " \n " + e.getMessage());
                            }
                            finally
                            {
                                fkLogic2.CancelDocumentHackFK(isErr);
                            }

                    	    // Если акт проводится с применением ЭЦП, будем проводить под юзером energynet
                    		String userName = actLogic.getUserNameForFK(act.code);
                            fkLogic2.setUser4DOC(molDOC_300, userName);

                        	fkLogic2.alterSession(connection);
                        	fkLogic2.createRealtimeProv(molDOC_300);

                            System.out.println("END FOR finMaterialsList2, finMolCode = " + molList.get(n).finMolCode);

                        System.out.println("START removeDoc, finMolCode = " + molList.get(n).finMolCode);

                        if (actMaterials){
                            FINDoc2MolData f2m = new FINDoc2MolData();
                            f2m.finDocCode = molDOC_300;
                            if(/*( pl.get(i).typeRefCode == ENPlanWorkType.WRITINGOFFPROTECTION ) &&*/
                                    ( pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MBP || pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/))
                            {
                                f2m.finDocTypeRef.code = FINDocType.MOVE_61;
                            }
                            else
                            if(/*( pl.get(i).typeRefCode == ENPlanWorkType.WRITINGOFFPROTECTION ) &&*/
                                    ( pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MNMA ))
                            {
                                f2m.finDocTypeRef.code = FINDocType.MOVE_74;
                            }

                            else
                            if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
                            {
                                f2m.finDocTypeRef.code = FINDocType.MOVE_290;
                            }
                            else
                            if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION)
                            {
                                f2m.finDocTypeRef.code = FINDocType.MOVE_291;
                            }
                            if (isTechnicalMaintenance)
                            {
                                f2m.finDocTypeRef.code = FINDocType.MOVE_66;
                            }
                            else
                            {
                                // 01.12.2011 - разделим неналог (298, 299 виды операций - должны сохраняться FINDocType.MOVE_298)
                                if(opType == FINDocType.v298 || opType == FINDocType.v299)
                                    f2m.finDocTypeRef.code = FINDocType.MOVE_298;
                                else
                                    f2m.finDocTypeRef.code = FINDocType.MOVE_300;
                            }
                            f2m.molData.code = molList.get(n).code;


                            d2mDAO.add(f2m);

                        }
                        else{
                            if(/*( pl.get(i).typeRefCode == ENPlanWorkType.WRITINGOFFPROTECTION ) &&*/
                                    ( pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MBP || pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/))
                            {
                                opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_61, molList.get(n).molTypeRefCode);
                            }
                            else
                            if(/*( pl.get(i).typeRefCode == ENPlanWorkType.WRITINGOFFPROTECTION ) &&*/
                                    ( pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_MNMA ))
                            {
                                opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_74, molList.get(n).molTypeRefCode);
                            }

                            else
                            if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
                            {
                                opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_290, molList.get(n).molTypeRefCode);
                            }
                            else
                            if (pl.get(i).stateRefCode == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION)
                            {
                                opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_291, molList.get(n).molTypeRefCode);
                            }
                            else
                            {
                                opType = getFINOperationCodeByTypeCode(FINDocType.MOVE_300, molList.get(n).molTypeRefCode);
                            }

                            if (opType != 28) {
                                //AS 18.03.2011 removeDoc(molDOC_300, opType);
                                Date fk_date = getCurrentPeriodInFK();
                                if ((act.actTypeRef.code == ENPlanWorkState.WORK_IN_OUT) && fk_date.after(act.dateGen)) {
                                    fkLogic2.updateDateTHead(molDOC_300, fk_date);
                                }
                                fkLogic2.Drop_Document(molDOC_300);
                            }

                            // тут надо, в зависимости от типа эл-та (метрология/не метрология)
                            // удалять либо одну строку (по одному коду), либо бежать по массиву кодов !!!
                            if (eType != ENElementType.METROLOGY_COUNTER)
                            {
                                for (int a = 0; a < a2wCodes.length; a++){
                                    //a2wDAO.remove(a2wCodes[a]);
                                    a2wDAO.removeNOSEGR(a2wCodes[a]);
                                }
                            }
                            else
                            {
                                //a2wDAO.remove(a2wCode);
                                a2wDAO.removeNOSEGR(a2wCode);
                            }
                        }

                        System.out.println("END removeDoc, finMolCode = " + molList.get(n).finMolCode);

                    }

                    System.out.println("END FOR molDataList, finMolCode = " + molList.get(n).finMolCode);
                }
           }
         //end cicle counter&&zku

        } // если коды елеметов НЕ равны ...
        } // пока планы на акте


        ///////////////////////
        //
        // доработанные мат-лы ....
        //
        int doc40 = Integer.MIN_VALUE;

        int finMolDataCode = Integer.MIN_VALUE;


        ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
        eFilter.kindRef.code = ENEstimateItemKind.REFINEMENT;
        eFilter.conditionSQL = "enestimateitem.planrefcode in (" + plansInAct + ") and enestimateitem.countfact <> 0";
        ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter, 0, -1);

        if(eList.totalCount == 0 && act.actTypeRef.code == ENPlanWorkState.REFINEMENT && act.element.typeRef.code != ENElementType.METROLOGY_OBJECT)
            throw new EnergyproSystemException("Не знайдено дороблених матеріалів");

        if (eList.totalCount > 0)
        {
            FINMolDataFilter fmdFilter = new FINMolDataFilter();
            fmdFilter.act.code = act.code;
            fmdFilter.molTypeRef.code = FINMolType.MASTER;
            int[] fmdArr = molDAO.getFilteredCodeArray(fmdFilter, 0, -1);
            if (fmdArr.length != 1){
                throw new EnergyproSystemException("Не знайдено данних про МВО при 400-40 операціях ...");
            }
            finMolDataCode = fmdArr[0];
        }

        for (i=0; i < eList.totalCount; i++){

            FINMaterialsFilter fmFilter = new FINMaterialsFilter();
            fmFilter.estimateItemRef.code = eList.get(i).code;
            fmFilter.statusRef.code = FINMaterialsStatus.GOOD;
            int[] fmArr = mDAO.getFilteredCodeArray(fmFilter, 0, -1);
            if (fmArr.length != 1){
                throw new EnergyproSystemException("Не знайдено матеріал ПІСЛЯ ДОРОБКИ ...");
            }

            ENEstimateItemFilter eFilter1 = new ENEstimateItemFilter();
            eFilter1.kindRef.code = ENEstimateItemKind.MATERIALS;
            eFilter1.planRef.code = eList.get(i).planRefCode;
            eFilter1.planItemRef.code = eList.get(i).planItemRefCode;
            eFilter1.materialRef.code = eList.get(i).materialRefCode;
            eFilter1.conditionSQL = "enestimateitem.countfact <> 0";
            // еще бы по чемунибудь искать .. шоб поточнее было ;))
            int[] e1Arr = eDAO.getFilteredCodeArray(eFilter1, 0, -1);
            if (e1Arr.length != 1){
                if (e1Arr.length > 1) {
                throw new EnergyproSystemException(
                    "Знайдено декілька однакових нормативних матеріалів " + "\n" +
                    "ДО ДОРОБКИ: " + eList.get(i).materialRefName);
                };
                throw new EnergyproSystemException("Не знайдено матеріал ДО ДОРОБКИ ...");
            }

            FINMaterialsFilter fmFilter1 = new FINMaterialsFilter();
            fmFilter1.estimateItemRef.code = e1Arr[0];
            fmFilter1.statusRef.code = FINMaterialsStatus.GOOD;
            int[] fmArr1 = mDAO.getFilteredCodeArray(fmFilter1, 0, -1);
            if (fmArr1.length != 1){
                throw new EnergyproSystemException("Не знайдено матеріал до ДОРОБКИ ...");
            }

            FINMaterials fm = mDAO.getObject(fmArr[0]);
            FINMaterials fm1 = mDAO.getObject(fmArr1[0]);

            if (fm.quantity.doubleValue() != fm1.quantity.doubleValue()){
                throw new EnergyproSystemException("Не співпадає кількість матеріалу до та після доробки ...");
            }


            // Создание документа 40го вида операции

                    FINDoc2MolData d2m = new FINDoc2MolData();

                    doc40 = fkLogic2.CreateDocument();
                    boolean isErr = true;
                    try
                    {
                        opType = FINDocType.V_40;
                        BigDecimal docSum = fkLogic2.getDocStrings();
                        fkLogic2.UpdateDocumentShort(act.numberGen, opType, fm.div_code, fm.div_code, act.dateGen, docSum, Via_who);
                        fkLogic2.SaveDocument(doc40);
                        isErr = false;
                    }
                    catch (Exception e){
                        //fkLogic2.Drop_Document(molDOC_300);
                        throw new EnergyproSystemException(e.getMessage());
                    }
                    finally
                    {
                        fkLogic2.CancelDocumentHackFK(isErr);
                    }

                    d2m = new FINDoc2MolData();
                    d2m.molData.code = finMolDataCode;
                    d2m.finDocCode = doc40;
                    d2m.finDocTypeRef.code = FINDocType.MOVE_40;
                    d2mDAO.add(d2m);


                // добавим строки 40го документа

                fkLogic2.OpenDocument(doc40);
                isErr = true;
                try{

                    BigDecimal sumDoc = fkLogic2.getDocStrings();

                    stringCode = fkLogic2.addString(fm, fm.rest_purpose_id, fm.rest_purpose_id );

                    sumDoc = fkLogic2.getDocStrings();
                    opType = FINDocType.V_40;
                    fkLogic2.UpdateDocumentShort(
                        act.numberGen,
                        opType,
                        fm.div_code,
                        fm.div_code,
                        act.dateGen,
                        sumDoc,
                        Via_who
                        );

                    fkLogic2.SaveDocument(doc40);
                    isErr = false;
                }
                catch (Exception e){
                    //fkLogic2.Drop_Document(molDOC_300);
                    throw new EnergyproSystemException(e.getMessage());
                }
                finally
                {
                    fkLogic2.CancelDocumentHackFK(isErr);
                }

                PartyFilter partyFilter = new PartyFilter();
                partyFilter.doc_id = doc40;
                partyFilter.Doc_str_id = stringCode;
                int[] partyArr = partyDAO.getFilteredCodeArray(partyFilter, 0, -1);
                if (partyArr.length != 1){
                    throw new EnergyproSystemException("Партія не знайдена ...");
                }
        }

	    // Если акт проводится с применением ЭЦП, будем проводить под юзером energynet
		String userName = actLogic.getUserNameForFK(act.code);
        fkLogic2.setUser4DOC(doc40, userName);


        System.out.println("END createDOCFromActWithoutVivodZKU, actCode = " + act.code);

        // System.gc();

        }
        }
        finally{
            try
            {
                if (energyNetConnection != null && ! energyNetConnection.isClosed()){
                    energyNetConnection.close();
                    energyNetConnection = null;
                }
            } catch (SQLException e) {}
        }
    }






/* преливка кривых резервов и выводов
 *

    public void createDOCFromAct2_(ENAct act) throws PersistenceException, DatasourceConnectException
    {

        ENEstimateItemDAO eDAO = new ENEstimateItemDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINMaterialsDAO mDAO = new FINMaterialsDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

        //validateDocDate(act.dateGen); // проверим даты ..
        // для АКТА вообще ...
        boolean isMaterialsMOL = false;
        boolean isMaterialsMechanic = false;
        // для каждого НарядА
        boolean isMaterialsMOLWO = false;
        boolean isMaterialsMechanicWO = false;
        boolean isUsingMaterials = false;

        ENActDAO actDAO = new ENActDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        ENActFilter af = new ENActFilter();
        //af.code = 45000465;

        af.conditionSQL = "" +
        "enact.code in (select a.code from enact a where "+
        "a.dateedit = '13.07.2010' and a.statusrefcode = 3 "+
        "and a.code in ( select finmoldata.actcode from finmoldata, findoc2moldata where finmoldata.code = findoc2moldata.moldatacode "+
        "and finmoldata.actcode = a.code    ))";

        ENActShortList al = actDAO.getScrollableFilteredList(af,0,-1);
        FINMolLogic molLogic = new FINMolLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

for (int zz = 0; zz < al.totalCount; zz++){


        String Via_who = userProfile.userName.toUpperCase() + " (" + new SimpleDateFormat("dd.MM.yyyy").format(al.get(zz).dateGen).toString() +")" ;

        ENWorkOrderDAO woDAO = new ENWorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        ENWorkOrderFilter woFilter = new ENWorkOrderFilter();
        woFilter.statusWorkOrder.code = ENWorkOrderStatus.GOOD;
        //woFilter.code = 45000465;

        woFilter.conditionSQL = " enworkorder.code in ("+
        " select enworkorder2enplanwork.workordercode from enworkorder2enplanwork where enworkorder2enplanwork.plancode in ("+
        "select enact2enplanwork.plancode from enact2enplanwork where actrefcode = "+ al.get(zz).code +
        "))";

        String enDocNumber= "";
        int prev_purpose_id, work_order_purpose_id;
        ENWorkOrderShortList woList = woDAO.getScrollableFilteredList(woFilter, 0,-1);

        FINDoc2MolDataDAO d2mDAO = new FINDoc2MolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINMolDataDAO molDAO = new FINMolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        int opType;
        int doc304;
        int doc28_304;

        for (int n = 0; n < woList.totalCount; n++){

            FINDoc2MolDataFilter d2mFilter = new FINDoc2MolDataFilter();
            d2mFilter.conditionSQL = "findoc2moldata.moldatacode in (select finmoldata.code from finmoldata where finmoldata.workordercode =" + woList.get(n).code +" )";
            FINDoc2MolDataShortList d2mList = d2mDAO.getScrollableFilteredList(d2mFilter,0,-1);
            for (int zzz=0; zzz < d2mList.totalCount; zzz++){
                removeDocEntrys(d2mList.get(zzz).finDocCode);
                updateDocSum(d2mList.get(zzz).finDocCode);
            }

            FINMaterialsFilter fFilter = new FINMaterialsFilter();
            fFilter.statusRef.code = FINMaterialsStatus.GOOD;
            fFilter.conditionSQL = "finmaterials.code in (" +
                    "select fm.code from "+
                    "finmaterials fm, enworkorder2enplanwork w2p, enestimateitem e "+
                    " where w2p.workordercode = " + woList.get(n).code +
                    " and w2p.plancode = e.planrefcode and fm.estimateitemrefcode = e.code and fm.statusrefcode = 1)";
            FINMaterialsShortList fList = mDAO.getScrollableFilteredList(fFilter,0,-1);
            for (int zzz=0; zzz<fList.totalCount; zzz++){
                FINMaterials fff = mDAO.getObject( fList.get(zzz).code );
                FINMolData mol = molDAO.getObject(fff.molDataRef.code);
                int finDocCode_28 = molLogic.getFINDocCodeByWorkOrderCode( fff.molDataRef.code, FINDocType.MOVE_28_302);
                int finDocCode_302 = molLogic.getFINDocCodeByWorkOrderCode( fff.molDataRef.code, FINDocType.MOVE_302);
                int opType_ = getFINOperationCodeByTypeCode(FINDocType.MOVE_302, mol.molTypeRef.code);

                createDocEntry(fff, opType_, finDocCode_302, Integer.MIN_VALUE);
                fff.rest_purpose_id = 2075;
                createDocEntry(fff, 28, finDocCode_28, Integer.MIN_VALUE);
                updateDocSum(finDocCode_302);
                updateDocSum(finDocCode_28);
            }

            // -------------------------

            enDocNumber = woList.get(n).workOrderNumber;
            work_order_purpose_id = getRestPurposeCodeByWorkOrderNumber(woList.get(n).workOrderNumber);


            //FINMolDataFilter molFilter = new FINMolDataFilter();
            //molFilter.workOrder.code = woList.get(n).code;
            //FINMolDataShortList molList = molDAO.getScrollableFilteredList(molFilter, 0, -1);


            ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
            eFilter.conditionSQL = " enestimateitem.planrefcode in ( "+
                                "  select enworkorder2enplanwork.plancode from enworkorder2enplanwork where enworkorder2enplanwork.workordercode = "+ woList.get(n).code +
                                ") and enestimateitem.kindrefcode <> " + ENEstimateItemKind.UNMOUNT; // все материалы кроме демонтированных
            ENEstimateItemShortList eList = eDAO.getScrollableFilteredList(eFilter,0,-1);
            int docCode_304, docCode_28;
            //int docMehCode;
            for (int i = 0; i < eList.totalCount; i++){

                FINMaterialsFilter mFilter = new FINMaterialsFilter();
                mFilter.statusRef.code = FINMaterialsStatus.GOOD;
                mFilter.estimateItemRef.code = eList.get(i).code;


                FINMaterialsShortList mList = mDAO.getScrollableFilteredList(mFilter, 0, -1);
                for (int j = 0; j < mList.totalCount; j++){

                    FINMaterials m = mDAO.getObject(mList.get(j).code);
                    FINMolData molData = molDAO.getObject(m.molDataRef.code);
                    int[] docArr = molLogic.getFINDocCodesByMOLDataCodeForOUT(m.molDataRef.code, FINDocType.MOVE_304);
                    int opType_ = getFINOperationCodeByTypeCode(FINDocType.MOVE_304, molData.molTypeRef.code );
                    prev_purpose_id = m.rest_purpose_id;
                    m.rest_purpose_id = work_order_purpose_id;
                    createDocEntry(m, opType_, docArr[0], Integer.MIN_VALUE);
                    updateDocSum(docArr[0]);
                    m.rest_purpose_id = prev_purpose_id;
                    createDocEntry(m, 28, docArr[1], Integer.MIN_VALUE);
                    updateDocSum(docArr[1]);
                } // пока развязанные материалы
            } // пока нормативные материалы



        } // пока идут НАРЯДЫ .. на планах этого АКТА

}
    }


    /**
    *
    * Функция вставки документа в Фин. коллекции с наряд-задания в EnergyNet'e
    *
    * @param workOrder объект ENWorkOrder
    * @param molData объект FINMolData
    * @param isProv - функция вызывается при проведении или отмене <b>true</b> - да <b>false</b> - нет.
    * Если <b>true</b>, то разрешается работа с документами закрытых периодов
    * @throws PersistenceException
    * @throws DatasourceConnectException
    */
    public void createDOCFromENWorkOrder2(ENWorkOrder workOrder, FINMolData molData, boolean isProv) throws PersistenceException, DatasourceConnectException
    {
    	Connection enConn = null;
        Connection authConn = null;
        try {
            enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);

            PlanWorkLogic planLogic = new PlanWorkLogic(enConn, userProfile);
            ENPlanWork plan = planLogic.getPlanByWorkOrderCode(workOrder.code);
            mDaxLogic mdLogic = new mDaxLogic(enConn, userProfile);
            AXTransactionsLogic axLogic = new AXTransactionsLogic(enConn, userProfile);
            AuthLogic netAuth = new AuthLogic(authConn, userProfile);
            int writeOffTmcConf = netAuth.checkUsesDataForWriteOff();



        // типа может вызываться для создания связки после удаления акта(300)
        // если поля - ИнтМинВалюе - значит документ ушел краями - не было Ентри ...
        // и при попытке разнести материалы - надо пересоздать наряд ...
        // подлечим проверкой и обновлением существующих ...

        //FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINDoc2MolDataDAO d2mDAO = new FINDoc2MolDataDAO(enConn, userProfile);


//        if(!isProv) // только не при отмене проведения
//            validateDocDate(workOrder.dateGen); // проверим даты ..

        String Via_who = userProfile.userName.toUpperCase() + " (" + new SimpleDateFormat("dd.MM.yyyy").format(workOrder.dateGen).toString() +")" ;

        int operationType = Integer.MIN_VALUE;

        if (molData.molTypeRef.code == FINMolType.MASTER){
            // 02.12.11 if (plan.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION){
            if (plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP
            		|| plan.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
            		|| plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/)
            {
                operationType = 332;
            }
            else
            if (plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION ||plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
            {
                operationType = 292;
            }
            else
            {
                operationType = 302;
            }
            //mmmmmm
            //operationType2_ = FINDocType.MOVE_28_302;;
        }
        else
        if (molData.molTypeRef.code == FINMolType.MECHANIC){
                operationType = 303;
        }
        else{
            throw new EnergyproSystemException("Неопределенный тип МОЛа :" + molData.molTypeRef.code);
        }


        //AS 18.03.2011 int molDOC = createDocThead(workOrder.workOrderNumber, workOrder.dateGen , operationType, molData.finMolCode, Integer.MIN_VALUE, "ENERGYNET", Via_who);

        boolean isErr = true;






		FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);
        int molDOC = Integer.MIN_VALUE;

        try{

         molDOC = fkLogic2.CreateDocument();
        //BigDecimal docSum = new BigDecimal(0);
        BigDecimal docSum = fkLogic2.getDocStrings();

        // Если отменяется проведение, то
        // для работы с документами других периодов перебивается creator_task_code
        if(isProv)
        {
            fkLogic2.setCreator("E");
            fkLogic2.setCreatorTHead(molDOC,"E");
        }

        fkLogic2.UpdateDocumentShort(
                workOrder.workOrderNumber,
                operationType,
                molData.finMolCode,
                molData.finMolCode,
                workOrder.dateGen,
                docSum,
                Via_who
        );

        fkLogic2.SaveDocument(molDOC);
        isErr = false;
        }
        catch (Exception e){
            System.out.println("error in FK :" + userProfile.userName);
            System.out.println("workOrder # :" + workOrder == null ? "--" : workOrder.workOrderNumber);
            System.out.println("mol # :" + molData == null ? "--" : molData.finMolCode);
            //типа КАНЦЕЛ сделает вынос документа ... fkLogic2.Drop_Document(molDOC);
            throw new EnergyproSystemException(e.getMessage());
        }

        finally
        {
            if(isProv)
            {
            	if(molDOC != Integer.MIN_VALUE){
                    fkLogic2.setCreator("2");
                    fkLogic2.setCreatorTHead(molDOC,"2");
            	}
            }
            fkLogic2.CancelDocumentHackFK(isErr);
        }

        /*
        int finDOCCode = fkLogic2.CreateDocument();
        boolean isErr = true;

        try
        {
            fkLogic2.UpdateDocumentShort4Unmount(act.numberGen, FINDocType.v20 , m.div_code, m.div_code, act.dateGen, new BigDecimal(0), "инв.№ " + el.objectInvNumber);
            fkLogic2.SaveDocument(finDOCCode);
            isErr = false;
        }
        catch (Exception e){
            //fkLogic2.Drop_Document(docArr[0]);
            throw new EnergyproSystemException(e.getMessage());
        }
        finally
        {
            fkLogic2.CancelDocumentHackFK(isErr);
        }
*/

/*
        // вдруг НЕТ механика ...
        int mechanicDOC = Integer.MIN_VALUE;
        if (workOrder.finMechanicCode != ""){
            //mechanicDOC = createDocMoveToReserve(workOrder, 303, workOrder.finMechanicCode, Integer.MIN_VALUE);
            mechanicDOC = createDocThead(workOrder.workOrderNumber, workOrder.dateGen , 303, workOrder.finMechanicCode, Integer.MIN_VALUE, "ENERGYNET", Via_who);
        }
*/
        //int molDOC2 = createDocMoveToReserve(workOrder, 28, workOrder.finMolCode, molDOC);
        //AS 18.03.2011 int molDOC2 = createDocThead(workOrder.workOrderNumber, workOrder.dateGen, 28, molData.finMolCode, molDOC, "ENERGYNET", Via_who);

/*
        // вдруг НЕТ механика ...
        int mechanicDOC2 = Integer.MIN_VALUE;
        if (workOrder.finMechanicCode != ""){
            //mechanicDOC2 = createDocMoveToReserve(workOrder, 28, workOrder.finMechanicCode, mechanicDOC);
            mechanicDOC2 = createDocThead(workOrder.workOrderNumber, workOrder.dateGen, 28, workOrder.finMechanicCode, mechanicDOC, "ENERGYNET", Via_who);
        }
*/

        // ympMDAX MDAXWriteOff
         String journalIdmDAX = "";

         if (writeOffTmcConf == 1 || writeOffTmcConf == 2) {
        	 if (axLogic.aifttsCheckOpen()) {
        		 journalIdmDAX = mdLogic.createDocumentForWriteOffTMC(workOrder.workOrderNumber , workOrder.dateGen ,  ""+operationType , molData.finMolCode );
        	 } else
        	 {
        		 throw new EnergyproSystemException("\n(createDOCFromENWorkOrder2) \n Не найдена активная транзакция для пользователя " + axLogic.getUserSecurity().userName + " !!! ");
        	 }

         }

        // сохраним в НЕТ развязки ...

        FINDoc2MolData docObj = new FINDoc2MolData();
        docObj.finDocCode = molDOC;
        docObj.molData.code = molData.code;
        //if (plan.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION){
        if (plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP
        		|| plan.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
        		|| plan.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/)
        {
            docObj.finDocTypeRef.code = FINDocType.MOVE_332;    // если списание МБП или МНМА
        }
        else
        if (plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || plan.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        {
            docObj.finDocTypeRef.code = FINDocType.MOVE_292;
        }
        else
        {
            docObj.finDocTypeRef.code = FINDocType.MOVE_302;
        }


        // mDAX journalIdmDAX  код журнала AX
        if ((writeOffTmcConf == 1 || writeOffTmcConf == 2 ) && journalIdmDAX.equals("") ) {
        	throw new EnergyproSystemException(" Помилка при складанні журналу в mDAX !!! ");
        }
        docObj.axJournalId = journalIdmDAX;
        d2mDAO.add(docObj);

        /* AS 18.03.2011
        docObj = null;
        docObj = new FINDoc2MolData();
        docObj.finDocCode = molDOC2;
        docObj.molData.code = molData.code;
        docObj.finDocTypeRef.code = FINDocType.MOVE_28_302;
        d2mDAO.add(docObj);
        */

        //FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
/*
        FINDoc2WorkOrder f2w = new FINDoc2WorkOrder();
        f2w.finDocMOLCode = molDOC;
        f2w.finDocMechanicCode = mechanicDOC;
        f2w.typeRef.code = FINDocType.MOVE_302;
        f2w.workOrderRef.code = workOrder.code;
        f2wDAO.add(f2w);

        f2w = null;

        f2w = new FINDoc2WorkOrder();
        f2w.finDocMOLCode = molDOC2;
        f2w.finDocMechanicCode = mechanicDOC2;
        f2w.typeRef.code = FINDocType.MOVE_28_302;
        f2w.workOrderRef.code = workOrder.code;
        f2wDAO.add(f2w);
*/

        }
        finally{
            try
            {
            	if (enConn != null && !enConn.isClosed()) {
                    enConn.close();
                    enConn = null;
                }
            } catch (SQLException e) {}
        }
    }

    /**
     *
     * Метод для заполнения финколлекционного документа материалами из нета
     *
     * @param woObj наряд-задание
     * @param molObj объект мол-дата
     * @param operationType вид документа, если Integer.MIN_VALUE, то заполняются все документы связанные с мол-датой
     * @throws PersistenceException
     * @throws DatasourceConnectException
     */
	public void fillFinDoc(ENWorkOrder woObj, FINMolData molObj, int operationType) throws PersistenceException, DatasourceConnectException {
		// вставка материалов в документ на резервирование
		FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);
		FINMaterialsDAO mDAO = new FINMaterialsDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
		FINDoc2MolDataDAO f2mDAO = new FINDoc2MolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

		FINDoc2MolDataFilter d2mFilter = new FINDoc2MolDataFilter();
		d2mFilter.molData.code = molObj.code;
		if (operationType != Integer.MIN_VALUE) {
			d2mFilter.finDocTypeRef.code = operationType;
		}
		FINDoc2MolDataShortList d2mList = f2mDAO.getScrollableFilteredList(d2mFilter, 0, -1);
		for (int nnn = 0; nnn < d2mList.totalCount; nnn++) {
			FINMaterialsFilter mFilter = new FINMaterialsFilter();
			mFilter.molDataRef.code = molObj.code;
			mFilter.statusRef.code = FINMaterialsStatus.GOOD;
			String condition = "select e.code from enestimateitem e where e.kindrefcode = " + ENEstimateItemKind.GSM
					+ " or e.kindrefcode = " + ENEstimateItemKind.MATERIALS + " or e.kindrefcode = "
					+ ENEstimateItemKind.CUSTOMER_MATERIALS + " ";
			mFilter.conditionSQL = " finmaterials.estimateitemrefcode in (" + condition + ")";
			FINMaterialsShortList mList = mDAO.getScrollableFilteredList(mFilter, 0, -1);

			boolean isErr = true;
			try {
				fkLogic2.setCreator("E");
				fkLogic2.OpenDocument(d2mList.get(0).finDocCode);
				for (int nnnn = 0; nnnn < mList.totalCount; nnnn++) {
					FINMaterials m = mDAO.getObject(mList.get(nnnn).code);
					int tstringCode = fkLogic2.addString(m, m.rest_purpose_id, RQConsts.REST_PURPOSE_ID_RESERVE);

					if (tstringCode != m.finDocItemCode) {
						long old_modify_time = m.modify_time;
						m.finDocItemCode = tstringCode;
						mDAO.save(m);
						mDAO.updateModify_time(m.code, old_modify_time);
					}

					// Проверка красных остатков
					int red_rest = fkLogic2.check_red_rest(d2mList.get(0).finDocCode, tstringCode, 0);
					if (red_rest != 0)
						throw new EnergyproSystemException(
								"Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!! Номенклатура "
										+ m.nn + " № наряд-завдання " + woObj.workOrderNumber);

				}

				// Сумма строк открытого документа
				BigDecimal docSum = fkLogic2.getDocStrings();

				String Via_who = userProfile.userName.toUpperCase() + " ("
						+ new SimpleDateFormat("dd.MM.yyyy").format(woObj.dateGen).toString() + ")";

				int opTypeForReserv = getFINOperationCodeByTypeCode(d2mList.get(0).finDocTypeRefCode,
						d2mList.get(0).molDataTypeRefCode);

				fkLogic2.setCreatorTHead(d2mList.get(0).finDocCode, "E");
				fkLogic2.UpdateDocumentShort(woObj.workOrderNumber, opTypeForReserv, molObj.finMolCode,
						molObj.finMolCode, woObj.dateGen, docSum, Via_who);
				fkLogic2.SaveDocument(d2mList.get(0).finDocCode);
				isErr = false; // если было достигнуто это место, значит ошибки
								// не было
			} catch (Exception e) {
				throw new EnergyproSystemException("Обратное создание документа на резервирование: " + e.getMessage());
			} finally {
				fkLogic2.CancelDocumentHackFK(isErr);
				fkLogic2.setCreator("2");
				fkLogic2.setCreatorTHead(d2mList.get(0).finDocCode, "2");
			}

		}
	}


    // добавление НАРЯД-ЗАДАНИЯ ...
    public void createDOCFromENWorkOrder(ENWorkOrder workOrder) throws PersistenceException, DatasourceConnectException
    {

        // типа может вызываться для создания связки после удаления акта(300)
        // если поля - ИнтМинВалюе - значит документ ушел краями - не было Ентри ...
        // и при попытке разнести материалы - надо пересоздать наряд ...
        // подлечим проверкой и обновлением существующих ...
        FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
/*
        FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINDoc2WorkOrderFilter f2wFilter = new FINDoc2WorkOrderFilter();
        f2wFilter.workOrderRef.code = workOrder.code;
        FINDoc2WorkOrderShortList f2wList = f2wDAO.getScrollableFilteredList(f2wFilter,0,-1);
*/

        validateDocDate(workOrder.dateGen); // проверим даты ..
        // это можно сделать уже при добавлении СТРОКИ документа ...
        //int restPurposeCode = getRestPurposeCodeByWorkOrderNumber(workOrder.workOrderNumber);

        //int molDOC = createDocMoveToReserve(workOrder, 302, workOrder.finMolCode, Integer.MIN_VALUE);
        String Via_who = userProfile.userName.toUpperCase() + " (" + new SimpleDateFormat("dd.MM.yyyy").format(workOrder.dateGen).toString() +")" ;

        PlanWorkLogic planWorkLogic = new PlanWorkLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        ENPlanWork planWork = planWorkLogic.getPlanByWorkOrderCode(workOrder.code);

        int molDOC;

        // 02.12.11 if (planWork.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION){
        if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/)
        {
            molDOC = createDocThead(workOrder.workOrderNumber, workOrder.dateGen , 332, workOrder.finMolCode, Integer.MIN_VALUE, "ENERGYNET", Via_who);
        }
        else
        if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        {
            molDOC = createDocThead(workOrder.workOrderNumber, workOrder.dateGen , 292, workOrder.finMolCode, Integer.MIN_VALUE, "ENERGYNET", Via_who);
        }
        else
        {
            molDOC = createDocThead(workOrder.workOrderNumber, workOrder.dateGen , 302, workOrder.finMolCode, Integer.MIN_VALUE, "ENERGYNET", Via_who);
        }

        // вдруг НЕТ механика ...
        int mechanicDOC = Integer.MIN_VALUE;
        if (workOrder.finMechanicCode != ""){
            //mechanicDOC = createDocMoveToReserve(workOrder, 303, workOrder.finMechanicCode, Integer.MIN_VALUE);
            mechanicDOC = createDocThead(workOrder.workOrderNumber, workOrder.dateGen , 303, workOrder.finMechanicCode, Integer.MIN_VALUE, "ENERGYNET", Via_who);
        }

        //int molDOC2 = createDocMoveToReserve(workOrder, 28, workOrder.finMolCode, molDOC);
        int molDOC2 = createDocThead(workOrder.workOrderNumber, workOrder.dateGen, 28, workOrder.finMolCode, molDOC, "ENERGYNET", Via_who);

        // вдруг НЕТ механика ...
        int mechanicDOC2 = Integer.MIN_VALUE;
        if (workOrder.finMechanicCode != ""){
            //mechanicDOC2 = createDocMoveToReserve(workOrder, 28, workOrder.finMechanicCode, mechanicDOC);
            mechanicDOC2 = createDocThead(workOrder.workOrderNumber, workOrder.dateGen, 28, workOrder.finMechanicCode, mechanicDOC, "ENERGYNET", Via_who);
        }

        // сохраним в НЕТ развязки ...
        //FINDoc2WorkOrderDAO f2wDAO = new FINDoc2WorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINDoc2WorkOrder f2w = new FINDoc2WorkOrder();
        f2w.finDocMOLCode = molDOC;
        f2w.finDocMechanicCode = mechanicDOC;
        //if (planWork.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION)
        if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS)
        {
            f2w.typeRef.code = FINDocType.MOVE_332;
        }
        else
        if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        {
            f2w.typeRef.code = FINDocType.MOVE_292;
        }
        else
        {
            f2w.typeRef.code = FINDocType.MOVE_302;
        }
        f2w.workOrderRef.code = workOrder.code;
        f2wDAO.add(f2w);

        f2w = null;

        f2w = new FINDoc2WorkOrder();
        f2w.finDocMOLCode = molDOC2;
        f2w.finDocMechanicCode = mechanicDOC2;
        //if (planWork.typeRef.code == ENPlanWorkType.WRITINGOFFPROTECTION){
        if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP
        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MNMA
        		|| planWork.stateRef.code == ENPlanWorkState.WRITINGS_MBP_INSTRUMENTS /*SUPP-13237*/)
        {
            f2w.typeRef.code = FINDocType.MOVE_28_332;
        }
        else
        if (planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_NONEREALIZATION || planWork.stateRef.code == ENPlanWorkState.WRITINGS_BUFET_REALIZATION_BEZNAL)
        {
            f2w.typeRef.code = FINDocType.MOVE_28_292;
        }
        else
        {
            f2w.typeRef.code = FINDocType.MOVE_28_302;
        }
        f2w.workOrderRef.code = workOrder.code;
        f2wDAO.add(f2w);

    }


    // получает след значение сиквенса из переменной sqName
    private int getFINPKCode(String sqName) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        int outCode = Integer.MIN_VALUE;

        String getPKCode = "select "+ sqName +".nextval from dual";

        try
        {
            statement = connection.prepareStatement(getPKCode);
            set = statement.executeQuery();
            if ( ! set.next() )
                throw new PersistenceException("Can't get PK code for " + sqName + " :" + getPKCode);
                else
                {
                    //obj.finDocCode = set.getInt(1);
                    outCode = set.getInt(1);
                }
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + getPKCode);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
        return outCode;
    }


    private int getDOC_ID_from_doc_reg_mirror__(int headID) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;
        String SQL = "select doc_id from umc_dba.doc_reg_mirror where head_id = ?";
        int docs_reestr_Code = Integer.MIN_VALUE;
        try
        {
            statement = connection.prepareStatement(SQL);
            statement.setInt(1,headID);
            set = statement.executeQuery();
            if ( ! set.next() ){
                // если нету - 28 операция ... дока НЕту
                //throw new EnergyproSystemException("Not found umc_dba.doc_reg_mirror. head_id =" + headID );
            }
                else
                {
                    docs_reestr_Code = set.getInt(1);
                }
            //saveToLog("getDOC_ID_from_doc_reg_mirror", SQL + ":" + headID);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + SQL);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        return docs_reestr_Code;

    }

    /*
    * удаляет все Ентри акта из ФинКол
    */
    public void removeDocEntrys(int finDocCode)   throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        String delete_umc_dba_tstringSQL = "delete from umc_dba.tstring where head_id = ?";

        try
        {
            statement = connection.prepareStatement(delete_umc_dba_tstringSQL);
            statement.setInt(1,finDocCode);
            set = statement.executeQuery();
            //saveToLog("removeDocEntrys(delete_umc_dba_tstringSQL)", delete_umc_dba_tstringSQL +":"+finDocCode);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + delete_umc_dba_tstringSQL);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }


        int docs_reestr_Code = Integer.MIN_VALUE;
        docs_reestr_Code = getDOC_ID_from_doc_reg_mirror__(finDocCode);

        if (docs_reestr_Code == Integer.MIN_VALUE){
            //throw new EnergyproSystemException ("Can't get docs_reestr_Code, Thead code=" + finDocCode);
        }
        else{
        String delete_sprav_docs_reestr_listSQL = "delete from sprav.docs_reestr_list where doc_id = ?";
        try
        {
            statement = connection.prepareStatement(delete_sprav_docs_reestr_listSQL);
            statement.setInt(1,docs_reestr_Code);
            set = statement.executeQuery();
            //saveToLog("removeDocEntrys(delete_sprav_docs_reestr_listSQL)",  delete_sprav_docs_reestr_listSQL +":" + docs_reestr_Code);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + delete_umc_dba_tstringSQL);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
        }
    }

    /*
    * удаляет ПО ОДНОМУ Ентри акта из ФинКол
    */
    public void removeDocEntry(int finDocCode, int entryCode)   throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        String delete_umc_dba_tstringSQL = "delete from umc_dba.tstring where head_id = ? and id = ?";

        try
        {
            statement = connection.prepareStatement(delete_umc_dba_tstringSQL);
            statement.setInt(1,finDocCode);
            statement.setInt(2,entryCode);
            set = statement.executeQuery();
            //saveToLog("removeDocEntry(delete_umc_dba_tstringSQL)", delete_umc_dba_tstringSQL + ":1:" + finDocCode + ":2:" + entryCode);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + delete_umc_dba_tstringSQL);
            System.out.println("FINDocCode = " + finDocCode);
            System.out.println("entryCode = " + entryCode);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        int docs_reestr_Code = Integer.MIN_VALUE;
        docs_reestr_Code = getDOC_ID_from_doc_reg_mirror__(finDocCode);
        if (docs_reestr_Code == Integer.MIN_VALUE){
            //throw new EnergyproSystemException ("Can't get docs_reestr_Code, Thead code=" + finDocCode);
        }
        else{

        reCreate_docs_reestr_list(finDocCode, docs_reestr_Code);
        }
/*    это все теперь в методе ... reCreate_docs_reestr_list
        String delete_sprav_docs_reestr_listSQL = "delete from sprav.docs_reestr_list where doc_id = ?";

        try
        {
            statement = connection.prepareStatement(delete_sprav_docs_reestr_listSQL);
            statement.setInt(1,docs_reestr_Code);
            set = statement.executeQuery();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + delete_umc_dba_tstringSQL);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
        */
    }

    public int getFINOperationCodeByTypeCode(int typeCode, int molTypeCode){
        int out = Integer.MIN_VALUE;

        if (typeCode == FINDocType.MOVE_302){
            if (molTypeCode == FINMolType.MASTER) out = 302;
            if (molTypeCode == FINMolType.MECHANIC) out = 303;
        }
        if (typeCode == FINDocType.MOVE_304){
            if (molTypeCode == FINMolType.MASTER) out = 304;
            if (molTypeCode == FINMolType.MECHANIC) out = 305;
        }

        if (typeCode == FINDocType.MOVE_300){
            if (molTypeCode == FINMolType.MASTER) out = 300;
            if (molTypeCode == FINMolType.MECHANIC) out = 301;
        }
        if (typeCode == FINDocType.MOVE_298){
            if (molTypeCode == FINMolType.MASTER) out = 298;
            if (molTypeCode == FINMolType.MECHANIC) out = 299;
        }

        if ((typeCode == FINDocType.MOVE_28_302) || ( typeCode == FINDocType.MOVE_28_304)){
            out = 28;
        }

        if (typeCode == FINDocType.MOVE_332){
            if (molTypeCode == FINMolType.MASTER) out = 332;
        }

        if ((typeCode == FINDocType.MOVE_28_332) || ( typeCode == FINDocType.MOVE_28_334)){
                out = 28;
        }

        if (typeCode == FINDocType.MOVE_334){
            if (molTypeCode == FINMolType.MASTER) out = 334;

        }

        if (typeCode == FINDocType.MOVE_330){
            out = 330;
        }

        if (typeCode == FINDocType.MOVE_331){
            out = 331;
        }

        ///// 10.02.12 БУФЕТ
        if (typeCode == FINDocType.MOVE_292){
            if (molTypeCode == FINMolType.MASTER) out = 292;
        }

        if (typeCode == FINDocType.MOVE_294){
            if (molTypeCode == FINMolType.MASTER) out = 294;

        }

        if ((typeCode == FINDocType.MOVE_28_292) || ( typeCode == FINDocType.MOVE_28_294)){
                out = 28;
        }

        if (typeCode == FINDocType.MOVE_290){
            out = 290;
        }

        if (typeCode == FINDocType.MOVE_291){
            out = 291;
        }

        if (typeCode == FINDocType.MOVE_380){
            out = 380;
        }
        if(typeCode == FINDocType.MOVE_66) {
        	out = FINDocType.v66;
        }
        if(typeCode == FINDocType.MOVE_266) {
        	out = FINDocType.v266;
        }
        if(typeCode == FINDocType.MOVE_267) {
        	out = FINDocType.v267;
        }
        if(typeCode == FINDocType.MOVE_87) {
        	out = FINDocType.v87;
        }
        if(typeCode == FINDocType.MOVE_181) {
        	out = FINDocType.v181;
        }
        if(typeCode == FINDocType.MOVE_61) {
        	out = FINDocType.v61;
        }
        if(typeCode == FINDocType.MOVE_74) {
        	out = FINDocType.v74;
        }
        if(typeCode == FINDocType.MOVE_90) {
        	out = FINDocType.v90;
        }
        if(typeCode == FINDocType.MOVE_122) {
        	out = FINDocType.v122;
        }
        if(typeCode == FINDocType.MOVE_77) {
        	out = FINDocType.v77;
        }
        if(typeCode == FINDocType.MOVE_117) {
        	out = FINDocType.v117;
        }
        if(typeCode == FINDocType.MOVE_118) {
        	out = FINDocType.v118;
        }
        /////


        return out;
    }

    public int getFINOperationCodeByTypeCode(int typeCode, boolean isMol){

    int out = Integer.MIN_VALUE;

    if (typeCode == FINDocType.MOVE_302){
        if (isMol)
            out = 302;
        else
            out = 303;
    }
    if (typeCode == FINDocType.MOVE_304){
        if (isMol)
            out = 304;
        else
            out = 305;
    }

    if (typeCode == FINDocType.MOVE_300){
        if (isMol)
            out = 300;
        else
            out = 301;
    }

    if (typeCode == FINDocType.MOVE_298){
        if (isMol)
            out = 298;
        else
            out = 299;
    }

    if ((typeCode == FINDocType.MOVE_28_302) || ( typeCode == FINDocType.MOVE_28_304)){
        out = 28;
    }

    if (typeCode == FINDocType.MOVE_332){
        if (isMol)
            out = 332;
    }

    if ((typeCode == FINDocType.MOVE_28_332)|| ( typeCode == FINDocType.MOVE_28_334)){
            out = 28;
        }
    if (typeCode == FINDocType.MOVE_334){
        out = 344;

    }

    if (typeCode == FINDocType.MOVE_330){
        out = 330;
        }
    if (typeCode == FINDocType.MOVE_331){
        out = 331;
        }

    ///// 10.02.12 БУФЕТ
    if (typeCode == FINDocType.MOVE_292){
        if (isMol)
            out = 292;
    }

    if (typeCode == FINDocType.MOVE_294){
        out = 294;
    }

    if ((typeCode == FINDocType.MOVE_28_292)|| ( typeCode == FINDocType.MOVE_28_294)){
        out = 28;
    }

    if (typeCode == FINDocType.MOVE_290){
        out = 290;
    }
    if (typeCode == FINDocType.MOVE_291){
        out = 291;
    }
    /////

    return out;

    }

    /*
    * удаляет ВЕСЬ ДОКУМЕНТ (включая Ентри !!!)
    */
    public void removeDoc(int finDocCode, int operationCode)   throws PersistenceException, com.ksoe.lla.persistence.exception.DatasourceConnectException
    {
    //if (operationCode != 28)
if (finDocCode != Integer.MIN_VALUE){


        validateDocStatus(finDocCode, operationCode);

        PreparedStatement statement = null;
        ResultSet  set = null;

        removeDocEntrys(finDocCode); // выносит все ентри !!!




if (operationCode != 28){

    // удалим из таблички бля БУХов ...
    fuckingBUH(finDocCode, false);

        int docs_reestr_Code = getDOC_ID_from_doc_reg_mirror__(finDocCode);

        String delete_doc_reg_mirrorSQL = "delete from umc_dba.doc_reg_mirror where head_id = ?";
        try
        {
            statement = connection.prepareStatement(delete_doc_reg_mirrorSQL);
            statement.setInt(1,finDocCode);
            set = statement.executeQuery();
            //saveToLog("removeDoc(delete_doc_reg_mirrorSQL)", delete_doc_reg_mirrorSQL + ":" + finDocCode);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + delete_doc_reg_mirrorSQL);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        String delete_sprav_docs_reestr = "delete from sprav.docs_reestr where id = ?";
        try
        {
            statement = connection.prepareStatement(delete_sprav_docs_reestr);
            statement.setInt(1,docs_reestr_Code);
            set = statement.executeQuery();
            //saveToLog("removeDoc(delete_sprav_docs_reestr)", delete_sprav_docs_reestr +":"+docs_reestr_Code);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + delete_sprav_docs_reestr);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }


    } // not 28

    String delete_thead = "delete from umc_dba.thead where id = ?";
    try
    {
        statement = connection.prepareStatement(delete_thead);
        statement.setInt(1,finDocCode);
        set = statement.executeQuery();
        //saveToLog("removeDoc(delete_thead)", delete_thead +":"+finDocCode);
    }
        catch(SQLException e)
        {
        System.out.println(e.getMessage()+"\nstatement - " + delete_thead);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
    finally
    {
    try {if (set != null) set.close();}             catch (SQLException e) {}
    try {if (statement != null) statement.close();} catch (SQLException e) {}
    statement = null;
    }

        }
    }

    public Date getCurrentPeriodInFK() throws PersistenceException
    {
        // проверим дату акта ...
        String goodDate = "select to_date(val,'dd.mm.yyyy') from umc_dba.umc_settings where upper(name) = 'VALID_DATE_FROM'";

        PreparedStatement statement = null;
        ResultSet  set = null;
        Date d = new Date();
        try
        {
            statement = connection.prepareStatement(goodDate);
            set = statement.executeQuery();
            if ( set.next() ){
                d = set.getDate(1);
            }
            else
                throw new PersistenceException("Can't get date for validate UMC: " + goodDate);

            return d;
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + goodDate);
            //EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            throw new EnergyproSystemException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

    }

    /**
    *
    * Проверка на закрытость месяца в модуле Финансы по дате
    *
    * @param date дата для проверки
    * @return Тип boolean <b>true</b> - месяц открыт или <b>false</b> - закрыт
    */
    public boolean isFinansyOpen(Date date) throws PersistenceException
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(Tools.clearTimeOfDate(date));
        calendar.set(Calendar.DATE,1);

        java.sql.Date monthDate = new java.sql.Date(calendar.getTimeInMillis());

        PreparedStatement statement = null;
        ResultSet  set = null;

        String queryString = " select " +
                            " case when dt_current > ? then 'REJECT' " +
                            " when dt_current = ? and zapret_ismen = 'Y' then 'REJECT'" +
                            " else 'ACCEPT' end ENABLE_PROV " +
                            " from finansy.dates ";

        boolean result = false;

        try
        {
            statement = connection.prepareStatement(queryString);
            statement.setDate(1, monthDate);
            statement.setDate(2, monthDate);
            set = statement.executeQuery();
            if ( set.next() ){
                String strResult = set.getString(1);

                if(strResult.compareTo("REJECT") == 0)
                    result = false;
                else
                if(strResult.compareTo("ACCEPT") == 0)
                    result = true;
                else
                    throw new EnergyproSystemException("Error in isFinansyOpen");
            }
            else
                throw new PersistenceException("Can't get date for validate Finansy: " + queryString);



            return result;
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + queryString);
            //EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            throw new EnergyproSystemException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }

    public void validateDocDate(Date docDate) throws PersistenceException
    {
        Date d = getCurrentPeriodInFK();

        if (d.after(docDate)){
            throw new PersistenceException("В Фин.Колекции уже период " + d);
        }

    }

    public void validateDocStatus(int finDocCode, int operationCode) throws PersistenceException
    {
        String SQL = "select op_kind_id from umc_dba.thead where id = ?";

        PreparedStatement statement = null;
        ResultSet  set = null;
        //int validStatusCode = 300;

        try
        {
            statement = connection.prepareStatement(SQL);
            statement.setInt(1,finDocCode);
            set = statement.executeQuery();


            if ( ! set.next() )
                throw new EnergyproSystemException("Can't check document in THead, code =" + finDocCode+". Document not found.");
                else
                {
                    if (set.getInt(1) != operationCode) {



                        //ActLogic actLogic = new ActLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
                        throw new EnergyproSystemException("Документ проведен в ФинКоллекции (code=" + finDocCode + "). StatusCode =" + set.getInt(1));

                        /*
                        int actCode = Integer.MIN_VALUE;
                        actCode = actLogic.getActByFINDocCode(finDocCode);
                        if (actCode == Integer.MIN_VALUE){
                            throw new EnergyproSystemException("Act not found fro finDocCode="+finDocCode);
                        }
                        actLogic.closeAct(actCode);

                        throw new EnergyproSystemException("Document not editable(code=" + finDocCode + "). StatusCode =" + set.getInt(1));
*/
                    }
                }

        }

        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + SQL);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }

        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
/*
            try {
                if (energyNetConnection != null && !energyNetConnection.isClosed()) {
                    energyNetConnection.close();
                    energyNetConnection = null;
                }
            } catch (SQLException e) {
            }
*/
        }

    }

    public BigDecimal getExtraCargo(String NN) throws PersistenceException
    {
    BigDecimal EXTRA_CARGO=new BigDecimal(0);
    PreparedStatement statement = null;
    ResultSet  set = null;

    String getExtra_Cargo = "select nvl(cost,0) from umc_dba.tmatherial where nn = ? ";

    try
    {
        statement = connection.prepareStatement(getExtra_Cargo);
        statement.setString(1, NN);
        set = statement.executeQuery();
          if ( ! set.next() )
              throw new PersistenceException("Can't get ExtraCargo :" + getExtra_Cargo);
             else
              {
                EXTRA_CARGO = set.getBigDecimal(1);
              }

    }
    catch(SQLException e)
    {
        System.out.println(e.getMessage()+"\nstatement - " + getExtra_Cargo);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);

    }
    finally
    {
     try {if (set != null) set.close();}             catch (SQLException e) {}
     try {if (statement != null) statement.close();} catch (SQLException e) {}
     statement = null;
    }

    return EXTRA_CARGO;

    }


    public void setExtraCargo(String NN,BigDecimal newExtraCargo) throws PersistenceException
    {

    PreparedStatement statement = null;
    ResultSet  set = null;

    if (newExtraCargo!=null)
    {
    String setExtra_Cargo = "update umc_dba.tmatherial set cost = ? where nn = ? ";

    try
    {
        statement = connection.prepareStatement(setExtra_Cargo);
        statement.setBigDecimal(1, newExtraCargo);
        statement.setString(2, NN);
        set = statement.executeQuery();
    }

    catch(SQLException e)
    {
        System.out.println(e.getMessage()+"\nstatement - " + setExtra_Cargo);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);

    }



    finally
    {
     try {if (set != null) set.close();}             catch (SQLException e) {}
     try {if (statement != null) statement.close();} catch (SQLException e) {}
     statement = null;
    }

    }

    }




    public int createDocEntry(FINMaterials finMaterials, int operationCode, int finDocCode, int tstringID) throws PersistenceException
    {
        int outCode = Integer.MIN_VALUE;

        //validateDoc(finMaterials.finDocItemCode);

        //Проверяем указанное количество к списанию по акту с существующим.
        //Если количество не превышает остаток, то старт транзакции.

        PreparedStatement statement = null;
        ResultSet  set = null;

        // если пришел номер строки - ставим ЕГО .. а не вычисляем ...
        if ( tstringID == Integer.MIN_VALUE){

            String get_code_sql = "select (nvl((select max(umc_dba.tstring.id) from umc_dba.tstring where head_id = ?),0) + 1) from dual";
            try
            {
                statement = connection.prepareStatement(get_code_sql);
                statement.setInt(1, finDocCode);
                set = statement.executeQuery();
                if ( ! set.next() )
                    throw new PersistenceException("Can't get PK code for THead :" + get_code_sql);
                    else
                    {
                        outCode = set.getInt(1);;
                    }
            }
            catch(SQLException e)
            {
                System.out.println(e.getMessage()+"\nstatement - " + get_code_sql);
                EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            }
            finally
            {
            try {if (set != null) set.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
            statement = null;
            }
        }
        else
            outCode = tstringID;


        String ins_umc_dba_tstring = " insert into umc_dba.tstring "+
        "(id, head_id,  kau, mat_id, bal_sch," +
        " quantity, price, cost, valueable, extra_cargo, cost_ext, dezur, "+
        " so_size, rostn, party_id, returned, rest_purpose_id, budget_core_id "+
        ",kred_sch, wear_date) "+
        " values "+
        "(?, ?, ?, ?, ?,"+
        " ?, ?, ?, ?, ?, ?, ?,"+
        " ?, ?, ?, ?, ?, ?,"+
        " ?, ?)";

        //int rest_purpose_id = getRestPurposeCodeByWorkOrderNumber("-1");
        try
        {
            statement = connection.prepareStatement(ins_umc_dba_tstring);

            statement.setInt(1, outCode); // for nex-val ... code of FINDOCUMENT ...
            statement.setInt(2, finDocCode);
            statement.setString(3,"00000000000"); // KAU
            statement.setInt(4,finMaterials.mat_id);
            statement.setString(5,finMaterials.bal_sch);
            statement.setBigDecimal(6,finMaterials.quantity);
            statement.setBigDecimal(7,finMaterials.calc_price);
            statement.setBigDecimal(8,finMaterials.cost);
            statement.setInt(9,1); // valueable
            statement.setBigDecimal(10, finMaterials.calc_price);
            statement.setBigDecimal(11, finMaterials.cost);
            statement.setString(12,"N");
            statement.setInt(13,0);
            statement.setInt(14,0);
            statement.setInt(15,finMaterials.party_id);
            statement.setString(16,"N");
            statement.setInt(17, finMaterials.rest_purpose_id);
            statement.setInt(18, finMaterials.budget_core_id);
            statement.setString(19, finMaterials.bal_sch);

            if (finMaterials.wear_date == null)
            statement.setDate(20,null);
            else
            statement.setDate(20,new java.sql.Date(finMaterials.wear_date.getTime()));


            //statemen
            //finMaterials.


            set = statement.executeQuery();

            //saveToLog("createDocEntry(ins_umc_dba_tstring)", ins_umc_dba_tstring + ":1:" + outCode + ":2:" + finDocCode);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + ins_umc_dba_tstring);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }


if (operationCode != 28){
        // вытянуть код документа для связи ДОКС_РЕЕСТРА

        int docs_reestr_Code = getDOC_ID_from_doc_reg_mirror__(finDocCode);
        if (docs_reestr_Code == Integer.MIN_VALUE){
            throw new EnergyproSystemException ("Can't get docs_reestr_Code, Thead code=" + finMaterials.finDocItemCode);
        }

        String ins_sprav_docs_reestr_list = "insert into sprav.docs_reestr_list "+
        "(doc_id, name, edizm_name, price, kol, summ, nds_summ, discount) "+
        " values "+
        "(?, ?, ?, ?, ?, ?, ?, ?)";

        try
        {
            statement = connection.prepareStatement(ins_sprav_docs_reestr_list);

            statement.setInt(1,docs_reestr_Code); // for nex-val ... code of FINDOCUMENT ...

            if (finMaterials.mat_name.trim().length() > 100) finMaterials.mat_name = finMaterials.mat_name.substring(0,99);

            statement.setString(2,finMaterials.mat_name.toUpperCase());
            statement.setString(3, finMaterials.mu_name.toUpperCase());
            statement.setBigDecimal(4,finMaterials.calc_price);
            statement.setBigDecimal(5,finMaterials.quantity);
            statement.setBigDecimal(6,finMaterials.cost);
            statement.setBigDecimal(7, new BigDecimal(0));
            statement.setBigDecimal(8, new BigDecimal(0));

            set = statement.executeQuery();

            //saveToLog("createDocEntry(ins_sprav_docs_reestr_list)", ins_sprav_docs_reestr_list + ":"+docs_reestr_Code);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + ins_sprav_docs_reestr_list);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
}
        // пересчитаем суммы ДОКУМЕНТа ...
        //finMaterials.finDocItemCode - с клиента едет код главного ДОКУМЕНТА
        updateDocSum(finDocCode);

        return outCode;
    }


    private void reCreate_docs_reestr_list(int head_id, int docs_reestr_list_id) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        String delete_sprav_docs_reestr_listSQL = "delete from sprav.docs_reestr_list where doc_id = ?";
        try
        {
            statement = connection.prepareStatement(delete_sprav_docs_reestr_listSQL);
            statement.setInt(1,docs_reestr_list_id);
            set = statement.executeQuery();
            //saveToLog("reCreate_docs_reestr_list(delete_sprav_docs_reestr_listSQL)", delete_sprav_docs_reestr_listSQL + ":"+docs_reestr_list_id);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + delete_sprav_docs_reestr_listSQL + "\ndoc_id="+docs_reestr_list_id);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }


        String reacreate_docs_reestr_list_SQL = " insert into sprav.docs_reestr_list (doc_id, name, edizm_name,"+
                "price, kol, summ, nds_summ, discount)"+
            " (select ?, upper(substr(tm.name,0, 100)),tu.text, ts.price"+
            " ,ts.quantity, ts.cost,null ,0 " +
            " from umc_dba.tmatherial tm, umc_dba.tmesure_unit tu, umc_dba.tstring ts" +
            " where ts.mat_id = tm.id and tm.mesure_unit_id = tu.id" +
            " and head_id = ?)";


        try
        {
            statement = connection.prepareStatement(reacreate_docs_reestr_list_SQL);
            statement.setInt(1, docs_reestr_list_id);
            statement.setInt(2, head_id);
            set = statement.executeQuery();
            //saveToLog("reCreate_docs_reestr_list(reacreate_docs_reestr_list_SQL)", reacreate_docs_reestr_list_SQL + ":1:" + docs_reestr_list_id + ":2:" + head_id);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + reacreate_docs_reestr_list_SQL + "\n head_id="+head_id + "\n docs_reestr_list_id ="+docs_reestr_list_id);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }


    public void updateDocSum(int finDocCode) throws PersistenceException
    {
        String upd_sum_thead_sql = "update umc_dba.thead set doc_sum = nvl("+
        "(select sum(cost) from umc_dba.tstring where head_id=?)"+
        ",0),"+
        //"corrector_name = 'ENERGYNET'," +
        " correctiondate = sysdate  where id = ?";

        PreparedStatement statement = null;
        ResultSet  set = null;

        try
        {
            statement = connection.prepareStatement(upd_sum_thead_sql);
            statement.setInt(1, finDocCode);
            statement.setInt(2, finDocCode);
            set = statement.executeQuery();
            //saveToLog("updateDocSum(upd_sum_thead_sql)", upd_sum_thead_sql +":1:"+finDocCode + ":2:"+finDocCode);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + upd_sum_thead_sql + "\n head_id="+finDocCode);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        int docs_reestr_Code = Integer.MIN_VALUE;
        docs_reestr_Code = getDOC_ID_from_doc_reg_mirror__(finDocCode);
        if (docs_reestr_Code == Integer.MIN_VALUE){
            //throw new EnergyproSystemException ("Can't get docs_reestr_Code, Thead code=" + finDocCode);
        }
        else{

        String upd_sum_docs_reestr_sql = "update sprav.docs_reestr set "+
        "doc_summ = nvl("+
        "(select sum(summ) from sprav.docs_reestr_list where doc_id = ?)"+
        ",0.01), summ_in_currency = nvl("+
        "(select sum(summ) from sprav.docs_reestr_list where doc_id = ?)"+
        ",0.01) "+
        "where id = ?";

        try
        {
            statement = connection.prepareStatement(upd_sum_docs_reestr_sql);
            statement.setInt(1, docs_reestr_Code);
            statement.setInt(2, docs_reestr_Code);
            statement.setInt(3, docs_reestr_Code);
            set = statement.executeQuery();
            //saveToLog("updateDocSum(upd_sum_docs_reestr_sql)", upd_sum_docs_reestr_sql + ":1-3:" + docs_reestr_Code );
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + upd_sum_docs_reestr_sql+ "\n id=" + docs_reestr_Code);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
        }// else 28
        /*
        *
update umc_dba.thead
   set doc_sum = 2753.30,
         corrector_name = ‘ENERGYNET’,
         correctiondate = to_date(sysdate, 'dd.mm.yyyy hh:mi:ss')
 where id = 1437001
/
update sprav.docs_reestr
   set doc_summ = 2753.3,
       nds_summ = 2753.3
 where id = 1973411
        *
        */

    }

    public void fuckingBUH(int headID, boolean isInsert) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;
        String sql = "";

        if (isInsert){
            sql = "insert into umc_dba.aaa_energynet (head_id) values (?)";
        }
        else
        {
            sql = "delete from umc_dba.aaa_energynet where head_id = ?";
        }

        try
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,headID);
            set = statement.executeQuery();
            //saveToLog("createDoc(docs_reestrSQL)", docs_reestrSQL + ":" + Docs_ReestrCode);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

    }


    public int createDocThead(String numberENDoc, Date dateENDoc, int operationCode, String molCode, int parentDoc, String userName, String Via_who)  throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        // определим МОЛА по типу операций ... 300 - мастер, 301 - механик ...
/*        String[] molArray = new String[2];
        molArray[0] = obj.finMolCode;
        molArray[1] = obj.finMechanicCode;

        String molCode = getMOLCodeByOperationCode( molArray , operationCode);
*/
        // код вставляемого документа ...
        int docCode = Integer.MIN_VALUE;


        //String getTHeadCode = "select umc_dba.sqdocument.NEXTVAL from dual";
        //String getDocs_ReestrCode = "select sprav.sq_docs_reestr.NEXTVAL from dual";
        //String getDoc_Reg_MirrorCode = "select umc_dba.sqdocument.currval from dual";

        docCode = getFINPKCode("umc_dba.sqdocument");
        if (docCode == Integer.MIN_VALUE){
            throw new EnergyproSystemException("Can'no get PK : umc_dba.sqdocument");
        }

        if ( operationCode != 28){
            fuckingBUH(docCode, true);
        }

        String theadSQL = "insert into umc_dba.thead (id, doc_num, op_kind_id, sender_id, "+
        "acceptor_id, doc_date, doc_sum, pay_sum, nds_sum, adj_sum, ownerid,"+
        "creationdate, nds_prc, skl_prc, opl_sum, user_name, common_head, "+
        "ext_prc, corrector_name, correctiondate, via_who, skl_sum, ext_sum,"+
        "partner_type, nds_sum2, nds_prc2, nds_sum3, nds_prc3, div_code, "+
        "creator_task_code, doc_type, Origin_doc_id, Parent_ID) values "+
"(?, ?, ?, ?,"+
//"?, ?, 0, 0, 0, 0, 395, "+
"?, ?, 0, 0, 0, 0, (select a.user_id from dba_users a where upper(a.username) = upper('" + userName + "') ), "+
"sysdate, 0, 0, 0, ?, 0,"+
"0, ?, sysdate, ?, 0, 0,"+
"0, 0, 0, 0, 0, ?,"+
" 2, 1,?,?)";

        try
        {
            statement = connection.prepareStatement(theadSQL);
            //statement.setInt(1,obj.finDocCode);
            statement.setInt(1, docCode);
            statement.setString(2,numberENDoc);
            statement.setInt(3, operationCode);
            statement.setString(4, molCode);
            statement.setString(5, molCode);
            statement.setDate(6,new java.sql.Date( dateENDoc.getTime()));

            statement.setString(7, userName);
            statement.setString(8, userName);

            statement.setString(9, Via_who); //userProfile.userName + " (" + new SimpleDateFormat("dd.MM.yyyy").format(dateENDoc).toString() +")" ); // типа имя юзера ... для поиска концов ;)
            statement.setString(10, molCode);


            if (parentDoc == Integer.MIN_VALUE){
                statement.setNull(11, java.sql.Types.INTEGER);
                statement.setNull(12, java.sql.Types.INTEGER);
            }
            else
            {
                statement.setInt(11, parentDoc);
                statement.setInt(12, parentDoc);
            }

            set = statement.executeQuery();
            //saveToLog("createDoc(theadSQL)", theadSQL + ":1:"+docCode+":molCode:"+molCode);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + theadSQL);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

// остальные вставки для всех , кроме 28 ...
if ( operationCode != 28){

        // встака во временную таблицу лдя предотвращения удаления БУХАМИ документов ...
        // все ДОКИ .. кроме 28 ..
        //вставили в НАЧАЛО ... fuckingBUH(docCode, true);

        int Docs_ReestrCode = Integer.MIN_VALUE;
        Docs_ReestrCode = getFINPKCode("sprav.sq_docs_reestr");
        if (Docs_ReestrCode == Integer.MIN_VALUE)
                throw new PersistenceException("Can't get PK code for sprav.sq_docs_reestr" );

        String docs_reestrSQL = "insert into sprav.docs_reestr (id, doc_type, task_code, doc_no, doc_date, currency_code, doc_summ, summ_in_currency,"+
        "nds_summ, flag_nds_in_price, discount, ins_date, ins_user) "+
        " values "+
        "(?, 'НР', 2, ?, ?, '980', 0.01 , 0, 0, 0, 0, to_date(sysdate,'dd.mm.yyyy hh:mi:ss'), '" + userName + "')";

        try
        {
            statement = connection.prepareStatement(docs_reestrSQL);
            statement.setInt(1,Docs_ReestrCode);
            statement.setString(2,numberENDoc);
            statement.setDate(3,new java.sql.Date( dateENDoc.getTime()));
            set = statement.executeQuery();
            //saveToLog("createDoc(docs_reestrSQL)", docs_reestrSQL + ":" + Docs_ReestrCode);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + docs_reestrSQL);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        String doc_reg_mirrorSQL = "insert into umc_dba.doc_reg_mirror (head_id, doc_id)"+
        "values (?, ?)";
        try
        {
            statement = connection.prepareStatement(doc_reg_mirrorSQL);
            //statement.setInt(1,obj.finDocCode);
            statement.setInt(1, docCode);
            statement.setInt(2,Docs_ReestrCode);
            set = statement.executeQuery();
            //* saveToLog("createDoc(doc_reg_mirrorSQL)", doc_reg_mirrorSQL + ":1:" + obj.finDocCode + ":" + Docs_ReestrCode);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + doc_reg_mirrorSQL);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

} // для 28-х вставлять НЕНАДО !!!

        return docCode;

    }

    public void updateDocMOLByWorkOrderCode(int workOrderCode) throws PersistenceException, DatasourceConnectException
    {
        //ENWorkOrder wo = new ENWorkOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile).getObject(workOrderCode);
        FINMolDataDAO molDAO = new FINMolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINMolDataFilter molFilter = new FINMolDataFilter();
        molFilter.workOrder.code = workOrderCode;
        FINMolDataShortList molList = molDAO.getScrollableFilteredList(molFilter, 0, -1);

        for (int i=0; i < molList.totalCount; i++){
            FINMolData mol = new FINMolData();
            mol.code = molList.get(i).code;
            updateDocMOLByFINMOLData(mol, molList.get(i).workOrderWorkOrderNumber, molList.get(i).workOrderDateGen );
        }


    }

    public void updateDocMOLByFINMOLData(FINMolData finMolData, String workOrderNumber, Date dateGen) throws PersistenceException, DatasourceConnectException
    {

        try
        {
            FINDoc2MolDataDAO dao2 = new FINDoc2MolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            FINDoc2MolDataFilter f = new FINDoc2MolDataFilter();
            f.molData.code = finMolData.code;

            //f.workOrder.code = workOrderCode;
            //f.finDocTypeRef.code = operationTypeCode;

            FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);

            String Via_who = userProfile.userName.toUpperCase() + " (" + new SimpleDateFormat("dd.MM.yyyy").format(dateGen).toString() +")" ;

            FINDoc2MolDataShortList l = dao2.getScrollableFilteredList(f,0,-1);
            for (int i=0; i<l.totalCount; i++){
                //updateDocMOL( l.get(i).finDocCode, finMolData.finMolCode, wo.workOrderNumber);
                //AS 18.03.2011 updateDocMOL( l.get(i).finDocCode, l.get(i).molDataFinMolCode, workOrderNumber);
                int opType = getFINOperationCodeByTypeCode(l.get(i).finDocTypeRefCode, l.get(i).molDataTypeRefCode);
                if (opType != 28)
                    fkLogic2.UpdateDocumentShortFull(l.get(i).finDocCode, workOrderNumber, opType , l.get(i).molDataFinMolCode, l.get(i).molDataFinMolCode, dateGen, Via_who);
            }
        }
        finally{
            try
            {
                if (energyNetConnection != null && ! energyNetConnection.isClosed()){
                    energyNetConnection.close();
                    energyNetConnection = null;
                }
            } catch (SQLException e) {}
        }

    }


    /**
     *
     * Изменение МОЛ на резервирование в Фин. коллекции
     *
     * @param docCode id документа из фин. коллекции
     * @param MOL код МОЛ
     * @throws PersistenceException
     */
    public void updateDocMOL(int docCode, String MOL) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        String thead_update_sql = "update umc_dba.thead set sender_id = ? , acceptor_id = ?, div_code = ?, correctiondate = sysdate where id = ?";
        try {
            statement = connection.prepareStatement(thead_update_sql);
            statement.setString(1, MOL);
            statement.setString(2, MOL);
            statement.setString(3, MOL);
            statement.setInt(4, docCode);
            set = statement.executeQuery();        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + thead_update_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

    }



    public void updateDoc(int docCode, String numberGen, Date dateGen) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        String thead_update_sql = "update umc_dba.thead set doc_num = ?, doc_date = ?, correctiondate = sysdate where id = ?";
        try
        {
            statement = connection.prepareStatement(thead_update_sql);
            statement.setString(1, numberGen);
            statement.setDate(2, new java.sql.Date(dateGen.getTime()));
            //statement.setInt(3, act.finDocCode);
            statement.setInt(3, docCode);
            set = statement.executeQuery();
            //saveToLog("updateDoc(thead_update_sql)", thead_update_sql + ":3:" + docCode);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + thead_update_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        int docs_reestr_Code = Integer.MIN_VALUE;
        docs_reestr_Code = getDOC_ID_from_doc_reg_mirror__(docCode);

        if (docs_reestr_Code == Integer.MIN_VALUE){
            //throw new EnergyproSystemException ("Can't get docs_reestr_Code, Thead code=" + docCode);
        }
        else{

        String docs_reestr_update_sql = "update sprav.docs_reestr set doc_no = ?, doc_date = ?, ins_date = sysdate where id = ?";

        try
        {
            statement = connection.prepareStatement(docs_reestr_update_sql);
            statement.setString(1,numberGen);
            statement.setDate(2,new java.sql.Date(dateGen.getTime()));
            statement.setInt(3,docs_reestr_Code);
            set = statement.executeQuery();
            //saveToLog("updateDoc(docs_reestr_update_sql)", docs_reestr_update_sql + ":3:"+docs_reestr_Code);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + docs_reestr_update_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
        } // if 28
    }

    /**
    *
    * Изменение номера и даты документа по id родительского документа
    *
    * @param docCode id родительского документа
    * @param numberGen номер док-та
    * @param dateGen дата док-та
    * @throws PersistenceException
    */
    public void updateDocByParentCode(int docCode, String numberGen, Date dateGen) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        String thead_update_sql = "update umc_dba.thead set doc_num = ?, doc_date = ?, correctiondate = sysdate where parent_id = ?";
        try
        {
            statement = connection.prepareStatement(thead_update_sql);
            statement.setString(1, numberGen);
            statement.setDate(2, new java.sql.Date(dateGen.getTime()));
            //statement.setInt(3, act.finDocCode);
            statement.setInt(3, docCode);
            set = statement.executeQuery();
            //saveToLog("updateDocByParentCode(thead_update_sql)", thead_update_sql + ":3:" + docCode);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + thead_update_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }

    public void updateDocDate(int docCode, Date dateGen) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        String thead_update_sql = "update umc_dba.thead set doc_date = ?, correctiondate = sysdate where id = ?";
        try
        {
            statement = connection.prepareStatement(thead_update_sql);
            statement.setDate(1, new java.sql.Date(dateGen.getTime()));
            //statement.setInt(3, act.finDocCode);
            statement.setInt(2, docCode);
            set = statement.executeQuery();
            //saveToLog("updateDocDate(thead_update_sql)", thead_update_sql + ":3:" + docCode);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + thead_update_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        int docs_reestr_Code = Integer.MIN_VALUE;
        docs_reestr_Code = getDOC_ID_from_doc_reg_mirror__(docCode);

        if (docs_reestr_Code == Integer.MIN_VALUE){
            //throw new EnergyproSystemException ("Can't get docs_reestr_Code, Thead code=" + docCode);
        }
        else{

        String docs_reestr_update_sql = "update sprav.docs_reestr set doc_date = ?, ins_date = sysdate where id = ?";

        try
        {
            statement = connection.prepareStatement(docs_reestr_update_sql);
            statement.setDate(1,new java.sql.Date(dateGen.getTime()));
            statement.setInt(2,docs_reestr_Code);
            set = statement.executeQuery();
            //saveToLog("updateDocDate(docs_reestr_update_sql)", docs_reestr_update_sql + ":3:"+docs_reestr_Code);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + docs_reestr_update_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
        } // if 28
    }

    public void updateDoc__(ENAct act, int docCode) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        String thead_update_sql = "update umc_dba.thead set doc_num = ?,  correctiondate = sysdate where id = ?";
        try
        {
            statement = connection.prepareStatement(thead_update_sql);
            statement.setString(1, act.numberGen);
            //statement.setDate(2, new java.sql.Date(act.dateGen.getTime()));
            //statement.setInt(3, act.finDocCode);
            statement.setInt(2, docCode);
            set = statement.executeQuery();
        // saveToLog("updateDoc(thead_update_sql)", thead_update_sql + ":3:" + docCode);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + thead_update_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        int docs_reestr_Code = Integer.MIN_VALUE;
        docs_reestr_Code = getDOC_ID_from_doc_reg_mirror__(docCode);
        if (docs_reestr_Code == Integer.MIN_VALUE){
            throw new EnergyproSystemException ("Can't get docs_reestr_Code, Thead code=" + docCode);
        }

        String docs_reestr_update_sql = "update sprav.docs_reestr set doc_no = ?, ins_date = sysdate where id = ?";

        try
        {
            statement = connection.prepareStatement(docs_reestr_update_sql);
            statement.setString(1,act.numberGen);
            //statement.setDate(2,new java.sql.Date(act.dateGen.getTime()));
            statement.setInt(3,docs_reestr_Code);
            set = statement.executeQuery();
            //saveToLog("updateDoc(docs_reestr_update_sql)", docs_reestr_update_sql + ":3:"+docs_reestr_Code);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + docs_reestr_update_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }


    }


    public void removeDOCFromActUnmount(ENAct act) throws PersistenceException, DatasourceConnectException
    {

        FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);

        FINMolDataDAO molDataDAO = new FINMolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

        AuthLogic netAuth = new AuthLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        AXTransactionsLogic axLogic = new AXTransactionsLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        int writeOffTmcConf = netAuth.checkUsesDataForWriteOff();

        JournalAction jAction = new JournalAction();
       // mdaxwriteOff перечень журналов Актов из Аксапты
        Vector<FINDoc2MolData> FINDoc2MolDataWithAxJournalID = new Vector<FINDoc2MolData>();

        FINMolDataFilter molDataFilter = new FINMolDataFilter();
        molDataFilter.act.code = act.code;
        molDataFilter.molTypeRef.code = FINMolType.MASTER;
        int[] molDataArr = molDataDAO.getFilteredCodeArray(molDataFilter, 0, -1);
        if ( molDataArr.length != 1 ){
            throw new EnergyproSystemException("Не знайдено данні про МВО майстра для акту, код акта = " + act.code);
        }

        FINDoc2MolDataDAO d2mDAO = new FINDoc2MolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

        FINDoc2MolDataFilter d2mFilter = new FINDoc2MolDataFilter();
        d2mFilter.molData.code = molDataArr[0];
        d2mFilter.conditionSQL = String.format("%s in (?,?,?,?)", FINDoc2MolData.finDocTypeRef_QFielld);
        
        Vector<Object> params = new Vector<Object>(FINDocType.MOVE_ALL_DEMONTAGE);

        FINDoc2MolDataShortList d2mList = d2mDAO.getScrollableFilteredList(d2mFilter, 0, -1, params);
        for (int i=0; i < d2mList.totalCount; i++){
            int rr = fkLogic2.check_red_rest(d2mList.get(i).finDocCode, FKConsts.CHECK_RED_REST_IS_DELETE);
            if (rr != 0 ){
            	this.checkDocForRedRestAndFormDetailedException(d2mList.get(i).finDocCode, false, FKConsts.CHECK_RED_REST_IS_DELETE);
            }

            fkLogic2.Drop_Document(d2mList.get(i).finDocCode);
            d2mDAO.remove(d2mList.get(i).code);

           // аксаптовые журналы по демонтажу
            if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
            	if (d2mList.get(i).axJournalId != null && !d2mList.get(i).axJournalId.equals("") ) {
            		FINDoc2MolData fd2mdObj = new FINDoc2MolData();
            		fd2mdObj.axJournalId = d2mList.get(i).axJournalId;
            		fd2mdObj.molCode = d2mList.get(i).molDataFinMolCode;
            		fd2mdObj.isPostingJournal = jAction.checkPostingJournal(
					            				fd2mdObj.axJournalId,
												axLogic.getUserSecurity().domainUserName,
												axLogic.getUserSecurity().userPass);
            		fd2mdObj.molTypeCode =  d2mList.get(i).molDataTypeRefCode; // вроди как тип МОЛа !!!!!!!??????

            		FINDoc2MolDataWithAxJournalID.add(fd2mdObj);
            	}

            }

        }

        /*<<<<<< аксаптовые журналы акты проверим на разноску и если что сторно делаем тут */
        // mdaxwriteoff найти журнал аксаптовый акт по молу и проверить разнесен ли он
			if (writeOffTmcConf == 1 || writeOffTmcConf == 2) {
				for (int u = 0; u < FINDoc2MolDataWithAxJournalID.size(); u++) {
					/** проверка разноски журнала АКТ */
					boolean isPostingAxJournal = false;
					isPostingAxJournal = FINDoc2MolDataWithAxJournalID.get(u).isPostingJournal;

					if (isPostingAxJournal) {
						if (axLogic.aifttsCheckOpen()) {
							/*** копируем в отрицательный журнал если журнал акта разнесен	 */
							String stornoJournalId = jAction
									.copyJournal(
											FINDoc2MolDataWithAxJournalID
													.get(u).axJournalId,
											NoYes.YES,
											NoYes.YES,
											axLogic.getUserSecurity().domainUserName,
											axLogic.getUserSecurity().userPass);

							if (stornoJournalId == null
									|| stornoJournalId.equals("")) {
								throw new SystemException("\n\n"
												+ "Помилка при копіюванні складського журналу № = "
												+ FINDoc2MolDataWithAxJournalID
														.get(u).axJournalId);
							}

							/** физ/фин разноска */
							jAction.checkPostMovement(stornoJournalId,
									axLogic.getUserSecurity().domainUserName,
									axLogic.getUserSecurity().userPass);



						} else {
							throw new EnergyproSystemException(
									"\n Не найдена активная транзакция для пользователя "
											+ axLogic.getUserSecurity().userName
											+ " !!! ");
						}
					}
					/*если не разнесен то можно уддалить журнал вместе со строками */
					else if (!isPostingAxJournal)
					{
					  jAction.journalTableDelete(FINDoc2MolDataWithAxJournalID.get(u).axJournalId,axLogic.getUserSecurity().domainUserName,axLogic.getUserSecurity().userPass);
				    }
				}
			}
    }

    public void removeDOCFromActProduced(ENAct act) throws PersistenceException, DatasourceConnectException
    {

        FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);

        FINMolDataDAO molDataDAO = new FINMolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

        if(act.actTypeRef.code != ENPlanWorkState.PRODUCTION)
            throw new EnergyproSystemException("Видаляти документ приходу виробленої продукції можна тільки для акту типу 'Виготовлення'");

        FINMolDataFilter molDataFilter = new FINMolDataFilter();
        molDataFilter.act.code = act.code;
        molDataFilter.molTypeRef.code = FINMolType.MASTER;
        int[] molDataArr = molDataDAO.getFilteredCodeArray(molDataFilter, 0, -1);
        if ( molDataArr.length != 1 ){
            throw new EnergyproSystemException("Не знайдено данні про МВО майстра для акту, код акта = " + act.code);
        }

        FINDoc2MolDataDAO d2mDAO = new FINDoc2MolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

        AuthLogic netAuth = new AuthLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        AXTransactionsLogic axLogic = new AXTransactionsLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        int writeOffTmcConf = netAuth.checkUsesDataForWriteOff();

        JournalAction jAction = new JournalAction();

        FINDoc2MolDataFilter d2mFilter = new FINDoc2MolDataFilter();
        d2mFilter.molData.code = molDataArr[0];
        d2mFilter.finDocTypeRef.code = FINDocType.MOVE_15;

        // mdaxwriteOff перечень журналов Актов из Аксапты
        Vector<FINDoc2MolData> FINDoc2MolDataWithAxJournalID = new Vector<FINDoc2MolData>();

        FINDoc2MolDataShortList d2mList = d2mDAO.getScrollableFilteredList(d2mFilter, 0, -1);
        for (int i=0; i < d2mList.totalCount; i++){
            int rr = fkLogic2.check_red_rest(d2mList.get(i).finDocCode, 1);
            if (rr != 0 ){
                throw new EnergyproSystemException("Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!!");
            }

            fkLogic2.Drop_Document(d2mList.get(i).finDocCode);
            d2mDAO.remove(d2mList.get(i).code);

	            // аксаптовые журналы по производству
	            if(writeOffTmcConf == 1 || writeOffTmcConf == 2 ) {
	            	if (d2mList.get(i).axJournalId != null && !d2mList.get(i).axJournalId.equals("") ) {
	            		FINDoc2MolData fd2mdObj = new FINDoc2MolData();
	            		fd2mdObj.axJournalId = d2mList.get(i).axJournalId;
	            		fd2mdObj.molCode = d2mList.get(i).molDataFinMolCode;
	            		fd2mdObj.isPostingJournal = jAction.checkPostingJournal(
						            				fd2mdObj.axJournalId,
													axLogic.getUserSecurity().domainUserName,
													axLogic.getUserSecurity().userPass);
	            		fd2mdObj.molTypeCode =  d2mList.get(i).molDataTypeRefCode; // вроди как тип МОЛа !!!!!!!??????

	            		FINDoc2MolDataWithAxJournalID.add(fd2mdObj);
	            	}

	            }
        }

        /*<<<<<< аксаптовые журналы акты проверим на разноску и если что сторно делаем тут */
        // mdaxwriteoff найти журнал аксаптовый акт по молу и проверить разнесен ли он
			if (writeOffTmcConf == 1 || writeOffTmcConf == 2) {
				for (int u = 0; u < FINDoc2MolDataWithAxJournalID.size(); u++) {
					/** проверка разноски журнала АКТ */
					boolean isPostingAxJournal = false;
					isPostingAxJournal = FINDoc2MolDataWithAxJournalID.get(u).isPostingJournal;

					if (isPostingAxJournal) {
						if (axLogic.aifttsCheckOpen()) {
							/*** копируем в отрицательный журнал если журнал акта разнесен	 */
							String stornoJournalId = jAction
									.copyJournal(
											FINDoc2MolDataWithAxJournalID
													.get(u).axJournalId,
											NoYes.YES,
											NoYes.YES,
											axLogic.getUserSecurity().domainUserName,
											axLogic.getUserSecurity().userPass);

							if (stornoJournalId == null
									|| stornoJournalId.equals("")) {
								throw new SystemException("\n\n"
												+ "Помилка при копіюванні складського журналу № = "
												+ FINDoc2MolDataWithAxJournalID
														.get(u).axJournalId);
							}

							/** физ/фин разноска */
							jAction.checkPostMovement(stornoJournalId,
									axLogic.getUserSecurity().domainUserName,
									axLogic.getUserSecurity().userPass);



						} else {
							throw new EnergyproSystemException(
									"\n Не найдена активная транзакция для пользователя "
											+ axLogic.getUserSecurity().userName
											+ " !!! ");
						}
					}
					/*если не разнесен то можно уддалить журнал вместе со строками */
					else if (!isPostingAxJournal)
					{
					  jAction.journalTableDelete(FINDoc2MolDataWithAxJournalID.get(u).axJournalId,axLogic.getUserSecurity().domainUserName,axLogic.getUserSecurity().userPass);
				    }
				}
			}
    }

   /**
    *  Метод для отмены проведения акта приема-передачи материалов заказчика в ФинКоллекции
    *  @param servicesObjectCode - код договора по услугам на сторону (ENServicesObject)
    */
    public void removeDOCFromCustomerMaterials(int servicesObjectCode) throws PersistenceException, DatasourceConnectException
    {
        ////////////////////////////////////////////////////////////////////////
        ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        ENServicesObject servicesObject = servicesObjectDAO.getObject(servicesObjectCode);
        FINMaterialsDAO fmDAO = new FINMaterialsDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

        ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
        planFilter.elementRef.code = servicesObject.element.code;
        planFilter.kind.code = ENPlanWorkKind.CURRENT;

        ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        int[] planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);

        if (servicesObject.contractTypeRef.code != ENServicesContractType.SHIFT_LINES && planArr.length == 0)
        {
            throw new EnergyproSystemException("\n \n NET-3079 Не знайдено місячний план для договору з послуг на сторону! " +
                    "Код договору: " + servicesObject.code);
        }

        if (servicesObject.contractTypeRef.code != ENServicesContractType.SHIFT_LINES && planArr.length > 1)
        {
            throw new EnergyproSystemException("\n \n NET-3079 Знайдено декілька (" + planArr.length +
                    ") місячних планів для договору з послуг на сторону! " +
                    "Код договору: " + servicesObject.code);
        }

        if(servicesObject.contractTypeRef.code != ENServicesContractType.SHIFT_LINES) {
            FINMaterialsFilter fmFilter = new FINMaterialsFilter();
            fmFilter.statusRef.code = FINMaterialsStatus.GOOD;
            fmFilter.conditionSQL = " finmaterials.code in (" +
                                    "  select " +
                                    "    fm.code " +
                                    "  from " +
                                    "    enplanwork p, enestimateitem ei, finmaterials fm " +
                                    "  where p.elementrefcode = " + servicesObject.element.code +
                                    "    and ei.planrefcode = p.code " +
                                    "    and fm.estimateitemrefcode = ei.code " +
                                    "    and p.kindcode = " + ENPlanWorkKind.FACT +
                                    "    and ei.kindrefcode = " + ENEstimateItemKind.CUSTOMER_MATERIALS + ")";

            
            int[] fmArr = fmDAO.getFilteredCodeArray(fmFilter, 0, -1);
            
            if (fmArr.length > 0)
            {
                throw new EnergyproSystemException("\n \n NET-3079 Вже є зарезервовані матеріали замовника у Завданнях-Фактах! \n " +
                        "Код договору: " + servicesObject.code);
            }
        }



        ////////////////////////////////////////////////////////////////////////



        ///// Отменяем в ФК
        FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);

        FINDoc2ENServicesObjectDAO d2soDAO = new FINDoc2ENServicesObjectDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINDoc2ENServicesObjectFilter d2soFilter = new FINDoc2ENServicesObjectFilter();
        d2soFilter.servicesObjectRef.code = servicesObjectCode;
        d2soFilter.finDocTypeRef.code = FINDocType.MOVE_10;
        FINDoc2ENServicesObjectShortList d2soList = d2soDAO.getScrollableFilteredList(d2soFilter, 0, -1);

        if (d2soList.totalCount != 1)
        {
            throw new EnergyproSystemException("\n \n NET-3079 Не знайдено даних про документ (10 в/о) у ФК! \n Код договору: " + servicesObjectCode);
        }

        for (int i = 0; i < d2soList.totalCount; i++)
        {
        	this.checkDocForRedRestAndFormDetailedException(d2soList.get(i).finDocCode, false, FKConsts.CHECK_RED_REST_IS_DELETE);

            fkLogic2.Drop_Document(d2soList.get(i).finDocCode);
            d2soDAO.remove(d2soList.get(i).code);
        }
        /////
        
        if(servicesObject.contractTypeRef.code == ENServicesContractType.SHIFT_LINES) {
        	int[] fmArr = fmDAO.getArrayofCustomerMaterialsCodes(servicesObject);
        	for(int fmCode : fmArr) {
        		FINMaterials finMat = fmDAO.getObject(fmCode);
        		ENEstimateItem estimate = eiDAO.getObject(finMat.estimateItemRef.code);
        		estimate.statusRef.code = ENEstimateItemStatus.UNUSED;
                eiDAO.save(estimate);
        		
        	}
        } else {
            ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
            eiFilter.kindRef.code = ENEstimateItemKind.CUSTOMER_MATERIALS;
            eiFilter.planRef.code = planArr[0];
            eiFilter.accountingTypeRef.code = TKAccountingType.TMC;
            eiFilter.conditionSQL = "enestimateitem.countfact > 0";

            int[] eiArr = eiDAO.getFilteredCodeArray(eiFilter, 0, -1);

            // Материалам на плане возвращаем статус "Непотрібно замовляти"
            for (int i = 0; i < eiArr.length; i++) {
                ENEstimateItem eiObj = eiDAO.getObject(eiArr[i]);
                eiObj.statusRef.code = ENEstimateItemStatus.UNUSED;
                eiDAO.save(eiObj);
            }
        }


    }

    /**
     *
     * Проверит на красные остатки и сформирует детальное исключение
     * (строки которые приведут к красным остаткам и что делать (какие документы надо отменить)
     *
     * Если метод не вызвал ошибку, значит проверка на красные остатки прошла нормально
     *
     * @param theadCode код документа в учете материалов
     * @param docIsOpened - открыт ли документ
     * @param isDelete - удаление или нет
     * @throws PersistenceException
     *
     * @author kreschishinma
     * @throws DatasourceConnectException
     * @since 04.11.2016
     */
    public void checkDocForRedRestAndFormDetailedException(int theadCode, boolean docIsOpened, int isDelete) throws PersistenceException, DatasourceConnectException {
    	FKLogic2 logic2 = new FKLogic2(connection, userProfile);
    	ENPlanWorkDAO planDao = new ENPlanWorkDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
    	RQFKOrderDAO fkOrderDao = new RQFKOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
    	ENActDAO actDao = new ENActDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
    	PlanWorkLogic planLogic = new PlanWorkLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
    	ActLogic actLogic = new ActLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

		int theadCodeToCheck = theadCode;
		Integer childTheadCode = logic2.getChildDoc(theadCodeToCheck);
		// если есть child документ до для отслеживания движения материала нужен его id
		if(childTheadCode != null && childTheadCode != Integer.MIN_VALUE && isDelete == FKConsts.CHECK_RED_REST_IS_DELETE) {
			theadCodeToCheck = childTheadCode;
		}

		int check_red_rest_result = logic2.check_red_rest(theadCodeToCheck, isDelete);

    	if(check_red_rest_result != 0) {
    		/// Перебивается creator_task_code на 2 для того, чтобы можно было открыть документ функцией OpenDocument
    		logic2.setCreatorTHead(theadCode);
    		RQFKOrder fkOrder = fkOrderDao.getFKOrderByFinDocCode(theadCode);
    		Date date = logic2.getDocDate(theadCode);
    		ENAct act = actDao.getActByFinDocCode(theadCode);
    		String action = (isDelete == FKConsts.CHECK_RED_REST_IS_DELETE) ? "Видалення" : "Редагування";
    		String errText = String.format("%s документу призведе до червоного залишку", action);
    		List<FINMaterials> finMatList = logic2.check_red_rest_all_strings(theadCodeToCheck, (docIsOpened == false), isDelete);
    		if(!(finMatList == null || finMatList.size() == 0)) {
    			errText += ". По строках: ";
        		int showPlans = 3;
        		int showFKOrders = 3;
        		int showUmcDocs = 3;
        		int showItems = 3;
    			HashSet<String> plans = new HashSet<String>();
    			HashSet<String> fkOrders = new HashSet<String>();
    			HashSet<String> umcDocs = new HashSet<String>();

    			if(showItems > finMatList.size()) showItems = finMatList.size();
    			List<FINMaterials> restrictedList = finMatList.subList(0, showItems);
    			for(FINMaterials finMat : finMatList) {
    				ENPlanWork[] excludePlans = null;
    				if(act != null) {
    					String planCodes = actLogic.getPlanCodesByAct(act.code);
    					Vector<String> vecPlanCodes = Tools.divideOnWords(planCodes, ",");
    					excludePlans = Tools.transformToArray(vecPlanCodes, new Transformator<ENPlanWork, String>() {
							@Override
							public ENPlanWork transform(String value) {
								value = value.trim();
								ENPlanWork plan = new ENPlanWork();
								Integer val = Integer.valueOf(value);
								if(val == Integer.MIN_VALUE) val = -1;
								plan.code = val;
								return plan;
							}
    					});
    				}
    				ENPlanWorkShortList planList = planDao.getListOfPlansFINMaterialsIsUsed(finMat, date, excludePlans);
    				if(planList != null) {
        				for(Object plan : planList.list) {
        					ENPlanWorkShort planShort = (ENPlanWorkShort)plan;
        					ENWorkOrder workOrder = planLogic.getWorkOrderByPlanCode(planShort.code);
        					if(workOrder != null) {
        						plans.add(String.format("%s від %s", workOrder.workOrderNumber, new SimpleDateFormat("dd.MM.yyyy").format(workOrder.dateGen)));
        					}
        				}
    				}
    				RQFKOrderShortList fkOrderList = fkOrderDao.getListOfRQFKOrderFINMaterialsIsUsed(finMat, date, fkOrder);
    				if(fkOrderList != null) {
    					for(RQFKOrderShort fkOrderShort : fkOrderList.list) {
    						if(fkOrderShort != null) {
    							fkOrders.add(String.format("%s № %s від %s", fkOrderShort.kindName,fkOrderShort.numberDoc, new SimpleDateFormat("dd.MM.yyyy").format(fkOrderShort.dateGen)));
    						}
    					}
    				}

    				List<String> umcDocList = logic2.getTheadHeadersByFINMaterialsUsingNotEnergyNet(finMat, date, null);
    				if(umcDocList != null) {
    					for(String strUmcDoc : umcDocList) {
    						umcDocs.add(strUmcDoc);
    					}
    				}

    			}

    			for(FINMaterials finMatItem : restrictedList) {
    				errText += String.format("\n %s %s к-ть: %s сумма: %s код партії: %d"
    						, finMatItem.nn, finMatItem.mat_name, finMatItem.quantity, finMatItem.cost, finMatItem.party_id);
    			}

    			if(finMatList.size() - restrictedList.size() > 0) {
    				errText += String.format(" та ще %d %s"
    						, (finMatList.size() - restrictedList.size())
    						, (finMatList.size() - restrictedList.size() == 1 ? "строка" : "строк"));
    			}

    			if(showPlans > plans.size()) showPlans = plans.size();
    			if(showFKOrders > fkOrders.size()) showFKOrders = fkOrders.size();
    			if(showUmcDocs > umcDocs.size()) showUmcDocs = umcDocs.size();

    			if(showPlans > 0) {
    				errText += String.format("\n Ці матеріали використовуються у нарядах: ");
    				int count = 0;
    				for(String planNum : plans) {
    					if(count == showPlans) break;
    					errText += String.format("\n %s ", planNum);
    					count++;
    				}
    				if((plans.size() - showPlans) > 0) {
    					errText += String.format(" та ще у %d %s"
        						, (plans.size() - showPlans)
        						, (plans.size() - showPlans) == 1 ? "наряді" : "нарядах");
    				}
    			}
    			if(showFKOrders > 0) {
    				errText += (showPlans == 0) ? String.format("\n Ці матеріали використовуються у ордерах: ") : "\n та у ордерах: ";
    				int count = 0;
    				for(String orderNum : fkOrders) {
    					if(count == showFKOrders) break;
    					errText += String.format("\n %s ", orderNum);
    					count++;
    				}
    				if((fkOrders.size() - showFKOrders) > 0) {
    					errText += String.format(" та ще у %d %s"
        						, (fkOrders.size()  - showFKOrders)
        						, (fkOrders.size()  - showFKOrders) == 1 ? "ордері" : "ордерах");
    				}
    			}
    			if(showUmcDocs > 0) {
    				errText += (showPlans == 0 && showFKOrders == 0) ? String.format("\n Ці матеріали використовуються у документах програми \"Облік матеріалів\": ") : "\n та у документах програми \"Облік матеріалів\": ";
    				int count = 0;
    				for(String umcDoc : umcDocs) {
    					if(count == showUmcDocs) break;
    					errText += String.format("\n %s ", umcDoc);
    					count++;
    				}
    				if((umcDocs.size() - showUmcDocs) > 0) {
    					errText += String.format(" та ще у %d %s"
        						, (umcDocs.size() - showUmcDocs)
        						, (umcDocs.size() - showUmcDocs) == 1 ? "ордері" : "ордерах");
    				}
    			}

    		} else {
    			errText += ".";
    		}
    		throw new EnergyproSystemException(errText);
    	}

    }



    private AbstractMap.SimpleImmutableEntry<Integer, Integer> getFinDocTypeAndIdUnmountByMaterialAccount(String account) {
    	if(account == null || account.length() != 4) {
    		throw new java.lang.IllegalArgumentException();
    	}
    	
    	AbstractMap.SimpleImmutableEntry<Integer, Integer> result = null;
    	
    	if(account.startsWith("03")) {
    		result = new AbstractMap.SimpleImmutableEntry<Integer, Integer>(com.ksoe.fin.valueobject.FINDocType.MOVE_3
    				, com.ksoe.fin.valueobject.FINDocType.v3);
    	} else if(account.equals("0230")) {
    		result = new AbstractMap.SimpleImmutableEntry<Integer, Integer>(com.ksoe.fin.valueobject.FINDocType.MOVE_46
    				, com.ksoe.fin.valueobject.FINDocType.v46);
    	} else if(account.startsWith("20")) {
    		result = new AbstractMap.SimpleImmutableEntry<Integer, Integer>(com.ksoe.fin.valueobject.FINDocType.MOVE_30
    				, com.ksoe.fin.valueobject.FINDocType.v30);
    	}
    	
    	if(result == null) {
    		throw new SystemException(String.format("Неможливо визначити вид операції для демонтажу для рахунку \"%s\"", account));
    	}
    	
		return result;
    	
    }

    public void createDOCFromActUnmount(ENAct act) throws PersistenceException, DatasourceConnectException
    {

        FINMaterialsDAO mDAO = new FINMaterialsDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINDoc2MolDataDAO d2mDAO = new FINDoc2MolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

        AuthLogic netAuth = new AuthLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        mDaxLogic mdLogic = new mDaxLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        AXTransactionsLogic axLogic = new AXTransactionsLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        int writeOffTmcConf = netAuth.checkUsesDataForWriteOff();

        FINMaterialsFilter mFilter = new FINMaterialsFilter();
        mFilter.statusRef.code = FINMaterialsStatus.GOOD;

        mFilter.conditionSQL = "estimateitemrefcode in ("+
                "select e.code from enact2enplanwork a2p, enestimateitem e where " +
                " a2p.actrefcode = " + act.code + " and a2p.plancode = e.planrefcode " +
                " and e.kindrefcode = " + ENEstimateItemKind.UNMOUNT +
                " and e.accountingtyperefcode = " + TKAccountingType.TMC +
                ")";
        // SUPP-86313 Отсортируем по счету в обратном порядке, 
        // чтобы забаланс не вылазил первым 
        mFilter.orderBySQL = "bal_sch DESC";
        
        //FINMaterialsShortList mList = mDAO.getScrollableFilteredList(mFilter, 0, -1);
        int[] mArr = mDAO.getFilteredCodeArray(mFilter, 0, -1);

        if (mArr.length == 0) return;

        // креатим документы ...
        FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);
        ENElementDAO elDAO = new ENElementDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        ENElementShort el = elDAO.getShortObject(act.element.code);

        FINMaterials m = mDAO.getObject(mArr[0]);
        
        AbstractMap.SimpleImmutableEntry<Integer, Integer> finDocTypeAndId = this.getFinDocTypeAndIdUnmountByMaterialAccount(m.bal_sch);

        /*
        *     public int createDocThead(String numberENDoc, Date dateENDoc, int operationCode, String molCode, int parentDoc, String userName, String Via_who
    ,String Nakl_num, Date Nakl_Date, String  Dov_Id_num, Date Dov_Date
    ,int agree_id , int partner_type, int doc_type, int partner_id
    , String sender_id, BigDecimal pay_sum, BigDecimal nds_prc, BigDecimal nds_sum
    , String commentGen

        */

    int finDOCCode = fkLogic2.CreateDocument();
    boolean isErr = true;

    try
    {
        fkLogic2.UpdateDocumentShort4Unmount(act.numberGen, finDocTypeAndId.getValue(), m.div_code, m.div_code, act.dateGen, new BigDecimal(0), "инв.№ " + el.objectInvNumber);
        fkLogic2.SaveDocument(finDOCCode);
        isErr = false;
    }
    catch (Exception e){
        //fkLogic2.Drop_Document(docArr[0]);
        throw new EnergyproSystemException(e.getMessage());
    }
    finally
    {
        fkLogic2.CancelDocumentHackFK(isErr);
    }

    FINMolDataDAO molDataDAO = new FINMolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

    FINMolDataFilter molDataFilter = new FINMolDataFilter();
    molDataFilter.act.code = act.code;
    molDataFilter.molTypeRef.code = FINMolType.MASTER;
    int[] molDataArr = molDataDAO.getFilteredCodeArray(molDataFilter, 0, -1);
    if ( molDataArr.length != 1 ){
        throw new EnergyproSystemException("Не знайдено данні про МВО майстра для акту, код акта = " + act.code);
    }

    String axDOCCode = "";
    // ympMDAX MDAXWriteOff создание журнала на приход демонтированных материалов
     if (writeOffTmcConf == 1 || writeOffTmcConf == 2) {
    	 axDOCCode = mdLogic.createDocument(act.numberGen , act.dateGen ,  ""+finDocTypeAndId.getValue() , m.div_code  , "PW");
     }

    FINDoc2MolData d2m = new FINDoc2MolData();
    d2m.molData.code = molDataArr[0];
    d2m.finDocCode = finDOCCode;
    d2m.axJournalId = axDOCCode;
    d2m.finDocTypeRef.code = finDocTypeAndId.getKey();
    d2mDAO.add(d2m);

    BigDecimal sumDoc;
    isErr = true;
    fkLogic2.OpenDocument(finDOCCode);
    try
    {
        for (int i=0; i < mArr.length; i++){
            FINMaterials mm = mDAO.getObject(mArr[i]);
            //fkLogic2.addString(mm, RQConsts.REST_PURPOSE_ID_OPERATIVE, RQConsts.REST_PURPOSE_ID_OPERATIVE);

            /*
                sumDoc = fkLogic2.getDocStrings();
                fkLogic2.UpdateDocumentShort(
                        woList.get(n).workOrderNumber,
                        opType,
                        m.div_code,
                        m.div_code,
                        act.dateGen,
                        sumDoc,
                        Via_who
                        );
            */

            if (writeOffTmcConf == 1 || writeOffTmcConf == 2) {
				String usr = axLogic.getUserSecurity().domainUserName;
				String pwd = axLogic.getUserSecurity().userPass;

				InventMovementLinesKSService_Service service = new InventMovementLinesKSService_Service();
				InventMovementLinesKSService proxy = service.getBasicHttpBindingInventMovementLinesKSService();
				((BindingProvider) proxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
				((BindingProvider) proxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

				 MovementJournalLinesCreate movementJournalLinescreator = new MovementJournalLinesCreate(proxy);

                 String[] result = {"","",""};

                 String siteId = mdLogic.getAxDepartmentByMol(mm.div_code);
   				 if(siteId.equals("")) {
   					 throw new EnergyproSystemException("Помилка siteId by mol_code " + mm.div_code  +  "  not found !!!!!  ");
   				 }

                result = movementJournalLinescreator.createInventMovementLines( axDOCCode , // (InventJournalTable).JournalNameId
                		mm.ax_frc_code , // цфо  DimensionOffset[6]
                		mm.ax_rest_purpose_typeid, // назначение  DimensionOffset[9]
                		mm.ax_frc_code , // цфо корр DimensionOffset[6]
                		mm.ax_rest_purpose_typeid, // назначение корр DimensionOffset[9]
                		mm.nn , // Идентификатор мате-риала  ItemId
						    siteId ,// Код сайта	InventDimIssue.InventSiteId
						    mm.div_code, // Код организации-получателя	InventDimReceipt.InventLocationId
						    mm.bal_sch ,  // Балалансовый счет InventDimIssue.InventProfileId_RU
						    "", // InventJournalTrans.LedgerAccountIdOffset
						    mm.quantity , // Количество	InventJournalTrans.QtyInUnitOpr_UA
						    mm.mu_name , // Ед. изм	InventJournalTrans.UnitIdOpr_UA
						    "" /*fm.ax_party_id*/ , //  Идентификатор партии	InventDimIssue.inventBatchId
						    mm.ax_rest_purpose_id , // InventDimIssue.wMSLocationId
						    act.dateGen ,
						    mm.axInventDimFinId , // код фин аналитики
						    mm.price , // цена
						    false // кол-во положиельно ( получение )
				    		);

                     // айдишник аксаптовый строки fm

                     mm.axInventTransferLinesCode = result[0];
                     mm.price = new BigDecimal(result[1]);
                     mm.cost = new BigDecimal(result[2]);
                    /*!!!! mdax по RecId вытянем строку журнала и возьмем оттуда партию */

                    String axPatryId = "";
                    List<AxdEntityInventJournalTrans> retInventJournalTransList = movementJournalLinescreator.FindInventJournalTrans(mm.axInventTransferLinesCode);
                    if(retInventJournalTransList.isEmpty() ) {
                    	throw new EnergyproSystemException( " Помилка при визначенні партії в Axapta(1)!!!!" );
                    } else if(!retInventJournalTransList.isEmpty() )
                    {
                    	AxdEntityInventJournalTrans retInventJournalTrans = retInventJournalTransList.get(0);

                    	System.out.println("for RECID " + mm.axInventTransferLinesCode +" AX_Batch_id = " + retInventJournalTrans.getInventDim().get(0).getInventBatchId().getValue());
                        axPatryId = retInventJournalTrans.getInventDim().get(0).getInventBatchId().getValue();

                        if (axPatryId== null || axPatryId.equals("")) {
                        	throw new EnergyproSystemException( " Помилка при визначенні партії в Axapta(2)!!!!" );
                        }
                    }



                    mm.ax_party_id =  axPatryId;
                    mm.party_id = Integer.parseInt(mm.ax_party_id);
                    mDAO.save(mm);
                }

            if(mm.bal_sch.startsWith("20")) {
            	TStringAdditionalParams params = new TStringAdditionalParams();
            	params.setRest_purpose_id_from(RQConsts.REST_PURPOSE_ID_OPERATIVE);
            	params.setRest_purpose_id_to(RQConsts.REST_PURPOSE_ID_OPERATIVE);
            	params.setKor_kau("00000000000");
            	params.setKor_sch("7463");
            	fkLogic2.addString(mm, params);	
            } else {
                fkLogic2.addString(mm, RQConsts.REST_PURPOSE_ID_OPERATIVE, RQConsts.REST_PURPOSE_ID_OPERATIVE);	
            }
        }

        sumDoc = fkLogic2.getDocStrings();

        fkLogic2.UpdateDocumentShort4Unmount(
                act.numberGen,
                finDocTypeAndId.getValue(),
                m.div_code,
                m.div_code,
                act.dateGen,
                sumDoc,
                "инв.№ " + el.objectInvNumber
        );


      fkLogic2.SaveDocument(finDOCCode);
      isErr = false;
    }
    catch (Exception e){
        //fkLogic2.Drop_Document(docArr[0]);
        throw new EnergyproSystemException(e.getMessage());
    }
    finally{
        fkLogic2.CancelDocumentHackFK(isErr);
    }

	    // Если акт проводится с применением ЭЦП, будем проводить под юзером energynet
		ActLogic actLogic = new ActLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
		String userName = actLogic.getUserNameForFK(act.code);

    	// изменим пользователя ... шоб бухи апдейтили из ФК ;)
	    fkLogic2.setUser4DOC(finDOCCode, userName);
	    
	    fkLogic2.alterSession(connection);
	    fkLogic2.createRealtimeProv(finDOCCode);
    }

    /**
     *
     * Создание приходных ордеров от производства из акта на производство
     *
     * @param act Акт на производство
     */
    public void createRQFKOrderFromActProduced(ENAct act) {
    	Connection enConn = null;
    	try {
            if(act.actTypeRef.code != ENPlanWorkState.PRODUCTION) {
                throw new EnergyproSystemException("Зробити прибуткові ордери на виготовлені матеріали можна тільки для актів типу 'Виготовлення'");
            }
            enConn = getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

            Vector<Integer> currentPlansCodes = new Vector<Integer>();
            Vector<FINMaterials> finMatsToAdd = new Vector<FINMaterials>();
            Hashtable<Integer, Integer> currentMonthCodes2EstimateCodes = new Hashtable<Integer, Integer>();
            Hashtable<Integer, BigDecimal> estimate2Counts = new Hashtable<Integer, BigDecimal>();
            Hashtable<String, Vector<FINMaterials>> hashMol2FINMaterials = new Hashtable<String, Vector<FINMaterials>>();
            Hashtable<String, BigDecimal> hashMol2Sum = new Hashtable<String, BigDecimal>();
            Hashtable<String, RQFKOrder> hashMol2FKOrder = new Hashtable<String, RQFKOrder>();

            FINMaterialsDAO mDAO = new FINMaterialsDAO(enConn, userProfile);
            FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, enConn);
            FKLogic fkLogic = new FKLogic(connection, userProfile);
            RQFKOrderDAO fkOrderDao = new RQFKOrderDAO(userProfile, enConn);
            PlanWorkLogic planWorkLogic = new PlanWorkLogic(enConn, userProfile);
            ENEstimateItemDAO estimateDao = new ENEstimateItemDAO(enConn, userProfile);
        	ENEstimateItem2PlanDAO estimate2planDao = new ENEstimateItem2PlanDAO(enConn, userProfile);
            ENAct2RQFKOrderDAO act2fkOrderDao = new ENAct2RQFKOrderDAO(enConn, userProfile);
            RQFKOrderItem2ENEstimateItemDAO fkOrderItem2EstimateItemDao = new RQFKOrderItem2ENEstimateItemDAO(enConn, userProfile);

            FINMaterialsFilter mFilter = new FINMaterialsFilter();
            mFilter.statusRef.code = FINMaterialsStatus.GOOD;

            mFilter.conditionSQL = "estimateitemrefcode in ("+
                    "select e.code from enact2enplanwork a2p, enestimateitem e where " +
                    " a2p.actrefcode = " + act.code + " and a2p.plancode = e.planrefcode " +
                    " and e.kindrefcode = " + ENEstimateItemKind.PRODUCED +
                    " and e.accountingtyperefcode = " + TKAccountingType.TMC +
                    ")";
            int[] mArr = mDAO.getFilteredCodeArray(mFilter, 0, -1);

            if (mArr.length == 0) return;

            for(int i = 0; i < mArr.length; i++) {
                FINMaterials m = mDAO.getObject(mArr[i]);

            	if(m.estimateItemRef == null || m.estimateItemRef.code == Integer.MIN_VALUE) {
            		throw new EnergyproSystemException("Немає даних - estimateItemRef.code of FINMaterials is NULL");
            	}
            	ENEstimateItem estimate = estimateDao.getObject(m.estimateItemRef.code);
            	int currentPlanCode = planWorkLogic.getParentCurrentPlanCode(estimate.planRef.code);

            	if(!currentPlansCodes.contains(currentPlanCode)) {
            		currentPlansCodes.add(currentPlanCode);


                	ENEstimateItem2PlanFilter estimate2PlanFilter = new ENEstimateItem2PlanFilter();
                	estimate2PlanFilter.typeRef.code = ENEstimateItem2PlanType.OWN_PRODUCTION;
                	estimate2PlanFilter.planRef.code = currentPlanCode;
                	estimate2PlanFilter.orderBySQL = " (SELECT pw1." + ENPlanWork.dateStart_Field + " from " +
                										" " + ENPlanWork.tableName + " as pw1 " +
                										" inner join " + ENEstimateItem.tableName + " as es1 on es1." + ENEstimateItem.planRef_Field + " = pw1." + ENPlanWork.code_Field +
                										" where es1." + ENEstimateItem.code_Field + " = " + ENEstimateItem2Plan.estimateItemRef_QFielld +
                										") asc";

                	ENEstimateItem2PlanShortList estimate2PlanList = estimate2planDao.getScrollableFilteredList(estimate2PlanFilter, 0, -1);

                	for(int z = 0; z < estimate2PlanList.totalCount; z++) {
                		if(!currentMonthCodes2EstimateCodes.contains(estimate2PlanList.get(z).estimateItemRefCode)) {
                			currentMonthCodes2EstimateCodes.put(currentPlanCode, estimate2PlanList.get(z).estimateItemRefCode);
                			ENEstimateItem monthEstimate = estimateDao.getObject(estimate2PlanList.get(z).estimateItemRefCode);
                			BigDecimal quantity = monthEstimate.countFact;

                			RQFKOrderItem2ENEstimateItemFilter fkOrderItem2EstimateFilter = new RQFKOrderItem2ENEstimateItemFilter();
                			fkOrderItem2EstimateFilter.estimateItem.code = monthEstimate.code;
                			fkOrderItem2EstimateFilter.conditionSQL = " EXISTS (select 1 from " + RQFKOrderItem2ENEstimateItem.tableName + " as fies1 inner join " +
                														"" + RQFKOrderItem.tableName + " as fi1 on fies1." + RQFKOrderItem2ENEstimateItem.fkOrderItemRef_Field + " = fi1." + RQFKOrderItem.code_Field +
                														" inner join " + RQFKOrder.tableName + " as fo1 on fi1." + RQFKOrderItem.fkOrderRef_Field + " = fo1." + RQFKOrder.code_Field +
                														" inner join " + ENAct2RQFKOrder.tableName + " as af1 on fo1." + RQFKOrder.code_Field + " = af1." + ENAct2RQFKOrder.fkOrderRef_Field +
                														" where fies1." + RQFKOrderItem2ENEstimateItem.code_Field + " = " +RQFKOrderItem2ENEstimateItem.code_QFielld +
                														" and fo1." + RQFKOrder.kind_Field + " = " + RQFKOrderKind.PRIHOD_POSTAVKA +
                														" and af1." + ENAct2RQFKOrder.typeRef_Field + " = " + ENAct2RQFKOrderType.PRODUCTION +
                														" and af1." + ENAct2RQFKOrder.actRef_Field + " <> " + act.code +
                														")";

                			RQFKOrderItem2ENEstimateItemShortList fkOrderItem2EstimateList = fkOrderItem2EstimateItemDao.getScrollableFilteredList(fkOrderItem2EstimateFilter, 0, -1);
                			for(int j = 0; j < fkOrderItem2EstimateList.totalCount; j++) {
                				quantity = quantity.subtract(fkOrderItem2EstimateList.get(j).countGen);
                			}

                			if(quantity.compareTo(new BigDecimal(0)) < 0) {
                				quantity = new BigDecimal(0);
                			}

                			estimate2Counts.put(monthEstimate.code, quantity);
                		}
                	}
            	}

                m.code = Integer.MIN_VALUE;
                m.molDataRef.code = Integer.MIN_VALUE;

                boolean isNotNeeded = false;
                while(m.quantity.compareTo(new BigDecimal(0)) == 1 && (!isNotNeeded)) {
                	Enumeration<Integer> e = estimate2Counts.keys();
                	int countWithZeros = 0;
                	while(e.hasMoreElements()) {
                		int estimateCode = e.nextElement();
                		BigDecimal estimateQty = estimate2Counts.get(estimateCode);
                		if(estimateQty.compareTo(new BigDecimal(0)) == 0) {
                			countWithZeros += 1;
                			continue;
                		} else {
            				FINMaterials matToAdd = mDAO.copy(m);
            				matToAdd.code = Integer.MIN_VALUE;
            				matToAdd.estimateItemRef.code = estimateCode;
            				if(m.quantity.compareTo(new BigDecimal(0)) == 0) {
            					break;
            				}
                			switch(m.quantity.compareTo(estimateQty)) {
                			case -1:
                				matToAdd.quantity = m.quantity;
                				m.quantity = new BigDecimal(0);
                				estimate2Counts.put(estimateCode, estimateQty.subtract(matToAdd.quantity));
                				break;
                			case 0:
                			case 1:
                				matToAdd.quantity = estimateQty;
                				m.quantity = m.quantity.subtract(estimateQty);
                				estimate2Counts.put(estimateCode, new BigDecimal(0));
                				break;
                			}
                			int storageZone = fkOrderLogic.getZoneForRestPurposeId(matToAdd.rest_purpose_id);

                			matToAdd.cost = matToAdd.quantity.multiply(matToAdd.price).setScale(2, BigDecimal.ROUND_HALF_UP);
                			matToAdd.rest_purpose_type_id = RQConsts.REST_PURPOSE_TYPE_ID_TRANZIT;
                			matToAdd.rest_purpose_id = fkOrderLogic.getRestPurposeIdForZone(storageZone, RQConsts.REST_PURPOSE_ID_TRANZIT);
                			matToAdd.rest_purpose_name = fkLogic.getNameOfRest_purpose(matToAdd.rest_purpose_id);
                			finMatsToAdd.add(matToAdd);
                			if(hashMol2FINMaterials.containsKey(matToAdd.div_code)) {
                				Vector<FINMaterials> _vec = hashMol2FINMaterials.get(matToAdd.div_code);
                				_vec.add(matToAdd);
                				hashMol2FINMaterials.put(matToAdd.div_code, _vec);
                			} else {
                				Vector<FINMaterials> _vec = new Vector<FINMaterials>();
                				_vec.add(matToAdd);
                				hashMol2FINMaterials.put(matToAdd.div_code, _vec);
                			}
                		}
                	}
                	if(countWithZeros == estimate2Counts.size()) {
                		isNotNeeded = true;
                	}
                }

                // Если изготовленного материала хватило, на все связанные эстимейты и еще осталось,
                // тогда оставшееся количество раздается на первый попавшийся материал в оперативном запасе
                if(m.quantity.compareTo(new BigDecimal(0)) == 1) {
                	Enumeration<Integer> e = estimate2Counts.keys();
                	int estimateCode = e.nextElement();
        			int storageZone = fkOrderLogic.getZoneForRestPurposeId(m.rest_purpose_id);
                	m.estimateItemRef.code = estimateCode;
        			m.cost = m.quantity.multiply(m.price).setScale(2, BigDecimal.ROUND_HALF_UP);
        			m.rest_purpose_id = fkOrderLogic.getRestPurposeIdForZone(storageZone, RQConsts.REST_PURPOSE_ID_OPERATIVE);
        			m.rest_purpose_type_id = RQConsts.REST_PURPOSE_TYPE_ID_NET_OPERATIVE;
        			m.rest_purpose_name = fkLogic.getNameOfRest_purpose(m.rest_purpose_id);
                	finMatsToAdd.add(m);

        			if(hashMol2FINMaterials.containsKey(m.div_code)) {
        				Vector<FINMaterials> _vec = hashMol2FINMaterials.get(m.div_code);
        				_vec.add(m);
        				hashMol2FINMaterials.put(m.div_code, _vec);
        			} else {
        				Vector<FINMaterials> _vec = new Vector<FINMaterials>();
        				_vec.add(m);
        				hashMol2FINMaterials.put(m.div_code, _vec);
        			}
                }


            }

            if(finMatsToAdd.size() == 0) {
            	throw new EnergyproSystemException("Помилка у кількості матеріалів!");
            }

            Enumeration<String> enumMols = hashMol2Sum.keys();
            while(enumMols.hasMoreElements()) {
            	String _mol = enumMols.nextElement();
            	Vector<FINMaterials> finMatDistributed = hashMol2FINMaterials.get(_mol);
            	BigDecimal _sum = hashMol2Sum.get(_mol);
            	BigDecimal _sumDistributed = new BigDecimal(0);
            	for(FINMaterials _mat : finMatDistributed) {
            		_sumDistributed = _sumDistributed.add(_mat.cost);
            	}

            	if(_sum.compareTo(_sumDistributed) != 0) {
            		BigDecimal diff = _sum.subtract(_sumDistributed);
            		BigDecimal _diff = null;
            		switch(diff.compareTo(new BigDecimal(0))) {
            		case 1:
            			_diff = diff;
                    	for(FINMaterials _mat : finMatDistributed) {
                    		if(_diff.compareTo(new BigDecimal(0)) == 1) {
                        		_mat.cost = _mat.cost.add(new BigDecimal(0.01));
                        		_diff = _diff.subtract(new BigDecimal(0.01));
                    		} else {
                    			break;
                    		}
                    	}
            			break;
            		case -1:
            			_diff = diff.multiply(new BigDecimal(-1));
                    	for(FINMaterials _mat : finMatDistributed) {
                    		if(_mat.cost.compareTo(new BigDecimal(0.01)) == 1 && _diff.compareTo(new BigDecimal(0)) == 1) {
                        		_mat.cost = _mat.cost.subtract(new BigDecimal(0.01));
                        		_diff = _diff.subtract(new BigDecimal(0.01));
                    		} else {
                    			break;
                    		}
                    	}
            			break;
            			default:
            				break;
            		}
            	}
            }

            BigDecimal _fullCostDistributed = finMatsToAdd.get(0).fullCost;
            BigDecimal _sum = new BigDecimal(0);
            for(FINMaterials m : finMatsToAdd) {
            	_sum = _sum.add(m.cost);
            }
        	if(_sum.compareTo(_fullCostDistributed) != 0) {
        		BigDecimal diff = _sum.subtract(_fullCostDistributed);
        		BigDecimal _diff = null;
        		switch(diff.compareTo(new BigDecimal(0))) {
        		case 1:
        			_diff = diff;
                	for(FINMaterials _mat : finMatsToAdd) {
                		if(_diff.compareTo(new BigDecimal(0)) == 1) {
                    		_mat.cost = _mat.cost.subtract(new BigDecimal(0.01));
                    		_diff = _diff.subtract(new BigDecimal(0.01));
                		} else {
                			break;
                		}
                	}
        			break;
        		case -1:
        			_diff = diff.multiply(new BigDecimal(-1));
                	for(FINMaterials _mat : finMatsToAdd) {
                		if(_mat.cost.compareTo(new BigDecimal(0.01)) == 1 && _diff.compareTo(new BigDecimal(0)) == 1) {
                    		_mat.cost = _mat.cost.add(new BigDecimal(0.01));
                    		_diff = _diff.subtract(new BigDecimal(0.01));
                		} else {
                			break;
                		}
                	}
        			break;
        			default:
        				break;
        		}
        	}

        	for(FINMaterials m : finMatsToAdd) {
    			RQFKOrder fkOrderObject = null;
    			BigDecimal cost = m.cost;

    			if(hashMol2FKOrder.containsKey(m.div_code)) {
    				fkOrderObject = hashMol2FKOrder.get(m.div_code);
    				fkOrderObject.sumWithoutNds = fkOrderObject.sumWithoutNds.add(cost);
    				fkOrderDao.save(fkOrderObject);
    			} else {
    				fkOrderObject = new RQFKOrder();
        			fkOrderObject.code = Integer.MIN_VALUE;
        			fkOrderObject.numberDoc = act.numberGen;
        			fkOrderObject.dateGen = act.dateGen;
        			fkOrderObject.userGen = userProfile.userName;
        			fkOrderObject.domain_info = userProfile.domainInfo.domain;
        			fkOrderObject.kind.code = RQFKOrderKind.PRIHOD_POSTAVKA;
        			fkOrderObject.status.code = RQFKOrderStatus.GOOD;
        			fkOrderObject.molInCode = m.div_code;
        			fkOrderObject.molInName = m.div_name;
        			fkOrderObject.molOutCode = m.div_code;
        			fkOrderObject.molOutName = m.div_name;
        			fkOrderObject.department.code = ENDepartment.ENDEPARTMENT_HOE;
        			fkOrderObject.datePosting = act.dateGen;
        			fkOrderObject.sumWithoutNds = cost;
        			fkOrderObject.accountingTypeRef.code = TKAccountingType.TMC;
        			fkOrderObject.code = fkOrderLogic.createRQFKOrder(fkOrderObject);

        			// Создание связки
        			ENAct2RQFKOrder act2fkOrder = new ENAct2RQFKOrder();
        			act2fkOrder.actRef.code = act.code;
        			act2fkOrder.fkOrderRef.code = fkOrderObject.code;
        			act2fkOrder.typeRef.code = ENAct2RQFKOrderType.PRODUCTION;
        			act2fkOrderDao.add(act2fkOrder);
        			hashMol2FKOrder.put(m.div_code, fkOrderObject);

    			}

    			if(hashMol2Sum.containsKey(m.div_code)) {
    				BigDecimal _temp = hashMol2Sum.get(m.div_code);
    				_temp = _temp.add(cost);
    				hashMol2Sum.put(m.div_code, _temp);
    			} else {
    				hashMol2Sum.put(m.div_code, cost);
    			}
        	}

            for(int i = 0; i < finMatsToAdd.size(); i++) {
            	FINMaterials matAdd = finMatsToAdd.get(i);
            	RQFKOrder fkOrderObject = hashMol2FKOrder.get(matAdd.div_code);
            	fkOrderLogic.createPrihodString(matAdd, fkOrderObject);
            }

            Context context = new InitialContext();
            Object objRef = context.lookup(RQFKOrderController.JNDI_NAME);
            RQFKOrderControllerHome fkOrderHome = (RQFKOrderControllerHome) PortableRemoteObject.narrow(objRef, RQFKOrderControllerHome.class);
            RQFKOrderController fkOrderController = fkOrderHome.create();

            Enumeration<RQFKOrder> e = hashMol2FKOrder.elements();
            while(e.hasMoreElements()) {
            	RQFKOrder fkOrderObject = e.nextElement();
            	fkOrderController.createdPrihod(fkOrderObject.code);
            }
    	} catch (DatasourceConnectException e) {
    		throw new EnergyproSystemException(e);
		} catch (RemoteException e) {
    		throw new EnergyproSystemException(e);
		} catch (PersistenceException e) {
    		throw new EnergyproSystemException(e);
		} catch (NamingException e) {
    		throw new EnergyproSystemException(e);
		} catch (CreateException e) {
    		throw new EnergyproSystemException(e);
		}
    	finally {
            try {
                if (enConn != null && ! enConn.isClosed()) {
                	enConn.close();
                	enConn = null;
                }
            } catch (SQLException e) {
            }

    	}

    }

    /**
     *
     * Проведение (отмена проведения) созданных ордеров на производство по акту на производство
     *
     * @param act акт на производство
     * @param isProv - проведение (true) или распроведение (false)
      */
    public void moveRQFKOrdersFromActProducedToFK(ENAct act, boolean isProv) {
    	try {
            if(act.actTypeRef.code != ENPlanWorkState.PRODUCTION) {
            	String action = "Провести прибуткові ордери на виготовлення";
            	if(!isProv) {
            		action = "Відмінити проведення прибуткових ордерів на виготовлення";
            	}

                throw new EnergyproSystemException(action + " можна тільки для актів типу 'Виготовлення'");
            }

			ENAct2RQFKOrderDAO act2FKOrderDao = new ENAct2RQFKOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
    		FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
    		RQFKOrderDAO fkOrderDao = new RQFKOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);


			ENAct2RQFKOrderFilter act2FKOrderFilter = new ENAct2RQFKOrderFilter();
			act2FKOrderFilter.actRef.code = act.code;
			act2FKOrderFilter.typeRef.code = ENAct2RQFKOrderType.PRODUCTION;

			ENAct2RQFKOrderShortList act2FKOrderList = act2FKOrderDao.getScrollableFilteredList(act2FKOrderFilter, 0, -1);



            for(int i = 0; i < act2FKOrderList.totalCount; i++) {
        		RQFKOrder fkOrder = fkOrderDao.getObject(act2FKOrderList.get(i).fkOrderRefCode);
            	if(isProv) {
                    fkOrderLogic.updateEnPlanworkAndEnEstimateStatus(fkOrder.code);
                    fkOrderLogic.movePrihodToFK_10_2(fkOrder.code);
                    fkOrder.status.code = RQFKOrderStatus.IN_FK;
            	} else {
            		fkOrderLogic.unMovePrihodToFK_10(act2FKOrderList.get(i).fkOrderRefCode);
            		fkOrder.status.code = RQFKOrderStatus.CREATED;
            	}
                fkOrderDao.save(fkOrder);
            }

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}
    }
    /**
     *
     * Удаление ордеров на производство по коду акта
     *
     * @param actCode акт на производство
      */
    public void deleteRQFKOrdersForProductionByAct(int actCode) {
    	try {
			ENAct2RQFKOrderDAO act2FKOrderDao = new ENAct2RQFKOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
			RQFKOrderDAO fkOrderDao = new RQFKOrderDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
			FKOrderLogic fkOrderLogic = new FKOrderLogic(userProfile, getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENAct2RQFKOrderFilter act2FKOrderFilter = new ENAct2RQFKOrderFilter();
			act2FKOrderFilter.actRef.code = actCode;
			act2FKOrderFilter.typeRef.code = ENAct2RQFKOrderType.PRODUCTION;

			ENAct2RQFKOrderShortList act2FKOrderList = act2FKOrderDao.getScrollableFilteredList(act2FKOrderFilter, 0, -1);

            for(int i = 0; i < act2FKOrderList.totalCount; i++) {
            	act2FKOrderDao.remove(act2FKOrderList.get(i).code);
            	RQFKOrder fkOrder = fkOrderDao.getObject(act2FKOrderList.get(i).fkOrderRefCode);
            	fkOrderLogic.removeCreatedPrihodWithStrings(fkOrder);
            }



		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		} finally {

		}
    }

    /**
     *
     * Проверка по коду акта (или расходного ордера), что с него были созданы автоматом расходные ордера
     * (или расходный ордер был автоматом создан с акта на производство)
     *
     * @param code код акта
     * @param isActCode - если <true> то посланный код - код акта, если нет - то код расходного ордера
     * @return <b>true</b> есть ордера на производство
     */
    public boolean checkActOrRQFKOrderForProductionLink(int code, boolean isActCode) {
    	try {
			ENAct2RQFKOrderDAO act2FKOrderDao = new ENAct2RQFKOrderDAO(connection, userProfile);

			ENAct2RQFKOrderFilter act2FKOrderFilter = new ENAct2RQFKOrderFilter();
			if(isActCode) {
				act2FKOrderFilter.actRef.code = code;
			} else {
				act2FKOrderFilter.fkOrderRef.code = code;
			}
			act2FKOrderFilter.typeRef.code = ENAct2RQFKOrderType.PRODUCTION;

			return act2FKOrderDao.getFilteredCodeArray(act2FKOrderFilter, 0, 1).length > 0;
    	} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}

    }

    public ENAct getActForProductionByRQFKOrderCode(int rqFkOrderCode) {
		try {
			ENAct2RQFKOrderDAO act2FKOrderDao = new ENAct2RQFKOrderDAO(connection, userProfile);
			ENActDAO actDao = new ENActDAO(connection, userProfile);

			ENAct2RQFKOrderFilter act2FKOrderFilter = new ENAct2RQFKOrderFilter();
			act2FKOrderFilter.fkOrderRef.code = rqFkOrderCode;
			act2FKOrderFilter.typeRef.code = ENAct2RQFKOrderType.PRODUCTION;

			ENAct2RQFKOrderShortList act2fkOrderList = act2FKOrderDao.getScrollableFilteredList(act2FKOrderFilter, 0, -1);

			if(act2fkOrderList.totalCount != 1) {
				throw new EnergyproSystemException("Error in count of act2rqfkorder");
			}

			return actDao.getObject(act2fkOrderList.get(0).actRefCode);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}

    }
    public void createDOCFromActProduced(ENAct act) throws PersistenceException, DatasourceConnectException
    {
        FINMaterialsDAO mDAO = new FINMaterialsDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINDoc2MolDataDAO d2mDAO = new FINDoc2MolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        AuthLogic netAuth = new AuthLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        mDaxLogic mdLogic = new mDaxLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        AXTransactionsLogic axLogic = new AXTransactionsLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        int writeOffTmcConf = netAuth.checkUsesDataForWriteOff();

        FINMaterialsFilter mFilter = new FINMaterialsFilter();
        mFilter.statusRef.code = FINMaterialsStatus.GOOD;

        mFilter.conditionSQL = "estimateitemrefcode in ("+
                "select e.code from enact2enplanwork a2p, enestimateitem e where " +
                " a2p.actrefcode = " + act.code + " and a2p.plancode = e.planrefcode " +
                " and e.kindrefcode = " + ENEstimateItemKind.PRODUCED +
                " and e.accountingtyperefcode = " + TKAccountingType.TMC +
                ")";

        //FINMaterialsShortList mList = mDAO.getScrollableFilteredList(mFilter, 0, -1);
        int[] mArr = mDAO.getFilteredCodeArray(mFilter, 0, -1);

        /*Эта процедура только для актов Виготовлення */
        if(act.actTypeRef.code != ENPlanWorkState.PRODUCTION)
            throw new EnergyproSystemException("Провести виготовлені матеріали можна тільки для актів типу 'Виготовлення'");

        if (mArr.length == 0) return;

        // креатим документы ...
        FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);


        FINMaterials m = mDAO.getObject(mArr[0]);

        /*
        *     public int createDocThead(String numberENDoc, Date dateENDoc, int operationCode, String molCode, int parentDoc, String userName, String Via_who
    ,String Nakl_num, Date Nakl_Date, String  Dov_Id_num, Date Dov_Date
    ,int agree_id , int partner_type, int doc_type, int partner_id
    , String sender_id, BigDecimal pay_sum, BigDecimal nds_prc, BigDecimal nds_sum
    , String commentGen

        */

    int finDOCCode = fkLogic2.CreateDocument();
    boolean isErr = true;



    try
    {
        /*Воспользуемся функцией для демонтажа*/
        fkLogic2.UpdateDocumentShort4Unmount(act.numberGen, FINDocType.v15 , m.div_code, m.div_code, act.dateGen, new BigDecimal(0), "");
        fkLogic2.SaveDocument(finDOCCode);
        isErr = false;
    }
    catch (Exception e){
        //fkLogic2.Drop_Document(docArr[0]);
        throw new EnergyproSystemException(e.getMessage());
    }
    finally
    {
        fkLogic2.CancelDocumentHackFK(isErr);
    }

    String axDOCCode = "";
    // ympMDAX MDAXWriteOff создание журнала на приход изготовленных материалов
     if (writeOffTmcConf == 1 || writeOffTmcConf == 2) {
    	 axDOCCode = mdLogic.createDocument(act.numberGen , act.dateGen ,  ""+FINDocType.v15 , m.div_code  , "PW");
     }

    FINMolDataDAO molDataDAO = new FINMolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

    FINMolDataFilter molDataFilter = new FINMolDataFilter();
    molDataFilter.act.code = act.code;
    molDataFilter.molTypeRef.code = FINMolType.MASTER;
    int[] molDataArr = molDataDAO.getFilteredCodeArray(molDataFilter, 0, -1);
    if ( molDataArr.length != 1 ){
        throw new EnergyproSystemException("Не знайдено данні про МВО майстра для акту, код акта = " + act.code);
    }

    FINDoc2MolData d2m = new FINDoc2MolData();
    d2m.molData.code = molDataArr[0];
    d2m.finDocCode = finDOCCode;
    d2m.axJournalId = axDOCCode;
    d2m.finDocTypeRef.code = FINDocType.MOVE_15;
    d2mDAO.add(d2m);

    BigDecimal sumDoc;
    isErr = true;
    fkLogic2.OpenDocument(finDOCCode);
    try {
    	Hashtable<Integer, FINMaterials> restPurposeToFINMaterials = new Hashtable<Integer, FINMaterials>();
        for (int i=0; i < mArr.length; i++){
            FINMaterials mm = mDAO.getObject(mArr[i]);

        	if(i == 0) {
        		restPurposeToFINMaterials.put(mm.rest_purpose_id, mm);
        	} else {
        		if(restPurposeToFINMaterials.containsKey(mm.rest_purpose_id)) {
        			FINMaterials tempObj = restPurposeToFINMaterials.get(mm.rest_purpose_id);
        			tempObj.quantity = tempObj.quantity.add(mm.quantity);
        			restPurposeToFINMaterials.put(tempObj.rest_purpose_id, tempObj);
        		} else {
            		restPurposeToFINMaterials.put(mm.rest_purpose_id, mm);
        		}
        	}
        }

    	Enumeration<FINMaterials> enumeration = restPurposeToFINMaterials.elements();
    	while(enumeration.hasMoreElements()) {
    		FINMaterials tempObj = enumeration.nextElement();
    		tempObj.cost = tempObj.fullCost;
    		tempObj.quantity = tempObj.fullQuantity;

    		if (writeOffTmcConf == 1 || writeOffTmcConf == 2) {
				String usr = axLogic.getUserSecurity().domainUserName;
				String pwd = axLogic.getUserSecurity().userPass;

				InventMovementLinesKSService_Service service = new InventMovementLinesKSService_Service();
				InventMovementLinesKSService proxy = service.getBasicHttpBindingInventMovementLinesKSService();
				((BindingProvider) proxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
				((BindingProvider) proxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

				 MovementJournalLinesCreate movementJournalLinescreator = new MovementJournalLinesCreate(proxy);

                 String[] result = {"","",""};

                 String siteId = mdLogic.getAxDepartmentByMol(tempObj.div_code);
   				 if(siteId.equals("")) {
   					 throw new EnergyproSystemException("Помилка siteId by mol_code " + tempObj.div_code  +  "  not found !!!!!  ");
   				 }

                result = movementJournalLinescreator.createInventMovementLines( axDOCCode , // (InventJournalTable).JournalNameId
                		tempObj.ax_frc_code , // цфо  DimensionOffset[6]
                		tempObj.ax_rest_purpose_typeid, // назначение  DimensionOffset[9]
                		tempObj.ax_frc_code , // цфо корр DimensionOffset[6]
                		tempObj.ax_rest_purpose_typeid, // назначение корр DimensionOffset[9]
                		tempObj.nn , // Идентификатор мате-риала  ItemId
						    siteId ,// Код сайта	InventDimIssue.InventSiteId
						    tempObj.div_code, // Код организации-получателя	InventDimReceipt.InventLocationId
						    tempObj.bal_sch ,  // Балалансовый счет InventDimIssue.InventProfileId_RU
						 "", // InventJournalTrans.LedgerAccountIdOffset
						    tempObj.quantity , // Количество	InventJournalTrans.QtyInUnitOpr_UA
						    tempObj.mu_name , // Ед. изм	InventJournalTrans.UnitIdOpr_UA
						    "" /*fm.ax_party_id*/ , //  Идентификатор партии	InventDimIssue.inventBatchId
						    tempObj.ax_rest_purpose_id , // InventDimIssue.wMSLocationId
						    act.dateGen ,
						    tempObj.axInventDimFinId , // код фин аналитики
						    tempObj.price , // цена
						    false // кол-во положиельно ( получение )
				    		);

                     // айдишник аксаптовый строки fm

                    tempObj.axInventTransferLinesCode = result[0];
                    tempObj.price = new BigDecimal(result[1]);
                    tempObj.cost = new BigDecimal(result[2]);
                    /*!!!! mdax по RecId вытянем строку журнала и возьмем оттуда партию */

                    String axPatryId = "";
                    List<AxdEntityInventJournalTrans> retInventJournalTransList = movementJournalLinescreator.FindInventJournalTrans(tempObj.axInventTransferLinesCode);
                    if(retInventJournalTransList.isEmpty() ) {
                    	throw new EnergyproSystemException( " Помилка при визначенні партії в Axapta(1)!!!!" );
                    } else if(!retInventJournalTransList.isEmpty() )
                    {
                    	AxdEntityInventJournalTrans retInventJournalTrans = retInventJournalTransList.get(0);

                        axPatryId = retInventJournalTrans.getInventDim().get(0).getInventBatchId().getValue();
                        if (axPatryId== null || axPatryId.equals("")) {
                        	throw new EnergyproSystemException( " Помилка при визначенні партії в Axapta(2)!!!!" );
                        }
                    }



                    tempObj.ax_party_id =  axPatryId;
                    tempObj.party_id = Integer.parseInt(tempObj.ax_party_id);
                    mDAO.save(tempObj);
                }

    		fkLogic2.addString(tempObj, tempObj.rest_purpose_id, tempObj.rest_purpose_id);
    	}

        sumDoc = fkLogic2.getDocStrings();

        fkLogic2.UpdateDocumentShort4Unmount(
                act.numberGen,
                FINDocType.v15,
                m.div_code,
                m.div_code,
                act.dateGen,
                sumDoc,
                ""
        );


      fkLogic2.SaveDocument(finDOCCode);
      isErr = false;
    } catch (Exception e){
        //fkLogic2.Drop_Document(docArr[0]);
        throw new EnergyproSystemException(e.getMessage());
    } finally{
        fkLogic2.CancelDocumentHackFK(isErr);
    }

	    // Если акт проводится с применением ЭЦП, будем проводить под юзером energynet
    	ActLogic actLogic = new ActLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
		String userName = actLogic.getUserNameForFK(act.code);

		// изменим пользователя ... шоб бухи апдейтили из ФК ;)
	    fkLogic2.setUser4DOC(finDOCCode, userName);
    }


   /**
    *  Метод для проведения акта приема-передачи материалов заказчика в ФинКоллекции
    *  @param servicesObjectCode - код договора по услугам на сторону (ENServicesObject)
    */
    public void createDOCFromCustomerMaterials(int servicesObjectCode) throws PersistenceException, DatasourceConnectException
    {
        ENServicesObjectDAO servicesObjectDAO = new ENServicesObjectDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        ENServicesObject servicesObject = servicesObjectDAO.getObject(servicesObjectCode);
        FINMaterialsDAO mDAO = new FINMaterialsDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        ENEstimateItemDAO estimateDao = new ENEstimateItemDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

        ////////////////////////////////////////////////////////////////////////
        if (servicesObject.actTransferNumber == null)
        {
            throw new EnergyproSystemException("\n \n NET-3079 Не задано номер акту приймання-передачі! \n Код договору: " + servicesObject.code);
        }

        if (servicesObject.actTransferNumber.trim().equals(""))
        {
            throw new EnergyproSystemException("\n \n NET-3079 Не задано номер акту приймання-передачі! \n Код договору: " + servicesObject.code);
        }

        if (servicesObject.actTransferDate == null)
        {
            throw new EnergyproSystemException("\n \n NET-3079 Не задано дату акту приймання-передачі! \n Код договору: " + servicesObject.code);
        }
        
        int[] mArr = null;
        int[] planArr = null;
        
        if(servicesObject.contractTypeRef.code == ENServicesContractType.SHIFT_LINES) {
        	mArr = mDAO.getArrayofCustomerMaterialsCodes(servicesObject);
        	if(mArr.length > 0) {
            	FINMaterials finMat = mDAO.getObject(mArr[0]);
                ENEstimateItem estimate = estimateDao.getObjectNoSegr(finMat.estimateItemRef.code);
                planArr = new int[] {estimate.planRef.code};
        	}

        } else {
            ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
            planFilter.elementRef.code = servicesObject.element.code;
            planFilter.kind.code = ENPlanWorkKind.CURRENT;

            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);        

            if (planArr.length == 0)
            {
                throw new EnergyproSystemException("\n \n NET-3079 Не знайдено місячний план для договору з послуг на сторону! " +
                        "Код договору: " + servicesObject.code);
            }

            if (planArr.length > 1)
            {
                throw new EnergyproSystemException("\n \n NET-3079 Знайдено декілька (" + planArr.length +
                        ") місячних планів для договору з послуг на сторону! " +
                        "Код договору: " + servicesObject.code);
            }
            ////////////////////////////////////////////////////////////////////////


            
            FINMaterialsFilter mFilter = new FINMaterialsFilter();
            mFilter.statusRef.code = FINMaterialsStatus.GOOD;

            mFilter.conditionSQL = "estimateitemrefcode in ("+
                    "select e.code from enestimateitem e where " +
                    " e.planrefcode = " + planArr[0] +
                    " and e.kindrefcode = " + ENEstimateItemKind.CUSTOMER_MATERIALS +
                    " and e.countfact > 0 " +
                    " and e.accountingtyperefcode = " + TKAccountingType.TMC +
                    ")";

            //FINMaterialsShortList mList = mDAO.getScrollableFilteredList(mFilter, 0, -1);
            mArr = mDAO.getFilteredCodeArray(mFilter, 0, -1);
        }
        



        // if (mArr.length == 0) return;
        if (mArr.length == 0)
        {
            throw new EnergyproSystemException("\n \n NET-3079 Не знайдено матеріалів замовника в місячному плані для договору з послуг на сторону! " +
                    "Проведення акту приймання-передачі неможливе! \n" + "Код договору: " + servicesObject.code + ", код плану: " + planArr[0]);
        }

        // креатим документы ...
        // FKLogic fkLogic = new FKLogic(connection, userProfile);
        FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);
        ENElementDAO elDAO = new ENElementDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        ENElementShort el = elDAO.getShortObject(servicesObject.element.code);

        FINMaterials m = mDAO.getObject(mArr[0]);

            /*
            *     public int createDocThead(String numberENDoc, Date dateENDoc, int operationCode, String molCode, int parentDoc, String userName, String Via_who
        ,String Nakl_num, Date Nakl_Date, String  Dov_Id_num, Date Dov_Date
        ,int agree_id , int partner_type, int doc_type, int partner_id
        , String sender_id, BigDecimal pay_sum, BigDecimal nds_prc, BigDecimal nds_sum
        , String commentGen

            */

        int finDOCCode = fkLogic2.CreateDocument();
        boolean isErr = true;

        BigDecimal partnerId = null;

        try
        {
            partnerId = fkLogic2.getPartnerId(m.partner);

            if (partnerId == null)
            {
                    throw new EnergyproSystemException("\n \n NET-3079 Не знайдено id партнера в ФінКолекції! \n Код партнера: " + m.partner +
                            ", код договору з послуг на сторону: " + servicesObjectCode);
            }

            /*
            // Воспользуемся функцией для демонтажа
            fkLogic2.UpdateDocumentShort4Unmount(servicesObject.actTransferNumber, FINDocType.v10, m.partner, m.div_code, servicesObject.actTransferDate, new BigDecimal(0), "инв.№ " + el.objectInvNumber);
            */
            fkLogic2.UpdateDocumentShort4CustomerMaterials(
                    servicesObject.actTransferNumber,
                    FINDocType.v10,
                    m.partner,
                    m.div_code,
                    servicesObject.actTransferDate,
                    new BigDecimal(0),
                    "инв.№ " + el.objectInvNumber,
                    new BigDecimal(servicesObject.finDocID),
                    partnerId
            );

            fkLogic2.SaveDocument(finDOCCode);
            isErr = false;
        }
        catch (Exception e){
            //fkLogic2.Drop_Document(docArr[0]);
            throw new EnergyproSystemException(e.getMessage());
        }
        finally
        {
            fkLogic2.CancelDocumentHackFK(isErr);
        }

        /*
        FINMolDataDAO molDataDAO = new FINMolDataDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

        FINMolDataFilter molDataFilter = new FINMolDataFilter();
        molDataFilter.act.code = act.code;
        molDataFilter.molTypeRef.code = FINMolType.MASTER;
        int[] molDataArr = molDataDAO.getFilteredCodeArray(molDataFilter, 0, -1);
        if ( molDataArr.length != 1 ){
            throw new EnergyproSystemException("Не знайдено данні про МВО майстра для акту, код акта = " + act.code);
        }

        FINDoc2MolData d2m = new FINDoc2MolData();
        d2m.molData.code = molDataArr[0];
        d2m.finDocCode = finDOCCode;
        d2m.finDocTypeRef.code = FINDocType.MOVE_20;
        d2mDAO.add(d2m);
        */

        ////////////////
        ENMOL2PlanWorkDAO mpDAO = new ENMOL2PlanWorkDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        ENMOL2PlanWorkFilter mpFilter = new ENMOL2PlanWorkFilter();
        mpFilter.planRef.code = planArr[0];
        ENMOL2PlanWorkShortList mpList = mpDAO.getScrollableFilteredList(mpFilter, 0, -1);

        if (mpList.totalCount != 1)
        {
            throw new EnergyproSystemException("\n \n NET-3079 Не знайдено МВО для рознарядки на місячному плані " +
                    "(на цю МВО повинні бути оприбутковані матеріали замовника)! \n Код плану: " + planArr[0]);
        }

        // Создаем связку договора с приходным документом
        FINDoc2ENServicesObjectDAO d2soDAO = new FINDoc2ENServicesObjectDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
        FINDoc2ENServicesObject d2so = new FINDoc2ENServicesObject();
        d2so.servicesObjectRef.code = servicesObject.code;
        d2so.finDocCode = finDOCCode;
        d2so.finDocTypeRef.code = FINDocType.MOVE_10;
        d2soDAO.add(d2so);
        /////////////////

        BigDecimal sumDoc;
        isErr = true;
        fkLogic2.OpenDocument(finDOCCode);
        try
        {
            ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

            for (int i=0; i < mArr.length; i++){
                FINMaterials mm = mDAO.getObject(mArr[i]);
                //fkLogic2.addString(mm, RQConsts.REST_PURPOSE_ID_OPERATIVE, RQConsts.REST_PURPOSE_ID_OPERATIVE);

                /*
                    sumDoc = fkLogic2.getDocStrings();
                    fkLogic2.UpdateDocumentShort(
                            woList.get(n).workOrderNumber,
                            opType,
                            m.div_code,
                            m.div_code,
                            act.dateGen,
                            sumDoc,
                            Via_who
                            );
                */

                //fkLogic2.addString(mm, RQConsts.REST_PURPOSE_ID_OPERATIVE, RQConsts.REST_PURPOSE_ID_OPERATIVE);
                fkLogic2.addString(mm, RQConsts.REST_PURPOSE_ID_TRANZIT, RQConsts.REST_PURPOSE_ID_TRANZIT);

                // Материалам на плане ставим статус "У наявності"
                ENEstimateItem eItem = eiDAO.getObject(mm.estimateItemRef.code);
                eItem.statusRef.code = ENEstimateItemStatus.PRESENT;
                eiDAO.save(eItem);
            }

            sumDoc = fkLogic2.getDocStrings();

            /*
            // Воспользуемся функцией для демонтажа
            fkLogic2.UpdateDocumentShort4Unmount(
                    servicesObject.actTransferNumber,
                    FINDocType.v10,
                    m.partner,
                    m.div_code,
                    servicesObject.actTransferDate,
                    sumDoc,
                    "инв.№ " + el.objectInvNumber
            );
            */



            fkLogic2.UpdateDocumentShort4CustomerMaterials(
                    servicesObject.actTransferNumber,
                    FINDocType.v10,
                    m.partner,
                    m.div_code,
                    servicesObject.actTransferDate,
                    sumDoc,
                    "инв.№ " + el.objectInvNumber,
                    new BigDecimal(servicesObject.finDocID),
                    partnerId
            );


        fkLogic2.SaveDocument(finDOCCode);
        isErr = false;
        }
        catch (Exception e){
            //fkLogic2.Drop_Document(docArr[0]);
            throw new EnergyproSystemException(e.getMessage());
        }
        finally{
            fkLogic2.CancelDocumentHackFK(isErr);
        }
        // изменим пользователя ... шоб бухи апдейтили из ФК ;)
        fkLogic2.setUser4DOC(finDOCCode);

    }




	public BigDecimal[] getWorkTime(Date inDate) throws PersistenceException {

		boolean usesMDAXData = false;
		mDaxLogic mdLogic = new mDaxLogic(connection, userProfile);
		AuthLogic netAuth = new AuthLogic(connection, userProfile);
		usesMDAXData = netAuth.checkUsesMDAXData();

    	// System.out.println("############  usesMDAXData = " + usesMDAXData);

    	if (usesMDAXData) {
    		return mdLogic.getWorkTime(inDate);
    	}


		Date firstDay = Tools.getFirstDayOfMonth(inDate);
		String sql = " select a_hours, w_days from trud.norma_vrem nv where nv.grafik_id = 1 and nv.date_rasch = ? ";

		PreparedStatement statement = null;
		ResultSet resultSet = null;

		BigDecimal[] out = { new BigDecimal(0), new BigDecimal(0) };

		try {

			statement = connection.prepareStatement(sql);
			statement.setDate(1, new java.sql.Date(firstDay.getTime()));
			resultSet = statement.executeQuery();

			if (resultSet.next()) {
				out[0] = resultSet.getBigDecimal(1);

				if (out[0] != null)
					out[0] = out[0].setScale(2, BigDecimal.ROUND_HALF_UP);

				out[1] = resultSet.getBigDecimal(2);

				if (out[1] != null)
					out[1] = out[1].setScale(2, BigDecimal.ROUND_HALF_UP);
			}

			return out;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return out;
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}
	}


    public int getCheckIsInvalid(String tabn, Date dateIn) throws PersistenceException
    {
    	AuthLogic netAuth = new AuthLogic(connection, userProfile);
    	if (netAuth.checkUsesMDAXData()) {
    		mDaxLogic mdLogic = new mDaxLogic(connection, userProfile);
    		return mdLogic.getCheckIsInvalid(tabn, dateIn);
    	}

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(dateIn);
            calendar.add(Calendar.DATE,-1);
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);

    ResultSet  resultSet = null;
    int out = Integer.MIN_VALUE;

    String     selectStr;
    // Connection connection = getConnection();
    PreparedStatement statement = null;

    // if(getUserProfile() == null)
    //  throw new PersistenceException("Internal Error (User Profile Is Undefined)");



        selectStr =
            // " SELECT /*+ RULE */ \n" +
            " SELECT count(s.tabn)  \n" +
            " FROM \n" +
            "  \n" +
            "   kadry.v_Karta_User ku, \n" +
            "   kadry.v_Karta      s, \n" +
            "  \n" +
            " /**/ \n" +
            "  \n" +
            " /**/ \n" +
            "   kadry.Document         doc, \n" +
            "   kadry.VDocument        vd, \n" +
            "   kadry.Document_Tip     td, \n" +
            "   kadry.Pricaz           p, \n" +
            "   kadry.Invalid_Prichina ip, \n" +
            "   kadry.Invalid          i \n" +
            " WHERE ((((i.Invalid_Prichina_Id = ip.Id(+) \n" +
            "   AND i.Document_Id = doc.Id(+) \n" +
            "   AND doc.vDocument_Id = vd.Id(+) \n" +
            "   AND vd.Document_Tip_Id = td.Id(+) \n" +
            "   AND doc.Pricaz_Id = p.Id(+) \n" +
            " /**/ \n" +
            " /**/ \n" +
            "   AND s.Chel_Id = i.Chel_Id \n" +
            "   AND s.Karta_Id = ku.Karta_Id(+) \n" +
            // "   AND (kadry.pkg_Dostup.Get_Dostup <> '1' or ku.karta_id is not null) \n" +
            "  \n" +
            " ) AND i.Grupa <> 'н')  \n" +
            "  -- AND s.Chel_Id = 9722  \n" +
            "   ) AND s.Karta_Id = kadry.pkg_Karta_Utils.Last_Karta_Id(s.Chel_Id)) AND  \n" +
            "      ? BETWEEN i.Date_Start AND i.Date_Finish    \n" +
            "  and s.tabn = to_number(?)     \n" +
            "    \n" +
            "  \n" ;




    try
        {
        statement = connection.prepareStatement(selectStr);


        statement.setDate(1, new java.sql.Date(dateIn.getTime()));
        statement.setString(2, tabn);


        resultSet = statement.executeQuery();

            if (resultSet.next()){
            out = resultSet.getInt(1);

            }
            return out;
        } catch (Exception e) {
            System.out.println(    e.getMessage());
            return out;
        } finally {

            try {if (resultSet != null) resultSet.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}

        }


    }
    // для списаний счетчиков (приходование демонтированых материалов)
    public void createDOCFromFKOrderUnmount(RQFKOrder order) throws PersistenceException, DatasourceConnectException
    {

        FINMaterialsDAO mDAO = new FINMaterialsDAO(connection, userProfile);

        // цикл по frfkorderitem для ордера по списанию.
        RQFKOrderItemDAO fiDAO = new RQFKOrderItemDAO(connection, userProfile);
        RQFKOrderItemFilter fiFilter = new RQFKOrderItemFilter();
        fiFilter.fkOrderRef.code = order.code;
        int[] fiArr = fiDAO.getFilteredCodeArray(fiFilter,0,-1);
        for (int i=0; i < fiArr.length; i++){
        RQFKOrderItem fiObj = fiDAO.getObject(fiArr[i]);

        FINMaterialsFilter mFilter = new FINMaterialsFilter();
        mFilter.statusRef.code = FINMaterialsStatus.GOOD;
        mFilter.conditionSQL = " estimateitemrefcode in ( select e.code from rqfkorderitem2enplnwrk fi2pl , enestimateitem e " +
                " where fi2pl.fkorderitemcode = " + fiObj.code +
                 " and fi2pl.enplanworkcode = e.planrefcode " +
                 " and e.kindrefcode = " + ENEstimateItemKind.UNMOUNT +
                 " and e.accountingtyperefcode = " + TKAccountingType.TMC +  ")" ;

        int[] mArr = mDAO.getFilteredCodeArray(mFilter, 0, -1);

        if (mArr.length > 0) {

        // креатим документы ...
        FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);

        FINMaterials m = mDAO.getObject(mArr[0]);
        SCInvoiceDAO scDAO = new SCInvoiceDAO(connection, userProfile);
        SCInvoiceFilter scFilter = new SCInvoiceFilter();
        scFilter.fkOrderItemRef.code = fiObj.code;
        SCInvoiceShortList scList = scDAO.getScrollableFilteredList(scFilter,0,-1);

    int finDOCCode = fkLogic2.CreateDocument();
    boolean isErr = true;

    try
    {
        fkLogic2.UpdateDocumentShort4Unmount(/*act.numberGen*/ scList.get(0).numberDoc , FINDocType.v20 , m.div_code, m.div_code, /*act.dateGen*/ order.dateGen, new BigDecimal(0), "Списание счетчиков" );
        fkLogic2.SaveDocument(finDOCCode);
        isErr = false;
    }
    catch (Exception e){
        //fkLogic2.Drop_Document(docArr[0]);
        throw new EnergyproSystemException(e.getMessage());
    }
    finally
    {
        fkLogic2.CancelDocumentHackFK(isErr);
    }

    // проинсертим код документа с финколекции в строку ордера

    fiObj.finDocID = finDOCCode;
    fiDAO.save(fiObj);


    BigDecimal sumDoc;
    isErr = true;
    fkLogic2.OpenDocument(finDOCCode);
    try
    {
        for (int ii=0; ii < mArr.length; ii++){
            FINMaterials mm = mDAO.getObject(mArr[ii]);

            fkLogic2.addString(mm, RQConsts.REST_PURPOSE_ID_OPERATIVE, RQConsts.REST_PURPOSE_ID_OPERATIVE);
        }

        sumDoc = fkLogic2.getDocStrings();

        fkLogic2.UpdateDocumentShort4Unmount(
                /*act.numberGen*/ scList.get(0).numberDoc,
                FINDocType.v20,
                m.div_code,
                m.div_code,
                /*act.dateGen*/ order.dateGen,
                sumDoc,
                "Списание счетчиков"
        );


      fkLogic2.SaveDocument(finDOCCode);
      isErr = false;
    }
    catch (Exception e){
        //fkLogic2.Drop_Document(docArr[0]);
        throw new EnergyproSystemException(e.getMessage());
    }
    finally{
        fkLogic2.CancelDocumentHackFK(isErr);
    }
    // изменим пользователя ... шоб бухи апдейтили из ФК ;)
    fkLogic2.setUser4DOC(finDOCCode);
        } // конец если есть строки для списания
    } // конец цикла по строкам ордера
    }

    // для списаний счетчиков (удаление документа по демонтированым материалам)
    public void removeDOCFromFKOrderUnmount(RQFKOrder order) throws PersistenceException, DatasourceConnectException
    {

        FKLogic2 fkLogic2 = new FKLogic2(connection, userProfile);


//         цикл по frfkorderitem для ордера по списанию.
        RQFKOrderItemDAO fiDAO = new RQFKOrderItemDAO(connection, userProfile);
        RQFKOrderItemFilter fiFilter = new RQFKOrderItemFilter();
        fiFilter.fkOrderRef.code = order.code;
        int[] fiArr = fiDAO.getFilteredCodeArray(fiFilter,0,-1);
        for (int i=0; i < fiArr.length; i++){
        RQFKOrderItem fiObj = fiDAO.getObject(fiArr[i]);
        if (fiObj.finDocID != Integer.MIN_VALUE) {


        // проверка на образование красных остатков для отменяемого документа
        int rr = fkLogic2.check_red_rest(fiObj.finDocID, 1);
        if (rr != 0 ){
            throw new EnergyproSystemException("Ошибка в резервировании материала. Операция приведет к образованию КРАСНОГО остатка!!!");
            }

            fkLogic2.Drop_Document(fiObj.finDocID);
            // уберем с поля привязку к фин. документу
            fiObj.finDocID = Integer.MIN_VALUE;
            fiDAO.save(fiObj);
        }

        }
    }


    public int getCodeFormNalogByContragentCode(int contragentCode) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        int outCode = Integer.MIN_VALUE;

        String sql = "select  nf.code_form from  sprav.org a , sprav.nalogform nf " +
                      " where a.id = ? " +
                      " and a.id_nalogform = nf.id";



        try
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, contragentCode);

            set = statement.executeQuery();
            if ( set.next() )
                {
                    //obj.finDocCode = set.getInt(1);
                    outCode = set.getInt(1);
                }
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        return outCode;
    }

    public int getCodeFormNalogByContragentCodeString(String contragentCode) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        int outCode = Integer.MIN_VALUE;

        String sql = "select nf.code_form from sprav.org a, sprav.nalogform nf " +
                      " where a.code = upper('" + contragentCode + "')" +
                      " and a.id_nalogform = nf.id";

        try
        {
            statement = connection.prepareStatement(sql);
            // statement.setString(1, contragentCode);

            set = statement.executeQuery();
            if ( set.next() )
                {
                    //obj.finDocCode = set.getInt(1);
                    outCode = set.getInt(1);
                }
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        return outCode;
    }


		/**
		 * Функция, возвращающая список материалов из ФК и ограничивающая
		 * оперативный запас только списком разрешенных номенклатур (NET-4061, п. 3)
		 *
		 */
        public FINMaterialsList getMaterialsList(int planCode, FINMaterialsFilter aFilterObject, String balansNumberCondition, String molCode, String materialCondition, Date date, int finDocCode) throws PersistenceException, DatasourceConnectException
        {
        	FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(connection, userProfile);

            if (ENConsts.IS_OPERATIVE_STOCK_RESTRICTION)
            {
                ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
                ENPlanWork plan = planDAO.getObject(planCode);

                ElementLogic eLogic = new ElementLogic(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
                int eType = eLogic.getElementTypeByPlan(plan);

                if (eType != ENElementType.WRITING_NO_OBJECT) // Кроме списаний
                {
                    ENNomenclaturesOperativeDAO nomDAO = new ENNomenclaturesOperativeDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

                    FINMaterialsList result = new FINMaterialsList();
                    result.list = new Vector<FINMaterials>();

                    FINMaterialsList finList = finMaterialsLogic.getMaterialsList(aFilterObject, balansNumberCondition,  molCode,  materialCondition,  date, finDocCode);
                    for (int i = 0; i < finList.totalCount; i++)
                    {
                        if (finList.get(i).rest_purpose_type_id != RQConsts.REST_PURPOSE_TYPE_ID_TRANZIT)
                        {
                            ENNomenclaturesOperativeFilter nomFilter = new ENNomenclaturesOperativeFilter();
                            nomFilter.id = finList.get(i).mat_id;
                            int[] nomArr = nomDAO.getFilteredCodeArray(nomFilter, 0, -1);

                            if (nomArr.length > 0)
                            {
                                result.list.add(finList.get(i));
                                result.setTotalCount(result.getTotalCount() + 1);
                            }
                        }
                        else
                        {
                            result.list.add(finList.get(i));
                            result.setTotalCount(result.getTotalCount() + 1);
                        }
                    }

                    return result;
                }
                else
                {
                    return finMaterialsLogic.getMaterialsList(aFilterObject, balansNumberCondition,  molCode,  materialCondition,  date, finDocCode);
                }
            }
            else
            {
                return finMaterialsLogic.getMaterialsList(aFilterObject, balansNumberCondition,  molCode,  materialCondition,  date, finDocCode);
            }

        }


   public FINMaterialsList getMaterialsListForTravelSheetFuel(ENTravelSheetFuel fuel, String molCode, Date docDate, int finDocCode) throws PersistenceException
   {
	   try
	   {
	       String materialCondition = " and h.op_kind_id not in ('5', '10', '15', '20', '295', '300', '310', '320', '321') ";
	       String balansNumberCondition = "";
	       // Андрюха сказал, что для бензина можно не передавать счет
	      // String finCondition = " ( substr(dat.bal_sch,1,2) in ('20', '22') ) ";
	       String finCondition = "";

	       TEMPNomenclaturesDAO nomDAO = new TEMPNomenclaturesDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
	       TEMPNomenclaturesFilter nomFilter = new TEMPNomenclaturesFilter();
	       nomFilter.conditionSQL =
	    		   		   " materialrefcode in " +
	    				   " ( " +
	    				   "   select ft.materialrefcode " +
	    				   "   from tkfueltype ft " +
	    				   "   where ft.code = " + fuel.fuelType.code +
	    				   " ) ";

	       TEMPNomenclaturesShortList nomList = nomDAO.getScrollableFilteredList(nomFilter, 0, -1);

	       String strNomList = "";

    	   for (int i = 0; i < nomList.totalCount; i++)
    	   {
    		   if (strNomList.equals(""))
    		   {
    			   strNomList = "'" + nomList.get(i).nn + "'";
    		   }
    		   else
    		   {
    			   strNomList = strNomList + ", '" + nomList.get(i).nn + "'";
    		   }
    	   }

    	   if (strNomList.equals(""))
    	   {
    		   throw new EnergyproSystemException("\n\nNET-4414 Не знайдено зв'язаних номенклатур для видачі з кодом " + fuel.code + " !");
    	   }

    	   // переделали на поиск айдишника материала по списку номенклатур
    	   // finCondition = finCondition + " and dat.nn in (" + strNomList + ")";
    	   finCondition = " dat.mat_id in ( select id from umc_dba.tmatherial where nn in (" + strNomList + "))";

	       finCondition = finCondition + " and dat.rest_purpose_type_id <> " + RQConsts.REST_PURPOSE_TYPE_ID_FUELTANK;

	       if (fuel.isVRTU == 1)
	       {
	    	   finCondition = finCondition + " and dat.budget_core_id = " + RQConsts.BUDGET_CORE_ID_VRTUVD;
	       }
	       else
	       {
	    	   finCondition = finCondition + " and dat.budget_core_id != " + RQConsts.BUDGET_CORE_ID_VRTUVD;
	       }

	       FINMaterialsFilter finFilterFK = new FINMaterialsFilter();
	       finFilterFK.conditionSQL = finCondition;
	       finFilterFK.orderBySQL = "dat.party_id";

	       FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(connection, userProfile);

	       return finMaterialsLogic.getMaterialsList(finFilterFK, balansNumberCondition, molCode, materialCondition, docDate, finDocCode);
	   }
	   catch (DatasourceConnectException e)
	   {
		   throw new SystemException(e.getMessage(), e);
	   }

   }



    public FINWorkerShortList getFINWorkerListWithWorkLoad(FINWorkerFilter filterObject, int fromPosition, int quantity, java.util.Date dateGet, boolean isShowCEO)
    {
    	try
    	{
		    FINWorkerShortList result = new FINWorkerShortList();
		    FINWorkerShort anObject;
		    result.list = new Vector<FINWorkerShort>();

    		FINWorkerDAO finWorkerDAO = new FINWorkerDAO(userProfile, connection);
    		ENHumenItemDAO humenItemDAO = new ENHumenItemDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);

    		FINWorkerShortList finWorkerList = finWorkerDAO.getFINWorkerList(filterObject, fromPosition, quantity, dateGet, isShowCEO);

    		int i = 0;

    		for (i = 0; i < finWorkerList.totalCount; i++)
            {
            	anObject = new FINWorkerShort();

                anObject.name = finWorkerList.get(i).name;
                anObject.tabNumber = finWorkerList.get(i).tabNumber;
                anObject.positionName = finWorkerList.get(i).positionName;
                anObject.positionCode = finWorkerList.get(i).positionCode;
                anObject.departmentName = finWorkerList.get(i).departmentName;
                anObject.departmentCode = finWorkerList.get(i).departmentCode;
                anObject.priceGen = finWorkerList.get(i).priceGen;
                anObject.categor = finWorkerList.get(i).categor;
                anObject.doljnostid = finWorkerList.get(i).doljnostid;
                anObject.cehid = finWorkerList.get(i).cehid;
                anObject.finCode = finWorkerList.get(i).finCode;
                /////
                anObject.cehNazv = finWorkerList.get(i).cehNazv;
                anObject.categorId = finWorkerList.get(i).categorId;
                anObject.categorName = finWorkerList.get(i).categorName;
                anObject.workTimeId = finWorkerList.get(i).workTimeId;
                anObject.positionId = finWorkerList.get(i).positionId;
                anObject.nvz = finWorkerList.get(i).nvz;
                /////

                ENHumenItemFilter humenItemFilter = new ENHumenItemFilter();
                humenItemFilter.conditionSQL =
	                " FINWORKER.tabnumber = '" + finWorkerList.get(i).tabNumber + "' " +
	                " and ENPLANWORK.kindcode = " + ENPlanWorkKind.NPW +
	                " and ENPLANWORK.datestart = '" + new SimpleDateFormat("dd.MM.yyyy").format(dateGet) + "'";

                ENHumenItemShortList humenItemList = humenItemDAO.getScrollableFilteredList(humenItemFilter, 0, -1);

                BigDecimal workLoad = new BigDecimal(0);

                for (int j = 0; j < humenItemList.totalCount; j++)
                {
                	workLoad = workLoad.add(humenItemList.get(j).countFact).setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
                }

                anObject.workLoad = workLoad;

                result.list.add(anObject);

                //result.setTotalCount(result.getTotalCount() + 1);
            }

    		result.setTotalCount(i);
    		return result;
    	}
    	catch (PersistenceException e)
    	{
    		throw new SystemException(e.getMessage(), e);
		}
    	catch (DatasourceConnectException e)
    	{
    		throw new SystemException(e.getMessage(), e);
		}
        finally
        {
            try
            {
                if (energyNetConnection != null && ! energyNetConnection.isClosed())
                {
                    energyNetConnection.close();
                    energyNetConnection = null;
                }
            }
            catch (SQLException e)
            {
            }
        }
    }


    public FINLogic(Connection connection, UserProfile userProfile)
    {
        super(connection, userProfile);
    }


    /**
     *  Возвращает кол-во рабочих часов/дней в месяце на дату расчета акта по табельному номеру
     *
     *  @param dateAct - дата акта
     *  @param tabNumber - табельный номер
     *  @return BigDecimal[] - кол-во рабочих часов/дней в месяце на дату расчета акта
     *
     */
	public BigDecimal[] getWorkTime(Date dateAct, String tabNumber)
			throws PersistenceException {

        boolean usesMDAXData = false;
        mDaxLogic mdLogic = new mDaxLogic(connection, userProfile);
    	AuthLogic netAuth = new AuthLogic(connection, userProfile);
    	usesMDAXData = netAuth.checkUsesMDAXData();

    	// System.out.println("############  usesMDAXData = " + usesMDAXData);

    	if (usesMDAXData) {
    		return mdLogic.getWorkTime(dateAct, tabNumber);
    	}

		Date firstDay = Tools.getFirstDayOfMonth(dateAct);

		String sql = " select trud.get_norma_vrem(?, ?, 'h') nm_hours, "
				+ " trud.get_norma_vrem(?, ?, 'd') nm_days from dual";

		PreparedStatement statement = null;
		ResultSet resultSet = null;

		BigDecimal[] out = { new BigDecimal(0), new BigDecimal(0) };

		try {

			statement = connection.prepareStatement(sql);
			statement.setString(1, tabNumber);
			statement.setDate(2, new java.sql.Date(firstDay.getTime()));
			statement.setString(3, tabNumber);
			statement.setDate(4, new java.sql.Date(firstDay.getTime()));

			resultSet = statement.executeQuery();

			if (resultSet.next()) {
				out[0] = resultSet.getBigDecimal(1);

				if (out[0] != null)
					out[0] = out[0].setScale(2, BigDecimal.ROUND_HALF_UP);

				out[1] = resultSet.getBigDecimal(2);

				if (out[1] != null)
					out[1] = out[1].setScale(2, BigDecimal.ROUND_HALF_UP);
			}

			return out;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return out;
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
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
	 * Возвращает остаток топлива по АВЗ по входящим МОЛам , на дату , по типу топлива(1-бензин 2-дп)
	 *
	 * @param depCode
	 * @param type
	 * @param date
	 * @return
	 * @throws PersistenceException
	 * @throws SQLException
	 */
	public BigDecimal getFuelRestAVZByMOLAndTypeOnDate(String depCode,
			int type, String date) {

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		BigDecimal out = new BigDecimal(0);

		try {

			ENSpravMolDAO sprMolDAO = new ENSpravMolDAO(
					getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
			ENSpravMolFilter sprMolFilter = new ENSpravMolFilter();
			sprMolFilter.conditionSQL = " ENSpravMol.departmentcode in ( " + depCode + " ) ";

			String strMOL;
			strMOL = "";

			ENSpravMolShortList sprMoList = sprMolDAO.getScrollableFilteredList(sprMolFilter, 0, -1);

			for (int i = 0; i < sprMoList.totalCount; i++) {
				if (strMOL.length() == 0) {
					strMOL = sprMoList.get(i).molkod;
				} else {
					strMOL = strMOL + ", " + sprMoList.get(i).molkod;
				}
			}

			if (strMOL.length() == 0) {
				return new BigDecimal(0);
			}

			// не совсем корректный запрос для выбора остатков
			   String sql = " SELECT \n" +
			"           nvl(sum(q_end),0) \n" +
			" From ( \n" +
			" SELECT код_поставщика  as div, \n" +
			 "          код_материала  as  m_id, \n" +
			 "          m.name as mat_name, \n" +
			 "          sum(количество) as q_end, \n" +
			 "          sum(сумма)      as s_end, \n" +
			 "          max(дата_документа) last_date \n" +
			 "    FROM umc_dba.v_revert_str, umc_dba.tmatherial m \n" +
			 "    WHERE дата_документа <= TO_DATE('" + date + "', 'dd.mm.yyyy') and \n" + // остатки брались постоянно на посл день месяца(это не правильно)
			 "          код_поставщика in (" + strMOL + ") and \n" +
			 "          код_материала = m.id \n" +
			 " 			and v_revert_str.rest_purpose_id = 1 /*Аварийный запас*/ \n"  +
			 "			and (  \n" +
			 "	( (m.name like ('БЕНЗИН%92%') ) and "+ type +" = 1 )  \n" +
			 "	or  \n" +
			 "	(m.name like ('БЕНЗИН%95%') and   "+ type +"  = 2 )  \n" +
		     "		or  \n" +
			 "	(m.name like ('ДИЗПАЛИВО%') and  "+ type +"   = 3 )  \n" +
			 "	) \n" +
			 "    GROUP BY код_поставщика, \n" +
			 "             код_материала , \n" +
			 "             m.name \n" +
			 "             ) \n " +
			"Where q_end <> 0 ";

			out = new BigDecimal(100);

			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				out = resultSet.getBigDecimal(1);
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

		finally {
			try {
				if (resultSet != null)
					resultSet.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}

			try {
				if (energyNetConnection != null
						&& !energyNetConnection.isClosed()) {
					energyNetConnection.close();
					energyNetConnection = null;
				}
			} catch (SQLException e) {
			}
		}

		return out;
	}



	/**
	 * Возвращает остаток топлива по входящим МОЛам , на дату , с или без резерва , по типу топлива(1-бензин 2-дп)

	 *
	 * @param depCode
	 * @param type
	 * @param date
	 * @return
	 * @throws PersistenceException
	 * @throws SQLException
	 * @throws DatasourceConnectException
	 */
	public BigDecimal getFuelRestByMOLAndTypeOnDate(String molCodes, int type,
			String date, int withRezerv) {

		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {


			String strMOL;
			strMOL = molCodes;

			if (strMOL.length() == 0) {
				return new BigDecimal(0);
			}


			// не совсем корректный запрос для выбора остатков
			   String sql = " SELECT \n" +
			"           nvl(sum(q_end),0) \n " +
			" From ( \n " +
			" SELECT код_поставщика  as div, \n " +
			 "          код_материала  as  m_id, \n" +
			 "          m.name as mat_name, \n" +
			 "          sum(количество) as q_end, \n" +
			 "          sum(сумма)      as s_end, \n" +
			 "          max(дата_документа) last_date \n" +
			 "    FROM umc_dba.v_revert_str, umc_dba.tmatherial m \n" +
			 "    WHERE дата_документа <= TO_DATE('" + date + "', 'dd.mm.yyyy') and \n" + // остатки брались постоянно на посл день месяца(это не правильно)
			 "          код_поставщика in (" + strMOL + ") and \n" +
			 "          код_материала = m.id \n" +
			 (withRezerv == 1 ? " " : " 			and v_revert_str.rest_purpose_id <> 2075 /*Резерв*/ " ) +
			 " 			and v_revert_str.rest_purpose_id <> "+RQConsts.REST_PURPOSE_ID_FUELTANK +" /*БАКИ*/ \n "  + // при выдаче топлива на путевых оно переходит в назначение БАКИ. поэтому остатки фин берем все что не  резерв и не баки
			 "			and (  \n" +
			 "	( (m.name like ('БЕНЗИН%92%') ) and "+ type +" = 1 )  \n " +
			 "	or  \n" +
			 "	(m.name like ('БЕНЗИН%95%') and   "+ type +"  = 2 )  \n " +
		     "		or  \n" +
			 "	(m.name like ('ДИЗПАЛИВО%') and  "+ type +"   = 3 )  \n" +
			 "	) \n" +
			 "    GROUP BY код_поставщика, \n" +
			 "             код_материала , \n" +
			 "             m.name \n" +
			 "             ) \n" +
			"Where q_end <> 0 ";


			BigDecimal out = new BigDecimal(100);

			statement = connection.prepareStatement(sql);

            System.out.println( " start getFuelRestByMOLAndTypeOnDate for " + molCodes);
			System.out.println( " getFuelRestByMOLAndTypeOnDate_sql ==== " +  sql);

			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				out = resultSet.getBigDecimal(1);
			}

            System.out.println( " finish getFuelRestByMOLAndTypeOnDate for " + molCodes);
            System.out.println( " result getFuelRestByMOLAndTypeOnDate for " + molCodes + " rest = " + out.toString());

			return out;

		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}
	}

	public BigDecimal[] getWorkTimeByGrafik(Date inDate, int grafikid) throws PersistenceException {
		Date firstDay = Tools.getFirstDayOfMonth(inDate);
		String sql = " select a_hours, w_days from trud.norma_vrem nv where nv.grafik_id = '"+ grafikid+"' and nv.date_rasch = ? ";

		PreparedStatement statement = null;
		ResultSet resultSet = null;

		BigDecimal[] out = { new BigDecimal(0), new BigDecimal(0) };

		try {

			statement = connection.prepareStatement(sql);
			statement.setDate(1, new java.sql.Date(firstDay.getTime()));
			resultSet = statement.executeQuery();

			if (resultSet.next()) {
				out[0] = resultSet.getBigDecimal(1);

				if (out[0] != null)
					out[0] = out[0].setScale(2, BigDecimal.ROUND_HALF_UP);

				out[1] = resultSet.getBigDecimal(2);

				if (out[1] != null)
					out[1] = out[1].setScale(2, BigDecimal.ROUND_HALF_UP);
			}

			return out;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return out;
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
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
    FUNCTION getDepartmentIdDownFromKadry возвращает стоку Id подразделений вниз по иерархии
     для подразделений  независимо от периода.
	 *
	 * */
	public String getDepartmentIdDownFromKadry(int podr_id) throws PersistenceException {

		String sql = " select energynet.GETDEPARTMENTIDDOWN("+podr_id+") from dual ";

		PreparedStatement statement = null;
		ResultSet resultSet = null;

		String out = "";

		try {

			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();

			if (resultSet.next()) {
				out = resultSet.getString(1);
			}

			return out;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return out;
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}
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
        	String query =
        			" begin " +
        			" kadry.pkg_Dostup.INITIALIZE(?); " +
        			" kadry.pkg_Setup.Init(ADate_Rep=>?); " +
        			" end; ";

        	stmt = connection.prepareCall(query);
        	stmt.setDate(1, new java.sql.Date(new Date().getTime()));
        	stmt.setDate(2, new java.sql.Date(new Date().getTime()));
        	stmt.execute();


        	selectStr = " SELECT " +
        			" s.TabN, " +
        			" s.F||' '||s.I||' '||s.O FIO, " +
        			" vc.Contact_Vid_Nazv, " +
        			" DECODE(vc.contact_vid,'TEL',DECODE(vc.Gorod_Kod,NULL,'','('||vc.Gorod_Kod||')')||vc.tel, " +
                    "    'MOBILE',DECODE(vc.Mobile_Kod,NULL,DECODE(vc.Gorod_Kod,NULL,'','('||vc.Gorod_Kod||')'),vc.Mobile_Kod||'-')||vc.tel, " +
                    "    'ADR',kadry.Pkg_Contact.Get_Format(vc.Contact_Vid, '12345678', " +
        			" vc.Strana_Nazv, vc.Indx, vc.Obl_Nazv, vc.Obl_Vid, vc.Rajon_Nazv, " +
        			" vc.VGorod_Sokr_Nazv, vc.Gorod_Nazv, vc.RajonGor_Nazv, " +
        			" vc.Ulica_Vid_Sokr_Nazv, vc.Ulica_Nazv, vc.Dom, vc.Korp, vc.Kv, " +
        			" vc.Tel, vc.Info),vc.info) contact, " +
        			" p.vpasp_nazv, " +
        			" p.Serija, " +
        			" p.Nomer, " +
        			" DECODE(DATVYD, TO_DATE('01.01.1900','dd.mm.yyyy'), TO_DATE(NULL), DATVYD) DATVYD, " +
        			" DECODE(DEJSTV_DO, TO_DATE('01.01.3000','dd.mm.yyyy'), TO_DATE(NULL), DEJSTV_DO) DEJSTV_DO, " +
        			" kemvydpas_nazv " +
        			" FROM " +
        			" kadry.v_Karta  s, " +
        			" kadry.v_Karta_User ku, " +
        			" kadry.v_contact vc, " +
        			" (select * from kadry.v_Pasp where vPasp_Id = 1) p " +
        			" WHERE (s.Karta_Id = ku.Karta_Id " +
        			" AND s.chel_id = vc.chel_id " +
        			" AND Contact_Vid_Id = 1 " +
        			" AND s.Chel_Id = p.Chel_Id(+)) " +
        			" AND s.tabn = ? " +
        			" ORDER BY s.F||' '||s.I||' '||s.O, vc.Contact_Vid, vc.Contact_Vid_Nazv";

            statement = connection.prepareStatement(selectStr);
            statement.setString(1, tabNumber);

			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				info = new PersonalServicesInfo();

				info.fioLine = resultSet.getString(2);
				info.addressLine = resultSet.getString(4);
				info.passportLine = string2report(resultSet.getString(6)) + " "
						+ string2report(resultSet.getString(7));

				resultSet.getDate(8);
				if (!resultSet.wasNull()) {
					info.passportLine = info.passportLine
							+ " "
							+ string2report(new SimpleDateFormat("dd.MM.yyyy")
									.format(resultSet.getDate(8)).toString());
				}

				info.passportLine = info.passportLine + " "
						+ string2report(resultSet.getString(10));
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

	public ENAct2Humen getBalansWithMainCeh(String tabNumber, Date actDate) throws PersistenceException {

		return getBalansWithMainCeh(tabNumber, actDate, "");

	}

/**
 * 12.05.2017 добавил в выборку код цеха к которому относится работник
 * */
	public ENAct2Humen getBalansWithMainCeh(String tabNumber, Date actDate, String additionalException) throws PersistenceException
	{
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		ENAct2Humen a2hObj = new ENAct2Humen();
		String selectStr = "";

		 boolean usesMDAXData = false;
         mDaxLogic mdLogic = new mDaxLogic(connection, userProfile);
    	 AuthLogic netAuth = new AuthLogic(connection, userProfile);
    	 usesMDAXData = netAuth.checkUsesMDAXData();

	    	// System.out.println("############  usesMDAXData = " + usesMDAXData);

		if (usesMDAXData) {

			FINWorkerFilter workerFilter = new FINWorkerFilter();
			workerFilter.tabNumber = tabNumber;

			FINWorkerShortList finWorkerList = mdLogic.getFINWorkerList(workerFilter, 0, -1, actDate, true);

			if (finWorkerList.totalCount > 0) {
				if (!finWorkerList.get(0).balans.equals("")) {
					a2hObj.balans = finWorkerList.get(0).balans;
				}
				if (!finWorkerList.get(0).mainCehid.equals("")) {
					a2hObj.cehId = finWorkerList.get(0).mainCehid;
				}
			} else {
				throw new SystemException("\n\nВ Axapta не знайдено інформацію по робітнику з таб. № " + tabNumber + " на " +
						new SimpleDateFormat("dd.MM.yyyy").format(actDate) + " !" + additionalException);
			}

			return a2hObj;
		}

        try
        {
        	/*
    		selectStr = " select b.balans, p.podrcod from zarpherson.kadry_day_view v, zarpherson.balans b, zarpherson.podr p "
    		        + " where v.balans_id = b.id "
    		        + " and v.podrid = p.podrid "
    		        + " and v.tabn = " + tabNumber;
        	*/
        	selectStr =
    			" select b.balans " +
    			" from zarpherson.kadry_day_view v, zarpherson.balans b " +
    			" where v.balans_id = b.id " +
    			" and v.tabn = ? ";

            statement = connection.prepareStatement(selectStr);
            statement.setString(1, tabNumber);

            resultSet = statement.executeQuery();
            if (resultSet.next())
            {
            	a2hObj.balans = resultSet.getString(1);
            	a2hObj.cehId = "";// если что то нужно добавить   код главного цеха
            }
            else {
				throw new SystemException("\n\nУ ФК не знайдено інформацію по робітнику з таб. № " + tabNumber + " на " +
						new SimpleDateFormat("dd.MM.yyyy").format(actDate) + " !");
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
            } catch (SQLException e) {
            }
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                }
            }
        }

        return a2hObj;
	}


	public String getPodrcod(String tabNumber, Date actDate) throws PersistenceException
	{
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		String out = "";
		String selectStr = "";

		boolean usesMDAXData = false;
        mDaxLogic mdLogic = new mDaxLogic(connection, userProfile);
   	    AuthLogic netAuth = new AuthLogic(connection, userProfile);
   	    usesMDAXData = netAuth.checkUsesMDAXData();

		if (usesMDAXData) {
			String podrCode = "";

			FINWorkerFilter workerFilter = new FINWorkerFilter();
			workerFilter.tabNumber = tabNumber;
			FINWorkerShortList finWorkerList = mdLogic.getFINWorkerList(workerFilter, 0, -1, actDate, true);

			if (!finWorkerList.get(0).departmentCode.equals("")) {
				podrCode = finWorkerList.get(0).departmentCode;
			}
			return podrCode;
		}

        try
        {
        	selectStr =
	        	" select p.podrcod " +
	        	" from zarpherson.kadry_day_view v, zarpherson.podr p " +
	        	" where v.podrid = p.podrid " +
	        	"   and v.tabn = ? ";

            statement = connection.prepareStatement(selectStr);
            statement.setString(1, tabNumber);

            resultSet = statement.executeQuery();
            if (resultSet.next())
            {
                out = resultSet.getString(1);
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
            } catch (SQLException e) {
            }

            if (resultSet != null) {
                try {
                	resultSet.close();
                } catch (SQLException e) {
                }
            }
        }

        return out;
	}


	public boolean validateFinDocStatus(int finDocCode, int operationCode)
			throws PersistenceException {

		boolean valid = true;

		String SQL = "select op_kind_id from umc_dba.thead where id = ?";

		PreparedStatement statement = null;
		ResultSet set = null;

		try {
			statement = connection.prepareStatement(SQL);
			statement.setInt(1, finDocCode);
			set = statement.executeQuery();

			if (!set.next())
				valid = false;
			else {
				if (set.getInt(1) != operationCode) {
					valid = false;
				}
			}

		}

		catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + SQL);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		}

		finally {
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
			statement = null;

		}
		return valid;
	}
/**
 * Поиск остатка в ФК по данным из АХ и дополнение объекта  FINMaterials значениями из ФК
 *
 * */
 public FINMaterials fillFinmaterialsFromFKByMdaxData(FINMaterials finmatObj , Date date ,  int finDocCode ) {
	 String finCondition = "";
	 Connection finConn = null;
	 Connection enConn = null;
	 try {
	    finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	    enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
	    FKOrderLogic fordLogic = new FKOrderLogic(userProfile,enConn);

	    FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(finConn, userProfile);

	    if(finmatObj.nn == null || finmatObj.nn.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано код номенклатури! ");
	    }
	    if(finmatObj.ax_frc_code == null || finmatObj.ax_frc_code.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано код ЦФО! ");
	    }
	    if(finmatObj.bal_sch == null || finmatObj.bal_sch.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано рахунок! ");
	    }
	    if(finmatObj.ax_rest_purpose_typeid == null || finmatObj.ax_rest_purpose_typeid.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано тип залишку! ");
	    }
	    if(finmatObj.ax_party_id == null || finmatObj.ax_party_id.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано партію! ");
	    }
	    if(finmatObj.fullQuantity == null  ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано кількість залишку ! ");
	    }
	    if(finmatObj.div_code == null || finmatObj.div_code.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано МОЛ ! ");
	    }
	    if(finmatObj.ax_rest_purpose_id == null || finmatObj.ax_rest_purpose_id.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано призначения залишку з AX ! ");
	    }

		FINMaterialsFilter finFilterFK = new FINMaterialsFilter();

		finCondition = finCondition + " and isCN is null and ( dat.bal_sch in ('"+ finmatObj.bal_sch +"') ) ";
		finCondition = finCondition + " and dat.rest_purpose_type_id = " + Integer.parseInt(finmatObj.ax_rest_purpose_typeid.replace("30100", "")  ) ;
		finCondition = finCondition + " and dat.party_id in (" + Integer.parseInt(finmatObj.ax_party_id)  + ")";
		//finCondition = finCondition + " and dat.quantity = "+ finmatObj.fullQuantity  ; // то кол-во что взяли с АХ должно быть на остатке в ФК

		finFilterFK.nn = finmatObj.nn;
		finFilterFK.frc_code = Integer.parseInt(finmatObj.ax_frc_code); // dat.FRC_CODE // cfo
	 	finFilterFK.quantity = finmatObj.fullQuantity; // то кол-во что взяли с АХ должно быть на остатке в ФК

		//<<<
		finFilterFK.rest_purpose_id = fordLogic.getRestPurposeIdFKForZoneByTypeIdMdax(  finmatObj.div_code ,
																						finmatObj.ax_rest_purpose_id,
																						finmatObj.ax_rest_purpose_typeid) ;
		//>>>

		// дата ввода в эксп если не пуцстая то тоже фильровать
		finFilterFK.conditionSQL = finCondition;
		finFilterFK.orderBySQL = "dat.quantity , dat.party_id";

		String MOLCode = finmatObj.div_code;
		String materialCondition = "  and h.op_kind_id not in ('5','10','310','15')"; // ДО проведения ПРИХОДА на МОЛ - уже видно мат-лы в подотчете .. НАХ их ...



		FINMaterialsList finListFK = finMaterialsLogic.getMaterialsList(finFilterFK,
			 ""/*balansNumberCondition*/,
			 MOLCode,
			 materialCondition,
			 date ,
			 finDocCode ,
			 ENConsts.SOURCE_SELECTION_RESTS_FK // ищем в ФК
			 );

		if (finListFK.totalCount == 0 ) {
			throw new SystemException("\n\nНе знайдено залишку з ФК! ");
		 } else // недостающие поля
		 {
			 finmatObj.mat_id = finListFK.get(0).mat_id;
			 finmatObj.party_id = finListFK.get(0).party_id;
			 finmatObj.budget_core_id = finListFK.get(0).budget_core_id;
			 finmatObj.mu_id = finListFK.get(0).mu_id;
			 finmatObj.mu_name = finListFK.get(0).mu_name;
			 finmatObj.rest_purpose_id = finListFK.get(0).rest_purpose_id;
			 finmatObj.rest_purpose_name = finListFK.get(0).rest_purpose_name;
			 finmatObj.rest_purpose_type_id = finListFK.get(0).rest_purpose_type_id;
			 finmatObj.party_discription = finListFK.get(0).party_discription;
			 finmatObj.frc_code = finListFK.get(0).frc_code;
			 finmatObj.partner = finListFK.get(0).partner;
			 finmatObj.partner_name = finListFK.get(0).partner_name;

		 }

		return finmatObj;
	 } catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {

			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}

		}
	}
 
	/**
	 * Возвращает остаток по коду материала по входящему МОЛу , на дату

	 *
	 * @param molCode
	 * @param date
	 * @param mat_id
	 * @return qty
	 * @throws SQLException
	 */
	public BigDecimal getRestByMatIdAndMOLCodeOnDate(String molCode, String date, String matId) {

		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {

			// не совсем корректный запрос для выбора остатков
			   String sql = " SELECT \n" +
			"           nvl(sum(q_end),0) \n " +
			" From ( \n " +
			" SELECT код_поставщика  as div, \n " +
			 "          код_материала  as  m_id, \n" +
			 "          sum(количество) as q_end, \n" +
			 "          sum(сумма)      as s_end, \n" +
			 "          max(дата_документа) last_date \n" +
			 "    FROM umc_dba.v_revert_str \n" +
			 "    WHERE дата_документа <= TO_DATE('" + date + "', 'dd.mm.yyyy') and \n" + // остатки брались постоянно на посл день месяца(это не правильно)
			 "          код_поставщика = '" + molCode + "' and \n" +
			 "          код_материала = " + matId + " \n" +
             // берем только транзит и оперативный запас
			 " 			and v_revert_str.rest_purpose_id in ("+RQConsts.REST_PURPOSE_ID_OPERATIVE + "," + RQConsts.REST_PURPOSE_ID_TRANZIT + ") \n "  +  
			 "    GROUP BY код_поставщика, \n" +
			 "             код_материала  \n" +
			 "             ) \n" +
			"Where q_end <> 0 ";


			BigDecimal out = new BigDecimal(0);

			statement = connection.prepareStatement(sql);

			System.out.println( " getRestByNNAndMOLOnDate ==== " +  sql);
			System.out.println( " getRestByNNAndMOLOnDate ==== matId - " +  matId);
			
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				out = resultSet.getBigDecimal(1);
			}
			System.out.println( " getRestByNNAndMOLOnDate ==== qty - " + out);
			
			return out;

		} catch (SQLException e) {
			throw new SystemException(e.getMessage(), e);
		}

		finally {
			try {
				if (resultSet != null)
					resultSet.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}
	}

	public void checkIfOSIsLiquidated(String invNumber) {
		if (invNumber == null) {
			throw new IllegalArgumentException("\n\nНе задано інвентарний номер!");
		}
		try {
			if (invNumber.length() == 6 && invNumberExists(invNumber)) {
				FKOSLogic fkOsLogic = new FKOSLogic(connection, userProfile);
				fkOsLogic.checkOSRemovCardWriteOffOS(invNumber);
			}
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

    private boolean invNumberExists(String inv_num) throws PersistenceException
    {
        String sql =
            " SELECT * " +
            "  FROM os_t.ostable oo " +
            " where " +
            "   oo.kod_inv = ? ";

        PreparedStatement statement = null;
        ResultSet  resultSet = null;

        try {

            boolean boolOut = false;

            statement = connection.prepareStatement(sql);

            statement.setString(1, inv_num);

            resultSet = statement.executeQuery();

            boolOut = resultSet.next();

            return boolOut;
        }
        catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new PersistenceException(e.getMessage());
        }
        finally {
            try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
        }

    } 
 
}
