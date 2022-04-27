
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.FINAccountTypeDAO;

/**
 * EJB Controller for FINAccountType;
 *
 */

import com.ksoe.energynet.ejb.generated.FINAccountTypeControllerEJBGen;
import com.ksoe.energynet.valueobject.FINAccountType;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class FINAccountTypeControllerEJB extends
		FINAccountTypeControllerEJBGen {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	public FINAccountTypeControllerEJB() {
	}
	
	/**
	 * 
	 * �������� ������� ��� ����� {@link FINAccountType}
	 * 
	 * @param object ��� ����� {@link FINAccountType}
	 */
	private void checkObjecct(FINAccountType object) {
		if(object == null || object.name == null) {
			throw new java.lang.NullPointerException();
		}
		object.name = object.name.trim();
	}
	
	/**
	 * 
	 * �������� ���� ����� {@link FINAccountType} ��� ���������� � �� 
	 * 
	 * @param object ��� ����� {@link FINAccountType}
	 */
	private void checkFINAccountType(FINAccountType object) {
		try {
			FINAccountTypeDAO dao = new FINAccountTypeDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			FINAccountType otherObject = dao.getAccountTypeByName(object.name);
			if(otherObject != null && otherObject.code != object.code) {
				throw new SystemException(String.format("� �������� ��� � ��� ������� �� ������������� \"%s\" (��� - %d)"
						, otherObject.name, otherObject.code));
			}
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			
		}
	}
	
	public int add(FINAccountType object) {
		this.checkObjecct(object);
		this.checkFINAccountType(object);
		return super.add(object);
	}
	
	public void save(FINAccountType object) {
		this.checkObjecct(object);
		this.checkFINAccountType(object);
		super.save(object);
	}

} // end of EJB Controller for FINAccountType