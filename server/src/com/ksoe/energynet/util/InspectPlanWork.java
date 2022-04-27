package com.ksoe.energynet.util;

import java.util.Calendar;
import java.util.Date;
import java.util.TimerTask;

import com.ksoe.energynet.dataminer.ENAutoTiresDAO;
import com.ksoe.energynet.dataminer.ENSizObjectDAO;

public class InspectPlanWork extends TimerTask {

	@Override
	public void run() {
        ENSizObjectDAO sizDAO = new ENSizObjectDAO();
        ENAutoTiresDAO tiresDao = new ENAutoTiresDAO();

        Calendar calendar = Calendar.getInstance();
        int dataDay, workDay, elementTypeCode;

        /* работаем только на указанном серваке */
        String ipAddres = Tools.getInetAddress();

        if (!ipAddres.equals(Tools.ENERGY_NET_SERVER_IP)) return;

        dataDay = calendar.get(Calendar.DATE);
        workDay = 8;

        if (dataDay == workDay) {
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.MONTH, 2);
            int firstDay = cal.getActualMinimum(Calendar.DATE);
            cal.set(Calendar.DATE, firstDay);
            Date date = cal.getTime();

            elementTypeCode = 30;
            /* средства защиты */
            sizDAO.preparePlanBySizObject(date, elementTypeCode);
            System.out.println("Inspect PlanWork By SizObject is Done!!!");

            /* автопокрышки и аккумул€торы */
            Calendar cal2 = Calendar.getInstance();
            cal2.add(Calendar.MONTH, 1);
            int firstDay2 = cal2.getActualMinimum(Calendar.DATE);
            cal2.set(Calendar.DATE, firstDay2);
            Date date2 = cal2.getTime();

            tiresDao.preparePlanByAutoTires(date2);
            System.out.println("Inspect PlanWork By AutoTires is Done!!!");

            /**
            * вызов функции по оптимизации таблицы FINWORKER
            * (группировка строк по табельному номеру, удаление лишних строк и т.д.)
            */
            // sizDAO.compressFinWorker();
            // sizDAO.compressFinexEcutor();

            System.out.println("Inspect PlanWork is Done!!!");
        }

    	/** проверка пользователей со штатным */
    	/** 18.12.2018... +++ отключено в св€зи с разделение компании... */
    	System.out.println("Start UsersInShtat!!!");
    	sizDAO.checkUsersInShtat();
    	System.out.println("Inspect UsersInShtat is Done!!!");


    	/** закрытие просроченных услуг на сторону ( вышел срок оплаты ) */
    	System.out.println("Start Inspect servicesObject!!!");
    	ScheduledEventsManager scheduledEventsManager = new ScheduledEventsManager();
    	scheduledEventsManager.checkServicesObject();
    	System.out.println("Inspect servicesObject is Done!!!");


    	/** проверка даты закрыти€ договора в ‘  */
    	System.out.println("Start checkAgreements!!!");
    	sizDAO.checkAgreements();
    	System.out.println("checkAgreements is Done!!!");


    	/** закрытие документов, у которых установлена дата действи€ в будущем */
		System.out.println("Start checkDocOrdersDate!!!");
		scheduledEventsManager.checkDocOrdersDate();
		System.out.println("checkDocOrdersDate is Done!!!");


    	/** закрытие просроченных доверенностей */
		System.out.println("Start checkENWarrantsDate!!!");
		scheduledEventsManager.checkENWarrantsDate();
		System.out.println("checkENWarrantsDate is Done!!!");


		/** отправка пакета документов в архив и отмена договора о присоединении дл€ просроченных договоров */
		System.out.println("Start expiredAgreementsCancellation!!!");
		scheduledEventsManager.expiredAgreementsCancellation();
		System.out.println("expiredAgreementsCancellation is Done!!!");
    }


}