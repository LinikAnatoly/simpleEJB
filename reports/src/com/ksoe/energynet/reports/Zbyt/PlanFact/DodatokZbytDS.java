package com.ksoe.energynet.reports.Zbyt.PlanFact;

import java.math.BigDecimal;
import java.util.Date;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDataSourceProvider;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

import com.ksoe.report.scriptlets.DSField;

public class DodatokZbytDS extends JRMapArrayDataSource implements
        JRDataSourceProvider {

	public static final String MONTHOBJ = "monthobj";
	public static final String PLANMONTHCODE= "planmonthcode";
	public static final String FINEXECUTORNAME= "finexecutorname";
	public static final String MONTHCOUNTGEN= "monthcountgen";
	public static final String FACTCOUNTGEN= "factcountgen";
	public static final String TECHCARDCODE= "techcardcode";
	public static final String TECHCARDNAME= "techcardname";
	public static final String NAMEDODATOK= "namedodatok";
	
	
	private static final JRField[] fields = new JRField[] {
		new DSField(MONTHOBJ, String.class),
		new DSField(PLANMONTHCODE, Integer.class),
		new DSField(FINEXECUTORNAME, String.class),
		new DSField(MONTHCOUNTGEN, BigDecimal.class),
		new	DSField(FACTCOUNTGEN, BigDecimal.class),
		new	DSField(TECHCARDCODE, Integer.class),
		new	DSField(TECHCARDNAME, String.class),
		new	DSField(NAMEDODATOK, String.class)
		
	}; 
			
	private DodatokZbytDS() {
		super(null);
	}

	public DodatokZbytDS(Object[] arg0) {
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