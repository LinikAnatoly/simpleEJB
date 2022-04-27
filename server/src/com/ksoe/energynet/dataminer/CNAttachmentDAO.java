
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.CNAttachmentDAOGen;
import com.ksoe.energynet.valueobject.CNAttachment;
import com.ksoe.energynet.valueobject.brief.CNAttachmentShort;
import com.ksoe.energynet.valueobject.filter.CNAttachmentFilter;
import com.ksoe.energynet.valueobject.lists.CNAttachmentShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for CNAttachment;
 *
 */

public class CNAttachmentDAO extends CNAttachmentDAOGen {

    public CNAttachmentDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public CNAttachmentDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

	
	public CNAttachmentShortList getCNAttachmentsList4CN(CNAttachment aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		CNAttachmentShortList result = new CNAttachmentShortList();
		CNAttachmentShort anObject;
		result.list = new Vector<CNAttachmentShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";


		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = " select cnattachment.id, cnattachment.socode, cnattachment.name, cnattachment.date_doc, " + 
				    " cnattachment.filename, replace(cnattachment.filelink,'\\','/') as filelink, cnattachment.prefix from " +
    " (select  att.id, c2s.socode, dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc,  att.filename, 'SS_CONNECTION_20110314\\' || att.filelink as filelink, " +
	" 'cn_20110314' as prefix" +    
    " from   temp_cn_so c2s inner  join cn.cn_20110314_packages pack  on (pack.id = c2s.packcode) " + 
    " inner join cn_20110314_doc dcc on (dcc.id_pack = pack.id) " +
    " inner join cn_20110314_attachments att on (att.id_doc = dcc.id) " +
    " and c2s.subsystemcode = 18 " +
    " and att.id not in (select  cn_20110314_attachments.id_parent from cn_20110314_attachments where id_parent is not null) " +
    " and att.code_endocattachment is null " + 
    " union ALL " +
    " select att.id, c2s.socode, dcc.name ,  to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc,  att.filename, 'SS_ELECTRICINSTALLACCESSPOWER\\'||att.filelink as filelink, " + 
	" 'eap' as prefix" +    
    " from   temp_cn_so c2s inner  join cn.eap_packages pack  on (pack.id = c2s.packcode) " +  
    " inner join eap_doc dcc on (dcc.id_pack = pack.id) " +
    " inner join eap_attachments att on (att.id_doc = dcc.id) " +
    " and c2s.subsystemcode = 20 " +
    " and att.id not in (select  eap_attachments.id_parent from eap_attachments where id_parent is not null) " +
    " and att.code_endocattachment is null " + 
    " union all " +
    " select  att.id, c2s.socode, dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc,  att.filename, 'SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER\\'||att.filelink as filelink, " +
	" 'adso' as prefix" +    
    " from   temp_cn_so c2s inner  join cn.adso_packages pack  on (pack.id = c2s.packcode) " +  
    " inner join adso_doc dcc on (dcc.id_pack = pack.id) " +
    " inner join adso_attachments att on (att.id_doc = dcc.id) " +
    " and c2s.subsystemcode = 26 " +
    " and att.id not in (select  adso_attachments.id_parent from adso_attachments where id_parent is not null) " + 
    " and att.code_endocattachment is null " + 
    ") as cnattachment " +
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);


		if(whereStr.length() != 0) {
			selectStr += " WHERE " + whereStr;
		}

		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;
		int number = 0;
		try {
			statement = connection.prepareStatement(selectStr);
			number = setParameters(aFilterObject, statement);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new CNAttachmentShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.soCode = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.soCode = Integer.MIN_VALUE;
				}
				anObject.name = set.getString(3);
				anObject.date_doc = set.getDate(4);
				anObject.filename = set.getString(5);
				anObject.filelink = set.getString(6);
                anObject.prefix = set.getString(7);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();}             catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	
	public CNAttachmentShortList getCNAttachmentsList(CNAttachmentFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		CNAttachmentShortList result = new CNAttachmentShortList();
		CNAttachmentShort anObject;
		result.list = new Vector<CNAttachmentShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";


		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "  select cnattachment.id,  cnattachment.name, cnattachment.date_doc, " +
				    " cnattachment.filename, replace(cnattachment.filelink,'\\','/') as filelink, cnattachment.prefix, " +
                    " cnattachment.id_parent, cnattachment.is_del from " +
     " (select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
     " att.filename, 'SS_CONNECTION_20110314\\' || att.filelink as filelink, 'cn_20110314' as prefix, att.id_parent, att.is_del " +
     " from    cn.cn_20110314_packages pack " + 
     " inner join cn_20110314_doc dcc on (dcc.id_pack = pack.id) " +
     " inner join cn_20110314_attachments att on (att.id_doc = dcc.id) " +
     " and att.id not in (select  cn_20110314_attachments.id_parent from cn_20110314_attachments where id_parent is not null) " +
     " and att.code_endocattachment is null " + 
     " and att.is_del is null " +
     " union ALL " +
     " select  att.id, dcc.name ,  to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
     " att.filename, 'SS_ELECTRICINSTALLACCESSPOWER\\'||att.filelink as filelink, 'eap' as prefix, att.id_parent, att.is_del " +
     " from   cn.eap_packages pack " + 
     " inner join eap_doc dcc on (dcc.id_pack = pack.id) " +
     " inner join eap_attachments att on (att.id_doc = dcc.id) " +
     " and att.id not in (select  eap_attachments.id_parent from eap_attachments where id_parent is not null) " +
     " and att.code_endocattachment is null " +
     " and att.is_del is null " +
     " union all " +
     " select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
     " att.filename, 'SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER\\'||att.filelink as filelink, 'adso' as prefix, att.id_parent, att.is_del " +
     " from   cn.adso_packages pack " +
     " inner join adso_doc dcc on (dcc.id_pack = pack.id) " +
     " inner join adso_attachments att on (att.id_doc = dcc.id) " +
     " and att.id not in (select  adso_attachments.id_parent from adso_attachments where id_parent is not null) " + 
     " and att.code_endocattachment is null " +
    " and att.is_del is null" +
    " union all " +
    " select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " + 
" att.filename, 'SS_SUPPLY\\'||att.filelink as filelink, 'spl' as prefix, att.id_parent, att.is_del " +
" from   cn.spl_packages pack " +
" inner join spl_doc dcc on (dcc.id_pack = pack.id) " +
" inner join spl_attachments att on (att.id_doc = dcc.id) " + 
" and att.id not in (select  spl_attachments.id_parent from spl_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +         
" union all " +
 " select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_TECHTERMS\\'||att.filelink as filelink, 'tts' as prefix, att.id_parent, att.is_del " +
" from   cn.tts_packages pack " +
" inner join tts_doc dcc on (dcc.id_pack = pack.id) " +
" inner join tts_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  tts_attachments.id_parent from tts_attachments where id_parent is not null) " + 
 " and att.code_endocattachment is null " +
 " and att.is_del is null " +
" union all " +
 " select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc,  " +
" att.filename,   case  when att.filelink like  '_before_%' then  'SS_PHYSPERSON'||att.filelink  " +
   "  else  'SS_PHYSPERSON\\'||att.filelink  end  as filelink, 'pp' as prefix, att.id_parent, att.is_del " +
" from   cn.pp_packages pack " +
" inner join pp_doc dcc on (dcc.id_pack = pack.id) " +
" inner join pp_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  pp_attachments.id_parent from pp_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " + 
" and att.filelink is not null " +        
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc," +  
" att.filename, 'SS_PLANTASK\\'||att.filelink as filelink, 'pt' as prefix, att.id_parent, att.is_del " +
" from   cn.pt_packages pack " +
" inner join pt_doc dcc on (dcc.id_pack = pack.id) " +
" inner join pt_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  pt_attachments.id_parent from pt_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_CONTROLQUALITY\\'||att.filelink as filelink, 'cq' as prefix, att.id_parent, att.is_del " +
" from   cn.cq_packages pack " +
" inner join cq_doc dcc on (dcc.id_pack = pack.id) " +
" inner join cq_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  cq_attachments.id_parent from cq_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +   
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_JOINTSUPPLY\\'||att.filelink as filelink, 'js' as prefix, att.id_parent, att.is_del " +
" from   cn.js_packages pack " + 
" inner join js_doc dcc on (dcc.id_pack = pack.id) " +
" inner join js_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  js_attachments.id_parent from js_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " + 
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_CONNECTION\\'||att.filelink as filelink, 'cn' as prefix, att.id_parent, att.is_del " +
" from   cn.cn_packages pack " +
" inner join cn_doc dcc on (dcc.id_pack = pack.id) " +
" inner join cn_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  cn_attachments.id_parent from cn_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +        
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_NEWCONNECTION\\'||att.filelink as filelink, 'ncn' as prefix, att.id_parent, att.is_del " +
" from   cn.ncn_packages pack " +
" inner join ncn_doc dcc on (dcc.id_pack = pack.id) " +
" inner join ncn_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  ncn_attachments.id_parent from ncn_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +    
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_ELECTRICINSTALLATION\\'||att.filelink as filelink, 'ei' as prefix, att.id_parent, att.is_del " +
" from   cn.ei_packages pack " +
" inner join ei_doc dcc on (dcc.id_pack = pack.id) " +
" inner join ei_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  ei_attachments.id_parent from ei_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_PREPARATIONOUTPUTDATA\\'||att.filelink as filelink, 'odp' as prefix, att.id_parent, att.is_del " +
" from   cn.odp_packages pack " +
" inner join odp_doc dcc on (dcc.id_pack = pack.id) " +
" inner join odp_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  odp_attachments.id_parent from odp_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +                  
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_ELECTRICITYMETERING\\'||att.filelink as filelink, 'cem' as prefix, att.id_parent, att.is_del " +
" from   cn.cem_packages pack " +
" inner join cem_doc dcc on (dcc.id_pack = pack.id) " +
" inner join cem_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  cem_attachments.id_parent from cem_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +     
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_BUYSOLARENERGY\\'||att.filelink as filelink, 'bse' as prefix, att.id_parent, att.is_del " +
" from   cn.bse_packages pack " +
" inner join bse_doc dcc on (dcc.id_pack = pack.id) " +
" inner join bse_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  bse_attachments.id_parent from bse_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " + 
" att.filename, 'SS_FIBEROPTICCOMJOINTSUSPENS\\'||att.filelink as filelink, 'foj' as prefix, att.id_parent, att.is_del " +
" from   cn.foj_packages pack " +
" inner join foj_doc dcc on (dcc.id_pack = pack.id) " +
" inner join foj_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  foj_attachments.id_parent from foj_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +          
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_REIMBURSEMENT\\'||att.filelink as filelink, 'rmb' as prefix, att.id_parent, att.is_del " +
" from   cn.rmb_packages pack " +
" inner join rmb_doc dcc on (dcc.id_pack = pack.id) " +
" inner join rmb_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  rmb_attachments.id_parent from rmb_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +         
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_ENERGY_MARKET\\'||att.filelink as filelink, 'mec' as prefix, att.id_parent, att.is_del " + 
" from   cn.mec_packages pack " +
" inner join mec_doc dcc on (dcc.id_pack = pack.id) " +
" inner join mec_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  mec_attachments.id_parent from mec_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +        
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_CRIMINAL_PROCESS_MOVEMENT\\'||att.filelink as filelink, 'cpm' as prefix, att.id_parent, att.is_del " +
" from   cn.cpm_packages pack " +
" inner join cpm_doc dcc on (dcc.id_pack = pack.id) " +
" inner join cpm_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  cpm_attachments.id_parent from cpm_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +               
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_APPROVAL_LAND_ALLOTMENT_DOC\\'||att.filelink as filelink, 'alad' as prefix, att.id_parent, att.is_del " +
" from   cn.alad_packages pack " +
" inner join alad_doc dcc on (dcc.id_pack = pack.id) " +
" inner join alad_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  alad_attachments.id_parent from alad_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +            
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_ACTS\\'||att.filelink as filelink, 'acts' as prefix, att.id_parent, att.is_del " +
" from   cn.acts_packages pack " +
" inner join acts_doc dcc on (dcc.id_pack = pack.id) " +
" inner join acts_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  acts_attachments.id_parent from acts_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +         
" union all " +
" select  att.id,  dcc.name , to_date(to_char(dcc.datedoc,'dd.MM.yyyy'),'dd.MM.yyyy') as date_doc, " +  
" att.filename, 'SS_DISTRIBUTION\\'||att.filelink as filelink, 'dst' as prefix, att.id_parent, att.is_del" +
" from   cn.dst_packages pack " +
" inner join dst_doc dcc on (dcc.id_pack = pack.id) " +
" inner join dst_attachments att on (att.id_doc = dcc.id) " +
" and att.id not in (select  dst_attachments.id_parent from dst_attachments where id_parent is not null) " + 
" and att.code_endocattachment is null " +
" and att.is_del is null " +    
    ") as cnattachment ";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);


		if(whereStr.length() != 0) {
			selectStr += " WHERE " + whereStr;
		}

		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;
		int number = 0;
		try {
			statement = connection.prepareStatement(selectStr);
			number = setParameters(aFilterObject, statement);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new CNAttachmentShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.name = set.getString(2);
				anObject.date_doc = set.getDate(3);
				anObject.filename = set.getString(4);
				anObject.filelink = set.getString(5);
                anObject.prefix = set.getString(6);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();}             catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	
	
	public void removeCN(String cnSubSystem,int id)throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		//is_del(Признак удалённости: 1 - удалённое, 0 или Null - нет)
		selectStr = "update cn."+cnSubSystem+"_attachments set is_del = 1 where id = ?";
					
		try {
			statement = connection.prepareStatement(selectStr);				
			statement.setInt(1, id);
			
			statement.executeUpdate();
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {			
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	
	public void updateCNAttachment(String prefix,int id, int endocattachmentcode)throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		selectStr = "update cn."+ prefix + "_attachments set filelink = null, code_endocattachment = ? where id = ?";
					
		try {
			statement = connection.prepareStatement(selectStr);				
			statement.setInt(1, endocattachmentcode);
			statement.setInt(2, id);
			
			statement.executeUpdate();
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {			
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	
	public void addDocAttachments(String cnSubSystem, String attachDocName, int idPack,
					int idMovement, int idUser, int codeENDocAttachment)throws PersistenceException {
		String selectStr;
		String selectStr2;
		int idDoc = 0;
		Connection connection = getConnection();
		PreparedStatement statement = null;			
		
		selectStr = 
				"      INSERT INTO cn."+cnSubSystem+"_doc( "+
				"        id, name, id_pack, datedoc, id_doctype) "+
				"      VALUES ( "+
				"        (select max(id)+1 from "+cnSubSystem+"_doc), ?, ?, ?, ?); ";
		
		selectStr2 =  
				"          INSERT INTO cn."+cnSubSystem+"_attachments (name, id_doc, id_movement, "+
				"            id_user, attached_date, "+
				"           datedoc, is_del, code_endocattachment) "+
				"        VALUES (?, ?, ?, ?, ?, ?, ?, ?); ";		
		
		try {			
			statement = connection.prepareStatement(selectStr, statement.RETURN_GENERATED_KEYS);				
			statement.setString(1, attachDocName);
			statement.setInt(2, idPack);
			statement.setDate(3, new java.sql.Date(new Date().getTime()));
			statement.setInt(4, 181);			
			statement.executeUpdate();
			ResultSet rs=statement.getGeneratedKeys();
			if(rs.next())
				idDoc=rs.getInt(1);
			
			statement = connection.prepareStatement(selectStr2);
	    	statement.setString(1, attachDocName);
			statement.setInt(2, idDoc);
			
			if (idMovement == Integer.MIN_VALUE) {
				statement.setNull(3,java.sql.Types.INTEGER);
			} else 
			statement.setInt(3, idMovement);
			
			statement.setInt(4, idUser);
			statement.setDate(5, new java.sql.Date(new Date().getTime()));
			statement.setDate(6, new java.sql.Date(new Date().getTime()));
			statement.setInt(7, 0);
			statement.setInt(8, codeENDocAttachment);
			statement.executeUpdate();			
			
		} catch(SQLException e) {		
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		}
		finally {			
					try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
    

} // end of CNAttachmentDAO
