
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENAccess2EnelementDAOGen;
import com.ksoe.energynet.valueobject.ENAccess2Enelement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.brief.ENAccess2EnelementShort;
import com.ksoe.energynet.valueobject.lists.ENAccess2EnelementShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;

  /**
  *  DAO Object for ENAccess2Enelement;  
  * 	
  */

public class ENAccess2EnelementDAO extends ENAccess2EnelementDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENAccess2EnelementDAO() {super();}
  //public ENAccess2EnelementDAO(Connection aConnection) {super(aConnection);}
  //public ENAccess2EnelementDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENAccess2EnelementDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAccess2EnelementDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public ENAccess2EnelementShortList getScrollableFilteredList(ENAccess2Enelement aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {   
   ENAccess2EnelementShortList result = new ENAccess2EnelementShortList();
   ENAccess2EnelementShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);
	
   if(orderBy.length() == 0)
    orderBy = " ENELEMENTDATA.ETYPE , ENACCESS2ENELEMENT.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
   selectStr = "SELECT "+
    "ENACCESS2ENELEMENT.CODE"+
    ",ENACCESS2ENELEMENT.ISACCESS"+

     ", ENELEMENTDATA.ECODE " +
     ", ENELEMENTDATA.ENAME  " +
     ", ENELEMENTDATA.BUHNAME  " +
     ", ENELEMENTDATA.INVNUMBER  " +
     ", EPREN.NAME " + 
    " FROM ENACCESS2ENELEMENT " +
    " , ENELEMENT " +
    " , EPREN " +
    " , ENELEMENTDATA " +
    //" WHERE " 
	""; 
   whereStr = "  ENELEMENT.RENREFCODE = EPREN.CODE " ; 
    whereStr = whereStr + "  AND ENELEMENTDATA.ECODE = ENELEMENT.CODE " ;
    whereStr = whereStr + "  AND ENELEMENTDATA.ECODE = ENACCESS2ENELEMENT.ELEMENTREFCODE " ; 
    whereStr =  whereStr + " AND ENELEMENTDATA.ETYPE not in ( " + ENElementType.SQL_NO_SELECTED_ELEMENT_TYPE_FOR_ACCESS + " ) ";
    
    
	
    // selectStr = selectStr + " ${s} ENACCESS2ENELEMENT.CODE IN ( SELECT ENACCESS2ENELEMENT.CODE FROM ENACCESS2ENELEMENT ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACCESS2ENELEMENT.CODE = ?";
       }
       if(aFilterObject.isAccess != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACCESS2ENELEMENT.ISACCESS = ?";
       }
       if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENACCESS2ENELEMENT.ELEMENTREFCODE = ? ";
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

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = 0;
     if(aFilterObject != null){
        if(aFilterObject.code != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.code);
        }
        if(aFilterObject.isAccess != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.isAccess);
        }
      if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.elementRef.code);
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

       anObject = new ENAccess2EnelementShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.isAccess = set.getInt(2);
       if ( set.wasNull() )
           anObject.isAccess = Integer.MIN_VALUE;

       anObject.elementRefCode = set.getInt(3);
		if(set.wasNull())
		   anObject.elementRefCode = Integer.MIN_VALUE;
	   anObject.name = 	set.getString(4);
	   anObject.buhName = set.getString(5);
	   anObject.invNumber = set.getString(6);
	   anObject.renName = set.getString(7);
	   

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




} // end of ENAccess2EnelementDAO

