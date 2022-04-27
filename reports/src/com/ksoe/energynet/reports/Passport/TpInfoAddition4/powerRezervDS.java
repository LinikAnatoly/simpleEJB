package com.ksoe.energynet.reports.Passport.TpInfoAddition4;

import java.math.BigDecimal;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDataSourceProvider;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

import com.ksoe.report.scriptlets.DSField;

public class powerRezervDS extends JRMapArrayDataSource implements
        JRDataSourceProvider {

    public static final String pVTU = "pVTU";
    public static final String pREZERV = "pREZERV";
    public static final String packs_id = "packs_id";
    public static final String pREZERVcost = "pREZERVcost";
    public static final String kisp = "kisp";

    private static final JRField[] fields = new JRField[] {
            new DSField(pVTU, BigDecimal.class),
            new DSField(pREZERV, BigDecimal.class),
            new DSField(packs_id, String.class),
            new DSField(pREZERVcost, BigDecimal.class),
            new DSField(kisp, BigDecimal.class),
            };

    private powerRezervDS() {
        super(null);
    }

    public powerRezervDS(Object[] arg0) {
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
