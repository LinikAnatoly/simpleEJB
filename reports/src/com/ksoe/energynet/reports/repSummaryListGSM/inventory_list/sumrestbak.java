package com.ksoe.energynet.reports.repSummaryListGSM.inventory_list;

import java.math.BigDecimal;
import java.util.Date;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDataSourceProvider;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

import com.ksoe.report.scriptlets.DSField;

public class sumrestbak extends JRMapArrayDataSource implements
        JRDataSourceProvider {

	public static final String FUEL_NAME = "fuel_name";
	public static final String COUNTGEN = "countgen";
	
	
	private static final JRField[] fields = new JRField[] {
		new DSField(FUEL_NAME, String.class),
		new DSField(COUNTGEN, BigDecimal.class)
	}; 
			
	private sumrestbak() {
		super(null);
	}

	public sumrestbak(Object[] arg0) {
		super(arg0);
	}

	public JRDataSource create(JasperReport arg0) throws JRException {
		return this;
	}

	public void dispose(JRDataSource arg0) throws JRException {

	}

	public JRField[] getFields(JasperReport arg0) throws JRException,
			UnsupportedOperationException {
		return fields;
	}

	public boolean supportsGetFieldsOperation() {
		return true;
	}
}