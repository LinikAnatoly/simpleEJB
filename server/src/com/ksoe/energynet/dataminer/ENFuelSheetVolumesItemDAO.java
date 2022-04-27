
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENFuelSheetVolumesItemDAOGen;
import com.ksoe.energynet.valueobject.ENTravelSheetStatus;
import com.ksoe.energynet.valueobject.brief.ENFuelSheetVolumesItemShort;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolumesItemShortList;
import com.ksoe.energypro.util.Tools;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENFuelSheetVolumesItem;
 *
 */

public class ENFuelSheetVolumesItemDAO extends ENFuelSheetVolumesItemDAOGen {

    public ENFuelSheetVolumesItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENFuelSheetVolumesItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    /**
     *  данные для формирования строк ведомости
     *
     *  @param sheetCode - код ведомости
     *  @throws PersistenceException
     */
	public ENFuelSheetVolumesItemShortList getItemList(int sheetCode, int year, int month, int decadeNumber,
			Date startDate, Date endDate) throws PersistenceException {

		ENFuelSheetVolumesItemShortList result = new ENFuelSheetVolumesItemShortList();
		ENFuelSheetVolumesItemShort anObject;
		result.list = new Vector();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

		selectStr = "select case when depname is null then 'невизначено' else depname end as depname,\n" +
				"       round(pmm_count_on_start::numeric, 2) as pmm_count_on_start,\n" +
				"       round(pmm_count_on_start_all::numeric, 2) as pmm_count_on_start_all,\n" +
				"       round(services_plan::numeric, 2) as services_plan,\n" +
				"       round(current_repair_plan::numeric, 2) as current_repair_plan,\n" +
				"       round(capital_repair_plan::numeric, 2) as capital_repair_plan,\n" +
				"       round(maintenance_plan::numeric, 2) as maintenance_plan,\n" +
				"       round(sbyt_plan::numeric, 2) as sbyt_plan,\n" +
				"       round(other_plan::numeric, 2) as other_plan,\n" +
				"       round(cap_build_ip_plan::numeric, 2) as cap_build_ip_plan,\n" +
				"       round(cap_build_other_plan::numeric, 2) as cap_build_other_plan,\n" +
				"       round(vrtu_plan::numeric, 2) as vrtu_plan,\n" +
				"       round(avr_plan::numeric, 2) as avr_plan,\n" +
				"       round(odg_plan::numeric, 2) as odg_plan,\n" +
				"       coalesce(mol_codes,'0000') as mol_codes,\n" +
				"       to_date(" + Tools.convertDateToSQLString(startDate) + ",'dd.MM.yyyy') as datestart, \n" +
				"      to_date(" + Tools.convertDateToSQLString(endDate) +",'dd.MM.yyyy') as datefinal,\n" +
				"       ord,\n" +
				" round((services_plan + current_repair_plan + capital_repair_plan +\n" +
				"           maintenance_plan + sbyt_plan + other_plan + cap_build_ip_plan +\n" +
				"           cap_build_other_plan + vrtu_plan + avr_plan + odg_plan)::numeric, 2)\n" +
				"      as all_plan, \n" +
				"      eikindcode \n" +
				"from (\n" +
				"       select depname,\n" +
				"              ord,\n" +
				"              transport_department,\n" +
				"              mol_codes,\n" +
				"              sum(services_plan) as services_plan,\n" +
				"              sum(current_repair_plan) as current_repair_plan,\n" +
				"              sum(capital_repair_plan) as capital_repair_plan,\n" +
				"              sum(maintenance_plan) as maintenance_plan,\n" +
				"              sum(sbyt_plan) as sbyt_plan,\n" +
				"              sum(other_plan) as other_plan,\n" +
				"              sum(cap_build_ip_plan) as cap_build_ip_plan,\n" +
				"              sum(cap_build_other_plan) as cap_build_other_plan,\n" +
				"              sum(vrtu_plan) as vrtu_plan,\n" +
				"              sum(avr_plan) as avr_plan,\n" +
				"              sum(odg_plan) as odg_plan,\n" +
				"              case\n" +
				"                when ord in (-2, -1) and base_q.eikindcode = 2 then\n" +
				"                 round(coalesce(( select sum(tsfr.countgenfinal)\n" +
				"                                                           from (select max( ts.datestart ) as  datestart,ts.transportrealcode\n" +
				"                                                                  from entravelsheet  ts,  entravelsheetfuelremns fr\n" +
				"                                                                  where ts.code = fr.travelsheetrefcode\n" +
				"  and ts.datestart  < base_q.p_datestart\n" +
				"  and ts.statusrefcode = 4\n" +
				"  and ts.transportrealcode in ( select distinct t.transportrealcode\n" +
				"  from entransportitem  t\n" +
				"where   t.planrefcode   in\n" +
				" ( select  pw.code\n" +
				"from  enplanwork  pw  ,\n" +
				" enworkorder2enplanwork pw2wo\n" +
				"where\n" +
				" pw.datestart between base_q.p_datestart and base_q.p_datefinal\n" +
				"  and  pw.kindcode  = 3\n" +
				"  and pw2wo.plancode  = pw.code)\n" +
				"  and   t.transportrealcode  is  not  null\n" +
				"  and  t.transportrealcode   in  ( select  trr.code from  tktransportreal trr \n" +
				"                                                               where  trr.code  = t.transportrealcode\n" +
				"  and trr.transportstatuscode = 75000000 )\n" +
				"  and  t.transportrealcode   in  (   select   tr.code from  tktransportreal  tr\n" +
				"                                                               where  tr.transportdepartmntrfcd  = base_q.transport_department ) )\n" +
				"                                                                  group by ts.transportrealcode\n" +
				"                                                                ) as tr_max,\n" +
				"                                                                entravelsheet ts ,entravelsheetfuelremns tsfr,  tkfueltype ft\n" +
				"                                                           where ts.datestart =  tr_max.datestart\n" +
				"                                                            and  ts.transportrealcode = tr_max.transportrealcode\n" +
				"                                                            and  ts.code =  tsfr.travelsheetrefcode\n" +
				"                                                            and tsfr.fueltyperefcode = ft.code \n" +
				"                                                            and ft.materialrefcode  =  base_q.materialrefcode\n" +
				"  and  tsfr.countgenfinal  > 0 ), 0)::numeric, 2)\n" +
				"                else 0\n" +
				"              end as pmm_count_on_start,\n" +
				"              0 as pmm_count_on_start_all, \n" +
				"              base_q.eikindcode\n" +
				"       from (\n" +
				"              select \n" +
				"                     case q.eikindcode when 2 then \n" +
				"                     (\n" +
				"                       select name\n" +
				"                       from entransportdepartment d\n" +
				"                       where d.code = q.transport_department\n" +
				"                     ) else\n" +
				"                     (select name from endepartment dd\n" +
				"                     where dd.code = q.departmentrefcode) end\n" +
				"                     as \n" +
				"                     depname," +
				"                    \n" +
				"                  case\n" +
				"                       when transport_department = 10000 and q.eikindcode = 2 then -2\n" +
				"                       else case when q.eikindcode = 2 then -1  else 0 end   \n" +
				"                     end ord," +
				"                     \n" +
				"                     case\n" +
				"                       when q.kindcode = 3 and q.staterefcode = 7 and\n" +
				"                         q.typerefcode <> 2 and q.budgetrefcode not in (\n" +
				"                         75000009, 75000011, 500000040) then countfact\n" +
				"                       else 0\n" +
				"                     end as services_plan,\n" +
				"\n" +
				"                     case\n" +
				"                       when q.kindcode = 3 and q.staterefcode = 5 and\n" +
				"                         q.typerefcode <> 2 and q.budgetrefcode not in (\n" +
				"                         240000001, 75000009, 75000011, 500000040) then\n" +
				"                         countfact\n" +
				"                       else 0\n" +
				"                     end as current_repair_plan,\n" +
				"\n" +
				"                     case\n" +
				"                       when q.kindcode = 3 and q.staterefcode in (1, 2) and\n" +
				"                         q.budgetrefcode not in (240000001, 75000009, 75000011,\n" +
				"                         500000040) and q.typerefcode <> 2 then countfact\n" +
				"                       else 0\n" +
				"                     end as capital_repair_plan,\n" +
				"\n" +
				"                     case\n" +
				"                       when q.kindcode = 3 and q.staterefcode = 3 and\n" +
				"                         q.budgetrefcode not in (240000001, 75000009, 75000011,\n" +
				"                         500000040) and q.typerefcode <> 2 then countfact\n" +
				"                       else 0\n" +
				"                     end as maintenance_plan,\n" +
				"\n" +
				"                     case\n" +
				"                       when q.kindcode = 3 and q.staterefcode <> 7 and\n" +
				"                         q.typerefcode <> 2 and q.budgetrefcode = 240000001 then\n" +
				"                         countfact\n" +
				"                       else 0\n" +
				"                     end as sbyt_plan,\n" +
				"\n" +
				"                     case\n" +
				"                       when q.kindcode = 3 and q.staterefcode not in (1, 3, 5,\n" +
				"                         7, 2) and q.typerefcode <> 2 and q.budgetrefcode not in\n" +
				"                         (240000001, 75000009, 75000011, 500000040) then\n" +
				"                         countfact\n" +
				"                       else 0\n" +
				"                     end as other_plan,\n" +
				"\n" +
				"                     case\n" +
				"                       when q.kindcode = 3 and q.typerefcode = 5 and\n" +
				"                         q.budgetrefcode = 75000009 then countfact\n" +
				"                       else 0\n" +
				"                     end as cap_build_ip_plan,\n" +
				"\n" +
				"                     case\n" +
				"                       when q.kindcode = 3 and q.typerefcode not in (2, 5) and\n" +
				"                         q.budgetrefcode = 75000009 then countfact\n" +
				"                       else 0\n" +
				"                     end as cap_build_other_plan,\n" +
				"\n" +
				"                     case\n" +
				"                       when q.kindcode = 3 and q.typerefcode <> 2 and\n" +
				"                         q.budgetrefcode = 75000011 then countfact\n" +
				"                       else 0\n" +
				"                     end as vrtu_plan,\n" +
				"\n" +
				"                     case\n" +
				"                       when q.kindcode = 3 and q.typerefcode = 2 and\n" +
				"                         q.budgetrefcode <> 500000040 then countfact\n" +
				"                       else 0\n" +
				"                     end as avr_plan,\n" +
				"\n" +
				"                     case\n" +
				"                       when q.kindcode = 3 and q.budgetrefcode = 500000040 then\n" +
				"                         countfact\n" +
				"                       else 0\n" +
				"                     end as odg_plan,\n" +
				"\n" +
				"                     transport_department,\n" +
				"\n" +
				"                     p_year,\n" +
				"                     p_month,\n" +
				"                     decadenumber,\n" +
				"                     case materialrefcode\n" +
				"                       when 500002447 then 500000120\n" +
				"                       else materialrefcode\n" +
				"                     end as materialrefcode,\n" +
				"                     p_datestart,\n" +
				"                     p_datefinal,\n" +
				"                    case q.eikindcode when 1 then \n" +
				"                    (select wo.finmolcode from enworkorder wo, enworkorder2enplanwork wo2p\n" +
				"                    where wo.code = wo2p.workordercode and wo2p.plancode = q.plan_code)\n" +
				"                    else   (\n" +
				"                       select string_agg(s.molkod, ',')\n" +
				"                       from enspravmol s\n" +
				"                       where s.departmentcode in (\n" +
				"                                                   select d.departmentcode\n" +
				"                                                   from entransportdep2dep d\n" +
				"                                                   where\n" +
				"                                                     d.transportdepartmentcod =\n" +
				"                                                     q.transport_department\n" +
				"                             )\n" +
				"                     ) end as mol_codes, q.eikindcode\n" +
				"              from (\n" +
				"                   select " + year + " as p_year, " + month + " as p_month, " + decadeNumber + " as decadenumber, \n" +
				"                  to_date(" + Tools.convertDateToSQLString(startDate) + ",'dd.MM.yyyy') as p_datestart, \n" +
				"                   to_date(" + Tools.convertDateToSQLString(endDate) + ",'dd.MM.yyyy') as p_datefinal, \n" +
				"                    vs.* from enfuelsheetvolitemdata vs where vs.sheetvolumesrefcode = " + sheetCode  + "\n" +
				"                   ) as q    \n" +
				"            ) as base_q\n" +
				"       group by depname,\n" +
				"                ord,\n" +
				"                transport_department,\n" +
				"                p_datestart,\n" +
				"                p_datefinal,\n" +
				"                p_year,\n" +
				"                p_month,\n" +
				"                decadenumber,\n" +
				"                materialrefcode,\n" +
				"                mol_codes,\n" +
				"                eikindcode\n" +
				"       order by ord,\n" +
				"                depname \n" +
				"     ) as q_p";


		try {
			statement = connection.prepareStatement(selectStr);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENFuelSheetVolumesItemShort();

		        anObject.depname = set.getString(1);

				anObject.pmm_count_on_start = set.getBigDecimal(2);
				if (anObject.pmm_count_on_start != null)
					anObject.pmm_count_on_start = anObject.pmm_count_on_start
							.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);

				anObject.pmm_count_on_start_all = set.getBigDecimal(3);
				if (anObject.pmm_count_on_start_all != null)
					anObject.pmm_count_on_start_all = anObject.pmm_count_on_start_all
							.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);

				anObject.services_plan = set.getBigDecimal(4);
				if (anObject.services_plan != null)
					anObject.services_plan = anObject.services_plan.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.current_repair_plan = set.getBigDecimal(5);
				if (anObject.current_repair_plan != null)
					anObject.current_repair_plan = anObject.current_repair_plan
							.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);

				anObject.capital_repair_plan = set.getBigDecimal(6);
				if (anObject.capital_repair_plan != null)
					anObject.capital_repair_plan = anObject.capital_repair_plan
							.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);

				anObject.maintenance_plan = set.getBigDecimal(7);
				if (anObject.maintenance_plan != null)
					anObject.maintenance_plan = anObject.maintenance_plan
							.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);

				anObject.sbyt_plan = set.getBigDecimal(8);
				if (anObject.sbyt_plan != null)
					anObject.sbyt_plan = anObject.sbyt_plan.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.other_plan = set.getBigDecimal(9);
				if (anObject.other_plan != null)
					anObject.other_plan = anObject.other_plan.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.cap_build_ip_plan = set.getBigDecimal(10);
				if (anObject.cap_build_ip_plan != null)
					anObject.cap_build_ip_plan = anObject.cap_build_ip_plan
							.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);

				anObject.cap_build_other_plan = set.getBigDecimal(11);
				if (anObject.cap_build_other_plan != null)
					anObject.cap_build_other_plan = anObject.cap_build_other_plan
							.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);

				anObject.vrtu_plan = set.getBigDecimal(12);
				if (anObject.vrtu_plan != null)
					anObject.vrtu_plan = anObject.vrtu_plan.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.avr_plan = set.getBigDecimal(13);
				if (anObject.avr_plan != null)
					anObject.avr_plan = anObject.avr_plan.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.odg_plan = set.getBigDecimal(14);
				if (anObject.odg_plan != null)
					anObject.odg_plan = anObject.odg_plan.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.mol_codes = set.getString(15);
				anObject.datestart = set.getDate(16);
				anObject.datefinal = set.getDate(17);

		        anObject.ord = set.getInt(18);
		        if (set.wasNull())
		            anObject.ord = Integer.MIN_VALUE;
				
				anObject.all_plan = set.getBigDecimal(19);
				if (anObject.all_plan != null)
					anObject.all_plan = anObject.all_plan.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.eikindcode = set.getInt(20);
				if (set.wasNull())
					anObject.eikindcode = Integer.MIN_VALUE;

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

} // end of ENFuelSheetVolumesItemDAO
