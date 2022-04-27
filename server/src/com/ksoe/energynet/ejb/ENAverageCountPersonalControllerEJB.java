
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENAverageCountPersonal;  
  * 	
  */



import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAverageCountPersonalDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.ejb.generated.ENAverageCountPersonalControllerEJBGen;
import com.ksoe.energynet.logic.mDaxLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAverageCountPersonal;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.filter.ENAverageCountPersonalFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.ENAverageCountPersonalShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENAverageCountPersonalControllerEJB extends ENAverageCountPersonalControllerEJBGen
 {

  public ENAverageCountPersonalControllerEJB() {}
  
  /*ENAverageCountPersonal. –асчет данных */
  public int calculateAverageCountPersonal(ENAverageCountPersonal object)
   {
	  Connection fkConnection = null;
	  
    try
     {
    	Date data = new Date();
    	Calendar calendar_cur = Calendar.getInstance();
    	//calendar_cur.setTime(data);
    	int day_cur = calendar_cur.get(Calendar.DATE);
    	int month_cur = calendar_cur.get(Calendar.MONTH) + 1;
        int year_cur = calendar_cur.get(Calendar.YEAR);
    	
    	 Calendar calendar_ = Calendar.getInstance();
	     calendar_.setTime(object.calculateDate);
	     calendar_.set(calendar_.DAY_OF_MONTH , 1);
	     int day_ = 1;
	     int month_ = calendar_.get(Calendar.MONTH) + 1;
	     int year_ = calendar_.get(Calendar.YEAR);
	        
//	     calendar_.set(calendar_.MONTH ,object.calculateDate.getMonth() + 1);
//	     calendar_.set(calendar_.YEAR ,object.calculateDate.getYear());	     
//	     calendar_.set(calendar_.DAY_OF_MONTH, calendar_.getActualMinimum(Calendar.DAY_OF_MONTH));
	     Date dateFirstDay = calendar_.getTime();
     // ENAverageCountPersonalDAO objectDAO = new ENAverageCountPersonalDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
     // return objectDAO.add(object);
	    
	    //  year_ = calendar_.get(calendar_.YEAR);
	    //  month_ = calendar_.get(Calendar.MONTH);
	     
	    // int year_cur = calendar_.get(Calendar.YEAR);
	    // int month_cur = calendar_.get(Calendar.MONTH);
	     
	     int temp = (year_ * 12 + month_ ) - (year_cur * 12 + month_cur);
	    if ( 
	    	(year_ * 12 + month_ ) - (year_cur * 12 + month_cur) < -1  
	    	||	
	    	(year_ * 12 + month_ ) - (year_cur * 12 + month_cur) > 0
	       )
	    {
	    	// throw new EnergyproSystemException("–озраховувати дозволено т≥льки попередн≥й або поточний  м≥с€ць!!!");
	    } 
    	
    	// выберем весь персонал который задействован в утвержденных нар€дах за указанный мес€ц.год	
		FINWorkerDAO fwDAO = new FINWorkerDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ENAverageCountPersonalDAO objectDAO = new ENAverageCountPersonalDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));	
	    
		// удалим данные по мес€цу за который расчитываем 
		ENAverageCountPersonalFilter averFilter = new ENAverageCountPersonalFilter();
		averFilter.calculateDate = dateFirstDay;
		int[] averArraycode = objectDAO.getFilteredCodeArray(averFilter, 0, -1);
		if (averArraycode.length > 0){
			for (int h = 0; h < averArraycode.length; h++) {
				objectDAO.remove(averArraycode[h]);
			}
		}
		
		
		FINWorkerFilter fwFilter = new FINWorkerFilter();
					 fwFilter.conditionSQL = " FINWORKER.CODE in ( " +
					" select fw.code from finworker fw   , enhumenitem h , enplanwork p " +
					" where fw.code = h.finworkercode " +
					" and h.planrefcode = p.code " +
					" and p.kindcode = " + ENPlanWorkKind.FACT + 
					" and p.statuscode = " + ENPlanWorkStatus.LOCKED + 
					//" and p.departmentrefcode = 14 " + /* for test */
					" and p.datestart BETWEEN first_day(to_date('" +  new SimpleDateFormat("dd.MM.yyyy").format(new java.sql.Date(object.calculateDate.getTime())) + "','dd.mm.yyyy')) and last_day(to_date('" + new SimpleDateFormat("dd.MM.yyyy").format(new java.sql.Date(object.calculateDate.getTime())) + "','dd.mm.yyyy')) " + 
					/*водители*/
					" union all " + 
					" select fw.code from finworker fw   , entransportitem ti , enplanwork p " +
					" where fw.code = ti.finworkercode " +
					" and ti.planrefcode = p.code " +
					" and p.kindcode = " + ENPlanWorkKind.FACT +
					" and p.statuscode = " + ENPlanWorkStatus.LOCKED +
					//" and p.departmentrefcode = 14 " + /* for test */ 
					" and p.datestart BETWEEN first_day(to_date('" +  new SimpleDateFormat("dd.MM.yyyy").format(new java.sql.Date(object.calculateDate.getTime())) + "','dd.mm.yyyy')) and last_day(to_date('" + new SimpleDateFormat("dd.MM.yyyy").format(new java.sql.Date(object.calculateDate.getTime())) + "','dd.mm.yyyy')) " +
				") ";    
		FINWorkerShortList fwList =	fwDAO.getListTabNumberFromFinworker(fwFilter, fwFilter.conditionSQL, "", 0, -1, null);
		
		String tabnCodesStr = "";
		String tabnCodesStr1 = "";
		String tabnCodesStr2 = "";
		String tabnCodesStr3 = "";
		//fkConnection = getNEWConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
    	//KadryLogic kLogic = new KadryLogic(fkConnection, getUserProfile());
    	
		for (int i=0; i<fwList.totalCount; i++){
			if(i<=500) {
			  if (tabnCodesStr.length() > 0){
				  tabnCodesStr = tabnCodesStr + ";" + fwList.get(i).tabNumber;
			    }
			  else 
			  tabnCodesStr = "" + fwList.get(i).tabNumber;  
			}
			if(i>500 && i<=1000) {
				  if (tabnCodesStr1.length() > 0){
					  tabnCodesStr1 = tabnCodesStr1 + ";" + fwList.get(i).tabNumber;
				    }
				  else 
				  tabnCodesStr1 = "" + fwList.get(i).tabNumber;  
				}
			if(i>1000 && i<=1500) {
				  if (tabnCodesStr2.length() > 0){
					  tabnCodesStr2 = tabnCodesStr2 + ";" + fwList.get(i).tabNumber;
				    }
				  else 
				  tabnCodesStr2 = "" + fwList.get(i).tabNumber;  
				}
			if(i>1500 && i<=2000) {
				  if (tabnCodesStr3.length() > 0){
					  tabnCodesStr3 = tabnCodesStr3 + ";" + fwList.get(i).tabNumber;
				    }
				  else 
				  tabnCodesStr3 = "" + fwList.get(i).tabNumber;  
				}
		  }
		// сформировали строку с табельными теперь выполн€ем хитрый запрос в кадрах который выбирает записи сгрупированые по подразделени€м и виду работников 
			
		//StringBuffer stBuf = null;
		//stBuf.append( tabnCodesStr);
		
		//System.out.print("buf  =  " + stBuf);
		
		//ENAverageCountPersonalShortList averList = kLogic.calculateAverageCountPersonal(tabnCodesStr , new SimpleDateFormat("dd.MM.yyyy").format(new java.sql.Date(object.calculateDate.getTime())));
		mDaxLogic mdLogic = new mDaxLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile() );
		
		for (int k = 0; k <= 3; k++) {
			String sss = "";
			if(k==0 && tabnCodesStr.length()>0 ) {
				sss = tabnCodesStr;
			} else
			if(k==1 && tabnCodesStr1.length()>0 ) {
				sss = tabnCodesStr1;
				}
			else
			if(k==2 && tabnCodesStr2.length()>0 ) {
				sss = tabnCodesStr2;
				}
			else
			if(k==3 && tabnCodesStr3.length()>0 ) {
				sss = tabnCodesStr3;
				}
			
			ENAverageCountPersonalShortList averList = mdLogic.getAverageCountFromMDAX(sss, 
					new SimpleDateFormat("dd.MM.yyyy").format(new java.sql.Date(dateFirstDay.getTime())),
					new SimpleDateFormat("dd.MM.yyyy").format(Tools.getLastDayOfMonth(dateFirstDay) ));
			
			for (int j=0; j<averList.totalCount; j++){
				ENAverageCountPersonal obj = new ENAverageCountPersonal();
				//System.out.print(" ");
				obj.code = Integer.MIN_VALUE;
				obj.codeCeh = averList.get(j).codeCeh;
				obj.nameCeh = averList.get(j).nameCeh;
				obj.codePodr = averList.get(j).codePodr;
				obj.namePodr = averList.get(j).namePodr;
				obj.calculateDate = dateFirstDay;
				obj.countGen = averList.get(j).countGen;
				obj.personalVidId = averList.get(j).personalVidId;
				obj.personalVidName = averList.get(j).personalVidName;
				obj.dateEdit = new Date();
				obj.userGen =  getUserProfile().userName;
				objectDAO.add(obj); 	
			}
		}
		
    	
    	
      return 1;
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENAverageCountPersonal%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }
  
	protected java.sql.Connection getNEWConnection(String dataSourceName) throws DatasourceConnectException
	{
		java.sql.Connection	_connection = null;
		try {

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource) initialContext
					.lookup(dataSourceName);
			_connection = dataSource.getConnection();

			return _connection;
		} catch (NamingException e) {
			//System.out.print("error");
			throw new DatasourceConnectException(dataSourceName, e);
		} catch (SQLException e) {
			//System.out.print("error");
			throw new DatasourceConnectException(dataSourceName, e);
		}
	}
	
	  // перечень расчитаных периодов по средней численности персонала
	  public ENAverageCountPersonalShortList getListCalculatedPeriod()
	   {
	    try
	     {
	      ENAverageCountPersonalDAO objectDAO = new ENAverageCountPersonalDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.getListCalculatedPeriod();
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get list of {%com.ksoe.energynet.valueobject.ENAverageCountPersonal%} objects.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }


} // end of EJB Controller for ENAverageCountPersonal