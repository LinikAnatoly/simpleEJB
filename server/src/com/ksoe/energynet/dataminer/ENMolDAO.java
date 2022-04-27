
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
import java.util.List;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENMolDAOGen;
import com.ksoe.energynet.valueobject.ENMol;
import com.ksoe.energynet.valueobject.ENMolStatus;
import com.ksoe.energynet.valueobject.ENMolType;
import com.ksoe.energynet.valueobject.brief.ENMolShort;
import com.ksoe.energynet.valueobject.filter.ENMolFilter;
import com.ksoe.energynet.valueobject.lists.ENMolShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENMol;
  *
  */

public class ENMolDAO extends ENMolDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENMolDAO() {super();}
  //public ENMolDAO(Connection aConnection) {super(aConnection);}
  //public ENMolDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENMolDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENMolDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  /**
   *
   * <p>Возвращает объект МОЛ {@link ENMol} по коду МОЛ</p>
   *
   * @param finCode код МОЛ
   * @return {@link ENMol}
   * @throws PersistenceException
   */
  public ENMol getMolByFinCode(String finCode) throws PersistenceException {
	    ENMol mol = null;

	    if(finCode == null) throw new java.lang.NullPointerException("finCode is null");
	    ENMolFilter filter = new ENMolFilter();
	    filter.finCode = finCode;
	    int[] codes = this.getFilteredCodeArray(filter, 0, -1);
	    if(codes.length != 0) {
	        if(codes.length != 1) {
	            throw new SystemException(String.format("Помилка для коду %s знайдено більше одно МОЛів: %d", finCode, codes.length));
	        } else {
	            mol = this.getObject(codes[0]);
	        }
	    }
	    return mol;
	}

  /**
   *
   * Возвращает {@link java.util.List} со строковыми кодами МОЛов с указанным типом
   *
   * @param type {@code Integer} код типа МОЛ {@link ENMolType} для которого необходимо выбрать коды МОЛ. Если равен {@code null},
   * то выберутся все
   * @return {@link java.util.List}
   */
  public List<String> getAllCodesMolsByType(Integer type) {
	  String where = (type == null) ? "" : String.format(" where %s = ? ", ENMol.typeRef_QFielld);
	  String sql = String.format("select %s from %s %s", ENMol.finCode_QFielld, ENMol.tableName, where);
	  Vector<Integer> bindedObjects = new Vector<Integer>();
	  if(type != null) {
		  bindedObjects.add(type);
	  }
	  return BaseDAOUtils.executeStatementAndReadObjects(this.getConnection(), sql, bindedObjects, new BaseDAOUtils.StringFromResultSetTransformator(), false);
  }

  @Override
public ENMolShortList getScrollableFilteredList(ENMol aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENMolShortList result = new ENMolShortList();
   ENMolShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENMOL.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENMOL.CODE"+
    ",ENMOL.FINCODE"+
    ",ENMOL.NAME"+

     ", ENMOLSTATUS.CODE " +
     ", ENMOLSTATUS.NAME " +
     ", ENMOLTYPE.CODE " +
     ", ENMOLTYPE.NAME " +

     ", (select ENDEPARTMENT.CODE from ENDEPARTMENT where ENDEPARTMENT.CODE = ENMOL.DEPARTMENTREFCODE) " +
     ", (select ENDEPARTMENT.SHORTNAME from ENDEPARTMENT where ENDEPARTMENT.CODE = ENMOL.DEPARTMENTREFCODE) " +
     ", (select ENDEPARTMENT.DATESTART from ENDEPARTMENT where ENDEPARTMENT.CODE = ENMOL.DEPARTMENTREFCODE) " +
     ", (select ENDEPARTMENT.DATEFINAL from ENDEPARTMENT where ENDEPARTMENT.CODE = ENMOL.DEPARTMENTREFCODE) " +
     ", (select ENDEPARTMENT.RENCODE from ENDEPARTMENT where ENDEPARTMENT.CODE = ENMOL.DEPARTMENTREFCODE) " +
     ", (select ENDEPARTMENT.SHPZBALANS from ENDEPARTMENT where ENDEPARTMENT.CODE = ENMOL.DEPARTMENTREFCODE) " +
     ", (select ENDEPARTMENT.KAU_TABLE_ID_1884 from ENDEPARTMENT where ENDEPARTMENT.CODE = ENMOL.DEPARTMENTREFCODE) " +
     ", (select ENDEPARTMENT.KAU_1884 from ENDEPARTMENT where ENDEPARTMENT.CODE = ENMOL.DEPARTMENTREFCODE) " +
     ", (select ENDEPARTMENT.NAME_1884 from ENDEPARTMENT where ENDEPARTMENT.CODE = ENMOL.DEPARTMENTREFCODE) " +
     ", ENMOL.PHONENUMBER " +
     ", ENMOL.TABNUMBER"+
     ", ENMOL.STORAGE"+
     " FROM ENMOL " +
    ", ENMOLSTATUS " +
    ", ENMOLTYPE " +
    //", ENDEPARTMENT " +
    //" WHERE "
 "";
    whereStr = " ENMOLSTATUS.CODE = ENMOL.STATUSREFCODE" ; //+
     whereStr = whereStr +" AND ENMOLTYPE.CODE = ENMOL.TYPEREFCODE" ; //+
     //whereStr = whereStr +" AND ENDEPARTMENT.CODE = ENMOL.DEPARTMENTREFCODE" ; //+
   //selectStr = selectStr + " ${s} ENMOL.CODE IN ( SELECT ENMOL.CODE FROM ENMOL ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENMOL.CODE = ?";
       }
        if (aFilterObject.finCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finCode.indexOf('*',0) < 0 && aFilterObject.finCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENMOL.FINCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENMOL.FINCODE) LIKE UPPER(?)";
        }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENMOL.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENMOL.NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENMOL.MODIFY_TIME = ?";
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENMOL.STATUSREFCODE = ? ";
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENMOL.TYPEREFCODE = ? ";
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENMOL.DEPARTMENTREFCODE = ? ";
       }
       if (aFilterObject.phoneNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.phoneNumber.indexOf('*',0) < 0 && aFilterObject.phoneNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(ENMOL.PHONENUMBER) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(ENMOL.PHONENUMBER) LIKE UPPER(?)";
       }

			if (aFilterObject.tabNumber != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				if (aFilterObject.tabNumber.indexOf('*', 0) < 0 && aFilterObject.tabNumber.indexOf('?', 0) < 0)
					whereStr = whereStr + "  UPPER(ENMOL.TABNUMBER) = UPPER(?)";
				else
					whereStr = whereStr + " UPPER(ENMOL.TABNUMBER) LIKE UPPER(?)";
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

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }

          if(aFilterObject.finCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.finCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
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
       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.statusRef.code);
      }
      if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.typeRef.code);
      }
      if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.departmentRef.code);
      }
      if(aFilterObject.phoneNumber != null){
          number++;
          StringBuffer likeStr = new StringBuffer();
          likeStr.append(aFilterObject.phoneNumber);
          for(int i = 0;i < likeStr.length();i++){
               if(likeStr.charAt(i) == '*')
                    likeStr.setCharAt(i,'%');
               if(likeStr.charAt(i) == '?')
                    likeStr.setCharAt(i,'_');
          }
          statement.setString(number,likeStr.toString());
      }

				if (aFilterObject.tabNumber != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.tabNumber);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
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

       anObject = new ENMolShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.finCode = set.getString(2);
       anObject.name = set.getString(3);

       anObject.statusRefCode = set.getInt(4);
   if(set.wasNull())
     anObject.statusRefCode = Integer.MIN_VALUE;
       anObject.statusRefName = set.getString(5);
       anObject.typeRefCode = set.getInt(6);
   if(set.wasNull())
     anObject.typeRefCode = Integer.MIN_VALUE;
       anObject.typeRefName = set.getString(7);
       anObject.departmentRefCode = set.getInt(8);
   if(set.wasNull())
     anObject.departmentRefCode = Integer.MIN_VALUE;
       anObject.departmentRefShortName = set.getString(9);
       anObject.departmentRefDateStart = set.getDate(10);
       anObject.departmentRefDateFinal = set.getDate(11);
       anObject.departmentRefRenCode = set.getInt(12);
   if(set.wasNull())
     anObject.departmentRefRenCode = Integer.MIN_VALUE;
       anObject.departmentRefShpzBalans = set.getString(13);
       anObject.departmentRefKau_table_id_1884 = set.getInt(14);
   if(set.wasNull())
     anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
       anObject.departmentRefKau_1884 = set.getString(15);
       anObject.departmentRefName_1884 = set.getString(16);

       anObject.phoneNumber = set.getString(17);

       anObject.tabNumber = set.getString(18);
       
       anObject.storage = set.getString(19);

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
  
  /**
   * 
   * Проверка МОЛ на статус
   * 
   * Если статус в справочнике недействительный, то будет выдано исключение.
   * 
   * 
   * @param finCode код МОЛ если равен {@code null} или {@code ""}, то проверка
   * производится не будет
   * @throws PersistenceException
   */
  public void checkMolStatus(String finCode) throws PersistenceException {
	  if(finCode == null || finCode.length() == 0) return;
	  ENMol mol = this.getMolByFinCode(finCode);
	  if(mol == null) {
		  throw new SystemException(String.format("Не знайдено МВО для коду \"%s\"", finCode));
	  }
	  if(mol.statusRef.code == ENMolStatus.NOT_VALID) {
      	throw new SystemException(String.format("\n\nМВО № %s \"%s\" має статус недійсний у довіднику!\n\n", mol.finCode, mol.name));
      }
  }




} // end of ENMolDAO

