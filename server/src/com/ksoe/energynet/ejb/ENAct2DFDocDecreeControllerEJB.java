
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENAct2DFDocDecree;
 *
 */

import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.docflow.dataminer.DFDocDecreeDAO;
import com.ksoe.docflow.ejb.DFDocAttachmentController;
import com.ksoe.docflow.ejb.DFDocAttachmentControllerHome;
import com.ksoe.docflow.ejb.DFDocController;
import com.ksoe.docflow.ejb.DFDocControllerHome;
import com.ksoe.docflow.ejb.DFDocDecreeController;
import com.ksoe.docflow.ejb.DFDocDecreeControllerHome;
import com.ksoe.docflow.valueobject.DFDoc;
import com.ksoe.docflow.valueobject.DFDocAttachment;
import com.ksoe.docflow.valueobject.DFDocDecree;
import com.ksoe.docflow.valueobject.DFDocStatus;
import com.ksoe.docflow.valueobject.DFDocSubType;
import com.ksoe.docflow.valueobject.DFDocType;
import com.ksoe.energyWorkflow.ejb.WFPack2DFDocController;
import com.ksoe.energyWorkflow.ejb.WFPack2DFDocControllerHome;
import com.ksoe.energyWorkflow.valueobject.WFPack;
import com.ksoe.energyWorkflow.valueobject.WFPack2DFDoc;
import com.ksoe.energynet.dataminer.ENAct2DFDocDecreeDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENSettingForDFDecreeDAO;
import com.ksoe.energynet.ejb.generated.ENAct2DFDocDecreeControllerEJBGen;
import com.ksoe.energynet.logic.ElementLogic;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2DFDocDecree;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.filter.ENAct2DFDocDecreeFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENSettingForDFDecreeFilter;
import com.ksoe.energynet.valueobject.lists.ENSettingForDFDecreeShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.valueobject.EPReportRequestEx;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;


public class ENAct2DFDocDecreeControllerEJB extends
		ENAct2DFDocDecreeControllerEJBGen {

	public ENAct2DFDocDecreeControllerEJB() {
	}


	/* ENAct2DFDocDecree. Добавить автоматически с данными из справочника по РЕСам*/
	public int addWithSetting(ENAct2DFDocDecree object) {
		try {
			ENSettingForDFDecreeDAO settDecrDAO = new ENSettingForDFDecreeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			DFDocDecreeDAO docDecreeDAO = new DFDocDecreeDAO(getUserProfile(), getConnection(AuthorizationJNDINames.DOCFLOW_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENDepartmentDAO depDAO = new ENDepartmentDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

		    object.userGen = getUserProfile().userName;
		    object.userAdd = getUserProfile().userName;
		    object.dateAdd = new Date();
		    object.dateEdit = new Date();

		    if(object.settingDecreeCode == Integer.MIN_VALUE){
		    	throw new EnergyproSystemException(" \n Не вказаний шаблон для розпорядження!!! ");
		    }

		    if(object.actRef.code == Integer.MIN_VALUE){
		    	throw new EnergyproSystemException(" \n Не вказаний акт виконаних робіт!!! ");
		    }

		    if (object.numberHours == Integer.MIN_VALUE )
		    {
		    	throw new EnergyproSystemException(" \n Не вказана кількість часу для виконання!!! ");
		    }

		    if (object.specifications == null || object.specifications.equals("") )
		    {
		    	throw new EnergyproSystemException(" \n Не вказано технічну характеристику !!! ");
		    }

		    object.responsFIO = object.responsSurname + " " + object.responsName + " " + object.responsPatronimic;
		    object.responsGenitiveFIO = object.responsSurnameGenitive + " " + object.responsNameGenitive + " " + object.responsPatronimicGenitive;

		    if (    object.responsFIO == null || object.responsFIO.equals("")||
		    		object.responsGenitiveFIO == null || object.responsGenitiveFIO.equals("")||
		    		object.responsPosition == null || object.responsPosition.equals("")||
		    		object.responsGenitivePosition == null || object.responsGenitivePosition.equals("")||
		    		object.responsSurname == null || object.responsSurname.equals("")||
		    		object.responsSurnameGenitive == null || object.responsSurnameGenitive.equals("")||
		    		object.responsName == null || object.responsName.equals("")||
		    		object.responsNameGenitive == null || object.responsNameGenitive.equals("")||
		    		object.responsPatronimic == null || object.responsPatronimic.equals("")||
		    		object.responsPatronimicGenitive == null || object.responsPatronimicGenitive.equals("")||
		    		object.departmentName == null || object.departmentName.equals("")||
		    		object.departmentNameGenitive == null || object.departmentNameGenitive.equals("")
		    		)
		    {
		    	throw new EnergyproSystemException(" \n Не вказані дані відповідальної особи !!! ");
		    }

		    // нужно определить код департмента что бы опрделить шаблон для распоряжения
		    Integer depCode = Integer.MIN_VALUE;

           /* ENDepartment2EPRenFilter d2pFilter = new ENDepartment2EPRenFilter();
            d2pFilter.conditionSQL = " ENDepartment2EPRen.code in ( " +
            		  " select d2r.code  " +
            		  " from enact a  , enelementdata eld , enelement el , endepartment2epren d2r " +
            		  " where a.code = "+ object.actRef.code  +
            		  " and a.elementcode =eld.ecode " +
            		  " and eld.ecode=el.code " +
            		  " and el.renrefcode=d2r.renrefcode " +
            		  " limit 1 ) " ;


            ENDepartment2EPRenShortList d2pList = d2pDAO.getScrollableFilteredList(d2pFilter, 0, -1);*/
		    ENPlanWorkFilter plFil = new ENPlanWorkFilter();
		    plFil.conditionSQL = " enplanwork.code in ( select plancode from enact2enplanwork where actrefcode = "+ object.actRef.code +")";

		    int[] plArr = planDAO.getFilteredCodeArray(plFil, 0, -1);

            if (plArr.length>0){
            	ENPlanWork planObj = planDAO.getObject(plArr[0]);
            	depCode = planObj.departmentRef.code;
            } else
             {
    		   throw new EnergyproSystemException(" \n Не знайдено відповідніть підрозділу в акті  !!! ");
    		    }
            ENSettingForDFDecreeFilter settDecrFil = new ENSettingForDFDecreeFilter();
            settDecrFil.code = object.settingDecreeCode;

            ENDepartment depObj= depDAO.getObject(depCode);

            ENSettingForDFDecreeShortList settDecrList=settDecrDAO.getScrollableFilteredList(settDecrFil, 0, -1);
            if (settDecrList.totalCount==0)
            {
            	throw new EnergyproSystemException(" \n Не знайдено шаблон для створення розпорядження по підрозділу " + depObj.shortName +" !!! ");
            }


            int enAct2dfdocDecreeCode = Integer.MIN_VALUE;
            try{

            	// ============= нашли шаблон, делаем розпорядження
            	Context cntDecr = new InitialContext();
	            Object objRefDecr = cntDecr.lookup(DFDocDecreeController.JNDI_NAME);
	            DFDocDecreeControllerHome docDecreeHome = (DFDocDecreeControllerHome) PortableRemoteObject.narrow(objRefDecr, DFDocDecreeControllerHome.class);
	            DFDocDecreeController docDecreeController = docDecreeHome.create();

                DFDocDecree docDecree = new DFDocDecree();

                docDecree.decreeHeader = settDecrList.get(0).dfDocPrefixName;
                docDecree.numberGen = settDecrList.get(0).dfDocPrefixName + "-XXXXXX";

                docDecree.doc.prefixRef.code = settDecrList.get(0).dfDocPrefixCode;

                docDecree.doc.initiatorTabnumber = settDecrList.get(0).initiatorTabn;
                docDecree.doc.initiatorFIO = settDecrList.get(0).initiatorFio;
                docDecree.doc.initiatorPodrCode = settDecrList.get(0).initiatorPodrCode+"";
                docDecree.doc.initiatorPodrName = settDecrList.get(0).initiatorPodrName;

                docDecree.doc.designatedFIO= settDecrList.get(0).designatedFio;
                docDecree.doc.designatedPostInfo= settDecrList.get(0).designatedpostInfo;
                docDecree.doc.designatedTabnumber= settDecrList.get(0).designatedTabn;

                docDecree.doc.signerFIO= settDecrList.get(0).prefixSignerFio;
                docDecree.doc.signerPostInfo= settDecrList.get(0).prefixSignerPostInfo;
                docDecree.doc.signerTabnumber= settDecrList.get(0).prefixSignerTabN;


                docDecree.doc.catalogRef.code = settDecrList.get(0).catalogCode;
                docDecree.doc.dateRegistration = new Date();

                docDecree.doc.docTypeRef.code = DFDocType.DECREE;
                docDecree.doc.docSubTypeRef.code = DFDocSubType.COMMISSIONING_DECREE;


                docDecree.doc.description = object.commentGen;

                DFDocAttachment docAttash=null;
                int decreeCode = docDecreeController.add(docDecree, docAttash , null, "", false);

                DFDocDecree decree = docDecreeDAO.getObject(decreeCode);

                /////////// вставка данных в energynet через контроллер ,

                object.dfDocCode=decree.doc.code;
	            object.DFDocDecreeCode=decree.code;

	            Context cntA2decr = new InitialContext();
	            Object objA2decr = cntA2decr.lookup(ENAct2DFDocDecreeController.JNDI_NAME);
	            ENAct2DFDocDecreeControllerHome homeA2decr = (ENAct2DFDocDecreeControllerHome) PortableRemoteObject.narrow(objA2decr, ENAct2DFDocDecreeControllerHome.class);
	            ENAct2DFDocDecreeController A2decrController = homeA2decr.create();

	            enAct2dfdocDecreeCode = A2decrController.add(object);

                ///============ создать файл(doc) с распоряжением

	            ENActDAO aDAO = new ENActDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	            ENAct actObj = aDAO.getObject(object.actRef.code);

	            ElementLogic elementLogic = new ElementLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	     	    String[] eName = elementLogic.getNameByCode(actObj.element.code);

	     	    ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	     	    String[] priconnectionInfo =  servicesLogic.getPriconnectionInfo(actObj.code);

	            ////
	            Context cnt = new InitialContext();
	            Object objRef = cnt.lookup(ENReportController.JNDI_NAME);

	            ENReportControllerHome reportHome = (ENReportControllerHome) PortableRemoteObject.narrow(objRef, ENReportControllerHome.class);
	            ENReportController reportController = reportHome.create();

	            EPReportRequestEx request = new EPReportRequestEx();
	            request.argNames = new String[]{"decreeCode",
	            		"acttyperefcode",
	            		"objname",
	            		"contractnumberservices",
	            		"contractdateservices",
	            		"specifications",
	            		"responsgenitivepositin",
	            		"departmentnamegenitive",
	            		"responsgenitivefio",
	            		"numberhours"
	            		};
	            request.args = new String[]{decree.code+"",
	            		actObj.actTypeRef.code+"",
	            		eName[0],
	            		priconnectionInfo[0],
	            		priconnectionInfo[1],
	            		object.specifications,
	            		object.responsGenitivePosition,
	            		object.departmentNameGenitive,
	            		//object.responsGenitiveFIO,
	            		object.responsSurnameGenitive.toUpperCase() +" "+ 
	            		    object.responsNameGenitive.toUpperCase().substring(0, 1) +'.'+ 
	            		       object.responsPatronimicGenitive.toUpperCase().substring(0, 1)+'.' ,  
	            		object.numberHours+""
	                    };
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
	            DFDocAttachmentObject.doc.code = decree.doc.code;
	            String attachmentName = "проект_розпорядження_№_=" +decree.numberGen+"від" + new SimpleDateFormat("dd.MM.yyyy").format(decree.doc.dateRegistration).toString() +".doc";
	            DFDocAttachmentObject.commentGen= "проект_розпорядження";

	            attachmentController.add(DFDocAttachmentObject, DecreeDocFile /*aFile*/, attachmentName );

	            // SUPP-93735 Добавляем связку распоряжения с пакетом на присоединение
	            WFPack wfPack = servicesLogic.getWFPackByActCode(object.actRef.code);
	            if (wfPack != null) {
		            Object objWorkFlow = cntDf.lookup(WFPack2DFDocController.JNDI_NAME);
		            WFPack2DFDocControllerHome wfPack2DFDocHome = (WFPack2DFDocControllerHome) PortableRemoteObject.narrow(objWorkFlow, WFPack2DFDocControllerHome.class);
		            WFPack2DFDocController wfPack2DFDocController = wfPack2DFDocHome.create();

		            WFPack2DFDoc wfPack2DFDoc = servicesLogic.generateWFPack2DFDocByDFDocDecree(wfPack.code, decree);
		            wfPack2DFDoc.commentgen = "Зв'язок додано автоматично з акту виконаних робіт. Код акту: " + object.actRef.code;
		            wfPack2DFDocController.add(wfPack2DFDoc);
	            }

			} catch (RemoteException e) {
	            throw new SystemException(e.getMessage(), e);
	        } catch (CreateException e) {
	            throw new SystemException(e.getMessage(), e);
	        } catch (NamingException e) {
	            throw new SystemException(e.getMessage(), e);
	        }

		    return enAct2dfdocDecreeCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENAct2DFDocDecree%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENAct2DFDocDecree. Удалить */
	public void removeByObj(ENAct2DFDocDecree aENAct2DFDocDecree) {
		try {
			ENAct2DFDocDecreeDAO objectDAO = new ENAct2DFDocDecreeDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENAct2DFDocDecreeFilter a2decrFil = new ENAct2DFDocDecreeFilter();
			a2decrFil.actRef.code = aENAct2DFDocDecree.actRef.code;
			a2decrFil.DFDocDecreeCode = aENAct2DFDocDecree.DFDocDecreeCode;

			int[] a2decrArr = objectDAO.getFilteredCodeArray(a2decrFil, 0, -1);
			for (int i = 0; i < a2decrArr.length; i++) {
				ENAct2DFDocDecree a2dObj = objectDAO.getObject(a2decrArr[i]);

				// при удалении связки скасовуем документ розпорядження
				try{
					Context Dfdoc = new InitialContext();
		            Object objRefDf = Dfdoc.lookup(DFDocController.JNDI_NAME);
		            DFDocControllerHome dfDocHome = (DFDocControllerHome) PortableRemoteObject.narrow(objRefDf, DFDocControllerHome.class);
		            DFDocController dfController = dfDocHome.create();

		            DFDoc dfObj = dfController.getObject(a2dObj.dfDocCode);
		            if(dfObj.statusRef.code != DFDocStatus.DRAFT){
		            	throw new SystemException(
		    					"Видаляти можливо тільки чернові розпорядження!!!");
		            }

		            dfController.setCancel(a2dObj.dfDocCode);

				} catch (RemoteException e) {
		            throw new SystemException(e.getMessage(), e);
		        } catch (CreateException e) {
		            throw new SystemException(e.getMessage(), e);
		        } catch (NamingException e) {
		            throw new SystemException(e.getMessage(), e);
		        }

				///// В этом месте связки уже нет, потому что она удаляется выше внутри вызова dfController.setCancel 
				// objectDAO.remove(a2dObj.code);
				/////
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENAct2DFDocDecree%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENAct2DFDocDecree