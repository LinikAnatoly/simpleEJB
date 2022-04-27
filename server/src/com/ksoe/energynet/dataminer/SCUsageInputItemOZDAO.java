
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.SCUsageInputItemOZDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.SCUsageInputItem;
import com.ksoe.energynet.valueobject.SCUsageInputItemKind;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ;
import com.ksoe.energynet.valueobject.brief.SCUsageInputItemOZShort;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZFilter;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.persistence.exception.SystemException;

  /**
  *  DAO Object for SCUsageInputItemOZ;
  *
  */

public class SCUsageInputItemOZDAO extends SCUsageInputItemOZDAOGen {


  public SCUsageInputItemOZDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public SCUsageInputItemOZDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  /**
   * 
   * Получить массив кодов ОЗ {@link SCUsageInputItemOZ} по объекту сущности SCUsageInput
   * 
   * @param usageInput объект сущности {@link SCUsageInput} коды ОЗ которой нужно получить 
   * @return массив кодов {@code Integer}
   * @throws PersistenceException
   */
  public int[] getFilteredCodeArrayBySCUsageInput(SCUsageInput usageInput) throws PersistenceException {
	  SCUsageInputItemDAO uiiDao = new SCUsageInputItemDAO(getConnection(), getUserProfile());
	  int[] uiiCodes = uiiDao.getFilteredCodeArrayBySCUsageInput(usageInput);
	  if(uiiCodes.length == 0) return uiiCodes;
	  Vector<Object> binded = new Vector<Object>();
	  SCUsageInputItemOZFilter uiizFilter = new SCUsageInputItemOZFilter();
	  uiizFilter.conditionSQL = String.format("%s in (%s)", SCUsageInputItemOZ.usageInputItemRef_QFielld
			  , Tools.repeatSymbol("?", ",", uiiCodes.length));
	  for(int uiiCode : uiiCodes) binded.add(uiiCode);
	  return this.getFilteredCodeArray(uiizFilter, 0, -1, binded);
  }
  
  public SCUsageInputItemOZ getObjectByAct(ENAct act) throws PersistenceException {
	  if(act == null || act.code == Integer.MIN_VALUE) {
		  throw new java.lang.NullPointerException("Не заданий акт!");
	  }
	  SCUsageInputItemOZFilter filter = new SCUsageInputItemOZFilter();
	  filter.conditionSQL = "EXISTS (SELECT FROM scusageinputitemoz2nct AS uiiz2a1 WHERE uiiz2a1.enactrefcode = ? AND uiiz2a1.usageinputitemozrefcod = scusageinputitemoz.code)";
	  int[] codes = this.getFilteredCodeArray(filter, 0, -1, new Vector<Object>(Arrays.asList(act.code)));
	  if(codes.length == 0) {
		  return null;
	  } else {
		  if(codes.length > 1) {
			  throw new SystemException(String.format("Помилка у кількості записів для актів з кодом %d", act.code));
		  }
		  return this.getObject(codes[0]);
	  }
  }

  @Override
public SCUsageInputItemOZShortList getScrollableFilteredList(SCUsageInputItemOZ aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    SCUsageInputItemOZShortList result = new SCUsageInputItemOZShortList();
    SCUsageInputItemOZShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCUSAGEINPUTITEMOZ.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "SCUSAGEINPUTITEMOZ.CODE"+
     ",SCUSAGEINPUTITEMOZ.NUMBERDOC"+
     ",SCUSAGEINPUTITEMOZ.COUNTERTYPE"+
     ",SCUSAGEINPUTITEMOZ.ACCOUNT"+
     ",SCUSAGEINPUTITEMOZ.COST"+
     ",SCUSAGEINPUTITEMOZ.COUNTGEN"+
     ",SCUSAGEINPUTITEMOZ.SCCODE"+

      ", SCUSAGEINPUTITEM.CODE " +
      ", SCUSAGEINPUTITEM.NUMBERDOC " +
      ", SCUSAGEINPUTITEM.COUNTGEN " +
      ", SCUSAGEINPUTITEM.SCCODE " +

      ", SCUSAGEINPUTITEMKIND.CODE " +
      ", SCUSAGEINPUTITEMKIND.NAME " +
      
      ",SCUSAGEINPUTITEMOZ.BUDGETREFCODE" +
      ", (select dep1.shortname from endepartment as dep1 where dep1.code = SCUSAGEINPUTITEMOZ.BUDGETREFCODE)" +
     " FROM SCUSAGEINPUTITEMOZ " +
     ", SCUSAGEINPUTITEM " +

     ", SCUSAGEINPUTITEMKIND " +

     //" WHERE "
    "";
     whereStr = " SCUSAGEINPUTITEM.CODE = SCUSAGEINPUTITEMOZ.USAGEINPUTITEMREFCODE" ; //+
     whereStr = whereStr +" AND SCUSAGEINPUTITEMKIND.CODE = SCUSAGEINPUTITEM.KINDREFCODE" ; //+
        //selectStr = selectStr + " ${s} SCUSAGEINPUTITEMOZ.CODE IN ( SELECT SCUSAGEINPUTITEMOZ.CODE FROM SCUSAGEINPUTITEMOZ ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZ.CODE = ?";
        }
         if (aFilterObject.numberDoc != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberDoc.indexOf('*',0) < 0 && aFilterObject.numberDoc.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(SCUSAGEINPUTITEMOZ.NUMBERDOC) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(SCUSAGEINPUTITEMOZ.NUMBERDOC) LIKE UPPER(?)";
         }
        if(aFilterObject.numberInt != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZ.NUMBERINT = ?";
        }
         if (aFilterObject.counterType != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.counterType.indexOf('*',0) < 0 && aFilterObject.counterType.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(SCUSAGEINPUTITEMOZ.COUNTERTYPE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(SCUSAGEINPUTITEMOZ.COUNTERTYPE) LIKE UPPER(?)";
         }
         if (aFilterObject.account != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.account.indexOf('*',0) < 0 && aFilterObject.account.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(SCUSAGEINPUTITEMOZ.ACCOUNT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(SCUSAGEINPUTITEMOZ.ACCOUNT) LIKE UPPER(?)";
         }
        if(aFilterObject.cost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZ.COST = ?";
        }
        if(aFilterObject.countGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZ.COUNTGEN = ?";
        }
        if(aFilterObject.scCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZ.SCCODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZ.MODIFY_TIME = ?";
        }
        if(aFilterObject.usageInputItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "SCUSAGEINPUTITEMOZ.USAGEINPUTITEMREFCODE = ? ";
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

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;
      if(aFilterObject != null){
         if(aFilterObject.code != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.code);
         }

           if(aFilterObject.numberDoc != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberDoc);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.numberInt != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.numberInt);
         }

           if(aFilterObject.counterType != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.counterType);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.account != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.account);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.cost != null){
            number++;
            aFilterObject.cost = aFilterObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.cost);
        }
         if(aFilterObject.countGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.countGen);
         }
         if(aFilterObject.scCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.scCode);
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.usageInputItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.usageInputItemRef.code);
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

        anObject = new SCUsageInputItemOZShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.numberDoc = set.getString(2);
        anObject.counterType = set.getString(3);
        anObject.account = set.getString(4);
        anObject.cost = set.getBigDecimal(5);
        if(anObject.cost != null)
            anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countGen = set.getInt(6);
        if ( set.wasNull() )
            anObject.countGen = Integer.MIN_VALUE;
        anObject.scCode = set.getInt(7);
        if ( set.wasNull() )
            anObject.scCode = Integer.MIN_VALUE;

        anObject.usageInputItemRefCode = set.getInt(8);
        if(set.wasNull())
        anObject.usageInputItemRefCode = Integer.MIN_VALUE;
        anObject.usageInputItemRefNumberDoc = set.getString(9);
        anObject.usageInputItemRefCountGen = set.getInt(10);
        if(set.wasNull())
        anObject.usageInputItemRefCountGen = Integer.MIN_VALUE;
        anObject.usageInputItemRefScCode = set.getInt(11);
        if(set.wasNull())
        anObject.usageInputItemRefScCode = Integer.MIN_VALUE;

        anObject.usageInputItemRefKindCode = set.getInt(12);
        if(set.wasNull())
        anObject.usageInputItemRefScCode = Integer.MIN_VALUE;
        anObject.usageInputItemRefKindName = set.getString(13);
        
        anObject.budgetRefCode = set.getInt(14);
        if(set.wasNull()) {
        	anObject.budgetRefCode = Integer.MIN_VALUE;
        }
        anObject.budgetRefShortName = set.getString(15);

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
  
  /**
   * 
   * Получить ОЗ с типом "Ввод в эксплуатацию ЗКУ" по ОЗ с типом "Ввод в эксплуатацию"
   * 
   * @param oz {@link SCUsageInputItemOZ} с типом "Ввод в эксплуатацию"
   * @return {@link SCUsageInputItemOZ} ОЗ с типом "Ввод в эксплуатацию ЗКУ"
   * @throws PersistenceException
   */
  public SCUsageInputItemOZ getOZForUsageInputZKUByUsageInputOZ(SCUsageInputItemOZ oz) throws PersistenceException {
	  if(oz == null || oz.code == Integer.MIN_VALUE || oz.usageInputItemRef == null || oz.usageInputItemRef.code == Integer.MIN_VALUE) {
		  throw new java.lang.NullPointerException();
	  }
	  SCUsageInputItemDAO itemDao = new SCUsageInputItemDAO(this.getConnection(), this.getUserProfile());
	  SCUsageInputItemKindDAO itemKindDao = new SCUsageInputItemKindDAO(this.getConnection(), this.getUserProfile());
	  
	  /*Проверка типа операции по строке связанной с ОЗ*/
	  SCUsageInputItem item = itemDao.getObject(oz.usageInputItemRef.code);
	  if(item.kindRef.code != SCUsageInputItemKind.UsageInput) {
		  throw new SystemException(String.format("Неправильний тип строки ОЗ - \"%s\", а повинен бути - \"%s\""
				  , itemKindDao.getObject(item.kindRef.code).name, itemKindDao.getObject(SCUsageInputItemKind.UsageInput).name));
	  }
	  
	  SCUsageInputItemOZFilter filter = new SCUsageInputItemOZFilter();
	  filter.conditionSQL = "EXISTS (SELECT FROM scusageinputtmz2sccntr AS ozco1\r\n"
	  		+ "	INNER JOIN scusageinputtmz2sccntr AS ozco2 ON ozco1.sccounterrefcode = ozco2.sccounterrefcode WHERE ozco1.ozrefcode = ? AND ozco2.ozrefcode = scusageinputitemoz.code)\r\n"
	  		+ "AND EXISTS (SELECT FROM scusageinputitem AS item WHERE item.code = scusageinputitemoz.usageinputitemrefcode AND item.kindrefcode = ?)";
	  Vector<Integer> parameters = new Vector<>(Arrays.asList(oz.code, SCUsageInputItemKind.UsageInputZKU));
	  int[] codes = this.getFilteredCodeArray(filter, 0, -1, parameters);
	  
	  // Количество должно равняться одному
	  if(codes.length > 1) {
		  throw new SystemException(String.format("Помилка у кількості записів (%d) для ОЗ з кодом %d", codes.length, oz.code));
	  }
	  if(codes.length == 0) return null;
	  return this.getObject(codes[0]);
  }



  public int _collectAutoIncrementNumber__()
          throws PersistenceException {

      SequenceKey hashKey = new SequenceKey("SCUSAGEINPUTITEMOZ", "NUMBERINT");
      Integer nextSeqValue = null;
      SequenceValue sequenceValue;
      synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
          if (sequenceValue == null) {
              sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEMOZ", "NUMBERINT");
              _sequenceTable.put(hashKey, sequenceValue);
          }
          if (!sequenceValue.isNextValueAvailable()) {
              sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEMOZ", "NUMBERINT");
              _sequenceTable.put(hashKey, sequenceValue);
          }
      }

      nextSeqValue = sequenceValue.getNextValue();
      if (nextSeqValue == null) {
          throw new PersistenceException(
                  "Can't obtain auto increment value from: SCUSAGEINPUTITEMOZ");
      } else {

          return nextSeqValue.intValue();
      }
  }



} // end of SCUsageInputItemOZDAO

