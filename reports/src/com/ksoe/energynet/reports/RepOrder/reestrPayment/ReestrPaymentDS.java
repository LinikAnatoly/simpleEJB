package com.ksoe.energynet.reports.RepOrder.reestrPayment;

import java.math.BigDecimal;
import java.util.Date;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDataSourceProvider;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

import com.ksoe.report.scriptlets.DSField;

public class ReestrPaymentDS extends JRMapArrayDataSource implements
        JRDataSourceProvider {

	public static final String PRIHOD_COUNT = "prihod_count";
	public static final String PRIHOD_PRICE = "prihod_price";
	public static final String PRIHOD_SUMMA = "prihod_summa";
	public static final String PRIHOD_DATE = "prihod_data";
	public static final String PAY_PLAN_SUMMA = "pay_plan_summa";
	public static final String PAY_PLAN_DATE = "pay_plan_date";
	public static final String PAY_FACT_DATE = "pay_fact_date";
	public static final String PAY_FACT_PRICE = "pay_fact_price";
	public static final String PAY_FACT_SUMMA = "pay_fact_summa";	
	public static final String PAY_FACT_COUNT = "pay_fact_count";
	public static final String BILL_NUM = "bill_num";
	public static final String BUDGET_NAME = "budget_name";
	public static final String RESP_CENTER = "resp_center";
	public static final String PAY_TYPE_NAME = "pay_type_name";
	public static final String PAY_TYPE_VALUE = "pay_type_value";
	public static final String PAY_DATE = "pay_date";	
	public static final String PAY_SIGN = "pay_sign";
	public static final String PAY_TYPE_NAME_INITIAL = "pay_type_name_initial";
	public static final String PAY_TYPE_VALUE_INITIAL = "pay_type_value_initial";	
	
	private static final JRField[] fields = new JRField[] {
		new DSField(PRIHOD_COUNT, BigDecimal.class),
		new DSField(PRIHOD_PRICE, BigDecimal.class),
		new DSField(PRIHOD_SUMMA, BigDecimal.class),
		new DSField(PRIHOD_DATE, Date.class),
		new DSField(PAY_PLAN_SUMMA, BigDecimal.class),
		new DSField(PAY_PLAN_DATE, Date.class),
		new DSField(PAY_FACT_DATE, Date.class),
		new DSField(PAY_FACT_PRICE, BigDecimal.class),
		new DSField(PAY_FACT_SUMMA, BigDecimal.class),	
		new DSField(PAY_FACT_COUNT, BigDecimal.class),
		new DSField(BILL_NUM, String.class),
		new DSField(BUDGET_NAME, String.class),
		new DSField(RESP_CENTER, String.class),
		new DSField(PAY_TYPE_NAME, String.class),
		new DSField(PAY_TYPE_VALUE, Integer.class),
		new DSField(PAY_DATE, Date.class),	
		new DSField(PAY_SIGN, Integer.class),
		new DSField(PAY_TYPE_NAME_INITIAL, String.class),
		new DSField(PAY_TYPE_VALUE_INITIAL, Integer.class)			
	}; 
			
	private ReestrPaymentDS() {
		super(null);
	}

	public ReestrPaymentDS(Object[] arg0) {
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