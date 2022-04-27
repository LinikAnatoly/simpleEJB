package com.ksoe.energynet.reports.TechnicalStatus;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ksoe.energynet.ejb.ENInspectionSheetControllerEJB.InspectionKind;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.valueobject.ENInspectionSheetStatus;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

import net.sf.jasperreports.engine.JRDefaultScriptlet;
import net.sf.jasperreports.engine.JRScriptletException;
import net.sf.jasperreports.engine.fill.JRFillParameter;

public class TechnicalStatusScriptlet extends JRDefaultScriptlet {


	private final Log log = LogFactory.getLog(getClass());


	private Double total;

	@Override
	public void beforeReportInit() throws JRScriptletException {

		log.debug("beforeReportInit");

		total = 0.0D;

		System.out.println("############################### beforeReportInit... total = " + total);
	}


	public Double getTotal() {

		System.out.println("############################### getTotal = " + total);

		return total;
	}


	public Double add(Double cantidad) {

		log.debug("AGREGANDO LA CANTIDAD : " + cantidad);

		this.total += cantidad;

		System.out.println("############################### add... " + cantidad);
		System.out.println("############################### this.total = " + this.total);

		return cantidad;
	}



	public static final String celldataSql = " , ( " +
			" select tb.name as elementname, tb.elementcode, el.typerefcode as elementTypeCode, tb.cellrefcode as cellcode, ht.isobsolete " +
			" , (select et.name from enelementtype et where et.code = el.typerefcode) as elementTypeName  " +
			" from ensubst150controlcable tb, enelement el, enhighvolthardwaretype ht " +
			" where el.code = tb.elementcode  " +
			" and ht.code = tb.typerefcode " +

			" union all " +
			" select tb.name as elementname, tb.elementcode, el.typerefcode, tb.cellrefcode as cellcode, ht.isobsolete " +
			" , (select et.name from enelementtype et where et.code = el.typerefcode) as elementTypeName " +
			" from ensubst150currenttrans tb, enelement el, enhighvolthardwaretype ht " +
			" where el.code = tb.elementcode " +
			" and ht.code = tb.typerefcode " +

			" union all " +
			" select tb.name as elementname, tb.elementcode, el.typerefcode, tb.cellrefcode as cellcode, ht.isobsolete " +
			" , (select et.name from enelementtype et where et.code = el.typerefcode) as elementTypeName " +
			" from ensubst150dgk tb, enelement el, enhighvolthardwaretype ht " +
			" where el.code = tb.elementcode " +
			" and ht.code = tb.typerefcode " +

			" union all " +
			" select tb.name as elementname, tb.elementcode, el.typerefcode, tb.cellrefcode as cellcode, ht.isobsolete " +
			" , (select et.name from enelementtype et where et.code = el.typerefcode) as elementTypeName " +
			" from ensubst150discharger tb, enelement el, enhighvolthardwaretype ht " +
			" where el.code = tb.elementcode " +
			" and ht.code = tb.typerefcode " +

			" union all " +
			" select tb.name as elementname, tb.elementcode, el.typerefcode, tb.cellrefcode as cellcode, ht.isobsolete " +
			" , (select et.name from enelementtype et where et.code = el.typerefcode) as elementTypeName " +
			" from ensubst150disconnector tb, enelement el, enhighvolthardwaretype ht " +
			" where el.code = tb.elementcode " +
			" and ht.code = tb.typerefcode " +

			" union all " +
			" select tb.name as elementname, tb.elementcode, el.typerefcode, tb.cellrefcode as cellcode, ht.isobsolete " +
			" , (select et.name from enelementtype et where et.code = el.typerefcode) as elementTypeName " +
			" from ensubst150pulloutelmnt tb, enelement el, enhighvolthardwaretype ht " +
			" where el.code = tb.elementcode " +
			" and ht.code = tb.typerefcode " +

			" union all " +
			" select tb.name as elementname, tb.elementcode, el.typerefcode, tb.cellrefcode as cellcode, ht.isobsolete " +
			" , (select et.name from enelementtype et where et.code = el.typerefcode) as elementTypeName " +
			" from ensubst150rza tb, enelement el, enhighvolthardwaretype ht " +
			" where el.code = tb.elementcode " +
			" and ht.code = tb.typerefcode " +

			" union all " +
			" select tb.name as elementname, tb.elementcode, el.typerefcode, tb.cellrefcode as cellcode, ht.isobsolete " +
			" , (select et.name from enelementtype et where et.code = el.typerefcode) as elementTypeName " +
			" from ensubst150separator tb, enelement el, enhighvolthardwaretype ht " +
			" where el.code = tb.elementcode " +
			" and ht.code = tb.typerefcode " +

			" union all " +
			" select tb.name as elementname, tb.elementcode, el.typerefcode, tb.cellrefcode as cellcode, ht.isobsolete " +
			" , (select et.name from enelementtype et where et.code = el.typerefcode) as elementTypeName " +
			" from ensubst150shortcircutr tb, enelement el, enhighvolthardwaretype ht " +
			" where el.code = tb.elementcode " +
			" and ht.code = tb.typerefcode " +

			" union all " +
			" select tb.name as elementname, tb.elementcode, el.typerefcode, tb.cellrefcode as cellcode, ht.isobsolete " +
			" , (select et.name from enelementtype et where et.code = el.typerefcode) as elementTypeName " +
			" from ensubst150switch tb, enelement el, enhighvolthardwaretype ht " +
			" where el.code = tb.elementcode  " +
			" and ht.code = tb.typerefcode " +

			" union all " +
			" select tb.name as elementname, tb.elementcode, el.typerefcode, tb.cellrefcode as cellcode, 0 as isobsolete " +
			" , (select et.name from enelementtype et where et.code = el.typerefcode) as elementTypeName " +
			" from ensubst150tiresection tb, enelement el " +
			" where el.code = tb.elementcode " +

			" union all " +
			" select tb.name as elementname, tb.elementcode, el.typerefcode, tb.cellrefcode as cellcode, ht.isobsolete " +
			" , (select et.name from enelementtype et where et.code = el.typerefcode) as elementTypeName " +
			" from ensubst150tn tb, enelement el, enhighvolthardwaretype ht " +
			" where el.code = tb.elementcode " +
			" and ht.code = tb.typerefcode " +

			" union all " +
			" select tb.name as elementname, tb.elementcode, el.typerefcode, tb.cellrefcode as cellcode, ht.isobsolete " +
			" , (select et.name from enelementtype et where et.code = el.typerefcode) as elementTypeName " +
			" from ensubst150tvp tb, enelement el, enhighvolthardwaretype ht " +
			" where el.code = tb.elementcode " +
			" and ht.code = tb.typerefcode " +

			" ) celldata ";



	/***
	 * возвращает кол-во оборудования на подстанции
	 *
	 * @param subCode - код подстанции
	 * @param voltageClassCode - класс напряжения
	 * @param elementTypeCode - тип оборудования
	 *
	 * @return countNob
	 */
	public int getCountNob(int subCode, int voltageClassCode, int elementTypeCode) {

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String selectStr = "";
		int countNob = new Integer(0);

		JRFillParameter jrParameterMap = this.parametersMap.get("REPORT_PARAMETERS_MAP");
		Connection connection = (Connection) this.parametersMap.get("REPORT_CONNECTION").getValue();
		UserProfile userProfile = (UserProfile) ((HashMap) jrParameterMap.getValue()).get("userProfile");

		try {

			selectStr = " select count(elementTypeCode) " +
					" from ( " +
					" select sb.code as subcode, sb.name as subname, cl.code as cell150code, cl.name as cellname, cl.voltageclassrefcode, sb.coeffcategory, coalesce(sb.imax, 0) as imax " +
					" from ensubstation150 sb, ensubst150cell cl " +
					" where sb.code = cl.substationrefcode " +
					" order by 1 ) sb150data " +

					celldataSql +

					" where celldata.cellcode = sb150data.cell150code " +

					" and subcode = " + subCode +
					" and voltageclassrefcode = " + voltageClassCode +
					" and elementTypeCode = " + elementTypeCode +

					" group by subcode, voltageclassrefcode, elementTypeCode";


			statement = connection.prepareStatement(selectStr);
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				countNob = resultSet.getInt(1);
 			}


			return countNob;

		} catch (Exception e) {
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




	/***
	 * возвращает кол-во устаревшего оборудования на подстанции
	 *
	 * @param subCode - код подстанции
	 * @param voltageClassCode - класс напряжения
	 * @param elementTypeCode - тип оборудования
	 *
	 * @return countNdf
	 */
	public int getCountNdf(int subCode, int voltageClassCode, int elementTypeCode) {

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String selectStr = "";
		int countNdf = new Integer(0);

		JRFillParameter jrParameterMap = this.parametersMap.get("REPORT_PARAMETERS_MAP");
		Connection connection = (Connection) this.parametersMap.get("REPORT_CONNECTION").getValue();
		UserProfile userProfile = (UserProfile) ((HashMap) jrParameterMap.getValue()).get("userProfile");

		try {

			selectStr = " select count(elementTypeCode) " +
					" from ( " +
					" select sb.code as subcode, sb.name as subname, cl.code as cell150code, cl.name as cellname, cl.voltageclassrefcode, sb.coeffcategory, coalesce(sb.imax, 0) as imax " +
					" from ensubstation150 sb, ensubst150cell cl " +
					" where sb.code = cl.substationrefcode " +
					" order by 1 ) sb150data " +

					celldataSql +

					" where celldata.cellcode = sb150data.cell150code " +

					" and subcode = " + subCode +
					" and voltageclassrefcode = " + voltageClassCode +
					" and elementTypeCode = " + elementTypeCode +
					" and isobsolete = " + ENConsts.YES +

					" group by subcode, voltageclassrefcode, elementTypeCode";


			statement = connection.prepareStatement(selectStr);
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				countNdf = resultSet.getInt(1);
 			}


			return countNdf;

		} catch (Exception e) {
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



	/***
	 * возвращает Tx оборудования ( Tx = sum ( Pi * Xi ) )
	 *
	 * @param subCode - код подстанции
	 * @param elementCode - код оборудования
	 *
	 * @return sumTx
	 */
	public BigDecimal getSumTx(int subCode, int elementCode) {

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String selectStr = "";
		BigDecimal sumTx = new BigDecimal(0);

		JRFillParameter jrParameterMap = this.parametersMap.get("REPORT_PARAMETERS_MAP");
		Connection connection = (Connection) this.parametersMap.get("REPORT_CONNECTION").getValue();
		UserProfile userProfile = (UserProfile) ((HashMap) jrParameterMap.getValue()).get("userProfile");

		try {

			selectStr = " select sum(weightxi*pointspi) from ( " +

					" select * from ( " +

			        " select sb.code as subcode, sb.name as subname, cl.code as cell150code, cl.name as cellname, cl.voltageclassrefcode, sb.coeffcategory, coalesce(sb.imax, 0) as imax " +
					" from ensubstation150 sb, ensubst150cell cl " +
					" where sb.code = cl.substationrefcode " +
					" order by 1 ) sb150data " +

					celldataSql +

					" left join ( select shi.elementrefcode, coalesce(shi.weightxi,0) as weightxi, coalesce(shi.pointspi,0) as pointspi " +
					" from eninspectionsheetitem shi  " +
					" where shi.isdetecting = " + ENConsts.YES +
					"  and shi.sheetrefcode in ( " +
					"  select s.code " +
					"   from eninspectionsheet s " +
					"   where s.statusrefcode = " + ENInspectionSheetStatus.SIGNED +
					"     and s.inspectionkind = " + InspectionKind.PLANED +
					"      and s.takeintocalculation = 1" + 
					"     and to_char(s.dategen, 'yyyy')::numeric = date_part('year', now()) - 1 ) " +

					" ) inshdata on inshdata.elementrefcode = celldata.elementcode " +

					" where celldata.cellcode = sb150data.cell150code ) w " +

					" where subcode = " + subCode +
					" and elementrefcode = " + elementCode;


			statement = connection.prepareStatement(selectStr);
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				sumTx = resultSet.getBigDecimal(1);
 			}


			return sumTx;

		} catch (Exception e) {
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






	/***
	 * возвращает Tx оборудования ( Tx = sum ( Pi * Xi ) )
	 *
	 * @param subCode - код подстанции
	 * @param voltageClassCode - класс напряжения
	 * @param elementTypeCode - тип оборудования
	 *
	 * @return sumTx
	 */
	public BigDecimal getSumTx(int subCode, int voltageClassCode, int elementTypeCode) {

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String selectStr = "";
		BigDecimal sumTx = new BigDecimal(0);

		JRFillParameter jrParameterMap = this.parametersMap.get("REPORT_PARAMETERS_MAP");
		Connection connection = (Connection) this.parametersMap.get("REPORT_CONNECTION").getValue();
		UserProfile userProfile = (UserProfile) ((HashMap) jrParameterMap.getValue()).get("userProfile");

		try {

			selectStr = " select sum(weightxi*pointspi) from ( " +

					" select * from ( " +

			        " select sb.code as subcode, sb.name as subname, cl.code as cell150code, cl.name as cellname, cl.voltageclassrefcode, sb.coeffcategory, coalesce(sb.imax, 0) as imax " +
					" from ensubstation150 sb, ensubst150cell cl " +
					" where sb.code = cl.substationrefcode " +
					" order by 1 ) sb150data " +

					celldataSql +

					" left join ( select shi.elementrefcode, coalesce(shi.weightxi,0) as weightxi, coalesce(shi.pointspi,0) as pointspi " +
					" from eninspectionsheetitem shi " +
					" where shi.isdetecting = " + ENConsts.YES +
					"  and shi.sheetrefcode in ( " +
					"  select s.code " +
					"   from eninspectionsheet s " +
					"   where s.statusrefcode = " + ENInspectionSheetStatus.SIGNED +
					"     and s.inspectionkind = " + InspectionKind.PLANED +
					"      and s.takeintocalculation = 1" + 
					"     and to_char(s.dategen, 'yyyy')::numeric = date_part('year', now()) - 1 ) " +

					" ) inshdata on inshdata.elementrefcode = celldata.elementcode " +

					" where celldata.cellcode = sb150data.cell150code ) w " +

					" where subcode = " + subCode +
					" and voltageclassrefcode = " + voltageClassCode +
					" and elementtypecode = " + elementTypeCode;


			statement = connection.prepareStatement(selectStr);
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				sumTx = resultSet.getBigDecimal(1);
 			}


			return sumTx;

		} catch (Exception e) {
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



}
