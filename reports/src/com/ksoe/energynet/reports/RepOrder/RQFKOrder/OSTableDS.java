package com.ksoe.energynet.reports.RepOrder.RQFKOrder;

import java.math.BigDecimal;
import java.util.Date;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDataSourceProvider;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

import com.ksoe.report.scriptlets.DSField;

public class OSTableDS extends JRMapArrayDataSource implements
        JRDataSourceProvider {

	public static final String KOD_INV = "kod_inv";
	public static final String STR_NAME = "str_name";
	public static final String KOD_OBORUD = "kod_oborud";
	public static final String KOD_SUBSCH_B = "kod_subsch_b";
	public static final String SUM_ST_PERV = "sum_st_perv";
	public static final String DT_VYPUSK = "dt_vypusk";
	public static final String DT_VVOD_EKSP = "dt_vvod_eksp";
	public static final String DT_CURRENT = "dt_current";
	public static final String AGREE_IN_NUM = "agree_in_num";
	public static final String AGREE_IN_DATE = "agree_in_date";
	public static final String ST_CURRENT_B = "st_current_b";
	
	private static final JRField[] fields = new JRField[] {
			new DSField(KOD_INV, String.class),
			new DSField(STR_NAME, String.class), 
			new DSField(KOD_OBORUD, String.class),
			new DSField(KOD_SUBSCH_B, String.class), 
			new DSField(SUM_ST_PERV, BigDecimal.class),
			new DSField(DT_VYPUSK, Date.class),
			new DSField(DT_VVOD_EKSP, Date.class),
			new DSField(DT_CURRENT, Date.class),
			new DSField(AGREE_IN_NUM, String.class),
			new DSField(AGREE_IN_DATE, Date.class),
			new DSField(ST_CURRENT_B, BigDecimal.class) }; 
			
	private OSTableDS() {
		super(null);
	}

	public OSTableDS(Object[] arg0) {
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
