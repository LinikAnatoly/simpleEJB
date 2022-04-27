
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.SCUsageInputItemDAOGen;
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemFilter;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for SCUsageInputItem;
  *
  */

public class SCUsageInputItemDAO extends SCUsageInputItemDAOGen {


  public SCUsageInputItemDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public SCUsageInputItemDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}
  
  /**
   * 
   * Получить массив кодов строк {@link SCUsageInputItem} по объекту сущности SCUsageInput
   * 
   * @param usageInput объект сущности {@link SCUsageInput} коды строк которой нужно получить 
   * @return массив кодов {@code Integer}
   * @throws PersistenceException
   */
  public int[] getFilteredCodeArrayBySCUsageInput(SCUsageInput usageInput) throws PersistenceException {
  	SCUsageInputItemFilter uiiFilter = new SCUsageInputItemFilter();
  	uiiFilter.usageInputRef.code = usageInput.code;
  	return this.getFilteredCodeArray(uiiFilter, 0, -1);
  }


  public int _collectAutoIncrementNumber()
          throws PersistenceException {

      SequenceKey hashKey = new SequenceKey("SCUSAGEINPUTITEM", "NUMBERINT");
      Integer nextSeqValue = null;
      SequenceValue sequenceValue;
      synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
          if (sequenceValue == null) {
              sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEM", "NUMBERINT");
              _sequenceTable.put(hashKey, sequenceValue);
          }
          if (!sequenceValue.isNextValueAvailable()) {
              sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEM", "NUMBERINT");
              _sequenceTable.put(hashKey, sequenceValue);
          }
      }

      nextSeqValue = sequenceValue.getNextValue();
      if (nextSeqValue == null) {
          throw new PersistenceException(
                  "Can't obtain auto increment value from: SCUSAGEINPUTITEM");
      } else {

          return nextSeqValue.intValue();
      }
  }

} // end of SCUsageInputItemDAO

