package com.ksoe.energynet.ejb;


import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.ksoe.jasperreports.export.JRDbfExporterParameter;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.logic.ReportLogic;
import com.ksoe.energynet.util.ENReportEjbCache;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.util.AnswerFileDodatokOk.AnswerFileDodatokOkGenerator;
import com.ksoe.energynet.util.AnswerFileDodatokOk.AnswerFileDodatokOkList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.ClientConstants;
import com.ksoe.energypro.valueobject.EPReportRequestEx;
import com.ksoe.lla.persistence.GenericSessionStatelessBean;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.reporting.BASE64Encoder;
import com.ksoe.lla.reporting.ReportMaker;
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
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.engine.fill.JRSwapFileVirtualizer;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.util.JRSwapFile;


public class ENReportControllerEJB extends GenericSessionStatelessBean
{
    private static boolean CACHED_FONTS = false;

    public ENReportControllerEJB() {
    }

    public String processForHOE(EPReportRequestEx request, String resultType) {
        return process(request, resultType);
    }

    public String processAsPDF(EPReportRequestEx request) {
        return process(request, "pdf");
    }

    public String processAsXLS(EPReportRequestEx request) {
        return process(request, "xls");
    }

    public String processAsDBF(EPReportRequestEx request) {
        return process(request, "dbf");
    }

    public String processAsXLS(EPReportRequestEx request, String fileType) {
        return process(request, "xlsx");
    }

    public String processAsDOC(EPReportRequestEx request, String fileType) {
        return process(request, "doc");
    }

    public String processAsPDF(EPReportRequestEx request, boolean is_for_docflow) {
        return process(request, "pdf", is_for_docflow);
    }

    public String processAsXLS(EPReportRequestEx request, boolean is_for_docflow) {
        return process(request, "xls", is_for_docflow);
    }

    public String processAsDOC(EPReportRequestEx request, boolean is_for_docflow) {
        return process(request, "doc", is_for_docflow);
    }

    public String process(EPReportRequestEx request, String type) {
        return process(request, type, false);
    }



	public String process(EPReportRequestEx request, String type, boolean is_for_docflow) {

		String str = "";

		/** ******************** */
		String ipAddres = Tools.getInetAddress();
        if (ipAddres.equals(Tools.ENERGY_NET_SERVER_IP)) {

        	String jndi = "ksoe/energynet/ENReportController";
            String ejbHome = "com.ksoe.energynet.ejb.ENReportControllerHome";

            try {

				ENReportControllerHome reportControllerHome = (ENReportControllerHome) ENReportEjbCache.getHome(jndi, ejbHome);
				ENReportController reportController = reportControllerHome.create();

				return reportController.process(request, type, is_for_docflow);

            } catch (Exception e) {
            	throw new SystemException(e.getMessage(), e);
			}

        }
        /** ******************** */


		byte[] arr = processAsByteArray(request, type, is_for_docflow);

		// Return base64 string to client
		BASE64Encoder bs64 = new BASE64Encoder();
		str = bs64.encode(arr);

		return str;
	}



	public byte[] processAsByteArray(EPReportRequestEx request, String type,
			boolean is_for_docflow) {

		Connection finConnection = null;
		Connection netConnection = null;
		Connection callCenterConnection = null;
		Connection docFlowConnection = null;
		Connection mDaxConnection = null;
		Connection bufetConnection = null;
		Connection workFlowConnection = null;

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

			String[] params = request.args;
			String[] paramNames = request.argNames;


			// Read report from compiled file
			if (!request.funcName.startsWith("/"))
				request.funcName = "/" + request.funcName;
			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(getClass().getResourceAsStream(request.funcName));

			System.out.println("### report user = " + getUserProfile().userName + ". Report name = " + request.funcName);

			JRParameter[] jrParams = jasperReport.getParameters();


			// Fill parameters
			Map parameters = new HashMap();
			for (int i = 0; i < params.length; i++) {
				for (int j = 0; j < jrParams.length; j++) {
					if (jrParams[j].getName().equals(paramNames[i])) {
						String valueClassName = jrParams[j].getValueClassName();
						Object value;
						if (valueClassName.equals("java.lang.Integer")) {
							try {
								value = new Integer(params[i]);
							} catch (NumberFormatException e1) {
								System.out.println("Report name : " + request.funcName);
								throw new EnergyproSystemException(e1);
							}
						} else if (valueClassName.equals("java.lang.Double")) {
							try {
								value = new Double(params[i]);
							} catch (NumberFormatException e1) {
								System.out.println("Report name : " + request.funcName);
								throw new EnergyproSystemException(e1);
							}
						} else if (valueClassName.equals("java.lang.Float")) {
							try {
								value = new Float(params[i]);
							} catch (NumberFormatException e1) {
								System.out.println("Report name : " + request.funcName);
								throw new EnergyproSystemException(e1);
							}
						} else if (valueClassName
								.equals("java.math.BigDecimal")) {
							try {
								value = new BigDecimal(params[i]);
							} catch (NumberFormatException e1) {
								System.out.println("Report name : " + request.funcName);
								throw new EnergyproSystemException(e1);
							}
						} else if (valueClassName.equals("java.lang.Long")) {
							try {
								value = new Long(params[i]);
							} catch (NumberFormatException e1) {
								System.out.println("Report name : " + request.funcName);
								throw new EnergyproSystemException(e1);
							}
						} else if (valueClassName.equals("java.lang.Boolean")) {
							value = new Boolean(params[i]);
						} else if (valueClassName.equals("java.util.Date")) {
							try {
								value = ClientConstants.DATE_FORMAT
										.parse(params[i]);
							} catch (ParseException e1) {
								System.out.println("Report name : " + request.funcName);
								throw new EnergyproSystemException(e1);
							}
						} else {
							value = params[i];
						}

						parameters.put(paramNames[i], value);

						System.out.println("### report parametr = " + paramNames[i] + ", value = " + value);
					}
				}
			}


			try {
				finConnection = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			} catch (DatasourceConnectException e) {
				System.out.println("Report name : " + request.funcName);
				System.out.println("DatasourceConnectException ...");
			}

			try {
				callCenterConnection = getConnection(AuthorizationJNDINames.CALLCENTER_DATASOURCE);
			} catch (DatasourceConnectException e) {
				System.out.println("Report name : " + request.funcName);
				System.out.println("DatasourceConnectException ...");
			}

			try {
				docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			} catch (DatasourceConnectException e) {
				System.out.println("Report name : " + request.funcName);
				System.out.println("DatasourceConnectException ...");
			}

			try {
				mDaxConnection = getConnection(AuthorizationJNDINames.MDAX_DATASOURCE);
			} catch (DatasourceConnectException e) {
				System.out.println("Report name : " + request.funcName);
				System.out.println("DatasourceConnectException ...");
			}

			try {
				bufetConnection = getConnection(AuthorizationJNDINames.BUFET_DATASOURCE);
			} catch (DatasourceConnectException e) {
				System.out.println("Report name : " + request.funcName);
				System.out.println("DatasourceConnectException ...");
			}

			try {
				workFlowConnection = getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);
			} catch (DatasourceConnectException e) {
				System.out.println("Report name : " + request.funcName);
				System.out.println("DatasourceConnectException ...");
			}

			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			parameters.put("finConnection", finConnection);
			parameters.put("netConnection", netConnection);
			parameters.put("callCenterConnection", callCenterConnection);
			parameters.put("docFlowConnection", docFlowConnection);
			parameters.put("mDaxConnection", mDaxConnection);
			parameters.put("bufetConnection", bufetConnection);
			parameters.put("workFlowConnection", workFlowConnection);

			parameters.put("userProfile", this.getUserProfile());


			///////////////////////////////////////////////

			String swapDir = System.getProperty("jboss.server.temp.dir");
			//String swapDir = "/var/tmp";
			JRSwapFileVirtualizer virtualizer = new JRSwapFileVirtualizer(25, new JRSwapFile(swapDir, 57344, 36864), true);

			parameters.put(JRParameter.REPORT_VIRTUALIZER, virtualizer);

			///////////////////////////////////////////////


			if (type.equals("xls") || type.equals("xlsx") || type.equals("dbf")) {
				parameters.put(JRParameter.IS_IGNORE_PAGINATION, Boolean.TRUE);
			} else {
				parameters.put(JRParameter.IS_IGNORE_PAGINATION, Boolean.FALSE);
			}

			JRDataSource ds = new ReportLogic(netConnection,
					this.getUserProfile()).getDataSourceByCode(request.reportCode);

			JasperPrint jasperPrint;

			if (ds != null) {
				jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, ds);
			} else {
				if (is_for_docflow) {
					jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, docFlowConnection);
				} else
					jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, netConnection);
			}


			if (virtualizer != null) {
				virtualizer.setReadOnly(true);
			}


			byte[] arr = new byte[0];


			// обработать  doc
			if (type.equals("doc")) {
				JRDocxExporter exporter = new JRDocxExporter();
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				exporter.setParameter(JRDocxExporterParameter.JASPER_PRINT, jasperPrint);
				exporter.setParameter(JRDocxExporterParameter.OUTPUT_STREAM, baos);

				exporter.setParameter(JRDocxExporterParameter.FLEXIBLE_ROW_HEIGHT, true);
				exporter.setParameter(JRDocxExporterParameter.FRAMES_AS_NESTED_TABLES, false);
				// exporter.setParameter(JRDocxExporterParameter.OUTPUT_WRITER, true);

				exporter.exportReport();
				arr = baos.toByteArray();


				/**    TEST   **********
				AWDocExporter exporter = new AWDocExporter();
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				exporter.setParameter(AWExporterParameter.JASPER_PRINT, jasperPrint);
				exporter.setParameter(AWExporterParameter.OUTPUT_STREAM, baos);
				exporter.exportReport();

				arr = baos.toByteArray();
				*/

			}

			else if (type.equals("pdf")) {
				arr = JasperExportManager.exportReportToPdf(jasperPrint);

			} else if (type.equals("xls") || type.equals("xlsx")) {

				ByteArrayOutputStream baos = new ByteArrayOutputStream();

		        // JRXlsExporter xlsExporter = new JRXlsExporter();
		        // xlsExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
		        // xlsExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);

		        /** NET-3292 +++ SUPP-1164 */
		        /** 20.02.2013 +++ принудительно заставляем xls понимать формат ячейки */
		        // xlsExporter.setParameter(JRXlsAbstractExporterParameter.IS_DETECT_CELL_TYPE, true);

		        // xlsExporter.exportReport();

		        /** 29.01.2013 +++ для экспорта - jxl-2.6.10.jar */
		        //JRAbstractExporter exporter = new JExcelApiExporter();
		        //exporter.setParameter(JExcelApiExporterParameter.JASPER_PRINT, jasperPrint);
		        //exporter.setParameter(JExcelApiExporterParameter.IS_DETECT_CELL_TYPE, true);
		        //exporter.setParameter(JExcelApiExporterParameter.IS_WHITE_PAGE_BACKGROUND, false);
		        //exporter.setParameter(JExcelApiExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, true);
		        //exporter.setParameter(JExcelApiExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_COLUMNS, true);
		        //exporter.setParameter(JExcelApiExporterParameter.OUTPUT_STREAM, baos);
		        //exporter.exportReport();

		        //byte[] arr = baos.toByteArray();


				/** 20.05.2014 +++ по умолчанию A4... */

				jasperPrint.setPageWidth(595);
				jasperPrint.setPageHeight(842);


				System.out.println("######### fileType = " + type);

				/** 20.11.2015....  Exporting Excel 2007 (XLSX)..... */
				if (type.equals("xlsx")) {
				    JRXlsxExporter exporterXLS = new JRXlsxExporter();

					exporterXLS.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
					exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, baos);
					exporterXLS.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, true);
					exporterXLS.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, false);
					exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, true);
					exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_COLUMNS,true);


					exporterXLS.exportReport();
					arr = baos.toByteArray();

				} else {
				    JRXlsExporter exporterXLS = new JRXlsExporter();


					exporterXLS.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
					exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, baos);
					exporterXLS.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, true);
					exporterXLS.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, false);
					exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, true);
					exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_COLUMNS,true);


					exporterXLS.exportReport();
					arr = baos.toByteArray();
				}


			} else if(type.equals("dbf")) {
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				org.ksoe.jasperreports.export.JRDbfExporter exporterDbf = new org.ksoe.jasperreports.export.JRDbfExporter();
				exporterDbf.setParameter(JRDbfExporterParameter.JASPER_PRINT, jasperPrint);
				exporterDbf.setParameter(JRDbfExporterParameter.OUTPUT_STREAM, baos);
				exporterDbf.exportReport();
				arr = baos.toByteArray();
			} else {

				new EnergyproSystemException("Unsupported format for reporting");
			}

			if (virtualizer != null) {
				virtualizer.cleanup();
			}

			return arr;

		}

	    catch (DocumentException e) {
	        System.out.println("Error inside report engine (DocumentException): " + e.getMessage());
	        System.out.println("Detail report error: " + e.getCause().getMessage());
	        System.out.println("Report name : " + request.funcName);

	        throw new EnergyproSystemException("\n\n" +
	                "Report name : " + request.funcName + "... Detail report error: " +
	                e.getCause().getMessage());
	    }

	    catch (JRException e) {
	        System.out.println("Error inside report engine (JRException): " + e.getMessage());
	        System.out.println("Detail report error: " + e.getCause().getMessage());
	        System.out.println("Report name : " + request.funcName);

	        throw new EnergyproSystemException("\n\n" +
	                "Report name : " + request.funcName + "... Detail report error: " +
	                e.getCause().getMessage());
	    }

	    catch (IOException e) {
	        System.out.println("Error inside report engine (IOException): " + e.getMessage());
	        System.out.println("Detail report error: " + e.getCause().getMessage());
	        System.out.println("Report name : " + request.funcName);

	        throw new EnergyproSystemException("\n\n" +
	                "Report name : " + request.funcName + "... Detail report error: " +
	                e.getCause().getMessage());
	    }

	    catch (DatasourceConnectException e) {
	        System.out.println("Report name : " + request.funcName);

	        throw new EnergyproSystemException("\n\n" +
	                "Report name : " + request.funcName + "... Detail report error: " +
	                e.getCause().getMessage());
	    }

		finally {
			try {
				if (finConnection != null && !finConnection.isClosed()) {
					finConnection.close();
					finConnection = null;
				}
			} catch (SQLException e) {
			}
			try {
				if (netConnection != null && !netConnection.isClosed()) {
					netConnection.close();
					netConnection = null;
				}
			} catch (SQLException e) {
			}
			// callCenterConnection
			try {
				if (callCenterConnection != null
						&& !callCenterConnection.isClosed()) {
					callCenterConnection.close();
					callCenterConnection = null;
				}
			} catch (SQLException e) {
			}
			// docFlowConnection
			try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}

			// mDaxConnection
			try {
				if (mDaxConnection != null && !mDaxConnection.isClosed()) {
					mDaxConnection.close();
					mDaxConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}




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


    public AnswerFileDodatokOkList getFileDodatokOk(
            AnswerFileDodatokOkList inputList) {
        try {
            return new AnswerFileDodatokOkGenerator().getAnswerFileDodatokOk(
                    inputList, getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(e);
        } finally {
            closeConnection();
        }
    }

    /* Сохранение передаваемого с клиента файла на дисковом пространстве
     * Файловой Системы Сервера Приложений */
    public void saveFile(byte[] aFile, String folderName, String fileName) {

        FileOutputStream out = null;

        try {
            File file1 = new File(folderName);
            file1.mkdirs();
            file1.setWritable(true);

            out = new FileOutputStream(folderName + fileName);
            out.write(aFile);
            out.close();

        } catch (FileNotFoundException fe) {
            throw new EnergyproSystemException(fe.getMessage());
        } catch (IOException e) {
            throw new EnergyproSystemException(e.getMessage());
        }
    }

    /* Извлечение в буфер обмена байтового потока из файла,
     * находящегося на дисковом пространстве
     * Файловой Системы Сервера Приложений */
    public String readingFile(String fileName) {
        String str = "";

        try {
            RandomAccessFile f = new RandomAccessFile(fileName, "r");
            byte[] arr = new byte[(int) f.length()];
            f.read(arr);

            BASE64Encoder bs64 = new BASE64Encoder();
            str = bs64.encode(arr);
            f.close();

        } catch (IOException e) {
            throw new EnergyproSystemException(e.getMessage());
        }

        return str;
    }

    /* Удаление вложенного файла из дискового пространства
     * Файловой Системы Сервера Приложений */
    public boolean deleteFile(String folderName, String fileName) {

        boolean fileWasDel = false;
        File file1 = new File(folderName + fileName);
        if (file1.exists() & file1.isFile()) {
        fileWasDel = file1.delete();
        if (fileWasDel) {
            file1 = new File(folderName);
            if (file1.exists() & file1.isDirectory()) {
            String[] strFiles = file1.list();
            if (strFiles.length == 0) {
                file1.delete();}
            }
        }
        }
        return fileWasDel;
    }



    /**
     * сохранение файла на FTP по определенному адресу
     *
     */
	public boolean saveByFTP(byte[] aFile, String un, String pw, String ip, String dirToCreate, String fileName) {
		try {

			ReportLogic reportLogic = new ReportLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			return reportLogic.saveByFTP(aFile, un, pw, ip, dirToCreate, fileName);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}




    /* Извлечение с помощью File Transport Protocol в буфер обмена байтового
     * потока из находящегося на дисковом пространстве Локальной Сети файла */
    public String readingByFTP(String un, String pw, String ip, String dir,
            String fn) {

    	return readingByFTP(un, pw, ip, dir, fn, true);

    }

    /* Извлечение с помощью File Transport Protocol в буфер обмена байтового
     * потока из находящегося на дисковом пространстве Локальной Сети файла */
    public String readingByFTP(String un, String pw, String ip, String dir,
            String fn, boolean isException) {

        String str = "";
        int port = 21;
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        FTPClient ftpClient = new FTPClient();

        try {

            ftpClient.connect(ip, port);
            ftpClient.login(un, pw);

            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
            ftpClient.enterLocalPassiveMode();

            InputStream is = ftpClient.retrieveFileStream(dir + fn);


            bos = new ByteArrayOutputStream();
            if (is == null) {
                System.out.print("### dir = " + dir + " , fn = " + fn);
                //throw new EnergyproSystemException("\n \n" +
                //        " Файл не найден!!!");

                if (isException) {
		            throw new EnergyproSystemException("\n\n" +
		                    "Файл перенесен в архив в связи с истечением срока давности!\n" +
		            		"Если Вам необходимо его просмотреть, обратитесь, пожалуйста, в СИТ!\n\n" +
		            		//"Файл не найден!\n\n" +
		                    "[" + dir + fn + "]");
                } else {
                	// Типа файл перенесен в архив на другой сервак
                	return "_ARCHIVED_";
                }
            }

            int next = is.read();

            while (next > -1) {
                bos.write(next);
                next = is.read();
            }

            bos.flush();

            byte[] arr = bos.toByteArray();

            BASE64Encoder bs64 = new BASE64Encoder();
            str = bs64.encode(arr);

            ftpClient.logout();
            ftpClient.disconnect();

        } catch (Exception e) {
            throw new EnergyproSystemException(e);

        } finally {
            try {
                bos.close();
            } catch (IOException e) {
                throw new EnergyproSystemException(e);
            }
        }

        return str;
    }

    public String readFromFTPToFile(String un, String pw, String ip, String dir, String fn) {

        int port = 21;
        String fileName = "";
        FTPClient ftpClient = new FTPClient();

        try {

            ftpClient.connect(ip, port);
            ftpClient.login(un, pw);

            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
            ftpClient.enterLocalPassiveMode();

            InputStream inputStream = ftpClient.retrieveFileStream(dir + fn);

        	// Файл не найден
            if (inputStream == null) {
                System.out.print("### dir = " + dir + " , fn = " + fn + " not found!");
                ftpClient.disconnect();
                 return "_NOT_FOUND_";
            }


            fileName = FilenameUtils.separatorsToSystem(System.getProperty("jboss.server.temp.dir") + "/" + System.currentTimeMillis() + "_" +
            		FilenameUtils.getName(dir + fn));

            OutputStream outputStream = new FileOutputStream(fileName);
            IOUtils.copy(inputStream, outputStream);
            outputStream.close();

            //ftpClient.logout();
            ftpClient.disconnect();

        } catch (Exception e) {
            throw new EnergyproSystemException(e);

        }

        return fileName;
    }



    public long getFileSizeFromFTP(String un, String pw, String ip, String dir, String fn) {

        int port = 21;
        String fileName = "";
        FTPClient ftpClient = new FTPClient();
        long size;

        try {

            ftpClient.connect(ip, port);
            ftpClient.login(un, pw);


            FTPFile file = ftpClient.mlistFile(dir+fn);
            size = file.getSize();
            System.out.println("File size = " + size);

            ftpClient.logout();
            ftpClient.disconnect();

        } catch (Exception e) {
            throw new EnergyproSystemException(e);

        }

        return size;
    }

    /**
     * Удаление вложенного файла из дискового пространства
     * Локальной Сети с помощью File Transport Protocol
     */
    public boolean deleteByFTP(String un, String pw, String ip,
        String dir, String fileName) {

        int port = 21;
        boolean fileWasDel = false;

        FTPClient ftpClient = new FTPClient();
        try {

            ftpClient.connect(ip, port);
            int replyCode = ftpClient.getReplyCode();

            if (!FTPReply.isPositiveCompletion(replyCode)) {
              System.out.println("Operation failed. Server reply code: "
                + replyCode);
              fileWasDel = false;
              return fileWasDel;
            }

            boolean success = ftpClient.login(un, pw);

            if (!success) {
              System.out.println("Could not login to the server");
              fileWasDel = false;
              return fileWasDel;
            }

            success = ftpClient.changeWorkingDirectory(dir);
            if (!success) {

              System.out.println("Could not go to FTP-directory.");
              fileWasDel = false;

              ftpClient.logout();
              ftpClient.disconnect();

              return fileWasDel;
            }

            //Удаление файла и содержащей его директории,
            //если в ней не содержится других файлов и папок
            fileWasDel = ftpClient.deleteFile(fileName); //Запись в логическую переменную результата удаления файла.
            if (fileWasDel) { //Если вложенный файл был удалён:
              FTPFile[] tpFiles = ftpClient.listFiles(); //Создание списка вложенных в директорию пакета файлов,
              FTPFile[] tpDirs = ftpClient.listDirectories(); //Создание списка вложенных в директорию пакета папок;
              if (tpFiles.length == 0 && tpDirs.length == 0) { //Если в директории пакета нет вложенных файлов и папок:
                ftpClient.changeToParentDirectory(); //Задание родительской рабочей директории (папки подсистемы),
                String[] directories = dir.split("/"); //Задание строкового массива папок (с увеличением уровня вложенности),
                String thisDir = directories[directories.length - 1]; //Задание в переменную последней директории (пакета),
                ftpClient.removeDirectory(thisDir); //Удаление логической функцией директории пакета (т.к. она пуста),
                directories = null; //Очистка заданного выше строкового массива директорий.
              }
            }
            else {
              System.out.println("Could not delete file from FTP-resourse.");
            }

            ftpClient.logout();
            ftpClient.disconnect();

        } catch (IOException ex) {
            System.out.println("Oops! Something wrong happened");
            ex.printStackTrace();
        }
        return fileWasDel;
    }


	public void renameByFTP(String un, String pw, String ip, String oldPath,
			String newPath, String fileName) {

		int port = 21;
		FTPClient ftpClient = new FTPClient();

		try {

			ReportLogic reportLogic = new ReportLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ftpClient.connect(ip, port);
			ftpClient.login(un, pw);
			reportLogic.ftpCreateDirectoryTree(ftpClient, newPath);
			ftpClient.logout();
			ftpClient.disconnect();


            ftpClient.connect(ip, port);
            ftpClient.login(un, pw);
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
            ftpClient.enterLocalPassiveMode();

            ftpClient.changeWorkingDirectory(oldPath);

            String remoteFile2 = fileName;
            String tempDir = System.getProperty("jboss.server.temp.dir");

            File downloadFile2 = new File(tempDir + "/" + fileName);

            OutputStream outputStream2 = new BufferedOutputStream(new FileOutputStream(downloadFile2));
            InputStream inputStream = ftpClient.retrieveFileStream(remoteFile2);

            if (inputStream != null) {
                byte[] bytesArray = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(bytesArray)) != -1) {
                    outputStream2.write(bytesArray, 0, bytesRead);
                }

                outputStream2.close();
                inputStream.close();
            }


            ftpClient.logout();
            ftpClient.disconnect();


            ftpClient.connect(ip, port);
            ftpClient.login(un, pw);
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
            ftpClient.enterLocalPassiveMode();
            ftpClient.changeWorkingDirectory(newPath);

            File secondLocalFile = new File(tempDir + "/" + fileName);
            String secondRemoteFile = fileName;
            inputStream = new FileInputStream(secondLocalFile);

            if (inputStream != null) {
                OutputStream outputStream = ftpClient.storeFileStream(secondRemoteFile);


                byte[] bytesIn = new byte[4096];
                int read = 0;

                while ((read = inputStream.read(bytesIn)) != -1) {
                    outputStream.write(bytesIn, 0, read);
                }

                inputStream.close();
                outputStream.close();
            }

            ftpClient.logout();
            ftpClient.disconnect();

            File file = new File(tempDir + "/" + fileName);
            file.delete();

            deleteByFTP(un, pw, ip, oldPath, fileName);


		} catch (Exception e) {
			throw new EnergyproSystemException(e);

		} finally {
			closeConnection();
		}
	}


	public void removeDirectory(String un, String pw, String ip, String dir) {
		int port = 21;
		FTPClient ftpClient = new FTPClient();
		try {

			ftpClient.connect(ip, port);
			ftpClient.login(un, pw);


		    boolean deleted = ftpClient.removeDirectory(dir);
		    if (deleted) {
		        System.out.println("The directory was removed successfully. " + dir);
		    } else {
		        System.out.println("Could not delete the directory, it may not be empty");
		    }

			ftpClient.logout();
			ftpClient.disconnect();

		} catch (IOException ex) {
			throw new EnergyproSystemException(ex);
		}
	}

}
