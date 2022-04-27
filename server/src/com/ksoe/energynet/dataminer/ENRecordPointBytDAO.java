
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENRecordPointBytDAOGen;
import com.ksoe.energynet.valueobject.ENRecordPointByt;
import com.ksoe.energynet.valueobject.brief.ENRecordPointBytShort;
import com.ksoe.energynet.valueobject.filter.ENRecordPointBytFilter;
import com.ksoe.energynet.valueobject.lists.ENRecordPointBytShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENRecordPointByt;
  *
  */

public class ENRecordPointBytDAO extends ENRecordPointBytDAOGen {


	@Override
	public void save(ENRecordPointByt recordPointByt) throws PersistenceException {

		if (recordPointByt.phone != null) {
			if (recordPointByt.phone.length() > 100)
				recordPointByt.phone = recordPointByt.phone.substring(0, 99);
		}

		if (recordPointByt.placecounter != null) {
			if (recordPointByt.placecounter.length() > 100)
				recordPointByt.placecounter = recordPointByt.placecounter.substring(0, 99);
		}

		if (recordPointByt.seal != null) {
			if (recordPointByt.seal.length() > 200)
				recordPointByt.seal = recordPointByt.seal.substring(0, 199);
		}


		super.save(recordPointByt);
	}


    @Override
	public void remove(int uid) throws PersistenceException
    {
        ENRecordPointByt obj = getObject(uid);
        super.remove(uid);

        ENElementDAO eDao = new ENElementDAO(super.getConnection(), super.getUserProfile() );
        eDao.remove(obj.element.code);
    }

    @Override
	public ENRecordPointBytShortList getScrollableFilteredList(ENRecordPointByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENRecordPointBytShortList result = new ENRecordPointBytShortList();
     ENRecordPointBytShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENRECORDPOINTBYT.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENRECORDPOINTBYT.CODE"+
      ",ENRECORDPOINTBYT.ACCOUNTNUMBER"+
      ",ENRECORDPOINTBYT.NAME"+
      ",ENRECORDPOINTBYT.ADDRESS"+
      ",ENRECORDPOINTBYT.RPCODE"+
      ",ENELEMENT.CODE" +
      ",ENRECORDPOINTBYT.INVNUMBER "+
      ",ENRECORDPOINTBYT.SERIALNUMBER "+
      ",ENRECORDPOINTBYT.DATECOUNTERINST "+
      ",ENRECORDPOINTBYT.DATECOUNTERCHECK "+
      ",ENRECORDPOINTBYT.COUNTERTYPE "+
      ",ENRECORDPOINTBYT.SITEREFCODE AS SITECODE "+
      ",(SELECT S.NAME FROM ENSITE S WHERE S.CODE=ENRECORDPOINTBYT.SITEREFCODE) AS SITENAME "+
      ",ENRECORDPOINTBYT.PHONE "+
      ",ENRECORDPOINTBYT.SEAL "+
      ",ENRECORDPOINTBYT.PLACECOUNTER "+
      ",(case " +
      " when ENRECORDPOINTBYT.ISWORKING=0 then 'Работает' " +
      " when ENRECORDPOINTBYT.ISWORKING=1 then 'Демонтирована' " +
      " when ENRECORDPOINTBYT.ISWORKING=2 then 'Отключена от счетчика' " +
      " when ENRECORDPOINTBYT.ISWORKING=3 then 'Отключена от опоры' " +
      " when ENRECORDPOINTBYT.ISWORKING=4 then 'Отключена пульт SMART' " +
      " when ENRECORDPOINTBYT.ISWORKING=5 then 'Отключена коммутац. аппаратами' " +
      " end) " +

 	  ",ENRECORDPOINTBYT.CLASSACCURACY " +
	  ",ENRECORDPOINTBYT.CHECKPERIOD " +
	  ",ENRECORDPOINTBYT.STATUSCODE " +
	  ",ENRECORDPOINTBYT.PHASITY " +
	  ",ENRECORDPOINTBYT.DATECHECK " +
	  ",ENRECORDPOINTBYT.CHECKPERIOD1 " +
      ",ENRECORDPOINTBYT.ISWORKING " +

      ",ENRECORDPOINTBYT.CONTRACTDATE " +
      ",ENRECORDPOINTBYT.FIDERCODE" +
	  ",ENRECORDPOINTBYT.FIDERNAME" +
      ", EPREN.NAME " +
	  ", ENRECORDPOINTBYT.CODEEIC " +
	  ", ENRECORDPOINTBYT.DATEFIRSTCONSUMPTION " +
      " FROM ENRECORDPOINTBYT " +
      " INNER JOIN ENELEMENT ON ENELEMENT.CODE = ENRECORDPOINTBYT.ELEMENTCODE " +
      " INNER JOIN EPREN ON ENELEMENT.RENREFCODE = EPREN.CODE " +
      //" WHERE "
     "";
      whereStr = "" ;
      
      whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
      whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);
      
     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE " + whereStr;

     selectStr = selectStr + " ORDER BY " + orderBy;
     
	selectStr = selectStr + " OFFSET " + fromPosition;
	if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;

     try
      {
       statement = connection.prepareStatement(selectStr);
       int number = setParameters(aFilterObject, statement);

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

         anObject = new ENRecordPointBytShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.accountNumber = set.getString(2);
         anObject.name = set.getString(3);
         anObject.address = set.getString(4);
         anObject.rpCode = set.getInt(5);
         if ( set.wasNull() )
             anObject.rpCode = Integer.MIN_VALUE;


         anObject.elementCode = set.getInt(6);
         anObject.invNumber = set.getString(7);

         anObject.serialNumber = set.getString(8);
         anObject.dateCounterInst = set.getDate(9);
         anObject.dateCounterCheck = set.getDate(10);
         anObject.counterType = set.getString(11);

         anObject.siteRefCode = set.getInt(12);
         if(set.wasNull())
        	 anObject.siteRefCode = Integer.MIN_VALUE;
         anObject.siteRefName = set.getString(13);

         anObject.phone = set.getString(14);
         anObject.seal = set.getString(15);

         anObject.placecounter = set.getString(16);
         /*
         anObject.isworking = set.getInt(17);
         if ( set.wasNull() )
             anObject.isworking = Integer.MIN_VALUE;
         */
         anObject.classAccuracy = set.getBigDecimal(18);
         if(anObject.classAccuracy != null)
             anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.checkperiod = set.getBigDecimal(19);
         if(anObject.checkperiod != null)
             anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.statuscode = set.getInt(20);
         if ( set.wasNull() )
             anObject.statuscode = Integer.MIN_VALUE;
         anObject.phasity = set.getBigDecimal(21);
         if(anObject.phasity != null)
             anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.datecheck = set.getDate(22);
         anObject.checkperiod1 = set.getBigDecimal(23);
         if(anObject.checkperiod1 != null)
             anObject.checkperiod1 = anObject.checkperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.isworking = set.getInt(24);
         if ( set.wasNull() )
             anObject.isworking = Integer.MIN_VALUE;

         anObject.contractDate = set.getDate(25);

         anObject.fiderCode = set.getInt(26);
			if ( set.wasNull() ) {
				anObject.fiderCode = Integer.MIN_VALUE;
			}
		 anObject.fiderName = set.getString(27);
		 anObject.renName = set.getString(28);
		 anObject.codeEIC = set.getString(29);
		 anObject.dateFirstConsumption = set.getDate(30);

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

    public ENRecordPointBytShortList getScrollableFilteredListNOSEGR(ENRecordPointByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENRecordPointBytShortList result = new ENRecordPointBytShortList();
     ENRecordPointBytShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENRECORDPOINTBYT.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENRECORDPOINTBYT.CODE"+
      ",ENRECORDPOINTBYT.ACCOUNTNUMBER"+
      ",ENRECORDPOINTBYT.NAME"+
      ",ENRECORDPOINTBYT.ADDRESS"+
      ",ENRECORDPOINTBYT.RPCODE"+
      ",ENELEMENT.CODE" +
      ",ENRECORDPOINTBYT.INVNUMBER "+
      ",ENRECORDPOINTBYT.SERIALNUMBER "+
      ",ENRECORDPOINTBYT.DATECOUNTERINST "+
      ",ENRECORDPOINTBYT.DATECOUNTERCHECK "+
      ",ENRECORDPOINTBYT.COUNTERTYPE "+
      ",ENRECORDPOINTBYT.SITEREFCODE AS SITECODE "+
      ",(SELECT S.NAME FROM ENSITE S WHERE S.CODE=ENRECORDPOINTBYT.SITEREFCODE) AS SITENAME "+
      ",ENRECORDPOINTBYT.PHONE "+
      ",ENRECORDPOINTBYT.SEAL "+
      ",ENRECORDPOINTBYT.PLACECOUNTER "+
      ",(case " +
      " when ENRECORDPOINTBYT.ISWORKING=0 then 'Работает' " +
      " when ENRECORDPOINTBYT.ISWORKING=1 then 'Демонтирована' " +
      " when ENRECORDPOINTBYT.ISWORKING=2 then 'Отключена от счетчика' " +
      " when ENRECORDPOINTBYT.ISWORKING=3 then 'Отключена от опоры' " +
      " when ENRECORDPOINTBYT.ISWORKING=4 then 'Отключена пульт SMART' " +
      " when ENRECORDPOINTBYT.ISWORKING=5 then 'Отключена коммутац. аппаратами' " +
      " end) " +

 	  ",ENRECORDPOINTBYT.CLASSACCURACY " +
	  ",ENRECORDPOINTBYT.CHECKPERIOD " +
	  ",ENRECORDPOINTBYT.STATUSCODE " +
	  ",ENRECORDPOINTBYT.PHASITY " +
	  ",ENRECORDPOINTBYT.DATECHECK " +
	  ",ENRECORDPOINTBYT.CHECKPERIOD1 " +
      ",ENRECORDPOINTBYT.ISWORKING " +

      ",ENRECORDPOINTBYT.CONTRACTDATE " +
      ",ENRECORDPOINTBYT.FIDERCODE" +
	  ",ENRECORDPOINTBYT.FIDERNAME" +
      ",EPREN.NAME " +
	  ", ENRECORDPOINTBYT.CODEEIC " +
	  ", ENRECORDPOINTBYT.DATEFIRSTCONSUMPTION " +
      " FROM ENRECORDPOINTBYT " +
      " INNER JOIN ENELEMENT ON ENELEMENT.CODE = ENRECORDPOINTBYT.ELEMENTCODE " +
      " INNER JOIN EPREN ON ENELEMENT.RENREFCODE = EPREN.CODE " +
      //" WHERE "
     "";
     whereStr = "";
       
       whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
       whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);
       
      if(whereStr.length() != 0)
          selectStr = selectStr + " WHERE " + whereStr;

     // selectStr = selectStr + ") ";

     selectStr = selectStr + " ORDER BY " + orderBy;
     
 	 selectStr = selectStr + " OFFSET " + fromPosition;
 	 if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;

     try
      {
       statement = connection.prepareStatement(selectStr);
       int number = setParameters(aFilterObject, statement);
       
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

         anObject = new ENRecordPointBytShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.accountNumber = set.getString(2);
         anObject.name = set.getString(3);
         anObject.address = set.getString(4);
         anObject.rpCode = set.getInt(5);
         if ( set.wasNull() )
             anObject.rpCode = Integer.MIN_VALUE;


         anObject.elementCode = set.getInt(6);
         anObject.invNumber = set.getString(7);

         anObject.serialNumber = set.getString(8);
         anObject.dateCounterInst = set.getDate(9);
         anObject.dateCounterCheck = set.getDate(10);
         anObject.counterType = set.getString(11);

         anObject.siteRefCode = set.getInt(12);
         if(set.wasNull())
        	 anObject.siteRefCode = Integer.MIN_VALUE;
         anObject.siteRefName = set.getString(13);

         anObject.phone = set.getString(14);
         anObject.seal = set.getString(15);

         anObject.placecounter = set.getString(16);
         /*
         anObject.isworking = set.getInt(17);
         if ( set.wasNull() )
             anObject.isworking = Integer.MIN_VALUE;
         */
         anObject.classAccuracy = set.getBigDecimal(18);
         if(anObject.classAccuracy != null)
             anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.checkperiod = set.getBigDecimal(19);
         if(anObject.checkperiod != null)
             anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.statuscode = set.getInt(20);
         if ( set.wasNull() )
             anObject.statuscode = Integer.MIN_VALUE;
         anObject.phasity = set.getBigDecimal(21);
         if(anObject.phasity != null)
             anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.datecheck = set.getDate(22);
         anObject.checkperiod1 = set.getBigDecimal(23);
         if(anObject.checkperiod1 != null)
             anObject.checkperiod1 = anObject.checkperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.isworking = set.getInt(24);
         if ( set.wasNull() )
             anObject.isworking = Integer.MIN_VALUE;

         anObject.contractDate = set.getDate(25);

         anObject.fiderCode = set.getInt(26);
			if ( set.wasNull() ) {
				anObject.fiderCode = Integer.MIN_VALUE;
			}
		 anObject.fiderName = set.getString(27);
		 anObject.renName = set.getString(28);
		 anObject.codeEIC = set.getString(29);
		 anObject.dateFirstConsumption = set.getDate(30);

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

    public ENRecordPointByt getObjectByElementCode(int elementCode, boolean isSegregation) throws PersistenceException {
    	if(elementCode == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException("elementCode is null");
    	}
    	ENRecordPointBytFilter filter = new ENRecordPointBytFilter();
    	filter.element.code = elementCode;
    	List<Integer> codes = this.getListOfPropertyValues(String.format("%s::integer", ENRecordPointByt.code_Field)
    			, filter, 0, -1, null, isSegregation);
    	if(codes.size() == 0) {
    		return null;
    	} else {
    		if(codes.size() != 1) {
    			throw new SystemException(String.format("Помилка у кількості записів для побутової точки обліку з кодом елемента %d.\n"
    					+ "Всього знайдено записів - %d", elementCode, codes.size()));
    		}
    		if(isSegregation) {
        		return this.getObject(codes.get(0));
    		} else {
    			return this.getObjectNoSegr(codes.get(0));
    		}

    	}
    }



  public ENRecordPointBytDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENRecordPointBytDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

	   public ENRecordPointByt getObjectNoSegr(int uid) throws PersistenceException
	   {
	    ENRecordPointByt result = new ENRecordPointByt();
	    result.code = uid;
	    loadObjectNoSegr(result);
	    if(result.code == Integer.MIN_VALUE)
	     return null;
	    return result;
	   }

	   public void loadObjectNoSegr(ENRecordPointByt anObject) throws PersistenceException
	   {
	    String     selectStr;
	    Connection connection = getConnection();
	    PreparedStatement statement = null;
	    ResultSet set = null;

	    if(getUserProfile() == null)
	     throw new PersistenceException("Internal Error (User Profile Is Undefined)");


	    selectStr =
	    "SELECT  ENRECORDPOINTBYT.CODE, ENRECORDPOINTBYT.ACCOUNTNUMBER, ENRECORDPOINTBYT.CONTRACTDATE, ENRECORDPOINTBYT.NAME, ENRECORDPOINTBYT.ADDRESS, ENRECORDPOINTBYT.COMMENTGEN, ENRECORDPOINTBYT.RPCODE, ENRECORDPOINTBYT.DOMAIN_INFO, ENRECORDPOINTBYT.MODIFY_TIME, ENRECORDPOINTBYT.INVNUMBER, ENRECORDPOINTBYT.SERIALNUMBER, ENRECORDPOINTBYT.DATECOUNTERINST, ENRECORDPOINTBYT.DATECOUNTERCHECK, ENRECORDPOINTBYT.COUNTERTYPE, ENRECORDPOINTBYT.CLASSACCURACY, ENRECORDPOINTBYT.CHECKPERIOD, ENRECORDPOINTBYT.STATUSCODE, ENRECORDPOINTBYT.PHASITY, ENRECORDPOINTBYT.DATECHECK, ENRECORDPOINTBYT.CHECKPERIOD1, ENRECORDPOINTBYT.PHONE, ENRECORDPOINTBYT.SEAL, ENRECORDPOINTBYT.PLACECOUNTER, ENRECORDPOINTBYT.ISWORKING, ENRECORDPOINTBYT.ELEMENTCODE, ENRECORDPOINTBYT.SITEREFCODE "
	    +" , ENRECORDPOINTBYT.FIDERCODE, ENRECORDPOINTBYT.FIDERNAME "
	    		+" FROM ENRECORDPOINTBYT WHERE ENRECORDPOINTBYT.CODE = ?";

	    try
	     {
	      statement = connection.prepareStatement(selectStr);
	      statement.setInt(1,anObject.code);
	      set = statement.executeQuery();
	      if(!set.next())
	       anObject.code = Integer.MIN_VALUE;
	      else
	       {
	        anObject.code = set.getInt(1);
	        anObject.accountNumber = set.getString(2);
	        anObject.contractDate = set.getDate(3);
	        anObject.name = set.getString(4);
	        anObject.address = set.getString(5);
	        anObject.commentGen = set.getString(6);
	        anObject.rpCode = set.getInt(7);
	        if ( set.wasNull() )
	           anObject.rpCode = Integer.MIN_VALUE;
	        anObject.domain_info = set.getString(8);
	        anObject.modify_time = set.getLong(9);
	        if(set.wasNull())
	         anObject.modify_time = Long.MIN_VALUE;
	        anObject.invNumber = set.getString(10);
	        anObject.serialNumber = set.getString(11);
	        anObject.dateCounterInst = set.getDate(12);
	        anObject.dateCounterCheck = set.getDate(13);
	        anObject.counterType = set.getString(14);
	        anObject.classAccuracy = set.getBigDecimal(15);
	        if(anObject.classAccuracy != null)
	            anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	        anObject.checkperiod = set.getBigDecimal(16);
	        if(anObject.checkperiod != null)
	            anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	        anObject.statuscode = set.getInt(17);
	        if ( set.wasNull() )
	           anObject.statuscode = Integer.MIN_VALUE;
	        anObject.phasity = set.getBigDecimal(18);
	        if(anObject.phasity != null)
	            anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	        anObject.datecheck = set.getDate(19);
	        anObject.checkperiod1 = set.getBigDecimal(20);
	        if(anObject.checkperiod1 != null)
	            anObject.checkperiod1 = anObject.checkperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	        anObject.phone = set.getString(21);
	        anObject.seal = set.getString(22);
	        anObject.placecounter = set.getString(23);
	        anObject.isworking = set.getInt(24);

	        if ( set.wasNull() )
	           anObject.isworking = Integer.MIN_VALUE;

	        anObject.element.code = set.getInt(25);
	        if ( set.wasNull() )
	            anObject.element.code = Integer.MIN_VALUE;

	        anObject.siteRef.code = set.getInt(26);
	        if ( set.wasNull() )
	            anObject.siteRef.code = Integer.MIN_VALUE;


	        anObject.fiderCode = set.getInt(27);
			if (set.wasNull()) {
				anObject.fiderCode = Integer.MIN_VALUE;
			}
			anObject.fiderName = set.getString(28);

	      }
	    }
	    catch(SQLException e)
	     {
	      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
	      throw new SystemException(e.getMessage(), e);
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

		public boolean existsNoSegr(int anObjectCode) throws PersistenceException {
			String selectStr;
			Connection connection = getConnection();
			PreparedStatement statement = null;
			ResultSet set = null;

			if(anObjectCode == Integer.MIN_VALUE) {
				return false;
			}

			if(getUserProfile() == null) {
				throw new PersistenceException("Internal Error (User Profile Is Undefined)");
			}

			selectStr =
				"SELECT  ENRECORDPOINTBYT.CODE FROM  ENRECORDPOINTBYT WHERE  ENRECORDPOINTBYT.CODE = ?";

			try {
				statement = connection.prepareStatement(selectStr);
				statement.setInt(1,anObjectCode);
				set = statement.executeQuery();
				if(set.next()) {
					return true;
				}
				return false;
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


	/** ENRecordPointByt. проверка наличия ENRecordPointByt... */
	public boolean checkRecordPointByt(int elementCode) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if (elementCode == Integer.MIN_VALUE) {
			return false;
		}

		selectStr = "select enrecordpointbyt.code from enrecordpointbyt where enrecordpointbyt.elementcode = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1, elementCode);
			set = statement.executeQuery();

			if (set.next()) {
				return true;
			}

			return false;

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
} // end of ENRecordPointBytDAO

