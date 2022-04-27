
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENTravelSheetFuelRemains;  
  * 	
  */



import java.math.BigDecimal;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENTransportRealFuelRemainsDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuelRemainsDAO;
import com.ksoe.energynet.ejb.generated.ENTravelSheetFuelRemainsControllerEJBGen;
import com.ksoe.energynet.logic.TravelSheetFuelLogic;
import com.ksoe.energynet.valueobject.ENTransportRealFuelRemains;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetFuel;
import com.ksoe.energynet.valueobject.ENTravelSheetFuelRemains;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelRemainsFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENTravelSheetFuelRemainsControllerEJB extends ENTravelSheetFuelRemainsControllerEJBGen
 {

	  /*ENTravelSheetFuelRemains. Добавить*/
	  public int add(ENTravelSheetFuelRemains object)
	   {
	    try
	     {
	      ENTravelSheetFuelRemainsDAO objectDAO = new ENTravelSheetFuelRemainsDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      
	      ENTravelSheetFuelRemainsFilter rFilter = new ENTravelSheetFuelRemainsFilter();
	      rFilter.realTransport.code = object.realTransport.code;
	      rFilter.fuelTypeRef.code = object.fuelTypeRef.code;
	      rFilter.travelSheetFuelTypeRef.code = object.travelSheetFuelTypeRef.code;
	      int[] rArr = objectDAO.getFilteredCodeArray(rFilter,0,1);
	      if (rArr.length != 0){
	    	  throw new EnergyproSystemException("Залишки вже введено ...");
	      }
	      
	      TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
	      
	      ENTravelSheet ts = tsDAO.getObject(object.travelSheetRef.code);
	      
	      object.dateGen = ts.dateStart;
	      object.countGenIn = object.sumGenIn = object.priceGenIn = object.countGenOut = object.sumGenOut = object.priceGenOut = new BigDecimal(0);
	      object.countGenFinal = object.countGenStart;
	      object.sumGenFinal = object.sumGenStart;
	      object.priceGenFinal = object.priceGenStart;
	      // вдруг добавили Получение ПММ до остатка ...
	      ENTravelSheetFuel fuel = fuelLogic.getFuelInTravelSheet(ts.code, object.fuelTypeRef.code, object.travelSheetFuelTypeRef.code
	    		  , object.checkIsThirdParty());
	      if ( fuel.countGen.doubleValue() != 0 ){
	    	  object.sumGenIn = fuel.countGen;
	    	  object.sumGenFinal = object.countGenStart.add(object.sumGenIn);
	      }
	      
	      // + типа ЭТО самый первый ОСТАТОК - накинем общий остаток на реалТРАНСПРТ
	      ENTransportRealFuelRemainsDAO rrDAO = new ENTransportRealFuelRemainsDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      ENTransportRealFuelRemains rr = new ENTransportRealFuelRemains();
	      rr.realTransport.code = object.realTransport.code;
	      rr.fuelTypeRef.code = object.fuelTypeRef.code;
	      rr.travelSheetFuelTypeRef.code = object.travelSheetFuelTypeRef.code;
	      
	      rr.countGenStart = rr.countGenFinal = object.countGenStart;
	      rr.sumGenStart = rr.sumGenFinal = object.sumGenStart;
	      rr.priceGenStart = rr.priceGenFinal = object.priceGenStart;
	      
	      rr.countGenIn = rr.countGenOut = rr.priceGenIn = rr.priceGenOut = rr.sumGenIn = rr.sumGenOut = new BigDecimal(0);
	      
	      if ( fuel.countGen.doubleValue() != 0 ){
	    	  rr.countGenIn = fuel.countGen;
	    	  rr.countGenFinal = rr.countGenStart.add(rr.countGenIn);
	      }
	      
	      
	      rr.dateStart = fuelLogic.getFirstDate(object.dateGen);	        	      
	      rr.dateFinal = fuelLogic.getLastDate(object.dateGen);
	       
	      rrDAO.add(rr);
	      
	      return objectDAO.add(object);
	      
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTravelSheetFuelRemains%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }
	  

	  public void remove(int code)
	   {
	    try
	     {
	      ENTravelSheetFuelRemainsDAO objectDAO = new ENTravelSheetFuelRemainsDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      
	      ENTravelSheetFuelRemains object = objectDAO.getObject(code);
	      
	      
	      if (object.countGenIn.doubleValue() != 0){
	    	 throw new EnergyproSystemException("Вже є видача ПММ ... "); 
	      }
	      
	      if (object.countGenOut.doubleValue() != 0){
		    	 throw new EnergyproSystemException("Вже є списання ПММ ... "); 
		      }
	      
	      ENTravelSheetFuelRemainsFilter rFilter = new ENTravelSheetFuelRemainsFilter();
	      rFilter.realTransport.code = object.realTransport.code;
	      rFilter.fuelTypeRef.code = object.fuelTypeRef.code;
	      rFilter.travelSheetFuelTypeRef.code = object.travelSheetFuelTypeRef.code;
	      rFilter.conditionSQL = "code <> " + code;
	      int[] rArr = objectDAO.getFilteredCodeArray(rFilter,0,1);
	      if (rArr.length > 0){
	    	  throw new EnergyproSystemException("Це не останній подорожній лист ...");
	      }
	      
	      
	      objectDAO.remove(code);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTravelSheetFuelRemains%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }  
	  
	  
  public ENTravelSheetFuelRemainsControllerEJB() {}


} // end of EJB Controller for ENTravelSheetFuelRemains