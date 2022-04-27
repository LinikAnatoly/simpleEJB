package com.ksoe.energynet.ejb;


import com.ksoe.energynet.util.AnswerFileDodatokOk.AnswerFileDodatokOkList;
import com.ksoe.energypro.valueobject.EPReportRequestEx;

public interface ENReportController extends javax.ejb.EJBObject {

	public static final String JNDI_NAME = "ksoe/energynet/ENReportController";


	public String process(EPReportRequestEx request, String type) throws java.rmi.RemoteException;
	public String process(EPReportRequestEx request, String type, boolean is_for_docflow)
			throws java.rmi.RemoteException;


  public String processAsPDF(EPReportRequestEx request) throws java.rmi.RemoteException;

  public String processAsXLS(EPReportRequestEx request) throws java.rmi.RemoteException;
  public String processAsXLS(EPReportRequestEx request, String fileType) throws java.rmi.RemoteException;
  public String processAsDOC(EPReportRequestEx request, String fileType) throws java.rmi.RemoteException;
  public String processAsDBF(EPReportRequestEx request) throws java.rmi.RemoteException;

  public String processAsPDF(EPReportRequestEx request, boolean is_for_docflow) throws java.rmi.RemoteException;

  public String processAsXLS(EPReportRequestEx request, boolean is_for_docflow) throws java.rmi.RemoteException;

  public String processAsDOC(EPReportRequestEx request, boolean is_for_docflow) throws java.rmi.RemoteException;

  public String processForHOE(EPReportRequestEx request, String resultType) throws java.rmi.RemoteException;

  public byte[] processAsByteArray(EPReportRequestEx request, String type, boolean is_for_docflow) throws java.rmi.RemoteException;

  /* лист для заполнения dbf-файла Додаток ОК */
  public AnswerFileDodatokOkList getFileDodatokOk(AnswerFileDodatokOkList inputList)  throws java.rmi.RemoteException;


  /* Сохранение передаваемого с клиента файла на дисковом пространстве
   * Файловой Системы Сервера Приложений */
  public void saveFile(byte[] aFile, String folderName, String fileName)
    throws java.rmi.RemoteException;

  /* Извлечение в буфер обмена байтового потока из файла,
   * находящегося на дисковом пространстве
   * Файловой Системы Сервера Приложений */
  public String readingFile(String fileName) throws java.rmi.RemoteException;

  /* Удаление вложенного файла из дискового пространства
   * Файловой Системы Сервера Приложений */
  public boolean deleteFile(String folderName, String fileName)
    throws java.rmi.RemoteException;

    /**
    * Извлечение с помощью File Transport Protocol в буфер обмена байтового
    * потока из файла, находящегося на FTP-ресурсе дискового пространства Локальной Сети */
	public String readingByFTP(String un, String pw, String ip, String dir,
			String fileName) throws java.rmi.RemoteException;
    public String readingByFTP(String un, String pw, String ip, String dir,
            String fileName, boolean isException) throws java.rmi.RemoteException;

    public String readFromFTPToFile(String un, String pw, String ip, String dir, String fn)
    		throws java.rmi.RemoteException;

    /**
    * Сохранение с помощью File Transport Protocol передаваемого с Клиента файла
    * на FTP-ресурсе дискового пространства Локальной Сети */
	public boolean saveByFTP(byte[] aFile, String un, String pw, String ip,
			String dirToCreate, String fileName)
			throws java.rmi.RemoteException;

    /**
    * Удаление вложенного файла из FTP-ресурса дискового пространства
    * Локальной Сети по заданному адресу с помощью File Transport Protocol */
	public boolean deleteByFTP(String un, String pw, String ip, String dir,
			String fileName) throws java.rmi.RemoteException;

	public void renameByFTP(String un, String pw, String ip, String oldPath,
			String newPath, String fileName) throws java.rmi.RemoteException;

	public void removeDirectory(String un, String pw, String ip, String oldPath)
			throws java.rmi.RemoteException;

}