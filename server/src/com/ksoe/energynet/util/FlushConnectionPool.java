package com.ksoe.energynet.util;

import java.util.TimerTask;

public class FlushConnectionPool extends TimerTask {

	@Override
	public void run() {

		/* работаем только на указанном серваке */
		String ipAddres = Tools.getInetAddress();

		if (!ipAddres.equals(Tools.ENERGY_NET_SERVER_IP))
			return;


		ScheduledEventsManager scheduledEventsManager = new ScheduledEventsManager();
		System.out.println("#####################  start flush ConnectionPool!!!");
		scheduledEventsManager.flushConnectionPool();
		System.out.println("#####################  flush ConnectionPool is Done!!!");

	}

}
