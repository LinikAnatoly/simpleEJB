
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.xml.ws.BindingProvider;

import com.ksoe.authorization.valueobject.Config;
import com.ksoe.energynet.dataminer.generated.FINMolDAOGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.FINMol;
import com.ksoe.energynet.valueobject.brief.FINMolShort;
import com.ksoe.energynet.valueobject.filter.FINMolFilter;
import com.ksoe.energynet.valueobject.lists.FINMolShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.fin.logic.FKConsts;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.mdax.services.inventlocationksservice.InventLocationFinder;
import com.ksoe.mdax.util.WebServicesConsts;
import com.microsoft.schemas.dynamics._2008._01.services.InventLocationKSService;
import com.microsoft.schemas.dynamics._2008._01.services.InventLocationKSService_Service;

  /**
  *  DAO Object for FINMol;
  *
  */

public class FINMolDAO extends FINMolDAOGen {

  public FINMolDAO() {super();}
  public FINMolDAO(Connection aConnection) {super(aConnection);}
  public FINMolDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public FINMolDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINMolDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  @Override
public void loadObject(FINMol anObject) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet set = null;



   selectStr =
   "SELECT  UMC_DBA.TDIVISION.ID, UMC_DBA.TDIVISION.TEXT, UMC_DBA.TDIVISION.OBJ_ID, UMC_DBA.TDIVISION.STATE "
   +" FROM UMC_DBA.TDIVISION WHERE UMC_DBA.TDIVISION.ID = ?";

   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setString(1,anObject.id);
     set = statement.executeQuery();
     if(!set.next())
      anObject.id = null;
     else
      {
       anObject.id = set.getString(1);
       anObject.text = set.getString(2);
       anObject.obj_id = set.getInt(3);
       if ( set.wasNull() )
          anObject.obj_id = Integer.MIN_VALUE;
       anObject.state = set.getInt(4);
       if ( set.wasNull() )
          anObject.state = Integer.MIN_VALUE;
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

  /**
   *
   * Достать список {@link FINMolShortList} всех активных МОЛ
   *
   * @return список МОЛ {@link FINMolShortList}
   * @throws PersistenceException
   */
  public FINMolShortList getActiveMolList() throws PersistenceException {
	  	FINMolFilter filter = new FINMolFilter();
		filter.state = FKConsts.TDIVISION_STATE_ACTIVE;
		return this.getScrollableFilteredList(filter, 0, -1);
  }
  
  /**
   * 
   * Метод проверяет наличие МОЛ с заданым номером в справочнике модуля "Учет материалов" программного комплекса Фин.коллекции
   * 
   * @param molCode код МОЛ
   * @return {@code true} если МОЛ найден в справочнике {@code false} если иначе
   * @throws PersistenceException
   */
  public boolean checkMolExists(String molCode) throws PersistenceException {
		if(molCode == null) {
			throw new java.lang.NullPointerException("molCode is null");
		}
		if(molCode.length() != 4 || !Tools.checkIfStringConsistsOfDigits(molCode)) {
			throw new SystemException(String.format("Неправильна умова для пошуку МВО: %s", molCode));
		}
		FINMolFilter molFilter = new FINMolFilter();
		molFilter.id = molCode;
		FINMolShortList list = this.getScrollableFilteredList(molFilter, 0, -1);
		return !(list == null || list.totalCount == 0);
  }

  /**
   *
   * Достать список {@link FINMolShortList} всех активных МОЛ по двум первым знакам
   *
   * @param mask двузначная маска
   * @return список МОЛ {@link FINMolShortList}
   * @throws PersistenceException
   */
  public FINMolShortList getActiveMolListByMask(String mask) throws PersistenceException {
		if(mask == null) {
			throw new java.lang.NullPointerException("mask is null");
		}
		if(mask.length() != 2 || !Tools.checkIfStringConsistsOfDigits(mask)) {
			throw new SystemException(String.format("Неправильна умова для пошуку МВО: %s", mask));
		}
		FINMolFilter filter = new FINMolFilter();
		filter.id = mask + "*";
		filter.state = FKConsts.TDIVISION_STATE_ACTIVE;
		return this.getScrollableFilteredList(filter, 0, -1);
  }


	@Override
	public FINMolShortList getScrollableFilteredList(FINMol aFilterObject,
			String anCondition, String anOrderBy, int fromPosition,
			int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		FINMolShortList result = new FINMolShortList();
		FINMolShort anObject;
		result.list = new Vector<FINMolShort>();

		////////////////////////////////////////////////////////////////////////////////////////////////
		//AXTransactionsLogic axLogic = new AXTransactionsLogic(getConnection(), getUserProfile());
		AuthLogic netAuth = new AuthLogic(getConnection(), getUserProfile());

		if (netAuth.checkUsesMDAXData(Config.CONFIG_USES_MDAX_INVENTLOCATION)) {
		  if (aFilterObject != null) {

			  String usr = WebServicesConsts.userName;
			  String pwd = WebServicesConsts.userPass;
			  
			  InventLocationKSService_Service inventLocationService = new InventLocationKSService_Service();
			  InventLocationKSService inventLocationProxy = inventLocationService.getBasicHttpBindingInventLocationKSService();
			  ((BindingProvider) inventLocationProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
			  ((BindingProvider) inventLocationProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

			  InventLocationFinder inventLocationFinder = new InventLocationFinder(inventLocationProxy);

			  if (aFilterObject.id != null) {
				  inventLocationFinder.parmCriteriaInventLocationId(aFilterObject.id);
			  }

			  if (aFilterObject.text != null) {
				  inventLocationFinder.parmCriteriaName(aFilterObject.text);
			  }

			  if (aFilterObject.axReceiptBlocking != null) {
				  inventLocationFinder.parmCriteriaReceiptBlocking(aFilterObject.axReceiptBlocking);
			  }

			  if (aFilterObject.axIssueBlocking != null) {
				  inventLocationFinder.parmCriteriaIssueBlocking(aFilterObject.axIssueBlocking);
			  }

			  // Если передается старый фильтр по активным МОЛам из ФК, фильтранем всех МОЛов без блокировок из AX
			  if(aFilterObject.state == 1) {
				  inventLocationFinder.parmCriteriaReceiptBlocking("");
			      inventLocationFinder.parmCriteriaIssueBlocking("");
			  }

			  return inventLocationFinder.getAXInventLocationList();
		}

		return result;
	}
   ////////////////////////////////////////////////////////////////////////////////////////////////

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "UMC_DBA.TDIVISION.ID";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "UMC_DBA.TDIVISION.ID"+
    ",UMC_DBA.TDIVISION.TEXT"+
    ",UMC_DBA.TDIVISION.OBJ_ID"+
    ",UMC_DBA.TDIVISION.STATE"+

    " FROM UMC_DBA.TDIVISION " +
    //" WHERE "
   "";
       //selectStr = selectStr + " ${s} FINMOL.CODE IN ( SELECT FINMOL.CODE FROM FINMOL ";

     if(aFilterObject != null)
     {
         if (aFilterObject.id != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.id.indexOf('*',0) < 0 && aFilterObject.id.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(UMC_DBA.TDIVISION.ID) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(UMC_DBA.TDIVISION.ID) LIKE UPPER(?)";
         }
/*
       if(aFilterObject.id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  UMC_DBA.TDIVISION.ID = ?";
       }
*/
        if (aFilterObject.text != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.text.indexOf('*',0) < 0 && aFilterObject.text.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(UMC_DBA.TDIVISION.TEXT) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(UMC_DBA.TDIVISION.TEXT) LIKE UPPER(?)";
        }
       if(aFilterObject.obj_id != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  UMC_DBA.TDIVISION.OBJ_ID = ?";
       }
       if(aFilterObject.state != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  UMC_DBA.TDIVISION.STATE = ?";
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
        selectStr = selectStr + " WHERE" + whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){

       /*
        if(aFilterObject.id != null){
            number++;
            statement.setString(number,aFilterObject.id);
        }
*/

         if(aFilterObject.id != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.id);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }

          if(aFilterObject.text != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.text);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.obj_id != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.obj_id);
        }
        if(aFilterObject.state != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.state);
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

       anObject = new FINMolShort();

       anObject.id = set.getString(1); //set.getInt(1);
       //if ( set.wasNull() )
       //    anObject.id = Integer.MIN_VALUE;
       anObject.text = set.getString(2);
       anObject.obj_id = set.getInt(3);
       if ( set.wasNull() )
           anObject.obj_id = Integer.MIN_VALUE;
       anObject.state = set.getInt(4);
       if ( set.wasNull() )
           anObject.state = Integer.MIN_VALUE;


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



} // end of FINMolDAO

