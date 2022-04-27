
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENStandardConstEntry;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENStandardConstEntryDAO;
import com.ksoe.energynet.ejb.generated.ENStandardConstEntryControllerEJBGen;
//import com.ksoe.energynet.valueobject.ENStandardConstEntry;
//import com.ksoe.energynet.valueobject.ENStandardConstEntry;
//import com.ksoe.energynet.valueobject.lists.ENStandardConstEntryShortList;
//import com.ksoe.energynet.valueobject.filter.ENStandardConstEntryFilter;
import com.ksoe.energynet.valueobject.ENStandardConstEntry;
import com.ksoe.energynet.valueobject.filter.ENStandardConstEntryFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.Tools;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENStandardConstEntryControllerEJB extends ENStandardConstEntryControllerEJBGen
 {

  public ENStandardConstEntryControllerEJB() {}
  
  /*ENStandardConstEntry. Добавить*/
  public int add(ENStandardConstEntry object)
   {
    try
     {

      ENStandardConstEntryDAO objectDAO = new ENStandardConstEntryDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      
      // дата окончания действия не может быть меньше даты старта действия 
      if (object.startDate.after(object.endDate)){
    	  throw new EnergyproSystemException(" Дата кінця дії величини не може бути менше дати початку дії величини!!! ");
      }
      
      ENStandardConstEntryFilter objectFilter = new ENStandardConstEntryFilter();
      // если дата старта действия величины меньше даты конца действия уже имеющейся величины 
      objectFilter.constRef.code = object.constRef.code;
      objectFilter.conditionSQL = " enddate >=  " + Tools.convertDateToSQLString(object.startDate)  ;
      int[] constEntryArr = objectDAO.getFilteredCodeArray(objectFilter, 0, -1);
      if (constEntryArr.length > 0 ){
    	  throw new EnergyproSystemException(" В цьому періоді діє інша величина !!! "); 
      }
      
      
      return objectDAO.add(object);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENStandardConstEntry%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }
  
  /*ENStandardConstEntry. Изменить*/
  public void save(ENStandardConstEntry object)
   {
    try
     {
    	ENStandardConstEntryDAO objectDAO = new ENStandardConstEntryDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
    	 // дата окончания действия не может быть меньше даты старта действия 
        if (object.startDate.after(object.endDate)){
      	  throw new EnergyproSystemException(" Дата кінця дії величини не може бути менше дати початку дії величини!!! ");
        }
        
        ENStandardConstEntry constEntryObj_old = objectDAO.getObject(object.code);
        
        if (constEntryObj_old.startDate.equals(object.startDate) &&  constEntryObj_old.endDate.equals(object.endDate) ) { 
        	objectDAO.save(object);	
        } else 
        {
        	throw new EnergyproSystemException(" Змінювати можна тільки значення коефіцієнту  !!! ");
        }
       
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENStandardConstEntry%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }


} // end of EJB Controller for ENStandardConstEntry