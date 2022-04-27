
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTechAgreement2ServicesObjectDAOGen;
import com.ksoe.energynet.logic.ContractLogic;
import com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENTechAgreement2ServicesObject;
 *
 */

public class ENTechAgreement2ServicesObjectDAO extends ENTechAgreement2ServicesObjectDAOGen {

    public ENTechAgreement2ServicesObjectDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTechAgreement2ServicesObjectDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


	@Override
	public int add(ENTechAgreement2ServicesObject agreement) throws PersistenceException {

	    /** добавление и проверка договора на наличие в АХ и ФК */
	    //// DEBUG !!!!!
	    if ( 1 == 1 ) {
		    if (agreement.finDocCode != null && !agreement.finDocCode.equals("")) {

		    	if (agreement.contractNumber != null && !agreement.contractNumber.equals("")) {

		    		boolean isCustomer = false;
		    		boolean isException = true;
		        	ContractLogic contractLogic = new ContractLogic(getConnection(), getUserProfile());
		        	agreement.generalContractRef.code = contractLogic
								.addByContractNumber(agreement.contractNumber, agreement.partnerCode, agreement.finDocCode, isCustomer, isException);

		        }
		    }
	    }

		return super.add(agreement);
	}


	@Override
	public void save(ENTechAgreement2ServicesObject agreement) throws PersistenceException {

	    /** добавление и проверка договора на наличие в АХ и ФК */
	    //// DEBUG !!!!!
	    if ( 1 == 1 ) {
		    if (agreement.finDocCode != null && !agreement.finDocCode.equals("")) {

		    	if (agreement.contractNumber != null && !agreement.contractNumber.equals("")) {

		    		boolean isCustomer = false;
		    		boolean isException = true;
		        	ContractLogic contractLogic = new ContractLogic(getConnection(), getUserProfile());
		        	agreement.generalContractRef.code = contractLogic
								.addByContractNumber(agreement.contractNumber, agreement.partnerCode, agreement.finDocCode, isCustomer, isException);

		        }
		    }
	    }

		super.save(agreement);
	}

} // end of ENTechAgreement2ServicesObjectDAO
