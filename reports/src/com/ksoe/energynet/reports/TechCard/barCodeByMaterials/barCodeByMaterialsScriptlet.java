package com.ksoe.energynet.reports.TechCard.barCodeByMaterials;

import java.awt.image.BufferedImage;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDefaultScriptlet;
import net.sf.jasperreports.engine.JRScriptletException;
import net.sf.jasperreports.engine.fill.JRFillParameter;
import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeException;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;
import net.sourceforge.barbecue.output.OutputException;

import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.report.exception.ReportSystemException;

public class barCodeByMaterialsScriptlet extends JRDefaultScriptlet {

	private Connection connection = null;
	public static UserProfile userProfile = null;

	public void beforeReportInit() throws JRScriptletException {
		JRFillParameter jrParameterMap = (JRFillParameter) this.parametersMap
				.get("REPORT_PARAMETERS_MAP");
		connection = (Connection) ((JRFillParameter) this.parametersMap
				.get("REPORT_CONNECTION")).getValue();
		userProfile = (UserProfile) ((HashMap) jrParameterMap.getValue())
				.get("userProfile");
	}


	public BufferedImage getBarcode(Integer materialCode) {
		try {
			Barcode bc;
			if (materialCode != Integer.MIN_VALUE) {
				String line = Integer.toString(
						Integer.parseInt(materialCode.toString(), 10), 36);

				bc = BarcodeFactory.create3of9(line.substring(0).toUpperCase(), false);
			} else {
				bc = BarcodeFactory.create3of9("0", false);
			}
			return BarcodeImageHandler.getImage(bc);
		} catch (BarcodeException e) {
			throw new ReportSystemException(e);
		} catch (OutputException e) {
			throw new ReportSystemException(e);
		}
	}


	public JRDataSource getBarcode(Integer materialCode, Integer counGen) {
		try {
			ArrayList rows = new ArrayList();
			String query = " select code, name from tkmaterials where code = "
					+ materialCode;

			Statement tempSt;
			tempSt = connection.createStatement();
			ResultSet rs = tempSt.executeQuery(query);

			while (rs.next()) {
				for (int j = 0; j < counGen; j++) {
					HashMap hashMap = new HashMap();
					hashMap.put(barCodeByMaterialsDS.FIELD1, rs.getInt(1));
					hashMap.put(barCodeByMaterialsDS.FIELD2, rs.getString(2));
					rows.add(hashMap);
				}
			}

			rs.close();
			tempSt.close();

			return new barCodeByMaterialsDS(rows.toArray());

		} catch (SQLException e) {
			throw new EnergyproSystemException(e);
		}
	}


}
