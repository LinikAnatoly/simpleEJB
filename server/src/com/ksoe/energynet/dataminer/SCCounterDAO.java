
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.SCCounterDAOGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.mDaxLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.FINMolType;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.SCCounterKind;
import com.ksoe.energynet.valueobject.SCCounterSetupInfo;
import com.ksoe.energynet.valueobject.SCCounterStatus;
import com.ksoe.energynet.valueobject.SCUsageInputItemKind;
import com.ksoe.energynet.valueobject.brief.SCCounterDataShort;
import com.ksoe.energynet.valueobject.brief.SCCounterShort;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energynet.valueobject.lists.SCCounterDataShortList;
import com.ksoe.energynet.valueobject.lists.SCCounterShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.energypro.util.Tools;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.techcard.valueobject.TKAccountingType;

/**
 * DAO Object for SCCounter;
 *
 */

public class SCCounterDAO extends SCCounterDAOGen {

	public SCCounterDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public SCCounterDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}

	@Override
	public int add(SCCounter anObject) throws PersistenceException {

		anObject.costOld = anObject.cost;

		return add(anObject, true);
	}

	public SCCounterSetupInfo getSetupInfo(int estimateItemCode, Connection scConn) throws PersistenceException {

		String selectStr = "";
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		ResultSet setSchet = null;
		String schetBU = "";

		PreparedStatement stmt = null;
		String query;
		query = " select ''''||sch||''''||',' from buh_error.sprav_sch_bu ";

		try {
			stmt = scConn.prepareStatement(query);
			setSchet = stmt.executeQuery();

			while(setSchet.next()) {
				schetBU = schetBU + setSchet.getString(1);
			}
			schetBU = schetBU.substring(1, schetBU.length() - 1);

			SCCounterSetupInfo anObject = null;

			selectStr = " select  " + " a.code, a.dategen, a.numbergen, " + " p.datestart, " + " ( "
					+ " case when el.typerefcode = 7 then "
					+ " (select rpb.address from enrecordpointbyt rpb where rpb.elementcode = el.code) "
					+ " when  el.typerefcode = 8 then "
					+ " (select rpp.recordpointaddr from enrecordpointprom rpp where rpp.elementcode = el.code) " +

			" when el.typerefcode = 23 then "
					+ " (select so.contragentaddress from enservicesobject so where so.elementcode = el.code) " +

			" end " + " ) as installPlace, " +

			" ( " + " case when el.typerefcode = 7 then "
					+ "     (select 'лицевой : '|| coalesce( rpb.accountnumber , '--')||'\n'  "
					+ "             ||'адрес : '||coalesce( rpb.address, '--' )||'\n' "
					+ "             ||'Ф.И.О. : '||coalesce(rpb.name, '--') " + "         from enrecordpointbyt rpb  "
					+ "         where rpb.elementcode = el.code " + "     ) " + " when  el.typerefcode = 8 then "
					+ "     (select 'лицевой : '|| coalesce( rpp.accountnumber , '--')||'\n'  "
					+ "             ||'адрес : '||coalesce( rpp.recordpointaddr, '--' )||'\n' "
					+ "             ||'Абонент : '||coalesce(rpp.accountname, '--') "
					+ "         from enrecordpointprom rpp  " + "         where rpp.elementcode = el.code " + "     ) "
					+

			" when el.typerefcode = 23 then "
					+ "	(select 'лицевой : '|| coalesce( so.personalaccountnumber , '--')||'\n' "
					+ " 		||'адрес : '||coalesce( so.contragentaddress, '--' )||'\n' "
					+ " 		||'Ф.И.О. : '||coalesce(so.contragentname, '--') " + " 	 from enservicesobject so "
					+ " 	where so.elementcode = el.code) " +

			" end " + " ) as installInfo, " +

			" coalesce((select sum(fm.cost) from finmaterials fm, enestimateitem e1 where fm.estimateitemrefcode = e1.code "
					+ " and e1.planrefcode = p.code and fm.statusrefcode = 1 and e1.kindrefcode in ("
					+ ENEstimateItemKind.MATERIALS + ", " + ENEstimateItemKind.GSM + ")), 0) + " +
			" coalesce((select sum(ss.cost) from scseal as ss, enestimateitem e1 where ss.estimateitemrefcode = e1.code "
					+ " and e1.planrefcode = p.code and ss.statusrefcode in (1,3) and e1.kindrefcode in ("
					+ ENEstimateItemKind.MATERIALS + ")), 0) " +
					" as tmcCost " +

			", a.acttyperefcode " +

			" ,( " + " case when el.typerefcode = 7 then " + "     (select coalesce( rpb.accountnumber , '--') "
					+ "         from enrecordpointbyt rpb  " + "         where rpb.elementcode = el.code " + "     ) "
					+ " when  el.typerefcode = 8 then " + "     (select coalesce( rpp.accountnumber , '--') "
					+ "         from enrecordpointprom rpp  " + "         where rpp.elementcode = el.code " + "     ) "
					+

			" when el.typerefcode = 23 then "
					+ " (select coalesce(so.personalaccountnumber, '--') from enservicesobject so where so.elementcode = el.code) "
					+

			" end " + " ) as lschet " +

			", coalesce((select sum(fm.cost) from finmaterials fm, enestimateitem e1 where fm.estimateitemrefcode = e1.code "
					+ " and e1.planrefcode = p.code and fm.bal_sch in ('" + schetBU
					+ ") and fm.statusrefcode = 1), 0) + " +
					" coalesce((select sum(ss.cost) from scseal as ss, enestimateitem e1 where ss.estimateitemrefcode = e1.code "
					+ " and e1.planrefcode = p.code and ss.statusrefcode in (1,3) and e1.kindrefcode in ("
					+ ENEstimateItemKind.MATERIALS + ") and ss.account in ('" + schetBU+ ")), 0) " +
					" as tmcCostBu " +

			" from " + " enelement el, enestimateitem e, enplanwork p left join enact2enplanwork a2p on p.code = a2p.plancode left join enact a  on a.code = a2p.actrefcode "
					+ " where " + " e.planrefcode = p.code " + " and el.code = p.elementrefcode " +
					// " -- and e.code = f.estimateitemrefcode and
					// f.statusrefcode = 1 " +
					// " -- and e.kindrefcode in (1,2) " +
			" and e.code = ? ";

			statement = connection.prepareStatement(selectStr);

			statement.setInt(1, estimateItemCode);

			set = statement.executeQuery();
			while(set.next()) {
				anObject = new SCCounterSetupInfo();
				anObject.actCode = set.getInt(1);
				if (set.wasNull())
					anObject.actCode = Integer.MIN_VALUE;
				anObject.actDate = set.getDate(2);
				anObject.actNumber = set.getString(3);
				anObject.installDate = set.getDate(4);
				anObject.installPlace = set.getString(5);
				anObject.installInfo = set.getString(6);
				anObject.actSumTMC = set.getBigDecimal(7);
				if (anObject.actSumTMC != null)
					anObject.actSumGen = anObject.actSumTMC.setScale(2, BigDecimal.ROUND_HALF_UP);
				anObject.actTypeCode = set.getInt(8);
				if (set.wasNull())
					anObject.actTypeCode = Integer.MIN_VALUE;
				anObject.lschet = set.getString(9);

				anObject.actSumTMC_BU = set.getBigDecimal(10);
				if (anObject.actSumTMC_BU != null)
					anObject.actSumTMC_BU = anObject.actSumTMC_BU.setScale(2, BigDecimal.ROUND_HALF_UP);
			}
			return anObject;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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

			try {
				if (setSchet != null)
					setSchet.close();
			} catch (SQLException e) {
			}
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
			}

			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	public SCCounterSetupInfo getSetupInfoZKU(int estimateItemCode, Connection scConn) throws PersistenceException {

		BigDecimal sumFuel = getSumFuel(estimateItemCode);

		String selectStr = "";
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		ResultSet setSchet = null;
		String schetBU = "";

		PreparedStatement stmt = null;
		String query;
		query = " select ''''||sch||''''||',' from buh_error.sprav_sch_bu ";

		try {
			stmt = scConn.prepareStatement(query);
			setSchet = stmt.executeQuery();

			while(setSchet.next()) {
				schetBU = schetBU + setSchet.getString(1);
			}

			schetBU = schetBU.substring(1, schetBU.length() - 1);

			SCCounterSetupInfo anObject = null;// = new SCCounterSetupInfo();

			selectStr = " select code,dategen,numbergen,datestart,installplace "
					+ " ,installinfo,sum(tmccost) as tmccost,acttyperefcode,lschet,sum(tmccostbu) as tmccostbu "
					+ " from ( " + " select  " + " a.code, a.dategen, a.numbergen, " + " p.datestart, " + " ( "
					+ " case when el.typerefcode = 7 then "
					+ " (select rpb.address from enrecordpointbyt rpb where rpb.elementcode = el.code) "
					+ " when  el.typerefcode = 8 then "
					+ " (select rpp.recordpointaddr from enrecordpointprom rpp where rpp.elementcode = el.code) "
					+ " end " + " ) as installPlace, " + " ( " + " case when el.typerefcode = 7 then "
					+ "     (select 'лицевой : '|| coalesce( rpb.accountnumber , '--')||'\n'  "
					+ "             ||'адрес : '||coalesce( rpb.address, '--' )||'\n' "
					+ "             ||'Ф.И.О. : '||coalesce(rpb.name, '--') " + "         from enrecordpointbyt rpb  "
					+ "         where rpb.elementcode = el.code " + "     ) " + " when  el.typerefcode = 8 then "
					+ "     (select 'лицевой : '|| coalesce( rpp.accountnumber , '--')||'\n'  "
					+ "             ||'адрес : '||coalesce( rpp.recordpointaddr, '--' )||'\n' "
					+ "             ||'Абонент : '||coalesce(rpp.accountname, '--') "
					+ "         from enrecordpointprom rpp  " + "         where rpp.elementcode = el.code " + "     ) "
					+ " end " + " ) as installInfo, "
					+ " coalesce((select sum(fm.cost) from finmaterials fm, enestimateitem e1 where fm.estimateitemrefcode = e1.code "
					+ " and e1.planrefcode = p.code and e1.planitemrefcode =pi.code and fm.statusrefcode = 1 "
					+ " and e1.kindrefcode in (" + ENEstimateItemKind.GSM + "," + ENEstimateItemKind.MATERIALS + ")), 0) + "
					+ " coalesce((select sum(ss.cost) from scseal as ss, enestimateitem e1 where ss.estimateitemrefcode = e1.code "
					+ " and e1.planrefcode = p.code and ss.statusrefcode in (1,3) and e1.planitemrefcode =pi.code and e1.kindrefcode in ("
					+ ENEstimateItemKind.MATERIALS + ")), 0) "
					+ " as tmcCost "
					+

			", a.acttyperefcode " +

			" ,( " + " case when el.typerefcode = 7 then " + "     (select coalesce( rpb.accountnumber , '--') "
					+ "         from enrecordpointbyt rpb  " + "         where rpb.elementcode = el.code " + "     ) "
					+ " when  el.typerefcode = 8 then " + "     (select coalesce( rpp.accountnumber , '--') "
					+ "         from enrecordpointprom rpp  " + "         where rpp.elementcode = el.code " + "     ) "
					+ " end " + " ) as lschet " +

			", coalesce((select sum(fm.cost) from finmaterials fm, enestimateitem e1 where fm.estimateitemrefcode = e1.code "
					+ " and e1.planrefcode = p.code and e1.planitemrefcode =pi.code and fm.bal_sch in ('" + schetBU
					+ ") and fm.statusrefcode = 1), 0)  + "
					+ " coalesce((select sum(ss.cost) from scseal as ss, enestimateitem e1 where ss.estimateitemrefcode = e1.code "
					+ " and e1.planrefcode = p.code and ss.statusrefcode in (1,3) and e1.kindrefcode in ("
					+ ENEstimateItemKind.MATERIALS + ") and e1.planitemrefcode =pi.code and ss.account in ('" + schetBU+ ")), 0) "
					+ " as tmcCostBu " +

			" from " + " enelement el, enestimateitem e,enplanworkitem pi, enplanwork p left join enact2enplanwork a2p on p.code = a2p.plancode left join enact a  on a.code = a2p.actrefcode "
					+ " where " + " e.planrefcode = p.code " + " and el.code = p.elementrefcode "
					+ " and pi.planrefcode = p.code " + " and (" + "(pi.kartarefcode in ("
					+ ENConsts.TECHCARDS_CONSTS_ZKU + ")) or " +
					// "upper(tt.name) like upper('%встановлення шафи
					// ввідно-облікової%')" +
					"( coalesce( (select  sci.invnumber from sccounter sci where sci.estimateitemrefcode=e.code),'')='' ) or "
					+ " (p.typerefcode=" + ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU + " ) " + ")" + " and e.code = ? "
					+ " ) dat "
					+ " group by code,dategen,numbergen,datestart,installplace,installinfo,acttyperefcode,lschet ";

			statement = connection.prepareStatement(selectStr);

			statement.setInt(1, estimateItemCode);

			set = statement.executeQuery();
			while(set.next()) {
				anObject = new SCCounterSetupInfo();
				anObject.actCode = set.getInt(1);
				if (set.wasNull())
					anObject.actCode = Integer.MIN_VALUE;
				anObject.actDate = set.getDate(2);
				anObject.actNumber = set.getString(3);
				anObject.installDate = set.getDate(4);
				anObject.installPlace = set.getString(5);
				anObject.installInfo = set.getString(6);
				anObject.actSumTMC = set.getBigDecimal(7);
				anObject.actSumTMC = anObject.actSumTMC.add(sumFuel);
				if (anObject.actSumTMC != null)
					anObject.actSumGen = anObject.actSumTMC.setScale(2, BigDecimal.ROUND_HALF_UP);
				anObject.actTypeCode = set.getInt(8);
				if (set.wasNull())
					anObject.actTypeCode = Integer.MIN_VALUE;
				anObject.lschet = set.getString(9);

				anObject.actSumTMC_BU = set.getBigDecimal(10);
				if (anObject.actSumTMC_BU != null)
					anObject.actSumTMC_BU = anObject.actSumTMC_BU.setScale(2, BigDecimal.ROUND_HALF_UP);
			}
			return anObject;


		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
			try {
				if (setSchet != null)
					setSchet.close();
			} catch (SQLException e) {
			}
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
			}

			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	public BigDecimal getSumFuel(int estimateItemCode) throws PersistenceException {

		BigDecimal out = new BigDecimal(0);

		Connection connection = getConnection();

		ResultSet set = null;

		PreparedStatement stmt = null;
		String query;
		query = " select coalesce(sum(stoimost),0) as  stoimost " + " from ("
				+ "  Select  coalesce(sum(coalesce(finmat.cost,0)),0) as stoimost "
				+ "  from enestimateitem estimate ,enplanwork p  , finmaterials finmat "
				+ "  where estimate.planrefcode = (select eii.planrefcode from enestimateitem eii where eii.code= "
				+ estimateItemCode + ")" + "  and finmat.estimateitemrefcode = estimate.code "
				+ "  and estimate.planrefcode=p.code " + "  and estimate.kindrefcode=2 "
				+ "  and finmat.statusrefcode = 1 " + "  and finmat.cost <> 0 "
				+ "  and estimate.accountingtyperefcode <> 2 " +

		"  union all " +

		"  select COALESCE(sum(payswork),0)   as stoimost from " + "  ( " + "  SELECT  en2tr.payswork " + "  FROM "
				+ "    net.enact2transport en2tr , enact2enplanwork a2p   ,enplanworkitem pi, entransportitem t "
				+ "    where en2tr.actrefcode = a2p.actrefcode "
				+ "   and a2p.plancode = (select eii.planrefcode from enestimateitem eii where eii.code= "
				+ estimateItemCode + ")" + "      and a2p.plancode=pi.planrefcode "
				+ "   and pi.code=t.planitemrefcode " + "   and t.planrefcode = a2p.plancode "
				+ "  group by en2tr.code,en2tr.invnumber,en2tr.name,en2tr.expense, "
				+ "  en2tr.depreciationmonth, en2tr.depreciationhours, en2tr.timework, " + "  en2tr.payswork, "
				+ "  en2tr.modify_time, " + "  en2tr.actrefcode, "
				+ "  (select tr.code from tktransportreal tr where tr.invnumber = en2tr.invnumber) " + "  ) dat "
				+ "  ) mdat ";

		try {
			stmt = connection.prepareStatement(query);
			set = stmt.executeQuery();

			while(set.next()) {
				out = set.getBigDecimal(1).setScale(2, BigDecimal.ROUND_HALF_UP);
			}

			return out;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + query);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			return null;
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
			}

		}

	}

	public SCCounterSetupInfo getSetupInfoWOZKU(int estimateItemCode, Connection scConn) throws PersistenceException {

		BigDecimal sumFuel = getSumFuel(estimateItemCode);
		String selectStr = "";
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		ResultSet setSchet = null;
		String schetBU = "";

		PreparedStatement stmt = null;
		String query;
		query = " select ''''||sch||''''||',' from buh_error.sprav_sch_bu ";

		try {
			stmt = scConn.prepareStatement(query);
			setSchet = stmt.executeQuery();

			while(setSchet.next()) {
				schetBU = schetBU + setSchet.getString(1);
			}
			schetBU = schetBU.substring(1, schetBU.length() - 1);

			SCCounterSetupInfo anObject = null;

			selectStr = " select  " + " a.code" + ", a.dategen" + ", a.numbergen" + ", p.datestart"
					+ ", (case when el.typerefcode = 7 then "
					+ " 	(select rpb.address from enrecordpointbyt rpb where rpb.elementcode = el.code) "
					+ " when  el.typerefcode = 8 then "
					+ " (select rpp.recordpointaddr from enrecordpointprom rpp where rpp.elementcode = el.code) "
					+ " end) as installPlace" + ", (case when el.typerefcode = 7 then "
					+ "     (select 'лицевой : '|| coalesce( rpb.accountnumber , '--')||'\n'  "
					+ "             ||'адрес : '||coalesce( rpb.address, '--' )||'\n' "
					+ "             ||'Ф.И.О. : '||coalesce(rpb.name, '--') " + "         from enrecordpointbyt rpb  "
					+ "         where rpb.elementcode = el.code " + "     ) " + " when  el.typerefcode = 8 then "
					+ "     (select 'лицевой : '|| coalesce( rpp.accountnumber , '--')||'\n'  "
					+ "             ||'адрес : '||coalesce( rpp.recordpointaddr, '--' )||'\n' "
					+ "             ||'Абонент : '||coalesce(rpp.accountname, '--') "
					+ "         from enrecordpointprom rpp  " + "         where rpp.elementcode = el.code " + "     ) "
					+ " end) as installInfo" + ", p.typerefcode"
					+ ", sum(case when coalesce( (select  sci.invnumber from sccounter sci where sci.estimateitemrefcode=e.code),'')='' then 0 else "
					+ " 	coalesce((select sum(fm.cost) from finmaterials fm, enestimateitem e1 where fm.estimateitemrefcode = e1.code "
					+ " 	and e1.planrefcode = p.code and e1.planitemrefcode =pi.code and fm.statusrefcode = 1), 0) + coalesce((select sum(ss.cost) from scseal as ss, enestimateitem e1 where ss.estimateitemrefcode = e1.code "
					+ " and e1.planrefcode = p.code and ss.statusrefcode in (1,3) and e1.planitemrefcode =pi.code and e1.kindrefcode in ("
					+ ENEstimateItemKind.MATERIALS + ")), 0) end) "

					+ " as tmcCost "
					+ " , a.acttyperefcode " + " ,(case when el.typerefcode = 7 then "
					+ "     (select coalesce( rpb.accountnumber , '--') " + "         from enrecordpointbyt rpb  "
					+ "         where rpb.elementcode = el.code " + "     ) " + " 	when  el.typerefcode = 8 then "
					+ "     (select coalesce( rpp.accountnumber , '--') " + "         from enrecordpointprom rpp  "
					+ "         where rpp.elementcode = el.code " + "     ) " + " end) as lschet"
					+ ", sum(case when coalesce( (select  sci.invnumber from sccounter sci where sci.estimateitemrefcode=e.code),'')='' then 0 else "
					+ " coalesce((select sum(fm.cost) from finmaterials fm, enestimateitem e1 where fm.estimateitemrefcode = e1.code "
					+ " and e1.planrefcode = p.code and e1.planitemrefcode =pi.code and fm.bal_sch in ('" + schetBU
					+ ") and fm.statusrefcode = 1), 0) + coalesce((select sum(ss.cost) from scseal as ss, enestimateitem e1 where ss.estimateitemrefcode = e1.code "
					+ " and e1.planrefcode = p.code and ss.statusrefcode in (1,3) and e1.kindrefcode in ("
					+ ENEstimateItemKind.MATERIALS + ") and e1.planitemrefcode =pi.code and ss.account in ('" + schetBU+ ")), 0) end) "
					+ " as tmcCostBu " + " from "
					+ " enelement el, enestimateitem e,enplanworkitem pi, enplanwork p left join enact2enplanwork a2p on p.code = a2p.plancode left join enact a  on a.code = a2p.actrefcode "
					+ " where " + " e.planrefcode = p.code " + " and el.code = p.elementrefcode "
					+ " and pi.planrefcode = p.code " + " and pi.kartarefcode not in (" + ENConsts.TECHCARDS_CONSTS_ZKU
					+ ") " +

			" and e.code = ? " +
					/*
					 * 16.12.2015 Добавил группировку т.к. без нее запрос
					 * неправильно возвращал сумму по материалам
					 */
					" group by a.code, a.dategen, a.numbergen, p.datestart" + ", (case when el.typerefcode = 7 then "
					+ " 	(select rpb.address from enrecordpointbyt rpb where rpb.elementcode = el.code) "
					+ " when  el.typerefcode = 8 then "
					+ " (select rpp.recordpointaddr from enrecordpointprom rpp where rpp.elementcode = el.code) "
					+ " end " + " )" + ", (case when el.typerefcode = 7 then "
					+ "     (select 'лицевой : '|| coalesce( rpb.accountnumber , '--')||'\n'  "
					+ "             ||'адрес : '||coalesce( rpb.address, '--' )||'\n' "
					+ "             ||'Ф.И.О. : '||coalesce(rpb.name, '--') " + "         from enrecordpointbyt rpb  "
					+ "         where rpb.elementcode = el.code " + "     ) " + " when  el.typerefcode = 8 then "
					+ "     (select 'лицевой : '|| coalesce( rpp.accountnumber , '--')||'\n'  "
					+ "             ||'адрес : '||coalesce( rpp.recordpointaddr, '--' )||'\n' "
					+ "             ||'Абонент : '||coalesce(rpp.accountname, '--') "
					+ "         from enrecordpointprom rpp  " + "         where rpp.elementcode = el.code " + "     ) "
					+ " end)" + ", p.typerefcode " + " ,(case when el.typerefcode = 7 then "
					+ "     (select coalesce( rpb.accountnumber , '--') " + "         from enrecordpointbyt rpb  "
					+ "         where rpb.elementcode = el.code " + "     ) " + " 	when  el.typerefcode = 8 then "
					+ "     (select coalesce( rpp.accountnumber , '--') " + "         from enrecordpointprom rpp  "
					+ "         where rpp.elementcode = el.code " + "     ) " + " end " + " )";

			statement = connection.prepareStatement(selectStr);

			statement.setInt(1, estimateItemCode);

			set = statement.executeQuery();

			int typerefcode;

			while(set.next()) {
				anObject = new SCCounterSetupInfo();
				anObject.actCode = set.getInt(1);
				if (set.wasNull())
					anObject.actCode = Integer.MIN_VALUE;
				anObject.actDate = set.getDate(2);
				anObject.actNumber = set.getString(3);
				anObject.installDate = set.getDate(4);
				anObject.installPlace = set.getString(5);
				anObject.installInfo = set.getString(6);
				typerefcode = set.getInt(7);
				anObject.actSumTMC = set.getBigDecimal(8);
				if (typerefcode == ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU) {
					anObject.actSumTMC = anObject.actSumTMC.add(sumFuel);
				}

				if (anObject.actSumTMC != null)
					anObject.actSumGen = anObject.actSumTMC.setScale(2, BigDecimal.ROUND_HALF_UP);
				anObject.actTypeCode = set.getInt(9);
				if (set.wasNull())
					anObject.actTypeCode = Integer.MIN_VALUE;
				anObject.lschet = set.getString(10);

				anObject.actSumTMC_BU = set.getBigDecimal(11);
				if (anObject.actSumTMC_BU != null)
					anObject.actSumTMC_BU = anObject.actSumTMC_BU.setScale(2, BigDecimal.ROUND_HALF_UP);


			}

			return anObject;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
			try {
				if (setSchet != null)
					setSchet.close();
			} catch (SQLException e) {
			}
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
			}
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	public boolean isWorkerZKU(int actRefCode, String tabNumber) throws PersistenceException {
		boolean out = false;

		String selectStr = "";
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		try {

			selectStr = " select f.tabnumber  "
					+ " from  enplanwork p,enplanworkitem pi,enact a,enhumenitem hi,enact2enplanwork a2p,finworker f "
					+ " where p.code=pi.planrefcode " + " and p.code=a2p.plancode " + " and a2p.actrefcode=a.code "
					+ " and hi.finworkercode=f.code " + " and hi.planitemrefcode=pi.code "
					+ " and hi.planrefcode=p.code " + " and pi.kartarefcode in (" + ENConsts.TECHCARDS_CONSTS_ZKU + ") "
					+ " and a.code = ? " + " and cast(f.tabnumber as varchar) = ? ";

			statement = connection.prepareStatement(selectStr);

			statement.setInt(1, actRefCode);
			statement.setString(2, tabNumber);

			set = statement.executeQuery();

			if (set.next()) {
				out = true;
			}

			return out;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			return false;
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	public boolean isWorkerWOZKU(int actRefCode, String tabNumber) throws PersistenceException {
		boolean out = false;

		String selectStr = "";
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		try {

			selectStr = " select f.tabnumber  "
					+ " from  enplanwork p,enplanworkitem pi,enact a,enhumenitem hi,enact2enplanwork a2p,finworker f "
					+ " where p.code=pi.planrefcode " + " and p.code=a2p.plancode " + " and a2p.actrefcode=a.code "
					+ " and hi.finworkercode=f.code " + " and hi.planitemrefcode=pi.code "
					+ " and hi.planrefcode=p.code " + " and pi.kartarefcode not in (" + ENConsts.TECHCARDS_CONSTS_ZKU
					+ ") " + " and a.code = ? " + " and cast(f.tabnumber as varchar) = ? " +

			"  and cast(f.tabnumber as varchar) not in (" + " Select distinct en2h.tabnumber "
					+ " From enact2humen en2h, enact2enplanwork ap , enhumenitemkind hk,finworker f, " + " (    "
					+ " select ti.finworkercode from entransportitem ti,enact2enplanwork api "
					+ " where ti.planrefcode=api.plancode " + " and api.actrefcode=" + actRefCode
					+ " group by ti.finworkercode " + " ) ti " + " Where ap.actrefcode=" + actRefCode
					+ " and ti.finworkercode=f.code " + " and cast(f.tabnumber as varchar)=en2h.tabnumber "
					+ " and en2h.actrefcode = ap.actrefcode " + " and en2h.humenkindrefcode = hk.code " + ")";

			statement = connection.prepareStatement(selectStr);

			statement.setInt(1, actRefCode);
			statement.setString(2, tabNumber);

			set = statement.executeQuery();

			if (set.next()) {
				out = true;
			}

			return out;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			return false;
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	public String getAddr(int estimateItemCode) throws PersistenceException {

		String out = null;
		String selectStr = "";
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		try {

			selectStr = " select  " + " ( " + " case when el.typerefcode = 7 then "
					+ " (select rpb.address from enrecordpointbyt rpb where rpb.elementcode = el.code) "
					+ " when  el.typerefcode = 8 then "
					+ " (select rpp.recordpointaddr from enrecordpointprom rpp where rpp.elementcode = el.code) "
					+ " end " + " ) as installPlace " +

			" from " + " enelement el, enestimateitem e, enplanwork p left join enact2enplanwork a2p on p.code = a2p.plancode left join enact a  on a.code = a2p.actrefcode "
					+ " where " + " e.planrefcode = p.code " + " and el.code = p.elementrefcode " + " and e.code = ? ";

			statement = connection.prepareStatement(selectStr);

			statement.setInt(1, estimateItemCode);

			set = statement.executeQuery();
			while(set.next()) {
				out = set.getString(1);
			}
			return out;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	public String getBalance(String tabn, Date dateIn, Connection scConn) throws PersistenceException {
		if (dateIn == null || tabn == null) {
			throw new java.lang.NullPointerException("Дата или табельный пустые");
		}
		String out = "";
		ResultSet setSHPZ = null;
		PreparedStatement stmt = null;
		String query;
		query = " select b.balans from zarpherson.kadry_day_view k, zarpherson.BALANS b " + " where k.balans_id = b.id "
				+ " and k.tabn = '" + tabn + "'";

		boolean usesMDAXData = false;
		mDaxLogic mdLogic = new mDaxLogic(scConn, getUserProfile());
		AuthLogic netAuth = new AuthLogic(scConn, getUserProfile());
		usesMDAXData = netAuth.checkUsesMDAXData();

		if (usesMDAXData) {
			String balans = "";
			FINWorkerFilter workerFilter = new FINWorkerFilter();
			workerFilter.tabNumber = tabn;
			FINWorkerShortList finWorkerList = mdLogic.getFINWorkerList(workerFilter, 0, -1, dateIn, true);
			if (finWorkerList.totalCount == 0) {
				throw new SystemException(String.format("Не знайдено робітника із табельним номером %s на дату %s",
						tabn, new SimpleDateFormat("dd.MM.yyyy").format(dateIn)));
			}

			if (!finWorkerList.get(0).balans.equals("")) {
				balans = finWorkerList.get(0).balans;
			}
			return balans;
		}

		try {
			stmt = scConn.prepareStatement(query);
			setSHPZ = stmt.executeQuery();
			while(setSHPZ.next()) {
				out = setSHPZ.getString(1);
				break;
			}

			return out;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + query);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			return null;
		} finally {
			try {
				if (setSHPZ != null)
					setSHPZ.close();
			} catch (SQLException e) {
			}
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
			}
		}

	}

	public SCCounterShortList getPlanNoActs(int usageInputCode) throws PersistenceException {
		SCCounterShortList result = new SCCounterShortList();
		SCCounterShort anObject;
		result.list = new Vector<SCCounterShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		/*
		 * попадали и те где ставили АБ счетчик + есть пломбы и т.д. ...
		 * selectStr = "select e.planrefcode , c.code, c.invnumber , c.sccode "
		 * +
		 * " from sccounter c, scusageinputitem ui , scusageinputtmz2sccntr ui2c, "
		 * + " scusageinputitemoz oz , enestimateitem e  " +
		 * "  left join enact2enplanwork a2p on a2p.plancode = e.planrefcode " +
		 * " where " +
		 * " c.estimateitemrefcode = e.code and c.code = ui2c.sccounterrefcode "
		 * +
		 * " and oz.code = ui2c.ozrefcode and oz.usageinputitemrefcode = ui.code "
		 * + " and ui.usageinputrefcode = ? and a2p.actrefcode is null " +
		 * " order by e.planrefcode";
		 */
		selectStr = " select  " + " e.planrefcode "
				+ " from sccounter c, scusageinputitem ui , scusageinputtmz2sccntr ui2c, "
				+ " scusageinputitemoz oz , enestimateitem e  "
				+ "  left join enact2enplanwork a2p on a2p.plancode = e.planrefcode " + " , enplanwork pp "
				+ "  , enestimateitem ep " + " where "
				+ " c.estimateitemrefcode = e.code and c.code = ui2c.sccounterrefcode "
				+ " and oz.code = ui2c.ozrefcode and oz.usageinputitemrefcode = ui.code "
				+ "  and ui.usageinputrefcode = ? " + "  and a2p.actrefcode is null "
				+ "  and ep.planrefcode = pp.code " + "  and  pp.code = e.planrefcode " + " and pp.statuscode = "
				+ ENPlanWorkStatus.GOOD + " group by e.planrefcode " + " having count(e.planrefcode) = 1 ";

		try {
			statement = connection.prepareStatement(selectStr);

			statement.setInt(1, usageInputCode);

			set = statement.executeQuery();
			int i = 0;
			for (i = 0; set.next(); i++) {

				anObject = new SCCounterShort();

				anObject.planRefCode = set.getInt(1);
				if (set.wasNull())
					anObject.planRefCode = Integer.MIN_VALUE;
				/*
				 * anObject.code = set.getInt(2); if ( set.wasNull() )
				 * anObject.code = Integer.MIN_VALUE;
				 *
				 * anObject.invNumber = set.getString(3);
				 *
				 * anObject.scCode = set.getInt(4); if ( set.wasNull() )
				 * anObject.scCode = Integer.MIN_VALUE;
				 */
				result.list.add(anObject);

			}

			result.setTotalCount(i);
			return result;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	public SCCounterDataShortList getData4filling(String molCode, Date dateStart, Date dateFinal, boolean isOECounters,
			int actCode) throws PersistenceException {
		SCCounterDataShortList result = new SCCounterDataShortList();
		SCCounterDataShort anObject;
		result.list = new Vector<SCCounterDataShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		selectStr =  "SELECT \n " +
				 "	case \n " +
				 "		when ei.kindrefcode = ? then ? \n " +
				 "		when ei.kindrefcode = ? and sc.invnumber is not null then ? \n " +
				 "		when ei.kindrefcode = ? and sc.invnumber is null then ? \n " +
				 "		else null \n " +
				 "	end as itemKind \n " +
				 "	, sc.code \n " +
				 "	, sc.countertype \n " +
				 "	, sc.cost \n " +
				 "	, sc.account \n " +
				 "	, w.code \n " +
				 "	, w.workordernumber \n " +
				 ((actCode != Integer.MIN_VALUE) ? ", a2p.actrefcode"
						 : ", (select a2p1.actrefcode from enact2enplanwork as a2p1 where a2p1.plancode = p.code) \n ") +
				 "	, sc.name \n " +
				 "	, p.elementrefcode \n " +
				 "	, p.staterefcode \n " +
				 "	, p.code \n " +
				 "	, sc.invnumber \n " +
				 "	, sc.molcode \n " +
				 "	, sc.actinvitationnumber \n " +
				 "	, p.budgetrefcode as budg_code \n " +
				 "	, sc.buildnumber \n " +
				 "FROM \n " +
				 "	enplanwork as p \n " +
				 ((actCode != Integer.MIN_VALUE) ? "	left join enact2enplanwork as a2p on a2p.plancode = p.code \n " +
				 "	left join enact as a on a.code = a2p.actrefcode \n " : "") +
				 "	inner join enestimateitem as ei on p.code = ei.planrefcode \n " +
				 "	inner join sccounter as sc on ei.code = sc.estimateitemrefcode \n " +
				 "	inner join enworkorder2enplanwork as w2p on p.code = w2p.plancode \n " +
				 "	inner join enworkorder as w on w.code = w2p.workordercode \n " +
				 "	inner join finmoldata as fm on fm.workordercode = w.code \n " +
				 "WHERE \n " +
				 // берем или наши ... или абонов
				 ((isOECounters) ? " sc.invnumber is not null \n" : " sc.invnumber is null  \n") +
				 " and sc.statusrefcode = ? and sc.kindrefcode = ? \n"
				 + " and ei.accountingtyperefcode = ? \n"

				 // SUPP-9565
				 // + " and p.responsibilityrefcode in (?,?) \n"
				 /** 17.08.2018... SUPP-75042 */
				 + " and p.budgetrefcode in (?, ?) "

				 + " and p.kindcode = ? and p.typerefcode not in (?, ?, ?) \n"
				 + " and fm.finmolcode = ? \n"
				 + (actCode == Integer.MIN_VALUE ? " and p.typerefcode <> ? \n" : " and a.code = ? \n")
				 + " and fm.moltyperefcode = ? \n"
				 // SUPP-67738 Абоновские счетчики на ввод в эксплуатацию попадают в
				 // формирование
				 + " and case when ei.kindrefcode <> ? then sc.molcode is not null else 1=1 end \n"
				 /** SUPP-34695.... при формировании одиночной ОЗ для договора по переходу
				  	* на многозонный учет период планов не нужен - заходит код акта....
				  	*/
				 + (actCode == Integer.MIN_VALUE ? " and p.datestart between ? and ? \n" : "\n")
				 + "ORDER BY \n"
				 + ((isOECounters) ? " ei.kindrefcode, sc.cost, sc.account, sc.name, sc.molcode "
							: " sc.name, sc.molcode");

		try {
			statement = connection.prepareStatement(selectStr);

			int index = 1;
			statement.setInt(index++, ENEstimateItemKind.MATERIALS);
			statement.setInt(index++, SCUsageInputItemKind.UsageInput);
			statement.setInt(index++, ENEstimateItemKind.UNMOUNT);
			statement.setInt(index++, SCUsageInputItemKind.UsageOut);
			statement.setInt(index++, ENEstimateItemKind.UNMOUNT);
			statement.setInt(index++, SCUsageInputItemKind.InputUsing);
			statement.setInt(index++, SCCounterStatus.GOOD);
			statement.setInt(index++, SCCounterKind.FOR_FACT);
			statement.setInt(index++, TKAccountingType.COUNTERS);

			/** 17.08.2018... SUPP-75042 */
			statement.setInt(index++, ENConsts.ENBUDGET_ENERGOSBYT);
			statement.setInt(index++, ENConsts.ENBUDGET_VRTU);

			/*
			statement.setInt(index++, ENConsts.ENRESPONSIBILITY_ENERGOSBYT);
			statement.setInt(index++, ENConsts.ENRESPONSIBILITY_VRTUVD);
			*/

			statement.setInt(index++, ENPlanWorkKind.FACT);
			statement.setInt(index++, ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU);
			statement.setInt(index++, ENPlanWorkType.EZ_CHANGE_ZKU);
			statement.setInt(index++, ENPlanWorkType.EZ_SETUP_ZKU);
			statement.setString(index++, molCode);

			/**
			 * SUPP-34695.... при формировании одиночной ОЗ для договора по
			 * переходу на многозонный учет период планов не нужен - заходит код
			 * акта....
			 */
			if (actCode == Integer.MIN_VALUE) {
				statement.setInt(index++, ENPlanWorkType.WORK_IN_OUT);
			} else {
				statement.setInt(index++, actCode);
			}

			statement.setInt(index++, FINMolType.MASTER);
			statement.setInt(index++, ENEstimateItemKind.MATERIALS);

			if (actCode == Integer.MIN_VALUE) {
				statement.setDate(index++, new java.sql.Date(dateStart.getTime()));
				statement.setDate(index++, new java.sql.Date(dateFinal.getTime()));
			}

			set = statement.executeQuery();
			int i = 0;
			for (i = 0; set.next(); i++) {
				anObject = new SCCounterDataShort();

				anObject.usageItemKind = set.getInt(1);
				if (set.wasNull())
					anObject.usageItemKind = Integer.MIN_VALUE;

				anObject.code = set.getInt(2);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;

				anObject.counterType = set.getString(3);
				anObject.cost = set.getBigDecimal(4);
				if (anObject.cost != null)
					anObject.cost = anObject.cost.setScale(6, BigDecimal.ROUND_HALF_UP);
				anObject.account = set.getString(5);
				anObject.workOrderCode = set.getInt(6);
				if (set.wasNull())
					anObject.workOrderCode = Integer.MIN_VALUE;
				anObject.workOrderNumber = set.getString(7);

				anObject.actCode = set.getInt(8);
				if (set.wasNull())
					anObject.actCode = Integer.MIN_VALUE;

				anObject.name = set.getString(9);

				anObject.planElementRefCode = set.getInt(10);
				if (set.wasNull())
					anObject.planElementRefCode = Integer.MIN_VALUE;

				anObject.planStateRefCode = set.getInt(11);
				if (set.wasNull())
					anObject.planStateRefCode = Integer.MIN_VALUE;
				anObject.planRefCode = set.getInt(12);
				if (set.wasNull())
					anObject.planRefCode = Integer.MIN_VALUE;

				anObject.invNumber = set.getString(13);

				anObject.molCode = set.getString(14);

				anObject.actInvitationNumber = set.getString(15);

				anObject.budgetRefCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.budgetRefCode = Integer.MIN_VALUE;
				}

				anObject.buildNumber = set.getString(17);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	public SCCounterDataShortList getData4fillingZKU(String molCode, Date dateStart, Date dateFinal, int isOECounters)
			throws PersistenceException {
		SCCounterDataShortList result = new SCCounterDataShortList();
		SCCounterDataShort anObject;
		result.list = new Vector<SCCounterDataShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		selectStr = "select " + " case when ei.kindrefcode = 1 then 1 "
				+ " when ei.kindrefcode = 3 and sc.invnumber is not null then 2 " + " else null end as itemKind, "
				+ " sc.code, sc.countertype, sc.cost, sc.account, w.code, w.workordernumber, a2p.actrefcode , sc.name, "
				+ " p.elementrefcode, p.staterefcode , p.code " +

		", sc.invnumber " +

		", sc.molcode " + " ,case when p.typerefcode=" + ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU
				+ " then 1 else 0 end as ischange, sc.actinvitationnumber, p.budgetrefcode as budg_code " +

		" from enplanwork p left join enact2enplanwork a2p on a2p.plancode = p.code left join enact a on a.code = a2p.actrefcode "
				+ " , enestimateitem ei, sccounter sc , enworkorder w, enworkorder2enplanwork w2p , finmoldata fm "
				+ " where p.code = ei.planrefcode and ei.code = sc.estimateitemrefcode and w.code = w2p.workordercode and p.code = w2p.plancode "
				+

		// берем или наши ... или абонов
				((isOECounters == 1) ? " and sc.invnumber is not null " : " and sc.invnumber is null  ") +

		" and sc.statusrefcode = " + SCCounterStatus.GOOD + " and sc.kindrefcode = " + SCCounterKind.FOR_FACT
				+ " and ei.accountingtyperefcode = " + TKAccountingType.COUNTERS
				+ " and p.responsibilityrefcode in (240000002,75000010) " + // центр
																			// ответсвенноси
																			// ЕнЗбыт
																			// !!!
				" and p.kindcode = " + ENPlanWorkKind.FACT + " and p.typerefcode in("
				+ ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU + "," + ENPlanWorkType.EZ_CHANGE_ZKU + ","
				+ ENPlanWorkType.EZ_SETUP_ZKU + ")" + " and fm.workordercode = w.code and fm.finmolcode = ? " +
				" and fm.moltyperefcode = ? " +

		" and sc.molcode is not null " +

		" and p.datestart between ? and ? "
		
				+ ((isOECounters == 1) ? " order by ei.kindrefcode, sc.cost, sc.account, sc.name, sc.molcode "
						: " order by sc.name, sc.molcode");

		try {
			statement = connection.prepareStatement(selectStr);

			statement.setString(1, molCode);
			statement.setInt(2, FINMolType.MASTER);
			statement.setDate(3, new java.sql.Date(dateStart.getTime()));
			statement.setDate(4, new java.sql.Date(dateFinal.getTime()));

			set = statement.executeQuery();
			int i = 0;
			for (i = 0; set.next(); i++) {
				anObject = new SCCounterDataShort();

				anObject.usageItemKind = set.getInt(1);
				if (set.wasNull())
					anObject.usageItemKind = Integer.MIN_VALUE;

				anObject.code = set.getInt(2);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;

				anObject.counterType = set.getString(3);
				anObject.cost = set.getBigDecimal(4);
				if (anObject.cost != null)
					anObject.cost = anObject.cost.setScale(6, BigDecimal.ROUND_HALF_UP);
				anObject.account = set.getString(5);
				anObject.workOrderCode = set.getInt(6);
				if (set.wasNull())
					anObject.workOrderCode = Integer.MIN_VALUE;
				anObject.workOrderNumber = set.getString(7);

				anObject.actCode = set.getInt(8);
				if (set.wasNull())
					anObject.actCode = Integer.MIN_VALUE;

				anObject.name = set.getString(9);

				anObject.planElementRefCode = set.getInt(10);
				if (set.wasNull())
					anObject.planElementRefCode = Integer.MIN_VALUE;

				anObject.planStateRefCode = set.getInt(11);
				if (set.wasNull())
					anObject.planStateRefCode = Integer.MIN_VALUE;
				anObject.planRefCode = set.getInt(12);
				if (set.wasNull())
					anObject.planRefCode = Integer.MIN_VALUE;

				anObject.invNumber = set.getString(13);

				anObject.molCode = set.getString(14);

				anObject.isChangeInZKU = set.getInt(15);
				if (set.wasNull())
					anObject.isChangeInZKU = Integer.MIN_VALUE;

				anObject.actInvitationNumber = set.getString(16);

				anObject.budgetRefCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.budgetRefCode = Integer.MIN_VALUE;
				}

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	public boolean isOneMoreDocument(int actCode) throws PersistenceException {
		boolean result;
		result = false;

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		selectStr = " select count(distinct ei.planitemrefcode) " + " from finmaterials f, enestimateitem ei  "
				+ " left join enact2enplanwork a2p on a2p.plancode = ei.planrefcode  "
				+ " left join enact a on a.code = a2p.actrefcode  " + " where a.code= " + actCode
				+ " and f.estimateitemrefcode=ei.code " + " and ei.countfact>0 " + " group by a.code ";

		try {
			statement = connection.prepareStatement(selectStr);

			set = statement.executeQuery();
			int i = 0;
			if (set.next()) {
				i = set.getInt(1);
				if (i > 1) {
					result = true;
				}
			}
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			return false;
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	public SCCounterDataShortList getData4fillingZKUAbon(String molCode, Date dateStart, Date dateFinal,
			int isOECounters) throws PersistenceException {
		SCCounterDataShortList result = new SCCounterDataShortList();
		SCCounterDataShort anObject;
		result.list = new Vector<SCCounterDataShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		selectStr = "select " + " case when ei.kindrefcode = 1 then 1 "
				+ " when ei.kindrefcode = 3 and sc.invnumber is not null then 2 " + " else null end as itemKind, "
				+ " sc.code, sc.countertype, sc.cost, sc.account, w.code, w.workordernumber, a2p.actrefcode , sc.name, "
				+ " p.elementrefcode, p.staterefcode , p.code " +

		", sc.invnumber " +

		", sc.molcode " + " ,case when p.typerefcode=" + ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU
				+ " then 1 else 0 end as ischange, sc.actinvitationnumber, p.budgetrefcode as budg_code " +
		", sc.buildnumber" +

		" from enplanwork p left join enact2enplanwork a2p on a2p.plancode = p.code left join enact a on a.code = a2p.actrefcode "
				+ " , enestimateitem ei, sccounter sc , enworkorder w, enworkorder2enplanwork w2p , finmoldata fm "
				+ " where p.code = ei.planrefcode and ei.code = sc.estimateitemrefcode and w.code = w2p.workordercode and p.code = w2p.plancode "
				+

		// берем или наши ... или абонов
				((isOECounters == 1) ? " and sc.invnumber is not null " : " and sc.invnumber is null  ") +

		" and sc.statusrefcode = " + SCCounterStatus.GOOD + " and sc.kindrefcode = " + SCCounterKind.FOR_FACT
				+ " and ei.accountingtyperefcode = " + TKAccountingType.COUNTERS
				+ " and p.responsibilityrefcode in (240000002,75000010) " + // центр
																			// ответсвенноси
																			// ЕнЗбыт
																			// !!!
				" and p.kindcode = " + ENPlanWorkKind.FACT + " and p.typerefcode in("
				+ ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU + "," + ENPlanWorkType.EZ_CHANGE_ZKU + ","
				+ ENPlanWorkType.EZ_SETUP_ZKU + ")" + " and fm.workordercode = w.code and fm.finmolcode = ? " +

		// " and sc.molcode is not null " +

		" and p.datestart between to_date(" + Tools.convertDateToSQLString(dateStart) + ",'dd.MM.yyyy') and to_date("
				+ Tools.convertDateToSQLString(dateFinal) + ",'dd.MM.yyyy')"
				+ ((isOECounters == 1) ? " order by ei.kindrefcode, sc.cost, sc.account, sc.name, sc.molcode "
						: " order by sc.name, sc.molcode");

		try {
			statement = connection.prepareStatement(selectStr);

			statement.setString(1, molCode);
			// statement.setDate(2, new java.sql.Date(dateStart.getTime()));
			// statement.setDate(3, new java.sql.Date(dateFinal.getTime()));

			set = statement.executeQuery();
			int i = 0;
			for (i = 0; set.next(); i++) {
				anObject = new SCCounterDataShort();

				anObject.usageItemKind = set.getInt(1);
				if (set.wasNull())
					anObject.usageItemKind = Integer.MIN_VALUE;

				anObject.code = set.getInt(2);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;

				anObject.counterType = set.getString(3);
				anObject.cost = set.getBigDecimal(4);
				if (anObject.cost != null)
					anObject.cost = anObject.cost.setScale(6, BigDecimal.ROUND_HALF_UP);
				anObject.account = set.getString(5);
				anObject.workOrderCode = set.getInt(6);
				if (set.wasNull())
					anObject.workOrderCode = Integer.MIN_VALUE;
				anObject.workOrderNumber = set.getString(7);

				anObject.actCode = set.getInt(8);
				if (set.wasNull())
					anObject.actCode = Integer.MIN_VALUE;

				anObject.name = set.getString(9);

				anObject.planElementRefCode = set.getInt(10);
				if (set.wasNull())
					anObject.planElementRefCode = Integer.MIN_VALUE;

				anObject.planStateRefCode = set.getInt(11);
				if (set.wasNull())
					anObject.planStateRefCode = Integer.MIN_VALUE;
				anObject.planRefCode = set.getInt(12);
				if (set.wasNull())
					anObject.planRefCode = Integer.MIN_VALUE;

				anObject.invNumber = set.getString(13);

				anObject.molCode = set.getString(14);

				anObject.isChangeInZKU = set.getInt(15);
				if (set.wasNull())
					anObject.isChangeInZKU = Integer.MIN_VALUE;

				anObject.actInvitationNumber = set.getString(16);

				anObject.budgetRefCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.budgetRefCode = Integer.MIN_VALUE;
				}

				anObject.buildNumber = set.getString(18);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	public SCCounterDataShortList getData4fillingOnlyZKU(String molCode, Date dateStart, Date dateFinal, int uiCode)
			throws PersistenceException {
		SCCounterDataShortList result = new SCCounterDataShortList();
		SCCounterDataShort anObject;
		result.list = new Vector<SCCounterDataShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		selectStr = "select " + " case when p.typerefcode=" + ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU
				+ " then 5 else 4 end as itemKind, " +

		" sc.code, sc.countertype, sc.costzku, " + " coalesce(sc.accountzku,sc.account,'2096') as accountzku, "
				+ " w.code, w.workordernumber, a2p.actrefcode , sc.namezku, "
				+ " p.elementrefcode, p.staterefcode , p.code " +

		", sc.invnumberzku " +

		", sc.molcode " +

		" ,case when p.typerefcode=" + ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU + " then 1 else 0 end as ischange " +

		", sc.invnumber " + ", sc.sccodezku, sc.actinvitationnumber, p.budgetrefcode as budg_code " +

		" from enplanwork p left join enact2enplanwork a2p on a2p.plancode = p.code left join enact a on a.code = a2p.actrefcode "
				+ " , enestimateitem ei, sccounter sc , enworkorder w, enworkorder2enplanwork w2p , finmoldata fm "
				+ " where p.code = ei.planrefcode and ei.code = sc.estimateitemrefcode and w.code = w2p.workordercode and p.code = w2p.plancode "
				+

		" and (" + "(sc.statusrefcode = " + SCCounterStatus.GOOD + ") or " + "(sc.statusrefcode = "
				+ SCCounterStatus.IN_ACT + " and sc.code in ("
				+ " select sc2oz.sccounterrefcode from scusageinputtmz2sccntr sc2oz,scusageinputitemoz oz,scusageinputitem uii "
				+ " where sc2oz.ozrefcode=oz.code " + " and oz.usageinputitemrefcode=uii.code "
				+ " and uii.usageinputrefcode=" + uiCode + ")" + ")" + ")" + " and sc.kindrefcode = "
				+ SCCounterKind.FOR_FACT + " and ei.accountingtyperefcode = " + TKAccountingType.COUNTERS
				+ " and p.responsibilityrefcode in (240000002,75000010) " + // центр
																			// ответсвенноси
																			// ЕнЗбыт
																			// !!!
				" and p.kindcode = " + ENPlanWorkKind.FACT +

		" and p.typerefcode in (" + ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU + "," + ENPlanWorkType.EZ_CHANGE_ZKU + ","
				+ ENPlanWorkType.EZ_SETUP_ZKU + ")" +

		" and fm.workordercode = w.code and fm.finmolcode = ? and fm.moltyperefcode = ? " + " and ei.kindrefcode = 1 "
				+ " and p.datestart between ? and ? " +
				// " and sc.invnumber is not null "+
				" order by ei.kindrefcode, sc.costzku, sc.accountzku, sc.namezku, sc.molcode ";

		try {
			statement = connection.prepareStatement(selectStr);

			statement.setString(1, molCode);
			statement.setInt(2, FINMolType.MASTER);
			statement.setDate(3, new java.sql.Date(dateStart.getTime()));
			statement.setDate(4, new java.sql.Date(dateFinal.getTime()));

			set = statement.executeQuery();
			int i = 0;
			for (i = 0; set.next(); i++) {
				anObject = new SCCounterDataShort();

				anObject.usageItemKind = set.getInt(1);
				if (set.wasNull())
					anObject.usageItemKind = Integer.MIN_VALUE;

				anObject.code = set.getInt(2);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;

				anObject.counterType = set.getString(3);
				anObject.costzku = set.getBigDecimal(4);
				if (anObject.costzku != null)
					anObject.costzku = anObject.costzku.setScale(6, BigDecimal.ROUND_HALF_UP);
				anObject.accountzku = set.getString(5);
				anObject.workOrderCode = set.getInt(6);
				if (set.wasNull())
					anObject.workOrderCode = Integer.MIN_VALUE;
				anObject.workOrderNumber = set.getString(7);

				anObject.actCode = set.getInt(8);
				if (set.wasNull())
					anObject.actCode = Integer.MIN_VALUE;

				anObject.namezku = set.getString(9);

				anObject.planElementRefCode = set.getInt(10);
				if (set.wasNull())
					anObject.planElementRefCode = Integer.MIN_VALUE;

				anObject.planStateRefCode = set.getInt(11);
				if (set.wasNull())
					anObject.planStateRefCode = Integer.MIN_VALUE;
				anObject.planRefCode = set.getInt(12);
				if (set.wasNull())
					anObject.planRefCode = Integer.MIN_VALUE;

				anObject.invnumberzku = set.getString(13);

				anObject.molCode = set.getString(14);

				anObject.isChangeInZKU = set.getInt(15);
				if (set.wasNull())
					anObject.isChangeInZKU = Integer.MIN_VALUE;

				anObject.invNumber = set.getString(16);

				anObject.sccodezku = set.getInt(17);
				if (set.wasNull())
					anObject.sccodezku = Integer.MIN_VALUE;

				anObject.actInvitationNumber = set.getString(18);

				anObject.budgetRefCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.budgetRefCode = Integer.MIN_VALUE;
				}

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	public int getActCode(int scCode) throws PersistenceException {
		int out = Integer.MIN_VALUE;
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		selectStr = "select  a2p.actrefcode "
				+ " from enestimateitem ei, sccounter sc , enplanwork p left join enact2enplanwork a2p on a2p.plancode = p.code "
				+ " where p.code = ei.planrefcode and ei.code = sc.estimateitemrefcode" + " and sc.code=" + scCode;

		try {
			statement = connection.prepareStatement(selectStr);

			set = statement.executeQuery();
			while(set.next()) {
				out = set.getInt(1);
				if (set.wasNull())
					out = Integer.MIN_VALUE;
			}

			return out;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			return Integer.MIN_VALUE;
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public SCCounterShortList getScrollableFilteredList(SCCounter aFilterObject, String anCondition, String anOrderBy,
			int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		SCCounterShortList result = new SCCounterShortList();
		SCCounterShort anObject;
		result.list = new Vector<SCCounterShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0)
			orderBy = "SCCOUNTER.CODE";

		if (quantity < 0)
			quantity = Integer.MAX_VALUE / 2;

		if (getUserProfile() == null)
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");

		selectStr = "SELECT " + "SCCOUNTER.CODE" + ",SCCOUNTER.INVNUMBER" + ",SCCOUNTER.NAME" + ",SCCOUNTER.BUILDNUMBER"
				+ ",SCCOUNTER.ACCOUNT" + ",SCCOUNTER.DEPARTMETFKCODE" + ",SCCOUNTER.MOLCODE" + ",SCCOUNTER.DATEIN"
				+ ",SCCOUNTER.DATEBUILD" + ",SCCOUNTER.DATECHECK" + ",SCCOUNTER.COST" + ",SCCOUNTER.SCCODE"
				+ ",SCCOUNTER.COUNTERTYPE" + ",SCCOUNTER.INSTALLORDERNUMBER" + ",SCCOUNTER.READING"
				+ ",SCCOUNTER.DATEEDIT" +

		", SCCOUNTERSTATUS.CODE " + ", SCCOUNTERSTATUS.NAME " + ", ENESTIMATEITEM.CODE " + ", ENESTIMATEITEM.COUNTGEN "
				+ ", ENESTIMATEITEM.COUNTFACT " + ", ENESTIMATEITEM.PRICE " + ", ENESTIMATEITEM.COST "
				+ ", ENESTIMATEITEM.DELIVERYTIME " + ", ENESTIMATEITEM.USEWORKTIME " + ", ENESTIMATEITEM.USERGEN "
				+ ", ENESTIMATEITEM.DATEEDIT " +

		", SCCOUNTERKIND.CODE " + ", SCCOUNTERKIND.NAME " + ", SCCOUNTER.ZONEREFCODE "
				+ ", (select zone1.name from rqstoragezone as zone1 where zone1.code = SCCOUNTER.ZONEREFCODE) as zone_name "
				+ " , SCCOUNTER.PODRCODEZKU  " 
				+ ", SCCOUNTER.FUNDINGTYPE " +

		" FROM SCCOUNTER left join ENESTIMATEITEM on ENESTIMATEITEM.CODE = SCCOUNTER.ESTIMATEITEMREFCODE "
				+ ", SCCOUNTERSTATUS " +

		", SCCOUNTERKIND " +

		// ", ENESTIMATEITEM " +
		// " WHERE "
		"";
		whereStr = " SCCOUNTERSTATUS.CODE = SCCOUNTER.STATUSREFCODE"; // +
		whereStr = whereStr + " AND SCCOUNTERKIND.CODE = SCCOUNTER.KINDREFCODE"; // +
		// whereStr = whereStr +" AND ENESTIMATEITEM.CODE =
		// SCCOUNTER.ESTIMATEITEMREFCODE" ; //+
		// selectStr = selectStr + " ${s} SCCOUNTER.CODE IN ( SELECT
		// SCCOUNTER.CODE FROM SCCOUNTER ";
		
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);

		if (whereStr.length() != 0)
			selectStr = selectStr + " WHERE " + whereStr;

		selectStr = selectStr + " ORDER BY " + orderBy;

		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1)
			selectStr = selectStr + " LIMIT " + quantity;

		try {
			statement = connection.prepareStatement(selectStr);
			int number = 0;
			
			number = setParameters(aFilterObject, statement);

			if (condition.length() > 0 && aBindObjects != null)
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				/*
				 * if (i < fromPosition) continue; else if (i >= fromPosition +
				 * quantity) { i++; break; }
				 */

				anObject = new SCCounterShort();

				anObject.code = set.getInt(1);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;
				anObject.invNumber = set.getString(2);
				anObject.name = set.getString(3);
				anObject.buildNumber = set.getString(4);
				anObject.account = set.getString(5);
				anObject.departmetFKCode = set.getString(6);
				anObject.molCode = set.getString(7);
				anObject.dateIn = set.getDate(8);
				anObject.dateBuild = set.getDate(9);
				anObject.dateCheck = set.getDate(10);
				anObject.cost = set.getBigDecimal(11);
				if (anObject.cost != null)
					anObject.cost = anObject.cost.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
				anObject.scCode = set.getInt(12);
				if (set.wasNull())
					anObject.scCode = Integer.MIN_VALUE;
				anObject.counterType = set.getString(13);
				anObject.installOrderNumber = set.getString(14);
				anObject.reading = set.getString(15);
				anObject.dateEdit = set.getTimestamp(16);

				anObject.statusRefCode = set.getInt(17);
				if (set.wasNull())
					anObject.statusRefCode = Integer.MIN_VALUE;
				anObject.statusRefName = set.getString(18);
				anObject.estimateItemRefCode = set.getInt(19);
				if (set.wasNull())
					anObject.estimateItemRefCode = Integer.MIN_VALUE;
				anObject.estimateItemRefCountGen = set.getBigDecimal(20);
				if (anObject.estimateItemRefCountGen != null)
					anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(6,
							java.math.BigDecimal.ROUND_HALF_UP);
				anObject.estimateItemRefCountFact = set.getBigDecimal(21);
				if (anObject.estimateItemRefCountFact != null)
					anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(6,
							java.math.BigDecimal.ROUND_HALF_UP);
				anObject.estimateItemRefPrice = set.getBigDecimal(22);
				if (anObject.estimateItemRefPrice != null)
					anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);
				anObject.estimateItemRefCost = set.getBigDecimal(23);
				if (anObject.estimateItemRefCost != null)
					anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);
				anObject.estimateItemRefDeliveryTime = set.getInt(24);
				if (set.wasNull())
					anObject.estimateItemRefDeliveryTime = Integer.MIN_VALUE;
				anObject.estimateItemRefUseWorkTime = set.getInt(25);
				if (set.wasNull())
					anObject.estimateItemRefUseWorkTime = Integer.MIN_VALUE;
				anObject.estimateItemRefUserGen = set.getString(26);
				anObject.estimateItemRefDateEdit = set.getDate(27);

				anObject.kindRefCode = set.getInt(28);
				if (set.wasNull())
					anObject.kindRefCode = Integer.MIN_VALUE;
				anObject.kindRefName = set.getString(29);
				anObject.zoneRefCode = set.getInt(30);
				if (set.wasNull())
					anObject.zoneRefCode = Integer.MIN_VALUE;
				anObject.zoneRefName = set.getString(31);
				anObject.podrCodeZKU = set.getString(32);
				anObject.fundingType = set.getInt(33);
				if(set.wasNull()) {
					anObject.fundingType = Integer.MIN_VALUE;
				}
				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	/**
	 * Лист по разнарядке , Вернет созданные счетчики
	 */
	public SCCounterShortList getCountersListFromScanCounterForPrihodByScOrder(int scorderCode)
			throws PersistenceException {
		SCCounterShortList result = new SCCounterShortList();
		SCCounterShort anObject;
		result.list = new Vector<SCCounterShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if (getUserProfile() == null)
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");

		selectStr = " select os.kod_inv as invnumber \n " + " , os.str_name as name \n "
				+ " , os.kod_oborud as buildnumber \n " + " , os.kod_subsch_b as account \n "
				+ " , os.kod_podr as departementfkcode \n " + " , os.kod_mol as molcode \n "
				+ " , os.dt_doc as datein \n " + " , os.dt_vypusk as datebuild  \n " + " , os.sum_st_perv as cost  \n "
				+ " , os.num_un as sccode \n " + " , os.type_counter as countertype \n " + " , os.storagezonecode \n "
				+ " from countersread.temp_counters tc, countersread.draftraznar dr ,  countersread.ostable os \n "
				+ " where tc.id_raznaryadka = dr.id \n " + " and dr.id = " + scorderCode + " \n "
				+ " and tc.id = os.id_temp_counters \n " + " and os.show_ = 'Y'  \n ";

		try {
			statement = connection.prepareStatement(selectStr);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {

				anObject = new SCCounterShort();

				anObject.code = set.getInt(1);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;

				anObject.invNumber = set.getString("invNumber");
				anObject.name = set.getString("name");
				anObject.buildNumber = set.getString("buildNumber");
				anObject.account = set.getString("account");
				anObject.departmetFKCode = set.getString("departementfkcode");
				anObject.molCode = set.getString("molcode");
				anObject.dateIn = set.getDate("datein");
				anObject.dateBuild = set.getDate("datebuild");
				anObject.cost = set.getBigDecimal("cost");
				if (anObject.cost != null)
					anObject.cost = anObject.cost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				anObject.scCode = set.getInt("sccode");
				if (set.wasNull())
					anObject.scCode = Integer.MIN_VALUE;
				anObject.counterType = set.getString("countertype");
				anObject.zoneRefCode = set.getInt("storagezonecode");
				if (set.wasNull())
					anObject.zoneRefCode = Integer.MIN_VALUE;

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	/*
	 * Апдейт лицевого счета departmentcode enestimateitemcode на счетчике
	 *
	 **/
	public void updateCountersreadOstable(int counterSCCode, String personalAccount, int departmentcode,
			int enestimateitemcode) throws PersistenceException {
		String sql = "update countersread.ostable set personalaccount = ? , departmentcode = ? , enestimateitemcode =  ? where num_un = ?";

		Connection connection = getConnection();
		PreparedStatement statement = null;
		// ResultSet set = null;
		try {
			statement = connection.prepareStatement(sql);

			statement.setString(1, "" + personalAccount);
			statement.setInt(2, departmentcode);
			statement.setInt(3, enestimateitemcode);

			statement.setInt(4, counterSCCode);

			statement.execute();

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + sql);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
		} finally {
			// try {if (set != null) set.close();} catch (SQLException e) {}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public void updateCountersreadOstableByInvNum(String invNum, String personalAccount, int departmentCode,
			int estimateItemCode) throws PersistenceException {
		String sql = "update countersread.ostable set personalaccount = ?, departmentcode = ?, enestimateitemcode = ? where kod_inv = ?";

		Connection connection = getConnection();
		PreparedStatement statement = null;
		// ResultSet set = null;

		try {
			statement = connection.prepareStatement(sql);

			statement.setString(1, personalAccount);

			if (departmentCode != Integer.MIN_VALUE) {
				statement.setInt(2, departmentCode);
			} else {
				statement.setNull(2, java.sql.Types.INTEGER);
			}

			if (estimateItemCode != Integer.MIN_VALUE) {
				statement.setInt(3, estimateItemCode);
			} else {
				statement.setNull(3, java.sql.Types.INTEGER);
			}

			statement.setString(4, invNum);

			statement.execute();
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + sql);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
		} finally {
			// try {if (set != null) set.close();} catch (SQLException e) {}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	/**
	 *
	 * Установка зоны для строки счетчика
	 *
	 * @param scCode
	 *            id из СканСчетчиков
	 * @param storageZoneRefCode
	 *            код зоны хранения
	 * @param storageZoneRefName
	 *            имя зоны хранения
	 * @throws PersistenceException
	 */
	public void setZoneForSCCounter(int scCode, int storageZoneRefCode, String storageZoneRefName)
			throws PersistenceException {

		String sql = "update countersread.ostable set storagezonecode = ? , storagezonename = ? where num_un = ?";

		Connection connection = getConnection();
		PreparedStatement statement = null;
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, storageZoneRefCode);
			statement.setString(2, storageZoneRefName);
			statement.setInt(3, scCode);

			statement.execute();

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + sql);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
		} finally {
			// try {if (set != null) set.close();} catch (SQLException e) {}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	/**
	 *
	 * Достать все инвентарные которые были в ордере
	 *
	 * @param fkOrder {@link RQFKOrder} ордер с счетчиками
	 * @return лист с инвентарными номерами счетчиков
	 */
	public List<String> getAllCountersInvNumbersInFKOrder(RQFKOrder fkOrder) {
		if(fkOrder.accountingTypeRef.code != TKAccountingType.COUNTERS) {
			throw new SystemException(String.format("Ордер № %s від %s повинен бути ордером для лічильників"
					, fkOrder.numberDoc, new SimpleDateFormat().format(fkOrder.dateGen)));
		}
		String sql =  "select distinct co.invnumber from rqfkorder as fo \n " +
				 "inner join rqfkorderitem as fi on fo.code = fi.fkorderrefcode \n " +
				 "inner join scinvoice as inv on fi.code = inv.fkorderitemrefcode \n " +
				 "inner join scorder as o on inv.code = o.invoicerefcode \n " +
				 "inner join scorder2counter as scoco on o.code = scoco.scorderrefcode \n " +
				 "inner join sccounter as co on scoco.counterrefcode = co.code \n " +
				 "where fo.code = ? \n "
				 + " and co.statusrefcode <> ? \n ";
		Vector<Integer> vec = new Vector<Integer>();
		vec.add(fkOrder.code);
		vec.add(SCCounterStatus.CANCELED);

		return BaseDAOUtils.executeStatementAndReadObjects(this.getConnection(), sql, vec
				, new BaseDAOUtils.StringFromResultSetTransformator(), false);
	}

	/**
	 * Возвращает стоимость счетчика без стоимости последней параматризации
	 *
	 * @param invNumber
	 *            - инвентарный номер счетчика
	 * @throws PersistenceException
	 */
	public BigDecimal getCostWithoutParametrization(String invNumber) throws PersistenceException {
		BigDecimal counterCost = new BigDecimal(0);

		/*SUPP-50435 По требованию Резник М.В. теперь от счетчика отнимается полная стоимость по параметризации
		 * (не только ЗП и отчисления, но и стоимость материалов ) */
		String sql = "select countersread.get_sum_without_parametrizac(?) from dual";

		/** Стоимость счетчика без з/п , отчислений по параметризации */
		//String sql = "select countersread.get_sum_without_zp(?) from dual";

		Connection connection = getConnection();

		PreparedStatement statement = null;
		ResultSet set = null;

		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, invNumber);

			set = statement.executeQuery();
			while(set.next()) {
				counterCost = set.getBigDecimal(1);
			}
			return counterCost;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + sql);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

		return counterCost;
	}




	public SCCounter getObjectNotRef(int uid) throws PersistenceException {
		SCCounter result = new SCCounter();
		result.code = uid;
		loadObjectNoRef(result);
		if (result.code == Integer.MIN_VALUE)
			return null;
		return result;
	}

	/**
	 *
	 * Получить код сущности {@link SCCounter} на плане {@link ENPlanWork}
	 *
	 * @param plan {@link ENPlanWork} план в котором нужно найти счетчик
	 * @param isMounted {@code true} - установлен, {@code false} - не установлен
	 * @return {@code Integer} код сущности или {@code Integer.MIN_VALUE}
	 */
	public int getCounterCodeInPlan(ENPlanWork plan, boolean isMounted)
	{
		if(plan == null || plan.code == Integer.MIN_VALUE) throw new java.lang.NullPointerException();
		 String sql = "select co.code from sccounter as co " +
				 "inner join enestimateitem as es on co.estimateitemrefcode = es.code " +
				 "where " +
				 "es.planrefcode = ? " +
				 "and es.kindrefcode = ? " +
				 "and es.countfact > ? ";

		 Vector<Object> binded = new Vector<Object>();
		 binded.add(plan.code);
		 if(isMounted) {
			 binded.add(ENEstimateItemKind.MATERIALS);
		 } else {
			 binded.add(ENEstimateItemKind.UNMOUNT);
		 }

		 binded.add(new BigDecimal(0));

		 Integer result = BaseDAOUtils.executeStatementAndReadObject(this.getConnection(), sql, binded
				 , new BaseDAOUtils.IntegerFromResultSetTransformator(), false);
		 if(result == null) result = Integer.MIN_VALUE;

		 return result;
	}

	public void loadObjectNoRef(SCCounter anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		selectStr = "SELECT  SCCOUNTER.CODE, SCCOUNTER.INVNUMBER, SCCOUNTER.NAME, SCCOUNTER.BUILDNUMBER, SCCOUNTER.ACCOUNT, SCCOUNTER.DEPARTMETFKCODE, SCCOUNTER.MOLCODE, SCCOUNTER.DATEIN, "
				+ " SCCOUNTER.DATEBUILD, SCCOUNTER.DATECHECK, SCCOUNTER.COST, SCCOUNTER.SCCODE, SCCOUNTER.COUNTERTYPE, SCCOUNTER.INSTALLORDERNUMBER, SCCOUNTER.READING, "
				+ " SCCOUNTER.INVNUMBERZKU, SCCOUNTER.NAMEZKU, SCCOUNTER.COSTZKU, SCCOUNTER.ACCOUNTZKU, SCCOUNTER.SCCODEZKU, SCCOUNTER.ELEMENTCODE, SCCOUNTER.COSTZKU_B, "
				+ " SCCOUNTER.PHASITY, SCCOUNTER.ISZKU, SCCOUNTER.ISMOVETOZKU, SCCOUNTER.LSCHET, SCCOUNTER.PLACEUST, SCCOUNTER.PRICONNDOC, SCCOUNTER.PRICONNDATE, SCCOUNTER.DATEEDIT, "
				+ " SCCOUNTER.MODIFY_TIME, SCCOUNTER.STATUSREFCODE, SCCOUNTER.ESTIMATEITEMREFCODE, SCCOUNTER.KINDREFCODE, SCCOUNTER.ZONEREFCODE,"
				+ " SCCOUNTER.ISLIQUID, SCCOUNTER.COSTOLD,SCCOUNTER.CHECKPERIOD , SCCOUNTER.PODRCODEZKU "
				+ " FROM SCCOUNTER WHERE SCCOUNTER.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1, anObject.code);
			set = statement.executeQuery();
			if (!set.next())
				anObject.code = Integer.MIN_VALUE;
			else {
				anObject.code = set.getInt(1);
				anObject.invNumber = set.getString(2);
				anObject.name = set.getString(3);
				anObject.buildNumber = set.getString(4);
				anObject.account = set.getString(5);
				anObject.departmetFKCode = set.getString(6);
				anObject.molCode = set.getString(7);
				anObject.dateIn = set.getDate(8);
				anObject.dateBuild = set.getDate(9);
				anObject.dateCheck = set.getDate(10);
				anObject.cost = set.getBigDecimal(11);
				if (anObject.cost != null)
					anObject.cost = anObject.cost.setScale(6,
							java.math.BigDecimal.ROUND_HALF_UP);
				anObject.scCode = set.getInt(12);
				if (set.wasNull())
					anObject.scCode = Integer.MIN_VALUE;
				anObject.counterType = set.getString(13);
				anObject.installOrderNumber = set.getString(14);
				anObject.reading = set.getString(15);
				anObject.invnumberzku = set.getString(16);
				anObject.namezku = set.getString(17);
				anObject.costzku = set.getBigDecimal(18);
				if (anObject.costzku != null)
					anObject.costzku = anObject.costzku.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);
				anObject.accountzku = set.getString(19);
				anObject.sccodezku = set.getInt(20);
				if (set.wasNull())
					anObject.sccodezku = Integer.MIN_VALUE;
				anObject.elementcode = set.getInt(21);
				if (set.wasNull())
					anObject.elementcode = Integer.MIN_VALUE;
				anObject.costzku_b = set.getBigDecimal(22);
				if (anObject.costzku_b != null)
					anObject.costzku_b = anObject.costzku_b.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);
				anObject.phasity = set.getBigDecimal(23);
				if (anObject.phasity != null)
					anObject.phasity = anObject.phasity.setScale(0,
							java.math.BigDecimal.ROUND_HALF_UP);
				anObject.iszku = set.getInt(24);
				if (set.wasNull())
					anObject.iszku = Integer.MIN_VALUE;
				anObject.isMoveToZKU = set.getInt(25);
				if (set.wasNull())
					anObject.isMoveToZKU = Integer.MIN_VALUE;
				anObject.lschet = set.getString(26);
				anObject.placeust = set.getString(27);
				anObject.priconndoc = set.getString(28);
				anObject.priconndate = set.getDate(29);
				anObject.dateEdit = set.getTimestamp(30);
				anObject.modify_time = set.getLong(31);
				if (set.wasNull())
					anObject.modify_time = Long.MIN_VALUE;
				anObject.statusRef.code = set.getInt(32);
				if (set.wasNull())
					anObject.statusRef.code = Integer.MIN_VALUE;
				anObject.estimateItemRef.code = set.getInt(33);
				if (set.wasNull())
					anObject.estimateItemRef.code = Integer.MIN_VALUE;
				anObject.kindRef.code = set.getInt(34);
				if (set.wasNull())
					anObject.kindRef.code = Integer.MIN_VALUE;
				anObject.zoneRef.code = set.getInt(35);
				if (set.wasNull())
					anObject.zoneRef.code = Integer.MIN_VALUE;

				anObject.isliquid = set.getInt(36);
				if (set.wasNull())
					anObject.isliquid = Integer.MIN_VALUE;

				anObject.costOld = set.getBigDecimal(37);
				if (anObject.costOld != null)
					anObject.costOld = anObject.costOld.setScale(6,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.checkperiod = set.getBigDecimal(38);
				if (anObject.checkperiod != null)
					anObject.checkperiod = anObject.checkperiod.setScale(0,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.podrCodeZKU = set.getString(39);

			}

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (set != null)
					set.close();
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}
	
	/**
	 * 
	 * Получить список счетчиков по акту
	 * 
	 * @param act {@link ENAct}
	 * @param estimateKind код вида материала на плане {@link ENEstimateItemKind}
	 * @return список счетчиков {@link SCCounterShortList}
	 * @throws PersistenceException
	 */
	public SCCounterShortList getListByAct(ENAct act, Integer estimateKind) throws PersistenceException {
		if(act == null || act.code == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException("Не заданий акт");
		}
		SCCounterFilter filter = new  SCCounterFilter();
		filter.conditionSQL = " EXISTS (SELECT FROM enestimateitem es1 "
				+ " INNER JOIN enact2enplanwork AS acpw1 ON es1.planrefcode = acpw1.plancode "
				+ " WHERE acpw1.actrefcode = ? AND es1.code = SCCOUNTER.ESTIMATEITEMREFCODE "
				+ ((estimateKind != null) ? " AND es1.kindrefcode = ? " : "")
				+ ")";
		
		Vector<Integer> binded = new Vector<Integer>(Arrays.asList(act.code));
		if(estimateKind != null) binded.add(estimateKind);
		
		return this.getScrollableFilteredList(filter, 0, -1, binded);
	}
	
	public SCCounterShortList getListByPlan(ENPlanWork plan, Integer estimateKind) throws PersistenceException {
		if(plan == null || plan.code == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException("Не заданий план");
		}
		SCCounterFilter filter = new  SCCounterFilter();
		filter.conditionSQL = " EXISTS (SELECT FROM enestimateitem es1 "
				+ " WHERE es1.planrefcode = ? AND es1.code = SCCOUNTER.ESTIMATEITEMREFCODE "
				+ ((estimateKind != null) ? " AND es1.kindrefcode = ? " : "")
				+ ")";
		
		Vector<Integer> binded = new Vector<Integer>(Arrays.asList(plan.code));
		if(estimateKind != null) binded.add(estimateKind);
		
		return this.getScrollableFilteredList(filter, 0, -1, binded);
	}


} // end of SCCounterDAO
