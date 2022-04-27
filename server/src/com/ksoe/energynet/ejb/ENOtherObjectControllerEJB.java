
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENOtherObject;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENOtherObjectDAO;
import com.ksoe.energynet.ejb.generated.ENOtherObjectControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENOtherObject;
import com.ksoe.energynet.valueobject.ENOtherObjectType;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENOtherObjectControllerEJB extends ENOtherObjectControllerEJBGen
 {

  public ENOtherObjectControllerEJB() {}

  
  public int add(ENOtherObject object)
  {
   try
    {
     object.setDomain_info(null);

     ENElement e = new ENElement();
     
     if ( object.typeRef.code == ENOtherObjectType.METROLOGY_SUBSTATION ){
    	 e.typeRef.code = ENElementType.METROLOGY_SUBSTATION;
     }
     else
     if ( object.typeRef.code == ENOtherObjectType.EB ){
    	 e.typeRef.code = ENElementType.EB_OBJECTS;	 
     }
     else
     if ( object.typeRef.code == ENOtherObjectType.EQUIPMENT ){
    	 e.typeRef.code = ENElementType.EQUIPMENT_OBJECTS;	 
     }
     else
     if ( object.typeRef.code == ENOtherObjectType.EQUIPMENT_REPAIR ){
       	 e.typeRef.code = ENElementType.EQUIPMENT_REPAIR_OBJECTS;	 
     }
     else
     {
    	 throw new EnergyproSystemException("Неопределенный тип обьекта ...");
     }
    
	  AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	  if ( ! l.checkEditableObject( e.typeRef.code ,"ENPlanWorkController"))
	  {
		  throw new EnergyproSystemException("У Вас нет доступа к обьектам " + object.name);
	  }
     
     //e.renRef.code = 0 ;
     
     // по идее может кидать таку фигню в ХОЕ ???
     if ( object.element.renRef.code == Integer.MIN_VALUE){
   	  //throw new EnergyproSystemException("Element not bound to EPRen.");
       e.renRef.code = 0 ; 
     }
     else
     {
    	 e.renRef.code = object.element.renRef.code;
     }
     
     ENElementDAO eDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
     
     if (object.element.geoDepartmentRef != null) {
   	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
   		  e.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
   	  }
   	  
     }
     
     object.element.code =  eDAO.add(e);

     
     ENOtherObjectDAO objectDAO = new ENOtherObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
     return objectDAO.add(object);
     
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENOtherObject%} object.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
  }
  

  /*ENOtherObject. Удалить*/
  public void remove(int code)
   {
    try
     {
      ENOtherObjectDAO objectDAO = new ENOtherObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      
      ENOtherObject object = objectDAO.getObject(code);
      
      
	  AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	  if ( ! l.checkEditableObject( object.element.typeRef.code ,"ENPlanWorkController"))
	  {
		  throw new EnergyproSystemException("У Вас нет доступа к обьектам " + object.name);
	  }
	  
      objectDAO.remove(code);

      
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENOtherObject%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }   

   
  /*ENOtherObject. Изменить*/
  public void save(ENOtherObject object)
   {
    try
     {
      object.setDomain_info(null);

	      ENOtherObjectDAO objectDAO = new ENOtherObjectDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      
	      ENOtherObject oldObj = objectDAO.getObject(object.code);
	      
	      ENElement el = new ENElement();
	      ENElementDAO elDAO = new ENElementDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	      el = elDAO.getObject(object.element.code);

	      if (object.element.renRef != null ){
		    	 if ( object.element.renRef.code != Integer.MIN_VALUE ){
		    		 el.renRef.code = object.element.renRef.code;
		      }
	      }
	      
		      
		      if ( el.renRef.code == Integer.MIN_VALUE){
		    	  //throw new EnergyproSystemException("Element not bound to EPRen.");
		    	  el.renRef.code = 0;
		      }
		      
		      if (object.element.geoDepartmentRef != null) {
		    	  if (object.element.geoDepartmentRef.code != Integer.MIN_VALUE ) {
		    		  el.geoDepartmentRef.code = object.element.geoDepartmentRef.code;
		    	  }
		    	  
		      }
		      
		      elDAO.save(el);
	      
	      
		  AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  if ( ! l.checkEditableObject( oldObj.element.typeRef.code ,"ENPlanWorkController"))
		  {
			  throw new EnergyproSystemException("У Вас нет доступа к обьектам " + object.name);
		  }
		  
		  
		  
	      objectDAO.save(object);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENOtherObject%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

  
} // end of EJB Controller for ENOtherObject