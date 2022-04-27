
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENCalcPowerReserve;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.callcenter.dataminer.CCElementDataDAO;
import com.ksoe.callcenter.valueobject.CCElementData;
import com.ksoe.callcenter.valueobject.filter.CCElementDataFilter;
import com.ksoe.energynet.dataminer.ENCalcPowerReserveDAO;
import com.ksoe.energynet.dataminer.ENCalcPowerReserveItemDAO;
import com.ksoe.energynet.dataminer.ENContragentDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsObjectsDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.ejb.generated.ENCalcPowerReserveControllerEJBGen;
import com.ksoe.energynet.logic.TechConditionsLogic;
import com.ksoe.energynet.valueobject.ENCalcPowerReserve;
import com.ksoe.energynet.valueobject.ENContragent;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENTechConditionsObjects;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.filter.ENCalcPowerReserveFilter;
import com.ksoe.energynet.valueobject.filter.ENCalcPowerReserveItemFilter;
import com.ksoe.energynet.valueobject.filter.ENContragentFilter;
import com.ksoe.energynet.valueobject.lists.ENCalcPowerReserveShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.netobjects.dataminer.ENFiderGuageDAO;
import com.ksoe.netobjects.dataminer.ENSubstation04DAO;
import com.ksoe.netobjects.dataminer.ENTransformerDAO;
import com.ksoe.netobjects.valueobject.ENFiderGuage;
import com.ksoe.netobjects.valueobject.ENSubstation04;
import com.ksoe.netobjects.valueobject.ENTransformer;
import com.ksoe.netobjects.valueobject.filter.ENFiderGuageFilter;
import com.ksoe.netobjects.valueobject.lists.ENFiderGuageShortList;

public class ENCalcPowerReserveControllerEJB extends
		ENCalcPowerReserveControllerEJBGen {

	public ENCalcPowerReserveControllerEJB() {
	}

	
	/* ENCalcPowerReserve. Generate reserve */
	public int add(ENCalcPowerReserve object) {
		try {
			ENCalcPowerReserveDAO objectDAO = new ENCalcPowerReserveDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENTechConditionsServicesDAO tcsDAO = new ENTechConditionsServicesDAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        ENTechConditionsObjectsDAO tcoDAO = new ENTechConditionsObjectsDAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        ENContragentDAO cntDAO = new ENContragentDAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        ENFiderGuageDAO fgDAO = new ENFiderGuageDAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        ENTransformerDAO trDAO = new ENTransformerDAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        CCElementDataDAO cedDAO = new CCElementDataDAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
	        ENSubstation04DAO sub04DAO = new ENSubstation04DAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
	        
	        TechConditionsLogic tcLogic = new TechConditionsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		    


			object.userAdd = getUserProfile().userName;
	        object.dateAdd = new Date();
	        object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        
	        if (object.servicesobjectRef.code == Integer.MIN_VALUE) {
	        	throw new SystemException("Не указан договор на услуги!");
	        }
	        
	        if (object.gaugeRef.code == Integer.MIN_VALUE) {
	        	throw new SystemException("Не указан замер!");
	        }
	        
            ENServicesObject so = soDAO.getObject(object.servicesobjectRef.code);
 
            ENTechConditionsServices tcs = tcsDAO.getObject(tcLogic.getTechCodeBySoCode(so.code));
            
            ENContragentFilter cntFilter = new ENContragentFilter();
            cntFilter.techCondServicesRef.code = tcs.code;
            int[] cntArr = cntDAO.getFilteredCodeArray(cntFilter, 0, -1);
            
            if (cntArr.length == 0) {
            	throw new SystemException("Не найден контрагент по договору на присоединение!");
            }
            
            ENContragent cnt = cntDAO.getObject(cntArr[0]);
            ENTechConditionsObjects tco = tcoDAO.getObject(cnt.techConObjects.code);
            
            int maxCurrentGuageCode = object.gaugeRef.code;
            
	        
	        // добавляем расчет с первым замером
	       int retVal = objectDAO.add(object);
	       
	       ENFiderGuageFilter fgFilter = new ENFiderGuageFilter();
	        // ищем замеры на дату замера с максимальным током по другим трансформаторам, если они есть
	        fgFilter.conditionSQL = "code in (  select fig.code " + 
             " from entransformer t, enfiderguage fig " +
             " where t.substation04refcode = ( select fg.substation04code " +
             " from enfiderguage fg " +
             " where fg.code = "+maxCurrentGuageCode+")" +
             " and t.code = fig.transformercode " +
             " and fig.transformercode <> (select fg.transformercode from enfiderguage fg where fg.code = "+maxCurrentGuageCode+")" + 
             " and fig.dateguage = (select fg.dateguage from enfiderguage fg where fg.code = "+maxCurrentGuageCode+") " +
             " and fig.branchrefcode is null)";
	        ENFiderGuageShortList fgList = fgDAO.getScrollableFilteredList(fgFilter, 0, -1);
	        
	        // добавляем остальные замеры к договору
	        for (int g=0;g<fgList.totalCount;g++)
	        {
	        	  object.gaugeRef.code = fgList.get(g).code;
	        	  objectDAO.add(object);
	        }
	        
	        ENCalcPowerReserveFilter prFilter = new ENCalcPowerReserveFilter();
	        prFilter.servicesobjectRef.code = object.servicesobjectRef.code;
	        ENCalcPowerReserveShortList prList = objectDAO.getScrollableFilteredList(prFilter, 0, -1);

	        /// Формирование строк
	        for (int p=0;p<prList.totalCount;p++){
	        
		        /// найдем трансформаторы из найденных замеров и, если что, пошлем привязывать из в Call-Centre
		        /// иначе не найдем узлы из привязки ENSO2Nodes
	        	ENFiderGuage fig = fgDAO.getObject(prList.get(p).gaugeRefCode);
		        ENTransformer tr = trDAO.getObject(fig.transformer.code);
		        ENSubstation04 sub04 = sub04DAO.getObject(tr.substation04Ref.code);
		        
		        CCElementDataFilter cedFilter = new CCElementDataFilter();
		        cedFilter.elementCode = tr.element.code;
		        int[] cedArr = cedDAO.getFilteredCodeArray(cedFilter, 0, -1);
		        if (cedArr.length == 0) {
		        	throw new SystemException("Для трансформатору з кодом - " + tr.code + 
		        			      "\n на підстанції - " + sub04.name + "(" + sub04.invNumber + ")" +
		        			      "\n не знайдено прив'язки у Call-Centre! \n Додайте її для формування резерву!");
		        }
	        	
	        tcLogic.generatePowerReserveItems(prList.get(p).code);
	        }
	        
	        return retVal;

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENCalcPowerReserve%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	
	/* ENCalcPowerReserve. Generate reserve */
	public void generatePowerReserve(ENCalcPowerReserve object) {
		try {
			ENCalcPowerReserveDAO objectDAO = new ENCalcPowerReserveDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENTechConditionsServicesDAO tcsDAO = new ENTechConditionsServicesDAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        ENTechConditionsObjectsDAO tcoDAO = new ENTechConditionsObjectsDAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        ENContragentDAO cntDAO = new ENContragentDAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        ENFiderGuageDAO fgDAO = new ENFiderGuageDAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        ENTransformerDAO trDAO = new ENTransformerDAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        CCElementDataDAO cedDAO = new CCElementDataDAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
	        ENSubstation04DAO sub04DAO = new ENSubstation04DAO(getUserProfile(), 
	        		getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
	        
	        TechConditionsLogic tcLogic = new TechConditionsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		    
			/// удалим предыдущий расчет, если он есть
	        ENCalcPowerReserveFilter prFilter = new ENCalcPowerReserveFilter();
	        prFilter.servicesobjectRef.code = object.servicesobjectRef.code;
	        ENCalcPowerReserveShortList prList = objectDAO.getScrollableFilteredList(prFilter, 0, -1);
	        
		    /// удаление строк
	        for (int p=0;p<prList.totalCount;p++){
	        this.remove(prList.get(p).code);
	        }
	        ///

			object.userAdd = getUserProfile().userName;
	        object.dateAdd = new Date();
	        object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        
	        if (object.servicesobjectRef.code == Integer.MIN_VALUE) {
	        	throw new SystemException("Не указан договор на услуги!");
	        }
	        
            ENServicesObject so = soDAO.getObject(object.servicesobjectRef.code);
 
            ENTechConditionsServices tcs = tcsDAO.getObject(tcLogic.getTechCodeBySoCode(so.code));
            
            ENContragentFilter cntFilter = new ENContragentFilter();
            cntFilter.techCondServicesRef.code = tcs.code;
            int[] cntArr = cntDAO.getFilteredCodeArray(cntFilter, 0, -1);
            
            if (cntArr.length == 0) {
            	throw new SystemException("Не найден контрагент по договору на присоединение!");
            }
            
            ENContragent cnt = cntDAO.getObject(cntArr[0]);
            ENTechConditionsObjects tco = tcoDAO.getObject(cnt.techConObjects.code);
            
            /// ищем замер с максимальным током
            ENFiderGuageFilter fgFilter = new ENFiderGuageFilter();
            fgFilter.conditionSQL = "code in ( " +
                                          " select gu.code from ( " +
            " select g.code,           " +
            " case   when  least(g.currentphasegreen, g.currentphasered, g.currentphaseyellow)/greatest(g.currentphasegreen, g.currentphasered, g.currentphaseyellow) < 0.8 " + 
            " then ((g.currentphasegreen + g.currentphasered + g.currentphaseyellow)/3)::numeric(15,2) " +
            " else greatest(g.currentphasegreen, g.currentphasered, g.currentphaseyellow) end as maxcurrent " +
            " from " +
            " ( select  sub04.code as sub_code  from " + 
            " (select   ( select ccCode " +
            " from dblink(  'dbname=callcenter port=5432 host=10.77.11.180 user=read password=read', " +
            " format('  select q.code from ccnode q where q.code in (select nodewithallparents_normal(%s)) " + 
            "         and q.nodetypecode in (2,4,6) and nodetypecode<= " +
            "         (select nn.nodetypecode from ccnode nn where nn.code=%s)  " +
            "         order by q.nodetypecode desc limit 1',s2n.ccnodecode, s2n.ccnodecode)) " +
            " as  (ccCode double precision) ) as subNodeCode " + 
            " from enso2node s2n " +
            " where s2n.servicesobjectcode = " + so.code + " ) as parentSub, ccelementdata ced, enelementdata ed " + 
            " left join ensubstation04 sub04 on (ed.ecode = sub04.elementcode) " +
            " where parentsub.subnodecode = ced.code " +
            " and ced.elementcode = ed.ecode " +
            " and ed.etype = 3 " +
            " ) as en_sub left join entransformer tr on (tr.substation04refcode = en_sub.sub_code) " +
            " left join enfiderguage g on (g.transformercode = tr.code and g.branchrefcode is null) " + 
            " where g.dateguage between CURRENT_DATE - interval'3 years' and CURRENT_DATE " + 
            " order by  case   when  least(g.currentphasegreen, g.currentphasered, g.currentphaseyellow)/greatest(g.currentphasegreen, g.currentphasered, g.currentphaseyellow) < 0.8 " + 
             " then ((g.currentphasegreen + g.currentphasered + g.currentphaseyellow)/3)::numeric(15,2) " +
             " else greatest(g.currentphasegreen, g.currentphasered, g.currentphaseyellow) end desc " +
            " limit 1) as gu) ";
            
            int maxCurrentGuageCode = Integer.MIN_VALUE;
            
	        ENFiderGuageShortList fgList = fgDAO.getScrollableFilteredList(fgFilter, 0, -1); 
	        
	        if (fgList.totalCount == 0) {
	        	throw new SystemException("Не найден замер по подстанции! Проверьте привязку объектов Call-Centre с объектами подстанций и трансформаторов в EnergyNET!");
	        }
	        
	        if (fgList.totalCount > 0) {
		        object.gaugeRef.code = fgList.get(0).code;
		        maxCurrentGuageCode = fgList.get(0).code; 
	        }
	        
	        // добавляем расчет с первым замером
	       objectDAO.add(object);
	        
	        // ищем замеры на дату замера с максимальным током по другим трансформаторам, если они есть
	        fgFilter.conditionSQL = "code in (  select fig.code " + 
             " from entransformer t, enfiderguage fig " +
             " where t.substation04refcode = ( select fg.substation04code " +
             " from enfiderguage fg " +
             " where fg.code = "+maxCurrentGuageCode+")" +
             " and t.code = fig.transformercode " +
             " and fig.transformercode <> (select fg.transformercode from enfiderguage fg where fg.code = "+maxCurrentGuageCode+")" + 
             " and fig.dateguage = (select fg.dateguage from enfiderguage fg where fg.code = "+maxCurrentGuageCode+") " +
             " and fig.branchrefcode is null)";
	        fgList = fgDAO.getScrollableFilteredList(fgFilter, 0, -1);
	        
	        // добавляем остальные замеры к договору
	        for (int g=0;g<fgList.totalCount;g++)
	        {
	        	  object.gaugeRef.code = fgList.get(g).code;
	        	  objectDAO.add(object);
	        }
	        
	        prFilter = new ENCalcPowerReserveFilter();
	        prFilter.servicesobjectRef.code = object.servicesobjectRef.code;
	        prList = objectDAO.getScrollableFilteredList(prFilter, 0, -1);

	        /// Формирование строк
	        for (int p=0;p<prList.totalCount;p++){
	        
		        /// найдем трансформаторы из найденных замеров и, если что, пошлем привязывать из в Call-Centre
		        /// иначе не найдем узлы из привязки ENSO2Nodes
	        	ENFiderGuage fig = fgDAO.getObject(prList.get(p).gaugeRefCode);
		        ENTransformer tr = trDAO.getObject(fig.transformer.code);
		        ENSubstation04 sub04 = sub04DAO.getObject(tr.substation04Ref.code);
		        
		        CCElementDataFilter cedFilter = new CCElementDataFilter();
		        cedFilter.elementCode = tr.element.code;
		        int[] cedArr = cedDAO.getFilteredCodeArray(cedFilter, 0, -1);
		        if (cedArr.length == 0) {
		        	throw new SystemException("Для трансформатору з кодом - " + tr.code + 
		        			      "\n на підстанції - " + sub04.name + "(" + sub04.invNumber + ")" +
		        			      "\n не знайдено прив'язки у Call-Centre! \n Додайте її для формування резерву!");
		        }
	        	
	        tcLogic.generatePowerReserveItems(prList.get(p).code);
	        }

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't generatePower {%com.ksoe.energynet.valueobject.ENCalcPowerReserve%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	/* ENCalcPowerReserve. Удалить */
	public void remove(int code) {
		try {
			ENCalcPowerReserveDAO objectDAO = new ENCalcPowerReserveDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENCalcPowerReserveItemDAO objectItemDAO = new ENCalcPowerReserveItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			

			ENCalcPowerReserveItemFilter priFilter = new ENCalcPowerReserveItemFilter();
			priFilter.calcPowerReserveRef.code = code;
			
			int[] priArr = objectItemDAO.getFilteredCodeArray(priFilter, 0, -1);
			
			 for (int l = 0; l < priArr.length; l++) {
				 objectItemDAO.remove(priArr[l]);
			 }

			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENCalcPowerReserve%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
} // end of EJB Controller for ENCalcPowerReserve