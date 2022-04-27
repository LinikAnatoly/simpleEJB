package com.ksoe.energynet.util;

import java.util.TimerTask;

public class GenerateReportForShevchenkoNN extends TimerTask {

	@Override
	public void run() {

		/* работаем только на указанном серваке */
		String ipAddres = Tools.getInetAddress();

		if (!ipAddres.equals(Tools.ENERGY_NET_SERVER_IP))
			return;

		ScheduledEventsManager scheduledEventsManager = new ScheduledEventsManager();
		System.out.println("#####################  Start generateReportForShevchenkoNN!!!");
		// Шевченко попросил пока не отправлять ему 3-й додаток
		//	scheduledEventsManager.generateReportForShevchenkoNN();
		System.out.println("#####################  generateReportForShevchenkoNN is Done!!!");

	}

}
