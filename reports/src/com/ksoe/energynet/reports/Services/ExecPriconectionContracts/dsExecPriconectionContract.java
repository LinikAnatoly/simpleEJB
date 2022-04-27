package com.ksoe.energynet.reports.Services.ExecPriconectionContracts;

import java.math.BigDecimal;
import java.util.Date;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDataSourceProvider;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

import com.ksoe.report.scriptlets.DSField;

public class dsExecPriconectionContract extends JRMapArrayDataSource implements
        JRDataSourceProvider {

	public static final String CONTRACTNUMBERSERVICES = "contractnumberservices";
	public static final String CONTRACTDATESERVICES = "contractdateservices";
	public static final String ENSERVICESCONTRACTTYPENAME = "enservicescontracttypename";
	public static final String MAXDATESTARTMONTHPLAN = "maxdatestartmonthplan";
	public static final String DATEPAY = "datepay";
	public static final String SELSUMPAY = "selsumpay";
	public static final String DATELIMITEXECUTE = "datelimitexecute";
	public static final String COUNTDAYDELAY = "countdaydelay";
	public static final String CONTRAGENTNAME  = "contragentname";
	public static final String CONTRAGENTADDRESSWORK  = "contragentaddresswork";
	public static final String STATUSWORK  = "statuswork";
	public static final String BUHSTATUS  = "buhstatus";
	public static final String ACTSINFO  = "actsinfo";
	public static final String FINEXECUTOR  = "finexecutor";
	public static final String CNDEPARTMENT  = "cndepartment";
	
	
	
	
	
	private static final JRField[] fields = new JRField[] {
		new DSField(CONTRACTNUMBERSERVICES, String.class),
		new DSField(CONTRACTDATESERVICES, Date.class),
		new DSField(ENSERVICESCONTRACTTYPENAME, String.class),
		new DSField(MAXDATESTARTMONTHPLAN, Date.class),
		new DSField(DATEPAY, Date.class),
		new DSField(SELSUMPAY, BigDecimal.class),
		new DSField(DATELIMITEXECUTE, Date.class),
		new DSField(COUNTDAYDELAY, int.class),
		new DSField(CONTRAGENTNAME, String.class),
		new DSField(CONTRAGENTADDRESSWORK, String.class),
		new DSField(STATUSWORK, String.class),
		new DSField(BUHSTATUS, String.class),
		new DSField(ACTSINFO, String.class),
		new DSField(FINEXECUTOR, String.class),
		new DSField(CNDEPARTMENT, String.class)
		
	}; 
			
	private dsExecPriconectionContract() {
		super(null);
	}

	public dsExecPriconectionContract(Object[] arg0) {
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
