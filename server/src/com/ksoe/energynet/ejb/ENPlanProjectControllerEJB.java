
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENPlanProject;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENPlanProjectCalculationDAO;
import com.ksoe.energynet.dataminer.ENPlanProjectDAO;
import com.ksoe.energynet.dataminer.ENPlanProjectTemplateDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.dataminer.FINExecutorDAO;
import com.ksoe.energynet.ejb.generated.ENPlanProjectControllerEJBGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.ElementLogic;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENPlanProject;
import com.ksoe.energynet.valueobject.ENPlanProjectTemplate;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.FINExecutor;
import com.ksoe.energynet.valueobject.brief.ENServicesObjectShort;
import com.ksoe.energynet.valueobject.filter.ENPlanProjectCalculationFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanProjectFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanProjectTemplateFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanProjectTemplateShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectShortList;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsServicesShortList;
import com.ksoe.energypro.dataminer.EPVoltageNominalDAO;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproJNDINames;
import com.ksoe.energypro.valueobject.EPVoltageNominal;
import com.ksoe.energypro.valueobject.filter.EPVoltageNominalFilter;
import com.ksoe.energypro.valueobject.lists.EPVoltageNominalShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.techcard.dataminer.TKProjectWorkDAO;
import com.ksoe.techcard.valueobject.TKProjectWork;

public class ENPlanProjectControllerEJB extends
		ENPlanProjectControllerEJBGen {

	public ENPlanProjectControllerEJB() {
	}
	
	/*public int generateenplanprojecttemplate(ENPlanProject object) {
		try {
			
				ENPlanProjectTemplateDAO templDAO = 
						new ENPlanProjectTemplateDAO(getUserProfile(), 
								getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			
		    
		} catch (DatasourceConnectException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 finally{
             closeConnection();
         }
        return 1;
	}*/
	
    public int generateenplanprojecttemplate(ENPlanProject object) { 
    	try {
    		ENPlanProjectTemplateDAO templDAO = 
					new ENPlanProjectTemplateDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
       
    		TKProjectWorkDAO projDAO = 
					new TKProjectWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    		
    		ENTechConditionsServicesDAO tsDAO =
    				new ENTechConditionsServicesDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    		
    		ENServicesObjectDAO soDAO = 
    				new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    		
    		TKProjectWork proj = projDAO.getObject(object.projectWorkRef.code); 
    		
    		ENPlanProjectDAO prjDAO = 
					new ENPlanProjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    		
    		
    		ENPlanProjectFilter objectFil = new ENPlanProjectFilter();
			objectFil.planRef.code = object.planRef.code;
			int[] ppArr = prjDAO.getFilteredCodeArray(objectFil, 0, -1); 
			if (ppArr.length > 0 )
			{
				throw new EnergyproSystemException("Проект для плану додається тільки один!!! ");
			}
    		
    		// clear old tag settings if exist 
    		ENPlanProjectTemplateFilter tmplFil = new ENPlanProjectTemplateFilter();
    		tmplFil.planRef.code=object.planRef.code;
    		int[] tmplArr = templDAO.getFilteredCodeArray(tmplFil, 0, -1);
    		for (int ii = 0; ii < tmplArr.length; ii++) {
				templDAO.remove(tmplArr[ii]);
			}
    		
    		
    		if(proj.name.contains("<ES>")){
    			ENPlanProjectTemplate projTmpl = new ENPlanProjectTemplate();
    			projTmpl.tag = "<ES>";
    			projTmpl.planRef.code=object.planRef.code;
    			projTmpl.userGen=getUserProfile().userName;
    			projTmpl.dateEdit=new Date();
    			templDAO.add(projTmpl);
    		}
    		if(proj.name.contains("<ES1>")){
    			ENPlanProjectTemplate projTmpl = new ENPlanProjectTemplate();
    			projTmpl.tag = "<ES1>";
    			projTmpl.planRef.code=object.planRef.code;
    			projTmpl.userGen=getUserProfile().userName;
    			projTmpl.dateEdit=new Date();
    			templDAO.add(projTmpl);
    		}
    		if(proj.name.contains("<OP>")){
    			ENPlanProjectTemplate projTmpl = new ENPlanProjectTemplate();
    			projTmpl.tag = "<OP>";
    			projTmpl.planRef.code=object.planRef.code;
    			projTmpl.userGen=getUserProfile().userName;
    			projTmpl.dateEdit=new Date();
    			templDAO.add(projTmpl);
    		}
    		if(proj.name.contains("<OP1>")){
    			ENPlanProjectTemplate projTmpl = new ENPlanProjectTemplate();
    			projTmpl.tag = "<OP1>";
    			projTmpl.planRef.code=object.planRef.code;
    			projTmpl.userGen=getUserProfile().userName;
    			projTmpl.dateEdit=new Date();
    			templDAO.add(projTmpl);
    		}
    		if(proj.name.contains("<ZAM>")){
    			ENPlanProjectTemplate projTmpl = new ENPlanProjectTemplate();
    			projTmpl.tag = "<ZAM>";
    			projTmpl.elementName = "";
    			projTmpl.planRef.code=object.planRef.code;
    			projTmpl.userGen=getUserProfile().userName;
    			projTmpl.dateEdit=new Date();
    			
    			// определить заказчика 
    			ENTechConditionsServicesFilter tsFil = new ENTechConditionsServicesFilter();
    			tsFil.conditionSQL = "ENTECHCONDITIONSSERVCS.CODE in ( " + 
    					"               select ts.code \n" +
    					"       from entechcond2planwork tc2p , enservicesobject2techcondtnsservices s2tc ,  entechconditionsservcs ts, enconnectionkind k , enplanwork pw     \n" +
    					"       where tc2p.planrefcode = " + object.planRef.code+ "     \n" +
    					"       and pw.code= tc2p.planrefcode    \n" +
    					"       and tc2p.techconservicesrefcode = s2tc.techcondservrefcode    \n" +
    					"       and ts.code = s2tc.techcondservrefcode     \n" +
    					"       and ts.connectionkindrefcode = k.code    \n" +
    					"       and pw.staterefcode  in ( 29 , 7 ) )  ";
    			ENTechConditionsServicesShortList tsList = tsDAO.getScrollableFilteredList(tsFil, 0, -1);
    			if(tsList.totalCount>0){
    				projTmpl.elementName = /*tsList.get(0).partnerCode + " " +*/ tsList.get(0).partnerName;	
    			}
    			
    			if(projTmpl.elementName.equals("") ){
    				ENServicesObjectFilter soFil = new ENServicesObjectFilter();
    				soFil.conditionSQL = " ENSERVICESOBJECT.CODE in ( " + 
    						"  select so.code \n" +
    						"        from enservicesobject so , enplanwork pw  ,  enservicesobject2techcondtnsservices so2pric ,    \n" +
    						"        entechconditionsservcs ts, enconnectionkind k      \n" +
    						"        where so.elementcode = pw.elementrefcode     \n" +
    						"        and pw.code = " + object.planRef.code + "     \n" +
    						"        and so.code = so2pric.servicesobjectrefcode    \n" +
    						"        and ts.code = so2pric.techcondservrefcode     \n" +
    						"        and ts.connectionkindrefcode = k.code   \n" +
    						"        AND so.CONTRACTTYPEREFCODE = 5    \n" +
    						"        AND so.CONTRACTKINDREFCODE = 1  \n" +
    						"        and pw.staterefcode  in ( 29 , 7 ) ) " ;
    				
    				ENServicesObjectShortList soList = soDAO.getScrollableFilteredList(soFil, 0, -1);
    				if(soList.totalCount>0){
        				projTmpl.elementName = /*soList.get(0).partnerCode + " " +*/ soList.get(0).contragentName;	
        			}
    				
    				if(projTmpl.elementName.equals("") ){
    					tsFil = new ENTechConditionsServicesFilter();
    					tsFil.conditionSQL = "ENTECHCONDITIONSSERVCS.CODE in ( " + 
    	    					"               select ts.code \n" +
    	    					"       from entechcond2planwork tc2p , enservicesobject2techcondtnsservices s2tc ,  entechconditionsservcs ts, enconnectionkind k , enplanwork pw     \n" +
    	    					"       where tc2p.planrefcode = " + object.planRef.code+ "     \n" +
    	    					"       and pw.code= tc2p.planrefcode    \n" +
    	    					"       and tc2p.techconservicesrefcode = s2tc.techcondservrefcode    \n" +
    	    					"       and ts.code = s2tc.techcondservrefcode     \n" +
    	    					"       and ts.connectionkindrefcode = k.code    \n" +
    	    					"       and pw.staterefcode  in ( 29 , 7 ) )  ";
    	    			tsList = tsDAO.getScrollableFilteredList(tsFil, 0, -1);
    	    			if(tsList.totalCount>0){
    	    				projTmpl.elementName = /*tsList.get(0).partnerCode + " " +*/ tsList.get(0).partnerName;	
    	    			}
    			  }
    			}
    			templDAO.add(projTmpl);
    		}
    		
    		return 1;
      }
     catch
      (DatasourceConnectException e) {
     	throw new EnergyproSystemException("Can't  connect to DB",e);
     	} 
    	catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);} 
    	finally {closeConnection();} }
    
    public String generatecipher(ENPlanProject aENPlanProject ) { 
    	try {
    		
    		String cipher = "";
    		ENPlanWorkDAO pwDAO = 
					new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    		
    		FINExecutorDAO fDAO = 
					new FINExecutorDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

    		ENElementDAO elDAO = 
					new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    		
    		ENPlanProjectDAO plProjDAO = new ENPlanProjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    		
    		EPVoltageNominalDAO voltageDAO = new EPVoltageNominalDAO(getConnection(EnergyproJNDINames.ENERGYPRO_DATASOURCE),getUserProfile());
    	
    		
    		ENPlanWork pwObj = pwDAO.getObject(aENPlanProject.planRef.code );
    		FINExecutor fObj = fDAO.getObject(pwObj.finExecutor.code);
    		ENElement el = elDAO.getObject(pwObj.elementRef.code);
    		
    		String pwType = "";
    		if(pwObj.typeRef.code == 5){
    			pwType = "ІП";
    		} 
    		else if ( pwObj.priConnectionNumber != null && !pwObj.priConnectionNumber.equals("") /*pwObj.typeRef.code == 22 || pwObj.typeRef.code == 7 */) {
    			pwType = "ПР";
    		} 
    		
    		if (pwType.equals("") && el.typeRef.code == ENElementType.SERVICES_OBJECT ){
    			pwType = "ПС";
    		}
    		
    		
    		// cipher = pwObj.monthGen+"-" + pwObj.yearGen+"-" + fObj.axOrgId+"-" + pwType   ;
    		ElementLogic elementLogic = new ElementLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE) , getUserProfile());
			
	        int eType = elementLogic.getElementTypeByPlanCode(aENPlanProject.planRef.code );
	        String eTypeText = "XX";
	        switch (eType) {
	        case ENElementType.LINE10 : 
	        	eTypeText = "ПЛ";
	            break;
	        case ENElementType.LINE04 : 
	        	eTypeText = "ПЛ";
	            break;
	        case ENElementType.SUBSTATION04 : 
	        	eTypeText = "ТП";
	            break;    
	        case ENElementType.LINE150 : 
	        	eTypeText = "ПЛ";
	            break;  
	        case ENElementType.SUBSTATION150 : 
	        	eTypeText = "ПС";
	            break;
	        case ENElementType.LINE_CABLE : 
	        	eTypeText = "КЛ";
	            break;
	        case ENElementType.SUBST150POWERTRANS : 
	        	eTypeText = "ПС";
	            break;    
	            
	            
	        default : eTypeText = "ПЛ" ;
	        }
	        
	        EPVoltageNominal voltageObj = null;
	        // voltage 
	        if(aENPlanProject.voltagenominal.code != Integer.MIN_VALUE){
		        EPVoltageNominalFilter fVoltage = new EPVoltageNominalFilter();
		        fVoltage.code = aENPlanProject.voltagenominal.code;
		        EPVoltageNominalShortList epVoltageList = voltageDAO.getScrollableFilteredList(fVoltage,0,-1);
		        
		        if (epVoltageList.totalCount ==0){
		        	throw new EnergyproSystemException(" Не визначено клас напруги!!! ");
		        }
		        voltageObj = voltageDAO.getObject(epVoltageList.get(0).code) ;
	        }
	        
	        String eVoltageText = "XXX.XX";
	        int voltageObjCode = -1;
	        if (voltageObj!=null){voltageObjCode=voltageObj.code;}
	        
	        switch (voltageObjCode) {
	        case ENConsts.EPVOLTAGENOMINAL_022  : 
	        	 eVoltageText = "000.22";
	            break;
	        case ENConsts.EPVOLTAGENOMINAL_038  : 
	        	 eVoltageText = "000.38";
	            break;
	        case ENConsts.EPVOLTAGENOMINAL_1  : 
	        	 eVoltageText = "001.00";
	            break;
	        case ENConsts.EPVOLTAGENOMINAL_3  : 
	        	 eVoltageText = "003.00";
	            break;    
	        case ENConsts.EPVOLTAGENOMINAL_6  : 
	        	 eVoltageText = "006.00";
	            break; 
	        case ENConsts.EPVOLTAGENOMINAL_10  : 
	        	 eVoltageText = "010.00";
	            break;    
	        case ENConsts.EPVOLTAGENOMINAL_27  : 
	        	 eVoltageText = "027.00";
	            break;     
	        case ENConsts.EPVOLTAGENOMINAL_35  : 
	        	 eVoltageText = "035.00";
	            break;    
	        case ENConsts.EPVOLTAGENOMINAL_110  : 
	        	 eVoltageText = "110.00";
	            break;    
	        case ENConsts.EPVOLTAGENOMINAL_154  : 
	        	 eVoltageText = "154.00";
	            break;    
	        case ENConsts.EPVOLTAGENOMINAL_330  : 
	        	 eVoltageText = "330.00";
	            break;    
	            
	        default : eVoltageText = "XXX.XX" ;
	        }
	        
    		cipher = eTypeText + "-" + eVoltageText + "/" +  "Auto";
    		return cipher;
      }
     catch
      (DatasourceConnectException e) {
     	throw new EnergyproSystemException("Can't  connect to DB",e);
     	} 
    	catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);} 
    	finally {closeConnection();} }
    
   
    public String generateprojectname(ENPlanProject object ) { 
    	try {
    		
    		String workname = "";
    		ENPlanWorkDAO pwDAO = 
					new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    		ENPlanProjectTemplateDAO projTemplDAO = 
					new ENPlanProjectTemplateDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    		
    		TKProjectWorkDAO projDAO = 
					new TKProjectWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    		
    		ENPlanWork pwObj = pwDAO.getObject(object.planRef.code);
    		
    		TKProjectWork proj = projDAO.getObject(object.projectWorkRef.code);

    		ENPlanProjectTemplateFilter projFil = new ENPlanProjectTemplateFilter();    		
    		projFil.planRef.code = object.planRef.code;
    		ENPlanProjectTemplateShortList projList = projTemplDAO.getScrollableFilteredList(projFil, 0, -1);
    		
    		workname = proj.name;
    		
    		for (int i = 0; i < projList.totalCount; i++) {
			 // if (projList.get(i).tag.equals("<ES>") || projList.get(i).tag.equals("<ES1>") || projList.get(i).tag.equals("<OP>" || projList.get(i).tag.equals("<OP1>") ){
				  if(projList.get(i).elementName != null && !projList.get(i).elementName.equals(""))
				  {
					  workname = workname.replace(projList.get(i).tag, projList.get(i).elementName);
				  }
			  //}	
			}
    		
    		
    		return workname;
      }
     catch
      (DatasourceConnectException e) {
     	throw new EnergyproSystemException("error generateprojectname",e);
     	} 
    	catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);} 
    	finally {closeConnection();} }
    
    /* ENPlanProject. Удалить */
	public void remove(int code) {
		try {
			ENPlanProjectDAO objectDAO = new ENPlanProjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENPlanProjectTemplateDAO templDAO = new ENPlanProjectTemplateDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENPlanProjectCalculationDAO plcalcDAO = new ENPlanProjectCalculationDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENPlanProject projObj = objectDAO.getObject(code);
			
			ENPlanProjectTemplateFilter templFil = new ENPlanProjectTemplateFilter();
			templFil.planRef.code=projObj.planRef.code;
			int[] tmplArr = templDAO.getFilteredCodeArray(templFil, 0, -1);
				for (int i = 0; i < tmplArr.length; i++) {
					templDAO.remove(tmplArr[i]);
				}
				
			
			ENPlanProjectCalculationFilter plcalcFil = new ENPlanProjectCalculationFilter();
			plcalcFil.projectWorkRef.code = projObj.code;
			int[] plcalcArr = plcalcDAO.getFilteredCodeArray(plcalcFil, 0, -1);
			for (int i = 0; i < plcalcArr.length; i++) {
				plcalcDAO.remove(plcalcArr[i]);
			}
				
			
			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENPlanProject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	/* ENPlanProject. Добавить */
	public int add(ENPlanProject object) {
		try {
			ENPlanProjectDAO objectDAO = new ENPlanProjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO pDAO = new ENPlanWorkDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			
			ENPlanProjectFilter objectFil = new ENPlanProjectFilter();
			objectFil.planRef.code = object.planRef.code;
			int[] ppArr = objectDAO.getFilteredCodeArray(objectFil, 0, -1); 
			if (ppArr.length > 0 )
			{
				throw new EnergyproSystemException("Проект для плану додається тільки один!!! ");
			}
			
			if (object.voltagenominal.code == Integer.MIN_VALUE )
			{
				throw new EnergyproSystemException(" Не визначено клас напруги!!! ");
			}
			
			
			object.numberProject = ""+objectDAO._collectAutoIncrementNumberProject();
			
			//String.format("%1$" + length + "s", inputString).replace(' ', '0');
			//System.out.print( String.format("%1$-" + 4 + "s", object.numberProject).replaceAll(" ", "0") );
			
			if(object.projectCipher.contains("Auto")){
				object.projectCipher = object.projectCipher.replace("Auto",  String.format("%" + 4 + "s", object.numberProject).replaceAll(" ", "0")  );	
			}
			
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENPlanProject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENPlanProject