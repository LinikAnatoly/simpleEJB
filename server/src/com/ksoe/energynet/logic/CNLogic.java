package com.ksoe.energynet.logic;


import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;

import org.apache.commons.compress.archivers.ArchiveException;
import org.apache.commons.compress.archivers.ArchiveOutputStream;
import org.apache.commons.compress.archivers.ArchiveStreamFactory;
import org.apache.commons.compress.archivers.sevenz.SevenZArchiveEntry;
import org.apache.commons.compress.archivers.sevenz.SevenZFile;
import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.utils.IOUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

import com.ksoe.authorization.dataminer.DomainDAO;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.Domain;
import com.ksoe.authorization.valueobject.lists.DomainShortList;
import com.ksoe.callcenter.valueobject.CCRecordPoint;
import com.ksoe.callcenter.valueobject.brief.CCRecordPointShort;
import com.ksoe.callcenter.valueobject.filter.CCRecordPointFilter;
import com.ksoe.docflow.dataminer.DFDocDAO;
import com.ksoe.docflow.dataminer.DFDocSupplyEEDAO;
import com.ksoe.docflow.logic.DFConsts;
import com.ksoe.docflow.logic.DocFlowLogic;
import com.ksoe.docflow.valueobject.Attachment;
import com.ksoe.docflow.valueobject.DFBillingDocumentType;
import com.ksoe.docflow.valueobject.DFDoc;
import com.ksoe.docflow.valueobject.DFDocStatus;
import com.ksoe.docflow.valueobject.DFDocSupplyEE;
import com.ksoe.docflow.valueobject.DFDocSupplyEEType;
import com.ksoe.docflow.valueobject.DFInfoSources;
import com.ksoe.docflow.valueobject.DFPackStatus;
import com.ksoe.docflow.valueobject.DFServicesList;
import com.ksoe.docflow.valueobject.DFSupplyContractType;
import com.ksoe.docflow.valueobject.brief.DFDocMovementShort;
import com.ksoe.docflow.valueobject.filter.DFDocSupplyEEFilter;
import com.ksoe.docflow.valueobject.lists.DFDocMovementShortList;
import com.ksoe.energynet.dataminer.CNAttachmentDAO;
import com.ksoe.energynet.dataminer.CNMovementDAO;
import com.ksoe.energynet.dataminer.CNRen2ENDepartmentDAO;
import com.ksoe.energynet.dataminer.CNRole2DomainInfoDAO;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENDocAttachment2ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENDocAttachmentDAO;
import com.ksoe.energynet.dataminer.ENDocAttachmentServerDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.ejb.ENDocAttachmentController;
import com.ksoe.energynet.ejb.ENDocAttachmentControllerHome;
import com.ksoe.energynet.ejb.ENReportController;
import com.ksoe.energynet.ejb.ENReportControllerHome;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.CNActsPack;
import com.ksoe.energynet.valueobject.CNMovement;
import com.ksoe.energynet.valueobject.CNPack;
import com.ksoe.energynet.valueobject.CNPack2PlanWork;
import com.ksoe.energynet.valueobject.CNPack2Site;
import com.ksoe.energynet.valueobject.CNPackData;
import com.ksoe.energynet.valueobject.CNSubsystemType;
import com.ksoe.energynet.valueobject.CNTechTerms;
import com.ksoe.energynet.valueobject.ENAttachment2ServicesKind;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENDocAttachment2ENServicesObject;
import com.ksoe.energynet.valueobject.ENDocAttachmentServer;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENServicesContragentType;
import com.ksoe.energynet.valueobject.filter.CNAttachmentFilter;
import com.ksoe.energynet.valueobject.filter.CNMovementFilter;
import com.ksoe.energynet.valueobject.filter.CNRen2ENDepartmentFilter;
import com.ksoe.energynet.valueobject.filter.CNRole2DomainInfoFilter;
import com.ksoe.energynet.valueobject.filter.ENDocAttachmentFilter;
import com.ksoe.energynet.valueobject.lists.CNAttachmentShortList;
import com.ksoe.energynet.valueobject.lists.CNRen2ENDepartmentShortList;
import com.ksoe.energynet.valueobject.lists.CNRole2DomainInfoShortList;
import com.ksoe.energynet.valueobject.lists.ENDocAttachmentShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.util.ClientConstants;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.reporting.ReportMaker;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.netobjects.logic.PriconnectionDataLogic.SubstationType;
import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.BaseFont;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.util.JRLoader;


public class CNLogic extends LogicModule{

	// Состояния, при переходе на которые необходимо менять статус пакета на сайте (для подсистемы "Договора про розподіл е/е")
	/** В работе */
	public static final int[] DST_STATES_ACTIVE = {1102}; //{65, 66, 67, 84, 1011, 1007, 1012, 1015, 1016, 1057, 1058, 1097, 1100};
	/** Выполнено */
	public static final int[] DST_STATES_FINISHED = {1111, 1112}; //{1108}; //{1109}; //{48, 57, 1050, 1055};
	/** Отменено */
	public static final int[] DST_STATES_CANCELED = {1106}; //{1000};

	/** Отмена регистрации услуги (S) в DocFlow */
	public static final int[] DST_STATES_CANCELED_IN_DOCFLOW = {1104, 1106};


	public int addPackPP(CNPack pack) throws PersistenceException {

		return addPackPP(pack, null);

	}

    public int addPackPP(CNPack pack, DFDocSupplyEE docSupplyEE) throws PersistenceException
        {
    		boolean isFromSite = false;

    		if (docSupplyEE != null && docSupplyEE.isFromSite == 1) {
    			isFromSite = true;
    		}

            PreparedStatement statement = null;
            ResultSet  set = null;
            String ssPrefix = null; //Префикс инициализируется пустым, поскольку функция addPackPP вызывается
            //при создании пакетов в подсистемах WorkFlow ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ БЫТОВЫМ И ПРОМЫШЛЕННЫМ ПОТРЕБИТЕЛЕЙ
            if (pack.packCode == Integer.MIN_VALUE)
            {

                if (pack.subsystemRef.code == CNSubsystemType.SS_PHYSICALPERSON )	//ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ
                    {                                                               //ПОТРЕБИТЕЛЯМ БЫТОВОГО СЕКТОРА
                      pack.packCode = getPKFor("cn.sq_pp_packages");

                      if (pack.startState == Integer.MIN_VALUE)	 //NET-4328. Условие обеспечивает гибкость
                        { //комплекса EnergyWorkFlow - для возможности задания клиентом начального состояния
	                      if (pack.id_ren == CNPack.HGES_ID_REN) //для ХГЭС своя цепочка
	                      {
	                        if (pack.is_ksoe == 3)         	//SUPP-24301. Упрощённое 10.10.2014 г. Заключение нового договора
	                            {pack.startState = 13501;}  //по инициативе потребителя Деловодом Єдиного Окна ХГЭС;
	                        else if (pack.is_ksoe == 2)     //Перезаключение договора
	                            {pack.startState = 12001;}  //по инициативе поставщика Начальником участка ХГЭС;
							else if (pack.is_ksoe == 5)     //Изменение тарифа в ХГЭС
	                            {pack.startState = 13701;}
	                      }
	                      else
	                      {
	                        if (pack.is_ksoe == 1)         	//Заключение нового договора
	                            {pack.startState = 11001;}  //по инициативе потребителя Канцелярией РЭС;
	                        else if (pack.is_ksoe == 0)   	//Перезаключение договора;
	                            {pack.startState = 10001;}  //по инициативе поставщика Начальником Абонентской Группы РЭС-а;
							else if (pack.is_ksoe == 4)     //Изменение тарифа в РЭС
	                            {pack.startState = 13801;}
	                      }
                        }

                      ssPrefix = "pp";

                    }
                else if (pack.subsystemRef.code == CNSubsystemType.SS_SUPPLY )	//NET-4328. ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ
                  {                                                             //ПОТРЕБИТЕЛЯМ ЮРИДИЧЕСКОГО СЕКТОРА
                    pack.packCode = getPKFor("cn.sq_spl_packages");

                    if (pack.startState == Integer.MIN_VALUE)	//NET-4328. Условие обеспечивает гибкость
                      { //комплекса EnergyWorkFlow - для возможности задания клиентом начального состояния
	                    if (pack.id_ren == CNPack.HGES_ID_REN) //бизнес-процесс для ХГЭС несколько отличается
	                    {
	                      if (pack.is_new == 1)        	//Заключение Канцелярией ХОЭ нового договора
	                        {pack.startState = 1001;}	//с юридическим лицом о поставке электроэнергии;
	                      else                          //Перезаключение Заместителем начальника ХГЭС (Старшим инспектором)
	                        {pack.startState = 1056;}   //договора с юридическим лицом о поставке электроэнергии;
	                    }
	                    else
	                    {
	                      if (pack.is_new == 1)			//Заключение Канцелярией РЭС нового договора
	                        {pack.startState = 1;}		//с юридическим лицом о поставке электроэнергии;
	                      else                          //Перезаключение Заместителем начальника РЭС (Старшим инспектором)
	                        {pack.startState = 55;}		//договора с юридическим лицом о поставке электроэнергии.
	                    }
                      }
                    ssPrefix = "spl";

                }
                else if (pack.subsystemRef.code == CNSubsystemType.SS_DISTRIBUTION ) // РАСПРЕДЕЛЕНИЕ Э/Э
                {
                  pack.packCode = getPKFor("cn.sq_dst_packages");

                  if (pack.startState == Integer.MIN_VALUE)	//NET-4328. Условие обеспечивает гибкость
                    { //комплекса EnergyWorkFlow - для возможности задания клиентом начального состояния

                	  /*
                	  if (pack.id_ren == CNPack.HGES_ID_REN) //бизнес-процесс для ХГЭС несколько отличается
	                    {
	                      if (pack.is_new == 1)        	//Заключение Канцелярией ХОЭ нового договора
	                      {                             //с юридическим лицом о поставке электроэнергии;
	                    	  if (pack.status == 0 && isFromSite) {   // для юр. лиц сразу кидаем на Нач. договорного отдела (при создании через сайт)
	                    		  pack.startState = 1011;
	                    	  } else {
	                    		  pack.startState = 1001;
	                    	  }
	                      }
	                      else                          //Перезаключение Заместителем начальника ХГЭС (Старшим инспектором)
	                        {pack.startState = 1056;}   //договора с юридическим лицом о поставке электроэнергии;
	                    }
	                    else
	                    {
	                      if (pack.is_new == 1)			//Заключение Канцелярией РЭС нового договора
	                        {pack.startState = 1;}		//с юридическим лицом о поставке электроэнергии;
	                      else                          //Перезаключение Заместителем начальника РЭС (Старшим инспектором)
	                        {pack.startState = 55;}		//договора с юридическим лицом о поставке электроэнергии.
	                    }
	                    */

                	  	pack.startState = 1101;

                    }

                  ssPrefix = "dst";

              }
                else
                {throw new SystemException("Неизвестна подсистема EnergyWorkFlow");}
            }

            String ins_pack_sql = "";

            if (pack.subsystemRef.code == CNSubsystemType.SS_DISTRIBUTION && docSupplyEE != null) {

            	ins_pack_sql = "INSERT INTO cn." + ssPrefix + "_packages (" +
                        "id,  " +
                        "name, " +
                        "adres_jur, " +
                        "adres, " +
                        "purpose, " +
                        "business_type, " +
                        "reg_num_spl_contract, " +
                        "letter_num_customer," +
                        "letter_num," +
                        "date_spl_contract," +
                        "date_letter_customer," +
                        "date_letter," +
                        "power," +
                        "is_ksoe," +
                        "status," +
                        "id_ren," +
                        "id_pack_status," +
                        "id_waiting_status," +
                        "over150," +
                        "id_district, " +

                        "customerokpo, " +
                        "taxnumber, " +
                        "certificatenumber, " +
                        "eic, " +
                        "ownersnumber, " +
                        "isworking, " +
                        "phasenumber, " +
                        "recordpointstatus, " +
                        "customerstatus, " +
                        "customerregaddress, " +
                        "customeridcode, " +
                        "customerfio, " +
                        "customeraccount, " +
                        "powerreduction, " +
                        "bankinfo, " +
                        "actualaddress, " +
                        "contracttype, " +
                        "isprom, " +
                        "isfromsite, " +
                        "customerpassport, " +
                        "customeremail, " +
                        "description, " +
                        "phone_number, " +
                        "basistype, " +
                        "isuniversalservice, " +
                        "commercialofferrefcode) " +


                        "VALUES ( " +
                            "?, " + //id
                            "?, " + //name
                            "?, " + //adres_jur
                            "?, " + //adres
                            "?, " + //purpose
                            "?, " + //business_type
                            "?, " + //reg_num_spl_contract
                            "?, " + //letter_num_customer
                            "?, " + //letter_num
                            "?, " + //date_spl_contract
                            "?, " + //date_letter_customer
                            "?, " + //date_letter
                            "?, " + //power
                            "?, " + //is_ksoe
                            "?, " + //status
                            "?, " + //id_ren
                            "?, " + //id_pack_status
                            "?, " + //id_waiting_status
                            "?, " + //over150
                            "?, " + //id_district

			                "?, " + //customerokpo
			                "?, " + //taxnumber
			                "?, " + //certificatenumber
			                "?, " + //eic
			                "?, " + //ownersnumber
			                "?, " + //isworking
			                "?, " + //phasenumber
			                "?, " + //recordpointstatus
			                "?, " + //customerstatus
			                "?, " + //customerregaddress
			                "?, " + //customeridcode
			                "?, " + //customerfio
			                "?, " + //customeraccount
			                "?, " + //powerreduction
			                "?, " + //bankinfo
			                "?, " + //actualaddress
			                "?, " + //contracttype
			                "?, " + //isprom
			                "?, " + //isfromsite
			                "?, " + //customerpassport
			                "?, " + //customeremail
			                "?, " + //description
			                "?, " + //phone_number
			                "?, " + //basistype
			                "?, " + //isuniversalservice
			                "?) ";  //commercialofferrefcode

            } else {

            	ins_pack_sql = "INSERT INTO cn." + ssPrefix + "_packages (" +
                        "id,  " +
                        "name, " +
                        "adres_jur, " +
                        "adres, " +
                        "purpose, " +
                        "business_type, " +
                        "reg_num_spl_contract, " +
                        "letter_num_customer," +
                        "letter_num," +
                        "date_spl_contract," +
                        "date_letter_customer," +
                        "date_letter," +
                        "power," +
                        "is_ksoe," +
                        "status," +
                        "id_ren," +
                        "id_pack_status," +
                        "id_waiting_status," +
                        "over150," +
                        "id_district)" +


                        "VALUES ( " +
                            "?, " + //id
                            "?, " + //name
                            "?, " + //adres_jur
                            "?, " + //adres
                            "?, " + //purpose
                            "?, " + //business_type
                            "?, " + //reg_num_spl_contract
                            "?, " + //letter_num_customer
                            "?, " + //letter_num
                            "?, " + //date_spl_contract
                            "?, " + //date_letter_customer
                            "?, " + //date_letter
                            "?, " + //power
                            "?, " + //is_ksoe
                            "?, " + //status
                            "?, " + //id_ren
                            "?, " + //id_pack_status
                            "?, " + //id_waiting_status
                            "?, " + //over150
                            "?) "; //id_district
            }


            try
            {
                statement = connection.prepareStatement(ins_pack_sql);
                statement.setInt(1, pack.packCode);
                statement.setString(2, pack.name);
                statement.setString(3, pack.address_jur);
                statement.setString(4, pack.address);
                statement.setString(5, pack.purpose);
                statement.setString(6, pack.business_type);

                statement.setString(7, pack.reg_num_spl_pp_contract);
                if (pack.subsystemRef.code == CNSubsystemType.SS_DISTRIBUTION && docSupplyEE != null) {
                	if (pack.reg_num_spl_pp_contract == null || pack.reg_num_spl_pp_contract.equals("")) {
                		statement.setString(7, docSupplyEE.customerAccount);
                	}
                }

                statement.setString(8, pack.letter_num_customer);
                statement.setString(9, pack.letter_num);

                if (pack.date_spl_pp_contract == null)
                    statement.setDate(10, null);
                    else
                    statement.setDate(10, new java.sql.Date(pack.date_spl_pp_contract.getTime()));

                if (pack.date_letter_customer == null)
                    statement.setDate(11, null);
                    else
                    statement.setDate(11, new java.sql.Date(pack.date_letter_customer.getTime()));

                if (pack.date_letter == null)
                    statement.setDate(12, null);
                    else
                    statement.setDate(12, new java.sql.Date(pack.date_letter.getTime()));

                if (pack.power != null)
                    pack.power = pack.power.setScale(13,
                        java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(13, pack.power);

                if (pack.is_ksoe != Integer.MIN_VALUE )
                    statement.setInt(14, pack.is_ksoe);
                    else
                    statement.setNull(14, java.sql.Types.INTEGER);

                if (pack.status != Integer.MIN_VALUE )
                    statement.setInt(15, pack.status);
                    else
                    statement.setNull(15, java.sql.Types.INTEGER);

                if (pack.id_ren != Integer.MIN_VALUE )
                    statement.setInt(16, pack.id_ren);
                    else
                    statement.setNull(16, java.sql.Types.INTEGER);

                if (pack.id_pack_status != Integer.MIN_VALUE )
                    statement.setInt(17, pack.id_pack_status);
                    else
                    statement.setNull(17, java.sql.Types.INTEGER);

                if (pack.id_waiting_status != Integer.MIN_VALUE )
                    statement.setInt(18, pack.id_waiting_status);
                    else
                    statement.setNull(18, java.sql.Types.INTEGER);

                if (pack.over150 != Integer.MIN_VALUE )
                    statement.setInt(19, pack.over150);
                    else
                    statement.setNull(19, java.sql.Types.INTEGER);

                if (pack.id_district != Integer.MIN_VALUE )
                    statement.setInt(20, pack.id_district);
                    else
                    statement.setNull(20, java.sql.Types.INTEGER);

                if (pack.subsystemRef.code == CNSubsystemType.SS_DISTRIBUTION && docSupplyEE != null) {

        			if (! isFromSite) {

	        			if (docSupplyEE.eic != null && !docSupplyEE.eic.equals("") && !docSupplyEE.eic.contains(",")) {
	        				CallCenterLogic ccLogic = new CallCenterLogic(connection, userProfile);

	        				CCRecordPointFilter ccRecordPointFilter = new CCRecordPointFilter();
	        				ccRecordPointFilter.eic = docSupplyEE.eic;

	        				CCRecordPointShort ccRecordPointShort = null;

	        				// 21.01.2019 Если не нашли, не ругаемся (SUPP-78815)
	        				ccRecordPointShort = ccLogic.getCCRecordPointShort(ccRecordPointFilter, false);

	        				if (ccRecordPointShort != null) {
	        					docSupplyEE.isWorking = ccRecordPointShort.isWorking;
	        					docSupplyEE.phaseNumber = ccRecordPointShort.phaseNumber;
	        					if (docSupplyEE.phaseNumber > 0) {
	        						docSupplyEE.voltageNominal = docSupplyEE.phaseNumber == 1 ? 220 : 380;
	        					}
	        					docSupplyEE.recordPointStatus = ccRecordPointShort.statustxt;
	        					docSupplyEE.customerStatus = ccRecordPointShort.customerRefStatustxt;
	        				} else {
	        					// 11.01.2019 Для договоров с типом "Новий власник" пока не проверяем,
	        					// т.к. для некоторых случаев на момент создания пакета в CCRecordPoint
	        					// еще нет данных (потому что карточка в биллинг заносится тут же деловодом
	        					// и данные перельются в коллцентровскую таблицу позже)
	        					// 21.01.2019 Не проверяем вообще (SUPP-78815)
	        					//if (docSupplyEE.contractType != DFDocSupplyEE.CONTRACTTYPE_NEW_OWNER) {
	        					//	throw new SystemException("\n\nНе знайдено точку обліку з EIC \"" + docSupplyEE.eic + "\" !");
	        					//}
	        				}
	        			}

        			}

        			statement.setString(21, docSupplyEE.customerOkpo);
        			statement.setString(22, docSupplyEE.taxNumber);
        			statement.setString(23, docSupplyEE.certificateNumber);
        			statement.setString(24, docSupplyEE.eic);
        			if (docSupplyEE.ownersNumber != Integer.MIN_VALUE ) {
        				statement.setInt(25, docSupplyEE.ownersNumber);
        			} else {
        				statement.setNull(25, java.sql.Types.INTEGER);
        			}
        			if (docSupplyEE.isWorking != Integer.MIN_VALUE ) {
        				statement.setInt(26, docSupplyEE.isWorking);
        			} else {
        				statement.setNull(26, java.sql.Types.INTEGER);
        			}
        			if (docSupplyEE.phaseNumber != Integer.MIN_VALUE ) {
        				statement.setInt(27, docSupplyEE.phaseNumber);
        			} else {
        				statement.setNull(27, java.sql.Types.INTEGER);
        			}
        			statement.setString(28, docSupplyEE.recordPointStatus);
        			statement.setString(29, docSupplyEE.customerStatus);

        			statement.setString(30, docSupplyEE.customerRegAddress);
        			statement.setString(31, docSupplyEE.customerIdCode);
        			statement.setString(32, docSupplyEE.customerFIO);

        			String customerAccount = (docSupplyEE.customerAccount == null ? "" : docSupplyEE.customerAccount);
        			if (docSupplyEE.personalAccountNumber != null && !docSupplyEE.personalAccountNumber.equals("")) {
        				customerAccount = docSupplyEE.customerAccount + " / " + docSupplyEE.personalAccountNumber;
        			}
        			statement.setString(33, customerAccount);

        			if (docSupplyEE.powerReduction != null) {
        				docSupplyEE.powerReduction = docSupplyEE.powerReduction.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
        			}
        			statement.setBigDecimal(34, docSupplyEE.powerReduction);
        			statement.setString(35, docSupplyEE.bankInfo);
        			statement.setString(36, docSupplyEE.actualAddress);
        			if (docSupplyEE.contractType != Integer.MIN_VALUE ) {
        				statement.setInt(37, docSupplyEE.contractType);
        			} else {
        				statement.setNull(37, java.sql.Types.INTEGER);
        			}
        			if (docSupplyEE.isProm != Integer.MIN_VALUE ) {
        				statement.setInt(38, docSupplyEE.isProm);
        			} else {
        				statement.setNull(38, java.sql.Types.INTEGER);
        			}
        			if (docSupplyEE.isFromSite != Integer.MIN_VALUE ) {
        				statement.setInt(39, docSupplyEE.isFromSite);
        			} else {
        				statement.setNull(39, java.sql.Types.INTEGER);
        			}

        			statement.setString(40, docSupplyEE.customerPassport);
        			if (docSupplyEE.doc != null) {
	        			statement.setString(41, docSupplyEE.doc.customerEmail);
	        			statement.setString(42, docSupplyEE.doc.description);
        			} else {
        				statement.setString(41, "");
	        			statement.setString(42, "");
        			}
        			statement.setString(43, pack.phone);

        			if (docSupplyEE.basisType != Integer.MIN_VALUE ) {
        				statement.setInt(44, docSupplyEE.basisType);
        			} else {
        				statement.setNull(44, java.sql.Types.INTEGER);
        			}

        			if (docSupplyEE.isUniversalService != Integer.MIN_VALUE ) {
        				statement.setInt(45, docSupplyEE.isUniversalService);
        			} else {
        				statement.setNull(45, java.sql.Types.INTEGER);
        			}

        			if (docSupplyEE.commercialOfferRef != null) {
            			if (docSupplyEE.commercialOfferRef.code != Integer.MIN_VALUE ) {
            				statement.setInt(46, docSupplyEE.commercialOfferRef.code);
            			} else {
            				statement.setNull(46, java.sql.Types.INTEGER);
            			}
        			}

                }

                statement.execute();
            }
            catch(SQLException e)
            {
                System.out.println(e.getMessage()+"\nstatement - " + ins_pack_sql);
                EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            }
            finally
            {
            try {if (set != null) set.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
            statement = null;
            }

            String ins_movement_sql =
            "insert into cn." + ssPrefix + "_movement (" +
                "id_pack, " +
                "id_state, " +
                "startdate, " +
                "note, " +
                "is_completed,  " +
                "id_movement_status, " +
                "id_user_created) " +
            "values (?,?,?,?,?,?,?)";
            try
            {
                statement = connection.prepareStatement(ins_movement_sql);
                statement.setInt(1, pack.packCode);
                statement.setInt(2, pack.startState);
                statement.setTimestamp(3,new java.sql.Timestamp(new Date().getTime()));
                statement.setString(4, pack.commentGen);
                statement.setInt(5, 0);
                statement.setInt(6, 1);
                statement.setInt(7, pack.userCode);

                statement.execute();

            }
            catch(SQLException e)
            {
                System.out.println(e.getMessage()+"\nstatement - " + ins_pack_sql);
                EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            }
            finally
            {
            try {if (set != null) set.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
            statement = null;
            try {if (connection != null) connection.close();}   catch (SQLException e) {}
            }

            return pack.packCode;
        }


	public int addPackCN(CNPack pack) throws PersistenceException {
		return addPackCN(pack, false);
	}

	public int addPackCN(CNPack pack, boolean fromSite) throws PersistenceException {
		// int pack_id = Integer.MIN_VALUE;

		PreparedStatement statement = null;
		ResultSet set = null;

		CNPack2Site pack2Site = new CNPack2Site();
		CNTechTerms techTerms = new CNTechTerms();

        if (pack.packCode == Integer.MIN_VALUE)
        {
            techTerms.tension_point = pack.tension_point;
            techTerms.baseStation = pack.baseStation;
			if (pack.is_reg != Integer.MIN_VALUE)
			  {pack2Site.is_reg = pack.is_reg;}
			pack2Site.customeremail = pack.customeremail;
			pack2Site.phone = pack.phone;
			pack2Site.customertype = pack.status;

            switch (pack.subsystemRef.code) {
            case CNSubsystemType.SS_CONNECTION: //Присоединение
                {
                    pack.packCode = getPKFor("cn.sq_cn_packages");
                    techTerms.code = getPKFor("cn.sq_cn_techterms");
                    break;
                }
            case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
                {
                    pack.packCode = getPKFor("cn.sq_ncn_packages");
                    techTerms.code = getPKFor("cn.sq_ncn_techterms");
                    break;
                }
            case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
                {
                    pack.packCode = getPKFor("cn.sq_cn_20110314_packages");
                    techTerms.code = getPKFor("cn.sq_cn_20110314_techterms");
                    break;
                }
            case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
                {
                    pack.packCode = getPKFor("cn.sq_eap_packages");
                    techTerms.code = getPKFor("cn.sq_eap_techterms");
                    break;
                }
			case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: // Присоединение с 19.04.2018 г.
			    {
				    pack.packCode = getPKFor("cn.sq_adso_packages");
				    techTerms.code = getPKFor("cn.sq_adso_techterms");
				    break;
			    }

            default:
                {throw new SystemException("Неизвестна подсистема EnergyWorkFlow");}
            }
            //techTerms.cnPackRef.code = pack.packCode;
        }

        /*
        if (pack.power != null)
          {
            if (pack.power.doubleValue() > 5)
            {pack.over5 = 1;}
            else
            {pack.over5 = 0;}
          }
        else
          {pack.over5 = 0;}

        if (pack.over5 == 0)
          {
            if (pack.power.doubleValue() > 5)
            {pack.over5 = 1;}
            else if (((pack.status == 0) && (pack.id_ren == 9)) ||
                (pack.status == ENServicesContragentType.PHYSICAL_NOREZIDENT) ||
                (pack.status == ENServicesContragentType.JURIDICAL_NOREZIDENT) ||
                (pack.tension_point.doubleValue() >= 6000))
            {pack.over5 = 1;}
            else if (pack.baseStation != Integer.MIN_VALUE)
              {
                if (pack.baseStation == 1)
                  {pack.over5 = 1;}
                else
                  {pack.over5 = 0;}
              }
            else
            {pack.over5 = 0;}
            if (pack.over5 ==0 && pack.isSea != Integer.MIN_VALUE)
              {
                if (pack.isSea == 1)
                  {pack.over5 = 1;}
                else
                {pack.over5 = 0;}
              }

          }
         */

        /*
        switch (pack.subsystemRef.code) {
        case CNSubsystemType.SS_CONNECTION: //Присоединение
            {
                if (pack.over5 == 1)
                {pack.startState = 1000001;}
                else
                {pack.startState = 2000001;}
                break;
            }
        case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
            {
                if (pack.over5 == 1)
                {pack.startState = 1000001;}
                else
                {pack.startState = 2000001;}
                pack.packCode = getPKFor("cn.sq_ncn_packages");
                break;
            }
        case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
            {
                if (pack.over5 == 1)
                {pack.startState = 1000001;}
                else
                {pack.startState = 2000001;}
                pack.packCode = getPKFor("cn.sq_cn_20110314_packages");
                break;
            }
        case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
            {
                if (pack.over5 == 1)
                {pack.startState = 1050001;}
                else
                    {pack.startState = 2050001;}
                pack.packCode = getPKFor("cn.sq_eap_packages");
                break;
            }


		case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
		{

			if (pack.over5 == 0) {
				pack.startState = 1;
			}

			pack.packCode = getPKFor("cn.sq_adso_packages");

		  break;
		}



        default:
            {

            if (pack.power.doubleValue() > 5)
                {pack.startState = 1000001;}
            else
                {pack.startState = 2000001;}
            pack.packCode = getPKFor("cn.sq_cn_20110314_packages");
            break;
            }
        }
        */

        if (pack.subsystemRef.code != CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER) {
        	throw new SystemException("\n\nНедопустимый код подсистемы EnergyWorkFlow: " + pack.subsystemRef.code + " !");
        } else {
        	pack.packCode = getPKFor("cn.sq_adso_packages");
        }

        /**  при создании пакета с сайта всегда деловод единого окна...  */
        if (fromSite) {
        	pack.startState = 101;
        }


        String ssPrefix = null;
        String purpField = null;

        switch (pack.subsystemRef.code) {
        case CNSubsystemType.SS_CONNECTION: //Присоединение
            {
            ssPrefix = "cn";
            purpField = "purpose";
            break;
            }
        case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
            {
            ssPrefix = "ncn";
            purpField = "purpose";
            break;
            }
        case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
            {
            ssPrefix = "cn_20110314";
            purpField = "description";
            break;
            }
        case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
            {
            ssPrefix = "eap";
            purpField = "description";
            break;
            }
		case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: // Присоединение с 19.04.2018 г.
		{
			ssPrefix = "adso";
			purpField = "description";
			break;
		}

        default:
            {throw new SystemException("Неизвестна подсистема EnergyWorkFlow");}
        }

        String ins_pack_sql = "INSERT INTO cn." + ssPrefix + "_packages (" +
            "id, " +
            "name, " +
            "id_ren, " +
            "id_district, " +
            "id_pack_status, " +
            purpField + ", " +
            "power, " +
            "adres, " +
            "reg_num_cn_contract, " +
            "date_cn_contract, " +
            "reg_num_tu_contract, " +
            "date_tu_contract, " +
            "reg_num_tu_creation_contract, " +
            "date_tu_creation_contract, " +
            "project_num, " +
            "project_date, " +
            "over5, " +
            "status, " +
            "letter_num_customer, " +
            "date_letter_customer, " +
            "letter_num, " +
            "date_letter, " +
            "reliability_class, " +
            "id_waiting_status, " +
            "is_payable, " +
            "worksize, " +
            "work_inc_net, " +
            "estimateterm, " +
            "estimatedate, " +
            "buildingterm, " +
            "buildingdate, " +
            "buyingterm, " +
            "buyingdate, " +
            "estimate_num, " +
            "estimate_contract_date, " +
            "is_reserv, " +
            "price)  " +

        "VALUES ( " +
            "?, " + //id
            "?, " + //name
            "?, " + //id_ren
            "?, " + //id_district
            "?, " + //id_pack_status
            "?, " + //description
            "?, " + //power
            "?, " + //adres
            "?, " + //reg_num_cn_contract
            "?, " + //date_cn_contract
            "?, " + //reg_num_tu_contract
            "?, " + //date_tu_contract
            "?, " + //reg_num_tu_creation_contract
            "?, " + //date_tu_creation_contract
            "?, " + //project_num
            "?, " + //project_date
            "?, " + //over5
            "?, " + //status
            "?, " + //letter_num_customer
            "?, " + //date_letter_customer
            "?, " + //letter_num
            "?, " + //date_letter
            "?, " + //reliability_class
            "?, " + //id_waiting_status
            "?, " + //is_payable
            "?, " + //worksize
            "?, " + //work_inc_net
            "?, " + //estimateterm
            "?, " + //estimatedate
            "?, " + //buildingterm
            "?, " + //buildingdate
            "?, " + //buyingterm
            "?, " + //buyingdate
            "?, " + //estimate_num
            "?, " + //estimate_contract_date
            "?, " + //is_reserv
            "?)";   //price

        try
        {
            statement = connection.prepareStatement(ins_pack_sql);
            statement.setInt(1, pack.packCode);
            statement.setString(2, pack.name);

            if (pack.id_ren != Integer.MIN_VALUE )
            statement.setInt(3, pack.id_ren);
            else
            statement.setNull(3, java.sql.Types.INTEGER);

            if (pack.id_district != Integer.MIN_VALUE )
            statement.setInt(4, pack.id_district);
            else
            statement.setNull(4, java.sql.Types.INTEGER);

            /** 28.03.2018 +++  по умолчанию = 1  */
            if (pack.id_pack_status == Integer.MIN_VALUE) {
            	pack.id_pack_status = DFPackStatus.ACTIVE;
            }

            statement.setInt(5, pack.id_pack_status);

            statement.setString(6, pack.description);

            if (pack.power != null)
            pack.power = pack.power.setScale(7,
                java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(7, pack.power);

            statement.setString(8, pack.address);

            statement.setString(9, pack.reg_num_cn_contract);

            if (pack.date_cn_contract == null)
            statement.setDate(10, null);
            else
            statement.setDate(10, new java.sql.Date(pack.date_cn_contract.getTime()));

            statement.setString(11, pack.reg_num_tu_contract);

            if (pack.date_tu_contract == null)
            statement.setDate(12, null);
            else
            statement.setDate(12, new java.sql.Date(pack.date_tu_contract.getTime()));

            statement.setString(13, pack.reg_num_tu_cr_contract);

            if (pack.date_tu_cr_contract == null)
            statement.setDate(14, null);
            else
            statement.setDate(14, new java.sql.Date(pack.date_tu_cr_contract.getTime()));

            statement.setString(15, pack.project_num);

            if (pack.project_date == null)
            statement.setDate(16, null);
            else
            statement.setDate(16, new java.sql.Date(pack.project_date.getTime()));

            if (pack.over5 != Integer.MIN_VALUE )
            statement.setInt(17, pack.over5);
            else
            statement.setNull(17, java.sql.Types.INTEGER);

            if (pack.status != Integer.MIN_VALUE )
            statement.setInt(18, pack.status);
            else
            statement.setNull(18, java.sql.Types.INTEGER);

            statement.setString(19, pack.letter_num_customer);

            if (pack.date_letter_customer == null)
            statement.setDate(20, null);
            else
            statement.setDate(20, new java.sql.Date(pack.date_letter_customer.getTime()));

            statement.setString(21, pack.letter_num);

            if (pack.date_letter == null)
            statement.setDate(22, null);
            else
            statement.setDate(22, new java.sql.Date(pack.date_letter.getTime()));

            statement.setString(23, pack.reliability_class);

            if (pack.id_waiting_status != Integer.MIN_VALUE )
            statement.setInt(24, pack.id_waiting_status);
            else
            statement.setNull(24, java.sql.Types.INTEGER);

            if (pack.is_payable != Integer.MIN_VALUE )
            statement.setInt(25, pack.is_payable);
            else
            statement.setNull(25, java.sql.Types.INTEGER);

            statement.setString(26, pack.worksize);

            statement.setString(27, pack.work_inc_net);

            if (pack.estimateterm != Integer.MIN_VALUE )
            statement.setInt(28, pack.estimateterm);
            else
            statement.setNull(28, java.sql.Types.INTEGER);

            if (pack.estimatedate == null)
            statement.setDate(29, null);
            else
            statement.setDate(29, new java.sql.Date(pack.estimatedate.getTime()));

            if (pack.buildingterm != Integer.MIN_VALUE )
            statement.setInt(30, pack.buildingterm);
            else
            statement.setNull(30, java.sql.Types.INTEGER);

            if (pack.buildingdate == null)
            statement.setDate(31, null);
            else
            statement.setDate(31, new java.sql.Date(pack.buildingdate.getTime()));

            if (pack.buyingterm != Integer.MIN_VALUE )
            statement.setInt(32, pack.buyingterm);
            else
            statement.setNull(32, java.sql.Types.INTEGER);

            if (pack.buyingdate == null)
            statement.setDate(33, null);
            else
            statement.setDate(33, new java.sql.Date(pack.buyingdate.getTime()));

            statement.setString(34, pack.estimate_num);

            if (pack.estimate_contract_date == null)
            statement.setDate(35, null);
            else
            statement.setDate(35, new java.sql.Date(pack.estimate_contract_date.getTime()));

            if (pack.is_reserv != Integer.MIN_VALUE)
            statement.setInt(36, pack.is_reserv);
            else
            statement.setNull(36, java.sql.Types.INTEGER);

            if (pack.price != null)
            pack.price = pack.price.setScale(37,
                java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(37, pack.price);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + ins_pack_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        String ins_techterms_sql =
        "insert into cn." + ssPrefix + "_techterms (" +
            "id, " +
            "id_pack, " +
            "tension_point, " +
            "basestation) " +
        "values (?,?,?,?)";

        try
        {
            statement = connection.prepareStatement(ins_techterms_sql);
            statement.setInt(1, techTerms.code);
            statement.setInt(2, pack.packCode);
            if (techTerms.tension_point != null)
            {
                techTerms.tension_point = techTerms.tension_point.setScale(3,
                java.math.BigDecimal.ROUND_HALF_UP);
            }
            statement.setBigDecimal(3, techTerms.tension_point);
            statement.setInt(4, techTerms.baseStation);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + ins_pack_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        };

		String ins_pack2site_sql =
		  "INSERT INTO cn.pack2site (id, " +
		    "id_pack, id_subsystem, is_reg, customeremail, phone, customertype) " +
		  "VALUES ((select coalesce(max(id), 0) + 1 from cn.pack2site), " +
		    "?, ?, ?, ?, ?, ?);";

        try
        {
            statement = connection.prepareStatement(ins_pack2site_sql);
            statement.setInt(1, pack.packCode);
			statement.setInt(2, pack.subsystemRef.code);
			statement.setInt(3, pack2Site.is_reg);
			statement.setString(4, pack2Site.customeremail);
			statement.setString(5, pack2Site.phone);
			statement.setInt(6, pack2Site.customertype);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + ins_pack_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        };

        String ins_movement_sql =
        "insert into cn." + ssPrefix + "_movement (" +
            "id_pack, " +
            "id_state, " +
            "startdate, " +
            "note, " +
            "is_completed,  " +
            "id_movement_status, " +
            "id_user_created) " +
        "values (?,?,?,?,?,?,?)";
        try
        {
            statement = connection.prepareStatement(ins_movement_sql);
            statement.setInt(1, pack.packCode);
            statement.setInt(2, pack.startState);
            statement.setDate(3, new java.sql.Date( new Date().getTime()));
            statement.setString(4, pack.commentGen);
            statement.setInt(5, 0);
            statement.setInt(6, 1);
            statement.setInt(7, pack.userCode);

            statement.execute();

        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + ins_pack_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        try {if (connection != null) connection.close();}   catch (SQLException e) {}
        }

        return pack.packCode;
    }

    public int savePackCN(CNPack pack) throws PersistenceException {

        PreparedStatement statement = null;
        ResultSet  set = null;

        if (pack.power != null)
        {
            if (pack.power.doubleValue() > 5)
            {pack.over5 = 1;}
            else
            {pack.over5 = 0;}
        }
        else
        {pack.over5 = 0;}

        if (pack.over5 == 0)
        {
            if (((pack.status == 0) && (pack.id_ren == 9)) ||
                    (pack.status == ENServicesContragentType.PHYSICAL_NOREZIDENT) ||
                    (pack.status == ENServicesContragentType.JURIDICAL_NOREZIDENT) ||
                    (pack.tension_point.doubleValue() >= 6000))
            {pack.over5 = 1;}
            else if (pack.baseStation != Integer.MIN_VALUE)
            {
                if (pack.baseStation == 1)
                {pack.over5 = 1;}
                else
                {pack.over5 = 0;}
            }
            else
            {pack.over5 = 0;}
        }

        String ssPrefix = null;
        String purpField = null;

        switch (pack.subsystemRef.code) {
        case CNSubsystemType.SS_CONNECTION: //Присоединение
            {
            ssPrefix = "cn";
            purpField = "purpose";
            break;
            }
        case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
            {
            ssPrefix = "ncn";
            purpField = "purpose";
            break;
            }
        case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
            {
            ssPrefix = "cn_20110314";
            purpField = "description";
            break;
            }
        case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
            {
            ssPrefix = "eap";
            purpField = "description";
            break;
            }
		case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
            {
            ssPrefix = "adso";
            purpField = "description";
            break;
            }
        default:
            {throw new SystemException("Неизвестна подсистема EnergyWorkFlow");}
        }

        String upd_pack_sql = "UPDATE cn." + ssPrefix + "_packages SET " +
            "name = ?, " +
            "id_ren = ?, " +
            "id_district = ?, " +
            "id_pack_status = ?, " +
            purpField + " = ?, " +
            "power = ?, " +
            "adres = ?, " +
            "reg_num_cn_contract = ?, " +
            "date_cn_contract = ?, " +
            "reg_num_tu_contract = ?, " +
            "date_tu_contract = ?, " +
            "reg_num_tu_creation_contract = ?, " +
            "date_tu_creation_contract = ?, " +
            "project_num = ?, " +
            "project_date = ?, " +
            "over5 = ?, " +
            "status = ?, " +
            "letter_num_customer = ?, " +
            "date_letter_customer = ?, " +
            "letter_num = ?, " +
            "date_letter = ?, " +
            "reliability_class = ?, " +
            "id_waiting_status = ?, " +
            "is_payable = ?, " +
            "worksize = ?, " +
            "work_inc_net = ?, " +
            "estimateterm = ?, " +
            "estimatedate = ?, " +
            "buildingterm = ?, " +
            "buildingdate = ?, " +
            "buyingterm = ?, " +
            "buyingdate = ?, " +
            "estimate_num = ?, " +
            "estimate_contract_date = ?, " +
            "is_reserv = ?, " +
            "price = ? " +

        "WHERE id = ?";

        try
        {
            statement = connection.prepareStatement(upd_pack_sql);

            statement.setString(1, pack.name);

            if (pack.id_ren != Integer.MIN_VALUE )
            statement.setInt(2, pack.id_ren);
            else
            statement.setNull(2, java.sql.Types.INTEGER);

            if (pack.id_district != Integer.MIN_VALUE )
            statement.setInt(3, pack.id_district);
            else
            statement.setNull(3, java.sql.Types.INTEGER);

            if (pack.id_pack_status != Integer.MIN_VALUE )
            statement.setInt(4, pack.id_pack_status);
            else
            statement.setNull(4, java.sql.Types.INTEGER);

            statement.setString(5, pack.description);

            if (pack.power != null)
            pack.power = pack.power.setScale(6,
                java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(6, pack.power);

            statement.setString(7, pack.address);

            statement.setString(8, pack.reg_num_cn_contract);

            if (pack.date_cn_contract == null)
            statement.setDate(9, null);
            else
            statement.setDate(9, new java.sql.Date(pack.date_cn_contract.getTime()));

            statement.setString(10, pack.reg_num_tu_contract);

            if (pack.date_tu_contract == null)
            statement.setDate(11, null);
            else
            statement.setDate(11, new java.sql.Date(pack.date_tu_contract.getTime()));

            statement.setString(12, pack.reg_num_tu_cr_contract);

            if (pack.date_tu_cr_contract == null)
            statement.setDate(13, null);
            else
            statement.setDate(13, new java.sql.Date(pack.date_tu_cr_contract.getTime()));

            statement.setString(14, pack.project_num);

            if (pack.project_date == null)
            statement.setDate(15, null);
            else
            statement.setDate(15, new java.sql.Date(pack.project_date.getTime()));

            if (pack.over5 != Integer.MIN_VALUE )
            statement.setInt(16, pack.over5);
            else
            statement.setNull(16, java.sql.Types.INTEGER);

            if (pack.status != Integer.MIN_VALUE )
            statement.setInt(17, pack.status);
            else
            statement.setNull(17, java.sql.Types.INTEGER);

            statement.setString(18, pack.letter_num_customer);

            if (pack.date_letter_customer == null)
            statement.setDate(19, null);
            else
            statement.setDate(19, new java.sql.Date(pack.date_letter_customer.getTime()));

            statement.setString(20, pack.letter_num);

            if (pack.date_letter == null)
            statement.setDate(21, null);
            else
            statement.setDate(21, new java.sql.Date(pack.date_letter.getTime()));

            statement.setString(22, pack.reliability_class);

            if (pack.id_waiting_status != Integer.MIN_VALUE )
            statement.setInt(23, pack.id_waiting_status);
            else
            statement.setNull(23, java.sql.Types.INTEGER);

            if (pack.is_payable != Integer.MIN_VALUE )
            statement.setInt(24, pack.is_payable);
            else
            statement.setNull(24, java.sql.Types.INTEGER);

            statement.setString(25, pack.worksize);

            statement.setString(26, pack.work_inc_net);

            if (pack.estimateterm != Integer.MIN_VALUE )
            statement.setInt(27, pack.estimateterm);
            else
            statement.setNull(27, java.sql.Types.INTEGER);

            if (pack.estimatedate == null)
            statement.setDate(28, null);
            else
            statement.setDate(28, new java.sql.Date(pack.estimatedate.getTime()));

            if (pack.buildingterm != Integer.MIN_VALUE )
            statement.setInt(29, pack.buildingterm);
            else
            statement.setNull(29, java.sql.Types.INTEGER);

            if (pack.buildingdate == null)
            statement.setDate(30, null);
            else
            statement.setDate(30, new java.sql.Date(pack.buildingdate.getTime()));

            if (pack.buyingterm != Integer.MIN_VALUE )
            statement.setInt(31, pack.buyingterm);
            else
            statement.setNull(31, java.sql.Types.INTEGER);

            if (pack.buyingdate == null)
            statement.setDate(32, null);
            else
            statement.setDate(32, new java.sql.Date(pack.buyingdate.getTime()));

            statement.setString(33, pack.estimate_num);

            if (pack.estimate_contract_date == null)
            statement.setDate(34, null);
            else
            statement.setDate(34, new java.sql.Date(pack.estimate_contract_date.getTime()));

            if (pack.is_reserv != Integer.MIN_VALUE )
            statement.setInt(35, pack.is_reserv);
            else
            statement.setNull(35, java.sql.Types.INTEGER);

            if (pack.price != null)
            pack.price = pack.price.setScale(37,
                java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(36, pack.price);

            statement.setInt(37, pack.packCode);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + upd_pack_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }



        //PRIC-552. Обновление ТУ
        CNTechTerms techTerms = new CNTechTerms();
        techTerms.tension_point = pack.tension_point;
        techTerms.baseStation = pack.baseStation;

        String upd_techterms_sql = "UPDATE cn." + ssPrefix + "_techterms SET " +
        " tension_point = ?, " +
        " basestation = ? " +
        " WHERE id_pack = " + pack.packCode;
        try
        {
            statement = connection.prepareStatement(upd_techterms_sql);

            if (techTerms.tension_point != null)
            techTerms.tension_point = techTerms.tension_point.setScale(1,
                java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(1, techTerms.tension_point);

            if (techTerms.baseStation != Integer.MIN_VALUE )
            statement.setInt(2, techTerms.baseStation);
            else
            statement.setNull(2, java.sql.Types.INTEGER);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + upd_pack_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        return pack.code;
    }


    public int addMovement(CNMovement movement) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        String ssPrefix = null;

        switch (movement.subsystemRef.code) {
          case CNSubsystemType.SS_CONNECTION: //Присоединение
            {
                movement.id = getPKFor("cn.sq_cn_movement");
                ssPrefix = "cn";
                break;
            }
          case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
            {
                movement.id = getPKFor("cn.sq_ncn_movement");
                ssPrefix = "ncn";
                break;
            }
        case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
            {
                movement.id = getPKFor("cn.sq_cn_20110314_movement");
                ssPrefix = "cn_20110314";
                break;
            }
        case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
            {
                movement.id = getPKFor("cn.sq_eap_movement");
                ssPrefix = "eap";
                break;
            }
		case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
            {
                movement.id = getPKFor("cn.sq_adso_movement");
                ssPrefix = "adso";
                break;
            }
        default:
            {
            movement.id = getPKFor("cn.sq_adso_movement");
            ssPrefix = "adso";
            break;
            }
        }

        String ins_movement_sql = "INSERT INTO cn." + ssPrefix + "_movement (" +
            "id, " +
            "id_pack, " +
            "id_state, " +
            "startdate, " +
            "note, " +
            "id_parent, " +
            "id_user, " +
            "realdate, " +
            "canceled, " +
            "id_user_canceled, " +
            "canceleddate, " +
            "cancelednote, " +
            "is_completed, " +
            "id_movement_status, " +
            "addnote, " +
            "read_status, " +
            "id_user_read, " +
            "read_date, " +
            "id_user_created, " +
            "modifytime, " +
            "pastdate) " +

        "VALUES ( " +
            "?, " + //id,
                "?, " + //id_pack,
            "?, " + //id_state,
            "?, " + //startdate,
            "?, " + //note,
            "?, " + //id_parent,
            "?, " + //id_user,
            "?, " + //realdate,
            "?, " + //canceled,
            "?, " + //id_user_canceled,
            "?, " + //canceleddate,
            "?, " + //cancelednote,
            "?, " + //is_completed,
            "?, " + //id_movement_status,
            "?, " + //addnote,
            "?, " + //read_status,
            "?, " + //id_user_read,
            "?, " + //read_date,
            "?, " + //id_user_created,
            "?, " + //modifytime,
            "?)";   //pastdate

        try
        {
            statement = connection.prepareStatement(ins_movement_sql);
            statement.setInt(1, movement.id);
            statement.setInt(2, movement.id_pack);
            statement.setInt(3, movement.id_state);

            if (movement.startdate == null)
            statement.setDate(4, null);
            else
            statement.setDate(4, new java.sql.Date(movement.startdate.getTime()));

            statement.setString(5, movement.note);

            if (movement.id_parent == Integer.MIN_VALUE)
            {statement.setNull(6, java.sql.Types.INTEGER);}
            else
            {statement.setInt(6, movement.id_parent);}

            if (movement.id_user == Integer.MIN_VALUE)
            {statement.setNull(7, java.sql.Types.INTEGER);}
            else
            {statement.setInt(7, movement.id_user);}

            if (movement.realdate == null)
            statement.setDate(8, null);
            else
            statement.setDate(8, new java.sql.Date(movement.realdate.getTime()));

            if (movement.canceled == Integer.MIN_VALUE)
            {statement.setNull(9, java.sql.Types.INTEGER);}
            else
            {statement.setInt(9, movement.canceled);}

            if (movement.id_user_canceled == Integer.MIN_VALUE)
            {statement.setNull(10, java.sql.Types.INTEGER);}
            else
            {statement.setInt(10, movement.id_user_canceled);}

            if (movement.canceleddate == null)
            statement.setDate(11, null);
            else
            statement.setDate(11, new java.sql.Date(movement.canceleddate.getTime()));

            statement.setString(12, movement.cancelednote);

            if (movement.is_completed == Integer.MIN_VALUE)
            {statement.setInt(13, 0);}
            else
            {statement.setInt(13, movement.is_completed);}

            if (movement.id_movement_status == Integer.MIN_VALUE)
            {statement.setInt(14, 0);}
            else
            {statement.setInt(14, movement.id_movement_status);}

            statement.setString(15, movement.addnote);

            if (movement.read_status == Integer.MIN_VALUE)
            {statement.setInt(16, 0);}
            else
            {statement.setInt(16, movement.read_status);}

            if (movement.id_user_read == Integer.MIN_VALUE)
            {statement.setNull(17, java.sql.Types.INTEGER);}
            else
            {statement.setInt(17, movement.id_user_read);}

            if (movement.read_date == null)
            statement.setDate(18, null);
            else
            statement.setDate(18, new java.sql.Date(movement.read_date.getTime()));

            if (movement.id_user_created == Integer.MIN_VALUE)
            {statement.setNull(19, java.sql.Types.INTEGER);}
            else
            {statement.setInt(19, movement.id_user_created);}

            if (movement.modifytime == null)
            statement.setDate(20, null);
            else
            statement.setDate(20, new java.sql.Date(movement.modifytime.getTime()));

            if (movement.pastdate == null)
            statement.setDate(21, null);
            else
            statement.setDate(21, new java.sql.Date(movement.pastdate.getTime()));

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + ins_movement_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        return movement.id;
    }

    public int saveMovement(CNMovement movement) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        String ssPrefix = null;

        switch (movement.subsystemRef.code) {
          case CNSubsystemType.SS_CONNECTION: //Присоединение
            {
                ssPrefix = "cn";
                break;
            }
          case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
            {
                ssPrefix = "ncn";
                break;
            }
        case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
            {
                ssPrefix = "cn_20110314";
                break;
            }
        case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
            {
                ssPrefix = "eap";
                break;
            }
		case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
            {
                ssPrefix = "adso";
                break;
            }
        default:
            {throw new SystemException("Неизвестна подсистема EnergyWorkFlow");}
        }

        String ins_movement_sql = "UPDATE cn." + ssPrefix + "_movement SET " +

            "id_pack = ?, " +
            "id_state = ?, " +
            "startdate = ?, " +
            "note = ?, " +
            "id_parent = ?, " +
            "id_user = ?, " +
            "realdate = ?, " +
            "canceled = ?, " +
            "id_user_canceled = ?, " +
            "canceleddate = ?, " +
            "cancelednote = ?, " +
            "is_completed = ?, " +
            "id_movement_status = ?, " +
            "addnote = ?, " +
            "read_status = ?, " +
            "id_user_read = ?, " +
            "read_date = ?, " +
            "id_user_created = ?, " +
            "modifytime = ?, " +
            "pastdate = ? " +

        " WHERE id = ?";

        try
        {
            statement = connection.prepareStatement(ins_movement_sql);

            statement.setInt(1, movement.id_pack);
            statement.setInt(2, movement.id_state);

            if (movement.startdate == null)
            statement.setDate(3, null);
            else
            statement.setDate(3, new java.sql.Date(movement.startdate.getTime()));

            statement.setString(4, movement.note);

            if (movement.id_parent == Integer.MIN_VALUE)
            {statement.setNull(5, java.sql.Types.INTEGER);}
            else
            {statement.setInt(5, movement.id_parent);}

            if (movement.id_user == Integer.MIN_VALUE)
            {statement.setNull(6, java.sql.Types.INTEGER);}
            else
            {statement.setInt(6, movement.id_user);}

            if (movement.realdate == null)
            statement.setDate(7, null);
            else
            statement.setDate(7, new java.sql.Date(movement.realdate.getTime()));

            if (movement.canceled == Integer.MIN_VALUE)
            {statement.setNull(8, java.sql.Types.INTEGER);}
            else
            {statement.setInt(8, movement.canceled);}

            if (movement.id_user_canceled == Integer.MIN_VALUE)
            {statement.setNull(9, java.sql.Types.INTEGER);}
            else
            {statement.setInt(9, movement.id_user_canceled);}

            if (movement.canceleddate == null)
            statement.setDate(10, null);
            else
            statement.setDate(10, new java.sql.Date(movement.canceleddate.getTime()));

            statement.setString(11, movement.cancelednote);

            if (movement.is_completed == Integer.MIN_VALUE)
            {statement.setInt(12, 0);}
            else
            {statement.setInt(12, movement.is_completed);}

            if (movement.id_movement_status == Integer.MIN_VALUE)
            {statement.setInt(13, 0);}
            else
            {statement.setInt(13, movement.id_movement_status);}

            statement.setString(14, movement.addnote);

            if (movement.read_status == Integer.MIN_VALUE)
            {statement.setInt(15, 0);}
            else
            {statement.setInt(15, movement.read_status);}

            if (movement.id_user_read == Integer.MIN_VALUE)
            {statement.setNull(16, java.sql.Types.INTEGER);}
            else
            {statement.setInt(16, movement.id_user_read);}

            if (movement.read_date == null)
            statement.setDate(17, null);
            else
            statement.setDate(17, new java.sql.Date(movement.read_date.getTime()));

            if (movement.id_user_created == Integer.MIN_VALUE)
            {statement.setNull(18, java.sql.Types.INTEGER);}
            else
            {statement.setInt(18, movement.id_user_created);}

            if (movement.modifytime == null)
            statement.setDate(19, null);
            else
            statement.setDate(19, new java.sql.Date(movement.modifytime.getTime()));

            if (movement.pastdate == null)
            statement.setDate(20, null);
            else
            statement.setDate(20, new java.sql.Date(movement.pastdate.getTime()));

            statement.setInt(21, movement.id);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + ins_movement_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        return movement.id;
    }

    public boolean completeTask(CNPack pack, boolean isRedo, int[] stateFromIdArray, String movNote) throws PersistenceException
    {

        PreparedStatement statement = null;
        ResultSet set = null;

        String ssPrefix = null;
        switch (pack.subsystemRef.code) {
        case CNSubsystemType.SS_CONNECTION: //Присоединение
            {
            ssPrefix = "cn";
            break;
            }
        case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
            {
            ssPrefix = "ncn";
            break;
            }
        case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
            {
            ssPrefix = "cn_20110314";
            break;
            }
        case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
            {
            ssPrefix = "eap";
            break;
            }
		case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
            {
            ssPrefix = "adso";
            break;
            }
        default:
            {
            ssPrefix = "adso";
            break;
            }
        }

        CNMovementDAO movementDAO = new CNMovementDAO(connection, userProfile);
        CNMovementFilter movementFilter = new CNMovementFilter();
        //movementFilter.conditionSQL = ssPrefix + "_MOVEMENT.ID_PACK";
        movementFilter.subsystemRef.code = pack.subsystemRef.code;
        movementFilter.id_pack = pack.packCode;
        movementFilter.id_movement_status = 1;
        int[] movIdArray;
        movIdArray = movementDAO.getFilteredCodeArray(movementFilter, 0, -1);

        if (movIdArray.length > 0)
        {
        CNMovement movement = new CNMovement();
        int i;
        int j;
        Boolean stateInArray;
        int movID = Integer.MIN_VALUE;

        for (i = 0; i < movIdArray.length; i ++)
            {
            movID = movIdArray[i];
            movement = movementDAO.getObject(movID, pack.subsystemRef.code);

            if (stateFromIdArray != null)
                {
                if (stateFromIdArray.length > 0)
                    {
                    stateInArray = false;
                    for (j = 0; j < stateFromIdArray.length; j ++)
                        {
                        if (movement.id_state == stateFromIdArray[j])
                            {
                            stateInArray = true;
                            break;
                            }
                        }
                    if (!stateInArray)
                        {return false;}
                    }
                }

            movement.is_completed = 1;
            movement.id_movement_status = 0;
            movement.realdate = new java.sql.Date(new Date().getTime());
            movement.id_user = 1005;
            saveMovement(movement);
            }

        movement.id = getPKFor("cn.sq_" + ssPrefix + "_movement");
        movement.id_pack = pack.packCode;
        movement.id_parent = movID;
        movement.startdate = new java.sql.Date(new Date().getTime());
        movement.realdate = null;
        movement.is_completed = 0;
        if (isRedo)
            {movement.id_movement_status = 5;}
        else
            {movement.id_movement_status = 1;}
        movement.note = movNote;
        movement.id_user = Integer.MIN_VALUE;
        movement.id_state = pack.startState;

        addMovement(movement);
        }
        return true;
    }

    public DFDocSupplyEE getDFDocSupplyEEByCNPackCode(int packCode) throws PersistenceException {

    	Connection docFlowConnection = null;

		try {
			docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);

	    	DFDocSupplyEEFilter docSupplyFilter = new DFDocSupplyEEFilter();
	    	docSupplyFilter.typeRef.code = DFDocSupplyEEType.DISTRIBUTION;

	    	docSupplyFilter.cnPackCode = packCode;

	    	DFDocSupplyEEDAO docSupplyDAO = new DFDocSupplyEEDAO(docFlowConnection, userProfile);
	    	int[] docSupplyArr = docSupplyDAO.getFilteredCodeArray(docSupplyFilter, 0, -1);

	    	if (docSupplyArr.length == 0) {
	    		throw new SystemException("\n\nНе найден объект договора (DFDocSupplyEE) для пакета (DST) с кодом " + packCode + " !");
	    	}

	    	DFDocSupplyEE dfDocSupplyEE = docSupplyDAO.getObject(docSupplyArr[0]);

	    	if (dfDocSupplyEE == null) {
	    		throw new SystemException("\n\nНе найден объект договора (DFDocSupplyEE) с кодом " + docSupplyArr[0] + " !");
	    	}

	    	if (dfDocSupplyEE.doc == null) {
	    		throw new SystemException("\n\nНе найден документ (doc) для договора (DFDocSupplyEE) с кодом " + docSupplyArr[0] + " !");
	    	}

	    	return dfDocSupplyEE;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}
		}
    }

	/**
	 * Отправка уведомлений (sms и e-mail) потребителю по коду пакета DST
	 *
	 * @param id_pack - код пакета (dst_packages)
	 * @param stateCode - код состояния пакета
	 * @param note - примечание
	 * @param isRegistration - если true, то это событие регистрации (создания) пакета
	 *
	 * @throws PersistenceException
	 */
	public void sendNotificationsByDSTPack(int packCode, int stateCode, String note, boolean isRegistration) throws PersistenceException {

		int statusCode = Integer.MIN_VALUE;

		if (isRegistration) {
			statusCode = DFConsts.DFDOCSUPPLYEE_SITESTATUS_SENT;
		} else {
			statusCode = getStatusCodeByStateCodeForDSTPack(stateCode);
		}

		// Отправляем уведомления только для следующих случаев:
		// 1) пакет регистрируется;
		// 2) работы по пакету завершены;
		// 3) пакет отправлен в архив
		if (statusCode != DFConsts.DFDOCSUPPLYEE_SITESTATUS_SENT &&
			statusCode != DFConsts.DFDOCSUPPLYEE_SITESTATUS_FINISHED &&
			statusCode != DFConsts.DFDOCSUPPLYEE_SITESTATUS_CANCELED) {

			return;
		}

		// Если заявка отклонена, то нужно обязательно указать причину
		if (statusCode == DFConsts.DFDOCSUPPLYEE_SITESTATUS_CANCELED) {
			if (note == null || note.trim().equals("")) {
				throw new SystemException("\n\nПеред отправкой пакета в архив необходимо указать причину!");
			}
		}

		String phoneNumber = "";
		String email = "";

        String sql = "select phone_number, customeremail from dst_packages where id = ?";

		PreparedStatement statement = null;
		ResultSet  set = null;

		try
		{
		    statement = connection.prepareStatement(sql);
		    statement.setInt(1, packCode);

		    set = statement.executeQuery();
		    if (set.next()) {

		    	phoneNumber = set.getString(1);
		    	email = set.getString(2);

		    } else {
		        throw new SystemException("\n\nНе удалось получить данные по пакету (DST) с кодом " + packCode + " !");
		    }
		}
		catch(SQLException e)
		{
		    System.out.println(e.getMessage()+"\nstatement - " + sql);
		    EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
		}
		finally
		{
			try {if (set != null) set.close();}             catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			statement = null;
		}

		if (phoneNumber == null) {
			phoneNumber = "";
		}

		if (email == null) {
			email = "";
		}

		if (note == null) {
			note = "";
		}

		phoneNumber = phoneNumber.trim();
		email = email.trim();

		boolean hasPhoneNumber = false;
		boolean hasEmail = false;

		if (! phoneNumber.equals("")) hasPhoneNumber = true;
		if (! email.equals("")) hasEmail = true;

		// Если нет ни телефона, ни почты, выходим
		if (!hasPhoneNumber && !hasEmail) return;

		Connection docFlowConnection = null;

		try {

			docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);

	    	DFDocSupplyEE dfDocSupplyEE = getDFDocSupplyEEByCNPackCode(packCode);
	    	int docCode = dfDocSupplyEE.doc.code;

			DocFlowLogic dfLogic = new DocFlowLogic(docFlowConnection, userProfile);

			String messageRegistration = "Вашу заяву про договір з розподілу з Херсонобленерго зареєстровано за номером " + dfDocSupplyEE.code;

			String messageSuccess = "Вас приєднано до публічного договору з розподілу з Херсонобленерго за заявою " + dfDocSupplyEE.code;
			// Для договоров с типом "Розірвання договору" и "Виключення з договору одного з об'єктів" сообщение должно отличаться
			if (dfDocSupplyEE.contractType == DFSupplyContractType.CONTRACTTYPE_CONTRACT_BREACH ||
				dfDocSupplyEE.contractType == DFSupplyContractType.CONTRACTTYPE_OBJECT_EXCLUSION) {
					messageSuccess = "За Вашою заявою " + dfDocSupplyEE.code + " стосовно договору з розподілу з Херсонобленерго роботу завершено";
			}

			String messageFailure = "Ваше звернення " + dfDocSupplyEE.code + " про договір з розподілу з Херсонобленерго відхилено з наступних причин:\n"
									+ note;

			// Краткий текст для SMS
			String messageFailureShort = "Ваше звернення " + dfDocSupplyEE.code + " про договір з розподілу з Херсонобленерго відхилено. ";
			if (hasEmail) {
				messageFailureShort += "Подробиці відправлено на ел. пошту " + email;
			} else {
				messageFailureShort += "За подробицями зверніться до кол-центру: +38(0552)480620, 480606";
			}

			String message = "";
			String messageForSMS = "";
			ENDocAttachment[] attachments = null;

			if (statusCode == DFConsts.DFDOCSUPPLYEE_SITESTATUS_SENT) {

				message = messageRegistration;

			} else if (statusCode == DFConsts.DFDOCSUPPLYEE_SITESTATUS_FINISHED) {

				CallCenterLogic ccLogic = new CallCenterLogic(connection, userProfile);

				message = messageSuccess;

				String uid = "";

				// 11.01.2019 Для договоров с типом "Новий власник" будем также сообщать лицевой счет (идентификатор - UID)
				if (dfDocSupplyEE.contractType == DFSupplyContractType.CONTRACTTYPE_NEW_OWNER) {

					if (dfDocSupplyEE.eic != null && !dfDocSupplyEE.eic.equals("") && !dfDocSupplyEE.eic.contains(",")) {
						uid = ccLogic.getCustomerUIDByEIC(dfDocSupplyEE.eic, false);

						if (uid == null) {
							uid = "";
						}
					}
				}

				if (! uid.equals("")) {
					message += ". Ваш особовий рахунок: " + uid;
				}

				// Добавляем вложения (кроме договоров с типом "Розірвання договору" и "Виключення з договору одного з об'єктів")
				if (dfDocSupplyEE.contractType != DFSupplyContractType.CONTRACTTYPE_CONTRACT_BREACH &&
					dfDocSupplyEE.contractType != DFSupplyContractType.CONTRACTTYPE_OBJECT_EXCLUSION) {

					if (dfDocSupplyEE.eic != null && !dfDocSupplyEE.eic.equals("") && !dfDocSupplyEE.eic.contains(",")) {

						CCRecordPoint ccRecordPoint = ccLogic.getCCRecordPointByEIC(dfDocSupplyEE.eic, false);
						int renCode = ccLogic.getRenCodeByEIC(dfDocSupplyEE.eic, false);

						if (ccRecordPoint != null && renCode != Integer.MIN_VALUE) {
							// 06.03.2019 Белугин: пока отправляем вложения только для бытовых потребителей
							if (ccRecordPoint.isProm == 0) {
								attachments = dfLogic.getAttachmentsForCCRecordPoint(ccRecordPoint, renCode, DFBillingDocumentType.PASSPORT);

								if (dfDocSupplyEE.isFromSite == 1) {
									// Записываем в историю на сайте список вложений
									if (attachments != null && attachments.length > 0) {
										String[] fileLinks = new String[attachments.length];
										for (int i = 0; i < attachments.length; i++) {
											fileLinks[i] = attachments[i].fileLink;
										}

										String attachmentsList = Tools.arrayToStr(fileLinks, " ");

										if (attachmentsList != null && attachmentsList.length() > 0) {
											dfLogic.updateSiteAttachments(dfDocSupplyEE.code, attachmentsList);
										}
									}
								}

							}
						}

					} else {
						throw new SystemException("\n\nВідсутній EIC / номер лічильника!");
					}

				}

			} else if (statusCode == DFConsts.DFDOCSUPPLYEE_SITESTATUS_CANCELED) {

				message = messageFailure;

			} else {

				return;

			}

			if (statusCode == DFConsts.DFDOCSUPPLYEE_SITESTATUS_CANCELED) {
				messageForSMS = messageFailureShort;
			} else {
				messageForSMS = message;
			}

			if (hasPhoneNumber) {
				dfLogic.sendSmsByAppeal(docCode, phoneNumber, Tools.transliterate(messageForSMS, true));
			}

			if (hasEmail) {
				dfLogic.sendMailByDoc(docCode, email, message, "Повідомлення від Херсонобленерго", attachments);
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}
		}

	}

	public void registerDFDocSupplyEEStateInDocFlow(int cnPackCode, int stateCode) throws PersistenceException {

		int statusCode = getStatusCodeForDocFlowByStateCodeForDSTPack(stateCode);

		if (statusCode != DFConsts.DFDOCSUPPLYEE_SITESTATUS_ACTIVE &&
			statusCode != DFConsts.DFDOCSUPPLYEE_SITESTATUS_FINISHED &&
			statusCode != DFConsts.DFDOCSUPPLYEE_SITESTATUS_CANCELED) {

			return;
		}

		Connection docFlowConnection = null;

		try {

			docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			DocFlowLogic dfLogic = new DocFlowLogic(docFlowConnection, userProfile);

			DFDocSupplyEE dfDocSupplyEE = getDFDocSupplyEEByCNPackCode(cnPackCode);

			if (statusCode == DFConsts.DFDOCSUPPLYEE_SITESTATUS_ACTIVE) {

				int packStatusCode = getDSTPackStatus(cnPackCode);

				// Выполняем повторную регистрацию, если пакет находился в ожидании
				if (packStatusCode == DFConsts.CNPACKSTATUS_WAITING) {
					boolean shouldRegisterService = false;
					int servicesListCode = Integer.MIN_VALUE;

					if (dfDocSupplyEE.contractType == DFSupplyContractType.CONTRACTTYPE_CONTRACT_ORDER) {
						shouldRegisterService = true;
						servicesListCode = DFServicesList.S2_1_NEW;
					}
					if (dfDocSupplyEE.contractType == DFSupplyContractType.CONTRACTTYPE_PASSPORT_ORDER) {
						shouldRegisterService = true;
						servicesListCode = DFServicesList.S2_2_NEW;
					}

					if (shouldRegisterService) {
						dfLogic.registerServiceStartForDFDocSupply(dfDocSupplyEE, DFInfoSources.ENWF, servicesListCode, true);
					}
				}

			} else if (statusCode == DFConsts.DFDOCSUPPLYEE_SITESTATUS_FINISHED) {

				if (dfDocSupplyEE.contractType == DFSupplyContractType.CONTRACTTYPE_CONTRACT_ORDER ||
					dfDocSupplyEE.contractType == DFSupplyContractType.CONTRACTTYPE_PASSPORT_ORDER) {

					dfLogic.registerServiceFinishForDFDocSupply(dfDocSupplyEE);

				}

			} else if (statusCode == DFConsts.DFDOCSUPPLYEE_SITESTATUS_CANCELED) {

				if (dfDocSupplyEE.contractType == DFSupplyContractType.CONTRACTTYPE_CONTRACT_ORDER ||
					dfDocSupplyEE.contractType == DFSupplyContractType.CONTRACTTYPE_PASSPORT_ORDER) {

					//dfLogic.cancelPack(dfDocSupplyEE.doc.packRef.code);
			    	dfLogic.registerServiceCancellationForDFDocSupply(dfDocSupplyEE);

				}

			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}
		}

	}

	public void deleteDFDocSupplyEE(int cnPackCode) throws PersistenceException {

		Connection docFlowConnection = null;

		try {

			docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			DocFlowLogic dfLogic = new DocFlowLogic(docFlowConnection, userProfile);

			DFDocSupplyEE dfDocSupplyEE = getDFDocSupplyEEByCNPackCode(cnPackCode);

			// Ставим документу статус "Отмененный"
			DFDocDAO docDAO = new DFDocDAO(docFlowConnection, userProfile);
			DFDoc doc = docDAO.getObject(dfDocSupplyEE.doc.code);
			doc.statusRef.code  = DFDocStatus.CANCELED;
			docDAO.save(doc);

			// Удаляем пакет
			dfLogic.deletePack(dfDocSupplyEE.doc.packRef.code);

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}
		}

	}

    /** Метод для передачи пакета в EnergyWorkflow (пока только для подсистемы DST) */
    public void completeTask(int id_pack, int id_movement, int[] states, int id_pack_status, int id_user,
    		String note, String client_ip) throws PersistenceException
    {
    	if (id_pack <= 0) {
    		throw new SystemException("\n\nНе задан код пакета!");
    	}

    	if (id_movement <= 0) {
    		throw new SystemException("\n\nНе задан код движения!");
    	}

    	if (id_pack_status <= 0) {
    		throw new SystemException("\n\nНе задан статус пакета!");
    	}

    	if (id_user <= 0) {
    		throw new SystemException("\n\nНе задан код пользователя!");
    	}

    	if (states.length == 0) {
    		throw new SystemException("\n\nНе задан код нового состояния!");
    	}

        PreparedStatement statement = null;
        PreparedStatement statement1 = null;
        PreparedStatement statement2 = null;
        PreparedStatement statement3 = null;
        PreparedStatement statement4 = null;

        //String ssPrefix = null;

        String query =
    		"  UPDATE cn.dst_movement " +
			"  SET ID_USER = ?, REALDATE = current_timestamp, NOTE = ?, IS_COMPLETED = 1, " +
			"  ID_MOVEMENT_STATUS = 0 " +
			"  WHERE ID = ? ";

        try {

	        try
	        {
	            statement = connection.prepareStatement(query);
	            statement.setInt(1, id_user);
	            statement.setString(2, note);
	            statement.setInt(3, id_movement);

	            statement.execute();

	        } catch(SQLException e) {
	            System.out.println(e.getMessage()+"\nstatement - " + query);
	            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	        } finally {
		        try {if (statement != null) statement.close();} catch (SQLException e) {}
		        statement = null;
	        }

	        String query1 =
	    		"  INSERT INTO cn.dst_movement " +
				"    (ID_PACK, ID_STATE, STARTDATE, ID_PARENT, ID_USER, REALDATE, IS_COMPLETED, " +
				"    ID_MOVEMENT_STATUS, client_ip) " +
				"  VALUES " +
				"    (?, ?, current_timestamp, ?, NULL, NULL, 0, 0, ?) ";

	        String query2 =
	    		"  update cn.dst_movement " +
				"  set is_completed = 1, note = 'dummy', ID_MOVEMENT_STATUS = 0 " +
				"  where id < " +
				"  ( " +
				"    select max(id) from cn.dst_movement mm " +
				"    where mm.id_state = ? and mm.id_pack = ? " +
				"  ) " +
				"  and id_state = ? and id_pack = ? " +
				"  and id_user is null and id_user_canceled is null ";

	        String query3 =
	    		"  update cn.dst_movement " +
				"  set id_movement_status = 1 " +
				"  where id in " +
				"  (SELECT a.id " +
				"    FROM cn.dst_movement a, cn.dst_states s, cn.cn_roles r, cn.dst_packages p, cn.cn_ren rr " +
				"    where  " +
				"    a.id_state = s.id and s.id_role = r.id and a.id_pack=p.id and p.id_ren = rr.id " +
				"     " +
				"    and a.id_pack = ? " +
				"    and coalesce(p.id_pack_status, 0) <> 1000 " +
				"    and coalesce(a.is_completed, 0) = 0 " +
				"   " +
				"    and not exists  " +
				"    (select id from cn.dst_movement m  " +
				"    where m.id_parent = a.id and (m.canceled <> 1 or m.canceled is null)) " +
				"    and a.id = (select max(id) from cn.dst_movement mm  " +
				"                where mm.id_state = a.id_state and mm.id_pack = a.id_pack) " +
				"    and (a.canceled <> 1 or a.canceled is null) " +
				"   " +
				"    and  " +
				"    ( " +
				"      ( " +
				"         (select max(coalesce(parallel_finish, 0)) " +
				"          from cn.\"getRouteDST\"(COALESCE(p.is_ksoe, 0)) " +
				"          where id_state = a.id_state) > 0 " +
				"        " +
				"         and not exists " +
				"         ( " +
				"          select id from cn.dst_movement " +
				"          where id_parent =  " +
				"          ( " +
				"            select max(id) from cn.dst_movement " +
				"            where id_pack = a.id_pack " +
				"              and id_state = " +
				"                (select id_state from cn.\"getRouteDST\"(COALESCE(p.is_ksoe, 0)) " +
				"                 where id =  " +
				"                   (select max(coalesce(parallel_finish, 0)) " +
				"                    from cn.\"getRouteDST\"(COALESCE(p.is_ksoe, 0)) " +
				"                    where id_state = a.id_state)) " +
				"          ) " +
				"          and not cn.\"CheckStateDST\"(a.id_state, id)  " +
				"         ) " +
				"      ) " +
				"      or " +
				"      ( " +
				"         not exists " +
				"         (select id " +
				"          from cn.\"getRouteDST\"(COALESCE(p.is_ksoe, 0)) " +
				"          where id_state = a.id_state) " +
				"   " +
				"         or  " +
				"   " +
				"         (select max(coalesce(parallel_finish, 0)) " +
				"          from cn.\"getRouteDST\"(COALESCE(p.is_ksoe, 0)) " +
				"          where id_state = a.id_state) = 0 " +
				"      ) " +
				"    ) " +
				"   " +
				"  ) ";

	        try
	        {
	        	for (int i = 0; i < states.length; i++) {
		        	statement1 = connection.prepareStatement(query1);
		            statement1.setInt(1, id_pack);
		            statement1.setInt(2, states[i]);
		            statement1.setInt(3, id_movement);
		            statement1.setString(4, client_ip);

		            statement1.execute();

		        	statement2 = connection.prepareStatement(query2);
		            statement2.setInt(1, states[i]);
		            statement2.setInt(2, id_pack);
		            statement2.setInt(3, states[i]);
		            statement2.setInt(4, id_pack);

		            statement2.execute();

		            statement3 = connection.prepareStatement(query3);
		            statement3.setInt(1, id_pack);

		            statement3.execute();

		    		int statusCode = getStatusCodeByStateCodeForDSTPack(states[i]);

		    		// Если заявка отклонена, то нужно обязательно указать причину
		    		if (statusCode == DFConsts.DFDOCSUPPLYEE_SITESTATUS_CANCELED) {

		    			if (note == null || note.trim().equals("")) {
		    				throw new SystemException("\n\nПеред отправкой пакета в архив необходимо указать причину!");
		    			}

			            // Записываем историю для сайта
			            addSiteHistoryForDocSupply(id_pack, states[i], note);

		    		} else {

			            // Записываем историю для сайта
			            addSiteHistoryForDocSupply(id_pack, states[i]);

		    		}

		    		// Регистрируем состояние пакета в DocFlow для парфеновского реестра услуг
		    		registerDFDocSupplyEEStateInDocFlow(id_pack, states[i]);

		            // Отправляем уведомления потребителю
		            sendNotificationsByDSTPack(id_pack, states[i], note, false);
	            }

	        } catch(SQLException e) {
	            System.out.println(e.getMessage() + "\nstatement1 - " + query1 + "\nstatement2 - " + query2 + "\nstatement3 - " + query3);
	            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	        } finally {
		        try {if (statement1 != null) statement1.close();} catch (SQLException e) {}
		        statement1 = null;

		        try {if (statement2 != null) statement2.close();} catch (SQLException e) {}
		        statement2 = null;

		        try {if (statement3 != null) statement3.close();} catch (SQLException e) {}
		        statement3 = null;
	        }

	        String query4 =
	    		"  update cn.dst_packages " +
				"  set id_pack_status = ? " +
				"  where id = ? ";

	        try
	        {
	            statement4 = connection.prepareStatement(query4);
	            if (id_pack_status != 0) {
	            	statement4.setInt(1, id_pack_status);
	            } else {
	            	statement4.setInt(1, 1);
	            }
	            statement4.setInt(2, id_pack);

	            statement4.execute();

	        } catch(SQLException e) {
	            System.out.println(e.getMessage()+"\nstatement4 - " + query4);
	            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	        } finally {
		        try {if (statement4 != null) statement4.close();} catch (SQLException e) {}
		        statement4 = null;
	        }

        } finally {

        	try {if (connection != null) connection.close();}   catch (SQLException e) {}

        }

    }

    /** Метод для отправки пакета в архив в EnergyWorkflow (пока только для подсистемы DST) */
    public void sendPackToArchive(int id_pack, int id_movement, int id_user, String note, String client_ip) throws PersistenceException
    {
    	if (id_pack <= 0) {
    		throw new SystemException("\n\nНе задан код пакета!");
    	}

    	if (id_movement <= 0) {
    		throw new SystemException("\n\nНе задан код движения!");
    	}

    	if (id_user <= 0) {
    		throw new SystemException("\n\nНе задан код пользователя!");
    	}

    	if (note == null || note.trim().equals("")) {
    		throw new SystemException("\n\nНе задана причина отправки пакета в архив!");
    	}

        PreparedStatement statement = null;
        PreparedStatement statement1 = null;
        PreparedStatement statement3 = null;
        PreparedStatement statement4 = null;

        //String ssPrefix = null;

        String query =
    		"  update cn.dst_movement " +
			"  set id_user = ?, realdate = current_timestamp, note = ?, is_completed = 1, ID_MOVEMENT_STATUS = 0 " +
			"  where (id_pack = ?) and (coalesce(is_completed, 0) = 0) and (coalesce(canceled, 0) = 0) ";

        try {

	        try
	        {
	            statement = connection.prepareStatement(query);
	            statement.setInt(1, id_user);
	            statement.setString(2, note);
	            statement.setInt(3, id_pack);

	            statement.execute();

	        } catch(SQLException e) {
	            System.out.println(e.getMessage()+"\nstatement - " + query);
	            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	        } finally {
		        try {if (statement != null) statement.close();} catch (SQLException e) {}
		        statement = null;
	        }

	        String query1 =
	    		"  INSERT INTO cn.dst_movement " +
				"    (ID_PACK, ID_STATE, STARTDATE, ID_PARENT, ID_USER, REALDATE, IS_COMPLETED, " +
				"    ID_MOVEMENT_STATUS, client_ip) " +
				"  VALUES " +
				"    (?, ?, current_timestamp, ?, NULL, NULL, 0, 0, ?) ";

	        String query3 =
	    		"  update cn.dst_movement " +
				"  set id_movement_status = 1 " +
				"  where id in " +
				"  (SELECT a.id " +
				"    FROM cn.dst_movement a, cn.dst_states s, cn.cn_roles r, cn.dst_packages p, cn.cn_ren rr " +
				"    where  " +
				"    a.id_state = s.id and s.id_role = r.id and a.id_pack=p.id and p.id_ren = rr.id " +
				"     " +
				"    and a.id_pack = ? " +
				"    and coalesce(p.id_pack_status, 0) <> 1000 " +
				"    and coalesce(a.is_completed, 0) = 0 " +
				"   " +
				"    and not exists  " +
				"    (select id from cn.dst_movement m  " +
				"    where m.id_parent = a.id and (m.canceled <> 1 or m.canceled is null)) " +
				"    and a.id = (select max(id) from cn.dst_movement mm  " +
				"                where mm.id_state = a.id_state and mm.id_pack = a.id_pack) " +
				"    and (a.canceled <> 1 or a.canceled is null) " +
				"   " +
				"    and  " +
				"    ( " +
				"      ( " +
				"         (select max(coalesce(parallel_finish, 0)) " +
				"          from cn.\"getRouteDST\"(COALESCE(p.is_ksoe, 0)) " +
				"          where id_state = a.id_state) > 0 " +
				"        " +
				"         and not exists " +
				"         ( " +
				"          select id from cn.dst_movement " +
				"          where id_parent =  " +
				"          ( " +
				"            select max(id) from cn.dst_movement " +
				"            where id_pack = a.id_pack " +
				"              and id_state = " +
				"                (select id_state from cn.\"getRouteDST\"(COALESCE(p.is_ksoe, 0)) " +
				"                 where id =  " +
				"                   (select max(coalesce(parallel_finish, 0)) " +
				"                    from cn.\"getRouteDST\"(COALESCE(p.is_ksoe, 0)) " +
				"                    where id_state = a.id_state)) " +
				"          ) " +
				"          and not cn.\"CheckStateDST\"(a.id_state, id)  " +
				"         ) " +
				"      ) " +
				"      or " +
				"      ( " +
				"         not exists " +
				"         (select id " +
				"          from cn.\"getRouteDST\"(COALESCE(p.is_ksoe, 0)) " +
				"          where id_state = a.id_state) " +
				"   " +
				"         or  " +
				"   " +
				"         (select max(coalesce(parallel_finish, 0)) " +
				"          from cn.\"getRouteDST\"(COALESCE(p.is_ksoe, 0)) " +
				"          where id_state = a.id_state) = 0 " +
				"      ) " +
				"    ) " +
				"   " +
				"  ) ";

	        try
	        {
	        	statement1 = connection.prepareStatement(query1);
	            statement1.setInt(1, id_pack);
	            statement1.setInt(2, 1000);
	            statement1.setInt(3, id_movement);
	            statement1.setString(4, client_ip);

	            statement1.execute();

	            statement3 = connection.prepareStatement(query3);
	            statement3.setInt(1, id_pack);

	            statement3.execute();

				//String commentGen = StatusForDocSupplyHashMap.getValue(DFConsts.DFDOCSUPPLYEE_SITESTATUS_CANCELED) + ". " + note;

	            // Записываем историю для сайта
	            addSiteHistoryForDocSupply(id_pack, 1000, note);

	            // Отправляем уведомления потребителю
	            sendNotificationsByDSTPack(id_pack, 1000, note, false);

	        } catch(SQLException e) {
	            System.out.println(e.getMessage() + "\nstatement1 - " + query1 + "\nstatement3 - " + query3);
	            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	        } finally {
		        try {if (statement1 != null) statement1.close();} catch (SQLException e) {}
		        statement1 = null;

		        try {if (statement3 != null) statement3.close();} catch (SQLException e) {}
		        statement3 = null;
	        }

	        String query4 =
	    		"  update cn.dst_packages " +
				"  set id_pack_status = ? " +
				"  where id = ? ";

	        try
	        {
	            statement4 = connection.prepareStatement(query4);
	            statement4.setInt(1, 4);
	            statement4.setInt(2, id_pack);

	            statement4.execute();

	        } catch(SQLException e) {
	            System.out.println(e.getMessage()+"\nstatement4 - " + query4);
	            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	        } finally {
		        try {if (statement4 != null) statement4.close();} catch (SQLException e) {}
		        statement4 = null;
	        }

        } finally {

        	try {if (connection != null) connection.close();}   catch (SQLException e) {}

        }

    }

    public void deleteDSTPack(int id_pack, int id_pack_status, int id_old_pack_status, int id_user, String action) throws PersistenceException {
    	if (id_pack <= 0) {
    		throw new SystemException("\n\nНе задан код пакета!");
    	}

    	if (id_pack_status <= 0) {
    		throw new SystemException("\n\nНе задан статус пакета!");
    	}

    	if (id_old_pack_status <= 0) {
    		throw new SystemException("\n\nНе задан предыдущий статус пакета!");
    	}

    	if (id_user <= 0) {
    		throw new SystemException("\n\nНе задан код пользователя!");
    	}

    	if (action == null || action.trim().equals("")) {
    		throw new SystemException("\n\nНе задано описание действия!");
    	}

        PreparedStatement statement = null;
        PreparedStatement statement1 = null;

        try {

	        String query =
	    		"  update cn.dst_packages " +
				"  set id_pack_status = ? " +
				"  where id = ? ";

	        try
	        {
	            statement = connection.prepareStatement(query);
	            statement.setInt(1, id_pack_status);
	            statement.setInt(2, id_pack);

	            statement.execute();

	        } catch(SQLException e) {
	            System.out.println(e.getMessage()+"\nstatement - " + query);
	            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	        } finally {
		        try {if (statement != null) statement.close();} catch (SQLException e) {}
		        statement = null;
	        }

	        String query1 =
        		" INSERT INTO " +
				"   cn.dst_packages_log " +
				" ( " +
				"   id_pack, " +
				"   id_pack_status, " +
				"   id_user, " +
				"   realdate, " +
				"   action " +
				" )  " +
				" VALUES ( " +
				"   ?, " +
				"   ?, " +
				"   ?, " +
				"   CURRENT_TIMESTAMP, " +
				"   ? " +
				" ) ";

	        try
	        {
	        	statement1 = connection.prepareStatement(query1);
	            statement1.setInt(1, id_pack);
	            statement1.setInt(2, id_old_pack_status);
	            statement1.setInt(3, id_user);
	            statement1.setString(4, action);

	            statement1.execute();

	        } catch(SQLException e) {
	            System.out.println(e.getMessage() + "\nstatement1 - " + query1);
	            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	        } finally {
		        try {if (statement1 != null) statement1.close();} catch (SQLException e) {}
		        statement1 = null;
	        }

	        // Ставим статус "Отмененный" ("Удаленный") для dfdoc и dfpack
	        deleteDFDocSupplyEE(id_pack);

        } finally {

        	try {if (connection != null) connection.close();}   catch (SQLException e) {}

        }
    }

    public int getStatusCodeByStateCodeForDSTPack(int stateCode) {

    	int statusCode = Integer.MIN_VALUE;

        if (Tools.checkValueInArray(stateCode, DST_STATES_ACTIVE)) {

        	statusCode = DFConsts.DFDOCSUPPLYEE_SITESTATUS_ACTIVE;

        } else if (Tools.checkValueInArray(stateCode, DST_STATES_FINISHED)) {

        	statusCode = DFConsts.DFDOCSUPPLYEE_SITESTATUS_FINISHED;

        } else if (Tools.checkValueInArray(stateCode, DST_STATES_CANCELED)) {

        	statusCode = DFConsts.DFDOCSUPPLYEE_SITESTATUS_CANCELED;

        }

        return statusCode;

    }

    public int getStatusCodeForDocFlowByStateCodeForDSTPack(int stateCode) {

    	int statusCode = Integer.MIN_VALUE;

        if (Tools.checkValueInArray(stateCode, DST_STATES_ACTIVE)) {

        	statusCode = DFConsts.DFDOCSUPPLYEE_SITESTATUS_ACTIVE;

        } else if (Tools.checkValueInArray(stateCode, DST_STATES_FINISHED)) {

        	statusCode = DFConsts.DFDOCSUPPLYEE_SITESTATUS_FINISHED;

        } else if (Tools.checkValueInArray(stateCode, DST_STATES_CANCELED_IN_DOCFLOW)) {

        	statusCode = DFConsts.DFDOCSUPPLYEE_SITESTATUS_CANCELED;

        }

        return statusCode;

    }

    public void addSiteHistoryForDocSupply(int packCode, int stateCode) throws PersistenceException {

    	addSiteHistoryForDocSupply(packCode, stateCode, "");

    }

    public void addSiteHistoryForDocSupply(int packCode, int stateCode, String commentGen) throws PersistenceException {

		Connection docFlowConnection = null;

		try {

			docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);

	    	DFDocSupplyEEFilter docSupplyFilter = new DFDocSupplyEEFilter();
	    	docSupplyFilter.typeRef.code = DFDocSupplyEEType.DISTRIBUTION;

	    	docSupplyFilter.cnPackCode = packCode;
	    	docSupplyFilter.isFromSite = 1;

	    	DFDocSupplyEEDAO docSupplyDAO = new DFDocSupplyEEDAO(docFlowConnection, userProfile);
	    	int[] docSupplyArr = docSupplyDAO.getFilteredCodeArray(docSupplyFilter, 0, -1);

	    	if (docSupplyArr.length > 0) {

		        int statusCode = getStatusCodeByStateCodeForDSTPack(stateCode);

		        if (statusCode > Integer.MIN_VALUE) {

			    	DocFlowLogic dfLogic = new DocFlowLogic(connection, userProfile);

			    	if (commentGen == null) {
			    		commentGen = "";
			    	}

			    	if (commentGen.equals("")) {
			    		dfLogic.addSiteHistoryForDocSupply(docSupplyArr[0], statusCode);
			    	} else {
			    		dfLogic.addSiteHistoryForDocSupply(docSupplyArr[0], statusCode, commentGen);
			    	}

		        }

	    	}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}
		}
    }

    public int addPackForPT(CNPackData data) throws PersistenceException
    {
        int pack_id = Integer.MIN_VALUE;

        PreparedStatement statement = null;
        ResultSet  set = null;

        pack_id = getPKFor("cn.sq_pt_packages");

        String ins_pack_sql = "insert into cn.pt_packages (id, name, id_ren, id_pack_status, date_custom, id_role_customer) values (?,?,?,?,?,?)";
        try
        {
            statement = connection.prepareStatement(ins_pack_sql);
            statement.setInt(1, pack_id);
            statement.setString(2, data.name); //"Типа наряд-задание от Гопрей ;)");
            statement.setInt(3, data.renCode); // типа Гопры ...
            statement.setInt(4,1); // 1 - in Work , 2 - endeded
            statement.setDate(5, new java.sql.Date( data.datePack.getTime()));
            statement.setInt(6, data.senderCode); // типа Главный инженер

            //set = statement.executeQuery();
            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + ins_pack_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        String ins_movement_sql = "insert into cn.pt_movement (/*id, */id_pack, id_state, startdate, note, is_completed, id_movement_status, id_user_created) values (?,?,?,?,?,?,?)";
        try
        {
            statement = connection.prepareStatement(ins_movement_sql);
            statement.setInt(1, pack_id);
            statement.setInt(2, data.startState); // 1 - Формування НПЗ Головним Інженером РЕЗ і ЕМ
            statement.setDate(3, new java.sql.Date( new Date().getTime()));
            statement.setString(4, data.commentGen);
            statement.setInt(5, 0);
            statement.setInt(6, 1);
            statement.setInt(7, data.userCode);

            statement.execute();

        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + ins_pack_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }


        //String ins_doc_sql = "insert into cn.pt_doc (id, name, id_pack, datedoc, id_doctype, numberdoc) values (?, ?, ?, ?, ?, ?)";
        String ins_doc_FUNC_sql = "select cn.insert_doc_attachment_pt(?,?,?,?,?,?,?,?,?,?,?)";

    /* (p_doc_name varchar, p_id_pack integer, p_datedoc timestamptz,
                p_id_doctype integer, p_numberdoc varchar, p_attach_name varchar,
            p_file bytea, p_id_movement integer, p_id_user integer, p_filename varchar,
            p_is_packed integer) RETURNS "pg_catalog"."void" AS
        */

        try
        {
            //int doc_id = getPKFor("cn.sq_pt_doc");

            byte[] rep ;
            rep = genNPZ(data);

            statement = connection.prepareStatement(ins_doc_FUNC_sql);
            statement.setString(1,  data.docName );
            statement.setInt(2, pack_id);
            statement.setDate(3, new java.sql.Date( new Date().getTime()));
            statement.setInt(4, 1); // tipa NPZ dodatok1 ...
            statement.setString(5, data.numberDoc);
            statement.setString(6, data.docName);
            statement.setBytes(7, rep);
            statement.setNull(8, java.sql.Types.INTEGER);
            statement.setInt(9,data.userCode); //p_id_user
            statement.setString(10, data.fileName + "_Додаток1.xls");
            statement.setInt(11,0);

            //set = statement.executeQuery();
            statement.execute();

        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + ins_doc_FUNC_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        return pack_id;
    }

    public int addPack(CNPack2PlanWork object) throws PersistenceException
    {
        int pack_id = Integer.MIN_VALUE;
        try
        {
            //energyNetConnection = getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE);


            ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
            ENPlanWork plan = planDAO.getObject(object.planRef.code);


                // определим что юзать как ПОДРАЗДЕЛЕНИЕ ...
                // если департмент=0 - то смотреть на Бюджетодержателся !!!
                //

                int depCode = Integer.MIN_VALUE;
                if (plan.departmentRef.code == 3) // Апарат управління
                    depCode = plan.budgetRef.code;
                else
                    depCode = plan.departmentRef.code;




                CNPackData obj = new CNPackData();

                obj.enRenCode = depCode;

                obj.datePack = plan.dateStart;
                obj.commentGen = object.commentGen;


                ENDepartment dep = new ENDepartmentDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile).getObject(depCode);
                obj.name = dep.name;
                obj.enRenName = dep.name;
                obj.name = obj.name + ", заявка на " + new SimpleDateFormat("dd.MM.yyyy").format( obj.datePack ).toString();

                // по хорошему сделаЛИ ОТДЕЛЬНУЮ развязку РЭСов с СN!!!!
                CNRen2ENDepartmentFilter d2rFilter = new CNRen2ENDepartmentFilter();
                d2rFilter.departmentRef.code = plan.departmentRef.code;

                CNRen2ENDepartmentDAO d2rDAO = new CNRen2ENDepartmentDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
                CNRen2ENDepartmentShortList d2rList = d2rDAO.getScrollableFilteredList(d2rFilter,0,-1);
                if ( d2rList.totalCount == 0 ) {
                    throw new SystemException("CNRen not found for ENDepartment " + dep.name );
                }

                obj.renCode = d2rList.get(0).cnRenCode;

                // нужен код домена ... для развязки отсылающего пакет ;)
                //может быть другой ДатаСоурс ...
                DomainShortList domainList = new DomainDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile).getList(Domain.name_QField + "='" + userProfile.domainInfo.domain +"'");
                if (domainList.totalCount == 0){
                    throw new SystemException("Domain not found:" + userProfile.domainInfo.domain);
                }

                int domainCode = domainList.get(0).code;


                CNRole2DomainInfoFilter r2rFilter = new CNRole2DomainInfoFilter();
                r2rFilter.subsystemRef.code = 6; // потом определить !!!!
                r2rFilter.domainCode = domainCode;

                CNRole2DomainInfoDAO r2rDAO = new CNRole2DomainInfoDAO(getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
                CNRole2DomainInfoShortList r2rList = r2rDAO.getScrollableFilteredList(r2rFilter, 0,-1);
                if ( r2rList.totalCount == 0 ) {
                    throw new SystemException("CNRole not found for Domain " + userProfile.domainInfo.domain );
                }
                if ( r2rList.totalCount != 1 ) {
                    throw new SystemException("CNRole not ONE for Domain " + userProfile.domainInfo.domain );
                }
                if (r2rList.get(0).cnRoleCode == -1){
                    throw new SystemException("CNRole not found for Domain " + userProfile.domainInfo.domain );
                }

                obj.senderCode = r2rList.get(0).cnRoleCode;
                obj.startState = r2rList.get(0).cnStartStateCode;

                obj.docName = "Заявка на " + new SimpleDateFormat("dd.MM.yyyy").format( obj.datePack ).toString();;
                //obj.docType =
                obj.numberDoc = new SimpleDateFormat("dd.MM.yyyy").format( obj.datePack ).toString();;
                obj.fileName = obj.docName;




        //if (object.packTypeRef.code == 1){
            pack_id = addPackForPT(obj);
        //}

        return pack_id;

    }
    catch (DatasourceConnectException e)
    {
      throw new SystemException(e);
    }
    finally
    {


    }


  }

    public int getPKFor(String sequenceName) throws PersistenceException
    {
        int out = Integer.MIN_VALUE;

        String get_id_sql = "select nextval('"+sequenceName+"')";

        PreparedStatement statement = null;
        ResultSet  set = null;

        try
        {
            statement = connection.prepareStatement(get_id_sql);

            set = statement.executeQuery();
            if (set.next())
                out = set.getInt(1);
            else
                throw new SystemException("Can't get value from "+sequenceName+":" + get_id_sql);

            return out;
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + get_id_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser
            .throwPersistenceException(e);
            return out;
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }


    public CNLogic(Connection connection, UserProfile userProfile)
    {
        super(connection, userProfile);
    }


    private Date getFirstDayInMonth(java.util.Date d){
            Date out = new Date();
            Calendar calendar = Calendar.getInstance();
            //calendar.ge
            calendar.setTime(d);
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            calendar.set(Calendar.DATE,1);
            out = calendar.getTime();
        //  System.out.println(out);
        // String s = "01" + "." + calendar.get(Calendar.MONTH)+1 + "." + calendar.get(Calendar.YEAR);
        //  System.out.println(s);
            return out;
        }

private byte[] genNPZ(CNPackData obj){
    {
        try
        {
        //Connection connection = getConnection(EnergyproJNDINames.ENERGYPRO_DATASOURCE);

        String[] params = new String[8];//request.args;

        String[] paramNames = new String[8]; //request.argNames;
        params[0] = new SimpleDateFormat("dd.MM.yyyy").format(  getFirstDayInMonth(obj.datePack) ).toString();
        paramNames[0] = "pdatestart";

        params[1] = new SimpleDateFormat("dd.MM.yyyy").format(obj.datePack).toString();
        paramNames[1] = "pdatefinal";

        params[2] = ""+obj.enRenCode ;
        paramNames[2] = "renCode";

        params[3] = obj.enRenName;
        paramNames[3] = "renName";

        params[4] = "1";
        paramNames[4] = "dNameField";

        params[5] = "0";
        paramNames[5] = "objNameField";

        params[6] = "1";
        paramNames[6] = "elementCode";

        params[7] = "";
        paramNames[7] = "elementName";

/*
 *       /////// Parameters
      argnames[2] := 'renCode';
      args[2] := IntToStr(frmENPeriodWithRENTaskPlanFact.renCode);

      argnames[3] := 'renName';
      if frmENPeriodWithRENTaskPlanFact.renName <> '' then
        args[3] := frmENPeriodWithRENTaskPlanFact.renName
      else
        args[3] := '???';

      argnames[4] := 'dNameField';
      if frmENPeriodWithRENTaskPlanFact.chbByRENs.Checked then
        args[4] := 'd.name'
      else
        args[4] := '1';

      argnames[5] := 'objNameField';
      if frmENPeriodWithRENTaskPlanFact.chbByObjects.Checked then
        args[5] := '0'
      else
        args[5] := '1';

      argnames[6] := 'elementCode';
      args[6] := IntToStr(frmENPeriodWithRENTaskPlanFact.elementCode);

      argnames[7] := ';';
      if frmENPeriodWithRENTaskPlanFact.elementName <> '' then
        args[7] := '??"??? : ' + frmENPeriodWithRENTaskPlanFact.elementName + ' '
      else
        args[7] := '';


 */
/*
        params[0] = "2010";
        paramNames[0] = "yearGen";

        params[1] = "9";
        paramNames[1] = "monthGen";

*/
        String funcName = "/com/ksoe/energynet/reports/TaskNormPlanFaktWorkByDateVAR3.jasper";

        // Read report from compiled file
        //if (!request.funcName.startsWith("/")) request.funcName = "/" + request.funcName;

        JasperReport jasperReport = (JasperReport) JRLoader.loadObject(getClass().getResourceAsStream(funcName));

        JRParameter[] jrParams = jasperReport.getParameters();

        // Fill parameters
        Map parameters = new HashMap();
        for (int i = 0; i < params.length; i++)
        {
            for (int j = 0; j < jrParams.length; j++)
            {
            if (jrParams[j].getName().equals(paramNames[i]))
            {
                String valueClassName = jrParams[j].getValueClassName();
                Object value;
                if (valueClassName.equals("java.lang.Integer"))
                {
                try
                {
                    value = new Integer(params[i]);
                }
                catch (NumberFormatException e1)
                {
                    throw new SystemException(e1);
                }
                }
                else if (valueClassName.equals("java.lang.Double"))
                {
                try
                {
                    value = new Double(params[i]);
                }
                catch (NumberFormatException e1)
                {
                    throw new SystemException(e1);
                }
                }
                else if (valueClassName.equals("java.lang.Float"))
                {
                try
                {
                    value = new Float(params[i]);
                }
                catch (NumberFormatException e1)
                {
                    throw new SystemException(e1);
                }
                }
                else if (valueClassName.equals("java.math.BigDecimal"))
                {
                try
                {
                    value = new BigDecimal(params[i]);
                }
                catch (NumberFormatException e1)
                {
                    throw new SystemException(e1);
                }
                }
                else if (valueClassName.equals("java.lang.Long"))
                {
                try
                {
                    value = new Long(params[i]);
                }
                catch (NumberFormatException e1)
                {
                    throw new SystemException(e1);
                }
                }
                else if (valueClassName.equals("java.lang.Boolean"))
                {
                value = new Boolean(params[i]);
                }
                else if (valueClassName.equals("java.util.Date"))
                {
                try
                {
                    value = ClientConstants.DATE_FORMAT.parse(params[i]);
                }
                catch (ParseException e1)
                {
                    throw new SystemException(e1);
                }
                }
                else
                {
                value = params[i];
                }

                parameters.put(paramNames[i], value);
            }
            }
        }

        parameters.put("userProfile", userProfile);
        // Fill report and make PDF
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        JRXlsExporter xlsExporter = new JRXlsExporter();
        xlsExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
        xlsExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
        xlsExporter.exportReport();

        byte[] arr = baos.toByteArray();

        return arr;

        // Return base64 string to client
        //BASE64Encoder bs64 = new BASE64Encoder();
        //String str = bs64.encode(arr);
        //return str;
        }
        catch (JRException e)
        {
        System.out.println("Error inside report engine: " + e.getMessage());
        throw new EnergyproSystemException(e.getMessage());
        }
        catch (DatasourceConnectException e)
        {
        throw new EnergyproSystemException(e);
        }
        finally
        {
            try {
                if (energyNetConnection != null && !energyNetConnection.isClosed()) {
                    energyNetConnection.close();
                    energyNetConnection = null;
                }
            } catch (SQLException e) {
            }
        }
    }

}

    private java.sql.Connection energyNetConnection = null;

    protected java.sql.Connection getConnection_(String dataSourceName)
            throws DatasourceConnectException {
        try {
            if (energyNetConnection != null && !energyNetConnection.isClosed()) {
                return energyNetConnection;
            }

            InitialContext initialContext = new InitialContext();
            DataSource dataSource = (DataSource) initialContext
                    .lookup(dataSourceName);
            energyNetConnection = dataSource.getConnection();
            return energyNetConnection;
        } catch (NamingException e) {
            throw new DatasourceConnectException(dataSourceName, e);
        } catch (SQLException e) {
            throw new DatasourceConnectException(dataSourceName, e);
        }
    }

   /**
    *  Определение присоединяемой мощности на подстанции (*** CN ***)
    *
    *  @param substationCode - код подстанции
    *  @param substationTypeCode - код типа подстнации
    *
    *  +++ на 26.03.2013 типа так:
    *  ******   code_substation04   ******  Код понижающей трансформаторной подстанции 6 - 10 / 0,4 кВ
    *  ******   code_substation150  ******  Код понижающей трансформаторной подстанции 35 - 150 / 6 - 10 - 35 кВ
    *  ******   code_ss150          ******  Код понижающей трансформаторной подстанции 150 / 35 кВ
    *
    */
    public BigDecimal getPvtu(int substationCode, int substationTypeCode) throws SQLException {

        BigDecimal pvtu = new BigDecimal(0);

        //////////////////
        int tr_cnt = 1;

        /** типа все после 31.12.2012 */
        Date gauge_date = new Date(112,11,31);
        //////////////////

        String query = "";

        if (substationTypeCode == SubstationType.SubstationType150)
        {
            query =

            " select " +
            "  cast(" + substationCode + " as double precision) as code_ss150, " +
            "  coalesce(sum(connections_power.pvtu),0) as pvtu, " +
            "  string_agg(connections_power.packs_id::text, ', ') as packs_id " +

            " from " +
            " ( " +

            " select " +
            " s150.code_ss150, " +
            " (coalesce(sum(s150.power_will_connect),0) / coalesce(" + tr_cnt + ", 1)) as pvtu, " +
            " s150.packs_id " +

            " from " +
            "   (select " +
            "     L1.code_ss150, " +
            "     sum(coalesce(p1.power, 0) - " +
            "        case " +
            "          when exists(select id from cn.cn_techterms where id_pack = p1.id and id_proposal not in (2, 3)) " +
            "            then " +
            "              (select coalesce(t1.pow_exist, 0) from cn.cn_techterms t1 " +
            "                where t1.id_pack = p1.id) " +
            "            else 0 " +
            "        end " +
            "      ) as power_will_connect, " +
            "     ('ПРИСОЕДИНЕНИЕ: ' || string_agg(p1.id::text, ', ')) as packs_id " +
            "   from cn.cn_enlines L1, cn.cn_packages p1 " +
            "   where L1.code_ss150 is not null " +
            "    and (p1.id_pack_status in (1, 2, 5) " +
            "      or (p1.id_pack_status in (3, 4) and coalesce(p1.is_reserv, 0) = 1) " +
            "         and p1.id not in (select id_pack from cn.cn_movement " +
            "         where id_movement_status = 1 and id_state in (1148, 1001000, 1001421, 1001223, " +
            "           100062, 100012, 1000156, 1169, 1000022, 1152, 1000813, 100022, 1172, 1000817)))" +

            /*
            "     and L1.id_pack in (select distinct(id_pack) from cn.cn_movement where is_completed = 1 " +
            "     and id_state in (1000158, 2000041)) " +
            */

            "   and ((L1.id_pack not in (select id_pack from cn.cn_techterms " +
            "          where coalesce(is_realized, -1) = 1) " +
            "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
            "            where spl2cn.id_cn_pack = p1.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION +
            "            and spl2cn.id_spl_pack in (select splp.id " +
            "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
            "              and splp.id = spl2cn.id_spl_pack " +
            "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
            "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
            "                and splm.id_state in (select id " +
            "                  from cn.spl_states where id_state_status = 2) " +
            //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
            " ))) " +
            "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
            "            where pp2cn.id_cn_pack = p1.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION +
            "            and pp2cn.id_pp_pack in (select ppp.id " +
            "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
            "              and ppp.id = pp2cn.id_pp_pack " +
            "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
            "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
            "                and ppm.id_state in (select id " +
            "                  from cn.pp_states where id_state_status = 2) " +
            //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
            " ))))) " +

            "   and p1.id = L1.id_pack " +
            "   and L1.code_ss150 = " + substationCode +
            "   group by L1.code_ss150 " +

            "   union all " +

            "   select " +
            "     L13.code_ss150, " +
            "     sum(coalesce(p13.power, 0) - " +
            "        case " +
            "          when exists(select id from cn.ncn_techterms where id_pack = p13.id and id_proposal not in (2, 3)) " +
            "            then " +
            "              (select coalesce(t13.pow_exist, 0) from cn.ncn_techterms t13 " +
            "                where t13.id_pack = p13.id) " +
            "            else 0 " +
            "        end " +
            "      ) as power_will_connect, " +
            "      ('ПРИСОЕДИНЕНИЕ с 01.08.2010: ' || string_agg(p13.id::text, ', ')) as packs_id " +

            "   from cn.ncn_enlines L13, cn.ncn_packages p13 " +
            "   where L13.code_ss150 is not null " +
            "    and (p13.id_pack_status in (1, 2, 5) " +
            "      or (p13.id_pack_status in (3, 4) and coalesce(p13.is_reserv, 0) = 1) " +
            "         and p13.id not in (select id_pack from cn.ncn_movement " +
            "         where id_movement_status = 1 and id_state in (1001000, 1001223, 1000022, 1000817, " +
            "           1000813, 1001421, 1000156, 1000)))" +

            /*
            "   and L13.id_pack in (select distinct(id_pack) from cn.ncn_movement where is_completed = 1 " +
            "     and id_state in (1000158, 2000041)) " +
            */

            "   and ((L13.id_pack not in (select id_pack from cn.ncn_techterms " +
            "          where coalesce(is_realized, -1) = 1) " +
            "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
            "            where spl2cn.id_cn_pack = p13.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_NEWCONNECTION +
            "            and spl2cn.id_spl_pack in (select splp.id " +
            "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
            "              and splp.id = spl2cn.id_spl_pack " +
            "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
            "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
            "                and splm.id_state in (select id " +
            "                  from cn.spl_states where id_state_status = 2) " +
            //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
            " ))) " +
            "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
            "            where pp2cn.id_cn_pack = p13.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_NEWCONNECTION +
            "            and pp2cn.id_pp_pack in (select ppp.id " +
            "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
            "              and ppp.id = pp2cn.id_pp_pack " +
            "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
            "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
            "                and ppm.id_state in (select id " +
            "                  from cn.pp_states where id_state_status = 2) " +
            //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
            " ))))) " +

            "   and p13.id = L13.id_pack " +
            "   and L13.code_ss150 = " + substationCode +
            "   group by L13.code_ss150 " +

            "   union all " +

            "   select " +
            "     L18.code_ss150, " +
            "     sum(coalesce(p18.power, 0) - " +
            "        case " +
            "          when exists(select id from cn.cn_20110314_techterms where id_pack = p18.id and id_proposal not in (2, 3)) " +
            "            then " +
            "              (select coalesce(t18.pow_exist, 0) from cn.cn_20110314_techterms t18 " +
            "                where t18.id_pack = p18.id) " +
            "            else 0 " +
            "        end " +
            "      ) as power_will_connect, " +
            "     ('ПРИСОЕДИНЕНИЕ с 14.03.2011: ' || string_agg(p18.id::text, ', ')) as packs_id " +

            "   from cn.cn_20110314_enlines L18, cn.cn_20110314_packages p18 " +
            "   where L18.code_ss150 is not null " +
            "    and (p18.id_pack_status in (1, 2, 5) " +
            "      or (p18.id_pack_status in (3, 4) and coalesce(p18.is_reserv, 0) = 1) " +
            "         and p18.id not in (select id_pack from cn.cn_20110314_movement " +
            "         where id_movement_status = 1 and id_state in (1000156, 1001223, 1001421, 1001000, 1000)))" +

            "   and (L18.id_pack in (select distinct(id_pack) from cn.cn_20110314_movement where is_completed = 1 " +
            "       and id_state in (1000150, 1000158, 2000034, 2000041)) " +
            "     or L18.id_pack in (select id from cn.cn_20110314_packages " +
            "       where coalesce(reg_num_tu_contract, '') <> ''))" +

            "   and ((L18.id_pack not in (select id_pack from cn.cn_20110314_techterms " +
            "          where coalesce(is_realized, -1) = 1) " +
            "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
            "            where spl2cn.id_cn_pack = p18.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION_20110314 +
            "            and spl2cn.id_spl_pack in (select splp.id " +
            "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
            "              and splp.id = spl2cn.id_spl_pack " +
            "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
            "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
            "                and splm.id_state in (select id " +
            "                  from cn.spl_states where id_state_status = 2) " +
            //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
            " ))) " +
            "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
            "            where pp2cn.id_cn_pack = p18.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION_20110314 +
            "            and pp2cn.id_pp_pack in (select ppp.id " +
            "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
            "              and ppp.id = pp2cn.id_pp_pack " +
            "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
            "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
            "                and ppm.id_state in (select id " +
            "                  from cn.pp_states where id_state_status = 2) " +
            //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
            " ))))) " +

            "   and p18.id = L18.id_pack " +
            "   and L18.code_ss150 = " + substationCode +
            "   group by L18.code_ss150 " +

            "   union all " +

            "   select " +
            "     L20.code_ss150, " +
            "     sum(coalesce(p20.power, 0) - " +
            "        case " +
            "          when exists(select id from cn.eap_techterms where id_pack = p20.id and id_proposal not in (2, 3)) " +
            "            then " +
            "              (select coalesce(t20.pow_exist, 0) from cn.eap_techterms t20 " +
            "                where t20.id_pack = p20.id) " +
            "            else 0 " +
            "        end " +
            "      ) as power_will_connect, " +
            "     ('ПРИСОЕДИНЕНИЕ с 01.03.2013: ' || string_agg(p20.id::text, ', ')) as packs_id " +

            "   from cn.eap_enlines L20, cn.eap_packages p20 " +
            "   where L20.code_ss150 is not null " +
            "    and (p20.id_pack_status in (1, 2, 5) " +
            "      or (p20.id_pack_status in (3, 4) and coalesce(p20.is_reserv, 0) = 1) " +
            "         and p20.id not in (select id_pack from cn.eap_movement " +
            "         where id_movement_status = 1 and id_state in (1000)))" +

            "   and (L20.id_pack in (select distinct(id_pack) from cn.eap_movement where is_completed = 1 " +
            "       and id_state in (1050028, 1050032, 1070026, 1070030, 2050011, 2050014)) " +
            "     or L20.id_pack in (select id from cn.eap_packages " +
            "       where coalesce(reg_num_tu_contract, '') <> ''))" +

            "   and ((L20.id_pack not in (select id_pack from cn.eap_techterms " +
            "          where coalesce(is_realized, -1) = 1) " +
            "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
            "            where spl2cn.id_cn_pack = p20.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER +
            "            and spl2cn.id_spl_pack in (select splp.id " +
            "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
            "              and splp.id = spl2cn.id_spl_pack " +
            "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
            "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
            "                and splm.id_state in (select id " +
            "                  from cn.spl_states where id_state_status = 2) " +
            //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
            " ))) " +
            "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
            "            where pp2cn.id_cn_pack = p20.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER +
            "            and pp2cn.id_pp_pack in (select ppp.id " +
            "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
            "              and ppp.id = pp2cn.id_pp_pack " +
            "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
            "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
            "                and ppm.id_state in (select id " +
            "                  from cn.pp_states where id_state_status = 2) " +
            //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
            " ))))) " +

            "   and p20.id = L20.id_pack " +
            "   and L20.code_ss150 = " + substationCode +
            "   group by L20.code_ss150 " +

			"   union all " +

            "   select " +
            "     L26.code_ss150, " +
            "     sum(coalesce(p26.power, 0) - " +
            "        case " +
            "          when exists(select id from cn.adso_techterms where id_pack = p26.id and id_proposal not in (2, 3)) " +
            "            then " +
            "              (select coalesce(t26.pow_exist, 0) from cn.adso_techterms t26 " +
            "                where t26.id_pack = p26.id) " +
            "            else 0 " +
            "        end " +
            "      ) as power_will_connect, " +
            "     ('ПРИСОЕДИНЕНИЕ с 01.03.2013: ' || string_agg(p26.id::text, ', ')) as packs_id " +

            "   from cn.adso_enlines L26, cn.adso_packages p26 " +
            "   where L26.code_ss150 is not null " +
            "    and (p26.id_pack_status in (1, 2, 5) " +
            "      or (p26.id_pack_status in (3, 4) and coalesce(p26.is_reserv, 0) = 1) " +
            "         and p26.id not in (select id_pack from cn.adso_movement " +
            "         where id_movement_status = 1 and id_state in (1000)))" +

            "   and (L26.id_pack in (select distinct(id_pack) from cn.adso_movement where is_completed = 1 " +
            "       and id_state in (13, 25, 125, 127, 162, 163)) " +
            "     or L26.id_pack in (select id from cn.adso_packages " +
            "       where coalesce(reg_num_tu_contract, '') <> ''))" +

            "   and ((L26.id_pack not in (select id_pack from cn.adso_techterms " +
            "          where coalesce(is_realized, -1) = 1) " +
            "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
            "            where spl2cn.id_cn_pack = p26.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER +
            "            and spl2cn.id_spl_pack in (select splp.id " +
            "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
            "              and splp.id = spl2cn.id_spl_pack " +
            "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
            "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
            "                and splm.id_state in (select id " +
            "                  from cn.spl_states where id_state_status = 2) " +
            //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
            " ))) " +
            "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
            "            where pp2cn.id_cn_pack = p26.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER +
            "            and pp2cn.id_pp_pack in (select ppp.id " +
            "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
            "              and ppp.id = pp2cn.id_pp_pack " +
            "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
            "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
            "                and ppm.id_state in (select id " +
            "                  from cn.pp_states where id_state_status = 2) " +
            //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
            " ))))) " +

            "   and p26.id = L26.id_pack " +
            "   and L26.code_ss150 = " + substationCode +
            "   group by L26.code_ss150 " +

            " ) s150 " +

            " group by s150.code_ss150, s150.packs_id " +

            " ) connections_power";
        }

        else if (substationTypeCode == SubstationType.SubstationType35)
        {
            query =

                " select " +
                "  cast(" + substationCode + " as double precision) as code_substation150, " +
                "  coalesce(sum(connections_power.pvtu),0) as pvtu, " +
                "  string_agg(connections_power.packs_id::text, ', ') " +

                " from " +
                " ( " +

                " select " +
                " s150.code_substation150, " +
                " (coalesce(sum(s150.power_will_connect),0) / coalesce(" + tr_cnt + ", 1)) as pvtu, " +
                " s150.packs_id " +

                " from " +
                "   (select " +
                "     L1.code_substation150, " +
                "     sum(coalesce(p1.power, 0) - " +
                "        case " +
                "          when exists(select id from cn.cn_techterms where id_pack = p1.id and id_proposal not in (2, 3)) " +
                "            then " +
                "              (select coalesce(t1.pow_exist, 0) from cn.cn_techterms t1 " +
                "                where t1.id_pack = p1.id) " +
                "            else 0 " +
                "        end " +
                "      ) as power_will_connect, " +
                "     ('ПРИСОЕДИНЕНИЕ: ' || string_agg(p1.id::text, ', ')) as packs_id " +
                "   from cn.cn_enlines L1, cn.cn_packages p1 " +
                "   where L1.code_substation150 is not null " +
                "    and (p1.id_pack_status in (1, 2, 5) " +
                "      or (p1.id_pack_status in (3, 4) and coalesce(p1.is_reserv, 0) = 1) " +
                "         and p1.id not in (select id_pack from cn.cn_movement " +
                "         where id_movement_status = 1 and id_state in (1148, 1001000, 1001421, 1001223, " +
                "           100062, 100012, 1000156, 1169, 1000022, 1152, 1000813, 100022, 1172, 1000817)))" +

                /*
                "     and L1.id_pack in (select distinct(id_pack) from cn.cn_movement where is_completed = 1 " +
                "     and id_state in (1000158, 2000041)) " +
                */

                "   and ((L1.id_pack not in (select id_pack from cn.cn_techterms " +
                "          where coalesce(is_realized, -1) = 1) " +
                "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
                "            where spl2cn.id_cn_pack = p1.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION +
                "            and spl2cn.id_spl_pack in (select splp.id " +
                "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
                "              and splp.id = spl2cn.id_spl_pack " +
                "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
                "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
                "                and splm.id_state in (select id " +
                "                  from cn.spl_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))) " +
                "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
                "            where pp2cn.id_cn_pack = p1.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION +
                "            and pp2cn.id_pp_pack in (select ppp.id " +
                "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
                "              and ppp.id = pp2cn.id_pp_pack " +
                "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
                "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
                "                and ppm.id_state in (select id " +
                "                  from cn.pp_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))))) " +

                "   and p1.id = L1.id_pack " +
                "   and L1.code_substation150 = " + substationCode +
                "   group by L1.code_substation150 " +

                "   union all " +

                "   select " +
                "     L13.code_substation150, " +
                "     sum(coalesce(p13.power, 0) - " +
                "        case " +
                "          when exists(select id from cn.ncn_techterms where id_pack = p13.id and id_proposal not in (2, 3)) " +
                "            then " +
                "              (select coalesce(t13.pow_exist, 0) from cn.ncn_techterms t13 " +
                "                where t13.id_pack = p13.id) " +
                "            else 0 " +
                "        end " +
                "      ) as power_will_connect, " +
                "     ('ПРИСОЕДИНЕНИЕ c 01.08.2010: ' || string_agg(p13.id::text, ', ')) as packs_id " +

                "   from cn.ncn_enlines L13, cn.ncn_packages p13 " +
                "   where L13.code_substation150 is not null " +
                "    and (p13.id_pack_status in (1, 2, 5) " +
                "      or (p13.id_pack_status in (3, 4) and coalesce(p13.is_reserv, 0) = 1) " +
                "         and p13.id not in (select id_pack from cn.ncn_movement " +
                "         where id_movement_status = 1 and id_state in (1001000, 1001223, 1000022, 1000817, " +
                "           1000813, 1001421, 1000156, 1000)))" +

                /*
                "   and L13.id_pack in (select distinct(id_pack) from cn.ncn_movement where is_completed = 1 " +
                "     and id_state in (1000158, 2000041)) " +
                */

                "   and ((L13.id_pack not in (select id_pack from cn.ncn_techterms " +
                "          where coalesce(is_realized, -1) = 1) " +
                "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
                "            where spl2cn.id_cn_pack = p13.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_NEWCONNECTION +
                "            and spl2cn.id_spl_pack in (select splp.id " +
                "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
                "              and splp.id = spl2cn.id_spl_pack " +
                "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
                "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
                "                and splm.id_state in (select id " +
                "                  from cn.spl_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))) " +
                "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
                "            where pp2cn.id_cn_pack = p13.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_NEWCONNECTION +
                "            and pp2cn.id_pp_pack in (select ppp.id " +
                "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
                "              and ppp.id = pp2cn.id_pp_pack " +
                "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
                "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
                "                and ppm.id_state in (select id " +
                "                  from cn.pp_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))))) " +

                "   and p13.id = L13.id_pack " +
                "   and L13.code_substation150 = " + substationCode +
                "   group by L13.code_substation150 " +

                "   union all " +

                "   select " +
                "     L18.code_substation150, " +
                "     sum(coalesce(p18.power, 0) - " +
                "        case " +
                "          when exists(select id from cn.cn_20110314_techterms where id_pack = p18.id and id_proposal not in (2, 3)) " +
                "            then " +
                "              (select coalesce(t18.pow_exist, 0) from cn.cn_20110314_techterms t18 " +
                "                where t18.id_pack = p18.id) " +
                "            else 0 " +
                "        end " +
                "      ) as power_will_connect, " +
                "     ('ПРИСОЕДИНЕНИЕ c 14.03.2011: ' || string_agg(p18.id::text, ', ')) as packs_id " +

                "   from cn.cn_20110314_enlines L18, cn.cn_20110314_packages p18 " +
                "   where L18.code_substation150 is not null " +
                "    and (p18.id_pack_status in (1, 2, 5) " +
                "      or (p18.id_pack_status in (3, 4) and coalesce(p18.is_reserv, 0) = 1) " +
                "         and p18.id not in (select id_pack from cn.cn_20110314_movement " +
                "         where id_movement_status = 1 and id_state in (1000156, 1001223, 1001421, 1001000, 1000)))" +

                "   and (L18.id_pack in (select distinct(id_pack) from cn.cn_20110314_movement where is_completed = 1 " +
                "       and id_state in (1000150, 1000158, 2000034, 2000041)) " +
                "     or L18.id_pack in (select id from cn.cn_20110314_packages " +
                "       where coalesce(reg_num_tu_contract, '') <> ''))" +

                "   and ((L18.id_pack not in (select id_pack from cn.cn_20110314_techterms " +
                "          where coalesce(is_realized, -1) = 1) " +
                "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
                "            where spl2cn.id_cn_pack = p18.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION_20110314 +
                "            and spl2cn.id_spl_pack in (select splp.id " +
                "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
                "              and splp.id = spl2cn.id_spl_pack " +
                "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
                "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
                "                and splm.id_state in (select id " +
                "                  from cn.spl_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))) " +
                "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
                "            where pp2cn.id_cn_pack = p18.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION_20110314 +
                "            and pp2cn.id_pp_pack in (select ppp.id " +
                "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
                "              and ppp.id = pp2cn.id_pp_pack " +
                "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
                "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
                "                and ppm.id_state in (select id " +
                "                  from cn.pp_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))))) " +

                "   and p18.id = L18.id_pack " +
                "   and L18.code_substation150 = " + substationCode +
                "   group by L18.code_substation150 " +

                "   union all " +

                "   select " +
                "     L20.code_substation150, " +
                "     sum(coalesce(p20.power, 0) - " +
                "        case " +
                "          when exists(select id from cn.eap_techterms where id_pack = p20.id and id_proposal not in (2, 3)) " +
                "            then " +
                "              (select coalesce(t20.pow_exist, 0) from cn.eap_techterms t20 " +
                "                where t20.id_pack = p20.id) " +
                "            else 0 " +
                "        end " +
                "      ) as power_will_connect, " +
                "     ('ПРИСОЕДИНЕНИЕ c 01.03.2013: ' || string_agg(p20.id::text, ', ')) as packs_id " +

                "   from cn.eap_enlines L20, cn.eap_packages p20 " +
                "   where L20.code_substation150 is not null " +
                "    and (p20.id_pack_status in (1, 2, 5) " +
                "      or (p20.id_pack_status in (3, 4) and coalesce(p20.is_reserv, 0) = 1) " +
                "         and p20.id not in (select id_pack from cn.eap_movement " +
                "         where id_movement_status = 1 and id_state in (1000)))" +

                "   and (L20.id_pack in (select distinct(id_pack) from cn.eap_movement where is_completed = 1 " +
                "       and id_state in (1050028, 1050032, 1070026, 1070030, 2050011, 2050014)) " +
                "     or L20.id_pack in (select id from cn.eap_packages " +
                "       where coalesce(reg_num_tu_contract, '') <> ''))" +

                "   and ((L20.id_pack not in (select id_pack from cn.eap_techterms " +
                "          where coalesce(is_realized, -1) = 1) " +
                "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
                "            where spl2cn.id_cn_pack = p20.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER +
                "            and spl2cn.id_spl_pack in (select splp.id " +
                "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
                "              and splp.id = spl2cn.id_spl_pack " +
                "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
                "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
                "                and splm.id_state in (select id " +
                "                  from cn.spl_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))) " +
                "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
                "            where pp2cn.id_cn_pack = p20.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER +
                "            and pp2cn.id_pp_pack in (select ppp.id " +
                "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
                "              and ppp.id = pp2cn.id_pp_pack " +
                "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
                "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
                "                and ppm.id_state in (select id " +
                "                  from cn.pp_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))))) " +

                "   and p20.id = L20.id_pack " +
                "   and L20.code_substation150 = " + substationCode +
                "   group by L20.code_substation150 " +

				"   union all " +

                "   select " +
                "     L26.code_substation150, " +
                "     sum(coalesce(p26.power, 0) - " +
                "        case " +
                "          when exists(select id from cn.adso_techterms where id_pack = p26.id and id_proposal not in (2, 3)) " +
                "            then " +
                "              (select coalesce(t26.pow_exist, 0) from cn.adso_techterms t26 " +
                "                where t26.id_pack = p26.id) " +
                "            else 0 " +
                "        end " +
                "      ) as power_will_connect, " +
                "     ('ПРИСОЕДИНЕНИЕ c 01.03.2013: ' || string_agg(p26.id::text, ', ')) as packs_id " +

                "   from cn.adso_enlines L26, cn.adso_packages p26 " +
                "   where L26.code_substation150 is not null " +
                "    and (p26.id_pack_status in (1, 2, 5) " +
                "      or (p26.id_pack_status in (3, 4) and coalesce(p26.is_reserv, 0) = 1) " +
                "         and p26.id not in (select id_pack from cn.adso_movement " +
                "         where id_movement_status = 1 and id_state in (1000)))" +

                "   and (L26.id_pack in (select distinct(id_pack) from cn.adso_movement where is_completed = 1 " +
                "       and id_state in (13, 25, 125, 127, 162, 163)) " +
                "     or L26.id_pack in (select id from cn.adso_packages " +
                "       where coalesce(reg_num_tu_contract, '') <> ''))" +

                "   and ((L26.id_pack not in (select id_pack from cn.adso_techterms " +
                "          where coalesce(is_realized, -1) = 1) " +
                "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
                "            where spl2cn.id_cn_pack = p26.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER +
                "            and spl2cn.id_spl_pack in (select splp.id " +
                "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
                "              and splp.id = spl2cn.id_spl_pack " +
                "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
                "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
                "                and splm.id_state in (select id " +
                "                  from cn.spl_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))) " +
                "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
                "            where pp2cn.id_cn_pack = p26.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER +
                "            and pp2cn.id_pp_pack in (select ppp.id " +
                "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
                "              and ppp.id = pp2cn.id_pp_pack " +
                "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
                "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
                "                and ppm.id_state in (select id " +
                "                  from cn.pp_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))))) " +

                "   and p26.id = L26.id_pack " +
                "   and L26.code_substation150 = " + substationCode +
                "   group by L26.code_substation150 " +

                " ) s150 " +

                " group by s150.code_substation150, s150.packs_id " +

                " ) connections_power";
        }
        else if (substationTypeCode >= SubstationType.SubstationType04)
        {
            query =

                " select " +
                "  cast(" + substationCode + " as double precision) as code_substation04, " +
                "  coalesce(sum(connections_power.pvtu),0) as pvtu, " +
                "  string_agg(connections_power.packs_id::text, ', ') " +

                " from " +
                " ( " +

                " select " +
                " s04.code_substation04, " +
                " coalesce(sum(s04.power_will_connect),0) as pvtu, " +
                " s04.packs_id " +

                " from " +
                "   (select " +
                "     L1.code_substation04, " +
                "     sum(coalesce(p1.power, 0) - " +
                "        case " +
                "          when exists(select id from cn.cn_techterms where id_pack = p1.id and id_proposal not in (2, 3)) " +
                "            then " +
                "              (select coalesce(t1.pow_exist, 0) from cn.cn_techterms t1 " +
                "                where t1.id_pack = p1.id) " +
                "            else 0 " +
                "        end " +
                "      ) as power_will_connect, " +
                "   ('ПРИСОЕДИНЕНИЕ: ' || string_agg(p1.id::text, ', ')) as packs_id " +

                "   from cn.cn_enlines L1, cn.cn_packages p1 " +
                "   where L1.code_substation04 is not null " +
                "    and (p1.id_pack_status in (1, 2, 5) " +
                "      or (p1.id_pack_status in (3, 4) and coalesce(p1.is_reserv, 0) = 1) " +
                "         and p1.id not in (select id_pack from cn.cn_movement " +
                "         where id_movement_status = 1 and id_state in (1148, 1001000, 1001421, 1001223, " +
                "           100062, 100012, 1000156, 1169, 1000022, 1152, 1000813, 100022, 1172, 1000817)))" +

                /*
                "     and L1.id_pack in (select distinct(id_pack) from cn.cn_movement where is_completed = 1 " +
                "     and id_state in (1000158, 2000041)) " +
                */

                "   and ((L1.id_pack not in (select id_pack from cn.cn_techterms " +
                "          where coalesce(is_realized, -1) = 1) " +
                "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
                "            where spl2cn.id_cn_pack = p1.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION +
                "            and spl2cn.id_spl_pack in (select splp.id " +
                "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
                "              and splp.id = spl2cn.id_spl_pack " +
                "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
                "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
                "                and splm.id_state in (select id " +
                "                  from cn.spl_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))) " +
                "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
                "            where pp2cn.id_cn_pack = p1.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION +
                "            and pp2cn.id_pp_pack in (select ppp.id " +
                "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
                "              and ppp.id = pp2cn.id_pp_pack " +
                "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
                "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
                "                and ppm.id_state in (select id " +
                "                  from cn.pp_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))))) " +

                "   and p1.id = L1.id_pack " +
                "   and L1.code_substation04 = " + substationCode +
                "   group by L1.code_substation04 " +

                "   union all " +

                "   select " +
                "     L13.code_substation04, " +
                "     sum(coalesce(p13.power, 0) - " +
                "        case " +
                "          when exists(select id from cn.ncn_techterms where id_pack = p13.id and id_proposal not in (2, 3)) " +
                "            then " +
                "              (select coalesce(t13.pow_exist, 0) from cn.ncn_techterms t13 " +
                "                where t13.id_pack = p13.id) " +
                "            else 0 " +
                "        end " +
                "      ) as power_will_connect, " +
                "      ('ПРИСОЕДИНЕНИЕ с 01.08.2010: ' || string_agg(p13.id::text, ', ')) as packs_id " +

                "   from cn.ncn_enlines L13, cn.ncn_packages p13 " +
                "   where L13.code_substation04 is not null " +
                "    and (p13.id_pack_status in (1, 2, 5) " +
                "      or (p13.id_pack_status in (3, 4) and coalesce(p13.is_reserv, 0) = 1) " +
                "         and p13.id not in (select id_pack from cn.ncn_movement " +
                "         where id_movement_status = 1 and id_state in (1001000, 1001223, 1000022, 1000817, " +
                "           1000813, 1001421, 1000156, 1000)))" +

                /*
                "   and L13.id_pack in (select distinct(id_pack) from cn.ncn_movement where is_completed = 1 " +
                "     and id_state in (1000158, 2000041)) " +
                */

                "   and ((L13.id_pack not in (select id_pack from cn.ncn_techterms " +
                "          where coalesce(is_realized, -1) = 1) " +
                "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
                "            where spl2cn.id_cn_pack = p13.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_NEWCONNECTION +
                "            and spl2cn.id_spl_pack in (select splp.id " +
                "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
                "              and splp.id = spl2cn.id_spl_pack " +
                "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
                "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
                "                and splm.id_state in (select id " +
                "                  from cn.spl_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))) " +
                "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
                "            where pp2cn.id_cn_pack = p13.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_NEWCONNECTION +
                "            and pp2cn.id_pp_pack in (select ppp.id " +
                "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
                "              and ppp.id = pp2cn.id_pp_pack " +
                "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
                "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
                "                and ppm.id_state in (select id " +
                "                  from cn.pp_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))))) " +

                "   and p13.id = L13.id_pack " +
                "   and L13.code_substation04 = " + substationCode +
                "   group by L13.code_substation04 " +

                "   union all " +

                "   select " +
                "     L18.code_substation04, " +
                "     sum(coalesce(p18.power, 0) - " +
                "        case " +
                "          when exists(select id from cn.cn_20110314_techterms where id_pack = p18.id and id_proposal not in (2, 3)) " +
                "            then " +
                "              (select coalesce(t18.pow_exist, 0) from cn.cn_20110314_techterms t18 " +
                "                where t18.id_pack = p18.id) " +
                "            else 0 " +
                "        end " +
                "      ) as power_will_connect, " +
                "      ('ПРИСОЕДИНЕНИЕ с 14.03.2011: ' || string_agg(p18.id::text, ', ')) as packs_id " +

                "   from cn.cn_20110314_enlines L18, cn.cn_20110314_packages p18 " +
                "   where L18.code_substation04 is not null " +
                "    and (p18.id_pack_status in (1, 2, 5) " +
                "      or (p18.id_pack_status in (3, 4) and coalesce(p18.is_reserv, 0) = 1) " +
                "         and p18.id not in (select id_pack from cn.cn_20110314_movement " +
                "         where id_movement_status = 1 and id_state in (1000156, 1001223, 1001421, 1001000, 1000)))" +

                "   and (L18.id_pack in (select distinct(id_pack) from cn.cn_20110314_movement where is_completed = 1 " +
                "       and id_state in (1000150, 1000158, 2000034, 2000041)) " +
                "     or L18.id_pack in (select id from cn.cn_20110314_packages " +
                "       where coalesce(reg_num_tu_contract, '') <> ''))" +

                "   and ((L18.id_pack not in (select id_pack from cn.cn_20110314_techterms " +
                "          where coalesce(is_realized, -1) = 1) " +
                "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
                "            where spl2cn.id_cn_pack = p18.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION_20110314 +
                "            and spl2cn.id_spl_pack in (select splp.id " +
                "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
                "              and splp.id = spl2cn.id_spl_pack " +
                "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
                "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
                "                and splm.id_state in (select id " +
                "                  from cn.spl_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))) " +
                "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
                "            where pp2cn.id_cn_pack = p18.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION_20110314 +
                "            and pp2cn.id_pp_pack in (select ppp.id " +
                "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
                "              and ppp.id = pp2cn.id_pp_pack " +
                "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
                "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
                "                and ppm.id_state in (select id " +
                "                  from cn.pp_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))))) " +

                "   and p18.id = L18.id_pack " +
                "   and L18.code_substation04 = " + substationCode +
                "   group by L18.code_substation04 " +


				"   union all " +

                "   select " +
                "     L20.code_substation04, " +
                "     sum(coalesce(p20.power, 0) - " +
                "        case " +
                "          when exists(select id from cn.eap_techterms where id_pack = p20.id and id_proposal not in (2, 3)) " +
                "            then " +
                "              (select coalesce(t20.pow_exist, 0) from cn.eap_techterms t20 " +
                "                where t20.id_pack = p20.id) " +
                "            else 0 " +
                "        end " +
                "      ) as power_will_connect, " +
                "     ('ПРИСОЕДИНЕНИЕ с 01.03.2013: ' || string_agg(p20.id::text, ', ')) as packs_id " +

                "   from cn.eap_enlines L20, cn.eap_packages p20 " +
                "   where L20.code_substation04 is not null " +
                "    and (p20.id_pack_status in (1, 2, 5) " +
                "      or (p20.id_pack_status in (3, 4) and coalesce(p20.is_reserv, 0) = 1) " +
                "         and p20.id not in (select id_pack from cn.eap_movement " +
                "         where id_movement_status = 1 and id_state in (1000)))" +

                "   and (L20.id_pack in (select distinct(id_pack) from cn.eap_movement where is_completed = 1 " +
                "       and id_state in (1050028, 1050032, 1070026, 1070030, 2050011, 2050014)) " +
                "     or L20.id_pack in (select id from cn.eap_packages " +
                "       where coalesce(reg_num_tu_contract, '') <> ''))" +

                "   and ((L20.id_pack not in (select id_pack from cn.eap_techterms " +
                "          where coalesce(is_realized, -1) = 1) " +
                "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
                "            where spl2cn.id_cn_pack = p20.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER +
                "            and spl2cn.id_spl_pack in (select splp.id " +
                "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
                "              and splp.id = spl2cn.id_spl_pack " +
                "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
                "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
                "                and splm.id_state in (select id " +
                "                  from cn.spl_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))) " +
                "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
                "            where pp2cn.id_cn_pack = p20.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER +
                "            and pp2cn.id_pp_pack in (select ppp.id " +
                "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
                "              and ppp.id = pp2cn.id_pp_pack " +
                "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
                "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
                "                and ppm.id_state in (select id " +
                "                  from cn.pp_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))))) " +

                "   and p20.id = L20.id_pack " +
                "   and L20.code_substation04 = " + substationCode +
                "   group by L20.code_substation04 " +


				"   union all " +

                "   select " +
                "     L26.code_substation04, " +
                "     sum(coalesce(p26.power, 0) - " +
                "        case " +
                "          when exists(select id from cn.adso_techterms where id_pack = p26.id and id_proposal not in (2, 3)) " +
                "            then " +
                "              (select coalesce(t26.pow_exist, 0) from cn.adso_techterms t26 " +
                "                where t26.id_pack = p26.id) " +
                "            else 0 " +
                "        end " +
                "      ) as power_will_connect, " +
                "     ('ПРИСОЕДИНЕНИЕ с 01.03.2013: ' || string_agg(p26.id::text, ', ')) as packs_id " +

                "   from cn.adso_enlines L26, cn.adso_packages p26 " +
                "   where L26.code_substation04 is not null " +
                "    and (p26.id_pack_status in (1, 2, 5) " +
                "      or (p26.id_pack_status in (3, 4) and coalesce(p26.is_reserv, 0) = 1) " +
                "         and p26.id not in (select id_pack from cn.adso_movement " +
                "         where id_movement_status = 1 and id_state in (1000)))" +

                "   and (L26.id_pack in (select distinct(id_pack) from cn.adso_movement where is_completed = 1 " +
                "       and id_state in (13, 25, 125, 127, 162, 163)) " +
                "     or L26.id_pack in (select id from cn.adso_packages " +
                "       where coalesce(reg_num_tu_contract, '') <> ''))" +

                "   and ((L26.id_pack not in (select id_pack from cn.adso_techterms " +
                "          where coalesce(is_realized, -1) = 1) " +
                "           and not exists (select spl2cn.id from cn.spl2cn spl2cn " +
                "            where spl2cn.id_cn_pack = p26.id and spl2cn.id_subsystem_cn = " + CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER +
                "            and spl2cn.id_spl_pack in (select splp.id " +
                "              from cn.spl_packages splp where splp.id_pack_status = 2 " +
                "              and splp.id = spl2cn.id_spl_pack " +
                "              and splp.id in (select splm.id_pack from cn.spl_movement splm " +
                "                where splm.id_pack = splp.id and splm.id_movement_status = 1 " +
                "                and splm.id_state in (select id " +
                "                  from cn.spl_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))) " +
                "         and not exists (select pp2cn.id from cn.pp2cn pp2cn " +
                "            where pp2cn.id_cn_pack = p26.id and pp2cn.id_subsystem_cn = " + CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER +
                "            and pp2cn.id_pp_pack in (select ppp.id " +
                "              from cn.pp_packages ppp where ppp.id_pack_status = 2 " +
                "              and ppp.id = pp2cn.id_pp_pack " +
                "              and ppp.id in (select ppm.id_pack from cn.pp_movement ppm " +
                "                where ppm.id_pack = ppp.id and ppm.id_movement_status = 1 " +
                "                and ppm.id_state in (select id " +
                "                  from cn.pp_states where id_state_status = 2) " +
                //"                and startdate <=  " + Tools.convertDateToSQLString(gauge_date) +
                " ))))) " +

                "   and p26.id = L26.id_pack " +
                "   and L26.code_substation04 = " + substationCode +
                "   group by L26.code_substation04 " +

                " ) s04 " +

                " group by s04.code_substation04, s04.packs_id " +

                " ) connections_power";
        }

        Statement tempSt;
        tempSt = connection.createStatement();
        ResultSet rs = tempSt.executeQuery(query);

        while (rs.next()) {
            pvtu = rs.getBigDecimal(2);
        }

        rs.close();
        tempSt.close();

        return pvtu;
    }


    /* методы для актов */
    public void addActsPackAndStartMovement(CNActsPack pack) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;

        if (pack.code == Integer.MIN_VALUE)
        {
            pack.code = getPKFor("cn.sq_acts_packages");


        String ins_pack_sql = "INSERT INTO cn.acts_packages (" +
        "id," +
        "name," +
        "adres_jur," +
        "adres," +
        "purpose," +
        "business_type," +
        "blank_number," +
        "act_number," +
        "act_date," +
        "act_sum," +
        "pay_sum," +
        "pay_date," +
        //"is_ksoe," + //SUPP-24768
        "status," +
        "id_ren," +
        "id_pack_status," +
        "id_waiting_status," +
        "dfpackcode)" +


        "VALUES ( " +
        "?," + // id,
        "?," +// name,
        "?," +// adres_jur,
        "?," +// adres,
        "?," +// purpose,
        "?," +// business_type,
        "?," +// blank_number,
        "?," +// act_number,
        "?," +// act_date,
        "?," +// act_sum,
        "?," +// pay_sum,
        "?," +// pay_date,
        //"?," +// is_ksoe, //SUPP-24768
        "?," +// status,
        "?," +// id_ren,
        "?," +// id_pack_status,
        "?," +// id_waiting_status,
        "?) ";     // dfpackcode


        try
        {
            statement = connection.prepareStatement(ins_pack_sql);
            statement.setInt(1, pack.code);
            statement.setString(2, pack.name);
            statement.setString(3, pack.address_jur);
            statement.setString(4, pack.address);
            statement.setString(5, pack.purpose);
            statement.setString(6, pack.business_type);
            statement.setString(7, pack.blank_number);
            statement.setString(8, pack.act_number);

            if (pack.act_date == null)
                statement.setDate(9, null);
                else
                statement.setDate(9, new java.sql.Date(pack.act_date.getTime()));

            if (pack.act_sum != null)
                pack.act_sum = pack.act_sum.setScale(10,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(10, pack.act_sum);

            if (pack.pay_sum != null)
                pack.pay_sum = pack.pay_sum.setScale(11,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(11, pack.pay_sum);

            if (pack.pay_date == null)
                statement.setDate(12, null);
                else
                statement.setDate(12, new java.sql.Date(pack.pay_date.getTime()));

            //SUPP-24768 Удален признак РЕС или ХОЕ
            /*
            if (pack.is_ksoe != Integer.MIN_VALUE )
                statement.setInt(13, pack.is_ksoe);
                else
                statement.setNull(13, java.sql.Types.INTEGER);
            */

            if (pack.status != Integer.MIN_VALUE )
                statement.setInt(13, pack.status);
                else
                statement.setNull(13, java.sql.Types.INTEGER);

            if (pack.id_ren != Integer.MIN_VALUE )
                statement.setInt(14, pack.id_ren);
                else
                statement.setNull(14, java.sql.Types.INTEGER);

            if (pack.id_pack_status != Integer.MIN_VALUE )
                statement.setInt(15, pack.id_pack_status);
                else
                statement.setNull(15, java.sql.Types.INTEGER);

            if (pack.id_waiting_status != Integer.MIN_VALUE )
                statement.setInt(16, pack.id_waiting_status);
                else
                statement.setNull(16, java.sql.Types.INTEGER);

            if (pack.dfPackRef.code != Integer.MIN_VALUE )
                statement.setInt(17, pack.dfPackRef.code);
                else
                statement.setNull(17, java.sql.Types.INTEGER);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + ins_pack_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        String movement_note = new String("");
        int movement_start_state = 2;
        int movement_id_user = 1381; // под этим кодом должен быть EnergyNET

        //По новой схеме
        if (pack.status==1) {
        	movement_start_state=301;
        } else {
        	movement_start_state=201;
        }


        String ins_movement_sql =
        "insert into cn.acts_movement (" +
            "id_pack, " +
            "id_state, " +
            "startdate, " +
            "note, " +
            "is_completed,  " +
            "id_movement_status, " +
            "id_user_created) " +
        "values (?,?,?,?,?,?,?)";
        try
        {
            statement = connection.prepareStatement(ins_movement_sql);
            statement.setInt(1, pack.code);
            statement.setInt(2, movement_start_state);
            statement.setTimestamp(3, new java.sql.Timestamp( new Date().getTime()));
            statement.setString(4, movement_note);
            statement.setInt(5, 0);
            statement.setInt(6, 1);
            statement.setInt(7, movement_id_user);

            statement.execute();

        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + ins_pack_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        try {if (connection != null) connection.close();}   catch (SQLException e) {}
        }

    }

    }



    public void saveActsPack(CNActsPack pack) throws PersistenceException {

        PreparedStatement statement = null;
        ResultSet  set = null;

        String upd_pack_sql = "UPDATE cn.acts_packages SET " +
        "blank_number = ?," +
        "act_number = ?," +
        "act_date = ?," +
        "act_sum = ?," +
        "pay_sum = ?," +
        "pay_date = ?," +
        "status = ?," +
        "id_pack_status = ?," +
        "name = ?, "+
        "adres_jur = ? "+
        "WHERE id = ?";

        try
        {
            statement = connection.prepareStatement(upd_pack_sql);

            statement.setString(1, pack.blank_number);
            statement.setString(2, pack.act_number);

            if (pack.act_date == null)
            statement.setDate(3, null);
            else
            statement.setDate(3, new java.sql.Date(pack.act_date.getTime()));

            if (pack.act_sum != null)
            pack.act_sum = pack.act_sum.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(4, pack.act_sum);

            if (pack.pay_sum != null)
            pack.pay_sum = pack.pay_sum.setScale(5,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(5, pack.pay_sum);

            if (pack.pay_date == null)
            statement.setDate(6, null);
            else
            statement.setDate(6, new java.sql.Date(pack.pay_date.getTime()));

            if (pack.status != Integer.MIN_VALUE )
                statement.setInt(7, pack.status);
                else
                statement.setNull(7, java.sql.Types.INTEGER);

            if (pack.id_pack_status != Integer.MIN_VALUE )
            statement.setInt(8, pack.id_pack_status);
            else
            statement.setNull(8, java.sql.Types.INTEGER);

            statement.setString(9,pack.name);

            statement.setString(10,pack.address_jur);

            statement.setInt(11, pack.code);



            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + upd_pack_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }



    public void switchMovementForActs(int packCode, int nextState) throws PersistenceException {

        PreparedStatement statement = null;
        ResultSet  set = null;

        int current_movement_id = getMovementIdByPackId(packCode);

        //   первое действие :)
        // завершаем текущее состояние
        String upd_current_movement_sql = "UPDATE cn.acts_movement SET " +
        "  ID_USER = 1381, REALDATE = current_timestamp, IS_COMPLETED = 1, " +
        "  id_movement_status = 0 " +
        "  WHERE ID = " + current_movement_id;

        try
        {
            statement = connection.prepareStatement(upd_current_movement_sql);
            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + upd_current_movement_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        //   второе действие :)
        // вставляем новое состояние
        String insert_next_movement = " INSERT INTO cn.acts_movement " +
          " (ID_PACK, ID_STATE, STARTDATE, NOTE, ID_PARENT, ID_USER, REALDATE, IS_COMPLETED, " +
          " ID_MOVEMENT_STATUS) " +
          " VALUES " +
          " (" + packCode +", " + nextState + ", current_timestamp, NULL," + current_movement_id + ", NULL, NULL, 0, 1)";

        try
        {
            statement = connection.prepareStatement(insert_next_movement);
            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + insert_next_movement);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }


    }

    public int getMovementIdByPackId(int actsPackId) throws PersistenceException
    {
        int out = Integer.MIN_VALUE;

        String get_movement_id_sql = "select id from cn.acts_movement" +
                        " where id_pack = " + actsPackId +
                        " and is_completed = 0";

        PreparedStatement statement = null;
        ResultSet  set = null;

        try
        {
            statement = connection.prepareStatement(get_movement_id_sql);

            set = statement.executeQuery();
            if (set.next())
                out = set.getInt(1);
            else
                throw new EnergyproSystemException("Can't get value from acts_movemene:" + get_movement_id_sql);

            return out;
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + get_movement_id_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            return out;
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }


    public int getCNPackIDByDFPackId(int dfPackId) throws PersistenceException
    {
        int out = Integer.MIN_VALUE;

        String get_pack_id_sql = "select id from cn.acts_packages " +
                        " where dfpackcode = " + dfPackId ;


        PreparedStatement statement = null;
        ResultSet  set = null;

        try
        {
            statement = connection.prepareStatement(get_pack_id_sql);

            set = statement.executeQuery();
            if (set.next())
                out = set.getInt(1);
            else
                throw new EnergyproSystemException("Can't get value from acts_movemene:" + get_pack_id_sql);

            return out;
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + get_pack_id_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            return out;
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }



    public int getStateByDFPackId(int dfPackId) throws PersistenceException
    {
        int out = Integer.MIN_VALUE;

        String get_movement_id_sql = "select m.id_state from cn.acts_movement m,cn.acts_packages p" +
                        " where m.id_pack=p.id and p.dfpackcode = " + dfPackId +
                        " /*and m.is_completed = 0*/ and m.id_movement_status in (1,5)";


        PreparedStatement statement = null;
        ResultSet  set = null;

        try
        {
            statement = connection.prepareStatement(get_movement_id_sql);

            set = statement.executeQuery();
            if (set.next())
                out = set.getInt(1);
            else
                throw new EnergyproSystemException("Can't get value from acts_movemene:" + get_movement_id_sql);

            return out;
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + get_movement_id_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            return out;
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }


    public String getStateNameByDFPackId(int dfPackId) throws PersistenceException
    {
        String out = "";

        String get_movement_id_sql = "select ast.name from cn.acts_movement m,cn.acts_packages p,cn.acts_states ast" +
                        " where m.id_pack=p.id and p.dfpackcode = " + dfPackId +
                        " and ast.id=m.id_state "+
                        " and m.is_completed = 0";


        PreparedStatement statement = null;
        ResultSet  set = null;

        try
        {
            statement = connection.prepareStatement(get_movement_id_sql);

            set = statement.executeQuery();
            if (set.next())
                out = set.getString(1);
            else
                throw new EnergyproSystemException("Can't get value from acts_movemene:" + get_movement_id_sql);

            return out;
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + get_movement_id_sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            return out;
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }

    public int getDSTPackStatus(int id_pack) throws PersistenceException
    {
    	if (id_pack <= 0) {
    		throw new SystemException("\n\nНе задан код пакета для определения текущего статуса!");
    	}

        int out = Integer.MIN_VALUE;

        String sql = "select id_pack_status from dst_packages where id = ?";

        PreparedStatement statement = null;
        ResultSet  set = null;

        try
        {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id_pack);

            set = statement.executeQuery();
            if (set.next())
                out = set.getInt(1);
            else
                throw new EnergyproSystemException("Can't get id_pack_status from dst_packages: " + sql);

            return out;
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + sql);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            return out;
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }


    /**
     *  метод для создания связи пакетов подсистемы ПОСТАВКА БЫТ с пакетами DocFlow
     *
     *  @param cnPackCode - код пакета CN
     *  @param dfPackCode - код пакета DocFlow
     *  @param consumerType - тип потребителя
     */
    public void addPack2Pack(int cnPackCode, int dfPackCode, int consumerType)
            throws PersistenceException {

        PreparedStatement statement = null;
        String sql = "";

        validateConsumerType(consumerType);

        if (consumerType == CNSubsystemType.SS_PHYSICALPERSON) {
            sql = "insert into cn.pp2df (id, id_pp_pack, df_packrefcode) values (?,?,?)";
        } else if (consumerType == CNSubsystemType.SS_SUPPLY) { //NET-4328. Уточнение названия полей
            sql = "insert into cn.spl2df (id, id_spl_pack, df_packrefcode) values (?,?,?)";
        } else {
        	sql = "insert into cn.dst2df (id, id_dst_pack, df_packrefcode) values (?,?,?)";
        }

        try {
            statement = connection.prepareStatement(sql);
            statement.setNull(1, java.sql.Types.INTEGER);

			if (cnPackCode != Integer.MIN_VALUE)
				statement.setInt(2, cnPackCode);
			else
				statement.setNull(2, java.sql.Types.INTEGER);

			if (dfPackCode != Integer.MIN_VALUE)
				statement.setInt(3, dfPackCode);
			else
				statement.setNull(3, java.sql.Types.INTEGER);


            statement.execute();

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + sql);
            throw new SystemException(e.getMessage(), e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
        }
    }

    /**
     *  проверка принадлежности пакета подсистемам поставки э/э
     *  @param consumerType - тип потребителя
     */
    public void validateConsumerType(int consumerType) {
        if (consumerType != CNSubsystemType.SS_PHYSICALPERSON
                && consumerType != CNSubsystemType.SS_SUPPLY
                && consumerType != CNSubsystemType.SS_DISTRIBUTION) {
            throw new SystemException("\n \n" +
                    "Пакет не належить до підсистем постачання електроенергії!!!");
        }
    }



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

	//PRIC-674. Генерация реестра поставки на общедоступной директории сервера приложений EnergyNet-отчётности
	public String generationReportForSite() {
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


			String reportName = "/com/ksoe/energynet/reports/EWF/SS_SUPPLY/rtSupplyRegistry.jasper";
			String reportPath = "/u02/share";

	        JasperReport jasperReport = (JasperReport) JRLoader.loadObject(getClass().getResourceAsStream(reportName));
	        System.out.println("jasperReport loaded ");

	        // Fill parameters
	        Map parameters = new HashMap();
	        parameters.put("userProfile", userProfile);
	        // Fill report and make PDF
	        //JasperPrint jasperPrint = JasperManager.fillReport(jasperReport, parameters, connection);
	        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
	        System.out.println("report filled ");

	        //byte[] arr = JasperManager.printReportToPdf(jasperPrint);
	        byte[] arr = JasperExportManager.exportReportToPdf(jasperPrint);

	        System.out.println("jasperReport printed to pdf ");

			//String outReport = "rtSupplyRegistry_"+(new Date()).getTime()+".pdf";

			//PRIC-674. Для успешного срабатывания скрипта cn_update наименование выходного
			//файла  отчётности должно быть фиксированным, не зависящим от даты и времени
			String outReport = "SupplyRegistry_1001815.pdf";

	        FileOutputStream fos = new FileOutputStream(reportPath+"/"+outReport);
	        fos.write(arr);
	        fos.close();
	        return outReport;

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
		}

		finally {
			try {
				if (connection != null && !connection.isClosed()) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {
			}
		}
		return null;
	}


    /**
     *  возвращает № телефона заказчика на договора о поставке электроэнергии подсистемы ПОСТАВКА БЫТ по  коду пакета
     *
     *  @param cnPackCode - код пакета CN
     *
     *  @return customerPhone
     */
    public String getCustomerPhone(int cnPackCode)
            throws PersistenceException {

    	String customerPhone = "";
        PreparedStatement statement = null;
        ResultSet set = null;
        String sql = "";

        sql = "select p.phone_number from cn.pp_packages p where p.id = ?";

        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, cnPackCode);

            set = statement.executeQuery();
            if (set.next())
            	customerPhone = set.getString(1);

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + sql);
            throw new SystemException(e.getMessage(), e);
        } finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
        }

		return customerPhone;
    }


    /**
     *  возвращает ФИО заказчика на договора о поставке электроэнергии подсистемы ПОСТАВКА БЫТ по  коду пакета
     *
     *  @param cnPackCode - код пакета CN
     *
     *  @return customerName
     */
    public String getCustomerName(int cnPackCode)
            throws PersistenceException {

    	String customerName = "";
        PreparedStatement statement = null;
        ResultSet set = null;
        String sql = "";


        sql = "select p.name from cn.pp_packages p where p.id = ?";

        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, cnPackCode);

            set = statement.executeQuery();
            if (set.next())
            	customerName = set.getString(1);

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + sql);
            throw new SystemException(e.getMessage(), e);
        } finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
        }

		return customerName;
    }


    /**
     *  возвращает дату регистрации договора о поставке электроэнергии подсистемы ПОСТАВКА БЫТ по  коду пакета
     *
     *  @param cnPackCode - код пакета CN
     *
     *  @return contractDate
     */
    public Date getContractDate(int cnPackCode)
            throws PersistenceException {

    	Date contractDate = null;
        PreparedStatement statement = null;
        ResultSet set = null;
        String sql = "";


        sql = "select p.date_spl_contract from cn.pp_packages p where p.id = ?";

        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, cnPackCode);

            set = statement.executeQuery();
            if (set.next())
            	contractDate = set.getDate(1);

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + sql);
            throw new SystemException(e.getMessage(), e);
        } finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
        }

		return contractDate;
    }


    /**
     *  возвращает код пакета подсистемы ПОСТАВКА БЫТ(ПРОМ) по пакету DocFlow
     *
     *  @param dfPackCode - код пакета DocFlow
     *  @param consumerType - тип потребителя
     *
     *  @return cnPackCode - код пакета CN
     */
    public int getCNPack2DFPack(int dfPackCode, int consumerType)
            throws PersistenceException {

    	int cnPackCode = Integer.MIN_VALUE;
        PreparedStatement statement = null;
        ResultSet set = null;
        String sql = "";

        if (consumerType == CNSubsystemType.SS_PHYSICALPERSON) {
            sql = "select id_pp_pack from cn.pp2df where df_packrefcode = ? ";
        } else {
            sql = "select id_spl_pack from cn.spl2df where df_packrefcode= ? ";
        }

        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, dfPackCode);

            set = statement.executeQuery();
            if (set.next())
            	cnPackCode = set.getInt(1);

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + sql);
            throw new SystemException(e.getMessage(), e);
        } finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
        }

		return cnPackCode;
    }


    /**
     * Получить список движения пакета EnergyWorkFlow
     *
     * @param cnPackCode - код пакета
     * @return DFDocMovementShortList
     */
	public DFDocMovementShortList getCNPackStateList(int cnPackCode, int docSupplyEEType)
			throws SQLException {

		String selectStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;

		try {

			DFDocMovementShortList result = new DFDocMovementShortList();
			DFDocMovementShort anObject;
			result.list = new Vector();

			if (docSupplyEEType == DFDocSupplyEEType.SUPPLY) {

				selectStr = "select "
					+ " s.name as state_name, "
					+ " a.startdate, "
					+ " a.realdate, "
					+ " a.note, "
					+ " u.fio as user_fio "

					+ " from cn.pp_movement a left join cn.cn_users u on  "
					+ " (a.id_user = u.id and (a.canceled <> 1 or a.canceled is null)), "
					+ " cn.pp_states s "

					+ " where a.id_state = s.id "
					+ " and (a.canceled <> 1 or a.canceled is null) "
					+ " and a.id_pack = ? "

					+ " order by a.startdate";

			} else if (docSupplyEEType == DFDocSupplyEEType.DISTRIBUTION) {

				selectStr = "select "
						+ " s.name as state_name, "
						+ " a.startdate, "
						+ " a.realdate, "
						+ " a.note, "
						+ " u.fio as user_fio "

						+ " from cn.dst_movement a left join cn.cn_users u on  "
						+ " (a.id_user = u.id and (a.canceled <> 1 or a.canceled is null)), "
						+ " cn.dst_states s "

						+ " where a.id_state = s.id "
						+ " and (a.canceled <> 1 or a.canceled is null) "
						+ " and a.id_pack = ? "

						+ " order by a.startdate";

			} else {

				throw new SystemException("\n\nНевідомий тип договору (" + docSupplyEEType + ") !");

			}

			statement = connection.prepareStatement(selectStr);
			statement.setInt(1, cnPackCode);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {

				anObject = new DFDocMovementShort();

				anObject.docRefDescription = set.getString(1);
				anObject.dateStart = set.getTimestamp(2);
				anObject.dateFinish = set.getTimestamp(3);
				anObject.commentgen = set.getString(4);
				anObject.userGen = set.getString(5);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;

		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}
	}


	/** возвращает  "Гранична дата виконання робіт" и " айди поразделения " и наименование подразделения -  по айди cnpackcode  */
	public  String[] getBuildingDateAndRenFromCN(int packCode, int subsystemCode)
			throws SQLException {

		String selectStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;

		String[] result = new String[4];

		try {

			String query = "";

            switch (subsystemCode) {
            case (CNSubsystemType.SS_CONNECTION): {
                query = "select r.id, r.name , q.buildingdate , r.endepartmentcode from cn.cn_packages q , cn.cn_ren r where q.id_ren = r.id and q.id = " + packCode;
                break;
            }
            case (CNSubsystemType.SS_NEWCONNECTION): {
                query = "select r.id, r.name , q.buildingdate , r.endepartmentcode from cn.ncn_packages q , cn.cn_ren r where q.id_ren = r.id and q.id =" + packCode;
                break;
            }
            case (CNSubsystemType.SS_CONNECTION_20110314): {
                query = "select r.id, r.name , q.buildingdate , r.endepartmentcode from cn.cn_20110314_packages q , cn.cn_ren r where q.id_ren = r.id and q.id = " + packCode;
                break;
            }
            case (CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER): {
                query = "select r.id, r.name , q.buildingdate , r.endepartmentcode  from cn.eap_packages q , cn.cn_ren r where q.id_ren = r.id and q.id = " + packCode;
                break;
            }
			case (CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER): {
                query = "select r.id, r.name , q.buildingdate , r.endepartmentcode  from cn.adso_packages q , cn.cn_ren r where q.id_ren = r.id and q.id = " + packCode;
                break;
            }
            }

			statement = connection.prepareStatement(query);
		//	statement.setInt(1, packCode);

			if(query.equals("")){
				return result;
			}

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				result[0]= set.getInt(1)+""; // id podr
				result[1]= set.getString(2)+""; // name podr
				if(set.getDate(3) == null){
					result[2] = "";
				} else
				result[2]= new SimpleDateFormat("dd.MM.yyyy").format(set.getDate(3)); // granichna data

				result[3]= set.getInt(4)+""; // endepartmentcode
			}

			return result;

		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}
	}



	/**
	 *  Создание документа
	 *
	 *  @param ssPrefix - подсистема
	 *  @param name - наименование документа
	 *  @param id_pack - код пакета
	 *  @param datedoc - дата документа
	 *  @param numberdoc - номер документа
	 *  @param jira_task - Электронное задание в комплексе Jira
	 *  @param client_ip - Internet Protocol of WorkFlow-client
	 *
	 */
	public int addCNDoc(String ssPrefix, String name, int id_pack, Date datedoc, int id_doctype, String numberdoc,
			String jira_task, String client_ip) {

		int id = Integer.MIN_VALUE;
		PreparedStatement statement = null;
		ResultSet set = null;

		String sqlId = "select nextval('sq_" + ssPrefix + "_doc')";
		try {
			statement = connection.prepareStatement(sqlId);
			set = statement.executeQuery();

			if (set.next())
				id = set.getInt(1);

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement -"  + sqlId);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			set = null;
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			statement = null;
		}


		String sql =  " INSERT INTO cn." + ssPrefix + "_doc (id, name, id_pack, datedoc, id_doctype, numberdoc, jira_task, client_ip) "
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setString(2, name);
            statement.setInt(3, id_pack);
            statement.setDate(4, new java.sql.Date(datedoc.getTime()));
            statement.setInt(5, id_doctype);
            statement.setString(6, numberdoc);
            statement.setString(7, jira_task);
            statement.setString(8, client_ip);

            statement.execute();

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement -"  + sql);
            throw new SystemException(e.getMessage(), e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
        }

		return id;
    }


	/**
	 *  Создание вложения к документу
	 *
	 */
	public void addCNAttachments(String ssPrefix, String name, int id_doc, String filename, Date attached_date,
			Date datedoc, String numberdoc, String filelink) {

		int id = Integer.MIN_VALUE;
		PreparedStatement statement = null;
		ResultSet set = null;

		String sqlId = "select nextval('sq_" + ssPrefix + "_attachments')";
		try {
			statement = connection.prepareStatement(sqlId);
			set = statement.executeQuery();

			if (set.next())
				id = set.getInt(1);

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement -"  + sqlId);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			set = null;
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			statement = null;
		}


		/** personalcabuser */
		int idUser = 4;

		/** is_external - Истина, если файл вложен пользователем ПЕРСОНАЛЬНОГО КАБИНЕТА */
		boolean is_external = true;

		String sql =  " INSERT INTO cn." + ssPrefix + "_attachments (id, name, file, id_doc, id_movement, id_user, is_doc, "
				+ " filename, attached_date, is_packed, id_parent, datedoc, numberdoc, filelink, "
				+ " ctrl_sum_crc32, cipherpassw, cipheralg, archiveway, id_appeal, jira_task, is_del, client_ip, is_external) "
				+ " VALUES (?, ?, NULL, ?, NULL, ?, 0, ?, ?, 1, NULL, ?, ?, ?, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, ?)";

        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setString(2, name);
            statement.setInt(3, id_doc);
            statement.setInt(4, idUser);
            statement.setString(5, filename);
            statement.setDate(6, new java.sql.Date(attached_date.getTime()));
            statement.setDate(7, new java.sql.Date(datedoc.getTime()));
            statement.setString(8, numberdoc);
            statement.setString(9, filelink);
            statement.setBoolean(10, is_external);

            statement.execute();

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement -"  + sql);
            throw new SystemException(e.getMessage(), e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
        }

	}



	/**
	 *	сохранение массива вложений к пакету СN
	 *
	 *  @param packId
	 *  @param id_subsystem
	 *	@param Attachment[]
	 */
	public void addAttachments(int packId, int id_subsystem, Attachment[] attachments) {
		try {
			for (Attachment attachment : attachments) {

				/** определение подсистемы и поиск пакета */
				// Нафига оно в аттачменте, если мы код подсистемы отдельным параметром передаем??
				//id_subsystem = attachment.getIdSubsystem();
				if (id_subsystem <= 0) {

					id_subsystem = attachment.getIdSubsystem();

					if (id_subsystem <= 0) {
						throw new SystemException("Неизвестная подсистема EnergyWorkFlow!");
					}

				}

	            /** перекодируем байтовый массив */
	            // BASE64Decoder bs64 = new BASE64Decoder();
	            // byte[] fileDecodeArr = bs64.decodeBuffer(new String(file));

	            // DEBUG !!!!
	            byte[] fileDecodeArr = attachment.getFile();

	            /** сохранить в файловую систему и упаковать */
	            String tmpDir = System.getProperty("jboss.server.temp.dir");
	            String outDir = tmpDir + "/" + (new Date()).getTime();

	            final String fileName = attachment.getFileName();
	            String outFile = outDir + "/" + fileName;

	            File dir = new File(outDir);
	            dir.mkdirs();

	            FileOutputStream fos = new FileOutputStream(outFile);
	            fos.write(fileDecodeArr);
	            fos.close();


	            // make zip file
	            String ext = ".7z";
	            String outZipFile = "_" + (new Date()).getTime() + ext;

	            //////////////////
	            OutputStream archiveStream = new FileOutputStream(outDir + "/" + outZipFile);
	            ArchiveOutputStream archive = new ArchiveStreamFactory().createArchiveOutputStream(ArchiveStreamFactory.ZIP, archiveStream);

	            ZipArchiveEntry entry = new ZipArchiveEntry(outDir + "/" + fileName);
	            archive.putArchiveEntry(entry);


	            BufferedInputStream input = new BufferedInputStream(new FileInputStream(outDir + "/" + fileName));

	            IOUtils.copy(input, archive);
	            input.close();
	            archive.closeArchiveEntry();


	            archive.finish();
	            archiveStream.close();
	            /////////////////


	            System.out.println("########## saveFiles2ConnectionPack... fileName = " + fileName);


	            /** архив в байтовый массив */
	            byte[] outZipArr = Tools.readBytesFromFile(outDir + "/" + outZipFile);


	            String ssPrefix = "";
	            String dirToCreate = "";

				if (id_subsystem == CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER) {
					ssPrefix = "eap";
					dirToCreate = "SS_ELECTRICINSTALLACCESSPOWER";
				} else if (id_subsystem == CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER) {
					ssPrefix = "adso";
					dirToCreate = "SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER";
				} else if (id_subsystem == CNSubsystemType.SS_PHYSICALPERSON) {
					ssPrefix = "pp";
					dirToCreate = "SS_PHYSPERSON";
				} else if (id_subsystem == CNSubsystemType.SS_DISTRIBUTION) {
					ssPrefix = "dst";
					dirToCreate = "SS_DISTRIBUTION";
				} else {
					throw new SystemException("\n\n"
							+ "Неизвестна подсистема EnergyWorkFlow");
				}


	            /** создание doc-a */
	            int docId = this.addCNDoc(
	                    ssPrefix,
	                    attachment.getFileDescription(),
	                    packId,
	                    new Date(),
	                    attachment.getDocTypeCode(),
	                    "", "", "");


	            /** сохранение вложения на FTP */
	            Calendar calendar = Calendar.getInstance();
	            String date = String.format("%tY%tm", calendar, calendar);

	            dirToCreate = dirToCreate + "/" + date + "/s" + id_subsystem + "p" + packId;

	            Context cnt = new InitialContext();
	            Object objRef = cnt.lookup(ENReportController.JNDI_NAME);
	            ENReportControllerHome reportHome = (ENReportControllerHome) PortableRemoteObject
	                    .narrow(objRef, ENReportControllerHome.class);
	            ENReportController reportController = reportHome.create();

	  //          reportController.saveByFTP(outZipArr, PersonalCabinetFtpInfo.un, PersonalCabinetFtpInfo.pw,
	 //                  PersonalCabinetFtpInfo.ip, dirToCreate, outZipFile);


	            String attachmentFileLink = "/" + date + "/s" + id_subsystem + "p" + packId + "/" + outZipFile;

	            /** создание attachments */
	            this.addCNAttachments(ssPrefix, attachment.getFileDescription(), docId, fileName, new Date(), new Date(), "",
	                    attachmentFileLink);


	            /** почистим место */
				FileUtils.deleteDirectory(new File(outDir));
			}

		} catch (FileNotFoundException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (IOException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (ArchiveException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	public void convertAttachments4CN(int socode) {
		try {

	    	CNAttachmentDAO attDAO = new CNAttachmentDAO(userProfile, getConnection(AuthorizationJNDINames.CN_DATASOURCE));

            Context cnt = new InitialContext();
            Object objRef = cnt.lookup(ENReportController.JNDI_NAME);
            ENReportControllerHome reportHome = (ENReportControllerHome) PortableRemoteObject
                    .narrow(objRef, ENReportControllerHome.class);
            ENReportController reportController = reportHome.create();

            Object objRef2 = cnt.lookup(ENDocAttachmentController.JNDI_NAME);
            ENDocAttachmentControllerHome attHome = (ENDocAttachmentControllerHome) PortableRemoteObject
                    .narrow(objRef2, ENDocAttachmentControllerHome.class);
            ENDocAttachmentController attController = attHome.create();

            ENDocAttachmentDAO daDAO = new ENDocAttachmentDAO(userProfile, getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENDocAttachment2ENServicesObjectDAO da2soDAO = new ENDocAttachment2ENServicesObjectDAO(userProfile, getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            CNAttachmentFilter attFilter = new CNAttachmentFilter();
            attFilter.soCode = socode;
	    	CNAttachmentShortList attList = attDAO.getCNAttachmentsList4CN(attFilter, 0, -1);

			for (int i=0;attList.totalCount>i;i++) {

				///
	            String filePath = "";

	            String dir = attList.get(i).filelink;
	            String fn = "";
	            Boolean isTrashFile = false;

	            String attDir = FilenameUtils.getPath(dir);
	            fn = FilenameUtils.getName(dir);

	            filePath = reportController.readFromFTPToFile("username", "password", "", attDir, fn);

	            if (filePath.equalsIgnoreCase("_NOT_FOUND_")) {
	            	attDir = "Trash/" + attDir;
	            	filePath = reportController.readFromFTPToFile("username", "password", "", attDir, fn);
	            	isTrashFile = true;
	            	if (isTrashFile) System.out.println("# convertAtt - isTrashFile - " + filePath);
	            }

	            if (filePath.equalsIgnoreCase("_NOT_FOUND_")) {
	            	attDAO.removeCN(attList.get(i).prefix, attList.get(i).code);
	                System.out.println("# convertAtt - removeCNAttachment - " + attList.get(i).prefix + " id - " + attList.get(i).code);
	            	continue;
	            }

                System.out.println("# convertAtt - get File From FTP - " + filePath);

	            File file = new File(filePath);
	            if (!file.exists() || !file.canRead()) {
	                System.out.println("File cannot be read");
	                continue;
	            }

	            String tmpDirr = FilenameUtils.getFullPath(filePath);

	            ///
	            try {
	            SevenZFile sevenZFile = new SevenZFile(file);
	            SevenZArchiveEntry entry = sevenZFile.getNextEntry();
	            while(entry!=null){
	                System.out.println("# convertAtt - get Entry - " + tmpDirr + entry.getName());
	                byte[] content = new byte[(int) entry.getSize()];
	                sevenZFile.read(content, 0, content.length);

	                String fileFromArchiveName = entry.getName();
		            String transliteratedFileName = Tools.transliterate(fileFromArchiveName, false, true);

		            //// через контроллер докатачмента
			         Calendar calendar = Calendar.getInstance();
				     String date = String.format("%tY%tm", calendar, calendar);

		            String dirToCreate = "CN_UNPACKED_DOCS/Services/" + date + "/" + attList.get(i).soCode;

		            ENDocAttachment da = new ENDocAttachment();
		            da.commentGen = fileFromArchiveName;

		            int daCode = attController.add(da, content, fileFromArchiveName, dirToCreate);;
		            System.out.println("# convertAtt - addENDocAttachment - fileName = " + dirToCreate + transliteratedFileName);

		            ENDocAttachment2ENServicesObject da2so = new ENDocAttachment2ENServicesObject();
		            da2so.kindRef.code = ENAttachment2ServicesKind.CN_OLD_DOCS;
		            da2so.servicesObjectRef.code = attList.get(i).soCode;
		            da2so.docAttachmentRef.code = daCode;
		            da2soDAO.add(da2so);
		            System.out.println("# convertAtt - addENDocAttachment2SO - docCode = " + daCode + " soCode = " + attList.get(i).soCode);

		            attDAO.updateCNAttachment(attList.get(i).prefix, attList.get(i).code, daCode);
		            System.out.println("# convertAtt - updateCNAttachment - attCode = " + attList.get(i).code + " prefix - " + attList.get(i).prefix);

	                entry = sevenZFile.getNextEntry();
	            }
	            sevenZFile.close();

	            } catch (IOException e) {
	                e.printStackTrace();
	            }


	            //  наверное нужно переместить файл, что б знать сколько мы обработали
	            // и можно было вернуть, если что пойдет не так, а если файл перемещен
	            // то оставим всё как было

	            if (!isTrashFile) {
		            byte[] fileArr = Tools.readBytesFromFile(filePath);
		            String dirToRelocate = "Trash/" + attDir;
		            reportController.saveByFTP(fileArr, "username", "password", "", dirToRelocate, fn);
		            System.out.println("# convertAtt - relocateArchiveAttachment -  " + dirToRelocate + "| file - " + fn);

		            reportController.deleteByFTP("username", "password", "", attDir, fn);
		             System.out.println("# convertAtt - deleteAttachment -  " + attDir + "| file - " + fn);
	            }

	            file.delete();

			}

	//	} catch (FileNotFoundException e) {
	//		throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
                throw new SystemException(e.getMessage(), e);

	//	} catch (IOException e) {
	//		throw new SystemException(e.getMessage(), e);
	//	} catch (ArchiveException e) {
	//		throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}  catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}  catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

	}



	public void convertAttachments(int id, String prefix) {
		try {

	    	CNAttachmentDAO attDAO = new CNAttachmentDAO(userProfile, getConnection(AuthorizationJNDINames.CN_DATASOURCE));

            Context cnt = new InitialContext();
            Object objRef = cnt.lookup(ENReportController.JNDI_NAME);
            ENReportControllerHome reportHome = (ENReportControllerHome) PortableRemoteObject
                    .narrow(objRef, ENReportControllerHome.class);
            ENReportController reportController = reportHome.create();

            Object objRef2 = cnt.lookup(ENDocAttachmentController.JNDI_NAME);
            ENDocAttachmentControllerHome attHome = (ENDocAttachmentControllerHome) PortableRemoteObject
                    .narrow(objRef2, ENDocAttachmentControllerHome.class);
            ENDocAttachmentController attController = attHome.create();

            ENDocAttachmentDAO daDAO = new ENDocAttachmentDAO(userProfile, getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            CNAttachmentFilter attFilter = new CNAttachmentFilter();
            attFilter.conditionSQL = " cnattachment.id = " + id + " and cnattachment.prefix = '" + prefix + "'";
	    	CNAttachmentShortList attList = attDAO.getCNAttachmentsList(attFilter, 0, -1);

			for (int i=0;attList.totalCount>i;i++) {

				///
	            String filePath = "";

	            String dir = attList.get(i).filelink;
	            String fn = "";
	            Boolean isTrashFile = false;

	            String attDir = FilenameUtils.getPath(dir);
	            fn = FilenameUtils.getName(dir);

	            filePath = reportController.readFromFTPToFile("username", "password", "", attDir, fn);

	            if (filePath.equalsIgnoreCase("_NOT_FOUND_")) {
	            	attDir = "Trash/" + attDir;
	            	filePath = reportController.readFromFTPToFile("username", "password", "", attDir, fn);
	            	isTrashFile = true;
	            	if (isTrashFile) System.out.println("# convertAtt - isTrashFile - " + filePath);
	            }

	            if (filePath.equalsIgnoreCase("_NOT_FOUND_")) {
	            	attDAO.removeCN(attList.get(i).prefix, attList.get(i).code);
	                System.out.println("# convertAtt - removeCNAttachment - " + attList.get(i).prefix + " id - " + attList.get(i).code);
	            	continue;
	            }

                System.out.println("# convertAtt - get File From FTP - " + filePath);

	            File file = new File(filePath);
	            if (!file.exists() || !file.canRead()) {
	                System.out.println("File cannot be read");
	                continue;
	            }

	            String tmpDirr = FilenameUtils.getFullPath(filePath);

	            ///
	            try {
	            SevenZFile sevenZFile = new SevenZFile(file);
	            SevenZArchiveEntry entry = sevenZFile.getNextEntry();
	            while(entry!=null){
	                System.out.println("# convertAtt - get Entry - " + tmpDirr + entry.getName());
	                byte[] content = new byte[(int) entry.getSize()];
	                sevenZFile.read(content, 0, content.length);

	                String fileFromArchiveName = entry.getName();
		            String transliteratedFileName = Tools.transliterate(fileFromArchiveName, false, true);

		            //// через контроллер докатачмента
				    String date =  new SimpleDateFormat("yyyyMM").format(attList.get(i).date_doc);

		            String dirToCreate = "CN_UNPACKED_DOCS/" + attList.get(i).prefix + "/" + date + "/" + attList.get(i).code;

		            ENDocAttachment da = new ENDocAttachment();
		            da.commentGen = fileFromArchiveName;

		            int daCode = attController.add(da, content, fileFromArchiveName, dirToCreate);;
		            System.out.println("# convertAtt - addENDocAttachment - fileName = " + dirToCreate + transliteratedFileName);

		            attDAO.updateCNAttachment(attList.get(i).prefix, attList.get(i).code, daCode);
		            System.out.println("# convertAtt - updateCNAttachment - attCode = " + attList.get(i).code + " prefix - " + attList.get(i).prefix);

	                entry = sevenZFile.getNextEntry();
	            }
	            sevenZFile.close();

	            } catch (IOException e) {
	                e.printStackTrace();
	            }


	            //  наверное нужно переместить файл, что б знать сколько мы обработали
	            // и можно было вернуть, если что пойдет не так, а если файл перемещен
	            // то оставим всё как было

	            if (!isTrashFile) {
		            byte[] fileArr = Tools.readBytesFromFile(filePath);
		            String dirToRelocate = "Trash/" + attDir;
		            reportController.saveByFTP(fileArr, "username", "password", "", dirToRelocate, fn);
		            System.out.println("# convertAtt - relocateArchiveAttachment -  " + dirToRelocate + "| file - " + fn);

		            reportController.deleteByFTP("username", "password", "", attDir, fn);
		             System.out.println("# convertAtt - deleteAttachment -  " + attDir + "| file - " + fn);
	            }

	            file.delete();

			}

	//	} catch (FileNotFoundException e) {
	//		throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
                throw new SystemException(e.getMessage(), e);

	//	} catch (IOException e) {
	//		throw new SystemException(e.getMessage(), e);
	//	} catch (ArchiveException e) {
	//		throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}  catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}  catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

	}


	public void transliterateAttachments(int soCode) {
		try {


            Context cnt = new InitialContext();
            Object objRef = cnt.lookup(ENReportController.JNDI_NAME);
            ENReportControllerHome reportHome = (ENReportControllerHome) PortableRemoteObject
                    .narrow(objRef, ENReportControllerHome.class);
            ENReportController reportController = reportHome.create();

            ENDocAttachmentDAO daDAO = new ENDocAttachmentDAO(userProfile, getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENDocAttachmentServerDAO daServDAO = new ENDocAttachmentServerDAO(userProfile, getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


            ENDocAttachmentFilter daFilter = new ENDocAttachmentFilter();
            daFilter.conditionSQL = " code in (select dd.docattachmentrefcode" +
                                    " from endcttchmnt2nsrvcsbjct dd" +
                                    " where dd.servicesobjectrefcode =" + soCode +")" ;
	    	ENDocAttachmentShortList daList = daDAO.getScrollableFilteredList(daFilter, 0, -1);


			for (int i=0;daList.totalCount>i;i++) {

	            String filePath = "";

	            String dir = daList.get(i).fileLink;
	            String fn = "";

	            String attDir = FilenameUtils.getPath(dir);
	            fn = FilenameUtils.getName(dir);

	            String transliteratedFileName = Tools.transliterate(fn, false, true);

	            if (!transliteratedFileName.equalsIgnoreCase(fn)) {

	            ENDocAttachment da = daDAO.getObject(daList.get(i).code);
	            ENDocAttachmentServer daServ = daServDAO.getObject(da.serverRef.code);

	            filePath = reportController.readFromFTPToFile(daServ.userName, daServ.userPass, daServ.serverIp, attDir, fn);

                System.out.println("# transliterateAtt - get File From FTP - " + filePath);

	            File file = new File(filePath);
	            if (!file.exists() || !file.canRead()) {
	                System.out.println("File cannot be read");
	                return;
	            }

	            String tmpDirr = FilenameUtils.getFullPath(filePath);

	            File renamedFile = new File(tmpDirr + transliteratedFileName);
	            file.renameTo(renamedFile);

	            byte[] renamedFileArr = Tools.readBytesFromFile(tmpDirr + transliteratedFileName);

	            reportController.saveByFTP(renamedFileArr, daServ.userName, daServ.userPass, daServ.serverIp, attDir, transliteratedFileName);
	            System.out.println("# transliterateAtt - saveTransliteratedFile2FTP - fileName = " + attDir + transliteratedFileName);
	            ///

	            da.fileLink = attDir + transliteratedFileName;
	            da.dateEdit = new Date();
	            da.userGen = "energynet";
	            daDAO.save(da);

	            renamedFile.delete();
	            reportController.deleteByFTP(daServ.userName, daServ.userPass, daServ.serverIp, attDir, fn);
	            System.out.println("# transliterateAtt - deleteAttachment -  " + attDir + "| file - " + fn);

	            }
			}

	//	} catch (FileNotFoundException e) {
	//		throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
                throw new SystemException(e.getMessage(), e);

	//	} catch (IOException e) {
	//		throw new SystemException(e.getMessage(), e);
	//	} catch (ArchiveException e) {
	//		throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}  catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}  catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

	}


	public void relocateAttachments() {
		try {


            Context cnt = new InitialContext();
            Object objRef = cnt.lookup(ENReportController.JNDI_NAME);
            ENReportControllerHome reportHome = (ENReportControllerHome) PortableRemoteObject
                    .narrow(objRef, ENReportControllerHome.class);
            ENReportController reportController = reportHome.create();

            Object objRef2 = cnt.lookup(ENDocAttachmentController.JNDI_NAME);
            ENDocAttachmentControllerHome attHome = (ENDocAttachmentControllerHome) PortableRemoteObject
                    .narrow(objRef2, ENDocAttachmentControllerHome.class);
            ENDocAttachmentController attController = attHome.create();

            ENDocAttachmentDAO daDAO = new ENDocAttachmentDAO(userProfile, getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENDocAttachmentFilter docAttachmentFilter = new ENDocAttachmentFilter();
            docAttachmentFilter.serverRef.code = ENDocAttachmentServer.PRIMARY_SERVER_CODE;

            ENDocAttachmentShortList attList = daDAO.getScrollableFilteredList(docAttachmentFilter,0,-1);
			//daDAO.getLinksList();

			for (int i=0;attList.totalCount>i;i++) {

				String filePath = "";

	            String dir = attList.get(i).fileLink;
	            String fn = "";

	            String attDir = FilenameUtils.getPath(dir);
	            fn = FilenameUtils.getName(dir);

	            filePath = reportController.readFromFTPToFile(attList.get(i).serverRefUserName, attList.get(i).serverRefUserPass, attList.get(i).serverRefServerIp, attDir, fn);

                System.out.println("# relocateAtt - get File From FTP - " + filePath);

	            File file = new File(filePath);
	            if (!file.exists() || !file.canRead()) {
	                System.out.println("File cannot be read");
	                continue;
	            }

	            String tmpDirr = FilenameUtils.getFullPath(filePath);

	            byte[] fileArr = Tools.readBytesFromFile(filePath);
	            String dirToRelocate = attDir;
	            reportController.saveByFTP(fileArr, "cnftp2021", "KabraChupa2021", "10.77.11.61", dirToRelocate, fn);
	            System.out.println("# relocateAtt - saveAttachment -  " + dirToRelocate + "| file - " + fn);

	            reportController.deleteByFTP(attList.get(i).serverRefUserName, attList.get(i).serverRefUserPass, attList.get(i).serverRefServerIp, attDir, fn);
	            System.out.println("# relocateAtt - deleteAttachment -  " + attDir + "| file - " + fn);

	            long filesize = file.length();

	            file.delete();

				/// апдейт сервака
					ENDocAttachment daObj = daDAO.getObject(attList.get(i).code);
					daObj.serverRef.code = ENDocAttachmentServer.ARCHIVE_2_SERVER_CODE;
					daObj.filesize = filesize;
					daDAO.save(daObj);


			}

	//	} catch (FileNotFoundException e) {
	//		throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
                throw new SystemException(e.getMessage(), e);

	//	} catch (IOException e) {
	//		throw new SystemException(e.getMessage(), e);
	//	} catch (ArchiveException e) {
	//		throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		}  catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}  catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}

	}


	   public void setpackcurrentstateadso(int packId) throws PersistenceException
	    {
	        int out = Integer.MIN_VALUE;

	        String setpackcurrentstateadso = "select cn.setpackcurrentstateadso("+
	        		packId+ ",101,3,5,'Вкладення документів з сайту','10.77.11.2');";

	        PreparedStatement statement = null;
	        ResultSet  set = null;

	        try
	        {
	            statement = connection.prepareStatement(setpackcurrentstateadso);

	            set = statement.executeQuery();

	        }
	        catch(SQLException e)
	        {
	            System.out.println(e.getMessage()+"\nstatement - " + setpackcurrentstateadso);
	            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
	        }
	        finally
	        {
	        try {if (set != null) set.close();}             catch (SQLException e) {}
	        try {if (statement != null) statement.close();} catch (SQLException e) {}
	        statement = null;
	        }
	    }

	/**
	 *    Обновляем EIC для DFDocSupplyEE
	 *
	 * @param cnDSTPackCode  - Код пакета DST
	 * @param eic			- EIC-код точки обліку
	 * @throws PersistenceException
	 */
	public void updateEICDFDocSupplyEE(int cnDSTPackCode, String eic) throws PersistenceException {

		Connection docFlowConnection = null;

		try {
				docFlowConnection = getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE);
				DFDocSupplyEEDAO objectDAO = new DFDocSupplyEEDAO(docFlowConnection, userProfile);

				DFDocSupplyEE dfDocSupplyEE = getDFDocSupplyEEByCNPackCode(cnDSTPackCode);

				//(кроме договоров с типом "Розірвання договору" и "Виключення з договору одного з об'єктів")
				if (dfDocSupplyEE.contractType != DFSupplyContractType.CONTRACTTYPE_CONTRACT_BREACH &&
						dfDocSupplyEE.contractType != DFSupplyContractType.CONTRACTTYPE_OBJECT_EXCLUSION) {

						dfDocSupplyEE.eic = eic;
						objectDAO.save(dfDocSupplyEE);
				}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (docFlowConnection != null && !docFlowConnection.isClosed()) {
					docFlowConnection.close();
					docFlowConnection = null;
				}
			} catch (SQLException e) {
			}
		}

	}

}
