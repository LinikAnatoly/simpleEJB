package com.ksoe.energynet.reports.Services.servicesRegistryPrint2DS;

import java.math.BigDecimal;

import com.ksoe.report.scriptlets.DSField;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDataSourceProvider;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

public class ServicesDS extends JRMapArrayDataSource implements
        JRDataSourceProvider {

public static final String CONTRACTNUMBERSERVICES = "contractnumberservices";
public static final String CONTRACTDATESERVICES = "contractdateservices";
public static final String SERVICESNAME= "servicesname";
public static final String CONTRAGENTNAME= "contragentname";
public static final String CONTRAGENTADDRESS= "contragentaddress";
public static final String DEPNAME= "depname";
public static final String STATUSNAME= "statusname";
public static final String BUH_STATUS= "buh_status";
public static final String TYPENAME= "typename";
public static final String CONTRAGENTTYPE= "contragenttype";
public static final String ACT= "act";
public static final String EXECUTOR_FACT= "executor_fact";
public static final String IS_RED= "is_red";
public static final String IS_YELLOW= "is_yellow";
public static final String EXECUTEWORKDATE= "executeworkdate";
public static final String DATEINPAY= "dateinpay";
public static final String LIMIT_DATE= "limit_date";
public static final String NAMECLASSIF_IN_DOGOVOR= "nameclassif_in_dogovor";
public static final String SUMTOTAL= "sumtotal";
public static final String CALCTOTALCOST= "calctotalcost";
public static final String ENSERVICESCONTRACTSTTS_CODE= "enservicescontractstts_code";
public static final String CONTRACTCODE= "contractcode";
public static final String STR_MATERIALS_CODE_COUNTERS= "str_materials_code_counters";
public static final String STR_MATERIALS_CODE_COUNTERS_1F= "str_materials_code_counters_1f";
public static final String STR_MATERIALS_CODE_COUNTERS_3F= "str_materials_code_counters_3f";
public static final String COUNTER_FOR_SERVICE= "counter_for_service";
public static final String COUNTER_PHASITY_ON_SERVICE = "counter_phasity_on_service";
public static final String COUNTERS_CODES_FOR_CONTRACT = "counters_codes_for_contract";
public static final String PERSONALACCOUNTNUMBER = "personalaccountnumber";
public static final String NUMDATEORDERCOUNTER = "numdateordercounter";
public static final String TERMTXT = "termtxt";
public static final String CONTRAGENTADDRESSWORK= "contragentaddresswork";




	private static final JRField[] fields = new JRField[] {
		new DSField(CONTRACTNUMBERSERVICES, String.class),
		new DSField(CONTRACTDATESERVICES, String.class),
		new DSField(SERVICESNAME, String.class),
		new DSField(CONTRAGENTNAME,String.class),
		new DSField(CONTRAGENTADDRESS,String.class),
		new DSField(DEPNAME,String.class),
		new DSField(STATUSNAME,String.class),
		new DSField(BUH_STATUS,String.class),
		new DSField(TYPENAME,String.class),
		new DSField(CONTRAGENTTYPE,String.class),
		new DSField(ACT,String.class),
		new DSField(EXECUTOR_FACT,String.class),
		new DSField(IS_RED, int.class),
		new DSField(IS_YELLOW, int.class),
		new DSField(EXECUTEWORKDATE,String.class),
		new DSField(DATEINPAY,String.class),
		new DSField(LIMIT_DATE,String.class),
		new DSField(NAMECLASSIF_IN_DOGOVOR,String.class),
		new DSField(SUMTOTAL,BigDecimal.class),
		new DSField(CALCTOTALCOST,BigDecimal.class),
		new DSField(ENSERVICESCONTRACTSTTS_CODE, int.class),
		new DSField(CONTRACTCODE, int.class),
		new DSField(STR_MATERIALS_CODE_COUNTERS,String.class),
		new DSField(STR_MATERIALS_CODE_COUNTERS_1F,String.class),
		new DSField(STR_MATERIALS_CODE_COUNTERS_3F,String.class),
		new DSField(COUNTER_FOR_SERVICE,String.class),
		new DSField(COUNTER_PHASITY_ON_SERVICE,int.class),
		new DSField(COUNTERS_CODES_FOR_CONTRACT,String.class),
		new DSField(PERSONALACCOUNTNUMBER,String.class),
		new DSField(NUMDATEORDERCOUNTER,String.class),
		new DSField(TERMTXT,String.class),
		new DSField(CONTRAGENTADDRESSWORK,String.class)

	};

	private ServicesDS() {
		super(null);
	}

	public ServicesDS(Object[] arg0) {
		super(arg0);
	}

	@Override
	public JRDataSource create(JasperReport arg0) throws JRException {
		return this;
	}

	@Override
	public void dispose(JRDataSource arg0) throws JRException {

	}

	@Override
	public JRField[] getFields(JasperReport arg0) throws JRException,
			UnsupportedOperationException {
		return fields;
	}

	@Override
	public boolean supportsGetFieldsOperation() {
		return true;
	}
}