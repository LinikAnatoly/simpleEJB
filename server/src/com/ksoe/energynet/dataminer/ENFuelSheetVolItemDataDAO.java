
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENFuelSheetVolItemDataDAOGen;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENFuelSheetVolItemData;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.brief.ENFuelSheetVolItemDataShort;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolItemDataShortList;
import com.ksoe.energypro.util.Tools;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENFuelSheetVolItemData;
 *
 */

public class ENFuelSheetVolItemDataDAO extends ENFuelSheetVolItemDataDAOGen {

    public ENFuelSheetVolItemDataDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENFuelSheetVolItemDataDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    /**
     *  возвращает набор данных для формирования ведомости выдачи ПММ
     *
     *  @param startDate - начало периода
     *  @param endDate   - начало периода
     *  @param fuelType  - тип топлива
     *  @throws PersistenceException
     *
     */
	public ENFuelSheetVolItemDataShortList getDataList(Date startDate,
			Date endDate, String fuelType) throws PersistenceException {

		ENFuelSheetVolItemDataShortList result = new ENFuelSheetVolItemDataShortList();
		ENFuelSheetVolItemDataShort anObject;
		result.list = new Vector();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

		selectStr = "select * from (select pw.code as plan_code, pw.datestart as datestart,  \n" +
				"\t\t\t\t  ei.countfact  as countfact,\n" +
				"\t\t\t\t pw.kindcode as kindcode, pw.staterefcode as staterefcode, pw.typerefcode as typerefcode, pw.budgetrefcode as budgetrefcode, ei.materialrefcode, \n" +
				"\t\t\t\t case when ei.kindrefcode = " + ENEstimateItemKind.GSM + " and t.transportrealcode is not null then\n" +
				"\t\t\t\t (select treal.transportdepartmntrfcd from tktransportreal treal where treal.code = t.transportrealcode) \n" +
				"\t\t\t\t else \n" +
				"\t\t\t\t (select tdep.transportdepartmentcod from entransportdep2dep tdep where tdep.departmentcode = pw.departmentrefcode) end as transport_department, \n" +
				"\t\t\t\t pw.departmentrefcode,\n" +
				"                 ei.kindrefcode "

				+ "\t\t\t\t from enplanwork pw,\n" +
				"                 enworkorder2enplanwork wo2pw, \n" +
				"\t\t\t\t enestimateitem ei left join entransport2enestimate t2e on (ei.code = t2e.estimaterefcode) \n" +
				"\t\t\t\t  left join entransportitem t on (t2e.transportrefcode = t.code) \n" +
				"                  left join  tktransportreal trr on (trr.code = t.transportrealcode and trr.transportstatuscode = 75000000)\n" +
				"\t\t\t\t  left join entrnsprtrdr2trnsprttm t2t on (t2t.transportitemcode = t.code) \n" +
				"\t\t\t\t  left join enplanworkitem on (ei.planitemrefcode = enplanworkitem.code)"

				+ " where pw.code = ei.planrefcode "
				+ " and pw.datestart between " + Tools.convertDateToSQLString(startDate) + " and " + Tools.convertDateToSQLString(endDate)
				+ " and pw.kindcode = " + ENPlanWorkKind.NPW
				+ " and wo2pw.plancode = pw.code "
				+ " and ei.materialrefcode in (select array2items(string_to_array('" + fuelType + "',','))::double precision) "
				+ " and ei.countfact > 0 "
				+ " and ((ei.kindrefcode =  " + ENEstimateItemKind.MATERIALS + "  and enplanworkitem.countgen > 0) or \n" +
				"\t\t\t\t (ei.kindrefcode =  " + ENEstimateItemKind.GSM + "  and pw.kindcode =  " + ENPlanWorkKind.NPW + "  and enplanworkitem.countgen > 0 and t2t.transportordercode is not null) ) ) w where w.countfact > 0 ";


		try {
			statement = connection.prepareStatement(selectStr);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENFuelSheetVolItemDataShort();

				anObject.plan_code = set.getInt(1);
				anObject.datestart = set.getDate(2);
				anObject.countfact = set.getBigDecimal(3);
				if (anObject.countfact != null)
					anObject.countfact = anObject.countfact.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);

				anObject.kindcode = set.getInt(4);
				anObject.staterefcode = set.getInt(5);
				anObject.typerefcode = set.getInt(6);
				anObject.budgetrefcode = set.getInt(7);
				anObject.materialrefcode = set.getInt(8);
				anObject.transport_department = set.getInt(9);
				anObject.departmentrefcode = set.getInt(10);
				anObject.eikindcode = set.getInt(11);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
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
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}
	
	  public ENFuelSheetVolItemDataShortList getScrollableFilteredList(ENFuelSheetVolItemData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
	   {
	    ENFuelSheetVolItemDataShortList result = new ENFuelSheetVolItemDataShortList();
	    ENFuelSheetVolItemDataShort anObject;
	    result.list = new Vector();

	    String     selectStr;
	    Connection connection = getConnection();
	    PreparedStatement statement = null;
	    ResultSet  set = null;
	    String     whereStr = "";
	    String     condition = processCondition(anCondition);
	    String     orderBy = processCondition(anOrderBy);

	    if(orderBy.length() == 0)
	     orderBy = "ENFUELSHEETVOLITEMDATA.CODE";

	    if(quantity < 0)
	     quantity = Integer.MAX_VALUE/2;

	    if(getUserProfile() == null)
	     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	    selectStr = "SELECT "+
	     "ENFUELSHEETVOLITEMDATA.CODE"+
	     ",ENFUELSHEETVOLITEMDATA.PLAN_CODE"+
	     ",ENFUELSHEETVOLITEMDATA.DATESTART"+
	     ",ENFUELSHEETVOLITEMDATA.COUNTFACT"+
	     ",ENFUELSHEETVOLITEMDATA.KINDCODE"+
	     ",ENFUELSHEETVOLITEMDATA.STATEREFCODE"+
	     ",ENFUELSHEETVOLITEMDATA.TYPEREFCODE"+
	     ",ENFUELSHEETVOLITEMDATA.BUDGETREFCODE"+
	     ",ENFUELSHEETVOLITEMDATA.MATERIALREFCODE"+
	     ",ENFUELSHEETVOLITEMDATA.TRANSPORT_DEPARTMENT"+
	     ",ENFUELSHEETVOLITEMDATA.DEPARTMENTREFCODE"+

	      ", ENFUELSHEETVOLUMES.CODE " +
	      ", ENFUELSHEETVOLUMES.NAME " +
	      ", ENFUELSHEETVOLUMES.DATEGEN " +
	      ", ENFUELSHEETVOLUMES.STARTDATE " +
	      ", ENFUELSHEETVOLUMES.ENDDATE " +
	      ", ENFUELSHEETVOLUMES.FUELTYPE " +
	      ", ENFUELSHEETVOLUMES.USERADD " +
	      ", ENFUELSHEETVOLUMES.DATEADD " +
	      ", ENFUELSHEETVOLUMES.USERGEN " +
	      ", ENFUELSHEETVOLUMES.DATEEDIT " +
	      
          ", (select e.ENAME from ENELEMENTDATA e where enplanwork.elementrefcode = e.ecode) as ename " +
          ", (select e.INVNUMBER from enelementdata e where  enplanwork.elementrefcode = e.ecode) as INVNUMBER " +
	      ", (select k.name from enplanworkkind k where k.code = ENFUELSHEETVOLITEMDATA.KINDCODE) as kindname " +
	      ", (select s.shortname from enplanworkstate s where s.code = ENFUELSHEETVOLITEMDATA.STATEREFCODE) as stateshortname " +
	      ", (select t.name from enplanworktype t where t.code = ENFUELSHEETVOLITEMDATA.TYPEREFCODE) as typename " +
	      ", (select b.shortname from endepartment b where b.code = ENFUELSHEETVOLITEMDATA.BUDGETREFCODE) as budgetshortname " +
	      ", (select m.name from tkmaterials m where m.code = ENFUELSHEETVOLITEMDATA.MATERIALREFCODE) as materialname " +
	      ", (select d.shortname from endepartment d where d.code = ENFUELSHEETVOLITEMDATA.DEPARTMENTREFCODE) as departmentshortname " +
	      ", (select s.name from enplanworkstatus s where s.code = ENPLANWORK.statuscode) as statusname " +
	      ", (select r.name from epren r where r.code = ENPLANWORK.renrefcode) as renname " +
		 " ,ENFUELSHEETVOLITEMDATA.DEPARTMENTREFCODE"+
	     " FROM ENFUELSHEETVOLUMES " +
	     ", ENFUELSHEETVOLITEMDATA " +
         ", ENPLANWORK "; 

	    
	     whereStr = " ENFUELSHEETVOLUMES.CODE = ENFUELSHEETVOLITEMDATA.SHEETVOLUMESREFCODE " ;
	     whereStr = whereStr + " AND ENPLANWORK.CODE = ENFUELSHEETVOLITEMDATA.PLAN_CODE";
 
	      if(aFilterObject != null)
	      {
	        if(aFilterObject.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENFUELSHEETVOLITEMDATA.CODE = ?";
	        }
	        if(aFilterObject.plan_code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENFUELSHEETVOLITEMDATA.PLAN_CODE = ?";
	        }
	        if(aFilterObject.datestart != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENFUELSHEETVOLITEMDATA.DATESTART = ?";
	        }
	        if(aFilterObject.countfact != null) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENFUELSHEETVOLITEMDATA.COUNTFACT = ?";
	        }
	        if(aFilterObject.kindcode != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENFUELSHEETVOLITEMDATA.KINDCODE = ?";
	        }
	        if(aFilterObject.staterefcode != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENFUELSHEETVOLITEMDATA.STATEREFCODE = ?";
	        }
	        if(aFilterObject.typerefcode != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENFUELSHEETVOLITEMDATA.TYPEREFCODE = ?";
	        }
	        if(aFilterObject.budgetrefcode != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENFUELSHEETVOLITEMDATA.BUDGETREFCODE = ?";
	        }
	        if(aFilterObject.materialrefcode != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENFUELSHEETVOLITEMDATA.MATERIALREFCODE = ?";
	        }
	        if(aFilterObject.transport_department != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENFUELSHEETVOLITEMDATA.TRANSPORT_DEPARTMENT = ?";
	        }
	        if(aFilterObject.departmentrefcode != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "  ENFUELSHEETVOLITEMDATA.DEPARTMENTREFCODE = ?";
	        }
	        if(aFilterObject.sheetVolumesRef.code != Integer.MIN_VALUE) {
	            if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	            whereStr = whereStr + "ENFUELSHEETVOLITEMDATA.SHEETVOLUMESREFCODE = ? ";
	        }

	      }

	    

	      if(condition.length() != 0)
	      {
	         if(whereStr.length() != 0)
	            whereStr = whereStr + " AND ";

	         whereStr = whereStr + " (" + condition + ")";
	      }
	// + " WHERE" +  сделано выше ????
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
	         if(aFilterObject.plan_code != Integer.MIN_VALUE){
	             number++;
	             statement.setInt(number,aFilterObject.plan_code);
	         }
	        if(aFilterObject.datestart != null){
	            number++;
	            statement.setDate(number,new java.sql.Date(aFilterObject.datestart.getTime()));
	        }
	        if(aFilterObject.countfact != null){
	            number++;
	            aFilterObject.countfact = aFilterObject.countfact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	            statement.setBigDecimal(number,aFilterObject.countfact);
	        }
	         if(aFilterObject.kindcode != Integer.MIN_VALUE){
	             number++;
	             statement.setInt(number,aFilterObject.kindcode);
	         }
	         if(aFilterObject.staterefcode != Integer.MIN_VALUE){
	             number++;
	             statement.setInt(number,aFilterObject.staterefcode);
	         }
	         if(aFilterObject.typerefcode != Integer.MIN_VALUE){
	             number++;
	             statement.setInt(number,aFilterObject.typerefcode);
	         }
	         if(aFilterObject.budgetrefcode != Integer.MIN_VALUE){
	             number++;
	             statement.setInt(number,aFilterObject.budgetrefcode);
	         }
	         if(aFilterObject.materialrefcode != Integer.MIN_VALUE){
	             number++;
	             statement.setInt(number,aFilterObject.materialrefcode);
	         }
	         if(aFilterObject.transport_department != Integer.MIN_VALUE){
	             number++;
	             statement.setInt(number,aFilterObject.transport_department);
	         }
	         if(aFilterObject.departmentrefcode != Integer.MIN_VALUE){
	             number++;
	             statement.setInt(number,aFilterObject.departmentrefcode);
	         }
	       if(aFilterObject.sheetVolumesRef.code != Integer.MIN_VALUE) {
	           number++;
	           statement.setInt(number,aFilterObject.sheetVolumesRef.code);
	       }
	      }

	      if(condition.length() > 0 && aBindObjects != null)
	       _bindObjectsToPreparedStatement(statement,aBindObjects,number);

	      set = statement.executeQuery();
	      int i;
	      for (i = 0; set.next(); i++) {
	        /*
	        if (i < fromPosition)
	          continue;
	        else if (i >= fromPosition + quantity) {
	          i++;
	          break;
	        } */

	        anObject = new ENFuelSheetVolItemDataShort();

	        anObject.code = set.getInt(1);
	        if ( set.wasNull() )
	            anObject.code = Integer.MIN_VALUE;
	        anObject.plan_code = set.getInt(2);
	        if ( set.wasNull() )
	            anObject.plan_code = Integer.MIN_VALUE;
	        anObject.datestart = set.getDate(3);
	        anObject.countfact = set.getBigDecimal(4);
	        if(anObject.countfact != null)
	            anObject.countfact = anObject.countfact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	        anObject.kindcode = set.getInt(5);
	        if ( set.wasNull() )
	            anObject.kindcode = Integer.MIN_VALUE;
	        anObject.staterefcode = set.getInt(6);
	        if ( set.wasNull() )
	            anObject.staterefcode = Integer.MIN_VALUE;
	        anObject.typerefcode = set.getInt(7);
	        if ( set.wasNull() )
	            anObject.typerefcode = Integer.MIN_VALUE;
	        anObject.budgetrefcode = set.getInt(8);
	        if ( set.wasNull() )
	            anObject.budgetrefcode = Integer.MIN_VALUE;
	        anObject.materialrefcode = set.getInt(9);
	        if ( set.wasNull() )
	            anObject.materialrefcode = Integer.MIN_VALUE;
	        anObject.transport_department = set.getInt(10);
	        if ( set.wasNull() )
	            anObject.transport_department = Integer.MIN_VALUE;
	        anObject.departmentrefcode = set.getInt(11);
	        if ( set.wasNull() )
	            anObject.departmentrefcode = Integer.MIN_VALUE;

	        anObject.sheetVolumesRefCode = set.getInt(12);
	    if(set.wasNull())
	      anObject.sheetVolumesRefCode = Integer.MIN_VALUE;
	        anObject.sheetVolumesRefName = set.getString(13);
	        anObject.sheetVolumesRefDateGen = set.getDate(14);
	        anObject.sheetVolumesRefStartDate = set.getDate(15);
	        anObject.sheetVolumesRefEndDate = set.getDate(16);
	        anObject.sheetVolumesRefFuelType = set.getInt(17);
	    if(set.wasNull())
	      anObject.sheetVolumesRefFuelType = Integer.MIN_VALUE;
	        anObject.sheetVolumesRefUserAdd = set.getString(18);
	        anObject.sheetVolumesRefDateAdd = set.getTimestamp(19);
	        anObject.sheetVolumesRefUserGen = set.getString(20);
	        anObject.sheetVolumesRefDateEdit = set.getTimestamp(21);

	        anObject.objectName = set.getString(22);
	        anObject.invNumber = set.getString(23);
	        anObject.kindName = set.getString(24);
	        anObject.stateRefShortName = set.getString(25);
	        anObject.typeRefName = set.getString(26);
	        anObject.budgetRefShortName = set.getString(27);
	        anObject.materialName = set.getString(28);
	        anObject.departmentRefShortName = set.getString(29);
	        anObject.statusName = set.getString(30);
	        anObject.renRefName = set.getString(31);

			  anObject.eikindcode = set.getInt(32);
			  if ( set.wasNull() )
				  anObject.eikindcode = Integer.MIN_VALUE;
	        
	         result.list.add(anObject);
	       }

	      result.setTotalCount(i);
	      return result;
	     }
	    catch(SQLException e)
	     {
	      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
	      throw new SystemException(e.getMessage(), e);
	      //return null;
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

	

} // end of ENFuelSheetVolItemDataDAO
