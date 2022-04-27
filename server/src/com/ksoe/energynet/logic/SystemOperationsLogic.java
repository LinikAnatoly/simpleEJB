package com.ksoe.energynet.logic;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.sql.Connection;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Date;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.management.MBeanServer;
import javax.management.ObjectName;

import org.apache.commons.io.FilenameUtils;
import org.jboss.mx.util.MBeanServerLocator;

import com.ksoe.energynet.util.EmailMessage;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

public class SystemOperationsLogic extends LogicModule {

	public SystemOperationsLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}


	public static void printResults(Process process) throws IOException {
	    BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
	    String line = "";
	    while ((line = reader.readLine()) != null) {
	        System.out.println(line);
	    }
	}


	/**
	 * отправка расчетных листов для сотрудников на e-mail
	 */
	public void sendingPaySheetsForEmployees() {

		InputStream inStream = null;
		OutputStream outStream = null;
		Process process = null;


		try {

			ReportLogic reportLogic = new ReportLogic(connection, userProfile);
			ServicesLogic servicesLogic = new ServicesLogic(connection, userProfile);

			Date date = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);

			NumberFormat formatter = new DecimalFormat("#00");
	        String monthNum = formatter.format(calendar.get(Calendar.MONTH)+1);

	        /** подключение сетевого ресурса */
	        String cmdMount = "/bin/bash -c /opt/jboss/bin/mount.sh";
			Runtime run = Runtime.getRuntime();
			process = run.exec(cmdMount);
			process.waitFor();


			String dataDir = "/mnt/AXPayStatement/out";
			String sentDir = "/mnt/AXPayStatement/sent/" + monthNum + Integer.toString(calendar.get(Calendar.YEAR));

			createDir(sentDir);


			/** проверка наличия файлов */
			File folder = new File(dataDir);
			File[] listOfFiles = folder.listFiles();
			if (listOfFiles.length == 0) {

		        /** отключение сетевого ресурса */
				String cmdUmount = "/bin/bash -c /opt/jboss/bin/umount.sh";
				process = run.exec(cmdUmount);
				process.waitFor();

				throw new SystemException("\n\n"
						+ "Не знайдено файлів для відправки!");
			}


			for (File file : listOfFiles) {
				if (file.isFile()) {

					String eMail = FilenameUtils.removeExtension(file.getName().trim());

					if (servicesLogic.isValidEmailAddress(eMail)) {

						EmailMessage emailMessage = new EmailMessage();
						emailMessage.setEmailAddress(eMail);
						emailMessage.setSubject("Розрахунково-платіжна відомість працівника");

						emailMessage.setText("\n"
										+ "АТ \"Херсонобленерго\" направляє Вам розрахунково-платіжну відомість.");


						/** добавляем вложение */
						emailMessage.addFile(file.getAbsolutePath());

						Message message = reportLogic.createMessage(emailMessage);
						Transport.send(message);


						/** пересестить и удалить файл */
						File inFile = new File(dataDir + "/" + file.getName());
		                File outFile = new File(sentDir + "/" + file.getName());

		                inStream = new FileInputStream(inFile);
		                outStream = new FileOutputStream(outFile);

						byte[] buffer = new byte[1024 * 4];

						int length;
						while ((length = inStream.read(buffer)) > 0) {
							outStream.write(buffer, 0, length);
						}

						inFile.delete();

						System.out.println("############################ sendingPaySheetsForEmployees... oK... " + eMail);
					}

				}
			}



	        /** отключение сетевого ресурса */
			String cmdUmount = "/bin/bash -c /opt/jboss/bin/umount.sh";
			process = run.exec(cmdUmount);
			process.waitFor();


		} catch (IOException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (MessagingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (InterruptedException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {

			process.destroy();

			try {
				if (inStream != null) {
					inStream.close();
				}
				if (outStream != null) {
					outStream.close();
				}
			} catch (IOException e) {
				throw new SystemException(e.getMessage(), e);
			}
		}
	}



	public void createDir(String dirName) throws IOException {

		final File dir = new File(dirName);

		if (!dir.exists() && !dir.mkdirs()) {
	        throw new IOException("Unable to create " + dir.getAbsolutePath());
	    }
	}



	/**
	 *  перезагрузка сервисов
	 */
	public void restartInspectPlanWorkService() {

		try {

			Object[] opArgs = new Object[] {};
			String[] sig = new String[] {};
			MBeanServer server = MBeanServerLocator.locateJBoss();

			System.out.println("######################################### server = " + server.toString());
			server.invoke(new ObjectName("com.ksoe.energynet.util:service=InspectPlanWork"), "stop", opArgs, sig);
			System.out.println("######################################### stopService InspectPlanWork....");
			server.invoke(new ObjectName("com.ksoe.energynet.util:service=InspectPlanWork"), "start", opArgs, sig);
			System.out.println("######################################### startService InspectPlanWork....");

		} catch (Exception e) {
			// throw new SystemException(e);
			e.printStackTrace();
		}
	}




	/**
	 * перезагрузка сервисов - Billing
	 */
	public void restartBillingService() {
		try {

			Object[] opArgs = new Object[] {};
			String[] sig = new String[] {};
			MBeanServer server = MBeanServerLocator.locateJBoss();

			System.out.println("######################################### server = " + server.toString());
			server.invoke(new ObjectName("com.ksoe.service.util:service=InspectWorkorder"), "stop", opArgs, sig);
			System.out.println("######################################### stopService InspectWorkorder....");
			server.invoke(new ObjectName("com.ksoe.service.util:service=InspectWorkorder"), "start", opArgs, sig);
			System.out.println("######################################### startService InspectWorkorder....");

		} catch (Exception e) {
			// throw new SystemException(e);
			e.printStackTrace();
		}
	}


}
