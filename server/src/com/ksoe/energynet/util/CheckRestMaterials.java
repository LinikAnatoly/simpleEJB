package com.ksoe.energynet.util;

import java.util.TimerTask;

public class CheckRestMaterials extends TimerTask {

	@Override
	public void run() {

        /* �������� ������ �� ��������� ������� */
        String ipAddres = Tools.getInetAddress();

        if (!ipAddres.equals(Tools.ENERGY_NET_SERVER_IP)) return;

		ScheduledEventsManager scheduledEventsManager = new ScheduledEventsManager();
		System.out.println("Start checkRestMaterials!!!");
		scheduledEventsManager.checkRestMaterials();
		System.out.println("checkRestMaterials is Done!!!");

    }

}
