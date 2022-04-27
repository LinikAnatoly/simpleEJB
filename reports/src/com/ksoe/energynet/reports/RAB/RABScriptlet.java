package com.ksoe.energynet.reports.RAB;

import net.sf.jasperreports.engine.JRDefaultScriptlet;
import net.sf.jasperreports.engine.fill.JRFillParameter;
import net.sf.jasperreports.engine.JRScriptletException;

import java.net.InetAddress;
import java.net.UnknownHostException;
import javax.naming.Context;
import java.lang.Object;
import javax.rmi.PortableRemoteObject;
import javax.naming.InitialContext;
import java.util.Date;
import java.util.Properties;
import java.sql.Connection;
import java.util.List;
import java.rmi.RemoteException;
import javax.naming.NamingException;
import javax.ejb.CreateException;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.ejb.RegulatoryAssetBaseCalculationController;
import com.ksoe.energynet.ejb.RegulatoryAssetBaseCalculationControllerHome;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseCalculationShort;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseCalculationShortList;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseCalculationFilter;
import com.ksoe.energynet.dataminer.RegulatoryAssetBaseCalculationDAO;

public class RABScriptlet extends JRDefaultScriptlet {

	RegulatoryAssetBaseCalculationFilter filter = null;

	@Override
	public void beforeDetailEval() throws JRScriptletException {
		this.setVariableValue("period", filter.getPeriod());	
	}
	public RegulatoryAssetBaseCalculationShortList getData() throws JRScriptletException, RemoteException, NamingException, CreateException, UnknownHostException  {

		Connection connection = (Connection)this.getParameterValue("REPORT_CONNECTION");
		UserProfile userProfile = (UserProfile)this.getParameterValue("userProfile");		
		AuthLogic logic = new AuthLogic(connection, userProfile);
		logic.checkPermission("ksoe/energynet/RegulatoryAssetBaseCalculationController", "getListOnPeriod");
	
		Date periodTo = (Date)this.getParameterValue("periodTo");
		long filterKeyId = (long)this.getParameterValue("filterKeyId");
		String ipAddress = (String)this.getParameterValue("ipAddress");
		
		Properties props = new Properties();
		InetAddress address = InetAddress.getLocalHost();
		/*На случай если фильтр был послан на сервер отличный от того где формируется отчет*/
		if(!address.getHostAddress().equals(ipAddress)) {
			props.put(Context.PROVIDER_URL, String.format("jnp://%s:1099", ipAddress));
		}
		props.put(Context.INITIAL_CONTEXT_FACTORY, "org.jboss.security.jndi.JndiLoginInitialContextFactory");
		props.put(Context.URL_PKG_PREFIXES, "org.jboss.naming:org.jnp.interfaces");
		props.put(Context.SECURITY_PRINCIPAL, "energynet");
		props.put(Context.SECURITY_CREDENTIALS, "1");
		Context context = new InitialContext(props);
		Object objRef = context.lookup(RegulatoryAssetBaseCalculationController.JNDI_NAME);
		
		RegulatoryAssetBaseCalculationControllerHome home = (RegulatoryAssetBaseCalculationControllerHome) PortableRemoteObject.narrow(objRef
			, RegulatoryAssetBaseCalculationControllerHome.class);
		RegulatoryAssetBaseCalculationController controller = home.create();
		
		filter = controller.getFilter(filterKeyId);
		RegulatoryAssetBaseCalculationDAO dao = new RegulatoryAssetBaseCalculationDAO(connection, userProfile);
		RegulatoryAssetBaseCalculationShortList list = dao.getListOnPeriod(filter, periodTo, 0, -1);
		return list;
	}
}
