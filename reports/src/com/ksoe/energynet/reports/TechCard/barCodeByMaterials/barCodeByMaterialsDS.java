package com.ksoe.energynet.reports.TechCard.barCodeByMaterials;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDataSourceProvider;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

import com.ksoe.report.scriptlets.DSField;

public class barCodeByMaterialsDS extends JRMapArrayDataSource implements
		JRDataSourceProvider {

	public static final String FIELD1 = "materialCode";
	public static final String FIELD2 = "name";

	private static final JRField[] fields = new JRField[] {
		new DSField(FIELD1, Integer.class),
		new DSField(FIELD2, String.class)};

	private barCodeByMaterialsDS() {
		super(null);
	}

	public barCodeByMaterialsDS(Object[] arg0) {
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