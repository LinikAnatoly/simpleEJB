package com.ksoe.energynet.reports.Passport;

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

public class PasspScriptlet extends JRDefaultScriptlet {
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
	
	public String getLineSupplies(int sbst_code) {
		try {
			String sql = 
				" select name from enline10 " +
				"   where enline10.elementcode in " +
				"     (select e.code from enelement e where e.elementinrefcode in " +
				"       (select ensubstation04.elementcode from ensubstation04 " +
				"         where ensubstation04.code = " + sbst_code + ")) " +
				" union all " +
				" select name from enlinecable " +
				"   where enlinecable.elementcode in " +
				"     (select e.code from enelement e where e.elementinrefcode in " +
				"       (select ensubstation04.elementcode from ensubstation04 " +
				"         where ensubstation04.code = " + sbst_code + "))";
			
			Statement tempSt;
			tempSt = connection.createStatement();
			ResultSet rs = tempSt.executeQuery(sql);
			String lineSupplies = new String();
		

			while(rs.next())
			{
				if (lineSupplies.length() > 0)
				{
					lineSupplies = lineSupplies + "; " + rs.getString(1);
				}
				else
				{
					lineSupplies = rs.getString(1);
				}
			}
			
			rs.close();
			tempSt.close();
			
			return lineSupplies;
			
		} catch (SQLException e) {
			throw new EnergyproSystemException(e);
		}
	}
	
	public String getPanel(int sbst_code) {
		try {
			String sql = 
				" select tkmaterials.name from enpanel " +
				" left join tkmaterials on tkmaterials.code = enpanel.materialrefcode " +
				" where enpanel.elementcode in " +
				"   (select epnl.code from enelement epnl where epnl.elementinrefcode in " +
				"     (select ensubstation04.elementcode from ensubstation04 " +
				"     where ensubstation04.code = " + sbst_code + ")) " +
				" order by enpanel.code ";
			
			Statement tempSt;
			tempSt = connection.createStatement();
			ResultSet rs = tempSt.executeQuery(sql);
			String panel = new String();
		

			while(rs.next())
			{
				if (panel.length() > 0)
				{
					panel = panel + "; " + rs.getString(1);
				}
				else
				{
					panel = rs.getString(1);
				}
			}
			
			rs.close();
			tempSt.close();
			
			return panel;
			
		} catch (SQLException e) {
			throw new EnergyproSystemException(e);
		}
	}
	
	public String getPanelCnt(int sbst_code) {
		try {
			String sql = 
				" select cast(count(enpanel.code) as varchar) from enpanel " +
				" where enpanel.elementcode in " +
				"   (select epnl.code from enelement epnl where epnl.elementinrefcode in " +
				"     (select ensubstation04.elementcode from ensubstation04 " +
				"       where ensubstation04.code = " + sbst_code + ")) ";
			
			Statement tempSt;
			tempSt = connection.createStatement();
			ResultSet rs = tempSt.executeQuery(sql);
			String panelCnt = new String();		
			if (rs.next())
			  panelCnt = rs.getString(1);			
			rs.close();
			tempSt.close();			
			return panelCnt;
			
		} catch (SQLException e) {
			throw new EnergyproSystemException(e);
		}
	}
	
	public String getBus(int sbst_code) {
		try {
			String sql = 
				" select tkmaterials.name " +
				" from enpanel " +
				" left join tkmaterials on tkmaterials.code = enpanel.matbusrefcode " +
				" where enpanel.elementcode in " +
				"   (select epnl.code from enelement epnl where epnl.elementinrefcode in " +
				"     (select ensubstation04.elementcode from ensubstation04 " +
				"     where ensubstation04.code = " + sbst_code + ")) " +
				" order by enpanel.code ";
			
			Statement tempSt;
			tempSt = connection.createStatement();
			ResultSet rs = tempSt.executeQuery(sql);
			String matBus = new String();
		

			while(rs.next())
			{
				if (matBus.length() > 0)
				{
					matBus = matBus + "; " + rs.getString(1);
				}
				else
				{
					matBus = rs.getString(1);
				}
			}
			
			rs.close();
			tempSt.close();
			
			return matBus;
			
		} catch (SQLException e) {
			throw new EnergyproSystemException(e);
		}
	}
	
	public String getArrester(int sbst_code) {
		try {
			String sql = 
				" select tkmaterials.name " +
				" from enpanel " +
				" left join tkmaterials on tkmaterials.code = enpanel.matarresterrefcode " +
				" where enpanel.elementcode in " +
				"   (select epnl.code from enelement epnl where epnl.elementinrefcode in " +
				"     (select ensubstation04.elementcode from ensubstation04 " +
				"     where ensubstation04.code = " + sbst_code + ")) " +
				" order by enpanel.code ";
			
			Statement tempSt;
			tempSt = connection.createStatement();
			ResultSet rs = tempSt.executeQuery(sql);
			String matArrester = new String();
		

			while(rs.next())
			{
				if (matArrester.length() > 0)
				{
					matArrester = matArrester + "; " + rs.getString(1);
				}
				else
				{
					matArrester = rs.getString(1);
				}
			}
			
			rs.close();
			tempSt.close();
			
			return matArrester;
			
		} catch (SQLException e) {
			throw new EnergyproSystemException(e);
		}
	}
}