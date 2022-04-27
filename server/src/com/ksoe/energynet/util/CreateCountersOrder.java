package com.ksoe.energynet.util;

import java.util.Calendar;
import java.util.Date;
import java.util.TimerTask;

public class CreateCountersOrder extends TimerTask {

	@Override
	public void run() {

        /* работаем только на указанном серваке */
        String ipAddres = Tools.getInetAddress();

        if (!ipAddres.equals(Tools.ENERGY_NET_SERVER_IP)) return;

        Calendar calendar = Calendar.getInstance();

        Date currentDate = Tools.encodeDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DATE));
        Date decade1End = Tools.getDecadeEnd(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) + 1, 1);
        Date decade2End = Tools.getDecadeEnd(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) + 1, 2);
        Date decade3End = Tools.getDecadeEnd(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) + 1, 3);

        // В конце каждой декады формируем заявку на закупку многотарифных счетчиков
        if (currentDate.equals(decade1End) || currentDate.equals(decade2End) ||
        		(currentDate.equals(decade3End) && !currentDate.equals(com.ksoe.energynet.util.Tools.encodeDate(calendar.get(Calendar.YEAR),
             		   calendar.get(Calendar.MONTH) + 1,
            		   31))  )
	      || currentDate.equals(com.ksoe.energynet.util.Tools.encodeDate(calendar.get(Calendar.YEAR),
        		   calendar.get(Calendar.MONTH) + 1,
       		   30))
        		)
        {
        	ScheduledEventsManager scheduledEventsManager = new ScheduledEventsManager();
        	System.out.println("Start generateAutoOrderByCountersServices!!!");
        	scheduledEventsManager.generateAutoOrderByCountersServices();
        	System.out.println("generateAutoOrderByCountersServices is Done!!!");
        }

    }


}