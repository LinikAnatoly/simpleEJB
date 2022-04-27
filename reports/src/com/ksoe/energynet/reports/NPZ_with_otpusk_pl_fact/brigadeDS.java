package com.ksoe.energynet.reports.NPZ_with_otpusk_pl_fact;

import java.math.BigDecimal;
import java.util.Date;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDataSourceProvider;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

import com.ksoe.report.scriptlets.DSField;

public class brigadeDS extends JRMapArrayDataSource implements
        JRDataSourceProvider {

	public static final String PODR_CODE = "podr_code";
	public static final String PODR_NAME = "podr_name";
	public static final String LOADPERCENT = "loadpercent";
	
	
	
	
	private static final JRField[] fields = new JRField[] {
		new DSField(PODR_CODE, Integer.class),
		new DSField(PODR_NAME, String.class),
		new DSField(LOADPERCENT, String.class)		
		
	}; 
			
	private brigadeDS() {
		super(null);
	}

	public brigadeDS(Object[] arg0) {
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