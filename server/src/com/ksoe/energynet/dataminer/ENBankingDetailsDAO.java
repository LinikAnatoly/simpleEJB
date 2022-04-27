
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENBankingDetailsDAOGen;
import com.ksoe.energynet.valueobject.ENBankingDetails;
import com.ksoe.energynet.valueobject.filter.ENBankingDetailsFilter;

  /**
  *  DAO Object for ENBankingDetails;  
  * 	
  */

public class ENBankingDetailsDAO extends ENBankingDetailsDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENBankingDetailsDAO() {super();}
  //public ENBankingDetailsDAO(Connection aConnection) {super(aConnection);}
  //public ENBankingDetailsDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENBankingDetailsDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENBankingDetailsDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  /**
   * 
   * Получить банковскую информацию по коду подразделения
   * 
   * @param departmentCode код подразделения
   * @param throwExceptionWhenNotFound нужно ли генерировать исключение если не найдена запись
   * @return объект {@link ENBankingDetails} для заданного подразделения или {@code null} если запись не была найдена
   * @throws PersistenceException
   */
  public ENBankingDetails getBankingDetailsByPodr(int departmentCode, boolean throwExceptionWhenNotFound) throws PersistenceException {
	  if(departmentCode == Integer.MIN_VALUE) {
		  throw new java.lang.NullPointerException("Не заданий підрозділ");
	  }
	  ENBankingDetailsFilter filter = new ENBankingDetailsFilter();
	  filter.departmentRef.code = departmentCode;
	  int[] codes = this.getFilteredCodeArray(filter, 0, -1);
	  if(codes.length == 0) {
		  if(throwExceptionWhenNotFound) {
			  throw new SystemException(String.format("Для підрозділу з кодом %d не знайдено банківської інформації"
					  , departmentCode));
		  }
		  return null;
	  } else {
		  return this.getObject(codes[0]);
	  }
  }



} // end of ENBankingDetailsDAO

