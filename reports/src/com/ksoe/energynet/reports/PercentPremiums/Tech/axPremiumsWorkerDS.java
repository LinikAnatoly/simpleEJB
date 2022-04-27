package com.ksoe.energynet.reports.PercentPremiums.Tech;

import java.math.BigDecimal;
import java.util.Date;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDataSourceProvider;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

import com.ksoe.report.scriptlets.DSField;

public class axPremiumsWorkerDS extends JRMapArrayDataSource implements
        JRDataSourceProvider {

	public static final String TABN = "tabn";
	public static final String PODR_NAZV = "podr_nazv";
	public static final String PODR_ID = "podr_id";
	public static final String FIO = "fio";
	public static final String POST_FIN = "post_fin";
	public static final String NORMA_VREM_DAYS= "norma_vrem_days";
	public static final String NORMA_VREM_HOURS= "norma_vrem_hours";
	public static final String NORMA_VREM_HOURS_WITHOUT_HOURS= "norma_vrem_hours_without_hours";
	public static final String SUMHOURSOTPUSK = "sumhoursotpusk";
	public static final String MAIN_PODR_ID = "main_podr_id";
	public static final String PODR_NAZV_MAIN= "podr_nazv_main";
	public static final String SHORTNAME= "shortname";
	public static final String FACT_WORKDAYS= "fact_workdays";
	public static final String RATE = "rate";
	public static final String FACT_WORKHOURS = "fact_workhours";
	public static final String FACT_WORKHOURS_OVERALL = "fact_workhours_overall";
	
	
	
	
	
	private static final JRField[] fields = new JRField[] {
		new DSField(TABN, String.class),
		new DSField(PODR_NAZV, String.class),
		new DSField(PODR_ID, String.class),
		new DSField(FIO, String.class),
		new DSField(POST_FIN,String.class),
		new DSField(NORMA_VREM_DAYS,int.class),
		new DSField(NORMA_VREM_HOURS,BigDecimal.class),
		new DSField(NORMA_VREM_HOURS_WITHOUT_HOURS,BigDecimal.class),
		new DSField(SUMHOURSOTPUSK,BigDecimal.class),
		new DSField(MAIN_PODR_ID,String.class),
		new DSField(PODR_NAZV_MAIN,String.class),
		new DSField(SHORTNAME,String.class),
		new DSField(FACT_WORKDAYS,BigDecimal.class),
		new DSField(RATE,String.class),
		new DSField(FACT_WORKHOURS,BigDecimal.class),
		new DSField(FACT_WORKHOURS_OVERALL,BigDecimal.class)
	}; 
			
	private axPremiumsWorkerDS() {
		super(null);
	}

	public axPremiumsWorkerDS(Object[] arg0) {
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
