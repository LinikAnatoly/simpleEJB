
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENActDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.FINDoc2MolData;
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.brief.ENActShort;
import com.ksoe.energynet.valueobject.filter.ENActFilter;
import com.ksoe.energynet.valueobject.lists.ENActShortList;
import com.ksoe.energynet.valueobject.references.ENElementRef;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for ENAct;
  *
  */

public class ENActDAO extends ENActDAOGen {

    public ENActDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENActDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public ENAct getActByFinDocCode(int finDocCode) throws PersistenceException {
    	ENActFilter filter = new ENActFilter();
    	filter.conditionSQL =  String.format("exists(select 1 from %s as fimo1 " +
    			 "inner join %s as mo1 on fimo1.%s = mo1.%s " +
    			 "where mo1.%s = %s and fimo1.%s = ?)"
    			 , FINDoc2MolData.tableName
    			 , FINMolData.tableName, FINDoc2MolData.molData_Field, FINMolData.code_Field
    			 , FINMolData.act_Field, ENAct.code_QFielld, FINDoc2MolData.finDocCode_Field);
    	Vector<Object> bindedObjects = new Vector<Object>();
    	bindedObjects.add(finDocCode);

    	int[] codes = this.getFilteredCodeArray(filter, filter.conditionSQL, "", 0, -1, bindedObjects);
    	if(codes == null || codes.length == 0) return null;
    	if(codes.length > 1) {
    		throw new SystemException(String.format("Помилка у кількості для документу з кодом %d кількість = %d", finDocCode, codes.length));
    	} else {
    		return this.getObject(codes[0]);
    	}
    }

	  /**
	   *
	   * Получить лист кодов актов {@link ENAct} по объекту сущности SCUsageInput
	   *
	   * @param usageInput объект сущности {@link SCUsageInput} коды связок которой нужно получить
	   * @return лист кодов актов {@code Integer}
	   * @throws PersistenceException
	   */
	public List<Integer> getActCodesListBySCUsageInput(SCUsageInput usageInput) throws PersistenceException {
		SCUsageInputItemOZ2ENActDAO dao = new SCUsageInputItemOZ2ENActDAO(getUserProfile(), getConnection());
		return dao.getActCodesListBySCUsageInput(usageInput);
	}
	
  public ENActShortList getScrollableFilteredListNOSEGR(ENAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector<? extends Object> aBindObjects) throws PersistenceException {
	  return this.getScrollableFilteredList(aFilterObject, anCondition, anOrderBy, fromPosition, quantity, aBindObjects, false);
   }


  @Override
	public ENActShortList getScrollableFilteredList(ENAct aFilterObject, String anCondition, String anOrderBy,
			int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
	  return this.getScrollableFilteredList(aFilterObject, anCondition, anOrderBy, fromPosition, quantity, aBindObjects, true);
  }
  
	public ENActShortList getScrollableFilteredList(ENAct aFilterObject, String anCondition, String anOrderBy,
			int fromPosition, int quantity, Vector<? extends Object> aBindObjects, boolean isSegregation) throws PersistenceException {
		ENActShortList result = new ENActShortList();
		ENActShort anObject;
		result.list = new Vector<ENActShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0)
			orderBy = "ENACT.CODE";

		if (quantity < 0)
			quantity = Integer.MAX_VALUE / 2;

		if (getUserProfile() == null)
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENACT.CODE"+
    ",ENACT.NUMBERGEN"+
    ",ENACT.DATEGEN"+
    ",ENACT.FINMOLCODE"+
    ",ENACT.FINMOLNAME"+
    ",ENACT.FINMECHANICNAME"+
    ",coalesce(ENACT.INVNUMBER,(select eld.invnumber from enelementdata eld where eld.ecode = enact.elementcode)) as invnumber"+
    ",ENACT.USERGEN"+
    ",ENACT.DATEEDIT"+
    ",ENACT.DATEACT"+

     ", ENACTSTATUS.CODE " +
     ", ENACTSTATUS.NAME " +
     ", ENELEMENT.CODE " +
     ", ENPLANWORKSTATE.CODE " +
     ", ENPLANWORKSTATE.NAME " +
     ", ENPLANWORKSTATE.SHORTNAME "

     + ", (select distinct string_agg(distinct pt.shortname, ', ') "
     + "   from enact2enplanwork ap, enplanwork p, enplanworktype pt "
     + "  where ap.actrefcode = enact.code "
     + "    and p.code = ap.plancode "
     + "    and pt.code = p.typerefcode) "
     + ", (select coalesce(sum(coalesce(ah.timework, 0)), 0) "
     + "   from enact2humen ah where ah.actrefcode = enact.code) " +
     ", ENACT.CHECKEDBYACCOUNTANT " +

     " FROM ENACTSTATUS " +
     ", ENELEMENT " +
     ", ENPLANWORKSTATE " +
     ", ENACT ";


     whereStr = " ENACTSTATUS.CODE = ENACT.STATUSREFCODE" ; //+
     whereStr = whereStr + " AND ENELEMENT.CODE = ENACT.ELEMENTCODE" ; //+
     whereStr = whereStr + " AND ENPLANWORKSTATE.CODE = ENACT.ACTTYPEREFCODE" ; //+

     whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

     if(isSegregation) {
    	   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    	   if(segregationInfo.isAccessDenied())
    	     throw new PersistenceException("{%ENAct.getList%} access denied");

    	   String domainWhereStr = SegregationQueryBuilder.addWhere("ENACT",segregationInfo,getUserProfile().getDomainInfo());

    	   if (domainWhereStr.length() != 0){
    	   // domainWhereStr = "  AND ENACT.DOMAIN_INFO IS NOT NULL";
    	   //else
    	    if (whereStr.length() == 0)
    	        whereStr = domainWhereStr;
    	    else
    	        whereStr = " "+whereStr + " AND " +domainWhereStr;
    	    }    	 
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

   selectStr = selectStr + " OFFSET " + fromPosition;
   if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;
   int number = 0;
   try
    {
     statement = connection.prepareStatement(selectStr);
     number = setParameters(aFilterObject, statement);

			if (condition.length() > 0 && aBindObjects != null)
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENActShort();

				anObject.code = set.getInt(1);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;
				anObject.numberGen = set.getString(2);
				anObject.dateGen = set.getDate(3);
				anObject.finMolCode = set.getString(4);
				anObject.finMolName = set.getString(5);
				anObject.finMechanicName = set.getString(6);
				anObject.invNumber = set.getString(7);
				anObject.userGen = set.getString(8);
				anObject.dateEdit = set.getDate(9);
				anObject.dateAct = set.getDate(10);

				anObject.statusRefCode = set.getInt(11);
				if (set.wasNull())
					anObject.statusRefCode = Integer.MIN_VALUE;
				anObject.statusRefName = set.getString(12);
				anObject.elementCode = set.getInt(13);
				if (set.wasNull())
					anObject.elementCode = Integer.MIN_VALUE;
				anObject.actTypeRefCode = set.getInt(14);
				if (set.wasNull())
					anObject.actTypeRefCode = Integer.MIN_VALUE;
				anObject.actTypeRefName = set.getString(15);
				anObject.actTypeRefShortName = set.getString(16);

				anObject.planWorkTypeName = set.getString(17);
				anObject.humanHours = set.getBigDecimal(18);
				if (anObject.humanHours != null)
					anObject.humanHours = anObject.humanHours.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				anObject.checkedByAccountant = set.getBoolean(19);
				if ( set.wasNull() ) {
					anObject.checkedByAccountant = null;
				}
				

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
			return null;
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

  public ENActShortList getScrollableFilteredListForReconstrModernizac(ENAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector<? extends Object> aBindObjects) throws PersistenceException
  {
   ENActShortList result = new ENActShortList();
   ENActShort anObject;
   result.list = new Vector<ENActShort>();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENACT.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENACT.CODE"+
    ",ENACT.NUMBERGEN"+
    ",ENACT.DATEGEN"+
    ",ENACT.FINMOLCODE"+
    ",ENACT.FINMOLNAME"+
    ",ENACT.FINMECHANICNAME"+
    ",ENACT.INVNUMBER"+
    ",ENACT.USERGEN"+
    ",ENACT.DATEEDIT"+
    ",ENACT.DATEACT"+

     ", ENACTSTATUS.CODE " +
     ", ENACTSTATUS.NAME " +
     ", ENELEMENT.CODE " +
     ", ENPLANWORKSTATE.CODE " +
     ", ENPLANWORKSTATE.NAME " +
     ", ENPLANWORKSTATE.SHORTNAME " +
     ", ENACT.CHECKEDBYACCOUNTANT " +
    " FROM ENACT " +
    ", ENACTSTATUS " +
    ", ENELEMENT " +
    ", ENPLANWORKSTATE " +
    //" WHERE "
    "";
    whereStr = " ENACTSTATUS.CODE = ENACT.STATUSREFCODE" ; //+
     whereStr = whereStr +" AND ENELEMENT.CODE = ENACT.ELEMENTCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORKSTATE.CODE = ENACT.ACTTYPEREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENACT.CODE IN ( SELECT ENACT.CODE FROM ENACT ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT.CODE = ?";
       }
        if (aFilterObject.numberGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT.NUMBERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT.NUMBERGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.dateGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT.DATEGEN = ?";
       }
        if (aFilterObject.finMolCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finMolCode.indexOf('*',0) < 0 && aFilterObject.finMolCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT.FINMOLCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT.FINMOLCODE) LIKE UPPER(?)";
        }
        if (aFilterObject.finMolName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finMolName.indexOf('*',0) < 0 && aFilterObject.finMolName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT.FINMOLNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT.FINMOLNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.finMechanicCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finMechanicCode.indexOf('*',0) < 0 && aFilterObject.finMechanicCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT.FINMECHANICCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT.FINMECHANICCODE) LIKE UPPER(?)";
        }
        if (aFilterObject.finMechanicName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finMechanicName.indexOf('*',0) < 0 && aFilterObject.finMechanicName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT.FINMECHANICNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT.FINMECHANICNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT.COMMENTGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT.COMMENTGEN) LIKE UPPER(?)";
        }
        if (aFilterObject.invNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT.INVNUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT.INVNUMBER) LIKE UPPER(?)";
        }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT.USERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT.USERGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT.DATEEDIT = ?";
       }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT.DOMAIN_INFO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT.DOMAIN_INFO) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT.MODIFY_TIME = ?";
       }
       if(aFilterObject.dateAct != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT.DATEACT = ?";
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENACT.STATUSREFCODE = ? ";
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENACT.ELEMENTCODE = ? ";
       }
       if(aFilterObject.actTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENACT.ACTTYPEREFCODE = ? ";
       }

     }


   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENAct.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("ENACT",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND ENACT.DOMAIN_INFO IS NOT NULL";
   //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
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

   selectStr = selectStr + " OFFSET " + fromPosition;
   if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }

          if(aFilterObject.numberGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.numberGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.dateGen != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
       }
          if(aFilterObject.finMolCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.finMolCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.finMolName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.finMolName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.finMechanicCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.finMechanicCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.finMechanicName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.finMechanicName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.commentGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.commentGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.invNumber != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.invNumber);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.userGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.userGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
       }

          if(aFilterObject.domain_info != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.domain_info);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
       if(aFilterObject.dateAct != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateAct.getTime()));
       }
      if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.statusRef.code);
      }
      if(aFilterObject.element.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.element.code);
      }
      if(aFilterObject.actTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.actTypeRef.code);
      }
     }

     if(condition.length() > 0 && aBindObjects != null)
      _bindObjectsToPreparedStatement(statement,aBindObjects,number);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       /*
       if(i < fromPosition)
        continue;
       else if(i >= fromPosition + quantity)
        {
         i++;
         break;
        }
        */

       anObject = new ENActShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.numberGen = set.getString(2);
       anObject.dateGen = set.getDate(3);
       anObject.finMolCode = set.getString(4);
       anObject.finMolName = set.getString(5);
       anObject.finMechanicName = set.getString(6);
       anObject.invNumber = set.getString(7);
       anObject.userGen = set.getString(8);
       anObject.dateEdit = set.getDate(9);
       anObject.dateAct = set.getDate(10);

       anObject.statusRefCode = set.getInt(11);
        if(set.wasNull())
        anObject.statusRefCode = Integer.MIN_VALUE;
       anObject.statusRefName = set.getString(12);
       anObject.elementCode = set.getInt(13);
        if(set.wasNull())
        anObject.elementCode = Integer.MIN_VALUE;
       anObject.actTypeRefCode = set.getInt(14);
        if(set.wasNull())
        anObject.actTypeRefCode = Integer.MIN_VALUE;
       anObject.actTypeRefName = set.getString(15);
       anObject.actTypeRefShortName = set.getString(16);
       anObject.checkedByAccountant = set.getBoolean(17);
       if(set.wasNull()) {
    	   anObject.checkedByAccountant = null;
       }

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


  public boolean existsNOSEGR(int anObjectCode) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   if(anObjectCode == Integer.MIN_VALUE)
    return false;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   /*
   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENAct.getObject%} access denied");
   */

   selectStr =

   "SELECT  ENACT.CODE FROM  ENACT WHERE  ENACT.CODE = ?";

   /*
   String segregationWhereStr = SegregationQueryBuilder.addWhere("ENACT",segregationInfo,getUserProfile().getDomainInfo());
   if(segregationWhereStr.length() > 0)
    selectStr = selectStr +
     " AND " + segregationWhereStr;
   */

   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1,anObjectCode);
     set = statement.executeQuery();
     if(set.next())
      return true;
     return false;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return false;
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

  public ENAct getObjectNOSEGR(int uid) throws PersistenceException
  {
   ENAct result = new ENAct();
   result.code = uid;
   loadObject(result, true);
   if(result.code == Integer.MIN_VALUE)
    return null;
   return result;
  }
  
  	/**
  	 * 
  	 * Проверить находится ли акт {@link ENAct} в заданных статусах
  	 * 
  	 * @param obj объект акта {@link ENAct}, который нужно проверить
  	 * @param isException {@code true} - будет сгенерировано исключение, {@code false} - не будет
  	 * @param checkIsInStatus {@code true} - проверить на совпадение в заданных статусах, {@code false} - проверить на отсутствие в заданных статусах
  	 * @param statusCodes коды статусов, которые нужно проверить
  	 * @return {@code true} - если статус акта отвечает заданным условиям и {@code false} - если не отвечает
  	 * @throws PersistenceException
  	 */
	public boolean checkENActStatuses(ENAct obj, boolean isException, boolean checkIsInStatus, int... statusCodes) throws PersistenceException {
		if(obj == null || obj.code == Integer.MIN_VALUE) throw new java.lang.NullPointerException();
		ENActStatusDAO statusDao = new ENActStatusDAO(this.getConnection(), this.getUserProfile());
		ENAct tempObj = this.getObject(obj.code);
		if(tempObj == null) throw new java.lang.NullPointerException();
		ENActStatus objectStatus = statusDao.getObject(tempObj.statusRef.code);
		Hashtable<Integer, ENActStatus> statuses = new Hashtable<Integer, ENActStatus>();
		for(int statusCode : statusCodes) {
			ENActStatus status = statusDao.getObject(statusCode);
			if(status == null) throw new java.lang.NullPointerException(String.format("Невідомий код статусу: %d", statusCode));
			statuses.put(statusCode, status);
		}
		boolean result = (checkIsInStatus) ? statuses.containsKey(obj.statusRef.code) : !statuses.containsKey(obj.statusRef.code);
		if(!result && isException) {
			String err = "";
			if(checkIsInStatus) {
				err = String.format("Акт № %s від %s", tempObj.numberGen, new SimpleDateFormat("dd.MM.yyyy").format(tempObj.dateGen));
				if(statuses.size() == 1) {
					err += String.format(" повинен бути у стані \"%s\".", statuses.get(statusCodes[0]).name);					
				} else {
					String statusConcat = "";
					for(Enumeration<ENActStatus> enume = statuses.elements(); enume.hasMoreElements();) {
						statusConcat += ((statusConcat.length() > 0) ? ", " : "") + String.format("\"%s\"", enume.nextElement().getName());
					}
					
					err += String.format(" повинен бути в одному із наступних станів: %s", statusConcat);
				}
				err += String.format("\n Поточний стан акту: \"%s\"", objectStatus.name);
			} else {
				err = String.format("Акт № %s від %s перебуває у стані \"%s\""
						, tempObj.numberGen, new SimpleDateFormat("dd.MM.yyyy").format(tempObj.dateGen), objectStatus.name);
			}
			
			throw new SystemException(err);
		}
		
		return result;
	}
	
	/**
	 * 
	 * Выборка актов по объекту тех. условий {@link ENTechConditionsServices}
	 * 
	 * @param techCondServices объект тех. условий {@link ENTechConditionsServices}
	 * @param typeCodes коллекция типов актов, если задана, то выборка отфильтруется согласно этому перечню 
	 * @param statusCodes коллекция статусов, если задана, то выборка отфильтруется согласно этому перечню
	 * @return список актов {@link ENActShortList}
	 * @throws PersistenceException
	 */
	public ENActShortList getActListByENTechConditionsServices(ENTechConditionsServices techCondServices
			, Collection<Integer> typeCodes, Collection<Integer> statusCodes) 
			throws PersistenceException {
		if(techCondServices == null || techCondServices.code == Integer.MIN_VALUE) {
			throw new SystemException("Не задані технічні умови для вибору актів!");
		}
		ENActFilter filter = new ENActFilter();
		filter.conditionSQL = " EXISTS ( " +
				" SELECT FROM enact2enplanwork AS acpw1 " +
				" 	INNER JOIN entechcond2planwork AS tcpw1 ON acpw1.plancode = tcpw1.planrefcode " +
				" WHERE tcpw1.techconservicesrefcode = ? " +
				" 	AND acpw1.actrefcode = enact.code " +
				") "
				+ ((typeCodes != null && typeCodes.size() > 0) 
						? String.format(" AND enact.acttyperefcode IN (%s)", Tools.repeatSymbol("?", ",", typeCodes.size())) 
								: "")
				+ ((statusCodes != null && statusCodes.size() > 0) 
						? String.format(" AND enact.statusrefcode IN (%s)", Tools.repeatSymbol("?", ",", statusCodes.size())) 
								: "");
		
		
		Vector<Integer> params = new Vector<Integer>();
		params.add(techCondServices.code);
		filter.orderBySQL = String.format("%s asc", ENAct.dateAct_QFielld);
		if(typeCodes != null) for(int typeCode : typeCodes) params.add(typeCode);
		if(statusCodes != null) for(int statusCode : statusCodes) params.add(statusCode);
		return this.getScrollableFilteredList(filter, 0, -1, params);
	}
	
	public ENActShortList getActListByENElement(ENElement element, Collection<Integer> typeCodes, Collection<Integer> statusCodes) throws PersistenceException {
		ENActFilter filter = this.getFilterForParameters(element, typeCodes, statusCodes);
		Vector<Integer> params = this.getCollectionOfParameters(typeCodes, statusCodes);
		return this.getScrollableFilteredList(filter, 0, -1, params);
	}
	
	public int[] getArrayOfCodesByENElement(ENElement element, Collection<Integer> typeCodes, Collection<Integer> statusCodes) throws PersistenceException {
		ENActFilter filter = this.getFilterForParameters(element, typeCodes, statusCodes);
		Vector<Integer> params = this.getCollectionOfParameters(typeCodes, statusCodes);
		return this.getFilteredCodeArray(filter, 0, -1, params);
	}
	
	
	private ENActFilter getFilterForParameters(ENElement element, Collection<Integer> typeCodes, Collection<Integer> statusCodes) {
		if(element == null || element.code == Integer.MIN_VALUE) {
			throw new SystemException("Не задан елемент для вибору актів!");
		}
		ENActFilter filter = new ENActFilter();
		filter.element.code = element.code;
		filter.conditionSQL = BaseDAOUtils.addToCondition(((typeCodes != null && typeCodes.size() > 0) 
				? String.format("enact.acttyperefcode IN (%s)", Tools.repeatSymbol("?", ",", typeCodes.size())) 
						: ""), filter.conditionSQL);
		filter.conditionSQL = BaseDAOUtils.addToCondition(((statusCodes != null && statusCodes.size() > 0) 
				? String.format("enact.statusrefcode IN (%s)", Tools.repeatSymbol("?", ",", statusCodes.size())) 
						: ""), filter.conditionSQL);
		return filter;
	}
	
	private Vector<Integer> getCollectionOfParameters(Collection<Integer> typeCodes, Collection<Integer> statusCodes) {
		Vector<Integer> params = new Vector<Integer>();
		if(typeCodes != null) for(int typeCode : typeCodes) params.add(typeCode);
		if(statusCodes != null) for(int statusCode : statusCodes) params.add(statusCode);
		return params;
	}

	public int[] getFilteredCodeArrayNoSegr(ENActFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArrayNoSegr(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArrayNoSegr(ENActFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArrayNoSegr(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArrayNoSegr(ENAct aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACT.CODE FROM ENACT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		if(whereStr.length() == 0) {
			whereStr = " (ENACT.DOMAIN_INFO IS NOT NULL) ";
		} else {
			whereStr = " "+whereStr;
		}

		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);

		if(whereStr.length() != 0) {
			selectStr = selectStr + " WHERE " + whereStr;
		}

		selectStr = selectStr + " ORDER BY " + orderBy;
		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;

		try {
			statement = connection.prepareStatement(selectStr);
			int number = setParameters(aFilterObject, statement);

			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement,aBindObjects,number);
			}

			set = statement.executeQuery();
			int i;
			for(i = 0;set.next();i++) {
				if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}
				result.add(set.getInt(1));
			}

			int[] array = new int[result.size()];
			for(int j = 0;j < result.size();j++) {
				array[j] = result.get(j);
			}
			return array;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	} // end of getFilteredCodeArray
} // end of ENActDAO

