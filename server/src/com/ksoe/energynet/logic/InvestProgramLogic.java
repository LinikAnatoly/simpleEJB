package com.ksoe.energynet.logic;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENIPDAO;
import com.ksoe.energynet.dataminer.ENIPItem2ContractDAO;
import com.ksoe.energynet.dataminer.ENIPItem2PlanDAO;
import com.ksoe.energynet.dataminer.ENIPItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkTypeDAO;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENIP;
import com.ksoe.energynet.valueobject.ENIPItem;
import com.ksoe.energynet.valueobject.ENIPItem2Contract;
import com.ksoe.energynet.valueobject.ENIPItem2Plan;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.filter.ENIPFilter;
import com.ksoe.energynet.valueobject.filter.ENIPItem2ContractFilter;
import com.ksoe.energynet.valueobject.filter.ENIPItem2PlanFilter;
import com.ksoe.energynet.valueobject.filter.ENIPItemFilter;
import com.ksoe.energynet.valueobject.lists.ENIPItem2ContractShortList;
import com.ksoe.energynet.valueobject.lists.ENIPItemShortList;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;



public class InvestProgramLogic extends LogicModule {

    public InvestProgramLogic(Connection connection, UserProfile userProfile) {
        super(connection, userProfile);
    }

    /** Подвиды работ, принадлежащие к Инвестпрограмме */
    private static final int[] PlanWorkTypeIP = { ENPlanWorkType.INVEST,
            ENPlanWorkType.SERVICES_FROM_SIDE_INVEST,
            ENPlanWorkType.EZ_PLANED_CHANGE_COUNTER,
            ENPlanWorkType.EZ_SETUP_ZKU, ENPlanWorkType.EZ_CHANGE_ZKU,
            ENPlanWorkType.EZ_CHANGE_COUNTER_IN_ZKU };


    /**
     *  проверка принадлежности подвида работ в плане к инвестпрограмме
     *  @param planCode = код плана
     *
     */
    public void checkWorksIp(int planCode) {
        try {

            ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
            ENPlanWork plan = planDao.getObject(planCode);

            boolean invest = false;
            int workIP[] = PlanWorkTypeIP;
            for (int i = 0; i < workIP.length; i++) {
                if (workIP[i] == plan.typeRef.code) {
                    invest = true;
                }
            }

            if (!invest) {
                ENPlanWorkTypeDAO pwDao = new ENPlanWorkTypeDAO(connection, userProfile);
                ENPlanWorkType pwType = pwDao.getObject(plan.typeRef.code);

                throw new SystemException("\n\n" +
                        "Підвид робіт \"" + pwType.name + "\" відрізняється від робіт за Інвестпрограмою!!!");
            }

            if (plan.kind.code != ENPlanWorkKind.YEAR
                    && plan.kind.code != ENPlanWorkKind.CURRENT) {
                throw new SystemException("\n\n" +
                        "Додавати можливо лише \"Річний\" або \"Місячний\" план!!!");
            }

            /** 02.04.2014 +++ добавляют чё хотят.....
            if (plan.status.code != ENPlanWorkStatus.LOCKED
                    && plan.status.code != ENPlanWorkStatus.GOOD) {
                throw new SystemException("\n\n" +
                        "Додавати можливо лише затверджений \"Річний\" або \"Місячний\" план!!!");
            }
            */

        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(),e);
        }
    }
    
    /**
     * 
     * SUPP-71707 Получить список всех инвестпрограмм {@link ENIP} связанных с планом
     * 
     * @param plan объект плана {@link ENPlanWork}
     * @return список инвестпрограмм {@link ENIP}
     * @throws PersistenceException
     */
    public List<ENIP> getListByPlan(ENPlanWork plan) throws PersistenceException {
    	
    	if(plan == null || plan.code == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException();
    	}
    	
    	ENIPItem2PlanDAO i2pDao = new ENIPItem2PlanDAO(connection, userProfile);
    	ENIPItemDAO iiDao = new ENIPItemDAO(connection, userProfile);
    	ENIPDAO ipDao = new ENIPDAO(connection, userProfile);
    	
    	List<ENIP> ips = new ArrayList<ENIP>();

    	ENIPItem2PlanFilter i2pFilter = new ENIPItem2PlanFilter();
    	i2pFilter.planRef.code = plan.code;
    	                                                                                          
    	List<Double> itemCodes = i2pDao.getListOfPropertyValues(ENIPItem2Plan.ipItemRef_QFielld, i2pFilter, 0, -1, null); 

    	if(itemCodes.size() == 0) return ips;

    	ENIPItemFilter ipItemFilter = new ENIPItemFilter();
    	ipItemFilter.conditionSQL = String.format("%s in (%s)", ENIPItem.code_QFielld, Tools.repeatSymbol("?", ",", itemCodes.size()));

    	List<Double> ipCodes = iiDao.getListOfPropertyValues(ENIPItem.ipRef_QFielld, ipItemFilter, 0, -1, itemCodes);
    	
    	if(ipCodes.size() == 0) return ips;

    	HashSet<Double> setIpCodes = new HashSet<Double>(ipCodes);

    	for(Double ipCode : setIpCodes) ips.add(ipDao.getObject(ipCode.intValue()));

    	return ips;
    }
    
    /**
     * 
     * Выбрать список строк инвестпрограммы по инвестпрограмме {@link ENIP} и плану {@link ENPlanWork}
     * 
     * Метод полезен если известен план и инвестпрограмма, в которую он включен и необходимо выбрать все
     * строки (пункты) где он находится
     * 
     * @param ip объект инвестпрограммы {@link ENIP}
     * @param plan {@link ENPlanWork}
     * @return список строк инвестпрограммы {@link ENIPItemShortList}
     * @throws PersistenceException
     */
    public ENIPItemShortList getListByIPAndPlan(ENIP ip, ENPlanWork plan) throws PersistenceException {
    	ENIPItemDAO dao = new ENIPItemDAO(connection, userProfile);
    	ENIPItemFilter filter = new ENIPItemFilter();
    	filter.ipRef.code = ip.code;
    	filter.conditionSQL = String.format("exists (select 1 from %s as ipp1 where ipp1.%s = %s and ipp1.%s = ?)"
    			, ENIPItem2Plan.tableName, ENIPItem2Plan.ipItemRef_Field, ENIPItem.code_QFielld, ENIPItem2Plan.planRef_Field);
    	
    	Vector<Integer> bindedParams = new Vector<Integer>();
    	bindedParams.add(plan.code);
    	
		return dao.getScrollableFilteredList(filter, 0, -1, bindedParams);
    }
    
    /**
     * 
     * SUPP-71707 Проверка плана на наличие в инвестпрограмме.
     * 
     * Если план присутствует в инвестпрограмме, то будет сгенерировано исключение
     * 
     * @param plan объект плана {@link ENPlanWork}
     * @throws PersistenceException
     */
    public void checkPlanInInvestProgram(ENPlanWork plan) throws PersistenceException {
    	List<ENIP> ips = this.getListByPlan(plan);
    	
    	if(ips != null && ips.size() > 0) {
    		String errMsg = String.format("Цей план (сис. код. %d) зв'язаний із ", plan.code);
    		errMsg += (ips.size() > 1) ? " інвестпрограмами " : "інвестпрограмою";
    		
    		String investProgramsString = "\n";
    		for(ENIP ip : ips) {
    			ENIPItemShortList ipItemList = this.getListByIPAndPlan(ip, plan);
    			if(ipItemList.totalCount == 0) throw new SystemException("Помилка у кількості строк інвест програми!");
    			investProgramsString += String.format(" \"%s\" за %d рік (%s пункт %s)\n", ip.name
    					, ip.yearGen, ipItemList.get(0).invGroupRefName, ipItemList.get(0).itemNumber);
    		}
    		if(investProgramsString.length() > 100) {
    			investProgramsString = investProgramsString.substring(0, 100);
    		}
    		
    		errMsg += investProgramsString + "\n";
    		errMsg += "Необхідно видалити зазначений план звідси!";
    		throw new SystemException(errMsg);
    	}
    	
    }

    /**
     *  проверка уникальности пункт инвестпрограммы == план && инвестпрограмма == план
     *
     *  @param ipItemCode = код пункта инвестпрограммы
     *  @param planCode = код плана
     */
    public void checkUniq(int ipItemCode, int planCode) {
        try {
            ENIPItem2PlanDAO i2pDao = new ENIPItem2PlanDAO(connection, userProfile);
            ENIPItem2PlanFilter i2pFilter = new ENIPItem2PlanFilter();
            i2pFilter.ipItemRef.code = ipItemCode;
            i2pFilter.planRef.code = planCode;

            int i2pArr[] = i2pDao.getFilteredCodeArray(i2pFilter, 0, -1);
            if (i2pArr.length > 0) {
                throw new SystemException("\n\n" +
                        "Цей план вже включено в даний пункт інвестпрограми!!!");
            }

            /** проверка в разрезе данной инвестпрограммы */

            /** 31.03.2014... +++  не проверяем...
             *  материал из одного плана - как отдельный пункт инвестпрограммы....

            ENIPItem2PlanFilter ip2pFilter = new ENIPItem2PlanFilter();
            ip2pFilter.planRef.code = planCode;
            ip2pFilter.conditionSQL = " enipitem2plan.ipitemrefcode in ( select ip.code from enipitem ip " +
                    " where ip.iprefcode in (select ii.iprefcode from enipitem ii where ii.code = " + ipItemCode + " ))";

            int ip2pArr[] = i2pDao.getFilteredCodeArray(ip2pFilter, 0, -1);
            if (ip2pArr.length > 0) {
                ENIPItem2Plan ip2p = i2pDao.getObject(ip2pArr[0]);
                ENIPItemDAO ipDao = new ENIPItemDAO(connection, userProfile);
                String itemNumber = ipDao.getObject(ip2p.ipItemRef.code).itemNumber;

                throw new SystemException("\n\n" +
                        "Цей план вже включено в пункт №" + itemNumber + " даної інвестпрограми!!!");
            }
            */


        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(),e);
        }
    }
    
    /**
     *  Поиск по естимейтам плана тендерного договора  
     *
     */
    public void recalcContract(int ENIPItemCode) {
        try {

        	ENIPItem2ContractDAO i2cDAO = new ENIPItem2ContractDAO(connection, userProfile);
        	ENIPItemDAO itDAO = new ENIPItemDAO(connection, userProfile);
        	ENIPItem2ContractFilter i2cFilter = new ENIPItem2ContractFilter();
        	i2cFilter.ipItemRef.code = ENIPItemCode;
        	
        	int[] i2cArr = i2cDAO.getFilteredCodeArray(i2cFilter, 0, -1);
        	
        	 for (int i = 0; i < i2cArr.length ; i++) {
        		 i2cDAO.remove(i2cArr[i]); 
        		 
        		 ENIPItem it = itDAO.getObject(ENIPItemCode);
        		 it.infoTenders = "";
        		 itDAO.saveinfoTenders(it);
        		 
             }

        	 
        	
        	ENIPItem2ContractShortList i2cList = i2cDAO.findContractList(ENIPItemCode);
        	
        	 for (int j = 0; j < i2cList.totalCount ; j++) {
        		
        		 i2cFilter = new ENIPItem2ContractFilter(); 
        		 i2cFilter.contractNumber = i2cList.get(j).contractNumber;
        		 i2cFilter.finDocCode = i2cList.get(j). finDocCode;
        		 i2cFilter.finDocID = i2cList.get(j).finDocID;
        		 i2cFilter.orgId = i2cList.get(j).orgId;
        		 i2cFilter.ipItemRef.code = ENIPItemCode;
                 
        		  i2cArr = i2cDAO.getFilteredCodeArray(i2cFilter, 0, -1);
             	
            	 if (i2cArr.length == 0) {
            		 ENIPItem2Contract i2c = new ENIPItem2Contract();
            		 i2c.code = Integer.MIN_VALUE;
            		 i2c.contractNumber = i2cList.get(j).contractNumber;
            		 i2c.contractDate = i2cList.get(j).contractDate;
            		 i2c.finDocCode = i2cList.get(j).finDocCode;
            		 i2c.finDocID = i2cList.get(j).finDocID;                     
                     i2c.orgId = i2cList.get(j).orgId;                     
                     i2c.orgName = i2cList.get(j).orgName;
                     i2c.orgUkrName = i2cList.get(j).orgUkrName;
                     i2c.orgCode = i2cList.get(j).orgCode;
                     i2c.ipItemRef.code = ENIPItemCode;
                     i2cDAO.add(i2c);
            		 
            	 } else 
            		 continue;
            	 
        		 
             }
        	 
        	 
        	 // обновим поле infoTenders на пункте ИП
        	 i2cFilter = new ENIPItem2ContractFilter();
        	 i2cFilter.ipItemRef.code = ENIPItemCode;
        	
        	 // i2cList = i2cDAO.getScrollableFilteredList(i2cFilter, 0, -1);
        	  int[] i2cArr2 = i2cDAO.getFilteredCodeArray(i2cFilter, 0, -1);
        	 
        	
        	 if (  i2cArr2.length > 0 ) {
        		 
        		ENIPItem it = itDAO.getObject(ENIPItemCode);
        		 
        		String infoTenders = ""; 
        		
        		 for (int z = 0; z < i2cArr2.length ; z++) {
        			 ENIPItem2Contract i2cObj = i2cDAO.getObject(i2cArr2[z]);
            		 
        			 if (infoTenders.trim().equals("") ){
        				 infoTenders =  i2cObj.contractNumber + " від " +  new SimpleDateFormat("dd.MM.yyyy").format(i2cObj.contractDate) + " " + i2cObj.orgName;
        				
        			 } else 
        			 {
        				 infoTenders =  infoTenders + "\n" + i2cObj.contractNumber + " від " + i2cObj.contractDate.toString() + " " +  i2cObj.orgName;
        			 }
            	 }
        		
        		 it.infoTenders = infoTenders;
        		 itDAO.saveinfoTenders(it);
        		 
        	 }     	 
        	 
        
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(),e);
        }
    }
    
    
    /* ENIPItem. пересчитать инфу по тендерам с дочерних*/
	public void recalcParentIpItemInfoTenders(ENIPItem object) {
		try {
			ENIPItemDAO objectDAO = new ENIPItemDAO(connection, userProfile);			
			ENIPItem objectParent = objectDAO.getObject(object.parentRef.code);
			
			String infoTenders = "";	    
			
			LinkedHashMap<InfoTendersData, InfoTendersData> infoData = new LinkedHashMap<InfoTendersData, InfoTendersData>();
			InfoTendersData iKey;
			
			
			
			ENIPItemFilter itchildFilter = new ENIPItemFilter();
			itchildFilter.parentRef.code = objectParent.code; 
			ENIPItemShortList ipchildList = objectDAO.getScrollableFilteredList(itchildFilter, 0, -1);
			 for (int i=0; i < ipchildList.totalCount; i++){
				 
			if (ipchildList.get(i).infoTenders != null ) {
						 iKey = new InfoTendersData(ipchildList.get(i).infoTenders);
						 infoData.put(iKey, iKey);
						 
						
					 }
				}	 
					 Iterator<InfoTendersData> infoIterator = infoData.keySet().iterator();
		
			            while (infoIterator.hasNext()){
			                iKey = (InfoTendersData)infoIterator.next();
			                InfoTendersData iValue = (InfoTendersData)infoData.get(iKey);
			                
			                if (infoTenders.trim() == "" ) {
								   infoTenders = iValue.info; 
							   } else 							
					          infoTenders = infoTenders.trim() + "\n" + iValue.info;     
			                
			   			 } 
	            
			 
	                
	            
			
		if (!infoTenders.equals("") ) {
				 objectParent.infoTenders = infoTenders;
			     objectDAO.saveinfoTenders(objectParent);
		}
		   
		} catch (PersistenceException e) {
            throw new SystemException(e.getMessage(),e);
        }
	}

	class InfoTendersData
    {
        String info;
        

        public InfoTendersData(String vInfo )
        {
            info = vInfo;
            
        }

        public int hashCode()
        {
            return (info).hashCode();
        }

        public boolean equals(Object obj)
        {
            if (obj instanceof InfoTendersData)
            {
            	InfoTendersData other = (InfoTendersData)obj;
                return this.info.equals(other.info);

            } else
            {
                return false;
            }
        }

    }


    /**
     *  Проверка, является ли заданная версия Инвестпрограммы (ИП) последней
     *
     *  @param ipCode - код ИП
     *  @param isException - вызывать ли исключение (true - да)
     *   
     *  @return true - заданная ИП - последняя версия, false - нет   
     *  
     */	
	public boolean checkLastVersionIP(int ipCode, boolean isException)
	{
		try
		{
			ENIPDAO ipDAO = new ENIPDAO(connection, userProfile);

			ENIPFilter ipFilter = new ENIPFilter();
			ipFilter.parentRef.code = ipCode;
			int[] ipArr = ipDAO.getFilteredCodeArray(ipFilter, 0, -1);
			
			if (ipArr.length > 0)
			{
				ENIP ipChild = ipDAO.getObject(ipArr[0]);
			
				if (isException)
				{
					throw new SystemException("\n\nNET-4344 Для цієї Інвестпрограми існує дочірня версія (№" + ipChild.version + ")! " +
				                          	  "Редагувати можливо тільки останню версію Інвестпрограми!");
				}
				else
				{
					return false;
				}
			}			
			
			return true;
		} 
		catch (PersistenceException e) 
		{
			throw new SystemException(e.getMessage(), e);
		}
		
	}


	/////

	/**
	 *  Апдейт плана в связке с ИнвестПрограммой
	 *
	 *  @param ipItemCode = код пункта инвестпрограммы
	 *  @param planCode = код плана
	 */
	public void updatePlan(int ipItemCode, int planCode) {
		try {

			ENIPItem ipItem = new ENIPItem();
			if (ipItemCode != Integer.MIN_VALUE) {
				ENIPItemDAO ipItemDAO = new ENIPItemDAO(connection, userProfile);
				ipItem = ipItemDAO.getObject(ipItemCode);
			}

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWork plan = planDAO.getObject(planCode);
			plan.invgroupRef.code = ipItem.invGroupRef.code;
			plan.ipImplementTypeRef.code = ipItem.ipImplementTypeRef.code;
			plan.investItemNumber = ipItem.itemNumber;

			planDAO.save(plan);


		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(),e);
		}
	}


}
