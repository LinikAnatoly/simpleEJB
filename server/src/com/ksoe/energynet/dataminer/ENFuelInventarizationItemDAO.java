
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENFuelInventarizationItemDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENFuelInventarization;
import com.ksoe.energynet.valueobject.ENFuelInventarizationItem;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.brief.ENFuelInventarizationItemShort;
import com.ksoe.energynet.valueobject.filter.ENFuelInventarizationItemFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelInventarizationItemShortList;

/**
 * DAO Object for ENFuelInventarizationItem;
 *
 */

public class ENFuelInventarizationItemDAO extends ENFuelInventarizationItemDAOGen {

    public ENFuelInventarizationItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENFuelInventarizationItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    
    public int add(ENFuelInventarizationItem anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();
        
     return add(anObject,true);
    }
    
    public void save(ENFuelInventarizationItem anObject) throws PersistenceException
    {
     anObject.userGen = getUserProfile().userName;
     anObject.dateEdit = new Date();
     save(anObject,null);
    }
    
    public ENFuelInventarizationItemShortList getScrollableFilteredList(ENFuelInventarizationItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENFuelInventarizationItemShortList result = new ENFuelInventarizationItemShortList();
     ENFuelInventarizationItemShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENFUELINVENTARIZATINTM.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENFUELINVENTARIZATINTM.CODE"+
      ",ENFUELINVENTARIZATINTM.COUNTGEN"+
      ",ENFUELINVENTARIZATINTM.COUNTFACT"+
      ",ENFUELINVENTARIZATINTM.USERADD"+
      ",ENFUELINVENTARIZATINTM.DATEADD"+
      ",ENFUELINVENTARIZATINTM.USERGEN"+
      ",ENFUELINVENTARIZATINTM.DATEEDIT"+

       ", ENFUELINVENTARIZATION.CODE " +
       ", ENFUELINVENTARIZATION.NUMBERGEN " +
       ", ENFUELINVENTARIZATION.DATEGEN " +
       ", ENFUELINVENTARIZATION.MOLCODE " +
       ", ENFUELINVENTARIZATION.MOLNAME " +
       ", ENFUELINVENTARIZATION.COMMENTGEN " +
       ", ENFUELINVENTARIZATION.USERADD " +
       ", ENFUELINVENTARIZATION.DATEADD " +
       ", ENFUELINVENTARIZATION.USERGEN " +
       ", ENFUELINVENTARIZATION.DATEEDIT " +
       ", TKFUELTYPE.CODE " +
       ", TKFUELTYPE.NAME " +
       ", TKTRANSPORTREAL.CODE " +
       ", TKTRANSPORTREAL.NAME " +
       ", TKTRANSPORTREAL.INVNUMBER " +
       ", TKTRANSPORTREAL.GOSNUMBER " +
       ", ENTRAVELSHEET.CODE " +
       ", ENTRAVELSHEET.NUMBERGEN " +
       ", ENTRAVELSHEET.DATESTART " +
       ", ENTRAVELSHEET.DATEFINAL " +
       ", ENTRAVELSHEET.SPEEDOMETERSTART " +
       ", ENTRAVELSHEET.SPEEDOMETERFINAL " +
       ", ENTRAVELSHEET.FUELCOUNTERSTART " +
       ", ENTRAVELSHEET.FUELCOUNTERFINAL " +
       ", ENTRAVELSHEET.TIMESTART " +
       ", ENTRAVELSHEET.TIMEFINAL " +
       ", ENTRAVELSHEET.DATEEDIT " +
       ", ENTRAVELSHEET.USERGEN " +
       ", ENFUELINVENTARIZATINTM.TRAVELFUELTYPEREFCODE" + 
      " FROM ENFUELINVENTARIZATINTM " +
      ", ENFUELINVENTARIZATION " +
      ", TKFUELTYPE " +
      ", TKTRANSPORTREAL " +
      ", ENTRAVELSHEET " +
      //" WHERE "
   "";
      whereStr = " ENFUELINVENTARIZATION.CODE = ENFUELINVENTARIZATINTM.INVENTARIZATIONREFCODE" ; //+
       whereStr = whereStr +" AND TKFUELTYPE.CODE = ENFUELINVENTARIZATINTM.FUELTYPEREFCODE" ; //+
       whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENFUELINVENTARIZATINTM.TRANSPORTREALREFCODE" ; //+
       whereStr = whereStr +" AND ENTRAVELSHEET.CODE = ENFUELINVENTARIZATINTM.TRAVELSHEETREFCODE" ; //+
     //selectStr = selectStr + " ${s} ENFUELINVENTARIZATINTM.CODE IN ( SELECT ENFUELINVENTARIZATINTM.CODE FROM ENFUELINVENTARIZATINTM ";

       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVENTARIZATINTM.CODE = ?";
         }
         if(aFilterObject.countGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVENTARIZATINTM.COUNTGEN = ?";
         }
         if(aFilterObject.countFact != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVENTARIZATINTM.COUNTFACT = ?";
         }
          if (aFilterObject.userAdd != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENFUELINVENTARIZATINTM.USERADD) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENFUELINVENTARIZATINTM.USERADD) LIKE UPPER(?)";
          }
         if(aFilterObject.dateAdd != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVENTARIZATINTM.DATEADD = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENFUELINVENTARIZATINTM.USERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENFUELINVENTARIZATINTM.USERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVENTARIZATINTM.DATEEDIT = ?";
         }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVENTARIZATINTM.MODIFY_TIME = ?";
         }
         if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENFUELINVENTARIZATINTM.INVENTARIZATIONREFCODE = ? ";
         }
         if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENFUELINVENTARIZATINTM.FUELTYPEREFCODE = ? ";
         }
         if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENFUELINVENTARIZATINTM.TRANSPORTREALREFCODE = ? ";
         }
         if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENFUELINVENTARIZATINTM.TRAVELSHEETREFCODE = ? ";
         }
         
         if(aFilterObject.travelFuelTypeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENFUELINVENTARIZATINTM.TRAVELFUELTYPEREFCODE = ? ";
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
         if(aFilterObject.countGen != null){
             number++;
             aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.countGen);
         }
         if(aFilterObject.countFact != null){
             number++;
             aFilterObject.countFact = aFilterObject.countFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.countFact);
         }

            if(aFilterObject.userAdd != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userAdd);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.dateAdd != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
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
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
         }
         if(aFilterObject.modify_time != Long.MIN_VALUE){
             number++;
             if(aFilterObject.modify_time == Long.MIN_VALUE)
                 statement.setBigDecimal(number,null);
             else
                 statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
         }
        if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.inventarizationRef.code);
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.fuelTypeRef.code);
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.transportRealRef.code);
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.travelSheetRef.code);
        }
        if(aFilterObject.travelFuelTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.travelFuelTypeRef.code);
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

         anObject = new ENFuelInventarizationItemShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.countGen = set.getBigDecimal(2);
         if(anObject.countGen != null)
             anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.countFact = set.getBigDecimal(3);
         if(anObject.countFact != null)
             anObject.countFact = anObject.countFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.userAdd = set.getString(4);
         anObject.dateAdd = set.getTimestamp(5);
         anObject.userGen = set.getString(6);
         anObject.dateEdit = set.getTimestamp(7);

         anObject.inventarizationRefCode = set.getInt(8);
     if(set.wasNull())
       anObject.inventarizationRefCode = Integer.MIN_VALUE;
         anObject.inventarizationRefNumberGen = set.getString(9);
         anObject.inventarizationRefDateGen = set.getTimestamp(10);
         anObject.inventarizationRefMolCode = set.getString(11);
         anObject.inventarizationRefMolName = set.getString(12);
         anObject.inventarizationRefCommentGen = set.getString(13);
         anObject.inventarizationRefUserAdd = set.getString(14);
         anObject.inventarizationRefDateAdd = set.getTimestamp(15);
         anObject.inventarizationRefUserGen = set.getString(16);
         anObject.inventarizationRefDateEdit = set.getTimestamp(17);
         anObject.fuelTypeRefCode = set.getInt(18);
     if(set.wasNull())
       anObject.fuelTypeRefCode = Integer.MIN_VALUE;
         anObject.fuelTypeRefName = set.getString(19);
         anObject.transportRealRefCode = set.getInt(20);
     if(set.wasNull())
       anObject.transportRealRefCode = Integer.MIN_VALUE;
         anObject.transportRealRefName = set.getString(21);
         anObject.transportRealRefInvNumber = set.getString(22);
         anObject.transportRealRefGosNumber = set.getString(23);
         anObject.travelSheetRefCode = set.getInt(24);
     if(set.wasNull())
       anObject.travelSheetRefCode = Integer.MIN_VALUE;
         anObject.travelSheetRefNumberGen = set.getString(25);
         anObject.travelSheetRefDateStart = set.getDate(26);
         anObject.travelSheetRefDateFinal = set.getDate(27);
         anObject.travelSheetRefSpeedometerStart = set.getBigDecimal(28);
         if(anObject.travelSheetRefSpeedometerStart != null)
           anObject.travelSheetRefSpeedometerStart = anObject.travelSheetRefSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.travelSheetRefSpeedometerFinal = set.getBigDecimal(29);
         if(anObject.travelSheetRefSpeedometerFinal != null)
           anObject.travelSheetRefSpeedometerFinal = anObject.travelSheetRefSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.travelSheetRefFuelCounterStart = set.getBigDecimal(30);
         if(anObject.travelSheetRefFuelCounterStart != null)
           anObject.travelSheetRefFuelCounterStart = anObject.travelSheetRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.travelSheetRefFuelCounterFinal = set.getBigDecimal(31);
         if(anObject.travelSheetRefFuelCounterFinal != null)
           anObject.travelSheetRefFuelCounterFinal = anObject.travelSheetRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.travelSheetRefTimeStart = set.getTimestamp(32);
         anObject.travelSheetRefTimeFinal = set.getTimestamp(33);
         anObject.travelSheetRefDateEdit = set.getTimestamp(34);
         anObject.travelSheetRefUserGen = set.getString(35);
         anObject.travelFuelTypeRefCode = set.getInt(36);

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
  
    public ENFuelInventarizationItemShortList getInventarizationItemList(ENFuelInventarization inventarizationObject) throws PersistenceException
    {
     ENFuelInventarizationItemShortList result = new ENFuelInventarizationItemShortList();
     ENFuelInventarizationItemShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;


     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     /*'insert into enfuelinventarizatintm values ((select coalesce(max(code),0)+1 from enfuelinventarizatintm), ' ||
     tsfr.countgenfinal || ', 0, ''energynet'',''16.02.2014'',''energynet'',''16.02.2014'', 0, 1, ' || ft.code || 
     ', ' || tr.code || ', ' || ts.code || ', null);'  as ins, */
     
     selectStr = 
     
    " select  " + 
           " tr.code ," + 
    	   " tr.name || ' ' || tr.gosnumber || ' (' || tr.invnumber || ')' as tr_name, " + 
    	   " ft.code as fuel_code, " +  
           " ft.name as fuel_name, " + 
           " tsfr.countgenfinal as countgenfinal, " +
           " ts.code as travel_code, " + 
           " ts.numbergen as travel_number, " +
           " ts.timestart as travel_start, " +
           " ts.timefinal as travel_final, " +
          
           " coalesce((select sum(coalesce(fin.quantity,0)) " + 
           " from entravelsheet t1, entravelsheetitem t1i, entravlshttm2trnsprttm t1i2ti, " +
           "          entransport2enestimate ti2e, finmaterials fin, " + 
           "          enestimateitem ei " +
           " where t1.timefinal > tr_max.timefinal " + 
           " and t1.transportrealcode = tr_max.transportrealcode " +
           " and t1i.travelsheetrefcode = t1.code " + 
           " and t1i2ti.travelsheetitemrefcode = t1i.code " +
           " and t1i2ti.transportitemrefcode = ti2e.transportrefcode " + 
           " and ti2e.estimaterefcode = fin.estimateitemrefcode " +
           " and fin.statusrefcode = 1 " + 
           " and ei.code = ti2e.estimaterefcode " + 
           " and ei.materialrefcode = ft.materialrefcode " +
           " ),0) as reserved_fuel_in_next_period_quantity, " +
           
           " coalesce(cast((select " + 
           " sum((select sum(coalesce(cast(countfact as numeric(15,2)),0)) " +  
           "  from enestimateitem ei, entransport2enestimate ti2e, " + 
           " entravlshttm2trnsprttm t1i2ti " +
           "   where ei.code = ti2e.estimaterefcode " + 
           "     and t1i2ti.travelsheetitemrefcode = t1i.code " + 
           "     and t1i2ti.transportitemrefcode = ti2e.transportrefcode) - " + 
           "   (select sum(coalesce(cast(f.quantity as numeric(15,2)),0)) " +
           "    from finmaterials f , entransport2enestimate ti2e,  " + 
           " entravlshttm2trnsprttm t1i2ti " +
           "    where f.estimateitemrefcode = ti2e.estimaterefcode " +
           "      and t1i2ti.travelsheetitemrefcode = t1i.code " +
           "      and t1i2ti.transportitemrefcode = ti2e.transportrefcode " +
           "      and f.statusrefcode = 1 )) as not_bounded_qnty " +
           "    from entravelsheet t1, entravelsheetitem t1i  " +
           " where t1.timefinal <=  tr_max.timefinal " +
           " and to_date(to_char(t1.timefinal,'dd.MM.yyyy'),'dd.MM.yyyy') >= to_date('01.' || to_char(tr_max.timefinal ,'MM.yyyy'), 'dd.MM.yyyy') " +
           " and t1.transportrealcode = tr_max.transportrealcode " +
           " and t1i.travelsheetrefcode = t1.code " + 
           " and t1i.kindrefcode = 2 ) as numeric(15,2)),0) as not_bounded_fuel_in_past_period, " +
           
           " tsfr.travelsheetfueltyprfcd as travelfueltypecode " + 
           
           "  from " + 
           " (select max(ts.timefinal) as timefinal, ts.transportrealcode " +
           " from " +
           " entravelsheet ts, " + 
           " entravelsheetfuelremns fr "+ 
           " where " +  
           " ts.code = fr.travelsheetrefcode " + 
           " and ts.timestart <= '" +
           new SimpleDateFormat("dd.MM.yyyy").format(inventarizationObject.dateGen) +  " 23:59:59' " + 
           " and ts.statusrefcode = 4 " +
           " group by ts.transportrealcode ) as tr_max , " +
     " entravelsheet ts, entravelsheetfuelremns tsfr, tkfueltype ft, tktransportreal tr " +
     " where ts.timefinal = tr_max.timefinal " +
     " and ts.transportrealcode = tr_max.transportrealcode "+ 
     " and ts.code = tsfr.travelsheetrefcode " + 
     " and tsfr.fueltyperefcode = ft.code "+
     " and ft.materialrefcode in "+  
     " (select array2items(string_to_array(('75000843,75000844,500000120,500002447'),','))::double precision) " +
     " and tr.code = ts.transportrealcode " +
     " and exists (select from tktransportrealhistory h1 where h1.finmolcode = '" + inventarizationObject.molCode  + "' and h1.transportrealrefcode = tr.code) " +
     " and net.get_transport_real_mol(tr.code, to_date('" + Tools.dateFormatDefault.format(inventarizationObject.dateGen) + "', 'dd.mm.yyyy')) = '" + inventarizationObject.molCode + "'" +
     //"   and tr.finmolcode = '" + inventarizationObject.molCode + "'" +  
     "   and tsfr.countgenfinal > 0 " + 

     "  group by  tr.code,  tr.gosnumber,  tr.invnumber, " +   
           " ft.code ,  ft.name , " +
           " ts.code , ts.numbergen , ts.timestart , ts.timefinal, " + 
           " tr_max.timefinal, " +
           " (select sum(fin.quantity) " + 
           "    from entravelsheet t1, entravelsheetitem t1i, entravlshttm2trnsprttm t1i2ti, " +
           "         entransport2enestimate ti2e, finmaterials fin, " + 
           "         enestimateitem ei " +
           " where t1.timefinal > tr_max.timefinal " + 
           " and t1.transportrealcode = tr_max.transportrealcode " +
           " and t1i.travelsheetrefcode = t1.code " +
           " and t1i2ti.travelsheetitemrefcode = t1i.code " +
           " and t1i2ti.transportitemrefcode = ti2e.transportrefcode " +
           " and ti2e.estimaterefcode = fin.estimateitemrefcode " +
           " and fin.statusrefcode = 1 " +
           " and ei.code = ti2e.estimaterefcode " + 
           " and ei.materialrefcode = ft.materialrefcode " +
           " ) , " + 
           " coalesce(cast((select " +  
           " sum((select sum(coalesce(cast(countfact as numeric(15,2)),0)) " + 
           " from enestimateitem ei, entransport2enestimate ti2e,  entravlshttm2trnsprttm t1i2ti " + 
           "   where ei.code = ti2e.estimaterefcode " + 
           "   and t1i2ti.travelsheetitemrefcode = t1i.code " +
           "   and t1i2ti.transportitemrefcode = ti2e.transportrefcode " +
           "    ) - (select sum(coalesce(cast(f.quantity as numeric(15,2)),0)) " + 
           " from finmaterials f , entransport2enestimate ti2e,  entravlshttm2trnsprttm t1i2ti " + 
           " where f.estimateitemrefcode = ti2e.estimaterefcode " +
           " and t1i2ti.travelsheetitemrefcode = t1i.code " + 
           " and t1i2ti.transportitemrefcode = ti2e.transportrefcode " + 
           " and f.statusrefcode = 1 )) as not_bounded_qnty " +
           "    from entravelsheet t1, entravelsheetitem t1i  " +
           " where t1.timefinal <=  tr_max.timefinal " + 
           " and to_date(to_char(t1.timefinal,'dd.MM.yyyy'),'dd.MM.yyyy') >= to_date('01.' || to_char(tr_max.timefinal ,'MM.yyyy'), 'dd.MM.yyyy') " + 
           " and t1.transportrealcode = tr_max.transportrealcode " + 
           " and t1i.travelsheetrefcode = t1.code" +
           " and t1i.kindrefcode = 2 ) as numeric(15,2))) , " +
           " tsfr.countgenfinal, " +
           " tr_max.transportrealcode, " + 
           " ft.code, " +
           " tsfr.travelsheetfueltyprfcd" + 
           " order by ft.code , tr.invnumber ";

     try
      {
       statement = connection.prepareStatement(selectStr);
       set = statement.executeQuery();
       int i;
       for (i = 0; set.next(); i++) {


         anObject = new ENFuelInventarizationItemShort();

         anObject.transportRealRefCode = set.getInt(1);
     if(set.wasNull())
         anObject.transportRealRefCode = Integer.MIN_VALUE;
     
         anObject.transportRealRefName = set.getString(2);

         anObject.fuelTypeRefCode = set.getInt(3);
     if(set.wasNull())
         anObject.fuelTypeRefCode = Integer.MIN_VALUE;
     
         anObject.fuelTypeRefName = set.getString(4);
         
         anObject.countGen = set.getBigDecimal(5);
         if(anObject.countGen != null)
         anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
     
         anObject.travelSheetRefCode = set.getInt(6);
     if(set.wasNull())
         anObject.travelSheetRefCode = Integer.MIN_VALUE;
     
         anObject.travelSheetRefNumberGen = set.getString(7);
         
         anObject.travelSheetRefTimeStart = set.getTimestamp(8);
         anObject.travelSheetRefTimeFinal = set.getTimestamp(9);
         
         anObject.reserved_fuel_in_next_period_quantity = set.getBigDecimal(10);
         if(anObject.reserved_fuel_in_next_period_quantity != null)
         anObject.reserved_fuel_in_next_period_quantity = anObject.reserved_fuel_in_next_period_quantity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

         anObject.not_bounded_fuel_in_past_period = set.getBigDecimal(11);
         if(anObject.not_bounded_fuel_in_past_period != null)
         anObject.not_bounded_fuel_in_past_period = anObject.not_bounded_fuel_in_past_period.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

         anObject.travelFuelTypeRefCode = set.getInt(12);
         if(set.wasNull())
             anObject.travelFuelTypeRefCode = Integer.MIN_VALUE;
         
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
    
    public ENFuelInventarizationItemShortList getListByTravelSheet(ENTravelSheet travelSheet) throws PersistenceException {
    	if(travelSheet == null || travelSheet.code == Integer.MIN_VALUE) throw new NullPointerException("Не задан путевой лист!");
    	ENFuelInventarizationItemFilter filter = new ENFuelInventarizationItemFilter();
    	filter.travelSheetRef.code = travelSheet.code;
    	return this.getScrollableFilteredList(filter, 0, -1);
    }
    
       
    
} // end of ENFuelInventarizationItemDAO
