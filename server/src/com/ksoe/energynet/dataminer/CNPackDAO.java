
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.CNPackDAOGen;
import com.ksoe.energynet.valueobject.CNPack;
import com.ksoe.energynet.valueobject.CNSubsystemType;
import com.ksoe.energynet.valueobject.brief.CNPackShort;
import com.ksoe.energynet.valueobject.filter.CNPackFilter;
import com.ksoe.energynet.valueobject.lists.CNPackShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for CNPack;
  *
  */

public class CNPackDAO extends CNPackDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public CNPackDAO() {super();}
  //public CNPackDAO(Connection aConnection) {super(aConnection);}
  //public CNPackDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public CNPackDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public CNPackDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  /* CNPack(Пакети документів з EnergyWorkflow). Получить список по фильтру для просмотра */
  public CNPackShortList getCNPackList(CNPackFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
  {
	   CNPackShortList result = new CNPackShortList();
	   CNPackShort anObject;
	   result.list = new Vector();

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   ResultSet  set = null;

	   String     whereStr = "";
	   //*** String     whereStr = " p.id_ren = r.id and p.id_pack_status = s.id ";

	   String     condition = (aFilterObject.conditionSQL == null  ? "" : aFilterObject.conditionSQL);

	   String     orderBy = (aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL );

	   if(quantity < 0)
	       quantity = Integer.MAX_VALUE/2;

	   if(orderBy.length() == 0)
	    //*** orderBy = "p.id";
		orderBy = "p.subsystemcode desc, p.id";

	   if(getUserProfile() == null)
	    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	  /* ***
	   selectStr =
		   " SELECT  " +
		   "    p.id   " +
		   "   , p.name   " +
		   "   , p.id_ren   " +
		   "   , r.name " +
		   "   , p.id_pack_status   " +
		   "   , s.name " +
		   "   , p.description   " +
		   "   , p.power   " +
		   "   , p.adres   " +
		   "   , p.reg_num_cn_contract   " +
		   "   , p.date_cn_contract   " +
		   "   , p.reg_num_tu_contract   " +
		   "   , p.date_tu_contract   " +
		   "   , p.reg_num_tu_creation_contract   " +
		   "   , p.date_tu_creation_contract   " +
		   "   , p.project_num   " +
		   "   , p.project_date  " +
		   " FROM cn.cn_20110314_packages p, cn.cn_ren r, cn.cn_pack_status s ";
	   */

	   selectStr =
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , p.renname \n" +
		   " , p.id_pack_status    \n" +
		   " , p.statusname \n" +
		   " , p.description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +
		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , p.reg_num_tu_creation_contract    \n" +
		   " , p.date_tu_creation_contract    \n" +
		   " , p.project_num    \n" +
		   " , p.project_date   \n" +
		   " , p.subsystemcode \n" +
		   " , p.subsystemname \n" +
		   " , p.reg_num_spl_pp_contract \n" +

		   " FROM  \n" +
		   " ( \n" +
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , r.name as renname \n" +
		   " , p.id_pack_status    \n" +
		   " , s.name as statusname \n" +
		   " , null as description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +
		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , p.reg_num_tu_creation_contract    \n" +
		   " , p.date_tu_creation_contract    \n" +
		   " , p.project_num    \n" +
		   " , p.project_date   \n" +
		   " , " + CNSubsystemType.SS_CONNECTION + " as subsystemcode \n" +
		   " , 'Присоединение' as subsystemname \n" +
		   " , coalesce(p.account, \n" +
           "      case \n" +
           "        when coalesce(p.status, 0) in (0, 2, 3, 5) then \n" +
           "          (select reg_num_spl_contract from cn.spl_packages \n" +
           "          where id = (select max(id_spl_pack) from cn.spl2cn \n" +
           "            where id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION + " and id_cn_pack = p.id)) \n" +
           "        when coalesce(p.status, 0) in (1, 4) then \n" +
           "          (select reg_num_spl_contract from cn.pp_packages \n" +
           "          where id = (select max(id_pp_pack) from cn.pp2cn \n" +
           "            where id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION + " and id_cn_pack = p.id)) \n" +
           "      end) as reg_num_spl_pp_contract \n" +
		   " FROM cn.cn_packages p, cn.cn_ren r, cn.cn_pack_status s  \n" +
		   " where p.id_ren = r.id and p.id_pack_status = s.id and p.id_pack_status <> 1000 \n" +
		   "  \n" +
		   " union all \n" +
		   "  \n" +
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , r.name as renname \n" +
		   " , p.id_pack_status    \n" +
		   " , s.name as statusname \n" +
		   " , null as description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +
		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , null as reg_num_tu_creation_contract    \n" +
		   " , null as date_tu_creation_contract    \n" +
		   " , null as project_num    \n" +
		   " , null as project_date   \n" +
		   " , " + CNSubsystemType.SS_TECHTERMS + " as subsystemcode \n" +
		   " , 'Согласование абонентских ТУ' as subsystemname \n" +
		   " , p.account as reg_num_spl_pp_contract \n" +
		   " FROM cn.tts_packages p, cn.cn_ren r, cn.cn_pack_status s  \n" +
		   " where p.id_ren = r.id and p.id_pack_status = s.id and p.id_pack_status <> 1000 \n" +
		   "  \n" +
		   " union all \n" +
		   "  \n" +
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , r.name as renname \n" +
		   " , p.id_pack_status    \n" +
		   " , s.name as statusname \n" +
		   " , null as description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +
		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , p.reg_num_tu_creation_contract    \n" +
		   " , p.date_tu_creation_contract    \n" +
		   " , p.project_num    \n" +
		   " , p.project_date   \n" +
		   " , " + CNSubsystemType.SS_NEWCONNECTION + " as subsystemcode \n" +
		   " , 'Присоединение с 01.08.2010' as subsystemname \n" +
		   " , coalesce(p.account, \n" +
           "      case \n" +
           "        when coalesce(p.status, 0) in (0, 2, 3, 5) then \n" +
           "          (select reg_num_spl_contract from cn.spl_packages \n" +
           "          where id = (select max(id_spl_pack) from cn.spl2cn \n" +
           "            where id_subsystem_cn = " + CNSubsystemType.SS_NEWCONNECTION + " and id_cn_pack = p.id)) \n" +
           "        when coalesce(p.status, 0) in (1, 4) then \n" +
           "          (select reg_num_spl_contract from cn.pp_packages \n" +
           "          where id = (select max(id_pp_pack) from cn.pp2cn \n" +
           "            where id_subsystem_cn = " + CNSubsystemType.SS_NEWCONNECTION + " and id_cn_pack = p.id)) \n" +
           "      end) as reg_num_spl_pp_contract \n" +
		   " FROM cn.ncn_packages p, cn.cn_ren r, cn.cn_pack_status s  \n" +
		   " where p.id_ren = r.id and p.id_pack_status = s.id and p.id_pack_status <> 1000 \n" +
		   "  \n" +
		   " union all \n" +
		   "  \n" +
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , r.name as renname \n" +
		   " , p.id_pack_status    \n" +
		   " , s.name as statusname \n" +
		   " , p.description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +
		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , p.reg_num_tu_creation_contract    \n" +
		   " , p.date_tu_creation_contract    \n" +
		   " , p.project_num    \n" +
		   " , p.project_date   \n" +
		   " , " + CNSubsystemType.SS_CONNECTION_20110314 + " as subsystemcode \n" +
		   " , 'Присоединение с 14.03.2011' as subsystemname \n" +
		   " , coalesce(p.account, \n" +
           "      case \n" +
           "        when coalesce(p.status, 0) in (0, 2, 3, 5) then \n" +
           "          (select reg_num_spl_contract from cn.spl_packages \n" +
           "          where id = (select max(id_spl_pack) from cn.spl2cn \n" +
           "            where id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION_20110314 + " and id_cn_pack = p.id)) \n" +
           "        when coalesce(p.status, 0) in (1, 4) then \n" +
           "          (select reg_num_spl_contract from cn.pp_packages \n" +
           "          where id = (select max(id_pp_pack) from cn.pp2cn \n" +
           "            where id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION_20110314 + " and id_cn_pack = p.id)) \n" +
           "      end) as reg_num_spl_pp_contract \n" +
		   " FROM cn.cn_20110314_packages p, cn.cn_ren r, cn.cn_pack_status s  \n" +
		   " where p.id_ren = r.id and p.id_pack_status = s.id and p.id_pack_status <> 1000 \n" +

		   "  \n" +
		   " union all \n" +
		   "  \n" +
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , r.name as renname \n" +
		   " , p.id_pack_status    \n" +
		   " , s.name as statusname \n" +
		   " , p.description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +
		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , p.reg_num_tu_creation_contract    \n" +
		   " , p.date_tu_creation_contract    \n" +
		   " , p.project_num    \n" +
		   " , p.project_date   \n" +
		   " , " + CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER + " as subsystemcode \n" +
		   " , 'Присоединение с 01.03.2013' as subsystemname \n" +
		   " , coalesce(p.account, \n" +
           "      case \n" +
           "        when coalesce(p.status, 0) in (0, 2, 3, 5) then \n" +
           "          (select reg_num_spl_contract from cn.spl_packages \n" +
           "          where id = (select max(id_spl_pack) from cn.spl2cn \n" +
           "            where id_subsystem_cn = " + CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER + " and id_cn_pack = p.id)) \n" +
           "        when coalesce(p.status, 0) in (1, 4) then \n" +
           "          (select reg_num_spl_contract from cn.pp_packages \n" +
           "          where id = (select max(id_pp_pack) from cn.pp2cn \n" +
           "            where id_subsystem_cn = " + CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER + " and id_cn_pack = p.id)) \n" +
           "      end) as reg_num_spl_pp_contract \n" +
		   " FROM cn.eap_packages p, cn.cn_ren r, cn.cn_pack_status s  \n" +
		   " where p.id_ren = r.id and p.id_pack_status = s.id and p.id_pack_status <> 1000 \n" +		   
		   
		   "  \n" +
		   " union all \n" +
		   "  \n" +
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , r.name as renname \n" +
		   " , p.id_pack_status    \n" +
		   " , s.name as statusname \n" +
		   " , p.description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +
		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , p.reg_num_tu_creation_contract    \n" +
		   " , p.date_tu_creation_contract    \n" +
		   " , p.project_num    \n" +
		   " , p.project_date   \n" +
		   " , " + CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER + " as subsystemcode \n" +
		   " , 'Присоединение с 19.04.2018' as subsystemname \n" +
		   " , coalesce(p.account, \n" +
           "      case \n" +
           "        when coalesce(p.status, 0) in (0, 2, 3, 5) then \n" +
           "          (select reg_num_spl_contract from cn.spl_packages \n" +
           "          where id = (select max(id_spl_pack) from cn.spl2cn \n" +
           "            where id_subsystem_cn = " + CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER + " and id_cn_pack = p.id)) \n" +
           "        when coalesce(p.status, 0) in (1, 4) then \n" +
           "          (select reg_num_spl_contract from cn.pp_packages \n" +
           "          where id = (select max(id_pp_pack) from cn.pp2cn \n" +
           "            where id_subsystem_cn = " + CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER + " and id_cn_pack = p.id)) \n" +
           "      end) as reg_num_spl_pp_contract \n" +
		   " FROM cn.adso_packages p, cn.cn_ren r, cn.cn_pack_status s  \n" +
		   " where p.id_ren = r.id and p.id_pack_status = s.id and p.id_pack_status <> 1000 \n" +		   
		   
		   " ) as p ";

     if(aFilterObject != null)
     {
       /*
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  CNPACK.CODE = ?";
       }
       */
       if(aFilterObject.packCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.id = ?";
       }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.id_ren != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.ID_REN = ?";
       }
        if (aFilterObject.renName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                //*** whereStr = whereStr + "  UPPER(r.NAME) = UPPER(?)";
            	whereStr = whereStr + "  UPPER(p.RENNAME) = UPPER(?)";
            else
                //*** whereStr = whereStr + " UPPER(r.NAME) LIKE UPPER(?)";
            	whereStr = whereStr + " UPPER(p.RENNAME) LIKE UPPER(?)";
        }
       if(aFilterObject.id_pack_status != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.ID_PACK_STATUS = ?";
       }
        if (aFilterObject.statusName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                //*** whereStr = whereStr + "  UPPER(s.NAME) = UPPER(?)";
            	whereStr = whereStr + "  UPPER(p.STATUSNAME) = UPPER(?)";
            else
                //*** whereStr = whereStr + " UPPER(s.NAME) LIKE UPPER(?)";
            	whereStr = whereStr + " UPPER(p.STATUSNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.description != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.description.indexOf('*',0) < 0 && aFilterObject.description.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.DESCRIPTION) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.DESCRIPTION) LIKE UPPER(?)";
        }
       if(aFilterObject.power != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.POWER = ?";
       }
        if (aFilterObject.address != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.ADRES) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.ADRES) LIKE UPPER(?)";
        }
        if (aFilterObject.reg_num_cn_contract != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.reg_num_cn_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_cn_contract.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.REG_NUM_CN_CONTRACT) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.REG_NUM_CN_CONTRACT) LIKE UPPER(?)";
        }
       if(aFilterObject.date_cn_contract != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.DATE_CN_CONTRACT = ?";
       }
        if (aFilterObject.reg_num_tu_contract != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.reg_num_tu_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_contract.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.REG_NUM_TU_CONTRACT) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.REG_NUM_TU_CONTRACT) LIKE UPPER(?)";
        }
       if(aFilterObject.date_tu_contract != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.DATE_TU_CONTRACT = ?";
       }
        if (aFilterObject.reg_num_tu_cr_contract != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.reg_num_tu_cr_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_cr_contract.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.reg_num_tu_creation_contract) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.reg_num_tu_creation_contract) LIKE UPPER(?)";
        }
       if(aFilterObject.date_tu_cr_contract != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.date_tu_creation_contract = ?";
       }
        if (aFilterObject.project_num != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.project_num.indexOf('*',0) < 0 && aFilterObject.project_num.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.PROJECT_NUM) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.PROJECT_NUM) LIKE UPPER(?)";
        }
       if(aFilterObject.project_date != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.PROJECT_DATE = ?";
       }
       /*
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "CNPACK.SUBSYSTEMREFCODE = ? ";
       }
       */
     }



     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE " + whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        /*
    	if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }
        */
        if(aFilterObject.packCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.packCode);
        }

          if(aFilterObject.name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.id_ren != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id_ren);
        }

          if(aFilterObject.renName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.renName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.id_pack_status != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id_pack_status);
        }

          if(aFilterObject.statusName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.statusName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.description != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.description);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.power != null){
           number++;
           aFilterObject.power = aFilterObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.power);
       }

          if(aFilterObject.address != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.address);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.reg_num_cn_contract != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.reg_num_cn_contract);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.date_cn_contract != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.date_cn_contract.getTime()));
       }

          if(aFilterObject.reg_num_tu_contract != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.reg_num_tu_contract);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.date_tu_contract != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_contract.getTime()));
       }

          if(aFilterObject.reg_num_tu_cr_contract != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.reg_num_tu_cr_contract);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.date_tu_cr_contract != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_cr_contract.getTime()));
       }

          if(aFilterObject.project_num != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.project_num);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.project_date != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.project_date.getTime()));
       }
      /*
      if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.subsystemRef.code);
      }
      */
     }


     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }

       anObject = new CNPackShort();

       /*
       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       */
       anObject.packCode = set.getInt(1);
       if ( set.wasNull() )
           anObject.packCode = Integer.MIN_VALUE;
       anObject.name = set.getString(2);
       anObject.id_ren = set.getInt(3);
       if ( set.wasNull() )
           anObject.id_ren = Integer.MIN_VALUE;
       anObject.renName = set.getString(4);
       anObject.id_pack_status = set.getInt(5);
       if ( set.wasNull() )
           anObject.id_pack_status = Integer.MIN_VALUE;
       anObject.statusName = set.getString(6);
       anObject.description = set.getString(7);
       anObject.power = set.getBigDecimal(8);
       if(anObject.power != null)
           anObject.power = anObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.address = set.getString(9);
       anObject.reg_num_cn_contract = set.getString(10);
       anObject.date_cn_contract = set.getDate(11);
       anObject.reg_num_tu_contract = set.getString(12);
       anObject.date_tu_contract = set.getDate(13);
       anObject.reg_num_tu_cr_contract = set.getString(14);
       anObject.date_tu_cr_contract = set.getDate(15);
       anObject.project_num = set.getString(16);
       anObject.project_date = set.getDate(17);
       anObject.subsystemRefCode = set.getInt(18);
       if ( set.wasNull() )
           anObject.subsystemRefCode = Integer.MIN_VALUE;
       anObject.subsystemRefName = set.getString(19);
	   anObject.reg_num_spl_pp_contract = set.getString(20);

        result.list.add(anObject);
      }

     result.setTotalCount(i);
     return result;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return null;
    }
   finally
    {
     try {if (set != null) set.close();}             catch (SQLException e) {}
     try {if (statement != null) statement.close();} catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }

  @Override
public int[] getFilteredCodeArray(CNPackFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
  {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
  }


  @Override
public int[] getFilteredCodeArray(CNPack aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "";
    String     whereStr = "";

    if(aFilterObject.subsystemRef.code == Integer.MIN_VALUE) {
      aFilterObject.subsystemRef.code = CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER;
    }

    switch (aFilterObject.subsystemRef.code) {
	  case CNSubsystemType.SS_CONNECTION: //Присоединение I до 01.08.2010 г.
		{selectStr = "SELECT CNPACK.ID FROM CN.CN_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_NEWCONNECTION: //Присоединение II с 01.08.2010 г.
		{selectStr = "SELECT CNPACK.ID FROM CN.NCN_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение III с 14.03.2011 г.
		{selectStr = "SELECT CNPACK.ID FROM CN.CN_20110314_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение IV с 01.03.2013 г.
		{selectStr = "SELECT CNPACK.ID FROM CN.EAP_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_SUPPLY: //Поставка э/э
	    {selectStr = "SELECT CNPACK.ID FROM CN.SPL_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_TECHTERMS: //Согласование абонентских ТУ
	    {selectStr = "SELECT CNPACK.ID FROM CN.TTS_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_PHYSICALPERSON: //Поставка (быт)
	    {selectStr = "SELECT CNPACK.ID FROM CN.PP_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_CONSULTATIVECENTER: //Консультационный Центр
	    {selectStr = "SELECT CNPACK.ID FROM CN.CC_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_PLANTASK: //Планирование ремонтов электросетей
	    {selectStr = "SELECT CNPACK.ID FROM CN.PT_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_PLANSALEELECTRICPOWER: //Планирование задач энергосбыта
	    {selectStr = "SELECT CNPACK.ID FROM CN.PE_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_CONTROLQUALITY: //Контроль качества
	    {selectStr = "SELECT CNPACK.ID FROM CN.CC_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_JOINTSUPPLY: //Совместная поставка
	    {selectStr = "SELECT CNPACK.ID FROM CN.JS_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_REQUESTSLEGALSECTOR: //Обработка заявок юридических лиц
	    {selectStr = "SELECT CNPACK.ID FROM CN.RQ_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_LABOURPROTECTIONFIRESAFETY: //Охрана труда и пожарная безопасность
	    {selectStr = "SELECT CNPACK.ID FROM CN.LPFS_PACKAGES CNPACK";}
	  //case CNSubsystemType.SS_MAKEALTERATION: //Внесение изменений в ТУ
	  case CNSubsystemType.SS_REALIZATIONPURCHASES: //Осуществление годовых закупок
	    {selectStr = "SELECT CNPACK.ID FROM CN.RP_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_SPECFACILITESMOTORUSE: //Использование специальных средств и автотранспорта
	    {selectStr = "SELECT CNPACK.ID FROM CN.SM_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_ADMITTANCEORGANIZER: //Организатор доступа
	    {selectStr = "SELECT CNPACK.ID FROM CN.ADMIT_PACKAGES CNPACK";}
	  //case CNSubsystemType.SS_CHANGEBUSINESSPROCESS: //Изменение бизнес-процессов
	  case CNSubsystemType.SS_ELECTRICINSTALLATION: //Согласование проектов энергообеспечения электроустановок заказчиков
	    {selectStr = "SELECT CNPACK.ID FROM CN.EI_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_PREPARATIONOUTPUTDATA: //Подготовка выходных данных для ТЭО - Технико-Экономического Обоснования проекта */
	    {selectStr = "SELECT CNPACK.ID FROM CN.ODP_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_ELECTRICITYMETERING: //Установка ЛУСОД и АСКОЭ
	    {selectStr = "SELECT CNPACK.ID FROM CN.CEM_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_BUYSOLARENERGY: //Покупка солнечной ЭлектроЭнергии
	    {selectStr = "SELECT CNPACK.ID FROM CN.BSE_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_FIBEROPTICCOMJOINTSUSPENS: //Совместный подвес Волоконно-Оптических Линий Связи
	    {selectStr = "SELECT CNPACK.ID FROM CN.FOJ_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_REIMBURSEMENT: //Вынос электросетей
	    {selectStr = "SELECT CNPACK.ID FROM CN.RMB_PACKAGES CNPACK";}
	  //case CNSubsystemType.SS_ELECTRICITY_METER_EXAMINATION: //Экспертиза счётчиков электроэнергии
	  //  {selectStr = "SELECT CNPACK.ID FROM CN.EME_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_ENERGY_MARKET: //Договора ПАО "ЭК "ХерсонОблЭнерго" и ГосПредприятия "Энергорынок"
	    {selectStr = "SELECT CNPACK.ID FROM CN.MEC_PACKAGES CNPACK";}
	  case CNSubsystemType.SS_ACTS: // Акты нарушений ППЭЭ (быт и пром)
	    {selectStr = "SELECT CNPACK.ID FROM CN.ACTS_PACKAGES CNPACK";}
	  default:
		{
			{selectStr = "SELECT CNPACK.ID FROM CN.EAP_PACKAGES CNPACK";}
		}
    }

    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);


    if(orderBy.length() == 0)
     orderBy = "CNPACK.ID";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {

        if(aFilterObject.packCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID = ?";
        }

         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + "  UPPER(CNPACK.NAME) LIKE UPPER(?)";
         }

        if(aFilterObject.id_ren != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_REN = ?";
        }

         if (aFilterObject.renName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
               whereStr = whereStr + " CNPACK.ID_REN IN (SELECT ID FROM CN.CN_REN WHERE UPPER(NAME) = UPPER(?))";
             else whereStr = whereStr + " CNPACK.ID_REN IN (SELECT ID FROM CN.CN_REN WHERE UPPER(NAME) LIKE UPPER(?))";
         }

        if(aFilterObject.id_district != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_DISTRICT = ?";
        }
         if (aFilterObject.districtName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.districtName.indexOf('*',0) < 0 && aFilterObject.districtName.indexOf('?',0) < 0)
               whereStr = whereStr +
                 " CNPACK.ID_DISTRICT IN (SELECT ID FROM CN.DISTRICTS WHERE UPPER(NAME) = UPPER(?))";
             else whereStr = whereStr +
                 " CNPACK.ID_DISTRICT IN (SELECT ID FROM CN.DISTRICTS WHERE UPPER(NAME) LIKE UPPER(?))";
         }

         if(aFilterObject.id_pack_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_PACK_STATUS = ?";
         }

         if (aFilterObject.statusName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
               whereStr = whereStr +
                 " CNPACK.ID_PACK_STATUS IN (SELECT ID FROM CN.CN_PACK_STATUS WHERE UPPER(NAME) = UPPER(?))";
             else whereStr = whereStr +
                 " CNPACK.ID_PACK_STATUS IN (SELECT ID FROM CN.CN_PACK_STATUS WHERE UPPER(NAME) LIKE UPPER(?))";
         }

         if (aFilterObject.description != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";



             if (aFilterObject.subsystemRef.code == CNSubsystemType.SS_CONNECTION //Присоединение I до 01.08.2010 г.
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_NEWCONNECTION //Присоединение II с 01.08.2010 г.
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_SUPPLY //Поставка э/э
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_TECHTERMS //Согласование абонентских ТУ
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_PHYSICALPERSON //Поставка (быт)
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_CONSULTATIVECENTER //Консультационный Центр
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_JOINTSUPPLY //Совместная поставка
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_REQUESTSLEGALSECTOR //Обработка заявок юридических лиц
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_REALIZATIONPURCHASES //Осуществление годовых закупок
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_PREPARATIONOUTPUTDATA //Подготовка выходных данных для ТЭО - Технико-Экономического Обоснования проекта */
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_ELECTRICITYMETERING //Установка ЛУСОД и АСКОЭ
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_BUYSOLARENERGY //Покупка солнечной ЭлектроЭнергии
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_FIBEROPTICCOMJOINTSUSPENS //Совместный подвес Волоконно-Оптических Линий Связи
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_REIMBURSEMENT //Вынос электросетей
	       	 || aFilterObject.subsystemRef.code == CNSubsystemType.SS_ENERGY_MARKET //Договора ПАО "ЭК "ХерсонОблЭнерго" и ГосПредприятия "Энергорынок"
	       	 )
	       		{if (aFilterObject.description.indexOf('*',0) < 0 && aFilterObject.description.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(CNPACK.PURPOSE) = UPPER(?)";
                else whereStr = whereStr + "  UPPER(CNPACK.PURPOSE) LIKE (?)";
	       		}
             else
             if (aFilterObject.subsystemRef.code == CNSubsystemType.SS_CONNECTION_20110314 //Присоединение III с 14.03.2011 г.
    	     || aFilterObject.subsystemRef.code == CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER //Присоединение IV с 01.03.2013 г.
             || aFilterObject.subsystemRef.code == CNSubsystemType.SS_ELECTRICINSTALLATION //Согласование проектов энергообеспечения электроустановок заказчиков
    	     )
    	        {if (aFilterObject.description.indexOf('*',0) < 0 && aFilterObject.description.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(CNPACK.DESCRIPTION) = UPPER(?)";
                else whereStr = whereStr + "  UPPER(CNPACK.DESCRIPTION) LIKE (?)";
    	       	}
         }

        if (aFilterObject.power != null
          && aFilterObject.subsystemRef.code != CNSubsystemType.SS_PLANTASK //Планирование ремонтов электросетей
          && aFilterObject.subsystemRef.code != CNSubsystemType.SS_PLANSALEELECTRICPOWER //Планирование задач энергосбыта
          && aFilterObject.subsystemRef.code != CNSubsystemType.SS_CONTROLQUALITY //Контроль качества
          && aFilterObject.subsystemRef.code != CNSubsystemType.SS_REQUESTSLEGALSECTOR //Обработка заявок юридических лиц
          && aFilterObject.subsystemRef.code != CNSubsystemType.SS_LABOURPROTECTIONFIRESAFETY //Охрана труда и пожарная безопасность
          && aFilterObject.subsystemRef.code != CNSubsystemType.SS_SPECFACILITESMOTORUSE //Использование специальных средств и автотранспорта
          && aFilterObject.subsystemRef.code != CNSubsystemType.SS_ADMITTANCEORGANIZER //Организатор доступа
          && aFilterObject.subsystemRef.code != CNSubsystemType.SS_ACTS //Формирование актов нарушений Правил Пользования ЭлектроЭнергии
        )
         {if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + "  CNPACK.POWER <= ?";
         }

        if (aFilterObject.address != null
          && aFilterObject.subsystemRef.code != CNSubsystemType.SS_PLANTASK //Планирование ремонтов электросетей
		  && aFilterObject.subsystemRef.code != CNSubsystemType.SS_PLANSALEELECTRICPOWER //Планирование задач энергосбыта
          && aFilterObject.subsystemRef.code != CNSubsystemType.SS_CONTROLQUALITY //Контроль качества
          && aFilterObject.subsystemRef.code != CNSubsystemType.SS_LABOURPROTECTIONFIRESAFETY //Охрана труда и пожарная безопасность
		  && aFilterObject.subsystemRef.code != CNSubsystemType.SS_REALIZATIONPURCHASES //Осуществление годовых закупок
		  && aFilterObject.subsystemRef.code != CNSubsystemType.SS_SPECFACILITESMOTORUSE //Использование специальных средств и автотранспорта
          && aFilterObject.subsystemRef.code != CNSubsystemType.SS_ADMITTANCEORGANIZER //Организатор доступа
          && aFilterObject.subsystemRef.code != CNSubsystemType.SS_ACTS //Формирование актов нарушений Правил Пользования ЭлектроЭнергии
        )
           {
             if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
             if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(CNPACK.ADRES) = UPPER(?)";
             else whereStr = whereStr + "  UPPER(CNPACK.ADRES) LIKE UPPER(?)";
           }

         if (aFilterObject.address_jur != null
         && aFilterObject.subsystemRef.code != CNSubsystemType.SS_CONNECTION //Присоединение I до 01.08.2010 г.
         && aFilterObject.subsystemRef.code != CNSubsystemType.SS_NEWCONNECTION //Присоединение II с 01.08.2010 г.
         && aFilterObject.subsystemRef.code != CNSubsystemType.SS_CONNECTION_20110314 //Присоединение III с 14.03.2011 г.
         && aFilterObject.subsystemRef.code != CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER //Присоединение IV с 01.03.2013 г.
		 && aFilterObject.subsystemRef.code != CNSubsystemType.SS_PLANTASK //Планирование ремонтов электросетей
		 && aFilterObject.subsystemRef.code != CNSubsystemType.SS_PLANSALEELECTRICPOWER //Планирование задач энергосбыта
		 && aFilterObject.subsystemRef.code != CNSubsystemType.SS_CONTROLQUALITY //Контроль качества
		 && aFilterObject.subsystemRef.code != CNSubsystemType.SS_LABOURPROTECTIONFIRESAFETY //Охрана труда и пожарная безопасность
		 && aFilterObject.subsystemRef.code != CNSubsystemType.SS_REALIZATIONPURCHASES //Осуществление годовых закупок
		 && aFilterObject.subsystemRef.code != CNSubsystemType.SS_SPECFACILITESMOTORUSE //Использование специальных средств и автотранспорта
		 && aFilterObject.subsystemRef.code != CNSubsystemType.SS_ADMITTANCEORGANIZER //Организатор доступа
		 && aFilterObject.subsystemRef.code != CNSubsystemType.SS_ACTS //Формирование актов нарушений Правил Пользования ЭлектроЭнергии
         )
           {
             if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
             if (aFilterObject.address_jur.indexOf('*',0) < 0 && aFilterObject.address_jur.indexOf('?',0) < 0)
               whereStr = whereStr + " UPPER(CNPACK.ADRES_JUR) = UPPER(?)";
             else whereStr = whereStr + " UPPER(CNPACK.ADRES_JUR) LIKE UPPER(?)";
           }


         if (aFilterObject.subsystemRef.code == CNSubsystemType.SS_CONNECTION //Присоединение I до 01.08.2010 г.
           || aFilterObject.subsystemRef.code == CNSubsystemType.SS_NEWCONNECTION //Присоединение II с 01.08.2010 г.
           || aFilterObject.subsystemRef.code == CNSubsystemType.SS_CONNECTION_20110314 //Присоединение III с 14.03.2011 г.
           || aFilterObject.subsystemRef.code == CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER //Присоединение IV с 01.03.2013 г.
         )
         {
        	 if (aFilterObject.reg_num_cn_contract != null)
             {
                 if(whereStr.length() != 0)
                     whereStr = whereStr + " AND ";
                 if (aFilterObject.reg_num_cn_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_cn_contract.indexOf('?',0) < 0)
                   whereStr = whereStr + "  UPPER(CNPACK.REG_NUM_CN_CONTRACT) = UPPER(?)";
                 else whereStr = whereStr + "  UPPER(CNPACK.REG_NUM_CN_CONTRACT) LIKE UPPER(?)";
             }
             if (aFilterObject.date_cn_contract != null)
             {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "  CNPACK.DATE_CN_CONTRACT = ?";
             }

             if (aFilterObject.reg_num_tu_contract != null)
             {
                if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
                if (aFilterObject.reg_num_tu_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_contract.indexOf('?',0) < 0)
                  whereStr = whereStr + " UPPER(CNPACK.REG_NUM_TU_CONTRACT) = UPPER(?)";
                else whereStr = whereStr + " UPPER(CNPACK.REG_NUM_TU_CONTRACT) LIKE UPPER(?)";
             }

             if (aFilterObject.date_tu_contract != null) {
               if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
               whereStr = whereStr + "  CNPACK.DATE_TU_CONTRACT = ?";
             }

             if (aFilterObject.reg_num_tu_cr_contract != null
               && aFilterObject.subsystemRef.code != CNSubsystemType.SS_CONNECTION //Присоединение I до 01.08.2010 г.
             )
               {
                 if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                 if (aFilterObject.reg_num_tu_cr_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_cr_contract.indexOf('?',0) < 0)
                   whereStr = whereStr + " UPPER(CNPACK.REG_NUM_TU_CR_CONTRACT) = UPPER(?)";
                 else whereStr = whereStr + " UPPER(CNPACK.REG_NUM_TU_CR_CONTRACT) LIKE UPPER(?)";
               }

             if (aFilterObject.date_tu_cr_contract != null
               && aFilterObject.subsystemRef.code != CNSubsystemType.SS_CONNECTION //Присоединение I до 01.08.2010 г.
             )
               {
                 if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                 whereStr = whereStr + "  CNPACK.DATE_TU_CR_CONTRACT = ?";
               }

             if (aFilterObject.project_num != null)
               {
	             if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";
	             if (aFilterObject.project_num.indexOf('*',0) < 0 && aFilterObject.project_num.indexOf('?',0) < 0)
	                whereStr = whereStr + " UPPER(CNPACK.PROJECT_NUM) = UPPER(?)";
	             else whereStr = whereStr + " UPPER(CNPACK.PROJECT_NUM) LIKE UPPER(?)";
	           }

             if(aFilterObject.project_date != null)
               {
                 if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                 whereStr = whereStr + "  CNPACK.PROJECT_DATE = ?";
               }

         }

         if (aFilterObject.subsystemRef.code == CNSubsystemType.SS_SUPPLY //Поставка электроэнергии ЮРИДИЧЕСКОМУ
           || aFilterObject.subsystemRef.code == CNSubsystemType.SS_PHYSICALPERSON //и БЫТОВОМУ секторам
         )
         {
	        if (aFilterObject.reg_num_spl_pp_contract != null) {
	             if(whereStr.length() != 0)
	                 whereStr = whereStr + " AND ";
	             if (aFilterObject.reg_num_spl_pp_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_spl_pp_contract.indexOf('?',0) < 0)
	               whereStr = whereStr + "  UPPER(CNPACK.REG_NUM_SPL_CONTRACT) = UPPER(?)";
	             else whereStr = whereStr + "  UPPER(CNPACK.REG_NUM_SPL_CONTRACT) LIKE UPPER(?)";
	        }

	        if(aFilterObject.date_spl_pp_contract != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  CNPACK.DATE_SPL_CONTRACT = ?";
	        }
         }

        if (aFilterObject.over5 != Integer.MIN_VALUE
          && (aFilterObject.subsystemRef.code == CNSubsystemType.SS_CONNECTION //Присоединение I до 01.08.2010 г.
            || aFilterObject.subsystemRef.code == CNSubsystemType.SS_NEWCONNECTION //Присоединение II с 01.08.2010 г.
            || aFilterObject.subsystemRef.code == CNSubsystemType.SS_CONNECTION_20110314 //Присоединение III с 14.03.2011 г.
            || aFilterObject.subsystemRef.code == CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER) //Присоединение IV с 01.03.2013 г.
         )
            {
              if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
              whereStr = whereStr + "  CNPACK.OVER5 = ?";
            }

        if(aFilterObject.status != Integer.MIN_VALUE
		  && (aFilterObject.subsystemRef.code == CNSubsystemType.SS_CONNECTION //Присоединение I до 01.08.2010 г.
	        || aFilterObject.subsystemRef.code == CNSubsystemType.SS_NEWCONNECTION //Присоединение II с 01.08.2010 г.
	        || aFilterObject.subsystemRef.code == CNSubsystemType.SS_CONNECTION_20110314 //Присоединение III с 14.03.2011 г.
	        || aFilterObject.subsystemRef.code == CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER //Присоединение IV с 01.03.2013 г.
	        || aFilterObject.subsystemRef.code == CNSubsystemType.SS_TECHTERMS //Согласование абонентских Технических Условий
	        || aFilterObject.subsystemRef.code == CNSubsystemType.SS_SUPPLY //Поставка электроэнергии ЮРИДИЧЕСКОМУ
	        || aFilterObject.subsystemRef.code == CNSubsystemType.SS_PHYSICALPERSON //и БЫТОВОМУ секторам
	        || aFilterObject.subsystemRef.code == CNSubsystemType.SS_JOINTSUPPLY
	        || aFilterObject.subsystemRef.code == CNSubsystemType.SS_ACTS
	      )
        )
          {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.STATUS = ?";
          }



        if (aFilterObject.subsystemRef.code != CNSubsystemType.SS_PLANTASK
	      && aFilterObject.subsystemRef.code != CNSubsystemType.SS_PLANSALEELECTRICPOWER
	      && aFilterObject.subsystemRef.code != CNSubsystemType.SS_CONTROLQUALITY
	      && aFilterObject.subsystemRef.code != CNSubsystemType.SS_LABOURPROTECTIONFIRESAFETY
	      && aFilterObject.subsystemRef.code != CNSubsystemType.SS_REALIZATIONPURCHASES
	      && aFilterObject.subsystemRef.code != CNSubsystemType.SS_SPECFACILITESMOTORUSE
	      && aFilterObject.subsystemRef.code != CNSubsystemType.SS_ADMITTANCEORGANIZER
	      && aFilterObject.subsystemRef.code != CNSubsystemType.SS_ACTS
	    )
          {
        	if (aFilterObject.letter_num_customer != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.letter_num_customer.indexOf('*',0) < 0 && aFilterObject.letter_num_customer.indexOf('?',0) < 0)
                    whereStr = whereStr + " UPPER(CNPACK.LETTER_NUM_CUSTOMER) = UPPER(?)";
                else whereStr = whereStr + " UPPER(CNPACK.LETTER_NUM_CUSTOMER) LIKE UPPER(?)";
            }

            if(aFilterObject.date_letter_customer != null) {
               if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
               whereStr = whereStr + "  CNPACK.DATE_LETTER_CUSTOMER = ?";
            }

            if (aFilterObject.letter_num != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.letter_num.indexOf('*',0) < 0 && aFilterObject.letter_num.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(CNPACK.LETTER_NUM) = UPPER(?)";
                else whereStr = whereStr + "  UPPER(CNPACK.LETTER_NUM) LIKE UPPER(?)";
            }

            if(aFilterObject.date_letter != null) {
               if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
               whereStr = whereStr + "  CNPACK.DATE_LETTER = ?";
            }
          }




//         if (aFilterObject.reliability_class != null) {
//             if(whereStr.length() != 0)
//                 whereStr = whereStr + " AND ";
//             if (aFilterObject.reliability_class.indexOf('*',0) < 0 && aFilterObject.reliability_class.indexOf('?',0) < 0)
//                 whereStr = whereStr + "  CNPACK.RELIABILITY_CLASS = ?";
//             else
//                 whereStr = whereStr + "  CNPACK.RELIABILITY_CLASS LIKE ?";
//         }
//        if(aFilterObject.id_waiting_status != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.ID_WAITING_STATUS = ?";
//        }
//         if (aFilterObject.waitingStatus != null) {
//             if(whereStr.length() != 0)
//                 whereStr = whereStr + " AND ";
//             if (aFilterObject.waitingStatus.indexOf('*',0) < 0 && aFilterObject.waitingStatus.indexOf('?',0) < 0)
//                 whereStr = whereStr + "  CNPACK.WAITINGSTATUS = ?";
//             else
//                 whereStr = whereStr + "  CNPACK.WAITINGSTATUS LIKE ?";
//         }
//        if(aFilterObject.is_payable != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.IS_PAYABLE = ?";
//        }
//         if (aFilterObject.worksize != null) {
//             if(whereStr.length() != 0)
//                 whereStr = whereStr + " AND ";
//             if (aFilterObject.worksize.indexOf('*',0) < 0 && aFilterObject.worksize.indexOf('?',0) < 0)
//                 whereStr = whereStr + "  CNPACK.WORKSIZE = ?";
//             else
//                 whereStr = whereStr + "  CNPACK.WORKSIZE LIKE ?";
//         }
//         if (aFilterObject.work_inc_net != null) {
//             if(whereStr.length() != 0)
//                 whereStr = whereStr + " AND ";
//             if (aFilterObject.work_inc_net.indexOf('*',0) < 0 && aFilterObject.work_inc_net.indexOf('?',0) < 0)
//                 whereStr = whereStr + "  CNPACK.WORK_INC_NET = ?";
//             else
//                 whereStr = whereStr + "  CNPACK.WORK_INC_NET LIKE ?";
//         }
//         if (aFilterObject.business_type != null) {
//             if(whereStr.length() != 0)
//                 whereStr = whereStr + " AND ";
//             if (aFilterObject.business_type.indexOf('*',0) < 0 && aFilterObject.business_type.indexOf('?',0) < 0)
//                 whereStr = whereStr + "  CNPACK.BUSINESS_TYPE = ?";
//             else
//                 whereStr = whereStr + "  CNPACK.BUSINESS_TYPE LIKE ?";
//         }
//        if(aFilterObject.estimateterm != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.ESTIMATETERM = ?";
//        }
//        if(aFilterObject.estimatedate != null) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.ESTIMATEDATE = ?";
//        }
//        if(aFilterObject.buildingterm != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.BUILDINGTERM = ?";
//        }
//        if(aFilterObject.buildingdate != null) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.BUILDINGDATE = ?";
//        }
//        if(aFilterObject.buyingterm != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.BUYINGTERM = ?";
//        }
//        if(aFilterObject.buyingdate != null) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.BUYINGDATE = ?";
//        }
//         if (aFilterObject.estimate_num != null) {
//             if(whereStr.length() != 0)
//                 whereStr = whereStr + " AND ";
//             if (aFilterObject.estimate_num.indexOf('*',0) < 0 && aFilterObject.estimate_num.indexOf('?',0) < 0)
//                 whereStr = whereStr + "  CNPACK.ESTIMATE_NUM = ?";
//             else
//                 whereStr = whereStr + "  CNPACK.ESTIMATE_NUM LIKE ?";
//         }
//        if(aFilterObject.estimate_contract_date != null) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.ESTIMATE_CONTRACT_DATE = ?";
//        }
//        if(aFilterObject.is_reserv != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.IS_RESERV = ?";
//        }
//         if (aFilterObject.purpose != null) {
//             if(whereStr.length() != 0)
//                 whereStr = whereStr + " AND ";
//             if (aFilterObject.purpose.indexOf('*',0) < 0 && aFilterObject.purpose.indexOf('?',0) < 0)
//                 whereStr = whereStr + "  CNPACK.PURPOSE = ?";
//             else
//                 whereStr = whereStr + "  CNPACK.PURPOSE LIKE ?";
//         }
//        if(aFilterObject.is_ksoe != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.IS_KSOE = ?";
//        }
//        if(aFilterObject.over150 != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.OVER150 = ?";
//        }
//        if(aFilterObject.is_new != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.IS_NEW = ?";
//        }
//        if(aFilterObject.is3phases != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + "  CNPACK.IS3PHASES = ?";
//        }
//
//        if(aFilterObject.airLine04Ref.code != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + " CNPACK.AIRLINE04REFCODE = ? ";
//        }
//        if(aFilterObject.cableLine04Ref.code != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + " CNPACK.CABLELINE04REFCODE = ? ";
//        }
//        if(aFilterObject.trRef.code != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + " CNPACK.TRREFCODE = ? ";
//        }
//        if(aFilterObject.s04Ref.code != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + " CNPACK.S04REFCODE = ? ";
//        }
//        if(aFilterObject.airLine10Ref.code != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + " CNPACK.AIRLINE10REFCODE = ? ";
//        }
//        if(aFilterObject.cableLine10Ref.code != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + " CNPACK.CABLELINE10REFCODE = ? ";
//        }
//        if(aFilterObject.s35Ref.code != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + " CNPACK.S35REFCODE = ? ";
//        }
//        if(aFilterObject.airLine150Ref.code != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + " CNPACK.AIRLINE150REFCODE = ? ";
//        }
//        if(aFilterObject.cableLine150Ref.code != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + " CNPACK.CABLELINE150REFCODE = ? ";
//        }
//        if(aFilterObject.s150Ref.code != Integer.MIN_VALUE) {
//            if(whereStr.length() != 0)
//               whereStr = whereStr + " AND ";
//            whereStr = whereStr + " CNPACK.S150REFCODE = ? ";
//        }

      }






      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";
         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE " + whereStr;

    selectStr = selectStr + " ORDER BY " + orderBy;

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;
      if(aFilterObject != null){
         if(aFilterObject.code != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.code);
         }
         if(aFilterObject.packCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.packCode);
         }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.NAME = ?";
             else
                 whereStr = whereStr + " CNPACK.NAME LIKE ?";

           if(aFilterObject.name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_ren != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_ren);
         }
         if (aFilterObject.renName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.RENNAME = ?";
             else
                 whereStr = whereStr + " CNPACK.RENNAME LIKE ?";

           if(aFilterObject.renName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.renName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_district != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_district);
         }
         if (aFilterObject.districtName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.districtName.indexOf('*',0) < 0 && aFilterObject.districtName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.DISTRICTNAME = ?";
             else
                 whereStr = whereStr + " CNPACK.DISTRICTNAME LIKE ?";

           if(aFilterObject.districtName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.districtName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_pack_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_pack_status);
         }
         if (aFilterObject.statusName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.STATUSNAME = ?";
             else
                 whereStr = whereStr + " CNPACK.STATUSNAME LIKE ?";

           if(aFilterObject.statusName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.statusName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.description != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.description.indexOf('*',0) < 0 && aFilterObject.description.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.DESCRIPTION = ?";
             else
                 whereStr = whereStr + " CNPACK.DESCRIPTION LIKE ?";

           if(aFilterObject.description != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.description);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.power != null){
            number++;
            aFilterObject.power = aFilterObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power);
        }
         if (aFilterObject.address != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.ADDRESS = ?";
             else
                 whereStr = whereStr + " CNPACK.ADDRESS LIKE ?";

           if(aFilterObject.address != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.address_jur != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.address_jur.indexOf('*',0) < 0 && aFilterObject.address_jur.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.ADDRESS_JUR = ?";
             else
                 whereStr = whereStr + " CNPACK.ADDRESS_JUR LIKE ?";

           if(aFilterObject.address_jur != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address_jur);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.reg_num_cn_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reg_num_cn_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_cn_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.REG_NUM_CN_CONTRACT = ?";
             else
                 whereStr = whereStr + " CNPACK.REG_NUM_CN_CONTRACT LIKE ?";

           if(aFilterObject.reg_num_cn_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_cn_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_cn_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_cn_contract.getTime()));
        }
         if (aFilterObject.reg_num_spl_pp_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reg_num_spl_pp_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_spl_pp_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.REG_NUM_SPL_PP_CONTRCT = ?";
             else
                 whereStr = whereStr + " CNPACK.REG_NUM_SPL_PP_CONTRCT LIKE ?";

           if(aFilterObject.reg_num_spl_pp_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_spl_pp_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_spl_pp_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_spl_pp_contract.getTime()));
        }
         if (aFilterObject.reg_num_tu_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reg_num_tu_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.REG_NUM_TU_CONTRACT = ?";
             else
                 whereStr = whereStr + " CNPACK.REG_NUM_TU_CONTRACT LIKE ?";

           if(aFilterObject.reg_num_tu_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_tu_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_tu_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_contract.getTime()));
        }
         if (aFilterObject.reg_num_tu_cr_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reg_num_tu_cr_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_cr_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.REG_NUM_TU_CR_CONTRACT = ?";
             else
                 whereStr = whereStr + " CNPACK.REG_NUM_TU_CR_CONTRACT LIKE ?";

           if(aFilterObject.reg_num_tu_cr_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_tu_cr_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_tu_cr_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_cr_contract.getTime()));
        }
         if (aFilterObject.project_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.project_num.indexOf('*',0) < 0 && aFilterObject.project_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.PROJECT_NUM = ?";
             else
                 whereStr = whereStr + " CNPACK.PROJECT_NUM LIKE ?";

           if(aFilterObject.project_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.project_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.project_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.project_date.getTime()));
        }
         if(aFilterObject.over5 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.over5);
         }
         if(aFilterObject.status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.status);
         }
         if (aFilterObject.letter_num_customer != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.letter_num_customer.indexOf('*',0) < 0 && aFilterObject.letter_num_customer.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.LETTER_NUM_CUSTOMER = ?";
             else
                 whereStr = whereStr + " CNPACK.LETTER_NUM_CUSTOMER LIKE ?";

           if(aFilterObject.letter_num_customer != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.letter_num_customer);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_letter_customer != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_letter_customer.getTime()));
        }
         if (aFilterObject.letter_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.letter_num.indexOf('*',0) < 0 && aFilterObject.letter_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.LETTER_NUM = ?";
             else
                 whereStr = whereStr + " CNPACK.LETTER_NUM LIKE ?";

           if(aFilterObject.letter_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.letter_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_letter != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_letter.getTime()));
        }
         if (aFilterObject.reliability_class != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reliability_class.indexOf('*',0) < 0 && aFilterObject.reliability_class.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.RELIABILITY_CLASS = ?";
             else
                 whereStr = whereStr + " CNPACK.RELIABILITY_CLASS LIKE ?";

           if(aFilterObject.reliability_class != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reliability_class);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_waiting_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_waiting_status);
         }
         if (aFilterObject.waitingStatus != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.waitingStatus.indexOf('*',0) < 0 && aFilterObject.waitingStatus.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.WAITINGSTATUS = ?";
             else
                 whereStr = whereStr + " CNPACK.WAITINGSTATUS LIKE ?";

           if(aFilterObject.waitingStatus != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.waitingStatus);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.is_payable != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_payable);
         }
         if (aFilterObject.worksize != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.worksize.indexOf('*',0) < 0 && aFilterObject.worksize.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.WORKSIZE = ?";
             else
                 whereStr = whereStr + " CNPACK.WORKSIZE LIKE ?";

           if(aFilterObject.worksize != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.worksize);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.work_inc_net != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.work_inc_net.indexOf('*',0) < 0 && aFilterObject.work_inc_net.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.WORK_INC_NET = ?";
             else
                 whereStr = whereStr + " CNPACK.WORK_INC_NET LIKE ?";

           if(aFilterObject.work_inc_net != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.work_inc_net);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.business_type != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.business_type.indexOf('*',0) < 0 && aFilterObject.business_type.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.BUSINESS_TYPE = ?";
             else
                 whereStr = whereStr + " CNPACK.BUSINESS_TYPE LIKE ?";

           if(aFilterObject.business_type != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.business_type);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.estimateterm != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.estimateterm);
         }
        if(aFilterObject.estimatedate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.estimatedate.getTime()));
        }
         if(aFilterObject.buildingterm != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.buildingterm);
         }
        if(aFilterObject.buildingdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.buildingdate.getTime()));
        }
         if(aFilterObject.buyingterm != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.buyingterm);
         }
        if(aFilterObject.buyingdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.buyingdate.getTime()));
        }
         if (aFilterObject.estimate_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.estimate_num.indexOf('*',0) < 0 && aFilterObject.estimate_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.ESTIMATE_NUM = ?";
             else
                 whereStr = whereStr + " CNPACK.ESTIMATE_NUM LIKE ?";

           if(aFilterObject.estimate_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.estimate_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.estimate_contract_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.estimate_contract_date.getTime()));
        }
         if(aFilterObject.is_reserv != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_reserv);
         }
         if (aFilterObject.purpose != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.purpose.indexOf('*',0) < 0 && aFilterObject.purpose.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.PURPOSE = ?";
             else
                 whereStr = whereStr + " CNPACK.PURPOSE LIKE ?";

           if(aFilterObject.purpose != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.purpose);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.is_ksoe != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_ksoe);
         }
         if(aFilterObject.over150 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.over150);
         }
         if(aFilterObject.is_new != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_new);
         }
         if(aFilterObject.is3phases != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is3phases);
         }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }
       if(aFilterObject.airLine04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine04Ref.code);
       }
       if(aFilterObject.cableLine04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine04Ref.code);
       }
       if(aFilterObject.trRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trRef.code);
       }
       if(aFilterObject.s04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s04Ref.code);
       }
       if(aFilterObject.airLine10Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine10Ref.code);
       }
       if(aFilterObject.cableLine10Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine10Ref.code);
       }
       if(aFilterObject.s35Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s35Ref.code);
       }
       if(aFilterObject.airLine150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine150Ref.code);
       }
       if(aFilterObject.cableLine150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine150Ref.code);
       }
       if(aFilterObject.s150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s150Ref.code);
       }
      }

      if(condition.length() > 0 && aBindObjects != null)
       _bindObjectsToPreparedStatement(statement,aBindObjects,number);

      set = statement.executeQuery();
      int i;
      for(i = 0;set.next();i++)
       {
        if(i < fromPosition)
         continue;
        else if(i >= fromPosition + quantity)
         {
          i++;
          break;
         }

        result.add(new Integer(set.getInt(1)));
       }

      int[] array;

      array = new int[result.size()];
      for(int j = 0;j < result.size();j++)
       array[j] = ((Integer)result.get(j)).intValue();

      return array;
     }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return null;
     }
    finally
     {
      try {if (set != null) set.close();}             catch (SQLException e) {}
      try {if (statement != null) statement.close();} catch (SQLException e) {}
      if(connection != super.getConnection())
       {
        try{connection.close();} catch(SQLException e){}
       }
     }


    } // end of getFilteredCodeArray



  /* CNPack(EnergyWorkflow). Получить список пакетов подсистем
   * ПРИСОЕДИНЕНИЕ до и после 01.08.2010, с 14.03.2011 по фильтру с текущими состояниями */
  public CNPackShortList getCNPackCurStateList(CNPackFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
  {
	   CNPackShortList result = new CNPackShortList();
	   CNPackShort anObject;
	   result.list = new Vector();

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   ResultSet  set = null;

	   String     whereStr = "";
	   String     condition = (aFilterObject.conditionSQL == null  ? "" : aFilterObject.conditionSQL);
	   String     orderBy = (aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL );

	   if(quantity < 0)
	     quantity = Integer.MAX_VALUE/2;

	   if(orderBy.length() == 0)

		 orderBy = "p.subsystemcode desc, p.id";

	   if(getUserProfile() == null)
	    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	   selectStr =
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , p.renname \n" +
		   " , p.id_pack_status    \n" +
		   " , p.statusname \n" +
		   " , p.description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +
		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , p.reg_num_tu_creation_contract    \n" +
		   " , p.date_tu_creation_contract    \n" +
		   " , p.project_num    \n" +
		   " , p.project_date   \n" +
		   " , p.subsystemcode \n" +
		   " , p.subsystemname \n" +
		   " , p.cur_state \n" +

		   " , p.is_reserv \n" +
		   " , p.is_finish_supply \n" +
		   " , p.is_realized \n" +
		   " , p.pow_exist \n" +
		   " , p.tension_point \n" +
		   " , p.tension_exist \n" +
		   " , p.current_automat \n" +
		   " , coalesce(p.id_proposal, 0) as id_proposal \n" +

		   " , p.is_registration \n" +

		   " FROM  \n" +
		   " ( \n" +
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , r.name as renname \n" +
		   " , p.id_pack_status    \n" +
		   " , s.name as statusname \n" +
		   " , null as description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +
		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , p.reg_num_tu_creation_contract    \n" +
		   " , p.date_tu_creation_contract    \n" +
		   " , p.project_num    \n" +
		   " , p.project_date   \n" +
		   " , " + CNSubsystemType.SS_CONNECTION + " as subsystemcode \n" +
		   " , 'Присоединение' as subsystemname \n" +
		   " , (select cn.group_concat(s.name, '; ') from cn.cn_states s where id in \n" +
		   "     (select id_state from cn.cn_movement where id_movement_status = 1 \n" +
		   "      and id_pack = p.id) \n" +
		   "   ) as cur_state \n" +

		   " , coalesce(p.is_reserv, 0) as is_reserv \n" +

		   " , case \n" +
		   "     when exists (select spl.id from cn.spl_packages spl \n" +
		   "       where spl.id_pack_status = 2 \n" +
		   "       and spl.id in (select sc.id_spl_pack from cn.spl2cn sc \n" +
		   "         where sc.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION + " and sc.id_cn_pack = p.id)) \n" +
		   "     or exists (select pp.id from cn.pp_packages pp \n" +
		   "       where pp.id_pack_status = 2 \n" +
		   "       and pp.id in (select pc.id_pp_pack from cn.pp2cn pc \n" +
		   "         where pc.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION + " and pc.id_cn_pack = p.id)) \n" +
		   "     then 1 \n" +
		   "     else 0 \n" +
		   "   end as is_finish_supply \n" +

		   " , coalesce((select is_realized from cn.cn_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as is_realized \n" +
		   " , coalesce((select pow_exist from cn.cn_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as pow_exist \n" +
		   " , coalesce((select tension_point from cn.cn_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as tension_point \n" +
		   " , coalesce((select tension_exist from cn.cn_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as tension_exist \n" +
		   " , coalesce((select current_automat from cn.cn_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as current_automat \n" +

		   " , (select id_proposal from cn.cn_techterms t where t.id_pack = p.id \n" +
		   "   ) as id_proposal \n" +

		   " , case \n" +
		   "     when p.id_pack_status not in (3, 4) or p.is_reserv = 1 \n" +
		   "       then 1 \n" +
		   "     when p.id in (select id_pack from cn.cn_movement \n" +
		   "	     where id_state in (1000329, 1000344, 2000189, 1000395, \n" +
		   "		   1000401, 1000462, 200135, 100118, 100320, 100167, 100161, 100225, \n " +
		   "		   1188, 100338, 2070, 1166, 4088, 1160, 1213, 1000540, 1000334, 4089, \n " +
		   "		   1189, 1170, 100302, 1164, 2071, 1161, 1001443, 1163, 1001439, 1167, 1001536, \n " +
		   "		   1001542, 1001515, 1001521, 1000496, 1000599, 1000282, 1500) and id_movement_status = 1) \n" +
		   "       then 1 \n" +
		   "     else 0 \n" +
		   "   end as is_registration \n" +

		   " FROM cn.cn_packages p, cn.cn_ren r, cn.cn_pack_status s  \n" +
		   " where p.id_ren = r.id and p.id_pack_status <> 1000 and p.id_pack_status = s.id \n" +

		   " union all \n" +
		   "  \n" +
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , r.name as renname \n" +
		   " , p.id_pack_status    \n" +
		   " , s.name as statusname \n" +
		   " , null as description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +
		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , p.reg_num_tu_creation_contract    \n" +
		   " , p.date_tu_creation_contract    \n" +
		   " , p.project_num    \n" +
		   " , p.project_date   \n" +
		   " , " + CNSubsystemType.SS_NEWCONNECTION + " as subsystemcode \n" +
		   " , 'Присоединение с 01.08.2010' as subsystemname \n" +
		   " , (select cn.group_concat(s.name, '; ') from cn.ncn_states s where id in \n" +
		   "     (select id_state from cn.ncn_movement where id_movement_status = 1 \n" +
		   "      and id_pack = p.id) \n" +
		   "   ) as cur_state \n" +

		   " , coalesce(p.is_reserv, 0) as is_reserv \n" +

		   " , case \n" +
		   "     when exists (select spl.id from cn.spl_packages spl \n" +
		   "       where spl.id_pack_status = 2 \n" +
		   "       and spl.id in (select sc.id_spl_pack from cn.spl2cn sc \n" +
		   "         where sc.id_subsystem_cn = " + CNSubsystemType.SS_NEWCONNECTION + " and sc.id_cn_pack = p.id)) \n" +
		   "     or exists (select pp.id from cn.pp_packages pp \n" +
		   "       where pp.id_pack_status = 2 \n" +
		   "       and pp.id in (select pc.id_pp_pack from cn.pp2cn pc \n" +
		   "         where pc.id_subsystem_cn = " + CNSubsystemType.SS_NEWCONNECTION + " and pc.id_cn_pack = p.id)) \n" +
		   "     then 1 \n" +
		   "     else 0 \n" +
		   "   end as is_finish_supply \n" +

		   " , coalesce((select is_realized from cn.ncn_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as is_realized \n" +
		   " , coalesce((select pow_exist from cn.ncn_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as pow_exist \n" +
		   " , coalesce((select tension_point from cn.ncn_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as tension_point \n" +
		   " , coalesce((select tension_exist from cn.ncn_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as tension_exist \n" +
		   " , coalesce((select current_automat from cn.ncn_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as current_automat \n" +

		   " , (select id_proposal from cn.ncn_techterms t where t.id_pack = p.id \n" +
           "   ) as id_proposal \n" +

		   " , case \n" +
		   "     when p.id_pack_status not in (3, 4) or p.is_reserv = 1 \n" +
		   "       then 1 \n" +
		   "     when p.id in (select id_pack from cn.ncn_movement \n" +
		   "	     where id_state in (1000344, 1500, 1000334, 1001515, 1001521, " +
		   "		   1001439, 1001443, 1000496, 1000599, 2000189, 1001542, 1001536, 1000462, " +
		   "		   1000329, 1000401, 1000395, 1000540, 1000282) and id_movement_status = 1) \n" +
		   "       then 1 \n" +
		   "     else 0 \n" +
		   "   end as is_registration \n" +

		   " FROM cn.ncn_packages p, cn.cn_ren r, cn.cn_pack_status s  \n" +
		   " where p.id_ren = r.id and p.id_pack_status <> 1000 and p.id_pack_status = s.id \n" +

		   " union all \n" +
		   "  \n" +
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , r.name as renname \n" +
		   " , p.id_pack_status    \n" +
		   " , s.name as statusname \n" +
		   " , p.description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +
		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , p.reg_num_tu_creation_contract    \n" +
		   " , p.date_tu_creation_contract    \n" +
		   " , p.project_num    \n" +
		   " , p.project_date   \n" +
		   " , " + CNSubsystemType.SS_CONNECTION_20110314 + " as subsystemcode \n" +
		   " , 'Присоединение с 14.03.2011' as subsystemname \n" +
		   " , (select cn.group_concat(s.name, '; ') from cn.cn_20110314_states s where id in \n" +
		   "     (select id_state from cn.cn_20110314_movement where id_movement_status = 1 \n" +
		   "      and id_pack = p.id) \n" +
		   "   ) as cur_state \n" +

		   " , coalesce(p.is_reserv, 0) as is_reserv \n" +

		   " , case \n" +
		   "     when exists (select spl.id from cn.spl_packages spl \n" +
		   "       where spl.id_pack_status = 2 \n" +
		   "       and spl.id in (select sc.id_spl_pack from cn.spl2cn sc \n" +
		   "         where sc.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION_20110314 + " and sc.id_cn_pack = p.id)) \n" +
		   "     or exists (select pp.id from cn.pp_packages pp \n" +
		   "       where pp.id_pack_status = 2 \n" +
		   "       and pp.id in (select pc.id_pp_pack from cn.pp2cn pc \n" +
		   "         where pc.id_subsystem_cn = " + CNSubsystemType.SS_CONNECTION_20110314 + " and pc.id_cn_pack = p.id)) \n" +
		   "     then 1 \n" +
		   "     else 0 \n" +
		   "   end as is_finish_supply \n" +

		   " , coalesce((select is_realized from cn.cn_20110314_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as is_realized \n" +
		   " , coalesce((select pow_exist from cn.cn_20110314_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as pow_exist \n" +
		   " , coalesce((select tension_point from cn.cn_20110314_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as tension_point \n" +
		   " , coalesce((select tension_exist from cn.cn_20110314_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as tension_exist \n" +
		   " , coalesce((select current_automat from cn.cn_20110314_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as current_automat \n" +

		   " , (select id_proposal from cn.cn_20110314_techterms t where t.id_pack = p.id \n" +
		   "   ) as id_proposal \n" +

		   " , case \n" +
		   "     when exists(select distinct(id_pack) from cn.cn_20110314_movement \n" +
		   "           where is_completed = 1 and id_state in (1000150, 1000158, 2000034, 2000041) \n" +
		   "           and id_pack = p.id) \n" +
		   "		 or coalesce(p.reg_num_tu_contract, '') <> '' \n" +
		   "       then 1 \n" +
		   "     else 0 \n" +
		   "   end as is_registration \n" +

		   " FROM cn.cn_20110314_packages p, cn.cn_ren r, cn.cn_pack_status s  \n" +
		   " where p.id_ren = r.id and p.id_pack_status <> 1000 and p.id_pack_status = s.id \n" +

		   " union all \n" +
		   "  \n" +
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , r.name as renname \n" +
		   " , p.id_pack_status    \n" +
		   " , s.name as statusname \n" +
		   " , p.description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +
		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , p.reg_num_tu_creation_contract    \n" +
		   " , p.date_tu_creation_contract    \n" +
		   " , p.project_num    \n" +
		   " , p.project_date   \n" +
		   " , " + CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER + " as subsystemcode \n" +
		   " , 'Присоединение с 01.03.2013' as subsystemname \n" +
		   " , (select cn.group_concat(s.name, '; ') from cn.eap_states s where id in \n" +
		   "     (select id_state from cn.eap_movement where id_movement_status = 1 \n" +
		   "      and id_pack = p.id) \n" +
		   "   ) as cur_state \n" +

		   " , coalesce(p.is_reserv, 0) \n" +

		   " , case \n" +
		   "     when exists (select spl.id from cn.spl_packages spl \n" +
		   "       where spl.id_pack_status = 2 \n" +
		   "       and spl.id in (select sc.id_spl_pack from cn.spl2cn sc \n" +
		   "         where sc.id_subsystem_cn = " + CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER + " and sc.id_cn_pack = p.id)) \n" +
		   "     or exists (select pp.id from cn.pp_packages pp \n" +
		   "       where pp.id_pack_status = 2 \n" +
		   "       and pp.id in (select pc.id_pp_pack from cn.pp2cn pc \n" +
		   "         where pc.id_subsystem_cn = " + CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER + " and pc.id_cn_pack = p.id)) \n" +
		   "     then 1 \n" +
		   "     else 0 \n" +
		   "   end as is_finish_supply \n" +

		   " , coalesce((select is_realized from cn.eap_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as is_realized \n" +
		   " , coalesce((select pow_exist from cn.eap_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as pow_exist \n" +
		   " , coalesce((select tension_point from cn.eap_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as tension_point \n" +
		   " , coalesce((select tension_exist from cn.eap_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as tension_exist \n" +
		   " , coalesce((select current_automat from cn.eap_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as current_automat \n" +

		   " , (select id_proposal from cn.eap_techterms t where t.id_pack = p.id \n" +
		   "   ) as id_proposal \n" +

		   " , case \n" +
		   "     when exists(select distinct(id_pack) from cn.eap_movement \n" +
		   "           where is_completed = 1 and id_state in (1050028, 1050032, 1070026, 1070030, 2050011, 2050014) \n" +
		   "           and id_pack = p.id) \n" +
		   "		 or coalesce(p.reg_num_tu_contract, '') <> '' \n" +
		   "       then 1 \n" +
		   "     else 0 \n" +
		   "   end as is_registration \n" +

		   " FROM cn.eap_packages p, cn.cn_ren r, cn.cn_pack_status s  \n" +
		   " where p.id_ren = r.id and p.id_pack_status <> 1000 and p.id_pack_status = s.id \n" +
		   
		   " union all \n" +
		   "  \n" +
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , r.name as renname \n" +
		   " , p.id_pack_status    \n" +
		   " , s.name as statusname \n" +
		   " , p.description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +
		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , p.reg_num_tu_creation_contract    \n" +
		   " , p.date_tu_creation_contract    \n" +
		   " , p.project_num    \n" +
		   " , p.project_date   \n" +
		   " , " + CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER + " as subsystemcode \n" +
		   " , 'Присоединение с 19.04.2018' as subsystemname \n" +
		   " , (select cn.group_concat(s.name, '; ') from cn.adso_states s where id in \n" +
		   "     (select id_state from cn.adso_movement where id_movement_status = 1 \n" +
		   "      and id_pack = p.id) \n" +
		   "   ) as cur_state \n" +

		   " , coalesce(p.is_reserv, 0) \n" +

		   " , case \n" +
		   "     when exists (select spl.id from cn.spl_packages spl \n" +
		   "       where spl.id_pack_status = 2 \n" +
		   "       and spl.id in (select sc.id_spl_pack from cn.spl2cn sc \n" +
		   "         where sc.id_subsystem_cn = " + CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER + " and sc.id_cn_pack = p.id)) \n" +
		   "     or exists (select pp.id from cn.pp_packages pp \n" +
		   "       where pp.id_pack_status = 2 \n" +
		   "       and pp.id in (select pc.id_pp_pack from cn.pp2cn pc \n" +
		   "         where pc.id_subsystem_cn = " + CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER + " and pc.id_cn_pack = p.id)) \n" +
		   "     then 1 \n" +
		   "     else 0 \n" +
		   "   end as is_finish_supply \n" +

		   " , coalesce((select is_realized from cn.adso_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as is_realized \n" +
		   " , coalesce((select pow_exist from cn.adso_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as pow_exist \n" +
		   " , coalesce((select tension_point from cn.adso_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as tension_point \n" +
		   " , coalesce((select tension_exist from cn.adso_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as tension_exist \n" +
		   " , coalesce((select current_automat from cn.adso_techterms t where t.id_pack = p.id \n" +
		   "   ), 0) as current_automat \n" +

		   " , (select id_proposal from cn.adso_techterms t where t.id_pack = p.id \n" +
		   "   ) as id_proposal \n" +

		   " , case \n" +
		   "     when exists(select distinct(id_pack) from cn.adso_movement \n" +
		   "           where is_completed = 1 and id_state in (13, 25, 125, 127, 162, 163) \n" +
		   "           and id_pack = p.id) \n" +
		   "		 or coalesce(p.reg_num_tu_contract, '') <> '' \n" +
		   "       then 1 \n" +
		   "     else 0 \n" +
		   "   end as is_registration \n" +

		   " FROM cn.adso_packages p, cn.cn_ren r, cn.cn_pack_status s  \n" +
		   " where p.id_ren = r.id and p.id_pack_status <> 1000 and p.id_pack_status = s.id \n" +
		   
		   " ) as p ";

     if(aFilterObject != null)
     {
       /*
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  CNPACK.CODE = ?";
       }
       */
       if(aFilterObject.packCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.id = ?";
       }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.id_ren != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.ID_REN = ?";
       }
        if (aFilterObject.renName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                //*** whereStr = whereStr + "  UPPER(r.NAME) = UPPER(?)";
            	whereStr = whereStr + "  UPPER(p.RENNAME) = UPPER(?)";
            else
                //*** whereStr = whereStr + " UPPER(r.NAME) LIKE UPPER(?)";
            	whereStr = whereStr + " UPPER(p.RENNAME) LIKE UPPER(?)";
        }
       if(aFilterObject.id_pack_status != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.ID_PACK_STATUS = ?";
       }
        if (aFilterObject.statusName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                //*** whereStr = whereStr + "  UPPER(s.NAME) = UPPER(?)";
            	whereStr = whereStr + "  UPPER(p.STATUSNAME) = UPPER(?)";
            else
                //*** whereStr = whereStr + " UPPER(s.NAME) LIKE UPPER(?)";
            	whereStr = whereStr + " UPPER(p.STATUSNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.description != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.description.indexOf('*',0) < 0 && aFilterObject.description.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.DESCRIPTION) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.DESCRIPTION) LIKE UPPER(?)";
        }
       if(aFilterObject.power != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.POWER = ?";
       }
        if (aFilterObject.address != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.ADRES) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.ADRES) LIKE UPPER(?)";
        }
        if (aFilterObject.reg_num_cn_contract != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.reg_num_cn_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_cn_contract.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.REG_NUM_CN_CONTRACT) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.REG_NUM_CN_CONTRACT) LIKE UPPER(?)";
        }
       if(aFilterObject.date_cn_contract != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.DATE_CN_CONTRACT = ?";
       }
        if (aFilterObject.reg_num_tu_contract != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.reg_num_tu_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_contract.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.REG_NUM_TU_CONTRACT) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.REG_NUM_TU_CONTRACT) LIKE UPPER(?)";
        }
       if(aFilterObject.date_tu_contract != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.DATE_TU_CONTRACT = ?";
       }
        if (aFilterObject.reg_num_tu_cr_contract != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.reg_num_tu_cr_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_cr_contract.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.reg_num_tu_creation_contract) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.reg_num_tu_creation_contract) LIKE UPPER(?)";
        }
       if(aFilterObject.date_tu_cr_contract != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.date_tu_creation_contract = ?";
       }
        if (aFilterObject.project_num != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.project_num.indexOf('*',0) < 0 && aFilterObject.project_num.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.PROJECT_NUM) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.PROJECT_NUM) LIKE UPPER(?)";
        }
       if(aFilterObject.project_date != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.PROJECT_DATE = ?";
       }
       /*
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "CNPACK.SUBSYSTEMREFCODE = ? ";
       }
       */
     }



     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE " + whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        /*
    	if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }
        */
        if(aFilterObject.packCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.packCode);
        }

          if(aFilterObject.name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.id_ren != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id_ren);
        }

          if(aFilterObject.renName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.renName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.id_pack_status != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id_pack_status);
        }

          if(aFilterObject.statusName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.statusName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.description != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.description);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.power != null){
           number++;
           aFilterObject.power = aFilterObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.power);
       }

          if(aFilterObject.address != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.address);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.reg_num_cn_contract != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.reg_num_cn_contract);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.date_cn_contract != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.date_cn_contract.getTime()));
       }

          if(aFilterObject.reg_num_tu_contract != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.reg_num_tu_contract);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.date_tu_contract != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_contract.getTime()));
       }

          if(aFilterObject.reg_num_tu_cr_contract != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.reg_num_tu_cr_contract);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.date_tu_cr_contract != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_cr_contract.getTime()));
       }

          if(aFilterObject.project_num != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.project_num);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.project_date != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.project_date.getTime()));
       }
      /*
      if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.subsystemRef.code);
      }
      */
     }


     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }

       anObject = new CNPackShort();

       /*
       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       */
       anObject.packCode = set.getInt(1);
       if ( set.wasNull() )
           anObject.packCode = Integer.MIN_VALUE;
       anObject.name = set.getString(2);
       anObject.id_ren = set.getInt(3);
       if ( set.wasNull() )
           anObject.id_ren = Integer.MIN_VALUE;
       anObject.renName = set.getString(4);
       anObject.id_pack_status = set.getInt(5);
       if ( set.wasNull() )
           anObject.id_pack_status = Integer.MIN_VALUE;
       anObject.statusName = set.getString(6);
       anObject.description = set.getString(7);
       anObject.power = set.getBigDecimal(8);
       if(anObject.power != null)
           anObject.power = anObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.address = set.getString(9);
       anObject.reg_num_cn_contract = set.getString(10);
       anObject.date_cn_contract = set.getDate(11);
       anObject.reg_num_tu_contract = set.getString(12);
       anObject.date_tu_contract = set.getDate(13);
       anObject.reg_num_tu_cr_contract = set.getString(14);
       anObject.date_tu_cr_contract = set.getDate(15);
       anObject.project_num = set.getString(16);
       anObject.project_date = set.getDate(17);
       anObject.subsystemRefCode = set.getInt(18);
       if ( set.wasNull() )
           anObject.subsystemRefCode = Integer.MIN_VALUE;
       anObject.subsystemRefName = set.getString(19);
       anObject.cur_state = set.getString(20);

       anObject.is_reserv = set.getInt(21);
       if ( set.wasNull() )
           anObject.is_reserv = Integer.MIN_VALUE;

       anObject.is_finish_supply = set.getInt(22);
       if ( set.wasNull() )
           anObject.is_finish_supply = Integer.MIN_VALUE;

       anObject.is_realized = set.getInt(23);
       if ( set.wasNull() )
           anObject.is_realized = Integer.MIN_VALUE;

       anObject.pow_exist = set.getBigDecimal(24);
       if(anObject.pow_exist != null)
           anObject.pow_exist = anObject.pow_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.tension_point = set.getBigDecimal(25);
       if(anObject.tension_point != null)
           anObject.tension_point = anObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.tension_exist = set.getBigDecimal(26);
       if(anObject.tension_exist != null)
           anObject.tension_exist = anObject.tension_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.current_automat = set.getBigDecimal(27);
       if(anObject.current_automat != null)
           anObject.current_automat = anObject.current_automat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.id_proposal = set.getInt(28);
       if ( set.wasNull() )
           anObject.is_registration = Integer.MIN_VALUE;

       anObject.is_registration = set.getInt(29);
       if ( set.wasNull() )
           anObject.is_registration = Integer.MIN_VALUE;

        result.list.add(anObject);
      }

     result.setTotalCount(i);
     return result;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return null;
    }
   finally
    {
     try {if (set != null) set.close();}             catch (SQLException e) {}
     try {if (statement != null) statement.close();} catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }

  /* CNPack(EnergyWorkflow). Получить пакеты
   * ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ ПОТРЕБИТЕЛЯМ ЮРИДИЧЕСКОГО И БЫТОВОГО СЕКТОРОВ
   * по фильтру с текущими состояниями */
  public CNPackShortList getSPL_PP_PackCurStateList(CNPackFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
  {
	   CNPackShortList result = new CNPackShortList();
	   CNPackShort anObject;
	   result.list = new Vector();

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   ResultSet  set = null;

	   String     whereStr = "";
	   String     condition = (aFilterObject.conditionSQL == null  ? "" : aFilterObject.conditionSQL);
	   String     orderBy = (aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL );

	   if(quantity < 0)
	     quantity = Integer.MAX_VALUE/2;

	   if(orderBy.length() == 0)

		 orderBy = "p.subsystemcode desc, p.id";

	   if(getUserProfile() == null)
	    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	   selectStr =
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , p.renname \n" +
		   " , p.id_pack_status    \n" +
		   " , p.statusname \n" +
		   " , p.description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +

		   " , p.reg_num_cn_contract    \n" +
		   " , p.date_cn_contract   	    \n" +
		   " , p.reg_num_tu_contract    \n" +
		   " , p.date_tu_contract    \n" +
		   " , p.reg_num_tu_creation_contract    \n" +
		   " , p.date_tu_creation_contract    \n" +
		   " , p.project_num    \n" +
		   " , p.project_date   \n" +

		   " , p.subsystemcode \n" +
		   " , p.subsystemname \n" +
		   " , p.cur_state \n" +
		   " , p.address_jur \n" +
		   " , p.business_type \n" +
		   " , p.reg_num_spl_pp_contract \n" +
		   " , p.date_spl_pp_contract \n" +
		   " , p.id_district \n" +
		   " , p.districtName \n" +
		   " , p.date_finish_pack" +

		   " FROM  \n" +
		   " ( \n" +
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , r.name as renname \n" +
		   " , p.id_pack_status    \n" +
		   " , s.name as statusname \n" +
		   " , p.purpose as description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +

		   " , Null as reg_num_cn_contract    \n" +
		   " , Null as date_cn_contract   	    \n" +
		   " , Null as reg_num_tu_contract    \n" +
		   " , Null as date_tu_contract    \n" +
		   " , Null as reg_num_tu_creation_contract    \n" +
		   " , Null as date_tu_creation_contract    \n" +
		   " , Null as project_num    \n" +
		   " , Null as project_date   \n" +

		   " , 2 as subsystemcode \n" +
		   " , 'Поставка в Юридический сектор электроэнергии' as subsystemname \n" +
		   " , (select cn.group_concat(s.name, '; ') from cn.spl_states s where id in \n" +
		   "     (select id_state from cn.spl_movement where id_movement_status = 1 \n" +
		   "      and id_pack = p.id) \n" +
		   "   ) as cur_state \n" +
		   " , p.adres_jur as address_jur \n" +
		   " , p.business_type \n" +
		   " , p.reg_num_spl_contract as reg_num_spl_pp_contract \n" +
		   " , p.date_spl_contract as date_spl_pp_contract \n" +
		   " , Null as id_district \n" +
		   " , Null as districtName \n" +

		   " , case p.id_pack_status \n" +
		   "   when 2 \n" +
		   "     then (select min(m.startdate) from cn.spl_movement m \n" +
		   "       where m.id_movement_status = 1 and m.id_pack = p.id) \n" +
		   " end as date_finish_pack \n" +

		   " FROM cn.spl_packages p, cn.cn_ren r, cn.cn_pack_status s  \n" +
		   " where p.id_ren = r.id and p.id_pack_status = s.id \n" +

		   " union all \n" +
		   "  \n" +
		   " SELECT   \n" +
		   "  p.id    \n" +
		   " , p.name    \n" +
		   " , p.id_ren    \n" +
		   " , r.name as renname \n" +
		   " , p.id_pack_status    \n" +
		   " , s.name as statusname \n" +
		   " , p.purpose as description    \n" +
		   " , p.power    \n" +
		   " , p.adres    \n" +

		   " , Null as reg_num_cn_contract    \n" +
		   " , Null as date_cn_contract   	    \n" +
		   " , Null as reg_num_tu_contract    \n" +
		   " , Null as date_tu_contract    \n" +
		   " , Null as reg_num_tu_creation_contract    \n" +
		   " , Null as date_tu_creation_contract    \n" +
		   " , Null as project_num    \n" +
		   " , Null as project_date   \n" +

		   " , 4 as subsystemcode \n" +
		   " , 'Поставка в Бытовой сектор электроэнергии' as subsystemname \n" +
		   " , (select cn.group_concat(s.name, '; ') from cn.pp_states s where id in \n" +
		   "     (select id_state from cn.pp_movement where id_movement_status = 1 \n" +
		   "      and id_pack = p.id) \n" +
		   "   ) as cur_state \n" +
		   " , p.adres_jur as address_jur \n" +
		   " , p.business_type \n" +
		   " , p.reg_num_spl_contract as reg_num_spl_pp_contract \n" +
		   " , p.date_spl_contract as date_spl_pp_contract \n" +
		   " , p.id_district as id_district \n" +
		   " , (select name from cn.districts where id = p.id_district) as districtName \n" +

		   " , case p.id_pack_status \n" +
		   "   when 2 \n" +
		   "     then (select min(m.startdate) from cn.pp_movement m \n" +
		   "       where m.id_movement_status = 1 and m.id_pack = p.id) \n" +
		   " end as date_finish_pack \n" +

		   " FROM cn.pp_packages p, cn.cn_ren r, cn.cn_pack_status s  \n" +
		   " where p.id_ren = r.id and p.id_pack_status = s.id \n" +
		   " ) as p ";

     if(aFilterObject != null)
     {
       /*
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  CNPACK.CODE = ?";
       }
       */
       if(aFilterObject.packCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.id = ?";
       }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.id_ren != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.ID_REN = ?";
       }
        if (aFilterObject.renName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                //*** whereStr = whereStr + "  UPPER(r.NAME) = UPPER(?)";
            	whereStr = whereStr + "  UPPER(p.RENNAME) = UPPER(?)";
            else
                //*** whereStr = whereStr + " UPPER(r.NAME) LIKE UPPER(?)";
            	whereStr = whereStr + " UPPER(p.RENNAME) LIKE UPPER(?)";
        }

       if(aFilterObject.id_pack_status != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.ID_PACK_STATUS = ?";
       }
        if (aFilterObject.statusName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                //*** whereStr = whereStr + "  UPPER(s.NAME) = UPPER(?)";
            	whereStr = whereStr + "  UPPER(p.STATUSNAME) = UPPER(?)";
            else
                //*** whereStr = whereStr + " UPPER(s.NAME) LIKE UPPER(?)";
            	whereStr = whereStr + " UPPER(p.STATUSNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.description != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.description.indexOf('*',0) < 0 && aFilterObject.description.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.DESCRIPTION) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.DESCRIPTION) LIKE UPPER(?)";
        }
       if(aFilterObject.power != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.POWER = ?";
       }
        if (aFilterObject.address != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.ADRES) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.ADRES) LIKE UPPER(?)";
        }
        if (aFilterObject.reg_num_cn_contract != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.reg_num_cn_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_cn_contract.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.REG_NUM_CN_CONTRACT) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.REG_NUM_CN_CONTRACT) LIKE UPPER(?)";
        }
       if(aFilterObject.date_cn_contract != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.DATE_CN_CONTRACT = ?";
       }
        if (aFilterObject.reg_num_tu_contract != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.reg_num_tu_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_contract.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.REG_NUM_TU_CONTRACT) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.REG_NUM_TU_CONTRACT) LIKE UPPER(?)";
        }
       if(aFilterObject.date_tu_contract != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.DATE_TU_CONTRACT = ?";
       }
        if (aFilterObject.reg_num_tu_cr_contract != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.reg_num_tu_cr_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_cr_contract.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.reg_num_tu_creation_contract) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.reg_num_tu_creation_contract) LIKE UPPER(?)";
        }
       if(aFilterObject.date_tu_cr_contract != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.date_tu_creation_contract = ?";
       }
        if (aFilterObject.project_num != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.project_num.indexOf('*',0) < 0 && aFilterObject.project_num.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(p.PROJECT_NUM) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(p.PROJECT_NUM) LIKE UPPER(?)";
        }
       if(aFilterObject.project_date != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  p.PROJECT_DATE = ?";
       }
       /*
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "CNPACK.SUBSYSTEMREFCODE = ? ";
       }
       */
     }



     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE " + whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        /*
    	if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }
        */
        if(aFilterObject.packCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.packCode);
        }

          if(aFilterObject.name != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.name);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.id_ren != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id_ren);
        }

          if(aFilterObject.renName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.renName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.id_pack_status != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.id_pack_status);
        }

          if(aFilterObject.statusName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.statusName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.description != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.description);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.power != null){
           number++;
           aFilterObject.power = aFilterObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.power);
       }

          if(aFilterObject.address != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.address);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.reg_num_cn_contract != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.reg_num_cn_contract);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.date_cn_contract != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.date_cn_contract.getTime()));
       }

          if(aFilterObject.reg_num_tu_contract != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.reg_num_tu_contract);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.date_tu_contract != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_contract.getTime()));
       }

          if(aFilterObject.reg_num_tu_cr_contract != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.reg_num_tu_cr_contract);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.date_tu_cr_contract != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_cr_contract.getTime()));
       }

          if(aFilterObject.project_num != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.project_num);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.project_date != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.project_date.getTime()));
       }
      /*
      if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.subsystemRef.code);
      }
      */
     }


     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }

       anObject = new CNPackShort();

       /*
       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       */
       anObject.packCode = set.getInt(1);
       if ( set.wasNull() )
           anObject.packCode = Integer.MIN_VALUE;
       anObject.name = set.getString(2);
       anObject.id_ren = set.getInt(3);
       if ( set.wasNull() )
           anObject.id_ren = Integer.MIN_VALUE;
       anObject.renName = set.getString(4);
       anObject.id_pack_status = set.getInt(5);
       if ( set.wasNull() )
           anObject.id_pack_status = Integer.MIN_VALUE;
       anObject.statusName = set.getString(6);
       anObject.description = set.getString(7);
       anObject.power = set.getBigDecimal(8);
       if(anObject.power != null)
           anObject.power = anObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.address = set.getString(9);
       anObject.reg_num_cn_contract = set.getString(10);
       anObject.date_cn_contract = set.getDate(11);
       anObject.reg_num_tu_contract = set.getString(12);
       anObject.date_tu_contract = set.getDate(13);
       anObject.reg_num_tu_cr_contract = set.getString(14);
       anObject.date_tu_cr_contract = set.getDate(15);
       anObject.project_num = set.getString(16);
       anObject.project_date = set.getDate(17);
       anObject.subsystemRefCode = set.getInt(18);
       if ( set.wasNull() )
           anObject.subsystemRefCode = Integer.MIN_VALUE;
       anObject.subsystemRefName = set.getString(19);
       anObject.cur_state = set.getString(20);
       anObject.address_jur = set.getString(21);
       anObject.business_type = set.getString(22);
       anObject.reg_num_spl_pp_contract = set.getString(23);
       anObject.date_spl_pp_contract = set.getDate(24);
       anObject.id_district = set.getInt(25);
       if (set.wasNull())
    	 anObject.id_district = Integer.MIN_VALUE;
       anObject.districtName = set.getString(26);
       anObject.date_finish_pack = set.getTimestamp(27);

        result.list.add(anObject);
      }

     result.setTotalCount(i);
     return result;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return null;
    }
   finally
    {
     try {if (set != null) set.close();}             catch (SQLException e) {}
     try {if (statement != null) statement.close();} catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }

  public CNPack getObjectByCodeAndSubsystem(int uid, int ssID) throws PersistenceException
  {
   CNPack result = new CNPack();
   result.code = uid;
   result.subsystemRef.code = ssID;
   loadObject(result);
   if(result.code == Integer.MIN_VALUE)
    return null;
   return result;
  }

 @Override
public void loadObject(CNPack anObject) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet set = null;

   String ssPrefix = null;
   String purpField = null;
   String addressJurField = null;
   switch (anObject.subsystemRef.code) {
	  case CNSubsystemType.SS_CONNECTION: //Присоединение
		{
		  ssPrefix = "cn";
		  purpField = "purpose";
		  addressJurField = "NULL AS ADDRESS_JUR";
		  break;
		}
	  case CNSubsystemType.SS_NEWCONNECTION: //Присоединение с 01.08.2010 г.
		{
		  ssPrefix = "ncn";
		  purpField = "purpose";
		  addressJurField = "NULL AS ADDRESS_JUR";
		  break;
		}
	  case CNSubsystemType.SS_CONNECTION_20110314: //Присоединение с 14.03.2011 г.
		{
		  ssPrefix = "cn_20110314";
		  purpField = "description";
		  addressJurField = "NULL AS ADDRESS_JUR";
		  break;
		}
	  case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: //Присоединение с 01.03.2013 г.
		{
		  ssPrefix = "eap";
		  purpField = "description";
		  addressJurField = "NULL AS ADDRESS_JUR";
	      break;
		}
	  case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: //Присоединение с 19.04.2018 г.
		{
		  ssPrefix = "adso";
		  purpField = "description";
		  addressJurField = "NULL AS ADDRESS_JUR";
	      break;
		}
	  default:
		{throw new EnergyproSystemException("Неизвестна подсистема EnergyWorkFlow");}

	  }

   selectStr = "SELECT  " +
     ssPrefix + "_PACKAGES.ID, " +
     ssPrefix + "_PACKAGES.NAME, " +
     ssPrefix + "_PACKAGES.ID_REN, " +

     "(SELECT R.NAME FROM CN.CN_REN R " +
     "  WHERE R.ID = CN." + ssPrefix + "_PACKAGES.ID_REN" +
     ") AS RENNAME, " +

     ssPrefix + "_PACKAGES.ID_DISTRICT, " +

     "(SELECT D.NAME FROM CN.DISTRICTS D " +
     "  WHERE D.ID = CN." + ssPrefix + "_PACKAGES.ID_DISTRICT" +
     ") AS DISTRICTNAME, " +

     ssPrefix + "_PACKAGES.ID_PACK_STATUS, " +

     "(SELECT PS.NAME FROM CN.CN_PACK_STATUS PS " +
     "  WHERE PS.ID = CN." + ssPrefix + "_PACKAGES.ID_PACK_STATUS" +
     ") AS STATUSNAME, " +

     ssPrefix + "_PACKAGES." + purpField + ", " +

     ssPrefix + "_PACKAGES.POWER, " +
     ssPrefix + "_PACKAGES.ADRES AS ADDRESS, " +

     addressJurField + ", " +

     ssPrefix + "_PACKAGES.REG_NUM_CN_CONTRACT, " +
     ssPrefix + "_PACKAGES.DATE_CN_CONTRACT, " +

     "NULL AS REG_NUM_SPL_PP_CONTRACT, " +
     "NULL AS DATE_SPL_PP_CONTRACT, " +

     ssPrefix + "_PACKAGES.REG_NUM_TU_CONTRACT, " +
     ssPrefix + "_PACKAGES.DATE_TU_CONTRACT, " +
     ssPrefix + "_PACKAGES.REG_NUM_TU_CREATION_CONTRACT, " +
     ssPrefix + "_PACKAGES.DATE_TU_CREATION_CONTRACT, " +
     ssPrefix + "_PACKAGES.PROJECT_NUM, " +
     ssPrefix + "_PACKAGES.PROJECT_DATE, " +
     ssPrefix + "_PACKAGES.OVER5, " +
     ssPrefix + "_PACKAGES.STATUS, " +
     ssPrefix + "_PACKAGES.LETTER_NUM_CUSTOMER, " +
     ssPrefix + "_PACKAGES.DATE_LETTER_CUSTOMER, " +
     ssPrefix + "_PACKAGES.LETTER_NUM, " +
     ssPrefix + "_PACKAGES.DATE_LETTER, " +
     ssPrefix + "_PACKAGES.RELIABILITY_CLASS, " +
     ssPrefix + "_PACKAGES.ID_WAITING_STATUS, " +

     "(SELECT WS.NAME FROM CN.CN_WAITING_STATUS WS " +
     "  WHERE WS.ID = CN." + ssPrefix + "_PACKAGES.ID_WAITING_STATUS" +
     ") AS WAITINGSTATUS, " +

     ssPrefix + "_PACKAGES.IS_PAYABLE, " +
     ssPrefix + "_PACKAGES.WORKSIZE, " +
     ssPrefix + "_PACKAGES.WORK_INC_NET, " +
     "NULL AS BUSINESS_TYPE, " +
     ssPrefix + "_PACKAGES.ESTIMATETERM, " +
     ssPrefix + "_PACKAGES.ESTIMATEDATE, " +
     ssPrefix + "_PACKAGES.BUILDINGTERM, " +
     ssPrefix + "_PACKAGES.BUILDINGDATE, " +
     ssPrefix + "_PACKAGES.BUYINGTERM, " +
     ssPrefix + "_PACKAGES.BUYINGDATE, " +
     ssPrefix + "_PACKAGES.ESTIMATE_NUM, " +
     ssPrefix + "_PACKAGES.ESTIMATE_CONTRACT_DATE, " +
     ssPrefix + "_PACKAGES.IS_RESERV, " +
     anObject.subsystemRef.code + " AS SUBSYSTEMREFCODE, " +
     "(SELECT TENSION_POINT FROM CN." + ssPrefix + "_TECHTERMS WHERE ID_PACK = CN." + ssPrefix + "_PACKAGES.ID) AS TENSION_POINT, " +
	 "coalesce(" + ssPrefix + "_PACKAGES.account, " +
	 "	case " +
	 "	  when coalesce(" + ssPrefix + "_PACKAGES.status, 0) in (0, 2, 3, 5) then " +
	 "		(select reg_num_spl_contract from cn.spl_packages " +
	 "		where id = (select max(id_spl_pack) from cn.spl2cn " +
	 "		  where id_subsystem_cn = " + anObject.subsystemRef.code + " and id_cn_pack = " + ssPrefix + "_PACKAGES.ID)) " +
	 "	  when coalesce(" + ssPrefix + "_PACKAGES.status, 0) in (1, 4) then " +
	 "		(select reg_num_spl_contract from cn.pp_packages " +
	 "		where id = (select max(id_pp_pack) from cn.pp2cn " +
	 "		  where id_subsystem_cn = " + anObject.subsystemRef.code + " and id_cn_pack = " + ssPrefix + "_PACKAGES.ID)) " +
	 "	end) as reg_num_spl_pp_contract " +
     " FROM CN." + ssPrefix + "_PACKAGES " +
   " WHERE " + ssPrefix + "_PACKAGES.ID = ? ";

   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1,anObject.code);
     set = statement.executeQuery();
     if(!set.next())
      anObject.packCode = Integer.MIN_VALUE;
     else
      {
       //anObject.code = set.getInt(1);
       anObject.packCode = set.getInt(1);
       if ( set.wasNull() )
          anObject.packCode = Integer.MIN_VALUE;
       anObject.name = set.getString(2);
       anObject.id_ren = set.getInt(3);
       if ( set.wasNull() )
          anObject.id_ren = Integer.MIN_VALUE;
       anObject.renName = set.getString(4);
       anObject.id_district = set.getInt(5);
       if ( set.wasNull() )
          anObject.id_district = Integer.MIN_VALUE;
       anObject.districtName = set.getString(6);

       anObject.id_pack_status = set.getInt(7);
       if ( set.wasNull() )
          anObject.id_pack_status = Integer.MIN_VALUE;
       anObject.statusName = set.getString(8);
       anObject.description = set.getString(9);
       anObject.power = set.getBigDecimal(10);
       if(anObject.power != null)
           anObject.power = anObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.address = set.getString(11);
       anObject.address_jur = set.getString(12);
       anObject.reg_num_cn_contract = set.getString(13);
       anObject.date_cn_contract = set.getDate(14);
       anObject.reg_num_spl_pp_contract = set.getString(15);
       anObject.date_spl_pp_contract = set.getDate(16);
       anObject.reg_num_tu_contract = set.getString(17);
       anObject.date_tu_contract = set.getDate(18);
       anObject.reg_num_tu_cr_contract = set.getString(19);
       anObject.date_tu_cr_contract = set.getDate(20);
       anObject.project_num = set.getString(21);
       anObject.project_date = set.getDate(22);
       anObject.over5 = set.getInt(23);
       if ( set.wasNull() )
          anObject.over5 = Integer.MIN_VALUE;
       anObject.status = set.getInt(24);
       if ( set.wasNull() )
          anObject.status = Integer.MIN_VALUE;
       anObject.letter_num_customer = set.getString(25);
       anObject.date_letter_customer = set.getDate(26);
       anObject.letter_num = set.getString(27);
       anObject.date_letter = set.getDate(28);
       anObject.reliability_class = set.getString(29);
       anObject.id_waiting_status = set.getInt(30);
       if ( set.wasNull() )
          anObject.id_waiting_status = Integer.MIN_VALUE;
       anObject.waitingStatus = set.getString(31);
       anObject.is_payable = set.getInt(32);
       if ( set.wasNull() )
          anObject.is_payable = Integer.MIN_VALUE;
       anObject.worksize = set.getString(33);
       anObject.work_inc_net = set.getString(34);
       anObject.business_type = set.getString(35);
       anObject.estimateterm = set.getInt(36);
       if ( set.wasNull() )
          anObject.estimateterm = Integer.MIN_VALUE;
       anObject.estimatedate = set.getDate(37);
       anObject.buildingterm = set.getInt(38);
       if ( set.wasNull() )
          anObject.buildingterm = Integer.MIN_VALUE;
       anObject.buildingdate = set.getDate(39);
       anObject.buyingterm = set.getInt(40);
       if ( set.wasNull() )
          anObject.buyingterm = Integer.MIN_VALUE;
       anObject.buyingdate = set.getDate(41);
       anObject.estimate_num = set.getString(42);
       anObject.estimate_contract_date = set.getDate(43);
       anObject.is_reserv = set.getInt(44);
       if ( set.wasNull() )
          anObject.is_reserv = Integer.MIN_VALUE;
       anObject.subsystemRef.code = set.getInt(45);
       if ( set.wasNull() )
           anObject.subsystemRef.code = Integer.MIN_VALUE;
       anObject.tension_point = set.getBigDecimal(46);
       if(anObject.tension_point != null)
           anObject.tension_point = anObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	   anObject.reg_num_spl_pp_contract = set.getString(47);

       /*if(anObject.subsystemRef.code != Integer.MIN_VALUE)
       {
          anObject.setSubsystemRef(
		   new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).getRef(anObject.subsystemRef.code));
	   }*/
     }
   }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
    }
   finally
    {
     try {if(set != null) set.close(); if (statement != null) statement.close();}
     catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }

 @Override
public void save(CNPack anObject) throws PersistenceException
 {
  save(anObject,null);
 }

 @Override
public void save(CNPack anObject,String[] anAttributes) throws PersistenceException
 {

	 	String ssPrefix = null;
	    String purpField = null;
	    switch (anObject.subsystemRef.code) {
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
	 	  	{throw new EnergyproSystemException("Неизвестна подсистема EnergyWorkFlow");}
	 	  }

  if(anAttributes != null && anAttributes.length == 0)
     return;

  Connection connection = getConnection();
  try
   {
    PreparedStatement statement = null;

    String selectStr;

    Vector fields = null;
    if(anAttributes != null)
     {
      String fieldNameStr;
      fields = new Vector();
      for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++)
       {
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("ID") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("NAME") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("ID_REN") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }

        /*fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("RENNAME") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }*/

        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("ID_DISTRICT") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }

        /*fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("DISTRICTNAME") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }*/

        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("ID_PACK_STATUS") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }

        /*fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("STATUSNAME") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }*/

        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo(purpField) == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }

        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("POWER") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("ADRES") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }

        /*fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("ADDRESS_JUR") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }*/

        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("REG_NUM_CN_CONTRACT") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("DATE_CN_CONTRACT") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }

        /*fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("REG_NUM_SPL_PP_CONTRACT") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("DATE_SPL_PP_CONTRACT") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }*/

        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("REG_NUM_TU_CONTRACT") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("DATE_TU_CONTRACT") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("REG_NUM_TU_CREATION_CONTRACT") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("DATE_TU_CREATION_CONTRACT") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("PROJECT_NUM") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("PROJECT_DATE") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("OVER5") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("STATUS") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("LETTER_NUM_CUSTOMER") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("DATE_LETTER_CUSTOMER") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("LETTER_NUM") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("DATE_LETTER") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("RELIABILITY_CLASS") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("ID_WAITING_STATUS") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }

        /*fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("WAITINGSTATUS") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }*/

        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("IS_PAYABLE") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("WORKSIZE") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("WORK_INC_NET") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("BUSINESS_TYPE") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("ESTIMATETERM") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("ESTIMATEDATE") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("BUILDINGTERM") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("BUILDINGDATE") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("BUYINGTERM") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("BUYINGDATE") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("ESTIMATE_NUM") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("ESTIMATE_CONTRACT_DATE") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }
        fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("IS_RESERV") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }

        /*fieldNameStr = processCondition(anAttributes[attrIndex]);
        if(fieldNameStr.compareTo("SUBSYSTEMREF") == 0)
         {
          fields.add(fieldNameStr);
          continue;
         }*/

       }
     if(fields.size() == 0)
       return;
     }

    if(fields == null)
     {
      selectStr =  "UPDATE CN." + ssPrefix + "_PACKAGES " +
      "SET  ID = ? , " +
      "NAME = ? , " +
      "ID_REN = ? , " +
      "ID_DISTRICT = ? , " +
      "ID_PACK_STATUS = ? , " +
      purpField + " = ? , " +
      "POWER = ? , " +
      "ADRES = ? , " +
      "REG_NUM_CN_CONTRACT = ? , " +
      "DATE_CN_CONTRACT = ? , " +
      "REG_NUM_TU_CONTRACT = ? , " +
      "DATE_TU_CONTRACT = ? , " +
      "REG_NUM_TU_CREATION_CONTRACT = ? , " +
      "DATE_TU_CREATION_CONTRACT = ? , " +
      "PROJECT_NUM = ? , " +
      "PROJECT_DATE = ? , " +
      "OVER5 = ? , " +
      "STATUS = ? , " +
      "LETTER_NUM_CUSTOMER = ? , " +
      "DATE_LETTER_CUSTOMER = ? , " +
      "LETTER_NUM = ? , " +
      "DATE_LETTER = ? , " +
      "RELIABILITY_CLASS = ? , " +
      "ID_WAITING_STATUS = ? , " +
      "IS_PAYABLE = ? , " +
      "WORKSIZE = ? , " +
      "WORK_INC_NET = ? , " +
      "ESTIMATETERM = ? , " +
      "ESTIMATEDATE = ? , " +
      "BUILDINGTERM = ? , " +
      "BUILDINGDATE = ? , " +
      "BUYINGTERM = ? , " +
      "BUYINGDATE = ? , " +
      "ESTIMATE_NUM = ? , " +
      "ESTIMATE_CONTRACT_DATE = ? , " +
      "IS_RESERV = ? "
      + " WHERE ID = ?";
     }
    else
     {
      selectStr =
      "UPDATE " + ssPrefix + "_PACKAGES SET ";
      for(int fldIndex = 0;fldIndex < fields.size();fldIndex++)
       {
        selectStr+=(String)fields.get(fldIndex);
        if(fldIndex > 0)
         selectStr+=",";
       }
      selectStr += " WHERE ID = ?";
     }

    statement = null;

    try
     {
      statement = connection.prepareStatement(selectStr);
      if(fields == null)
       {
    if (anObject.packCode != Integer.MIN_VALUE )
       statement.setInt(1,anObject.packCode);
    else
       statement.setNull(1,java.sql.Types.INTEGER);
    statement.setString(2,anObject.name);
    if (anObject.id_ren != Integer.MIN_VALUE )
       statement.setInt(3,anObject.id_ren);
    else
       statement.setNull(3,java.sql.Types.INTEGER);
    //statement.setString(4,anObject.renName);
    if (anObject.id_district != Integer.MIN_VALUE )
       statement.setInt(4,anObject.id_district);
    else
       statement.setNull(4,java.sql.Types.INTEGER);
    //statement.setString(6,anObject.districtName);
    if (anObject.id_pack_status != Integer.MIN_VALUE )
       statement.setInt(5,anObject.id_pack_status);
    else
       statement.setNull(5,java.sql.Types.INTEGER);
    //statement.setString(8,anObject.statusName);
    statement.setString(6,anObject.description);
    if (anObject.power != null)
      anObject.power = anObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
    statement.setBigDecimal(7,anObject.power);

    statement.setString(8,anObject.address);
    //statement.setString(12,anObject.address_jur);
    statement.setString(9,anObject.reg_num_cn_contract);
    if (anObject.date_cn_contract == null)
      statement.setDate(10,null);
    else
      statement.setDate(10,new java.sql.Date(anObject.date_cn_contract.getTime()));

    /*statement.setString(15,anObject.reg_num_spl_pp_contract);
    if (anObject.date_spl_pp_contract == null)
      statement.setDate(16,null);
    else
      statement.setDate(16,new java.sql.Date(anObject.date_spl_pp_contract.getTime()));*/

    statement.setString(11,anObject.reg_num_tu_contract);
    if (anObject.date_tu_contract == null)
      statement.setDate(12,null);
    else
      statement.setDate(12,new java.sql.Date(anObject.date_tu_contract.getTime()));
    statement.setString(13,anObject.reg_num_tu_cr_contract);
    if (anObject.date_tu_cr_contract == null)
      statement.setDate(14,null);
    else
      statement.setDate(14,new java.sql.Date(anObject.date_tu_cr_contract.getTime()));
    statement.setString(15,anObject.project_num);
    if (anObject.project_date == null)
      statement.setDate(16,null);
    else
      statement.setDate(16,new java.sql.Date(anObject.project_date.getTime()));
    if (anObject.over5 != Integer.MIN_VALUE )
       statement.setInt(17,anObject.over5);
    else
       statement.setNull(17,java.sql.Types.INTEGER);
    if (anObject.status != Integer.MIN_VALUE )
       statement.setInt(18,anObject.status);
    else
       statement.setNull(18,java.sql.Types.INTEGER);
    statement.setString(19,anObject.letter_num_customer);
    if (anObject.date_letter_customer == null)
      statement.setDate(20,null);
    else
      statement.setDate(20,new java.sql.Date(anObject.date_letter_customer.getTime()));
    statement.setString(21,anObject.letter_num);
    if (anObject.date_letter == null)
      statement.setDate(22,null);
    else
      statement.setDate(22,new java.sql.Date(anObject.date_letter.getTime()));
    statement.setString(23,anObject.reliability_class);
    if (anObject.id_waiting_status != Integer.MIN_VALUE )
       statement.setInt(24,anObject.id_waiting_status);
    else
       statement.setNull(24,java.sql.Types.INTEGER);
    //statement.setString(28,anObject.waitingStatus);
    if (anObject.is_payable != Integer.MIN_VALUE )
       statement.setInt(25,anObject.is_payable);
    else
       statement.setNull(25,java.sql.Types.INTEGER);
    statement.setString(26,anObject.worksize);
    statement.setString(27,anObject.work_inc_net);
    //statement.setString(28,anObject.business_type);
    if (anObject.estimateterm != Integer.MIN_VALUE )
       statement.setInt(28,anObject.estimateterm);
    else
       statement.setNull(28,java.sql.Types.INTEGER);
    if (anObject.estimatedate == null)
      statement.setDate(29,null);
    else
      statement.setDate(29,new java.sql.Date(anObject.estimatedate.getTime()));
    if (anObject.buildingterm != Integer.MIN_VALUE )
       statement.setInt(30,anObject.buildingterm);
    else
       statement.setNull(30,java.sql.Types.INTEGER);
    if (anObject.buildingdate == null)
      statement.setDate(31,null);
    else
      statement.setDate(31,new java.sql.Date(anObject.buildingdate.getTime()));
    if (anObject.buyingterm != Integer.MIN_VALUE )
       statement.setInt(32,anObject.buyingterm);
    else
       statement.setNull(32,java.sql.Types.INTEGER);
    if (anObject.buyingdate == null)
      statement.setDate(33,null);
    else
      statement.setDate(33,new java.sql.Date(anObject.buyingdate.getTime()));
    statement.setString(34,anObject.estimate_num);
    if (anObject.estimate_contract_date == null)
      statement.setDate(35,null);
    else
      statement.setDate(35,new java.sql.Date(anObject.estimate_contract_date.getTime()));
    if (anObject.is_reserv != Integer.MIN_VALUE )
       statement.setInt(36,anObject.is_reserv);
    else
       statement.setNull(36,java.sql.Types.INTEGER);
    /*if (anObject.subsystemRef.code != Integer.MIN_VALUE)
      statement.setInt(42,anObject.subsystemRef.code);
    else
      statement.setNull(42,java.sql.Types.INTEGER);*/
        statement.setInt(37,anObject.packCode);
       }
      else
       {

        for(int i = 0;i < fields.size();i++)
         {
          if("ID".compareTo((String)fields.get(i)) == 0)
           {
              statement.setInt(i+1,anObject.packCode);
              continue;
           }
          if("NAME".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.name);
              continue;
           }
          if("ID_REN".compareTo((String)fields.get(i)) == 0)
           {
              statement.setInt(i+1,anObject.id_ren);
              continue;
           }
          /*if("RENNAME".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.renName);
              continue;
           }*/
          if("ID_DISTRICT".compareTo((String)fields.get(i)) == 0)
           {
              statement.setInt(i+1,anObject.id_district);
              continue;
           }
          /*if("DISTRICTNAME".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.districtName);
              continue;
           }*/
          if("ID_PACK_STATUS".compareTo((String)fields.get(i)) == 0)
           {
              statement.setInt(i+1,anObject.id_pack_status);
              continue;
           }
          /*if("STATUSNAME".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.statusName);
              continue;
           }*/
          if(purpField.compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.description);
              continue;
           }
          if("POWER".compareTo((String)fields.get(i)) == 0)
           {
              if (anObject.power != null)
                  anObject.power = anObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(i+1,anObject.power);
              continue;
           }
          if("ADRES".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.address);
              continue;
           }
          /*if("ADDRESS_JUR".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.address_jur);
              continue;
           }*/
          if("REG_NUM_CN_CONTRACT".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.reg_num_cn_contract);
              continue;
           }
          if("DATE_CN_CONTRACT".compareTo((String)fields.get(i)) == 0)
           {
    if (anObject.date_cn_contract == null)
              statement.setDate(i+1,null);
    else
              statement.setDate(i+1,new java.sql.Date(anObject.date_cn_contract.getTime()));
              continue;
           }

          /*if("REG_NUM_SPL_PP_CONTRACT".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.reg_num_spl_pp_contract);
              continue;
           }
          if("DATE_SPL_PP_CONTRACT".compareTo((String)fields.get(i)) == 0)
           {
    if (anObject.date_spl_pp_contract == null)
              statement.setDate(i+1,null);
    else
              statement.setDate(i+1,new java.sql.Date(anObject.date_spl_pp_contract.getTime()));
              continue;
           }*/

          if("REG_NUM_TU_CONTRACT".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.reg_num_tu_contract);
              continue;
           }
          if("DATE_TU_CONTRACT".compareTo((String)fields.get(i)) == 0)
           {
    if (anObject.date_tu_contract == null)
              statement.setDate(i+1,null);
    else
              statement.setDate(i+1,new java.sql.Date(anObject.date_tu_contract.getTime()));
              continue;
           }
          if("REG_NUM_TU_CREATION_CONTRACT".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.reg_num_tu_cr_contract);
              continue;
           }
          if("DATE_TU_CREATION_CONTRACT".compareTo((String)fields.get(i)) == 0)
           {
    if (anObject.date_tu_cr_contract == null)
              statement.setDate(i+1,null);
    else
              statement.setDate(i+1,new java.sql.Date(anObject.date_tu_cr_contract.getTime()));
              continue;
           }
          if("PROJECT_NUM".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.project_num);
              continue;
           }
          if("PROJECT_DATE".compareTo((String)fields.get(i)) == 0)
           {
    if (anObject.project_date == null)
              statement.setDate(i+1,null);
    else
              statement.setDate(i+1,new java.sql.Date(anObject.project_date.getTime()));
              continue;
           }
          if("OVER5".compareTo((String)fields.get(i)) == 0)
           {
              statement.setInt(i+1,anObject.over5);
              continue;
           }
          if("STATUS".compareTo((String)fields.get(i)) == 0)
           {
              statement.setInt(i+1,anObject.status);
              continue;
           }
          if("LETTER_NUM_CUSTOMER".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.letter_num_customer);
              continue;
           }
          if("DATE_LETTER_CUSTOMER".compareTo((String)fields.get(i)) == 0)
           {
    if (anObject.date_letter_customer == null)
              statement.setDate(i+1,null);
    else
              statement.setDate(i+1,new java.sql.Date(anObject.date_letter_customer.getTime()));
              continue;
           }
          if("LETTER_NUM".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.letter_num);
              continue;
           }
          if("DATE_LETTER".compareTo((String)fields.get(i)) == 0)
           {
    if (anObject.date_letter == null)
              statement.setDate(i+1,null);
    else
              statement.setDate(i+1,new java.sql.Date(anObject.date_letter.getTime()));
              continue;
           }
          if("RELIABILITY_CLASS".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.reliability_class);
              continue;
           }
          if("ID_WAITING_STATUS".compareTo((String)fields.get(i)) == 0)
           {
              statement.setInt(i+1,anObject.id_waiting_status);
              continue;
           }

          /*if("WAITINGSTATUS".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.waitingStatus);
              continue;
           }*/

          if("IS_PAYABLE".compareTo((String)fields.get(i)) == 0)
           {
              statement.setInt(i+1,anObject.is_payable);
              continue;
           }
          if("WORKSIZE".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.worksize);
              continue;
           }
          if("WORK_INC_NET".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.work_inc_net);
              continue;
           }
          /*if("BUSINESS_TYPE".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.business_type);
              continue;
           }*/
          if("ESTIMATETERM".compareTo((String)fields.get(i)) == 0)
           {
              statement.setInt(i+1,anObject.estimateterm);
              continue;
           }
          if("ESTIMATEDATE".compareTo((String)fields.get(i)) == 0)
           {
    if (anObject.estimatedate == null)
              statement.setDate(i+1,null);
    else
              statement.setDate(i+1,new java.sql.Date(anObject.estimatedate.getTime()));
              continue;
           }
          if("BUILDINGTERM".compareTo((String)fields.get(i)) == 0)
           {
              statement.setInt(i+1,anObject.buildingterm);
              continue;
           }
          if("BUILDINGDATE".compareTo((String)fields.get(i)) == 0)
           {
    if (anObject.buildingdate == null)
              statement.setDate(i+1,null);
    else
              statement.setDate(i+1,new java.sql.Date(anObject.buildingdate.getTime()));
              continue;
           }
          if("BUYINGTERM".compareTo((String)fields.get(i)) == 0)
           {
              statement.setInt(i+1,anObject.buyingterm);
              continue;
           }
          if("BUYINGDATE".compareTo((String)fields.get(i)) == 0)
           {
    if (anObject.buyingdate == null)
              statement.setDate(i+1,null);
    else
              statement.setDate(i+1,new java.sql.Date(anObject.buyingdate.getTime()));
              continue;
           }
          if("ESTIMATE_NUM".compareTo((String)fields.get(i)) == 0)
           {
              statement.setString(i+1,anObject.estimate_num);
              continue;
           }
          if("ESTIMATE_CONTRACT_DATE".compareTo((String)fields.get(i)) == 0)
           {
    if (anObject.estimate_contract_date == null)
              statement.setDate(i+1,null);
    else
              statement.setDate(i+1,new java.sql.Date(anObject.estimate_contract_date.getTime()));
              continue;
           }
          if("IS_RESERV".compareTo((String)fields.get(i)) == 0)
           {
              statement.setInt(i+1,anObject.is_reserv);
              continue;
           }
          /*if("SUBSYSTEMREF".compareTo((String)fields.get(i)) == 0)
           {
              if (anObject.subsystemRef.code != Integer.MIN_VALUE)
                   statement.setInt(i+1,anObject.subsystemRef.code);
              else
                   statement.setNull(i+1,java.sql.Types.INTEGER);
              continue;
           }*/
          }
       statement.setInt(fields.size(),anObject.packCode);
       }

      statement.execute();
     }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     }
    finally
     {
      try {if (statement != null) statement.close();} catch (SQLException e) {}
     }
   }
  finally
   {
    if(connection != super.getConnection())
     {
      try{connection.close();} catch(SQLException e){}
     }
   }

 } // end of save(CNPack anObject,String[] anAttributes)



} // end of CNPackDAO