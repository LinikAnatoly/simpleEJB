package com.ksoe.energynet.reports.Invest.StageBuyAndExecution;

import java.math.BigDecimal;
import java.util.Date;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDataSourceProvider;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

import com.ksoe.report.scriptlets.DSField;

public class dsFinansirOsvoenieBalans extends JRMapArrayDataSource implements
        JRDataSourceProvider {

	public static final String PROFINANS_PRICE = "profinans_price";
	public static final String PROFINANS_COUNT = "profinans_count";
	public static final String PROFINANS_SUM = "profinans_sum";
	public static final String OSVOENO_COUNT = "osvoeno_count";
	public static final String OSVOENO_SUM = "osvoeno_sum";
	public static final String OSVOENO_DOCS = "osvoeno_docs";
	public static final String NOT_FINANCED_COUNT = "not_financed_count";
	public static final String NOT_FINANCED_SUM = "not_financed_sum";
	public static final String PERCENT = "percent";
	public static final String CONTRAGENT = "contragent";
	public static final String INFOTENDERS = "infotenders";
	
	
	
	private static final JRField[] fields = new JRField[] {
		new DSField(PROFINANS_PRICE, BigDecimal.class),
		new DSField(PROFINANS_COUNT, BigDecimal.class),
		new DSField(PROFINANS_SUM, BigDecimal.class),
		new DSField(OSVOENO_COUNT, BigDecimal.class),
		new DSField(OSVOENO_SUM, BigDecimal.class),
		new DSField(OSVOENO_DOCS, String.class),
		new DSField(NOT_FINANCED_COUNT, BigDecimal.class),
		new DSField(NOT_FINANCED_SUM, BigDecimal.class),
		new DSField(PERCENT, BigDecimal.class),
		new DSField(CONTRAGENT, String.class),
		new DSField(INFOTENDERS, String.class),
		
		
	}; 
			
	private dsFinansirOsvoenieBalans() {
		super(null);
	}

	public dsFinansirOsvoenieBalans(Object[] arg0) {
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
