
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENIP;
 *
 */

import java.io.IOException;
import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;







import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.dataminer.DFDocDecreeDAO;
import com.ksoe.docflow.ejb.DFDocAttachmentController;
import com.ksoe.docflow.ejb.DFDocAttachmentControllerHome;
import com.ksoe.docflow.logic.AttachmentsLogic;
import com.ksoe.docflow.valueobject.DFDocAttachment;
import com.ksoe.docflow.valueobject.DFDocDecree;
import com.ksoe.energynet.dataminer.ENAct2HumenDAO;
import com.ksoe.energynet.dataminer.ENAct2ProvDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENDelayServicesDAO;
//import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2ContractDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENIPDAO;
import com.ksoe.energynet.dataminer.ENIPItem2ContractDAO;
import com.ksoe.energynet.dataminer.ENIPItem2ENIPItemDAO;
import com.ksoe.energynet.dataminer.ENIPItem2PlanDAO;
import com.ksoe.energynet.dataminer.ENIPItem2TKMaterialsDAO;
import com.ksoe.energynet.dataminer.ENIPItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItem2TKKoefDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.FINExecutorDAO;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.dataminer.SCLogicDAO;
import com.ksoe.energynet.dataminer.SCUsageInputDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZ2ProvDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZDAO;
import com.ksoe.energynet.ejb.generated.ENIPControllerEJBGen;
import com.ksoe.energynet.logic.AXConsts;
import com.ksoe.energynet.logic.ActCalculator;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.EstimateLogic;
import com.ksoe.energynet.logic.FINExecutorLogic;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.PlanWorkItemLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.ReportPrintingLogic;
import com.ksoe.energynet.logic.SCLogic;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.util.ScheduledEventsManager;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2Humen;
import com.ksoe.energynet.valueobject.ENAct2Prov;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Contract;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENIP;
import com.ksoe.energynet.valueobject.ENIPItem;
import com.ksoe.energynet.valueobject.ENIPItem2Contract;
import com.ksoe.energynet.valueobject.ENIPItem2ENIPItem;
import com.ksoe.energynet.valueobject.ENIPItem2Plan;
import com.ksoe.energynet.valueobject.ENIPItem2TKMaterials;
import com.ksoe.energynet.valueobject.ENIPStatus;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkMoveHistory;
import com.ksoe.energynet.valueobject.ENPlanWorkMoveReason;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.FINExecutor;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2Prov;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemShort;
import com.ksoe.energynet.valueobject.filter.ENAct2HumenFilter;
import com.ksoe.energynet.valueobject.filter.ENAct2ProvFilter;
import com.ksoe.energynet.valueobject.filter.ENActFilter;
import com.ksoe.energynet.valueobject.filter.ENDelayServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ContractFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENIPFilter;
import com.ksoe.energynet.valueobject.filter.ENIPItem2ContractFilter;
import com.ksoe.energynet.valueobject.filter.ENIPItem2PlanFilter;
import com.ksoe.energynet.valueobject.filter.ENIPItem2TKMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.ENIPItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItem2TKKoefFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2ContractShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItem2TKKoefShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectShortList;
import com.ksoe.energynet.valueobject.lists.SCUsageInputShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.energypro.valueobject.EPReportRequestEx;
import com.ksoe.fin.valueobject.FKProvResult;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.mdax.logic.AXPostingLogic;
import com.ksoe.mdax.valueobject.brief.AXLedgerTransShort;
import com.ksoe.mdax.valueobject.lists.AXCustTransShortList;
import com.ksoe.mdax.valueobject.lists.AXLedgerTransShortList;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQOrderItemDAO;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.dataminer.RQPurchaseItem2EstimateItemDAO;
import com.ksoe.rqorder.logic.FKOrderLogic;
import com.ksoe.rqorder.logic.OrderItemLogic;
import com.ksoe.rqorder.logic.PlanPurchaseLogic;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQPurchaseItem2EstimateItem;
import com.ksoe.rqorder.valueobject.filter.RQPurchaseItem2EstimateItemFilter;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.filter.TKTechCardFilter;
import com.lowagie.text.pdf.BarcodeEAN;
import com.lowagie.text.BadElementException;
//import com.lowagie.text.BaseColor;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Image;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.Barcode;
import com.lowagie.text.pdf.Barcode128;
import com.lowagie.text.pdf.BarcodePDF417;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfTemplate;
import com.lowagie.text.pdf.PdfWriter;

import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;


public class ENIPControllerEJB extends
		ENIPControllerEJBGen {

	public ENIPControllerEJB() {
	}

	/* ENIP. Добавить */
	@Override
	public int add(ENIP object) {
		try {
			ENIPDAO objectDAO = new ENIPDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.version = 1;
			object.dateAdd = new Date();
			object.dateEdit = new Date();
			object.userAdd = getUserProfile().userName;
			object.userEdit = getUserProfile().userName;
			object.statusRef.code = ENIPStatus.DRAFT;



		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENIP%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENIP. Удалить */
	@Override
	public void remove(int code) {
		try {
			ENIPDAO objectDAO = new ENIPDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENIP object = objectDAO.getObject(code);

			if (object.statusRef.code != ENIPStatus.DRAFT)
			{
				throw new SystemException("\n\nNET-4344 Видаляти можна тільки чорнову Інвестпрограму!");
			}

			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENIP%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

   	/* ENIP. Изменить */
	@Override
	public void save(ENIP object) {
		try {
			if (object.statusRef.code != ENIPStatus.DRAFT)
			{
				throw new SystemException("\n\nNET-4344 Редагувати можна тільки чорнову Інвестпрограму!");
			}

			ENIPDAO objectDAO = new ENIPDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.dateEdit = new Date();
			object.userEdit = getUserProfile().userName;

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENIP%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


    /**
     *  Копирование Инвестпрограммы для создания новой версии
     *
     *  @param code - код Инвестпрограммы, которую необходимо скопировать
     *
     *  @return код новой версии Инвестпрограммы
     *
     */
	public int сopyNewVersionIP(int code)
	{
		try
		{
			ENIPDAO objectDAO = new ENIPDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENIP investProgram = objectDAO.getObject(code);

			if (investProgram == null)
			{
				throw new SystemException("\n\nNET-4344 Не знайдено Інвестпрограму з кодом " + code + " !");
			}

			if (investProgram.statusRef.code != ENIPStatus.APPROVED)
			{
				throw new SystemException("\n\nNET-4344 Копіювати можна тільки затверджену Інвестпрограму!");
			}

			///// Проверим на наличие дочерних версий для этой ИП - копировать можно только последнюю версию
			ENIPFilter ipFilter = new ENIPFilter();
			ipFilter.parentRef.code = code;
			int[] ipArr = objectDAO.getFilteredCodeArray(ipFilter, 0, -1);

			if (ipArr.length > 0)
			{
				ENIP ipChild = objectDAO.getObject(ipArr[0]);

				throw new SystemException("\n\nNET-4344 Для цієї Інвестпрограми існує дочірня версія (№" + ipChild.version + ")! " +
				                          "Копію можна робити тільки з останньої версії!");
			}
			/////

			// TODO: изменить статус старой версии на что-то типа "Застаріла"? Пока все-таки оставим ее "Затвердженой"...
			// investProgram.statusRef.code = ...;
			// objectDAO.save(investProgram);

			investProgram.code = Integer.MIN_VALUE;
			investProgram.parentRef.code = code;
			investProgram.version = investProgram.version + 1;
			investProgram.statusRef.code = ENIPStatus.DRAFT;

			int newInvestProgramCode = objectDAO.add(investProgram);

			ENIPItemFilter ipItemParentFilter = new ENIPItemFilter();
			ipItemParentFilter.ipRef.code = code;
            ipItemParentFilter.conditionSQL = "parentrefcode is null ";



			ENIPItemDAO ipItemDAO = new ENIPItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENIPItem2ENIPItemDAO item2itemDAO = new ENIPItem2ENIPItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENIPItem2PlanDAO item2planDAO = new ENIPItem2PlanDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENIPItem2TKMaterialsDAO item2matDAO = new ENIPItem2TKMaterialsDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENIPItem2ContractDAO item2contractDAO = new ENIPItem2ContractDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			int[] ipItemParentArr = ipItemDAO.getFilteredCodeArray(ipItemParentFilter, 0, -1);

			for (int i = 0; i < ipItemParentArr.length; i++)
			{
				ENIPItemFilter ipItemChildFilter = new ENIPItemFilter();
				ipItemChildFilter.ipRef.code = code;
				ipItemChildFilter.parentRef.code = ipItemParentArr[i];
				int[] ipItemChildArr = ipItemDAO.getFilteredCodeArray(ipItemChildFilter, 0, -1);

				ENIPItem ipItemParent = ipItemDAO.getObject(ipItemParentArr[i]);

				int oldIPItemParentCode = ipItemParent.code;

				ipItemParent.code = Integer.MIN_VALUE;
				ipItemParent.ipRef.code = newInvestProgramCode;
				//ipItemParent.parentRef.code = Integer.MIN_VALUE; // на всякий случай
				if (ipItemParent.parentRef != null)
				{
					if (ipItemParent.parentRef.code != Integer.MIN_VALUE)
					{
						throw new SystemException("\n\nNET-4344 Помилка з пунктом Інвестпрограми! (Код = " + code + ")");
					}
				}

				// TODO: изменять статус строкам ?
				// ipItemParent.statusRef.code = ... ?
				int newIPItemParentCode = ipItemDAO.copyEnIpitem(ipItemParent);

				// Добавляем связку ENIPItem2ENIPItem (oldIPItemParentCode и newIPItemParentCode)
				ENIPItem2ENIPItem item2itemParent = new ENIPItem2ENIPItem();
				item2itemParent.ipItemInRef.code = oldIPItemParentCode;
				item2itemParent.ipItemOutRef.code = newIPItemParentCode;
				item2itemDAO.add(item2itemParent);

				///// Копируем связки с планами, с материалами и с договорами
				ENIPItem2PlanFilter itemParent2planFilter = new ENIPItem2PlanFilter();
				itemParent2planFilter.ipItemRef.code = oldIPItemParentCode;
				int[] itemParent2planArr = item2planDAO.getFilteredCodeArray(itemParent2planFilter, 0, -1);

				for (int j = 0; j < itemParent2planArr.length; j++)
				{
					ENIPItem2Plan itemParent2plan = item2planDAO.getObject(itemParent2planArr[j]);

					itemParent2plan.code = Integer.MIN_VALUE;
					itemParent2plan.ipItemRef.code = newIPItemParentCode;
					item2planDAO.add(itemParent2plan);
				}

				ENIPItem2TKMaterialsFilter itemParent2matFilter = new ENIPItem2TKMaterialsFilter();
				itemParent2matFilter.ipItemRef.code = oldIPItemParentCode;
				int[] itemParent2matArr = item2matDAO.getFilteredCodeArray(itemParent2matFilter, 0, -1);

				for (int j = 0; j < itemParent2matArr.length; j++)
				{
					ENIPItem2TKMaterials itemParent2mat = item2matDAO.getObject(itemParent2matArr[j]);

					itemParent2mat.code = Integer.MIN_VALUE;
					itemParent2mat.ipItemRef.code = newIPItemParentCode;
					item2matDAO.add(itemParent2mat);
				}

				ENIPItem2ContractFilter itemParent2contractFilter = new ENIPItem2ContractFilter();
				itemParent2contractFilter.ipItemRef.code = oldIPItemParentCode;
				int[] itemParent2contractArr = item2contractDAO.getFilteredCodeArray(itemParent2contractFilter, 0, -1);

				for (int j = 0; j < itemParent2contractArr.length; j++)
				{
					ENIPItem2Contract itemParent2contract = item2contractDAO.getObject(itemParent2contractArr[j]);

					itemParent2contract.code = Integer.MIN_VALUE;
					itemParent2contract.ipItemRef.code = newIPItemParentCode;
					item2contractDAO.add(itemParent2contract);
				}
				/////


				for (int j = 0; j < ipItemChildArr.length; j++)
				{
					ENIPItem ipItemChild = ipItemDAO.getObject(ipItemChildArr[j]);

					int oldIPItemChildCode = ipItemChild.code;

					ipItemChild.code = Integer.MIN_VALUE;
					ipItemChild.ipRef.code = newInvestProgramCode;
					ipItemChild.parentRef.code = newIPItemParentCode;
					// TODO: изменять статус строкам ?
					// ipItemChild.statusRef.code = ... ?
					int newIPItemChildCode = ipItemDAO.copyEnIpitem(ipItemChild);

					// Добавляем связку ENIPItem2ENIPItem (oldIPItemChildCode и newIPItemChildCode)
					ENIPItem2ENIPItem item2itemChild = new ENIPItem2ENIPItem();
					item2itemChild.ipItemInRef.code = oldIPItemChildCode;
					item2itemChild.ipItemOutRef.code = newIPItemChildCode;
					item2itemDAO.add(item2itemChild);

					///// Копируем связки с планами, с материалами и с договорами
					ENIPItem2PlanFilter itemChild2planFilter = new ENIPItem2PlanFilter();
					itemChild2planFilter.ipItemRef.code = oldIPItemChildCode;
					int[] itemChild2planArr = item2planDAO.getFilteredCodeArray(itemChild2planFilter, 0, -1);

					for (int k = 0; k < itemChild2planArr.length; k++)
					{
						ENIPItem2Plan itemChild2plan = item2planDAO.getObject(itemChild2planArr[k]);

						itemChild2plan.code = Integer.MIN_VALUE;
						itemChild2plan.ipItemRef.code = newIPItemChildCode;
						item2planDAO.add(itemChild2plan);
					}

					ENIPItem2TKMaterialsFilter itemChild2matFilter = new ENIPItem2TKMaterialsFilter();
					itemChild2matFilter.ipItemRef.code = oldIPItemChildCode;
					int[] itemChild2matArr = item2matDAO.getFilteredCodeArray(itemChild2matFilter, 0, -1);

					for (int k = 0; k < itemChild2matArr.length; k++)
					{
						ENIPItem2TKMaterials itemChild2mat = item2matDAO.getObject(itemChild2matArr[k]);

						itemChild2mat.code = Integer.MIN_VALUE;
						itemChild2mat.ipItemRef.code = newIPItemChildCode;
						item2matDAO.add(itemChild2mat);
					}

					ENIPItem2ContractFilter itemChild2contractFilter = new ENIPItem2ContractFilter();
					itemChild2contractFilter.ipItemRef.code = oldIPItemChildCode;
					int[] itemChild2contractArr = item2contractDAO.getFilteredCodeArray(itemChild2contractFilter, 0, -1);

					for (int k = 0; k < itemChild2contractArr.length; k++)
					{
						ENIPItem2Contract itemChild2contract = item2contractDAO.getObject(itemChild2contractArr[k]);

						itemChild2contract.code = Integer.MIN_VALUE;
						itemChild2contract.ipItemRef.code = newIPItemChildCode;
						item2contractDAO.add(itemChild2contract);
					}
					/////

				}

			}

			return newInvestProgramCode;

		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}


    /**
     *  Перевод Инвестпрограммы в статус "Складена"
     *
     *  @param code - код Инвестпрограммы
     *
     */
	public void create(int code)
	{
		try
		{
			ENIPDAO objectDAO = new ENIPDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENIP investProgram = objectDAO.getObject(code);

			if (investProgram == null)
			{
				throw new SystemException("\n\nNET-4344 Не знайдено Інвестпрограму з кодом " + code + " !");
			}

			if (investProgram.statusRef.code != ENIPStatus.DRAFT)
			{
				throw new SystemException("\n\nNET-4344 Складати можна тільки чорнову Інвестпрограму!");
			}

			investProgram.statusRef.code = ENIPStatus.CREATED;
			objectDAO.save(investProgram);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

    /**
     *  Отмена перевода Инвестпрограммы в статус "Складена"
     *
     *  @param code - код Инвестпрограммы
     *
     */
	public void undoCreate(int code)
	{
		try
		{
			ENIPDAO objectDAO = new ENIPDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENIP investProgram = objectDAO.getObject(code);

			if (investProgram == null)
			{
				throw new SystemException("\n\nNET-4344 Не знайдено Інвестпрограму з кодом " + code + " !");
			}

			if (investProgram.statusRef.code != ENIPStatus.CREATED)
			{
				throw new SystemException("\n\nNET-4344 Відмінити складання можна тільки для \"складеної\" Інвестпрограми!");
			}

		    ///// Проверим на наличие дочерних версий для этой ИП - если они есть, нельзя отменять "складання"
			//    (хотя у "складених" ИП дочерних версий не должно быть вообще, но на всякий случай проверим)
			ENIPFilter ipFilter = new ENIPFilter();
			ipFilter.parentRef.code = code;
			int[] ipArr = objectDAO.getFilteredCodeArray(ipFilter, 0, -1);

			if (ipArr.length > 0)
			{
				ENIP ipChild = objectDAO.getObject(ipArr[0]);

				throw new SystemException("\n\nNET-4344 Для цієї Інвестпрограми існує дочірня версія (№" + ipChild.version + ")! " +
				                          "Спочатку необхідно видалити її!");
			}
			/////

			investProgram.statusRef.code = ENIPStatus.DRAFT;
			objectDAO.save(investProgram);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

    /**
     *  Перевод Инвестпрограммы в статус "Затверджена"
     *
     *  @param code - код Инвестпрограммы
     *
     */
	public void approve(int code)
	{
		try
		{
			ENIPDAO objectDAO = new ENIPDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENIP investProgram = objectDAO.getObject(code);

			if (investProgram == null)
			{
				throw new SystemException("\n\nNET-4344 Не знайдено Інвестпрограму з кодом " + code + " !");
			}

			if (investProgram.statusRef.code != ENIPStatus.CREATED)
			{
				throw new SystemException("\n\nNET-4344 Затверджувати можна тільки \"складену\" Інвестпрограму!");
			}

			investProgram.statusRef.code = ENIPStatus.APPROVED;
			objectDAO.save(investProgram);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

    /**
     *  Отмена перевода Инвестпрограммы в статус "Затверджена"
     *
     *  @param code - код Инвестпрограммы
     *
     */
	public void undoApprove(int code)
	{
		try
		{
			ENIPDAO objectDAO = new ENIPDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENIP investProgram = objectDAO.getObject(code);

			if (investProgram == null)
			{
				throw new SystemException("\n\nNET-4344 Не знайдено Інвестпрограму з кодом " + code + " !");
			}

			if (investProgram.statusRef.code != ENIPStatus.APPROVED)
			{
				throw new SystemException("\n\nNET-4344 Відмінити затведження можна тільки для затвердженої Інвестпрограми!");
			}

		    ///// Проверим на наличие дочерних версий для этой ИП - если они есть, нельзя отменять утверждение
			ENIPFilter ipFilter = new ENIPFilter();
			ipFilter.parentRef.code = code;
			int[] ipArr = objectDAO.getFilteredCodeArray(ipFilter, 0, -1);

			if (ipArr.length > 0)
			{
				ENIP ipChild = objectDAO.getObject(ipArr[0]);

				throw new SystemException("\n\nNET-4344 Для цієї Інвестпрограми існує дочірня версія (№" + ipChild.version + ")! " +
				                          "Спочатку необхідно видалити її!");
			}
			/////

			investProgram.statusRef.code = ENIPStatus.CREATED;
			objectDAO.save(investProgram);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}


	public void test_admin_service(int code)  {

		 ENServicesObjectDAO soDAO = null;
		try {
			soDAO = new ENServicesObjectDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		} catch (DatasourceConnectException e) {

			e.printStackTrace();
		}

		FKOrderLogic fkOrderLogic = null;
			try {
				fkOrderLogic = new FKOrderLogic(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			} catch (DatasourceConnectException e) {

				e.printStackTrace();
			}
		ENServicesObject soObj = null;
		try {
			SCLogic scLogic = new SCLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
		} catch (DatasourceConnectException e1) {

			e1.printStackTrace();
		}



		try {

            ENServicesObjectFilter soFilter = new ENServicesObjectFilter();

			//soFilter.conditionSQL = " enservicesobject.contractnumberservices in ('1048245' , '1048264' , '1048265' ,  '1048309' , '1048458' ,  '1047009') ";
			soFilter.conditionSQL = " enservicesobject.contractnumberservices in ('1072765','1072808','1072833','1072910','1071998','1072013','1072097','1072160','1072377','1072711','1071796','1071997','1072116','1072312','1072682','1072759','1071952','1072641','1072644','1072721','1071038','1071954','1072818','1072952','1072987','1073070','1073078','1071983','1072008','1072015','1072195','1072325','1072512','1072606','1072638','1072694','1071989','1072009','1072014','1072048','1072086','1072123','1072152','1072164','1072170','1070462','1072497','1072505','1072538','1072554','1072666','1072893','1073052','1073073','1071818','1071901','1072095','1072126','1072131','1070508','1072427','1072593','1071899','1071911','1072119','1072154','1072376','1072695','1072738','1072909','1071909','1071925','1072290','1072305','1072657','1072708','1072715','1072768','1072803','1072813','1072842','1072876','1072902','1072929','1072965','1072973','1073026','1073046','1073055','1073076','1073097','1073118','1073157','1071227','1071879','1071885','1071919','1071930','1071950','1071953','1071990','1072005','1072035','1072041','1072043','1072055','1072096','1072106','1072148','1072153','1072240','1072243','1072260','1072262','1072297','1072314','1072442','1072556','1072567','1072601','1072717','1072725','1072732','1072745','1071824','1071869','1071974','1071976','1072084','1072385','1072338','1072408','1072454','1072557','1072580') ";

			int[] soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1);

			System.out.print(" soArrLength = " + soArr.length );

			/*for (int so = 0; so < soArr.length; so++){
				soObj = soDAO.getObject(soArr[so]);
				SCCounterShortList scList = scLogic.getCounterForServicesObject(soObj.code);

				if(scList == null || scList.totalCount == 0){
					System.out.print(" make autoCreateFkorderMoveCounterForServices by contractnumberservices = " + soObj.contractNumberServices );
					fkOrderLogic.autoCreateFkOrderMoveCounterForServices(soObj.code);
				}*/





			fkOrderLogic.autoCreateFkOrderMoveCounterForServices("808728",	1017075019			);
			fkOrderLogic.autoCreateFkOrderMoveCounterForServices("808727",	1017076468			);
			fkOrderLogic.autoCreateFkOrderMoveCounterForServices("808729",	1017076476			);
			fkOrderLogic.autoCreateFkOrderMoveCounterForServices("808722",	1017076482			);
			fkOrderLogic.autoCreateFkOrderMoveCounterForServices("808730",	1017076509			);
			fkOrderLogic.autoCreateFkOrderMoveCounterForServices("808731",	1017076511			);
			fkOrderLogic.autoCreateFkOrderMoveCounterForServices("808735",	1017076533			);
			fkOrderLogic.autoCreateFkOrderMoveCounterForServices("808734",	1017076531			);
			fkOrderLogic.autoCreateFkOrderMoveCounterForServices("808733",	1017076487			);
			fkOrderLogic.autoCreateFkOrderMoveCounterForServices("808736",	1017076442			);
			fkOrderLogic.autoCreateFkOrderMoveCounterForServices("808732",	1017076546			);









			/*}*/

		} catch (PersistenceException e) {

			e.printStackTrace();
		}

	}
	
	
	private RQFKOrder getRQFKOrder(Object object) {
		if (object == null) {
			throw new IllegalArgumentException("\n\nNET-4596 Не заданий об'єкт ордеру!");
		}

		if (! (object instanceof RQFKOrder)) {
			throw new IllegalArgumentException("\n\nNET-4596 Об'єкт не є ордером!");
		}
		RQFKOrder fkOrder = (RQFKOrder)object;

		/*
		if (fkOrder.code == Integer.MIN_VALUE) {
			throw new IllegalArgumentException("\n\nNET-4596 Не заданий код ордеру!");
		}
		*/

		return fkOrder;
	}
	
	
	public void getReportsListForAttachments(Object object) {
		RQFKOrder fkOrder = getRQFKOrder(object);

		Connection netConnection = null;

		try {
			netConnection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ReportPrintingLogic reportPrintingLogic = new ReportPrintingLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) , getUserProfile());
			EPReportRequestEx[] reportRequests = reportPrintingLogic.getReportsListForRQFKOrder(fkOrder);
			if (reportRequests.length == 0) {
				throw new SystemException("\n\nNET-4596 Отримано пустий перелік параметрів для формування вкладень! Код ордеру: " + fkOrder.code + " !");
			}
			
			String reportPath = "c:\report"; 
			String reportType = "pdf";
			
			for (EPReportRequestEx request : reportRequests) {
				if (request.fileName == null) {
					throw new SystemException("\n\nNET-4596 Не задано ім'я файлу для формування вкладення!");
				}
				String dateTimePart = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				String fileName = String.format("%s_%s.%s", request.fileName, dateTimePart, reportType);

				
				// createAttachmentForDocByReport(docCode, "tezzt", fileName, request, reportType, false);
				
				ENReportControllerHome reportHome = (ENReportControllerHome)
		        		Tools.createControllerHome(ENReportController.JNDI_NAME,ENReportControllerHome.class);
	        	ENReportController reportController = reportHome.create();
				byte[] report = reportController.processAsByteArray(request, reportType, false);
				
				try (FileOutputStream fos = new FileOutputStream("c:\\Jboss6\\server\\default\\tmp\\"+fileName)) {
					   fos.write(report);
					   //fos.close(); There is no more need for this line since you had created the instance of "fos" inside the try. And this will automatically close the OutputStream
					}
			}

			//return reportRequests;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			} catch (CreateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		finally {
			try {
				if (netConnection != null && !netConnection.isClosed()) {
					netConnection.close();
					netConnection = null;
				}
			} catch (SQLException e) {
			}
		}
	}

	/** удаление естимейтов из плана закупки 
	 * @throws CreateException 
	 * @throws NamingException 
	 * @throws PersistenceException 
	 * @throws RemoteException 
	 * @throws DatasourceConnectException */
	public void test_admin(int code)  {
		
		this.addPlanWorkItemInPlan(code);
		
		/*
		 * try { RQFKOrderDAO ordDAO = new
		 * RQFKOrderDAO(getUserProfile(),getConnection(AuthorizationJNDINames.
		 * ENERGYNET_DATASOURCE));
		 * 
		 * 
		 * RQFKOrder order = ordDAO.getObject(code);
		 * getReportsListForAttachments(order); }catch (PersistenceException e) { //
		 * TODO Auto-generated catch block e.printStackTrace(); } catch
		 * (DatasourceConnectException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
		
	//		updatePlanWorkItem(Integer.MIN_VALUE);
//			test_admin_Barcode(code);			
		//selectNKRE(code); // заполнение таблички aaa_nkre
		//this.addAttachement2Decree(code);
		//this.setEICcodeForServicesobject(code);
		//this.test_admin_postings_by_act(code);
		//this.test_admin_update_enrecordpointbyt_enrecordpointprom(code);
		//this.test_admin_update_podr_zku(code);
		// this.test_admin_purchase();
		//this.recalcBoundarydateworkByServicesobject(code);
		//this.recalcENPlanworkItem2Humen(code);
		//this.updateFullAxExecutorName(code);
		//this.moveMonthPlan(code);
		//this.test_admin_thead(code);
		// this.unCreatedPrihodRQAllocationList(); удаление ордеров ведомости распределения
		// this.test_admin_postings_by_act(code);
		// this.test_admin_update_cehIdInAct(code);


	   //this.test_admin_addMatInPlanAndUpdateOldTo0();
	// this.test_admin_purchase();
		// this.test_admin_service(0);
		// this.test_admin_generateAutoOrderByCountersServices();
		//this.test_admin_postings_by_act(code);
		//this.test_admin_postings_by_oz(code);
		//calculateSalaryCharges(code);
		//recalpurchase(code);
		 //this.test_admin_service(code);
	/*	try {

			    PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
				ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

				ENEstimateItemFilter eiFilter =  new ENEstimateItemFilter();
				eiFilter.conditionSQL = "  ENESTIMATEITEM.CODE IN (   select distinct ei.code \n" +
						"   from rqplanpurchase p , rqpurchaseitem pi ,  rqpurchaseitem2estmttm pi2ei , enestimateitem ei , enplanwork pw  \n" +
						"   where p.code = 70 \n" +
						"   and p.code = pi.purchaserefcode  \n" +
						"   and pi.code = pi2ei.purchaseitemrefcode  \n" +
						"   and pi2ei.estimateitemrefcode = ei.code  \n" +
						"   and ei.planrefcode = pw.code  \n" +
						"   and pw.statuscode in (2, 6, 8) \n" +
						"   and pw.kindcode = 2 \n" +
						"   and pw.yeargen = 2017  ) " ;

				ENEstimateItemShortList eiList = eiDAO.getScrollableFilteredList(eiFilter, 0, -1);
			for (int i = 0; i < eiList.totalCount; i++) {
				System.out.print(" removeEstimateFromPurchaseItem  eicode = " + eiList.get(i).code );
				purchaseLogic.removeEstimateFromPurchaseItem(eiList.get(i).code);
			}


			} catch (DatasourceConnectException e) {

				e.printStackTrace();
			}
	    	catch (PersistenceException e) {

			e.printStackTrace();
		}*/

		}

	
	
	public int updatePlanWorkItem(int planWorkItemCode)  {

    	//String SUPP = [Номер задания];
try {
        Context context = new InitialContext();
        Object objRef = context.lookup(ENPlanWorkItemController.JNDI_NAME);
        ENPlanWorkItemControllerHome planWorkItemHome = (ENPlanWorkItemControllerHome) PortableRemoteObject.narrow(objRef, ENPlanWorkItemControllerHome.class);
        ENPlanWorkItemController planWorkItemController = planWorkItemHome.create();
                      
        ENPlanWorkItemFilter piFil = new ENPlanWorkItemFilter();
        piFil.conditionSQL = " enplanworkitem.code in ( select DISTINCT pi.code " +    
							" from tktechcard tk  , enplanworkitem pi , enplanwork p , finexecutor ff , " + 
							" endepartment dep , enestimateitem ii , enestimateitemstatus ist " +
							" where tk.code = pi.kartarefcode " +
							" and pi.planrefcode=p.code " +
							" and p.yeargen = 2021" +
							" and p.monthgen>=3" +
							" and p.kindcode=2 " + 
							" and p.statuscode  not in (2,6,8,9) " +
							" and p.code not  in ( select ch.planoldrefcode from enplancorrecthistory ch " +
				            "           where ch.planoldrefcode = p.code and ch.reasoncode = 4 ) " + 
							" and p.finexecutorcode = ff.code " +
							" and p.budgetrefcode = 240000001 " +
							" and p.departmentrefcode = dep.code " +
							" and (tk.techkartnumber='002020103') " +
							" and pi.code = ii.planitemrefcode " +
							" and ii.statusrefcode=ist.code " +
							" and p.typerefcode = 102 " +
							" and pi.countgen>0 limit 1000) ";
        //ENPlanWorkItemDAO piDao = new ENPlanWorkItemDAO(energyNetConnection, userProfile); 
        ENPlanWorkItemDAO piDao = new ENPlanWorkItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        ENPlanWorkItemShortList piList = piDao.getScrollableFilteredList(piFil, 0, -1);
        
        ENPlanWorkItem planItem = null;
        
        System.out.println("piList.totalCount = " + piList.totalCount );

        for (int i = 0; i < piList.totalCount; i++) {
        	 ENPlanWorkItem iiObj = piDao.getObject(piList.get(i).code);
        	 iiObj.kartaRef.code = 2017041452;
        	 int planItemcode = planWorkItemController.changePlanWorkItem(iiObj);
        	 
        	 System.out.println("String planItemcode = " + planItemcode + "Count = " + i);
		}
        
       
        
        return  111;
        
     } catch (NamingException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
catch (RemoteException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	} catch (CreateException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
catch (DatasourceConnectException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
catch (PersistenceException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
    return planWorkItemCode;

      
    }
	/*апдейт поставщиков на связке естимейты с договоров */
	public void test_admin_postav(int code)  {
	try {

			OrderItemLogic itemLogic = new OrderItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENEstimateItem2ContractDAO e2cDAO = new ENEstimateItem2ContractDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENEstimateItem2ContractFilter e2cFilter =  new ENEstimateItem2ContractFilter();
			e2cFilter.finDocCode = "53928";

			ENEstimateItem2ContractShortList e2cList = e2cDAO.getScrollableFilteredList(e2cFilter, 0, -1);
			for (int i = 0; i < e2cList.totalCount; i++) {
				ENEstimateItem2Contract e2c = e2cDAO.getObject(e2cList.get(i).code);
				int orgCodeOld = e2c.org.code;
				e2c.org.code = Integer.MIN_VALUE;
				e2c.org.code = itemLogic.copyOrg(e2c.org);
				System.out.print(" orgCodeOld =  " + orgCodeOld + " orgCodeNew =  " + e2c.org.code + " by estimate " + e2c.estimateItem.code );
				e2cDAO.save(e2c);
			}


		} catch (DatasourceConnectException e) {

			e.printStackTrace();
		}
    	catch (PersistenceException e) {

		e.printStackTrace();
	}

	}


	public void test_admin_thead(int code)  {

		test_admins test_admins = new test_admins();

		Thread t = new Thread(test_admins);
		t.start();

		// test_admin(Integer.MIN_VALUE,Integer.MIN_VALUE);
		//test_admins();

	}


	/** запускает функцию на выполнение ,, клиент не ждет ответа при этом */
	public class test_admins implements Runnable {
		@Override
		public void run() {

			recalcBoundarydateworkByServicesobject(Integer.MIN_VALUE);

		}
	}


	public void test_admin(int code, int www)
	{
		try
		{

		    /**
		     *  SUPP-30121...  02.03.2015....
		     *  в таблицу finWorker добавлены новые поля.... апдейтим данные.....
		     *  вызов в inspectTransaction - this.prepareUpdateFinWorker();
		     */
//			if (1 == 2) {
//				return;
//			}

			  /* ENServicesObjectDAO soDAO;
				soDAO = new ENServicesObjectDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

				FKOrderLogic fkOrderLogic;
					fkOrderLogic = new FKOrderLogic(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				ENServicesObject soObj;
					soObj = soDAO.getObject(1017049911);
				System.out.print(" make autoCreateFkorderMoveCounterForServices by contractnumberservices = " + soObj.contractNumberServices );

				fkOrderLogic.autoCreateFkorderMoveCounterForServices(soObj);	*/

			// наполнение плана закупок по частям
			   /*Context planPurchaseCnt = new InitialContext();
		        Object planPurchaseRef = planPurchaseCnt.lookup(RQPlanPurchaseController.JNDI_NAME);
		        RQPlanPurchaseControllerHome planPurchaseHome = (RQPlanPurchaseControllerHome) PortableRemoteObject.narrow(planPurchaseRef, RQPlanPurchaseControllerHome.class);
		        RQPlanPurchaseController planPurchaseController = planPurchaseHome.create();

		        RQPlanPurchase planPurchaseObj = new RQPlanPurchase();
		        planPurchaseObj.statusRef.code =  RQConsts.RQPLANPURCHASE_STATUS_DRAFT;
		        planPurchaseObj.kindRef.code = RQConsts.RQPLANPURCHASE_KIND_PLAN_PURCHASE;
		        planPurchaseObj.name = "2016";
		        planPurchaseObj.version = 1;
		        planPurchaseObj.yearGen = 2016;
		        planPurchaseObj.code = 1;

		        planPurchaseController.addInPresentPlanPurchase(planPurchaseObj);*/

				Connection conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

				UserProfile userProfile = new UserProfile();
				userProfile.userName = "energynet";


			     PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(userProfile, conn);
			    /** занесем  естимейты по тендерным договорам которых нет в связке enestimateitem2contract  но ети
			    *  естимейты сидят в заявке и на строке заявки проставлен тендерный договор  // c  copy org */
			   //  System.out.print(" start etap 1 -  purchaseLogic.insertEstimate2Estimate2Contract(); ");
			    // purchaseLogic.insertEstimate2Estimate2Contract();

			     System.out.print(" start etap 2 -  purchaseLogic.insertContract_ContractItem_estimate2contract_IfNotExistsInEnContract(); ");
			    /** Заносятся договора , строки договора , и привязка естимейтов к договорам - это по тем договорам которых нет в тендерных договора - типа Лесины договора разовые */
			    purchaseLogic.insertContract_ContractItem_estimate2contract_IfNotExistsInEnContract();

		           /*PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
			RQPlanPurchase object = new RQPlanPurchase();
			purchaseLogic.createAutoPlanPurchaseItems(object);*/



//			ScheduledEventsManager scheduledEventsManager = new ScheduledEventsManager();
//        	System.out.println("Start generateAutoOrderByCountersServices!!!");
//        	scheduledEventsManager.generateAutoOrderByCountersServices();
//        	System.out.println("generateAutoOrderByCountersServices is Done!!!");

			/*ENIPDAO objectDAO = new ENIPDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENIPItemDAO itDAO = new ENIPItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			InvestProgramLogic ipLogic = new InvestProgramLogic(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());


			ENIPItemFilter itFilter = new ENIPItemFilter();
			itFilter.ipRef.code = code;

			ENIPItemShortList itList = itDAO.getScrollableFilteredList(itFilter, 0, -1);

			for (int i = 0; i < itList.totalCount; i++)
			{

				  ipLogic.recalcContract(itList.get(i).code);

				  ENIPItem itObj = itDAO.getObject(itList.get(i).code);

				  if (itObj != null ){
					  if (itObj.parentRef.code != Integer.MIN_VALUE ){
						  if (itObj.parentRef.code > 0 ) {
							  ipLogic.recalcParentIpItemInfoTenders(itObj); // если меняем инфу на дочернем пункте ИП то обновим для парента
						  }
					  }
				  }

			} */

			//Connection finConn = null;

			//FINWorkerDAO fwDAO = new FINWorkerDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			//finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

			//FINWorkerDAO fwDaoFin = new FINWorkerDAO(finConn, getUserProfile());

			/*FINWorkerShortList fwList = null;//fwDAO.getFInworkerListForCategorAndWorktimeId(); // список табельны . дата плана
			for (int i = 0; i < fwList.totalCount; i++)
			{
				System.out.print(" fwList num " + i + " from "+ fwList.totalCount + "tabNumber = " + fwList.get(i).tabNumber
						        + " date = " + fwList.get(i).positionName );

				FINWorkerFilter fwFilter = new FINWorkerFilter();
                fwFilter.tabNumber = fwList.get(i).tabNumber;

                FINWorkerShortList fwList_Fin = new FINWorkerShortList();

                DateFormat format = new SimpleDateFormat("dd.MM.yyyy");
                Date date = format.parse(fwList.get(i).positionName); // тута дата

                fwList_Fin = fwDaoFin.getFINWorkerList(fwFilter, 0, -1, date, true);

                if (fwList_Fin.totalCount == 0 ) {
                	continue;
                }

                /// получили категорию и график рабочего времени , проадейтим теперь все записи finworker
                // по табельному и за дату которые в листе fwList

                FINWorkerFilter fwFilterUpd = new FINWorkerFilter();
               // fwFilterUpd.tabNumber = fwList.get(i).tabNumber;
                fwFilterUpd.conditionSQL = " finworker.code in ( with plan as (select p.code from enplanwork p \n"+
							" where p.datestart = '"+ fwList.get(i).positionName +"'  \n"+
                		"  and p.kindcode in (3,4)  \n"+
                		"  )  \n"+
						"	select fw.code from enhumenitem hi , finworker fw  \n"+
						"	where hi.planrefcode in (select plan.code from plan)  \n"+
						"	and hi.finworkercode = fw.code  \n"+
						"	and fw.tabnumber = "+fwList.get(i).tabNumber+" " +
						" union all \n"+
                        " select fw.code from entransportitem ti , finworker fw \n"+
					    "		where ti.planrefcode in (select plan.code from plan)  \n"+
						"	and ti.finworkercode = fw.code  \n"+
						"	and fw.tabnumber = "+fwList.get(i).tabNumber+" " +
						 ")  ";

                FINWorkerShortList fwListUpd = fwDAO.getScrollableFilteredList(fwFilterUpd, 0, -1);
                for (int f = 0; f < fwListUpd.totalCount; f++){
                	FINWorker fwupd = fwDAO.getObject(fwListUpd.get(f).code);
                	fwupd.categorId = fwList_Fin.get(0).categorId;
                	fwupd.categorName = fwList_Fin.get(0).categorName;
                	fwupd.workTimeId = fwList_Fin.get(0).workTimeId;

                	fwDAO.save(fwupd);
                }

			}*/

			/* ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


			ENServicesObjectFilter soFilter = new ENServicesObjectFilter();

			soFilter.conditionSQL = " enservicesobject.contractnumberservices in ('1029941') ";

			int[] soArr = soDAO.getFilteredCodeArray(soFilter, 0, -1);


			for (int so = 0; so < soArr.length; so++){
				FKOrderLogic fkOrderLogic = new FKOrderLogic(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				ENServicesObject soObj = soDAO.getObject(soArr[so]);
				System.out.print(" make autoCreateFkorderMoveCounterForServices by contractnumberservices = " + soObj.contractNumberServices );

				fkOrderLogic.autoCreateFkorderMoveCounterForServices(soObj);
			}

			-- FKOrderLogic fkOrderLogic = new FKOrderLogic(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
  			-- fkOrderLogic.createFKOrdersParametrizedCountersToREM();
  			*/

			// апдейт финворкеров , поле категория(работник , специалист и тд ) - была пустая
			/*FINWorkerDAO fwDAO = new FINWorkerDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			mDaxLogic mdLogic = new mDaxLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			PreparedStatement statement = null;
	        ResultSet  resultSet = null;
	        try {
	        String sql = " select   \n" +
	        		" distinct fw.tabnumber , fw.positionname ,  max(p.datestart) as dateplan , string_agg(distinct fw.code::text, ',') as fwcodetxt\n" +
	        		" from  \n" +
	        		" finworker fw , enhumenitem hi , enplanwork p  , enplanworkitem pi \n" +
	        		" where fw.code = hi.finworkercode \n" +
	        		" and hi.planrefcode = p.code  \n" +
	        		" and p.code = pi.planrefcode  \n" +
	        		" and p.yeargen = 2016 \n" +
	        		" and fw.categorid is  null  \n" +
	        		" group by  fw.tabnumber , fw.positionname  \n" +
	        		" union  \n" +
	        		" select   \n" +
	        		" distinct fw.tabnumber , fw.positionname ,  max(p.datestart) as dateplan  ,  string_agg(distinct fw.code::text, ',') as fwcodetxt \n" +
	        		" from  \n" +
	        		" finworker fw , net.entransportitem hi , enplanwork p  , enplanworkitem pi \n" +
	        		" where fw.code = hi.finworkercode \n" +
	        		" and hi.planrefcode = p.code  \n" +
	        		" and p.code = pi.planrefcode  \n" +
	        		" and p.yeargen = 2016 \n" +
	        		" and fw.categorid is  null  \n" +
	        		" group by  fw.tabnumber , fw.positionname  \n" +
	        		" order by tabnumber \n" +
	        		"  \n" ;


	        statement = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE).prepareStatement(sql);
	        resultSet = statement.executeQuery();
	        while(resultSet.next())
            {
                // resultSet.getString(1);
	        	FINWorkerShortList fwList = null;
	        	FINWorkerFilter fwFilter = new FINWorkerFilter();
	        	fwFilter.tabNumber = resultSet.getString(1);

	        	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	        	//Date date = formatter.parse(resultSet.getString(3));

	        	fwList = mdLogic.getFINWorkerList(fwFilter, 0, 1,
	        			resultSet.getDate(3)
	    				, true);
                if (fwList.totalCount > 0){
                	FINWorkerFilter fwFilter2 = new FINWorkerFilter();
                	fwFilter2.conditionSQL = "finworker.code in( "+ resultSet.getString(4) +" ) ";
                	int[] fwArr = fwDAO.getFilteredCodeArray(fwFilter2, 0, -1);

                	for (int f = 0; f < fwArr.length; f++){
                		FINWorker fwObj = fwDAO.getObject(fwArr[f]);
                		fwObj.categorId = new Integer(fwList.get(0).categorId);
                		fwObj.categorName = fwList.get(0).categorName;
                		fwDAO.save(fwObj);

                	}

                }
            }
	        }
	        catch (Exception e) {
	            System.out.println("Error :" + e.getMessage());
	            throw new SystemException(e) ;
	        }*/

		}
		catch (DatasourceConnectException e) {throw new EnergyproSystemException(e.getMessage(), e);}
        /*catch (NamingException e) {throw new EnergyproSystemException(e.getMessage(), e);}
        catch (RemoteException e) {throw new EnergyproSystemException(e.getMessage(), e);}
        catch (CreateException e) {throw new EnergyproSystemException(e.getMessage(), e);}*/

	}


	public void test_admin_purchase()
	{
		try
		{
		Connection conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
//		UserProfile userProfile = new UserProfile();
//		userProfile.userName = "energynet";
//		DomainInfo domainInfo = new DomainInfo();
//        domainInfo = getDomainInfo(userProfile.userName);
//        userProfile.domainInfo.domain = domainInfo.domainName;
//        userProfile.domainInfo.minCodeValue = domainInfo.minCodeValue;
//        userProfile.domainInfo.maxCodeValue = domainInfo.maxCodeValue;

		ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(getUserProfile(), conn);
        PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(getUserProfile(), conn);

        ENEstimateItemFilter eiFilter =  new ENEstimateItemFilter();
        ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
        /*eiFilter.conditionSQL = " ENESTIMATEITEM.CODE IN ( " +
        		" select ei.code from enplanwork p , enestimateitem ei  " +
        		" where p.code in " +
        		" (1022407242,1022407867,1022407888,1022407901,1022407909 ,1022407932,1022407941 ,1022407952,1022407955,1022407962,1022407971,1022407986,1022407997,1022408005) " +
        		" and p.code = ei.planrefcode " +
        		" and ei.purchaseitemrefcode is null " +
        		" union  " +
        		" select  ei.code  from enplanwork p , enestimateitem ei , aaa_temp_plan_code tpc " +
        		" where p.code = ei.planrefcode  " +
        		" and ei.purchaseitemrefcode is null " +
        		" and ei.planrefcode = tpc.code " +
        		" and ei.statusrefcode = 1  " +
        		" and p.code = tpc.code " +
        	    " ) ";    */

		/*eiFilter.conditionSQL = " ENESTIMATEITEM.CODE IN (  select q.estimateitemcode \n" +
								"  from rqorderitem2enestimttm q  , rqorderitem oi \n" +
								"  where oi.orderrefcode in (1017022391 , 1017022355 ) \n" +
								"  and q.orderitemcode = oi.code \n" +
								"  and oi.countfact > 0  \n" +
								" and oi.purchaseitemrefcode is null \n" +
								" and oi.budgetrefcode <>500000003 \n" +
								"  and oi.statusrefcode = 1  ) ";*/

		eiFilter.conditionSQL = " ENESTIMATEITEM.CODE IN (select ii.code  from enestimateitem ii where ii.planrefcode in ( 1024528091 " +
 " ,1024528763 " +
				" ,1024528768 " +
				" ,1024528770 " +
				" ,1024528772 " +
				" ,1024528774 " +
				" ,1024528777 " +
				" ,1024528781 " +
				" ,1024528783 " +
				" ,1024528785 " +
				" ,1024528787 " +
				" ,1024528791)   ) ";

        ENEstimateItemShort[] eiList = eiDAO.getDetailedESList(eiFilter, pFilter);

        EstimateLogic eilogic = new EstimateLogic( conn , getUserProfile());
        eilogic.estimateAdd2Planpurchase(eiList ,  636 );

		}
		catch (Exception e) {throw new EnergyproSystemException(e.getMessage(), e);}

	}

	/*SUPP-56602 плани енергозбуту 2017 */
	public void test_admin_addMatInPlanAndUpdateOldTo0()
	{
		try
		{
		Connection conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(getUserProfile(), conn);
		EstimateLogic eilogic = new EstimateLogic( conn , getUserProfile());

        ENPlanWorkDAO plDAO = new ENPlanWorkDAO( conn , getUserProfile());
        ENPlanWorkItemDAO pliDAO = new ENPlanWorkItemDAO( conn , getUserProfile());

        /*String jndiENEstimateItem = "ksoe/energynet/ENEstimateItemController";
		String ENEstimateItemHome = "com.ksoe.energynet.ejb.ENEstimateItemControllerHome";

		String domain = getUserProfile().domainInfo.domain;

		ENEstimateItemControllerHome ejbENEstimateItemHome = (ENEstimateItemControllerHome) EJBHomeCache.getHome(jndiENEstimateItem, ENEstimateItemHome,domain);
		ENEstimateItemController enEstimateItemController = ejbENEstimateItemHome.create();*/

		Context context = new InitialContext();
		Object estimateRef = context.lookup(ENEstimateItemController.JNDI_NAME);
        ENEstimateItemControllerHome estimateHome = (ENEstimateItemControllerHome) PortableRemoteObject.narrow(estimateRef, ENEstimateItemControllerHome.class);
        ENEstimateItemController estimateController = estimateHome.create();

        ENPlanWorkFilter plFilter = new ENPlanWorkFilter();
        plFilter.kind.code = ENPlanWorkKind.CURRENT;
        plFilter.conditionSQL =  " enplanwork.code in ( select aaa_temp_plan_code.code from aaa_temp_plan_code )  ";
        int[] plArr = plDAO.getFilteredCodeArray(plFilter, 0, -1);
	        for (int i = 0; i < plArr.length; i++) {
	        	System.out.print(" SUPP-56602 addMatInPlanAndUpdateOldTo0 planCode =   " + i + " in " + plArr.length  );
				// ищем  в плане работу первую попавшуюся - кидаем туда счетчик запланированный  ЕЛЕКТРОЛІЧИЛЬНИК ОДНОФАЗНИЙ NP-07 1F.1SM-U
	        	ENPlanWorkItemFilter pliFilter = new ENPlanWorkItemFilter();
	        	pliFilter.planRef.code = plArr[i] ;
	        	int[] pliArr = pliDAO.getFilteredCodeArray(pliFilter, pliFilter.orderBySQL , "", 0, -1, null);
	        	if(pliArr.length > 0 ) {
	        		// добавляем счетчик
	        		ENEstimateItem eiObj = new ENEstimateItem();

	        		eiObj.code = Integer.MIN_VALUE;
	        		eiObj.accountingTypeRef.code = TKAccountingType.COUNTERS;
	        		eiObj.commentGen = " SUPP-56602 плани енергозбуту 2017";
	        		eiObj.cost = new BigDecimal(1540);
	        		eiObj.countFact = new BigDecimal(1);
	        		eiObj.countGen = new BigDecimal(0);
	        		eiObj.isUseVAT = 1;
	        		eiObj.planRef.code = plArr[i] ;
	        		eiObj.planItemRef.code = pliArr[0];
	        		eiObj.materialRef.code = 2000005233; // ЕЛЕКТРОЛІЧИЛЬНИК ОДНОФАЗНИЙ NP-07 1F.1SM-U
	        		eiObj.kindRef.code = ENEstimateItemKind.MATERIALS;
	        		eiObj.statusRef.code = ENEstimateItemStatus.PLANNED;
	        		eiObj.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;

	         		// на  работе найдем счетчик старый и переведем его в статус "непотрибно замовляти" - внутри он должен пометиться под план закупок как Высвобожденный и делаться дырки
	        		/*ENEstimateItemFilter eioldCounterFilter = new ENEstimateItemFilter();
	        		eioldCounterFilter.planItemRef.code =   pliArr[0];
	        		eioldCounterFilter.accountingTypeRef.code = TKAccountingType.COUNTERS;

	        		int[] eiOldCounterArr = eiDAO.getFilteredCodeArray(eioldCounterFilter, 0, -1);
	        		if (eiOldCounterArr.length > 0 ) {
	        			ENEstimateItem eiOldCounter = eiDAO.getObjectNoSegr(eiOldCounterArr[0]);

	        			eilogic.changeStatus(eiOldCounter.code, ENEstimateItemStatus.UNUSED);
	        		}*/

	        		estimateController.add(eiObj);

	        	} else {
	        		System.out.print(" SUPP-56602 нет работы в плане с кодом   " + plArr[i]   );
	        	}
			}

		}
		catch (Exception e) {throw new EnergyproSystemException(e.getMessage(), e);}

	}




	public void test_admin_Postings()
	{
		try
		{
		Connection conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(getUserProfile(), conn);
		EstimateLogic eilogic = new EstimateLogic( conn , getUserProfile());

		AXLedgerTransShortList ledgerTransPostingPackList = new AXLedgerTransShortList();
		ledgerTransPostingPackList.list = new Vector<AXLedgerTransShort>();
		Date docDate = new Date();
		int count = 0;


        AXCustTransShortList custTransPostingPackList = null;

		for (int i = 0; i < 100; i++) {

			AXLedgerTransShort axLedgerTransShortObj = new AXLedgerTransShort();
	 		axLedgerTransShortObj.transDate= docDate;
	 		axLedgerTransShortObj.amountCur= new BigDecimal(i+1);
	 		axLedgerTransShortObj.currency= AXConsts.CURRENCY_UAH;
	 		axLedgerTransShortObj.amountMST= new BigDecimal(i+1);
	 		axLedgerTransShortObj.accountNum= "9100";

	 		axLedgerTransShortObj.accountDimension1= "051" ;
	 		axLedgerTransShortObj.accountDimension2="124005016";
	 		axLedgerTransShortObj.accountDimension3="";
	 		axLedgerTransShortObj.accountDimension4="";
	 		axLedgerTransShortObj.accountDimension5="";
	 		axLedgerTransShortObj.accountDimension6="";
	 		axLedgerTransShortObj.accountDimension7="";
	 		axLedgerTransShortObj.accountDimension8="";
	 		axLedgerTransShortObj.accountDimension9="3020001";
	 		axLedgerTransShortObj.accountDimension10="";
	 		axLedgerTransShortObj.accountDimension11="";
	 		axLedgerTransShortObj.accountDimension12="";
	 		axLedgerTransShortObj.accountDimension13="";


	 		axLedgerTransShortObj.offsetAccountNum= "6316";
	 		axLedgerTransShortObj.corAccountDimension1="003";
	 		axLedgerTransShortObj.corAccountDimension2= "105014"; //01.02.2017 ax10500InvestProgr; // -Інвест.програма; - приєднання ;- інше
	 		axLedgerTransShortObj.corAccountDimension3=""; /*01.02.2017 бух. изменили настройки(не заполняем тут цель ) axPurpose21300;*/ // -послуги;- поточний ремонт;- капітальний ремонт
	 		axLedgerTransShortObj.corAccountDimension4="8_010190_067"; //  Контрагенти (Клієнти/Постачальники)
	 		axLedgerTransShortObj.corAccountDimension5="071336_024"; // Договір
	 		axLedgerTransShortObj.corAccountDimension6="";
	 		axLedgerTransShortObj.corAccountDimension7="";
	 		axLedgerTransShortObj.corAccountDimension8="";
	 		axLedgerTransShortObj.corAccountDimension9="";
	 		axLedgerTransShortObj.corAccountDimension10="403002"; // НДС
	 		axLedgerTransShortObj.corAccountDimension11="";
	 		axLedgerTransShortObj.corAccountDimension12="";
	 		axLedgerTransShortObj.corAccountDimension13="";
	 		axLedgerTransShortObj.ledgerTxt = " ENERGYNET. проводка axLedgerTransShortObj for test " ;
	 		axLedgerTransShortObj.voucher = "";

	 		ledgerTransPostingPackList.list.add(axLedgerTransShortObj);
	 		count = count +1;

		}
		    ledgerTransPostingPackList.setTotalCount(count);


		// передача проводок в АХ
		   AXPostingLogic axpLogic = new AXPostingLogic(conn, getUserProfile());
          // String 	retVouchermDAX  = axpLogic.movePostingToAXForServicesFromTheSideModify(/*ledgerTransPostingPackList*/ ledgerTransPostingPackList  , custTransPostingPackList , "" );
          // System.out.print(" retVouchermDAX " + retVouchermDAX );


		}
		catch (Exception e) {throw new EnergyproSystemException(e.getMessage(), e);}

	}


	public void test_admin_generateAutoOrderByCountersServices()
	{
		try
		{
		Connection conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);


		 ServicesLogic soLogic = new ServicesLogic(conn, getUserProfile());
         soLogic.generateAutoOrderByCountersServices();



		}
		catch (Exception e) {throw new EnergyproSystemException(e.getMessage(), e);}

	}

	public void test_admin_postings_by_act(int code )
	{
		try
		{
		Connection conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		ENActDAO actDAO = new ENActDAO(getUserProfile(), conn);
		ENAct2ProvDAO act2provDAO = new ENAct2ProvDAO(getUserProfile(), conn);

	    //ENAct act= actDAO.getObject(1017972803);
		ENAct act= actDAO.getObject(code);

		ActLogic actLogic = new ActLogic(conn, getUserProfile());

		FKProvResult pr = actLogic.movePostingByActWork(act);

		if (pr.partId > Integer.MIN_VALUE  )
        {
                ENAct2Prov act2Prov = new ENAct2Prov();

                act2Prov.actRef.code = act.code;
                act2Prov.partId = pr.partId;
                act2Prov.datePosting = act.dateGen;
                //act2Prov.voucher = retVouchermDAX;

                act2provDAO.add(act2Prov);

        }

		}
		catch (Exception e) {throw new EnergyproSystemException(e.getMessage(), e);}

	}


	public void test_admin_postings_by_oz(int code )
	{
		try
		{
		Connection conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		ENActDAO actDAO = new ENActDAO(getUserProfile(), conn);
		ENAct2ProvDAO act2provDAO = new ENAct2ProvDAO(getUserProfile(), conn);
		SCUsageInputItemOZDAO ozDAO = new SCUsageInputItemOZDAO(getUserProfile(), conn);
		SCUsageInputItemOZFilter ozFil = new SCUsageInputItemOZFilter();
		SCUsageInputDAO uiDAO = new SCUsageInputDAO(getUserProfile(), conn);
		SCUsageInputItemOZ2ProvDAO oz2provDAO = new SCUsageInputItemOZ2ProvDAO(getUserProfile(), conn);
	    //ENAct act= actDAO.getObject(1017972803);
		//ENAct act= actDAO.getObject(code);
		ozFil.code= code;
		int[] ozArr = ozDAO.getFilteredCodeArray(ozFil, 0, -1);

		SCUsageInputItemOZ oz = ozDAO.getObject(ozArr[0]);

		SCUsageInputFilter uiFil = new SCUsageInputFilter();
		uiFil.conditionSQL = " SCUsageInput.code =( select ui.usageinputrefcode from scusageinputitem ui where ui.code = " + oz.usageInputItemRef.code + " )  ";
		SCUsageInputShortList uiList = uiDAO.getScrollableFilteredList(uiFil, 0, -1);
		SCUsageInput ui = uiDAO.getObject( uiList.get(0).code );

		ActLogic actLogic = new ActLogic(conn, getUserProfile());

		FKProvResult pr = actLogic.movePostingByOZ(oz, ui);

		if (pr.partId > Integer.MIN_VALUE  )
        {

                SCUsageInputItemOZ2Prov oz2prov = new SCUsageInputItemOZ2Prov();

                oz2prov.ozRef.code = oz.code;
                oz2prov.partId = pr.partId;
                oz2prov.datePosting = ui.dateGen;
                //act2Prov.voucher = retVouchermDAX;

                oz2provDAO.add(oz2prov);

        }

		}
		catch (Exception e) {throw new EnergyproSystemException(e.getMessage(), e);}

	}


	public void test_admin_update_cehIdInAct(int code )
	{
		PreparedStatement statement = null;
        ResultSet  resultSet = null;

        Connection fkConnection = null;


        try {
        	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            Connection conn = getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            FINLogic finLogic = new FINLogic(fkConnection, getUserProfile());
        	ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(conn, getUserProfile());

        String sql = " select distinct a2h.tabnumber , a.dategen from enact2humen a2h , enact a \n"+
        		" where a2h.actrefcode = a.code \n"+
        		" and a.dateact between '01.01.2017' and current_date \n"+
        		" and a.acttyperefcode = 2 \n"+
        		" and a2h.cehid is null \n"+
        		" group by a2h.tabnumber , a.dategen \n"+
        		" order by a.dategen  ";


        statement = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE).prepareStatement(sql);
        resultSet = statement.executeQuery();

    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        int i;
        for(i = 0;resultSet.next();i++)
         {

    		ENAct2Humen a2hObj = finLogic.getBalansWithMainCeh(resultSet.getString(1), resultSet.getDate(2));
    	    		String balans = a2hObj.balans;
    	    		String cehId = a2hObj.cehId;

    	    ENAct2HumenFilter a2hFil = new ENAct2HumenFilter();
    	    //a2hFil.tabNumber = resultSet.getString(1);
    	    a2hFil.conditionSQL = " enact2humen.code in ( select a2h.code from enact2humen a2h , enact a " +
					              " where a2h.actrefcode = a.code " +
					              " and a.dategen = '"+ resultSet.getDate(2) +"'" +
					              " and a2h.tabnumber = '"+ resultSet.getString(1) +"' )";
    	    int[] a2hArr = a2hDAO.getFilteredCodeArray(a2hFil, 0, -1);
    	    if (a2hArr.length > 0 ){
    	    	for (int j = 0; j < a2hArr.length; j++) {
    	    		ENAct2Humen a2hObjUpd = a2hDAO.getObject(a2hArr[j]);
    	    		a2hObjUpd.cehId = cehId;
    	    		a2hDAO.save(a2hObjUpd);
    	    		System.out.println(" test_admin_update_cehIdInAct enact2humen.code = " + a2hArr[j] + " tabn =" + resultSet.getString(1) + " cehid = " + cehId );
				}
    	    }
    	    /*ENAct2Humen
        	resultSet.getDate(3)
            resultSet.getString(4*/

        }
        }
        catch (Exception e) {
            System.out.println("Error :" + e.getMessage());
            throw new SystemException(e) ;
        }


	}
	
	
	public void test_admin_Barcode(int code )
	{
		PreparedStatement statement = null;
        ResultSet  resultSet = null;

        Connection fkConnection = null;


        try {
        	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            Connection conn = getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            FINLogic finLogic = new FINLogic(fkConnection, getUserProfile());
        	ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(conn, getUserProfile());
        	
        	AttachmentsLogic attachmentsLogic = new AttachmentsLogic(
					getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE), getUserProfile());

        	
        	attachmentsLogic.CreateBarcodePdf("D:/dogovir.pdf", "D:/dogovir2.pdf" , "тип документа", "777777");
        }
        catch (Exception e) {
            System.out.println("Error :" + e.getMessage());
            throw new SystemException(e) ;
        }


	}
	
	
	public void test_admin_update_enrecordpointbyt_enrecordpointprom(int code )
	{
		PreparedStatement statement = null;
        ResultSet  resultSet = null;

        Connection fkConnection = null;
        Connection conn;
		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		


/*        try {

        	ScheduledEventsManager scheduledEventsManager = new ScheduledEventsManager();
			System.out.println("#####################  Start updateRecordpointBytInfo!!!");
			scheduledEventsManager.updateRecordpointBytInfo();
			System.out.println("#####################  updateRecordpointBytInfo is Done!!!");

			System.out.println("#####################  Start updateRecordpointPromInfo!!!");
			scheduledEventsManager.updateRecordpointPromInfo();
			System.out.println("#####################  updateRecordpointPromInfo is Done!!!");
        
        }
        catch (Exception e) {
            System.out.println("Error :" + e.getMessage());
            throw new SystemException(e) ;
        }
*/        
        
        /// ENElementDAO eDao = new ENElementDAO(getUserProfile(),conn);
			ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(conn, getUserProfile());
        
        System.out.print("######## getenelement  object.elementRef.code = " + 1017744878 ); 
        //ENElement e;
        ENAct2Humen e;
		try {
			// e =  eDao.getObject(1017744878); /// nada //
			e =  a2hDAO.getObject(1017744878); /// hnya//
		} catch (PersistenceException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        
        System.out.print("######## e = "   );
		} catch (DatasourceConnectException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}

	}

	/* Расчет отчислений с з/п для акта выполненных работ */
	public void calculateSalaryCharges(int code )
	{
		PreparedStatement statement = null;
        ResultSet  resultSet = null;

        Connection fkConnection = null;


        try {
        	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            Connection conn = getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            FINLogic finLogic = new FINLogic(fkConnection, getUserProfile());
        	ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(conn, getUserProfile());
        	ActLogic actLogic = new ActLogic(conn, getUserProfile());

        String sql =  " select  distinct a.code from enact a , enact2humen a2h , enplanworkstate ps , enact2enplanwork a2p " +
        		 " where a.dategen >='01.01.2017' " +
        		 " and a.code = a2h.actrefcode  " +
        		 " and (a2h.balans is null or a2h.balans ='' or  a2h.chargesum is null ) " +
        		 " and a.acttyperefcode = ps.code " +
        		 " and a.acttyperefcode not in (12 , 7) " +
        		 " and a.code = a2p.actrefcode " +
        		 " and a.statusrefcode = 4 " ;



        statement = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE).prepareStatement(sql);
        resultSet = statement.executeQuery();

    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	int size = 0 ;
    	//resultSet.beforeFirst();
    	//resultSet.last();
    	//size = resultSet.getRow();

    	//resultSet.beforeFirst();
        int i;
        for(i = 0;resultSet.next();i++)
         {
        	System.out.println(" calculateSalaryCharges resultSet index  =  " + i  );
        	actLogic.calculateSalaryCharges(resultSet.getInt("code") );

        }
        }
        catch (Exception e) {
            System.out.println("Error :" + e.getMessage());
            throw new SystemException(e) ;
        }


	}



	public void recalpurchase(int code )
	{
		PreparedStatement statement = null;
        ResultSet  resultSet = null;

        Connection fkConnection = null;


        try {
        	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
            Connection conn = getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
            FINLogic finLogic = new FINLogic(fkConnection, getUserProfile());
        	ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(conn, getUserProfile());
        	ActLogic actLogic = new ActLogic(conn, getUserProfile());
        	ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(conn, getUserProfile());
        	ENEstimateItem2ContractDAO ei2ctDAO = new ENEstimateItem2ContractDAO(conn, getUserProfile());
        	RQOrgDAO orgDAO = new RQOrgDAO(conn, getUserProfile());
        	OrderItemLogic oitemLogic = new OrderItemLogic(conn, getUserProfile());
        	RQOrderItemDAO oiDAO = new RQOrderItemDAO(conn, getUserProfile());
        	RQPurchaseItem2EstimateItemDAO pi2eiDAO = new RQPurchaseItem2EstimateItemDAO(conn, getUserProfile());

        String sql =   "  select  'update rqorderitem set purchaseitemrefcode = '||(select i.purchaseitemrefcode from enestimateitem i where i.code = estimateparent ) " +
        		"   || ' where code = '|| oicode || ';' as txtsql " +
        		"   ,  estimateitemcode , estimateparent , oicode , materialnamegen , countfact " +
        		"   , (select i.purchaseitemrefcode from enestimateitem i where i.code = estimateparent ) as purchaseitemrefcode  " +
        		"   , purchasefromoi " +
        		"   from (  " +
        		"   select q.estimateitemcode  " +
        		"   , ( " +
        		"  select distinct eii.code " +
        		"    from enestimateitem eii     " +
        		"     where eii.materialrefcode = ei.materialrefcode " +
        		"       and eii.planrefcode = ei.planrefcode " +
        		"       and case when ei.planitemrefcode is null then 0 else eii.planitemrefcode end = case when ei.planitemrefcode is null then 0 else ei.planitemrefcode end " +
        		"       and eii.code <> ei.code " +
//        		"       --and eii.code in (select ccc.estimateitemcode from enestimateitem2contrct ccc ) " +
        		"       and eii.code in (select ww.estimateitemrefcode from rqpurchaseitem2estmttm ww ) " +
        		"       limit 1 " +
        		"       ) as  estimateparent     " +
        		"        , oi.code as oicode , oi.materialnamegen , ei.countfact , oi.purchaseitemrefcode as purchasefromoi  " +
        		"   from rqorderitem2enestimttm q ,rqorderitem oi , rqorder o  , enestimateitem ei   " +
        		"   where o.code = oi.orderrefcode  " +
        		"   and o.code in (1017019622 , 1017019698 ) " +
        		"   and q.orderitemcode not in (1027165505 , 1027165506 ) " +
        		"   and q.orderitemcode = oi.code  " +
        		"   and oi.statusrefcode = 1  " +
        		"   and oi.purchaseitemrefcode is null  " +
        		"   and q.estimateitemcode = ei.code  " +
        		"   and oi.materialnamegen not like 'МАСТИЛО МОТОРНЕ 2-Х ТАКТ%' " +
        		"   ) as qqq " +
        		"   where estimateparent is not null ";

        statement = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE).prepareStatement(sql);
        resultSet = statement.executeQuery();

    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	int size = 0 ;
        int i;
        for(i = 0;resultSet.next();i++)
         {
        	ENEstimateItemFilter eiFil = new ENEstimateItemFilter();
        	eiFil.code = resultSet.getInt("estimateitemcode");
            ENEstimateItem eiNew = eiDAO.getObject(resultSet.getInt("estimateitemcode"));

            RQPurchaseItem2EstimateItemFilter piItem2EstimateItemFilter = new RQPurchaseItem2EstimateItemFilter();
            piItem2EstimateItemFilter.estimateItemRef.code = resultSet.getInt("estimateparent");
            piItem2EstimateItemFilter.purchaseItemRef.code = resultSet.getInt("purchaseitemrefcode");
            int[] piItem2EstimateItemArrParent = pi2eiDAO.getFilteredCodeArray(piItem2EstimateItemFilter, 0, -1);
            RQPurchaseItem2EstimateItem piItem2EstimateItemParent = pi2eiDAO.getObject(piItem2EstimateItemArrParent[0]);
            // на связке с естимейтом парент обновим кол-во для закупки
            piItem2EstimateItemParent.countPurchase = piItem2EstimateItemParent.countPurchase.subtract(eiNew.countFact);
            pi2eiDAO.save(piItem2EstimateItemParent);
            // вставка связки для корявого estimate


            RQPurchaseItem2EstimateItem pi2eiNew = new RQPurchaseItem2EstimateItem();
            pi2eiNew.code = Integer.MIN_VALUE;
            pi2eiNew.countGen = eiNew.countFact;
            pi2eiNew.countPurchase = eiNew.countFact;
            pi2eiNew.estimateItemRef.code = eiNew.code;
            pi2eiNew.purchaseItem2EstimateItemStatusRef.code = piItem2EstimateItemParent.purchaseItem2EstimateItemStatusRef.code;
            pi2eiNew.purchaseItemRef.code = piItem2EstimateItemParent.purchaseItemRef.code;
            pi2eiNew.purItemSourceReplaseRef.code = piItem2EstimateItemParent.purItemSourceReplaseRef.code;
            pi2eiDAO.add(pi2eiNew);
            ///////

            //на новом естимейте сохраним сылку на строку плана закупок ту которую нашли у парента

            eiNew.purchaseItemRef.code = piItem2EstimateItemParent.purchaseItemRef.code;
            eiDAO.save(eiNew , false);

           /* ENEstimateItem2ContractFilter ei2ctFil = new ENEstimateItem2ContractFilter();
            ei2ctFil.estimateItem.code = resultSet.getInt("estimateparent");
            ENEstimateItem2ContractShortList ei2ctList = ei2ctDAO.getScrollableFilteredList(ei2ctFil, 0, -1);
            ENEstimateItem2Contract ei2ctObjOld = ei2ctDAO.getObject(ei2ctList.get(0).code);


            ENEstimateItem2Contract ei2ctForInsert = new ENEstimateItem2Contract();
            ei2ctForInsert.code = Integer.MIN_VALUE;

            RQOrg orgObj = orgDAO.getObject(ei2ctObjOld.org.code);

			orgObj.code = Integer.MIN_VALUE;
			ei2ctForInsert.org.code = oitemLogic.copyOrg(orgObj);

			ei2ctForInsert.contractDate = ei2ctObjOld.contractDate;
			ei2ctForInsert.contractNumber = ei2ctObjOld.contractNumber;
			ei2ctForInsert.finDocCode = ei2ctObjOld.finDocCode;
			ei2ctForInsert.finDocID = ei2ctObjOld.finDocID;
			ei2ctForInsert.estimateItem.code = eiNew.code;
			ei2ctForInsert.countFact = eiNew.countFact;
			ei2ctForInsert.rqPurchItm2Estimate.code = ei2ctObjOld.rqPurchItm2Estimate.code;
			ei2ctForInsert.generalContractRef.code = ei2ctObjOld.generalContractRef.code;
			ei2ctDAO.add(ei2ctForInsert);


			// договор на строке заявки
			RQOrderItemFilter orderItemFilter = new RQOrderItemFilter();
			orderItemFilter.conditionSQL = " rqorderitem.code in (select q.orderitemcode from rqorderitem2enestimttm q where q.estimateitemcode = "+ eiNew.code +" limit 1) ";
			int[] oiArr = oiDAO.getFilteredCodeArray(orderItemFilter, 0, -1);

			RQOrderItem orderItem = oiDAO.getObject(oiArr[0]);
			orderItem.org.code = oitemLogic.copyOrg(orgObj);
			orderItem.finDocID = ei2ctForInsert.finDocID;
            orderItem.finDocCode = ei2ctForInsert.finDocCode;
            orderItem.contractNumber = ei2ctForInsert.contractNumber;
            orderItem.contractDate = ei2ctForInsert.contractDate;
            orderItem.generalContractRef.code = ei2ctForInsert.generalContractRef.code;
            oiDAO.save(orderItem);*/
        }
        }
        catch (Exception e) {
            System.out.println("Error :" + e.getMessage());
            throw new SystemException(e) ;
        }


	}


	 protected java.sql.Connection getNEWConnection(String dataSourceName) throws DatasourceConnectException
     {
         java.sql.Connection    _connection = null;
         try {

             InitialContext initialContext = new InitialContext();
             DataSource dataSource = (DataSource) initialContext
                     .lookup(dataSourceName);
             _connection = dataSource.getConnection();

             return _connection;
         } catch (NamingException e) {
             //System.out.print("error");
             throw new DatasourceConnectException(dataSourceName, e);
         } catch (SQLException e) {
             //System.out.print("error");
             throw new DatasourceConnectException("Нет связи с Фин.Коллекцией ... перевод месяца или еще что то ...", e);
         }
     }



	 /* Расчет отчислений с з/п для акта выполненных работ */
		public void razdelenie_enestimateitem(int code )
		{
			PreparedStatement statement = null;
	        ResultSet  resultSet = null;

	        Connection fkConnection = null;


	        try {
	        	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	            Connection conn = getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
	            FINLogic finLogic = new FINLogic(fkConnection, getUserProfile());
	        	ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(conn, getUserProfile());
	        	ActLogic actLogic = new ActLogic(conn, getUserProfile());

	        String sql =  " select  distinct a.code from enact a , enact2humen a2h , enplanworkstate ps , enact2enplanwork a2p " +
	        		 " where a.dategen >='01.01.2017' " +
	        		 " and a.code = a2h.actrefcode  " +
	        		 " and (a2h.balans is null or a2h.balans ='' or  a2h.chargesum is null ) " +
	        		 " and a.acttyperefcode = ps.code " +
	        		// " and a.acttyperefcode not in (12 , 7) " +
	        		 " and a.code = a2p.actrefcode " +
	        		 " and a.statusrefcode = 4 " ;



	        statement = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE).prepareStatement(sql);
	        resultSet = statement.executeQuery();

	    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    	int size = 0 ;
	    	//resultSet.beforeFirst();
	    	//resultSet.last();
	    	//size = resultSet.getRow();

	    	//resultSet.beforeFirst();
	        int i;
	        for(i = 0;resultSet.next();i++)
	         {
	        	System.out.println(" calculateSalaryCharges resultSet index  =  " + i  );
	        	actLogic.calculateSalaryCharges(resultSet.getInt("code") );

	        }
	        }
	        catch (Exception e) {
	            System.out.println("Error :" + e.getMessage());
	            throw new SystemException(e) ;
	        }


		}

		public void unCreatedPrihodRQAllocationList( )
		{
			PreparedStatement statement = null;
	        ResultSet  resultSet = null;

	        Connection fkConnection = null;


	        try {
			  FKOrderLogic fkOrderLogic = new FKOrderLogic(getUserProfile(), getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) ) ;
			  fkOrderLogic.unCreatedPrihod(/*rqFKCode*/1017641841, /*isAllocationList*/true);
	        }
	        catch (Exception e) {
	            System.out.println("Error :" + e.getMessage());
	            throw new SystemException(e) ;
	        }
		}


		 public void recalculateSalary() {

			   // TKTechCardDAO tkDao = new TKTechCardDAO(energyNetConnection, userProfile);
			  //  TechCardLogic logic = new TechCardLogic(energyNetConnection, userProfile);
			    TKTechCardFilter tkFilter = new TKTechCardFilter();
			    tkFilter.conditionSQL = " TKTechCard.code in ( "
			    		+ ""
			    		+ ""
			    		+ " select tkd.code from "
			    		+ " tktechcard tkd   , tkelement2techcard el2tk , tkelement tl  "
			    		+ " where  tkd.code = el2tk.techkartcode  "
			    		+ " and el2tk.elementcode=tl.code  "
			    		+ " and tl.elementtypecode = 240000002  "
			    		+ " and tkd.classificationtypecode in (   "
			    		+ " select t1.code as tkclassificationtypecode from tkclassificationtype t1 where t1.code = 1040003056  "
			    		+ " union all  "
			    		+ " select t1.code as tkclassificationtypecode from tkclassificationtype t1 where t1.parentrefcode = 1040003056  "
			    		+ " union ALL  "
			    		+ " select t1.code as tkclassificationtypecode from tkclassificationtype t1 where t1.parentrefcode in (select t2.code from tkclassificationtype t2 where t2.parentrefcode = 1040003056)  "
			    		+ " union ALL  "
			    		+ " select t1.code as tkclassificationtypecode from tkclassificationtype t1 where t1.parentrefcode in (select t2.code from tkclassificationtype t2 where t2.parentrefcode in ((select t3.code from tkclassificationtype t3 where t3.parentrefcode = 1040003056) ))  "
			    		+ " union ALL  "
			    		+ " select t1.code as tkclassificationtypecode from tkclassificationtype t1 where t1.parentrefcode in (select t2.code from tkclassificationtype t2 where t2.parentrefcode in ((select t3.code from tkclassificationtype t3 where t3.parentrefcode in (select t4.code from tkclassificationtype t4 where t4.parentrefcode = 1040003056) ) ))  "
			    		+ " union ALL  "
			    		+ " select t1.code as tkclassificationtypecode from tkclassificationtype t1 where t1.parentrefcode in (select t2.code from tkclassificationtype t2 where t2.parentrefcode in ((select t3.code from tkclassificationtype t3 where t3.parentrefcode in (select t4.code from tkclassificationtype t4 where t4.parentrefcode in (select t5.code from tkclassificationtype t5 where t5.parentrefcode = 1040003056)) ) ))  "
			    		+ " union ALL  "
			    		+ " select t1.code as tkclassificationtypecode from tkclassificationtype t1 where t1.parentrefcode in (select t2.code from tkclassificationtype t2 where t2.parentrefcode in ((select t3.code from tkclassificationtype t3 where t3.parentrefcode in (select t4.code from tkclassificationtype t4 where t4.parentrefcode in (select t5.code from tkclassificationtype t5 where t5.parentrefcode in (select t6.code from tkclassificationtype t6 where t6.parentrefcode = 1040003056) )) ) ))  "
			    		+ " union ALL  "
			    		+ " select t1.code as tkclassificationtypecode from tkclassificationtype t1 where t1.parentrefcode in (select t2.code from tkclassificationtype t2 where t2.parentrefcode in ((select t3.code from tkclassificationtype t3 where t3.parentrefcode in (select t4.code from tkclassificationtype t4 where t4.parentrefcode in (select t5.code from tkclassificationtype t5 where t5.parentrefcode in (select t6.code from tkclassificationtype t6 where t6.parentrefcode in  (select t7.code from tkclassificationtype t7 where t7.parentrefcode = 1040003056) ) )) ) ))  "
			    		+ " union ALL  "
			    		+ " select t1.code as tkclassificationtypecode from tkclassificationtype t1 where t1.parentrefcode in (select t2.code from tkclassificationtype t2 where t2.parentrefcode in ((select t3.code from tkclassificationtype t3 where t3.parentrefcode in (select t4.code from tkclassificationtype t4 where t4.parentrefcode in (select t5.code from tkclassificationtype t5 where t5.parentrefcode in (select t6.code from tkclassificationtype t6 where t6.parentrefcode in  (select t7.code from tkclassificationtype t7 where t7.parentrefcode in (select t8.code from tkclassificationtype t8 where t8.parentrefcode = 1040003056) ) ) )) ) ))  "
			    		+ " union ALL  "
			    		+ " select t1.code as tkclassificationtypecode from tkclassificationtype t1 where t1.parentrefcode in (select t2.code from tkclassificationtype t2 where t2.parentrefcode in ((select t3.code from tkclassificationtype t3 where t3.parentrefcode in (select t4.code from tkclassificationtype t4 where t4.parentrefcode in (select t5.code from tkclassificationtype t5 where t5.parentrefcode in (select t6.code from tkclassificationtype t6 where t6.parentrefcode in  (select t7.code from tkclassificationtype t7 where t7.parentrefcode in (select t8.code from tkclassificationtype t8 where t8.parentrefcode in (select t9.code from tkclassificationtype t9 where t9.parentrefcode = 1040003056) ) ) ) )) ) ))  "
			    		+ " ) "
			    		+ ""
			    		+ ""
			    		+ " ) ";

			 /*   int[] codes = tkDao.getFilteredCodeArray(tkFilter, 0, -1);

			    for(int code : codes) {

					TKTechCard object = tkDao.getObject(code);
					object.middlesallaryway = logic.getAverageSalaryInWay(object.code, new Date());
					tkDao.save(object);
					System.out.println(" getAverageSalaryInWay by TKTechCardCode =  " + object.code +" = "+ object.middlesallaryway );
			    }*/

//			    Context context = new InitialContext();
//			    Object objRef = context.lookup(ENPlanWorkController.JNDI_NAME);
//			    ENPlanWorkControllerHome planWorkHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(objRef, ENPlanWorkControllerHome.class);
//			    ENPlanWorkController planWorkController = planWorkHome.create();
//
//
//
//			    ENPlanWorkDAO pDao = new ENPlanWorkDAO(aConnection, anUserProfile)
//			    ENPlanWorkFilter pFilter = new ENPlanWorkFilter();
//			    pFilter.conditionSQL = " enplanwork.code in ( select p.code " +
//									"	from enplanwork p " +
//									"	where p.kindcode = 1 " +
//								"		and p.yeargen = 2018 " +
//							"			and p.budgetrefcode = 240000001 " +
//						"				and p.statuscode = 1 " +
//						"				and (p.monthgen = 1 or p.monthgen = 2) " +
//					"					 ) " ;
//			    int[] pArr = pDao.getFilteredCodeArrayNOSEGR(pFilter, 0, -1);
//			    for (int i = 0; i < pArr.length; i++) {
//
//			    	int planCodeNew = planWorkController.closePlanWork(pArr[i]);
//				    planWorkController.preConfirm(planCodeNew);
//				}

			 }

		 public void test_admin_update_podr_zku(int code )
			{
				PreparedStatement statement = null;
		        ResultSet  resultSet = null;

		        Connection fkConnection = null;


		        try {
		        	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
		            Connection conn = getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		            FINLogic finLogic = new FINLogic(fkConnection, getUserProfile());
		            SCCounterDAO sccDao = new SCCounterDAO(conn, getUserProfile());
		            SCLogicDAO scLogicDAO = new SCLogicDAO(fkConnection, getUserProfile());

		            SCCounterFilter sccFilter = new SCCounterFilter();
		            sccFilter.conditionSQL = "    sccounter.code in ( \n" +
					"  select distinct sc.code  from  \n" +
					"  sccounter sc  ,  \n" +
					"  scusageinputtmz2sccntr sc2oz ,  \n" +
					"  scusageinputitemoz ,  \n" +
					"  scusageinputitem ,  \n" +
					"  scusageinput  , enestimateitem eii  \n" +
					"  where sc.sccodezku is not null  \n" +
					"  and sc.podrcodezku is null \n" +
					"  and sc.estimateitemrefcode=eii.code \n" +
					"  and eii.kindrefcode=1 \n" +
					"  and eii.accountingtyperefcode=2 \n" +
					"  and sc.code = sc2oz.sccounterrefcode \n" +
					"  and scusageinputitemoz.code=sc2oz.ozrefcode \n" +
					"  and scusageinputitemoz.usageinputitemrefcode=scusageinputitem.code \n" +
					"  and scusageinput.code = scusageinputitem.usageinputrefcode \n" +
					"  and scusageinput.dategen>='01.01.2017' \n" +
					"  )  ";

		            int[] sccArr = sccDao.getFilteredCodeArray(sccFilter, 0, -1);
		            for (int i = 0; i < sccArr.length; i++) {
						SCCounter scc = sccDao.getObject(sccArr[i]);
						scc.podrCodeZKU= scLogicDAO.getPodrCodeZKU(scc.sccodezku);
						System.out.println(" sccodezku = " + scc.sccodezku + " scc.podrCodeZKU =  " + scc.podrCodeZKU + " kodinvzku = " +  scc.invnumberzku );
						if ( scc.podrCodeZKU != null ){
							if ( !scc.podrCodeZKU.equals("") ){
								sccDao.save(scc);
							}
						}
					}


		        }
		        catch (Exception e) {
		            System.out.println("Error :" + e.getMessage());
		            throw new SystemException(e) ;
		        }


			}


			public void estimateWithoutContractLink2Contract(int code )
			{
				PreparedStatement statement = null;
		        ResultSet  resultSet = null;

		        Connection fkConnection = null;


		        try {
		        	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
		            Connection conn = getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		            FINLogic finLogic = new FINLogic(fkConnection, getUserProfile());
		        	ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(conn, getUserProfile());
		        	ActLogic actLogic = new ActLogic(conn, getUserProfile());
		        	ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(conn, getUserProfile());
		        	ENEstimateItem2ContractDAO ei2ctDAO = new ENEstimateItem2ContractDAO(conn, getUserProfile());
		        	RQOrgDAO orgDAO = new RQOrgDAO(conn, getUserProfile());
		        	OrderItemLogic oitemLogic = new OrderItemLogic(conn, getUserProfile());
		        	RQOrderItemDAO oiDAO = new RQOrderItemDAO(conn, getUserProfile());
		        	RQPurchaseItem2EstimateItemDAO pi2eiDAO = new RQPurchaseItem2EstimateItemDAO(conn, getUserProfile());

		        String sql =   " ";

//		        RQTndIt2PrsIt2CntrctIt tn2pr2ctObj = new RQTndIt2PrsIt2CntrctIt();
//		        tn2pr2ctObj.tndIt2PrsItRef.code = 44334; // kod stroki zakupki
//		        tn2pr2ctObj.enContractCode = 500003940;
//		        tn2pr2ctObj.countGen = new BigDecimal(140680) ;
//		        tn2pr2ctObj.price = new BigDecimal(2.88);
//		        tn2pr2ctObj.userGen = getUserProfile().userName;
//
//		        PlanPurchaseLogic purchaseLogic = new PlanPurchaseLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
//				 purchaseLogic.addPurchaseItemTender2PurchaseItem2ENcontractItem(tn2pr2ctObj);

		        ENPlanWorkFilter pFilter = new ENPlanWorkFilter();

		        ENEstimateItemFilter eiFilter = new ENEstimateItemFilter();
		         sql = " ENESTIMATEITEM.CODE IN (select qqq.estimateitemrefcode " +
											"	from rqpurchaseitem2estmttm qqq,  enestimateitem ei /*, rqorderitem2enestimttm o2e */  , enplanwork pp  " +
							    	"		where qqq.purchaseitemrefcode=44334  " +
								  "			and qqq.estimateitemrefcode=ei.code  " +
								  "				and ei.materialrefcode= 500008911 "
								+ "             /*and ei.code =o2e.estimateitemcode*/  "
								+ "       and ei.planrefcode=pp.code  "
								+ " and pp.yeargen=2018 and pp.monthgen between 4 and 6 "
								+ " and ei.code not in (select ei2ct.estimateitemcode from enestimateitem2contrct ei2ct where ei2ct.estimateitemcode=ei.code ) "
								+ " ) ";

		         ////

		         // заявка плановая февраль 2018
		        sql = " ENESTIMATEITEM.CODE IN ( select h.estimateitemcode from rqorderitem2enestimttm h , rqorderitem oi  " +
		        		" where h.orderitemcode = oi.code " +
                        " and   oi.code = 1027203925 " + " ) ";

		        eiFilter.conditionSQL = sql;

		        ENEstimateItemShort[] eiList = eiDAO.getDetailedESListForLink2Contract(eiFilter, pFilter);

		        EstimateLogic eilogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		        eilogic.estimateWithoutContractLink2Contract(eiList ,  /*enContractItemCode*/500033175 );


		        }
		        catch (Exception e) {
		            System.out.println("Error :" + e.getMessage());
		            throw new SystemException(e) ;
		        }


			}


			public void recalcBoundarydateworkByServicesobject(int code )
			{
				PreparedStatement statement = null;
		        ResultSet  resultSet = null;

		        Connection fkConnection = null;


		        try {


	        	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	            Connection conn = getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(conn, getUserProfile());
	            ENDelayServicesDAO dlDAO = new ENDelayServicesDAO(conn, getUserProfile());
	        	ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(conn, getUserProfile());
	        	ActLogic actLogic = new ActLogic(conn, getUserProfile());
	        	ServicesLogic servicesLogic = new ServicesLogic(conn, getUserProfile());

		        String sql =   " ";

                ENServicesObjectFilter soF = new ENServicesObjectFilter();
                soF.conditionSQL =  "  enservicesobject.code in (    \n" +
								"      select so.code from enservicesobject so  \n" +
								"      where  \n" +

								"       so.contracttyperefcode in( 1 , 2 , 5 )  \n" +
								"       and so.contractdateservices > '10.07.2018' \n" +
								"       and so.contractstatusrefcode in ( 5 /*Сплачений*/) \n" +
								"       and so.boundarydatework is null  \n" +
								"        order by so.contractdateservices       )   " ;

		        int[] soArr = soDAO.getFilteredCodeArrayNOSEGR(soF, 0, -1);
                for (int i = 0; i < soArr.length; i++) {
                	System.out.print(" \n  recalcBoundarydateworkByServicesobject +++++++  "+ i + " of " + soArr.length + " so object " );
                	// пересчет граничной даты
                	servicesLogic.calculationBoundaryDateWork(soDAO.getObjectNoSegr(soArr[i]));

                	// если есть задержки то пересчет по задержкам
                	ENDelayServicesFilter dlF = new ENDelayServicesFilter();
                	dlF.servicesObjectRef.code = soArr[i];
                	int[] dlArr = dlDAO.getFilteredCodeArray(dlF, 0, -1);
                	if (dlArr.length > 0 ) {
                		servicesLogic.calculationBoundaryDateWorkAtDelays(soDAO.getObjectNoSegr(soArr[i]));
					}


				}



		        }
		        catch (Exception e) {
		            System.out.println("Error :" + e.getMessage());
		            throw new SystemException(e) ;
		        }


			}


			public void updateFullAxExecutorName(int code )
			{
				PreparedStatement statement = null;
		        ResultSet  resultSet = null;

		        Connection fkConnection = null;


		        try {
		        	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
		            Connection conn = getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		            FINLogic finLogic = new FINLogic(fkConnection, getUserProfile());
		        	FINExecutorDAO fexDAO = new FINExecutorDAO(conn, getUserProfile());
		        	FINExecutorLogic finExecutorLogic = new FINExecutorLogic(conn, getUserProfile());

		        String sql = " select distinct ff.code from enplanwork pp , finexecutor ff \n"+
		        		" where pp.yeargen = 2018  \n"+
		        		" and pp.monthgen >= 4 \n"+
		        		" and pp.kindcode in (2,3,4) and ((ff.axorgid is not null) and (ff.axorgid <> '' ))  \n";


		        statement = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE).prepareStatement(sql);
		        resultSet = statement.executeQuery();

		    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		        int i;
		        for(i = 0;resultSet.next();i++)
		         {

		    		FINExecutor fex = fexDAO.getObject(resultSet.getInt(1));

		    		String fullAxExecutorName = finExecutorLogic.getFullAxExecutorName(fex);
		    		fex.name = fullAxExecutorName;
		    		fexDAO.save(fex);
                  System.out.print(" begin updateFullAxExecutorName === " + i);
		        }
		        }
		        catch (Exception e) {
		            System.out.println("Error :" + e.getMessage());
		            throw new SystemException(e) ;
		        }


			}

			/////////// перенос планов
			public void moveMonthPlan(int code )
			{
				PreparedStatement statement = null;
		        ResultSet  resultSet = null;

		        Connection fkConnection = null;


		        try {
		        	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
		            Connection conn = getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		            FINLogic finLogic = new FINLogic(fkConnection, getUserProfile());
		        	FINExecutorDAO fexDAO = new FINExecutorDAO(conn, getUserProfile());
		        	FINExecutorLogic finExecutorLogic = new FINExecutorLogic(conn, getUserProfile());
		        	ENPlanWorkDAO ppDAO = new ENPlanWorkDAO(conn, getUserProfile());
		        	PlanWorkLogic planLogic = new PlanWorkLogic(conn,getUserProfile());

		        	ENPlanWorkFilter ppFil = new ENPlanWorkFilter();
		        	ppFil.yearGen = 2019;
		        	ppFil.budgetRef.code = 75000001;
		        	ppFil.kind.code = ENPlanWorkKind.CURRENT;

		        	ENPlanWorkShortList ppList = ppDAO.getScrollableFilteredListNOSEGR(ppFil, 0, -1);

		        	for (int i = 0; i < ppList.totalCount; i++) {

		        		ENPlanWorkMoveHistory plhistObj = new ENPlanWorkMoveHistory();
		        		plhistObj.planRef.code = ppList.get(i).code;
		        		plhistObj.reason.code = ENPlanWorkMoveReason.NO_WORKERS;
		        		plhistObj.commentGen = "SUPP-73775";
		        		plhistObj.yearGen = 2066;
		        		plhistObj.monthGen = ppList.get(i).monthGen;
		        		plhistObj.dateGen = new Date();

		        		System.out.print("###moveMonthPlan############  plancode =  " + ppList.get(i).code  );
		        		planLogic.movePlanWork(plhistObj, false);

					}


		        }
		        catch (Exception e) {
		            System.out.println("Error :" + e.getMessage());
		            throw new SystemException(e) ;
		        }


			}


			/*!!!!!!!!!!!!!!!!!!!!!!!!! */
			public void recalcENPlanworkItem2Humen(int code )
			{
				PreparedStatement statement = null;
		        ResultSet  resultSet = null;
		        Connection fkConnection = null;
		        try {
	        	//fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	            Connection conn = getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(conn, getUserProfile());
	            ENDelayServicesDAO dlDAO = new ENDelayServicesDAO(conn, getUserProfile());
	        	ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(conn, getUserProfile());
	        	ActLogic actLogic = new ActLogic(conn, getUserProfile());
	        	ServicesLogic servicesLogic = new ServicesLogic(conn, getUserProfile());
	        	ENActDAO actDAO = new ENActDAO(conn, getUserProfile());
	        	ActCalculator actClc = new ActCalculator(conn, getUserProfile());

		        String sql =   " ";

                ENActFilter aF = new  ENActFilter();
                aF.conditionSQL = " enact.code in ( " +
			           "  select distinct a.code \n" +
			"   from enplanworkitem2humen ph , enplanwork p , enact2enplanwork a2p , enact a , enplanworkitem pi \n" +
			"  where ph.plaitemrefcode = pi.code  \n" +
			"  and pi.planrefcode = p.code  \n" +
			"  and p.code = a2p.plancode  \n" +
			"  and a2p.actrefcode = a.code \n" +
			"  and  ( select p2c.calckindrefcode from enplancorrecthistory hhh  , enplanwork2classfctntp p2c  \n" +
			"      where hhh.planoldrefcode = p2c.planrefcode \n" +
			"        and hhh.reasoncode = 13  \n" +
			"        and  hhh.plannewrefcode in ( \n" +
			"              select hh.planoldrefcode from enplancorrecthistory hh \n" +
			"              where hh.reasoncode = 4  \n" +
			"                and hh.plannewrefcode in (  \n" +
			"                  select h.planoldrefcode from enplancorrecthistory h \n" +
			"                  where h.reasoncode = 5  \n" +
			"                    and  h.plannewrefcode in ( select a2p.plancode from enact2enplanwork a2p where a2p.actrefcode =  a.code ) \n" +
			"                  )  \n" +
			"      ) \n" +
			"      limit 1  ) in (2,3) \n" +
			"   and (    \n" +
			"    ph.paysworkbonus <> ph.paysworkbonuswithotdlv  \n" +
			"      or ph.paysworksurcharge <> ph.paysworksurchrgwthtdlv  \n" +
			"      or ph.paysworkpremium  <> ph.paysworkpremiumwthtdlv  \n" +
			"      or ph.paysworkadditional <> ph.paysworkadditnlwthtdlv \n" +
			"      ) " +
			                		"      )  \n" ;




		        int[] aArr = actDAO.getFilteredCodeArray(aF, 0, -1);
                for (int i = 0; i < aArr.length; i++) {
                	System.out.print(" \n  recalcENPlanworkItem2Humen +++++++  "+ i + " of " + aArr.length + " actcode " + aArr[i] );

                	actClc.recalcPlanWorkItem2Humen( aArr[i] );
   				}
		        }
		        catch (Exception e) {
		            System.out.println("Error :" + e.getMessage());
		            throw new SystemException(e) ;
		        }
			}
			
			
			public void test_admin_add_prov_by_act(int actCode)
			{
				try
				{

 						Connection conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);


						 ActLogic actLogic = new ActLogic(conn, getUserProfile());
						 ENActDAO actDAO = new ENActDAO(conn, getUserProfile());
						 ENAct2ProvDAO act2provDAO = new ENAct2ProvDAO(conn, getUserProfile());
						 String up = getUserProfile().toString();
						 
						 ENAct act = actDAO.getObject(actCode);
						 FKProvResult provResult = actLogic.movePostingByActWork(act);

						 
						 
							    		   String badprovstring = "";
							    		   if (provResult != null ){
							    			   if (provResult.badProvList.totalCount > 0 ) {
							   	               	badprovstring="  ошибки ФК :  ";
							   	               	for (int b = 0; b < provResult.badProvList.totalCount; b++) {

							   	               		badprovstring = badprovstring + "\n"
							   	               				+    " Текст ошибки = " + provResult.badProvList.get(b).getDetailedList().get(0).err_mes
							   	               				+    " \n Примечание  = " + provResult.badProvList.get(b).primechan
							   	               				+    " \n bal_ceh " + provResult.badProvList.get(b).bal_ceh
							   	               				+    " \n bal_kau " + provResult.badProvList.get(b).bal_kau
							   	               				+    " \n bal_sch " + provResult.badProvList.get(b).bal_sch + provResult.badProvList.get(b).bal_sub_sch
							   	               				+    " \n kor_ceh " + provResult.badProvList.get(b).kor_ceh
							   	               				+    " \n kor_kau " + provResult.badProvList.get(b).kor_kau
							   	               				+    " \n kor_sch " + provResult.badProvList.get(b).kor_sch + provResult.badProvList.get(b).kor_sub_sch;
							   	   				}

							   	             throw new EnergyproSystemException( "\n" + badprovstring );

							   	               }


							   	   	        if (provResult.partId > Integer.MIN_VALUE  )
							   	               {
							   	   	                   ENAct2ProvFilter a2fFil = new ENAct2ProvFilter();
							   	   	                   a2fFil.actRef.code = act.code;
							   	   	                   int[] a2pFilArr = act2provDAO.getFilteredCodeArray(a2fFil, 0, -1);
							   	   	                   
							   	   	                   if (a2pFilArr.length==0){
							   	   	                	ENAct2Prov act2Prov = new ENAct2Prov();

							   	                        act2Prov.actRef.code = act.code;
							   	                        act2Prov.partId = provResult.partId;
							   	                        act2Prov.datePosting = act.dateGen;
							   	                        act2provDAO.add(act2Prov);  
							   	   	                   }
							   	   	                   else 
							   	   	                   {
							   	   	                	ENAct2Prov act2Prov = act2provDAO.getObject(a2pFilArr[0]);
							   	   	                	act2Prov.partId = provResult.partId;
						 	                            act2Prov.datePosting = act.dateGen;
						 	                            act2provDAO.save(act2Prov);  
							   	   	                   }

							   	               }

							    		    }
											
							


				}
				catch (DatasourceConnectException e) {throw new EnergyproSystemException(e.getMessage(), e);}
		        catch (PersistenceException e) {throw new EnergyproSystemException(e.getMessage(), e);}/*
		        catch (RemoteException e) {throw new EnergyproSystemException(e.getMessage(), e);}
		        catch (CreateException e) {throw new EnergyproSystemException(e.getMessage(), e);}*/

			}
			
			
			public void setEICcodeForServicesobject(int code )
			{
				PreparedStatement statement = null;
		        ResultSet  resultSet = null;

		        Connection fkConnection = null;


		        try {


	        	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	            Connection conn = getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(conn, getUserProfile());
	            ENDelayServicesDAO dlDAO = new ENDelayServicesDAO(conn, getUserProfile());
	        	
	        	ServicesLogic servicesLogic = new ServicesLogic(conn, getUserProfile());
	        	
	        	ENServicesObject sooObj =soDAO.getObject(code);

		        String sql =   " ";

		        sooObj.codeEIC = servicesLogic.getCodeEICForServices(sooObj);
	            if(!sooObj.codeEIC.equals("")){
	            	soDAO.save(sooObj);
	            }


		        }
		        catch (Exception e) {
		            System.out.println("Error :" + e.getMessage());
		            throw new SystemException(e) ;
		        }


			}
			
			public void addAttachement2Decree(int code )
			{
				PreparedStatement statement = null;
		        ResultSet  resultSet = null;

		        Connection fkConnection = null;
               int docDecree = code ;
               
               

		        try {
		        	
		        	DFDocDecreeDAO docDecreeDAO = new DFDocDecreeDAO(getUserProfile(), getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE));
		        	DFDocDecree decreeObj = docDecreeDAO.getObject(docDecree); 
		        Context cnt = new InitialContext();
	            Object objRef = cnt.lookup(ENReportController.JNDI_NAME);
	            
	            
	            ENReportControllerHome reportHome = (ENReportControllerHome) PortableRemoteObject.narrow(objRef, ENReportControllerHome.class);
	            ENReportController reportController = reportHome.create();
	            
	            
	            EPReportRequestEx request = new EPReportRequestEx();
	            
	            request.argNames = new String[]{"decreeCode"};
	            request.args = new String[]{docDecree+""};
		        request.reportCode = 0;
		        request.funcName = "/com/ksoe/docflow/reports/Decree/decreeRM_KB.jasper";
		        
		        
		        request.resultType = Integer.MIN_VALUE;		        
		        
		        //zzzzzDecree
	            byte[] DecreeDocFile = reportController.processAsByteArray(request, "doc", true);
	            
	            // ===========  подкинуть во вложение файл с распоряжение 
	            Context cntDf = new InitialContext();
	            Object objRefDf = cntDf.lookup(DFDocAttachmentController.JNDI_NAME);
	            DFDocAttachmentControllerHome attachmentHome = (DFDocAttachmentControllerHome) PortableRemoteObject.narrow(objRefDf, DFDocAttachmentControllerHome.class);
	            DFDocAttachmentController attachmentController = attachmentHome.create();
	            
	            
	            DFDocAttachment DFDocAttachmentObject = new DFDocAttachment();
	            DFDocAttachmentObject.doc.code = decreeObj.doc.code;
	            
	            
	            String attachmentName = "проект_розпорядження_№_=" +decreeObj.numberGen+"від" + new SimpleDateFormat("dd.MM.yyyy").format(decreeObj.doc.dateRegistration).toString() +".doc";
	            
	            DFDocAttachmentObject.commentGen= "проект_розпорядження";
	            attachmentController.add(DFDocAttachmentObject, DecreeDocFile /*aFile*/, attachmentName );
	            }
		        catch (Exception e) {
		            System.out.println("Error :" + e.getMessage());
		            throw new SystemException(e) ;
		        }


			}
			
			
			/*пересчитать время на работе и хуменах */
			  public void recalcPlanworkItemAndHumenItemsByPlanItemCode(int planworkItemCode )
			   {
			    try
			     {
			     

			      ENPlanWorkItem2TKKoefDAO objectDAO = new ENPlanWorkItem2TKKoefDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			      
			      ///// 02.07.12 NET-2345 Запрет добавления более одного корректирующего коэффициента для работ на плане 
/*			      ENPlanWorkItem2TKKoefFilter koefFilter = new ENPlanWorkItem2TKKoefFilter();
			      koefFilter.planWorkItemRef.code = object.planWorkItemRef.code;
			      ENPlanWorkItem2TKKoefShortList koefList = objectDAO.getScrollableFilteredList(koefFilter, 0, -1);

			      if (koefList.totalCount > 0)
			      {
			    	  throw new EnergyproSystemException("NET-2345 Заборонено використовувати більше одного корегуючого коефіцієнта для роботи!");
			      }*/
			      /////
			      
			      
			      
			      new PlanWorkItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) ,getUserProfile()).updateCoef(planworkItemCode);
			      
			      // время на людях ..
			      new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) ,getUserProfile()).recalcHumenItemsByPlanItemCode(planworkItemCode);
			      
			      
			     }
			    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENPlanWorkItem2TKKoef%} object.",e);}
			    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
			    finally                              {closeConnection();}
			   }
	
		
			  /*добавить работу на планы */
			  public void addPlanWorkItemInPlan(int planworkItemCode )
			   {
			    try
			     {
			     
			    	
			    	Context context = new InitialContext();
			        Object objRef = context.lookup(ENPlanWorkItemController.JNDI_NAME);
			        ENPlanWorkItemControllerHome planWorkItemHome = (ENPlanWorkItemControllerHome) PortableRemoteObject.narrow(objRef, ENPlanWorkItemControllerHome.class);
			        ENPlanWorkItemController planWorkItemController = planWorkItemHome.create();
			        
			        Object objRef2 = context.lookup(ENPlanWorkController.JNDI_NAME);
			        ENPlanWorkControllerHome planWorkHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(objRef2, ENPlanWorkControllerHome.class);
			        ENPlanWorkController planWorkController = planWorkHome.create(); 

			      ENPlanWorkItem2TKKoefDAO objectDAO = new ENPlanWorkItem2TKKoefDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			      ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			      ENPlanWorkItemFilter piFil = new ENPlanWorkItemFilter();
			      piFil.conditionSQL = "enplanworkitem.code in ( "
			      		+ " select pi.code  from tktechcard t , enplanworkitem pi , enplanwork p , enelement el "  
			      		+ "where t.techkartnumber = '09060103' "
+ "and t.code = pi.kartarefcode "
+ "and pi.planrefcode=p.code  "
+ "and p.yeargen=2021 "
+ "and p.formrefcode=1 "
+ "and p.typerefcode=1  "
+ "and p.elementrefcode=el.code "
+ "and el.typerefcode = 3	/*ТП 0.4 кВ*/ "
+ "and p.kindcode = 2  "
+ "and  (select count(hh.code) from enplancorrecthistory hh where hh.planoldrefcode =p.code and hh.reasoncode=4 ) = 0 "
+ "and p.budgetrefcode=75000001 " 
	      		+ ") " ;
			      ENPlanWorkItemShortList piList = piDAO.getScrollableFilteredList(piFil, 0, -1);
			      for (int i = 0; i < piList.totalCount; i++) {
			    	  
						/*
						 * ENPlanWork plObj = planWorkController.getObject(piList.get(i).planRefCode);
						 * if (plObj.stateRef.code == ENPlanWorkStatus.LOCKED) {
						 * 
						 * }
						 */
			    	  ENPlanWorkItem aENPlanWorkItem = planWorkItemController.getObject(piList.get(i).code);
			    	  aENPlanWorkItem.countGen = new BigDecimal(0);
			    	  aENPlanWorkItem.commentGen = aENPlanWorkItem.commentGen + " ###SUPP-101056"; 
			    	  planWorkItemController.save(aENPlanWorkItem);
					
			    	  ENPlanWorkItem planItemNew = new ENPlanWorkItem();
			    	    planItemNew.kartaRef.code = 500013395;
			    	    planItemNew.countGen = piList.get(i).countGen;
			    	    planItemNew.planRef.code = piList.get(i).planRefCode;
			    	    planItemNew.commentGen = "###SUPP-101056";
			    	    planWorkItemController.add(planItemNew);
			    	    
			    	    
				}
		     
			     // new PlanWorkItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) ,getUserProfile()).updateCoef(planworkItemCode);
			      
			      // время на людях ..
			    //  new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) ,getUserProfile()).recalcHumenItemsByPlanItemCode(planworkItemCode);
			      
			      
			     }
			    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENPlanWorkItem2TKKoef%} object.",e);}
			    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
			    catch (NamingException e) {  	    	e.printStackTrace(); 	    	}
			    catch (RemoteException e) {
			    	// TODO Auto-generated catch block
			    	e.printStackTrace();
			    	} catch (CreateException e) {
			    	// TODO Auto-generated catch block
			    	e.printStackTrace();
			    	}
			    finally                              {closeConnection();}
			   }
			  
			  public void selectNKRE(int code )
				{
					PreparedStatement statement = null;
			        ResultSet  resultSet = null;

			        Connection fkConnection = null;


			        try {
			        	fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			            Connection conn = getNEWConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			            FINLogic finLogic = new FINLogic(fkConnection, getUserProfile());
			        	ENAct2HumenDAO a2hDAO = new ENAct2HumenDAO(conn, getUserProfile());
			        	ENServicesObjectDAO finSoDao = new ENServicesObjectDAO(fkConnection, getUserProfile());

			        String sql = "  select distinct so.contractnumberservices , so.findocid \n" +
			        		"  from \n" +
			        		"          enservicesobject as so \n" +
			        		"          inner join aaa_nkre as nk on so.contractnumberservices = nk.contractnumber    \n" +
			        		"          inner join enservicesobjectstatus as buhstatus on so.statusrefcode = buhstatus.code \n" +
			        		"          inner join enservicesobject2techcondtnsservices as so2tc on so.code = so2tc.servicesobjectrefcode \n" +
			        		"          inner join entechconditionsservcs as tc on so2tc.techcondservrefcode = tc.code \n" +
			        		"          left  join enconnectionkind tckind on tc.connectionkindrefcode=tckind.code \n" +
			        		"          inner join encontragent as co on tc.code = co.techcondservicesrefcod \n" +
			        		"          inner join entechconditionsobjcts as tob on co.techconobjectscode = tob.code \n" +
			        		"          left join enconnectiontariffentr as tf on tc.tariffentryrefcode = tf.code \n" +
			        		"          left join enconnectiontariff as ct on tf.tariffrefcode = ct.code \n" +
			        		"          left join enpowerreliabilityctgr as pow on ct.categoryrefcode = pow.code \n" +
			        		"          left join ensettletype as st on pow.settletyperefcode = st.code \n" +
			        		"          left join enconnectionpowerpoint as cop on ct.powerpointrefcode = cop.code \n" +
			        		"          left join enconnectionphasity as pha on ct.phasityrefcode = pha.code \n" +
			        		"          left join enpriconnectiondata as pda on tc.code = pda.techcondservrefcode \n" +
			        		"          left join endepartment as dep on so.departmentcode = dep.code \n" +
			        		"          left join endepartment as depsobjcts on tob.departmentcode = depsobjcts.code     \n" +
			        		"      where \n" +
			        		"           so.contracttyperefcode = 5 \n" +
			        		"           and so.contractkindrefcode = 1 \n" +
			        		"           and tc.connectionkindrefcode in (1,2,4) \n" +
			        		"                                         ";


			        statement = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE).prepareStatement(sql);
			        resultSet = statement.executeQuery();

			    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			        int i;
			        for(i = 0;resultSet.next();i++)
			         {
			        	ENServicesObjectFilter sFil = new ENServicesObjectFilter();
			        	sFil.conditionSQL = " a.parent_id = " + resultSet.getInt(2);
			        	
			        	ENServicesObjectShortList finContractList = finSoDao.getContractList(sFil, 0, -1, false, true,true);
			        	String dateregstr = "";
			        	for (int j = 0; j < finContractList.totalCount; j++) {
							 if(finContractList.get(j).contractRegDate != null){
								if(dateregstr.equals("")){
									dateregstr=new SimpleDateFormat("dd.MM.yyyy").format(finContractList.get(j).contractRegDate);
								} else 
								{
									dateregstr=dateregstr + ";" + new SimpleDateFormat("dd.MM.yyyy").format(finContractList.get(j).contractRegDate);
								}
									
							 }  
						}
			    		
			        	
			        	if (!dateregstr.equals("")){
			        		updateNKRE(dateregstr,resultSet.getString(1));
			        	}

			        }
			        }
			        catch (Exception e) {
			            System.out.println("Error :" + e.getMessage());
			            throw new SystemException(e) ;
			        }


				}		

			  public void updateNKRE(String regdatestr, String contractnumber) throws PersistenceException
			    {
			        PreparedStatement statement = null;
			        ResultSet  set = null;
			        String sql = "";

			        sql = " update aaa_nkre set regdatestr = ? where contractnumber = ? ";
			        

			        try
			        {
			            
						statement = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE).prepareStatement(sql);						
			            statement.setString(1,regdatestr);
			            statement.setString(2,contractnumber);
			            statement.execute();
			            
			        }
			        catch(SQLException e)
			        {
			            System.out.println(e.getMessage()+"\nstatement - " + sql);
			            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			        }
			        catch (DatasourceConnectException e) {
					
						e.printStackTrace();
					}
			        finally
			        {
			        try {if (set != null) set.close();}             catch (SQLException e) {}
			        try {if (statement != null) statement.close();} catch (SQLException e) {}
			        statement = null;
			        
			        }

			    }			  
			  
			  
			  
			  
			  public  void createPdf() throws FileNotFoundException, DocumentException {
			       String dest = "D:/barcode2.pdf";
			      
			      //public static void main(String[] args) throws IOException, DocumentException {
			          File file = new File(dest);
			          file.getParentFile().mkdirs();
			        //  new BarcodeBackground().createPdf(DEST);
			      //}
			      
			          /*Document document = new Document();
			          PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(DEST));
			          document.open();
			          PdfContentByte canvas = writer.getDirectContent();
			          Barcode128 code128 = new Barcode128();
			          code128.setCode("12345XX789XXX");
			          code128.setCodeType(Barcode128.CODE128);
			          PdfTemplate template = code128.createTemplateWithBarcode(
			                  canvas, Color.BLACK, Color.BLACK);
			          float x = 36;
			          float y = 750;
			          float w = template.getWidth();
			          float h = template.getHeight();
			          canvas.saveState();
			          canvas.setColorFill(Color.LIGHT_GRAY);
			          canvas.rectangle(x, y, w, h);
			          canvas.fill();
			          canvas.restoreState();
			          canvas.addTemplate(template, 36, 750);
			          document.close();*/
			          
			          
			          Document document = new Document();
			          PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(dest));
			          document.open();
			          PdfContentByte cb = writer.getDirectContent();
			          Image img = createBarcode(cb, "This is a 2D barcode", 5, 5);
			          document.add(new Paragraph(String.format("This barcode measures %s by %s user units", img.getScaledWidth(), img.getScaledHeight())));
			          document.add(img);
			          /*img = createBarcode(cb, "This is NOT a raster image", 3, 3);
			          document.add(new Paragraph(String.format("This barcode measures %s by %s user units", img.getScaledWidth(), img.getScaledHeight())));
			          document.add(img);
			          img = createBarcode(cb, "This is vector data drawn on a PDF page", 1, 3);
			          document.add(new Paragraph(String.format("This barcode measures %s by %s user units", img.getScaledWidth(), img.getScaledHeight())));
			          document.add(img);*/
			          document.close();
			      
			  }
			  
			  public Image createBarcode(PdfContentByte cb, String text, float mh, float mw) throws BadElementException {
				 
				  Barcode128 code128 = new Barcode128();
				  code128.setCode("55555555555555");
				  code128.setCodeType(Barcode128.CODE128);
				  Image code128Image = code128.createImageWithBarcode(cb, null, null);
			      return code128Image;
			    }

} // end of EJB Controller for ENIP