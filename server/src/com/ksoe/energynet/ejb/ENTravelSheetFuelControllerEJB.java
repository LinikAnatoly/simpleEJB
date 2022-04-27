
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Month;

/**
  * EJB Controller for ENTravelSheetFuel;  
  * 	
  */



import java.util.Calendar;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuelDAO;
import com.ksoe.energynet.ejb.generated.ENTravelSheetFuelControllerEJBGen;
import com.ksoe.energynet.logic.TravelSheetFuelLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetFuel;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENTravelSheetFuelControllerEJB extends ENTravelSheetFuelControllerEJBGen {
	private static final long serialVersionUID = 1L;

	/*ENTravelSheetFuel. ��������*/
	  public int add(ENTravelSheetFuel object) {
	    try {
	      
	      ENTravelSheetFuelDAO objectDAO = new ENTravelSheetFuelDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      
	      if (object.countGen.equals(BigDecimal.ZERO)) {
	    	  throw new SystemException("������ ��������� ������� ���������� �������!");
	      }
	      
	      int objCode = objectDAO.add(object);
	      
	      TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
	      fuelLogic.updateRemainderCountIn(object.travelSheetRef.code, object.fuelType.code, object.travelSheetFuelTypeRef.code, object.checkIsThirdParty());     
	      
	      ///// NET-4414 �������������� ������
	      // 15.11.14 ������� ��� ������� ���������
	      object.code = objCode;
	      if(!object.checkIsThirdParty()) fuelLogic.createRQFKOrderForTravelSheetFuel(object);
	      
	      return objCode;
	      
	    }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTravelSheetFuel%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }

	  /*ENTravelSheetFuel. �������*/
	  public void remove(int code) {
	    try {
		      ENTravelSheetFuelDAO objectDAO = new ENTravelSheetFuelDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		      ENTravelSheetFuel object = objectDAO.getObject(code);
	    	
	    	  ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	          ENTravelSheet ts = tsDAO.getObject(object.travelSheetRef.code);
	          
	          /// �������� ������� � �������������� ������ �� 26.11.2014
	          /// ��-�� ������ � �������������� � ���
	          
	          Date d261114 = Tools.localDateToDate(LocalDate.of(2014, Month.NOVEMBER.getValue(), 26));
	          
	          //Date d261114 = new Date(114, 10, 26);
	          
	          Calendar calendar = Calendar.getInstance();
	          calendar.setTime(ts.dateStart);

	          Date startDate = calendar.getTime();
	          
	          if (startDate.before(d261114)) {
	          	throw new SystemException("������ ������� ������ �� 26.11.2014 �.!");
	          }
	    	

	      TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
	      
	      ///// NET-4414 ������� �������������� ������
	      if(!object.checkIsThirdParty()) fuelLogic.removeRQFKOrderForTravelSheetFuel(object);
	      /////	      
	      
	      objectDAO.remove(code);
	      
	      fuelLogic.updateRemainderCountIn(object.travelSheetRef.code, object.fuelType.code, object.travelSheetFuelTypeRef.code, object.checkIsThirdParty());	      
	      
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTravelSheetFuel%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }   

	   
	  /*ENTravelSheetFuel. ��������*/
	  public void save(ENTravelSheetFuel object)
	   {
		    try
		     { 
		    	
	    	  ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	          ENTravelSheet ts = tsDAO.getObject(object.travelSheetRef.code);
	          
	          /// �������� ������� � �������������� ������ �� 26.11.2014
	          /// ��-�� ������ � �������������� � ���
	          
	          Date d261114 = Tools.localDateToDate(LocalDate.of(2014, Month.NOVEMBER.getValue(), 26));
	          
	          Calendar calendar = Calendar.getInstance();
	          calendar.setTime(ts.dateStart);

	          Date startDate = calendar.getTime();
	          
	          if (startDate.before(d261114))
	          {
	          	throw new SystemException("������ ������� ������ �� 26.11.2014 �.!");
	          }
		      
		      // ������ ��������� ����� �������
		      this.remove(object.code);
		     
		      object.code = Integer.MIN_VALUE;
		      // ������� ������ � ����� �����������
		      this.add(object);
		     
		     } 	    
		      catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTravelSheetFuel%} object.",e);}
		      catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
		      finally                              {closeConnection();}
		   }
	  
	  public void reloadFuel(int travelsheetfuelcode)
	   {
	    try
	     {
	      ENTravelSheetFuelDAO objectDAO = new ENTravelSheetFuelDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	      // ������� ��������� ����� �������
	      ENTravelSheetFuel fuel = objectDAO.getObject(travelsheetfuelcode);
	      fuel.code = Integer.MIN_VALUE;
	      
	      // ������ ��������� ����� �������
	      //objectDAO.remove(travelsheetfuelcode);
	      
	      this.remove(travelsheetfuelcode);
	      
	      TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
	      fuelLogic.updateRemainderCountIn(fuel.travelSheetRef.code, fuel.fuelType.code, fuel.travelSheetFuelTypeRef.code, fuel.checkIsThirdParty());	      
	    
	      // ������� ������ � ��� �� �����������
	      objectDAO.add(fuel);
	      fuelLogic.updateRemainderCountIn(fuel.travelSheetRef.code, fuel.fuelType.code, fuel.travelSheetFuelTypeRef.code, fuel.checkIsThirdParty());
	      if(!fuel.checkIsThirdParty()) fuelLogic.createRQFKOrderForTravelSheetFuel(fuel);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't reloadFuel {%com.ksoe.energynet.valueobject.ENTravelSheetFuel%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }
	  
  public ENTravelSheetFuelControllerEJB() {}


} // end of EJB Controller for ENTravelSheetFuel