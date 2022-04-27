package com.ksoe.energynet.reports.AverageAccountingPersonalNPZ;

import java.math.BigDecimal;
import java.util.Date;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDataSourceProvider;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

import com.ksoe.report.scriptlets.DSField;

public class dsAccounting extends JRMapArrayDataSource implements
        JRDataSourceProvider {

	public static final String CATEGORYID = "categoryid";
	public static final String CATEGORYNAME = "categoryname";
	public static final String AVERAGECOUNTPERSONAL = "averagecountpersonal";
	
	
	
	
	private static final JRField[] fields = new JRField[] {
		new DSField(CATEGORYID, Integer.class),
		new DSField(CATEGORYNAME, String.class),
		new DSField(AVERAGECOUNTPERSONAL, BigDecimal.class),
	

		
	}; 
			
	private dsAccounting() {
		super(null);
	}

	public dsAccounting(Object[] arg0) {
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
