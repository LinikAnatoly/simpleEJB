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

        /* �������� ������ �� ��������� ������� */
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
            /* �������� ������ */
            sizDAO.preparePlanBySizObject(date, elementTypeCode);
            System.out.println("Inspect PlanWork By SizObject is Done!!!");

            /* ������������ � ������������ */
            Calendar cal2 = Calendar.getInstance();
            cal2.add(Calendar.MONTH, 1);
            int firstDay2 = cal2.getActualMinimum(Calendar.DATE);
            cal2.set(Calendar.DATE, firstDay2);
            Date date2 = cal2.getTime();

            tiresDao.preparePlanByAutoTires(date2);
            System.out.println("Inspect PlanWork By AutoTires is Done!!!");

            /**
            * ����� ������� �� ����������� ������� FINWORKER
            * (����������� ����� �� ���������� ������, �������� ������ ����� � �.�.)
            */
            // sizDAO.compressFinWorker();
            // sizDAO.compressFinexEcutor();

            System.out.println("Inspect PlanWork is Done!!!");
        }

    	/** �������� ������������� �� ������� */
    	/** 18.12.2018... +++ ��������� � ����� � ���������� ��������... */
    	System.out.println("Start UsersInShtat!!!");
    	sizDAO.checkUsersInShtat();
    	System.out.println("Inspect UsersInShtat is Done!!!");


    	/** �������� ������������ ����� �� ������� ( ����� ���� ������ ) */
    	System.out.println("Start Inspect servicesObject!!!");
    	ScheduledEventsManager scheduledEventsManager = new ScheduledEventsManager();
    	scheduledEventsManager.checkServicesObject();
    	System.out.println("Inspect servicesObject is Done!!!");


    	/** �������� ���� �������� �������� � �� */
    	System.out.println("Start checkAgreements!!!");
    	sizDAO.checkAgreements();
    	System.out.println("checkAgreements is Done!!!");


    	/** �������� ����������, � ������� ����������� ���� �������� � ������� */
		System.out.println("Start checkDocOrdersDate!!!");
		scheduledEventsManager.checkDocOrdersDate();
		System.out.println("checkDocOrdersDate is Done!!!");


    	/** �������� ������������ ������������� */
		System.out.println("Start checkENWarrantsDate!!!");
		scheduledEventsManager.checkENWarrantsDate();
		System.out.println("checkENWarrantsDate is Done!!!");


		/** �������� ������ ���������� � ����� � ������ �������� � ������������� ��� ������������ ��������� */
		System.out.println("Start expiredAgreementsCancellation!!!");
		scheduledEventsManager.expiredAgreementsCancellation();
		System.out.println("expiredAgreementsCancellation is Done!!!");
    }


}