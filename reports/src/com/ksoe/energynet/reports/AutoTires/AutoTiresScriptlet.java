package com.ksoe.energynet.reports.AutoTires;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import net.sf.jasperreports.engine.JRDefaultScriptlet;
import net.sf.jasperreports.engine.JRScriptletException;
import net.sf.jasperreports.engine.fill.JRFillParameter;

import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.security.UserProfile;

public class AutoTiresScriptlet extends JRDefaultScriptlet {
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

	public String getGarageNumber(int tiresCode) {
		try {
			String sql = " select t.garagenumber from enautotires t " +
					" where t.code = " + tiresCode;
			Statement tempSt;
			tempSt = connection.createStatement();
			ResultSet rs = tempSt.executeQuery(sql);
			String garageNumber = new String();
			if (rs.next())
				garageNumber = rs.getString(1);
			rs.close();
			tempSt.close();
			return garageNumber;
		} catch (SQLException e) {
			throw new EnergyproSystemException(e);
		}
	}

	public String getSerialNumber(int tiresCode) {
		try {
			String sql = " select t.serialnumber from enautotires t " +
					" where t.code = " + tiresCode;
			Statement tempSt;
			tempSt = connection.createStatement();
			ResultSet rs = tempSt.executeQuery(sql);
			String serialNumber = new String();
			if (rs.next())
				serialNumber = rs.getString(1);
			rs.close();
			tempSt.close();
			return serialNumber;
		} catch (SQLException e) {
			throw new EnergyproSystemException(e);
		}
	}

	public String getTypeName(int tiresCode) {
		try {
			String sql = " select t.typename from enautotires t " +
					" where t.code = " + tiresCode;
			Statement tempSt;
			tempSt = connection.createStatement();
			ResultSet rs = tempSt.executeQuery(sql);
			String typeName = new String();
			if (rs.next())
				typeName = rs.getString(1);
			rs.close();
			tempSt.close();
			return typeName;
		} catch (SQLException e) {
			throw new EnergyproSystemException(e);
		}
	}

	public String getNominal(int tiresCode) {
		try {
			String sql = " select t.nominal from enautotires t " +
					" where t.code = " + tiresCode;
			Statement tempSt;
			tempSt = connection.createStatement();
			ResultSet rs = tempSt.executeQuery(sql);
			String nominal = new String();
			if (rs.next())
				nominal = rs.getString(1);
			rs.close();
			tempSt.close();
			return nominal;
		} catch (SQLException e) {
			throw new EnergyproSystemException(e);
		}
	}

	public String getFactory(int tiresCode) {
		try {
			String sql = " select t.factory from enautotires t " +
					" where t.code = " + tiresCode;
			Statement tempSt;
			tempSt = connection.createStatement();
			ResultSet rs = tempSt.executeQuery(sql);
			String factory = new String();
			if (rs.next())
				factory = rs.getString(1);
			rs.close();
			tempSt.close();
			return factory;
		} catch (SQLException e) {
			throw new EnergyproSystemException(e);
		}
	}

	public String getPotencial(int tiresCode) {
		try {
			String sql = " select t.potencial from enautotires t " +
					" where t.code = " + tiresCode;
			Statement tempSt;
			tempSt = connection.createStatement();
			ResultSet rs = tempSt.executeQuery(sql);
			String potencial = new String();
			if (rs.next())
				potencial = rs.getString(1);
			rs.close();
			tempSt.close();
			return potencial;
		} catch (SQLException e) {
			throw new EnergyproSystemException(e);
		}
	}

}