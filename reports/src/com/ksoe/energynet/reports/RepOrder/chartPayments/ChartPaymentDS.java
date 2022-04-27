package com.ksoe.energynet.reports.RepOrder.chartPayments;

import java.math.BigDecimal;
import java.util.Date;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDataSourceProvider;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

import com.ksoe.report.scriptlets.DSField;

public class ChartPaymentDS extends JRMapArrayDataSource implements
        JRDataSourceProvider {

	        public static final String DDSCODE = "ddscode";
	        public static final String PROJECT = "project"; 
		    public static final String NUMBERDOC = "numberdoc"; 
			public static final String ORDERDATE = "orderdate"; 
			public static final String STATUSSYMBOL = "statussymbol";
			public static final String OKPO = "okpo";
			public static final String ORGNAME = "orgname";
			public static final String CONTRACT = "contract";
			public static final String MNAME = "mname"; 
	    	public static final String MEAS = "meas";
			public static final String COUNTFACT = "countfact";
			public static final String PRICEWITHNDS = "pricewithnds";
			public static final String SUMMA = "summa";
			public static final String POSTAVKA_DATE = "postavka_date";
			public static final String DELIVERYTIME = "deliverytime";
			public static final String SD1= "sd1";
			public static final String SD2= "sd2";
			public static final String SD3= "sd3";
			public static final String SD4= "sd4";
			public static final String SD5= "sd5";
			public static final String SD6= "sd6";
			public static final String SD7= "sd7";
			public static final String SD8= "sd8";
			public static final String SD9= "sd9";
			public static final String SD10= "sd10";
			public static final String SD11= "sd11";
			public static final String SD12= "sd12";
			public static final String SD13= "sd13";
			public static final String SD14= "sd14";
			public static final String SD15= "sd15";
			public static final String SD16= "sd16";
			public static final String SD17= "sd17";
			public static final String SD18= "sd18";
			public static final String SD19= "sd19";
			public static final String SD20= "sd20";
			public static final String SD21= "sd21";
			public static final String SD22= "sd22";
			public static final String SD23= "sd23";
			public static final String SD24= "sd24";
			public static final String SD25= "sd25";
			public static final String SD26= "sd26";
			public static final String SD27= "sd27";
			public static final String SD28= "sd28";
			public static final String SD29= "sd29";
			public static final String SD30= "sd30";
			public static final String SD31= "sd31";
			public static final String BUDGETREFNAME = "budgetrefname";
			public static final String PAYMENTTYPENAME = "paymenttypename";
			public static final String PAYMENTVALUE = "paymentvalue";
			public static final String OICODE = "oicode";
	
	
	
	private static final JRField[] fields = new JRField[] {
		
		    new DSField(DDSCODE, String.class),
		    new DSField(PROJECT, String.class),
		    new DSField(NUMBERDOC, String.class), 
			new DSField(ORDERDATE, String.class),
			new DSField(STATUSSYMBOL, String.class),
			new DSField(OKPO, String.class),
			new DSField(ORGNAME, String.class),
			new DSField(CONTRACT, String.class),
			new DSField(MNAME, String.class),
	    	new DSField(MEAS, String.class),
			new DSField(COUNTFACT, BigDecimal.class),
			new DSField(PRICEWITHNDS, BigDecimal.class),
			new DSField(SUMMA, BigDecimal.class),
			new DSField(POSTAVKA_DATE, String.class),
			new DSField(DELIVERYTIME, int.class),
			new DSField(SD1, BigDecimal.class),
			new DSField(SD2, BigDecimal.class),
			new DSField(SD3, BigDecimal.class),
			new DSField(SD4, BigDecimal.class),
			new DSField(SD5, BigDecimal.class),
			new DSField(SD6, BigDecimal.class),
			new DSField(SD7, BigDecimal.class),
			new DSField(SD8, BigDecimal.class),
			new DSField(SD9, BigDecimal.class),
			new DSField(SD10, BigDecimal.class),
			new DSField(SD11, BigDecimal.class),
			new DSField(SD12, BigDecimal.class),
			new DSField(SD13, BigDecimal.class),
			new DSField(SD14, BigDecimal.class),
			new DSField(SD15, BigDecimal.class),
			new DSField(SD16, BigDecimal.class),
			new DSField(SD17, BigDecimal.class),
			new DSField(SD18, BigDecimal.class),
			new DSField(SD19, BigDecimal.class),
			new DSField(SD20, BigDecimal.class),
			new DSField(SD21, BigDecimal.class),
			new DSField(SD22, BigDecimal.class),
			new DSField(SD23, BigDecimal.class),
			new DSField(SD24, BigDecimal.class),
			new DSField(SD25, BigDecimal.class),
			new DSField(SD26, BigDecimal.class),
			new DSField(SD27, BigDecimal.class),
			new DSField(SD28, BigDecimal.class),
			new DSField(SD29, BigDecimal.class),
			new DSField(SD30, BigDecimal.class),
			new DSField(SD31, BigDecimal.class),
			new DSField(BUDGETREFNAME, String.class),
			new DSField(PAYMENTTYPENAME, String.class),
			new DSField(PAYMENTVALUE , int.class),
			new DSField(OICODE, int.class)
			
		
		
	}; 
			
	private ChartPaymentDS() {
		super(null);
	}

	public ChartPaymentDS(Object[] arg0) {
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