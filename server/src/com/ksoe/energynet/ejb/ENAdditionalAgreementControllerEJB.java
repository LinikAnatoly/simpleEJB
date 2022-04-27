
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAdditionalAgreementDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;

/**
 * EJB Controller for ENAdditionalAgreement;
 *
 */

import com.ksoe.energynet.ejb.generated.ENAdditionalAgreementControllerEJBGen;
import com.ksoe.energynet.logic.ServicesCalculatorLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAdditionalAgreement;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENAdditionalAgreementControllerEJB extends
		ENAdditionalAgreementControllerEJBGen {

	public ENAdditionalAgreementControllerEJB() {
	}
	
	private void checkDate(ENAdditionalAgreement object) throws DatasourceConnectException, PersistenceException {
		
		if(object == null || object.dateGen == null
				|| object.servicesobjectRef == null || object.servicesobjectRef.code == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException("�� ����� ����'����� ���������!");
		}
		
		ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getUserProfile(),
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ENAdditionalAgreementDAO dao = new ENAdditionalAgreementDAO(getUserProfile(),
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		
		ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(object.servicesobjectRef.code);
		
		Date dateToCheck = (servicesObject.contractDateServices == null) ? servicesObject.contractDate : servicesObject.contractDateServices;
		
		if(dateToCheck.compareTo(object.dateGen) == 1) {
			throw new SystemException(String.format("���� �������� (%s) ����� �� ���� ��������� ����� (%s)"
					, Tools.dateFormatDefault.format(dateToCheck)
					, Tools.dateFormatDefault.format(object.dateGen)));
		}
		
		// �������� ��� ���� ��������������� ���������� �� �������� ����� ������ ��� ���� ����������� � �����������
		// ���. ���������� ��� ����� �������� (���� ����� ����)
		long count = dao.count(object.servicesobjectRef, object.dateGen, true);
		if(count > 0) {
			throw new SystemException(String.format(" � �������� ���. ����� ��������� � ���� %s ��� ����� ��������!"
					, Tools.dateFormatDefault.format(object.dateGen)));
		}
		
	}
	
	public int add(ENAdditionalAgreement object) {
		try {
			ENAdditionalAgreementDAO dao = new ENAdditionalAgreementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ServicesCalculatorLogic servicesCalculatorLogic = new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)
					, getUserProfile());
			
			ENServicesObject servicesObject = servicesObjectDao.getObject(object.servicesobjectRef.code);
			
			if(servicesObject.contractStatusRef.code != ENServicesContractStatus.SIGNED) {
				throw new SystemException(String.format("������ � %s �� %s �� ���������!"
						, servicesObject.contractNumberServices
						, Tools.dateFormatDefault.format(servicesObject.contractDateServices)));
			}
			
			if(object.isSigned != null && object.isSigned) {
				throw new SystemException("������� � ������!");
			}
			
			this.checkDate(object);
			
			long existedNotSigned = dao.count(object.servicesobjectRef, null, false);
			
			if(existedNotSigned > 0) {
				throw new SystemException("��� ����� �������� ��� � ������� ��������� �����!\n"
						+ "��������� �������� ���� ���� �� �� ���� ��������!");
			}
			
			if(object.calcSumsByCalculations != null && object.calcSumsByCalculations) {
				object.sumWithoutVAT = BigDecimal.ZERO;
				object.sumVAT = BigDecimal.ZERO;
			}
			
			object.code = dao.add(object);
			
			if(object.calcSumsByCalculations != null && object.calcSumsByCalculations) {
				servicesCalculatorLogic.evaluateSumsByENServicesCost(servicesObject);
			}
			
			return object.code;
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}
	
	public void save(ENAdditionalAgreement object) {
		try {
			ENAdditionalAgreementDAO dao = new ENAdditionalAgreementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ServicesCalculatorLogic servicesCalculatorLogic = new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)
					, getUserProfile());
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENAdditionalAgreement oldObject = dao.getObject(object.code);
			
			boolean objectIsSigned = object.isSigned != null && object.isSigned;
			boolean oldObjectIsSigned = oldObject.isSigned != null && oldObject.isSigned;
			
			if(objectIsSigned != oldObjectIsSigned) {
				throw new SystemException("������ ���. ����� ��������� �������� ����� ��������� \"ϳ��������\\³���� ���������\"!");
			}
			
			if(objectIsSigned) {
				throw new SystemException(String.format("��������� ����� � %s �� %s ��������!\n"
						+ "��� ���� ��������� ������� ���������!"
							, object.numberGen
							, Tools.dateFormatDefault.format(object.dateGen)));
			}
			
			this.checkDate(object);
			
			dao.save(object);
			
			if(object.calcSumsByCalculations != null && object.calcSumsByCalculations) {
				ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(object.servicesobjectRef.code);
				servicesCalculatorLogic.evaluateSumsByENServicesCost(servicesObject);
			}
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}
	
	public void remove(int code) {
		try {
			ENAdditionalAgreementDAO dao = new ENAdditionalAgreementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENAdditionalAgreement object = dao.getObject(code);
			
			boolean objectIsSigned = object.isSigned != null && object.isSigned;
			
			if(objectIsSigned) {
				throw new SystemException(String.format("��������� ����� � %s �� %s ��������!\n"
					+ "��� ��������� ��������� ������� ���������!"
						, object.numberGen
						, Tools.dateFormatDefault.format(object.dateGen)));
			}
			
			dao.remove(object.code);
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}
	
	/**
	 * 
	 * ��������� ���������� � ������ ���������� ��������������� ����������
	 * 
	 * @param object ������ ��������������� ����������
	 * @param isSign {@code true} - ����������, {@code false} - ������
	 */
	public void signOrUnsign(ENAdditionalAgreement object, boolean isSign) {
		try {
			if(object == null || object.code == Integer.MIN_VALUE) {
				throw new java.lang.NullPointerException("���� ��'���� ���. �����");
			}
			
			ENAdditionalAgreementDAO dao = new ENAdditionalAgreementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENAdditionalAgreement oldObject = dao.getObject(object.code);
			
			boolean objectIsSigned = oldObject.isSigned != null && oldObject.isSigned;
			
			if(isSign) {
				if(objectIsSigned) {
					throw new SystemException(String.format("��������� ����� � %s �� %s ��� ��������!"
							, oldObject.numberGen, Tools.dateFormatDefault.format(oldObject.dateGen)));
				}
			} else {
				if(!objectIsSigned) {
					throw new SystemException(String.format("��������� ����� � %s �� %s �� ��������!"
							, oldObject.numberGen, Tools.dateFormatDefault.format(oldObject.dateGen)));
				}
				
				// ��������, ��� �� ���� ���������� �������������� ���������� ��� ������ ���������� ��������.
				if(dao.countFutureAgreements(object) > 0) {
					throw new SystemException("��� � ������� �������� �����! ��� ����� ��������� ������� ��������� �����\n"
							+ " �������� ��������� �������� �������!");
				}
			}
			
			oldObject.isSigned = isSign;
			
			dao.save(oldObject);
			
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}

		
		
	}

} // end of EJB Controller for ENAdditionalAgreement