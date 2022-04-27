package com.ksoe.energynet.util;

import java.util.TimerTask;

import com.ksoe.energynet.dataminer.ENSizObjectDAO;

public class InspectTransaction extends TimerTask {

    @Override
	public void run() {
        ENSizObjectDAO sizDAO = new ENSizObjectDAO();

        /* работаем только на указанном серваке */
        String ipAddres = Tools.getInetAddress();

        if (!ipAddres.equals(Tools.ENERGY_NET_SERVER_IP)
                && !ipAddres.equals(Tools.AUTHORIZATION_SERVER_IP)) return;


        sizDAO.inspectTransaction();

        System.out.println("Inspect Transaction is Done!!!");
    }


}