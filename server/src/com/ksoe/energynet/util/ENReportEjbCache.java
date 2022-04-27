package com.ksoe.energynet.util;

import java.util.Hashtable;
import java.util.Properties;

import javax.ejb.EJBHome;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.lla.persistence.exception.SystemException;


public class ENReportEjbCache {


	private static String serverIp = "10.77.11.7";
	private static String serverJnpPort = "1099";

	private static Hashtable homes = new Hashtable();
	Context ctx;

	public ENReportEjbCache() throws NamingException {
    }

	public static synchronized EJBHome getHome(String JNDI, String homeClass) throws NamingException {
		return getHome(JNDI, homeClass, false);
	}


	public static synchronized EJBHome getHome(String JNDI, String homeClass, boolean silent) throws NamingException {

		EJBHome home = (EJBHome) homes.get(homeClass);
		Context ctx = getInitialContext(serverIp, serverJnpPort, silent);
		try {
			home = (EJBHome) PortableRemoteObject.narrow(ctx.lookup(JNDI), Class.forName(homeClass));

		} catch (ClassCastException e) {
			throw new SystemException("\n \n" + "Нет связи с сервером отчетов...");
		} catch (ClassNotFoundException e) {
			throw new SystemException("\n \n" + "Нет связи с сервером отчетов...");
		}

		homes.put(homeClass, home);
		return home;
	}


	private static Context getInitialContext(String serverIp, String serverJnpPort, boolean silent)
			throws NamingException {
		Properties props = new Properties();

		// DEBUG !!!!!!!!!!!!
		// billingServerIp = "10.77.11.224";

		props.put(Context.PROVIDER_URL, "jnp://" + serverIp + ":" + serverJnpPort);

		props.put(Context.INITIAL_CONTEXT_FACTORY, "org.jboss.security.jndi.JndiLoginInitialContextFactory");
		props.put(Context.URL_PKG_PREFIXES, "org.jboss.naming:org.jnp.interfaces");

		if (silent) {
			/** статическая авторизация */
			props.put(Context.SECURITY_PRINCIPAL, "energynet");
			props.put(Context.SECURITY_CREDENTIALS, "1");
		} else {
			/** авторизация по пользователю */
			props.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
			props.put(Context.SECURITY_AUTHENTICATION, "simple");
		}

		return new InitialContext(props);
	}

}