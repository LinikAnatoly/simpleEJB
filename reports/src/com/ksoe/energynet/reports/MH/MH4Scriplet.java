package com.ksoe.energynet.reports.MH;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Vector;

import net.sf.jasperreports.engine.JRDefaultScriptlet;
import net.sf.jasperreports.engine.fill.JRFillParameter;

import com.ksoe.energynet.dataminer.ENEstimateItem2ENEstimateItemDAO;
import com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Type;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ENEstimateItemFilter;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

public class MH4Scriplet extends JRDefaultScriptlet {
	public String getENEstimateItem2ENEstimateItemCodesByEstimateOutCodeAndNeededQty(String estimateCodes, String codesExcluded, BigDecimal qty) throws Exception {

		String out = "null";
		JRFillParameter jrParameterMap = this.parametersMap.get("REPORT_PARAMETERS_MAP");
		Connection connection = (Connection) this.parametersMap.get("REPORT_CONNECTION").getValue();
		UserProfile userProfile = (UserProfile) ((HashMap) jrParameterMap.getValue()).get("userProfile");
		
		if(qty == null || qty.compareTo(new BigDecimal(0)) == 0) {
			throw new java.lang.IllegalArgumentException(String.format("Не задана кількість (%f)", qty));
		}
		
		ENEstimateItem2ENEstimateItemDAO objDao = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
		ENEstimateItem2ENEstimateItemFilter filter = new ENEstimateItem2ENEstimateItemFilter();
		filter.typeRef.code = ENEstimateItem2Type.MOVEDFORWRITING;
		filter.conditionSQL = ENEstimateItem2ENEstimateItem.estimateItemOutRef_QFielld + " IN (" + estimateCodes + ")" +
				" and " + ENEstimateItem2ENEstimateItem.code_QFielld + " NOT IN (" + codesExcluded + ")";
		
		int[] codes = objDao.getFilteredCodeArray(filter, 0, -1);
		Vector<ENEstimateItem2ENEstimateItem> vec = new Vector<ENEstimateItem2ENEstimateItem>();
		BigDecimal totalObjQty = new BigDecimal(0);
		boolean isOnlyOne = true; // true если все количества объектов равны единичкам
		
		if(codes.length == 0) {
			return out;
		}
		
		for(int code : codes) {
			ENEstimateItem2ENEstimateItem obj = objDao.getObject(code);
			if(obj.countGen.compareTo(new BigDecimal(1)) != 0) {
				isOnlyOne = false;
			}
			totalObjQty = totalObjQty.add(obj.countGen);
			vec.add(obj);
			
		}
		
		/*SUPP-56004 Условие убирается, т.к. при печати выдает ошибку*/
		///if(qty.compareTo(totalObjQty) == 1) {
		///	throw new java.lang.IllegalArgumentException(String.format("Кількість (%f) більша за сумарну по обєктах (%f)", qty, totalObjQty));
		///}
		
		out = "";
		if(isOnlyOne) {
			totalObjQty = new BigDecimal(0);
			for(int code : codes) {
				out += (out.length() == 0 ? "" : ", " ) + code;
				totalObjQty = totalObjQty.add(new BigDecimal(1));
				if(totalObjQty.compareTo(qty) == 0) break;
			}
		} else {
			// Если будет где-то связка с таким же количеством то берется она
			filter.countGen = qty;
			int[] codes1 = objDao.getFilteredCodeArray(filter, 0, -1);
			if(codes1.length > 0) {
				out = String.valueOf(codes1[0]);
			} else {
				totalObjQty = new BigDecimal(0);
				
				for(ENEstimateItem2ENEstimateItem obj : vec) {
					out += (out.length() == 0 ? "" : ", " ) + obj.code;
					totalObjQty = totalObjQty.add(obj.countGen);
					if(totalObjQty.compareTo(qty) == 0) {
						break;
					} else if(totalObjQty.compareTo(qty) > 0) {
						throw new Exception(String.format("Кількість рознеслась більше за необхідну (%f) ", qty));
					}
				}

			}
		}
		return out;
	}
}
