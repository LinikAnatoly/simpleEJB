
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for SCUsageInputItemOZInfo;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZInfoDAO;
import com.ksoe.energynet.ejb.generated.SCUsageInputItemOZInfoControllerEJBGen;
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZInfo;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class SCUsageInputItemOZInfoControllerEJB extends SCUsageInputItemOZInfoControllerEJBGen
 {

  public SCUsageInputItemOZInfoControllerEJB() {}

  public int add(SCUsageInputItemOZInfo object)
  {
   try
    {
     SCUsageInputItemOZInfoDAO objectDAO = new SCUsageInputItemOZInfoDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
     
     SCCounterDAO dao = new SCCounterDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
     
     SCCounterFilter f = new SCCounterFilter();
     f.conditionSQL = "code in (select o2c.sccounterrefcode from scusageinputtmz2sccntr o2c where o2c.ozrefcode = "+ object.usageInputItemOZRef.code+")";
     int[] arr = dao.getFilteredCodeArray(f, 0, -1);
     for (int i=0; i < arr.length; i++){
    	 SCCounter c = dao.getObject(arr[i]);
    	 c.account = object.account;
    	 c.cost = object.sumGen;
    	 dao.save(c);
     }
     
     
     return objectDAO.add(object);
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.SCUsageInputItemOZInfo%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
  }  
  
  /*SCUsageInputItemOZInfo. Удалить*/
  public void remove(int code)
   {
    try
     {
    	SCUsageInputItemOZInfoDAO objectDAO = new SCUsageInputItemOZInfoDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
    	
    	SCUsageInputItemOZInfo object = objectDAO.getObject(code);
    		
        SCCounterDAO dao = new SCCounterDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        
        SCCounterFilter f = new SCCounterFilter();
        f.conditionSQL = "code in (select o2c.sccounterrefcode from scusageinputtmz2sccntr o2c where o2c.ozrefcode = "+ object.usageInputItemOZRef.code+")";
        int[] arr = dao.getFilteredCodeArray(f, 0, -1);
        for (int i=0; i < arr.length; i++){
       	 SCCounter c = dao.getObject(arr[i]);
       	 c.account = null;
       	 c.cost = null;
       	 dao.save(c);
        }
        
        
      
      objectDAO.remove(code);
      
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.SCUsageInputItemOZInfo%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }   

   
  /*SCUsageInputItemOZInfo. Изменить*/
  public void save(SCUsageInputItemOZInfo object)
   {
    try
     {

      SCUsageInputItemOZInfoDAO objectDAO = new SCUsageInputItemOZInfoDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      objectDAO.save(object);
      
      SCCounterDAO dao = new SCCounterDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      
      SCCounterFilter f = new SCCounterFilter();
      f.conditionSQL = "code in (select o2c.sccounterrefcode from scusageinputtmz2sccntr o2c where o2c.ozrefcode = "+ object.usageInputItemOZRef.code+")";
      int[] arr = dao.getFilteredCodeArray(f, 0, -1);
      for (int i=0; i < arr.length; i++){
     	 SCCounter c = dao.getObject(arr[i]);
    	 c.account = object.account;
    	 c.cost = object.sumGen;
     	 dao.save(c);
      }
      
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.SCUsageInputItemOZInfo%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }  

} // end of EJB Controller for SCUsageInputItemOZInfo