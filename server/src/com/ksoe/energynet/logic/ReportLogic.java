package com.ksoe.energynet.logic;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.dataminer.DFDocServicesConsumerDAO;
import com.ksoe.docflow.valueobject.DFDocServicesConsumer;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENDocAttachmentDAO;
import com.ksoe.energynet.dataminer.ENDocAttachmentServerDAO;
import com.ksoe.energynet.logic.ServicesLogic.DocType;
import com.ksoe.energynet.util.EmailMessage;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachmentServer;
import com.ksoe.energynet.valueobject.ENManagement;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.filter.ENDepartmentFilter;
import com.ksoe.energynet.valueobject.lists.ENDepartmentShortList;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.reporting.ReportMaker;
import com.ksoe.lla.security.UserProfile;
import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.BaseFont;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.util.JRLoader;

public class ReportLogic extends LogicModule{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;


	public ReportLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}


	public JRDataSource getDataSourceByCode(int dsCode) {
		// ArrayList arrList = new ArrayList();
		// JRDataSource ds = new JRBeanCollectionDataSource(arrList, false);
		return null;
	}



	public static final String[] RECIPIENTS = {

			"nikolay.shevchenko@co.ksoe.com.ua",
			"natalya.korzhevskaya@co.ksoe.com.ua",
			"darya.lisienko@co.ksoe.com.ua",
			"pavlo.nikytenko@co.ksoe.com.ua",
			"irina.nikishenko@co.ksoe.com.ua"
	};



	/**
	 * формирование додатка №3 за текущий месяц по РЭС-ам
	 */
	public String generationReportForSheva() {

		Connection finConnection = null;
		Connection netConnection = null;
		Connection callCenterConnection = null;
		Connection docFlowConnection = null;
		Connection mDaxConnection = null;
		Connection bufetConnection = null;

		try {

			if (!CACHED_FONTS) {
				// Cache fonts before creating report
				cacheFont("arial.ttf");
				cacheFont("arialbd.ttf");
				cacheFont("arialbi.ttf");
				cacheFont("ariali.ttf");
				cacheFont("ARIALN.TTF");
				cacheFont("ARIALNB.TTF");
				cacheFont("ARIALNBI.TTF");
				cacheFont("ARIALNI.TTF");
				cacheFont("ariblk.ttf");
				cacheFont("times.ttf");
				cacheFont("timesbd.ttf");
				cacheFont("timesbi.ttf");
				cacheFont("timesi.ttf");
				CACHED_FONTS = true;
			}


			String reportName = "/com/ksoe/energynet/reports/NPZ_dodat3_var2_norms_zp/ax_dodat3.jasper";
			String reportPath = "/u02/share/NPZ_dodat3";


			/** проверка наличия и создание директории */
			createDir(reportPath);


			/** очистка папки... */
			File directory = new File(reportPath);
			// Get all files in directory
			File[] files = directory.listFiles();
			for (File file : files) {
				// Delete each file
				if (!file.delete()) {
					// Failed to delete file
					System.out.println("Failed to delete " + file);
				}
			}

	        JasperReport jasperReport = (JasperReport) JRLoader.loadObject(getClass().getResourceAsStream(reportName));
	        System.out.println("jasperReport loaded ");

	        try {
				finConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			} catch (DatasourceConnectException e) {
				System.out.println("DatasourceConnectException ...");
			}

			try {
				callCenterConnection = getConnection(AuthorizationJNDINames.CALLCENTER_DATASOURCE);
			} catch (DatasourceConnectException e) {
				System.out.println("DatasourceConnectException ...");
			}

			try {
				docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			} catch (DatasourceConnectException e) {
				System.out.println("DatasourceConnectException ...");
			}

			try {
				mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
			} catch (DatasourceConnectException e) {
				System.out.println("DatasourceConnectException ...");
			}

			try {
				bufetConnection = getConnection(AuthorizationJNDINames.BUFET_DATASOURCE);
			} catch (DatasourceConnectException e) {
				System.out.println("DatasourceConnectException ...");
			}

			try {
				netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			} catch (DatasourceConnectException e) {
				System.out.println("DatasourceConnectException ...");
			}


			Date startDate, endDate;

	        Calendar start = Calendar.getInstance();
	        start.set(Calendar.DATE, start.getActualMinimum(Calendar.DATE));
	        startDate = start.getTime();

	        Calendar end = Calendar.getInstance();
	        end.set(Calendar.DATE, end.getActualMaximum(Calendar.DATE));
	        endDate = end.getTime();



			ENDepartmentDAO departmentDao = new ENDepartmentDAO(netConnection, userProfile);
			ENDepartmentFilter departmentFilter = new ENDepartmentFilter();
			departmentFilter.conditionSQL = " endepartment.managementrefcode = " + ENManagement.TECHNICAL
					+ " and endepartment.parentrefcode = " + ENDepartment.ENDEPARTMENT_DISTRIBUTION_NETWORKS;


			ENDepartmentShortList departmentShortList = departmentDao.getScrollableFilteredList(departmentFilter, 0, -1);
			for (int i = 0; i < departmentShortList.totalCount; i++) {


		        // Fill parameters
		        Map parameters = new HashMap();

		        parameters.put(JRParameter.IS_IGNORE_PAGINATION, Boolean.TRUE);

		        parameters.put("finConnection", finConnection);
				parameters.put("netConnection", netConnection);
				parameters.put("callCenterConnection", callCenterConnection);
				parameters.put("docFlowConnection", docFlowConnection);
				parameters.put("mDaxConnection", mDaxConnection);
				parameters.put("bufetConnection", bufetConnection);

		        parameters.put("userProfile", userProfile);

	            parameters.put("pdate1", new SimpleDateFormat("dd.MM.yyyy").format(startDate));
	            parameters.put("pdate2", new SimpleDateFormat("dd.MM.yyyy").format(endDate));
	            parameters.put("rencode", departmentShortList.get(i).code);
	            parameters.put("renname", departmentShortList.get(i).shortName);
	            parameters.put("plankind", 2);

	            parameters.put("show_rza_dtu_iz_ovb", 0);
	            parameters.put("podr_str_kadry", "qqq");
	            parameters.put("countByStaffing", 0);


		        // Fill report and make PDF
	            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, netConnection);

		        System.out.println("report filled ");

		        ByteArrayOutputStream baos = new ByteArrayOutputStream();
		        JRXlsExporter exporterXLS = new JRXlsExporter();

				exporterXLS.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
				exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, baos);
				exporterXLS.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, true);
				exporterXLS.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, false);
				exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, true);
				exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_COLUMNS,true);


				exporterXLS.exportReport();
				byte[] arr = baos.toByteArray();


				String outReport = "NPZ_dodat3_" + System.currentTimeMillis() + ".xls";

		        FileOutputStream fos = new FileOutputStream(reportPath+"/"+outReport);
		        fos.write(arr);
		        fos.close();


		        /** Создание сообщения*/
		        String ENCODING = MAIL_ENCODING_UTF8;
				String FROM = MAIL_ADDRESS_FROM;

				Properties mailProps = new Properties();
	    		mailProps.put("mail.store.protocol", MAIL_STORE_PROTOCOL_POP3);
	    		mailProps.put("mail.transport.protocol", MAIL_TRANSPORT_PROTOCOL_SMTP);
	    		mailProps.put("mail.pop3.host", MAIL_HOST);
	    		mailProps.put("mail.smtp.host", MAIL_HOST);


	    		javax.mail.Session session = Session.getDefaultInstance(mailProps);

	    		MimeMessage mimeMessage = new MimeMessage(session);
	    		mimeMessage.setFrom(new InternetAddress(FROM));
	    		mimeMessage.setHeader("X-Priority", "1");
	    		mimeMessage.setSubject("NPZ_dodat3 - " + departmentShortList.get(i).shortName, ENCODING);
	    		mimeMessage.setText(departmentShortList.get(i).shortName, ENCODING);

	    		BodyPart messageBodyPart = new MimeBodyPart();
	    		Multipart multipart = new MimeMultipart();

	    		DataSource source = new FileDataSource(reportPath+"/"+outReport);
	    		messageBodyPart.setDataHandler(new DataHandler(source));
	    		messageBodyPart.setFileName(outReport);

	    		multipart.addBodyPart(messageBodyPart);

	    		mimeMessage.setContent(multipart);


				String recipients[] = RECIPIENTS;
				for (int r = 0; r < recipients.length; r++) {

					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipients[r]));
					Transport.send(mimeMessage);

					System.out.println("################## sendMessage = " + "NPZ_dodat3 - " + departmentShortList.get(i).shortName
							+ " :: recipient = " + recipients[r]);
				}

			}
		}

		catch (DocumentException e) {
			System.out
					.println("Error inside report engine (DocumentException): "
							+ e.getMessage());
			System.out.println("Detail report error: "
					+ e.getCause().getMessage());
		}

		catch (JRException e) {
			System.out.println("Error inside report engine (JRException): "
					+ e.getMessage());
			System.out.println("Detail report error: "
					+ e.getCause().getMessage());
		}

		catch (IOException e) {
			System.out.println("Error inside report engine (IOException): "
					+ e.getMessage());
			System.out.println("Detail report error: "
					+ e.getCause().getMessage());
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {

			try {
				if (finConnection != null && !finConnection.isClosed()) {
					finConnection.close();
					finConnection = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			try {
				if (netConnection != null && !netConnection.isClosed()) {
					netConnection.close();
					netConnection = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			try {
				if (callCenterConnection != null && !callCenterConnection.isClosed()) {
					callCenterConnection.close();
					callCenterConnection = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			try {
				if (mDaxConnection != null && !mDaxConnection.isClosed()) {
					mDaxConnection.close();
					mDaxConnection = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			try {
				if (bufetConnection != null && !bufetConnection.isClosed()) {
					bufetConnection.close();
					bufetConnection = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}


		return null;
	}



	private static final String WORKING_IP_ADDRESS = "10.77.11.18";
	private static final String MAIL_HOST = "10.77.11.51";
	private static final String MAIL_ADDRESS_FROM = "ENERGYNET<noreply@ksoe.com.ua>";
	private static final String MAIL_ENCODING_UTF8 = "UTF-8";
	private static final String MAIL_STORE_PROTOCOL_POP3 = "pop3";
	private static final String MAIL_TRANSPORT_PROTOCOL_SMTP = "smtp";


    private static boolean CACHED_FONTS = false;

	private void cacheFont(String fontName) throws DocumentException,
			IOException {

		// Cache font for feature using inside report
		InputStream fr = ReportMaker.class.getResourceAsStream("/com/ksoe/reporting/fonts/" + fontName);
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		byte ttfAfm[] = new byte[2048];
		int res = fr.read(ttfAfm);
		while (res > 0) {
			out.write(ttfAfm, 0, res);
			res = fr.read(ttfAfm);
		}

		fr.close();
		fr = null;

		// Create font for caching only (make it only once on JVM session)
		BaseFont.createFont(fontName, "Cp1251", BaseFont.EMBEDDED, true, out.toByteArray(), null);
		// free font resources, because it will be recreated inside jasper fnt = null;
		out.close();
		out = null;
	}




	/**
	 * формирование счета и отправка на e-mail
	 *
	 * @param servicesObject
	 * @param docType - (первый счет, второй и т.п.)
	 */
	public void sendBillToCustomer(ENServicesObject servicesObject, int docType) {

		// Всякие отправки только на рабочем серваке
		String ipAddres = Tools.getInetAddress();
		if (! ipAddres.equals(Tools.ENERGY_NET_SERVER_IP)) {
			return;
		}

		Connection netConnection = null;
		Connection docFlowConnection = null;

		try {

			if (!CACHED_FONTS) {
				// Cache fonts before creating report

				cacheFont("arial.ttf");
				cacheFont("arialbd.ttf");
				cacheFont("arialbi.ttf");
				cacheFont("ariali.ttf");
				cacheFont("ARIALN.TTF");
				cacheFont("ARIALNB.TTF");
				cacheFont("ARIALNBI.TTF");
				cacheFont("ARIALNI.TTF");
				cacheFont("ariblk.ttf");
				cacheFont("times.ttf");
				cacheFont("timesbd.ttf");
				cacheFont("timesbi.ttf");
				cacheFont("timesi.ttf");

				CACHED_FONTS = true;
			}


			try {
				netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
				docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			} catch (DatasourceConnectException e) {
				System.out.println("DatasourceConnectException ...");
			}


			ServicesLogic servicesLogic = new ServicesLogic(netConnection, userProfile);


			// Fill parameters
	        Map parameters = new HashMap();

	        parameters.put(JRParameter.IS_IGNORE_PAGINATION, Boolean.TRUE);
			parameters.put("netConnection", netConnection);
	        parameters.put("userProfile", userProfile);


			String reportName = "";
			String reportPath = System.getProperty("jboss.server.temp.dir");


			if (docType == DocType.FIRST_BILL) {
				reportName = "/com/ksoe/energynet/reports/Services/Bill/rah_calc_new.jasper";
		        parameters.put("soCode", servicesObject.code);
			}

			if (docType == DocType.SECOND_BILL) {
				reportName = "/com/ksoe/energynet/reports/Services/Bill/rahFinal.jasper";
				parameters.put("soCode", servicesObject.code);
			}

			if (reportName.equals("")) {
				return;
			}


	        JasperReport jasperReport = (JasperReport) JRLoader.loadObject(getClass().getResourceAsStream(reportName));
	        System.out.println("jasperReport loaded ");

	        // Fill report and make PDF
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, netConnection);
	        System.out.println("report filled ");

	        String outReport = "paymentInvoice_" + System.currentTimeMillis() + ".pdf";
            String exportPath = reportPath + "/" + outReport;
            JasperExportManager.exportReportToPdfFile(jasperPrint, exportPath);


            /** Создание сообщения*/
			String eMail = servicesObject.customerEmail;

			EmailMessage emailMessage = new EmailMessage();
            emailMessage.setEmailAddress(eMail);
            emailMessage.setSubject("Рахунок на сплату послуг");

            /** если услуга по заявке  */
            int servicesConsumerCode = servicesLogic.getServicesConsumerCode(servicesObject.code);
			if (servicesConsumerCode != Integer.MIN_VALUE) {

				DFDocServicesConsumerDAO servicesConsumerDao = new DFDocServicesConsumerDAO(docFlowConnection, userProfile);
				DFDocServicesConsumer servicesConsumer = servicesConsumerDao.getObject(servicesConsumerCode);

				emailMessage.setText("\n"
						+ "АТ \"Херсонобленерго\" направляє Вам рахунок на сплату послуг згідно заявки №" + servicesConsumer.numberGen
						+ " від " + new SimpleDateFormat("dd.MM.yyyy").format(servicesConsumer.dateRegistration).toString() + " р.");

			} else {
				emailMessage.setText("\n"
						+ "АТ \"Херсонобленерго\" направляє Вам рахунок на сплату послуг згідно договору №" + servicesObject.contractNumberServices
						+ " від " + new SimpleDateFormat("dd.MM.yyyy").format(servicesObject.contractDateServices).toString() + " р.");
			}


            /** Добавляем вложения*/
            emailMessage.addFile(exportPath);


            Message message = createMessage(emailMessage);
            Transport.send(message);

			System.out.println(
					"################################ sendBillToCustomer... servicesObject.contractNumberServices =  "
							+ servicesObject.contractNumberServices);


			/** удаление файла */
			File file = new File(exportPath);
			file.delete();


		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("################# sendBillToCustomer error: " + e.getCause().getMessage());
		} finally {
			try {
				if (netConnection != null && !netConnection.isClosed()) {
					netConnection.close();
					netConnection = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}




	public Message createMessage(EmailMessage emailMessage) {

		/** отправка файла на e-mail */
		String ENCODING = MAIL_ENCODING_UTF8;

		Properties mailProps = new Properties();
		mailProps.put("mail.store.protocol", MAIL_STORE_PROTOCOL_POP3);
		mailProps.put("mail.transport.protocol", MAIL_TRANSPORT_PROTOCOL_SMTP);
		mailProps.put("mail.pop3.host", MAIL_HOST);
		mailProps.put("mail.smtp.host", MAIL_HOST);


		Session session = Session.getInstance(mailProps, new javax.mail.Authenticator() {
		});

		MimeMessage message = new MimeMessage(session);
		try {
			message.setHeader("X-Priority", "1");
			message.setHeader("X-Priority", "important");
			message.setHeader("Priority", "High");
			message.setHeader("Importance", "High");

			message.setFrom(new InternetAddress("noreply@ksoe.com.ua", "АТ \"Херсонобленерго\""));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(emailMessage.getEmailAddress()));

			message.setSubject(emailMessage.getSubject());

			// Create the message part
			BodyPart messageBodyPart = new MimeBodyPart();

			// Now set the actual message
			messageBodyPart.setText(emailMessage.getText());

			Multipart multipart = new MimeMultipart();

			if (emailMessage.getFiles().size() > 0) {

				ArrayList<String> files = emailMessage.getFiles();

				for (int i = 0; i < files.size(); i++) {
					String attachFile = files.get(i);
					MimeBodyPart attachPart = new MimeBodyPart();
					attachPart.setFileName(MimeUtility.encodeText(attachFile, ENCODING, null));
					attachPart.addHeader("Content-Type", "text/plain; charset=UTF-8");

					DataSource source = new FileDataSource(attachFile);
					attachPart.setDataHandler(new DataHandler(source));
					attachPart.setFileName(new File(attachFile).getName());
					multipart.addBodyPart(attachPart);
				}
			}


			multipart.addBodyPart(messageBodyPart);
			message.setContent(multipart);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("################# createMessage error: " + e.getCause().getMessage());
		}

		return message;
	}



	public void createDir(String dirName) throws IOException {

		final File dir = new File(dirName);

		if (!dir.exists() && !dir.mkdirs()) {
	        throw new IOException("Unable to create " + dir.getAbsolutePath());
	    }
	}



	/**
	 *
	 * @param enDocAttachmentCode
	 * @return byte[] arr
	 */
	public byte[] getFileDataArr(int enDocAttachmentCode) {

		ByteArrayOutputStream bos = new ByteArrayOutputStream();

		FTPClient ftpClient = new FTPClient();

		try {

			ENDocAttachmentDAO enDocAttachmentDao = new ENDocAttachmentDAO(connection, userProfile);
			ENDocAttachmentServerDAO enDocAttachmentServerDao = new ENDocAttachmentServerDAO(connection, userProfile);

			ENDocAttachment attachment = enDocAttachmentDao.getObject(enDocAttachmentCode);
			ENDocAttachmentServer attServ = enDocAttachmentServerDao.getObject(attachment.serverRef.code);
			String dir = attachment.fileLink;
			String fn = "";
			String ftpIp = attServ.serverIp;
			String ftpUn = attServ.userName;
			String ftpPw = attServ.userPass;

	        int port = 21;

	        ftpClient.connect(ftpIp, port);
            ftpClient.login(ftpUn, ftpPw);

            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
            ftpClient.enterLocalPassiveMode();

            InputStream is = ftpClient.retrieveFileStream(dir + fn);

            if (is == null) {
                System.out.print("### dir = " + dir + " , fn = " + fn);

	            throw new SystemException("\n\n" +
	                    "Файл перенесений до архіву у зв'язку із закінченням терміну давності!\n" +
	            		"Якщо Вам необхідно його переглянути, зверніться, будь ласка, в СІТ!\n\n" +
	                    "[" + dir + fn + "]");
            }

			int next = is.read();
			while (next > -1) {
				bos.write(next);
				next = is.read();
			}

			bos.flush();

			byte[] arr = bos.toByteArray();

			return arr;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (SocketException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (IOException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
            try {
                bos.close();
            } catch (IOException e) {
                throw new SystemException(e);
            }
			try {
				ftpClient.logout();
				ftpClient.disconnect();
			} catch (IOException ex) {}
        }
	}



	/**
	 * сохранение файла на FTP по определенному адресу
	 *
	 * @param aFile
	 * @param un
	 * @param pw
	 * @param ip
	 * @param dirToCreate
	 * @param fileName
	 *
	 * @return
	 */
	public boolean saveByFTP(byte[] aFile, String un, String pw, String ip, String dirToCreate, String fileName) {

		int port = 21;
		boolean fileSave = false;

		FTPClient ftpClient = new FTPClient();

		try {

			ftpClient.connect(ip, port);
			int replyCode = ftpClient.getReplyCode();

			if (!FTPReply.isPositiveCompletion(replyCode)) {
				System.out.println("Operation failed. Server reply code: " + replyCode);
				fileSave = false;
				throw new SystemException("\n\nПомилка збереження файла на FTP!\n"+
						"Operation failed. Server reply code: " + replyCode);
			}

			boolean success = ftpClient.login(un, pw);

			if (!success) {
				System.out.println("Could not login to the server");
				fileSave = false;
				throw new SystemException("\n\nПомилка збереження файла на FTP!\n"+
						"Could not login to the server");
			}

			// Creates a directory
			success = ftpCreateDirectoryTree(ftpClient, dirToCreate);

			ftpClient.changeWorkingDirectory("dirToCreate");
			ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
			ftpClient.enterLocalPassiveMode();

			if (success) {
				// System.out.println("Successfully created directory: " + dirToCreate);
				ByteArrayInputStream in = new ByteArrayInputStream(aFile);
				fileSave = ftpClient.storeFile(fileName, in);

				if (!fileSave) {
					System.out.println("Failed to save file on FTP-resource. See server's reply.");
					throw new SystemException("\n\nПомилка збереження файла на FTP!\n"+
							"Failed to save file on FTP-resource. See server's reply.");
				}

			} else {
				System.out.println("Failed to create directory. See server's reply.");
				fileSave = false;
				throw new SystemException("\n\nПомилка збереження файла на FTP!\n"+
						"Failed to create directory. See server's reply.");
			}

			if (! fileSave) {
				throw new SystemException("\n\nПомилка збереження файла на FTP!");
			}

			return fileSave;

		} catch (IOException ex) {
			throw new SystemException(ex);
		} finally {
			try {
				ftpClient.logout();
				ftpClient.disconnect();
			} catch (IOException ex) {}
		}
	}



	/**
     * рекурсивное создание каталогов на FTP сервере
     *
     * @param FTPClient
     * @param dirTree
     *
     * @return - dirExists
     *
     */
	public static boolean ftpCreateDirectoryTree(FTPClient client, String dirTree) throws IOException {

		boolean dirExists = false;

		String[] directories = dirTree.split("/");
		for (String dir : directories) {
			if (!dir.isEmpty()) {

				dirExists = client.changeWorkingDirectory(dir);

				if (!dirExists) {
					if (!client.makeDirectory(dir)) {
						throw new IOException("Unable to create remote directory '" + dir + "'.  error='"
								+ client.getReplyString() + "'");
					} else {
						dirExists = true;
					}

					if (!client.changeWorkingDirectory(dir)) {
						throw new IOException("Unable to change into newly created remote directory '" + dir
								+ "'.  error='" + client.getReplyString() + "'");
					} else {
						dirExists = true;
					}

				}
			}
		}

		return dirExists;
	}



}